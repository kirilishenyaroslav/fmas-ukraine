//******************************************************************************
// Проект ""
// Справочник типов документов
//
// последние изменения
//******************************************************************************

unit uDocumentType_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCommon_Funcs, uConsts,uDocumentType_DM, uDocumentType_AE,
  uCommon_Messages, uConsts_Messages, uCommon_Types, cxTimeEdit, AccMGMT,
  cxGraphics, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, Placemnt, Menus, cxGridTableView,
  ImgList, dxBar, dxBarExtItems, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxStatusBar, ActnList;

type
  TfrmDocumentType_main = class(TForm)
    StatusBar: TdxStatusBar;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    name_document_type: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
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
    PopupMenu1: TPopupMenu;
    AddPop: TMenuItem;
    EditPop: TMenuItem;
    DeletePop: TMenuItem;
    RefreshPop: TMenuItem;
    ExitPop: TMenuItem;
    bsFormStorage: TFormStorage;
    DocTypeActionList: TActionList;
    ActIns: TAction;
    ActEdit: TAction;
    ActClose: TAction;
    ActDel: TAction;
    ActRefresh: TAction;
    ActSelect: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
    procedure ActInsExecute(Sender: TObject);
    procedure ActEditExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure ActRefreshExecute(Sender: TObject);
    procedure ActSelectExecute(Sender: TObject);
    procedure ActCloseExecute(Sender: TObject);
    procedure AddPopClick(Sender: TObject);
    procedure EditPopClick(Sender: TObject);
    procedure DeletePopClick(Sender: TObject);
    procedure RefreshPopClick(Sender: TObject);
    procedure ExitPopClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM : TDocumentType_DM;
    procedure FormIniLanguage;
    procedure DocTypeDSetCloseOpen;
  public
    res:Variant;
    Is_admin:Boolean;
    constructor  Create(AParameter:TbsSimpleParams);reintroduce;
  end;


  {frmDocumentType_main: TfrmDocumentType_main;  }

implementation

uses FIBQuery, pFIBStoredProc, pFIBQuery;

{$R *.dfm}
constructor TfrmDocumentType_main.Create(AParameter:TbsSimpleParams);
begin
   Screen.Cursor:=crHourGlass;
   inherited Create(AParameter.Owner);

   self.Is_admin := AParameter.is_admin;
   
   DM:=TDocumentType_DM.Create(Self);
   DM.DB.Handle := AParameter.Db_Handle;
   DM.DB.Connected := True;
   DM.ReadTransaction.StartTransaction;
   GridDBView.DataController.DataSource := DM.DataSource;
   DM.DataSet.Close;
   DM.DataSet.SQLs.SelectSQL.Text := 'select * from BS_DOCUMENT_TYPE_SEL';
   DM.DataSet.Open;

   if AParameter.ID_Locate <> null
    then DM.DataSet.Locate('id_document_type', AParameter.ID_Locate, [] );

   FormIniLanguage();
   Screen.Cursor:=crDefault;
   bsFormStorage.RestoreFormPlacement;
end;

procedure TfrmDocumentType_main.DocTypeDSetCloseOpen;
begin
   DM.DataSet.Close;
   DM.DataSet.SQLs.SelectSQL.Text := 'select * from BS_DOCUMENT_TYPE_SEL';
   DM.DataSet.Open;
end;

procedure TfrmDocumentType_main.FormIniLanguage;
begin
 PLanguageIndex:=               uCommon_Funcs.bsLanguageIndex();

 //кэпшн формы
 Caption:=                      uConsts.bs_sp_document_type[PLanguageIndex];
 //названия кнопок
 ActIns.Caption :=           uConsts.bs_InsertBtn_Caption[PLanguageIndex];
 ActEdit.Caption :=          uConsts.bs_EditBtn_Caption[PLanguageIndex];
 ActDel.Caption :=        uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
 ActRefresh.Caption :=       uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
 ActSelect.Caption :=        uConsts.bs_SelectBtn_Caption[PLanguageIndex];
 ActClose.Caption :=          uConsts.bs_ExitBtn_Caption[PLanguageIndex];
 // попап
 AddPop.Caption :=           uConsts.bs_InsertBtn_Caption[PLanguageIndex];
 EditPop.Caption :=          uConsts.bs_EditBtn_Caption[PLanguageIndex];
 DeletePop.Caption :=        uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
 RefreshPop.Caption :=       uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
 ExitPop.Caption :=          uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  //грид
  name_document_type.Caption  :=  uConsts.bs_name_document_type[PLanguageIndex];


  //статусбар
 StatusBar.Panels[0].Text:=  uConsts.bs_InsertBtn_ShortCut[PLanguageIndex]  + uConsts.bs_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  uConsts.bs_EditBtn_ShortCut[PLanguageIndex]    + uConsts.bs_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  uConsts.bs_DeleteBtn_ShortCut[PLanguageIndex]  + uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  uConsts.bs_RefreshBtn_ShortCut[PLanguageIndex] + uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  uConsts.bs_EnterBtn_ShortCut[PLanguageIndex]   + uConsts.bs_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  uConsts.bs_ExitBtn_ShortCut[PLanguageIndex]    + uConsts.bs_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmDocumentType_main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    bsFormStorage.SaveFormPlacement;
    if FormStyle = fsMDIChild then action:=caFree
    else
    DM.Free;
end;

procedure TfrmDocumentType_main.FormShow(Sender: TObject);
begin
     if FormStyle = fsMDIChild then  SelectButton.Visible:=ivNever;
end;

procedure TfrmDocumentType_main.GridDBViewDblClick(Sender: TObject);
begin
     if FormStyle = fsNormal then ActSelectExecute(Sender)
     else ActEditExecute(Sender);
end;

procedure TfrmDocumentType_main.ActInsExecute(Sender: TObject);
var
  ViewForm : TfrmDocumentType_AE;
  Id, i:Integer;
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

    ViewForm := TfrmDocumentType_AE.Create(Self, PLanguageIndex, Null, DM);

    ViewForm.Caption := uConsts.bs_InsertBtn_Caption[PLanguageIndex];


    if ViewForm.ShowModal = mrOk then
    begin
        with DM.StProc do
        begin
           DM.WriteTransaction.StartTransaction;
           StoredProcName := 'BS_DOCUMENT_TYPE_INS_UPD';
           Prepare;
           ParamByName('id_document_type').Value:=Null;
           ParamByName('name_document_type').AsString:= ViewForm.NameEdit.Text;
           ExecProc;
           try
             Id:=FieldByName('RET_VALUE').AsInteger;
             for i:=0 to ViewForm.DocPropsList.Count-1 do
             begin
                if ViewForm.DocPropsList.Items.Items[i].Checked then
                begin
                   StoredProcName := 'BS_DOC_TYPE_JN_DOC_PROPS_INS';
                   Prepare;
                   ParamByName('ID_TYPE_DOC').AsInteger:=Id;
                   ParamByName('Id_Prop').AsInteger:=i+1;
                   ExecProc;
                end;
             end;
             DM.WriteTransaction.Commit;
            except
                on E:Exception do
                begin
                    LogException;
                    bsShowMessage('Error',e.Message,mtError,[mbOK]);
                    DM.WriteTransaction.Rollback;
                    raise;
                end;
           end;
        end;
        DocTypeDSetCloseOpen;
        DM.DataSet.Locate('Id_Document_Type', Id, []);
    end;
end;

procedure TfrmDocumentType_main.ActEditExecute(Sender: TObject);
var
  ViewForm : TfrmDocumentType_AE;
  Id, i:Integer;
begin
    if not Is_Admin then
    if fibCheckPermission('/ROOT/BillingSystem/bs_sprav/bs_sp_DocType','Edit') <> 0 then
    begin
        messagebox(handle,
        pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
        +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
        pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
    end;

    If GridDBView.DataController.RecordCount = 0 then Exit;
    Id:=DM.DataSet['id_document_type'];
    ViewForm:= TfrmDocumentType_AE.Create(Self, PLanguageIndex, Id, DM);
    ViewForm.Caption              := uConsts.bs_EditBtn_Caption[PLanguageIndex];
    if VarIsNull(DM.DataSet['name_document_type']) then ViewForm.NameEdit.Text:=''
    else ViewForm.NameEdit.Text        :=  DM.DataSet['name_document_type'];


    if ViewForm.ShowModal = mrOk then
    begin
        with DM.StProc do
        Begin
           DM.WriteTransaction.StartTransaction;
           StoredProcName := 'BS_DOCUMENT_TYPE_INS_UPD';
           Prepare;

           ParamByName('id_document_type').AsInteger:= Id;
           ParamByName('name_document_type').AsString:= ViewForm.NameEdit.Text;
           ExecProc;
           try
             Id:=FieldByName('RET_VALUE').AsInteger;
             StoredProcName := 'BS_DOC_TYPE_JN_DOC_PROPS_DEL';
             Prepare;
             ParamByName('ID_TYPE_DOC').AsInteger:=Id;
             ParamByName('ID_DOC_PROP').Value:=Null;
             ExecProc;
             for i:=0 to ViewForm.DocPropsList.Count-1 do
             begin
                if ViewForm.DocPropsList.Items.Items[i].Checked then
                begin
                   StoredProcName := 'BS_DOC_TYPE_JN_DOC_PROPS_INS';
                   Prepare;
                   ParamByName('ID_TYPE_DOC').AsInteger:=Id;
                   ParamByName('Id_Prop').AsInteger:=i+1;
                   ExecProc;
                end;
             end;
             DM.WriteTransaction.Commit;
           except
              on E:Exception do
              begin
                  LogException;
                  bsShowMessage('Error',e.Message,mtError,[mbOK]);
                  DM.WriteTransaction.Rollback;
              end;
           end;
        end;
        DocTypeDSetCloseOpen;
        DM.DataSet.Locate('Id_Document_Type', Id, []);
    end;
end;

procedure TfrmDocumentType_main.ActDelExecute(Sender: TObject);
var
  i: byte;
  str:string;
begin
   if VarIsNull(DM.DataSet['name_document_type']) then str:=''
   else str:=DM.DataSet['name_document_type'];
   if not Is_Admin then
       if fibCheckPermission('/ROOT/BillingSystem/bs_sprav/bs_sp_DocType','Del') <> 0 then
       begin
           messagebox(handle,
           pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
           +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
           pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
           exit;
       end;

    If GridDBView.DataController.RecordCount = 0 then Exit;

    i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts_Messages.bs_document_type_del[PLanguageIndex]+' '+str+'?', mtConfirmation, [mbYes, mbNo]);
    if ((i = 7) or (i= 2)) then exit;

    with DM.StProc do
    begin
        Transaction.StartTransaction;
        StoredProcName := 'BS_DOCUMENT_TYPE_DEL';
        Prepare;
        ParamByName('id_document_type').AsInt64       :=  DM.DataSet['id_document_type'];
        ExecProc;
        Transaction.Commit;
        try
        except
            on E:Exception do
            begin
                LogException;
                bsShowMessage('Error',e.Message,mtError,[mbOK]);
                Transaction.Rollback;
            end;
       end;
   end;
   DocTypeDSetCloseOpen;
end;

procedure TfrmDocumentType_main.ActRefreshExecute(Sender: TObject);
begin
   DocTypeDSetCloseOpen;
end;

procedure TfrmDocumentType_main.ActSelectExecute(Sender: TObject);
var
  id_sp: int64;
begin
  if GridDBView.datacontroller.recordcount = 0 then exit;

  Res:=VarArrayCreate([0,3],varVariant);
  id_sp:= DM.DataSet['id_document_type'];
  Res[0]:= id_sp;
  Res[1]:=DM.DataSet['name_document_type'];

  ModalResult:=mrOk;
end;

procedure TfrmDocumentType_main.ActCloseExecute(Sender: TObject);
begin
   Close
end;

procedure TfrmDocumentType_main.AddPopClick(Sender: TObject);
begin
   ActInsExecute(Sender);
end;

procedure TfrmDocumentType_main.EditPopClick(Sender: TObject);
begin
   ActEditExecute(Sender);
end;

procedure TfrmDocumentType_main.DeletePopClick(Sender: TObject);
begin
   ActDelExecute(Sender);
end;

procedure TfrmDocumentType_main.RefreshPopClick(Sender: TObject);
begin
   ActRefreshExecute(Sender);
end;

procedure TfrmDocumentType_main.ExitPopClick(Sender: TObject);
begin
   ActCloseExecute(Sender);
end;

end.
