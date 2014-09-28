//******************************************************************************
// Проект "Контракты"
// Справочник типов расторжения контрактов
// Чернявский А.Э. 2005г.
// последние изменения Перчак А.Л. 29/10/2008
//******************************************************************************

unit cn_sp_TypeDiss_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  DM_spTypeDiss, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cn_sp_TypeDiss_AE_Unit, cn_Common_Messages,cnConsts_Messages,
  Menus, cn_Common_Types, Placemnt;

type
  TfrmIninTypeDiss = class(TForm)
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
    DM:TDM_spDiss;
    procedure FormIniLanguage;
  public
    res:Variant;
    Is_admin : Boolean;
    constructor  Create(AParameter:TcnSimpleParams);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmIninTypeDiss.Create(AParameter:TcnSimpleParams);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AParameter.Owner);
 DM:=TDM_spDiss.Create(Self);
 DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_INI_TYPE_DISS_SELECT';
 DM.DB.Handle:=AParameter.DB_Handle;
 DM.DataSet.Open;
 GridDBView.DataController.DataSource := DM.DataSource;
 if AParameter.ID_Locate <> null
  then DM.DataSet.Locate('ID_TYPE_DISS', AParameter.ID_Locate, [] );
 FormIniLanguage();
 Is_admin := AParameter.is_admin;
 Screen.Cursor:=crDefault;
 CnFormStorage.RestoreFormPlacement;
end;

procedure TfrmIninTypeDiss.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      cnConsts.cn_sp_IniTypeDiss[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
 // попап
 AddPop.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditPop.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeletePop.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshPop.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 ExitPop.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
 //грид
  name.Caption:=                      cnConsts.cn_Name_Column[PLanguageIndex];
  ordertype_col.Caption:=     cnConsts.cn_OrderType[PLanguageIndex];
  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmIninTypeDiss.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmIninTypeDiss.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CnFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild then action:=caFree
  else
  DM.Free;
end;

procedure TfrmIninTypeDiss.SelectButtonClick(Sender: TObject);
var id_sp: int64;
    RecMultiSelected, i: integer;
begin
if GridDBView.datacontroller.recordcount = 0 then exit;
 if GridDBView.OptionsSelection.MultiSelect=true then
  begin
   RecMultiSelected:= GridDBView.DataController.GetSelectedCount;
   res:=VarArrayCreate([0,RecMultiSelected-1],varVariant);
   for i:=0 to GridDBView.DataController.GetSelectedCount-1 do
     begin
      res[i]:=GridDBView.Controller.SelectedRecords[i].Values[1];
     end;
  end
  else
  begin
    Res:=VarArrayCreate([0,2],varVariant);
    id_sp:= DM.DataSet['ID_TYPE_DISS'];
    Res[0]:= id_sp;
    Res[1]:=DM.DataSet['NAME_TYPE_DISS'];
    if DM.DataSet['ID_ORDERTYPE'] <> null then
    Res[2]:=DM.DataSet['ID_ORDERTYPE'];
  end;
    
ModalResult:=mrOk;
end;

procedure TfrmIninTypeDiss.FormShow(Sender: TObject);
begin
if FormStyle = fsMDIChild then  SelectButton.Enabled:=false;
end;

procedure TfrmIninTypeDiss.AddButtonClick(Sender: TObject);
var
ViewForm : TfrmTypeDiss_AE;
New_id_Locator : int64;
begin
  if not Is_Admin then
  if CheckPermission('/ROOT/Contracts/Cn_Sp','Edit') <> 0
   then
    begin
     messagebox(handle,
     pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
     +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
     pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;
 ViewForm:= TfrmTypeDiss_AE.Create(Self, DM.DB.Handle, PLanguageIndex);
 ViewForm.Caption := cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 ViewForm.is_admin := Is_admin;
 ViewForm.id_ordertype :=-1;
 if ViewForm.ShowModal = mrOk then
  begin
   with DM.StProc do
    try
     Transaction.StartTransaction;
     StoredProcName := 'CN_INI_TYPE_DISS_INSERT';
     Prepare;
     ParamByName('NAME_TYPE_DISS').AsString       := ViewForm.Name_Edit.Text;
     if ViewForm.id_ordertype <> -1 then
        ParamByName('ID_ORDERTYPE').AsInt64       := ViewForm.id_ordertype
        else
        ParamByName('ID_ORDERTYPE').AsVariant     := null;
        ExecProc;
        New_id_Locator:=ParamByName('ID_TYPE_DISS').AsInt64;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_TYPE_DISS',New_id_Locator,[] );
   end;
end;

procedure TfrmIninTypeDiss.EditButtonClick(Sender: TObject);
var
ViewForm : TfrmTypeDiss_AE;
id_Locator : Int64;
begin
   if not Is_Admin then
   if CheckPermission('/ROOT/Contracts/Cn_Sp','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
      +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
      pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;
 if  GridDBView.DataController.RecordCount = 0 then exit;
 ViewForm:= TfrmTypeDiss_AE.Create(Self, DM.DB.Handle,PLanguageIndex);
 ViewForm.is_admin := Is_admin;
 ViewForm.Caption := cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 ViewForm.Name_Edit.Text:=  DM.DataSet['NAME_TYPE_DISS'];
 ViewForm.cn_ordertype_Edit.Text := vartostr(DM.DataSet['ORDERNAME']);
 if DM.DataSet['ID_ORDERTYPE']<> null
  then ViewForm.id_ordertype :=  DM.DataSet['ID_ORDERTYPE'];
 if ViewForm.ShowModal = mrOk then
 begin
     id_Locator:=  DM.DataSet['ID_TYPE_DISS'];
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_INI_TYPE_DISS_UPDATE';
        Prepare;
        ParamByName('ID_TYPE_DISS').AsInt64     := DM.DataSet['ID_TYPE_DISS'];
        ParamByName('NAME_TYPE_DISS').AsString := ViewForm.Name_Edit.Text;
        if ViewForm.id_ordertype <> -1 then
        ParamByName('ID_ORDERTYPE').AsInt64       := ViewForm.id_ordertype
        else
        ParamByName('ID_ORDERTYPE').AsVariant     := null;
        ExecProc;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_TYPE_DISS', id_Locator ,[] );
   end;
end;

procedure TfrmIninTypeDiss.DeleteButtonClick(Sender: TObject);
 var
  i: byte;
 begin
   if not Is_Admin then
   if CheckPermission('/ROOT/Contracts/Cn_Sp','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
      +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
      pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;
 if  GridDBView.DataController.RecordCount = 0 then exit;
  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit
  else
  begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_INI_TYPE_DISS_DELETE';
        Prepare;
        ParamByName('ID_TYPE_DISS').AsInt64       :=  DM.DataSet['ID_TYPE_DISS'];
        ExecProc;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
 DM.DataSet.CloseOpen(True);
   end;
end;

procedure TfrmIninTypeDiss.RefreshButtonClick(Sender: TObject);
var
id_Locator : Int64;
begin
 Screen.Cursor := crHourGlass;
 id_Locator    :=  DM.DataSet['ID_TYPE_DISS'];
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_TYPE_DISS', id_Locator ,[] );
 Screen.Cursor := crDefault;
end;

procedure TfrmIninTypeDiss.GridDBViewDblClick(Sender: TObject);
begin
if FormStyle = fsNormal then SelectButtonClick(Sender)
else  EditButtonClick(Sender);
end;

procedure TfrmIninTypeDiss.AddPopClick(Sender: TObject);
begin
AddButtonClick(Sender);
end;

procedure TfrmIninTypeDiss.EditPopClick(Sender: TObject);
begin
EditButtonClick(Sender);
end;

procedure TfrmIninTypeDiss.DeletePopClick(Sender: TObject);
begin
DeleteButtonClick(Sender);
end;

procedure TfrmIninTypeDiss.RefreshPopClick(Sender: TObject);
begin
RefreshButtonClick(Sender);
end;

procedure TfrmIninTypeDiss.ExitPopClick(Sender: TObject);
begin
ExitButtonClick(Sender);
end;

end.
