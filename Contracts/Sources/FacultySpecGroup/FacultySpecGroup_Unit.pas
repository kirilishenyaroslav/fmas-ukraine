//******************************************************************************
// Проект "Контракты"
// Справочник факультетов, специальностей и групп
// Чернявский А.Э. 2005г.
// последние изменения Перчак А.Л. 28/09/2010
//******************************************************************************

unit FacultySpecGroup_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  DM_FacultySpecGroup, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cxSplitter, ExtCtrls, cxGroupBox,
  cn_Common_Types, cn_Common_Loader, Fac_AE, cn_Common_Messages,
  cnConsts_Messages, uCommonSp, Group_AE, cxCheckBox, Placemnt, ActnList,
  shellApi, RxMemDS, Grids, DBGrids;

type
  TfrmFacultySpecGruop = class(TForm)
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
    SelectButton: TdxBarLargeButton;
    Faculty_GroupBox: TcxGroupBox;
    Grid_Faculty: TcxGrid;
    TableView_Faculty: TcxGridDBTableView;
    name: TcxGridDBColumn;
    id_national: TcxGridDBColumn;
    short_name: TcxGridDBColumn;
    Grid_FacultyLevel: TcxGridLevel;
    Spec_GroupBox: TcxGroupBox;
    Grid_Spec: TcxGrid;
    TableView_Spec: TcxGridDBTableView;
    name_spec: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Group_GroupBox: TcxGroupBox;
    Grid_Group: TcxGrid;
    TableView_Group: TcxGridDBTableView;
    name_group: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    Faculty_DockControl: TdxBarDockControl;
    Spec_DockControl: TdxBarDockControl;
    Group_BarDockControl: TdxBarDockControl;
    cxSplitter1: TcxSplitter;
    AddButton_Spec: TdxBarLargeButton;
    EditButton_Spec: TdxBarLargeButton;
    DeleteButton_Spec: TdxBarLargeButton;
    RefreshButton_Spec: TdxBarLargeButton;
    AddButton_Group: TdxBarLargeButton;
    EditButton_Group: TdxBarLargeButton;
    DeleteButton_Group: TdxBarLargeButton;
    RefreshButton_Group: TdxBarLargeButton;
    dxBarDockControl1: TdxBarDockControl;
    cxSplitter2: TcxSplitter;
    Fac_Filter: TdxBarEdit;
    Group_Filter: TdxBarEdit;
    Spec_Filter: TdxBarEdit;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    Filter_CheckBox: TcxCheckBox;
    DepWrite_Button: TdxBarLargeButton;
    CnFormStorage: TFormStorage;
    kod_spec: TcxGridDBColumn;
    kod_facul_table: TcxGridDBColumn;
    is_def: TcxGridDBColumn;
    ActionList1: TActionList;
    help: TAction;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TableView_GroupDblClick(Sender: TObject);
    procedure AddButton_SpecClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure TableView_FacultyDblClick(Sender: TObject);
    procedure DeleteButton_SpecClick(Sender: TObject);
    procedure RefreshButton_SpecClick(Sender: TObject);
    procedure RefreshButton_GroupClick(Sender: TObject);
    procedure DeleteButton_GroupClick(Sender: TObject);
    procedure EditButton_GroupClick(Sender: TObject);
    procedure Fac_FilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Group_FilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AddButton_GroupClick(Sender: TObject);
    procedure TableView_FacultyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TableView_SpecKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TableView_GroupKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DepWrite_ButtonClick(Sender: TObject);
    procedure TableView_SpecDblClick(Sender: TObject);
    procedure helpExecute(Sender: TObject);
  private
    PLanguageIndex: byte;
    DontShowGroups, DontShowFacs : boolean;
    DM:TDM_FSG;
    DM_Detail_1:TDM_FSG;
    DM_Detail_2:TDM_FSG;
    procedure FormIniLanguage;
  public
    res:Variant;
    Is_admin:Boolean;
    constructor  Create(AParameter:TcnSimpleParams);reintroduce;
    procedure    DataSetAfterScroll(DataSet: TDataSet);
  end;


implementation

uses FIBDatabase, FIBDataSet, cxCurrencyEdit;

{$R *.dfm}

constructor TfrmFacultySpecGruop.Create(AParameter:TcnSimpleParams);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AParameter.Owner);

// проверяю, показывать ли факультеты
DontShowFacs :=  AParameter.DontShowFacs;
if bool(AParameter.DontShowFacs) then
 begin
   Spec_GroupBox.Visible := false;
   Faculty_GroupBox.Align := alClient;
 end;

DM:=TDM_FSG.Create(Self);
DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_SP_FACUL_SELECT';
if ((DontShowFacs) and (AParameter.ID_PRICE <> -1))then
   DM.DataSet.SQLs.SelectSQL.Text:=
   DM.DataSet.SQLs.SelectSQL.Text + ' where ID_FACUL in (select ID_FACULTY from CN_PRICES_SUMMA where ID_PRICE ='+ IntToStr(AParameter.ID_PRICE)  +')';

DM.DB.Handle:=AParameter.DB_Handle;
DM.DataSet.Open;
TableView_Faculty.DataController.DataSource := DM.DataSource;
if AParameter.ID_Locate <> null
then
DM.DataSet.Locate('ID_FACUL', AParameter.ID_Locate, [] );


DM_Detail_1:=TDM_FSG.Create(Self);
DM_Detail_1.DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM CN_JN_FACUL_SPEC_SELECT (?ID_FACUL )';
DM_Detail_1.DataSet.DataSource:= DM.DataSource;
DM_Detail_1.DB.Handle:=AParameter.DB_Handle;
DM_Detail_1.DataSet.Open;
TableView_Spec.DataController.DataSource := DM_Detail_1.DataSource;
if AParameter.ID_Locate_1 <> null
then
DM_Detail_1.DataSet.Locate('ID_SPEC', AParameter.ID_Locate_1, [] );

DM_Detail_2:=TDM_FSG.Create(Self);
DM_Detail_2.DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM CN_SP_GROUP_BY_ID_FAC_SELECT (?ID_FACUL )';
DM_Detail_2.DataSet.DataSource:= DM.DataSource;
DM_Detail_2.DB.Handle:=AParameter.DB_Handle;
DM_Detail_2.DataSet.Open;
TableView_Group.DataController.DataSource := DM_Detail_2.DataSource;
if AParameter.ID_Locate_2 <> null
then
DM_Detail_2.DataSet.Locate('ID_GROUP', AParameter.ID_Locate_2, [] );

// проверяю, показывать ли кнопку записи в департмент
DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from CN_GET_CN_SHOW_FASTGROUPS';
DM.ReadDataSet.Open;
if DM.ReadDataSet['CN_SHOW_FASTGROUPS']= 0 then
DepWrite_Button.Visible := ivNever;
DM.ReadDataSet.Close;

// проверяю, показывать ли группы
DontShowGroups := bool(AParameter.DontShowGroups);
if DontShowGroups then
 begin
   Group_GroupBox.Visible := false;
   cxSplitter2.Visible:= false;
 end;


 // инициализация строковых констант
FormIniLanguage();

DM.DataSet.AfterScroll := DataSetAfterScroll;
   Is_admin:=AParameter.is_admin;
Screen.Cursor:=crDefault;
  CnFormStorage.RestoreFormPlacement;
end;

procedure TfrmFacultySpecGruop.DataSetAfterScroll(DataSet: TDataSet);
begin
 DM_Detail_2.DataSet.Close;
 DM_Detail_2.DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM CN_SP_GROUP_BY_ID_FAC_SELECT (?ID_FACUL )';
 DM_Detail_2.DataSet.Open;
end;

procedure TfrmFacultySpecGruop.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      cnConsts.cn_Main_FaculSpecGroup[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

 AddButton_Spec.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton_Spec.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton_Spec.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton_Spec.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];

 AddButton_Group.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton_Group.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton_Group.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton_Group.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];

 Filter_CheckBox.Properties.Caption := cnConsts.cn_SearchAll[PLanguageIndex];

  Fac_Filter.Caption :=      cnConsts.cn_SearchBtn_Caption[PLanguageIndex];
  Spec_Filter.Caption :=      cnConsts.cn_SearchBtn_Caption[PLanguageIndex];
  Group_Filter.Caption :=      cnConsts.cn_SearchBtn_Caption[PLanguageIndex];
  DepWrite_Button.Caption :=      cnConsts.cn_Write[PLanguageIndex];

 //грид
  kod_facul_table.Caption := 'Код';
  name.Caption            := cnConsts.cn_Name_Column[PLanguageIndex];
  kod_spec.Caption        := 'Код';
  name_group.Caption      := cnConsts.cn_Name_Column[PLanguageIndex];
  name_spec.Caption       := cnConsts.cn_Name_Column[PLanguageIndex];
  is_def.Caption          := cnConsts.cn_is_def[PLanguageIndex];
  
  //статусбар
  StatusBar.Panels[0].Text:=  cnConsts.cn_HelpBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_HelpBtn_Caption[PLanguageIndex];
  StatusBar.Panels[1].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
  StatusBar.Panels[2].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
  StatusBar.Panels[3].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
  StatusBar.Panels[4].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
  StatusBar.Panels[5].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
  StatusBar.Panels[6].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

 // группбоксы
 Faculty_GroupBox.Caption:=  cnConsts.cn_footer_Faculty[PLanguageIndex];
 Spec_GroupBox.Caption:=     cnConsts.cn_footer_Spec[PLanguageIndex];
 Group_GroupBox.Caption:=    cnConsts.cn_footer_Group[PLanguageIndex];
end;

procedure TfrmFacultySpecGruop.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmFacultySpecGruop.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CnFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild then action:=caFree
  else begin
  DM.Free;
  DM_Detail_1.Free;
  DM_Detail_2.Free;
end;
end;

procedure TfrmFacultySpecGruop.SelectButtonClick(Sender: TObject);
var
 id_faculty : int64;
 id_spec    : int64;
 id_group   : int64;
begin
  if ((TableView_Faculty.datacontroller.recordcount = 0) or
      (TableView_Spec.DataController.RecordCount = 0)) then exit;
   Res:=VarArrayCreate([0,9],varVariant);

  if DontShowGroups
   then
    begin
     DM.ReadDataSet.Close;
     DM.ReadDataSet.SelectSQL.Clear;
     DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_GROUP_ABITUR_SYSTEM('+ inttostr(DM.DataSet['ID_FACUL']) +')';
     DM.ReadDataSet.Open;
     if DM.ReadDataSet['ID_GROUP'] = null then
      begin
       ShowMessage('Помилка в воборі групи!!!');
       Exit;
      end;
     id_group:= DM.ReadDataSet['ID_GROUP'];
     Res[5]:=   DM.ReadDataSet['NAME'];
     Res[6]:=   DM_Detail_1.DataSet['ID_FACUL_SPEC'];

     id_faculty := DM.DataSet['ID_FACUL'];  // faculty
     if DontShowFacs
      then id_spec := -1
      else id_spec := DM_Detail_1.DataSet['ID_SPEC'];   //speciality
    end
   else
    begin
     if DM_Detail_2.DataSet['ID_GROUP'] = null then
      Begin
       ShowMessage('Помилка в воборі групи!!!');
       Exit;
      end;
     id_faculty := DM.DataSet['ID_FACUL'];  // faculty
     if DontShowFacs
      then id_spec := -1
      else id_spec    := DM_Detail_1.DataSet['ID_SPEC'];   //speciality
     if DontShowFacs
      then id_spec := -1
      else id_group   := DM_Detail_2.DataSet['ID_GROUP'];   //group
     Res[5]:=DM_Detail_2.DataSet['NAME'];
    end;

  {идентификаторы}
  Res[0]:= id_faculty;
  Res[1]:= id_spec;
  Res[2]:= id_group;

  {наиманования}
  Res[3]:=DM.DataSet['NAME'];
  Res[4]:=DM_Detail_1.DataSet['NAME'];

  ModalResult:=mrOk;
end;

procedure TfrmFacultySpecGruop.FormShow(Sender: TObject);
begin
if FormStyle = fsMDIChild then  SelectButton.Visible:=ivNever;
Grid_Faculty.SetFocus;
end;

procedure TfrmFacultySpecGruop.TableView_GroupDblClick(Sender: TObject);
begin
if FormStyle = fsNormal then SelectButtonClick(Sender)
else EditButton_GroupClick(Sender) ;
end;

procedure TfrmFacultySpecGruop.AddButton_SpecClick(Sender: TObject);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
  cnt, i: integer;
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
   //вызов справочника
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin := Is_admin;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_Spec.bpl','ShowSPSpec');
  AParameter.Free;

   if VarArrayDimCount(res)>0 then
      begin
        cnt:=VarArrayHighBound(res,1)-VarArrayLowBound(res,1);
        for i:=0 to cnt do
          begin
            with DM.StProc do
             try
              Transaction.StartTransaction;
              StoredProcName := 'CN_JN_FACUL_SPEC_INSERT';
              Prepare;
              ParamByName('ID_FACUL').AsInt64   := DM.DataSet['ID_FACUL'];
              ParamByName('ID_SPEC'). AsInt64   := Res[i][0]; // id_spec
              ExecProc;
              Transaction.Commit;
             except
              on E:Exception do
               begin
                cnShowMessage('Error in CN_JN_FACUL_SPEC_INSERT','Така спеціальність на цьому факультеті вже існує!',mtError,[mbOK]);
                Transaction.Rollback;
               end;
             end;
          end;
 DM_Detail_1.DataSet.CloseOpen(true);
 end;
end;

procedure TfrmFacultySpecGruop.AddButtonClick(Sender: TObject);
var
 ViewForm : TfrmFac_AE;
 New_id_Locator : int64;
 i: integer;
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

  ViewForm := TfrmFac_AE.create(self,DM.DB.Handle, PLanguageIndex );
  ViewForm.Caption := cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
  ViewForm.id_department := -1;
  if ViewForm.ShowModal = mrOk then
   begin
    with DM.StProc do
     try
      start_sql_monitor;
      Transaction.StartTransaction;
      StoredProcName := 'CN_SP_FACUL_INSERT';
      Prepare;
      ParamByName('NAME').AsString         := ViewForm.Fac_Edit.Text;
      ParamByName('SHORT_NAME').AsString   := ViewForm.ShortName_Edit.Text;
      ParamByName('NAME_EXEC').AsString    := ViewForm.NameExec_Edit.Text;
      ParamByName('DEKAN').AsString        := ViewForm.Dekan_Edit.Text;
      ParamByName('ID_DEPARTMENT').AsInt64 := ViewForm.id_department;
      ParamByName('KOD').AsInteger         := ViewForm.Kod_edit.EditValue;
      ExecProc;
      New_id_Locator:=ParamByName('ID_FACUL').AsInt64;

      // далее заполняю группы этого факультета автоматом
      // сначала выбыраю все группы в датасет
      DM.ReadDataSet.Close;
      DM.ReadDataSet.SelectSQL.Clear;
      DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_GROUPS_BY_ID_DEPARTMENT('+ inttostr(ViewForm.id_department) +', null)';
      DM.ReadDataSet.Open;
      DM.ReadDataSet.FetchAll;
      DM.ReadDataSet.First;
      if ViewForm.id_department<>-1 then
       for i:=0 to DM.ReadDataSet.RecordCount-1 do
        begin
         with DM.StProc do
          begin
           Transaction.StartTransaction;
           StoredProcName := 'CN_SP_GROUP_INSERT';
           Prepare;
           ParamByName('ID_FACUL').AsInt64         := New_id_Locator;
           ParamByName('NAME').AsString            := DM.ReadDataSet['NAME_FULL'];
           ParamByName('ID_DEPARTMENT').AsInt64    := DM.ReadDataSet['ID_DEPARTMENT'];
           ExecProc;
           DM.ReadDataSet.Next;
          end;
        end;
      Transaction.Commit;
     except
      on E:Exception do
       begin
        cnShowMessage('Error in CN_SP_FACUL_INSERT',e.Message,mtError,[mbOK]);
        Transaction.Rollback;
       end;
     end;
    stop_sql_monitor;
    DM.DataSet.CloseOpen(True);
    DM_Detail_1.DataSet.CloseOpen(true);
    DM_Detail_2.DataSet.CloseOpen(true);
    DM.DataSet.Locate('ID_FACUL',New_id_Locator,[] );
   end;
end;

procedure TfrmFacultySpecGruop.EditButtonClick(Sender: TObject);
var
ViewForm : TfrmFac_AE;
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

  ViewForm:= TfrmFac_AE.Create(Self, DM.DB.Handle, PLanguageIndex);
  ViewForm.Caption := cnConsts.cn_EditBtn_Caption[PLanguageIndex];

  ViewForm.Fac_Edit.Text       :=  DM.DataSet['NAME'];
  ViewForm.ShortName_Edit.Text :=  DM.DataSet['SHORT_NAME'];
  ViewForm.NameExec_Edit.Text  :=  DM.DataSet['NAME_EXEC'];
  ViewForm.Dekan_Edit.Text     :=  DM.DataSet['DEKAN'];
  ViewForm.id_department       :=  DM.DataSet['ID_DEPARTMENT'];
  if DM.DataSet['KOD']<> null
   then ViewForm.Kod_edit.EditValue := DM.DataSet['KOD']
   else ViewForm.Kod_edit.Text      := ''; 

  if ViewForm.ShowModal = mrOk then
   begin
    id_Locator:=  DM.DataSet['ID_FACUL'];
    with DM.StProc do
      try
        Transaction.StartTransaction;
        StoredProcName := 'CN_SP_FACUL_UPDATE';
        Prepare;
        ParamByName('ID_FACUL').AsInt64      := DM.DataSet['ID_FACUL'];
        ParamByName('NAME').AsString         := ViewForm.Fac_Edit.Text;
        ParamByName('SHORT_NAME').AsString   := ViewForm.ShortName_Edit.Text;
        ParamByName('NAME_EXEC').AsString    := ViewForm.NameExec_Edit.Text;
        ParamByName('DEKAN').AsString        := ViewForm.Dekan_Edit.Text;
        ParamByName('ID_DEPARTMENT').AsInt64 := ViewForm.id_department;
        ParamByName('KOD').asInteger         := ViewForm.Kod_edit.EditValue;
        ExecProc;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error in CN_SP_FACUL_UPDATE',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
   DM.DataSet.CloseOpen(True);
   DM_Detail_1.DataSet.CloseOpen(true);
   DM_Detail_2.DataSet.CloseOpen(true);
   DM.DataSet.Locate('ID_FACUL', id_Locator ,[] );
  end;
end;

procedure TfrmFacultySpecGruop.DeleteButtonClick(Sender: TObject);
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

  if TableView_Faculty.DataController.RecordCount = 0 then exit;

  // проверяю зависимые по справочнику
   if  ((DM_Detail_1.DataSet.RecordCount >0) or (DM_Detail_2.DataSet.RecordCount>0))
    then
     begin
     cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_NonDeleteDependet[PLanguageIndex], mtInformation, [mbYes]);
     exit;
     end;
  // проверяю зависимые по контрактам
  Dm.ReadDataSet.Close;
  Dm.ReadDataSet.SelectSQL.Clear;
  Dm.ReadDataSet.SelectSQL.Text:='select * from CN_FACSPECGROUP_CANDELETE('
                                         + inttostr(Dm.DataSet['ID_FACUL']) + ','+''''+ 'f' +'''' + ','
                                                  + inttostr(DM.DataSet['ID_FACUL'])
                                                  +')';
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
        StoredProcName := 'CN_SP_FACUL_DELETE';
        Prepare;
        ParamByName('ID_FACUL').AsInt64       :=  DM.DataSet['ID_FACUL'];
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
    DM_Detail_1.DataSet.CloseOpen(true);
    DM_Detail_2.DataSet.CloseOpen(true);
   end;
end;

procedure TfrmFacultySpecGruop.RefreshButtonClick(Sender: TObject);
var
id_Locator : Int64;
begin
 Screen.Cursor := crHourGlass;
 id_Locator    :=  DM.DataSet['ID_FACUL'];
 DM.DataSet.Close;
 DM.DataSet.SQLs.SelectSQL.Clear;
 DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_SP_FACUL_SELECT';
 DM.DataSet.Open;
 DM_Detail_1.DataSet.CloseOpen(true);
 DM_Detail_2.DataSet.CloseOpen(true);

 DM.DataSet.Locate('ID_FACUL', id_Locator ,[] );
 Screen.Cursor := crDefault;
end;

procedure TfrmFacultySpecGruop.TableView_FacultyDblClick(Sender: TObject);
begin
 if ((not Spec_GroupBox.Visible) and (not Group_GroupBox.Visible))then
 SelectButtonClick(self)
 else
 EditButtonClick(Sender);
end;

procedure TfrmFacultySpecGruop.DeleteButton_SpecClick(Sender: TObject);
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
  if TableView_Spec.DataController.RecordCount = 0 then exit;

  // проверяю зависимые по контрактам
  DM_Detail_1.ReadDataSet.Close;
  DM_Detail_1.ReadDataSet.SelectSQL.Clear;
  DM_Detail_1.ReadDataSet.SelectSQL.Text:='select * from CN_FACSPECGROUP_CANDELETE('
                                                  + inttostr(DM_Detail_1.DataSet['ID_SPEC']) + ','
                                                  +''''+ 's' +'''' + ','
                                                  + inttostr(DM.DataSet['ID_FACUL'])
                                                  +')';
  DM_Detail_1.ReadDataSet.Open;
  if DM_Detail_1.ReadDataSet['CANDELETE'] = 0 then
   begin
    cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_NonDeleteDependet[PLanguageIndex], mtInformation, [mbYes]);
    DM_Detail_1.ReadDataSet.Close;
    exit;
   end;
  DM_Detail_1.ReadDataSet.Close;

  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit
  else
  begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_JN_FACUL_SPEC_DELETE';
        Prepare;
        ParamByName('ID_FACUL_SPEC').AsInt64       :=  DM_Detail_1.DataSet['ID_FACUL_SPEC'];
        ExecProc;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error in CN_JN_FACUL_SPEC_DELETE',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
 DM_Detail_1.DataSet.CloseOpen(true);
   end;
end;


procedure TfrmFacultySpecGruop.RefreshButton_SpecClick(Sender: TObject);
begin
 DM_Detail_1.DataSet.CloseOpen(true);
end;

procedure TfrmFacultySpecGruop.RefreshButton_GroupClick(Sender: TObject);
begin
DM_Detail_2.DataSet.close;
DM_Detail_2.DataSet.SQLs.SelectSQL.Clear;
DM_Detail_2.DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM CN_SP_GROUP_BY_ID_FAC_SELECT (?ID_FACUL )';
DM_Detail_2.DataSet.Open;
end;

procedure TfrmFacultySpecGruop.DeleteButton_GroupClick(Sender: TObject);
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
  if TableView_Group.DataController.RecordCount = 0 then exit;

  // проверяю зависимые по контрактам
  DM_Detail_2.ReadDataSet.Close;
  DM_Detail_2.ReadDataSet.SelectSQL.Clear;
  DM_Detail_2.ReadDataSet.SelectSQL.Text:='select * from CN_FACSPECGROUP_CANDELETE('
                                                  + inttostr(DM_Detail_2.DataSet['ID_GROUP']) + ','+''''+ 'g' +''''
                                                  + ','
                                                  + inttostr(DM.DataSet['ID_FACUL'])
                                                  +')';



  DM_Detail_2.ReadDataSet.Open;
  if DM_Detail_2.ReadDataSet['CANDELETE'] = 0 then
   begin
    cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_NonDeleteDependet[PLanguageIndex], mtInformation, [mbYes]);
    DM_Detail_2.ReadDataSet.Close;
    exit;
   end;
  DM_Detail_2.ReadDataSet.Close;

  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit
  else
  begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_SP_GROUP_DELETE';
        Prepare;
        ParamByName('ID_GROUP').AsInt64       :=  DM_Detail_2.DataSet['ID_GROUP'];
        ExecProc;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error in CN_SP_GROUP_DELETE',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
 DM_Detail_2.DataSet.CloseOpen(true);
   end;
end;

procedure TfrmFacultySpecGruop.EditButton_GroupClick(Sender: TObject);
var
 ViewForm : TfrmGroup_AE;
 id_Locator : int64;
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

if TableView_Group.DataController.RecordCount = 0 then exit;
 ViewForm := TfrmGroup_AE.create(self,DM.DB.Handle, PLanguageIndex );
 ViewForm.Caption := cnConsts.cn_EditBtn_Caption[PLanguageIndex];

 ViewForm.Group_Edit.Text := DM_Detail_2.DataSet['NAME'];

 if DM_Detail_2.DataSet['ID_DEPARTMENT'] <> null then
  begin
  ViewForm.id_department       := DM_Detail_2.DataSet['ID_DEPARTMENT'];
  ViewForm.DepGroup_Edit.Text  := vartostr(DM_Detail_2.DataSet['DEP_NAME']);
  ViewForm.Error_Label.Visible := False;
  end
 else
  begin
   ViewForm.id_department := -1;
   ViewForm.Error_Label.Caption := cnConsts.cn_NoRelDepartment[PLanguageIndex];
  end;
  if ViewForm.ShowModal = mrOk
  then begin
    id_Locator:=  DM_Detail_2.DataSet['ID_GROUP'];
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_SP_GROUP_UPDATE';
        Prepare;
        ParamByName('ID_GROUP').AsInt64      := DM_Detail_2.DataSet['ID_GROUP'];
        ParamByName('ID_FACUL').AsInt64      := DM.DataSet['ID_FACUL'];
        ParamByName('NAME').AsString         := ViewForm.Group_Edit.Text;
        ParamByName('ID_DEPARTMENT').AsInt64 := ViewForm.id_department;
        ParamByName('DEP_NAME').AsString     := ViewForm.DepGroup_Edit.Text;

        if ViewForm.CheckBox_is_def.Checked
         then DM.StProc.ParamByName('IS_DEF').AsInteger := 1
         else DM.StProc.ParamByName('IS_DEF').AsInteger := 0;

        ExecProc;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error in CN_SP_GROUP_UPDATE',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;

 DM_Detail_2.DataSet.CloseOpen(true);
 DM_Detail_2.DataSet.Locate('ID_GROUP',id_Locator,[] );
   end;

end;

procedure TfrmFacultySpecGruop.Fac_FilterKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_return  then
 begin
   DM.DataSet.Close;
   DM.DataSet.SelectSQL.Clear;
   DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_SP_Fac_SEARCH(' + ''''+ Fac_Filter.Text +''''+ ')';
   DM.DataSet.Open;
   DM_Detail_1.DataSet.CloseOpen(true);
   DM_Detail_2.DataSet.CloseOpen(true);
 end;
end;

procedure TfrmFacultySpecGruop.Group_FilterKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_return  then
 begin
   DM_Detail_2.DataSet.Close;
   DM_Detail_2.DataSet.SelectSQL.Clear;
   DM_Detail_2.DataSet.SQLs.SelectSQL.Text := 'select * from CN_SP_GROUP_SEARCH('
                                     + inttostr(DM.DataSet['ID_FACUL']) +
                                     ','+ ''''+ Group_Filter.Text +''''+
                                     ','+ ''''+  BoolToStr(Filter_CheckBox.Checked, true)+ ''''
                                     +')';
   DM_Detail_2.DataSet.Open;
   Grid_Group.SetFocus;
 end;
end;

procedure TfrmFacultySpecGruop.AddButton_GroupClick(Sender: TObject);
var
 ViewForm : TfrmGroup_AE;
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
     
  if TableView_Faculty.DataController.RecordCount = 0 then exit;
  ViewForm := TfrmGroup_AE.create(self,DM.DB.Handle, PLanguageIndex );
  ViewForm.Caption := cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
  ViewForm.id_department := -1;
  ViewForm.Error_Label.Visible := false;

  if ViewForm.ShowModal = mrOk then
   begin
    if ((ViewForm.id_department = -1) or (ViewForm.id_department = null)) then
     Begin
      DM.WriteTransaction.StartTransaction;
      DM.StProc.StoredProcName := 'CN_SP_GROUP_DEPART_INSERT';
      DM.StProc.Prepare;
      DM.StProc.ParamByName('ID_FACUL').AsInt64  := DM.DataSet['ID_FACUL'];
      DM.StProc.ParamByName('ID_PARENT').AsInt64 := DM.DataSet['ID_DEPARTMENT'];
      DM.StProc.ParamByName('NAME').AsString     := ViewForm.Group_Edit.Text;

      if ViewForm.CheckBox_is_def.Checked
       then DM.StProc.ParamByName('IS_DEF').AsInteger := 1
       else DM.StProc.ParamByName('IS_DEF').AsInteger := 0;

      DM.StProc.ExecProc;
      try
       DM.WriteTransaction.Commit;
       DM.StProc.Close;
      except
       on E:Exception do
        begin
         cnShowMessage('Error in CN_SP_GROUP_DEPART_INSERT',e.Message,mtError,[mbOK]);
         DM.WriteTransaction.Rollback;
         DM.StProc.Close;
        end;
      end;
     End
     else
      Begin
       DM.WriteTransaction.StartTransaction;
       DM.StProc.StoredProcName := 'CN_SP_GROUP_INSERT';
       DM.StProc.Prepare;
       DM.StProc.ParamByName('ID_FACUL').AsInt64      := DM.DataSet['ID_FACUL'];
       DM.StProc.ParamByName('NAME').AsString         := ViewForm.Group_Edit.Text;
       DM.StProc.ParamByName('ID_DEPARTMENT').AsInt64 := ViewForm.id_department;
       DM.StProc.ParamByName('DEP_NAME').AsString     := ViewForm.DepGroup_Edit.Text;
       DM.StProc.ExecProc;
       try
        DM.WriteTransaction.Commit;
        DM.StProc.Close;
       except
        on E:Exception do
         begin
          cnShowMessage('Error in CN_SP_GROUP_INSERT',e.Message,mtError,[mbOK]);
          DM.WriteTransaction.Rollback;
          Dm.StProc.Close;
         end;
       end;
      End;
    DM_Detail_2.DataSet.CloseOpen(true);
   end;
end;

procedure TfrmFacultySpecGruop.TableView_FacultyKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_insert then AddButtonClick(Sender);
if key = vk_f2     then EditButtonClick(Sender);
if key = vk_delete then DeleteButtonClick(Sender);
if key = vk_f5     then RefreshButtonClick(Sender);
if key = VK_BACK   then DeleteButtonClick(Sender);
if Key = VK_RETURN  then Grid_Spec.SetFocus;
end;

procedure TfrmFacultySpecGruop.TableView_SpecKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_insert then AddButton_SpecClick(Sender);
if key = vk_delete then DeleteButton_SpecClick(Sender);
if key = vk_f5     then RefreshButton_SpecClick(Sender);
if key = VK_BACK   then DeleteButton_SpecClick(Sender);
if Key = VK_RETURN  then SelectButtonClick(Sender);
end;

procedure TfrmFacultySpecGruop.TableView_GroupKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_insert then AddButton_GroupClick(Sender);
if key = vk_f2     then EditButton_GroupClick(Sender);
if key = vk_delete then DeleteButton_GroupClick(Sender);
if key = vk_f5     then RefreshButton_GroupClick(Sender);
if key = VK_BACK   then DeleteButton_GroupClick(Sender);
end;

procedure TfrmFacultySpecGruop.DepWrite_ButtonClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_WRITE_GROUP_TO_DEPARTMENTS';
        Prepare;
        ParamByName('ID_PARENT').AsInt64     := DM.DataSet['ID_DEPARTMENT'];
        ParamByName('NAME').AsString         := DM_Detail_2.DataSet['NAME'];
        ParamByName('ID_GROUP').AsString     := DM_Detail_2.DataSet['ID_GROUP'];
        ExecProc;
        Transaction.Commit;
        Screen.Cursor := crDefault;
       except
        on E:Exception do
         begin
          cnShowMessage('Error in CN_WRITE_GROUP_TO_DEPARTMENTS',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
          Screen.Cursor := crDefault;
         end;
       end
end;

procedure TfrmFacultySpecGruop.TableView_SpecDblClick(Sender: TObject);
begin
  SelectButtonClick(self);
end;

procedure TfrmFacultySpecGruop.helpExecute(Sender: TObject);
begin
  Load_Help(self, DM.DB.Handle, 'sp_facul');
end;

end.
