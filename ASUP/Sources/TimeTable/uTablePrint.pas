unit uTablePrint;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, uTableSelectFrame, FR_Desgn, FR_Class,
    PersonalCommon, TableCentral, FR_DSet, FR_DBSet, uVihodsReg, uTableGroup,
    frxClass, frxDesgn, DB, IBCustomDataSet, IBQuery, frxDBSet;

type
    TfmTablePrint = class(TForm)
        OkButton: TBitBtn;
        ExportButton: TBitBtn;
        CancelButton: TBitBtn;
        SelectFrame: TfrmTableSelect;
        TableReport: TfrReport;
        frDesigner1: TfrDesigner;
        frPeopleDataSet: TfrUserDataset;
        TableDataSet: TfrUserDataset;
        Label1: TLabel;
        PrintTypeBox: TComboBox;
        TableReport3: TfrxReport;
        PeopleDataset3: TfrxUserDataSet;
        frxDesigner1: TfrxDesigner;
        VihodDetailsDataSet: TfrxUserDataSet;
        MovingInfoQuery: TIBQuery;
        MovingInfoDataSet: TfrxDBDataset;
        procedure SelectFrameAcceptButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure OkButtonClick(Sender: TObject);
        procedure ExportButtonClick(Sender: TObject);
        procedure frPeopleDataSetFirst(Sender: TObject);
        procedure frPeopleDataSetNext(Sender: TObject);
        procedure frPeopleDataSetPrior(Sender: TObject);
        procedure frPeopleDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
        procedure TableDataSetFirst(Sender: TObject);
        procedure TableDataSetNext(Sender: TObject);
        procedure TableDataSetPrior(Sender: TObject);
        procedure TableDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
        procedure TableReportGetValue(const ParName: string;
            var ParValue: Variant);
        procedure FormCreate(Sender: TObject);
        procedure VihodDetailsDataSetGetValue(const VarName: string;
            var Value: Variant);
    private
        TableGroup: TTableGroup;

        CurrentTable: Integer;
        CurrentDay: Integer;

        Loaded: Boolean;
    public
        procedure PrepareReport;
    end;

var
    fmTablePrint: TfmTablePrint;

implementation

uses DateUtils, uVihodsDetails, uExportReport;

procedure TfmTablePrint.PrepareReport;
var
    p: Integer;
    Org, Chief, Department, Rep_Year, Rep_Month: string;
begin
    Loaded := False;
    with SelectFrame do
    begin
        AcceptButton.Click;
        if not Loaded then Exit;

        TableGroup := TTableGroup.Create(TableQuery, Date_Beg, Date_End);
        TableGroup.Get;
        if TableGroup.Count = 0 then
            if TableTypeBox.ItemIndex = 1 then
            begin
                MessageDlg('Табель не було підписано. Треба або підписати його, або друкувати табель "з усіма зміна"', mtError, [mbOk], 0);
                Exit;
            end
            else
            begin
                MessageDlg('Не знайдено працюючих людей (можливо, табеля не були занесени)!', mtError, [mbOk], 0);
                Exit;
            end;

        if TableGroup.NewCount > 0 then
        begin
            MessageDlg('Потрібно занести усі табеля!', mtError, [mbOk], 0);
            Exit;
        end;
        TableGroup.CalcOverall;
        TableGroup.CalcVihods;
    end;

    case PrintTypeBox.ItemIndex of
        0: TableReport.LoadFromFile(ProgramPath + 'Reports\ASUP\NTableReport2.frf');
        1: TableReport.LoadFromFile(ProgramPath + 'Reports\ASUP\TableReport_p12_3.frf');
        2: TableReport3.LoadFromFile(ProgramPath + 'Reports\ASUP\TableReport_p12_4.fr3');
        3: TableReport3.LoadFromFile(ProgramPath + 'Reports\ASUP\TableReport_p12_5.fr3');
    end;


    Org := UpperCase(Consts_Query['Firm_Name']);

        // заполучить утверждающего табель
    Curr_DB['Cur_Date'] := TDateTime(SelectFrame.Date_End);
    Curr_DB['Id_Shtat_Prop'] := 1512;
    Curr_DB.ExecWithResult(SignerSQL, 'Id_Shtat_Prop, Cur_Date');
    if not VarIsNull(Curr_DB['FIO_IniFirst']) then
        Chief := Curr_DB['FIO_IniFirst']
    else Chief := '';

    with SelectFrame do
    begin
        if OptionPageControl.ActivePage = DepartmentsPage then
            Department := DepartmentEdit.Text
        else
            if OptionPageControl.ActivePage = GroupPage then
                Department := GroupEdit.Text
            else
                if OptionPageControl.ActivePage = OneManPage then
                    Department := FIOEdit.Text;

        p := Pos(' - ', MonthBox.Text);
        if p <> 0 then
            Rep_Month := Copy(MonthBox.Text, p + 3, Length(MonthBox.Text))
        else Rep_Month := MonthBox.Text;

        Rep_Year := YearEdit.Text;
    end;

    if PrintTypeBox.ItemIndex in [0, 1] then
    begin
        frVariables['Org'] := Org;
        frVariables['Chief'] := Chief;
        frVariables['Department'] := Department;
        frVariables['Rep_Month'] := Rep_Month;
        frVariables['Rep_Year'] := Rep_Year;
    end
    else
    begin
        TableReport3.Variables['Org'] := QuotedStr(Org);
        TableReport3.Variables['Chief'] := QuotedStr(Chief);
        TableReport3.Variables['Department'] := QuotedStr(Department);
        TableReport3.Variables['Rep_Month'] := QuotedStr(Rep_Month);
        TableReport3.Variables['Rep_Year'] := QuotedStr(Rep_Year);
    end;

    if PrintTypeBox.ItemIndex = 3 then
    begin
        TableGroup.CalcVihodDetails;
        //TableReport3.DataSet := VihodDetailsDataSet;
    end;

    if PrintTypeBox.ItemIndex = 2 then
        MovingInfoQuery.Transaction := ReadTransaction;


    Loaded := True;
end;

{$R *.dfm}

procedure TfmTablePrint.SelectFrameAcceptButtonClick(Sender: TObject);
begin
    SelectFrame.AcceptButtonClick(Sender);
end;

procedure TfmTablePrint.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    TableGroup.Free;
    SelectFrame.SaveState;
end;

procedure TfmTablePrint.OkButtonClick(Sender: TObject);
begin
    PrepareReport;
    if Loaded then
        if PrintTypeBox.ItemIndex in [0, 1] then
            if sDesignReport then TableReport.DesignReport
            else TableReport.ShowReport
        else
            if sDesignReport then TableReport3.DesignReport
            else TableReport3.ShowReport;
end;

procedure TfmTablePrint.ExportButtonClick(Sender: TObject);
begin
    if not (PrintTypeBox.ItemIndex in [0, 1]) then
    begin
        MessageDlg('Поки що немає експорту для цих звітів!', mtError, [mbOk], 0);
        Exit;
    end;
    PrepareReport;
    if Loaded then ExportReportTo(TableReport);
end;

procedure TfmTablePrint.frPeopleDataSetFirst(Sender: TObject);
begin
    CurrentTable := 0;
    CurrentDay := 1;

    if PrintTypeBox.ItemIndex = 2 then
    begin
        MovingInfoQuery.Close;
        MovingInfoQuery.Params.ParamValues['Id_Man_Moving'] :=
            TableGroup[CurrentTable].Id_Man_Moving;
        MovingInfoQuery.Open;
    end;
end;

procedure TfmTablePrint.frPeopleDataSetNext(Sender: TObject);
begin
    inc(CurrentTable);
    CurrentDay := 1;

    if (PrintTypeBox.ItemIndex = 2) and (CurrentTable > 0)
        and (CurrentTable < TableGroup.Count) then
    begin
        MovingInfoQuery.Close;
        MovingInfoQuery.Params.ParamValues['Id_Man_Moving'] :=
            TableGroup[CurrentTable].Id_Man_Moving;
        MovingInfoQuery.Open;
    end;
end;

procedure TfmTablePrint.frPeopleDataSetPrior(Sender: TObject);
begin
    dec(CurrentTable);
    CurrentDay := 1;
end;

procedure TfmTablePrint.frPeopleDataSetCheckEOF(Sender: TObject;
    var Eof: Boolean);
begin
    Eof := CurrentTable >= TableGroup.Count;
end;

procedure TfmTablePrint.TableDataSetFirst(Sender: TObject);
begin
    CurrentDay := 1;
end;

procedure TfmTablePrint.TableDataSetNext(Sender: TObject);
begin
    inc(CurrentDay);
end;

procedure TfmTablePrint.TableDataSetPrior(Sender: TObject);
begin
    dec(CurrentDay);
end;

procedure TfmTablePrint.TableDataSetCheckEOF(Sender: TObject;
    var Eof: Boolean);
begin
    Eof := CurrentDay > DaysInAMonth(SelectFrame.Year, SelectFrame.Month);
end;

procedure TfmTablePrint.TableReportGetValue(const ParName: string;
    var ParValue: Variant);
begin
    if ParName = 'Sign_Info' then
        with SelectFrame do
            if not SignInfo.IsEmpty then
                ParValue := DateTimeToStr(SignInfo['Sign_Date']) + ' (' +
                    SignInfo['Signer_FIO'] + ')'
            else ParValue := 'Немає'
        else
            if ParName = 'Table_Version' then
                if SelectFrame.Load_Signed then
                    ParValue := 'Підписана версія табелю'
                else ParValue := 'Версія з усіма змінами'
            else
                if UpperCase(ParName) = 'VIHODNSTRING' then
                    ParValue := TableGroup[0].GetVihodnString
                else
                    if UpperCase(ParName) = 'PRAZNSTRING' then
                        ParValue := TableGroup[0].GetPraznString
                    else
                        ParValue := TableGroup.GetParam(ParName, CurrentTable, CurrentDay);
end;

procedure TfmTablePrint.FormCreate(Sender: TObject);
begin
    if Version = 2 then
        PrintTypeBox.ItemIndex := 0;

    if Version = 1 then
        PrintTypeBox.ItemIndex := 1;
end;

procedure TfmTablePrint.VihodDetailsDataSetGetValue(const VarName: string;
    var Value: Variant);
var
    p, vihod: Integer;
    VihodDetails: TVihodDayCount;
begin
    if CurrentDay < 0 then Exit;

    if CurrentDay > DaysInAMonth(SelectFrame.Year, SelectFrame.Month) then
        VihodDetails := TableGroup.OverallVihodDetails
    else VihodDetails := TableGroup.VihodDetails[CurrentDay - 1];

    if VarName = 'CurDate' then Value := SelectFrame.Date_Beg + CurrentDay - 1
    else
        if VarName = 'Worked' then Value := VihodDetails.Worked
        else
            if VarName = 'NotWorked' then Value := VihodDetails.NotWorked
            else
                if VarName = 'Other_Paid' then
                    Value := VihodDetails.OtherPaidCount
                else
                    if VarName = 'Other_NotPaid' then
                        Value := VihodDetails.OtherNotPaidCount
                    else
                        if (VarName[1] = 'V') and (VarName[2] = '_') then
                        try
                            vihod := StrToInt(Copy(VarName, 3, Length(VarName)));
                            Value := VihodDetails[vihod];
                        except
                        end;
end;

end.
