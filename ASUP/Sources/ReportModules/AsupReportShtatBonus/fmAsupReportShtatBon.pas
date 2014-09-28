unit fmAsupReportShtatBon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxDropDownEdit, cxCalendar, ActnList, IBase, uCommonSp,
  Asup_LoaderPrintDocs_Types, Asup_LoaderPrintDocs_Proc,
  Asup_LoaderPrintDocs_WaitForm, ASUP_LoaderPrintDocs_Consts,
  ASUP_LoaderPrintDocs_Messages, cxMRUEdit, cxCheckBox, DB, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxSpinEdit, uFControl, uLabeledFControl,
  uSpravControl, pFIBStoredProc, FIBQuery, pFIBQuery, frxClass,
  frxExportHTML, frxExportXLS, frxExportRTF, frxDBSet, frxDesgn,
  qFTools;

type
  TFormOptions = class(TForm)
    Bevel1: TBevel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList: TActionList;
    YesAction: TAction;
    CancelAction: TAction;
    DesRep: TAction;
    EditDepartment: TcxButtonEdit;
    LabelDepartment: TcxLabel;
    LabelDateForm: TcxLabel;
    DateEdit: TcxDateEdit;
    DSet: TpFIBDataSet;
    DSource: TDataSource;
    KodSmEdit: TcxButtonEdit;
    DSetTypePost: TpFIBDataSet;
    SR: TcxButtonEdit;
    LabelShtatDoc: TcxLabel;
    cxLabel1: TcxLabel;
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
    pFIBDataSetPrintMaster: TpFIBDataSet;
    DataSourceMaster: TDataSource;
    frxDBDatasetMaster: TfrxDBDataset;
    frxDBDatasetDetails: TfrxDBDataset;
    pFIBDataSetPrintDetail: TpFIBDataSet;
    pFIBStoredProc: TpFIBStoredProc;
    procedure CancelActionExecute(Sender: TObject);
    procedure YesActionExecute(Sender: TObject);
    procedure DesRepExecute(Sender: TObject);
   { procedure cxMRUEdit1PropertiesButtonClick(Sender: TObject);   }
    procedure EditDepartmentPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KodSmEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SRPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure  PrintSpr();
    procedure DateEditPropertiesChange(Sender: TObject);
  private
    PDb_Handle:TISC_DB_HANDLE;
    PId_Depratment:integer;
    PId_SR:integer;
    PKodSm:integer;
    PNameSm:String;
    PTypePost:integer;
    PDesignRep: Boolean;
    PNameTypePost:String;
    PNameDep:String;
    PDateForm:TDateTime;
    PId_Sess:Int64;
  public
    constructor Create(AParameter:TSimpleParam);reintroduce;
  end;
const NameReport               = '\AsupReportShtatBonus.fr3';

implementation
uses GlobalSPR;
{$R *.dfm}
constructor TFormOptions.Create(AParameter:TSimpleParam);
begin
    inherited Create(AParameter.Owner);
    PDb_Handle:=AParameter.DB_Handle;
    DB.Handle:=PDb_Handle;
    Caption := 'Виконання штатного розкладу';
    YesBtn.Caption := YesBtn_Caption;
    CancelBtn.Caption := CancelBtn_Caption;
    YesBtn.Hint := YesBtn.Caption;
    CancelBtn.Hint := CancelBtn.Caption;
    LabelDepartment.Caption := Label_Department_Caption;
    LabelShtatDoc.Caption := 'Документ штатного розкладу';
    PId_SR:=-255;
    PId_Depratment:=-255;
    PKodSm:=-255;
    PTypePost:=-255;
    PDesignRep:=false;
    LabelDateForm.Caption := Label_DateSelect_Caption;
    DateEdit.Date := Date;
    PDateForm := Date;
    DSet.SQLs.SelectSQL.Text := 'SELECT CURRENT_DEPARTMENT, FIRM_NAME FROM INI_ASUP_CONSTS';
    DSetTypePost.SQLs.SelectSQL.Text := 'SELECT ID_TYPE_POST, NAME_TYPE_POST FROM SP_TYPE_POST';
    DSet.Database:=DB;
    DSet.Transaction:=ReadTransaction;
    DSet.UpdateTransaction:=ReadTransaction;
    DSetTypePost.Database:=DB;
    DSetTypePost.Transaction:=ReadTransaction;
    DSetTypePost.UpdateTransaction:=ReadTransaction;

    DSet.Open;
    DSetTypePost.Open;
    EditDepartment.Text:= DSet.FieldValues['FIRM_NAME'];
    PId_Depratment:=DSet.FieldValues['CURRENT_DEPARTMENT'];

end;

procedure TFormOptions.CancelActionExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure TFormOptions.YesActionExecute(Sender: TObject);
begin
    if SR.Text='' then
    begin
        AsupShowMessage(Error_Caption,'Треба обрати документ штатного розкладу',mtWarning,[mbOK]);
        Exit;
    end;
    if EditDepartment.Text='' then
    begin
        AsupShowMessage(Error_Caption,E_NotSelectDepartment_Text,mtWarning,[mbOK]);
        Exit;
    end;

    if (varIsNUll(KodSmEdit.EditValue)) then
    begin
        AsupShowMessage(Error_Caption,'Треба обрати кошторис!',mtWarning,[mbOK]);
        Exit;
    end;
   PrintSpr();
//    ModalResult := mrYes;
end;

procedure TFormOptions.SRPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('ASUP\ShtatDoc');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(PDb_Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
           SR.Text := varToStr(sp.Output['Name']);
           PId_SR:=sp.Output['Id_SR'];
        end;
        sp.Free;
    end;
end;

procedure TFormOptions.EditDepartmentPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var sp: TSprav;
begin
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(PDb_Handle);
            FieldValues['ShowStyle'] := 0;
            FieldValues['Select'] := 1;
            FieldValues['Actual_Date'] := DateEdit.Date;
            Post;
        end;
    end;
    sp.Show;
    if sp.Output = nil then
       ShowMessage('Не обрано жодного підрозділу!')
    else
    if not sp.Output.IsEmpty then
       begin
           EditDepartment.Text := varToStr(sp.Output['NAME_FULL']);
           PId_Depratment:=sp.Output['ID_DEPARTMENT'];
           PNameDep:=varToStr(sp.Output['NAME_FULL']);
       end;
    sp.Free;
end;

procedure TFormOptions.DesRepExecute(Sender: TObject);
begin
    PDesignRep:=not PDesignRep;
end;


procedure TFormOptions.KodSmEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Smeta:Variant;
begin
    Smeta:=GetSmets(self,PDb_Handle,Date,psmSmet);
    if VarArrayDimCount(Smeta)> 0 then
    If Smeta[0]<>NULL then
    begin
        KodSmEdit.Text := Smeta[2];
        PKodSm := Smeta[0];
        PNameSm := Smeta[2];
//        showmessage(PNameSm);
    end;
end;



procedure TFormOptions.PrintSpr();
var wf:TForm;
begin
    wf:=ShowWaitForm(self,wfPrepareData);
    try
        Screen.Cursor:=crHourGlass;
            // добавлены параметры - по умолчанию старая версия УП
        DSetSr1.SQLs.SelectSQL.Text :='SELECT Id_Session FROM ASUP_SHTAT_VIEW_PREPARE('+
            IfThen(PId_SR=-255,'NULL',inttostr(PId_Sr))+','+''''+DateToStr(pDateForm)+''''+',1,0,0'+')';
         try
            DSetSr1.open;
            except
            on E:Exception do
            begin
                AsupShowMessage(Error_Caption,e.Message,mtError,[mbOK]);
                Screen.Cursor:=crDefault;
                Exit;
            end;
        end;
        PId_Sess:=DSetSr1.FieldByName('Id_Session').AsInteger;
        if  PId_Sess<0 then
        begin
            qFErrorDialog('За такими даними працівників не знайдено!');
            Screen.Cursor:=crDefault;
            Exit;
        end;
        PId_Sess:=DSetSr1.FieldValues['Id_Session'];
        DSetSr1.Transaction.Commit;

{        showmessage(DateToStr(DateForm));
        showmessage(VarToStr(Id_Sess));
                        showmessage(VarToStr(Pid_Department));
                                showmessage(VarToStr(PKodSm));  }

        //делаем инициализацию отчета
        pFIBStoredProc.Transaction.StartTransaction;
        pFIBStoredProc.StoredProcName:='ASUP_REPORT_SHTAT_BONUS';
        pFIBStoredProc.Prepare;
        pFIBStoredProc.ParamByName('IN_DATE_FORM').AsDate:=PDateForm;
        pFIBStoredProc.ParamByName('IN_ID_SESSION').AsInt64:=PId_Sess;
        pFIBStoredProc.ParamByName('IN_ID_DEPARTMENT').AsInt64:=PId_Depratment;
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
        +' WHERE OUT_ID_SESSION='+IntToStr(PId_Sess)
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

        if (not VarIsNull(PId_Sess)) then
        DSetSr2.Params.ParamByName('Id_Sess').AsInteger:=PId_Sess;
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
        Report.Variables['NameTypePost']:=QuotedStr(PNameTypePost);
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
        pFIBStoredProc.ParamByName('IN_ID_SESSION').AsInt64:=PId_Sess;
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

procedure TFormOptions.DateEditPropertiesChange(Sender: TObject);
begin
  PDateForm:=DateEdit.Date;
end;

end.
