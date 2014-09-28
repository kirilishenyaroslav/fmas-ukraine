//******************************************************************************
// Проект "Контракты"
// Справочник типов приказов
// Чернявский А.Э. 2006г.
// последние изменения Перчак А.Л. 28/09/2010
//******************************************************************************

unit cn_sp_OrderTypes_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  DM_spo, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cn_sp_OrderTypes_Unit_AE, cnConsts_Messages, cn_Common_Types, cn_Common_Messages,
  Placemnt;

type
  TfrmOrderTypes = class(TForm)
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
    procedure GridDBViewDblClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TDM;
    procedure FormIniLanguage;
  public
    res:Variant;
    Is_admin:Boolean;
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;is_admin:boolean);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmOrderTypes.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;is_admin:boolean);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 DM:=TDM.Create(Self);
 DM.DataSet.SQLs.SelectSQL.Text := 'select * from ST_INI_ORDTYPES_SELECT';
 DM.DB.Handle:=DB_Handle;
 DM.DataSet.Open;
 GridDBView.DataController.DataSource := DM.DataSource;
 FormIniLanguage();
 Self.Is_admin:=is_admin;
 Screen.Cursor:=crDefault;
 CnFormStorage.RestoreFormPlacement;
end;

procedure TfrmOrderTypes.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      cnConsts.cn_Main_SpOrderTypes[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

  name.Caption:=                cnConsts.cn_Name_Column[PLanguageIndex];
  
  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmOrderTypes.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmOrderTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CnFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild then action:=caFree
  else
  DM.Free;
end;

procedure TfrmOrderTypes.SelectButtonClick(Sender: TObject);
var id_sp: int64;
begin
Res:=VarArrayCreate([0,3],varVariant);
id_sp:= DM.DataSet['ID_ORDER'];
Res[0]:= id_sp;
Res[1]:=DM.DataSet['NAME'];
Res[2]:=DM.DataSet['SHORT_NAME'];
ModalResult:=mrOk;
end;

procedure TfrmOrderTypes.FormShow(Sender: TObject);
begin
if FormStyle = fsMDIChild then  SelectButton.Enabled:=false;
end;

procedure TfrmOrderTypes.AddButtonClick(Sender: TObject);
var
ViewForm : TfrmOrderTypes_Ae;
New_id_Locator : int64;
begin
   if not Is_Admin then
   if CheckPermission('/ROOT/Contracts/Cn_Sp','Add') <> 0
    then
     begin
      messagebox(handle,
      pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
      +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
      pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;
ViewForm:= TfrmOrderTypes_Ae.Create(Self, PLanguageIndex);
ViewForm.Caption := cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 if ViewForm.ShowModal = mrOk then
 begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'ST_INI_ORDTYPES_INSERT';
        Prepare;
        ParamByName('NAME').AsString       := ViewForm.Name_Edit.Text;
        ParamByName('SHORT_NAME').AsString := ViewForm.ShortName_Edit.text;
        ExecProc;
        New_id_Locator:=ParamByName('ID_ORDER').AsInt64;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_ORDER',New_id_Locator,[] );
   end;
end;

procedure TfrmOrderTypes.EditButtonClick(Sender: TObject);
var
ViewForm : TfrmOrderTypes_Ae;
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
ViewForm:= TfrmOrderTypes_Ae.Create(Self, PLanguageIndex);
ViewForm.Caption := cnConsts.cn_EditBtn_Caption[PLanguageIndex];
ViewForm.Name_Edit.Text:=  DM.DataSet['NAME'];
ViewForm.ShortName_Edit.Text:=  DM.DataSet['SHORT_NAME'];
 if ViewForm.ShowModal = mrOk then
 begin
     id_Locator:=  DM.DataSet['ID_ORDER'];
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'ST_INI_ORDTYPES_UPDATE';
        Prepare;
        ParamByName('ID_ORDER').AsInt64     := DM.DataSet['ID_ORDER'];
        ParamByName('NAME').AsString           := ViewForm.Name_Edit.Text;
        ParamByName('SHORT_NAME').AsString     := ViewForm.ShortName_Edit.text;
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
 DM.DataSet.Locate('ID_ORDER', id_Locator ,[] );
   end;
end;


procedure TfrmOrderTypes.GridDBViewDblClick(Sender: TObject);
begin
if FormStyle = fsNormal then SelectButtonClick(Sender)
else  EditButtonClick(Sender);
end;

procedure TfrmOrderTypes.DeleteButtonClick(Sender: TObject);
 var
  i: byte;
begin
   if not Is_Admin then
   if CheckPermission('/ROOT/Contracts/Cn_Sp','Del') <> 0
    then
     begin
      messagebox(handle,
      pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
      +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
      pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  If GridDBView.DataController.RecordCount = 0 then exit;

  {DM.ReadDataSet.Close;
  DM.ReadDataSet.SQLs.SelectSQL.Text := '';
  DM.ReadDataSet.ParamByName('')
  DM.ReadDataSet.Open;

  if not DM.ReadDataSet.IsEmpty then
   Begin
    cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_NonDeleteDependet[PLanguageIndex], mtInformation, [mbYes]);
    exit;
   End;} 

  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit
  else
  begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'ST_INI_ORDTYPES_DELETE';
        Prepare;
        ParamByName('ID_ORDER').AsInt64       :=  DM.DataSet['ID_ORDER'];
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

procedure TfrmOrderTypes.RefreshButtonClick(Sender: TObject);
var
id_Locator : Int64;
begin
 Screen.Cursor := crHourGlass;
 id_Locator    :=  DM.DataSet['ID_ORDER'];
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_ORDER', id_Locator ,[] );
 Screen.Cursor := crDefault;
end;

end.
