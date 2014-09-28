unit AsupRegardsCommonReport_PrintDM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, Forms, Variants,
  Controls, FIBQuery, pFIBQuery, pFIBStoredProc, Dialogs, Math,
  Asup_LoaderPrintDocs_Types, Asup_LoaderPrintDocs_Proc,
  Asup_LoaderPrintDocs_WaitForm, ASUP_LoaderPrintDocs_Consts,
  ASUP_LoaderPrintDocs_Messages, qFTools, frxExportHTML, frxExportXLS,
  frxExportRTF, frxExportXML;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSetData: TpFIBDataSet;
    ReportDsetData: TfrxDBDataset;
    DSourceData: TDataSource;
    DSetGlobalData: TpFIBDataSet;
    ReportDSetGlobalData: TfrxDBDataset;
    Designer: TfrxDesigner;
    RTFExport: TfrxRTFExport;
    HTMLExport: TfrxHTMLExport;
    XLSExport: TfrxXLSExport;
    Report: TfrxReport;
  private
    PIdRegards:integer;
    PRegardsText:string;
    PID_Work_Reason:integer;
  public
    constructor Create(AOwner:TComponent);reintroduce;
    function PrintSpr(AParameter:TSimpleParam):variant;
    property IdRegards:Integer read PIdRegards write PIdRegards;
    property RegardsText:string read PRegardsText write PRegardsText;
    property ID_Work_Reason:integer read PID_Work_Reason write PID_Work_Reason;
  end;


implementation
{$R *.dfm}

const NameReport               = '\AsupCommonRegardsReport.fr3';

constructor TDM.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 PID_Work_Reason:= 0;
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
        DSetData.SQLs.SelectSQL.Text:='SELECT * FROM ASUP_REPORT_REGARDS_COMMON('+inttostr(PIdRegards)+','''+datetostr(Date)+''','+inttostr(PID_Work_Reason)+')';
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
        qFErrorDialog('За такими даними працівників не знайдено!');
        Screen.Cursor:=crDefault;
        Exit;
    end;

    Report.Clear;
    Report.LoadFromFile(ExtractFilePath(Application.ExeName)+Path_ALL_Reports+NameReport,True);
    Report.Variables['CUR_DATE']:=QuotedStr(DateToStr(Date));
    Report.Variables['FIRM_NAME']:=QuotedStr(DSetGlobalData['FIRM_NAME']);
    Report.Variables['REGARD_NAME']:=QuotedStr(RegardsText);


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

