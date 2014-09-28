unit Kowtoris;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxLookAndFeelPainters,
  cxMemo, StdCtrls, cxButtons, ImgList, ComCtrls, ToolWin, cxDropDownEdit,
  cxCalendar, ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxContainer, cxMaskEdit, Mask, ToolEdit,
  CurrEdit, RxMemDS, FIBDataSet, pFIBDataSet, cxCurrencyEdit, FIBDatabase,
  pFIBDatabase,iBase, Shablon2, ActnList, Menus,
  cxTL, dxBar, dxBarExtItems, LoadDogManedger, DogLoaderUnit, dogLangPackUnit2,
  Buttons, dxStatusBar;

type
  TfrmKowtoris = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    RxMemoryData_smet: TRxMemoryData;
    DataSource: TDataSource;
    pFIBDataSet_nds_procent: TpFIBDataSet;
    pFIBDataSet_smeta: TpFIBDataSet;
    pFIBDataSet_razd_st: TpFIBDataSet;
    pFIBDataSet_get_dannie: TpFIBDataSet;
    pFIBDataSet_nomer: TpFIBDataSet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    LargeImages: TImageList;
    pFIBDataSet_smet_info: TpFIBDataSet;
    pFIBDataSet_kekv: TpFIBDataSet;
    Label4: TLabel;
    cxMaskEdit_n_dog: TcxMaskEdit;
    Label3: TLabel;
    cxDateEdit_dog: TcxDateEdit;
    Label7: TLabel;
    cxTextEdit_reg_nomer: TcxTextEdit;
    Panel4: TPanel;
    dxBarLargeButton_add: TSpeedButton;
    dxBarLargeButton_del: TSpeedButton;
    GroupBox6: TGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel2: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label25: TLabel;
    Label13: TLabel;
    CurrencyEdit_sum_po_smet: TCurrencyEdit;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    CurrencyEdit_nds: TCurrencyEdit;
    Label17: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    CurrencyEdit_summa: TCurrencyEdit;
    CurrencyEdit_sum_pod_smet: TCurrencyEdit;
    CurrencyEdit_sum_vipol: TCurrencyEdit;
    CurrencyEdit_sum_opl: TCurrencyEdit;
    cxButton_predopl: TcxButton;
    Label6: TLabel;
    CurrencyEdit_predopl: TCurrencyEdit;
    Label27: TLabel;
    cxMemo_dog_note: TcxMemo;
    Label2: TLabel;
    cxTextEdit_postav: TcxTextEdit;
    cxButton_cancel: TcxButton;
    cxButton_ok: TcxButton;
    Bevel1: TBevel;
    ActionList1: TActionList;
    ins: TAction;
    dxStatusBar1: TdxStatusBar;
    procedure cxButton_cancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cxDateEdit_dogPropertiesChange(Sender: TObject);
    procedure RxMemoryData_smetAfterDelete(DataSet: TDataSet);
    procedure RxMemoryData_smetAfterPost(DataSet: TDataSet);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxButton_okClick(Sender: TObject);
    procedure RxMemoryData_smetAfterScroll(DataSet: TDataSet);
    procedure CurrencyEdit_sum_po_smetChange(Sender: TObject);
    procedure cxMaskEdit_n_dogKeyPress(Sender: TObject; var Key: Char);
    procedure addExecute(Sender: TObject);
    procedure delExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure cxButton_predoplClick(Sender: TObject);
    procedure dxBarLargeButton_addClick(Sender: TObject);
    procedure dxBarLargeButton_delClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Label14Click(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure Label14MouseLeave(Sender: TObject);
    procedure Label14MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label15MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label15MouseLeave(Sender: TObject);
    procedure insExecute(Sender: TObject);
  private
    { Private declarations }
  public

  //записывает данные в rx: Номер, основание, дата
  function RedkowtorisOsnDannie(nomer_k: Variant; date_k: TDate; note_k: String; nds_k: Variant): Variant;

  function ProverkaSum(p_summa_dog, p_summa_smet_pod_dog: Variant; p_name_customer: String): Variant;

  function RedKowtoris(id_smeta, id_razd, id_stat, summa, id_rx, id_kekv :Variant): Variant;

  function GetSmeta (p_smeta,p_razdel,p_stat, p_kekv:String; sum_smet:Variant;
  p_id_smet,p_kod_smet,p_nomer_razd,p_nomer_stat, p_nomer_kekv:Integer; id_smet, id_razd, id_stat, id_kekv: Variant):Variant;

  procedure Summa();
  procedure SumNds();
    { Public declarations }

  constructor Create(Aowner:TComponent;DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; Pr_vizova: String; Id_dog, kod_dog: Variant;
                     Priznak_vizova_sh2: String; id_rate_acc, id_rate_acc_native: Variant);overload;
  end;

var
  frmKowtoris: TfrmKowtoris;
  sum_po_smet, nds_procent, sum_nds: Variant;
//Переменные для функции//
  nomer_kowtoris: String;
  date_kowtoris: TDate;
  note_kowtoris: String;
  p_sum_vipol, p_sum_opl, summa_nds: Variant;
//
  summa_dog, sum_pod_dog, sum_smet_kowtoris: Variant;  //Сумма по сметам для передачи в Add
  name_cust: String;
  Priznak_vizova, vizov_sh2: String;
  id_dog_dt_document, kod_dog_document: Variant;

 { данные для передачи в предоплату
  //хендел базы данных}
  DataBaseH: TISC_DB_HANDLE;
  id_rate_account: Variant;
  id_rate_account_native: Variant;
  sum_predopl: Double;
  id_dog_kowt: Variant;

implementation
uses
  Add_smet_sh2;

{$R *.dfm}

constructor TfrmKowtoris.Create(Aowner:TComponent;DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; Pr_vizova: String; Id_dog, kod_dog: Variant;
                                Priznak_vizova_sh2: String; id_rate_acc, id_rate_acc_native: Variant);
var
  i: Integer;
begin
  if Pr_vizova='red' then
  begin
    inherited Create (Aowner);
    TfrmShablon2(Self.Owner).pFIBDatabase.Handle := DBHANDLE;
    DataBaseH := DBHANDLE;

    pFIBDataSet_kekv.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
    pFIBDataSet_kekv.Transaction := TfrmShablon2(Self.Owner).pFIBTransactionRead;

    id_rate_account := id_rate_acc;
    id_rate_account_native := id_rate_acc_native;
    id_dog_kowt := id_dog;

    pFIBDataSet_nds_procent.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
    pFIBDataSet_nds_procent.Transaction := TfrmShablon2(Self.Owner).pFIBTransactionRead;
    pFIBDataSet_nds_procent.Active := false;
    pFIBDataSet_nds_procent.Active := true;

    cxDateEdit_dog.Date := Date;
    Priznak_vizova := Pr_vizova;
    id_dog_dt_document := Id_dog;
    kod_dog_document := kod_dog;

    pFIBDataSet_get_dannie.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
    pFIBDataSet_get_dannie.Transaction := TfrmShablon2(Self.Owner).pFIBTransactionRead;
    pFIBDataSet_get_dannie.Active := false;
    pFIBDataSet_get_dannie.ParamByName('param_dog').Value := Id_dog;
    pFIBDataSet_get_dannie.Active := true;
    cxMaskEdit_n_dog.Text := pFIBDataSet_get_dannie.FieldByName('n_dog').AsString;
    cxDateEdit_dog.Date := pFIBDataSet_get_dannie.FieldByName('d_dog').AsDateTime;
    cxMemo_dog_note.Text := pFIBDataSet_get_dannie.FieldByName('dog_note').AsString;
    CurrencyEdit_sum_vipol.Text:=pFIBDataSet_get_dannie.FieldByName('sum_fulfil').AsString;
    CurrencyEdit_sum_opl.Text := pFIBDataSet_get_dannie.FieldByName('sum_pay').AsString;
    cxTextEdit_reg_nomer.Text := pFIBDataSet_get_dannie.FieldByName('REGEST_NUM').AsString;

    cxMaskEdit_n_dog.Properties.ReadOnly := true;


/////////////////////////Данные по смете/////////////////////////////////
      pFIBDataSet_smet_info.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
      pFIBDataSet_smet_info.Transaction := TfrmShablon2(Self.Owner).pFIBTransactionRead;
      pFIBDataSet_smet_info.Active := false;
      pFIBDataSet_smet_info.Active := true;

      pFIBDataSet_smeta.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
      pFIBDataSet_smeta.Transaction := TfrmShablon2(Self.Owner).pFIBTransactionRead;
      pFIBDataSet_razd_st.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
      pFIBDataSet_razd_st.Transaction := TfrmShablon2(Self.Owner).pFIBTransactionRead;

  end
  else
  if Pr_vizova = 'add' then
  begin
    inherited Create (Aowner);
    TfrmShablon2(Self.Owner).pFIBDatabase.Handle := DBHANDLE;
    pFIBDataSet_nds_procent.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
    pFIBDataSet_nds_procent.Transaction := TfrmShablon2(Self.Owner).pFIBTransactionRead;
    pFIBDataSet_nds_procent.Active := false;
    pFIBDataSet_nds_procent.Active := true;

    pFIBDataSet_get_dannie.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
    pFIBDataSet_get_dannie.Transaction := TfrmShablon2(Self.Owner).pFIBTransactionRead;
    pFIBDataSet_get_dannie.Active := false;
    pFIBDataSet_get_dannie.Active := true;

    cxDateEdit_dog.Date := Date;
    Priznak_vizova := Pr_vizova;

    kod_dog_document := kod_dog;
  end

///////////////Просмотр////////////////////
  else
  if Pr_vizova = 'prosmotr'then
  begin
    inherited Create (Aowner);
    TfrmShablon2(Self.Owner).pFIBDatabase.Handle := DBHANDLE;

    pFIBDataSet_kekv.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
    pFIBDataSet_kekv.Transaction := TfrmShablon2(Self.Owner).pFIBTransactionRead;

    pFIBDataSet_nds_procent.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
    pFIBDataSet_nds_procent.Transaction := TfrmShablon2(Self.Owner).pFIBTransactionRead;
    pFIBDataSet_nds_procent.Active := false;
    pFIBDataSet_nds_procent.Active := true;
    cxDateEdit_dog.Date := Date;
    Priznak_vizova := Pr_vizova;
    id_dog_dt_document := Id_dog;
    kod_dog_document := kod_dog;

    pFIBDataSet_get_dannie.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
    pFIBDataSet_get_dannie.Transaction := TfrmShablon2(Self.Owner).pFIBTransactionRead;
    pFIBDataSet_get_dannie.Active := false;
    pFIBDataSet_get_dannie.ParamByName('param_dog').Value := Id_dog;
    pFIBDataSet_get_dannie.Active := true;
    cxMaskEdit_n_dog.Text := pFIBDataSet_get_dannie.FieldByName('n_dog').AsString;
    cxDateEdit_dog.Date := pFIBDataSet_get_dannie.FieldByName('d_dog').AsDateTime;
    cxMemo_dog_note.Text := pFIBDataSet_get_dannie.FieldByName('dog_note').AsString;
    cxTextEdit_reg_nomer.Text := pFIBDataSet_get_dannie.FieldByName('REGEST_NUM').AsString;

    CurrencyEdit_sum_vipol.Text:=pFIBDataSet_get_dannie.FieldByName('sum_fulfil').AsString;
    CurrencyEdit_sum_opl.Text:=pFIBDataSet_get_dannie.FieldByName('sum_pay').AsVariant;

/////////////////////////Данные по смете/////////////////////////////////
      pFIBDataSet_smet_info.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
      pFIBDataSet_smet_info.Transaction := TfrmShablon2(Self.Owner).pFIBTransactionRead;

      pFIBDataSet_smet_info.Active := false;
      pFIBDataSet_smet_info.Active := true;

      pFIBDataSet_smeta.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
      pFIBDataSet_smeta.Transaction := TfrmShablon2(Self.Owner).pFIBTransactionRead;
      pFIBDataSet_razd_st.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
      pFIBDataSet_razd_st.Transaction := TfrmShablon2(Self.Owner).pFIBTransactionRead;

    cxButton_predopl.Visible := false;
    dxBarLargeButton_add.Enabled := false;
    dxBarLargeButton_del.Enabled := false;
    cxMaskEdit_n_dog.Properties.ReadOnly := true;
    cxDateEdit_dog.Properties.ReadOnly := true;
    cxMemo_dog_note.Properties.ReadOnly := true;
  end;
  //если добавление шаблона 2, то все записывается в rx, и в базу пишем только
  //при добавлении всего шаблона. Если редактирование, то кошторис пишем сразу в базу.
  vizov_sh2 := priznak_vizova_sh2;
end;

procedure TfrmKowtoris.cxButton_cancelClick(Sender: TObject);
begin
  Close;
end;

function TfrmKowtoris.GetSmeta(p_smeta,p_razdel,p_stat, p_kekv:String; sum_smet:Variant;
p_id_smet,p_kod_smet,p_nomer_razd,p_nomer_stat, p_nomer_kekv:Integer; id_smet, id_razd, id_stat, id_kekv: Variant):Variant;
begin

  if VarType(sum_pod_dog) = varEmpty then
    begin
      sum_pod_dog := 0;
    end;

  RxMemoryData_smet.Open;
  RxMemoryData_smet.Insert;
  RxMemoryData_smet.FieldByName('id_smet').Value   := id_smet;
  RxMemoryData_smet.FieldByName('id_razd').Value   := id_razd;
  RxMemoryData_smet.FieldByName('id_stat').Value   := id_stat;
  RxMemoryData_smet.FieldByName('id_kekv').Value   := id_kekv;
  RxMemoryData_smet.FieldByName('sum_smet').Value  := sum_smet;
  RxMemoryData_smet.FieldByName('name_smet').Value := p_smeta;
  RxMemoryData_smet.FieldByName('name_razd').Value := p_razdel;
  RxMemoryData_smet.FieldByName('name_stat').Value := p_stat;
  RxMemoryData_smet.FieldByName('name_kekv').Value := p_kekv;
  RxMemoryData_smet.FieldByName('kod_smety').Value := p_kod_smet;
  RxMemoryData_smet.FieldByName('n_razd').Value    := p_nomer_razd;
  RxMemoryData_smet.FieldByName('n_stat').Value    := p_nomer_stat;
  RxMemoryData_smet.FieldByName('kod_kekv').Value  := p_nomer_kekv;
  RxMemoryData_smet.FieldByName('flag_del').Value  := 0;
  RxMemoryData_smet.FieldByName('id_rx_smet').Value:= 0;
  CurrencyEdit_sum_pod_smet.Text := RxMemoryData_smet.FieldByName('sum_smet').AsVariant+VarToStr(sum_pod_dog);
  sum_pod_dog := RxMemoryData_smet.FieldByName('sum_smet').AsVariant+VarToStr(sum_pod_dog);
  RxMemoryData_smet.Post;
end;

/////////////////////////////////////
function TfrmKowtoris.ProverkaSum(p_summa_dog, p_summa_smet_pod_dog: Variant; p_name_customer: String): Variant;
begin
  name_cust := p_name_customer;
  cxTextEdit_postav.Text := p_name_customer;

  summa_dog := p_summa_dog;
  if summa_dog < 0 then summa_dog := 0;
  CurrencyEdit_summa.Text := VarToStr(summa_dog);

  sum_pod_dog := p_summa_smet_pod_dog;
  if sum_pod_dog < 0 then
    begin
      sum_pod_dog := 0;
    end;

  CurrencyEdit_sum_pod_smet.Text := VarToStr(sum_pod_dog);
end;
/////////////////////////////////////

function TfrmKowtoris.RedKowtoris(id_smeta, id_razd, id_stat, summa, id_rx, id_kekv :Variant): Variant;
begin
  pFIBDataSet_smeta.Active := false;
  pFIBDataSet_smeta.ParamByName('id_smeta').Value := id_smeta;
  pFIBDataSet_smeta.Active := true;

  RxMemoryData_smet.Open;
  RxMemoryData_smet.Insert;

  RxMemoryData_smet.FieldByName('id_smet').Value := id_smeta;
  RxMemoryData_smet.FieldByName('id_razd').Value := id_razd;
  RxMemoryData_smet.FieldByName('id_stat').Value := id_stat;
  RxMemoryData_smet.FieldByName('id_kekv').Value := id_kekv;
//  RxMemoryData_smet.FieldByName('id_dt_dog_smet').Value:=id_dt_smet_dog;

  pFIBDataSet_kekv.Active := false;
  pFIBDataSet_kekv.ParamByName('id_kekv').Value := id_kekv;
  pFIBDataSet_kekv.ParamByName('actual_date').Value := Date;
  pFIBDataSet_kekv.Active := true;

  RxMemoryData_smet.FieldByName('name_kekv').Value := pFIBDataSet_kekv.FieldByName('KEKV_TITLE').AsString;
  RxMemoryData_smet.FieldByName('kod_kekv').Value := pFIBDataSet_kekv.FieldByName('KEKV_KODE').AsInteger;;

  pFIBDataSet_razd_st.Active := false;
  pFIBDataSet_razd_st.ParamByName('id_razd_st_in').Value := id_razd;
  pFIBDataSet_razd_st.Active := true;

  RxMemoryData_smet.FieldByName('name_smet').Value := pFIBDataSet_smeta.FieldByName('SMETA_TITLE').AsVariant;
  RxMemoryData_smet.FieldByName('kod_smety').Value := pFIBDataSet_smeta.FieldByName('SMETA_KOD').AsVariant;
  RxMemoryData_smet.FieldByName('n_razd').Value    := pFIBDataSet_razd_st.FieldByName('RAZD_ST_NUM').AsVariant;
  RxMemoryData_smet.FieldByName('name_razd').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_TITLE').AsVariant;

  pFIBDataSet_razd_st.Active := false;
  pFIBDataSet_razd_st.ParamByName('id_razd_st_in').Value := id_stat;
  pFIBDataSet_razd_st.Active := true;

  RxMemoryData_smet.FieldByName('name_stat').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_TITLE').AsVariant;
  RxMemoryData_smet.FieldByName('n_stat').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_NUM').AsVariant;
  RxMemoryData_smet.FieldByName('sum_smet').Value := summa;

  RxMemoryData_smet.FieldByName('flag_del').Value := 0;
  RxMemoryData_smet.FieldByName('id_rx_smet').Value := id_rx;
  RxMemoryData_smet.Post;
end;

////////////////////////////////////////////////////////////////////////////////
function TfrmKowtoris.RedkowtorisOsnDannie(nomer_k: Variant; date_k: TDate; note_k: String; nds_k: Variant): Variant;
begin
  cxMaskEdit_n_dog.Text := VarToStr(nomer_k);
  cxDateEdit_dog.Date := date_k;
  cxMemo_dog_note.Text := note_k;
  CurrencyEdit_nds.Text := nds_k;
end;
////////////////////////////////////////////////////////////////////////////////

procedure TfrmKowtoris.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmKowtoris.FormCreate(Sender: TObject);
begin
  pFIBDataSet_nds_procent.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
  pFIBDataSet_nds_procent.Transaction := TfrmShablon2(Self.Owner).pFIBTransactionRead;
  pFIBDataSet_nds_procent.Active := false;
  pFIBDataSet_nds_procent.Active := true;
  pFIBDataSet_nomer.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
  pFIBDataSet_nomer.Transaction := TfrmShablon2(Self.Owner).pFIBTransactionRead;
  pFIBDataSet_nomer.Active := false;
  pFIBDataSet_nomer.Active := true;
  //Интерфейс
{  ToolButton_add.Caption:=Resources_unit.PUB_ACTION_ADD_CONST;
  ToolButton_del.Caption:=Resources_unit.PUB_ACTION_DELETE_CONST;
  }
    cxGrid1DBTableView1DBColumn3.Caption      := rsh_Kekv;
    Label13.Caption                           := rsh_Kekv;
    Label18.Caption                           := rsh_Smeta;
    Label19.Caption                           := rsh_Razd;
    Label20.Caption                           := rsh_Stat;

end;

//Подсчет суммы по смете
procedure TfrmKowtoris.Summa();
var
  i: Integer;
  temp: Variant;
begin
  sum_po_smet := 0;
  RxMemoryData_smet.First;
  for i := 0 to RxMemoryData_smet.RecordCount-1 do
  begin
    if RxMemoryData_smet.FieldByName('flag_del').Value<>1 then
    begin
      temp := RxMemoryData_smet.FieldByName('sum_smet').AsVariant;
      sum_po_smet := sum_po_smet+temp;
    end;
    RxMemoryData_smet.Next;
  end;
   CurrencyEdit_sum_po_smet.Text := VarToStr(sum_po_smet);
end;

procedure TfrmKowtoris.SumNds();
begin
 if Priznak_vizova = 'add' then
   begin
      pFIBDataSet_nds_procent.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
      pFIBDataSet_nds_procent.Transaction := TfrmShablon2(Self.Owner).pFIBTransactionRead;
      pFIBDataSet_nds_procent.Active := false;
      pFIBDataSet_nds_procent.ParamByName('D_D_DOG').Value := cxDateEdit_dog.Text;
      pFIBDataSet_nds_procent.Active := true;
      nds_procent := pFIBDataSet_nds_procent.FieldByName('D_NDS_PROCENT').AsVariant;
      if nds_procent<=0 then nds_procent := 20;
      sum_nds := (sum_po_smet*nds_procent)/(100+nds_procent);
      CurrencyEdit_nds.Text := VarToStr(sum_nds);
   end;
end;


procedure TfrmKowtoris.cxDateEdit_dogPropertiesChange(Sender: TObject);
begin
  SumNds();
end;

procedure TfrmKowtoris.RxMemoryData_smetAfterDelete(DataSet: TDataSet);
begin
  Summa();
  SumNds();
end;

procedure TfrmKowtoris.RxMemoryData_smetAfterPost(DataSet: TDataSet);
begin
  Summa();
  SumNds();
end;

procedure TfrmKowtoris.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect: TRect;
begin
  Arect := AViewInfo.Bounds;
  ACanvas.Canvas.Pen.Color := clBlack;
  if AViewInfo.GridRecord.Values[5] = 1 then
    begin
      ACanvas.Canvas.Font.Color := clRed;
      ACanvas.Canvas.Font.Style := [fsStrikeOut];
      ACanvas.Canvas.FillRect(Arect);
    end
    else
    begin
      ACanvas.Canvas.Font.Color := clBlack;
      ACanvas.Canvas.Font.Style := [];
      ACanvas.Canvas.FillRect(Arect);
    end;
end;

procedure TfrmKowtoris.cxButton_okClick(Sender: TObject);
var
  i, j: Integer;
begin
   //проверка на совпадение номеров кошториса в пределах одного договора
  if Priznak_vizova = 'add' then
    begin
      pFIBDataSet_nomer.Active := false;
      pFIBDataSet_nomer.ParamByName('param').Value := kod_dog_document;
      pFIBDataSet_nomer.Active := true;
      pFIBDataSet_nomer.FetchAll;
        pFIBDataSet_nomer.First;
        for i := 0 to pFIBDataSet_nomer.RecordCount-1 do
        begin
          if pFIBDataSet_nomer.FieldByName('n_dog').Value = cxMaskEdit_n_dog.Text then
          begin
            ShowMessage('Совпадение номеров смет!');
            Exit;
          end
          else
          begin
            pFIBDataSet_nomer.Next;
          end;
        end;
    end;

         // проверка на заполнение номера договора
    if  Trim(cxMaskEdit_n_dog.Text) =' ' then
        begin
        ShowMessage('Заполните номер кошториса!');
        cxMaskEdit_n_dog.SetFocus;
        Exit;
    end;

         // проверка на заполнение основания договора
    if  Trim(cxMemo_dog_note.Text)='' then
        begin
        ShowMessage('Заполните основание кошториса!');
        cxMemo_dog_note.SetFocus;
        Exit;
    end;

  nomer_kowtoris := cxMaskEdit_n_dog.Text;
  date_kowtoris  := cxDateEdit_dog.Date;
  note_kowtoris  := cxMemo_dog_note.Text;
  p_sum_vipol    := CurrencyEdit_sum_vipol.Text;
  p_sum_opl      := CurrencyEdit_sum_opl.Text;

  if Trim(CurrencyEdit_nds.Text) = '' then summa_nds := 0 else
  summa_nds := CurrencyEdit_nds.Text;

  if p_sum_vipol = '' then p_sum_vipol := 0;
  if p_sum_opl = '' then p_sum_opl := 0;

if Priznak_vizova = 'add' then
    begin

    TfrmShablon2(Self.Owner).GetKowtoris(nomer_kowtoris,date_kowtoris,note_kowtoris,sum_po_smet,p_sum_vipol,p_sum_opl, summa_nds);

    RxMemoryData_smet.First;
    for  i := 0 to RxMemoryData_smet.RecordCount-1 do
      begin
       if (RxMemoryData_smet.FieldByName('flag_del').Value = 0) then
        begin
          TfrmShablon2(Self.Owner).GetSmetaSh2(
          RxMemoryData_smet.FieldByName('id_smet').Value,
          RxMemoryData_smet.FieldByName('id_razd').Value,
          RxMemoryData_smet.FieldByName('id_stat').Value,
          RxMemoryData_smet.FieldByName('sum_smet').Value,
          nomer_kowtoris,
          RxMemoryData_smet.FieldByName('id_kekv').Value);
          RxMemoryData_smet.Next;
        end
        else
        begin
          RxMemoryData_smet.Next;
        end;
      end;
    end
    else

///////////////////////Редактирование кошториса///////////////////////////
    begin

    TfrmShablon2(Self.Owner).GetKowtorisRed(nomer_kowtoris,date_kowtoris,note_kowtoris,sum_po_smet,p_sum_vipol,p_sum_opl,summa_nds);

      RxMemoryData_smet.First;
      for  i := 0 to RxMemoryData_smet.RecordCount-1 do
      begin
          TfrmShablon2(Self.Owner).GetSmetaSh2Red(
          RxMemoryData_smet.FieldByName('id_smet').Value,
          RxMemoryData_smet.FieldByName('id_razd').Value,
          RxMemoryData_smet.FieldByName('id_stat').Value,
          RxMemoryData_smet.FieldByName('sum_smet').Value,
          nomer_kowtoris,
          RxMemoryData_smet.FieldByName('flag_del').Value,
          RxMemoryData_smet.FieldByName('id_rx_smet').Value,
          id_dog_dt_document,
          RxMemoryData_smet.FieldByName('id_kekv').Value);
          RxMemoryData_smet.Next;
      end;
    end;
    Close;
end;

procedure TfrmKowtoris.RxMemoryData_smetAfterScroll(DataSet: TDataSet);
begin
  Label21.Caption := RxMemoryData_smet.FieldByName('name_smet').AsString;
  Label22.Caption := RxMemoryData_smet.FieldByName('name_razd').AsString;
  Label23.Caption := RxMemoryData_smet.FieldByName('name_stat').AsString;
  Label25.Caption := RxMemoryData_smet.FieldByName('name_kekv').AsString;
  Label21.Hint    := RxMemoryData_smet.FieldByName('name_smet').AsString;
  Label21.ShowHint:= true;
  Label22.Hint    := RxMemoryData_smet.FieldByName('name_razd').AsString;
  Label22.ShowHint:= true;
  Label23.Hint    := RxMemoryData_smet.FieldByName('name_stat').AsString;
  Label23.ShowHint:= true;
  Label25.Hint    := RxMemoryData_smet.FieldByName('name_kekv').AsString;
  Label25.ShowHint:= true;
end;

procedure TfrmKowtoris.CurrencyEdit_sum_po_smetChange(Sender: TObject);
begin
//  CurrencyEdit_sum_pod_smet.Text:=CurrencyEdit_summa.Text;
{  sum_smet_kowtoris:=CurrencyEdit_sum_po_smet.Text;
  if sum_smet_kowtoris<0 then sum_smet_kowtoris:=0;
  if sum_smet_pod_dog<0 then sum_pod_dog:=0;
  CurrencyEdit_sum_pod_smet.Text:=VarToStr(sum_smet_kowtoris+sum_pod_dog);
}
end;

{//Проверка на совпадение номеров кошторисов
procedure TfrmKowtoris.cxMaskEdit_n_dogPropertiesChange(Sender: TObject);
var
  s: String;
  MyDataSet: TpFIBDataSet;
begin
  s:='select dog_dt_document.n_dog from dog_dt_document where dog_dt_document.kod_dog<>dog_dt_document.id_dog and dog_dt_document.kod_dog=:param';
  MyDataSet.Database:=TfrmShablon2(Self.Owner).pFIBDatabase;
  MyDataSet.Transaction:=TfrmShablon2(Self.Owner).pFIBTransactionRead;
  MyDataSet.Active:=false;
  MyDataSet.Active:=true;
  MyDataSet.SQLs.SelectSQL.Add(s);
end;
}
procedure TfrmKowtoris.cxMaskEdit_n_dogKeyPress(Sender: TObject;
  var Key: Char);
begin
//  if not(key in ['0'..'9']) and (key<>#8)
//  then    key:=#0;
end;

procedure TfrmKowtoris.addExecute(Sender: TObject);
begin
  dxBarLargeButton_addClick(Self);
end;

procedure TfrmKowtoris.delExecute(Sender: TObject);
begin
  dxBarLargeButton_delClick(Self);
end;

procedure TfrmKowtoris.N1Click(Sender: TObject);
begin
  dxBarLargeButton_addClick(Self);
end;

procedure TfrmKowtoris.N2Click(Sender: TObject);
begin
  dxBarLargeButton_delClick(Self);
end;

procedure TfrmKowtoris.cxButton_predoplClick(Sender: TObject);
var
  Predoplata: TfrmPredopl;
  sum, sum_vipol, sum_opl, sum_dog: Double;
  note_kowt: String;
  DataSetNameSh: TpFIBDataSet;
  s : string;
begin
   LoadDogManedger.LoadShablon(Application.MainForm, TfrmShablon2(Self.Owner).pFIBDatabase.Handle, fsNormal, id_dog_kowt, 'add', SYS_ID_PREDOPL,
                              PChar('Predoplata.bpl'), Nil);
end;

procedure TfrmKowtoris.dxBarLargeButton_addClick(Sender: TObject);
var
  Add_smet: TfrmAddSmetSh2;
begin

  TfrmAddSmetSh2(Self.Owner).ProverkaSum(summa_dog, sum_pod_dog);

  if Trim(cxDateEdit_dog.Text) = ''
  then
    begin
      ShowMessage('Заполните дату!');
      Exit;
    end
  else
  Add_smet := TfrmAddSmetSh2.Create(Self.Owner,0,0,0,'','','',0,0,0,false,0,self);
  Add_smet.ShowModal;
  SumNds();
  Add_smet.Free;
end;

procedure TfrmKowtoris.dxBarLargeButton_delClick(Sender: TObject);
var
  sum_pod_dog_del :Variant;
begin
  if cxGrid1DBTableView1DBColumn1.EditValue=0 then
  begin
    Exit;
  end;

  RxMemoryData_smet.Open;
  RxMemoryData_smet.Edit;
  if RxMemoryData_smet.FieldByName('Flag_del').Value = 1 then
    begin
      sum_pod_dog_del := CurrencyEdit_sum_pod_smet.Text;
      RxMemoryData_smet.FieldByName('Flag_del').Value := 0;
      CurrencyEdit_sum_pod_smet.Text := VarToStr(sum_pod_dog_del)+RxMemoryData_smet.FieldByName('sum_smet').AsVariant;
    end
    else
    begin
      sum_pod_dog_del := CurrencyEdit_sum_pod_smet.Text;
      RxMemoryData_smet.FieldByName('Flag_del').Value := 1;
      CurrencyEdit_sum_pod_smet.Text := VarToStr(sum_pod_dog_del)-RxMemoryData_smet.FieldByName('sum_smet').AsVariant;
    end;
  RxMemoryData_smet.Post;
end;

procedure TfrmKowtoris.FormShow(Sender: TObject);
begin
  if Priznak_vizova = 'red' then
  cxMemo_dog_note.SetFocus;
end;

procedure TfrmKowtoris.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_DELETE then
  begin
    dxBarLargeButton_delClick(Self);
  end;
if key = VK_INSERT then
  begin
    dxBarLargeButton_addClick(Self);
  end;
end;

procedure TfrmKowtoris.Label14Click(Sender: TObject);
begin
  if Priznak_vizova <> 'add' then
  ShowDogPayFulfil(Self, TfrmShablon2(Self.Owner).pFIBDatabase.Handle, TfrmShablon2(Self.Owner).pFIBTransactionRead.Handle, TfrmShablon2(Self.Owner).pFIBTransactionWrite.Handle, fsNormal, id_doc, -1);
end;

procedure TfrmKowtoris.Label15Click(Sender: TObject);
begin
  if Priznak_vizova <> 'add' then
  ShowDogPayFulfil(Self, TfrmShablon2(Self.Owner).pFIBDatabase.Handle, TfrmShablon2(Self.Owner).pFIBTransactionRead.Handle, TfrmShablon2(Self.Owner).pFIBTransactionWrite.Handle, fsNormal, id_doc, -1);
end;

procedure TfrmKowtoris.Label14MouseLeave(Sender: TObject);
begin
  Label14.font.color := clBlack;
  Label14.font.Style := [fsBold];
end;

procedure TfrmKowtoris.Label14MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Label14.font.color := clBlue;
  Label14.font.Style := [fsUnderline];
end;

procedure TfrmKowtoris.Label15MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Label15.font.color := clBlue;
  Label15.font.Style := [fsUnderline];
end;

procedure TfrmKowtoris.Label15MouseLeave(Sender: TObject);
begin
  Label15.font.color := clBlack;
  Label15.font.Style := [fsBold];
end;

procedure TfrmKowtoris.insExecute(Sender: TObject);
begin
  dxBarLargeButton_addClick(Self);
end;

end.
