//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник субсидий                                                 *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit st_sp_Subsidy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ImgList, dxBar, dxBarExtItems,
  FIBQuery, pFIBQuery, pFIBStoredProc, ActnList, FIBDataSet, pFIBDataSet,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer, cxLabel,
  ExtCtrls, Menus, StdCtrls, dxStatusBar,St_Proc, st_ConstUnit,
  DataModule1_Unit;

type
  TSubsidy_Form = class(TForm)
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    Familia_Column: TcxGridDBColumn;
    Faculty_Column: TcxGridDBColumn;
    Kurs_Column: TcxGridDBColumn;
    Group_Column: TcxGridDBColumn;
    Build_Column: TcxGridDBColumn;
    Room_Column: TcxGridDBColumn;
    Status_Column: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
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
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    cxLabel1: TcxLabel;
    ShortNameLabel: TEdit;
    PopupMenu1: TdxBarPopupMenu;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    HotKey_StatusBar: TdxStatusBar;
    PopupImageList: TImageList;
    ExitAction1: TMenuItem;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DataSetAfterOpen(DataSet: TDataSet);
    procedure DataSetAfterScroll(DataSet: TDataSet);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
   KeyField:string;
   procedure SelectAll;
  end;

var
  Subsidy_Form: TSubsidy_Form;

implementation

uses MAIN, st_sp_Subsidy_Add;

{$R *.dfm}

procedure TSubsidy_Form.FormIniLanguage();
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

 HotKey_StatusBar.Panels[0].Text:=  st_ConstUnit.st_InsertBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[1].Text:=  st_ConstUnit.st_EditBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[2].Text:=  st_ConstUnit.st_DeleteBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[3].Text:=  st_ConstUnit.st_RefreshBtn_ShortCut[PLanguageIndex] + st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[4].Text:=  st_ConstUnit.st_Select_Caption[PLanguageIndex]      + st_ConstUnit.st_EnterBtn_ShortCut[PLanguageIndex];
 HotKey_StatusBar.Panels[5].Text:=  st_ConstUnit.st_ExitBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Hint :=           st_ConstUnit.st_HotKeys[PLanguageIndex];

 // скорочення
 cxLabel1.Caption :=           st_ConstUnit.st_ShortLable[PLanguageIndex];

 // пошел грид
 cxGridDBTableView1DBColumn2.Caption :=    st_ConstUnit.st_NameLable[PLanguageIndex];

 MenuItem1.Caption :=            st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 MenuItem2.Caption :=            st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 MenuItem3.Caption :=            st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 MenuItem4.Caption :=            st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 ExitAction1.Caption :=                   st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];

 MenuItem1.Hint :=            st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 MenuItem2.Hint :=            st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 MenuItem3.Hint :=            st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 MenuItem4.Hint :=            st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 ExitAction1.Hint :=                   st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
end;

procedure TSubsidy_Form.SelectAll;
begin
DataSet.Close;
DataSet.Open;
end;

procedure TSubsidy_Form.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TSubsidy_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
MainForm.N10.Enabled:=true;
MainForm.CloseAllWindows;
end;

procedure TSubsidy_Form.SelectButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TSubsidy_Form.RefreshButtonClick(Sender: TObject);
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

procedure TSubsidy_Form.FormCreate(Sender: TObject);
begin
KeyField:='ID_SUBSIDY';
cxGridDBTableView1.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
cxGridDBTableView1.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
SelectAll;
FormIniLanguage();
end;

procedure TSubsidy_Form.DeleteButtonClick(Sender: TObject);
var
 selected : integer;
begin
 Screen.Cursor:=crHourGlass;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text:='select CAN from st_sp_SUBSIDY_CAN_DELETE('+ inttostr(DataSet[KeyField])+')';
 ReadDataSet.Open;
 if ReadDataSet['Can']=0 then begin
 Screen.Cursor:=crDefault;
 ShowMessage(PChar(st_ConstUnit.st_mess_NoSubsidyDelete[PLanguageIndex]));
 ReadDataSet.Close;
 exit;
 end;
 ReadDataSet.Close;
 Screen.Cursor:=crDefault;
 
 if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
 WriteProc.StoredProcName := 'ST_SP_SUBSIDY_DELETE';
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

procedure TSubsidy_Form.AddButtonClick(Sender: TObject);
var
 new_id    : integer;
begin
 Subsidy_Add_Form := TSubsidy_Add_Form.Create(Self);
 Subsidy_Add_Form.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];

 if Subsidy_Add_Form.ShowModal = mrOK then begin
  WriteProc.StoredProcName := 'ST_SP_SUBSIDY_INSERT';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('FULL_NAME').AsString := Subsidy_Add_Form.NameEdit.Text;
  WriteProc.ParamByName('SHORT_NAME').AsString := Subsidy_Add_Form.Short_NameEdit.Text;
  WriteProc.ParamByName('MIN_PERIOD').AsInteger := strtoint(Subsidy_Add_Form.MinPeriod_Edit.Text);
  WriteProc.ParamByName('MAX_PERIOD').AsInteger := strtoint(Subsidy_Add_Form.MaxPeriod_Edit.Text);
  WriteProc.ParamByName('MON_SPRAV').AsInteger := strtoint(Subsidy_Add_Form.Month_Edit.Text);
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
 Subsidy_Add_Form.Free;

end;

procedure TSubsidy_Form.EditButtonClick(Sender: TObject);
 var
  id : integer;
begin
 id := DataSet[KeyField];
 Subsidy_Add_Form := TSubsidy_Add_Form.Create(Self);
 Subsidy_Add_Form.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];

 Subsidy_Add_Form.NameEdit.Text   := DataSet['FULL_NAME'];
 Subsidy_Add_Form.Short_NameEdit.Text:= DataSet['SHORT_NAME'];
 Subsidy_Add_Form.MinPeriod_Edit.Text:= inttostr(DataSet['MIN_PERIOD']);
 Subsidy_Add_Form.MaxPeriod_Edit.Text:= inttostr(DataSet['MAX_PERIOD']);
 Subsidy_Add_Form.Month_Edit.Text:= inttostr(DataSet['MON_SPRAV']);
 if Subsidy_Add_Form.ShowModal = mrOK then begin
  WriteProc.StoredProcName := 'ST_SP_SUBSIDY_UPDATE';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName(KeyField).AsInteger := id;
  WriteProc.ParamByName('FULL_NAME').AsString := Subsidy_Add_Form.NameEdit.Text ;
  WriteProc.ParamByName('SHORT_NAME').AsString := Subsidy_Add_Form.Short_NameEdit.Text;
  WriteProc.ParamByName('MIN_PERIOD').AsInteger := strtoint(Subsidy_Add_Form.MinPeriod_Edit.Text);
  WriteProc.ParamByName('MAX_PERIOD').AsInteger := strtoint(Subsidy_Add_Form.MaxPeriod_Edit.Text);
  WriteProc.ParamByName('MON_SPRAV').AsInteger := strtoint(Subsidy_Add_Form.Month_Edit.Text);
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
 Subsidy_Add_Form.Free;


end;

procedure TSubsidy_Form.DataSetAfterOpen(DataSet: TDataSet);
begin
if DataSet.RecordCount = 0 then begin
  EditButton.Enabled := false;
  DeleteButton.Enabled := false;
 end else begin
  EditButton.Enabled := true;
  DeleteButton.Enabled := true;
 end;
end;

procedure TSubsidy_Form.DataSetAfterScroll(DataSet: TDataSet);
begin
if DataSet.RecordCount = 0 then exit;
 ShortNameLabel.Text := DataSet['SHORT_NAME'];
end;

procedure TSubsidy_Form.cxGridDBTableView1DblClick(Sender: TObject);
begin
if cxGridDBTableView1.OptionsSelection.MultiSelect=false then
if SelectButton.Enabled then ModalResult:=mrOk
else
EditAction.Execute;

if cxGridDBTableView1.OptionsSelection.MultiSelect=true then
ModalResult:=mrOk;
end;

end.
