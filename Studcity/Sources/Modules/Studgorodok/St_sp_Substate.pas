//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник состояния субсидий                                       *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit St_sp_Substate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxBar, dxBarExtItems, ImgList,
  FIBQuery, pFIBQuery, pFIBStoredProc, ActnList, FIBDataSet, pFIBDataSet,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, Menus, dxStatusBar, St_Proc,
  st_ConstUnit, DataModule1_Unit;

type
  TSubstate_Form = class(TForm)
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    WriteProc: TpFIBStoredProc;
    DisabledLargeImages: TImageList;
    LargeImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    ReadDataSet: TpFIBDataSet;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DeleteAction1: TMenuItem;
    RefreshAction1: TMenuItem;
    HotKey_StatusBar: TdxStatusBar;
    PopupImageList: TImageList;
    ExitAction1: TMenuItem;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSetAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);

  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
   KeyField    : string;
   procedure SelectAll;
  end;

var
  Substate_Form: TSubstate_Form;

implementation

uses MAIN, St_sp_Substate_Add;

{$R *.dfm}

procedure TSubstate_Form.FormIniLanguage();
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


 HotKey_StatusBar.Panels[0].Text:=  st_ConstUnit.st_InsertBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[1].Text:=  st_ConstUnit.st_EditBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[2].Text:=  st_ConstUnit.st_DeleteBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[3].Text:=  st_ConstUnit.st_RefreshBtn_ShortCut[PLanguageIndex] + st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[4].Text:=  st_ConstUnit.st_ExitBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Hint :=           st_ConstUnit.st_HotKeys[PLanguageIndex];

 // пошел грид
 cxGridDBTableView1DBColumn2.Caption :=    st_ConstUnit.st_NameLable[PLanguageIndex];

 N1.Caption :=            st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 N2.Caption :=            st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 DeleteAction1.Caption :=            st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 RefreshAction1.Caption :=            st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 ExitAction1.Caption :=                   st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];

 N1.Hint :=            st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 N2.Hint :=            st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 DeleteAction1.Hint :=            st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 RefreshAction1.Hint :=            st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 ExitAction1.Hint :=                   st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
end;

procedure TSubstate_Form.SelectAll;
begin
DataSet.Close;
DataSet.Open;
end;

procedure TSubstate_Form.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TSubstate_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
MainForm.N11.enabled:=true;
MainForm.CloseAllWindows;
end;

procedure TSubstate_Form.AddButtonClick(Sender: TObject);
var
 new_id    : integer;
begin
 Substate_Add_Form := TSubstate_Add_Form.Create(Self);
 Substate_Add_Form.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 Substate_Add_Form.OKButton.Caption :=         st_ConstUnit.st_Accept[PLanguageIndex];
 Substate_Add_Form.CancelButton.Caption :=     st_ConstUnit.st_Cancel[PLanguageIndex];
 Substate_Add_Form.Label1.Caption :=           st_ConstUnit.st_NameLable[PLanguageIndex];
 
 if Substate_Add_Form.ShowModal = mrOK then begin
 //Добавляем состояние
  WriteProc.StoredProcName := 'ST_SP_SUB_STATE_INSERT';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('NAME').AsString := Substate_Add_Form.Name_Edit.Text;
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
 Substate_Add_Form.Free;
end;

procedure TSubstate_Form.FormCreate(Sender: TObject);
begin
 KeyField := 'ID_STATE';
  cxGridDBTableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
  cxGridDBTableView1.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
Forminilanguage();
end;

procedure TSubstate_Form.DataSetAfterOpen(DataSet: TDataSet);
begin
if DataSet.RecordCount = 0 then begin
  EditButton.Enabled := false;
  DeleteButton.Enabled := false;
 end else begin
  EditButton.Enabled := true;
  DeleteButton.Enabled := true;
 end;
end;

procedure TSubstate_Form.FormShow(Sender: TObject);
begin
SelectAll;
end;

procedure TSubstate_Form.RefreshButtonClick(Sender: TObject);
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

procedure TSubstate_Form.DeleteButtonClick(Sender: TObject);
var
 selected : integer;
begin
 Screen.Cursor:=crHourGlass;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text:='select CAN from ST_SP_SUB_STATE_CAN_DELETE('+ inttostr(DataSet[KeyField])+')';
 ReadDataSet.Open;
 if ReadDataSet['Can']=0 then begin
 Screen.Cursor:=crDefault;
 ShowMessage(PChar(st_ConstUnit.st_mess_NoSubStateDelete[PLanguageIndex]));
 ReadDataSet.Close;
 exit;
 end;
 ReadDataSet.Close;
 Screen.Cursor:=crDefault;

  if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
 // удаляем
 WriteProc.StoredProcName := 'ST_SP_SUB_STATE_DELETE';
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
 selected := cxGridDBTableView1.DataController.FocusedRowIndex-1;
 SelectAll;
 cxGridDBTableView1.DataController.FocusedRowIndex := selected;
end;

procedure TSubstate_Form.EditButtonClick(Sender: TObject);
var
 id : integer;
begin
 id := DataSet[KeyField];
 Substate_Add_Form := TSubstate_Add_Form.Create(Self);
 Substate_Add_Form.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 Substate_Add_Form.OKButton.Caption :=         st_ConstUnit.st_Accept[PLanguageIndex];
 Substate_Add_Form.CancelButton.Caption :=     st_ConstUnit.st_Cancel[PLanguageIndex];
 Substate_Add_Form.Label1.Caption :=           st_ConstUnit.st_NameLable[PLanguageIndex];

 Substate_Add_Form.Name_Edit.Text   := DataSet['NAME'];
 if Substate_Add_Form.ShowModal = mrOK then begin
 // изменяем
  WriteProc.StoredProcName := 'ST_SP_SUB_STATE_UPDATE';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName(KeyField).AsInteger := id;
  WriteProc.ParamByName('NAME').AsString := Substate_Add_Form.Name_Edit.Text;
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
 Substate_Add_Form.Free;

end;

procedure TSubstate_Form.cxGridDBTableView1DblClick(Sender: TObject);
begin
if cxGridDBTableView1.OptionsSelection.MultiSelect=false then
EditAction.Execute;

if cxGridDBTableView1.OptionsSelection.MultiSelect=true then
ModalResult:=mrOk;
end;

end.
