unit uPrK_JN_FAK_SPEC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, DB, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, cxControls, cxInplaceContainer, cxTLData, cxDBTL, IBase,
  cxMaskEdit, dxBar, dxBarExtItems, ActnList, ImgList, uPrK_Loader, uPrK_Resources,
  uConstants, uSpecKlassSprav, uPrK_JN_FAK_SPEC_dmCommonStyles;

type
  TfrmJnFakSpec = class(TForm)
    TreeListMain: TcxDBTreeList;
    DB: TpFIBDatabase;
    DSetMain: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    DSourceMain: TDataSource;
    cmnID_SP_DEPARTMENT: TcxDBTreeListColumn;
    cmnID_SP_SPEC: TcxDBTreeListColumn;
    cmnSPEC_NAME: TcxDBTreeListColumn;
    dxBarManager1: TdxBarManager;
    AddFakBtn: TdxBarLargeButton;
    EditBtn: TdxBarLargeButton;
    DelBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    ImageList: TImageList;
    ActionList1: TActionList;
    AddA: TAction;
    EditA: TAction;
    DelA: TAction;
    ExitA: TAction;
    RefreshA: TAction;
    RefreshBtn: TdxBarLargeButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshAExecute(Sender: TObject);
    procedure AddAExecute(Sender: TObject);
    procedure EditAExecute(Sender: TObject);
    procedure DelAExecute(Sender: TObject);
    procedure ExitAExecute(Sender: TObject);
  private
    { Private declarations }
    IndexLanguage:Integer;
    pStyleDM:TStylesDM;
    function IsDepartment:Boolean; // явл€етс€ ли выделенна€ запись подразделением.
    procedure RefreshDSets(AID:Int64=-1);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE);reintroduce;
  end;

implementation

{$R *.dfm}
uses uPrK_JN_FAK_SPEC_Edit, Math;

constructor TfrmJnFakSpec.Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);

  DB.Handle:=ADB_HANDLE;
  ReadTransaction.Active:=True;

  pStyleDM:=TStylesDM.Create(Self);
  TreeListMain.Styles.StyleSheet:=pStyleDM.TreeListStyleSheetDevExpress;

  IndexLanguage:=uPrK_Resources.SelectLanguage;

  Caption:=nForm_JN_FAK_SPEC_Caption[IndexLanguage];

  AddA.Caption:=nAction_Add[IndexLanguage];
  EditA.Caption:=nAction_Change[IndexLanguage];
  DelA.Caption:=nAction_Del[IndexLanguage];
  RefreshA.Caption:=nActiont_Obnov[IndexLanguage];
  ExitA.Caption:=nAction_Exit[IndexLanguage];

  AddA.Hint:=nHintAction_Add[IndexLanguage];
  EditA.Hint:=nHintAction_Change[IndexLanguage];
  DelA.Hint:=nHintAction_Del[IndexLanguage];
  RefreshA.Hint:=nHintAction_Obnov[IndexLanguage];
  ExitA.Hint:=nHintAction_Exit[IndexLanguage];

  RefreshDSets;
end;

function TfrmJnFakSpec.IsDepartment:Boolean;
begin
  Result:=False;
  if not DSetMain.IsEmpty then
    if DSetMain['ID_SP_DEPARTMENT']=-1 then
      Result:=True;
end;

procedure TfrmJnFakSpec.RefreshDSets(AID:Int64=-1);
begin
  if DSetMain.Active then DSetMain.Close;
  DSetMain.SQLs.SelectSQL.Text:='SELECT * FROM PUB_JN_FAK_SPEC_SELECT_TREE';
  DSetMain.Open;
  TreeListMain.FullExpand;
  DSetMain.Locate('ID_JN_FAK_SPEC',AID,[]);
end;

procedure TfrmJnFakSpec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ReadTransaction.Active:=False;
  Action:=caFree;
end;

procedure TfrmJnFakSpec.RefreshAExecute(Sender: TObject);
var pId:Int64;
begin
  if not DSetMain.IsEmpty then
    pId:=DSetMain['ID_JN_FAK_SPEC']
  else
    pId:=-1;
  RefreshDSets(pId);
end;

procedure TfrmJnFakSpec.AddAExecute(Sender: TObject);
var T: TfrmPUB_JN_FAK_SPEC_Edit;
 pId:Int64;
begin
  T:=TfrmPUB_JN_FAK_SPEC_Edit.Create(Self,True);
  T.cxLabelFormCaption.Caption:=nFormKlassSpravEdit_Add[IndexLanguage];
  if T.ShowModal=mrOk then
    begin
      try
        StoredProc.Transaction.StartTransaction;
        StoredProc.StoredProcName:='PUB_JN_FAK_SPEC_ADD';
        StoredProc.Prepare;
        StoredProc.ParamByName('ID_SP_SPEC').AsInt64:=T.pID_SP_SPEC;
        StoredProc.ParamByName('ID_SP_DEPARTMENT').AsInt64:=T.pID_SP_DEPARTMENT;
        StoredProc.ExecProc;
        pId:=StoredProc.FN('ID_OUT').AsInt64;
        StoredProc.Transaction.Commit;
        RefreshDSets(pId);
      except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                        nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
             StoredProc.Transaction.Rollback;
          end;
      end;
    end;
  T.Release;
end;

procedure TfrmJnFakSpec.EditAExecute(Sender: TObject);
var T: TfrmPUB_JN_FAK_SPEC_Edit;
 pId:Int64;
begin
  if DSetMain.IsEmpty then Exit;
  if IsDepartment     then Exit;

  T:=TfrmPUB_JN_FAK_SPEC_Edit.Create(Self,False);
  T.cxLabelFormCaption.Caption:=nFormKlassSpravEdit_Change[IndexLanguage];
  if T.ShowModal=mrOk then
    begin
      try
        StoredProc.Transaction.StartTransaction;
        StoredProc.StoredProcName:='PUB_JN_FAK_SPEC_CHANGE';
        StoredProc.Prepare;
        pId:=DSetMain['ID_JN_FAK_SPEC'];
        StoredProc.ParamByName('ID_JN_FAK_SPEC').AsInt64:=DSetMain['ID_JN_FAK_SPEC'];
        StoredProc.ParamByName('ID_SP_SPEC').AsInt64:=T.pID_SP_SPEC;
        StoredProc.ParamByName('ID_SP_DEPARTMENT').AsInt64:=T.pID_SP_DEPARTMENT;
        StoredProc.ExecProc;
        StoredProc.Transaction.Commit;
        RefreshDSets(pId);
      except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                        nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
             StoredProc.Transaction.Rollback;
          end;
      end;
    end;
  T.Release;
end;

procedure TfrmJnFakSpec.DelAExecute(Sender: TObject);
begin
  if DSetMain.IsEmpty then Exit;
  if IsDepartment     then Exit;

  if prkMessageDlg(nMsgBoxTitle[IndexLanguage],nMsgDel[IndexLanguage],
                        mtInformation,mbOKCancel,IndexLanguage)<>mrOk then
    Exit;

      try
        StoredProc.Transaction.StartTransaction;
        StoredProc.StoredProcName:='PUB_JN_FAK_SPEC_DEL';
        StoredProc.Prepare;
        StoredProc.ParamByName('ID_JN_FAK_SPEC').AsInt64:=DSetMain['ID_JN_FAK_SPEC'];
        StoredProc.ExecProc;
        StoredProc.Transaction.Commit;
        RefreshDSets;
      except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                        nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
             StoredProc.Transaction.Rollback;
          end;
      end;
end;

procedure TfrmJnFakSpec.ExitAExecute(Sender: TObject);
begin
  Close;
end;

end.
