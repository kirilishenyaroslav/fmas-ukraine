unit uPrice_param;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxControls, cxContainer, cxEdit, cxLabel, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, ImgList, StdCtrls,
  cxButtons, cxGroupBox, dxBar, dxBarExtItems, cxCalendar, cxCheckBox,
  ExtCtrls, iBase, uPrices_DM, st_common_funcs, st_ConstUnit, dxStatusBar;

type
  Tfrm_price_param = class(TForm)
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    btnPrint: TdxBarLargeButton;
    add_BarButton: TdxBarButton;
    Clone_BarButton: TdxBarButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    Cash_Style: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageListOfCategory: TImageList;
    PopupImageList: TImageList;
    dxBarPopupMenu1: TdxBarPopupMenu;
    Panel1: TPanel;
    cxGrid1_price: TcxGrid;
    cxGrid1_priceDBTableView1: TcxGridDBTableView;
    cxGrid1_priceLevel1: TcxGridLevel;
    cxGrid1DB_builds: TcxGridDBColumn;
    cxGrid1DB_type_room: TcxGridDBColumn;
    cxGrid1DB_type_stud: TcxGridDBColumn;
    cxGrid1DB_services: TcxGridDBColumn;
    cxGrid1DB_tariff: TcxGridDBColumn;
    cxGrid1DB_norma_indicator: TcxGridDBColumn;
    cxGrid1DB_summa: TcxGridDBColumn;
    HotKey_StatusBar: TdxStatusBar;
    Grid1DB_budget: TcxGridDBColumn;
    Grid1DB_category: TcxGridDBColumn;
    cxGrid1_priceDBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1_priceDBTableView1DBColumn2: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormIniLanguage;
    procedure AddButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure refresh_price_param;
    procedure FormShow(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure Clone_BarButtonClick(Sender: TObject);
  private
    DM : Tfrm_price_DM;
    PLanguageIndex : Byte;
  public
    id_prices : Int64;
    constructor create(aOwner : TComponent; ahandle : TISC_DB_HANDLE); reintroduce;
  end;

var
  frm_price_param: Tfrm_price_param;

implementation

uses uPrice_param_AE;

{$R *.dfm}

{ Tfrm_price_param }

constructor Tfrm_price_param.create(aOwner: TComponent;
  ahandle: TISC_DB_HANDLE);
begin
  inherited Create(aOwner);

  DM := Tfrm_price_DM.Create(self);
  DM.DB.Handle := ahandle;
  DM.DB.Open;
  DM.Transaction_Read.StartTransaction;

  FormIniLanguage;

  cxGrid1_priceDBTableView1.DataController.DataSource := DM.DataSource_main;
end;

procedure Tfrm_price_param.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_price_param.FormIniLanguage();
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
   btnPrint.Caption :=         st_ConstUnit.st_Print_Caption[PLanguageIndex];
   btnPrint.Hint :=         st_ConstUnit.st_Print_Caption[PLanguageIndex];

   HotKey_StatusBar.Panels[0].Text :=  st_ConstUnit.st_InsertBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
   HotKey_StatusBar.Panels[1].Text :=  st_ConstUnit.st_EditBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
   HotKey_StatusBar.Panels[2].Text :=  st_ConstUnit.st_DeleteBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
   HotKey_StatusBar.Panels[3].Text :=  st_ConstUnit.st_RefreshBtn_ShortCut[PLanguageIndex] + st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
   HotKey_StatusBar.Panels[4].Text :=  st_ConstUnit.st_Select_Caption[PLanguageIndex]      + st_ConstUnit.st_EnterBtn_ShortCut[PLanguageIndex];
   HotKey_StatusBar.Panels[5].Text :=  st_ConstUnit.st_ExitBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
   HotKey_StatusBar.Hint           :=  st_ConstUnit.st_HotKeys[PLanguageIndex];
end;

procedure Tfrm_price_param.AddButtonClick(Sender: TObject);
var
  ViewForm : Tfrmprice_param_AE;
  id_price_param : Int64;
  i : Integer;
  id_kat : Int64;
begin
  ViewForm := Tfrmprice_param_AE.Create(self, DM.DB.Handle);
  ViewForm.id_price := id_prices;
  ViewForm.is_add   := True;
  ViewForm.id_kat_pay := -1;
  ViewForm.ShowModal;

  If ViewForm.ModalResult = mrok then
   Begin
    DM.StoredProc.Transaction.StartTransaction;
    id_kat := ViewForm.id_kat_pay;

    if id_kat = -1 then
     Begin
      DM.StoredProc.StoredProcName := 'ST_SP_KAT_GEN_ID';
      DM.StoredProc.ExecProc;
      id_kat := DM.StoredProc.FieldByName('ID_KATEGORIYA').asint64;

      DM.StoredProc.StoredProcName := 'ST_SP_KATEGORY_INSERT';
      DM.StoredProc.Prepare;
      DM.StoredProc.ParamByName('NUM_KATEGORIYA').AsInteger  := ViewForm.CurrencyEdit_kod_kat.EditValue;
      DM.StoredProc.ParamByName('NAME_KATEGORIYA').AsString  := ViewForm.TextEdit_name_kat.Text;
      DM.StoredProc.ParamByName('SHORT_NAME').AsString       := ViewForm.TextEdit_short_name.Text;
      DM.StoredProc.ParamByName('ID_CATEGORY_CLASS').AsInt64 := ViewForm.id_category;
      DM.StoredProc.ParamByName('ID_TYPE_CATEGORY').AsInt64  := ViewForm.id_type_stud;

      If ViewForm.CheckBox_all_month.checked
       then DM.StoredProc.ParamByName('TYPE_KAT').AsInteger := 1
       else DM.StoredProc.ParamByName('TYPE_KAT').AsInteger := 0;

      DM.StoredProc.ParamByName('STUDENT').AsInteger := 0;
      DM.StoredProc.ParamByName('NOT_LIVE').AsInteger := 0;
      DM.StoredProc.ParamByName('BEZ_KOMN').AsInteger := 0;
      DM.StoredProc.ParamByName('ID_KATEGORIYA').AsInt64 := id_kat;
      DM.StoredProc.ExecProc;
     end;

    DM.StoredProc.StoredProcName := 'ST_DT_PRICE_PARAM_INS';
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('ID_PRICES').AsInt64         := id_prices;
    DM.StoredProc.ParamByName('ID_BUILDS').AsInt64         := ViewForm.Id_Builds;
    DM.StoredProc.ParamByName('ID_TYPE_ROOM').AsInt64      := ViewForm.id_type_room;
    DM.StoredProc.ParamByName('ID_TYPE_STUD').AsInt64      := ViewForm.id_type_stud;
    DM.StoredProc.ParamByName('ID_CATEGORY_CLASS').AsInt64 := ViewForm.id_category;
    DM.StoredProc.ParamByName('ID_KAT_PAY').AsInt64        := id_kat;
    DM.StoredProc.ExecProc;
    id_price_param := DM.StoredProc.FieldByName('id_price_param').asint64;

    //добавление услуг

    ViewForm.DM.MemoryData_services.first;
    for i := 0 to ViewForm.DM.MemoryData_services.RecordCount - 1 do
     Begin
      DM.StoredProc.StoredProcName := 'ST_DT_PRICE_SERVICES_INS';
      DM.StoredProc.Prepare;
      DM.StoredProc.ParamByName('ID_PRICE_PARAM').AsInt64   := id_price_param;
      DM.StoredProc.ParamByName('ID_SERVICES').AsInt64      := ViewForm.DM.MemoryData_services['MemoryData_id'];
      DM.StoredProc.ParamByName('ID_TYPE_NORMA').AsInt64    := ViewForm.DM.MemoryData_services['MemoryData_id_type_norma'];
      DM.StoredProc.ParamByName('ID_SM').AsInt64            := ViewForm.DM.MemoryData_services['MemoryData_id_sm'];
      DM.StoredProc.ParamByName('ID_RZ').AsInt64            := ViewForm.DM.MemoryData_services['MemoryData_Id_rz'];
      DM.StoredProc.ParamByName('ID_ST').AsInt64            := ViewForm.DM.MemoryData_services['MemoryData_id_st'];
      DM.StoredProc.ParamByName('ID_KEKV').AsInt64          := ViewForm.DM.MemoryData_services['MemoryData_id_KEKV'];
      DM.StoredProc.ParamByName('ST_OPTIONS').AsInteger     := ViewForm.DM.MemoryData_services['MemoryData_st_options'];
      DM.StoredProc.ExecProc;

      ViewForm.DM.MemoryData_services.Next;
     end;

    DM.StoredProc.StoredProcName := 'ST_DT_PRICE_KAT_INS';
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('ID_PRICE_PARAM').AsInt64 := ID_PRICE_PARAM;
    DM.StoredProc.ExecProc;
    
    try
      DM.StoredProc.Transaction.Commit;
     except
       DM.StoredProc.Transaction.Rollback;
    end;
    refresh_price_param;
   end;

  ViewForm.Free;
end;

procedure Tfrm_price_param.RefreshButtonClick(Sender: TObject);
begin
  refresh_price_param;
end;

procedure Tfrm_price_param.refresh_price_param;
begin
  DM.DataSet_main.Close;
  DM.DataSet_main.SQLs.SelectSQL.Text := 'select * from ST_DT_PRICE_PARAM_SEL(:id_price)';
  DM.DataSet_main.ParamByName('ID_PRICE').AsInt64 := id_prices;
  DM.DataSet_main.Open;
end;

procedure Tfrm_price_param.FormShow(Sender: TObject);
begin
  refresh_price_param;
end;

procedure Tfrm_price_param.DeleteButtonClick(Sender: TObject);
begin
  if DM.DataSet_main.RecordCount = 0 then Exit;

  If MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo
   then exit;

  DM.StoredProc.Transaction.StartTransaction;
  DM.StoredProc.StoredProcName := 'ST_DT_PRICE_PARAM_DEL';
  DM.StoredProc.Prepare;
  DM.StoredProc.ParamByName('id_price_param').AsInt64 := DM.DataSet_main['ID_PRICE_PARAM'];
  DM.StoredProc.ExecProc;
  try
    DM.StoredProc.Transaction.Commit;
   except
     DM.StoredProc.Transaction.Rollback;
     raise;
  End;

  refresh_price_param;
end;

procedure Tfrm_price_param.EditButtonClick(Sender: TObject);
var
  ViewForm : Tfrmprice_param_AE;
  id_price_param : Int64;
  i : Integer;
begin
  if DM.DataSet_main.RecordCount = 0 then Exit;

  ViewForm := Tfrmprice_param_AE.Create(self, DM.DB.Handle);
  ViewForm.is_add := false;

  id_price_param := DM.DataSet_main['ID_PRICE_PARAM'];

  ViewForm.CurrencyEdit_kod_kat.EditValue     := DM.DataSet_main['NUM_KAT'];
  ViewForm.TextEdit_short_name.Text           := DM.DataSet_main['SHORT_NAME_KAT'];
  ViewForm.TextEdit_name_kat.Text             := DM.DataSet_main['NAME_KAT'];

  if DM.DataSet_main['TYPE_KAT'] = 1
   then ViewForm.CheckBox_all_month.Checked := True
   else ViewForm.CheckBox_all_month.Checked := False;

  ViewForm.id_price                           := id_prices;
  ViewForm.Id_Builds                          := DM.DataSet_main['ID_BUILD'];
  ViewForm.ButtonEdit_Builds.Text             := DM.DataSet_main['NAME_BUILD'];
  ViewForm.effective_area                     := DM.DataSet_main['EFFECTIVE_AREA'];
  ViewForm.id_type_room                       := DM.DataSet_main['ID_TYPE_ROOM'];
  ViewForm.ButtonEdit_type_room.Text          := DM.DataSet_main['NAME_TYPE_ROOM'];
  ViewForm.CurrencyEdit_square_room.EditValue := DM.DataSet_main['SIZES'];
  ViewForm.S_room                             := DM.DataSet_main['SIZES'];
  ViewForm.id_category                        := DM.DataSet_main['ID_CATEGORY_CLASS'];
  ViewForm.ButtonEdit_category_class.Text     := DM.DataSet_main['NAME_CATEGORY_CLASS'];
  ViewForm.id_type_stud                       := DM.DataSet_main['id_type_stud'];
  ViewForm.ButtonEdit_type_stud.Text          := DM.DataSet_main['name_type_stud'];
  ViewForm.CurrencyEdit_all_living.EditValue  := DM.DataSet_main['PLACES'];
  ViewForm.CurrencyEdit_living.EditValue      := DM.DataSet_main['PEOPLES'];
  ViewForm.kol_live                           := DM.DataSet_main['PEOPLES'];
  ViewForm.id_kat_pay                         := DM.DataSet_main['ID_KAT_PAY'];

  DM.DataSet_read.Close;
  DM.DataSet_read.SQLs.SelectSQL.Text := 'Select * from st_dt_price_services_sel(:id_price_param)';
  DM.DataSet_read.paramByName('id_price_param').AsInt64 := id_price_param;
  DM.DataSet_read.Open;
  DM.DataSet_read.FetchAll;
  DM.DataSet_read.First;

  For i := 0 to DM.DataSet_read.RecordCount - 1 do
   Begin
    ViewForm.DM.MemoryData_services.Insert;
    ViewForm.DM.MemoryData_services['MemoryData_id']              := DM.DataSet_read['ID_SERVICES'];
    ViewForm.DM.MemoryData_services['MemoryData_name']            := DM.DataSet_read['NAME_SERVICES'];
    ViewForm.DM.MemoryData_services['MemoryData_id_type_norma']   := DM.DataSet_read['ID_TYPE_NORMA'];
    ViewForm.DM.MemoryData_services['MemoryData_name_type_norma'] := DM.DataSet_read['NAME_TYPE_NORMA'];
    ViewForm.DM.MemoryData_services['MemoryData_buget']           := DM.DataSet_read['BUDGET'];

    ViewForm.DM.MemoryData_services['MemoryData_id_sm']       := DM.DataSet_read['id_sm'];
    ViewForm.DM.MemoryData_services['MemoryData_Id_rz']       := DM.DataSet_read['id_rz'];
    ViewForm.DM.MemoryData_services['MemoryData_id_st']       := DM.DataSet_read['id_st'];
    ViewForm.DM.MemoryData_services['MemoryData_id_KEKV']     := DM.DataSet_read['id_kekv'];
    ViewForm.DM.MemoryData_services['MemoryData_sm_tittle']   := DM.DataSet_read['kod_sm'];
    ViewForm.DM.MemoryData_services['MemoryData_rz_tittle']   := DM.DataSet_read['kod_rz'];
    ViewForm.DM.MemoryData_services['MemoryData_st_tittle']   := DM.DataSet_read['kod_st'];
    ViewForm.DM.MemoryData_services['MemoryData_KEKV_tittle'] := DM.DataSet_read['kod_kekv'];
    ViewForm.DM.MemoryData_services['MemoryData_st_options']  := DM.DataSet_read['ST_OPTIONS'];

    ViewForm.DM.MemoryData_services.post;
    DM.DataSet_read.Next;
   end;

  ViewForm.recalc_norm; 
  ViewForm.ShowModal;

  If ViewForm.ModalResult = mrok then
   Begin
    DM.StoredProc.Transaction.StartTransaction;
    
    DM.StoredProc.StoredProcName := 'ST_SP_KATEGORY_UPDATE';
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('NUM_KATEGORIYA').AsInteger  := ViewForm.CurrencyEdit_kod_kat.EditValue;
    DM.StoredProc.ParamByName('NAME_KATEGORIYA').AsString  := ViewForm.TextEdit_name_kat.Text;
    DM.StoredProc.ParamByName('SHORT_NAME').AsString       := ViewForm.TextEdit_short_name.Text;
    DM.StoredProc.ParamByName('ID_CATEGORY_CLASS').AsInt64 := ViewForm.id_category;
    DM.StoredProc.ParamByName('ID_TYPE_CATEGORY').AsInt64  := ViewForm.id_type_stud;

    If ViewForm.CheckBox_all_month.checked
     then DM.StoredProc.ParamByName('TYPE_KAT').AsInteger := 1
     else DM.StoredProc.ParamByName('TYPE_KAT').AsInteger := 0;

    DM.StoredProc.ParamByName('STUDENT').AsInteger := 0;
    DM.StoredProc.ParamByName('NOT_LIVE').AsInteger := 0;
    DM.StoredProc.ParamByName('BEZ_KOMN').AsInteger := 0;
    DM.StoredProc.ParamByName('ID_KATEGORIYA').AsInt64 := ViewForm.id_kat_pay;
    DM.StoredProc.ExecProc;

    DM.StoredProc.StoredProcName := 'ST_DT_PRICE_PARAM_UPD';
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('ID_PRICE_PARAM').AsInt64    := id_price_param;
    DM.StoredProc.ParamByName('ID_PRICES').AsInt64         := id_prices;
    DM.StoredProc.ParamByName('ID_BUILDS').AsInt64         := ViewForm.Id_Builds;
    DM.StoredProc.ParamByName('ID_TYPE_ROOM').AsInt64      := ViewForm.id_type_room;
    DM.StoredProc.ParamByName('ID_TYPE_STUD').AsInt64      := ViewForm.id_type_stud;
    DM.StoredProc.ParamByName('ID_CATEGORY_CLASS').AsInt64 := ViewForm.id_category;
    DM.StoredProc.ParamByName('ID_KAT_PAY').AsInt64        := ViewForm.id_kat_pay;
    DM.StoredProc.ExecProc;

    //удалили старые потом добавим новые
    DM.StoredProc.Transaction.StartTransaction;
    DM.StoredProc.StoredProcName := 'ST_DT_PRICE_SERVICES_DEL';
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('ID_PRICE_PARAM').AsInt64 := id_price_param;
    DM.StoredProc.ExecProc;

    //добавление услуг
    ViewForm.DM.MemoryData_services.first;
    for i := 0 to ViewForm.DM.MemoryData_services.RecordCount - 1 do
     Begin
      DM.StoredProc.StoredProcName := 'ST_DT_PRICE_SERVICES_INS';
      DM.StoredProc.Prepare;
      DM.StoredProc.ParamByName('ID_PRICE_PARAM').AsInt64   := id_price_param;
      DM.StoredProc.ParamByName('ID_SERVICES').AsInt64      := ViewForm.DM.MemoryData_services['MemoryData_id'];
      DM.StoredProc.ParamByName('ID_TYPE_NORMA').AsInt64    := ViewForm.DM.MemoryData_services['MemoryData_id_type_norma'];
      DM.StoredProc.ParamByName('ID_SM').AsInt64            := ViewForm.DM.MemoryData_services['MemoryData_id_sm'];
      DM.StoredProc.ParamByName('ID_RZ').AsInt64            := ViewForm.DM.MemoryData_services['MemoryData_Id_rz'];
      DM.StoredProc.ParamByName('ID_ST').AsInt64            := ViewForm.DM.MemoryData_services['MemoryData_id_st'];
      DM.StoredProc.ParamByName('ID_KEKV').AsInt64          := ViewForm.DM.MemoryData_services['MemoryData_id_KEKV'];
      DM.StoredProc.ParamByName('ST_OPTIONS').AsInteger     := ViewForm.DM.MemoryData_services['MemoryData_st_options'];
      DM.StoredProc.ExecProc;

      ViewForm.DM.MemoryData_services.Next;
     end;

    DM.StoredProc.StoredProcName := 'ST_DT_PRICE_KAT_INS';
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('ID_PRICE_PARAM').AsInt64 := ID_PRICE_PARAM;
    DM.StoredProc.ExecProc;
     
    try
      DM.StoredProc.Transaction.Commit;
     except
       DM.StoredProc.Transaction.Rollback;
    end;
    refresh_price_param;
   end;

  ViewForm.Free;
end;

procedure Tfrm_price_param.Clone_BarButtonClick(Sender: TObject);
var
  ViewForm : Tfrmprice_param_AE;
  id_price_param : Int64;
  i : Integer;
  id_kat : int64;
begin
  if DM.DataSet_main.RecordCount = 0 then Exit;

  ViewForm := Tfrmprice_param_AE.Create(self, DM.DB.Handle);
  ViewForm.is_add := true;
  ViewForm.id_kat_pay := -1;

  id_price_param := DM.DataSet_main['ID_PRICE_PARAM'];

  ViewForm.CurrencyEdit_kod_kat.EditValue     := DM.DataSet_main['NUM_KAT'];
  ViewForm.TextEdit_short_name.Text           := DM.DataSet_main['SHORT_NAME_KAT'];
  ViewForm.TextEdit_name_kat.Text             := DM.DataSet_main['NAME_KAT'];

  if DM.DataSet_main['TYPE_KAT'] = 1
   then ViewForm.CheckBox_all_month.Checked := True
   else ViewForm.CheckBox_all_month.Checked := False;

  ViewForm.id_price                           := id_prices;
  ViewForm.Id_Builds                          := DM.DataSet_main['ID_BUILD'];
  ViewForm.ButtonEdit_Builds.Text             := DM.DataSet_main['NAME_BUILD'];
  ViewForm.effective_area                     := DM.DataSet_main['EFFECTIVE_AREA'];
  ViewForm.id_type_room                       := DM.DataSet_main['ID_TYPE_ROOM'];
  ViewForm.ButtonEdit_type_room.Text          := DM.DataSet_main['NAME_TYPE_ROOM'];
  ViewForm.CurrencyEdit_square_room.EditValue := DM.DataSet_main['SIZES'];
  ViewForm.S_room                             := DM.DataSet_main['SIZES'];
  ViewForm.id_category                        := DM.DataSet_main['ID_CATEGORY_CLASS'];
  ViewForm.ButtonEdit_category_class.Text     := DM.DataSet_main['NAME_CATEGORY_CLASS'];
  ViewForm.id_type_stud                       := DM.DataSet_main['id_type_stud'];
  ViewForm.ButtonEdit_type_stud.Text          := DM.DataSet_main['name_type_stud'];
  ViewForm.CurrencyEdit_all_living.EditValue  := DM.DataSet_main['PLACES'];
  ViewForm.CurrencyEdit_living.EditValue      := DM.DataSet_main['PEOPLES'];
  ViewForm.kol_live                           := DM.DataSet_main['PEOPLES'];
  ViewForm.id_kat_pay                         := -1;

  DM.DataSet_read.Close;
  DM.DataSet_read.SQLs.SelectSQL.Text := 'Select * from st_dt_price_services_sel(:id_price_param)';
  DM.DataSet_read.paramByName('id_price_param').AsInt64 := id_price_param;
  DM.DataSet_read.Open;
  DM.DataSet_read.FetchAll;
  DM.DataSet_read.First;

  For i := 0 to DM.DataSet_read.RecordCount - 1 do
   Begin
    ViewForm.DM.MemoryData_services.Insert;
    ViewForm.DM.MemoryData_services['MemoryData_id']              := DM.DataSet_read['ID_SERVICES'];
    ViewForm.DM.MemoryData_services['MemoryData_name']            := DM.DataSet_read['NAME_SERVICES'];
    ViewForm.DM.MemoryData_services['MemoryData_id_type_norma']   := DM.DataSet_read['ID_TYPE_NORMA'];
    ViewForm.DM.MemoryData_services['MemoryData_name_type_norma'] := DM.DataSet_read['NAME_TYPE_NORMA'];
    ViewForm.DM.MemoryData_services['MemoryData_buget']           := DM.DataSet_read['BUDGET'];

    ViewForm.DM.MemoryData_services['MemoryData_id_sm']       := DM.DataSet_read['id_sm'];
    ViewForm.DM.MemoryData_services['MemoryData_Id_rz']       := DM.DataSet_read['id_rz'];
    ViewForm.DM.MemoryData_services['MemoryData_id_st']       := DM.DataSet_read['id_st'];
    ViewForm.DM.MemoryData_services['MemoryData_id_KEKV']     := DM.DataSet_read['id_kekv'];
    ViewForm.DM.MemoryData_services['MemoryData_sm_tittle']   := DM.DataSet_read['kod_sm'];
    ViewForm.DM.MemoryData_services['MemoryData_rz_tittle']   := DM.DataSet_read['kod_rz'];
    ViewForm.DM.MemoryData_services['MemoryData_st_tittle']   := DM.DataSet_read['kod_st'];
    ViewForm.DM.MemoryData_services['MemoryData_KEKV_tittle'] := DM.DataSet_read['kod_kekv'];
    ViewForm.DM.MemoryData_services['MemoryData_st_options']  := DM.DataSet_read['ST_OPTIONS'];

    ViewForm.DM.MemoryData_services.post;
    DM.DataSet_read.Next;
   end;

  ViewForm.recalc_norm;

  ViewForm.ShowModal;

  If ViewForm.ModalResult = mrok then
   Begin
    DM.StoredProc.Transaction.StartTransaction;
    id_kat := ViewForm.id_kat_pay;

    if id_kat = -1 then
     Begin
      DM.StoredProc.StoredProcName := 'ST_SP_KAT_GEN_ID';
      DM.StoredProc.ExecProc;
      id_kat := DM.StoredProc.FieldByName('ID_KATEGORIYA').asint64;

      DM.StoredProc.StoredProcName := 'ST_SP_KATEGORY_INSERT';
      DM.StoredProc.Prepare;
      DM.StoredProc.ParamByName('NUM_KATEGORIYA').AsInteger  := ViewForm.CurrencyEdit_kod_kat.EditValue;
      DM.StoredProc.ParamByName('NAME_KATEGORIYA').AsString  := ViewForm.TextEdit_name_kat.Text;
      DM.StoredProc.ParamByName('SHORT_NAME').AsString       := ViewForm.TextEdit_short_name.Text;
      DM.StoredProc.ParamByName('ID_CATEGORY_CLASS').AsInt64 := ViewForm.id_category;
      DM.StoredProc.ParamByName('ID_TYPE_CATEGORY').AsInt64  := ViewForm.id_type_stud;

      If ViewForm.CheckBox_all_month.checked
       then DM.StoredProc.ParamByName('TYPE_KAT').AsInteger := 1
       else DM.StoredProc.ParamByName('TYPE_KAT').AsInteger := 0;

      DM.StoredProc.ParamByName('STUDENT').AsInteger := 0;
      DM.StoredProc.ParamByName('NOT_LIVE').AsInteger := 0;
      DM.StoredProc.ParamByName('BEZ_KOMN').AsInteger := 0;
      DM.StoredProc.ParamByName('ID_KATEGORIYA').AsInt64 := id_kat;
      DM.StoredProc.ExecProc;
     end;

    DM.StoredProc.StoredProcName := 'ST_DT_PRICE_PARAM_INS';
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('ID_PRICES').AsInt64         := id_prices;
    DM.StoredProc.ParamByName('ID_BUILDS').AsInt64         := ViewForm.Id_Builds;
    DM.StoredProc.ParamByName('ID_TYPE_ROOM').AsInt64      := ViewForm.id_type_room;
    DM.StoredProc.ParamByName('ID_TYPE_STUD').AsInt64      := ViewForm.id_type_stud;
    DM.StoredProc.ParamByName('ID_CATEGORY_CLASS').AsInt64 := ViewForm.id_category;
    DM.StoredProc.ParamByName('ID_KAT_PAY').AsInt64        := id_kat;
    DM.StoredProc.ExecProc;
    id_price_param := DM.StoredProc.FieldByName('id_price_param').asint64;

    //добавление услуг

    ViewForm.DM.MemoryData_services.first;
    for i := 0 to ViewForm.DM.MemoryData_services.RecordCount - 1 do
     Begin
      DM.StoredProc.StoredProcName := 'ST_DT_PRICE_SERVICES_INS';
      DM.StoredProc.Prepare;
      DM.StoredProc.ParamByName('ID_PRICE_PARAM').AsInt64   := id_price_param;
      DM.StoredProc.ParamByName('ID_SERVICES').AsInt64      := ViewForm.DM.MemoryData_services['MemoryData_id'];
      DM.StoredProc.ParamByName('ID_TYPE_NORMA').AsInt64    := ViewForm.DM.MemoryData_services['MemoryData_id_type_norma'];
      DM.StoredProc.ParamByName('ID_SM').AsInt64            := ViewForm.DM.MemoryData_services['MemoryData_id_sm'];
      DM.StoredProc.ParamByName('ID_RZ').AsInt64            := ViewForm.DM.MemoryData_services['MemoryData_Id_rz'];
      DM.StoredProc.ParamByName('ID_ST').AsInt64            := ViewForm.DM.MemoryData_services['MemoryData_id_st'];
      DM.StoredProc.ParamByName('ID_KEKV').AsInt64          := ViewForm.DM.MemoryData_services['MemoryData_id_KEKV'];
      DM.StoredProc.ParamByName('ST_OPTIONS').AsInteger     := ViewForm.DM.MemoryData_services['MemoryData_st_options'];
      DM.StoredProc.ExecProc;

      ViewForm.DM.MemoryData_services.Next;
     end;

    DM.StoredProc.StoredProcName := 'ST_DT_PRICE_KAT_INS';
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('ID_PRICE_PARAM').AsInt64 := ID_PRICE_PARAM;
    DM.StoredProc.ExecProc;
    try
      DM.StoredProc.Transaction.Commit;
     except
       DM.StoredProc.Transaction.Rollback;
    end;
    refresh_price_param;
   end;

  ViewForm.Free;
end;

end.
