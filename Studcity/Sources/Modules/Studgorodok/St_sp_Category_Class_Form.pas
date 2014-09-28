unit St_sp_Category_Class_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox,
  FIBQuery, pFIBQuery, pFIBStoredProc, ActnList, FIBDataSet, pFIBDataSet,
  cxContainer, cxLabel, ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Menus;

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
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    WriteProc: TpFIBStoredProc;
    ReadDataSet: TpFIBDataSet;
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
  ClassCategoryForm: TClassCategoryForm;

implementation
 uses DataModule1_Unit, St_sp_Category_Class_Form_Add, MAIN, Search_LgotUnit,
 Search_Unit;
{$R *.dfm}


constructor TClassCategoryForm.Create(Aowner:TComponent;FormST:TFormStyle);
begin
  Inherited Create(Aowner);
  FormStyle:=FormST;
  SelectButton.Enabled:=true;
  cxGrid1DBTableView1.OptionsSelection.MultiSelect:=true;
end;

function  TClassCategoryForm.GetMultiValue():variant;
begin
  ShowModal;
  GetMultiValue:=MultiResult;
end;

procedure TClassCategoryForm.SelectAll;
begin
 DataSet.Close;
 DataSet.Open;
end;


procedure TClassCategoryForm.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TClassCategoryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
if MainForm.N6.Enabled = false then  MainForm.N6.Enabled := true;
MainForm.CloseAllWindows;
end;

procedure TClassCategoryForm.DataSetAfterScroll(DataSet: TDataSet);
begin
if DataSet.RecordCount = 0 then exit;
 PeopleLabel.Caption := IntToStr(DataSet['PEOPLE']);
 PlaceLabel.Caption := FloatToStr(DataSet['PLACES']);
end;

procedure TClassCategoryForm.FormCreate(Sender: TObject);
begin
 KeyField := 'ID_CATEGORY_CLASS';
end;

procedure TClassCategoryForm.FormShow(Sender: TObject);
begin
// cxGrid1DBTableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
 //if AllowMultiSelect then cxGrid1DBTableView1.Columns[0].Visible := true;
 if not DataSet.Active then SelectAll;
end;

procedure TClassCategoryForm.DataSetAfterOpen(DataSet: TDataSet);
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

procedure TClassCategoryForm.SelectButtonClick(Sender: TObject);
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
ModalResult := mrOK;
end;

procedure TClassCategoryForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TClassCategoryForm.AddButtonClick(Sender: TObject);
var
 ActionStr : string;
 new_id    : integer;
begin
 ActionStr := 'Добавить';
 ClassCategoryFormAdd := TClassCategoryFormAdd.Create(Self);
 ClassCategoryFormAdd.Caption := ActionStr + ' ' + ClassCategoryFormAdd.Caption;
 ClassCategoryFormAdd.OKButton.Caption := ActionStr;
 if ClassCategoryFormAdd.ShowModal = mrOK then begin
  WriteProc.StoredProcName := 'ST_INI_CATEGORY_CLASS_INSERT';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('NAME_CATEGORY_CLASS').AsString := ClassCategoryFormAdd.NameEdit.Text;
  WriteProc.ParamByName('PEOPLE').AsInteger := StrToInt(ClassCategoryFormAdd.PeopleEdit.Text);
  WriteProc.ParamByName('PLACES').AsFloat := StrToFloat(ClassCategoryFormAdd.PlaceEdit.Text);
  WriteProc.ExecProc;
  new_id := WriteProc[KeyField].AsInteger;
  WriteProc.Transaction.Commit;
  WriteProc.Close;
  SelectAll;
  DataSet.Locate(KeyField, new_id, []);
 end;
 ClassCategoryFormAdd.Free;


end;

procedure TClassCategoryForm.EditButtonClick(Sender: TObject);
var
 ActionStr, ActionKeyStr : string;
 id        : integer;

begin
 id := DataSet[KeyField];
 ActionStr := 'Изменить';
 ActionKeyStr:='Принять';
 ClassCategoryFormAdd := TClassCategoryFormAdd.Create(Self);
 ClassCategoryFormAdd.Caption := ActionStr + ' ' + ClassCategoryFormAdd.Caption;
 ClassCategoryFormAdd.OKButton.Caption := ActionKeyStr;
 ClassCategoryFormAdd.NameEdit.Text   := DataSet['NAME_CATEGORY_CLASS'];
 ClassCategoryFormAdd.PeopleEdit.Text := IntToStr(DataSet['PEOPLE']);
 ClassCategoryFormAdd.PlaceEdit.Text  := FloatToStr(DataSet['PLACES']);
 if ClassCategoryFormAdd.ShowModal = mrOK then begin
  WriteProc.StoredProcName := 'ST_INI_CATEGORY_CLASS_UPDATE';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName(KeyField).AsInteger := id;
  WriteProc.ParamByName('NAME_CATEGORY_CLASS').AsString := ClassCategoryFormAdd.NameEdit.Text;
  WriteProc.ParamByName('PEOPLE').AsInteger := StrToInt(ClassCategoryFormAdd.PeopleEdit.Text);
  WriteProc.ParamByName('PLACES').AsFloat := StrToFloat(ClassCategoryFormAdd.PlaceEdit.Text);
  WriteProc.ExecProc;
  WriteProc.Transaction.Commit;
  WriteProc.Close;
  SelectAll;
  DataSet.Locate(KeyField, id, []);
 end;
 ClassCategoryFormAdd.Free;

end;

procedure TClassCategoryForm.DeleteButtonClick(Sender: TObject);
var
 selected : integer;
begin
//if MessageBox(Handle,PChar('Вы действительно хотите удалить класс категории "' + DataSet.FieldByName('NAME_CATEGORY_CLASS').AsString + ' "?'),'Подтвердите ...',MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
if MessageBox(Handle,PChar('Вы действительно хотите удалить запись ?'),'Подтверждение удаления ...',MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text:='select CAN from ST_INI_CATEGORY_CLASS_CAN_DELET('+ inttostr(DataSet[KeyField])+')';
 ReadDataSet.Open;
 if ReadDataSet['Can']=0 then begin
 ShowMessage('Невозможно удалить . Данное наименование используется.');
 ReadDataSet.Close;
 exit;
 end;
 ReadDataSet.Close;
 WriteProc.StoredProcName := 'ST_INI_CATEGORY_CLASS_DELETE';
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

procedure TClassCategoryForm.RefreshButtonClick(Sender: TObject);
var
 selected : integer;
begin
 selected := -1;
 if DataSet.RecordCount <> 0 then selected := DataSet[KeyField];
 SelectAll;
 DataSet.Locate(KeyField, selected, []);
end;

procedure TClassCategoryForm.SearchButton_NaimClick(Sender: TObject);
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
 if Search_Form.ShowModal = mrOk then begin
 DataSet.Locate('NAME_CATEGORY_CLASS', Search_Form.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
 end;
 end;
 end;

end.
