unit uComments;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCalendar, Placemnt,
  ActnList, cxGridTableView, ImgList, dxBar, dxBarExtItems, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxStatusBar, IBase, DM, cnConsts, cn_Common_Funcs,
  cn_Common_Messages;

type
  Tfrm_comments = class(TForm)
    StatusBar: TdxStatusBar;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    Comment: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    Search_BarEdit: TdxBarEdit;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    Contracts_ActionList: TActionList;
    FilterAction: TAction;
    CnFormStorage: TFormStorage;
    Date_comment: TcxGridDBColumn;
    ins_act: TAction;
    upd_act: TAction;
    del_act: TAction;
    ref_act: TAction;
    exit_act: TAction;
    procedure exit_actExecute(Sender: TObject);
    procedure ins_actExecute(Sender: TObject);
    procedure upd_actExecute(Sender: TObject);
    procedure del_actExecute(Sender: TObject);
    procedure ref_actExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormIniLanguage;
  private
    { Private declarations }
  public
    is_admin: Boolean;
    PLanguageIndex : Byte;
    id_dog, id_stud :int64;
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;is_admin:boolean;id_dog,id_stud:int64);reintroduce;
  end;

var
  frm_comments: Tfrm_comments;
  DM: TDM_Contracts;

implementation

uses uComments_AE;
{$R *.dfm}

constructor Tfrm_comments.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;is_admin:boolean;id_dog,id_stud:int64);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  self.id_dog  := id_dog;
  self.id_stud := id_stud;
  DM:=TDM_Contracts.Create(Self);
  DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_DOG_COMMENT_SEL(:id_dog,:id_stud)';
  DM.DataSet.ParamByName('id_dog').AsInt64:=id_dog;
  DM.DataSet.ParamByName('id_stud').AsInt64:=id_stud;
  DM.DB.Handle:=DB_Handle;
  DM.DataSet.Open;
  DM.DataSet.FetchAll;
  GridDBView.DataController.DataSource := DM.DataSource;
  FormIniLanguage();
  Self.Is_admin:=is_admin;
  Screen.Cursor:=crDefault;
  CnFormStorage.RestoreFormPlacement;
end;

procedure Tfrm_comments.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 //Caption:=                      cnConsts.cn_Main_SpSpec[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

 Search_BarEdit.Caption :=      cnConsts.cn_SearchBtn_Caption[PLanguageIndex];

  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

end;

procedure Tfrm_comments.exit_actExecute(Sender: TObject);
begin
 close;
end;

procedure Tfrm_comments.ins_actExecute(Sender: TObject);
var
  T:Tfrm_comments_ae;
  New_id_Locator: integer;
begin
  T:=Tfrm_comments_ae.create(self, PLanguageIndex);
  T.ShowModal;
  If T.ModalResult=mrOk then
   Begin
    DM.WriteTransaction.StartTransaction;
    DM.StProc.StoredProcName := 'CN_DT_DOG_COMMENT_INS';
    DM.StProc.Prepare;
    DM.StProc.ParamByName('id_dog').Asint64      := Id_dog;
    DM.StProc.ParamByName('id_stud').Asint64     := Id_stud;
    DM.StProc.ParamByName('date_comment').Asdate := date;
    DM.StProc.ParamByName('comment').AsString    := T.Memo1.Text;
    DM.StProc.ExecProc;
    New_id_Locator:=DM.StProc.ParamByName('id_dog_comment').AsInt64;
    try
     DM.WriteTransaction.Commit;
     except
      on E:Exception do
       begin
        cnShowMessage('Error',e.Message,mtError,[mbOK]);
        DM.WriteTransaction.Rollback;
       end;
    end;
    DM.DataSet.CloseOpen(True);
    DM.DataSet.Locate('id_dog_comment',New_id_Locator,[] );
   End;
  T.Free;
end;

procedure Tfrm_comments.upd_actExecute(Sender: TObject);
var
  T:Tfrm_comments_ae;
  New_id_Locator: integer;
begin
  if GridDBView.DataController.RecordCount=0 then exit;
  T:=Tfrm_comments_ae.create(self, PLanguageIndex);
  T.Memo1.Text:= Dm.Dataset['comment'];
  T.ShowModal;
  If T.ModalResult=mrOk then
   Begin
    DM.WriteTransaction.StartTransaction;
    DM.StProc.StoredProcName := 'CN_DT_DOG_COMMENT_UPD';
    DM.StProc.Prepare;
    DM.StProc.ParamByName('id_dog_comment').Asint64      := Dm.Dataset['id_dog_comment'];
    DM.StProc.ParamByName('id_dog').Asint64      := Id_dog;
    DM.StProc.ParamByName('id_stud').Asint64     := Id_stud;
    DM.StProc.ParamByName('date_comment').Asdate := date;
    DM.StProc.ParamByName('comment').AsString    := T.Memo1.Text;
    DM.StProc.ExecProc;
    New_id_Locator:=DM.StProc.ParamByName('id_dog_comment').AsInt64;
    try
     DM.WriteTransaction.Commit;
     except
      on E:Exception do
       begin
        cnShowMessage('Error',e.Message,mtError,[mbOK]);
        DM.WriteTransaction.Rollback;
       end;
    end;
    DM.DataSet.CloseOpen(True);
    DM.DataSet.Locate('id_dog_comment',New_id_Locator,[] );
   End;
  T.Free;
end;

procedure Tfrm_comments.del_actExecute(Sender: TObject);
var
 i:byte;
begin
  if GridDBView.DataController.RecordCount=0 then exit;
  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;
  DM.WriteTransaction.StartTransaction;
  DM.StProc.StoredProcName := 'CN_DT_DOG_COMMENT_DEL';
  DM.StProc.Prepare;
  DM.StProc.ParamByName('id_dog_comment').Asint64      := Dm.Dataset['id_dog_comment'];;
  DM.StProc.ExecProc;
  try
   DM.WriteTransaction.Commit;
   except
    on E:Exception do
     begin
      cnShowMessage('Error',e.Message,mtError,[mbOK]);
      DM.WriteTransaction.Rollback;
     end;
  end;
  DM.DataSet.CloseOpen(True);
end;

procedure Tfrm_comments.ref_actExecute(Sender: TObject);
var
  id_Locator : Int64;
begin
  IF GridDBView.DataController.RecordCount=0 then exit;
  Screen.Cursor := crHourGlass;
  id_Locator    :=  DM.DataSet['id_dog_comment'];
  DM.DataSet.CloseOpen(True);
  DM.DataSet.Locate('id_dog_comment', id_Locator ,[] );
  Screen.Cursor := crDefault;
end;

procedure Tfrm_comments.FormClose(Sender: TObject;
var
  Action: TCloseAction);
begin
  CnFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild then action:=caFree
  else
  DM.Free;
end;

procedure Tfrm_comments.FormShow(Sender: TObject);
begin
  if FormStyle = fsMDIChild then
   begin
    SelectButton.Visible:=ivNever;
    GridDBView.OptionsSelection.MultiSelect:= False;
   end;
end;

end.
