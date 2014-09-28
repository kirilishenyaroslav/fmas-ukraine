unit uTableChangesPrint;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, uTableSelectFrame, FR_Class, FR_DSet,
    FR_DBSet, PersonalCommon, ComCtrls, uCommonDB, DB, Registry,
    uTableGroup;

type
    TfrmTableChangesPrint = class(TForm)
        SelectFrame: TfrmTableSelect;
        OkButton: TBitBtn;
        ExportButton: TBitBtn;
        CancelButton: TBitBtn;
        TableReport: TfrReport;
        Label1: TLabel;
        DateBegPicker: TDateTimePicker;
        Label2: TLabel;
        DateEndPicker: TDateTimePicker;
        MainDataset: TfrDBDataSet;
        TableDataset: TfrUserDataset;
        MainSource: TDataSource;
        AllBox: TCheckBox;
        Label3: TLabel;
        TypeBox: TComboBox;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure OkButtonClick(Sender: TObject);
        procedure ExportButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure TableReportGetValue(const ParName: string;
            var ParValue: Variant);
        procedure TableDatasetCheckEOF(Sender: TObject; var Eof: Boolean);
        procedure TableDatasetFirst(Sender: TObject);
        procedure TableDatasetNext(Sender: TObject);
        procedure TableDatasetPrior(Sender: TObject);
        procedure MainSourceDataChange(Sender: TObject; Field: TField);
        procedure SelectFrameMonthBoxChange(Sender: TObject);
        procedure AllBoxClick(Sender: TObject);
        procedure SelectFrameAcceptButtonClick(Sender: TObject);
    private
        DB: TDBCenter;
        ChangesDataset: TDataSet;
        TableGroup: TTableGroup;
        CurrentDay: Integer;
        CurrentTable: Integer;
        PrevTable: Integer;
        Loaded: Boolean;

        procedure PrepareReport;
    public
        procedure LoadState;
    end;

var
    frmTableChangesPrint: TfrmTableChangesPrint;

resourcestring
    TableChangesSQL = 'SELECT * FROM Table_Get_Changes(:Id_Table_Group, :Date_Beg, :Date_End)';
    AllTableChangesSQL = 'SELECT * FROM Table_Get_All_Changes(:Date_Beg, :Date_End)';

implementation

uses DateUtils, uMovingTable, uExportReport;

{$R *.dfm}

procedure TfrmTableChangesPrint.PrepareReport;
var
    p: Integer;
    ShowNag: Boolean;
begin
    Loaded := False;
    with SelectFrame do
    begin
        if not AllBox.Checked then
        begin
            AcceptButton.Click;

            if not SelectFrame.Loaded then Exit;

            DB['Id_Table_Group'] := Id_Table_Group;
        end;

        DB['Date_Beg'] := DateBegPicker.DateTime;
        DB['Date_End'] := DateEndPicker.DateTime;

        DB.RemoveDataset(ChangesDataset);

        ShowNag := DB.ShowNagScreen;
        DB.ShowNagScreen := True;
        if not AllBox.Checked then
            ChangesDataset := DB.QueryData(TableChangesSQL, 'Id_Table_Group, Date_Beg, Date_End')
        else
            ChangesDataset := DB.QueryData(AllTableChangesSQL, 'Date_Beg, Date_End');
        DB.ShowNagScreen := ShowNag;

        if ChangesDataSet.IsEmpty then
        begin
            MessageDlg('Коректувань не знайдено!', mtInformation, [mbOk], 0);
            Exit;
        end;

        if not AllBox.Checked then
            TableGroup := TTableGroup.Create(ChangesDataset, Date_Beg, Date_End)
        else TableGroup := TTableGroup.Create(ChangesDataset);

        TableGroup.AddPreviosVersions;
        TableGroup.Get;

        MainSource.DataSet := ChangesDataset;
    end;

    if TypeBox.ItemIndex = 0 then
        TableReport.LoadFromFile(ProgramPath + 'Reports\ASUP\TableChanges.frf')
    else
        TableReport.LoadFromFile(ProgramPath + 'Reports\ASUP\TableChangesSimple.frf');

    frVariables['Org'] := UpperCase(Consts_Query['Firm_Name']);

    with SelectFrame do
    begin
        if AllBox.Checked then frVariables['Department'] := 'За усіма підрозділами'
        else
            if OptionPageControl.ActivePage = DepartmentsPage then
                frVariables['Department'] := DepartmentEdit.Text
            else
                if OptionPageControl.ActivePage = GroupPage then
                    frVariables['Department'] := GroupEdit.Text
                else
                    if OptionPageControl.ActivePage = OneManPage then
                        frVariables['Department'] := FIOEdit.Text;

        p := Pos(' - ', MonthBox.Text);
        if p <> 0 then
            frVariables['Rep_Month'] := Copy(MonthBox.Text, p + 3, Length(MonthBox.Text))
        else frVariables['Rep_Month'] := MonthBox.Text;
        frVariables['Rep_Year'] := YearEdit.Value;
    end;

    frVariables['Changes_Beg'] := DateOf(DateBegPicker.Date);
    frVariables['Changes_End'] := DateOf(DateEndPicker.Date);

    Loaded := True;
end;

procedure TfrmTableChangesPrint.LoadState;
var
    reg: TRegistry;
begin
    with SelectFrame do
    begin
        LoadState;

        reg := TRegistry.Create;
        try
            reg.RootKey := HKEY_CURRENT_USER;

            if reg.OpenKey('\Software\ASUP\Table\', False) then
            begin
                try
                    DateBegPicker.DateTime := reg.ReadDateTime('Date_Beg');
                    DateEndPicker.DateTime := reg.ReadDateTime('Date_End');
                except
                    DateBegPicker.DateTime := StartOfTheMonth(Date);
                    DateEndPicker.DateTime := EndOfTheMonth(Date);
                end;
            end;

            reg.CloseKey;
        finally
            reg.Free;
        end;
    end;
end;

procedure TfrmTableChangesPrint.FormClose(Sender: TObject; var Action: TCloseAction);
var
    reg: TRegistry;
begin
    SelectFrame.SaveState;

    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;

        if reg.OpenKey('\Software\ASUP\Table\', False) then
        begin
            try
                reg.WriteDateTime('Date_Beg', DateBegPicker.DateTime);
                reg.WriteDateTime('Date_End', DateEndPicker.DateTime);
            except
            end;
        end;

        reg.CloseKey;
    finally
        reg.Free;
    end;

    DB.RemoveDataset(ChangesDataset);
    TableGroup.Free;
end;

procedure TfrmTableChangesPrint.OkButtonClick(Sender: TObject);
begin
    PrepareReport;
    if Loaded then
        if sDesignReport then TableReport.DesignReport
        else TableReport.ShowReport;
end;

procedure TfrmTableChangesPrint.ExportButtonClick(Sender: TObject);
begin
    PrepareReport;
    if Loaded then ExportReportTo(TableReport);
end;

procedure TfrmTableChangesPrint.FormCreate(Sender: TObject);
begin
    DB := IBX_DB;
end;

procedure TfrmTableChangesPrint.TableReportGetValue(const ParName: string;
    var ParValue: Variant);
var
    field: TField;
    new_param: string;
    old_val, new_val: Variant;
begin
    field := ChangesDataset.FindField(ParName);

    if field <> nil then
        ParValue := field.Value
    else
        if ParName = 'The_Month' then
            if AllBox.Checked then
                ParValue := FormatDateTime('[m місяць yyyy року] ',
                    TableGroup[CurrentTable].Span.Date_Beg)
            else ParValue := ''
        else
            if ParName = 'Nomer' then ParValue := ChangesDataset.RecNo
            else
                if ParName = 'All' then ParValue := AllBox.Checked
                else
                    if Pos('Old_', ParName) = 1 then
                    begin
                        if PrevTable <> -1 then
                        begin
                            new_param := Copy(ParName, 5, Length(ParName) - 4);
                            ParValue := TableGroup.GetParam(new_param, PrevTable, CurrentDay);
                        end
                        else
                            ParValue := '';
                    end
                    else
                        if Pos('Diff_', ParName) = 1 then
                        begin
                            new_param := Copy(ParName, 6, Length(ParName) - 5);
                            new_val := TableGroup.GetParam(new_param, CurrentTable, CurrentDay);
                            if PrevTable = -1 then ParValue := new_val
                            else
                            begin
                                old_val := TableGroup.GetParam(new_param, PrevTable, CurrentDay);
                                ParValue := new_val - old_val;
                            end;
                        end
                        else
                            if UpperCase(ParName) = 'VIHODNSTRING' then
                                ParValue := TableGroup[0].GetVihodnString
                            else
                                if UpperCase(ParName) = 'PRAZNSTRING' then
                                    ParValue := TableGroup[0].GetPraznString
                                else

                                    ParValue := TableGroup.GetParam(ParName, CurrentTable, CurrentDay);
end;

procedure TfrmTableChangesPrint.TableDatasetCheckEOF(Sender: TObject;
    var Eof: Boolean);
begin
    if AllBox.Checked then Eof := CurrentDay > 31
    else Eof := CurrentDay > DaysInAMonth(SelectFrame.Year, SelectFrame.Month)
end;

procedure TfrmTableChangesPrint.TableDatasetFirst(Sender: TObject);
begin
    CurrentDay := 1;
end;

procedure TfrmTableChangesPrint.TableDatasetNext(Sender: TObject);
begin
    inc(CurrentDay);
end;

procedure TfrmTableChangesPrint.TableDatasetPrior(Sender: TObject);
begin
    dec(CurrentDay);
end;

procedure TfrmTableChangesPrint.MainSourceDataChange(Sender: TObject;
    Field: TField);
var
    y, m: Word;
begin
    if AllBox.Checked then
    begin
        y := ChangesDataset['Table_Year'];
        m := ChangesDataset['Table_Month'];
    end
    else
    begin
        y := SelectFrame.YearEdit.Value;
        m := SelectFrame.MonthBox.ItemIndex + 1;
    end;

    CurrentDay := 1;
    CurrentTable := TableGroup.FindByVers(ChangesDataset['Id_Man_Moving'],
        y, m, ChangesDataset['Version_Num']);
    PrevTable := TableGroup.FindByVers(ChangesDataset['Id_Man_Moving'],
        y, m, ChangesDataset['Version_Num'] - 1);
end;

procedure TfrmTableChangesPrint.SelectFrameMonthBoxChange(Sender: TObject);
begin
{    SelectFrame.MonthBoxChange(Sender);
    DateBegPicker.DateTime := StartOfTheMonth(EncodeDate(
        SelectFrame.YearEdit.Value, SelectFrame.MonthBox.ItemIndex+1, 1));
    DateEndPicker.DateTime := EndOfTheMonth(DateBegPicker.DateTime);}
end;

procedure TfrmTableChangesPrint.AllBoxClick(Sender: TObject);
begin
    SelectFrame.Enabled := not AllBox.Checked;
end;

procedure TfrmTableChangesPrint.SelectFrameAcceptButtonClick(
    Sender: TObject);
begin
    SelectFrame.AcceptButtonClick(Sender);

end;

end.
