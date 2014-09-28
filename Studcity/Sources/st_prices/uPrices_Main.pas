//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник категорий                                                *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit uPrices_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrices_DM, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, FIBQuery, pFIBQuery,
  pFIBStoredProc, ActnList, FIBDataSet, pFIBDataSet, cxContainer, cxLabel,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ImgList, ComCtrls, ToolWin, cxCalendar, cxTextEdit, Menus,
  StdCtrls, cxCurrencyEdit, RxMenus, dxBar, dxStatusBar, AccMGMT,
  st_ConstUnit, st_common_funcs, st_common_types, iBase,
  Placemnt, dxBarExtItems, cxRadioGroup, cxGroupBox;

type
  TfrmPrice_Main = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
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
    ImageList1: TImageList;
    PopupImageList: TImageList;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    HotKey_StatusBar: TdxStatusBar;
    Cash_Style: TcxStyle;
    SelectAction: TAction;
    actPrint: TAction;
    StFormStorage: TFormStorage;
    act_help: TAction;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    ImageList2: TImageList;
    btnPrint: TdxBarLargeButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    add_BarButton: TdxBarButton;
    Clone_BarButton: TdxBarButton;
    cxGrid1DB_name: TcxGridDBColumn;
    cxGrid1DB_date_beg: TcxGridDBColumn;
    cxGrid1DB_date_end: TcxGridDBColumn;
    cxGrid1DB_is_deleted: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure act_helpExecute(Sender: TObject);
    procedure Clone_BarButtonClick(Sender: TObject);
    procedure CheckBox_show_only_actingPropertiesChange(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    is_admin : Boolean;
    DM : Tfrm_price_DM;
    procedure FormIniLanguage();
  public
    KeyField    : string;
    MultiResult:Variant;
    Res : Variant;
    aHandle : TISC_DB_HANDLE;
    constructor Create(AParameter : TstSimpleParams);reintroduce;
    function GetMultiValue():variant;
    procedure SelectAllCategory;
  end;

var
  frmPrice_Main: TfrmPrice_Main;

implementation

uses FIBDatabase, uprice_Ae, uPrice_param;

{$R *.dfm}

constructor TfrmPrice_Main.Create(AParameter : TstSimpleParams);
begin
  Inherited Create(AParameter.Owner);
  is_admin := AParameter.is_admin;
  aHandle := AParameter.Db_Handle;

  DM := Tfrm_price_DM.Create(self);
  DM.DB.Handle := aHandle;
  DM.DB.Connected := True;
  DM.Transaction_Read.StartTransaction;

  StFormStorage.RestoreFormPlacement;
end;

procedure TfrmPrice_Main.FormIniLanguage();
begin
   // индекс языка (1-укр, 2 - рус)
   PLanguageIndex:=              stLanguageIndex;
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
   btnPrint.Caption :=         st_ConstUnit.st_Print_Caption[PLanguageIndex];
   btnPrint.Hint :=         st_ConstUnit.st_Print_Caption[PLanguageIndex];

   HotKey_StatusBar.Panels[0].Text:=  st_ConstUnit.st_InsertBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
   HotKey_StatusBar.Panels[1].Text:=  st_ConstUnit.st_EditBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
   HotKey_StatusBar.Panels[2].Text:=  st_ConstUnit.st_DeleteBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
   HotKey_StatusBar.Panels[3].Text:=  st_ConstUnit.st_RefreshBtn_ShortCut[PLanguageIndex] + st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
   HotKey_StatusBar.Panels[4].Text:=  st_ConstUnit.st_Select_Caption[PLanguageIndex]      + st_ConstUnit.st_EnterBtn_ShortCut[PLanguageIndex];
   HotKey_StatusBar.Panels[5].Text:=  st_ConstUnit.st_ExitBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
   HotKey_StatusBar.Hint :=           st_ConstUnit.st_HotKeys[PLanguageIndex];

   MenuItem1.Caption :=            st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
   MenuItem2.Caption :=            st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
   MenuItem3.Caption :=            st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
   MenuItem4.Caption :=            st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];

   MenuItem1.Hint := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
   MenuItem2.Hint := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
   MenuItem3.Hint := st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
   MenuItem4.Hint := st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
end;

function  TfrmPrice_Main.GetMultiValue():variant;
begin
  ShowModal;
  GetMultiValue:=MultiResult;
end;

procedure TfrmPrice_Main.SelectAllCategory;
begin
  DM.DataSet_main.Close;
  DM.DataSet_main.SQLs.SelectSQL.Text := 'SELECT * FROM ST_DT_PRICES_SELECT';
  DM.DataSet_main.Open;
  DM.DataSet_main.FetchAll;
end;

procedure TfrmPrice_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
 id_price : Int64;
 result : Integer;
begin
  DM.DataSet_read.Close;
  DM.DataSet_read.SQLs.SelectSQL.Text := 'select * from ST_SP_PRICES_CHECK_DATA';
  DM.DataSet_read.Open;

  result   := DM.DataSet_read['RESULT'];

  DM.DataSet_read.close;

  if result <> 0 then
   Begin
    ShowMessage('Виявлено порушення цілісності по датах!');
    exit;
   end;

  stFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

procedure TfrmPrice_Main.RefreshButtonClick(Sender: TObject);
begin
  Screen.Cursor:=crHourGlass;
  SelectAllCategory;
  Screen.Cursor:=crDefault;
end;

procedure TfrmPrice_Main.FormShow(Sender: TObject);
begin
  if formstyle = fsMDIChild
   then selectButton.Visible := ivNever
   else selectButton.Visible := ivAlways;

 cxGrid1.SetFocus;
end;

procedure TfrmPrice_Main.FormCreate(Sender: TObject);
begin
  SelectAllCategory;
  FormIniLanguage();
end;

procedure TfrmPrice_Main.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrice_Main.DeleteButtonClick(Sender: TObject);
var
 RowSelected : integer;
begin
  if not is_admin then
   if fibCheckPermission('/ROOT/Studcity/Sp_Kat_Opl','Del') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  if DM.DataSet_main.RecordCount = 0 then Exit;

  If MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo
   then exit;

  DM.StoredProc.StoredProcName := 'ST_DT_PRICES_DELETE';
  DM.StoredProc.Transaction.StartTransaction;
  DM.StoredProc.Prepare;
  DM.StoredProc.ParamByName('ID_PRICES').AsInt64 := DM.DataSet_main['ID_PRICES'];
  DM.StoredProc.ExecProc;
  try
   DM.StoredProc.Transaction.Commit;
   DM.StoredProc.Close;
  except
   DM.StoredProc.Transaction.Rollback;
   DM.StoredProc.Close;
   raise;
  end;

  RowSelected := cxGrid1DBTableView1.DataController.FocusedRowIndex-1;
  SelectAllCategory;
  cxGrid1DBTableView1.DataController.FocusedRowIndex := RowSelected;
end;

procedure TfrmPrice_Main.AddButtonClick(Sender: TObject);
var
  ViewForm : TfrmPrice_AE;
begin
  if not is_admin then
  if fibCheckPermission('/ROOT/Studcity/Sp_Kat_Opl','Add') <> 0 then
   begin
    messagebox(handle,
    pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
    +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
    pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    exit;
   end;

  ViewForm := TfrmPrice_AE.Create(self);
  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrok then
   Begin
    DM.StoredProc.Transaction.StartTransaction;
    DM.StoredProc.StoredProcName := 'ST_DT_PRICES_INSERT';
    DM.StoredProc.ParamByName('Name_price').asString := ViewForm.Edit_price_name.Text;
    DM.StoredProc.ParamByName('Date_beg').AsDate      := ViewForm.DateEdit_date_beg.Date;
    DM.StoredProc.ParamByName('Date_END').AsDate      := ViewForm.DateEdit_date_END.Date;
    DM.StoredProc.ExecProc;
    try
     DM.StoredProc.Transaction.Commit;
     except
      on E: exception do
       Begin
        DM.StoredProc.Transaction.Rollback;
        ShowMessage(E.message);
        raise;
       end;
    End;

    RefreshButtonClick(self);
   end;

  ViewForm.Free; 
end;

procedure TfrmPrice_Main.EditButtonClick(Sender: TObject);
var
  ViewForm : TfrmPrice_AE;
begin
  if not is_admin then
   if fibCheckPermission('/ROOT/Studcity/Sp_Kat_Opl','Edit') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  if DM.DataSet_main.RecordCount = 0 then Exit;

  ViewForm := TfrmPrice_AE.Create(self);

  Viewform.Edit_price_name.Text   := DM.DataSet_main['Name_prices'];
  Viewform.DateEdit_date_beg.Date := DM.DataSet_main['Date_beg'];
  Viewform.DateEdit_date_end.Date := DM.DataSet_main['date_END'];

  ViewForm.CheckBox_deleted.Visible := true;

  if DM.DataSet_main['IS_DELETED'] = 1
   then ViewForm.CheckBox_deleted.Checked := True
   else ViewForm.CheckBox_deleted.Checked := False;

  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrok then
   Begin
    DM.StoredProc.Transaction.StartTransaction;
    DM.StoredProc.StoredProcName := 'ST_DT_PRICES_UPDATE';
    DM.StoredProc.ParamByName('ID_PRICES').AsInt64   := DM.DataSet_main['ID_PRICES'];
    DM.StoredProc.ParamByName('Name_price').asString := ViewForm.Edit_price_name.Text;
    DM.StoredProc.ParamByName('Date_beg').AsDate     := ViewForm.DateEdit_date_beg.Date;
    DM.StoredProc.ParamByName('Date_END').AsDate     := ViewForm.DateEdit_date_END.Date;

    if ViewForm.CheckBox_deleted.Checked
     then DM.StoredProc.ParamByName('IS_DELETED').AsInteger := 1
     else DM.StoredProc.ParamByName('IS_DELETED').AsInteger := 0;

    DM.StoredProc.ExecProc;
    try
     DM.StoredProc.Transaction.Commit;
     except
      on E: exception do
       Begin
        DM.StoredProc.Transaction.Rollback;
        ShowMessage(E.message);
        raise;
       end;
    End;

    RefreshButtonClick(self);
   end;

  ViewForm.Free;
end;

procedure TfrmPrice_Main.SelectButtonClick(Sender: TObject);
begin
  If DM.DataSet_main.RecordCount = 0 then Exit;

  Res := VarArrayCreate([0,2], varVariant);
  
  Res[0] := DM.DataSet_main['ID_KATEGORIYA'];
  Res[1] := DM.DataSet_main['NUM_KATEGORIYA'];
  Res[2] := DM.DataSet_main['NAME_KATEGORIYA'];

  ModalResult := mrOk;
end;

procedure TfrmPrice_Main.btnPrintClick(Sender: TObject);
begin
  ShowMessage('Вибачте дія поки що не працює!');
end;

procedure TfrmPrice_Main.actPrintExecute(Sender: TObject);
begin
  btnPrintClick(Sender);
end;

procedure TfrmPrice_Main.act_helpExecute(Sender: TObject);
begin
  Load_Help(self, DM.DB.Handle, 'sp_kat_pay');
end;

procedure TfrmPrice_Main.Clone_BarButtonClick(Sender: TObject);
var
  id_prices : Int64;
  ViewForm : TfrmPrice_AE;
begin
  if not is_admin then
   if fibCheckPermission('/ROOT/Studcity/Sp_Kat_Opl','Add') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  if DM.DataSet_main.RecordCount = 0 then Exit;

  id_prices := DM.DataSet_main['ID_PRICES'];

  ViewForm := TfrmPrice_AE.Create(self);

  Viewform.Edit_price_name.Text   := DM.DataSet_main['Name_prices'];
  Viewform.DateEdit_date_beg.Date := DM.DataSet_main['Date_beg'];
  Viewform.DateEdit_date_end.Date := DM.DataSet_main['date_END'];

  ViewForm.CheckBox_deleted.Visible := true;

  if DM.DataSet_main['IS_DELETED'] = 1
   then ViewForm.CheckBox_deleted.Checked := True
   else ViewForm.CheckBox_deleted.Checked := False;

  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrok then
   Begin
    DM.StoredProc.Transaction.StartTransaction;
    DM.StoredProc.StoredProcName := 'ST_DT_PRICES_COPY';
    DM.StoredProc.ParamByName('ID_PRICES').AsInt64 := id_prices;
    DM.StoredProc.ParamByName('Name_price').asString := ViewForm.Edit_price_name.Text;
    DM.StoredProc.ParamByName('Date_beg').AsDate     := ViewForm.DateEdit_date_beg.Date;
    DM.StoredProc.ParamByName('Date_END').AsDate     := ViewForm.DateEdit_date_END.Date;

    DM.StoredProc.ExecProc;

    try
     DM.StoredProc.Transaction.Commit;
     except
      on E: exception do
       Begin
        DM.StoredProc.Transaction.Rollback;
        ShowMessage(E.message);
        raise;
       end;
    End;

    RefreshButtonClick(self);
   end;
end;

procedure TfrmPrice_Main.CheckBox_show_only_actingPropertiesChange(
  Sender: TObject);
begin
  SelectAllCategory;
  
  cxGrid1.SetFocus;
end;

procedure TfrmPrice_Main.cxGrid1DBTableView1DblClick(Sender: TObject);
var
  ViewForm : Tfrm_price_param;
begin
  If DM.DataSet_main.RecordCount = 0 then Exit;

  ViewForm := Tfrm_price_param.Create(self, DM.DB.Handle);
  ViewForm.Id_prices := DM.DataSet_main['ID_PRICES'];
  ViewForm.ShowModal;
  ViewForm.Free;
end;

end.
