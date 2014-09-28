//******************************************************************************
// Проект "Контракты"
// Форма работы с прейскурантом
// Перчак А.Л. 2009
//******************************************************************************
unit UParamsReestr_ex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, cxStyles, ImgList, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit,
  cxContainer, cxCheckBox, ExtCtrls, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls,  Contnrs, FIBDataSet,
  pFIBDataSet, pFibStoredProc, cxLookAndFeelPainters, cxButtons, cxDBEdit,
  Menus, Ibase, FIBDatabase, pFIBDatabase, ActnList, FIBQuery, pFIBQuery,
  CnConsts, cn_Common_Funcs, cxPC, Placemnt, cxCalendar, dxBar,
  dxBarExtItems, cn_common_messages, cxCurrencyEdit, frxClass, frxDBSet,
  frxDesgn, cn_Common_Types, frxExportRTF, frxExportPDF, frxExportXLS,
  frxExportHTML, AccMgmt, cnConsts_Messages;

type
  TRecInfo=array of int64;

  TfrmPriceReestr = class(TForm)
    ToolBar3: TToolBar;
    DataSource: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    backbold: TcxStyle;
    LargeImages: TImageList;
    WorkDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    DataSetGrid: TpFIBDataSet;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    CnFormStorage: TFormStorage;
    ImageList1: TImageList;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    ActionList2: TActionList;
    act_Refresh: TAction;
    act_exit: TAction;
    act_edit: TAction;
    act_add: TAction;
    act_del: TAction;
    act_select: TAction;
    Smet_button: TdxBarLargeButton;
    smet_act: TAction;
    addbyparam_act: TAction;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    add_new: TdxBarLargeButton;
    copybyparam: TdxBarLargeButton;
    PopupImageList: TImageList;
    PopupMenu1: TPopupMenu;
    EditPop: TMenuItem;
    DeletePop: TMenuItem;
    RefreshPop: TMenuItem;
    ExitPop: TMenuItem;
    AddPop: TMenuItem;
    AddbyparamPop: TMenuItem;
    SelectPop: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    frxDesigner1: TfrxDesigner;
    Price_frxDataset: TfrxDBDataset;
    Price_Report: TfrxReport;
    DataSet_report: TpFIBDataSet;
    print_button: TdxBarLargeButton;
    print_act: TAction;
    debug_act: TAction;
    PopupMenu_print: TdxBarPopupMenu;
    dxBarLargeButton1: TdxBarLargeButton;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    cxGrid1: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    Facult_tabel1: TcxGridDBColumn;
    Spec_table1: TcxGridDBColumn;
    Date_beg_table1: TcxGridDBColumn;
    nac_table1: TcxGridDBColumn;
    form_table1: TcxGridDBColumn;
    kat_table1: TcxGridDBColumn;
    year_table1: TcxGridDBColumn;
    kurs_table1: TcxGridDBColumn;
    Date_beg_stud_table1: TcxGridDBColumn;
    Date_end_stud_table1: TcxGridDBColumn;
    summa_table1: TcxGridDBColumn;
    term_stud_table1: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    smeta_table: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure act_RefreshExecute(Sender: TObject);
    procedure act_exitExecute(Sender: TObject);
    procedure act_editExecute(Sender: TObject);
    procedure act_addExecute(Sender: TObject);
    procedure act_delExecute(Sender: TObject);
    procedure act_selectExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure smet_actExecute(Sender: TObject);
    procedure addbyparam_actExecute(Sender: TObject);
    procedure print_actExecute(Sender: TObject);
    procedure debug_actExecute(Sender: TObject);
    procedure cxGridDBTableView3DblClick(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);

  private
    DateBeg:TDateTime;
    DateEnd:TDateTime;
  public
    { Public declarations }
    Res               : Variant;
    Quene             : TObjectStack;
    PLanguageIndex    : integer;
    Is_admin          : Boolean;
    Id_price_verssion : int64;
    aHandle           : TISC_DB_HANDLE;
    IsDebugMode       : boolean;
    is_Select         : boolean;
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;aID_PRICE:Int64;ID_USER:Int64;can_edit: boolean;is_admin : Boolean);overload;
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;aDateBeg,aDateEnd:TDateTime;ID_USER:Int64);overload;
  end;

  Function ShowPricesByDate(AParameter:TcnSimpleParams):Variant; stdcall;
   Exports ShowPricesByDate;

implementation

uses DateUtils, BaseTypes, PricesMain_ex, UGetRec_ex, UPriceSmet_ex;
{$R *.dfm}

Function ShowPricesByDate(AParameter:TcnSimpleParams):Variant; stdcall;
var
  ViewForm : TfrmPriceReestr;
  Res : Variant;
begin
  if AParameter.Formstyle = fsMDIChild then
  if IsMDIChildFormShow(TfrmPriceReestr) then exit;

  ViewForm := TfrmPriceReestr.Create(AParameter.Owner, AParameter.Db_Handle, AParameter.Date_beg, AParameter.Date_end, AParameter.ID_User);

  ViewForm.FormStyle:= AParameter.Formstyle;

  case ViewForm.FormStyle of
   fsMDIChild	           : ViewForm.Show;
  else
   begin
    ViewForm.ShowModal;
    Res := ViewForm.Res;
    ViewForm.free;
   end;
  end;

  Result := Res;
end;

constructor TfrmPriceReestr.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;aID_PRICE:Int64;ID_USER:Int64;can_edit: boolean;is_admin : Boolean);
begin
    Inherited Create(AOwner);
    WorkDatabase.Handle:=DB_Handle;
    aHandle:=DB_Handle;
    Id_price_verssion:=aid_price;
    self.Is_admin := Is_admin;

    ReadTransaction.StartTransaction;

    DataSetGrid.Close;
    DataSetGrid.SQLs.SelectSQL.Text:='SELECT * FROM CN_DT_PRICE_PARAM_SELECT(:ID_PRICE_VER) order by name_facul, name_spec, name_form_stud, name_kat_stud, name_national, year_stud';
    DataSetGrid.ParamByName('ID_PRICE_VER').AsInt64:=Id_price_verssion;
    DataSetGrid.Open;

    SelectButton.Visible  :=ivNever;
    SelectPop.Visible := False;
    print_button.Visible:=ivAlways;
    AddButton.Enabled        := can_edit;
    EditButton.Enabled       := can_edit;
    DeleteButton.Enabled     := can_edit;
    Smet_button.Enabled      := can_edit;

    PopupMenu1.Items[0].Enabled:= can_edit;
    PopupMenu1.Items[1].Enabled:= can_edit;
    PopupMenu1.Items[2].Enabled:= can_edit;
    PopupMenu1.Items[3].Enabled:= can_edit;
    is_select:=false;
    CnFormStorage.RestoreFormPlacement;
end;

procedure TfrmPriceReestr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CnFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild then Action:=caFree;
end;


constructor TfrmPriceReestr.Create(AOwner: TComponent; DB_Handle: TISC_DB_HANDLE; aDateBeg, aDateEnd: TDateTime; ID_USER: Int64);
begin
  Inherited Create(AOwner);
  Self.FormStyle:=fsNormal;
  WorkDatabase.Handle:=DB_Handle;
  aHandle:=DB_Handle;

  ReadTransaction.StartTransaction;
  DataSetGrid.Close;
  DataSetGrid.SQLs.SelectSQL.Clear;
  DataSetGrid.SQLs.SelectSQL.Add('SELECT * FROM CN_DT_PRICE_SELECT_BY_DATE(:DATE_BEG,:DATE_END) order by name_facul, name_spec, name_form_stud, name_kat_stud, name_national, year_stud');
  DataSetGrid.ParamByName('DATE_BEG').AsDate:=aDateBeg;
  DataSetGrid.ParamByName('DATE_END').AsDate:=aDateEnd;
  DataSetGrid.Open;

  AddButton.Visible    := ivNever;
  EditButton.Visible   := ivNever;
  DeleteButton.Visible := ivNever;
  print_button.Visible := ivNever;
  is_select:=true;
end;

//--------------------------Процедура изменения---------------------------------
procedure TfrmPriceReestr.act_editExecute(Sender: TObject);
var
  T:TfrmGetRec;
  i:integer;
  id,Id_Price_Param, id_summ :Int64;
  flag : boolean;
begin
  if cxGridDBTableView3.DataController.RowCount=0 then exit;

  If not Is_Admin then
  If fibCheckPermission('/ROOT/Contracts/Cn_Price','Edit') <> 0 then
   Begin
    messagebox(handle,
    pchar(cn_NotHaveRights[PLanguageIndex]
    +#13+ cn_GoToAdmin[PLanguageIndex]),
    pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    exit;
   End;

  Id_Price_Param:=DataSetGrid['ID_PRICE_PARAM'];
  T:=TfrmGetRec.Create(self, Id_Price_Param, aHandle);
  T.id_price_ver := Id_price_verssion; //DataSetGrid['ID_PRICES'];
  T.Id_Fac       := DataSetGrid['id_facul'];
  T.Id_Spec      := DataSetGrid['id_spec'];
  T.Id_FormStud  := DataSetGrid['id_form_stud'];
  T.id_nac       := DataSetGrid['id_national'];
  T.id_Kat       := DataSetGrid['id_kat_stud'];

  if DataSetGrid['id_valute'] <> null
   then T.id_valute := DataSetGrid['id_valute']
   else T.id_valute := -1;

  T.ShowModal;

  if T.ModalResult=mrYes then
   begin
     WriteTransaction.StartTransaction;

     StProc.StoredProcName := 'CN_DT_PRICE_PARAM_DELETE';
     StProc.Prepare;
     StProc.ParamByName('ID_PRICE_PARAM').AsInt64 := DataSetGrid['id_price_param'];
     StProc.ExecProc;

     StProc.StoredProcName:='CN_DT_PRICE_PARAM_INSERT';
     StProc.Prepare;
     StProc.ParamByName('id_price_param_in').AsInt64 := Id_Price_Param;
     StProc.ParamByName('id_price_verssion').AsInt64 := Id_price_verssion;
     StProc.ParamByName('id_facul').AsInt64          := T.Id_Fac;
     StProc.ParamByName('id_kat_stud').AsInt64       := T.id_Kat;
     StProc.ParamByName('id_spec').AsInt64           := T.Id_Spec;
     StProc.ParamByName('id_form_stud').AsInt64      := T.Id_FormStud;
     StProc.ParamByName('id_national').AsInt64       := T.id_nac;
     StProc.ParamByName('term_stud').AsFloat         := T.SrokStudText.EditValue;
     StProc.ParamByName('kurs').Asinteger            := T.Kurs_Edit.EditValue;

     if T.Beg_second_part.Checked
      then StProc.ParamByName('beg_second_part').Asinteger := 1
      else StProc.ParamByName('beg_second_part').Asinteger := 0;

     StProc.ParamByName('id_valute').AsInt64 := T.Id_valute;

     StProc.ExecProc;

     id := StProc.ParamByName('id_price_param_out').AsInt64;

     T.MemoryDataSumm.First;
     for i:=0 to T.MemoryDataSumm.RecordCount-1 do
      Begin
       StProc.StoredProcName:='CN_DT_PRICE_SUMMA_INSERT';
       StProc.Prepare;
       StProc.ParamByName('id_price_param').AsInt64 :=id;
       StProc.ParamByName('Date_Beg').AsDate :=T.MemoryDataSumm['mrDate_beg'];
       StProc.ParamByName('Date_End').AsDate :=T.MemoryDataSumm['mrDate_end'];
       StProc.ParamByName('year_stud').AsInteger :=T.MemoryDataSumm['mrYear'];
       StProc.ParamByName('term_stud').AsInt64 :=T.MemoryDataSumm['mrMonth'];
       StProc.ParamByName('summa').AsFloat :=T.MemoryDataSumm['mrSumm'];
       StProc.ExecProc;
       id_summ := StProc.ParamByName('id_price_summa').AsInt64;
       T.MemoryDataSumm.Next;
      End;

     T.MemoryDataSmet.First;
     for i:=0 to T.MemoryDataSmet.RecordCount-1 do
      Begin
       StProc.StoredProcName:='CN_DT_PRICE_SMET_INSERT';
       StProc.Prepare;
       StProc.ParamByName('id_price_param').AsInt64 :=id;
       StProc.ParamByName('id_sm').AsInteger :=T.MemoryDataSmet['mrid_smet'];
       StProc.ParamByName('id_rz').AsInt64 :=T.MemoryDataSmet['mrid_Razdel'];
       StProc.ParamByName('id_st').AsInt64 :=T.MemoryDataSmet['mrid_Stat'];
       StProc.ParamByName('id_kekv').AsFloat :=T.MemoryDataSmet['mrid_Kekv'];
       StProc.ParamByName('procent').AsInteger      := T.MemoryDataSmet['mrProcent'];
       StProc.ExecProc;
       T.MemoryDataSmet.Next;
      End;
     try
      WriteTransaction.Commit;
      stproc.Close;
      except
       WriteTransaction.Rollback;
       StProc.Close;
       raise;
     end;
     act_RefreshExecute(self);
     DataSetGrid.Locate('id_national;id_facul;id_spec;id_form_stud;id_kat_stud;term_stud', vararrayof([T.id_nac,T.id_fac,T.id_spec,T.id_formstud,T.id_kat,T.SrokStudText.EditValue]), []);
     i := 0;
     i := cxGridDBTableView3.DataController.FocusedRowIndex;
     cxGridDBTableView3.ViewData.Records[i].Expand(True);
   End;
  T.Free;
end;

procedure TfrmPriceReestr.act_RefreshExecute(Sender: TObject);
begin
  DataSetGrid.Close;
  DataSetGrid.Open;
end;

procedure TfrmPriceReestr.act_DelExecute(Sender: TObject);
Var
  i : byte;
  id_price, id_facul : int64;
begin
  if DataSetGrid.RecordCount = 0 then exit;

  If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/Cn_Price','Del') <> 0
    then Begin
        messagebox(handle,
        pchar(cn_NotHaveRights[PLanguageIndex]
        +#13+ cn_GoToAdmin[PLanguageIndex]),
        pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
     End;

  i:= cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  id_facul:=DataSetGrid['ID_FACUL'];
  id_Price:=DataSetGrid['ID_PRICE_PARAM'];
  WriteTransaction.StartTransaction;
  StProc.StoredProcName := 'CN_DT_PRICE_PARAM_DELETE';
  StProc.Prepare;
  StProc.ParamByName('ID_PRICE_PARAM').AsInt64 := DataSetGrid['id_price_param'];
  StProc.ExecProc;
  try
   WriteTransaction.Commit;
   except
    WriteTransaction.Rollback;
  end;
  
  act_RefreshExecute(self);
  if DataSetGrid.Locate('id_facul', id_facul, [])
   then
    Begin
     i := 0;
     i := cxGridDBTableView3.DataController.FocusedRowIndex - 1;
     if i<0 then i := 0;
     cxGridDBTableView3.ViewData.Records[i].Expand(True);
    End; 
end;

procedure TfrmPriceReestr.act_AddExecute(Sender: TObject);
var
  T:TfrmGetRec;
  id:Int64;
  i:integer;
begin
  If not Is_Admin then
  If fibCheckPermission('/ROOT/Contracts/cn_price','ADD') <> 0 then
   begin
    messagebox(handle,
    pchar(cn_NotHaveRights[PLanguageIndex]
    +#13+ cn_GoToAdmin[PLanguageIndex]),
    pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    exit;
   end;

  T:=TfrmGetRec.Create(self,-1,aHandle);
  T.id_price_ver := Id_price_verssion;
  T.is_add:=true;
  T.ShowModal;
  If T.ModalResult=mrYes then
   begin
    WriteTransaction.StartTransaction;
    StProc.StoredProcName:='CN_DT_PRICE_PARAM_INSERT' ;
    StProc.Prepare;
    StProc.ParamByName('id_price_param_in').AsInt64 := -1;
    StProc.ParamByName('id_price_verssion').AsInt64 := Id_price_verssion;
    StProc.ParamByName('id_facul').AsInt64          := T.Id_Fac;
    StProc.ParamByName('id_kat_stud').AsInt64       := T.id_Kat;
    StProc.ParamByName('id_spec').AsInt64           := T.Id_Spec;
    StProc.ParamByName('id_form_stud').AsInt64      := T.Id_FormStud;
    StProc.ParamByName('id_national').AsInt64       := T.id_nac;
    StProc.ParamByName('term_stud').AsFloat         := T.SrokStudText.EditValue;
    StProc.ParamByName('kurs').Asinteger            := T.Kurs_Edit.EditValue;

    if T.Beg_second_part.Checked
     then StProc.ParamByName('beg_second_part').Asinteger := 1
     else StProc.ParamByName('beg_second_part').Asinteger := 0;

    StProc.ParamByName('id_valute').AsInt64 := T.Id_valute;

    StProc.ExecProc;

    id := StProc.ParamByName('id_price_param_out').AsInt64;

    T.MemoryDataSumm.First;
    for i:=0 to T.MemoryDataSumm.RecordCount-1 do
     Begin
      StProc.StoredProcName:='CN_DT_PRICE_SUMMA_INSERT';
      StProc.Prepare;
      StProc.ParamByName('id_price_param').AsInt64 :=id;
      StProc.ParamByName('Date_Beg').AsDate :=T.MemoryDataSumm['mrDate_beg'];
      StProc.ParamByName('Date_End').AsDate :=T.MemoryDataSumm['mrDate_end'];
      StProc.ParamByName('year_stud').AsInteger :=T.MemoryDataSumm['mrYear'];
      StProc.ParamByName('term_stud').AsInt64 :=T.MemoryDataSumm['mrMonth'];
      StProc.ParamByName('summa').AsFloat :=T.MemoryDataSumm['mrSumm'];
      StProc.ExecProc;
      T.MemoryDataSumm.Next;
     End;
     
    T.MemoryDataSmet.First;
    for i:=0 to T.MemoryDataSmet.RecordCount-1 do
     Begin
      StProc.StoredProcName:='CN_DT_PRICE_SMET_INSERT';
      StProc.Prepare;
      StProc.ParamByName('id_price_param').AsInt64 := id;
      StProc.ParamByName('id_sm').AsInteger        := T.MemoryDataSmet['mrid_smet'];
      StProc.ParamByName('id_rz').AsInt64          := T.MemoryDataSmet['mrid_Razdel'];
      StProc.ParamByName('id_st').AsInt64          := T.MemoryDataSmet['mrid_Stat'];
      StProc.ParamByName('id_kekv').AsFloat        := T.MemoryDataSmet['mrid_Kekv'];
      StProc.ParamByName('procent').AsInteger      := T.MemoryDataSmet['mrProcent'];
      StProc.ExecProc;
      T.MemoryDataSmet.Next;
     End;
    try
     WriteTransaction.Commit;
     except
      WriteTransaction.Rollback;
    end;

     act_RefreshExecute(self);
     DataSetGrid.Locate('id_facul;id_spec;id_form_stud;id_kat_stud;term_stud', vararrayof([T.id_fac,T.id_spec,T.id_formstud,T.id_kat,T.SrokStudText.EditValue]), []);
     i := 0;
     i := cxGridDBTableView3.DataController.FocusedRowIndex;
     cxGridDBTableView3.ViewData.Records[i].Expand(True);
   End;
  T.Free;
end;

procedure TfrmPriceReestr.act_exitExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmPriceReestr.act_selectExecute(Sender: TObject);
begin
  If DataSetGrid.RecordCount = 0 then Exit;

  DataSet_report.Close;
  DataSet_report.SQLs.SelectSQL.Text:='Select * from cn_price_select_for_print(:id_price_ver) where id_price_param=:id_price_param';
  DataSet_report.ParamByName('ID_PRICE_PARAM').AsInt64:=DataSetGrid['ID_PRICE_PARAM'];
  DataSet_report.ParamByName('ID_PRICE_VER').AsInt64:=DataSetGrid['ID_PRICES'];
  DataSet_report.Open;

  {Идентификаторы параметров обучения}
  Res:=VarArrayOf([DataSetGrid.FieldByName('ID_FACUL').Value,
                   DataSetGrid.FieldByName('ID_SPEC').Value,
                   DataSetGrid.FieldByName('ID_national').Value,
                   DataSetGrid.FieldByName('ID_form_stud').Value,
                   DataSetGrid.FieldByName('ID_kat_stud').Value,
                   DataSetGrid.FieldByName('year_stud').Value,
  {Названия параметров обучения}
                   DataSetGrid.FieldByName('name_facul').Value,
                   DataSetGrid.FieldByName('name_spec').Value,
                   DataSetGrid.FieldByName('name_national').Value,
                   DataSetGrid.FieldByName('name_form_stud').Value,
                   DataSetGrid.FieldByName('name_kat_stud').Value,
                   DataSetGrid.FieldByName('year_stud').Value,
   {Сумма по прейскуранту}
                   DataSetGrid.FieldByName('SUMMA').Value,
                   DataSet_report.FieldByName('SUM1').value,
                   DataSet_report.FieldByName('SUM2').value,
                   DataSet_report.FieldByName('SUM3').value,
                   DataSet_report.FieldByName('SUM4').value,
                   DataSet_report.FieldByName('SUM5').value,
                   DataSet_report.FieldByName('term_stud').value,
                   DataSet_report.FieldByName('ID_VALUTE').value]);

  ModalResult:=mrYes;
end;

procedure TfrmPriceReestr.FormCreate(Sender: TObject);
begin
  PLanguageIndex          := cn_Common_Funcs.cnLanguageIndex;
  Caption                 := cn_PreyskurantWork[PLanguageIndex];
  AddButton.Caption       := cn_InsertBtn_Caption[PLanguageIndex];
  AddButton.Hint          := cn_InsertBtn_Caption[PLanguageIndex];
  EditButton.Caption      := cn_EditBtn_Caption[PLanguageIndex];
  EditButton.Hint         := cn_EditBtn_Caption[PLanguageIndex];
  RefreshButton.Caption   := cn_RefreshBtn_Caption[PLanguageIndex];
  RefreshButton.Hint      := cn_RefreshBtn_Caption[PLanguageIndex];
  DeleteButton.Caption    := cn_DeleteBtn_Caption[PLanguageIndex];
  DeleteButton.Hint       := cn_DeleteBtn_Caption[PLanguageIndex];
  SelectButton.Caption    := cn_SelectBtn_Caption[PLanguageIndex];
  SelectButton.Hint       := cn_SelectBtn_Caption[PLanguageIndex];
  ExitButton.Caption      := cn_ExitBtn_Caption[PLanguageIndex];
  ExitButton.Hint         := cn_ExitBtn_Caption[PLanguageIndex];

  Smet_button.Caption     := cn_Smeta[PLanguageIndex];
  Smet_button.Hint        := cn_Smeta[PLanguageIndex];

  Facult_tabel1.Caption        := cn_footer_Faculty[PLanguageIndex];
  Spec_table1.Caption          := cn_footer_Spec[PLanguageIndex];
  Date_beg_table1.Caption      := cn_grid_Date_Beg[PLanguageIndex];
  nac_table1.Caption           := cn_Gragdanstvo[PLanguageIndex];
  form_table1.Caption          := cn_footer_FormStudy[PLanguageIndex];
  kat_table1.caption           := cn_footer_CategoryStudy[PLanguageIndex];
  year_table1.caption          := cn_footer_Kurs[PLanguageIndex];
  summa_table1.Caption         := cn_Summa_Column[PLanguageIndex];
  Date_beg_stud_table1.caption := cn_grid_Date_Beg[PLanguageIndex];
  Date_end_stud_table1.caption := cn_grid_Date_End[PLanguageIndex];
  term_stud_table1.Caption     := cn_srok_study[PLanguageIndex];
  smeta_table.Caption          := cn_Smeta[PLanguageIndex];

  act_add.Caption         := cn_InsertBtn_Caption[PLanguageIndex];
  addbyparam_act.Caption  := cn_add_new_summ_by_param[PLanguageIndex];

  AddPop.Caption         := cn_InsertBtn_Caption[PLanguageIndex];
  AddPop.Hint            := cn_InsertBtn_Caption[PLanguageIndex];
  Editpop.Caption        := cn_EditBtn_Caption[PLanguageIndex];
  Editpop.Hint           := cn_EditBtn_Caption[PLanguageIndex];
  Refreshpop.Caption     := cn_RefreshBtn_Caption[PLanguageIndex];
  Refreshpop.Hint        := cn_RefreshBtn_Caption[PLanguageIndex];
  Deletepop.Caption      := cn_DeleteBtn_Caption[PLanguageIndex];
  Deletepop.Hint         := cn_DeleteBtn_Caption[PLanguageIndex];
  Selectpop.Caption      := cn_SelectBtn_Caption[PLanguageIndex];
  Selectpop.Hint         := cn_SelectBtn_Caption[PLanguageIndex];
  Exitpop.Caption        := cn_ExitBtn_Caption[PLanguageIndex];
  Exitpop.Hint           := cn_ExitBtn_Caption[PLanguageIndex];
  addbyparampop.Caption  := cn_add_new_summ_by_param[PLanguageIndex];
  Print_Button.Caption    := cn_Print_Caption[PLanguageIndex];
  Print_Button.Hint       := cn_Print_Caption[PLanguageIndex];

  IsDebugMode:=false;
end;

procedure TfrmPriceReestr.smet_actExecute(Sender: TObject);
Var
  T:TfrmGetValueSmet_ex;
  id_price_param:int64;
begin
  if DataSetGrid.RecordCount=0 then exit;
  
  id_price_param:=DataSetGrid['ID_PRICE_PARAM'];
  T:=TfrmGetValueSmet_ex.create(self,aHandle,id_price_param);
  T.ShowModal;
  T.Free;
end;

procedure TfrmPriceReestr.addbyparam_actExecute(Sender: TObject);
var
  T:TfrmGetRec;
  i:integer;
  Id, Id_Price_Param:Int64;
begin
  if cxGridDBTableView3.DataController.RowCount=0 then exit;

  If not Is_Admin then
  If fibCheckPermission('/ROOT/Contracts/cn_price','ADD') <> 0 then
    begin
        messagebox(handle,
        pchar(cn_NotHaveRights[PLanguageIndex]
        +#13+ cn_GoToAdmin[PLanguageIndex]),
        pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
    end;

  Id_Price_Param:=DataSetGrid['ID_PRICE_PARAM'];
  T:=TfrmGetRec.Create(self, Id_Price_Param, aHandle);

  T.id_price_ver := Id_price_verssion; //DataSetGrid['id_prices'];
  T.Id_Fac       := DataSetGrid['id_facul'];
  T.Id_Spec      := DataSetGrid['id_spec'];
  T.Id_FormStud  := DataSetGrid['id_form_stud'];
  T.id_nac       := DataSetGrid['id_national'];
  T.id_Kat       := DataSetGrid['id_kat_stud'];

  if DataSetGrid['id_valute'] <> null
   then T.id_valute := DataSetGrid['id_valute']
   else T.id_valute := -1;

  T.is_add := True;

  T.ShowModal;

  If T.ModalResult = mrYes then
   begin
    WriteTransaction.StartTransaction;
    StProc.StoredProcName:='CN_DT_PRICE_PARAM_INSERT' ;
    StProc.Prepare;
    StProc.ParamByName('id_price_param_in').AsInt64 :=-1;
    StProc.ParamByName('id_price_verssion').AsInt64 :=Id_price_verssion;
    StProc.ParamByName('id_facul').AsInt64 :=T.Id_Fac;
    StProc.ParamByName('id_kat_stud').AsInt64 :=T.id_Kat;
    StProc.ParamByName('id_spec').AsInt64 :=T.Id_Spec;
    StProc.ParamByName('id_form_stud').AsInt64 :=T.Id_FormStud;
    StProc.ParamByName('id_national').AsInt64 :=T.id_nac;
    StProc.ParamByName('term_stud').AsFloat :=T.SrokStudText.EditValue;
    StProc.ParamByName('kurs').Asinteger :=T.Kurs_Edit.EditValue;

    if T.Beg_second_part.Checked
     then StProc.ParamByName('beg_second_part').Asinteger := 1
     else StProc.ParamByName('beg_second_part').Asinteger := 0;

    StProc.ParamByName('id_valute').AsInt64 := T.Id_valute;

    StProc.ExecProc;
    id := StProc.ParamByName('id_price_param_out').AsInt64;

    T.MemoryDataSumm.First;
    for i:=0 to T.MemoryDataSumm.RecordCount-1 do
     Begin
      StProc.StoredProcName:='CN_DT_PRICE_SUMMA_INSERT';
      StProc.Prepare;
      StProc.ParamByName('id_price_param').AsInt64 :=id;
      StProc.ParamByName('Date_Beg').AsDate :=T.MemoryDataSumm['mrDate_beg'];
      StProc.ParamByName('Date_End').AsDate :=T.MemoryDataSumm['mrDate_end'];
      StProc.ParamByName('year_stud').AsInteger :=T.MemoryDataSumm['mrYear'];
      StProc.ParamByName('term_stud').AsInt64 :=T.MemoryDataSumm['mrMonth'];
      StProc.ParamByName('summa').AsFloat :=T.MemoryDataSumm['mrSumm'];
      StProc.ExecProc;
      T.MemoryDataSumm.Next;
     End;
    if T.MemoryDataSmet.RecordCount<>0 then
     Begin
      T.MemoryDataSmet.First;
      for i:=0 to T.MemoryDataSmet.RecordCount-1 do
       Begin
        StProc.StoredProcName:='CN_DT_PRICE_SMET_INSERT';
        StProc.Prepare;
        StProc.ParamByName('id_price_param').AsInt64 :=id;
        StProc.ParamByName('id_sm').AsInteger :=T.MemoryDataSmet['mrid_smet'];
        StProc.ParamByName('id_rz').AsInt64 :=T.MemoryDataSmet['mrid_Razdel'];
        StProc.ParamByName('id_st').AsInt64 :=T.MemoryDataSmet['mrid_Stat'];
        StProc.ParamByName('id_kekv').AsFloat :=T.MemoryDataSmet['mrid_Kekv'];
        StProc.ParamByName('procent').AsInteger      := T.MemoryDataSmet['mrProcent'];
        StProc.ExecProc;
        T.MemoryDataSmet.Next;
       End;
     End;
    try
     WriteTransaction.Commit;
     except
      WriteTransaction.Rollback;
    end;

    act_RefreshExecute(self);
     DataSetGrid.Locate('id_facul;id_spec;id_form_stud;id_kat_stud;term_stud', vararrayof([T.id_fac,T.id_spec,T.id_formstud,T.id_kat,T.SrokStudText.EditValue]), []);
     i := 0;
     i := cxGridDBTableView3.DataController.FocusedRowIndex;
     cxGridDBTableView3.ViewData.Records[i].Expand(True);
   End;
  T.Free;
end;

procedure TfrmPriceReestr.print_actExecute(Sender: TObject);
begin
  if DataSetGrid.RecordCount = 0 then Exit;

   If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/Cn_Price','Print') <> 0
    then Begin
        messagebox(handle,
        pchar(cn_NotHaveRights[PLanguageIndex]
        +#13+ cn_GoToAdmin[PLanguageIndex]),
        pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
     End;

  Screen.Cursor:=crHourGlass;

  DataSet_report.Close;
  DataSet_report.SQLs.SelectSQL.Text:='Select * from cn_price_select_for_print(:id_price_ver) where id_facul=:id_facul ORDER BY name_nationality, name_faculty, name_speciality, name_kategory, name_form_study';
  DataSet_report.ParamByName('ID_FACUL').AsInt64:=DataSetGrid['ID_FACUL'];
  DataSet_report.ParamByName('ID_PRICE_VER').AsInt64:=Id_price_verssion;
  DataSet_report.Open;

  Price_Report.Clear;
  Price_Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\cn_price_ex.fr3');
  Price_Report.Variables.Clear;

  Price_Report.PrepareReport(True);
  if IsDebugMode then Price_Report.DesignReport
                 else Price_Report.ShowReport;

  Screen.Cursor:=crDefault;  
end;

procedure TfrmPriceReestr.debug_actExecute(Sender: TObject);
begin
  if not IsDebugMode then
                      Begin
                       Caption:=Caption+' *debug';
                       IsDebugMode:=true;
                      End
                     Else
                      Begin
                       IsDebugMode:=false;
                       Caption := cn_PreyskurantWork[PLanguageIndex];
                      End;
end;

procedure TfrmPriceReestr.cxGridDBTableView3DblClick(Sender: TObject);
begin
  if is_select then act_selectExecute(Self);
end;

procedure TfrmPriceReestr.dxBarLargeButton2Click(Sender: TObject);
begin
  if DataSetGrid.RecordCount = 0 then Exit;

   If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/Cn_Price','Print') <> 0
    then Begin
        messagebox(handle,
        pchar(cn_NotHaveRights[PLanguageIndex]
        +#13+ cn_GoToAdmin[PLanguageIndex]),
        pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
     End;

  Screen.Cursor:=crHourGlass;

  DataSet_report.Close;
  DataSet_report.SQLs.SelectSQL.Text:='Select * from cn_price_select_for_print(:id_price_ver) where id_facul=:id_facul ORDER BY name_nationality, name_faculty, name_speciality, name_kategory, name_form_study';
  DataSet_report.ParamByName('ID_FACUL').AsInt64:=DataSetGrid['ID_FACUL'];
  DataSet_report.ParamByName('ID_PRICE_VER').AsInt64:=Id_price_verssion;
  DataSet_report.Open;

  Price_Report.Clear;
  Price_Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\cn_price_ex_smet.fr3');
  Price_Report.Variables.Clear;

  Price_Report.PrepareReport(True);
  if IsDebugMode then Price_Report.DesignReport
                 else Price_Report.ShowReport;

  Screen.Cursor:=crDefault;  
end;

End.
