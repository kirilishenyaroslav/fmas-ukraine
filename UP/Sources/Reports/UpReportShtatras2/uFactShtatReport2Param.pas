unit uFactShtatReport2Param;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,  uFControl, uLabeledFControl,
  uSpravControl, uCommonSp, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, uFormControl, uDateControl, uReportFactShtat2ReturnData, iBase;

type
  TfmFactShtatReport2Param = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    SR: TqFSpravControl;
    CurDate: TqFDateControl;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    ReportData: TpFIBDataSet;
    Department: TqFSpravControl;
    Smeta: TqFSpravControl;
    DataSourceReport: TDataSource;
    procedure SROpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure OkButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure SmetaOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DepartmentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    sp: TSprav;
  public
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  fmFactShtatReport2Param: TfmFactShtatReport2Param;

implementation

{$R *.dfm}

uses NagScreenUnit, GlobalSPR, uSelectForm, qFTools;

procedure TfmFactShtatReport2Param.SROpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\ShtatDoc');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;
            Post;
        end;

        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_SR'];
            DisplayText := sp.Output['Name'];
        end;
        sp.Free;
    end;
end;

procedure TfmFactShtatReport2Param.OkButtonClick(Sender: TObject);
var
    NagScreen: TNagScreen;
    F : TfrmReportFactShtat2ReturnData;
begin
    if not qFCheckAll(Self) then Exit;
    try
        NagScreen := TNagScreen.Create(Application.MainForm);
        NagScreen.Show;
        NagScreen.SetStatusText('Отримуються дані для звіту...');

        ReportData.Close;
        ReportData.Sqls.SelectSql.Text := 'Select * from UP_SHTATRAS_REPORT_2(:Id_SR, :Act_Date, :ID_DEPARTMENT, :ID_SMETA)';
        ReportData.ParamByName('Id_SR').AsInteger := SR.Value;
        ReportData.ParamByName('Act_Date').AsDate := CurDate.Value;
        ReportData.ParamByName('ID_DEPARTMENT').AsVariant := Department.Value;
        ReportData.ParamByName('ID_SMETA').AsVariant := Smeta.Value;

        ReportData.StartTransaction;
        ReportData.Open;

        NagScreen.Free;
        NagScreen := nil;

        F := TfrmReportFactShtat2ReturnData.Create(Self, ReportData);
        F.cxGridDBTableView1.DataController.DataSource := DataSourceReport;
        F.WindowState := wsMaximized;
        F.ShowModal;     
        F.Free;

       { Report.LoadFromFile('Reports\UP\UpReportShtatExec.fr3');

        Report.Variables['UseColumn5'] := Coalesce(UseColumn5.Value, False);
        Report.Variables['Act_Date'] := QuotedStr(DateToStr(CurDate.Value));
        Report.Variables['PostTotals'] := Coalesce(PostTotals.Value, False);
        Report.Variables['DepartmentTotals'] := Coalesce(DepartmentTotals.Value, False);
        Report.Variables['SmetaTotals'] := Coalesce(SmetaTotals.Value, False);

        if DesignReport then Report.DesignReport
        else Report.ShowReport;
        }
    finally
        if NagScreen <> nil then NagScreen.Free;
        if ReportData.Transaction.InTransaction then
            ReportData.Transaction.Rollback;
    end;
end;

procedure TfmFactShtatReport2Param.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
    begin
       { DesignReport := not DesignReport;
        if DesignReport then DLabel.Caption := 'Design'
        else DLabel.Caption := '';   }
    end;
end;

constructor TfmFactShtatReport2Param.Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE);
begin
    inherited Create(aOwner);
    DB.Handle := DBHandle;
    Self.Caption := 'Аналіз ШР у розрізі розрядів';
end;

procedure TfmFactShtatReport2Param.DepartmentOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
            FieldValues['Actual_Date'] := CurDate.Value;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Department'];
            DisplayText := sp.Output['Name_Full'];
        end;
        sp.Free;
    end;
end;

procedure TfmFactShtatReport2Param.SmetaOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    id: variant;
begin
    id := GlobalSPR.GetSmets(Owner, DB.Handle, Date, psmSmet);

    if (VarArrayDimCount(id) > 0) and (id[0] <> Null) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
    end;
end;

procedure TfmFactShtatReport2Param.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmFactShtatReport2Param.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
        Action := caFree;
end;

procedure TfmFactShtatReport2Param.FormCreate(Sender: TObject);
begin
    CurDate.Value := Date;    
end;

procedure TfmFactShtatReport2Param.DepartmentKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (Key = Ord(#8))
    then Department.Clear;
end;

end.
