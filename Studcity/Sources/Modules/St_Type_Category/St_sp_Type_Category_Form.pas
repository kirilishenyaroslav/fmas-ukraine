unit St_sp_Type_Category_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, FIBQuery, pFIBQuery,
  pFIBStoredProc, ActnList, FIBDataSet, pFIBDataSet, cxContainer, cxLabel,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ImgList, ComCtrls, ToolWin, cxGridCustomPopupMenu, cxGridPopupMenu, Menus,
  StdCtrls, FIBDatabase, pFIBDatabase,IBase, St_Proc, dxStatusBar, st_ConstUnit;

type
  TTypeCategoryForm = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1ID_TYPE_CATEGORY: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_TYPE_CATEGORY: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_SHORT: TcxGridDBColumn;
    cxGrid1DBTableView1MONTH_OPL: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    MonthOplCheck: TcxCheckBox;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    WriteProc: TpFIBStoredProc;
    ReadDataSet: TpFIBDataSet;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    RefreshButton: TToolButton;
    ExitButton: TToolButton;
    ImageListOfCategory: TImageList;
    SelectButton: TToolButton;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DeleteAction1: TMenuItem;
    RefreshAction1: TMenuItem;
    ShortNameLabel: TEdit;
    SearchButton_Naim: TToolButton;
    N3: TMenuItem;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    PopupImageList: TImageList;
    HotKey_StatusBar: TdxStatusBar;
    SelectAction: TAction;
    procedure SelectButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure DataSetAfterScroll(DataSet: TDataSet);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSetAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SearchButton_NaimClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
    KeyField : string;
    constructor Create (AOwner: TComponent; DB_Handle:TISC_DB_HANDLE;IsChild: boolean; AllowMultiSelect: boolean);reintroduce;
    procedure SelectAll;
  end;

function View_st_Type_Category(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; MultiSelect: boolean; ID : int64):variant;stdcall;
exports View_st_Type_Category;

var
  TypeCategoryForm: TTypeCategoryForm;
  res:Variant;
implementation
 uses St_sp_Category_Type_Add, 
  Search_LgotUnit_TC, Search_Unit_TC;
{$R *.dfm}

procedure TTypeCategoryForm.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
 Caption :=                    st_ConstUnit.st_CatTypeSprav[PLanguageIndex];
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
 SearchButton_Naim.Caption :=      st_ConstUnit.st_ZaName[PLanguageIndex];
 SearchButton_Naim.Hint :=         st_ConstUnit.st_ZaName[PLanguageIndex];

 HotKey_StatusBar.Panels[0].Text:=  st_ConstUnit.st_InsertBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[1].Text:=  st_ConstUnit.st_EditBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[2].Text:=  st_ConstUnit.st_DeleteBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[3].Text:=  st_ConstUnit.st_RefreshBtn_ShortCut[PLanguageIndex] + st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[4].Text:=  st_ConstUnit.st_Select_Caption[PLanguageIndex]      + st_ConstUnit.st_EnterBtn_ShortCut[PLanguageIndex];
 HotKey_StatusBar.Panels[5].Text:=  st_ConstUnit.st_ExitBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Hint :=           st_ConstUnit.st_HotKeys[PLanguageIndex];

 cxLabel1.Caption :=      st_ConstUnit.st_ShortLable[PLanguageIndex];
 MonthOplCheck.Properties.Caption := st_ConstUnit.st_ByMonth[PLanguageIndex];

 // пошел грид
 cxGrid1DBTableView1NAME_TYPE_CATEGORY.Caption :=    st_ConstUnit.st_NameLable[PLanguageIndex];

 N1.Caption :=             st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 N2.Caption :=             st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 DeleteAction1.Caption :=  st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 RefreshAction1.Caption := st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 N3.Caption :=             st_ConstUnit.st_KontextPoisk[PLanguageIndex];

 N1.Hint :=               st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 N2.Hint :=               st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 DeleteAction1.Hint :=    st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 RefreshAction1.Hint :=   st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 N3.Caption :=            st_ConstUnit.st_KontextPoisk[PLanguageIndex];
end;

constructor TTypeCategoryForm.Create(AOwner: TComponent; DB_Handle:TISC_DB_HANDLE; IsChild: boolean; AllowMultiSelect: boolean);
begin
 inherited Create(AOwner);
 Screen.Cursor:= crHourGlass;
 DB.Handle:=DB_Handle;
 if IsChild then begin
 Formstyle:=fsMDIChild;
 SelectButton.Enabled:=false;
 end
 else begin
 if AllowMultiSelect then
 begin
 Formstyle:=fsNormal;
 cxGrid1DBTableView1.Columns[0].Visible := true;
 SelectButton.Enabled:=true;
 cxGrid1DBTableView1.OptionsSelection.MultiSelect:=true;
 SearchButton_Naim.Enabled:=true;
 end
 else begin
 Formstyle:=fsNormal;
 SelectButton.Enabled:=true;
 SearchButton_Naim.Enabled:=true;
 cxGrid1DBTableView1.OptionsSelection.MultiSelect:=false;
 end;
 end;
 Screen.Cursor:= crDefault;
end;

function View_st_Type_Category(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; MultiSelect: boolean; ID : int64):variant;stdcall;
var ViewForm:TTypeCategoryForm;
begin
 if not IsMDIChildFormShow(TTypeCategoryForm) then
   if ShowModal=false then   begin
      ViewForm:=TTypeCategoryForm.Create(AOwner,DB, true, false);
      ViewForm.selectall;
      View_st_Type_Category:=res;
      end
   else begin
   if (not MultiSelect) then
     begin
      ViewForm:=TTypeCategoryForm.Create(AOwner,DB, false, false);
      ViewForm.selectall;
      if (ID <> -2) then ViewForm.DataSet.Locate('ID_TYPE_CATEGORY', ID, []);
      ViewForm.ShowModal;
      View_st_Type_Category:=res;
     end
     else
     begin
      ViewForm:=TTypeCategoryForm.Create(AOwner,DB, false, true);
      ViewForm.selectall;
      ViewForm.ShowModal;
      View_st_Type_Category:=res;
     end;
     end;
end;

function BoolConvert(const b : boolean) : shortint;
begin
 if b then Result := 1 else Result := 0;
end;

procedure TTypeCategoryForm.SelectAll;
begin
 DataSet.Close;
 DataSet.Open;
end;

procedure TTypeCategoryForm.SelectButtonClick(Sender: TObject);
var i : integer;
    RecMultiSelected : integer;
begin
    if cxGrid1DBTableView1.OptionsSelection.MultiSelect=true then
    begin
      RecMultiSelected:=cxGrid1DBTableView1.DataController.GetSelectedCount;
      res:=VarArrayCreate([0,RecMultiSelected-1],varVariant);
      for i:=0 to cxGrid1DBTableView1.DataController.GetSelectedCount-1 do
        begin
          res[i]:=cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[1];
        end;
     end;
     if cxGrid1DBTableView1.OptionsSelection.MultiSelect=false then
     begin
      res:=VarArrayCreate([0,2],varVariant);
      res[0]:=DataSet['ID_TYPE_CATEGORY'];
      res[1]:=DataSet['NAME_TYPE_CATEGORY'];
      res[2]:=DataSet['MONTH_OPL'];
     end;
ModalResult := mrOK;
end;

procedure TTypeCategoryForm.cxGrid1DBTableView1DblClick(Sender: TObject);
var i : integer;
    RecMultiSelected : integer;
begin
    if cxGrid1DBTableView1.OptionsSelection.MultiSelect=true then
    begin
      RecMultiSelected:=cxGrid1DBTableView1.DataController.GetSelectedCount;
      res:=VarArrayCreate([0,RecMultiSelected-1],varVariant);
      for i:=0 to cxGrid1DBTableView1.DataController.GetSelectedCount-1 do
        begin
          res[i]:=cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[1];
        end;
     end;
     if cxGrid1DBTableView1.OptionsSelection.MultiSelect=false then
     begin
      res:=VarArrayCreate([0,2],varVariant);
      res[0]:=DataSet['ID_TYPE_CATEGORY'];
      res[1]:=DataSet['NAME_TYPE_CATEGORY'];
      res[2]:=DataSet['MONTH_OPL'];
     end;
   if FormStyle = fsMDIChild then EditButtonClick(Sender);  
ModalResult := mrOK;
end;

procedure TTypeCategoryForm.DataSetAfterScroll(DataSet: TDataSet);
begin
if DataSet.RecordCount = 0 then exit;
if DataSet['NAME_SHORT']<> null then ShortNameLabel.Text := DataSet['NAME_SHORT'];
if DataSet['MONTH_OPL']<> null then MonthOplCheck.Checked := DataSet['MONTH_OPL'] = 1;
end;

procedure TTypeCategoryForm.ExitButtonClick(Sender: TObject);
begin
res:=null;
close;
end;

procedure TTypeCategoryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TTypeCategoryForm.DataSetAfterOpen(DataSet: TDataSet);
begin
if DataSet.RecordCount = 0 then begin
  EditButton.Enabled := false;
  DeleteButton.Enabled := false;
 // SelectButton.Enabled := false;
 end else begin
  EditButton.Enabled := true;
  DeleteButton.Enabled := true;
 // SelectButton.Enabled := true;
 end;
end;

procedure TTypeCategoryForm.FormCreate(Sender: TObject);
begin
 KeyField := 'ID_TYPE_CATEGORY';
end;

procedure TTypeCategoryForm.AddButtonClick(Sender: TObject);
var
 new_id    : integer;
begin
 TypeCategoryFormAdd := TTypeCategoryFormAdd.Create(Self);
 TypeCategoryFormAdd.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 TypeCategoryFormAdd.PLanguageIndex := PLanguageIndex;

 if TypeCategoryFormAdd.ShowModal = mrOK then begin
  WriteProc.StoredProcName := 'ST_INI_TYPE_CATEGORY_INSERT';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('NAME_TYPE_CATEGORY').AsString := TypeCategoryFormAdd.NameEdit.Text;
  WriteProc.ParamByName('NAME_SHORT').AsString := TypeCategoryFormAdd.ShortEdit.Text;
  WriteProc.ParamByName('MONTH_OPL').AsInteger := BoolConvert(TypeCategoryFormAdd.MonthOplCheck.Checked);
  WriteProc.ExecProc;
  new_id := WriteProc[KeyField].AsInteger;
  try
  WriteProc.Transaction.Commit;
  WriteProc.Close;
  except
  WriteProc.Transaction.Rollback;
  WriteProc.Close;
  raise;
  end;
  SelectAll;
  DataSet.Locate(KeyField, new_id, []);
 end;
 TypeCategoryFormAdd.Free;

end;

procedure TTypeCategoryForm.EditButtonClick(Sender: TObject);
var
 id        : integer;
begin
 id := DataSet[KeyField];
 TypeCategoryFormAdd := TTypeCategoryFormAdd.Create(Self);
 TypeCategoryFormAdd.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 TypeCategoryFormAdd.PLanguageIndex := PLanguageIndex;

if DataSet['NAME_SHORT']<> null then TypeCategoryFormAdd.ShortEdit.Text := DataSet['NAME_SHORT'];
if DataSet['NAME_TYPE_CATEGORY']<> null then TypeCategoryFormAdd.NameEdit.Text := DataSet['NAME_TYPE_CATEGORY'];
if DataSet['MONTH_OPL']<> null then TypeCategoryFormAdd.MonthOplCheck.Checked := DataSet['MONTH_OPL'] = 1;
 if TypeCategoryFormAdd.ShowModal = mrOK then begin
  WriteProc.StoredProcName := 'ST_INI_TYPE_CATEGORY_UPDATE';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName(KeyField).AsInteger := id;
  WriteProc.ParamByName('NAME_TYPE_CATEGORY').AsString := TypeCategoryFormAdd.NameEdit.Text;
  WriteProc.ParamByName('NAME_SHORT').AsString := TypeCategoryFormAdd.ShortEdit.Text;
  WriteProc.ParamByName('MONTH_OPL').AsInteger := BoolConvert(TypeCategoryFormAdd.MonthOplCheck.Checked);
  WriteProc.ExecProc;
  try
  WriteProc.Transaction.Commit;
  WriteProc.Close;
  except
  WriteProc.Transaction.Rollback;
  WriteProc.Close;
  raise;
  end;
  SelectAll;
  DataSet.Locate(KeyField, id, []);
 end;
 TypeCategoryFormAdd.Free;

end;

procedure TTypeCategoryForm.DeleteButtonClick(Sender: TObject);
var
 selected : integer;
begin
 screen.Cursor:=crHourGlass;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text := 'select CAN from ST_INI_TYPE_CAT_CAN_DEL(' + IntToStr(DataSet[KeyField]) + ')';
 ReadDataSet.Open;
 if ReadDataSet['CAN'] = 0 then begin
  screen.Cursor:=crDefault;
  ShowMessage(PChar(st_ConstUnit.st_mess_NoItemDelete[PLanguageIndex]));
  ReadDataSet.Close;
  exit;
 end;
 ReadDataSet.Close;
 screen.Cursor:=crDefault;

 if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
 WriteProc.StoredProcName := 'ST_INI_TYPE_CATEGORY_DELETE';
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
 selected := cxGrid1DBTableView1.DataController.FocusedRowIndex-1;
 SelectAll;
 cxGrid1DBTableView1.DataController.FocusedRowIndex := selected;
end;

procedure TTypeCategoryForm.RefreshButtonClick(Sender: TObject);
var
 selected : integer;
begin
Screen.Cursor:=crHourGlass;
 selected := -1;
 if DataSet.RecordCount <> 0 then selected := DataSet[KeyField];
 SelectAll;
 DataSet.Locate(KeyField, selected, []);
 Screen.Cursor:=crDefault;
 end;

procedure TTypeCategoryForm.FormShow(Sender: TObject);
begin
 FormIniLanguage();
 if not DataSet.Active then SelectAll;
end;

procedure TTypeCategoryForm.SearchButton_NaimClick(Sender: TObject);
begin
if PopupMenu1.Items[4].Checked= true then
begin
Search_LgotForm := TSearch_LgotForm.Create(Self);
Search_LgotForm.PLanguageIndex := PLanguageIndex;
 while Search_LgotForm.FindFlag = false do begin
 if Search_LgotForm.FindClosed = true then begin
 Search_LgotForm.Free;
 exit;
 end;
 if Search_LgotForm.ShowModal = mrOk then begin
 if Search_LgotForm.FindFlag = true then begin
  cxGrid1DBTableView1NAME_TYPE_CATEGORY.SortOrder:=soAscending;
  DataSet.Locate('NAME_TYPE_CATEGORY', Search_LgotForm.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
  Search_LgotForm.Free;
  exit;
  end
  else begin
     cxGrid1DBTableView1NAME_TYPE_CATEGORY.SortOrder:=soAscending;
   DataSet.Locate('NAME_TYPE_CATEGORY', Search_LgotForm.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
   Search_LgotForm.showModal;
   end;
 end;
 end;
 if Search_LgotForm.FindFlag = true then begin
    cxGrid1DBTableView1NAME_TYPE_CATEGORY.SortOrder:=soAscending;
  DataSet.Locate('NAME_TYPE_CATEGORY', Search_LgotForm.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
  Search_LgotForm.Free;
  end;
 end
 else begin
 Search_Form:= TSearch_Form.create(self);
 Search_Form.PLanguageIndex := PLanguageIndex;
 if Search_Form.ShowModal = mrOk then begin
   cxGrid1DBTableView1NAME_TYPE_CATEGORY.SortOrder:=soAscending;
 DataSet.Locate('NAME_TYPE_CATEGORY', Search_Form.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
end;
 end;
 end;

end.
