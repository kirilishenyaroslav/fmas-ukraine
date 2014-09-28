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
  StdCtrls ;

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
    { Private declarations }
  public
    KeyField : string;
//    AllowMultiSelect : boolean;
    MultiResult:Variant;
    constructor Create(Aowner:TComponent;FormST:TFormStyle);overload;
    function GetMultiValue():variant;
    procedure SelectAll;
  end;

var
  TypeCategoryForm: TTypeCategoryForm;

implementation
 uses DataModule1_Unit, St_sp_Category_Type_Add, Unit_of_Utilits, main,
  Search_LgotUnit, Search_Unit;
{$R *.dfm}

constructor TTypeCategoryForm.Create(Aowner:TComponent;FormST:TFormStyle);
begin
  Inherited Create(Aowner);
  FormStyle:=FormST;
  SelectButton.Enabled:=true;
  cxGrid1DBTableView1.OptionsSelection.MultiSelect:=true;
end;

function  TTypeCategoryForm.GetMultiValue():variant;
begin
  ShowModal;
  GetMultiValue:=MultiResult;
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
      MultiResult:=VarArrayCreate([0,RecMultiSelected-1],varVariant);
      for i:=0 to cxGrid1DBTableView1.DataController.GetSelectedCount-1 do
        begin
          MultiResult[i]:=cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[1];
        end;
     end;
ModalResult:=mrOk;
end;

procedure TTypeCategoryForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TTypeCategoryForm.DataSetAfterScroll(DataSet: TDataSet);
begin
if DataSet.RecordCount = 0 then exit;
if DataSet['NAME_SHORT']<> null then ShortNameLabel.Text := DataSet['NAME_SHORT'];
if DataSet['MONTH_OPL']<> null then MonthOplCheck.Checked := DataSet['MONTH_OPL'] = 1;
end;

procedure TTypeCategoryForm.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TTypeCategoryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
if MainForm.N5.Enabled = false then  MainForm.N5.Enabled := true;
MainForm.CloseAllWindows;
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
 ActionStr : string;
 new_id    : integer;
begin
 ActionStr := 'Добавить';
 TypeCategoryFormAdd := TTypeCategoryFormAdd.Create(Self);
 TypeCategoryFormAdd.Caption := ActionStr + ' ' + TypeCategoryFormAdd.Caption;
 TypeCategoryFormAdd.OKButton.Caption := ActionStr;
 if TypeCategoryFormAdd.ShowModal = mrOK then begin
  WriteProc.StoredProcName := 'ST_INI_TYPE_CATEGORY_INSERT';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('NAME_TYPE_CATEGORY').AsString := TypeCategoryFormAdd.NameEdit.Text;
  WriteProc.ParamByName('NAME_SHORT').AsString := TypeCategoryFormAdd.ShortEdit.Text;
  WriteProc.ParamByName('MONTH_OPL').AsInteger := BoolConvert(TypeCategoryFormAdd.MonthOplCheck.Checked);
  WriteProc.ExecProc;
  new_id := WriteProc[KeyField].AsInteger;
  WriteProc.Transaction.Commit;
  WriteProc.Close;
  SelectAll;
  DataSet.Locate(KeyField, new_id, []);
 end;
 TypeCategoryFormAdd.Free;

end;

procedure TTypeCategoryForm.EditButtonClick(Sender: TObject);
var
 ActionStr, ActionKeyStr : string;
 id        : integer;
begin
 id := DataSet[KeyField];
 ActionStr := 'Изменить';
 ActionKeyStr:='Принять';
 TypeCategoryFormAdd := TTypeCategoryFormAdd.Create(Self);
 TypeCategoryFormAdd.Caption := ActionStr + ' ' + TypeCategoryFormAdd.Caption;
 TypeCategoryFormAdd.OKButton.Caption := ActionKeyStr;
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
  WriteProc.Transaction.Commit;
  WriteProc.Close;
  SelectAll;
  DataSet.Locate(KeyField, id, []);
 end;
 TypeCategoryFormAdd.Free;

end;

procedure TTypeCategoryForm.DeleteButtonClick(Sender: TObject);
var
 selected : integer;
begin
//if MessageBox(Handle,PChar('Вы действительно хотите удалить тип категории "' + DataSet.FieldByName('NAME_TYPE_CATEGORY').AsString + '"?'),'Подтвердите ...',MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
 if MessageBox(Handle,PChar('Вы действительно хотите удалить запись ?'),'Подтверждение удаления ...',MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
 WriteProc.StoredProcName := 'ST_INI_TYPE_CATEGORY_DELETE';
 WriteProc.Transaction.StartTransaction;
 WriteProc.Prepare;
 WriteProc.ParamByName(KeyField).AsInteger := DataSet[KeyField];
 WriteProc.ExecProc;
 WriteProc.Transaction.Commit;
 WriteProc.Close;
 selected := cxGrid1DBTableView1.DataController.FocusedRowIndex-1;
 SelectAll;
 cxGrid1DBTableView1.DataController.FocusedRowIndex := selected;
end;

procedure TTypeCategoryForm.RefreshButtonClick(Sender: TObject);
var
 selected : integer;
begin
 selected := -1;
 if DataSet.RecordCount <> 0 then selected := DataSet[KeyField];
 SelectAll;
 DataSet.Locate(KeyField, selected, []);
end;

procedure TTypeCategoryForm.FormShow(Sender: TObject);
begin
 //cxGrid1DBTableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
// if AllowMultiSelect then cxGrid1DBTableView1.Columns[0].Visible := true;
 if not DataSet.Active then SelectAll;
end;

procedure TTypeCategoryForm.SearchButton_NaimClick(Sender: TObject);
begin
if PopupMenu1.Items[4].Checked= true then
begin
Search_LgotForm := TSearch_LgotForm.Create(Self);
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
 if Search_Form.ShowModal = mrOk then begin
   cxGrid1DBTableView1NAME_TYPE_CATEGORY.SortOrder:=soAscending;
 DataSet.Locate('NAME_TYPE_CATEGORY', Search_Form.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
end;
 end;
 end;

end.
