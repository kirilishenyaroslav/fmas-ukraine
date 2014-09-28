unit dmAsupReportMedLic;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, Forms, Variants,
  Controls, FIBQuery, pFIBQuery, pFIBStoredProc, Dialogs, Math,
  Asup_LoaderPrintDocs_Types, Asup_LoaderPrintDocs_Proc,
  Asup_LoaderPrintDocs_WaitForm, ASUP_LoaderPrintDocs_Consts,
  ASUP_LoaderPrintDocs_Messages, qFTools, frxExportHTML, frxExportXLS,
  frxExportRTF,Graphics,Windows;

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
    DSetDep: TpFIBDataSet;
    DSourceData: TDataSource;
    DSetActData: TpFIBDataSet;
    ReportDsetActData: TfrxDBDataset;
    Report: TfrxReport;
  private
    PId_Department:Integer;
    Pyears:integer;
    PAct:boolean;
    PWithChild:boolean;
    PDesignRep:Boolean;
    NameReport:string;
  public
    constructor Create(AOwner:TComponent);reintroduce;
    function PrintSpr(AParameter:TSimpleParam):variant;
    property Id_Department:Integer read PId_Department write PId_Department;
    property Act:boolean read PAct write PAct;
    property WithChild:boolean read PWithChild write PWithChild;
    property DesignRep:Boolean read PDesignRep write PDesignRep;
    property years:Integer read Pyears write Pyears;
  end;

var DM:TDM;

implementation
{$R *.dfm}

constructor TDM.Create(AOwner:TComponent);
var Year, Month, Day: Word;
begin
    inherited Create(AOwner);
    PId_Department:=-255;
    PDesignRep:=False;
    DecodeDate(Date, Year, Month, Day);
    years:=Year;
    PAct:=false;
end;

function TDM.PrintSpr(AParameter:TSimpleParam):variant;
var wf:TForm;
    str:string;
begin
    if  AParameter.Owner is TForm then
    wf:=ShowWaitForm(AParameter.Owner as TForm,wfPrepareData)
    else wf:=ShowWaitForm(Application.MainForm,wfPrepareData);
    try
        Screen.Cursor:=crHourGlass;
        str:='01.01.'+inttostr(years);
        DSetData.SQLs.SelectSQL.Text:='SELECT * FROM ASUP_REPORT_MED_LIC('''+str+''','+IfThen(PId_Department=-255,'NULL',inttostr(Pid_Department))+','+IfThen(PWithChild,'''T''','''F''')+')';
        DSetActData.SQLs.SelectSQL.Text:='SELECT * FROM ASUP_REPORT_MED_LIC_ACT('''+str+''','+IfThen(PId_Department=-255,'NULL',inttostr(Pid_Department))+','+IfThen(PWithChild,'''T''','''F''')+')';
        DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT * FROM ASUP_MED_DATA';
        try
            DSetData.Open;
            DSetActData.Open;
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
            qFErrorDialog('За такими даними співробітників не знайдено!');
            Screen.Cursor:=crDefault;
            Exit;
        end;

        Report.Clear;
        if PAct then
        begin
            NameReport := '\AsupReportAct.fr3';
            Report.LoadFromFile(ExtractFilePath(Application.ExeName)+Path_ALL_Reports+NameReport,True);
        end
        else
        begin
            NameReport := '\AsupReportMedLic.fr3';
            Report.LoadFromFile(ExtractFilePath(Application.ExeName)+Path_ALL_Reports+NameReport,True);
        end;
        Report.Variables[' '+'User Category']:=NULL;
        Report.Variables.AddVariable('User Category','year',years);
        Screen.Cursor:=crDefault;
    finally
        CloseWaitForm(wf);
    end;
     if not  DSetData.IsEmpty then
        begin
           if DesignReport then Report.DesignReport
           else Report.ShowReport;
           if not PAct then
           begin
               Report.Clear;
              // if Application.MessageBox(PChar('Сформувати акт?'),'Підтвердження',mb_okcancel)=id_ok then
               if MessageDlg('Сформувати акт?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
               begin
                   NameReport := '\AsupReportAct.fr3';
                   Report.LoadFromFile(ExtractFilePath(Application.ExeName)+Path_ALL_Reports+NameReport,True);
                   Report.Variables[' '+'User Category']:=NULL;
                   Report.Variables.AddVariable('User Category','year',years);
                   Screen.Cursor:=crDefault;
                   if DesignReport then Report.DesignReport
                   else Report.ShowReport;
               end;
           end;
           Report.Free;
        end;
        if ReadTransaction.InTransaction then ReadTransaction.Commit;
    end;

end.

