//******************************************************************************
// Проект "Контракты"
// Справочник действий
// Чернявский А.Э. 2006г.
// последние изменения Перчак А.Л. 29/10/2008
//******************************************************************************

unit cn_Actions_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cn_DM_Actions, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cn_Common_Types, cn_Actions_AE,
  cnConsts_Messages, cn_Common_Messages, Placemnt;

type
  TfrmActions = class(TForm)
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
    SelectButton: TdxBarLargeButton;
    NAME: TcxGridDBColumn;
    FULL_NAME: TcxGridDBColumn;
    CnFormStorage: TFormStorage;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TDM_Action;
    procedure FormIniLanguage;
  public
    res:Variant;
    Is_admin:Boolean;
    constructor  Create(AParameter:TcnSimpleParams);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmActions.Create(AParameter:TcnSimpleParams);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AParameter.Owner);
 DM:=TDM_Action.Create(Self);
 DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_ACTION_LIST_SELECT';
 DM.DB.Handle:=AParameter.DB_Handle;
 DM.DataSet.Open;
 GridDBView.DataController.DataSource := DM.DataSource;
 FormIniLanguage();
   Is_admin:=AParameter.is_admin;
 Screen.Cursor:=crDefault;
  CnFormStorage.RestoreFormPlacement;
end;

procedure TfrmActions.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      cnConsts.cn_Main_SpActions[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

 name.Caption :=                cnConsts.cn_ShortName[PLanguageIndex];
 full_name.Caption :=           cnConsts.cn_FullName[PLanguageIndex];
  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmActions.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmActions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CnFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild then action:=caFree
  else
  DM.Free;
end;

procedure TfrmActions.FormShow(Sender: TObject);
begin
if FormStyle = fsMDIChild then  SelectButton.Enabled:=false;
end;

procedure TfrmActions.AddButtonClick(Sender: TObject);
var
ViewForm : TfrmActions_AE;
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

ViewForm:= TfrmActions_AE.Create(Self, PLanguageIndex);
ViewForm.Caption := cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 if ViewForm.ShowModal = mrOk then
 begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_ACTION_LIST_INSERT';
        Prepare;
        ParamByName('NAME').AsString      := ViewForm.ShortName_Edit.text;
        ParamByName('FULL_NAME').AsString := ViewForm.Name_Edit.Text;
        ExecProc;
        New_id_Locator:=ParamByName('ID_ACTION').AsInt64;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_ACTION',New_id_Locator,[] );
   end;
end;

procedure TfrmActions.EditButtonClick(Sender: TObject);
var
ViewForm : TfrmActions_AE;
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
ViewForm:= TfrmActions_AE.Create(Self, PLanguageIndex);
ViewForm.Caption := cnConsts.cn_EditBtn_Caption[PLanguageIndex];
ViewForm.ShortName_Edit.Text:=  DM.DataSet['NAME'];
ViewForm.Name_Edit.Text:=  DM.DataSet['FULL_NAME'];
 if ViewForm.ShowModal = mrOk then
 begin
     id_Locator:=  DM.DataSet['ID_ACTION'];
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_ACTION_LIST_UPDATE';
        Prepare;
        ParamByName('ID_ACTION').AsInt64       := DM.DataSet['ID_ACTION'];
        ParamByName('NAME').AsString           := ViewForm.ShortName_Edit.Text;
        ParamByName('FULL_NAME').AsString      := ViewForm.Name_Edit.text;
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
 DM.DataSet.Locate('ID_ACTION', id_Locator ,[] );
   end;
end;

procedure TfrmActions.DeleteButtonClick(Sender: TObject);
Var
  i: byte;
Begin
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
  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit
  else
  begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_ACTION_LIST_DELETE';
        Prepare;
        ParamByName('ID_ACTION').AsInt64       :=  DM.DataSet['ID_ACTION'];
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

procedure TfrmActions.RefreshButtonClick(Sender: TObject);
var
id_Locator : Int64;
begin
 Screen.Cursor := crHourGlass;
 id_Locator    :=  DM.DataSet['ID_ACTION'];
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_ACTION', id_Locator ,[] );
 Screen.Cursor := crDefault;
end;

procedure TfrmActions.GridDBViewDblClick(Sender: TObject);
begin
if GridDBView.DataController.RecordCount = 0 then exit;
EditButtonClick(Sender);
end;

end.
