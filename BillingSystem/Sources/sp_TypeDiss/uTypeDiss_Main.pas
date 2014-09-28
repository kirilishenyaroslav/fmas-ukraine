//******************************************************************************
// Проект ""
// Справочник типов расторжения контрактов
//
// последние изменения 
//******************************************************************************

unit uTypeDiss_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  uTypeDiss_DM, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  uCommon_Funcs, uConsts, uTypeDiss_AE, uCommon_Messages, uConsts_Messages,
  Menus, uCommon_Types, Placemnt, AccMGMT, cxCheckBox;

type
  TfrmTypeDiss_main = class(TForm)
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    StatusBar: TdxStatusBar;
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
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    name: TcxGridDBColumn;
    id_type_diss: TcxGridDBColumn;
    SelectButton: TdxBarLargeButton;
    PopupMenu1: TPopupMenu;
    AddPop: TMenuItem;
    EditPop: TMenuItem;
    DeletePop: TMenuItem;
    RefreshPop: TMenuItem;
    ExitPop: TMenuItem;
    ordertype_col: TcxGridDBColumn;
    CnFormStorage: TFormStorage;
    GridColumn_is_deleted: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
    procedure AddPopClick(Sender: TObject);
    procedure EditPopClick(Sender: TObject);
    procedure DeletePopClick(Sender: TObject);
    procedure RefreshPopClick(Sender: TObject);
    procedure ExitPopClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TfrmTypeDiss_DM;
    procedure FormIniLanguage;
  public
    res:Variant;
    Is_admin : Boolean;
    constructor  Create(AParameter:TbsSimpleParams);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmTypeDiss_main.Create(AParameter:TbsSimpleParams);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AParameter.Owner);

  DM:=TfrmTypeDiss_DM.Create(Self);
  DM.DB.Handle:=AParameter.DB_Handle;
  DM.DB.Connected := True;
  DM.ReadTransaction.StartTransaction;

  DM.DataSet.Close;
  DM.DataSet.SQLs.SelectSQL.Text := 'select * from bs_INI_TYPE_DISS_SEL';
  DM.DataSet.Open;

  GridDBView.DataController.DataSource := DM.DataSource;
  if AParameter.ID_Locate <> null
  then DM.DataSet.Locate('ID_TYPE_DISS', AParameter.ID_Locate, [] );

  FormIniLanguage();
  Is_admin := AParameter.is_admin;
  Screen.Cursor:=crDefault;
  CnFormStorage.RestoreFormPlacement;
end;

procedure TfrmTypeDiss_main.FormIniLanguage;
begin
  PLanguageIndex := uCommon_Funcs.bsLanguageIndex();

  //кэпшн формы
  Caption:=                      uConsts.bs_sp_IniTypeDiss[PLanguageIndex];

  //названия кнопок
  AddButton.Caption :=           uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  EditButton.Caption :=          uConsts.bs_EditBtn_Caption[PLanguageIndex];
  DeleteButton.Caption :=        uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  RefreshButton.Caption :=       uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  SelectButton.Caption :=        uConsts.bs_SelectBtn_Caption[PLanguageIndex];
  ExitButton.Caption :=          uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  // попап
  AddPop.Caption :=           uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  EditPop.Caption :=          uConsts.bs_EditBtn_Caption[PLanguageIndex];
  DeletePop.Caption :=        uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  RefreshPop.Caption :=       uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  ExitPop.Caption :=          uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  //грид
  name.Caption                  := uConsts.bs_Name_Column[PLanguageIndex];
  ordertype_col.Caption         := uConsts.bs_OrderType[PLanguageIndex];
  GridColumn_is_deleted.Caption := uConsts.bs_IS_Deleted_Column[PLanguageIndex];

  //статусбар
  StatusBar.Panels[0].Text:=  uConsts.bs_InsertBtn_ShortCut[PLanguageIndex]  + uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  StatusBar.Panels[1].Text:=  uConsts.bs_EditBtn_ShortCut[PLanguageIndex]    + uConsts.bs_EditBtn_Caption[PLanguageIndex];
  StatusBar.Panels[2].Text:=  uConsts.bs_DeleteBtn_ShortCut[PLanguageIndex]  + uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  StatusBar.Panels[3].Text:=  uConsts.bs_RefreshBtn_ShortCut[PLanguageIndex] + uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  StatusBar.Panels[4].Text:=  uConsts.bs_EnterBtn_ShortCut[PLanguageIndex]   + uConsts.bs_SelectBtn_Caption[PLanguageIndex];
  StatusBar.Panels[5].Text:=  uConsts.bs_ExitBtn_ShortCut[PLanguageIndex]    + uConsts.bs_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmTypeDiss_main.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmTypeDiss_main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CnFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

procedure TfrmTypeDiss_main.SelectButtonClick(Sender: TObject);
var
  id_sp: int64;
begin
  if GridDBView.datacontroller.recordcount = 0 then exit;

  Res:=VarArrayCreate([0,2],varVariant);
  id_sp:= DM.DataSet['ID_TYPE_DISS'];
  Res[0]:= id_sp;
  Res[1]:=DM.DataSet['NAME_TYPE_DISS'];
  if DM.DataSet['ID_ORDERTYPE'] <> null then Res[2]:=DM.DataSet['ID_ORDERTYPE'];

  ModalResult:=mrOk;
end;

procedure TfrmTypeDiss_main.FormShow(Sender: TObject);
begin
  if FormStyle = fsMDIChild then  SelectButton.Enabled:=false;
end;

procedure TfrmTypeDiss_main.AddButtonClick(Sender: TObject);
var
  ViewForm : TfrmTypeDiss_AE;
  New_id_Locator : int64;
begin
  if not Is_Admin then
   if fibCheckPermission('/ROOT/Contracts/Cn_Sp','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  ViewForm:= TfrmTypeDiss_AE.Create(Self, DM.DB.Handle, PLanguageIndex);
  ViewForm.Caption := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  ViewForm.is_admin := Is_admin;
  ViewForm.id_ordertype :=-1;
  if ViewForm.ShowModal = mrOk then
   begin
     DM.StProc.Transaction.StartTransaction;
     DM.StProc.StoredProcName := 'bs_INI_TYPE_DISS_INS';
     DM.StProc.Prepare;
     DM.StProc.ParamByName('NAME_TYPE_DISS').AsString       := ViewForm.Name_Edit.Text;
     if ViewForm.id_ordertype <> -1
      then DM.StProc.ParamByName('ID_ORDERTYPE').AsInt64       := ViewForm.id_ordertype
      else DM.StProc.ParamByName('ID_ORDERTYPE').AsVariant     := null;
     DM.StProc.ExecProc;
     New_id_Locator := DM.StProc.ParamByName('ID_TYPE_DISS').AsInt64;
     try
      DM.StProc.Transaction.Commit;
       except
        on E:Exception do
         begin
          LogException;
          bsShowMessage('Error',e.Message,mtError,[mbOK]);
          DM.StProc.Transaction.Rollback;
         end;
       end;
    DM.DataSet.CloseOpen(True);
    DM.DataSet.Locate('ID_TYPE_DISS',New_id_Locator,[] );
   end;
end;

procedure TfrmTypeDiss_main.EditButtonClick(Sender: TObject);
var
  ViewForm : TfrmTypeDiss_AE;
  id_Locator : Int64;
begin
   if not Is_Admin then
   if fibCheckPermission('/ROOT/Contracts/Cn_Sp','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  if GridDBView.DataController.RecordCount = 0 then exit;

  ViewForm:= TfrmTypeDiss_AE.Create(Self, DM.DB.Handle,PLanguageIndex);
  ViewForm.is_admin := Is_admin;
  ViewForm.Caption := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  ViewForm.Name_Edit.Text:=  DM.DataSet['NAME_TYPE_DISS'];
  ViewForm.cn_ordertype_Edit.Text := vartostr(DM.DataSet['ORDERNAME']);
  if DM.DataSet['ID_ORDERTYPE']<> null
   then ViewForm.id_ordertype :=  DM.DataSet['ID_ORDERTYPE'];
  if ViewForm.ShowModal = mrOk then
  begin
   id_Locator:=  DM.DataSet['ID_TYPE_DISS'];
   DM.StProc.Transaction.StartTransaction;
   DM.StProc.StoredProcName := 'bs_INI_TYPE_DISS_UPD';
   DM.StProc.Prepare;
   DM.StProc.ParamByName('ID_TYPE_DISS').AsInt64     := DM.DataSet['ID_TYPE_DISS'];
   DM.StProc.ParamByName('NAME_TYPE_DISS').AsString := ViewForm.Name_Edit.Text;
   if ViewForm.id_ordertype <> -1
    then DM.StProc.ParamByName('ID_ORDERTYPE').AsInt64       := ViewForm.id_ordertype
    else DM.StProc.ParamByName('ID_ORDERTYPE').AsVariant     := null;
   DM.StProc.ExecProc;
   try
    DM.StProc.Transaction.Commit;
     except
      on E:Exception do
       begin
        LogException;
        bsShowMessage('Error',e.Message,mtError,[mbOK]);
        DM.StProc.Transaction.Rollback;
       end;
   end;
   DM.DataSet.CloseOpen(True);
   DM.DataSet.Locate('ID_TYPE_DISS', id_Locator ,[] );
  end;
end;

procedure TfrmTypeDiss_main.DeleteButtonClick(Sender: TObject);
var
  i: byte;
begin
  if not Is_Admin then
   if CheckPermission('/ROOT/Contracts/Cn_Sp','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  if GridDBView.DataController.RecordCount = 0 then exit;

  i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts_Messages.bs_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  DM.StProc.Transaction.StartTransaction;
  DM.StProc.StoredProcName := 'bs_INI_TYPE_DISS_DEL';
  DM.StProc.Prepare;
  DM.StProc.ParamByName('ID_TYPE_DISS').AsInt64       :=  DM.DataSet['ID_TYPE_DISS'];
  DM.StProc.ExecProc;
  try
   DM.StProc.Transaction.Commit;
   except
    on E:Exception do
     begin
      LogException;
      bsShowMessage('Error',e.Message,mtError,[mbOK]);
      DM.StProc.Transaction.Rollback;
     end;
  end;
  DM.DataSet.CloseOpen(True);
end;

procedure TfrmTypeDiss_main.RefreshButtonClick(Sender: TObject);
var
  id_Locator : Int64;
begin
  Screen.Cursor := crHourGlass;
  id_Locator    :=  DM.DataSet['ID_TYPE_DISS'];
  DM.DataSet.CloseOpen(True);
  DM.DataSet.Locate('ID_TYPE_DISS', id_Locator ,[] );
  Screen.Cursor := crDefault;
end;

procedure TfrmTypeDiss_main.GridDBViewDblClick(Sender: TObject);
begin
  if FormStyle = fsNormal
   then SelectButtonClick(Sender)
   else  EditButtonClick(Sender);
end;

procedure TfrmTypeDiss_main.AddPopClick(Sender: TObject);
begin
  AddButtonClick(Sender);
end;

procedure TfrmTypeDiss_main.EditPopClick(Sender: TObject);
begin
  EditButtonClick(Sender);
end;

procedure TfrmTypeDiss_main.DeletePopClick(Sender: TObject);
begin
  DeleteButtonClick(Sender);
end;

procedure TfrmTypeDiss_main.RefreshPopClick(Sender: TObject);
begin
  RefreshButtonClick(Sender);
end;

procedure TfrmTypeDiss_main.ExitPopClick(Sender: TObject);
begin
  ExitButtonClick(Sender);
end;

end.
