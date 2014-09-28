//******************************************************************************
// Проект "Контракты"
// Справочник статусов договоров
// Чернявский А.Э. 2006г.
// последние изменения Перчак А.Л. 29/10/2008
//******************************************************************************

unit cn_DogStaus_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cn_DM_Ds, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cn_DogStaus_AE, cnConsts_Messages, cn_Common_Messages,
  cxCheckBox, Placemnt;

type
  TfrmDogStatus = class(TForm)
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
    SelectButton: TdxBarLargeButton;
    isvisibleRee_col: TcxGridDBColumn;
    isvisibleOpl_col: TcxGridDBColumn;
    CnFormStorage: TFormStorage;
    GridDBViewDBColumn1: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TDM_Ds;
    procedure FormIniLanguage;
  public
    res:Variant;
    Is_admin:Boolean;
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;is_admin:boolean);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmDogStatus.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;is_admin:boolean);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  DM:=TDM_Ds.Create(Self);
  DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_INI_DOG_STATUS_SELECT';
  DM.DB.Handle:=DB_Handle;
  DM.DataSet.Open;
  GridDBView.DataController.DataSource := DM.DataSource;
  FormIniLanguage();
  Self.Is_admin:=is_admin;
  Screen.Cursor:=crDefault;
  CnFormStorage.RestoreFormPlacement;
end;

procedure TfrmDogStatus.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      cnConsts.cn_Main_SpDogStatus[PLanguageIndex];

 Name.caption:=       cnConsts.cn_FullName[PLanguageIndex];
 isvisibleRee_col.caption:=       cnConsts.cn_IsVisibleReestrShort[PLanguageIndex];
 isvisibleOpl_col.caption:=       cnConsts.cn_IsVisibleOplataShort[PLanguageIndex];
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

procedure TfrmDogStatus.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmDogStatus.FormClose(Sender: TObject;
var
  Action: TCloseAction);
begin
  CnFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild then
    action:=caFree
  else
    DM.Free;
end;

procedure TfrmDogStatus.SelectButtonClick(Sender: TObject);
var
  id_sp: int64;
begin
  Res:=VarArrayCreate([0,3],varVariant);
  id_sp:= DM.DataSet['ID_DOG_STATUS'];
  Res[0]:= id_sp;
  Res[1]:=DM.DataSet['NAME_DOG_STATUS'];
  ModalResult:=mrOk;
end;

procedure TfrmDogStatus.FormShow(Sender: TObject);
begin
  if FormStyle = fsMDIChild then  SelectButton.Visible:=ivNever;
end;

procedure TfrmDogStatus.AddButtonClick(Sender: TObject);
 var
  ViewForm: TfrmDogStatus_AE;
  New_id_Locator : int64;
begin
  if not Is_Admin then
   begin
    messagebox(handle,
    pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
    +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
    pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    exit;
   end;
   
  ViewForm:= TfrmDogStatus_AE.Create(Self, PLanguageIndex);
  ViewForm.Caption := cnConsts.cn_InsertBtn_Caption[PLanguageIndex];

  if ViewForm.ShowModal = mrOk then
  begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_INI_DOG_STATUS_INSERT';
        Prepare;
        ParamByName('NAME_DOG_STATUS').AsString  := ViewForm.Name_Edit.Text;
        if ViewForm.IsVisibleReestrCheckBox.Checked then
         ParamByName('ISVISIBLE_REESTR').AsInteger       := 1
        else
         ParamByName('ISVISIBLE_REESTR').AsInteger       := 0;
        if ViewForm.IsVisibleOplataCheckBox.Checked then
         ParamByName('ISVISIBLE_OPLATA').AsInteger       := 1
        else
         ParamByName('ISVISIBLE_OPLATA').AsInteger       := 0;

        if ViewForm.cxCheckBox1.Checked
        then ParamByName('IS_USE_IN_AUTO_RECALC').AsInteger       := 1
        else ParamByName('IS_USE_IN_AUTO_RECALC').AsInteger       := 0;

        ExecProc;
        New_id_Locator:=ParamByName('ID_DOG_STATUS').AsInt64;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
     end;
     DM.DataSet.CloseOpen(True);
     DM.DataSet.Locate('ID_DOG_STATUS',New_id_Locator,[] );
   end;
end;

procedure TfrmDogStatus.RefreshButtonClick(Sender: TObject);
var
id_Locator : Int64;
begin
 if  GridDBView.DataController.RecordCount = 0 then exit;
 Screen.Cursor := crHourGlass;
 id_Locator    :=  DM.DataSet['ID_DOG_STATUS'];
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_DOG_STATUS', id_Locator ,[] );
 Screen.Cursor := crDefault;
end;

procedure TfrmDogStatus.EditButtonClick(Sender: TObject);
var
ViewForm : TfrmDogStatus_AE;
id_Locator : Int64;
begin
  if not Is_Admin then
   begin
    messagebox(handle,
    pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
    +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
    pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    exit;
   end;

 if  GridDBView.DataController.RecordCount = 0 then exit;
ViewForm:= TfrmDogStatus_AE.Create(Self, PLanguageIndex);
ViewForm.Caption := cnConsts.cn_EditBtn_Caption[PLanguageIndex];
ViewForm.Name_Edit.Text:=  DM.DataSet['NAME_DOG_STATUS'];
if DM.DataSet['ISVISIBLE_REESTR'] = 1 then
ViewForm.IsVisibleReestrCheckBox.Checked :=true
else
ViewForm.IsVisibleReestrCheckBox.Checked := false;

if DM.DataSet['ISVISIBLE_OPLATA'] = 1 then
ViewForm.IsVisibleOplataCheckBox.Checked :=true
else
ViewForm.IsVisibleOplataCheckBox.Checked := false;


if DM.DataSet['IS_USE_IN_AUTO_RECALC'] = 1
then ViewForm.cxCheckBox1.Checked:=true
else ViewForm.cxCheckBox1.Checked:=false;

 if ViewForm.ShowModal = mrOk then
 begin
     id_Locator:=  DM.DataSet['ID_DOG_STATUS'];
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_INI_DOG_STATUS_UPDATE';
        Prepare;
        ParamByName('ID_DOG_STATUS').AsInt64     := DM.DataSet['ID_DOG_STATUS'];
        ParamByName('NAME_DOG_STATUS').AsString           := ViewForm.Name_Edit.Text;




        if ViewForm.IsVisibleReestrCheckBox.Checked then
         ParamByName('ISVISIBLE_REESTR').AsInteger       := 1
        else
         ParamByName('ISVISIBLE_REESTR').AsInteger       := 0;
        if ViewForm.IsVisibleOplataCheckBox.Checked then
         ParamByName('ISVISIBLE_OPLATA').AsInteger       := 1
        else
         ParamByName('ISVISIBLE_OPLATA').AsInteger       := 0;

        if ViewForm.cxCheckBox1.Checked
        then ParamByName('IS_USE_IN_AUTO_RECALC').AsInteger       := 1
        else ParamByName('IS_USE_IN_AUTO_RECALC').AsInteger       := 0;

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
 DM.DataSet.Locate('ID_DOG_STATUS', id_Locator ,[] );
   end;
end;

procedure TfrmDogStatus.DeleteButtonClick(Sender: TObject);
 var
  i: byte;
begin
  if not Is_Admin then
   begin
    messagebox(handle,
    pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
    +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
    pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    exit;
   end;

  if  GridDBView.DataController.RecordCount = 0 then exit;

  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2))
   then exit
   else
    begin
     with DM.StProc do
      try
       Transaction.StartTransaction;
       StoredProcName := 'CN_INI_DOG_STATUS_DELETE';
       Prepare;
       ParamByName('ID_DOG_STATUS').AsInt64       :=  DM.DataSet['ID_DOG_STATUS'];
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

procedure TfrmDogStatus.GridDBViewDblClick(Sender: TObject);
begin
  if FormStyle = fsNormal then
    SelectButtonClick(Sender)
  else
    EditButtonClick(Sender);
end;

end.
