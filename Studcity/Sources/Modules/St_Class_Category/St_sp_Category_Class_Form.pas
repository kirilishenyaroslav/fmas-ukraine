unit St_sp_Category_Class_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox,
  FIBQuery, pFIBQuery, pFIBStoredProc, ActnList, FIBDataSet, pFIBDataSet,
  cxContainer, cxLabel, ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Menus, FIBDatabase, pFIBDatabase, IBase, St_Proc,
  dxStatusBar, st_ConstUnit;

type
  TClassCategoryForm = class(TForm)
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    RefreshButton: TToolButton;
    SelectButton: TToolButton;
    ExitButton: TToolButton;
    ImageListOfCategory: TImageList;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1ID_CATEGORY_CLASS: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_CATEGORY_CLASS: TcxGridDBColumn;
    cxGrid1DBTableView1PEOPLE: TcxGridDBColumn;
    cxGrid1DBTableView1PLACES: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    PeopleLabel: TcxLabel;
    cxLabel2: TcxLabel;
    PlaceLabel: TcxLabel;
    DataSource: TDataSource;
    WriteProc: TpFIBStoredProc;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DeleteAction1: TMenuItem;
    RefreshAction1: TMenuItem;
    SearchButton_Naim: TToolButton;
    N3: TMenuItem;
    DB: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    ReadDataSet: TpFIBDataSet;
    PopupImageList: TImageList;
    HotKey_StatusBar: TdxStatusBar;
    SelectAction: TAction;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSetAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSetAfterOpen(DataSet: TDataSet);
    procedure SelectButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure SearchButton_NaimClick(Sender: TObject);
  private
   PLanguageIndex : byte;
   procedure FormIniLanguage();
  public
  KeyField : string;
  constructor Create (AOwner: TComponent; DB_Handle:TISC_DB_HANDLE;IsChild: boolean; AllowMultiSelect: boolean);reintroduce;
  procedure SelectAll;
  end;

function View_st_Class_Category(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; MultiSelect: boolean; ID : int64):variant;stdcall;
exports View_st_Class_Category;

var
  ClassCategoryForm: TClassCategoryForm;
  res:Variant;

implementation
 uses St_sp_Category_Class_Form_Add,
  Search_LgotUnit, Search_Unit;
{$R *.dfm}

procedure TClassCategoryForm.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
 Caption :=                    st_ConstUnit.st_CatClassSprav[PLanguageIndex];
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

 // кол-во людей
 cxLabel1.Caption :=      st_ConstUnit.st_KolvoLudey[PLanguageIndex];
 // кол-во мест
 cxLabel2.Caption :=      st_ConstUnit.st_KolvoMest[PLanguageIndex];


 // пошел грид
 cxGrid1DBTableView1NAME_CATEGORY_CLASS.Caption :=    st_ConstUnit.st_NameLable[PLanguageIndex];

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

constructor TClassCategoryForm.Create(AOwner: TComponent; DB_Handle:TISC_DB_HANDLE; IsChild: boolean; AllowMultiSelect: boolean);
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

function View_st_Class_Category(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; MultiSelect: boolean; ID : int64):variant;stdcall;
var ViewForm:TClassCategoryForm;
begin
 if not IsMDIChildFormShow(TClassCategoryForm) then
   if ShowModal=false then   begin
      ViewForm:=TClassCategoryForm.Create(AOwner,DB, true, false);
      ViewForm.selectall;
      View_st_Class_Category:=res;
      end
   else begin
   if (not MultiSelect) then
     begin
      ViewForm:=TClassCategoryForm.Create(AOwner,DB, false, false);
      ViewForm.selectall;
      if (ID <> -2) then ViewForm.DataSet.Locate('ID_CATEGORY_CLASS', ID, []);
      ViewForm.ShowModal;
      View_st_Class_Category:=res;
     end
     else
     begin
      ViewForm:=TClassCategoryForm.Create(AOwner,DB, false, true);
      ViewForm.selectall;
      ViewForm.ShowModal;
      View_st_Class_Category:=res;
     end;
     end;
end;

procedure TClassCategoryForm.SelectAll;
begin
 DataSet.Close;
 DataSet.Open;
end;


procedure TClassCategoryForm.ExitButtonClick(Sender: TObject);
begin
res:=null;
close;
end;

procedure TClassCategoryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TClassCategoryForm.DataSetAfterScroll(DataSet: TDataSet);
begin
if DataSet.RecordCount = 0 then exit;
 PeopleLabel.Caption := IntToStr(DataSet['PEOPLES']);
 PlaceLabel.Caption := FloatToStr(DataSet['PLACES']);
end;

procedure TClassCategoryForm.FormCreate(Sender: TObject);
begin
 KeyField := 'ID_CATEGORY_CLASS';
 PLanguageIndex:=           St_Proc.cnLanguageIndex;

end;

procedure TClassCategoryForm.FormShow(Sender: TObject);
begin
// cxGrid1DBTableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
  FormIniLanguage();
  if not DataSet.Active then SelectAll;
end;

procedure TClassCategoryForm.DataSetAfterOpen(DataSet: TDataSet);
begin
 if DataSet.RecordCount = 0 then begin
  EditButton.Enabled := false;
  DeleteButton.Enabled := false;
  SelectButton.Enabled := false;
 end else begin
  EditButton.Enabled := true;
  DeleteButton.Enabled := true;
 // SelectButton.Enabled := true;
 end;
end;

procedure TClassCategoryForm.SelectButtonClick(Sender: TObject);
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
      res:=VarArrayCreate([0,1],varVariant);
      res[0]:=DataSet['ID_CATEGORY_CLASS'];
      res[1]:=DataSet['NAME_CATEGORY_CLASS'];
     end;
ModalResult := mrOK;
end;

procedure TClassCategoryForm.cxGrid1DBTableView1DblClick(Sender: TObject);
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
      res:=VarArrayCreate([0,1],varVariant);
      res[0]:=DataSet['ID_CATEGORY_CLASS'];
      res[1]:=DataSet['NAME_CATEGORY_CLASS'];
     end;

    if FormStyle = fsMDIChild then EditButtonClick(Sender);
        
ModalResult := mrOK;
end;

procedure TClassCategoryForm.AddButtonClick(Sender: TObject);
var
 new_id    : integer;
begin
 ClassCategoryFormAdd := TClassCategoryFormAdd.Create(Self);
 ClassCategoryFormAdd.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 ClassCategoryFormAdd.PLanguageIndex := PLanguageIndex;

 if ClassCategoryFormAdd.ShowModal = mrOK then begin
  WriteProc.StoredProcName := 'ST_INI_CATEGORY_CLASS_INSERT';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('NAME_CATEGORY_CLASS').AsString := ClassCategoryFormAdd.NameEdit.Text;
  WriteProc.ParamByName('PEOPLES').AsInteger := StrToInt(ClassCategoryFormAdd.PeopleEdit.Text);
  WriteProc.ParamByName('PLACES').AsFloat := StrToFloat(ClassCategoryFormAdd.PlaceEdit.Text);
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
 ClassCategoryFormAdd.Free;


end;

procedure TClassCategoryForm.EditButtonClick(Sender: TObject);
var
 id        : integer;

begin
 id := DataSet[KeyField];
 ClassCategoryFormAdd := TClassCategoryFormAdd.Create(Self);
 ClassCategoryFormAdd.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 ClassCategoryFormAdd.PLanguageIndex := PLanguageIndex;
 
 ClassCategoryFormAdd.NameEdit.Text   := DataSet['NAME_CATEGORY_CLASS'];
 ClassCategoryFormAdd.PeopleEdit.Text := IntToStr(DataSet['PEOPLES']);
 ClassCategoryFormAdd.PlaceEdit.Text  := FloatToStr(DataSet['PLACES']);
 if ClassCategoryFormAdd.ShowModal = mrOK then begin
  WriteProc.StoredProcName := 'ST_INI_CATEGORY_CLASS_UPDATE';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName(KeyField).AsInteger := id;
  WriteProc.ParamByName('NAME_CATEGORY_CLASS').AsString := ClassCategoryFormAdd.NameEdit.Text;
  WriteProc.ParamByName('PEOPLES').AsInteger := StrToInt(ClassCategoryFormAdd.PeopleEdit.Text);
  WriteProc.ParamByName('PLACES').AsFloat := StrToFloat(ClassCategoryFormAdd.PlaceEdit.Text);
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
 ClassCategoryFormAdd.Free;

end;

procedure TClassCategoryForm.DeleteButtonClick(Sender: TObject);
var
 selected : integer;
begin
 Screen.Cursor:=crHourGlass;
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text:='select CAN from ST_INI_CATEGORY_CLASS_CAN_DELET('+ inttostr(DataSet[KeyField])+')';
 ReadDataSet.Open;
 if ReadDataSet['Can']=0 then begin
 Screen.Cursor:=crDefault;
 ShowMessage(PChar(st_ConstUnit.st_mess_NoItemDelete[PLanguageIndex]));
 ReadDataSet.Close;
 exit;
 end;
 ReadDataSet.Close;
 Screen.Cursor:=crDefault;

 if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
 WriteProc.StoredProcName := 'ST_INI_CATEGORY_CLASS_DELETE';
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

procedure TClassCategoryForm.RefreshButtonClick(Sender: TObject);
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

procedure TClassCategoryForm.SearchButton_NaimClick(Sender: TObject);
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
 cxGrid1DBTableView1NAME_CATEGORY_CLASS.SortOrder:=soAscending;
 DataSet.Locate('NAME_CATEGORY_CLASS', Search_LgotForm.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
 Search_LgotForm.Free;
  exit;
  end
  else begin
    cxGrid1DBTableView1NAME_CATEGORY_CLASS.SortOrder:=soAscending;
   DataSet.Locate('NAME_CATEGORY_CLASS', Search_LgotForm.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
   Search_LgotForm.showModal;
   end;
 end;
 end;
 if Search_LgotForm.FindFlag = true then begin
   cxGrid1DBTableView1NAME_CATEGORY_CLASS.SortOrder:=soAscending;
  DataSet.Locate('NAME_CATEGORY_CLASS', Search_LgotForm.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
  Search_LgotForm.Free;
  end;
 end
 else begin
 Search_Form:= TSearch_Form.create(self);
 Search_Form.PLanguageIndex := PLanguageIndex;
 if Search_Form.ShowModal = mrOk then begin
 DataSet.Locate('NAME_CATEGORY_CLASS', Search_Form.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
 end;
 end;
 end;

end.
