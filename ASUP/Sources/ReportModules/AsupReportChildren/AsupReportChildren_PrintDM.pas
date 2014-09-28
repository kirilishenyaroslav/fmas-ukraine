unit AsupReportChildren_PrintDM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, Forms, Variants,
  Controls, FIBQuery, pFIBQuery, pFIBStoredProc, Dialogs, Math,
  Asup_LoaderPrintDocs_Types, Asup_LoaderPrintDocs_Proc,
  Asup_LoaderPrintDocs_WaitForm, ASUP_LoaderPrintDocs_Consts,
  ASUP_LoaderPrintDocs_Messages, qFTools, frxExportHTML, frxExportXLS,
  frxExportRTF;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    Designer: TfrxDesigner;
    DSetGlobalData: TpFIBDataSet;
    ReportDSetGlobalData: TfrxDBDataset;
    RTFExport: TfrxRTFExport;
    XLSExport: TfrxXLSExport;
    HTMLExport: TfrxHTMLExport;
    ReportDSetData: TfrxDBDataset;
    DSetData: TpFIBDataSet;
    Report: TfrxReport;
  private
    PDateForm:TDate;
  public
    constructor Create(AOwner:TComponent);reintroduce;
    function PrintSpr(AParameter:TSimpleParam):variant;
    property DateForm:TDate read PDateForm write PDateForm;
  end;


implementation
{$R *.dfm}

const NameReport               = '\AsupChildReport.fr3';

constructor TDM.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 PDateForm := Date;
end;

function TDM.PrintSpr(AParameter:TSimpleParam):variant;
var wf:TForm;
begin
if  AParameter.Owner is TForm then
    wf:=ShowWaitForm(AParameter.Owner as TForm,wfPrepareData)
else wf:=ShowWaitForm(Application.MainForm,wfPrepareData);
try
 Screen.Cursor:=crHourGlass;
 DSetData.SQLs.SelectSQL.Text :='SELECT * FROM ASUP_MAN_CHILDERN_REPORT('''+DateToStr(PDateForm)+''')';
 DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT FIRM_NAME FROM INI_ASUP_CONSTS';

 try
  DB.Handle:=AParameter.DB_Handle;

  DSetData.Open;
  DSetGlobalData.Open;

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
        qFErrorDialog('За такими даними дітей не знайдено!');
        Screen.Cursor:=crDefault;
        Exit;
    end;

 Report.Clear;
 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+Path_ALL_Reports+NameReport,True);
 Report.Variables['DateNow'] := QuotedStr(DateToStr(PDateForm));

 Screen.Cursor:=crDefault;
finally
 CloseWaitForm(wf);
end;
 if not  DSetData.IsEmpty then
    begin
    if DesignReport then Report.DesignReport
    else Report.ShowReport;
    Report.Free;
    end;
 if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;
end.

