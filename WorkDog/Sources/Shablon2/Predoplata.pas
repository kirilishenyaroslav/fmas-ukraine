unit Predoplata;
{*******************************************************************************
* Predoplata                                                                   *
*                                                                              *
* Предоплата по шаблону 2                                                      *
* Copyright ©  2004, Бурмистрова Е.                                            *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, StdCtrls, Buttons, ExtCtrls,
  cxContainer, cxTextEdit, cxCurrencyEdit, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxMaskEdit, cxButtonEdit,
  FIBDatabase, pFIBDatabase, iBase, LoadDogManedger, GlobalSPR, FIBDataSet,
  pFIBDataSet, ActnList, cxLookAndFeelPainters, cxButtons, RxMemDS,
  cxDropDownEdit, cxCalendar, ImgList, ComCtrls, ToolWin,
  Mask, ToolEdit, CurrEdit, cxLabel, cxMemo, FIBQuery, pFIBQuery,
  pFIBStoredProc, Menus, cxTL, Math, dxBar, dxBarExtItems,dogLoaderUnit;

resourcestring
    errDtNotNumber = 'Номер договору не заповнен!';
    errDtNotKontragent = 'Виберіть контрагента!';
    errDtNotDonnu = 'Виберіть рахунок ДонНУ!';
    errDtNotNote = 'Підстава договору не заповнена!';
    errDtKritDate = 'Некоректно введена критична дата оплати!';
    errNotSmet = 'Необхідно додати кошторис!';

type
  TfrmPredopl = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Panel1: TPanel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cxMaskEdit_n_dog: TcxMaskEdit;
    GroupBox5: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    cxButtonEdit_name_p: TcxButtonEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cxButtonEdit_name_un: TcxButtonEdit;
    cxTextEdit_mfo_p: TcxTextEdit;
    cxTextEdit_rsch_p: TcxTextEdit;
    cxTextEdit_bank_p: TcxTextEdit;
    cxTextEdit_mfo_un: TcxTextEdit;
    cxTextEdit_rsch_un: TcxTextEdit;
    cxTextEdit_bank_un: TcxTextEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    pFIBDatabase: TpFIBDatabase;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSet_post: TpFIBDataSet;
    ActionList_smet: TActionList;
    add_smet: TAction;
    cxButton_ok: TcxButton;
    cxButton_cancel: TcxButton;
    RxMemoryData_smet: TRxMemoryData;
    DataSource_smet: TDataSource;
    GroupBox6: TGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn_smeta: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel2: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    cxDateEdit_dog: TcxDateEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    GroupBox7: TGroupBox;
    Label27: TLabel;
    cxMemo_dog_note: TcxMemo;
    pFIBStoredProc_dt_add: TpFIBStoredProc;
    CurrencyEdit_nds: TCurrencyEdit;
    CurrencyEdit_summa_pay: TCurrencyEdit;
    CurrencyEdit_opl: TCurrencyEdit;
    pFIBDataSet_param_id_rate_acc: TpFIBDataSet;
    pFIBDataSet_id_dokument: TpFIBDataSet;
    pFIBDataSet_nds_procent: TpFIBDataSet;
    pFIBDataSet_tip_dog: TpFIBDataSet;
    pFIBDataSet_tip_dog_add: TpFIBDataSet;
    pFIBDataSet_tip_info: TpFIBDataSet;
    pFIBDataSet_smeta: TpFIBDataSet;
    pFIBDataSet_smet_info: TpFIBDataSet;
    pFIBDataSet_razd_st: TpFIBDataSet;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    CurrencyEdit_summa: TCurrencyEdit;
    pFIBDataSet_red_document: TpFIBDataSet;
    GroupBox8: TGroupBox;
    CurrencyEdit_sum_po_smet: TCurrencyEdit;
    cxTextEdit_kol_vo_smet: TcxTextEdit;
    cxTextEdit_reg_nomer: TcxTextEdit;
    Label2: TLabel;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    del_smet: TAction;
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
    dxBarManager1: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    dxBarLargeButton_add: TdxBarLargeButton;
    dxBarLargeButton_del: TdxBarLargeButton;
    Label13: TLabel;
    CurrencyEdit_sum_dog: TCurrencyEdit;
    Label14: TLabel;
    pFIBDataSet_native: TpFIBDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButtonEdit_name_unPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RxMemoryData_smetAfterScroll(DataSet: TDataSet);
    procedure cxButton_okClick(Sender: TObject);
    procedure CurrencyEdit_ndsChange(Sender: TObject);
//    procedure ToolButton_redClick(Sender: TObject);
    procedure cxMaskEdit_n_dogPropertiesChange(Sender: TObject);
    procedure cxMaskEdit_n_dogKeyPress(Sender: TObject; var Key: Char);
    procedure RxMemoryData_smetAfterDelete(DataSet: TDataSet);
    procedure RxMemoryData_smetAfterPost(DataSet: TDataSet);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure CurrencyEdit_sum_po_smetChange(Sender: TObject);
    procedure CurrencyEdit_oplChange(Sender: TObject);
    procedure CurrencyEdit_ndsExit(Sender: TObject);
    procedure CurrencyEdit_oplExit(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure Label15MouseLeave(Sender: TObject);
    procedure Label15MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure add_smetExecute(Sender: TObject);
    procedure del_smetExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure cxDateEdit_dogPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label17MouseLeave(Sender: TObject);
    procedure Label17MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dxBarLargeButton_addClick(Sender: TObject);
    procedure dxBarLargeButton_delClick(Sender: TObject);
  private
    fProc : TResProc;
    procedure Summa(); // считает сумму сметы
    procedure SumNds();
    procedure SummaDoc(); //считает сумму документа
    procedure EditSum(); //если сумма документа=оплаченной сумме, то можно менять сумму документа и НДС

  public
//  constructor Create (Aowner:TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_dokument: Variant; Pr_vizova: String; Id_t_d: Variant);
  constructor Create (Aowner:TComponent; HandleDataBase: TISC_DB_HANDLE; id_rate_account, id_rate_account_native: Variant; sum_doc, sum_opl, sum_dog: Double;
                      rxMemoryD :TRxMemoryData; note_kowt: String; id_dog_kowt: Variant); reintroduce;

  function GetSmeta (p_smeta,p_razdel,p_stat:String; sum_smet:Variant;
  p_id_smet,p_kod_smet,p_nomer_razd,p_nomer_stat:Integer; id_smet, id_razd, id_stat: Variant):Variant;
    { Public declarations }
  end;


var
  frmPredopl: TfrmPredopl;
  id_p, name_p, id_doc, id_dog,
  rate_acc_un, rate_acc_p: Variant; //идентификаторы счетов ДонНУ и контрагента соответственно
  smeta, razdel, stat: String;  //переменные, содержащие данные по сметам из функции;
  Priznak_vizova :String;
  id_customer :Variant;   //
  name_customer :String; // переменные для редактирования
  id_smeta, id_razdel, id_stat :Variant;
  title_smet: String;
  nds_procent, sum_nds: Variant;
  sum_po_smet : Variant;
  id_tip_dog: Variant;
  tip_dog_name: String;
  kod_dog: Variant;
  id_dog_red: Variant; //для редактирования сметы
  id_dt_smet: Variant; //Переменная для позиционирования
  sum_doc: Variant; //Сумма документа
  rxMemoryData_predopl: TRxMemoryData;//данные по сметам из кошториса
  kod_dog_predopl: Variant; // kod_dog для предоплаты, иерархически...


implementation
uses
  Add_smet_sh2,
  Shablon2;

{$R *.dfm}


constructor TfrmPredopl.Create (Aowner:TComponent; HandleDataBase: TISC_DB_HANDLE; id_rate_account, id_rate_account_native: Variant; sum_doc, sum_opl, sum_dog: Double;
                                rxMemoryD :TRxMemoryData; note_kowt: String; id_dog_kowt: Variant);
var
  i: Integer;
  nds_s, sum_nds: Double;
  nds_procent :Integer;
begin
  inherited Create (Aowner);
  pFIBDatabase.Handle := HandleDataBase;
  pFIBTransactionRead.StartTransaction;

  kod_dog_predopl := id_dog_kowt;

//  sum_d := CurrencyEdit_sum_po_smet.Value;
  pFIBDataSet_nds_procent.Database := pFIBDatabase;
  pFIBDataSet_nds_procent.Transaction := pFIBTransactionRead;
  pFIBDataSet_nds_procent.Active := false;
  pFIBDataSet_nds_procent.ParamByName('D_D_DOG').Value := cxDateEdit_dog.Date;
  pFIBDataSet_nds_procent.Active := true;
  if (pFIBDataSet_nds_procent.FieldByName('D_NDS_PROCENT').AsVariant <=0) then
  nds_procent := 20 else
  nds_procent := pFIBDataSet_nds_procent.FieldByName('D_NDS_PROCENT').AsVariant;
  sum_nds := (sum_doc*nds_procent)/(100+nds_procent);
  CurrencyEdit_nds.Text := VarToStr(sum_nds);

 //данные по сметам из кошториса
  DataSource_smet.DataSet := rxMemoryD;

  rxMemoryData_predopl := rxMemoryD;

{  RxMemoryData_smet.Open;
  RxMemoryData_smet.Insert;
  RxMemoryData_smet.FieldByName('kod_smety').Value := rxMemoryD.FieldByName('kod_smety').AsInteger;
  RxMemoryData_smet.FieldByName('n_razd').Value := rxMemoryD.FieldByName('n_razd').AsInteger;
  RxMemoryData_smet.FieldByName('n_stat').Value := rxMemoryD.FieldByName('n_stat').AsInteger;
  RxMemoryData_smet.FieldByName('sum_smet').Value := sum_doc;
  RxMemoryData_smet.Post;
 }

  Label21.Caption := rxMemoryD.FieldByName('name_smet').AsString;
  Label22.Caption := rxMemoryD.FieldByName('name_razd').AsString;
  Label23.Caption := rxMemoryD.FieldByName('name_stat').AsString;

    //Данные по контрагенту
  pFIBDataSet_post.Database := pFIBDatabase;
  pFIBDataSet_post.Transaction := pFIBTransactionRead;
  pFIBDataSet_post.Active := false;
  pFIBDataSet_post.ParamByName('param').Value := id_rate_account;
  pFIBDataSet_post.Active := true;

  rate_acc_p := id_rate_account;
  cxButtonEdit_name_p.Text := pFIBDataSet_post.FieldByName('name_customer').AsString;
  cxTextEdit_mfo_p.Text := pFIBDataSet_post.FieldByName('MFO').AsString;
  cxTextEdit_bank_p.Text := pFIBDataSet_post.FieldByName('NAME_MFO').AsString;
  cxTextEdit_rsch_p.Text := pFIBDataSet_post.FieldByName('Rate_account').AsString;
  id_customer := pFIBDataSet_post.FieldByName('ID_CUSTOMER').AsVariant;
  name_customer := pFIBDataSet_post.FieldByName('name_customer').AsString;

    //Данные по native
  pFIBDataSet_native.Database := pFIBDatabase;
  pFIBDataSet_native.Transaction := pFIBTransactionRead;
  pFIBDataSet_native.Active := false;
  pFIBDataSet_native.ParamByName('d_id_rate_acc_native').Value := id_rate_account_native;
  pFIBDataSet_native.Active := true;

  cxButtonEdit_name_un.Text := pFIBDataSet_native.FieldByName('NAME_CUSTOMER').AsString;
  cxTextEdit_mfo_un.Text := pFIBDataSet_native.FieldByName('MFO').AsString;
  cxTextEdit_bank_un.Text := pFIBDataSet_native.FieldByName('NAME_MFO').AsString;
  cxTextEdit_rsch_un.Text := pFIBDataSet_native.FieldByName('Rate_account').AsString;
//  rate_acc_un := pFIBDataSet_native.FieldByName('ID_RATE_ACC_NATIVE').AsVariant;

  cxDateEdit_dog.Date := Date;
  cxMaskEdit_n_dog.Text := 'Без номеру';
  CurrencyEdit_summa.Text := FloatToStr(sum_doc);
  CurrencyEdit_opl.Text := FloatToStr(sum_opl);
  CurrencyEdit_sum_dog.Text := FloatToStr(sum_dog);
  cxMemo_dog_note.Text := note_kowt;

{  pFIBDataSet_id_dokument.Database := pFIBDatabase;
  pFIBDataSet_id_dokument.Transaction := pFIBTransactionRead;
  pFIBDataSet_tip_dog.Database := pFIBDatabase;
  pFIBDataSet_tip_dog.Transaction := pFIBTransactionRead;
  pFIBDataSet_red_document.Database := pFIBDatabase;
  pFIBDataSet_red_document.Transaction := pFIBTransactionRead;
  pFIBDataSet_id_dokument.Active := false;
//  pFIBDataSet_id_dokument.ParamByName('D_ID_DOG_VX').Value := id_dokument;
  pFIBDataSet_id_dokument.Active := true;
  cxMaskEdit_n_dog.Text := pFIBDataSet_id_dokument.FieldByName('d_n_dog').AsString;
  cxDateEdit_dog.Date := pFIBDataSet_id_dokument.FieldByName('d_d_dog').AsDateTime;
  CurrencyEdit_summa.Text := pFIBDataSet_id_dokument.FieldByName('d_summa').AsString;
  cxDateEdit_krit_opl.Date := pFIBDataSet_id_dokument.FieldByName('d_krit_date').AsDateTime;

  nds_s := pFIBDataSet_id_dokument.FieldByName('d_nds_sum').AsVariant;
  if nds_s = 0  then
  cxTextEdit_nds.Text := 'БЕЗ ПДВ' else
  CurrencyEdit_nds.Text := pFIBDataSet_id_dokument.FieldByName('d_nds_sum').AsVariant;

  cxMemo_dog_note.Text := pFIBDataSet_id_dokument.FieldByName('d_dog_note').AsString;
  cxTextEdit_reg_nomer.Text := pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString;
  CurrencyEdit_summa_pay.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_pay').AsString;
  CurrencyEdit_sum_fulfil.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_fulfil').AsString;
//      sum_doc := pFIBDataSet_id_dokument.FieldByName('d_summa').AsVariant;
  if pFIBDataSet_id_dokument.FieldByName('d_sum_opl').Value < 0 then
  begin
    CurrencyEdit_opl.Value := 0;
  end
  else
  CurrencyEdit_opl.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_opl').AsVariant;
  id_doc := id_dokument;
  pFIBDataSet_red_document.Active := false;
  pFIBDataSet_red_document.ParamByName('d_id_dog_vx').Value := id_dokument;
  pFIBDataSet_red_document.Active := true;
  id_dog_red := pFIBDataSet_red_document.FieldByName('ID_DOG').AsVariant;

 //Данные по типам договоров
  pFIBDataSet_tip_dog.Active := false;
  pFIBDataSet_tip_dog.ParamByName('param_document').Value := id_dokument;
  pFIBDataSet_tip_dog.Active := true;
  id_tip_dog := pFIBDataSet_tip_dog.FieldByName('id_tip_dog').AsVariant;
//        Label5.Caption := pFIBDataSet_tip_dog.FieldByName('short_name').AsString;
  cxTextEdit_tip_dog.Text := pFIBDataSet_tip_dog.FieldByName('short_name').AsString;

  //Данные по native
  cxButtonEdit_name_un.Text := pFIBDataSet_id_dokument.FieldByName('D_NAME_CUSTOMER_N').AsString;
  cxTextEdit_mfo_un.Text := pFIBDataSet_id_dokument.FieldByName('D_MFO_N').AsString;
  cxTextEdit_bank_un.Text := pFIBDataSet_id_dokument.FieldByName('D_BANK_NAME_N').AsString;
  cxTextEdit_rsch_un.Text := pFIBDataSet_id_dokument.FieldByName('D_RSCH_N').AsString;
  rate_acc_un := pFIBDataSet_id_dokument.FieldByName('D_ID_RATE_ACC_NATIVE').AsVariant;

  //Данные по контрагенту
  rate_acc_p := pFIBDataSet_id_dokument.FieldByName('D_ID_RATE_ACCOUNT').AsVariant;
  cxButtonEdit_name_p.Text := pFIBDataSet_id_dokument.FieldByName('d_name_customer_k').AsString;
  cxTextEdit_mfo_p.Text := pFIBDataSet_id_dokument.FieldByName('D_MFO_K').AsString;
  cxTextEdit_bank_p.Text := pFIBDataSet_id_dokument.FieldByName('D_BANK_NAME_K').AsString;
  cxTextEdit_rsch_p.Text := pFIBDataSet_id_dokument.FieldByName('D_RSCH_K').AsString;
  id_customer := pFIBDataSet_id_dokument.FieldByName('D_ID_CUSTOMER').AsVariant;
  name_customer := pFIBDataSet_id_dokument.FieldByName('D_NAME_CUSTOMER_K').AsString;
  cxTextEdit_doc_d.Text := cxDateEdit_dog.Text;

  //Данные по смете
  pFIBDataSet_smet_info.Database := pFIBDatabase;
  pFIBDataSet_smet_info.Transaction := pFIBTransactionRead;
  pFIBDataSet_smeta.Database := pFIBDatabase;
  pFIBDataSet_smeta.Transaction := pFIBTransactionRead;
  pFIBDataSet_razd_st.Database := pFIBDatabase;
  pFIBDataSet_razd_st.Transaction := pFIBTransactionRead;
  pFIBDataSet_smet_info.Active := false;
  pFIBDataSet_smet_info.ParamByName('param_doc').Value := id_dokument;
  pFIBDataSet_smet_info.Active := true;
  pFIBDataSet_smet_info.FetchAll;
  pFIBDataSet_smet_info.First;
  for i := 0 to pFIBDataSet_smet_info.RecordCount-1 do
  begin
    pFIBDataSet_smeta.Active := false;
    pFIBDataSet_smeta.ParamByName('id_smeta').Value := pFIBDataSet_smet_info.FieldByName('id_smeta').AsVariant;
    pFIBDataSet_smeta.Active := true;

    RxMemoryData_smet.Open;
    RxMemoryData_smet.Insert;

    pFIBDataSet_razd_st.Active := false;
    pFIBDataSet_razd_st.ParamByName('id_razd_st_in').Value := pFIBDataSet_smet_info.FieldByName('id_razd').AsVariant;
    pFIBDataSet_razd_st.Active := true;

    RxMemoryData_smet.FieldByName('name_smet').Value := pFIBDataSet_smeta.FieldByName('SMETA_TITLE').AsVariant;
    RxMemoryData_smet.FieldByName('kod_smety').Value := pFIBDataSet_smeta.FieldByName('SMETA_KOD').AsVariant;
    RxMemoryData_smet.FieldByName('n_razd').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_NUM').AsVariant;
    RxMemoryData_smet.FieldByName('name_razd').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_TITLE').AsVariant;

    pFIBDataSet_razd_st.Active := false;
    pFIBDataSet_razd_st.ParamByName('id_razd_st_in').Value := pFIBDataSet_smet_info.FieldByName('id_stat').AsVariant;
    pFIBDataSet_razd_st.Active := true;

    RxMemoryData_smet.FieldByName('name_stat').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_TITLE').AsVariant;
    RxMemoryData_smet.FieldByName('n_stat').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_NUM').AsVariant;
    RxMemoryData_smet.FieldByName('sum_smet').Value := pFIBDataSet_smet_info.FieldByName('summa').AsVariant;

    RxMemoryData_smet.FieldByName('id').Value := pFIBDataSet_smet_info.FieldByName('id_dt_smet_dog').AsVariant;
    RxMemoryData_smet.FieldByName('flag_del').Value := 0;
    RxMemoryData_smet.Post;

    pFIBDataSet_smet_info.Next;
end;

  Caption := 'Редагування'+' '+pFIBDataSet_tip_dog.FieldByName('short_name').AsString;
  Priznak_vizova := Pr_vizova;

  CurrencyEdit_nds.Enabled := false;   }

end;

{constructor TfrmPredopl.Create(Aowner:TComponent ;DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_dokument: Variant; Pr_vizova: String; Id_t_d: Variant);
var
  i: Integer;
  nds_s : Currency;
begin
if Pr_vizova = 'red' then
      begin
        inherited Create (Aowner);
        pFIBDatabase.Handle := DBHANDLE;
        pFIBDataSet_nds_procent.Database := pFIBDatabase;
        pFIBDataSet_nds_procent.Transaction := pFIBTransactionRead;
        pFIBDataSet_post.Database := pFIBDatabase;
        pFIBDataSet_post.Transaction := pFIBTransactionRead;
        pFIBDataSet_id_dokument.Database := pFIBDatabase;
        pFIBDataSet_id_dokument.Transaction := pFIBTransactionRead;
        pFIBDataSet_tip_dog.Database := pFIBDatabase;
        pFIBDataSet_tip_dog.Transaction := pFIBTransactionRead;
        pFIBDataSet_red_document.Database := pFIBDatabase;
        pFIBDataSet_red_document.Transaction := pFIBTransactionRead;
        pFIBDataSet_post.Active := false;
        pFIBDataSet_post.Active := true;
        pFIBDataSet_id_dokument.Active := false;
        pFIBDataSet_id_dokument.ParamByName('D_ID_DOG_VX').Value := id_dokument;
        pFIBDataSet_id_dokument.Active := true;
        cxMaskEdit_n_dog.Text := pFIBDataSet_id_dokument.FieldByName('d_n_dog').AsString;
        cxDateEdit_dog.Date := pFIBDataSet_id_dokument.FieldByName('d_d_dog').AsDateTime;
        CurrencyEdit_summa.Text := pFIBDataSet_id_dokument.FieldByName('d_summa').AsString;
        cxDateEdit_krit_opl.Date := pFIBDataSet_id_dokument.FieldByName('d_krit_date').AsDateTime;

        nds_s := pFIBDataSet_id_dokument.FieldByName('d_nds_sum').AsVariant;
        if nds_s = 0  then
        cxTextEdit_nds.Text := 'БЕЗ ПДВ' else
        CurrencyEdit_nds.Text := pFIBDataSet_id_dokument.FieldByName('d_nds_sum').AsVariant;

        cxMemo_dog_note.Text := pFIBDataSet_id_dokument.FieldByName('d_dog_note').AsString;
        cxTextEdit_reg_nomer.Text := pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString;
        CurrencyEdit_summa_pay.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_pay').AsString;
        CurrencyEdit_sum_fulfil.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_fulfil').AsString;
//      sum_doc := pFIBDataSet_id_dokument.FieldByName('d_summa').AsVariant;
        if pFIBDataSet_id_dokument.FieldByName('d_sum_opl').Value < 0 then
        begin
          CurrencyEdit_opl.Value := 0;
        end
        else
        CurrencyEdit_opl.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_opl').AsVariant;
        id_doc := id_dokument;
        pFIBDataSet_red_document.Active := false;
        pFIBDataSet_red_document.ParamByName('d_id_dog_vx').Value := id_dokument;
        pFIBDataSet_red_document.Active := true;
        id_dog_red := pFIBDataSet_red_document.FieldByName('ID_DOG').AsVariant;

       //Данные по типам договоров
        pFIBDataSet_tip_dog.Active := false;
        pFIBDataSet_tip_dog.ParamByName('param_document').Value := id_dokument;
        pFIBDataSet_tip_dog.Active := true;
        id_tip_dog := pFIBDataSet_tip_dog.FieldByName('id_tip_dog').AsVariant;
//        Label5.Caption := pFIBDataSet_tip_dog.FieldByName('short_name').AsString;
        cxTextEdit_tip_dog.Text := pFIBDataSet_tip_dog.FieldByName('short_name').AsString;

        //Данные по native
        cxButtonEdit_name_un.Text := pFIBDataSet_id_dokument.FieldByName('D_NAME_CUSTOMER_N').AsString;
        cxTextEdit_mfo_un.Text := pFIBDataSet_id_dokument.FieldByName('D_MFO_N').AsString;
        cxTextEdit_bank_un.Text := pFIBDataSet_id_dokument.FieldByName('D_BANK_NAME_N').AsString;
        cxTextEdit_rsch_un.Text := pFIBDataSet_id_dokument.FieldByName('D_RSCH_N').AsString;
        rate_acc_un := pFIBDataSet_id_dokument.FieldByName('D_ID_RATE_ACC_NATIVE').AsVariant;

        //Данные по контрагенту
        rate_acc_p := pFIBDataSet_id_dokument.FieldByName('D_ID_RATE_ACCOUNT').AsVariant;
        cxButtonEdit_name_p.Text := pFIBDataSet_id_dokument.FieldByName('d_name_customer_k').AsString;
        cxTextEdit_mfo_p.Text := pFIBDataSet_id_dokument.FieldByName('D_MFO_K').AsString;
        cxTextEdit_bank_p.Text := pFIBDataSet_id_dokument.FieldByName('D_BANK_NAME_K').AsString;
        cxTextEdit_rsch_p.Text := pFIBDataSet_id_dokument.FieldByName('D_RSCH_K').AsString;
        id_customer := pFIBDataSet_id_dokument.FieldByName('D_ID_CUSTOMER').AsVariant;
        name_customer := pFIBDataSet_id_dokument.FieldByName('D_NAME_CUSTOMER_K').AsString;
        cxTextEdit_doc_d.Text := cxDateEdit_dog.Text;

        //Данные по смете
        pFIBDataSet_smet_info.Database := pFIBDatabase;
        pFIBDataSet_smet_info.Transaction := pFIBTransactionRead;
        pFIBDataSet_smeta.Database := pFIBDatabase;
        pFIBDataSet_smeta.Transaction := pFIBTransactionRead;
        pFIBDataSet_razd_st.Database := pFIBDatabase;
        pFIBDataSet_razd_st.Transaction := pFIBTransactionRead;
        pFIBDataSet_smet_info.Active := false;
        pFIBDataSet_smet_info.ParamByName('param_doc').Value := id_dokument;
        pFIBDataSet_smet_info.Active := true;
        pFIBDataSet_smet_info.FetchAll;
        pFIBDataSet_smet_info.First;
        for i := 0 to pFIBDataSet_smet_info.RecordCount-1 do
        begin
          pFIBDataSet_smeta.Active := false;
          pFIBDataSet_smeta.ParamByName('id_smeta').Value := pFIBDataSet_smet_info.FieldByName('id_smeta').AsVariant;
          pFIBDataSet_smeta.Active := true;

          RxMemoryData_smet.Open;
          RxMemoryData_smet.Insert;

          pFIBDataSet_razd_st.Active := false;
          pFIBDataSet_razd_st.ParamByName('id_razd_st_in').Value := pFIBDataSet_smet_info.FieldByName('id_razd').AsVariant;
          pFIBDataSet_razd_st.Active := true;

          RxMemoryData_smet.FieldByName('name_smet').Value := pFIBDataSet_smeta.FieldByName('SMETA_TITLE').AsVariant;
          RxMemoryData_smet.FieldByName('kod_smety').Value := pFIBDataSet_smeta.FieldByName('SMETA_KOD').AsVariant;
          RxMemoryData_smet.FieldByName('n_razd').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_NUM').AsVariant;
          RxMemoryData_smet.FieldByName('name_razd').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_TITLE').AsVariant;

          pFIBDataSet_razd_st.Active := false;
          pFIBDataSet_razd_st.ParamByName('id_razd_st_in').Value := pFIBDataSet_smet_info.FieldByName('id_stat').AsVariant;
          pFIBDataSet_razd_st.Active := true;

          RxMemoryData_smet.FieldByName('name_stat').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_TITLE').AsVariant;
          RxMemoryData_smet.FieldByName('n_stat').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_NUM').AsVariant;
          RxMemoryData_smet.FieldByName('sum_smet').Value := pFIBDataSet_smet_info.FieldByName('summa').AsVariant;

          RxMemoryData_smet.FieldByName('id').Value := pFIBDataSet_smet_info.FieldByName('id_dt_smet_dog').AsVariant;
          RxMemoryData_smet.FieldByName('flag_del').Value := 0;
          RxMemoryData_smet.Post;

          pFIBDataSet_smet_info.Next;
      end;

        Caption := 'Редагування'+' '+pFIBDataSet_tip_dog.FieldByName('short_name').AsString;
        Priznak_vizova := Pr_vizova;

        CurrencyEdit_nds.Enabled := false;


      end
      else

///////////////////////////////
      if Pr_vizova = 'add' then
      begin
              inherited Create (Aowner);
        pFIBDatabase.Handle := DBHANDLE;

        pFIBDataSet_post.Database := pFIBDatabase;
        pFIBDataSet_post.Transaction := pFIBTransactionRead;
        pFIBDataSet_post.Active := false;
        pFIBDataSet_post.Active := true;

        pFIBDataSet_id_dokument.Database := pFIBDatabase;
        pFIBDataSet_id_dokument.Transaction := pFIBTransactionRead;
        pFIBDataSet_id_dokument.Active := false;
        pFIBDataSet_id_dokument.Active := true;

        Priznak_vizova := Pr_vizova;
        cxDateEdit_dog.Date := Date;
        cxTextEdit_doc_d.Text := DateToStr(Date);
        cxDateEdit_krit_opl.Date := Date + pFIBDataSet_id_dokument.FieldByName('D_KRIT_DATE_DEF').AsInteger;

    //    id_p := -1;
     //   rate_acc_p := -1;

   //Тип договора в верху формы
        pFIBDataSet_tip_dog_add.Database := pFIBDatabase;
        pFIBDataSet_tip_dog_add.Transaction := pFIBTransactionRead;
        pFIBDataSet_tip_dog_add.Active := false;
        pFIBDataSet_tip_dog_add.ParamByName('pram_id_tip_dog').Value := id_t_d;
        pFIBDataSet_tip_dog_add.Active := true;
//        Label5.Caption := pFIBDataSet_tip_dog_add.FieldByName('short_name').AsString;
        cxTextEdit_tip_dog.Text := pFIBDataSet_tip_dog_add.FieldByName('short_name').AsString;
        Caption := 'Додання'+' '+pFIBDataSet_tip_dog_add.FieldByName('short_name').AsString;

        Label2.Visible := false;
        cxTextEdit_reg_nomer.Visible := false;

   //Выбор по умолчанию
        pFIBDataSet_tip_info.Database := pFIBDatabase;
        pFIBDataSet_tip_info.Transaction := pFIBTransactionRead;
        pFIBDataSet_tip_info.Active := false;
        pFIBDataSet_tip_info.ParamByName('d_id_tip_dog').Value := Id_t_d;
        pFIBDataSet_tip_info.Active := true;
        cxButtonEdit_name_un.Text := pFIBDataSet_tip_info.FieldByName('DEF_NAME_CUSTOMER').AsString;
        cxTextEdit_mfo_un.Text := pFIBDataSet_tip_info.FieldByName('DEF_MFO').AsString;
        cxTextEdit_rsch_un.Text := pFIBDataSet_tip_info.FieldByName('DEF_RSCHET').AsString;
        cxTextEdit_bank_un.Text := pFIBDataSet_tip_info.FieldByName('DEF_BANK_NAME').AsString;
        cxButtonEdit_name_p.Text := pFIBDataSet_tip_info.FieldByName('DEF_CUSTOMER_NAME').AsString;
        cxTextEdit_mfo_p.Text := pFIBDataSet_tip_info.FieldByName('DEF_CUST_MFO').AsString;
        cxTextEdit_rsch_p.Text := pFIBDataSet_tip_info.FieldByName('DEF_CUST_RSCHET').AsString;
        cxTextEdit_bank_p.Text := pFIBDataSet_tip_info.FieldByName('DEF_CUST_MFO_NAME').AsString;
        cxMemo_dog_note.Text := pFIBDataSet_tip_info.FieldByName('DEF_NOTE').AsString;
      end
      else
////////////////////////Просмотр документа
      begin
         inherited Create (Aowner);
        pFIBDatabase.Handle := DBHANDLE;
        pFIBDataSet_nds_procent.Database := pFIBDatabase;
        pFIBDataSet_nds_procent.Transaction := pFIBTransactionRead;
        pFIBDataSet_post.Database := pFIBDatabase;
        pFIBDataSet_post.Transaction := pFIBTransactionRead;
        pFIBDataSet_id_dokument.Database := pFIBDatabase;
        pFIBDataSet_id_dokument.Transaction := pFIBTransactionRead;
        pFIBDataSet_tip_dog.Database := pFIBDatabase;
        pFIBDataSet_tip_dog.Transaction := pFIBTransactionRead;
        pFIBDataSet_post.Active := false;
        pFIBDataSet_post.Active := true;
        pFIBDataSet_id_dokument.Active := false;
        pFIBDataSet_id_dokument.ParamByName('D_ID_DOG_VX').Value := id_dokument;
        pFIBDataSet_id_dokument.Active := true;
        cxMaskEdit_n_dog.Text := pFIBDataSet_id_dokument.FieldByName('d_n_dog').AsString;
        cxDateEdit_dog.Date := pFIBDataSet_id_dokument.FieldByName('d_d_dog').AsDateTime;
        CurrencyEdit_summa.Text := pFIBDataSet_id_dokument.FieldByName('d_summa').AsString;
        cxDateEdit_krit_opl.Date := pFIBDataSet_id_dokument.FieldByName('d_krit_date').AsDateTime;
        CurrencyEdit_nds.Text := pFIBDataSet_id_dokument.FieldByName('d_nds_sum').AsString;
        cxMemo_dog_note.Text := pFIBDataSet_id_dokument.FieldByName('d_dog_note').AsString;
        cxTextEdit_reg_nomer.Text := pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString;
        CurrencyEdit_opl.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_opl').AsVariant;
        CurrencyEdit_summa_pay.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_pay').AsString;
        CurrencyEdit_sum_fulfil.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_fulfil').AsString;

        id_doc := id_dokument;

        //Данные по типам договоров
        pFIBDataSet_tip_dog.Active := false;
        pFIBDataSet_tip_dog.ParamByName('param_document').Value := id_dokument;
        pFIBDataSet_tip_dog.Active := true;
        id_tip_dog := pFIBDataSet_tip_dog.FieldByName('id_tip_dog').AsVariant;
//        Label5.Caption := pFIBDataSet_tip_dog.FieldByName('short_name').AsString;
        cxTextEdit_tip_dog.Text := pFIBDataSet_tip_dog.FieldByName('short_name').AsString;

        //Данные по native
        cxButtonEdit_name_un.Text := pFIBDataSet_id_dokument.FieldByName('D_NAME_CUSTOMER_N').AsString;
        cxTextEdit_mfo_un.Text := pFIBDataSet_id_dokument.FieldByName('D_MFO_N').AsString;
        cxTextEdit_bank_un.Text := pFIBDataSet_id_dokument.FieldByName('D_BANK_NAME_N').AsString;
        cxTextEdit_rsch_un.Text := pFIBDataSet_id_dokument.FieldByName('D_RSCH_N').AsString;
        rate_acc_un := pFIBDataSet_id_dokument.FieldByName('D_ID_RATE_ACC_NATIVE').AsVariant;

        //Данные по контрагенту
        rate_acc_p := pFIBDataSet_id_dokument.FieldByName('D_ID_RATE_ACCOUNT').AsVariant;
        cxButtonEdit_name_p.Text := pFIBDataSet_id_dokument.FieldByName('d_name_customer_k').AsString;
        cxTextEdit_mfo_p.Text := pFIBDataSet_id_dokument.FieldByName('D_MFO_K').AsString;
        cxTextEdit_bank_p.Text := pFIBDataSet_id_dokument.FieldByName('D_BANK_NAME_K').AsString;
        cxTextEdit_rsch_p.Text := pFIBDataSet_id_dokument.FieldByName('D_RSCH_K').AsString;
        id_customer := pFIBDataSet_id_dokument.FieldByName('D_ID_CUSTOMER').AsVariant;
        name_customer := pFIBDataSet_id_dokument.FieldByName('D_NAME_CUSTOMER_K').AsString;

        //Данные по смете
//        nds_procent:=pFIBDataSet_id_dokument.FieldByName('D_NDS_PROCENT').AsVariant;
        pFIBDataSet_smet_info.Database := pFIBDatabase;
        pFIBDataSet_smet_info.Transaction := pFIBTransactionRead;
        pFIBDataSet_smeta.Database := pFIBDatabase;
        pFIBDataSet_smeta.Transaction := pFIBTransactionRead;
        pFIBDataSet_razd_st.Database := pFIBDatabase;
        pFIBDataSet_razd_st.Transaction := pFIBTransactionRead;
        pFIBDataSet_smet_info.Active := false;
        pFIBDataSet_smet_info.ParamByName('param_doc').Value := id_dokument;
        pFIBDataSet_smet_info.Active := true;
        pFIBDataSet_smet_info.FetchAll;
        pFIBDataSet_smet_info.First;
        for i := 0 to pFIBDataSet_smet_info.RecordCount-1 do
        begin
          pFIBDataSet_smeta.Active := false;
          pFIBDataSet_smeta.ParamByName('id_smeta').Value := pFIBDataSet_smet_info.FieldByName('id_smeta').AsVariant;
          pFIBDataSet_smeta.Active := true;

          RxMemoryData_smet.Open;
          RxMemoryData_smet.Insert;

          pFIBDataSet_razd_st.Active := false;
          pFIBDataSet_razd_st.ParamByName('id_razd_st_in').Value := pFIBDataSet_smet_info.FieldByName('id_razd').AsVariant;
          pFIBDataSet_razd_st.Active := true;

          RxMemoryData_smet.FieldByName('name_smet').Value := pFIBDataSet_smeta.FieldByName('SMETA_TITLE').AsVariant;
          RxMemoryData_smet.FieldByName('kod_smety').Value := pFIBDataSet_smeta.FieldByName('SMETA_KOD').AsVariant;
          RxMemoryData_smet.FieldByName('n_razd').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_NUM').AsVariant;
          RxMemoryData_smet.FieldByName('name_razd').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_TITLE').AsVariant;

          pFIBDataSet_razd_st.Active := false;
          pFIBDataSet_razd_st.ParamByName('id_razd_st_in').Value := pFIBDataSet_smet_info.FieldByName('id_stat').AsVariant;
          pFIBDataSet_razd_st.Active := true;

          RxMemoryData_smet.FieldByName('name_stat').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_TITLE').AsVariant;
          RxMemoryData_smet.FieldByName('n_stat').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_NUM').AsVariant;
          RxMemoryData_smet.FieldByName('sum_smet').Value := pFIBDataSet_smet_info.FieldByName('summa').AsVariant;

          RxMemoryData_smet.FieldByName('id').Value := pFIBDataSet_smet_info.FieldByName('id_dt_smet_dog').AsVariant;
          RxMemoryData_smet.Post;
          pFIBDataSet_smet_info.Next;
       end;

        Caption := 'Перегляд'+' '+pFIBDataSet_tip_dog.FieldByName('short_name').AsString;
        cxMaskEdit_n_dog.Enabled := false;
        cxDateEdit_dog.Enabled := false;
        CurrencyEdit_sum_po_smet.Enabled := false;
        CurrencyEdit_nds.Enabled := false;
        cxMemo_dog_note.Enabled := false;
        cxDateEdit_krit_opl.Enabled := false;
        ToolButton_add.Enabled := false;
        ToolButton_del.Enabled := false;
        cxButtonEdit_name_p.Enabled:=false;
        cxButtonEdit_name_un.Enabled:=false;
        cxTextEdit_bank_p.Enabled:=false;
        cxTextEdit_mfo_p.Enabled:=false;
        cxTextEdit_rsch_p.Enabled:=false;
        cxTextEdit_bank_un.Enabled:=false;
        cxTextEdit_mfo_un.Enabled:=false;
        cxTextEdit_rsch_un.Enabled:=false;
        GroupBox2.Enabled := false;
        GroupBox3.Enabled := false;
        CurrencyEdit_opl.Enabled := false;
        cxTextEdit_doc_d.Text := cxDateEdit_dog.Text;

        Priznak_vizova := Pr_vizova;
      end;
end;}

//Данные по смете
function TfrmPredopl.GetSmeta(p_smeta,p_razdel,p_stat:String; sum_smet:Variant;
p_id_smet,p_kod_smet,p_nomer_razd,p_nomer_stat:Integer; id_smet, id_razd, id_stat: Variant):Variant;
begin
  id_smeta := id_smet;
  id_dt_smet := RxMemoryData_smet.FieldByName('id').AsVariant;
  RxMemoryData_smet.Locate('id', id_dt_smet, []);
  RxMemoryData_smet.Open;
  RxMemoryData_smet.Insert;
  RxMemoryData_smet.FieldByName('id_smet').Value := id_smet;
  RxMemoryData_smet.FieldByName('id_razd').Value := id_razd;
  RxMemoryData_smet.FieldByName('id_stat').Value := id_stat;
  RxMemoryData_smet.FieldByName('sum_smet').Value := sum_smet;
  RxMemoryData_smet.FieldByName('name_smet').Value := p_smeta;
  RxMemoryData_smet.FieldByName('name_razd').Value := p_razdel;
  RxMemoryData_smet.FieldByName('name_stat').Value := p_stat;
  RxMemoryData_smet.FieldByName('kod_smety').Value := p_kod_smet;
  RxMemoryData_smet.FieldByName('n_razd').Value := p_nomer_razd;
  RxMemoryData_smet.FieldByName('n_stat').Value := p_nomer_stat;
  RxMemoryData_smet.FieldByName('id').Value := 0;
  RxMemoryData_smet.FieldByName('flag_del').Value := 0;
  RxMemoryData_smet.Post;
end;

procedure TfrmPredopl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{  SavePositionToRegistry(Self);
  Action := caFree;}
end;

//Данные по контрагенту из внешнего справочника
procedure TfrmPredopl.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  post: Variant;
begin
if Priznak_vizova = 'prosmotr'  then Exit
else
begin
  if VarIsClear(id_p) then id_p := -1;
  if VarIsClear(rate_acc_p) then rate_acc_p := -1;
  post := ShowCustomers(Self, pFIBDatabase.Handle, fsNormal, Date, csmRateAcc,id_p,rate_acc_p);

  if VarArrayDimCount(post) > 0 then
  begin
    if post[0] > 0 then
        begin
          id_p := post[0];
          rate_acc_p := post[1];
          cxTextEdit_rsch_p.Text := post[2];
          cxTextEdit_mfo_p.Text := post[5];
          cxTextEdit_bank_p.Text := post[6];
          pFIBDataSet_post.Active := false;
          pFIBDataSet_post.ParamByName('param_cust').Value := id_p;
          pFIBDataSet_post.Active := true;
          name_p := pFIBDataSet_post.FieldByName('name_customer').AsString;
          cxButtonEdit_name_p.Text := name_p;
        end;
  end;
  end;
end;

procedure TfrmPredopl.FormCreate(Sender: TObject);
begin
{
  pFIBDataSet_nds_procent.Database := pFIBDatabase;
  pFIBDataSet_nds_procent.Transaction := pFIBTransactionRead;
  pFIBDataSet_post.Database := pFIBDatabase;
  pFIBDataSet_post.Transaction := pFIBTransactionRead;
  pFIBDataSet_post.Active := false;
  pFIBDataSet_post.Active := true;
  pFIBDataSet_id_dokument.Database := pFIBDatabase;
  pFIBDataSet_id_dokument.Transaction := pFIBTransactionRead;
  pFIBDataSet_id_dokument.Active := false;
  pFIBDataSet_id_dokument.Active := true;
  pFIBDataSet_tip_dog.Database := pFIBDatabase;
  pFIBDataSet_tip_dog.Transaction := pFIBTransactionRead;
  pFIBDataSet_tip_dog.Active := false;
  pFIBDataSet_tip_dog.Active := true;
  pFIBDataSet_tip_dog_add.Database := pFIBDatabase;
  pFIBDataSet_tip_dog_add.Transaction := pFIBTransactionRead;
  pFIBDataSet_tip_dog_add.Active := false;
  pFIBDataSet_tip_dog_add.Active := true;
  pFIBDataSet_tip_info.Database := pFIBDatabase;
  pFIBDataSet_tip_info.Transaction := pFIBTransactionRead;
  pFIBDataSet_tip_info.Active := false;
  pFIBDataSet_tip_info.Active := true;
  pFIBDataSet_smeta.Database := pFIBDatabase;
  pFIBDataSet_smeta.Transaction := pFIBTransactionRead;
  pFIBDataSet_smeta.Active := false;
  pFIBDataSet_smeta.Active := true;
  pFIBDataSet_smet_info.Database := pFIBDatabase;
  pFIBDataSet_smet_info.Transaction := pFIBTransactionRead;
  pFIBDataSet_smet_info.Active := false;
  pFIBDataSet_smet_info.Active := true;
  pFIBDataSet_razd_st.Database := pFIBDatabase;
  pFIBDataSet_razd_st.Transaction := pFIBTransactionRead;
  pFIBDataSet_razd_st.Active := false;
  pFIBDataSet_razd_st.Active := true;

 }
 //Интерфейс
//  Label21.Caption:='';
//  Label22.Caption:='';
//  Label23.Caption:='';
//  cxButton_ok.Caption:=Resources_unit.PUB_BUTTON_OK_CONST;
//  cxButton_cancel.Caption:=Resources_unit.PUB_BUTTON_CANCEL_CONST;
//  ToolButton_add.Caption:=Resources_unit.PUB_ACTION_ADD_CONST;
//  ToolButton_red.Caption:=Resources_unit.PUB_ACTION_UPDATE_CONST;
//  ToolButton_del.Caption:=Resources_unit.PUB_ACTION_DELETE_CONST;
//  Label4.Caption:=Resources_unit.DT_NOMER;
{  Label3.Caption:=Resources_unit.DT_OT;
  Label29.Caption:=Resources_unit.DT_OT;
  cxGrid1DBTableView1DBColumn_smeta.Caption:=Resources_unit.DT_SMETA;
  cxGrid1DBTableView1DBColumn4.Caption:=Resources_unit.DT_RAZDEL;
  cxGrid1DBTableView1DBColumn5.Caption:=Resources_unit.DT_STAT;
  cxGrid1DBTableView1DBColumn2.Caption:=Resources_unit.DT_SUMMA;
  Label18.Caption:=Resources_unit.DT_SMETA;
  Label19.Caption:=Resources_unit.DT_RAZDEL;
  Label20.Caption:=Resources_unit.DT_STAT;
  Label1.Caption:=Resources_unit.DT_NDS;
  GroupBox2.Caption:=Resources_unit.DT_CUSTOMER;
  GroupBox3.Caption:=Resources_unit.DT_OTKUDA;
  Label24.Caption:=Resources_unit.DT_NAME_CUST;
  Label6.Caption:=Resources_unit.DT_MFO;
  Label7.Caption:=Resources_unit.DT_RSCH;
  Label8.Caption:=Resources_unit.DT_NAME_BANK;
  Label9.Caption:=Resources_unit.DT_MFO;
  Label10.Caption:=Resources_unit.DT_RSCH;
  Label11.Caption:=Resources_unit.DT_NAME_BANK;
  Label13.Caption:=Resources_unit.DT_OSTATOK_RSCH;
  Label12.Caption:=Resources_unit.DT_KRIT_DATE;
  Label14.Caption:=Resources_unit.DT_VIPOLNENO;
  Label15.Caption:=Resources_unit.DT_OPLACHENO;
  Label17.Caption:=Resources_unit.DT_SUMMA_DOC;
  Label32.Caption:=Resources_unit.DT_SUMMA_DOC;
  Label16.Caption:=Resources_unit.DT_SUMMA_OPL;
}
end;

procedure TfrmPredopl.cxButton_cancelClick(Sender: TObject);
begin
  if Assigned(fProc) then fProc(-1, raClose);
  Close;
end;

//Данные по счетам ДонНУ из моего справочника
procedure TfrmPredopl.cxButtonEdit_name_unPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  ret: Variant;
begin
if Priznak_vizova = 'prosmotr'  then Exit
else
begin
  ret := LoadDogManedger.WorkSpMfoRsch(self, pFIBDatabase.Handle, fsNormal, 'get', 32099);
  if VarArrayDimCount(ret) > 0 then
  begin
    if ret[0][0] > 0 then
    begin
      rate_acc_un := ret[0][0];
      cxButtonEdit_name_un.Text := ret[0][1];
      cxTextEdit_mfo_un.Text := ret[0][2];
      cxTextEdit_rsch_un.Text := ret[0][3];
      cxTextEdit_bank_un.Text := ret[0][4];
//      CurrencyEdit_sum_pay.Text:=ret[0][7];
//      CurrencyEdit_sum_case.Text:=ret[0][8];
    end;
  end;
  end;
end;

procedure TfrmPredopl.RxMemoryData_smetAfterScroll(DataSet: TDataSet);
begin
{  Label21.Caption := RxMemoryData_smet.FieldByName('name_smet').AsString;
  Label22.Caption := RxMemoryData_smet.FieldByName('name_razd').AsString;
  Label23.Caption := RxMemoryData_smet.FieldByName('name_stat').AsString;
  Label21.Hint := RxMemoryData_smet.FieldByName('name_smet').AsString;
  Label21.ShowHint := true;
  Label22.Hint := RxMemoryData_smet.FieldByName('name_razd').AsString;
  Label22.ShowHint := true;
  Label23.Hint := RxMemoryData_smet.FieldByName('name_stat').AsString;
  Label23.ShowHint := true;  }
end;

procedure TfrmPredopl.cxButton_okClick(Sender: TObject);
var
  i: Integer;
  nds, sum_pay: Variant;
  sum_today: Variant; //Сумма к оплате
  D_date: TDate;
  s_smet, s_pay, s_doc, temp_sum: Currency;
  action : TResAction;
begin
{     action := raView;
     //проверка на корректность даты договора
     if Priznak_vizova = 'add' then
     begin
     action := raAdd;
      cxTextEdit_doc_d.Text := cxDateEdit_dog.Text;
      if (cxDateEdit_dog.Date > Date) then
      begin
        ShowMessage('Дата не повинна бути більш ніж поточна');
        cxDateEdit_dog.SetFocus;
        Exit;
      end;

      D_date := Date - VarToDateTime(pFIBDataSet_id_dokument.FieldByName('D_DATE_D_DOG_DEF').Value);
      if (cxDateEdit_dog.Date < D_date) then
      begin
        ShowMessage('Дата не повинна бути менше ніж'+'  '+DateToStr(D_date));
        cxDateEdit_dog.SetFocus;
        Exit;
      end;
    end;  }

        //Сумма смет + сумма оплаченная = сумме документа
  {    sum_pay:=pFIBDataSet_id_dokument.FieldByName('d_sum_pay').AsVariant;
      if sum_pay<0 then sum_pay:=0;
      if (sum_doc<>sum_po_smet+sum_pay) then
      begin
        ShowMessage('Сумма смет + сумма оплаченная <> сумме документа');
        CurrencyEdit_opl.SetFocus;
        Exit;
      end
      else
      begin
       // ShowMessage(varToStr(sum_po_smet+sum_pay));
      end;
   }
  {  s_smet := CurrencyEdit_sum_po_smet.Value;
    s_pay  := CurrencyEdit_summa_pay.Value;
    s_doc  := CurrencyEdit_summa.Value;
    if (s_doc <> s_smet + s_pay) then
    begin
        ShowMessage('Сума кошторису + сума оплачена не дорівнює сумі документа');
        CurrencyEdit_opl.SetFocus;
        Exit;
    end;


         // проверка на заполнение номера договора
    if  Trim(cxMaskEdit_n_dog.Text) = '' then
        begin
        MessageDlg(errDtNotNumber, mtError, [mbOk], 0);
        cxMaskEdit_n_dog.SetFocus;
        Exit;
    end;

         //проверка на заполнение смет
     if cxGrid1DBTableView1DBColumn_smeta.EditValue = 0 then
     begin
       MessageDlg(errNotSmet, mtError, [mbOk], 0);
       Exit;
     end;

         // проверка на заполнение контрагента
    if  Trim(cxButtonEdit_name_p.Text) = '' then
        begin
        MessageDlg(errDtNotKontragent, mtError, [mbOk], 0);
        cxButtonEdit_name_p.SetFocus;
        Exit;
    end;

         // проверка на заполнение счета ДонНУ
    if  Trim(cxButtonEdit_name_un.Text) = '' then
        begin
        MessageDlg(errDtNotDonnu, mtError, [mbOk], 0);
        cxButtonEdit_name_un.SetFocus;
        Exit;
    end;

       //проверка на заполнение основания
    if Trim(cxMemo_dog_note.Text) = '' then
      begin
        MessageDlg(errDtNotNote, mtError, [mbOk], 0);
        cxMemo_dog_note.SetFocus;
        Exit;
      end;

       //проверка на корректность критической даты оплаты
    if (cxDateEdit_dog.Date > cxDateEdit_krit_opl.Date) then
      begin
        MessageDlg(errDtKritDate, mtError, [mbOk], 0);
        cxDateEdit_krit_opl.SetFocus;
        Exit;
      end;

    //Проверка на корректность суммы к оплате
    sum_today := CurrencyEdit_opl.Value;
    sum_doc   := CurrencyEdit_summa.Value;
    sum_pay   := CurrencyEdit_summa_pay.Value;
    if sum_today < 0 then sum_today := 0;
    if sum_doc   < 0 then sum_doc := 0;
    if sum_pay   < 0 then sum_pay := 0;
    temp_sum := sum_doc - sum_pay;
    if (sum_today > temp_sum) then
    begin
        ShowMessage('Некорректно задана сума до оплати');
        CurrencyEdit_opl.SetFocus;
        CurrencyEdit_opl.Text := sum_doc - sum_pay;
        Exit;
    end;


       //Проверка на корректность суммы к оплате
      if CurrencyEdit_opl.Value > CurrencyEdit_summa_pay.Value + CurrencyEdit_sum_po_smet.Value then
       begin
        ShowMessage('Сумма до оплати перевищує суму документа');
        CurrencyEdit_opl.SetFocus;
        CurrencyEdit_opl.Text := sum_doc - sum_pay;
        Exit;
      end;


         //проверка НДС
      if CurrencyEdit_nds.Text = '' then
      begin
        nds := 0;
      end
      else
      begin
        nds := StrToCurr(CurrencyEdit_nds.Text);
        if nds > sum_doc then
        begin
          ShowMessage('ПДВ не може превищувати суму документа');
          CurrencyEdit_nds.SetFocus;
          Exit;
        end;
      end;


  if Priznak_vizova = 'add' then
  begin
    action := raAdd;
    pFIBStoredProc_dt_add.Database := pFIBDatabase;
    pFIBStoredProc_dt_add.Transaction := pFIBTransactionWrite;
    pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
    pFIBTransactionWrite.StartTransaction;
    pFIBStoredProc_dt_add.StoredProcName := 'DOG_DT_DOCUMENT_INSERT';
    pFIBStoredProc_dt_add.Prepare;
    pFIBStoredProc_dt_add.ParamByName('D_KOD_DOG').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_N_DOG').Value := cxMaskEdit_n_dog.Text;
    pFIBStoredProc_dt_add.ParamByName('D_D_DOG').Value := cxDateEdit_dog.Date;

    if Trim(CurrencyEdit_summa.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_SUMMA').Value := 0 else
    pFIBStoredProc_dt_add.ParamByName('D_SUMMA').Value := CurrencyEdit_summa.Text;

    if Trim(cxMemo_dog_note.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_DOG_NOTE').Value := '' else
    pFIBStoredProc_dt_add.ParamByName('D_DOG_NOTE').Value := Trim(cxMemo_dog_note.Text);

    pFIBStoredProc_dt_add.ParamByName('D_KRIT_DAT').Value := cxDateEdit_krit_opl.Text;

    if Trim(CurrencyEdit_nds.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_NDS_SUM').Value := 0 else
    pFIBStoredProc_dt_add.ParamByName('D_NDS_SUM').Value := CurrencyEdit_nds.Text;

/////// если выбран по умолчанию, то из info, иначе из справочника
//    if rate_acc_p = 0 then
    if (pFIBDataSet_tip_info.FieldByName('DEF_ID_RATE_ACC').Value > 0) then
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACCOUNT').Value := pFIBDataSet_tip_info.FieldByName('DEF_ID_RATE_ACC').AsVariant else
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACCOUNT').Value := rate_acc_p;

//    if rate_acc_un = 0 then
    if (pFIBDataSet_tip_info.FieldByName('DEF_ID_RATE_ACC_NATIVE').Value > 0) then
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACC_NATIVE').Value := pFIBDataSet_tip_info.FieldByName('DEF_ID_RATE_ACC_NATIVE').AsString else
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACC_NATIVE').Value := rate_acc_un;

    if pFIBDataSet_post.FieldByName('id_customer').AsVariant <= 0 then
    begin
      pFIBStoredProc_dt_add.ParamByName('D_ID_CUSTOMER').Value := pFIBDataSet_tip_info.FieldByName('DEF_CUSTOMER').AsString;
      pFIBStoredProc_dt_add.ParamByName('D_NAME_CUSTOMER').Value := pFIBDataSet_tip_info.FieldByName('DEF_CUSTOMER_NAME').AsString;
    end
    else
    begin
      pFIBStoredProc_dt_add.ParamByName('D_ID_CUSTOMER').Value := pFIBDataSet_post.FieldByName('id_customer').AsVariant;
      pFIBStoredProc_dt_add.ParamByName('D_NAME_CUSTOMER').Value := pFIBDataSet_post.FieldByName('name_customer').AsVariant;
    end;

    pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_CONTINUE').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_BEFOR_PAY').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_CLOSE').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_ID_TIP_DOG').Value := pFIBDataSet_tip_dog_add.fieldByName('id_tip_dog').AsVariant;
    if Trim(CurrencyEdit_opl.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_SUM_OPL').Value := 0 else
    pFIBStoredProc_dt_add.ParamByName('D_SUM_OPL').Value := CurrencyEdit_opl.Text;
    pFIBStoredProc_dt_add.ParamByName('d_sum_pay').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_NDS_PAY').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_SUM_FULFIL').Value := 0;
    try
      pFIBStoredProc_dt_add.ExecProc;
    except  on e:Exception do
      begin
        ShowMessage(e.Message);
        pFIBTransactionWrite.Rollback;
        Exit;
      end;
    end;
//      id_dog:= pFIBStoredProc_dt_add.FieldByName('param_dog').asVariant;// Идентификатор добавленного договора  id_document
      kod_dog := pFIBStoredProc_dt_add.FieldByName('VIX_KOD_DOG').AsVariant;
      pFIBTransactionWrite.Commit;


    // Добавление сметы
      RxMemoryData_smet.First;
      for i := 0 to RxMemoryData_smet.RecordCount-1 do
      begin
         if (RxMemoryData_smet.FieldByName('flag_del').Value = 1) then
           begin
             RxMemoryData_smet.Next;
           end
           else
           begin
               pFIBStoredProc_dt_add.Database := pFIBDatabase;
               pFIBStoredProc_dt_add.Transaction := pFIBTransactionWrite;
               pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
               pFIBTransactionWrite.StartTransaction;
               pFIBStoredProc_dt_add.StoredProcName := 'DOG_DT_SMET_INSERT';
               pFIBStoredProc_dt_add.Prepare;
               pFIBStoredProc_dt_add.ParamByName('D_ID_DOG').Value := kod_dog;
               pFIBStoredProc_dt_add.ParamByName('D_ID_SMETA').Value := RxMemoryData_smet.FieldByName('id_smet').Value;
               pFIBStoredProc_dt_add.ParamByName('D_RAZD').Value := RxMemoryData_smet.FieldByName('id_razd').Value;
               pFIBStoredProc_dt_add.ParamByName('D_ID_STAT').Value := RxMemoryData_smet.FieldByName('id_stat').Value;
               pFIBStoredProc_dt_add.ParamByName('D_SUMMA_SM').Value := RxMemoryData_smet.FieldByName('sum_smet').Value;
               try
                 pFIBStoredProc_dt_add.ExecProc;
                 except
                   pFIBTransactionWrite.Rollback;
                   Exit;
               end;
               pFIBTransactionWrite.Commit;
               RxMemoryData_smet.Next;
           end;
      end;
    Close;
    end
    else

///////////////////Редактирование документа//////////////////////////
  begin
    action := raEdit;
    pFIBStoredProc_dt_add.Database := pFIBDatabase;
    pFIBStoredProc_dt_add.Transaction := pFIBTransactionWrite;
    pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
    pFIBTransactionWrite.StartTransaction;
    pFIBStoredProc_dt_add.StoredProcName := 'DOG_DT_DOCUMENT_UPDATE';
    pFIBStoredProc_dt_add.Prepare;
    pFIBStoredProc_dt_add.ParamByName('D_N_DOG').Value := cxMaskEdit_n_dog.Text;
    pFIBStoredProc_dt_add.ParamByName('D_D_DOG').Value := cxDateEdit_dog.Date;

//    if rate_acc_p = 0 then
    if (pFIBDataSet_tip_info.FieldByName('DEF_ID_RATE_ACC').Value > 0) then
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACCOUNT').Value := pFIBDataSet_tip_info.FieldByName('DEF_ID_RATE_ACC').AsVariant else
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACCOUNT').Value := rate_acc_p;

//    if rate_acc_un = 0 then
    if (pFIBDataSet_tip_info.FieldByName('DEF_ID_RATE_ACC_NATIVE').Value > 0) then
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACC_NATIVE').Value := pFIBDataSet_tip_info.FieldByName('DEF_ID_RATE_ACC_NATIVE').AsString else
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACC_NATIVE').Value := rate_acc_un;   }

 {   if pFIBDataSet_post.FieldByName('id_customer').AsVariant='' then
    begin
      pFIBStoredProc_dt_add.ParamByName('D_ID_CUSTOMER').Value:=pFIBDataSet_tip_info.FieldByName('DEF_CUSTOMER').AsString;
      pFIBStoredProc_dt_add.ParamByName('D_NAME_CUSTOMER').Value:=pFIBDataSet_tip_info.FieldByName('DEF_CUSTOMER_NAME').AsString;
    end
    else
    begin
      pFIBStoredProc_dt_add.ParamByName('D_ID_CUSTOMER').Value:=pFIBDataSet_post.FieldByName('id_customer').AsVariant;
      pFIBStoredProc_dt_add.ParamByName('D_NAME_CUSTOMER').Value:=pFIBDataSet_post.FieldByName('name_customer').AsVariant;
    end;
  }
{      pFIBStoredProc_dt_add.ParamByName('D_ID_CUSTOMER').Value := id_customer;
      pFIBStoredProc_dt_add.ParamByName('D_NAME_CUSTOMER').Value := name_customer;


    if Trim(CurrencyEdit_summa.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_SUMMA').Value := 0 else
    pFIBStoredProc_dt_add.ParamByName('D_SUMMA').Value := CurrencyEdit_summa.Text;
    if Trim(cxMemo_dog_note.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_DOG_NOTE').Value := '' else
    pFIBStoredProc_dt_add.ParamByName('D_DOG_NOTE').Value := Trim(cxMemo_dog_note.Text);
    pFIBStoredProc_dt_add.ParamByName('D_KRIT_DATE').Value := cxDateEdit_krit_opl.Date;
    if Trim(CurrencyEdit_nds.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_NDS_SUM').Value := 0 else
    pFIBStoredProc_dt_add.ParamByName('D_NDS_SUM').Value := CurrencyEdit_nds.Text;
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACCOUNT').Value := rate_acc_p;
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACC_NATIVE').Value := rate_acc_un;
    pFIBStoredProc_dt_add.ParamByName('D_ID_DOG').Value := id_doc;
    pFIBStoredProc_dt_add.ParamByName('D_CONTINUE').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').Value := 0;
    if Trim(CurrencyEdit_opl.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_SUM_OPL').Value := 0 else
    pFIBStoredProc_dt_add.ParamByName('D_SUM_OPL').Value := CurrencyEdit_opl.Text;
    try
      pFIBStoredProc_dt_add.ExecProc;
    except
      begin
        pFIBTransactionWrite.Rollback;
        Exit;
      end;
    end;
      pFIBTransactionWrite.Commit;     }

        // Редактирование сметы
        {
        Если flag_del=0, то не удаляем
        Если id=0, то єто новая запись и ее нужно добавить
        }
{      RxMemoryData_smet.First;
      for i := 0 to RxMemoryData_smet.RecordCount-1 do
      begin
             if (RxMemoryData_smet.FieldByName('id').Value = 0) and
               (RxMemoryData_smet.FieldByName('flag_del').Value = 0) then
              begin
                pFIBStoredProc_dt_add.Database := pFIBDatabase;
                pFIBStoredProc_dt_add.Transaction := pFIBTransactionWrite;
                pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
                pFIBTransactionWrite.StartTransaction;
                pFIBStoredProc_dt_add.StoredProcName := 'DOG_DT_SMET_INSERT';
                pFIBStoredProc_dt_add.Prepare;
                pFIBStoredProc_dt_add.ParamByName('D_ID_DOG').Value := id_dog_red;
                pFIBStoredProc_dt_add.ParamByName('D_ID_SMETA').Value := RxMemoryData_smet.FieldByName('id_smet').Value;
                pFIBStoredProc_dt_add.ParamByName('D_RAZD').Value := RxMemoryData_smet.FieldByName('id_razd').Value;
                pFIBStoredProc_dt_add.ParamByName('D_ID_STAT').Value := RxMemoryData_smet.FieldByName('id_stat').Value;
                pFIBStoredProc_dt_add.ParamByName('D_SUMMA_SM').Value := RxMemoryData_smet.FieldByName('sum_smet').Value;
            try
              pFIBStoredProc_dt_add.ExecProc;
            except
              pFIBTransactionWrite.Rollback;
              Exit;
            end;
              pFIBTransactionWrite.Commit;
            end
            else
            if (RxMemoryData_smet.FieldByName('id').Value <> 0) and (RxMemoryData_smet.FieldByName('flag_del').Value = 1) then
            begin
                pFIBStoredProc_dt_add.Database := pFIBDatabase;
                pFIBStoredProc_dt_add.Transaction := pFIBTransactionWrite;
                pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
                pFIBTransactionWrite.StartTransaction;
                pFIBStoredProc_dt_add.StoredProcName := 'DOG_DT_SMET_DELETE';
                pFIBStoredProc_dt_add.Prepare;
                pFIBStoredProc_dt_add.ParamByName('D_ID_DT_SMET').Value := RxMemoryData_smet.FieldByName('id').Value;
            try
              pFIBStoredProc_dt_add.ExecProc;
            except
              pFIBTransactionWrite.Rollback;
              Exit;
            end;
              pFIBTransactionWrite.Commit;
            end;
        RxMemoryData_smet.Next;
    end;
      Close;
    end;
  if Assigned(fProc) then fProc(id_doc, action);     }
end;


procedure TfrmPredopl.CurrencyEdit_ndsChange(Sender: TObject);
var
  t_nds: Currency;
begin
//  t_nds := StrToCurr(CurrencyEdit_nds.Text);
//  cxTextEdit_nds.Text := CurrToStr(RoundTo(t_nds,-2));
{  cxTextEdit_nds.Text := CurrencyEdit_nds.Text;
  if CurrencyEdit_nds.Value = 0 then
  cxTextEdit_nds.Text := 'БЕЗ ПДВ';   }
end;


procedure TfrmPredopl.cxMaskEdit_n_dogPropertiesChange(Sender: TObject);
begin
//   cxTextEdit_N.Text := cxMaskEdit_n_dog.Text;
end;

procedure TfrmPredopl.cxMaskEdit_n_dogKeyPress(Sender: TObject;
  var Key: Char);
begin
//  if not(key in ['0'..'9']) and (key<>#8)
//  then    key:=#0;
end;

//подсчет суммы документа
procedure TfrmPredopl.SummaDoc();
var
  temp: Variant;
  i: Integer;
begin
{  if Priznak_vizova = 'add' then
  sum_doc := CurrencyEdit_summa.Value else
  sum_doc := pFIBDataSet_id_dokument.FieldByName('d_summa').AsVariant;

  if sum_doc < 0 then sum_doc := 0;
  RxMemoryData_smet.First;
//  for i := 0 to RxMemoryData_smet.RecordCount-1 do
//  begin
    if (RxMemoryData_smet.FieldByName('flag_del').Value <> 1) and (RxMemoryData_smet.FieldByName('id').Value = 0) then
    begin
      temp := RxMemoryData_smet.FieldByName('sum_smet').AsVariant;
      sum_doc := sum_doc + temp;
    end
    else
    if (RxMemoryData_smet.FieldByName('flag_del').Value = 1) then
    begin
      temp := RxMemoryData_smet.FieldByName('sum_smet').AsVariant;
      sum_doc := sum_doc - temp;
    end;
//    RxMemoryData_smet.Next;
//  end;
  SumNds();
//  ShowMessage(VarToStr(sum_doc));    }
end;

//Подсчет суммы по смете
procedure TfrmPredopl.Summa();
var
  i: Integer;
  temp: Variant;
  kol_vo_smet: Integer;
begin
{  sum_po_smet := 0;
  RxMemoryData_smet.First;
  kol_vo_smet := 0;
  for i := 0 to RxMemoryData_smet.RecordCount-1 do
  begin
    if RxMemoryData_smet.FieldByName('flag_del').Value <> 1 then
    begin
      temp := RxMemoryData_smet.FieldByName('sum_smet').AsVariant;
      sum_po_smet := sum_po_smet + temp;
      kol_vo_smet := kol_vo_smet + 1;
    end;
    RxMemoryData_smet.Next;
  end;
   cxTextEdit_kol_vo_smet.Text := IntToStr(kol_vo_smet);
   CurrencyEdit_sum_po_smet.Text := VarToStr(sum_po_smet);
//   CurrencyEdit_summa.Text:=VarToStr(sum_po_smet);      }
end;

procedure TfrmPredopl.RxMemoryData_smetAfterDelete(DataSet: TDataSet);
begin
  Summa();
//  SummaDoc();
//  SumNds();
end;

procedure TfrmPredopl.RxMemoryData_smetAfterPost(DataSet: TDataSet);
begin
  Summa();
//  SummaDoc();
//  SumNds();
end;

procedure TfrmPredopl.SumNds();
var
  sum_d: Currency;
begin
{   if Priznak_vizova = 'add' then
   begin
      sum_d := CurrencyEdit_sum_po_smet.Value;
      pFIBDataSet_nds_procent.Database := pFIBDatabase;
      pFIBDataSet_nds_procent.Transaction := pFIBTransactionRead;
      pFIBDataSet_nds_procent.Active := false;
      pFIBDataSet_nds_procent.ParamByName('D_D_DOG').Value := cxDateEdit_dog.Text;
      pFIBDataSet_nds_procent.Active := true;
      nds_procent := pFIBDataSet_nds_procent.FieldByName('D_NDS_PROCENT').AsVariant;
      if nds_procent<=0 then nds_procent := 20;
      sum_nds := (sum_d*nds_procent)/(100+nds_procent);
      CurrencyEdit_nds.Text := VarToStr(sum_nds);
   end;       }
end;

procedure TfrmPredopl.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_DELETE then
  begin
    Key := 0;
  end;
end;

procedure TfrmPredopl.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect: TRect;
begin
{  Arect := AViewInfo.Bounds;
  ACanvas.Canvas.Pen.Color := clBlack;
  if AViewInfo.GridRecord.Values[4] = 1 then
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
    end;  }
end;

procedure TfrmPredopl.CurrencyEdit_sum_po_smetChange(Sender: TObject);
begin
 // CurrencyEdit_summa.Text:=CurrencyEdit_sum_po_smet.Text;
 {if Priznak_vizova = 'add' then
  begin
    CurrencyEdit_summa.Text:=CurrencyEdit_sum_po_smet.Text;
  end;}
end;

procedure TfrmPredopl.CurrencyEdit_oplChange(Sender: TObject);
begin
{  if CurrencyEdit_summa.Value < CurrencyEdit_opl.Value then
  begin
    ShowMessage('Сумма до оплати перевищує суму документа');
    CurrencyEdit_opl.SetFocus;
  end;}
end;

procedure TfrmPredopl.CurrencyEdit_ndsExit(Sender: TObject);
var
  nds: Variant;
begin
{  nds:=StrToCurr(CurrencyEdit_nds.Text);
  if nds>sum_po_smet then
  begin
    ShowMessage('НДС не может превышать сумму документа');
    CurrencyEdit_nds.SetFocus;
  end;}
end;

procedure TfrmPredopl.CurrencyEdit_oplExit(Sender: TObject);
var
  sum_k_opl: Variant;
  sum_pay: Variant;
  sum_doc: Variant;
  temp: Variant;
begin

{  if Priznak_vizova = 'add' then
  begin
    sum_pay := 0;
  end
  else
  begin
    sum_pay := pFIBDataSet_id_dokument.FieldByName('d_sum_pay').Value;
  end;

  if CurrencyEdit_opl.Text = '' then
  sum_k_opl := 0 else
  sum_k_opl := StrToFloat(CurrencyEdit_opl.Text);

  if CurrencyEdit_summa.Text = '' then sum_doc := 0 else
  sum_doc := StrToFloat(CurrencyEdit_summa.Text);

  temp := sum_doc - sum_pay;

  if (sum_k_opl > temp) then
  begin
    ShowMessage('Сума до оплати перевищує неоплачену суму документа');
    CurrencyEdit_opl.Text := temp;
  end; }
end;

procedure TfrmPredopl.Label14Click(Sender: TObject);
begin
//  ShowMessage('Дані відсутні!');
end;

procedure TfrmPredopl.Label15Click(Sender: TObject);
begin
//  ShowMessage('Дані відсутні!');
end;

procedure TfrmPredopl.Label15MouseLeave(Sender: TObject);
begin
{  Label15.font.color := clBlack;
  Label15.font.Style := [];}
end;

procedure TfrmPredopl.Label15MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 { Label15.font.color := clBlue;
  Label15.font.Style := [fsUnderline];}
end;

procedure TfrmPredopl.add_smetExecute(Sender: TObject);
begin
  dxBarLargeButton_addClick(Self);
end;

procedure TfrmPredopl.del_smetExecute(Sender: TObject);
begin
//  dxBarLargeButton_delClick(Self);
end;

procedure TfrmPredopl.N1Click(Sender: TObject);
begin
//  dxBarLargeButton_addClick(Self);
end;

procedure TfrmPredopl.N2Click(Sender: TObject);
begin
 // dxBarLargeButton_delClick(Self);
end;

procedure TfrmPredopl.cxDateEdit_dogPropertiesChange(Sender: TObject);
begin
//  cxTextEdit_doc_d.Text := cxDateEdit_dog.Text;
end;

procedure TfrmPredopl.FormShow(Sender: TObject);
begin
//  LoadPositionFromRegistry(Self);
  CurrencyEdit_opl.SetFocus;
end;

procedure TfrmPredopl.EditSum();
begin
//
end;

procedure TfrmPredopl.Label17MouseLeave(Sender: TObject);
begin
{  if Priznak_vizova = 'red' then
  begin
    Label17.font.color := clBlack;
    Label17.font.Style := [];
  end;}
end;

procedure TfrmPredopl.Label17MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
{  if Priznak_vizova = 'red' then
  begin
    Label17.font.color := clBlue;
    Label17.font.Style := [fsUnderline];
  end;    }
end;

procedure TfrmPredopl.dxBarLargeButton_addClick(Sender: TObject);
var
  Add_smet: TfrmAddSmetSh2;
begin
{  Add_smet:=TfrmAddSmetSh2.Create(Self,0,0,0,'','','',0,0,0,false,0,self);
  Add_smet.ShowModal;
  SumNds();
  SummaDoc();
  Add_smet.Free;}
end;

procedure TfrmPredopl.dxBarLargeButton_delClick(Sender: TObject);
var
  id_sm: Variant;
begin
{
  //проверка на непустое значение
  if cxGrid1DBTableView1DBColumn_smeta.EditValue = 0 then
  begin
    Exit;
  end;

  RxMemoryData_smet.Open;
  RxMemoryData_smet.Edit;
  if RxMemoryData_smet.FieldByName('Flag_del').Value = 1 then
    begin
      RxMemoryData_smet.FieldByName('Flag_del').Value := 0;
    end
    else
    begin
      if MessageBox(Handle,PChar('Вы дійсно бажаєте видалити кошторис?'),
      'Підтвердження видалення',MB_YesNo or MB_Iconquestion) = mrYes then
      RxMemoryData_smet.FieldByName('Flag_del').Value := 1;
    end;
  RxMemoryData_smet.Post;
  SumNds();
  SummaDoc();
  id_sm := RxMemoryData_smet.FieldByName('id').Value;
  RxMemoryData_smet.Locate('id', id_sm, []);     }

end;


end.



