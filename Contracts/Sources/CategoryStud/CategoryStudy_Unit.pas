//******************************************************************************
// Проект "Контракты"
// Справочник категорий обучения
// Чернявский А.Э. 2005г.
// последние изменения Перчак А.Л. 29/10/2008
//******************************************************************************

unit CategoryStudy_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, DM_CategoryStudy, CategoryStudy_Add_Edit, cn_Common_Messages, cnConsts_Messages,
  Menus, cn_Common_Types, Placemnt, cxCheckBox;

type
  TfrmCategoryStudy = class(TForm)
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
    PopupMenu1: TPopupMenu;
    AddPop: TMenuItem;
    EditPop: TMenuItem;
    DeletePop: TMenuItem;
    RefreshPop: TMenuItem;
    ExitPop: TMenuItem;
    CnFormStorage: TFormStorage;
    Column_SCIENSE: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure AddPopClick(Sender: TObject);
    procedure EditPopClick(Sender: TObject);
    procedure DeletePopClick(Sender: TObject);
    procedure RefreshPopClick(Sender: TObject);
    procedure ExitPopClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TDM_CS;
    procedure FormIniLanguage;
  public
    res:Variant;
    Is_admin:Boolean;
    constructor  Create(AParameter:TcnSimpleParams);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmCategoryStudy.Create(AParameter:TcnSimpleParams);
begin
   Screen.Cursor:=crHourGlass;
   inherited Create(AParameter.Owner);
   DM:=TDM_CS.Create(Self);
   DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_SP_KAT_STUD_SELECT';
   DM.DB.Handle:=AParameter.DB_Handle;
   DM.DataSet.Open;
   GridDBView.DataController.DataSource := DM.DataSource;
   if AParameter.ID_Locate <> null
   then
   DM.DataSet.Locate('ID_KAT_STUD', AParameter.ID_Locate, [] );
   FormIniLanguage();
   Is_admin:=AParameter.is_admin;   
   Screen.Cursor:=crDefault;
   CnFormStorage.RestoreFormPlacement;
end;

procedure TfrmCategoryStudy.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      cnConsts.cn_Main_CategoryStudy[PLanguageIndex];
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
  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmCategoryStudy.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmCategoryStudy.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CnFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild then action:=caFree
  else
  DM.Free;
end;

procedure TfrmCategoryStudy.SelectButtonClick(Sender: TObject);
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
      Res:=VarArrayCreate([0,3],varVariant);
      id_sp:= DM.DataSet['ID_KAT_STUD'];
      Res[0]:= id_sp;
      Res[1]:=DM.DataSet['NAME'];
      Res[2]:=DM.DataSet['SHORT_NAME'];
      Res[3]:=DM.DataSet['ID_SP_TYPE_KAT_STUD'];
    end;
ModalResult:=mrOk;
end;

procedure TfrmCategoryStudy.FormShow(Sender: TObject);
begin
if FormStyle = fsMDIChild then  SelectButton.Visible:=ivNever;
end;

procedure TfrmCategoryStudy.GridDBViewDblClick(Sender: TObject);
begin
if FormStyle = fsNormal then SelectButtonClick(Sender)
else  EditButtonClick(Sender);
end;

procedure TfrmCategoryStudy.AddButtonClick(Sender: TObject);
var
ViewForm : TfrmCatStud_Add_Edit;
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
ViewForm:= TfrmCatStud_Add_Edit.Create(Self, PLanguageIndex);
ViewForm.Caption := cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
ViewForm.DB_Handle := DM.DB.Handle;
ViewForm.ID_NAME := -1;
 if ViewForm.ShowModal = mrOk then
 begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_SP_KAT_STUD_INSERT';
        Prepare;
        ParamByName('NAME').AsString       := ViewForm.Name_Edit.Text;
        ParamByName('SHORT_NAME').AsString := ViewForm.ShortName_Edit.text;
        if ViewForm.ID_NAME <> -1 then
         ParamByName('ID_SP_TYPE_KAT_STUD').AsInt64 := ViewForm.ID_NAME;
        IF ViewForm.Check_IS_SCIENCE.Checked
         then ParamByName('IS_SCIENCE').AsString := 'T'
         else ParamByName('IS_SCIENCE').AsString := 'F';
        ExecProc;
        New_id_Locator:=ParamByName('ID_KAT_STUD').AsInt64;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_KAT_STUD',New_id_Locator,[] );
   end;
end;

procedure TfrmCategoryStudy.EditButtonClick(Sender: TObject);
var
ViewForm : TfrmCatStud_Add_Edit;
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
 ViewForm:= TfrmCatStud_Add_Edit.Create(Self, PLanguageIndex);
 ViewForm.Caption := cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 ViewForm.Name_Edit.Text:=  DM.DataSet['NAME'];
 ViewForm.ShortName_Edit.Text:=  DM.DataSet['SHORT_NAME'];
 ViewForm.DB_Handle := Dm.DB.Handle;
 IF DM.DataSet['IS_SCIENCE'] <> null then
  begin
   IF DM.DataSet['IS_SCIENCE'] = 'T'
    then ViewForm.Check_IS_SCIENCE.Checked := True
    else ViewForm.Check_IS_SCIENCE.Checked := False;
  End
  else ViewForm.Check_IS_SCIENCE.Checked := False;
 if DM.DataSet['ID_SP_TYPE_KAT_STUD']<> null
  then begin
    ViewForm.PRK_SP_TYPE_KAT_STUD_edit.Text := DM.DataSet['PRK_NAME'];
    ViewForm.ID_NAME             := DM.DataSet['ID_SP_TYPE_KAT_STUD'];
  end
   else ViewForm.ID_NAME :=-1;

  if ViewForm.ShowModal = mrOk then
  begin
      id_Locator:=  DM.DataSet['ID_KAT_STUD'];
      with DM.StProc do
        try
         Transaction.StartTransaction;
         StoredProcName := 'CN_SP_KAT_STUD_UPDATE';
         Prepare;
         ParamByName('ID_KAT_STUD').AsInt64     := DM.DataSet['ID_KAT_STUD'];
         ParamByName('NAME').AsString           := ViewForm.Name_Edit.Text;
         ParamByName('SHORT_NAME').AsString     := ViewForm.ShortName_Edit.text;
          if ViewForm.ID_NAME <> -1 then
          ParamByName('ID_SP_TYPE_KAT_STUD').AsInt64     := ViewForm.ID_NAME;
         IF ViewForm.Check_IS_SCIENCE.Checked
          then ParamByName('IS_SCIENCE').AsString := 'T'
          else ParamByName('IS_SCIENCE').AsString := 'F';
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
  DM.DataSet.Locate('ID_KAT_STUD', id_Locator ,[] );
    end;
end;

procedure TfrmCategoryStudy.DeleteButtonClick(Sender: TObject);
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
 // проверяю зависимые по контрактам
  Dm.ReadDataSet.Close;
  Dm.ReadDataSet.SelectSQL.Clear;
  Dm.ReadDataSet.SelectSQL.Text:='select * from CN_NFK_CANDELETE('+ inttostr(Dm.DataSet['ID_KAT_STUD']) + ','+''''+ 'k' +'''' +')';
  Dm.ReadDataSet.Open;
  if Dm.ReadDataSet['CANDELETE'] = 0 then
   begin
    cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_NonDeleteDependet[PLanguageIndex], mtInformation, [mbYes]);
    Dm.ReadDataSet.Close;
    exit;
   end;
  Dm.ReadDataSet.Close;

 i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit
  else
  begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_SP_KAT_STUD_DELETE';
        Prepare;
        ParamByName('ID_KAT_STUD').AsInt64       :=  DM.DataSet['ID_KAT_STUD'];
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

procedure TfrmCategoryStudy.RefreshButtonClick(Sender: TObject);
var
id_Locator : Int64;
begin
 Screen.Cursor := crHourGlass;
 id_Locator    :=  DM.DataSet['ID_KAT_STUD'];
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_KAT_STUD', id_Locator ,[] );
 Screen.Cursor := crDefault;
end;

procedure TfrmCategoryStudy.AddPopClick(Sender: TObject);
begin
AddButtonClick(Sender);
end;

procedure TfrmCategoryStudy.EditPopClick(Sender: TObject);
begin
EditButtonClick(Sender);
end;

procedure TfrmCategoryStudy.DeletePopClick(Sender: TObject);
begin
DeleteButtonClick(Sender);
end;

procedure TfrmCategoryStudy.RefreshPopClick(Sender: TObject);
begin
RefreshButtonClick(Sender);
end;

procedure TfrmCategoryStudy.ExitPopClick(Sender: TObject);
begin
ExitButtonClick(Sender);
end;

end.
