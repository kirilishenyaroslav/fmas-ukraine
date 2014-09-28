unit UchetWremenyUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, IBCustomDataSet, IBQuery, Mask, CheckEditUnit, StdCtrls,
    Buttons, DepartmentsViewUnit, PersonalCommon, Spin, DateUtils, uCommonDB,
    frxClass, SpComboBox, Registry, FieldControl, EditControl, SpCommon,
    WorkModeCentral;

const
    HoursSQL = 'SELECT * FROM TABLE_SUM_HOURS_PERIOD(:Id_Department, :Period_Beg, :Period_End)';
    VihodHoursSQL = 'SELECT * FROM TABLE_VIHOD_HOURS_PERIOD(:Id_Department, :Period_Beg, :Period_End)';
    YearNormSQL = 'SELECT SUM(Kol_Hours) AS Norm FROM Dt_WorkTimeNorm WHERE WtYear = :Year  AND WtMonth <= :Month';
    MonthNormSQL = 'SELECT SUM(Kol_Hours) AS Norm FROM Dt_WorkTimeNorm WHERE WtYear = :Year AND WtMonth = :Month';
    AllHoursSQL = 'SELECT * FROM TABLE_SUM_HOURS_PERIOD_ALL(:Id_Department, :Period_Beg, :Period_End)';
    AllVihodHoursSQL = 'SELECT * FROM TABLE_VIHOD_HOURS_PERIOD_ALL(:Id_Department, :Period_Beg, :Period_End)';

type
    TUchetWremenyForm = class(TForm)
        Label1: TLabel;
        DepartmentEdit: TEdit;
        DepartmentButton: TBitBtn;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        YearCaptionLabel: TLabel;
        YearEdit: TSpinEdit;
        MonthCaptionLabel: TLabel;
        MonthBox: TComboBox;
        OnlyOverall: TCheckBox;
        VihodBox1: TSpComboBox;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        VihodBox2: TSpComboBox;
        Label5: TLabel;
        VihodBox3: TSpComboBox;
        Label6: TLabel;
        VihodBox4: TSpComboBox;
        Label7: TLabel;
        VihodBox5: TSpComboBox;
        Label8: TLabel;
        VihodBox6: TSpComboBox;
        Label9: TLabel;
        VihodBox7: TSpComboBox;
        FC_Vihod1: TFieldControl;
        FC_Vihod2: TFieldControl;
        FC_Vihod3: TFieldControl;
        FC_Vihod4: TFieldControl;
        FC_Vihod5: TFieldControl;
        FC_Vihod6: TFieldControl;
        FC_Vihod7: TFieldControl;
        FC_Department: TFieldControl;
        MainDataset: TfrxUserDataSet;
        TotalsDataset: TfrxUserDataSet;
    AccReport: TfrxReport;
        procedure DepartmentButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);

        procedure PrepareDates;
        procedure PrepareReport;

        procedure LoadState;
        procedure SaveState;

        procedure FindCorr;
        procedure FindCorrTotal;
        function VihodHours(MainDS, VihodDS: TDataSet; Id_Vihod: Integer): Variant;

        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure MainDatasetCheckEOF(Sender: TObject; var Eof: Boolean);
        procedure MainDatasetFirst(Sender: TObject);
        procedure MainDatasetNext(Sender: TObject);
        procedure MainDatasetPrior(Sender: TObject);
        procedure MainDatasetGetValue(const VarName: string;
            var Value: Variant);
        procedure TotalsDatasetCheckEOF(Sender: TObject; var Eof: Boolean);
        procedure TotalsDatasetFirst(Sender: TObject);
        procedure TotalsDatasetNext(Sender: TObject);
        procedure TotalsDatasetPrior(Sender: TObject);
        procedure TotalsDatasetGetValue(const VarName: string;
            var Value: Variant);

    private
        Month_Beg: Variant;
        Month_End: Variant;
        Year_Beg: Variant;
        Year_End: Variant;

        Vihods: array[1..7] of Integer;

        MonthDataset: TDataSet;
        YearDataset: TDataSet;
        VihodMonthDataset: TDataSet;
        VihodYearDataset: TDataSet;
        AllMonthDataset: TDataSet;
        AllYearDataset: TDataSet;
        AllVihodMonthDataset: TDataSet;
        AllVihodYearDataset: TDataSet;

        FoundCorr: Boolean;
        FoundCorrTotal: Boolean;

        CheckControl: TEditControl;
    public
    { Public declarations }
    end;

var
    UchetWremenyForm: TUchetWremenyForm;
    Id_Department: Integer;

implementation

{$R *.dfm}

procedure TUchetWremenyForm.DepartmentButtonClick(Sender: TObject);
var
    form: TDepartmentsViewForm;
begin
    form := TDepartmentsViewForm.Create(Self);
    form.Prepare(True, Date);
    form.CanSelectRoot := True;
    if form.ShowModal = mrOk then
        with form do
        begin
            Id_Department := Selected_Id;
            if Id_Department = -1 then
                DepartmentEdit.Text := Consts_Query['Firm_Name']
            else DepartmentEdit.Text := ResultQuery['Name_Full'];
        end;
    form.Free;
end;



procedure TUchetWremenyForm.PrepareDates;
var
    y, m: Integer;
begin
    y := YearEdit.Value;
    m := MonthBox.ItemIndex + 1;

    Month_Beg := EncodeDate(y, m, 1);
    Month_End := EncodeDate(y, m, DaysInAMonth(y, m));

    Year_Beg := EncodeDate(y, 1, 1);
    Year_End := EncodeDate(y, 12, 31);
end;

procedure TUchetWremenyForm.PrepareReport;
var
    i: Integer;
begin
    AccReport.LoadFromFile(ProgramPath + 'Reports\ASUP\TableAcc.fr3');

    Curr_DB['Year'] := YearEdit.Value;
    Curr_DB['Month'] := MonthBox.ItemIndex + 1;
    Curr_DB.ExecWithResult(MonthNormSQL, 'Year, Month');
    AccReport.Variables['Month_Norm'] := Curr_DB['Norm'];
    Curr_DB.ExecWithResult(YearNormSQL, 'Year, Month');
    AccReport.Variables['Year_Norm'] := Curr_DB['Norm'];

    AccReport.Variables['Org'] := QuotedStr(UpperCase(Consts_Query['Firm_Name']));
    AccReport.Variables['Department'] := QuotedStr(DepartmentEdit.Text);
    AccReport.Variables['Rep_Year'] := YearEdit.Text;
    AccReport.Variables['Rep_Month'] := QuotedStr(Copy(MonthBox.Text, 6, Length(MonthBox.Text)));
    AccReport.Variables['MonthN'] := MonthBox.ItemIndex + 1;

    for i := 1 to 7 do
        AccReport.Variables['VihodName' + IntToStr(i)] :=
            QuotedStr(AllVihods[Vihods[i]].Name_Short);

    if sDesignReport then AccReport.DesignReport
    else AccReport.ShowReport;
end;


procedure TUchetWremenyForm.OkButtonClick(Sender: TObject);
var
    nag: Boolean;
begin
    CheckControl.Read;
    if not CheckControl.CheckFill then
    begin
        ModalResult := 0;
        Exit;
    end;

    Vihods[1] := VihodBox1.GetId;
    Vihods[2] := VihodBox2.GetId;
    Vihods[3] := VihodBox3.GetId;
    Vihods[4] := VihodBox4.GetId;
    Vihods[5] := VihodBox5.GetId;
    Vihods[6] := VihodBox6.GetId;
    Vihods[7] := VihodBox7.GetId;

    PrepareDates;
    try
        nag := Curr_DB.ShowNagScreen;
        Curr_DB.ShowNagScreen := True;

        Curr_DB['Id_Department'] := Id_Department;
        Curr_DB.Params['Period_Beg'] := Month_Beg;
        Curr_DB.Params['Period_End'] := Month_End;

        if not OnlyOverall.Checked then
        begin
            MonthDataset := Curr_DB.QueryData(HoursSQL, 'Id_Department, Period_Beg, Period_End');
            VihodMonthDataset := Curr_DB.QueryData(VihodHoursSQL, 'Id_Department, Period_Beg, Period_End');
        end;
        AllMonthDataset := Curr_DB.QueryData(AllHoursSQL, 'Id_Department, Period_Beg, Period_End');
        AllVihodMonthDataset := Curr_DB.QueryData(AllVihodHoursSQL, 'Id_Department, Period_Beg, Period_End');

        Curr_DB.Params['Period_Beg'] := Year_Beg;
        if not OnlyOverall.Checked then
        begin
            YearDataset := Curr_DB.QueryData(HoursSQL, 'Id_Department, Period_Beg, Period_End');
            VihodYearDataset := Curr_DB.QueryData(VihodHoursSQL, 'Id_Department, Period_Beg, Period_End');
        end;
        AllYearDataset := Curr_DB.QueryData(AllHoursSQL, 'Id_Department, Period_Beg, Period_End');
        AllVihodYearDataset := Curr_DB.QueryData(AllVihodHoursSQL, 'Id_Department, Period_Beg, Period_End');

        Curr_DB.ShowNagScreen := nag;

        PrepareReport;
    finally
        Curr_DB.RemoveDataset(MonthDataset);
        Curr_DB.RemoveDataset(YearDataset);
        Curr_DB.RemoveDataset(VihodMonthDataset);
        Curr_DB.RemoveDataset(VihodYearDataset);
    end;
end;


procedure TUchetWremenyForm.LoadState;
var
    reg: TRegistry;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;

        reg.OpenKey('\Software\ASUP\UchetWremeny\', False);

        Id_Department := reg.ReadInteger('Id_Department');
        DepartmentEdit.Text := reg.ReadString('Name_Department');
        YearEdit.Value := reg.ReadInteger('Year');
        MonthBox.ItemIndex := reg.ReadInteger('Month') - 1;
        OnlyOverall.Checked := reg.ReadBool('OnlyOverall');

        VihodBox1.Prepare(reg.ReadInteger('Vihod1'));
        VihodBox2.Prepare(reg.ReadInteger('Vihod2'));
        VihodBox3.Prepare(reg.ReadInteger('Vihod3'));
        VihodBox4.Prepare(reg.ReadInteger('Vihod4'));
        VihodBox5.Prepare(reg.ReadInteger('Vihod5'));
        VihodBox6.Prepare(reg.ReadInteger('Vihod6'));
        VihodBox7.Prepare(reg.ReadInteger('Vihod7'));

        reg.CloseKey;
        reg.Free;

    except
        begin
            VihodBox1.Prepare(11);
            VihodBox2.Prepare(12);
            VihodBox3.Prepare(14);
            VihodBox4.Prepare(16);
            VihodBox5.Prepare(28);
            VihodBox6.Prepare(17);
            VihodBox7.Prepare(13);
        end;
    end;
end;

procedure TUchetWremenyForm.SaveState;
var
    reg: TRegistry;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;

        if reg.OpenKey('\Software\ASUP\UchetWremeny\', True) then
        begin
            reg.WriteInteger('Id_Department', Id_Department);
            reg.WriteString('Name_Department', DepartmentEdit.Text);
            reg.WriteInteger('Year', YearEdit.Value);
            reg.WriteInteger('Month', MonthBox.ItemIndex + 1);
            reg.WriteBool('OnlyOverall', OnlyOverall.Checked);

            reg.WriteInteger('Vihod1', VihodBox1.GetId);
            reg.WriteInteger('Vihod2', VihodBox2.GetId);
            reg.WriteInteger('Vihod3', VihodBox3.GetId);
            reg.WriteInteger('Vihod4', VihodBox4.GetId);
            reg.WriteInteger('Vihod5', VihodBox5.GetId);
            reg.WriteInteger('Vihod6', VihodBox6.GetId);
            reg.WriteInteger('Vihod7', VihodBox7.GetId);

            reg.CloseKey;
        end;

        reg.Free
    except
    end;
end;

procedure TUchetWremenyForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    SaveState;
    CheckControl.Free;
end;

procedure TUchetWremenyForm.FormCreate(Sender: TObject);
begin
    CheckControl := TEditControl.Create;
    CheckControl.Add([FC_Department, FC_Vihod1, FC_VIhod2, FC_Vihod3, FC_Vihod4,
        FC_Vihod5, FC_Vihod6, FC_Vihod7]);

    CheckControl.Prepare(emNew);

    LoadState;
end;

procedure TUchetWremenyForm.MainDatasetCheckEOF(Sender: TObject;
    var Eof: Boolean);
begin
    if OnlyOverall.Checked then Eof := True
    else
    begin
        Eof := YearDataset.Eof;
        FindCorr;
    end;
end;

procedure TUchetWremenyForm.FindCorr;
begin
    FoundCorr := MonthDataset.Locate('Id_PCard; Out_Id_Department',
        VarArrayOf([YearDataset['Id_PCard'], YearDataset['Out_Id_Department']]), []);
end;

procedure TUchetWremenyForm.MainDatasetFirst(Sender: TObject);
begin
    if OnlyOverall.Checked then Exit;

    YearDataset.First;
    FindCorr;
end;

procedure TUchetWremenyForm.MainDatasetNext(Sender: TObject);
begin
    YearDataset.Next;
    FindCorr;
end;

procedure TUchetWremenyForm.MainDatasetPrior(Sender: TObject);
begin
    YearDataset.Prior;
    FindCorr;
end;

procedure TUchetWremenyForm.MainDatasetGetValue(const VarName: string;
    var Value: Variant);
var
    res: Integer;
    field: TField;
    rest: string;
begin
    if OnlyOverall.Checked then Exit;

    if VarName = 'NN' then
    begin
        Value := YearDataset.RecNo;
        Exit;
    end;

    res := ParseVar('VM', VarName);
    if res > 0 then
    begin
        if FoundCorr then
            Value := VihodHours(MonthDataSet, VihodMonthDataset, Vihods[res])
        else Value := 0;
        Exit;
    end;

    res := ParseVar('V', VarName);
    if res > 0 then
    begin
        Value := VihodHours(YearDataSet, VihodYearDataset, Vihods[res]);
        Exit;
    end;

    rest := StrRest('M_', VarName);

    if rest <> '' then
        if FoundCorr then
        begin
            field := MonthDataset.FindField(rest);
            if field <> nil then Value := field.Value;
        end
        else Value := Null
    else
    begin
        field := YearDataset.FindField(VarName);
        if field <> nil then Value := field.Value;
    end;
end;

function TUchetWremenyForm.VihodHours(MainDS, VihodDS: TDataSet; Id_Vihod: Integer): Variant;
begin
    Result := 0;

    if VihodDs.FindField('Out_Id_Department') <> nil then
    begin
        if VihodDs.Locate('Id_PCard;Out_Id_Department;Id_Vihod',
            VarArrayOf([MainDS['Id_PCard'],MainDS['Out_Id_Department'], id_vihod]), [])
        then Result := VihodDs['Hours'];
    end
    else
    begin
        if VihodDs.Locate('Id_PCard;Id_Vihod',
            VarArrayOf([MainDS['Id_PCard'], id_vihod]), [])
        then Result := VihodDs['Hours']
    end;

    if VarIsNull(Result) then Result := 0;
end;


procedure TUchetWremenyForm.TotalsDatasetCheckEOF(Sender: TObject;
    var Eof: Boolean);
begin
    Eof := AllYearDataset.Eof;

    FindCorrTotal;
end;

procedure TUchetWremenyForm.TotalsDatasetFirst(Sender: TObject);
begin
    AllYearDataset.First;
    FindCorrTotal;
end;

procedure TUchetWremenyForm.TotalsDatasetNext(Sender: TObject);
begin
    AllYearDataset.Next;
    FindCorrTotal;
end;

procedure TUchetWremenyForm.TotalsDatasetPrior(Sender: TObject);
begin
    AllYearDataset.Prior;
    FindCorrTotal;
end;

procedure TUchetWremenyForm.FindCorrTotal;
begin
    FoundCorrTotal :=
        AllMonthDataset.Locate('Id_PCard', AllYearDataset['Id_PCard'], []);
end;


procedure TUchetWremenyForm.TotalsDatasetGetValue(const VarName: string;
    var Value: Variant);
var
    res: Integer;
    field: TField;
    rest: string;
begin
    if VarName = 'NN' then
    begin
        case AllYearDataset.RecNo of
            1: Value := 'ÐÀÇÎÌ';
            2: Value := 'ÐÀÇÎÌ ðîá³òíèêè';
            3: Value := 'ÐÀÇÎÌ ñëóæáîâö³';
            4: Value := 'ÐÀÇÎÌ æ³íêè';
            5: Value := 'ÐÀÇÎÌ ÷îëîâ³êè';
            6: Value := 'ÐÀÇÎÌ çà âñ³ìà çì³íàìè êð³ì 8-ãîäèííèõ';
            7: Value := 'ÐÀÇÎÌ çà âñ³ìà 8-ãîäèííèìè çì³íàìè';
        end;
        Exit;
    end;

    res := ParseVar('VM', VarName);
    if res > 0 then
    begin
        if FoundCorrTotal then
            Value := VihodHours(AllMonthDataSet, AllVihodMonthDataset, Vihods[res])
        else Value := 0;
        Exit;
    end;

    res := ParseVar('V', VarName);
    if res > 0 then
    begin
        if FoundCorrTotal then
            Value := VihodHours(AllYearDataSet, AllVihodYearDataset, Vihods[res])
        else Value := 0;
        Exit;
    end;

    rest := StrRest('M_', VarName);

    if rest <> '' then
        if FoundCorrTotal then
        begin
            field := AllMonthDataset.FindField(rest);
            if field <> nil then Value := field.Value;
        end
        else Value := Null
    else
    begin
        field := AllYearDataset.FindField(VarName);
        if field <> nil then Value := field.Value;
    end
end;

end.
