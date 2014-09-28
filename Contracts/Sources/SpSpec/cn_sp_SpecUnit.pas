//******************************************************************************
// Проект "Контракты"
// Справочник специальностей
// Чернявский А.Э. 2006г.
// последние изменения Перчак А.Л. 29/10/2008
//******************************************************************************

unit cn_sp_SpecUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cn_DM_Spec, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cn_sp_SpecUnit_AE, cn_Common_Messages,
  cnConsts_Messages, ActnList, Placemnt, cxCheckBox, cn_Common_Types;

type
  TfrmSpSpec = class(TForm)
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
    Name_Colmn: TcxGridDBColumn;
    CODE_SPEC_Colmn: TcxGridDBColumn;
    SelectButton: TdxBarLargeButton;
    id_spec_clmn: TcxGridDBColumn;
    Search_BarEdit: TdxBarEdit;
    Contracts_ActionList: TActionList;
    FilterAction: TAction;
    GridDBViewDBColumn1: TcxGridDBColumn;
    full_name_col: TcxGridDBColumn;
    CnFormStorage: TFormStorage;
    deleted_Column: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
    procedure FilterActionExecute(Sender: TObject);
    procedure Search_BarEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridDBViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    PLanguageIndex: byte;
    DM:TDM_Spec;
    procedure FormIniLanguage;
  public
    res:Variant;
    Is_admin:Boolean;
    constructor  Create(AParameter:TcnSimpleParams);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmSpSpec.Create(AParameter:TcnSimpleParams);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AParameter.Owner);
  DM:=TDM_Spec.Create(Self);
  DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_SP_SPEC_SELECT';
  
  If AParameter.Formstyle = fsNormal then
   Begin
    DM.DataSet.SQLs.SelectSQL.add('where is_deleted=0');
    deleted_Column.Visible := False;
   end;

  DM.DB.Handle:=AParameter.DB_Handle;
  DM.DataSet.Open;
  DM.DataSet.FetchAll;
  GridDBView.DataController.DataSource := DM.DataSource;
  FormIniLanguage();
  Self.Is_admin:=AParameter.is_admin;
  Screen.Cursor:=crDefault;
  CnFormStorage.RestoreFormPlacement;
end;

procedure TfrmSpSpec.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      cnConsts.cn_Main_SpSpec[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

 Search_BarEdit.Caption :=      cnConsts.cn_SearchBtn_Caption[PLanguageIndex];

  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

 Name_Colmn.Caption :=        cnConsts.cn_Name_Column[PLanguageIndex];
 CODE_SPEC_Colmn.Caption :=   cnConsts.cn_roles_Kod[PLanguageIndex];
end;

procedure TfrmSpSpec.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmSpSpec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CnFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild then action:=caFree
  else
  DM.Free;
end;

procedure TfrmSpSpec.SelectButtonClick(Sender: TObject);
var
    RecMultiSelected, i: integer;
begin
if GridDBView.datacontroller.recordcount = 0 then exit;
 if GridDBView.OptionsSelection.MultiSelect=true then
  begin
   RecMultiSelected:= GridDBView.DataController.GetSelectedCount;
   res:=VarArrayCreate([0,RecMultiSelected-1],varVariant);
   for i:=0 to GridDBView.DataController.GetSelectedCount-1 do
     begin
      res[i]:=VarArrayOf([
                         GridDBView.Controller.SelectedRecords[i].Values[0], // id_spec
                         GridDBView.Controller.SelectedRecords[i].Values[1], // code
                         GridDBView.Controller.SelectedRecords[i].Values[2], // name
                         GridDBView.Controller.SelectedRecords[i].Values[3], // shortname,
                         GridDBView.Controller.SelectedRecords[i].Values[4] // fullname
                        ]);
     end;
  end;
ModalResult:=mrOk;
end;

procedure TfrmSpSpec.FormShow(Sender: TObject);
begin
if FormStyle = fsMDIChild then
 begin
  SelectButton.Visible:=ivNever;
  GridDBView.OptionsSelection.MultiSelect:= False;
 end;
end;

procedure TfrmSpSpec.AddButtonClick(Sender: TObject);
var
ViewForm : TfrmSpec_AE;
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
ViewForm:= TfrmSpec_AE.Create(Self, PLanguageIndex);
ViewForm.Caption := cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
ViewForm.cxcheckDelete.Enabled:=False;
 if ViewForm.ShowModal = mrOk then
 begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_SP_SPEC_INSERT';
        Prepare;
        ParamByName('NAME').AsString       := ViewForm.NameStage_Edit.Text;
        ParamByName('CODE_SPEC').AsString  := ViewForm.cnCode_Edit.Text;
        ParamByName('SHORT_NAME').AsString  := ViewForm.ShortName_Edit.Text;
        ParamByName('FULL_NAME').AsString  := ViewForm.FullName_Edit.Text;
        ExecProc;
        New_id_Locator:=ParamByName('ID_SPEC').AsInt64;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_SPEC',New_id_Locator,[] );
   end;
end;

procedure TfrmSpSpec.RefreshButtonClick(Sender: TObject);
var
id_Locator : Int64;
begin
 Screen.Cursor := crHourGlass;
 id_Locator    :=  DM.DataSet['ID_SPEC'];
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_SPEC', id_Locator ,[] );
 Screen.Cursor := crDefault;
end;

procedure TfrmSpSpec.EditButtonClick(Sender: TObject);
var
ViewForm : TfrmSpec_AE;
id_Locator : Int64;
begin
  if not Is_Admin then
   if CheckPermission('/ROOT/Contracts/Cn_Sp','Edit') <> 0 then
    begin
     messagebox(handle,
     pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
     +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
     pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  if GridDBView.DataController.RecordCount = 0 then exit;

  ViewForm:= TfrmSpec_AE.Create(Self, PLanguageIndex);
  ViewForm.Caption := cnConsts.cn_EditBtn_Caption[PLanguageIndex];
  if DM.DataSet['NAME']<>null
   then ViewForm.NameStage_Edit.Text:=  DM.DataSet['NAME'];
  if DM.DataSet['CODE_SPEC'] <> null
   then ViewForm.cnCode_Edit.Text:=  DM.DataSet['CODE_SPEC'];
  if DM.DataSet['SHORT_NAME'] <> null
   then ViewForm.ShortName_Edit.Text:=  DM.DataSet['SHORT_NAME'];
  if DM.DataSet['FULL_NAME'] <> null
   then ViewForm.FullName_Edit.Text:=  DM.DataSet['FULL_NAME'];
  if DM.DataSet['is_deleted'] = 1
   then ViewForm.cxCheckDelete.Checked:=  true;

  if ViewForm.ShowModal = mrOk then
   begin
    id_Locator:=  DM.DataSet['ID_SPEC'];
     with DM.StProc do
      try
       Transaction.StartTransaction;
       StoredProcName := 'CN_SP_SPEC_UPDATE';
       Prepare;
       ParamByName('ID_SPEC').AsInt64     := DM.DataSet['ID_SPEC'];
       ParamByName('NAME').AsString       := ViewForm.NameStage_Edit.Text;
       ParamByName('CODE_SPEC').AsString  := ViewForm.cnCode_Edit.Text;
       ParamByName('SHORT_NAME').AsString  := ViewForm.ShortName_Edit.Text;
       ParamByName('FULL_NAME').AsString  := ViewForm.FullName_Edit.Text;
       if ViewForm.cxCheckDelete.Checked
        then ParamByName('IS_DELETED').Value  := 1
        else ParamByName('IS_DELETED').Value  := 0;
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
    DM.DataSet.Locate('ID_SPEC', id_Locator ,[] );
    Grid.SetFocus;
   end;
end;

procedure TfrmSpSpec.DeleteButtonClick(Sender: TObject);
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
 if GridDBView.DataController.RecordCount = 0 then exit;

  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit
  else
  begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_SP_SPEC_DELETE';
        Prepare;
        ParamByName('ID_SPEC').AsInt64       :=  DM.DataSet['ID_SPEC'];
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

procedure TfrmSpSpec.GridDBViewDblClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then EditButtonClick(Sender)
 else
 SelectButtonClick(Sender);
end;

procedure TfrmSpSpec.FilterActionExecute(Sender: TObject);
begin
Search_BarEdit.Setfocus;
end;

procedure TfrmSpSpec.Search_BarEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_return  then
 begin
   DM.DataSet.Close;
   DM.DataSet.SelectSQL.Clear;
   DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_SP_SPEC_SEARCH(' + ''''+Search_BarEdit.Text +''''+ ')';
   DM.DataSet.Open;
 end;
end;

procedure TfrmSpSpec.GridDBViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_delete then DeleteButtonClick(Sender); 
end;

end.
