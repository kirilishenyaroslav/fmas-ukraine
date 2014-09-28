unit BsGroupObj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, DB, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxControls, cxInplaceContainer,
  cxTLData, cxDBTL, dxBar, dxBarExtItems, ActnList, cxMaskEdit, ImgList,
  cxClasses, cxGridTableView, BsGroupObjEdit, uCommon_Types, FIBQuery,
  pFIBQuery, pFIBStoredProc, ExtCtrls, DateUtils, cxTextEdit, cxDBEdit,
  cxContainer, cxEdit, cxLabel, uCommon_Messages, basetypes, uCommon_Funcs,
  uConsts;

type
  TfrmGroupObject = class(TForm)
    ObjectsList: TcxDBTreeList;
    ObjectDB: TpFIBDatabase;
    ObjectsDSet: TpFIBDataSet;
    ObjectTransRead: TpFIBTransaction;
    ObjectTransWrite: TpFIBTransaction;
    ObjectsSource: TDataSource;
    barManager: TdxBarManager;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    btnRefresh: TdxBarLargeButton;
    btnSelect: TdxBarLargeButton;
    btnExit: TdxBarLargeButton;
    ActionList1: TActionList;
    ActIns: TAction;
    ActEdit: TAction;
    ActDel: TAction;
    ActRefresh: TAction;
    ActSelect: TAction;
    ActExit: TAction;
    ObjctsList_Id_Gr_List_Obj: TcxDBTreeListColumn;
    ObjctsList_Id_Pgr_List_Obj: TcxDBTreeListColumn;
    ObjctsList_Name_Gr_List_Obj: TcxDBTreeListColumn;
    ObjctsList_Note_Gr_List_Obj: TcxDBTreeListColumn;
    ObjctsList_Id_Type_Gr_List_Obj: TcxDBTreeListColumn;
    StyleRepository: TcxStyleRepository;
    ImageList: TImageList;
    StoredProc: TpFIBStoredProc;
    ObjctsList_Kod_Obj: TcxDBTreeListColumn;
    pnlBottom: TPanel;
    lblComment: TcxLabel;
    CommentEdit: TcxDBTextEdit;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    procedure ActInsExecute(Sender: TObject);
    procedure ActRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActExitExecute(Sender: TObject);
    procedure ActEditExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure ActSelectExecute(Sender: TObject);
    procedure ObjectsListDblClick(Sender: TObject);
  private
    SqlText:string;
    HtKey:TbsShortCut;
    BIniLanguage:Byte;
    procedure GotoBookMark(Value:Integer);
  public
    { Public declarations }
    res : Variant;
    constructor  Create(AParameter:TBsSimpleParams);reintroduce;
    procedure ObjectDSetCloseOpen;
  end;

var
  frmGroupObject: TfrmGroupObject;

implementation

{$R *.dfm}

constructor TfrmGroupObject.Create(AParameter:TBsSimpleParams);
begin
   inherited Create(AParameter.Owner);
   CommentEdit.Text:='';
   ObjectDB.Handle:=AParameter.Db_Handle;
   if AParameter.FormStyle=fsMDIChild then
   begin
      SqlText:='SELECT DISTINCT * FROM BS_NAME_GR_LIST_OBJ_SEL';
      btnSelect.Visible:=ivNever;
   end
   else SqlText:='SELECT DISTINCT * FROM BS_NAME_GR_LIST_NODE_SEL('+IntToStr(AParameter.ID_Locate)+')';
   ObjectDSetCloseOpen;
   HtKey:=LoadShortCut(ObjectDB.Handle, Self);
   ActIns.ShortCut:=HtKey.Add;
   ActEdit.ShortCut:=HtKey.Edit;
   ActDel.ShortCut:=HtKey.Del;
   ActRefresh.ShortCut:=HtKey.Refresh;
   ActSelect.ShortCut:=HtKey.Choice;
   ActExit.ShortCut:=HtKey.Close;
   BIniLanguage:=uCommon_Funcs.bsLanguageIndex();
   ActIns.Caption:=uConsts.bs_InsertBtn_Caption[BIniLanguage];
   ActEdit.Caption:=uConsts.bs_EditBtn_Caption[BIniLanguage];
   ActDel.Caption:=uConsts.bs_DeleteBtn_Caption[BIniLanguage];
   ActSelect.Caption:=uConsts.bs_SelectBtn_Caption[BIniLanguage];
   ActExit.Caption:=uConsts.bs_ExitBtn_Caption[BIniLanguage];
end;

procedure TfrmGroupObject.ActInsExecute(Sender: TObject);
var frm:TfrmGroupObjEdit;
    RetId:Integer;
begin
   frm:=TfrmGroupObjEdit.Create(Self, ObjectsDSet['Id_Gr_List_Obj'], ObjectsDSet['Id_Pgr_List_Obj'], 'Add');
   frm.Caption:='Додати';
   if frm.ShowModal=mrOk then
   begin
      StoredProc.StoredProcName:='BS_NAME_GR_LIST_OBJ_INS';
      StoredProc.Transaction.StartTransaction;
      StoredProc.Prepare;
      StoredProc.ParamByName('Id_Pgr_List_Obj').AsInt64:=frm.UpperNode;
      StoredProc.ParamByName('Name_Gr_List_Obj').AsString:=frm.NameObjEdit.Text;
      StoredProc.ParamByName('Note_Gr_List_Obj').AsString:=frm.NameComment.Text;
      StoredProc.ParamByName('Kod_Obj').AsInteger:=StrToInt(frm.KodEdit.Text);
      StoredProc.ParamByName('Id_Type_Gr_List_Obj').AsInteger:=1;
      try
        StoredProc.ExecProc;
        RetId:=StoredProc.FieldByName('Ret_Value').AsInteger;
        StoredProc.Transaction.Commit;
      except on E:Exception do
             begin
                ShowMessage(E.Message);
                StoredProc.Transaction.Rollback;
             end;
      end;
      ObjectDSetCloseOpen;
   end;
   frm.Free;
   ObjectsDSet.Locate('Id_Gr_List_Obj', RetId, []);
end;


procedure TfrmGroupObject.ObjectDSetCloseOpen;
begin
   ObjectsDSet.Close;
   ObjectsDSet.SQLs.SelectSQL.Text:=SqlText;
   ObjectsDSet.Open;
end;

procedure TfrmGroupObject.ActRefreshExecute(Sender: TObject);
begin
   ObjectDSetCloseOpen;
end;

procedure TfrmGroupObject.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then action:=caFree
end;

procedure TfrmGroupObject.ActExitExecute(Sender: TObject);
begin
   Close;
end;

procedure TfrmGroupObject.ActEditExecute(Sender: TObject);
var frm:TfrmGroupObjEdit;
begin
   if ObjectsDSet.IsEmpty then Exit;
   frm:=TfrmGroupObjEdit.Create(Self, ObjectsDSet['Id_Gr_List_Obj'], ObjectsDSet['Id_Pgr_List_Obj'], 'Edit');
   frm.Caption:='Змінити';
   if (not VarIsNull(ObjectsDSet['Name_Gr_List_Obj'])) then frm.NameObjEdit.Text:=ObjectsDSet['Name_Gr_List_Obj'];
   if (not VarIsNull(ObjectsDSet['Note_Gr_List_Obj'])) then frm.NameComment.Text:=ObjectsDSet['Note_Gr_List_Obj'];
   frm.KodEdit.Text:=IntToStr(ObjectsDSet['Kod_Obj']);
   if frm.ShowModal=mrOk then
   begin
      StoredProc.StoredProcName:='BS_NAME_GR_LIST_OBJ_UPD';
      StoredProc.Transaction.StartTransaction;
      StoredProc.Prepare;
      StoredProc.ParamByName('Id_Gr_List_Obj').AsInt64:=frm.CurrentNode;
      StoredProc.ParamByName('Id_Pgr_List_Obj').AsInt64:=frm.UpperNode;
      StoredProc.ParamByName('Name_Gr_List_Obj').AsString:=frm.NameObjEdit.Text;
      StoredProc.ParamByName('Note_Gr_List_Obj').AsString:=frm.NameComment.Text;
      StoredProc.ParamByName('Id_Type_Gr_List_Obj').AsInteger:=ObjectsDSet['Id_Type_Gr_List_Obj'];
      StoredProc.ParamByName('Kod_Obj').AsInteger:=StrToInt(frm.KodEdit.Text);
      try
        StoredProc.ExecProc;
        StoredProc.Transaction.Commit;
      except on E:Exception do
             begin
                ShowMessage(E.Message);
                StoredProc.Transaction.Rollback;
             end;
      end;
      ObjectDSetCloseOpen;
   end;
   frm.Free;
   ObjectsDSet.Locate('Id_Gr_List_Obj', frm.CurrentNode, []);
end;

procedure TfrmGroupObject.ActDelExecute(Sender: TObject);
var s:string;
    Id:Integer;
begin
   if ObjectsDSet.IsEmpty then Exit;
   if (agMessageDlg('Увага!', 'Ви дійсно бажаєте видалити цей запис?', mtConfirmation ,[mbYes, mbNo])=mrYes) then
   begin
      Id:=ObjectsDSet['Id_Pgr_List_Obj'];
      StoredProc.StoredProcName:='BS_NAME_GR_LIST_OBJ_DEL';
      StoredProc.Transaction.StartTransaction;
      StoredProc.Prepare;
      StoredProc.ParamByName('Id_Gr_List_Obj').AsInt64:=ObjectsDSet['Id_Gr_List_Obj'];
      try
        StoredProc.ExecProc;
        s:=StoredProc.FieldByName('Is_Error').AsString;
        if s='F' then StoredProc.Transaction.Commit
        else
        begin
           ShowMessage(StoredProc.FieldByName('Out_Msg').AsString);
           StoredProc.Transaction.Rollback;
        end;
     except on E:Exception do
            begin
               ShowMessage(E.Message);
               StoredProc.Transaction.Rollback;
            end;
     end;
   end;
   ObjectDSetCloseOpen;
   GotoBookMark(Id);
end;

procedure TfrmGroupObject.ActSelectExecute(Sender: TObject);
begin
   if not ObjectsDSet.IsEmpty then
   begin
     res:=VarArrayCreate([0, 2], varVariant);
     res[0] := ObjectsDSet['Id_Gr_List_Obj'];
     res[1] := ObjectsDSet['Name_Gr_List_Obj'];
     res[2] := ObjectsDSet['Kod_Obj'];
     ModalResult:=mrOk;
   end;
end;

procedure TfrmGroupObject.ObjectsListDblClick(Sender: TObject);
begin
   ActSelectExecute(Sender);
end;

procedure TfrmGroupObject.GotoBookMark(Value:Integer);
var i:SmallInt;
    Parent, Node:TcxTreeListNode;
begin
   for i:=0 to ObjectsList.Nodes.TreeList.Count-1 do
   begin
      if ObjectsList.Nodes.Items[i].Values[1]=Value then
      begin
         Parent:=ObjectsList.Nodes[i];
         Break;
      end;
   end;
   try
     Node:=Parent.GetFirstChild;
     if not varIsNull(Node.Values[0]) then ObjectsDSet.Locate('Id_Gr_List_Obj', Node.Values[0], []);
   except
       ObjectsDSet.Locate('Id_Gr_List_Obj', Value, []);
   end;  
end;

end.
