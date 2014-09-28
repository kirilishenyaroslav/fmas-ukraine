unit uSp_Type_Kat_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, FIBQuery, pFIBQuery,
  pFIBStoredProc, ActnList, FIBDataSet, pFIBDataSet, cxContainer, cxLabel,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ImgList, ComCtrls, ToolWin, cxGridCustomPopupMenu, cxGridPopupMenu, Menus,
  StdCtrls, FIBDatabase, pFIBDatabase,IBase, dxStatusBar, st_ConstUnit,
  uSp_Type_Kat_AE, st_common_funcs, st_common_types, dxBar, dxBarExtItems,
  uSp_Type_Kat_DM, Placemnt, st_Common_Messages, st_consts_messages;

type
  TfrmType_Kat = class(TForm)
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
    DataSource: TDataSource;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    ImageListOfCategory: TImageList;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DeleteAction1: TMenuItem;
    RefreshAction1: TMenuItem;
    ShortNameLabel: TEdit;
    N3: TMenuItem;
    PopupImageList: TImageList;
    HotKey_StatusBar: TdxStatusBar;
    SelectAction: TAction;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    Search_BarEdit: TdxBarEdit;
    StFormStorage: TFormStorage;
    Act_help: TAction;
    procedure SelectButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSet_MainAfterScroll(DataSet: TDataSet);
    procedure Act_helpExecute(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM : TfrmType_Kat_DM;
    is_admin : Boolean;
    procedure FormIniLanguage();
  public
    res : Variant;
    constructor Create (aParameter : TstSimpleParams);reintroduce;
  end;

var
  frmType_Kat: TfrmType_Kat;

implementation

{$R *.dfm}

procedure TfrmType_Kat.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex := stLanguageIndex;
 Caption        := st_ConstUnit.st_CatTypeSprav[PLanguageIndex];

 //названия кнопок
 ExitButton.Caption        := st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
 ExitButton.Hint           := st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
 AddButton.Caption         := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 AddButton.Hint            := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption        := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 EditButton.Hint           := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption      := st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 DeleteButton.Hint         := st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption     := st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 RefreshButton.Hint        := st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption      := st_ConstUnit.st_Select_Caption[PLanguageIndex];
 SelectButton.Hint         := st_ConstUnit.st_Select_Caption[PLanguageIndex];

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

constructor TfrmType_Kat.Create(Aparameter : TstSimpleParams);
begin
  inherited Create(Aparameter.Owner);
  Screen.Cursor:= crHourGlass;

  DM := TfrmType_Kat_DM.Create(self);
  DM.DB.Handle := aParameter.Db_Handle;
  DM.DB.Connected := True;
  DM.Transaction_Read.StartTransaction;

  is_admin := aParameter.is_admin;
  
  RefreshButtonClick(self);

  cxGrid1DBTableView1.DataController.DataSource := DM.DataSource_main;
  DM.DataSet_main.AfterScroll := DataSet_MainAfterScroll;

  Screen.Cursor:= crDefault;

  StFormStorage.RestoreFormPlacement;
end;

procedure TfrmType_Kat.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmType_Kat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  stFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

procedure TfrmType_Kat.AddButtonClick(Sender: TObject);
var
 ViewForm : TfrmType_Kat_AE;
 id : Int64;
begin
  if not Is_Admin then
   if CheckPermission('/ROOT/StudCity/St_Sp','Add') <> 0
    then
     begin
      messagebox(handle,
      pchar(st_Consts_Messages.st_NotHaveRights[PLanguageIndex]
      +#13+ st_Consts_Messages.st_GoToAdmin[PLanguageIndex]),
      pchar(st_Consts_Messages.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  ViewForm := TfrmType_Kat_AE.Create(Self);
  ViewForm.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
  ViewForm.PLanguageIndex := PLanguageIndex;
  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOK then
  begin
   start_sql_monitor;
   DM.Transaction_write.StartTransaction;
   DM.StoredProc.StoredProcName := 'ST_INI_TYPE_CATEGORY_INSERT';
   DM.StoredProc.Prepare;
   DM.StoredProc.ParamByName('NAME_TYPE_CATEGORY').AsString := ViewForm.NameEdit.Text;
   DM.StoredProc.ParamByName('NAME_SHORT').AsString         := ViewForm.ShortEdit.Text;
   if ViewForm.MonthOplCheck.Checked
    then DM.StoredProc.ParamByName('MONTH_OPL').AsInteger := 1
    else DM.StoredProc.ParamByName('MONTH_OPL').AsInteger := 0;

   DM.StoredProc.ExecProc;
   id := DM.StoredProc.FieldByName('ID_TYPE_CATEGORY').AsInteger;
   try
    DM.Transaction_write.Commit;
    except
     on E:Exception do
       begin
        stShowMessage('Error in ST_INI_TYPE_CATEGORY_INSERT',e.Message,mtError,[mbOK]);
        DM.Transaction_write.Rollback;
        Send_mail(e.Message);
       end;
   end;
   stop_sql_monitor;

   DM.StoredProc.Close;

   RefreshButtonClick(self);
   DM.DataSet_main.Locate('ID_TYPE_CATEGORY', id, []);
  end;
  ViewForm.Free;
end;

procedure TfrmType_Kat.EditButtonClick(Sender: TObject);
var
  id       : Int64;
  ViewForm : TfrmType_Kat_AE;
begin
  if not Is_Admin then
   if CheckPermission('/ROOT/StudCity/St_Sp','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(st_Consts_Messages.st_NotHaveRights[PLanguageIndex]
      +#13+ st_Consts_Messages.st_GoToAdmin[PLanguageIndex]),
      pchar(st_Consts_Messages.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  if DM.DataSet_main.RecordCount = 0 then Exit;

  ViewForm := TfrmType_Kat_AE.Create(Self);
  ViewForm.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  ViewForm.PLanguageIndex := PLanguageIndex;

  id := DM.DataSet_main['ID_TYPE_CATEGORY'];
  if DM.DataSet_main['NAME_SHORT']<> null
   then ViewForm.ShortEdit.Text := DM.DataSet_main['NAME_SHORT'];

  if DM.DataSet_main['NAME_TYPE_CATEGORY']<> null
   then ViewForm.NameEdit.Text := DM.DataSet_main['NAME_TYPE_CATEGORY'];

  if DM.DataSet_main['MONTH_OPL']<> null then
   if DM.DataSet_main['MONTH_OPL'] = 1
    then ViewForm.MonthOplCheck.Checked := True
    else ViewForm.MonthOplCheck.Checked := False;

  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOK then
   begin
    start_sql_monitor;
    DM.StoredProc.StoredProcName := 'ST_INI_TYPE_CATEGORY_UPDATE';
    DM.StoredProc.Transaction.StartTransaction;
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('ID_TYPE_CATEGORY').AsInteger := id;
    DM.StoredProc.ParamByName('NAME_TYPE_CATEGORY').AsString := ViewForm.NameEdit.Text;
    DM.StoredProc.ParamByName('NAME_SHORT').AsString := ViewForm.ShortEdit.Text;

    if ViewForm.MonthOplCheck.Checked
     then DM.StoredProc.ParamByName('MONTH_OPL').AsInteger := 1
     else DM.StoredProc.ParamByName('MONTH_OPL').AsInteger := 0;

    DM.StoredProc.ExecProc;
    try
     DM.StoredProc.Transaction.Commit;
    except
     on E:Exception do
       begin
        stShowMessage('Error in ST_INI_TYPE_CATEGORY_UPDATE',e.Message,mtError,[mbOK]);
        DM.Transaction_write.Rollback;
        Send_mail(e.Message);
       end;
    end;
    stop_sql_monitor;
    DM.StoredProc.Close;

    RefreshButtonClick(self);
    DM.DataSet_main.Locate('ID_TYPE_CATEGORY', id, []);
   end;
  ViewForm.Free;
end;

procedure TfrmType_Kat.DeleteButtonClick(Sender: TObject);
var
  id : Int64;
  i  : byte;
begin
  if not Is_Admin then
   if CheckPermission('/ROOT/StudCity/St_Sp','Del') <> 0
    then
     begin
      messagebox(handle,
      pchar(st_Consts_Messages.st_NotHaveRights[PLanguageIndex]
      +#13+ st_Consts_Messages.st_GoToAdmin[PLanguageIndex]),
      pchar(st_Consts_Messages.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  screen.Cursor:=crHourGlass;

  DM.DataSet_read.Close;
  DM.DataSet_read.SelectSQL.Text := 'select * from ST_INI_TYPE_CAT_CAN_DEL(:ID_TYPE_CATEGORY)';
  DM.DataSet_read.ParamByName('ID_TYPE_CATEGORY').AsInt64 := DM.DataSet_main.FieldByName('ID_TYPE_CATEGORY').AsInteger;
  DM.DataSet_read.Open;
  
  if DM.DataSet_read['CAN'] = 0 then
   begin
    screen.Cursor:=crDefault;
    ShowMessage(PChar(st_ConstUnit.st_mess_NoItemDelete[PLanguageIndex]));
    DM.DataSet_read.Close;
    exit;
   end;
  DM.DataSet_read.Close;
  screen.Cursor:=crDefault;

  i:= st_Common_Messages.stShowMessage(st_Confirmation_Caption[PLanguageIndex], st_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  start_sql_monitor;
  DM.StoredProc.StoredProcName := 'ST_INI_TYPE_CATEGORY_DELETE';
  DM.StoredProc.Transaction.StartTransaction;
  DM.StoredProc.Prepare;
  DM.StoredProc.ParamByName('ID_TYPE_CATEGORY').AsInteger := DM.DataSet_main['ID_TYPE_CATEGORY'];
  DM.StoredProc.ExecProc;
  try
   DM.StoredProc.Transaction.Commit;
   except
   on E:Exception do
       begin
        stShowMessage('Error in ST_INI_TYPE_CATEGORY_DELETE',e.Message,mtError,[mbOK]);
        DM.Transaction_write.Rollback;
        Send_mail(e.Message);
       end;
  end;
  DM.StoredProc.Close;
  stop_sql_monitor;

  id := cxGrid1DBTableView1.DataController.FocusedRowIndex-1;
  RefreshButtonClick(self);
  
  DM.DataSet_main.Locate('ID_TYPE_CATEGORY', id, []);
end;

procedure TfrmType_Kat.RefreshButtonClick(Sender: TObject);
var
  Id : Int64;
begin
  Screen.Cursor:=crHourGlass;

  Id := -1;

  if DM.DataSet_main.RecordCount <> 0
   then ID := DM.DataSet_main['ID_TYPE_CATEGORY'];

  DM.DataSet_main.Close;
  DM.DataSet_main.sqls.SelectSql.Text := 'select * from ST_INI_TYPE_CATEGORY_SELECT';
  DM.DataSet_main.Open;

  DM.DataSet_main.Locate('ID_TYPE_CATEGORY', id, []);

  Screen.Cursor:=crDefault;
end;

procedure TfrmType_Kat.DataSet_mainAfterScroll(DataSet: TDataSet);
begin
  If DataSet.RecordCount = 0 then exit;
  If DataSet['NAME_SHORT']<> null then ShortNameLabel.Text := DataSet['NAME_SHORT'];
  If DataSet['MONTH_OPL']<> null then MonthOplCheck.Checked := DataSet['MONTH_OPL'] = 1;
end;

procedure TfrmType_Kat.SelectButtonClick(Sender: TObject);
begin
  if DM.DataSet_main.RecordCount = 0 then Exit;

  res:=VarArrayCreate([0,2],varVariant);
  res[0] := DM.DataSet_main['ID_TYPE_CATEGORY'];
  res[1] := DM.DataSet_main['NAME_TYPE_CATEGORY'];
  res[2] := DM.DataSet_main['MONTH_OPL'];

  ModalResult := mrOK;
end;

procedure TfrmType_Kat.FormShow(Sender: TObject);
begin
  FormIniLanguage();
  if FormStyle = fsMDIChild then
   begin
    SelectButton.Visible := ivNever;
    cxGrid1DBTableView1.OptionsSelection.MultiSelect:= False;
   end;
end;

procedure TfrmType_Kat.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  SelectButtonClick(self);
end;

procedure TfrmType_Kat.Act_helpExecute(Sender: TObject);
begin
  Load_Help(self, DM.DB.Handle, 'sp_type_kat');
end;

end.
