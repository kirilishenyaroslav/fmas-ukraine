//******************************************************************************
// Проект "Контракты"
// Справочник подписей
// Чернявский А.Э. 2006г.
// последние изменения Перчак А.Л. 29/10/2008
//******************************************************************************

unit cn_Sig_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cn_DM_Sig, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cn_Sig_Unit_AE, cn_Common_Messages, cnConsts_Messages;

type
  TfrmSig = class(TForm)
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
    PODPIS: TcxGridDBColumn;
    Name: TcxGridDBColumn;
    NAMEREP_col: TcxGridDBColumn;
    TAG_ORDER_col: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TDM_Sig;
    procedure FormIniLanguage;
  public
    res:Variant;
    Is_admin:Boolean;
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;is_admin:boolean);reintroduce;
  end;


implementation

uses cxCurrencyEdit;

{$R *.dfm}

constructor TfrmSig.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;is_admin:boolean);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
DM:=TDM_Sig.Create(Self);
DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_FR_JOIN_PODPIS_NAMEREP_SLT';
DM.DB.Handle:=DB_Handle;
DM.DataSet.Open;
GridDBView.DataController.DataSource := DM.DataSource;
FormIniLanguage();
   Self.Is_admin:=is_admin;
Screen.Cursor:=crDefault;
end;

procedure TfrmSig.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      cnConsts.cn_Main_SpSignature[PLanguageIndex];

 Podpis.Caption :=              cnConsts.cn_Signature[PLanguageIndex];
 Name.Caption :=                cnConsts.cn_grid_FIO_Column[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
 NAMEREP_col.Caption :=         cnConsts.cn_Zvit[PLanguageIndex];
 TAG_ORDER_col.Caption :=       cnConsts.cn_TagOrder[PLanguageIndex];
  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmSig.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmSig.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FormStyle = fsMDIChild then action:=caFree
else
DM.Free;
end;

procedure TfrmSig.SelectButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TfrmSig.FormShow(Sender: TObject);
begin
if FormStyle = fsMDIChild then  SelectButton.Enabled:=false;
end;

procedure TfrmSig.AddButtonClick(Sender: TObject);
var
ViewForm : TfrmSig_AE;
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
ViewForm:= TfrmSig_AE.Create(Self, Dm.DB.Handle, PLanguageIndex);
ViewForm.Caption := cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
ViewForm.ID_NAMEREP:= -1;

 if ViewForm.ShowModal = mrOk then
 begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_FR_JOIN_PODPIS_NAMEREP_INS';
        Prepare;
        ParamByName('PODPIS').AsString       := ViewForm.Name_Edit.Text;
        ParamByName('NAME').AsString         := ViewForm.ShortName_Edit.text;
        ParamByName('ID_NAMEREP').AsInt64    := ViewForm.ID_NAMEREP;
        ParamByName('TAG_ORDER').AsCurrency  := ViewForm.TagOrder_Edit.Value;                
        ExecProc;
        New_id_Locator:=ParamByName('ID_JOIN').AsInt64;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_JOIN',New_id_Locator,[] );
   end;
end;

procedure TfrmSig.EditButtonClick(Sender: TObject);
var
ViewForm : TfrmSig_AE;
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
ViewForm:= TfrmSig_AE.Create(Self, Dm.DB.Handle, PLanguageIndex);
ViewForm.Caption := cnConsts.cn_EditBtn_Caption[PLanguageIndex];
ViewForm.Name_Edit.Text:=  DM.DataSet['PODPIS'];
ViewForm.ShortName_Edit.Text:=  DM.DataSet['NAME'];
ViewForm.ID_NAMEREP:=  DM.DataSet['ID_NAMEREP'];
ViewForm.NameRep_Edit.Text :=  DM.DataSet['NAMEREP'];
ViewForm.TagOrder_Edit.Value :=  DM.DataSet['TAG_ORDER'];

if ViewForm.ShowModal = mrOk then
 begin
     id_Locator:=  DM.DataSet['ID_JOIN'];
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_FR_JOIN_PODPIS_NAMEREP_UPT';
        Prepare;
        ParamByName('ID_JOIN').AsInt64       := Dm.DataSet['ID_JOIN'];
        ParamByName('ID_PK').AsInt64         := Dm.DataSet['ID_PK'];
        ParamByName('PODPIS').AsString       := ViewForm.Name_Edit.Text;
        ParamByName('NAME').AsString         := ViewForm.ShortName_Edit.text;
        ParamByName('ID_NAMEREP').AsInt64    := ViewForm.ID_NAMEREP;
        ParamByName('TAG_ORDER').AsCurrency  := ViewForm.TagOrder_Edit.Value;      
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
 DM.DataSet.Locate('ID_JOIN', id_Locator ,[] );
   end;
end;


procedure TfrmSig.DeleteButtonClick(Sender: TObject);
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
        StoredProcName := 'CN_FR_JOIN_PODPIS_NAMEREP_DLT';
        Prepare;
        ParamByName('ID_PK').AsInt64       :=  DM.DataSet['ID_PK'];
        ParamByName('ID_JOIN').AsInt64     :=  DM.DataSet['ID_JOIN'];
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

procedure TfrmSig.RefreshButtonClick(Sender: TObject);
begin
 if  GridDBView.DataController.RecordCount = 0 then exit;
 Screen.Cursor := crHourGlass;
 DM.DataSet.CloseOpen(True);
 Screen.Cursor := crDefault;
end;

procedure TfrmSig.GridDBViewDblClick(Sender: TObject);
begin
EditButtonClick(Sender);
end;

end.
