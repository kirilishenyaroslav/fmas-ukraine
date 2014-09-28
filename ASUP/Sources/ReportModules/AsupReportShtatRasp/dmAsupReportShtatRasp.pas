unit dmAsupReportShtatRasp;

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
    DSetSr1: TpFIBDataSet;
    WriteTransaction: TpFIBTransaction;
    DSetSr2: TpFIBQuery;
  private
    PId_Department:Integer;
    PId_SR:Integer;
    PKodSm:Integer;
    PTypePost:Integer;
    PNameTypePost:String;
    PWithChild:boolean;
    PDateForm:TDate;
    PDesignRep:Boolean;
    Id_Sess:Integer;
  public
    constructor Create(AOwner:TComponent);reintroduce;
    function PrintSpr(AParameter:TSimpleParam):variant;
    property Id_Department:Integer read PId_Department write PId_Department;
    property Id_SR:Integer read PId_SR write PId_SR;    
    property WithChild:boolean read PWithChild write PWithChild;
    property DateForm:TDate read PDateForm write PDateForm;
    property KodSm:Integer read PKodSm write PKodSm;
    property TypePost:integer read PTypePost write PTypePost;
    property NameTypePost:String read PNameTypePost write PNameTypePost;
    property DesignRep:Boolean read PDesignRep write PDesignRep;
  end;

var DM:TDM;

implementation
{$R *.dfm}

const NameReport               = '\AsupReportShtatRasp.fr3';

constructor TDM.Create(AOwner:TComponent);
var Year, Month, Day :word;
begin
    inherited Create(AOwner);
    DecodeDate(Date, Year, Month, Day);
    PDateForm := Date;
    PId_Department:=-255;
    PKodSm:=-255;
    PTypePost:=-255;
    PDesignRep:=False;
    PId_SR:=-255;
end;

function TDM.PrintSpr(AParameter:TSimpleParam):variant;
var wf:TForm;
begin
    if  AParameter.Owner is TForm then
    wf:=ShowWaitForm(AParameter.Owner as TForm,wfPrepareData)
    else wf:=ShowWaitForm(Application.MainForm,wfPrepareData);
    try
        Screen.Cursor:=crHourGlass;
        DSetSr1.SQLs.SelectSQL.Text :='SELECT Id_Session FROM Shtat_Make_Mfund_Data('+IfThen(PId_SR=-255,'NULL',inttostr(PId_Sr))+')';
         try
            DSetSr1.Open;
            except
            on E:Exception do
            begin
                AsupShowMessage(Error_Caption,e.Message,mtError,[mbOK]);
                Screen.Cursor:=crDefault;
                Exit;
            end;
        end;
        if  DSetSr1.IsEmpty then
        begin
            qFErrorDialog('За такими даними працівників не знайдено!');
            Screen.Cursor:=crDefault;
            Exit;
        end;
        Id_Sess:=DSetSr1.FieldValues['Id_Session'];
        DSetSr1.Transaction.Commit;
        DSetData.SQLs.SelectSQL.Text :='SELECT * FROM ASUP_REPORT_SHTAT_RASP_SUM ('''+DateToStr(DateForm)+''','+
                                                                             IfThen(PId_Department=-255,'NULL',inttostr(Pid_Department))+','+
                                                                             IfThen(PWithChild,'''T''','''F''')+','+
                                                                             IfThen(PKodSm=-255,'NULL',inttostr(PKodSm))+','+
                                                                             IfThen(PTypePost=-255,'NULL',inttostr(PTypePost))+','+
                                                                             IfThen(Id_Sess=-255,'NULL',inttostr(Id_Sess))+')';
        DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT FIRM_NAME FROM INI_ASUP_CONSTS';
        if (not VarIsNull(Id_Sess)) then
        DSetSr2.Params.ParamByName('Id_Sess').AsInteger:=Id_Sess;
        try
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
        Report.Variables['NameTypePost']:=QuotedStr(NameTypePost);
        Report.Variables['KodSm']:=QuotedStr(IntToStr(PKodSm));
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
    DSetSr2.ExecQuery;
    DSetSr2.Transaction.Commit;
    if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.

