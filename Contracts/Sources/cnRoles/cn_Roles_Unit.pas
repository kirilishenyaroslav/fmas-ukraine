//******************************************************************************
// Проект "Контракты"
// Справочник групп пользователей
// Чернявский А.Э. 2005г.
//******************************************************************************

unit cn_Roles_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cn_DM_Roles, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cxSplitter, StdCtrls, cxGroupBox, cn_Roles_AE,
  cn_Common_Messages;

type
  TfrmRoles = class(TForm)
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
    full_name: TcxGridDBColumn;
    SelectButton: TdxBarLargeButton;
    cxSplitter1: TcxSplitter;
    Grid_Spec: TcxGrid;
    TableView_Smets: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    SMETA_TITLE: TcxGridDBColumn;
    SMETA_KOD: TcxGridDBColumn;
    cxGroupBox1: TcxGroupBox;
    Group_Label: TLabel;
    Smeta_Label: TLabel;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure TableView_SmetsDblClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM, DM_Detail_1:TDM_ROLES;
    DB_sp_Handle:TISC_DB_HANDLE;
    procedure FormIniLanguage;
  public
    res:Variant;
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmRoles.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
DB_sp_Handle :=DB_Handle;
DM:=TDM_ROLES.Create(Self);
DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_ROLES_SELECT';
DM.DB.Handle:=DB_Handle;
DM.DataSet.Open;
GridDBView.DataController.DataSource := DM.DataSource;

DM_Detail_1:=TDM_ROLES.Create(Self);
DM_Detail_1.DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM CN_ROLES_BY_SMET_SELECT_MD (?ID_ROLE ) order by SMETA_KOD';
DM_Detail_1.DataSet.DataSource:= DM.DataSource;
DM_Detail_1.DB.Handle:=DB_Handle;
DM_Detail_1.DataSet.Open;
TableView_Smets.DataController.DataSource := DM_Detail_1.DataSource;

FormIniLanguage();
Screen.Cursor:=crDefault;
end;

procedure TfrmRoles.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      cnConsts.cn_Main_SpRoles[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

 name.Caption :=                cnConsts.cn_Name_Column[PLanguageIndex];
 full_name.Caption :=           cnConsts.cn_FullName[PLanguageIndex];
 SMETA_KOD.Caption :=           cnConsts.cn_roles_Kod[PLanguageIndex];
 SMETA_TITLE.Caption :=         cnConsts.cn_Name_Column[PLanguageIndex];
 Group_Label.Caption :=         cnConsts.cn_roles_Group[PLanguageIndex];
 Smeta_Label.Caption :=         cnConsts.cn_roles_Smets[PLanguageIndex];

  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmRoles.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmRoles.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FormStyle = fsMDIChild then action:=caFree
else
DM.Free;
end;

procedure TfrmRoles.FormShow(Sender: TObject);
begin
if FormStyle = fsMDIChild then  SelectButton.Enabled:=false;
end;

procedure TfrmRoles.RefreshButtonClick(Sender: TObject);
begin
DM.DataSet.CloseOpen(True);
DM_Detail_1.DataSet.CloseOpen(True);
end;

procedure TfrmRoles.AddButtonClick(Sender: TObject);
var
  frmAddEdit: TfrmAddEdit;
begin
  frmAddEdit := TfrmAddEdit.Create(self, DB_sp_Handle, PLanguageIndex);
  frmAddEdit.Caption :=cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
  frmAddEdit.TextEdit.Text :=  DM.DataSet['Full_Name'];
  if frmAddEdit.ShowModal = mrOk then
   begin
           DM.StProc.StoredProcName := 'CN_ROLES_BY_SMET_INSERT';
           DM.StProc.Transaction.StartTransaction;
           DM.StProc.Prepare;
           DM.StProc.ParamByName('ID_ROLE').AsInt64     := DM.DataSet['ID_ROLE'];
           DM.StProc.ParamByName('ID_SMETA').AsInt64     := frmAddEdit.ID_SMET;
           DM.StProc.ExecProc;
           DM.StProc.Transaction.Commit;
           DM_Detail_1.DataSet.CloseOpen(True);
   end;
   frmAddEdit.Free;
end;

procedure TfrmRoles.EditButtonClick(Sender: TObject);
var
  frmAddEdit: TfrmAddEdit;
begin
if TableView_Smets.DataController.RecordCount = 0 then exit;

  frmAddEdit := TfrmAddEdit.Create(self, DB_sp_Handle, PLanguageIndex);
  frmAddEdit.Caption :=cnConsts.cn_EditBtn_Caption[PLanguageIndex];
  frmAddEdit.TextEdit.Text :=   DM.DataSet['Full_Name'];
  frmAddEdit.Smeta_Edit.Text := DM_Detail_1.DataSet['SMETA_KOD'];
  frmAddEdit.Smeta_description_Label.Caption := DM_Detail_1.DataSet['SMETA_TITLE'];
  frmAddEdit.ID_SMET := DM_Detail_1.DataSet['ID_SMETA'];

  if frmAddEdit.ShowModal = mrOk then
   begin
           DM.StProc.StoredProcName := 'CN_ROLES_BY_SMET_DELETE';
           DM.StProc.Transaction.StartTransaction;
           DM.StProc.Prepare;
           DM.StProc.ParamByName('ID_ROLE').AsInt64     := DM.DataSet['ID_ROLE'];
           DM.StProc.ParamByName('ID_SMETA').AsInt64    := DM_Detail_1.DataSet['ID_SMETA'];
           DM.StProc.ExecProc;

           DM.StProc.StoredProcName := 'CN_ROLES_BY_SMET_INSERT';
           DM.StProc.Transaction.StartTransaction;
           DM.StProc.Prepare;
           DM.StProc.ParamByName('ID_ROLE').AsInt64     := DM.DataSet['ID_ROLE'];
           DM.StProc.ParamByName('ID_SMETA').AsInt64     := frmAddEdit.ID_SMET;
           DM.StProc.ExecProc;
           DM.StProc.Transaction.Commit;
           DM_Detail_1.DataSet.CloseOpen(True);
   end;
   frmAddEdit.Free;
end;

procedure TfrmRoles.TableView_SmetsDblClick(Sender: TObject);
begin
EditButtonClick(Sender);
end;

procedure TfrmRoles.DeleteButtonClick(Sender: TObject);
var i: integer;
begin
if TableView_Smets.DataController.RecordCount = 0 then exit;
 i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
 if ((i = 7) or (i= 2)) then exit;

           DM.StProc.StoredProcName := 'CN_ROLES_BY_SMET_DELETE';
           DM.StProc.Transaction.StartTransaction;
           DM.StProc.Prepare;
           DM.StProc.ParamByName('ID_ROLE').AsInt64     := DM.DataSet['ID_ROLE'];
           DM.StProc.ParamByName('ID_SMETA').AsInt64    := DM_Detail_1.DataSet['ID_SMETA'];
           DM.StProc.ExecProc;
           DM.StProc.Transaction.Commit;
           DM_Detail_1.DataSet.CloseOpen(True);
end;

end.
