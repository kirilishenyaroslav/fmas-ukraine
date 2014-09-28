unit AsupReportHolidaySpecStaj_PrintDM;

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
    DSetData: TpFIBDataSet;
    ReportDsetData: TfrxDBDataset;
    DSetGlobalData: TpFIBDataSet;
    ReportDSetGlobalData: TfrxDBDataset;
    RTFExport: TfrxRTFExport;
    XLSExport: TfrxXLSExport;
    HTMLExport: TfrxHTMLExport;
    Report: TfrxReport;
  private
    Pyears:integer;
    PDesignRep:Boolean;
  public
    constructor Create(AOwner:TComponent);reintroduce;
    function PrintSpr(AParameter:TSimpleParam):variant;
    property years:Integer read Pyears write Pyears;
    property DesignRep:Boolean read PDesignRep write PDesignRep;
  end;


implementation
{$R *.dfm}

const NameReport               = '\AsupReportHolidaySpecStaj.fr3';

constructor TDM.Create(AOwner:TComponent);
var Year, Month, Day :word;
begin
 inherited Create(AOwner);
 DecodeDate(Date, Year, Month, Day);
 years:=year;
 PDesignRep:=False;
end;

function TDM.PrintSpr(AParameter:TSimpleParam):variant;
var wf:TForm;
    DateBeg,DateEnd:TDate;
begin
if  AParameter.Owner is TForm then
    wf:=ShowWaitForm(AParameter.Owner as TForm,wfPrepareData)
else wf:=ShowWaitForm(Application.MainForm,wfPrepareData);
try
 Screen.Cursor:=crHourGlass;
 DateBeg:=strtodate('01.01.'+inttostr(years));
 DateEnd:=strtodate('31.12.'+inttostr(years));
 DSetData.SQLs.SelectSQL.Text :='SELECT * FROM ASUP_REPORT_SPECSTAJ_HOL('''+DateToStr(DateBeg)+''','''+DateToStr(DateEnd)+''')';
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
 Report.Variables['date'] := QuotedStr(DateToStr(Date));
 Report.Variables['NameV']:=QuotedStr(DSetGlobalData['FIRM_NAME']);
 Report.Variables['year'] := QuotedStr(inttostr(years));
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

