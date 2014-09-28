unit dmAsupReportShtatBon;

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
    DSetSr1: TpFIBDataSet;
    WriteTransaction: TpFIBTransaction;
    DSetSr2: TpFIBQuery;
    pFIBDataSetPrintMaster: TpFIBDataSet;
    DataSourceMaster: TDataSource;
    frxDBDatasetMaster: TfrxDBDataset;
    frxDBDatasetDetails: TfrxDBDataset;
    pFIBDataSetPrintDetail: TpFIBDataSet;
    pFIBStoredProc: TpFIBStoredProc;
    Report: TfrxReport;
  private
    PId_Department:Integer;
    PId_SR:Integer;
    PKodSm:Integer;
    PTypePost:Integer;
    PNameSm:String;
    PNameTypePost:String;
    PWithChild:boolean;
    PDateForm:TDate;
    PDesignRep:Boolean;
    PNameDep:String;
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
    property NameSm:String read PNameSm write PNameSm;
    property NameDep:String read PNameDep write PNameDep;
  end;

var DM:TDM;

implementation
{$R *.dfm}

const NameReport               = '\AsupReportShtatBonus.fr3';

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
            // добавлен ряд параметров
        DSetSr1.SQLs.SelectSQL.Text :='SELECT Id_Session FROM ASUP_SHTAT_VIEW_PREPARE('+
            IfThen(PId_SR=-255,'NULL',inttostr(PId_Sr))+','+''''+DateToStr(DateForm)+''''+',1,0,0'
            +')';
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
        Id_Sess:=DSetSr1.FieldByName('Id_Session').AsInteger;
        if  Id_Sess<0 then
        begin
            qFErrorDialog('За такими даними працівників не знайдено!');
            Screen.Cursor:=crDefault;
            Exit;
        end;
        Id_Sess:=DSetSr1.FieldValues['Id_Session'];
        DSetSr1.Transaction.Commit;

{        showmessage(DateToStr(DateForm));
        showmessage(VarToStr(Id_Sess));
                        showmessage(VarToStr(Pid_Department));
                                showmessage(VarToStr(PKodSm));  }

        //делаем инициализацию отчета
        pFIBStoredProc.Transaction.StartTransaction;
        pFIBStoredProc.StoredProcName:='ASUP_REPORT_SHTAT_BONUS';
        pFIBStoredProc.Prepare;
        pFIBStoredProc.ParamByName('IN_DATE_FORM').AsDate:=DateForm;
        pFIBStoredProc.ParamByName('IN_ID_SESSION').AsInt64:=Id_Sess;
        pFIBStoredProc.ParamByName('IN_ID_DEPARTMENT').AsInt64:=Pid_Department;
        pFIBStoredProc.ParamByName('IN_ID_SMET').AsInt64:=PKodSm;
        try
          pFIBStoredProc.ExecProc;
        except
          begin
            pFIBStoredProc.Transaction.Rollback;
            qFErrorDialog('Ошибка при выполнении процедуры');
            Screen.Cursor:=crDefault;
            Exit;
          end;
        end;
        pFIBStoredProc.Transaction.Commit;
        //начинаем выводить

        pFIBDataSetPrintMaster.SQLs.SelectSQL.Text:='select A.* from ASUP_TMP_REPORT_SHTAT_BONUS A,sp_post_base_salary B,sp_post P,'
        +' sp_post_category PC,SP_CATEGORY C'
        +' WHERE OUT_ID_SESSION='+IntToStr(Id_Sess)
        +' and A.out_id_post_salary=B.id_post_base_salary'
        +' and current_date between B.date_beg and B.date_end'
        +' and B.id_post=P.id_post'
        +' and p.id_post=PC.id_post'
        +' and current_date between PC.date_beg and PC.date_end'
        +' and PC.id_category=C.id_category'
        +' ORDER BY c.display_order,p.display_order,b.koeff,b.name_post_base_salary';
        //'select * from ASUP_TMP_REPORT_SHTAT_BONUS  WHERE OUT_ID_SESSION='+IntToStr(Id_Sess)+' ORDER BY OUT_NAME_POST_SALARY';

        pFIBDataSetPrintDetail.SQLs.SelectSQL.Text:='select * from  ASUP_TMP_REPORT_SH_BONUS_DETAIL WHERE ID_KEY_LOCAL=:ID_KEY_LOCAL ORDER BY OUT_RAISE';

        DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT FIRM_NAME FROM INI_ASUP_CONSTS';

        if (not VarIsNull(Id_Sess)) then
        DSetSr2.Params.ParamByName('Id_Sess').AsInteger:=Id_Sess;
        try
            pFIBDataSetPrintMaster.Open;
            DSetGlobalData.Open;
            except
            on E:Exception do
            begin
                AsupShowMessage(Error_Caption,e.Message,mtError,[mbOK]);
                Screen.Cursor:=crDefault;
                Exit;
            end;
        end;
        pFIBDataSetPrintMaster.FetchAll;
//        showmessage(VarToStr(pFIBDataSetPrintMaster.RecordCount));
        if  pFIBDataSetPrintMaster.RecordCount=0 then
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
        Report.Variables['NameSm']:=QuotedStr(PNameSm);
        Report.Variables['NameDep']:=QuotedStr(PNameDep);        
        Screen.Cursor:=crDefault;

        Report.PrepareReport(true);
        Report.ShowPreparedReport;
        finally
        CloseWaitForm(wf);
    end;
{    if not  DSetData.IsEmpty then
    begin
        if PDesignRep then Report.DesignReport
        else Report.ShowReport;
        Report.Free;
    end;}
        //чистим временные данные
        pFIBStoredProc.Transaction.StartTransaction;
        pFIBStoredProc.StoredProcName:='ASUP_REPORT_SHTAT_BONUS_CLEAR';
        pFIBStoredProc.Prepare;
        pFIBStoredProc.ParamByName('IN_ID_SESSION').AsInt64:=Id_Sess;
        try
          pFIBStoredProc.ExecProc;
        except
          begin
            pFIBStoredProc.Transaction.Rollback;
            qFErrorDialog('Ошибка при выполнении процедуры');
            Screen.Cursor:=crDefault;
            Exit;
          end;
        end;
    DSetSr2.ExecQuery;
    DSetSr2.Transaction.Commit;
    if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.

