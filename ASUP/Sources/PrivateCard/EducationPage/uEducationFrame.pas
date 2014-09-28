unit uEducationFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid, uEducationDataModule, Buttons, ExtCtrls,
  ActnList, DBCtrls, EducationUnit, SpCommon, cxContainer, cxTextEdit,
  cxMemo, uFormControl, FIBQuery, pFIBQuery, pFIBStoredProc,pFIBDataSet,
  FIBDataSet, UpKernelUnit, iBase;

type
  TfmPCardEducationPage = class(TFrame)
    EducationGrid: TcxGrid;
    EducationView: TcxGridDBTableView;
    EducationGridLevel1: TcxGridLevel;
    StyleRepository: TcxStyleRepository;
    EducationViewNAME_Education: TcxGridDBColumn;
    EducationViewDATE_BEG: TcxGridDBColumn;
    EducationViewDATE_END: TcxGridDBColumn;
    EducationViewID_Education: TcxGridDBColumn;
    Panel11: TPanel;
    SB_AddEduc: TSpeedButton;
    SB_DelEduc: TSpeedButton;
    SB_ModifEduc: TSpeedButton;
    ALEducation: TActionList;
    AddEducA: TAction;
    ModifEducA: TAction;
    DelEducA: TAction;
    ShowInformation: TAction;
    Panel1: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    AkredText: TDBText;
    SpecName: TDBText;
    KvalText: TDBText;
    DiplomText: TDBText;
    DateText: TDBText;
    Panel2: TPanel;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    cxMemo1: TcxMemo;
    pFIBStoredProc1: TpFIBStoredProc;
    ManEducSet: TpFIBDataSet;
    EducationViewDBColumn1: TcxGridDBColumn;
    procedure AddEducAExecute(Sender: TObject);
    procedure ModifEducAExecute(Sender: TObject);
    procedure DelEducAExecute(Sender: TObject);
    procedure EducationViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FrameEnter(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure EducationGridFocusedViewChanged(Sender: TcxCustomGrid;
      APrevFocusedView, AFocusedView: TcxCustomGridView);
    procedure EducationSelectAfterOpen(DataSet: TDataSet);
  private
     DbHandle:TISC_DB_HANDLE;
    { Private declarations }
  public
    DM:TdmEducation;
    id_pcard:integer;
    constructor Create(AOwner: TComponent; DMod: TdmEducation; Id_PC: Integer; modify :integer); reintroduce;
  end;

implementation

{$R *.dfm}

constructor TfmPCardEducationPage.Create(AOwner: TComponent; DMod: TdmEducation; Id_PC: Integer; modify :integer);
begin
    inherited Create(AOwner);
    DM:=Dmod; id_pcard:=Id_PC;
    DM.EducationSelect.ParamByName('Id_PCard').AsInteger := Id_PCard;
    DM.EducationSelect.AfterOpen:=EducationSelectAfterOpen;
    DM.EducationSelect.Open;
    EducationView.DataController.DataSource := DM.EducationSource;

    AkredText.DataSource:=DM.EducationSource;
    DateText.DataSource:=DM.EducationSource;
    DiplomText.DataSource:=DM.EducationSource;
    KvalText.DataSource:=DM.EducationSource;
    SpecName.DataSource:=DM.EducationSource;

    DM.pFIBDS_IsShow.Open;

    DbHandle:=DM.DB.Handle;

    if (DM.pFIBDS_IsShow['show_old_educ']='T') then
     begin
       DM.pFIBDS_OldEduc.ParamByName('Id_PCard').AsInteger := Id_PCard;
       DM.pFIBDS_OldEduc.Open;
       if (VarIsNull(DM.pFIBDS_OldEduc['EDUCATION'])) then
        cxMemo1.Visible:=False
       else
        cxMemo1.Text:=DM.pFIBDS_OldEduc['EDUCATION'];
     end
    else
     cxMemo1.Visible:=False;

    if (modify=0) then
     begin
       AddEducA.Enabled:=False;
       DelEducA.Enabled:=False;
       ModifEducA.Enabled:=False;
     end;
end;

procedure TfmPCardEducationPage.EducationSelectAfterOpen(DataSet: TDataSet);
begin
  EducationView.ViewData.Expand(True);
end;


procedure TfmPCardEducationPage.AddEducAExecute(Sender: TObject);
var
    form: TEducationForm;
    ManeducAdd:TpFIBStoredProc;
   // ManEducRet:TpFIBDataSet;
    ret_param:Integer;
begin
  //ManEducRet:=TpFIBDataSet.Create(Self);
  //ManEducRet.Database:=DM.DB;
  //ManEducRet.Transaction:=DM.ReadTransaction;
  //ManEducRet.Close;
  form := TEducationForm.Create(Self, DbHandle);
  form.HDLE:=Integer(DM.DB.Handle);
  form.qFIC_Akr.Visible:=false;
  ManeducAdd:=TpFIBStoredProc.Create(Self);
  ManeducAdd.Database:=DM.DB;
  form.Caption:='Додати';
  ManeducAdd.Transaction:=DM.DefaultTransaction;
  ManeducAdd.StoredProcName:='ASUP_DT_MAN_EDUCATION_IU';
  ManeducAdd.Transaction.StartTransaction;
  //StartHistory(DM.DefaultTransaction);
  if Form.ShowModal=mrOk then
   begin
       try
     ManeducAdd.Prepare;
     ManeducAdd.ParamByName('ID_PCARD').AsInteger:=id_pcard;
     ManeducAdd.ParamByName('ID_ORG').AsInteger:=form.qFSC_Org.Value;
     ManeducAdd.ParamByName('DATE_BEG').AsDate:=form.qFDC_Beg.Value;
     ManeducAdd.ParamByName('DATE_END').AsDate:=form.qFDC_End.Value;
     ManeducAdd.ParamByName('ID_SPEC').Value:=form.qFSC_Spec.Value;
     ManeducAdd.ParamByName('ID_KVAL').Value:=form.qFSC_Kval.Value;
     ManeducAdd.ParamByName('ID_EDUC').AsInteger:=form.qFSC_Educ.Value;
     ManeducAdd.ParamByName('DIPLOM_NUMBER').AsString:=form.DiplomNumberEdit.Text;
     ManeducAdd.ParamByName('DIPLOM_DATE').AsDate:=form.qFDC_Diplom.Value;
     //ManeducAdd.ParamByName('AKREDITATION').AsInteger:=id_pcard;
     ManeducAdd.ParamByName('IS_FSHR').Value:=form.qFBoolControl1.Value;
     ManeducAdd.ExecProc;
   //ret_param:=ManeducAdd.FldByName['ID'].AsInteger;
     ManeducAdd.Transaction.Commit;
     ManeducAdd.Close;
     ManeducAdd.Free;
     DM.EducationSelect.Close;
     DM.EducationSelect.Open;
        except on E: Exception do
            ShowMessage(E.Message);
        end;
   end;
   form.Free;
   //DM.EducationSelect.Locate('ID_EDUC_KEY',ret_param,[]);
end;

procedure TfmPCardEducationPage.ModifEducAExecute(Sender: TObject);
var  Form: TEducationForm;
     ManeducUpd:TpFIBStoredProc;
     EducSet, SpecSet, KvalSet, OrgSet:TpFIBDataSet;
     Educ_Key:Integer;
begin
  form := TEducationForm.Create(Self, DbHandle);
  Form.qFIC_Akr.Visible:=false;
  form.Caption:='Змінити';
  ManEducSet.Close;
  ManEducSet.SQLs.SelectSQL.Text:='select id_org, id_spec, id_kval, id_educ from man_educ where id_educ_key=:educ_key';
  ManEducSet.ParamByName('EDUC_KEY').AsInteger:=DM.EducationSelect['ID_EDUC_KEY'];
  ManEducSet.Open;

  //отбор по типу образования
  EducSet:=TpFIBDataSet.Create(Self);
  EducSet.Database:=DM.DB;
  EducSet.Transaction:=DM.ReadTransaction;
  EducSet.Close;
  EducSet.SQLs.SelectSQL.Text:='select id_educ, name_educ from SP_EDUCATION where id_educ=:educ';
  EducSet.ParamByName('EDUC').AsInteger:=ManEducSet['ID_EDUC'];
  EducSet.Open;
  Form.qFSC_Educ.DisplayText:=EducSet['name_educ'];


  //отбор специальности
  SpecSet:=TpFIBDataSet.Create(Self);
  SpecSet.Database:=DM.DB;
  SpecSet.Transaction:=DM.ReadTransaction;
  SpecSet.Close;
  SpecSet.SQLs.SelectSQL.Text:='select id_spec, name_spec from SP_SPEC where id_spec=:spec';
  SpecSet.ParamByName('spec').Value:=ManEducSet['ID_SPEC'];
  SpecSet.Open;
  Form.qFSC_Spec.DisplayText:=SpecSet['name_spec'];


  //отбор по уровню квалификации
  KvalSet:=TpFIBDataSet.Create(Self);
  KvalSet.Database:=DM.DB;
  KvalSet.Transaction:=DM.ReadTransaction;
  KvalSet.Close;
  KvalSet.SQLs.SelectSQL.Text:='select id_kval, name_kval from SP_KVALIFICATION where id_kval=:kval';
  KvalSet.ParamByName('kval').Value:=ManEducSet['ID_KVAL'];
  KvalSet.Open;
  Form.qFSC_Kval.DisplayText:=KvalSet['name_kval'];

  //отбор ВУЗов
  OrgSet:=TpFIBDataSet.Create(Self);
  OrgSet.Database:=DM.DB;
  OrgSet.Transaction:=DM.ReadTransaction;
  OrgSet.Close;
  OrgSet.SQLs.SelectSQL.Text:='select id_org, name_full from SP_EDUCORG where id_org=:org';
  OrgSet.ParamByName('org').AsInteger:=ManEducSet['ID_ORG'];
  OrgSet.Open;
  Form.qFSC_Org.DisplayText:=OrgSet['name_full'];
  Educ_Key:=DM.EducationSelect['ID_EDUC_KEY'];
  form.qFSC_Org.Value:=ManEducSet['ID_ORG'];
  form.qFDC_Beg.Value:=DM.EducationSelect['DATE_BEG'];
  form.qFDC_End.Value:=DM.EducationSelect['DATE_END'];
  form.qFSC_Spec.Value:=ManEducSet['ID_SPEC'];
  form.qFSC_Kval.Value:=ManEducSet['ID_KVAL'];
  form.qFSC_Educ.Value:=ManEducSet['ID_EDUC'];
  form.DiplomNumberEdit.Text:=DM.EducationSelect['DIPLOM_NUMBER'];
  form.qFDC_Diplom.Value:=DM.EducationSelect['DIPLOM_DATE'];
  //form.qFBoolControl1.Value:=ManEducSet['IS_FSHR'];
  form.HDLE:=Integer(DM.DB.Handle);
  ManeducUpd:=TpFIBStoredProc.Create(Self);
  ManeducUpd.Database:=DM.DB;
  ManeducUpd.Transaction:=DM.DefaultTransaction;
  ManeducUpd.StoredProcName:='ASUP_DT_MAN_EDUCATION_IU';
  ManeducUpd.Transaction.StartTransaction;
  StartHistory(DM.DefaultTransaction);  
  if Form.ShowModal=mrOk then
   begin
     ManeducUpd.Prepare;
     ManeducUpd.ParamByName('ID_PCARD').AsInteger:=id_pcard;
     ManeducUpd.ParamByName('ID_ORG').AsInteger:=form.qFSC_Org.Value;
     ManeducUpd.ParamByName('DATE_BEG').AsDate:=form.qFDC_Beg.Value;
     ManeducUpd.ParamByName('DATE_END').AsDate:=form.qFDC_End.Value;
     ManeducUpd.ParamByName('ID_SPEC').Value:=form.qFSC_Spec.Value;
     ManeducUpd.ParamByName('ID_KVAL').Value:=form.qFSC_Kval.Value;
     ManeducUpd.ParamByName('ID_EDUC').AsInteger:=form.qFSC_Educ.Value;
     ManeducUpd.ParamByName('DIPLOM_NUMBER').AsString:=form.DiplomNumberEdit.Text;
     ManeducUpd.ParamByName('DIPLOM_DATE').AsDate:=form.qFDC_Diplom.Value;
     //ManeducUpd.ParamByName('AKREDITATION').AsInteger:=id_pcard;
     ManeducUpd.ParamByName('IS_FSHR').Value:=form.qFBoolControl1.Value;
     ManeducUpd.ParamByName('ID_EDUC_KEY').AsInt64:=Educ_Key;
     ManeducUpd.ExecProc;
     ManeducUpd.Transaction.Commit;
     ManeducUpd.Close;
     ManeducUpd.Free;
     DM.EducationSelect.Close;
     DM.EducationSelect.Open;
   end;
   form.Free;
   DM.EducationSelect.Locate('ID_EDUC_KEY',Educ_Key,[])
end;

procedure TfmPCardEducationPage.DelEducAExecute(Sender: TObject);
begin
  if DM.EducationSelect.IsEmpty then
   begin
     MessageDlg('Не можливо видалити запис бо довідник пустий',mtError,[mbYes],0);
     Exit;
   end;
  if (MessageDlg('Чи ви справді бажаєте вилучити цей запис?',mtConfirmation,[mbYes,mbNo],0) = mrNo) then Exit;
  with DM do
  try
    DeleteQuery.Transaction.StartTransaction;
    StartHistory(DM.DefaultTransaction);
    DeleteQuery.ParamByName('id_Educ').AsInteger:=EducationSelect['id_Educ_key'];
    DeleteQuery.ExecProc;
    DefaultTransaction.Commit;
  except on e: Exception do
    begin
      MessageDlg('Не вдалося видалити запис: '+#13+e.Message,mtError,[mbYes],0);
      DefaultTransaction.RollBack;
    end;
  end;
  DM.EducationSelect.Close;
  DM.EducationSelect.Open;
end;

procedure TfmPCardEducationPage.EducationViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (( Key = VK_F12) and (ssShift in Shift)) then
     ShowInfo(EducationView.DataController.DataSource.DataSet);
end;

procedure TfmPCardEducationPage.FrameEnter(Sender: TObject);
begin
     if not DM.ReadTransaction.InTransaction
     then DM.ReadTransaction.StartTransaction;

     if DM.EducationSelect.Active
     then DM.EducationSelect.Close;

     DM.EducationSelect.Open;

     EducationView.ViewData.Expand(True);

     EducationGrid.SetFocus;
end;

procedure TfmPCardEducationPage.FrameExit(Sender: TObject);
begin
     DM.ReadTransaction.CommitRetaining;
end;

procedure TfmPCardEducationPage.EducationGridFocusedViewChanged(
  Sender: TcxCustomGrid; APrevFocusedView,
  AFocusedView: TcxCustomGridView);
begin
     EducationView.ViewData.Expand(True);
end;

end.
