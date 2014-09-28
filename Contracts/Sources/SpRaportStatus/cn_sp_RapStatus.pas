//******************************************************************************
// Проект "Контракты"
// Справочник статусов рапорта
// Чернявский А.Э. 2006г.
// последние изменения Перчак А.Л. 29/10/2008
//******************************************************************************

unit cn_sp_RapStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cn_DM_SpRapStatus, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cn_Common_Messages, cnConsts_Messages,
  cn_Common_Types, Placemnt;

type
  TfrmSpRapStatus = class(TForm)
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
    id_national: TcxGridDBColumn;
    short_name: TcxGridDBColumn;
    SelectButton: TdxBarLargeButton;
    CnFormStorage: TFormStorage;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TDM_RapStatus;
    procedure FormIniLanguage;
  public
    res:Variant;
    Is_admin:Boolean;
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;is_admin:boolean);reintroduce;
  end;


implementation

uses cn_sp_RapStatus_AE;

{$R *.dfm}

constructor TfrmSpRapStatus.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;is_admin:boolean);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
DM:=TDM_RapStatus.Create(Self);
DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_SP_RAPORT_STATUS_SELECT';
DM.DB.Handle:=DB_Handle;
DM.DataSet.Open;
GridDBView.DataController.DataSource := DM.DataSource;
FormIniLanguage();
   Self.Is_admin:=is_admin;
Screen.Cursor:=crDefault;
  CnFormStorage.RestoreFormPlacement;
end;

procedure TfrmSpRapStatus.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      cnConsts.cn_Main_SpRapStatus[PLanguageIndex];
 name.caption:=                 cnConsts.cn_Name_Column[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmSpRapStatus.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmSpRapStatus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CnFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild then action:=caFree
  else
  DM.Free;
end;

procedure TfrmSpRapStatus.SelectButtonClick(Sender: TObject);
var id_sp: int64;
begin
Res:=VarArrayCreate([0,2],varVariant);
id_sp:= DM.DataSet['ID_STATUS'];
Res[0]:= id_sp;
Res[1]:=DM.DataSet['NAME'];
ModalResult:=mrOk;
end;

procedure TfrmSpRapStatus.FormShow(Sender: TObject);
begin
if FormStyle = fsMDIChild then  SelectButton.Enabled:=false;
end;

procedure TfrmSpRapStatus.AddButtonClick(Sender: TObject);
 var
  ViewForm: TfrmAddEdit;
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
ViewForm:= TfrmAddEdit.Create(Self, PLanguageIndex);
ViewForm.Caption := cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 if ViewForm.ShowModal = mrOk then
 begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_SP_RAPORT_STATUS_INSERT';
        Prepare;
        ParamByName('NAME').AsString       := ViewForm.Name_Edit.Text;
        ExecProc;
        New_id_Locator:=ParamByName('ID_STATUS').AsInt64;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_STATUS',New_id_Locator,[] );
   end;
end;





procedure TfrmSpRapStatus.EditButtonClick(Sender: TObject);
var
ViewForm : TfrmAddEdit;
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
ViewForm:= TfrmAddEdit.Create(Self, PLanguageIndex);
ViewForm.Caption := cnConsts.cn_EditBtn_Caption[PLanguageIndex];
ViewForm.Name_Edit.Text:=  DM.DataSet['NAME'];
 if ViewForm.ShowModal = mrOk then
 begin
     id_Locator:=  DM.DataSet['ID_STATUS'];
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_SP_RAPORT_STATUS_UPDATE';
        Prepare;
        ParamByName('ID_STATUS').AsInt64     := DM.DataSet['ID_STATUS'];
        ParamByName('NAME').AsString           := ViewForm.Name_Edit.Text;
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
 DM.DataSet.Locate('ID_STATUS', id_Locator ,[] );
   end;
end;


procedure TfrmSpRapStatus.DeleteButtonClick(Sender: TObject);
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
        StoredProcName := 'CN_SP_RAPORT_STATUS_DELETE';
        Prepare;
        ParamByName('ID_STATUS').AsInt64       :=  DM.DataSet['ID_STATUS'];
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


procedure TfrmSpRapStatus.RefreshButtonClick(Sender: TObject);
var
id_Locator : Int64;
begin
 if  GridDBView.DataController.RecordCount = 0 then exit;
 Screen.Cursor := crHourGlass;
 id_Locator    :=  DM.DataSet['ID_STATUS'];
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_STATUS', id_Locator ,[] );
 Screen.Cursor := crDefault;
end;


end.
