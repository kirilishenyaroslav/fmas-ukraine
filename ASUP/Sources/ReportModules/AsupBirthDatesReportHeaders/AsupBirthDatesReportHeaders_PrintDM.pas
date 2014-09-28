unit AsupBirthDatesReportHeaders_PrintDM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, Forms, Variants,
  Controls, FIBQuery, pFIBQuery, pFIBStoredProc, Dialogs, Math,
  Asup_LoaderPrintDocs_Types, Asup_LoaderPrintDocs_Proc,
  Asup_LoaderPrintDocs_WaitForm, ASUP_LoaderPrintDocs_Consts,
  ASUP_LoaderPrintDocs_Messages, frxExportXLS, frxExportHTML, frxExportRTF, qFTools;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    Designer: TfrxDesigner;
    DSetData: TpFIBDataSet;
    ReportDsetData: TfrxDBDataset;
    DSourceData: TDataSource;
    RTFExport: TfrxRTFExport;
    HTMLExport: TfrxHTMLExport;
    XLSExport: TfrxXLSExport;
    DSetGlobalData: TpFIBDataSet;
    ReportDSetGlobalData: TfrxDBDataset;
    Report: TfrxReport;
  private
    PDateForm:TDate;
    PID_Work_Reason:integer;
    PID_Month:integer;
    PMonthText:string;
    PDesignRep:Boolean;
  public
    constructor Create(AOwner:TComponent);reintroduce;
    function PrintSpr(AParameter:TSimpleParam):variant;
    property DateForm:TDate read PDateForm write PDateForm;
    property ID_Work_Reason:integer read PID_Work_Reason write PID_Work_Reason;
    property ID_Month:integer read PID_Month write PID_Month;
    property MonthText:string read PMonthText write PMonthText;
    property DesignRep:Boolean read PDesignRep write PDesignRep;
  end;


implementation
{$R *.dfm}

const NameReport               = '\AsupBirthDatesReport.fr3';

constructor TDM.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 PDateForm := Date;
 PDesignRep:=False;
end;

function TDM.PrintSpr(AParameter:TSimpleParam):variant;
var wf:TForm;
begin
    if  AParameter.Owner is TForm then
    wf:=ShowWaitForm(AParameter.Owner as TForm,wfPrepareData)
    else wf:=ShowWaitForm(Application.MainForm,wfPrepareData);
    try
        Screen.Cursor:=crHourGlass;
        if PID_Work_Reason=-1 then PID_Work_Reason:=0;
        DSetData.SQLs.SelectSQL.Text:='SELECT * FROM ASUP_REPORT_BIRTH_DATES_HEADERS('''+DateToStr(PDateForm)+''', '+IntToStr(PID_Month)+','+inttostr(PID_Work_Reason)+')';
        DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT FIRM_NAME FROM INI_ASUP_CONSTS';

    try
        DB.Handle:=AParameter.DB_Handle;
        DSetData.Open;
        DSetGlobalData.OPen;
    except
    on E:Exception do
    begin
        AsupShowMessage(Error_Caption,e.Message,mtError,[mbOK]);
        Screen.Cursor:=crDefault;
        Exit;
    end;
end;

    if  DSetData.IsEmpty then
     begin
         qFErrorDialog('За такими даними працівників не знайдено!');
         Screen.Cursor:=crDefault;
         Exit;
     end;


    Report.Clear;
    Report.LoadFromFile(ExtractFilePath(Application.ExeName)+Path_ALL_Reports+NameReport,True);
    Report.Variables['NameV']:=QuotedStr(DSetGlobalData['FIRM_NAME']);
    Report.Variables['Month']:=QuotedStr(MonthText);
    Report.Variables['Forma']:=QuotedStr('Форма №33');    


    Screen.Cursor:=crDefault;
finally
    CloseWaitForm(wf);
end;
    if not  DSetData.IsEmpty then
    begin
        if PDesignRep then Report.DesignReport
        else Report.ShowReport;
        Report.Free;
    end;
    if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.

