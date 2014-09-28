//******************************************************************************
// Проект "Контракты"
// Справочник типов контрактов
// Чернявский А.Э. 17.12.2006г.
// последние изменения Перчак А.Л. 29/10/2008
//******************************************************************************

unit cn_DogType_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cn_DogTypeDM, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cn_DogType_Unit_AE, cn_Common_Messages, cnConsts_Messages,
  cxCheckBox, cn_Common_Types, Placemnt;

type
  TfrmTypeDog = class(TForm)
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
    ISMAINDOG_col: TcxGridDBColumn;
    code_col: TcxGridDBColumn;
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
  private
    PLanguageIndex: byte;
    DM:TDM;
    procedure FormIniLanguage;
  public
    res:Variant;
    Is_admin:Boolean;
    constructor  Create(AParameter:TcnSimpleParams);reintroduce;
  end;


implementation

uses cxCurrencyEdit;

{$R *.dfm}

constructor TfrmTypeDog.Create(AParameter:TcnSimpleParams);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AParameter.Owner);
DM:=TDM.Create(Self);
DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_INI_TYPE_DOG_SELECT ORDER BY CODENAME';
DM.DB.Handle:=AParameter.Db_Handle;
DM.DataSet.Open;
GridDBView.DataController.DataSource := DM.DataSource;
if AParameter.ID_Locate <> null
then
DM.DataSet.Locate('ID_TYPE_DOG', AParameter.ID_Locate, [] );
FormIniLanguage();
   Is_admin:=AParameter.is_admin;
Screen.Cursor:=crDefault;
  CnFormStorage.RestoreFormPlacement;
end;

procedure TfrmTypeDog.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      cnConsts.cn_Main_SpTypeDog[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

 name.Caption:=                cnConsts.cn_Name_Column[PLanguageIndex];
 ISMAINDOG_col.caption:=       cnConsts.cn_BasicContract[PLanguageIndex];
 code_col.caption:=       cnConsts.cn_roles_Kod[PLanguageIndex];
  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmTypeDog.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmTypeDog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CnFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild then action:=caFree
  else
  DM.Free;
end;

procedure TfrmTypeDog.SelectButtonClick(Sender: TObject);
var id_sp: int64;
begin
Res:=VarArrayCreate([0,4],varVariant);
id_sp:= DM.DataSet['ID_TYPE_DOG'];
Res[0]:= id_sp;
Res[1]:=DM.DataSet['CODENAME'];
Res[2]:=DM.DataSet['NAME'];
Res[3]:=DM.DataSet['ISMAINDOG'];
ModalResult:=mrOk;
end;

procedure TfrmTypeDog.FormShow(Sender: TObject);
begin
if FormStyle = fsMDIChild then  SelectButton.Enabled:=false;
end;

procedure TfrmTypeDog.AddButtonClick(Sender: TObject);
var
  ViewForm: TfrmAE;
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
ViewForm:= TfrmAE.Create(Self, PLanguageIndex);
ViewForm.Caption := cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 if ViewForm.ShowModal = mrOk then
 begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_INI_TYPE_DOG_INSERT';
        Prepare;
        ParamByName('CODENAME').AsString   := ViewForm.CodeEdit.Text;
        ParamByName('NAME').AsString       := ViewForm.Name_Edit.Text;
        if ViewForm.ISMAINDOG_checkbox.Checked then
         ParamByName('ISMAINDOG').AsInteger       := 1
        else
         ParamByName('ISMAINDOG').AsInteger       := 0;
         ParamByName('REPORT_NAME').AsString      := ViewForm.ReportEdit.Text;
         ParamByName('COPYPRINTCOUNT').AsCurrency :=  ViewForm.CopyPrintCount_Edit.Value;
        ExecProc;
        New_id_Locator:=ParamByName('ID_TYPE_DOG').AsInt64;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          Transaction.Rollback;
          raise;
         end;
       end;
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_TYPE_DOG',New_id_Locator,[] );
   end;
end;


procedure TfrmTypeDog.EditButtonClick(Sender: TObject);
var
ViewForm : TfrmAE;
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
ViewForm:= TfrmAE.Create(Self, PLanguageIndex);
ViewForm.Caption := cnConsts.cn_EditBtn_Caption[PLanguageIndex];
if DM.DataSet['CODENAME'] <> null then
 ViewForm.CodeEdit.Text := DM.DataSet['CODENAME'];
ViewForm.Name_Edit.Text:=  DM.DataSet['NAME'];
if DM.DataSet['ISMAINDOG'] = 1 then
 ViewForm.ISMAINDOG_checkbox.Checked := true
else
 ViewForm.ISMAINDOG_checkbox.Checked := false;
 ViewForm.CopyPrintCount_Edit.Value := DM.DataSet['COPYPRINTCOUNT'];

ViewForm.ReportEdit.Text:= DM.DataSet['REPORT_NAME'];
 
 if ViewForm.ShowModal = mrOk then
 begin
     id_Locator:=  DM.DataSet['ID_TYPE_DOG'];
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_INI_TYPE_DOG_UPDATE';
        Prepare;
        ParamByName('ID_TYPE_DOG').AsInt64     := DM.DataSet['ID_TYPE_DOG'];
        ParamByName('CODENAME').AsString       := ViewForm.CodeEdit.Text;        
        ParamByName('NAME').AsString           := ViewForm.Name_Edit.Text;
        if ViewForm.ISMAINDOG_checkbox.Checked then
         ParamByName('ISMAINDOG').AsInteger       := 1
        else
         ParamByName('ISMAINDOG').AsInteger       := 0;
        ParamByName('REPORT_NAME').AsString       := ViewForm.ReportEdit.Text;
        ParamByName('COPYPRINTCOUNT').AsCurrency :=  ViewForm.CopyPrintCount_Edit.Value;
        ExecProc;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          Transaction.Rollback;
          raise;
         end;
       end;
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_TYPE_DOG', id_Locator ,[] );
   end;
end;

procedure TfrmTypeDog.DeleteButtonClick(Sender: TObject);
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

  if GridDBView.DataController.RecordCount = 0 then exit;

  DM.ReadDataSet.Close;
  DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from cn_dt_dog d where d.id_type_dog = :id_type_dog';
  DM.ReadDataSet.ParamByName('ID_TYPE_DOG').AsInt64 := DM.DataSet['ID_TYPE_DOG'];
  DM.ReadDataSet.Open;

  if not DM.ReadDataSet.IsEmpty then
   begin
    cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_NonDeleteDependet[PLanguageIndex], mtInformation, [mbYes]);
    exit;
   end;

  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit
  else
  begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_INI_TYPE_DOG_DELETE';
        Prepare;
        ParamByName('ID_TYPE_DOG').AsInt64       :=  DM.DataSet['ID_TYPE_DOG'];
        ExecProc;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          Transaction.Rollback;
          raise;
         end;
       end;
 DM.DataSet.CloseOpen(True);
   end;
end;

procedure TfrmTypeDog.RefreshButtonClick(Sender: TObject);
begin
 DM.DataSet.CloseOpen(True);
end;

procedure TfrmTypeDog.GridDBViewDblClick(Sender: TObject);
begin
if FormStyle = fsNormal then SelectButtonClick(Sender)
else  EditButtonClick(Sender);
end;

end.
