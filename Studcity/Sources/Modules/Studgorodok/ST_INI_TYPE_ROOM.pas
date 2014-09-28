//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник типов комнат                                             *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit ST_INI_TYPE_ROOM;

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
  TIni_Type_Room_Form = class(TForm)
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
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DeleteAction1: TMenuItem;
    RefreshAction1: TMenuItem;
    HotKey_StatusBar: TdxStatusBar;
    PopupImageList: TImageList;
    EditAction1: TMenuItem;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DataSetAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
    KeyField: string;
    procedure SelectAll;
  end;

var
  Ini_Type_Room_Form: TIni_Type_Room_Form;

implementation

uses MAIN, ST_INI_TYPE_ROOM_ADD;

{$R *.dfm}

procedure TIni_Type_Room_Form.FormIniLanguage();
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

 N1.Caption :=              st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 N2.Caption :=              st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 DeleteAction1.Caption :=   st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 RefreshAction1.Caption :=  st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 EditAction1.Caption :=     st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];

 N1.Hint :=                 st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 N2.Hint :=                 st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 DeleteAction1.Hint :=      st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 RefreshAction1.Hint :=     st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 EditAction1.Hint :=        st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
end;

procedure  TIni_Type_Room_Form.SelectAll;
begin
 DataSet.Close;
 DataSet.Open;
end;

procedure TIni_Type_Room_Form.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TIni_Type_Room_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
MainForm.N12.Enabled:=True;
MainForm.CloseAllWindows;
end;

procedure TIni_Type_Room_Form.FormCreate(Sender: TObject);
begin
KeyField := 'ID_TYPE_ROOM';
cxGridDBTableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
FormIniLanguage();
end;

procedure TIni_Type_Room_Form.DataSetAfterOpen(DataSet: TDataSet);
begin
if DataSet.RecordCount = 0 then begin
  EditButton.Enabled := false;
  DeleteButton.Enabled := false;
 end else begin
  EditButton.Enabled := true;
  DeleteButton.Enabled := true;
 end;
end;

procedure TIni_Type_Room_Form.FormShow(Sender: TObject);
begin
  SelectAll;
end;

procedure TIni_Type_Room_Form.RefreshButtonClick(Sender: TObject);
var
  selected : integer;
begin
  selected := -1;
  if DataSet.RecordCount <> 0 then selected := DataSet[KeyField];
  SelectAll;
  DataSet.Locate(KeyField, selected, []);
end;

procedure TIni_Type_Room_Form.DeleteButtonClick(Sender: TObject);
var
 selected : integer;
begin
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text:='select CAN from ST_INI_TYPE_ROOM_CAN_DELETE('+ inttostr(DataSet[KeyField])+')';
 ReadDataSet.Open;
 if ReadDataSet['Can']=0 then begin
 ShowMessage(PChar(st_ConstUnit.st_CannotDelete_Name[PLanguageIndex]));
 ReadDataSet.Close;
 exit;
 end;
 ReadDataSet.Close;
 
if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
 // удаляем
 WriteProc.StoredProcName := 'ST_INI_TYPE_ROOM_DELETE';
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

procedure TIni_Type_Room_Form.AddButtonClick(Sender: TObject);
var
 new_id    : integer;
begin
  ST_INI_TYPE_ROOM_ADD_Form := TST_INI_TYPE_ROOM_ADD_Form.Create(Self);
  ST_INI_TYPE_ROOM_ADD_Form.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];

  if ST_INI_TYPE_ROOM_ADD_Form.ShowModal = mrOK then
   begin
    WriteProc.StoredProcName := 'ST_INI_TYPE_ROOM_INSERT';
    // добавляем
    WriteProc.Transaction.StartTransaction;
    WriteProc.Prepare;
    WriteProc.ParamByName('NAME_TYPE_ROOM').AsString    := ST_INI_TYPE_ROOM_ADD_Form.NameEdit.Text;
    WriteProc.ParamByName('SHORT_NAME').AsString        := ST_INI_TYPE_ROOM_ADD_Form.Short_NameEdit.Text;
    WriteProc.ParamByName('MAX_PEOPLE_COUNT').AsInteger := strtoint(ST_INI_TYPE_ROOM_ADD_Form.PeopleEdit.Text);
    WriteProc.ParamByName('SIZES').Asfloat              := StrToFloat(ST_INI_TYPE_ROOM_ADD_Form.PlaceEdit.Text);
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
  ST_INI_TYPE_ROOM_ADD_Form.Free;
end;

procedure TIni_Type_Room_Form.EditButtonClick(Sender: TObject);
var
 id : integer;
begin
  id := DataSet[KeyField];
  ST_INI_TYPE_ROOM_ADD_Form := TST_INI_TYPE_ROOM_ADD_Form.Create(Self);
  ST_INI_TYPE_ROOM_ADD_Form.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  ST_INI_TYPE_ROOM_ADD_Form.NameEdit.Text   := DataSet['NAME_TYPE_ROOM'];

  IF DataSet['SHORT_NAME']<> null
   then ST_INI_TYPE_ROOM_ADD_Form.Short_NameEdit.Text:= DataSet['SHORT_NAME']
   else ST_INI_TYPE_ROOM_ADD_Form.Short_NameEdit.Text:='';

  ST_INI_TYPE_ROOM_ADD_Form.PeopleEdit.Text:= DataSet['MAX_PEOPLE_COUNT'];
  ST_INI_TYPE_ROOM_ADD_Form.PlaceEdit.Text:= DataSet['SIZES'];

  if ST_INI_TYPE_ROOM_ADD_Form.ShowModal = mrOK then
   begin
    WriteProc.StoredProcName := 'ST_INI_TYPE_ROOM_UPDATE';
    // изменяем
    WriteProc.Transaction.StartTransaction;
    WriteProc.Prepare;
    WriteProc.ParamByName(KeyField).AsInteger           := id;
    WriteProc.ParamByName('NAME_TYPE_ROOM').AsString    := ST_INI_TYPE_ROOM_ADD_Form.NameEdit.Text ;
    WriteProc.ParamByName('SHORT_NAME').AsString        := ST_INI_TYPE_ROOM_ADD_Form.Short_NameEdit.Text;
    WriteProc.ParamByName('MAX_PEOPLE_COUNT').AsInteger := strtoint(ST_INI_TYPE_ROOM_ADD_Form.PeopleEdit.Text);
    WriteProc.ParamByName('SIZES').AsFloat              := StrToFloat(ST_INI_TYPE_ROOM_ADD_Form.PlaceEdit.Text);
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

  ST_INI_TYPE_ROOM_ADD_Form.Free;
end;

procedure TIni_Type_Room_Form.cxGridDBTableView1DblClick(Sender: TObject);
begin
if cxGridDBTableView1.OptionsSelection.MultiSelect=false then
EditAction.Execute;

if cxGridDBTableView1.OptionsSelection.MultiSelect=true then
ModalResult:=mrOk;
end;

end.
