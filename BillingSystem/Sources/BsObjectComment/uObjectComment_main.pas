//******************************************************************************
// Проект "Биллинговая система"
// Реестр замечаний по лицевому счету
//
// последние изменения
//******************************************************************************

unit uObjectComment_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCommon_Funcs, uConsts, uCommon_Messages, uConsts_Messages, uCommon_Types,
  cxTimeEdit, AccMGMT, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, Placemnt, Menus, cxGridTableView,
  ImgList, dxBar, dxBarExtItems, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxStatusBar, ActnList, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDataSet, pFIBDataSet, cxContainer, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, ExtCtrls, cxLabel, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMemo, cxLookAndFeelPainters,
  cxButtons;

const
   MainPanelHeight=310;
   pnlGridHeight=122;

type
  frmButton = (fbAdd, fbEdit, fbDelete, fbSelect, fbExit, fbFilter, fbClear, fbRedo, fbUndo, fbOk, fbCancel);
  frmButtons = set of frmButton;

  TfrmObjectComment = class(TForm)
    CommentGrid: TcxGrid;
    CommentGridDBView: TcxGridDBTableView;
    ColumnDateCreate: TcxGridDBColumn;
    CommentGridLevel: TcxGridLevel;
    BarManager: TdxBarManager;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    btnExit: TdxBarLargeButton;
    btnSelect: TdxBarLargeButton;
    LargeImages: TImageList;
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
    DocTypeActionList: TActionList;
    ActIns: TAction;
    ActEdit: TAction;
    ActClose: TAction;
    ActDel: TAction;
    ActRefresh: TAction;
    ActSelect: TAction;
    DB: TpFIBDatabase;
    FilterSet: TpFIBDataSet;
    StorProc: TpFIBStoredProc;
    WirteTrans: TpFIBTransaction;
    ReadTrans: TpFIBTransaction;
    FilterDS: TDataSource;
    ConstDSet: TpFIBDataSet;
    ColumnPriority: TcxGridDBColumn;
    ColumnType: TcxGridDBColumn;
    MainPanel: TPanel;
    DateBeg: TcxDateEdit;
    GridPanel: TPanel;
    lblKeyField: TcxLabel;
    lblTypeObject: TcxLabel;
    PeriodBox: TGroupBox;
    lblBeg: TcxLabel;
    lblEnd: TcxLabel;
    DateEnd: TcxDateEdit;
    KeyFieldEdit: TcxTextEdit;
    TypeObjectBox: TcxLookupComboBox;
    lblStatus: TcxLabel;
    lblPriority: TcxLabel;
    lblType: TcxLabel;
    lblUser: TcxLabel;
    UserBox: TcxLookupComboBox;
    lblDateCreate: TcxLabel;
    DateCreate: TcxDateEdit;
    lblNote: TcxLabel;
    NoteEdit: TcxMemo;
    Panel3: TPanel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    btnFilter: TdxBarLargeButton;
    btnClear: TdxBarLargeButton;
    btnRedo: TdxBarLargeButton;
    btnUndo: TdxBarLargeButton;
    UserDS: TDataSource;
    UserDSet: TpFIBDataSet;
    TypeObjectDSet: TpFIBDataSet;
    TypeObjectDS: TDataSource;
    Panel1: TPanel;
    StatusDSet: TpFIBDataSet;
    PriorityDSet: TpFIBDataSet;
    TypeDSet: TpFIBDataSet;
    StatusDS: TDataSource;
    PriorityDS: TDataSource;
    TypeDS: TDataSource;
    StatusBox: TcxLookupComboBox;
    PriorityBox: TcxLookupComboBox;
    TypeBox: TcxLookupComboBox;
    lblKeySign: TcxLabel;
    lblObjectSign: TcxLabel;
    lblStatusSign: TcxLabel;
    lblPrioritySign: TcxLabel;
    lblTypeSign: TcxLabel;
    lblUserSign: TcxLabel;
    SignMenu: TPopupMenu;
    smEqual: TMenuItem;
    smLessEqual: TMenuItem;
    smLess: TMenuItem;
    smMore: TMenuItem;
    smMoreEqual: TMenuItem;
    smNotEqual: TMenuItem;
    ActClear: TAction;
    ActFilter: TAction;
    EditMenu: TdxBarPopupMenu;
    btnEditStatus: TdxBarLargeButton;
    btnEditComment: TdxBarLargeButton;
    ColumnUser: TcxGridDBColumn;
    ColumnStatus: TcxGridDBColumn;
    ColumnPeriodBeg: TcxGridDBColumn;
    ColumnPeriodEnd: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CommentGridDBViewDblClick(Sender: TObject);
    procedure ActInsExecute(Sender: TObject);
    procedure ActEditExecute(Sender: TObject);
    procedure ActSelectExecute(Sender: TObject);
    procedure ActCloseExecute(Sender: TObject);
    procedure UserBoxPropertiesInitPopup(Sender: TObject);
    procedure TypeObjectBoxPropertiesInitPopup(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure smEqualClick(Sender: TObject);
    procedure smLessEqualClick(Sender: TObject);
    procedure smLessClick(Sender: TObject);
    procedure smMoreClick(Sender: TObject);
    procedure smMoreEqualClick(Sender: TObject);
    procedure smNotEqualClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure ActClearExecute(Sender: TObject);
    procedure ActFilterExecute(Sender: TObject);
    procedure btnEditStatusClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FilterSetEndScroll(DataSet: TDataSet);
  private
    PLanguageIndex: byte;
    isShowGrid:Boolean;
    TypeEdit:Byte;
    frmHeight:SmallInt;
    procedure FormIniLanguage;
    function UserDSetCloseOpen:Boolean;
    function TypeObjectDSetCloseOpen:Boolean;
    function StatusDSetCloseOpen:Boolean;
    function PriorityDSetCloseOpen:Boolean;
    function TypeDSetCloseOpen:Boolean;
    function SaveData:Boolean;
    procedure BtnEnabled(btn:frmButtons);
    function CommentIns:Boolean;
    function CommentUpd:Boolean;
    function CommentStatusUpd:Boolean;
  public
    res:Variant;
    Is_admin:Boolean;
    constructor  Create(AParameter:TbsSimpleParams);reintroduce;
  end;


  {frmDocumentType_main: TfrmDocumentType_main;  }

implementation


{$R *.dfm}


constructor TfrmObjectComment.Create(AParameter:TbsSimpleParams);
begin
   Screen.Cursor:=crHourGlass;
   inherited Create(AParameter.Owner);
   frmHeight:=Self.Height-pnlGridHeight;
   Self.Height:=frmHeight;
   self.Is_admin := AParameter.is_admin;
   DB.Handle := AParameter.Db_Handle;
   FormIniLanguage;
   Screen.Cursor:=crDefault;
   if ConstDSet.Active then ConstDSet.Close;
   ConstDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CONSTS';
   ConstDSet.Open;
   UserDSetCloseOpen;
   TypeObjectDSetCloseOpen;
   KeyFieldEdit.Text:=IntToStr(AParameter.ID_Locate);
   TypeObjectBox.EditValue:=AParameter.ID_Locate_1;
   StatusDSetCloseOpen;
   PriorityDSetCloseOpen;
   TypeDSetCloseOpen;
   NoteEdit.Text:='';
   BsSetKeyBoardLanguage('U');
   isShowGrid:=False;
   GridPanel.Height:=0;
   ActFilterExecute(Self);
end;



procedure TfrmObjectComment.FormIniLanguage;
begin
    PLanguageIndex:= uCommon_Funcs.bsLanguageIndex();
   //названия кнопок
   ActIns.Caption := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
   ActEdit.Caption := uConsts.bs_EditBtn_Caption[PLanguageIndex];
   ActDel.Caption := uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
   ActRefresh.Caption := uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
   ActSelect.Caption := uConsts.bs_SelectBtn_Caption[PLanguageIndex];
   ActClose.Caption := uConsts.bs_ExitBtn_Caption[PLanguageIndex];
   btnOk.Caption:=uConsts.bs_Accept[PLanguageIndex];
   btnCancel.Caption:=uConsts.bs_Cancel[PLanguageIndex];
   btnFilter.Caption:=uConsts.bs_FilterBtn_Caption[PLanguageIndex];
end;

function TfrmObjectComment.UserDSetCloseOpen:Boolean;
begin
   if UserDSet.Active then UserDSet.Close;
   UserDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_USER_FILTER(:FILTER_STR)';
   UserDSet.ParamByName('FILTER_STR').AsString:='';
   UserDSet.Open;
   Result:=not UserDSet.IsEmpty;
end;

function TfrmObjectComment.TypeObjectDSetCloseOpen:Boolean;
begin
   if TypeObjectDSet.Active then TypeObjectDSet.Close;
   TypeObjectDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_TYPE_OBJECT_SEL';
   TypeObjectDSet.Open;
   Result:=not TypeObjectDSet.IsEmpty;
end;

function TfrmObjectComment.StatusDSetCloseOpen:Boolean;
begin
   if StatusDSet.Active then StatusDSet.Close;
   StatusDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_STATUS_COMMENT_SEL';
   StatusDSet.Open;
   Result:=not StatusDSet.IsEmpty;
end;

function TfrmObjectComment.PriorityDSetCloseOpen:Boolean;
begin
   if PriorityDSet.Active then PriorityDSet.Close;
   PriorityDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_PRIORITY_COMMENT_SEL';
   PriorityDSet.Open;
   Result:=not PriorityDSet.IsEmpty;
end;

function TfrmObjectComment.TypeDSetCloseOpen:Boolean;
begin
   if TypeDSet.Active then TypeDSet.Close;
   TypeDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_TYPE_COMMENT_SEL';
   TypeDSet.Open;
   Result:=not TypeDSet.IsEmpty;
end;

function TfrmObjectComment.SaveData:Boolean;
begin
   Result:=True;

   if DateBeg.Text='' then
   begin
      Result:=False;
      DateBeg.Style.Color:=uConsts.BsClFieldIsEmpty;
   end;

   if PriorityBox.EditText='' then
   begin
      Result:=False;
      PriorityBox.Style.Color:=uConsts.BsClFieldIsEmpty;
   end;

   if TypeBox.EditText='' then
   begin
      Result:=False;
      TypeBox.Style.Color:=uConsts.BsClFieldIsEmpty;
   end;

   if NoteEdit.Text='' then
   begin
      Result:=False;
      NoteEdit.Style.Color:=uConsts.BsClFieldIsEmpty;
   end;

   if not Result then bsShowMessage(Application.Title, 'Були заповнені не всі необхідні поля!', mtInformation, [mbOK]);
end;

procedure TfrmObjectComment.BtnEnabled(btn:frmButtons);
begin
   btnAdd.Enabled:=fbAdd in btn;
   btnEdit.Enabled:=fbEdit in btn;
   btnDel.Enabled:=fbDelete in btn;
   btnSelect.Enabled:=fbSelect in btn;
   btnOk.Visible:=fbOk in btn;
   btnCancel.Visible:=fbCancel in btn;
   btnFilter.Enabled:=fbFilter in btn;
   btnClear.Enabled:=fbClear in btn;
   btnRedo.Enabled:=fbRedo in btn;
   btnUndo.Enabled:=fbUndo in btn;
   btnExit.Enabled:=fbExit in btn;
   UserBox.Enabled:=not btnOk.Visible;
   DateCreate.Enabled:=not btnOk.Visible;
   StatusBox.Enabled:=not btnOk.Visible;
   case TypeEdit of
      0: begin
            btnFilter.LargeImageIndex:=0;
            StatusBox.EditValue:=1;
         end;
      1: begin
            btnFilter.LargeImageIndex:=1;
            KeyFieldEdit.Enabled:=False;
            TypeObjectBox.Enabled:=False;
         end;
      2: begin
            btnFilter.LargeImageIndex:=1;
            DateBeg.Enabled:=False;
            DateEnd.Enabled:=False;
            StatusBox.Enabled:=True;
            KeyFieldEdit.Enabled:=False;
            TypeObjectBox.Enabled:=False;
            PriorityBox.Enabled:=False;
            TypeBox.Enabled:=False;
            NoteEdit.Enabled:=False;
         end;
      3: begin
            btnFilter.LargeImageIndex:=9;
            StatusBox.Enabled:=True;
            if Self.FormStyle=fsMDIChild then
            begin
               KeyFieldEdit.Enabled:=True;
               TypeObjectBox.Enabled:=True;
            end;   
            DateCreate.Enabled:=True;
            PriorityBox.Enabled:=True;
            DateBeg.Enabled:=True;
            DateEnd.Enabled:=True;
            TypeBox.Enabled:=True;
            UserBox.Enabled:=True;
            NoteEdit.Enabled:=True;
         end;
   end;
end;

function TfrmObjectComment.CommentIns:Boolean;
begin
   StorProc.Transaction.StartTransaction;
   StorProc.StoredProcName:='BS_OBJECT_COMMENT_INS';
   StorProc.Prepare;
   StorProc.ParamByName('ID_TYPE_OBJECT').AsInteger:=TypeObjectBox.EditValue;
   StorProc.ParamByName('KEY_FIELD').AsInteger:=StrToInt(KeyFieldEdit.Text);
   StorProc.ParamByName('PERIOD_BEG').AsDate:=DateBeg.Date;
   if DateEnd.Text='' then StorProc.ParamByName('PERIOD_END').Value:=null
   else StorProc.ParamByName('PERIOD_END').AsDate:=DateEnd.Date;
   StorProc.ParamByName('ID_STATUS_COMMENT').AsShort:=StatusBox.EditValue;
   StorProc.ParamByName('ID_PRIORITY_COMMENT').AsShort:=PriorityBox.EditValue;
   StorProc.ParamByName('ID_TYPE_COMMENT').AsShort:=TypeBox.EditValue;
   StorProc.ParamByName('NOTE_COMMENT').AsString:=NoteEdit.Text;
   try
     StorProc.ExecProc;
     if StorProc.FieldByName('Er_Msg').AsString='' then
     begin
        StorProc.Transaction.Commit;
        Result:=True;
     end
     else
     begin
        StorProc.Transaction.Rollback;
        Result:=False;
        bsShowMessage(Application.Title, StorProc.FieldByName('Er_Msg').AsString, mtInformation, [mbOK]);
     end;
   except on E:Exception do
          begin
             Result:=False;
             StorProc.Transaction.Rollback;
             bsShowMessage(Application.Title, E.Message, mtInformation, [mbOK])
          end;
   end;
end;

function TfrmObjectComment.CommentUpd:Boolean;
begin
   StorProc.Transaction.StartTransaction;
   StorProc.StoredProcName:='BS_OBJECT_COMMENT_UPD';
   StorProc.Prepare;
   StorProc.ParamByName('ID_TYPE_OBJECT').AsInteger:=TypeObjectBox.EditValue;
   StorProc.ParamByName('KEY_FIELD').AsInteger:=StrToInt(KeyFieldEdit.Text);
   StorProc.ParamByName('PERIOD_BEG').AsDate:=DateBeg.Date;
   if DateEnd.Text='' then StorProc.ParamByName('PERIOD_END').Value:=null
   else StorProc.ParamByName('PERIOD_END').AsDate:=DateEnd.Date;
   StorProc.ParamByName('ID_PRIORITY_COMMENT').AsShort:=PriorityBox.EditValue;
   StorProc.ParamByName('ID_TYPE_COMMENT').AsShort:=TypeBox.EditValue;
   StorProc.ParamByName('NOTE_COMMENT').AsString:=NoteEdit.Text;
   StorProc.ParamByName('PERIOD_BEG_OLD').AsDate:=FilterSet['DATE_BEG'];
   StorProc.ParamByName('PERIOD_END_OLD').AsDate:=FilterSet['DATE_END'];
   try
     StorProc.ExecProc;
     if StorProc.FieldByName('Er_Msg').AsString='' then
     begin
        StorProc.Transaction.Commit;
        Result:=True;
     end
     else
     begin
        StorProc.Transaction.Rollback;
        Result:=False;
        bsShowMessage(Application.Title, StorProc.FieldByName('Er_Msg').AsString, mtInformation, [mbOK]);
     end;
   except on E:Exception do
          begin
             Result:=False;
             StorProc.Transaction.Rollback;
             bsShowMessage(Application.Title, E.Message, mtInformation, [mbOK])
          end;
   end;
end;

function TfrmObjectComment.CommentStatusUpd:Boolean;
begin
   StorProc.Transaction.StartTransaction;
   StorProc.StoredProcName:='BS_OBJECT_COMMENT_STATUS_UPD';
   StorProc.Prepare;
   StorProc.ParamByName('ID_TYPE_OBJECT').AsInteger:=TypeObjectBox.EditValue;
   StorProc.ParamByName('KEY_FIELD').AsInteger:=StrToInt(KeyFieldEdit.Text);
   StorProc.ParamByName('PERIOD_BEG').AsDate:=FilterSet['DATE_BEG'];
   StorProc.ParamByName('ID_STATUS_COMMENT').AsShort:=StatusBox.EditValue;
   try
     StorProc.ExecProc;
     StorProc.Transaction.Commit;
     Result:=True;
   except on E:Exception do
          begin
             Result:=False;
             StorProc.Transaction.Rollback;
             bsShowMessage(Application.Title, E.Message, mtInformation, [mbOK])
          end;
   end;
end;

procedure TfrmObjectComment.FormClose(Sender: TObject;
  var Action: TCloseAction);
var i:Smallint;
begin
    for i:=0 to DB.TransactionCount-1 do
    begin
       if DB.Transactions[i].Active then DB.Transactions[i].Rollback;
    end;
    DB.Close;
    if FormStyle = fsMDIChild then action:=caFree;
end;

procedure TfrmObjectComment.FormShow(Sender: TObject);
begin
     if FormStyle = fsMDIChild then  btnSelect.Visible:=ivNever;
end;

procedure TfrmObjectComment.CommentGridDBViewDblClick(Sender: TObject);
begin
     if FormStyle = fsNormal then
     begin
        ActSelectExecute(Sender);
        KeyFieldEdit.Enabled:=True;
        TypeObjectBox.Enabled:=True;
     end
     else ActEditExecute(Sender);
end;

procedure TfrmObjectComment.ActInsExecute(Sender: TObject);
begin
   if not Is_Admin then
      if fibCheckPermission('/ROOT/BillingSystem/bs_sprav/bs_sp_DocType','Add') <> 0 then
      begin
          messagebox(handle,
          pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
          +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
          pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
          exit;
      end;
    TypeEdit:=0;
    BtnEnabled([fbFilter, fbExit, fbOk, fbCancel]);
end;

procedure TfrmObjectComment.ActEditExecute(Sender: TObject);
begin
    if FilterSet.IsEmpty then Exit;
    if not Is_Admin then
    if fibCheckPermission('/ROOT/BillingSystem/bs_sprav/bs_sp_DocType','Edit') <> 0 then
    begin
        messagebox(handle,
        pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
        +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
        pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
    end;
    TypeEdit:=1;
    BtnEnabled([fbFilter, fbExit, fbOk, fbCancel]);
end;

procedure TfrmObjectComment.ActSelectExecute(Sender: TObject);
begin
  if CommentGridDBView.datacontroller.recordcount = 0 then exit;
  ModalResult:=mrOk;
end;

procedure TfrmObjectComment.ActCloseExecute(Sender: TObject);
begin
   Close
end;

procedure TfrmObjectComment.UserBoxPropertiesInitPopup(Sender: TObject);
begin
   UserDSetCloseOpen;
end;

procedure TfrmObjectComment.TypeObjectBoxPropertiesInitPopup(
  Sender: TObject);
begin
   TypeObjectDSetCloseOpen;
end;

procedure TfrmObjectComment.FormResize(Sender: TObject);
begin
   {if isShowGrid then ClientHeight:=MainPanelHeight+GridPanel.Height
   else ClientHeight:=MainPanelHeight;
   GridPanel.Visible:=isShowGrid;
   CommentGrid.Visible:=isShowGrid;  }
end;

procedure TfrmObjectComment.smEqualClick(Sender: TObject);
begin
   (FindComponent(SignMenu.PopupComponent.Name) as TcxLabel).Caption:=smEqual.Caption;
end;

procedure TfrmObjectComment.smLessEqualClick(Sender: TObject);
begin
   (FindComponent(SignMenu.PopupComponent.Name) as TcxLabel).Caption:=smLessEqual.Caption;
end;

procedure TfrmObjectComment.smLessClick(Sender: TObject);
begin
   (FindComponent(SignMenu.PopupComponent.Name) as TcxLabel).Caption:=smLess.Caption;
end;

procedure TfrmObjectComment.smMoreClick(Sender: TObject);
begin
   (FindComponent(SignMenu.PopupComponent.Name) as TcxLabel).Caption:=smMore.Caption;
end;

procedure TfrmObjectComment.smMoreEqualClick(Sender: TObject);
begin
   (FindComponent(SignMenu.PopupComponent.Name) as TcxLabel).Caption:=smMoreEqual.Caption;
end;

procedure TfrmObjectComment.smNotEqualClick(Sender: TObject);
begin
   (FindComponent(SignMenu.PopupComponent.Name) as TcxLabel).Caption:=smNotEqual.Caption;
end;

procedure TfrmObjectComment.btnOkClick(Sender: TObject);
var flag:Boolean;
begin
   if not SaveData then Exit;
   if TypeEdit=0 then flag:=CommentIns
   else if TypeEdit=1 then flag:=CommentUpd
        else flag:=CommentStatusUpd;
   if flag then
   begin
      //ActClearExecute(Sender);
      ActFilterExecute(Sender);
   end;
   TypeEdit:=3;
   BtnEnabled([fbAdd, fbEdit, fbDelete, fbSelect, fbFilter, fbClear, fbRedo, fbUndo, fbExit]);
   DateBeg.Style.Color:=clWindow;
   PriorityBox.Style.Color:=clWindow;
   TypeBox.Style.Color:=clWindow;
   NoteEdit.Style.Color:=clWindow;
end;

procedure TfrmObjectComment.ActClearExecute(Sender: TObject);
begin
   if Self.FormStyle=fsMDIChild then
   begin
      KeyFieldEdit.Text:='';
      TypeObjectBox.EditValue:=(null);
   end;
   DateBeg.EditValue:=(null);
   DateEnd.EditValue:=(null);
   StatusBox.EditValue:=(null);
   PriorityBox.EditValue:=(null);
   TypeBox.EditValue:=(null);
   UserBox.EditValue:=(null);
   DateCreate.EditValue:=(null);
   NoteEdit.Text:='';
end;

procedure TfrmObjectComment.ActFilterExecute(Sender: TObject);
var strFilter:string;
begin
   if KeyFieldEdit.Text='' then strFilter:='Null,'
   else strFilter:=KeyFieldEdit.Text+',';

   if TypeObjectBox.EditText='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(TypeObjectBox.EditValue)+',';

   if DateBeg.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+''''+DateToStr(DateBeg.Date)+''',';

   if DateEnd.Text='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+''''+DateToStr(DateEnd.Date)+''',';

   if StatusBox.EditText='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(StatusBox.EditValue)+',';

   if PriorityBox.EditText='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(PriorityBox.EditValue)+',';

   if TypeBox.EditText='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(TypeBox.EditValue)+',';

   if UserBox.EditText='' then strFilter:=strFilter+'Null,'
   else strFilter:=strFilter+IntToStr(UserBox.EditValue)+',';

   if DateCreate.Text='' then strFilter:=strFilter+'Null'
   else strFilter:=strFilter+''''+DateToStr(DateCreate.Date)+'''';

   if FilterSet.Active then FilterSet.Close;
   FilterSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_OBJECT_COMMENT_FILTER('+strFilter+')';
   FilterSet.Open;

   if (not FilterSet.IsEmpty) then
   begin
      if not GridPanel.Visible then
      begin
         GridPanel.Visible:=True;
         Self.Height:=frmHeight+pnlGridHeight;
      end;
   end
   else
   begin
      Self.Height:=frmHeight;
      GridPanel.Visible:=False;
      bsShowMessage(Application.Title, 'За встановленними настройками не було знайдено жодного запису!', mtInformation, [mbOK]);
   end;
   CommentGrid.Visible:=GridPanel.Visible;
end;

procedure TfrmObjectComment.btnEditStatusClick(Sender: TObject);
begin
    if FilterSet.IsEmpty then Exit;
    if not Is_Admin then
    if fibCheckPermission('/ROOT/BillingSystem/bs_sprav/bs_sp_DocType','Edit') <> 0 then
    begin
        messagebox(handle,
        pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
        +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
        pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
    end;
    TypeEdit:=2;
    BtnEnabled([fbFilter, fbExit, fbOk, fbCancel]);
end;

procedure TfrmObjectComment.btnCancelClick(Sender: TObject);
begin
   TypeEdit:=3;
   BtnEnabled([fbAdd, fbEdit, fbDelete, fbSelect, fbFilter, fbClear, fbRedo, fbUndo, fbExit]);
   DateBeg.Style.Color:=clWindow;
   PriorityBox.Style.Color:=clWindow;
   TypeBox.Style.Color:=clWindow;
   NoteEdit.Style.Color:=clWindow;
end;

procedure TfrmObjectComment.FilterSetEndScroll(DataSet: TDataSet);
begin
   if FilterSet.IsEmpty then Exit;
   KeyFieldEdit.Text:=IntToStr(FilterSet['Key_Field_Value']);
   TypeObjectBox.EditValue:=FilterSet['Id_Type_Object'];
   DateBeg.Date:=FilterSet['Date_Beg'];
   DateEnd.Date:=FilterSet['Date_End'];
   StatusBox.EditValue:=FilterSet['Id_Status_Comment'];
   PriorityBox.EditValue:=FilterSet['Id_Priority_Comment'];
   TypeBox.EditValue:=FilterSet['Id_Type_Comment'];
   UserBox.EditValue:=FilterSet['Id_User'];
   DateCreate.Date:=FilterSet['Date_Create'];
   NoteEdit.Text:=FilterSet['Note_Comment'];

end;

end.
