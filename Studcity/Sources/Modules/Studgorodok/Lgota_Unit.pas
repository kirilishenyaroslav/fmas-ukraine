//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник льгот                                                    *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit Lgota_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Menus, ComCtrls, ToolWin, ExtCtrls,
  cxContainer, cxCheckBox, cxDBEdit, StdCtrls, ImgList, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxCalendar, cxCurrencyEdit,
  FIBQuery, pFIBQuery, pFIBStoredProc, ActnList, cxTextEdit, dxBar,
  dxStatusBar, AccMGMT, St_Proc, st_ConstUnit;

type
  TSpravLgotForm = class(TForm)
    Panel1: TPanel;
    GosCheck: TcxCheckBox;
    MedCheck: TcxCheckBox;
    SokrLabel: TLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle3: TcxStyle;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    RefreshButton: TToolButton;
    ExitButton: TToolButton;
     pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    ReadOnlyDataSet: TpFIBDataSet;
    WriteStoredProc: TpFIBStoredProc;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    cxStyle2: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    SelectButton: TToolButton;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    ShortNameLabel: TEdit;
    SearchButton_Nomer: TToolButton;
    SearchAction: TAction;
    SearchButton_Naim: TToolButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    dxBarManager1: TdxBarManager;
    N1: TdxBarButton;
    N2: TdxBarButton;
    DeleteAction1: TdxBarButton;
    RefreshAction1: TdxBarButton;
    N3: TdxBarButton;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    HotKey_StatusBar: TdxStatusBar;
    N4: TMenuItem;
    PopupImageList: TImageList;
    SelectAction: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure pFIBDataSet1AfterScroll(DataSet: TDataSet);
    procedure pFIBDataSet1AfterOpen(DataSet: TDataSet);
    procedure SelectButtonClick(Sender: TObject);
    procedure SearchButton_NomerClick(Sender: TObject);
    procedure SearchButton_NaimClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);


  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
       KeyField : string;
       procedure SelectLgotasAll;
       end;
var
  SpravLgotForm: TSpravLgotForm;

implementation
 uses main, st_sp_lgota_FORM_ADD,Unit_of_Utilits,DataModule1_Unit,
  St_PfLg_Add_Form, Search_LgotUnit, Nomer_Search, Search_Unit;

{$R *.dfm}

procedure TSpravLgotForm.FormIniLanguage();
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

 HotKey_StatusBar.Panels[0].Text:=  st_ConstUnit.st_InsertBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[1].Text:=  st_ConstUnit.st_EditBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[2].Text:=  st_ConstUnit.st_DeleteBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[3].Text:=  st_ConstUnit.st_RefreshBtn_ShortCut[PLanguageIndex] + st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[4].Text:=  st_ConstUnit.st_Select_Caption[PLanguageIndex]      + st_ConstUnit.st_EnterBtn_ShortCut[PLanguageIndex];
 HotKey_StatusBar.Panels[5].Text:=  st_ConstUnit.st_ExitBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Hint :=           st_ConstUnit.st_HotKeys[PLanguageIndex];

 // скорочення
 SokrLabel.Caption :=           st_ConstUnit.st_ShortLable[PLanguageIndex];
 GosCheck.Properties.Caption:=  st_ConstUnit.st_GosCheck[PLanguageIndex];
 MedCheck.Properties.Caption:=  st_ConstUnit.st_MedCheck[PLanguageIndex];

 // пошел грид
 cxGrid1DBTableView1DBColumn1.Caption :=    st_ConstUnit.st_Nomer[PLanguageIndex];
 cxGrid1DBTableView1DBColumn2.Caption :=    st_ConstUnit.st_NameLable[PLanguageIndex];
 cxGrid1DBTableView1DBColumn3.Caption :=    st_ConstUnit.st_PercentOnly[PLanguageIndex];

 MenuItem1.Caption :=            st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 MenuItem2.Caption :=            st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 MenuItem3.Caption :=            st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 MenuItem4.Caption :=            st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 N4.Caption :=                   st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];

 MenuItem1.Hint :=            st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 MenuItem2.Hint :=            st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 MenuItem3.Hint :=            st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 MenuItem4.Hint :=            st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 N4.Hint :=                   st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
end;

procedure TSpravLgotForm.SelectLgotasAll;
begin
 pFIBDataSet1.Close;
 pFIBDataSet1.Open;
end;


procedure TSpravLgotForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//UNConnectToServer;
Action:=caFree;
MainForm.N1.Enabled:=true;
MainForm.CloseAllWindows;
end;

procedure TSpravLgotForm.FormShow(Sender: TObject);
begin
//cxGrid1DBTableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
 //if AllowMultiSelect then cxGrid1DBTableView1.Columns[0].Visible := true;
//ConnectToServerRUN;
end;

procedure TSpravLgotForm.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TSpravLgotForm.RefreshButtonClick(Sender: TObject);
var
 RowSelected : integer;
begin
 Screen.Cursor:=crHourGlass;
 RowSelected := -1;
 if pFIBDataSet1.RecordCount <> 0 then RowSelected := pFIBDataSet1[KeyField];
 SelectLgotasAll;
 pFIBDataSet1.Locate(KeyField, RowSelected, []);
 Screen.Cursor:=crDefault;
end;

procedure TSpravLgotForm.FormCreate(Sender: TObject);
begin
 KeyField := 'KOD_LG';
 SelectLgotasAll;
 FormIniLanguage();
end;

procedure TSpravLgotForm.DeleteButtonClick(Sender: TObject);

var
 RowSelected : integer;
begin

if fibCheckPermission('/ROOT/Studcity/Sp_Lgot_Opl','Del') <> 0 then
begin
messagebox(handle,
pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
+#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
exit;
end;

 ReadOnlyDataSet.SelectSQL.Text := 'select CAN from ST_SP_LGOTA_CAN_DELETE(' + IntToStr(pFIBDataSet1[KeyField]) + ')';
 ReadOnlyDataSet.Open;
 if ReadOnlyDataSet['CAN'] = 0 then begin
  ShowMessage(st_ConstUnit.st_CannotDelete_Lgota[PLanguageIndex]);
  ReadOnlyDataSet.Close;
  exit;
 end;
 ReadOnlyDataSet.Close;

if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
 WriteStoredProc.StoredProcName := 'ST_SP_LGOTA_DELETE';
 WriteStoredProc.Transaction.StartTransaction;
 WriteStoredProc.Prepare;
 WriteStoredProc.ParamByName(KeyField).AsInteger := pFIBDataSet1[KeyField];
 WriteStoredProc.ExecProc;
 try
 WriteStoredProc.Transaction.Commit;
 WriteStoredProc.Close;
 except
  WriteStoredProc.Transaction.Rollback;
  WriteStoredProc.Close;
  raise;
end;
 RowSelected := cxGrid1DBTableView1.DataController.FocusedRowIndex-1;
 RefreshButton.Click;
 cxGrid1DBTableView1.DataController.FocusedRowIndex := RowSelected;
end;

procedure TSpravLgotForm.AddButtonClick(Sender: TObject);

var
 new_item_id    : integer;
 i         : integer;
begin
if fibCheckPermission('/ROOT/Studcity/Sp_Lgot_Opl','Add') <> 0 then
begin
messagebox(handle,
pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
+#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
exit;
end;
 LgotaFormAdd := TLgotaFormAdd.Create(Self);
 LgotaFormAdd.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 if LgotaFormAdd.ShowModal = mrOK then begin
  Screen.Cursor:= crHourGlass;
  //Добавляем льготу
  WriteStoredProc.StoredProcName := 'ST_SP_LGOTA_INSERT';
  WriteStoredProc.Transaction.StartTransaction;
  WriteStoredProc.Prepare;
  WriteStoredProc.ParamByName('NUM_LG').AsInteger := StrToInt(LgotaFormAdd.KodEdit.Text);
  WriteStoredProc.ParamByName('SHORT_NAME').AsString := LgotaFormAdd.ShortEdit.Text;
  WriteStoredProc.ParamByName('NAME_LG').AsString := LgotaFormAdd.NameEdit.Text;
  WriteStoredProc.ParamByName('MEDICAL').AsShort := BoolConvert(LgotaFormAdd.MedCheck.Checked);
  WriteStoredProc.ParamByName('STATE_LGOT').AsShort := BoolConvert(LgotaFormAdd.GosCheck.Checked);
  WriteStoredProc.ExecProc;
  new_item_id :=  WriteStoredProc[KeyField].AsInteger;

  //Добавляение суммы, периодов и процентов льгот
   WriteStoredProc.StoredProcName := 'ST_SP_LGOT_SUM_INSERT';
   for i := 0 to LgotaFormAdd.cxGrid1TableView1.DataController.RecordCount - 1 do begin
   WriteStoredProc.Prepare;
   WriteStoredProc.ParamByName('KOD_LG').AsInteger := new_item_id;
   WriteStoredProc.ParamByName('BEG_DATE').AsDate := LgotaFormAdd.cxGrid1TableView1.DataController.Values[i, 0];
   WriteStoredProc.ParamByName('END_DATE').AsDate := LgotaFormAdd.cxGrid1TableView1.DataController.Values[i, 1];
   WriteStoredProc.ParamByName('PERCENT').AsCurrency := LgotaFormAdd.cxGrid1TableView1.DataController.Values[i, 2];
   WriteStoredProc.ParamByName('USE_BEG').AsDateTime := DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP;
   WriteStoredProc.ParamByName('USE_END').AsDateTime := SYS_MAX_TIMESTAMP;
   WriteStoredProc.ExecProc;
   end;
  try
  WriteStoredProc.Transaction.Commit;
  WriteStoredProc.Close;
  except
  WriteStoredProc.Transaction.Rollback;
  WriteStoredProc.Close;
  raise;
end;
  SelectLgotasAll;
  pFIBDataSet1.Locate(KeyField, new_item_id, []);
 end;
 LgotaFormAdd.Free;
 Screen.Cursor:= crDefault;
end;

procedure TSpravLgotForm.EditButtonClick(Sender: TObject);
var
 edit_item_id  : integer;
 i             : integer;
 begin

 if fibCheckPermission('/ROOT/Studcity/Sp_Lgot_Opl','Edit') <> 0 then
begin
messagebox(handle,
pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
+#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
exit;
end;

 edit_item_id := pFIBDataSet1['KOD_LG'];
 LgotaFormAdd := TLgotaFormAdd.Create(Self);
 LgotaFormAdd.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 LgotaFormAdd.KodEdit.Text := pFIBDataSet1['NUM_LG'];
 LgotaFormAdd.ShortEdit.Text := pFIBDataSet1['SHORT_NAME'];
 LgotaFormAdd.NameEdit.Text := pFIBDataSet1['NAME_LG'];
 LgotaFormAdd.GosCheck.Checked := pFIBDataSet1['STATE_LGOT'] = 1;
 LgotaFormAdd.MedCheck.Checked := pFIBDataSet1['MEDICAL'] = 1;
 //Выбираем суммы
  ReadOnlyDataSet.SelectSQL.Clear;
  ReadOnlyDataSet.SelectSQL.Text := 'select * from ST_SP_LGOT_SUM_SELECT(' + IntToStr(edit_item_id) + ')';
  ReadOnlyDataSet.Open;
  ReadOnlyDataSet.FetchAll;
  LgotaFormAdd.cxGrid1TableView1.DataController.RecordCount := ReadOnlyDataSet.RecordCount;
  for i := 0 to ReadOnlyDataSet.RecordCount-1  do begin
  LgotaFormAdd.cxGrid1TableView1.DataController.Values[i, 0] := ReadOnlyDataSet['BEG_DATE'];
  LgotaFormAdd.cxGrid1TableView1.DataController.Values[i, 1] := ReadOnlyDataSet['END_DATE'];
  LgotaFormAdd.cxGrid1TableView1.DataController.Values[i, 2] := ReadOnlyDataSet['PERCENT'];
  ReadOnlyDataSet.Next;
 end;
 ReadOnlyDataSet.Close;
 if LgotaFormAdd.ShowModal = mrOK then begin
 Screen.Cursor:= crSQLWait;
  //Изменияем льготу
  With WriteStoredProc do
  begin
  StoredProcName := 'ST_SP_LGOTA_UPDATE';
  Transaction.StartTransaction;
  Prepare;
  ParamByName(KeyField).AsInteger := edit_item_id;
  ParamByName('NUM_LG').AsInteger := StrToInt(LgotaFormAdd.KodEdit.Text);
  ParamByName('SHORT_NAME').AsString := LgotaFormAdd.ShortEdit.Text;
  ParamByName('NAME_LG').AsString := LgotaFormAdd.NameEdit.Text;
  ParamByName('MEDICAL').AsShort := BoolConvert(LgotaFormAdd.MedCheck.Checked);
  ParamByName('STATE_LGOT').AsShort := BoolConvert(LgotaFormAdd.GosCheck.Checked);
  ExecProc;
  end;
  //Закрываем существующие суммы
  With WriteStoredProc do
  begin
  StoredProcName := 'ST_SP_LGOT_SUM_CLOSE';
  Prepare;
  ParamByName(KeyField).AsInteger := edit_item_id;
  ExecProc;
  end;
  //Добавляем суммы
  WriteStoredProc.StoredProcName := 'ST_SP_LGOT_SUM_INSERT';
  for i := 0 to LgotaFormAdd.cxGrid1TableView1.DataController.RecordCount - 1 do begin
   With WriteStoredProc do
   begin
    Prepare;
    ParamByName('KOD_LG').AsInteger := edit_item_id;
    ParamByName('BEG_DATE').AsDate := LgotaFormAdd.cxGrid1TableView1.DataController.Values[i, 0];
    ParamByName('END_DATE').AsDate := LgotaFormAdd.cxGrid1TableView1.DataController.Values[i, 1];
    ParamByName('PERCENT').AsSingle := LgotaFormAdd.cxGrid1TableView1.DataController.Values[i, 2];
    ParamByName('USE_BEG').AsDateTime := DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP;
    ParamByName('USE_END').AsDateTime := SYS_MAX_TIMESTAMP;
    ExecProc;
    end;
   end;
  try
  WriteStoredProc.Transaction.Commit;
  WriteStoredProc.Close;
  except
  WriteStoredProc.Transaction.Rollback;
  WriteStoredProc.Close;
  raise;
end;

  SelectLgotasAll;
  pFIBDataSet1.Locate(KeyField, edit_item_id , []);
 end;
 LgotaFormAdd.Free;
 Screen.Cursor:= crDefault;

end;

procedure TSpravLgotForm.pFIBDataSet1AfterScroll(DataSet: TDataSet);
begin
 if pFIBDataSet1.RecordCount = 0 then exit;
 ShortNameLabel.Text := pFIBDataSet1['SHORT_NAME'];
 GosCheck.Checked := pFIBDataSet1['STATE_LGOT'] = 1;
 MedCheck.Checked := pFIBDataSet1['MEDICAL'] = 1;
end;

procedure TSpravLgotForm.pFIBDataSet1AfterOpen(DataSet: TDataSet);
begin
if pFIBDataSet1.RecordCount = 0 then begin
  EditButton.Enabled := false;
  DeleteButton.Enabled := false;
  SearchButton_Nomer.Enabled := false;
  SearchButton_Naim.Enabled := false;
 end else begin
  EditButton.Enabled := true;
  DeleteButton.Enabled := true;
SearchButton_Nomer.Enabled := true;
  SearchButton_Naim.Enabled := true;
 end;
end;

procedure TSpravLgotForm.SelectButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TSpravLgotForm.SearchButton_NomerClick(Sender: TObject);
begin
 Nomer_SearchForm := TNomer_SearchForm.Create(Self);
 if Nomer_SearchForm.ShowModal = mrOK then begin
 //cxGrid1DBTableView1DBColumn2.SortOrder:=soNone;
 cxGrid1DBTableView1DBColumn1.SortOrder:=soAscending;
 pFIBDataSet1.Locate('NUM_LG', Nomer_SearchForm.Nomer_Edit.Text, [loCaseInsensitive, loPartialKey]);
 end;
 Nomer_SearchForm.Free;
end;

procedure TSpravLgotForm.SearchButton_NaimClick(Sender: TObject);
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
 // cxGrid1DBTableView1DBColumn2.SortOrder:=soAscending;
  pFIBDataSet1.Locate('NAME_LG', Search_LgotForm.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
  Search_LgotForm.Free;
  exit;
  end
  else begin
 //  cxGrid1DBTableView1DBColumn2.SortOrder:=soAscending;
   pFIBDataSet1.Locate('NAME_LG', Search_LgotForm.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
   Search_LgotForm.showModal;
   end;
 end;
 end;
 if Search_LgotForm.FindFlag = true then begin
  //  cxGrid1DBTableView1DBColumn2.SortOrder:=soAscending;
  pFIBDataSet1.Locate('NAME_LG', Search_LgotForm.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
  Search_LgotForm.Free;
  end;
 end
 else begin
 Search_Form:= TSearch_Form.create(self);
 if Search_Form.ShowModal = mrOk then begin
// cxGrid1DBTableView1DBColumn2.SortOrder:=soAscending;
 pFIBDataSet1.Locate('NAME_LG', Search_Form.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
 end;
 end;
 end;


procedure TSpravLgotForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
if cxGrid1DBTableView1.OptionsSelection.MultiSelect=false then
if SelectButton.Enabled then ModalResult:=mrOk
else
EditAction.Execute;

if cxGrid1DBTableView1.OptionsSelection.MultiSelect=true then
ModalResult:=mrOk;
end;

end.
