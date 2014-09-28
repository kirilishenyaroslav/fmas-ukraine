unit dmAsupReportMore2Years;

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
    PId_Department:Integer;
    PWithChild:boolean;
    PDateForm:TDate;
    PDesignRep:Boolean;
  public
    constructor Create(AOwner:TComponent);reintroduce;
    function PrintSpr(AParameter:TSimpleParam):variant;
    property Id_Department:Integer read PId_Department write PId_Department;
    property WithChild:boolean read PWithChild write PWithChild;
    property DateForm:TDate read PDateForm write PDateForm;
    property DesignRep:Boolean read PDesignRep write PDesignRep;
  end;


implementation
{$R *.dfm}

const NameReport               = '\AsupReportProfSotr.fr3';

constructor TDM.Create(AOwner:TComponent);
var Year, Month, Day :word;
begin
    inherited Create(AOwner);
    DecodeDate(Date, Year, Month, Day);
    PDateForm := Date;
    PId_Department:=-255;
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
        DSetData.SQLs.SelectSQL.Text :='SELECT * FROM ASUP_REPORT_PROF_SOTR ('''+DateToStr(DateForm)+''','+
                                                                             IfThen(PId_Department=-255,'NULL',inttostr(Pid_Department))+','+
                                                                             IfThen(PWithChild,'''T''','''F''')+')';
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

