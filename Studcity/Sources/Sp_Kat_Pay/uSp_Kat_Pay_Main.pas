//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник категорий                                                *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit uSp_Kat_Pay_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSp_kat_pay_DM, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, FIBQuery, pFIBQuery,
  pFIBStoredProc, ActnList, FIBDataSet, pFIBDataSet, cxContainer, cxLabel,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ImgList, ComCtrls, ToolWin, cxCalendar, cxTextEdit, Menus,
  StdCtrls, cxCurrencyEdit, RxMenus, dxBar, dxStatusBar, AccMGMT,
  uSp_Kat_Pay_Print, st_ConstUnit, st_common_funcs, st_common_types, iBase,
  Placemnt, dxBarExtItems, cxRadioGroup, cxGroupBox;

type
  TfrmKat_Pay_Main = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1ID_KATEGORIYA: TcxGridDBColumn;
    NUM_KATEGORIYA: TcxGridDBColumn;
    NAME_KATEGORIYA: TcxGridDBColumn;
    cxGrid1DBTableView1SHORT_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1CLASS_KATEGOR: TcxGridDBColumn;
    cxGrid1DBTableView1SUBCLASS: TcxGridDBColumn;
    cxGrid1DBTableView1TYPE_PROJ: TcxGridDBColumn;
    cxGrid1DBTableView1TYPE_KAT: TcxGridDBColumn;
    cxGrid1DBTableView1STUDENT: TcxGridDBColumn;
    cxGrid1DBTableView1NOT_LIVE: TcxGridDBColumn;
    cxGrid1DBTableView1BEZ_KOMN: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    ImageListOfCategory: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    ImageList1: TImageList;
    ShortNameLabel: TEdit;
    TypeLabel: TEdit;
    ClassLabel: TEdit;
    PopupImageList: TImageList;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    HotKey_StatusBar: TdxStatusBar;
    pay_sum: TcxGridDBColumn;
    Cash_Style: TcxStyle;
    SelectAction: TAction;
    actPrint: TAction;
    StFormStorage: TFormStorage;
    act_help: TAction;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    Search_BarEdit: TdxBarEdit;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    ImageList2: TImageList;
    dxBarButton1: TdxBarButton;
    btnPrint: TdxBarLargeButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    add_BarButton: TdxBarButton;
    Clone_BarButton: TdxBarButton;
    Column_date_beg: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    Edit_Filter: TdxBarEdit;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    Filtration_GroupBox: TcxGroupBox;
    FiltrByName_RadioButton: TcxRadioButton;
    FiltrByKod_RadioButton: TcxRadioButton;
    dxBarButton2: TdxBarButton;
    CheckBox_show_only_acting: TcxCheckBox;
    dxBarContainerItem1: TdxBarContainerItem;
    dxBarControlContainerItem2: TdxBarControlContainerItem;
    BarStatic_kol_vo: TdxBarStatic;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure DataSet1AfterScroll(DataSet: TDataSet);
    procedure DataSet1AfterOpen(DataSet: TDataSet);
    procedure DeleteButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure SearchButton_NomerClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure act_helpExecute(Sender: TObject);
    procedure Clone_BarButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure Edit_FilterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit_FilterKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_FilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxBarButton2Click(Sender: TObject);
    procedure CheckBox_show_only_actingPropertiesChange(Sender: TObject);
  private
    PLanguageIndex: byte;
    is_admin : Boolean;
    DM : TfrmDM;
    procedure FormIniLanguage();
  public
    KeyField    : string;
    MultiResult:Variant;
    Res : Variant;
    aHandle : TISC_DB_HANDLE;
    constructor Create(AParameter : TstSimpleParams);reintroduce;
    function GetMultiValue():variant;
    procedure SelectAllCategory;
  end;

var
  frmKat_Pay_Main: TfrmKat_Pay_Main;

implementation

uses uSp_Kat_Pay_AE, uSp_Kat_Pay_Nomer_Search, uSp_Kat_Pay_Search_Lgot,
     uSp_Kat_Pay_Search, FIBDatabase;

{$R *.dfm}

constructor TfrmKat_Pay_Main.Create(AParameter : TstSimpleParams);
begin
  Inherited Create(AParameter.Owner);
  is_admin := AParameter.is_admin;
  aHandle := AParameter.Db_Handle;

  DM := TfrmDM.Create(self);
  DM.DB.Handle := aHandle;
  DM.DB.Connected := True;
  DM.Transaction_Read.StartTransaction;

  StFormStorage.RestoreFormPlacement;

  DM.DataSet_main.AfterScroll := DataSet1AfterScroll;
  DM.DataSet_main.AfterOpen   := DataSet1AfterOpen;
end;

procedure TfrmKat_Pay_Main.FormIniLanguage();
begin
   // индекс языка (1-укр, 2 - рус)
   PLanguageIndex:=              stLanguageIndex;
   //названия кнопок
   ExitButton.Caption :=         st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
   ExitButton.Hint :=            st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
   AddButton.Caption :=          st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
   AddButton.Hint :=             st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
   EditButton.Caption :=         st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
   EditButton.Hint :=            st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
   DeleteButton.Caption :=       st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
   DeleteButton.Hint :=          st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
   RefreshButton.Caption :=      st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
   RefreshButton.Hint :=         st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
   SelectButton.Caption :=      st_ConstUnit.st_Select_Caption[PLanguageIndex];
   SelectButton.Hint :=         st_ConstUnit.st_Select_Caption[PLanguageIndex];
   btnPrint.Caption :=         st_ConstUnit.st_Print_Caption[PLanguageIndex];
   btnPrint.Hint :=         st_ConstUnit.st_Print_Caption[PLanguageIndex];

   HotKey_StatusBar.Panels[0].Text:=  st_ConstUnit.st_InsertBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
   HotKey_StatusBar.Panels[1].Text:=  st_ConstUnit.st_EditBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
   HotKey_StatusBar.Panels[2].Text:=  st_ConstUnit.st_DeleteBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
   HotKey_StatusBar.Panels[3].Text:=  st_ConstUnit.st_RefreshBtn_ShortCut[PLanguageIndex] + st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
   HotKey_StatusBar.Panels[4].Text:=  st_ConstUnit.st_Select_Caption[PLanguageIndex]      + st_ConstUnit.st_EnterBtn_ShortCut[PLanguageIndex];
   HotKey_StatusBar.Panels[5].Text:=  st_ConstUnit.st_ExitBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
   HotKey_StatusBar.Hint :=           st_ConstUnit.st_HotKeys[PLanguageIndex];

   // скорочення
   cxLabel1.Caption :=      st_ConstUnit.st_ShortLable[PLanguageIndex];
   // тип
   cxLabel2.Caption :=      st_ConstUnit.st_TypeLable[PLanguageIndex];
   // клас
   cxLabel3.Caption :=      st_ConstUnit.st_ClassLable[PLanguageIndex];

   // пошел грид
   NUM_KATEGORIYA.Caption :=     st_ConstUnit.st_Nomer[PLanguageIndex];
   NAME_KATEGORIYA.Caption :=    st_ConstUnit.st_NameLable[PLanguageIndex];
   pay_sum.Caption :=            st_ConstUnit.st_Sum[PLanguageIndex];

   MenuItem1.Caption :=            st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
   MenuItem2.Caption :=            st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
   MenuItem3.Caption :=            st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
   MenuItem4.Caption :=            st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];

   MenuItem1.Hint := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
   MenuItem2.Hint := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
   MenuItem3.Hint := st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
   MenuItem4.Hint := st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
end;

function  TfrmKat_Pay_Main.GetMultiValue():variant;
begin
  ShowModal;
  GetMultiValue:=MultiResult;
end;

procedure TfrmKat_Pay_Main.SelectAllCategory;
begin
  DM.DataSet_main.Close;
  DM.DataSet_main.SQLs.SelectSQL.Text := 'SELECT * FROM ST_SP_KATEGORY_SELECT';
  if CheckBox_show_only_acting.Checked
   then DM.DataSet_main.SQLs.SelectSQL.Add(' Where IS_OLD = 0');
  DM.DataSet_main.Open;
  DM.DataSet_main.FetchAll;

  BarStatic_kol_vo.Caption := 'Кол-во записів : ' + IntToStr(DM.DataSet_main.RecordCount);
end;

procedure TfrmKat_Pay_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  stFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

procedure TfrmKat_Pay_Main.RefreshButtonClick(Sender: TObject);
var
  selected : integer;
begin
  Screen.Cursor:=crHourGlass;
  selected := -1;

  if DM.DataSet_main.RecordCount <> 0 then selected := DM.DataSet_main[KeyField];

  SelectAllCategory;
  DM.DataSet_main.Locate(KeyField, selected, []);
  Screen.Cursor:=crDefault;
end;

procedure TfrmKat_Pay_Main.FormShow(Sender: TObject);
begin
  if formstyle = fsMDIChild
   then selectButton.Visible := ivNever
   else selectButton.Visible := ivAlways;

 cxGrid1.SetFocus;
end;

procedure TfrmKat_Pay_Main.FormCreate(Sender: TObject);
begin
  KeyField := 'ID_KATEGORIYA';

  cxGrid1DBTableView1.Items[12].DataBinding.ValueTypeClass := TcxFloatValueType;

  SelectAllCategory;
  FormIniLanguage();
end;

procedure TfrmKat_Pay_Main.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmKat_Pay_Main.DataSet1AfterScroll(DataSet: TDataSet);
begin
  if DataSet.RecordCount = 0 then exit;

   ShortNameLabel.Text := DataSet['SHORT_NAME'];
   TypeLabel.Text      := DataSet['NAME_TYPE_CATEGORY'];
   ClassLabel.Text     := DataSet['NAME_CATEGORY_CLASS'];
end;

procedure TfrmKat_Pay_Main.DataSet1AfterOpen(DataSet: TDataSet);
begin
  if DataSet.RecordCount = 0 then
   begin
    EditButton.Enabled := false;
    DeleteButton.Enabled := false;
   end
  else
   begin
    EditButton.Enabled := true;
    DeleteButton.Enabled := true;
   end;
end;

procedure TfrmKat_Pay_Main.DeleteButtonClick(Sender: TObject);
var
 RowSelected : integer;
begin
  if not is_admin then
   if fibCheckPermission('/ROOT/Studcity/Sp_Kat_Opl','Del') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  If MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo
   then exit;

  screen.Cursor:=crHourGlass;
  DM.DataSet_read.Close;
  DM.DataSet_read.SelectSQL.Text := 'select CAN from ST_SP_KAT_CAN_DELETE(:id)';
  DM.DataSet_read.ParamByName('id').AsInt64 := DM.DataSet_main[KeyField];
  DM.DataSet_read.Open;
  if DM.DataSet_read['CAN'] = 0 then
   begin
    ShowMessage(PChar(st_ConstUnit.st_mess_NoCategoryDelete[PLanguageIndex]));
    screen.Cursor:=crDefault;
    DM.DataSet_read.Close;
    exit;
   end;

  DM.DataSet_read.Close;
  screen.Cursor:=crDefault;

  DM.StoredProc.StoredProcName := 'ST_SP_KATEGORY_DELETE';
  DM.StoredProc.Transaction.StartTransaction;
  DM.StoredProc.Prepare;
  DM.StoredProc.ParamByName(KeyField).AsInteger := DM.DataSet_main[KeyField];
  DM.StoredProc.ExecProc;
  try
   DM.StoredProc.Transaction.Commit;
   DM.StoredProc.Close;
  except
   DM.StoredProc.Transaction.Rollback;
   DM.StoredProc.Close;
   raise;
  end;

  RowSelected := cxGrid1DBTableView1.DataController.FocusedRowIndex-1;
  SelectAllCategory;
  cxGrid1DBTableView1.DataController.FocusedRowIndex := RowSelected;
end;

procedure TfrmKat_Pay_Main.AddButtonClick(Sender: TObject);
var
 id_kat    : Int64;
 Viewform  : TCategoryFormAdd;

  function GetNearCategoryNumber(DSetRecCount: integer): integer;
   begin
     DM.DataSet_read.Close;
     DM.DataSet_read.SQLs.SelectSQL.Text := 'select max(NUM_KATEGORIYA) as num from ST_SP_KATEGORY';
     DM.DataSet_read.Open;

     if DM.DataSet_read['num'] <> null
      then Result := DM.DataSet_read['num']
      else Result := 1;
   end;

begin
  if not is_admin then
  if fibCheckPermission('/ROOT/Studcity/Sp_Kat_Opl','Add') <> 0 then
   begin
    messagebox(handle,
    pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
    +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
    pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    exit;
   end;

  Viewform := TCategoryFormAdd.Create(Self, DM.DB.Handle, DM.Global_Transaction_write.Handle);
  Viewform.is_admin := is_admin;
  Viewform.aHandle  := aHandle;
  Viewform.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];

  DM.Global_Transaction_write.StartTransaction;

  DM.Global_StoredProc.StoredProcName := 'ST_SP_KAT_GEN_ID';
  DM.Global_StoredProc.ExecProc;
  Id_kat := DM.Global_StoredProc.ParamByName('ID_KATEGORIYA').AsInt64;

  Viewform.id_kat := id_kat;

  // выбираю новый следующий номер по-порядку
  Viewform.KodEdit.Text := inttostr(GetNearCategoryNumber(DM.DataSet_main.RecordCount - 1)+1);

  if Viewform.ShowModal = mrOK then
   begin
    //CategoryForm.Update;
    Screen.Cursor:= crSQLWait;

    //Добавляем категорию
    DM.Global_StoredProc.StoredProcName := 'ST_SP_KATEGORY_INSERT';
    DM.Global_StoredProc.Transaction.StartTransaction;
    DM.Global_StoredProc.Prepare;
    DM.Global_StoredProc.ParamByName('ID_KATEGORIYA').AsInteger := id_kat;
    DM.Global_StoredProc.ParamByName('NUM_KATEGORIYA').AsInteger := StrToInt(Viewform.KodEdit.Text);
    DM.Global_StoredProc.ParamByName('NAME_KATEGORIYA').AsString := Viewform.NameEdit.Text;
    DM.Global_StoredProc.ParamByName('SHORT_NAME').AsString      := Viewform.ShortEdit.Text;
    DM.Global_StoredProc.ParamByName('ID_CATEGORY_CLASS').AsInteger := Viewform.id_category_class;
    DM.Global_StoredProc.ParamByName('ID_TYPE_CATEGORY').AsInteger := Viewform.id_type_category;

    if Viewform.MonthCheck.Checked
     then DM.Global_StoredProc.ParamByName('TYPE_KAT').AsInteger := 1
     else DM.Global_StoredProc.ParamByName('TYPE_KAT').AsInteger := 0;

    If Viewform.StudCheck.Checked
     then DM.Global_StoredProc.ParamByName('STUDENT').AsInteger := 1
     else DM.Global_StoredProc.ParamByName('STUDENT').AsInteger := 0;

    If Viewform.NotliveCheck.Checked
     then DM.Global_StoredProc.ParamByName('NOT_LIVE').AsInteger := 1
     else DM.Global_StoredProc.ParamByName('NOT_LIVE').AsInteger := 0;

    If Viewform.PropiskaCheck.Checked
     then DM.Global_StoredProc.ParamByName('BEZ_KOMN').AsInteger := 1
     else DM.Global_StoredProc.ParamByName('BEZ_KOMN').AsInteger := 0;

    DM.Global_StoredProc.ExecProc;
    try
     DM.Global_StoredProc.Transaction.Commit;
     Viewform.DM.Global_Transaction_write.Commit;
     DM.Global_StoredProc.Close;
     except
      DM.Global_StoredProc.Transaction.Rollback;
      Viewform.DM.Global_Transaction_write.Rollback;
      DM.Global_StoredProc.Close;
      raise;
    end;

    SelectAllCategory;
    DM.DataSet_main.Locate(KeyField, id_kat, []);
   end
   else
    Begin
     ViewForm.DM.Global_Transaction_write.Rollback;
     DM.Global_Transaction_write.Rollback;
    end;

  Viewform.Free;
  Screen.Cursor:= crDefault;
end;

procedure TfrmKat_Pay_Main.EditButtonClick(Sender: TObject);
var
  id_kategoriya : Int64;
  ViewForm : TCategoryFormAdd;
begin
  if not is_admin then
   if fibCheckPermission('/ROOT/Studcity/Sp_Kat_Opl','Edit') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  if DM.DataSet_main.RecordCount = 0 then Exit;

  id_kategoriya := DM.DataSet_main['ID_KATEGORIYA'];

  Viewform := TCategoryFormAdd.Create(Self, DM.DB.Handle, DM.Global_Transaction_write.Handle);
  Viewform.is_admin := is_admin;
  Viewform.aHandle := aHandle;
  Viewform.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  Viewform.id_kat := id_kategoriya;

  if DM.DataSet_main['NUM_KATEGORIYA'] <> null
   then Viewform.KodEdit.Text := DM.DataSet_main['NUM_KATEGORIYA'];

  if DM.DataSet_main['SHORT_NAME'] <> null
   then Viewform.ShortEdit.Text := DM.DataSet_main['SHORT_NAME'];

  if DM.DataSet_main['NAME_KATEGORIYA'] <> null
   then Viewform.NameEdit.Text := DM.DataSet_main['NAME_KATEGORIYA'];

  if DM.DataSet_main['STUDENT'] <> null
   then Viewform.StudCheck.Checked := DM.DataSet_main['STUDENT'] = 1;

  if DM.DataSet_main['TYPE_KAT'] <> null
   then Viewform.MonthCheck.Checked := DM.DataSet_main['TYPE_KAT'] = 1;

  if DM.DataSet_main['NOT_LIVE'] <> null
   then Viewform.NotliveCheck.Checked := DM.DataSet_main['NOT_LIVE'] = 1;

  if DM.DataSet_main['BEZ_KOMN'] <> null
   then Viewform.PropiskaCheck.Checked := DM.DataSet_main['BEZ_KOMN'] = 1;

  if DM.DataSet_main['ID_TYPE_CATEGORY'] <> null
   then Viewform.id_type_category := DM.DataSet_main['ID_TYPE_CATEGORY'];

  if DM.DataSet_main['NAME_TYPE_CATEGORY'] <> null
   then Viewform.TypeEdit.Text := DM.DataSet_main['NAME_TYPE_CATEGORY'];

  if DM.DataSet_main['ID_CATEGORY_CLASS'] <> null
   then Viewform.id_category_class := DM.DataSet_main['ID_CATEGORY_CLASS'];

  if DM.DataSet_main['NAME_CATEGORY_CLASS'] <> null
   then Viewform.ClassEdit.Text := DM.DataSet_main['NAME_CATEGORY_CLASS'];

  DM.Global_Transaction_write.StartTransaction;

  if Viewform.ShowModal = mrOK then
   begin
    Screen.Cursor:= crSQLWait;

    //Изменяем категорию
    DM.Global_StoredProc.StoredProcName := 'ST_SP_KATEGORY_UPDATE';
    DM.Global_StoredProc.Transaction.StartTransaction;
    DM.Global_StoredProc.Prepare;
    DM.Global_StoredProc.ParamByName('ID_KATEGORIYA').AsInteger   := ID_KATEGORIYA;
    DM.Global_StoredProc.ParamByName('NUM_KATEGORIYA').AsInteger  := StrToInt(Viewform.KodEdit.Text);
    DM.Global_StoredProc.ParamByName('NAME_KATEGORIYA').AsString  := Viewform.NameEdit.Text;
    DM.Global_StoredProc.ParamByName('SHORT_NAME').AsString       := Viewform.ShortEdit.Text;
    DM.Global_StoredProc.ParamByName('ID_CATEGORY_CLASS').AsInt64 := Viewform.id_category_class;
    DM.Global_StoredProc.ParamByName('ID_TYPE_CATEGORY').AsInt64  := Viewform.id_type_category;

    if Viewform.MonthCheck.Checked
     then DM.Global_StoredProc.ParamByName('TYPE_KAT').AsInteger := 1
     else DM.Global_StoredProc.ParamByName('TYPE_KAT').AsInteger := 0;

    if Viewform.StudCheck.Checked
     then DM.Global_StoredProc.ParamByName('STUDENT').AsInteger := 1
     else DM.Global_StoredProc.ParamByName('STUDENT').AsInteger := 0;

    if Viewform.NotliveCheck.Checked
     then DM.Global_StoredProc.ParamByName('NOT_LIVE').AsInteger := 1
     else DM.Global_StoredProc.ParamByName('NOT_LIVE').AsInteger := 0;

    if Viewform.PropiskaCheck.Checked
     then DM.Global_StoredProc.ParamByName('BEZ_KOMN').AsInteger := 1
     else DM.Global_StoredProc.ParamByName('BEZ_KOMN').AsInteger := 0;

    DM.Global_StoredProc.ExecProc;

    try
     ViewForm.DM.Global_Transaction_write.Commit;
     DM.Global_StoredProc.Transaction.Commit;
     DM.Global_StoredProc.Close;
     except
      DM.Global_StoredProc.Transaction.Rollback;
      ViewForm.DM.Global_Transaction_write.Rollback;
      DM.Global_StoredProc.Close;
      raise;
    end;
    RefreshButtonClick(Sender);
   end
   else
    Begin
     ViewForm.DM.Global_Transaction_write.Rollback;
     DM.Global_Transaction_write.Rollback;
    end;

  Viewform.Free;
  Screen.Cursor:= crDefault;  
end;

procedure TfrmKat_Pay_Main.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  if SelectButton.Visible = ivAlways
   then SelectButtonClick(self)
   else EditAction.Execute;
end;

procedure TfrmKat_Pay_Main.SelectButtonClick(Sender: TObject);
begin
  If DM.DataSet_main.RecordCount = 0 then Exit;

  Res := VarArrayCreate([0,2], varVariant);
  
  Res[0] := DM.DataSet_main['ID_KATEGORIYA'];
  Res[1] := DM.DataSet_main['NUM_KATEGORIYA'];
  Res[2] := DM.DataSet_main['NAME_KATEGORIYA'];

  ModalResult := mrOk;
end;

procedure TfrmKat_Pay_Main.SearchButton_NomerClick(Sender: TObject);
begin
  Nomer_SearchForm := TNomer_SearchForm.Create(Self);
  if Nomer_SearchForm.ShowModal = mrOK then
   begin
    NUM_KATEGORIYA.SortOrder:=soAscending;
    DM.DataSet_main.Locate('NUM_KATEGORIYA', Nomer_SearchForm.Nomer_Edit.Text, [loCaseInsensitive, loPartialKey]);
   end;
  Nomer_SearchForm.Free;
end;

procedure TfrmKat_Pay_Main.btnPrintClick(Sender: TObject);
var
  ViewForm : TfrmPrint;
begin
  ViewForm := TfrmPrint.Create(self);
  ViewForm.DBh := DM.DB.Handle;
  ViewForm.OkButton.Caption := st_ConstUnit.st_Print_Caption[PLanguageIndex];
  ViewForm.CancelButton.Caption := st_ConstUnit.st_Cancel[PLanguageIndex];
  ViewForm.Caption :=st_ConstUnit.st_Print_Caption[PLanguageIndex];
  ViewForm.ShowModal;
end;

procedure TfrmKat_Pay_Main.actPrintExecute(Sender: TObject);
begin
  btnPrintClick(Sender);
end;

procedure TfrmKat_Pay_Main.act_helpExecute(Sender: TObject);
begin
  Load_Help(self, DM.DB.Handle, 'sp_kat_pay');
end;

procedure TfrmKat_Pay_Main.Clone_BarButtonClick(Sender: TObject);
var
  id_kat_old, id_kat_new : Int64;
  ViewForm : TCategoryFormAdd;
begin
  if not is_admin then
   if fibCheckPermission('/ROOT/Studcity/Sp_Kat_Opl','Add') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  if DM.DataSet_main.RecordCount = 0 then Exit;

  id_kat_old := DM.DataSet_main['ID_KATEGORIYA'];

  DM.Global_Transaction_write.StartTransaction;
  
  DM.Global_StoredProc.StoredProcName := 'ST_SP_KAT_GEN_ID';
  DM.Global_StoredProc.ExecProc;
  id_kat_new := DM.Global_StoredProc.ParamByName('ID_KATEGORIYA').AsInt64;

  DM.Global_StoredProc.StoredProcName := 'ST_SP_KAT_COPY';
  DM.Global_StoredProc.ParamByName('ID_KAT_OLD').AsInt64 := id_kat_old;
  DM.Global_StoredProc.ParamByName('ID_KAT_NEW').AsInt64 := id_kat_new;
  DM.Global_StoredProc.ExecProc;

  Viewform := TCategoryFormAdd.Create(Self, DM.DB.Handle, DM.Global_Transaction_write.Handle);
  Viewform.is_admin := is_admin;
  Viewform.aHandle  := aHandle;
  Viewform.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
  ViewForm.id_kat := id_kat_new;
  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOK then
   Begin
    try
     DM.Global_StoredProc.Transaction.Commit;
     ViewForm.DM.Global_Transaction_write.Commit;
     DM.Global_StoredProc.Close;
     except
      DM.Global_StoredProc.Transaction.Rollback;
      ViewForm.DM.Global_Transaction_write.Rollback;
      DM.Global_StoredProc.Close;
      raise;
    end;               
    RefreshButtonClick(Sender);
   end
   else
    Begin
     ViewForm.DM.Global_Transaction_write.Rollback;
     DM.Global_Transaction_write.Rollback;
    end;
  Viewform.Free;
  Screen.Cursor:= crDefault;   
end;

procedure TfrmKat_Pay_Main.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
Var
  Arect:TRect;
begin
  if ((AViewInfo.GridRecord.Values[14]= 1) and (not AViewInfo.GridRecord.Focused )) then
   begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Brush.Color:=$00AEA4DF;
    ACanvas.Canvas.FillRect(Arect);
   end;
  if ((AViewInfo.GridRecord.Values[14]= 1) and (AViewInfo.GridRecord.Focused )) then
   begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Brush.Color:=$007968CA;
    ACanvas.Canvas.FillRect(Arect);
   end;
end;

procedure TfrmKat_Pay_Main.Edit_FilterKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Edit_Filter.CurText = '' then exit;

  If IntegerCheck(Edit_Filter.CurText)
   then FiltrByKod_RadioButton.Checked := True
   else FiltrByName_RadioButton.Checked := True;
end;

procedure TfrmKat_Pay_Main.Edit_FilterKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then cxGrid1.SetFocus;
end;

procedure TfrmKat_Pay_Main.Edit_FilterKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Edit_Filter.CurText = '' then exit;

  if key = vk_return then
   begin
    DM.DataSet_main.Close;
    DM.DataSet_main.SQLs.SelectSQL.Text := 'SELECT * FROM ST_SP_KATEGORY_FILTER(:filter_set, :flag)';
    DM.DataSet_main.ParamByName('Filter_set').AsString := Edit_Filter.CurText;
    If FiltrByKod_RadioButton.Checked
     then DM.DataSet_main.ParamByName('flag').AsInteger := 0
     else DM.DataSet_main.ParamByName('flag').AsInteger := 1;
    DM.DataSet_main.Open;
   end;
end;

procedure TfrmKat_Pay_Main.dxBarButton2Click(Sender: TObject);
var
  ss: TShiftState;
  key : Word;
begin
  If edit_filter.text = '' then Exit;

  ss:=[ssShift] ;
  key :=13;
  Edit_FilterKeyDown(self, key, ss);
end;

procedure TfrmKat_Pay_Main.CheckBox_show_only_actingPropertiesChange(
  Sender: TObject);
begin
  SelectAllCategory;
  
  cxGrid1.SetFocus;
end;

end.
