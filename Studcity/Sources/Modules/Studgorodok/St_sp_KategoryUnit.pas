//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник категорий                                                *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit St_sp_KategoryUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
 DataModule1_Unit, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, FIBQuery, pFIBQuery,
  pFIBStoredProc, ActnList, FIBDataSet, pFIBDataSet, cxContainer, cxLabel,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ImgList, ComCtrls, ToolWin, cxCalendar, cxTextEdit,Unit_of_Utilits, Menus,
  StdCtrls, cxCurrencyEdit, RxMenus, dxBar, dxStatusBar,
  AccMGMT,frmCategoryPrint,
  St_Proc, st_ConstUnit;
type
  TCategoryForm = class(TForm)
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
    DataSet: TpFIBDataSet;
    DataSetSELECTED: TIntegerField;
    DataSetID_KATEGORIYA: TFIBIntegerField;
    DataSetNUM_KATEGORIYA: TFIBSmallIntField;
    DataSetNAME_KATEGORIYA: TFIBStringField;
    DataSetSHORT_NAME: TFIBStringField;
    DataSetID_CATEGORY_CLASS: TFIBIntegerField;
    DataSetID_TYPE_CATEGORY: TFIBIntegerField;
    DataSetTYPE_KAT: TFIBSmallIntField;
    DataSetSTUDENT: TFIBSmallIntField;
    DataSetNOT_LIVE: TFIBSmallIntField;
    DataSetBEZ_KOMN: TFIBSmallIntField;
    DataSetNAME_CATEGORY_CLASS: TFIBStringField;
    DataSetNAME_TYPE_CATEGORY: TFIBStringField;
    DataSource: TDataSource;
    WriteProc: TpFIBStoredProc;
    ReadDataSet: TpFIBDataSet;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    RefreshButton: TToolButton;
    ExitButton: TToolButton;
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
    SelectButton: TToolButton;
    ImageList1: TImageList;
    ShortNameLabel: TEdit;
    TypeLabel: TEdit;
    ClassLabel: TEdit;
    SearchButton_Nomer: TToolButton;
    SearchButton_Naim: TToolButton;
    dxBarManager1: TdxBarManager;
    PopupMenu1: TdxBarPopupMenu;
    N1: TdxBarButton;
    N2: TdxBarButton;
    DeleteAction1: TdxBarButton;
    RefreshAction1: TdxBarButton;
    N3: TdxBarButton;
    PopupImageList: TImageList;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    HotKey_StatusBar: TdxStatusBar;
    pay_sum: TcxGridDBColumn;
    Cash_Style: TcxStyle;
    DataSetPAY_SUM: TFIBBCDField;
    SelectAction: TAction;
    btnPrint: TToolButton;
    actPrint: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure DataSetAfterScroll(DataSet: TDataSet);
    procedure DataSetAfterOpen(DataSet: TDataSet);
    procedure DeleteButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure SearchButton_NomerClick(Sender: TObject);
    procedure SearchButton_NaimClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
     private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
    KeyField    : string;
    MultiResult:Variant;
    constructor Create(Aowner:TComponent;FormST:TFormStyle);overload;
    function GetMultiValue():variant;
    procedure SelectAllCategory;
  end;

var
  CategoryForm: TCategoryForm;

implementation

uses st_sp_category_FORM_ADD, main, Nomer_Search, Search_LgotUnit,
  Search_Unit;

{$R *.dfm}

constructor TCategoryForm.Create(Aowner:TComponent;FormST:TFormStyle);
begin
  Inherited Create(Aowner);
  FormStyle:=FormST;
  SelectButton.Enabled:=true;
  cxGrid1DBTableView1.OptionsSelection.MultiSelect:=true;
end;

procedure TCategoryForm.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
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
 SearchButton_Nomer.Caption :=      st_ConstUnit.st_ZaNom[PLanguageIndex];
 SearchButton_Nomer.Hint :=         st_ConstUnit.st_ZaNom[PLanguageIndex];
 SearchButton_Naim.Caption :=      st_ConstUnit.st_ZaName[PLanguageIndex];
 SearchButton_Naim.Hint :=         st_ConstUnit.st_ZaName[PLanguageIndex];
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

 MenuItem1.Hint :=            st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 MenuItem2.Hint :=            st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 MenuItem3.Hint :=            st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 MenuItem4.Hint :=            st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
end;

function  TCategoryForm.GetMultiValue():variant;
begin
  ShowModal;
  GetMultiValue:=MultiResult;
end;

procedure TCategoryForm.SelectAllCategory;
begin
DataSet.Close;
Dataset.Open;
DataSet.FetchAll;
end;


procedure TCategoryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
 MainForm.N4.Enabled:=true;
 MainForm.CloseAllWindows;
end;

procedure TCategoryForm.RefreshButtonClick(Sender: TObject);
var
 selected : integer;
begin
 Screen.Cursor:=crHourGlass;
 selected := -1;
 if DataSet.RecordCount <> 0 then selected := DataSet[KeyField];
 SelectAllCategory;
 DataSet.Locate(KeyField, selected, []);
 Screen.Cursor:=crDefault;
end;

procedure TCategoryForm.FormShow(Sender: TObject);
begin
//cxGrid1DBTableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
// if AllowMultiSelect then cxGrid1DBTableView1.Columns[0].Visible := true;

 cxGrid1.SetFocus;
end;

procedure TCategoryForm.FormCreate(Sender: TObject);
begin
KeyField := 'ID_KATEGORIYA';
cxGrid1DBTableView1.Items[12].DataBinding.ValueTypeClass := TcxFloatValueType;
SelectAllCategory;
FormIniLanguage();
end;

procedure TCategoryForm.ExitButtonClick(Sender: TObject);
begin
Close;
end;

procedure TCategoryForm.DataSetAfterScroll(DataSet: TDataSet);
begin
if DataSet.RecordCount = 0 then exit;
 ShortNameLabel.Text := DataSet['SHORT_NAME'];
 TypeLabel.Text := DataSet['NAME_TYPE_CATEGORY'];
 ClassLabel.Text := DataSet['NAME_CATEGORY_CLASS'];
end;

procedure TCategoryForm.DataSetAfterOpen(DataSet: TDataSet);
begin
 if DataSet.RecordCount = 0 then begin
  EditButton.Enabled := false;
  DeleteButton.Enabled := false;
 end else begin
  EditButton.Enabled := true;
  DeleteButton.Enabled := true;
 end;
end;

procedure TCategoryForm.DeleteButtonClick(Sender: TObject);

var
 RowSelected : integer;
begin
if AccessResult.ID_User <> -999 then
if fibCheckPermission('/ROOT/Studcity/Sp_Kat_Opl','Del') <> 0 then
begin
messagebox(handle,
pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
+#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
exit;
end;
 screen.Cursor:=crHourGlass;
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text := 'select CAN from ST_SP_KAT_CAN_DELETE(' + IntToStr(DataSet[KeyField]) + ')';
 ReadDataSet.Open;
 if ReadDataSet['CAN'] = 0 then begin
  ShowMessage(PChar(st_ConstUnit.st_mess_NoCategoryDelete[PLanguageIndex]));
  screen.Cursor:=crDefault;
  ReadDataSet.Close;
  exit;
 end;
 ReadDataSet.Close;
screen.Cursor:=crDefault;

if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
 WriteProc.StoredProcName := 'ST_SP_KATEGORY_DELETE';
 WriteProc.Transaction.StartTransaction;
 WriteProc.Prepare;
 WriteProc.ParamByName(KeyField).AsInteger := DataSet[KeyField];
 WriteProc.ExecProc;
 try
 WriteProc.Transaction.Commit;
 WriteProc.Close;
 except
 WriteProc.Transaction.Rollback;
 WriteProc.Close;
  raise;
 end;
 RowSelected := cxGrid1DBTableView1.DataController.FocusedRowIndex-1;
 SelectAllCategory;
 cxGrid1DBTableView1.DataController.FocusedRowIndex := RowSelected;
end;

procedure TCategoryForm.AddButtonClick(Sender: TObject);
var
 new_id    : int64;
 i, j      : integer;
 id_stage  : integer;
 new_id_stage : integer;

  function GetNearCategoryNumber(DSetRecCount: integer): integer;
   var
     i, Res: integer;
   begin
     Res:= -1;
     for i:=1 to DSetRecCount-1 do
      begin
        if DataSet.Locate('NUM_KATEGORIYA', i   , []) then
         if DataSet.Locate('NUM_KATEGORIYA', i+1 , []) then
           next
         else
          begin
           Res:= i+1;
           break;
          end;
      end;
       if Res = -1 then Result:= DSetRecCount +1
       else
       Result:= Res;
   end;

begin
if AccessResult.ID_User <> -999 then
if fibCheckPermission('/ROOT/Studcity/Sp_Kat_Opl','Add') <> 0 then
begin
messagebox(handle,
pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
+#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
exit;
end;

 CategoryFormAdd := TCategoryFormAdd.Create(Self);
 CategoryFormAdd.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];

// выбираю новый следующий номер по-порядку
 CategoryFormAdd.KodEdit.Text := inttostr(GetNearCategoryNumber(DataSet.RecordCount-1));

 if CategoryFormAdd.ShowModal = mrOK then begin
 CategoryForm.Update;
 Screen.Cursor:= crSQLWait;
 //Добавляем категорию
  WriteProc.StoredProcName := 'ST_SP_KATEGORY_INSERT';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('NUM_KATEGORIYA').AsInteger := StrToInt(CategoryFormAdd.KodEdit.Text);
  WriteProc.ParamByName('NAME_KATEGORIYA').AsString := CategoryFormAdd.NameEdit.Text;
  WriteProc.ParamByName('SHORT_NAME').AsString := CategoryFormAdd.ShortEdit.Text;
  WriteProc.ParamByName('ID_CATEGORY_CLASS').AsInteger := CategoryFormAdd.id_category_class;
  WriteProc.ParamByName('ID_TYPE_CATEGORY').AsInteger := CategoryFormAdd.id_type_category;
  if CategoryFormAdd.MonthCheck.Checked then WriteProc.ParamByName('TYPE_KAT').AsInteger := 1 else WriteProc.ParamByName('TYPE_KAT').AsInteger := 0;
  if CategoryFormAdd.StudCheck.Checked then WriteProc.ParamByName('STUDENT').AsInteger := 1 else WriteProc.ParamByName('STUDENT').AsInteger := 0;
  if CategoryFormAdd.NotliveCheck.Checked then WriteProc.ParamByName('NOT_LIVE').AsInteger := 1 else WriteProc.ParamByName('NOT_LIVE').AsInteger := 0;
  if CategoryFormAdd.PropiskaCheck.Checked then WriteProc.ParamByName('BEZ_KOMN').AsInteger := 1 else WriteProc.ParamByName('BEZ_KOMN').AsInteger := 0;
  WriteProc.ExecProc;
  new_id := WriteProc[KeyField].AsInt64;

  //Добавление сумм
   for i := 0 to CategoryFormAdd.cxGrid1TableView1.DataController.RecordCount - 1 do begin
   WriteProc.StoredProcName := 'ST_SP_KAT_SUM_INSERT';
   WriteProc.Prepare;
   WriteProc.ParamByName('ID_KATEGORIYA').AsInt64 := new_id;
   WriteProc.ParamByName('SUB_MAX').asCurrency :=CategoryFormAdd.cxGrid1TableView1.DataController.Values[i, 3];
   WriteProc.ParamByName('PAY_SUM').asCurrency := CategoryFormAdd.cxGrid1TableView1.DataController.Values[i, 2];
   WriteProc.ParamByName('SUB_SUM').asCurrency := CategoryFormAdd.cxGrid1TableView1.DataController.Values[i, 4];
   WriteProc.ParamByName('BEG_DATE').AsDate := CategoryFormAdd.cxGrid1TableView1.DataController.Values[i, 0];
   WriteProc.ParamByName('END_DATE').AsDate := CategoryFormAdd.cxGrid1TableView1.DataController.Values[i, 1];
   WriteProc.ParamByName('USE_BEG').AsDateTime := DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP;
   WriteProc.ParamByName('USE_END').AsDateTime := sys_max_timestamp;
   WriteProc.ExecProc;
   new_id_stage := WriteProc['ID_STAGE'].AsInteger;

   //Добавление источников финансирования
   id_stage := CategoryFormAdd.cxGrid1TableView1.DataController.Values[i, 5];
   for j := 0 to Length(CategoryFormAdd.KatSmet) - 1 do if CategoryFormAdd.KatSmet[j].id_stage = id_stage then begin
    WriteProc.StoredProcName := 'ST_SP_KAT_SMET_INSERT';
    WriteProc.Prepare;
    WriteProc.ParamByName('ID_STAGE').AsInteger := new_id_stage;
    WriteProc.ParamByName('PERCENT').AsFloat := CategoryFormAdd.KatSmet[j].percent;
    WriteProc.ParamByName('SUB_PERC').AsFloat := CategoryFormAdd.KatSmet[j].sub_percent;
    WriteProc.ParamByName('SUMMA').AsCurrency := CategoryFormAdd.KatSmet[j].summa;
    WriteProc.ParamByName('KOD_SM').AsInteger := CategoryFormAdd.KatSmet[j].kod_sm;
    WriteProc.ParamByName('KOD_RAZD').AsInteger := CategoryFormAdd.KatSmet[j].kod_razd;
    WriteProc.ParamByName('KOD_ST').AsInteger := CategoryFormAdd.KatSmet[j].kod_st;
    WriteProc.ParamByName('KOD_KEKV').AsInteger := CategoryFormAdd.KatSmet[j].kod_kekv;
    WriteProc.ParamByName('USE_BEG').AsDateTime := DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP;
    WriteProc.ParamByName('USE_END').AsDateTime := sys_max_timestamp;
    WriteProc.ParamByName('SUB_SUMMA').AsCurrency := CategoryFormAdd.KatSmet[j].sub_summa;
    WriteProc.ExecProc;
   end;
  end;
  try
  WriteProc.Transaction.Commit;
  WriteProc.Close;
  except
  WriteProc.Transaction.Rollback;
  WriteProc.Close;
  raise;
  end;
  SelectAllCategory;
  DataSet.Locate(KeyField, new_id, []);
 end;
 CategoryFormAdd.Free;
Screen.Cursor:= crDefault;
 end;




procedure TCategoryForm.EditButtonClick(Sender: TObject);
var
 i, j      : integer;
 id_stage  : Int64;
 new_id_stage : Int64;
 id_kategoriya : Int64;
begin
if AccessResult.ID_User <> -999 then
if fibCheckPermission('/ROOT/Studcity/Sp_Kat_Opl','Edit') <> 0 then
begin
messagebox(handle,
pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
+#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
exit;
end;
 id_kategoriya := DataSet['ID_KATEGORIYA'];
 CategoryFormAdd := TCategoryFormAdd.Create(Self);
 CategoryFormAdd.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 if DataSet['NUM_KATEGORIYA'] <> null then
 CategoryFormAdd.KodEdit.Text := DataSet['NUM_KATEGORIYA'];
 if DataSet['SHORT_NAME'] <> null then
 CategoryFormAdd.ShortEdit.Text := DataSet['SHORT_NAME'];
 if DataSet['NAME_KATEGORIYA'] <> null then
 CategoryFormAdd.NameEdit.Text := DataSet['NAME_KATEGORIYA'];
 if DataSet['STUDENT'] <> null then
 CategoryFormAdd.StudCheck.Checked := DataSet['STUDENT'] = 1;
 if DataSet['TYPE_KAT'] <> null then
 CategoryFormAdd.MonthCheck.Checked := DataSet['TYPE_KAT'] = 1;
 if DataSet['NOT_LIVE'] <> null  then
 CategoryFormAdd.NotliveCheck.Checked := DataSet['NOT_LIVE'] = 1;
 if DataSet['BEZ_KOMN'] <> null  then
 CategoryFormAdd.PropiskaCheck.Checked := DataSet['BEZ_KOMN'] = 1;
 if DataSet['ID_TYPE_CATEGORY'] <> null  then
 CategoryFormAdd.id_type_category := DataSet['ID_TYPE_CATEGORY'];
 if DataSet['NAME_TYPE_CATEGORY'] <> null   then
 CategoryFormAdd.TypeEdit.Text := DataSet['NAME_TYPE_CATEGORY'];
 if DataSet['ID_CATEGORY_CLASS'] <> null  then
 CategoryFormAdd.id_category_class := DataSet['ID_CATEGORY_CLASS'];
 if DataSet['NAME_CATEGORY_CLASS'] <> null  then
 CategoryFormAdd.ClassEdit.Text := DataSet['NAME_CATEGORY_CLASS'];
 //Выбираем суммы
 ReadDataSet.SelectSQL.Text := 'select * from ST_SP_KAT_SUM_SELECT(' + IntToStr(id_kategoriya) + ')';
 ReadDataSet.Open;
 if ReadDataSet.RecordCount <> 0 then for i := 0 to ReadDataSet.RecordCount - 1 do begin
  CategoryFormAdd.cxGrid1TableView1.DataController.RecordCount := CategoryFormAdd.cxGrid1TableView1.DataController.RecordCount + 1;
  CategoryFormAdd.cxGrid1TableView1.DataController.Values[CategoryFormAdd.cxGrid1TableView1.DataController.RecordCount - 1, 0] := ReadDataSet['BEG_DATE'];
  CategoryFormAdd.cxGrid1TableView1.DataController.Values[CategoryFormAdd.cxGrid1TableView1.DataController.RecordCount - 1, 1] := ReadDataSet['END_DATE'];
  CategoryFormAdd.cxGrid1TableView1.DataController.Values[CategoryFormAdd.cxGrid1TableView1.DataController.RecordCount - 1, 4] := ReadDataSet['SUB_SUM'];
  CategoryFormAdd.cxGrid1TableView1.DataController.Values[CategoryFormAdd.cxGrid1TableView1.DataController.RecordCount - 1, 2] := ReadDataSet['PAY_SUM'];
  CategoryFormAdd.cxGrid1TableView1.DataController.Values[CategoryFormAdd.cxGrid1TableView1.DataController.RecordCount - 1, 3] := ReadDataSet['SUB_MAX'];
  CategoryFormAdd.cxGrid1TableView1.DataController.Values[CategoryFormAdd.cxGrid1TableView1.DataController.RecordCount - 1, 5] := ReadDataSet['ID_STAGE'];
  ReadDataSet.Next;
 end;
 ReadDataSet.Close;
 //Выбираем источники финансирования
 ReadDataSet.SelectSQL.Text := 'select * from ST_SP_KAT_SMET_SELECT(' + IntToStr(id_kategoriya) + ')';
 ReadDataSet.Open;
 if ReadDataSet.RecordCount <> 0 then
  for i := 0 to ReadDataSet.RecordCount - 1 do begin
  SetLength(CategoryFormAdd.KatSmet, Length(CategoryFormAdd.KatSmet) + 1);
  CategoryFormAdd.KatSmet[Length(CategoryFormAdd.KatSmet) - 1].id_stage := ReadDataSet['ID_STAGE'];
  CategoryFormAdd.KatSmet[Length(CategoryFormAdd.KatSmet) - 1].percent := ReadDataSet['PERCENT'];
  CategoryFormAdd.KatSmet[Length(CategoryFormAdd.KatSmet) - 1].sub_percent := ReadDataSet['SUB_PERC'];
  CategoryFormAdd.KatSmet[Length(CategoryFormAdd.KatSmet) - 1].summa := ReadDataSet['SUMMA'];
  CategoryFormAdd.KatSmet[Length(CategoryFormAdd.KatSmet) - 1].kod_sm := ReadDataSet['KOD_SM'];
  CategoryFormAdd.KatSmet[Length(CategoryFormAdd.KatSmet) - 1].kod_razd := ReadDataSet['KOD_RAZD'];
  CategoryFormAdd.KatSmet[Length(CategoryFormAdd.KatSmet) - 1].kod_st := ReadDataSet['KOD_ST'];
  CategoryFormAdd.KatSmet[Length(CategoryFormAdd.KatSmet) - 1].kod_kekv := ReadDataSet['KOD_KEKV'];
  if ReadDataSet['SUB_SUMMA'] <> null then
  CategoryFormAdd.KatSmet[Length(CategoryFormAdd.KatSmet) - 1].sub_summa := ReadDataSet['SUB_SUMMA'];
  ReadDataSet.Next;
 end;
 ReadDataSet.Close;

 if CategoryFormAdd.ShowModal = mrOK then begin
  CategoryForm.Update;
  Screen.Cursor:= crSQLWait;
  //Изменяем категорию

  WriteProc.StoredProcName := 'ST_SP_KATEGORY_UPDATE';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_KATEGORIYA').AsInt64 := id_kategoriya;
  WriteProc.ParamByName('NUM_KATEGORIYA').AsInteger := StrToInt(CategoryFormAdd.KodEdit.Text);
  WriteProc.ParamByName('NAME_KATEGORIYA').AsString := CategoryFormAdd.NameEdit.Text;
  WriteProc.ParamByName('SHORT_NAME').AsString := CategoryFormAdd.ShortEdit.Text;
  WriteProc.ParamByName('ID_CATEGORY_CLASS').AsInt64 := CategoryFormAdd.id_category_class;
  WriteProc.ParamByName('ID_TYPE_CATEGORY').AsInt64 := CategoryFormAdd.id_type_category;
  if CategoryFormAdd.MonthCheck.Checked then WriteProc.ParamByName('TYPE_KAT').AsInteger := 1 else WriteProc.ParamByName('TYPE_KAT').AsInteger := 0;
  if CategoryFormAdd.StudCheck.Checked then WriteProc.ParamByName('STUDENT').AsInteger := 1 else WriteProc.ParamByName('STUDENT').AsInteger := 0;
  if CategoryFormAdd.NotliveCheck.Checked then WriteProc.ParamByName('NOT_LIVE').AsInteger := 1 else WriteProc.ParamByName('NOT_LIVE').AsInteger := 0;
  if CategoryFormAdd.PropiskaCheck.Checked then WriteProc.ParamByName('BEZ_KOMN').AsInteger := 1 else WriteProc.ParamByName('BEZ_KOMN').AsInteger := 0;
  WriteProc.ExecProc;

  //Удаляем источники финансирования
  WriteProc.StoredProcName := 'ST_SP_KAT_SMET_DELETE';
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_KATEGORIYA').AsInt64 := id_kategoriya;
  WriteProc.ExecProc;
  //Удаляем суммы
  WriteProc.StoredProcName := 'ST_SP_KAT_SUM_DELETE';
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_KATEGORIYA').AsInt64 := id_kategoriya;
  WriteProc.ExecProc;
  //Добавляем суммы
  for i := 0 to CategoryFormAdd.cxGrid1TableView1.DataController.RecordCount - 1 do begin
   WriteProc.StoredProcName := 'ST_SP_KAT_SUM_INSERT';
   WriteProc.Prepare;
   WriteProc.ParamByName('ID_KATEGORIYA').AsInt64 := id_kategoriya;
   WriteProc.ParamByName('SUB_MAX').asCurrency := CategoryFormAdd.cxGrid1TableView1.DataController.Values[i, 3];
   WriteProc.ParamByName('PAY_SUM').asCurrency := CategoryFormAdd.cxGrid1TableView1.DataController.Values[i, 2];
   WriteProc.ParamByName('SUB_SUM').asCurrency := CategoryFormAdd.cxGrid1TableView1.DataController.Values[i, 4];
   WriteProc.ParamByName('BEG_DATE').AsDate := CategoryFormAdd.cxGrid1TableView1.DataController.Values[i, 0];
   WriteProc.ParamByName('END_DATE').AsDate := CategoryFormAdd.cxGrid1TableView1.DataController.Values[i, 1];
   WriteProc.ParamByName('USE_BEG').AsDateTime := DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP;
   WriteProc.ParamByName('USE_END').AsDateTime := sys_max_timestamp;
   WriteProc.ExecProc;
   new_id_stage := WriteProc['ID_STAGE'].AsInteger;

   //Добавляем источники финансирования
   id_stage := CategoryFormAdd.cxGrid1TableView1.DataController.Values[i, 5];
   for j := 0 to Length(CategoryFormAdd.KatSmet) - 1 do if CategoryFormAdd.KatSmet[j].id_stage = id_stage then begin
    WriteProc.StoredProcName := 'ST_SP_KAT_SMET_INSERT';
    WriteProc.Prepare;
    WriteProc.ParamByName('ID_STAGE').AsInteger := new_id_stage;
    WriteProc.ParamByName('PERCENT').AsFloat := CategoryFormAdd.KatSmet[j].percent;
    WriteProc.ParamByName('SUB_PERC').AsFloat := CategoryFormAdd.KatSmet[j].sub_percent;
    WriteProc.ParamByName('SUMMA').AsCurrency := CategoryFormAdd.KatSmet[j].summa;
    WriteProc.ParamByName('KOD_SM').AsInteger := CategoryFormAdd.KatSmet[j].kod_sm;
    WriteProc.ParamByName('KOD_RAZD').AsInteger := CategoryFormAdd.KatSmet[j].kod_razd;
    WriteProc.ParamByName('KOD_ST').AsInteger := CategoryFormAdd.KatSmet[j].kod_st;
    WriteProc.ParamByName('USE_BEG').AsDateTime := DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP;
    WriteProc.ParamByName('USE_END').AsDateTime := sys_max_timestamp;
    WriteProc.ParamByName('SUB_SUMMA').AsCurrency := CategoryFormAdd.KatSmet[j].sub_summa;
    WriteProc.ParamByName('KOD_KEKV').AsInteger:=  CategoryFormAdd.KatSmet[j].kod_kekv;
    WriteProc.ExecProc;
   end;
  end;
  try
  WriteProc.Transaction.Commit;
  WriteProc.Close;
  except
  WriteProc.Transaction.Rollback;
  WriteProc.Close;
  raise;
  end;
  RefreshButtonClick(Sender);
 end;


 CategoryFormAdd.Free;
 Screen.Cursor:= crDefault;
end;

procedure TCategoryForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
if cxGrid1DBTableView1.OptionsSelection.MultiSelect=false then
if SelectButton.Enabled then ModalResult:=mrOk
else
EditAction.Execute;

if cxGrid1DBTableView1.OptionsSelection.MultiSelect=true then
ModalResult:=mrOk;

end;

procedure TCategoryForm.SelectButtonClick(Sender: TObject);
var i : integer;
    RecMultiSelected : integer;
begin
    if cxGrid1DBTableView1.OptionsSelection.MultiSelect=true then
    begin
      RecMultiSelected:=cxGrid1DBTableView1.DataController.GetSelectedCount;
      MultiResult:=VarArrayCreate([0,RecMultiSelected-1],varVariant);
      for i:=0 to cxGrid1DBTableView1.DataController.GetSelectedCount-1 do
        begin
          MultiResult[i]:=cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[1];
        end;
     end;
ModalResult:=mrOk;
end;

procedure TCategoryForm.SearchButton_NomerClick(Sender: TObject);
begin
 Nomer_SearchForm := TNomer_SearchForm.Create(Self);
 if Nomer_SearchForm.ShowModal = mrOK then begin
// CategoryForm.NAME_KATEGORIYA.SortOrder:=soNone;
 NUM_KATEGORIYA.SortOrder:=soAscending;
 DataSet.Locate('NUM_KATEGORIYA', Nomer_SearchForm.Nomer_Edit.Text, [loCaseInsensitive, loPartialKey]);
 end;
 Nomer_SearchForm.Free;
end;

procedure TCategoryForm.SearchButton_NaimClick(Sender: TObject);
begin
if N3.Down = true then
begin
Search_LgotForm := TSearch_LgotForm.Create(Self);
 while Search_LgotForm.FindFlag = false do begin
 if Search_LgotForm.FindClosed = true then begin
 Search_LgotForm.Free;
 exit;
 end;
 if Search_LgotForm.ShowModal = mrOk then begin
 if Search_LgotForm.FindFlag = true then begin
  NAME_KATEGORIYA.SortOrder:=soAscending;

  DataSet.Locate('NAME_KATEGORIYA', Search_LgotForm.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
  Search_LgotForm.Free;
  exit;
  end
  else begin

    NAME_KATEGORIYA.SortOrder:=soAscending;
   DataSet.Locate('NAME_KATEGORIYA', Search_LgotForm.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
   Search_LgotForm.showModal;
   end;
 end;
 end;
 if Search_LgotForm.FindFlag = true then begin

  NAME_KATEGORIYA.SortOrder:=soAscending;
  DataSet.Locate('NAME_KATEGORIYA', Search_LgotForm.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
  Search_LgotForm.Free;
  end;
 end
 else begin
 Search_Form:= TSearch_Form.create(self);
 if Search_Form.ShowModal = mrOk then begin

 NAME_KATEGORIYA.SortOrder:=soAscending;
 DataSet.Locate('NAME_KATEGORIYA', Search_Form.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
 end;
 end;

 end;

procedure TCategoryForm.btnPrintClick(Sender: TObject);
var ViewForm : TfrmPrint;
begin
  ViewForm := TfrmPrint.Create(self);
  ViewForm.DBh := DataModule1.pFIBDatabase1.Handle;
  ViewForm.OkButton.Caption := st_ConstUnit.st_Print_Caption[PLanguageIndex];
  ViewForm.CancelButton.Caption := st_ConstUnit.st_Cancel[PLanguageIndex];
  ViewForm.Caption :=st_ConstUnit.st_Print_Caption[PLanguageIndex];
  ViewForm.ShowModal;


end;

procedure TCategoryForm.actPrintExecute(Sender: TObject);
begin
 btnPrintClick(Sender);

end;

end.
