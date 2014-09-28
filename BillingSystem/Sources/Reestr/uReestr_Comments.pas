//******************************************************************************
//* Проект "Горводоканал"                                                      *
//* Форма коментариев к договорам                                              *
//* Выполнил: Перчак А.Л. 2010г                                                *
//******************************************************************************
unit uReestr_Comments;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCalendar, Placemnt,
  ActnList, cxGridTableView, ImgList, dxBar, dxBarExtItems, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxStatusBar, IBase, uReestr_DM, uConsts, uCommon_Funcs,
  uCommon_Messages, uReestr_Comments_AE;

type
  Tfrm_comments = class(TForm)
    StatusBar: TdxStatusBar;
    Grid_Comment: TcxGrid;
    Grid_CommentDBView: TcxGridDBTableView;
    Comment: TcxGridDBColumn;
    Grid_CommentLevel: TcxGridLevel;
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
    FormStorage: TFormStorage;
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
    procedure FormIniLanguage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    DM : TfrmReestr_DM;
  public
    is_admin: Boolean;
    PLanguageIndex : Byte;
    id_dog :int64;
    aHandle : TISC_DB_HANDLE;
  end;

var
  frm_comments: Tfrm_comments;


implementation

{$R *.dfm}

procedure Tfrm_comments.FormIniLanguage;
begin
  PLanguageIndex:=           uCommon_Funcs.bsLanguageIndex();

  //кэпшн формы
  Caption:=                      uConsts.bs_CommentDiss[PLanguageIndex];

  //названия кнопок
  AddButton.Caption :=           uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  EditButton.Caption :=          uConsts.bs_EditBtn_Caption[PLanguageIndex];
  DeleteButton.Caption :=        uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  RefreshButton.Caption :=       uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  SelectButton.Caption :=        uConsts.bs_SelectBtn_Caption[PLanguageIndex];
  ExitButton.Caption :=          uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  Date_comment.Caption :=        uConsts.bs_DateOrd[PLanguageIndex];
  Comment.Caption :=             uConsts.bs_CommentDiss[PLanguageIndex];

  Search_BarEdit.Caption :=      uConsts.bs_SearchBtn_Caption[PLanguageIndex];

  //статусбар
  StatusBar.Panels[0].Text:=  uConsts.bs_InsertBtn_ShortCut[PLanguageIndex]  + uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  StatusBar.Panels[1].Text:=  uConsts.bs_EditBtn_ShortCut[PLanguageIndex]    + uConsts.bs_EditBtn_Caption[PLanguageIndex];
  StatusBar.Panels[2].Text:=  uConsts.bs_DeleteBtn_ShortCut[PLanguageIndex]  + uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  StatusBar.Panels[3].Text:=  uConsts.bs_RefreshBtn_ShortCut[PLanguageIndex] + uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  StatusBar.Panels[4].Text:=  uConsts.bs_ExitBtn_ShortCut[PLanguageIndex]    + uConsts.bs_ExitBtn_Caption[PLanguageIndex];
end;

procedure Tfrm_comments.exit_actExecute(Sender: TObject);
begin
  close;
end;

procedure Tfrm_comments.ins_actExecute(Sender: TObject);
var
  ViewForm : Tfrm_comments_ae;
  New_id_Locator : integer;
begin
  ViewForm := Tfrm_comments_ae.create(self, PLanguageIndex);

  ViewForm.ShowModal;
  If ViewForm.ModalResult=mrOk then
   Begin
    DM.WriteTransaction.StartTransaction;
    DM.StProc.StoredProcName := 'bs_DT_DOG_COMMENTS_INS';
    DM.StProc.Prepare;
    DM.StProc.ParamByName('id_dog').Asint64      := Id_dog;
    DM.StProc.ParamByName('date_comment').Asdate := date;
    DM.StProc.ParamByName('comment_text').AsString    := ViewForm.Memo1.Text;
    DM.StProc.ExecProc;
    try
     DM.WriteTransaction.Commit;
     New_id_Locator:=DM.StProc.ParamByName('id_dog_comments').AsInt64;
     except
      on E:Exception do
       begin
        LogException;
        bsShowMessage('Error',e.Message,mtError,[mbOK]);
        DM.WriteTransaction.Rollback;
       end;
    end;
    DM.DataSet.CloseOpen(True);
    DM.DataSet.Locate('id_dog_comments',New_id_Locator,[] );
   End;
  ViewForm.Free;
end;

procedure Tfrm_comments.upd_actExecute(Sender: TObject);
var
  ViewForm : Tfrm_comments_ae;
  New_id_Locator : integer;
begin
  if Grid_CommentDBView.DataController.RecordCount=0 then exit;

  ViewForm := Tfrm_comments_ae.create(self, PLanguageIndex);
  ViewForm.Memo1.Text:= Dm.Dataset['comment_text'];
  ViewForm.ShowModal;
  If ViewForm.ModalResult=mrOk then
   Begin
    DM.WriteTransaction.StartTransaction;
    DM.StProc.StoredProcName := 'bs_DT_DOG_COMMENTS_UPD';
    DM.StProc.Prepare;
    DM.StProc.ParamByName('id_dog_comments').Asint64      := Dm.Dataset['id_dog_comments'];
    DM.StProc.ParamByName('id_dog').Asint64      := Id_dog;
    DM.StProc.ParamByName('date_comment').Asdate := date;
    DM.StProc.ParamByName('comment_text').AsString    := ViewForm.Memo1.Text;
    DM.StProc.ExecProc;
    try
     DM.WriteTransaction.Commit;
     New_id_Locator:=DM.StProc.ParamByName('id_dog_comments').AsInt64;
     except
      on E:Exception do
       begin
        LogException;
        bsShowMessage('Error',e.Message,mtError,[mbOK]);
        DM.WriteTransaction.Rollback;
       end;
    end;
    DM.DataSet.CloseOpen(True);
    DM.DataSet.Locate('id_dog_comments',New_id_Locator,[] );
   End;
  ViewForm.Free;
end;

procedure Tfrm_comments.del_actExecute(Sender: TObject);
var
 i:byte;
begin
  if Grid_CommentDBView.DataController.RecordCount=0 then exit;
  
  i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts.bs_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  DM.WriteTransaction.StartTransaction;
  DM.StProc.StoredProcName := 'bs_DT_DOG_COMMENTS_DEL';
  DM.StProc.Prepare;
  DM.StProc.ParamByName('id_dog_comments').Asint64      := Dm.Dataset['id_dog_comments'];;
  DM.StProc.ExecProc;
  try
   DM.WriteTransaction.Commit;
   except
    on E:Exception do
     begin
      LogException;
      bsShowMessage('Error',e.Message,mtError,[mbOK]);
      DM.WriteTransaction.Rollback;
     end;
  end;
  DM.DataSet.CloseOpen(True);
end;

procedure Tfrm_comments.ref_actExecute(Sender: TObject);
var
  id_Locator : Int64;
begin
{  IF GridDBView.DataController.RecordCount=0 then exit;
  Screen.Cursor := crHourGlass;
  id_Locator    :=  DM.DataSet['id_dog_comment'];
  DM.DataSet.CloseOpen(True);
  DM.DataSet.Locate('id_dog_comment', id_Locator ,[] );
  Screen.Cursor := crDefault;}
end;

procedure Tfrm_comments.FormClose(Sender: TObject;
var
  Action: TCloseAction);
begin
  FormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild then action:=caFree;
  Dm.Free;
end;

procedure Tfrm_comments.FormCreate(Sender: TObject);
begin
  FormStorage.RestoreFormPlacement;
  FormIniLanguage;
end;

procedure Tfrm_comments.FormShow(Sender: TObject);
begin
  Dm := TfrmReestr_DM.Create(Self);
  DM.DB.Handle := aHandle;
  DM.DB.Connected := True;
  DM.ReadTransaction.StartTransaction;
  Grid_CommentDBView.DataController.DataSource := DM.DataSource;

  DM.DataSet.Close;
  DM.DataSet.SQLs.SelectSQL.Text := 'Select * From bs_dt_dog_comments_sel(:id_dog)';
  DM.DataSet.ParamByName('ID_DOG').AsInt64 := id_dog;
  DM.DataSet.Open;
end;

end.

