unit Shablon6;
{*******************************************************************************
* Shablon6                                                                     *
*                                                                              *
* Работа с договорами, Шаблон 6(с физлицами)                                   *
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
  pFIBStoredProc, Menus, cxTL, Math, dxBar, dxBarExtItems, dogLoaderUnit,
  dogLangPackUnit2, dxStatusBar,uCommonSp,AArray,LoaderUnit,Add_smet_sh6;

resourcestring
    errDtNotNumber = 'Номер договору не заповнен!';
    errDtNotKontragent = 'Виберіть контрагента!';
    errDtNotDonnu = 'Виберіть рахунок ДонНУ!';
    errDtNotNote = 'Підстава договору не заповнена!';
    errDtKritDate = 'Некоректно введена критична дата оплати!';
    errNotSmet = 'Необхідно додати кошторис!';
    errSumOtr = 'Сума повинна бути більше нуля!';

type
  TfrmShablon6 = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    Label27: TLabel;
    Bevel1: TBevel;
    cxMaskEdit_n_dog: TcxMaskEdit;
    cxDateEdit_dog: TcxDateEdit;
    cxTextEdit_reg_nomer: TcxTextEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label24: TLabel;
    cxButtonEdit_name_p: TcxButtonEdit;
    cxTextEdit_mfo_p: TcxTextEdit;
    cxTextEdit_rsch_p: TcxTextEdit;
    cxTextEdit_bank_p: TcxTextEdit;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    cxButtonEdit_name_un: TcxButtonEdit;
    cxTextEdit_mfo_un: TcxTextEdit;
    cxTextEdit_rsch_un: TcxTextEdit;
    cxTextEdit_bank_un: TcxTextEdit;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    id_payer: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn_smeta: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    GroupBox8: TGroupBox;
    CurrencyEdit_sum_po_smet: TCurrencyEdit;
    cxTextEdit_kol_vo_smet: TcxTextEdit;
    Panel2: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label1: TLabel;
    Label25: TLabel;
    Panel5: TPanel;
    dxBarLargeButton_add: TSpeedButton;
    dxBarLargeButton_del: TSpeedButton;
    CurrencyEdit_sum_fulfil: TCurrencyEdit;
    CurrencyEdit_summa_pay: TCurrencyEdit;
    CurrencyEdit_summa: TCurrencyEdit;
    CurrencyEdit_opl: TCurrencyEdit;
    cxMemo_dog_note: TcxMemo;
    cxButton_ok: TcxButton;
    cxButton_cancel: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    pFIBDatabase: TpFIBDatabase;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSet_post: TpFIBDataSet;
    RxMemoryData_smet: TRxMemoryData;
    DataSource_smet: TDataSource;
    pFIBStoredProc_dt_add: TpFIBStoredProc;
    pFIBDataSet_param_id_rate_acc: TpFIBDataSet;
    pFIBDataSet_id_dokument: TpFIBDataSet;
    pFIBDataSet_nds_procent: TpFIBDataSet;
    pFIBDataSet_tip_dog: TpFIBDataSet;
    pFIBDataSet_tip_dog_add: TpFIBDataSet;
    pFIBDataSet_tip_info: TpFIBDataSet;
    pFIBDataSet_smeta: TpFIBDataSet;
    pFIBDataSet_razd_st: TpFIBDataSet;
    pFIBDataSet_red_document: TpFIBDataSet;
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
    pFIBDataSet_kekv: TpFIBDataSet;
    pFIBDataSet_smet_info: TpFIBDataSet;
    cxButton_hist: TcxButton;
    DataSetHistory: TpFIBDataSet;
    DataSetHistSmet: TpFIBDataSet;
    ActionList1: TActionList;
    save: TAction;
    save1: TAction;
    ins: TAction;
    dxStatusBar1: TdxStatusBar;
    Label5: TLabel;
    Label26: TLabel;
    cxButtonEdit_otd: TcxButtonEdit;
    DataSetCheck: TpFIBDataSet;
    TransactionCheck: TpFIBTransaction;
    btnEdit: TSpeedButton;
    cxButton1: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButtonEdit_name_unPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RxMemoryData_smetAfterScroll(DataSet: TDataSet);
    procedure cxButton_okClick(Sender: TObject);
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
    procedure CurrencyEdit_oplExit(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Label14MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label15Click(Sender: TObject);
    procedure Label15MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure add_smetExecute(Sender: TObject);
    procedure del_smetExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label17MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label17Click(Sender: TObject);
    procedure dxBarLargeButton_addClick(Sender: TObject);
    procedure dxBarLargeButton_delClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure cxButton_histClick(Sender: TObject);
    procedure saveExecute(Sender: TObject);
    procedure save1Execute(Sender: TObject);
    procedure insExecute(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure cxButtonEdit_depPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnEditClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    fProc : TResProc;
    procedure Summa(); // считает сумму сметы
    procedure SummaDoc(); //считает сумму документа
    procedure EditSum(); //если сумма документа=оплаченной сумме, то можно менять сумму документа и НДС

  public
    id_doc, id_dog:Int64;
    id_p, name_p,
    rate_acc_un, rate_acc_p: Variant; //идентификаторы счетов ДонНУ и контрагента соответственно
    smeta, razdel, stat: String;  //переменные, содержащие данные по сметам из функции;
    Priznak_vizova :String;
    id_smeta, id_razdel, id_stat :Variant;
    title_smet: String;
    sum_po_smet : Variant;
    id_tip_dog: Variant;
    tip_dog_name: String;
    kod_dog:Int64;
    id_dog_red: Int64; //для редактирования сметы
    id_dt_smet: Variant; //Переменная для позиционирования
    sum_doc: Variant; //Сумма документа
    comment : String;
    id_otdel: Integer;
     flag :Boolean;
    constructor Create (Aowner:TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_dokument: Variant; Pr_vizova: String; Id_t_d: Variant; data : PShablonInputData = nil); overload;

    function GetSmeta(p_smeta,p_razdel,p_stat:String; sum_smet:Variant;
    p_id_smet,p_kod_smet,p_nomer_razd,p_nomer_stat:Integer; id_smet, id_razd, id_stat: Variant;
    p_id_people: Variant; p_name, p_otch, p_fam, p_fio: String;p_id_kekv: Variant; p_kod_kekv: Integer; p_name_kekv: String; p_ID_DOG_BANKCARD : int64):Variant;
    { Public declarations }
  end;

function LoadShablon(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle;id_dokument: Variant;
                 Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;stdcall;
exports LoadShablon;

//var
  //frmShablon6: TfrmShablon6;
  //frmAddSmetSh6 : TfrmAddSmetSh6;

implementation
uses
  Registry;

{$R *.dfm}

constructor TfrmShablon6.Create(Aowner:TComponent ;DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_dokument: Variant; Pr_vizova: String; Id_t_d: Variant; data : PShablonInputData = nil);
var
  i: Integer;
  Dataset_people : TpFIBDataSet;
  fio, s: String;
  post: Variant;
  DataSetCust: TpFIBDataSet;
begin
  if TForm(Aowner).FormStyle = fsNormal then frmStyle := fsNormal;
self.kod_dog:=id_dokument;
Priznak_vizova := Pr_vizova;
if Pr_vizova = 'red' then
      begin
        inherited Create (Aowner);             
        FormStyle := frmStyle;
        pFIBDatabase.Handle := DBHANDLE;
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

        pFIBDataSet_kekv.Database := pFIBDatabase;
        pFIBDataSet_kekv.Transaction := pFIBTransactionRead;

        kod_dog := id_dokument; //позиционирование

        pFIBDataSet_id_dokument.Active := false;
        pFIBDataSet_id_dokument.ParamByName('D_ID_DOG_VX').AsInt64 := id_dokument;
        pFIBDataSet_id_dokument.Active := true;

        if  not VarIsNull(pFIBDataSet_id_dokument.FBN('d_comment').AsVariant) then
        comment := pFIBDataSet_id_dokument.FBN('d_comment').asstring else
        comment := '';

        cxButtonEdit_otd.Text := pFIBDataSet_id_dokument.FBN('OTDEL_NAME_FULL').AsString;
        id_otdel := pFIBDataSet_id_dokument.FBN('ID_OTDEL').AsInteger;

        cxMaskEdit_n_dog.Text := pFIBDataSet_id_dokument.FieldByName('d_n_dog').AsString;
        cxDateEdit_dog.Date := pFIBDataSet_id_dokument.FieldByName('d_d_dog').AsDateTime;
        CurrencyEdit_summa.Text := pFIBDataSet_id_dokument.FieldByName('d_summa').AsString;
//        cxDateEdit_krit_opl.Date := pFIBDataSet_id_dokument.FieldByName('d_krit_date').AsDateTime;

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
        pFIBDataSet_red_document.ParamByName('d_id_dog_vx').AsInt64 := id_dokument;
        pFIBDataSet_red_document.Active := true;
        id_dog_red := TFIBBCDField(pFIBDataSet_red_document.FieldByName('ID_DOG')).AsInt64;

       //Данные по типам договоров
        pFIBDataSet_tip_dog.Active := false;
        pFIBDataSet_tip_dog.ParamByName('param_document').Value := id_dokument;
        pFIBDataSet_tip_dog.Active := true;
        id_tip_dog := pFIBDataSet_tip_dog.FieldByName('id_tip_dog').AsVariant;

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
        id_p := pFIBDataSet_id_dokument.FieldByName('D_ID_CUSTOMER').AsVariant;
        name_p := pFIBDataSet_id_dokument.FieldByName('D_NAME_CUSTOMER_K').AsString;

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

          pFIBDataSet_kekv.Active := false;
          pFIBDataSet_kekv.ParamByName('id_kekv').Value := pFIBDataSet_smet_info.FieldByName('id_kekv').AsInteger;
          pFIBDataSet_kekv.ParamByName('actual_date').Value := Date;
          pFIBDataSet_kekv.Active := true;

          RxMemoryData_smet.FieldByName('name_kekv').Value := pFIBDataSet_kekv.FieldByName('KEKV_TITLE').AsString;
          RxMemoryData_smet.FieldByName('kod_kekv').Value := pFIBDataSet_kekv.FieldByName('KEKV_KODE').AsInteger;;

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
          RxMemoryData_smet.FieldByName('ID_DOG_BANKCARD').Value := pFIBDataSet_smet_info.FieldByName('ID_DOG_BANKCARD').AsVariant;

          //DataSet для  справочника людей
          Dataset_people := TpFIBDataSet.Create(Self);
          Dataset_people.Database := pFIBDatabase;
          Dataset_people.Transaction := pFIBTransactionRead;
          s := 'SELECT FAMILIA || '' '' || IMYA || '' '' || OTCHESTVO AS FIO FROM People WHERE  People.id_man='+VarToStr(pFIBDataSet_smet_info.FieldByName('id_people').AsVariant);
          Dataset_people.SelectSQL.Add(s);
          Dataset_people.Active := true;
          fio := Dataset_people.FieldByName('fio').AsString;
          Dataset_people.Free;

          RxMemoryData_smet.FieldByName('fio_people').Value := fio;


          RxMemoryData_smet.FieldByName('id').Value := pFIBDataSet_smet_info.FieldByName('id_dt_smet_dog').AsVariant;
          RxMemoryData_smet.FieldByName('flag_del').Value := 0;
          RxMemoryData_smet.Post;

          pFIBDataSet_smet_info.Next;
      end;

        Caption := 'Редагування'+' '+pFIBDataSet_tip_dog.FieldByName('short_name').AsString+' '+
        '('+pFIBDataSet_tip_dog.FieldByName('tip_dog').AsString+')';
        DatasetCheck.Close;
        DatasetCheck.SQLs.SelectSQL.Text:='select * from dog_dt_document where ID_DOG='+IntToStr(self.kod_dog)+' with lock';
        DatasetCheck.Transaction.StartTransaction;
        try
         DatasetCheck.Open;
        except
         DatasetCheck.Transaction.Rollback;
         DatasetCheck.Close;
         Self.flag:=true;
         ShowMessage('Договір заблоковано іншим користувачем, редагування неможливе.');
         exit;
        end;

      end
      else

/////////////////////////////////////////////////////////////////////////////////////////////
      if Pr_vizova = 'add' then
      begin
        inherited Create (Aowner);
        FormStyle := frmStyle;
        pFIBDatabase.Handle := DBHANDLE;

        pFIBDataSet_post.Database := pFIBDatabase;
        pFIBDataSet_post.Transaction := pFIBTransactionRead;
        pFIBDataSet_post.Active := false;
        pFIBDataSet_post.Active := true;

        pFIBDataSet_id_dokument.Database := pFIBDatabase;
        pFIBDataSet_id_dokument.Transaction := pFIBTransactionRead;
        pFIBDataSet_id_dokument.Active := false;
        pFIBDataSet_id_dokument.Active := true;

        pFIBDataSet_tip_info.Database := pFIBDatabase;
        pFIBDataSet_tip_info.Transaction := pFIBTransactionRead;
        pFIBDataSet_tip_info.Active := false;
        pFIBDataSet_tip_info.ParamByName('d_id_tip_dog').Value := Id_t_d;
        pFIBDataSet_tip_info.Active := true;

       comment := '';
///////////////////////////////////////////////////////////////////////
{данные, которые присылаются по умолчанию}
  rate_acc_p := Null;
  rate_acc_un := Null;

   if data <> NIL then
   if data.bUse then
   begin
     if data^.num <> '' then if data^.bUse then
     cxMaskEdit_n_dog.Text := data^.num else
     cxMaskEdit_n_dog.Text := pFIBDataSet_tip_info.FieldByName('DEF_NUMBER').AsString;

     if DateToStr(data^.date_dog) <> '' then
     cxDateEdit_dog.Date := data^.date_dog else
     cxDateEdit_dog.Text := pFIBDataSet_tip_info.FieldByName('DEF_DATE').AsString;

     if data^.note <> '' then
     cxMemo_dog_note.Text := data^.note else
     cxMemo_dog_note.Text := pFIBDataSet_tip_info.FieldByName('DEF_NOTE').AsString;

     if data^.id_rate_account > 0 then
     begin
       rate_acc_p := data^.id_rate_account;
       DataSetCust := TpFIBDataSet.Create(Self);
       DataSetCust.Database := pFIBDatabase;
       DataSetCust.Transaction := pFIBTransactionRead;
       DataSetCust.SQLs.SelectSQL.Text := 'SELECT MFO, Name_MFO, Rate_Account, Name_customer, C.id_customer '+
                                          'FROM Pub_Sp_Cust_Rate_Acc A, Pub_Sp_Bank B, Pub_sp_customer C '+
                                          'WHERE A.Id_Bank = B.Id_Bank '+
                                          'AND   A.id_customer=C.id_customer '+
                                          'AND   A.id_rate_account =' + VarToStr(rate_acc_p);
       DataSetCust.Active := true;
       cxButtonEdit_name_p.Text := DataSetCust.FieldByName('NAME_CUSTOMER').AsString;
       cxTextEdit_mfo_p.Text := DataSetCust.FieldByName('MFO').AsString;
       cxTextEdit_rsch_p.Text := DataSetCust.FieldByName('RATE_ACCOUNT').AsString;
       cxTextEdit_bank_p.Text := DataSetCust.FieldByName('NAME_MFO').AsString;
       DataSetCust.Free;
     end
       else rate_acc_p := Null;

     if data^.id_rate_acc_native > 0 then
     begin
       rate_acc_un := data^.id_rate_acc_native;
       DataSetCust := TpFIBDataSet.Create(Self);
       DataSetCust.Database := pFIBDatabase;
       DataSetCust.Transaction := pFIBTransactionRead;
       DataSetCust.SQLs.SelectSQL.Text := 'SELECT MFO, Name_MFO, Rate_Account, Name_customer, C.id_customer '+
                                          'FROM Pub_Sp_Cust_Rate_Acc A, Pub_Sp_Bank B, Pub_sp_customer C '+
                                          'WHERE A.Id_Bank = B.Id_Bank '+
                                          'AND   A.id_customer=C.id_customer '+
                                          'AND   A.id_rate_account=' + IntToStr(rate_acc_un);
       DataSetCust.Active := true;
       cxButtonEdit_name_un.Text := DataSetCust.FieldByName('NAME_CUSTOMER').AsString;
       cxTextEdit_mfo_un.Text := DataSetCust.FieldByName('MFO').AsString;
       cxTextEdit_rsch_un.Text := DataSetCust.FieldByName('RATE_ACCOUNT').AsString;
       cxTextEdit_bank_un.Text := DataSetCust.FieldByName('NAME_MFO').AsString;
       DataSetCust.Free;
     end
       else rate_acc_un := Null;
   end
   else
   begin
     cxMemo_dog_note.Text := pFIBDataSet_tip_info.FieldByName('DEF_NOTE').AsString;
     cxMaskEdit_n_dog.Text := pFIBDataSet_tip_info.FieldByName('DEF_NUMBER').AsString;
     cxDateEdit_dog.Date := pFIBDataSet_tip_info.FieldByName('DEF_DATE').AsDateTime;
   end;
     if cxDateEdit_dog.Text = '30.12.1899' then cxDateEdit_dog.Date := Date;



///////////////////////////////////////////////////////////////////////
{если не прислан, то смотрим в справочнике типов договоров}
 if (rate_acc_p=Null) then
 begin
   rate_acc_p := pFIBDataSet_tip_info.FieldByName('Def_Cust_Account').AsVariant;
   id_p := pFIBDataSet_tip_info.FieldByName('DEF_CUSTOMER').AsVariant;
   name_p := pFIBDataSet_tip_info.FieldByName('DEF_CUSTOMER_NAME').AsString;
   rate_acc_p := pFIBDataSet_tip_info.FieldByName('DEF_ID_RATE_ACC').AsVariant;
   cxButtonEdit_name_p.Text := pFIBDataSet_tip_info.FieldByName('DEF_CUSTOMER_NAME').AsString;
   cxTextEdit_mfo_p.Text := pFIBDataSet_tip_info.FieldByName('DEF_CUST_MFO').AsString;
   cxTextEdit_rsch_p.Text := pFIBDataSet_tip_info.FieldByName('DEF_CUST_RSCHET').AsString;
   cxTextEdit_bank_p.Text := pFIBDataSet_tip_info.FieldByName('DEF_CUST_MFO_NAME').AsString;
 end;
{Если нет контрагента по умолчанию, то выдается сразу справочник на выбор контрагнета}

 if (rate_acc_p=Null) then
  begin
    id_p := -1;
    rate_acc_p := -1;
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
///////////////////////////////////////////////////////////////////////
   if rate_acc_p = -1 then
   begin
     Close;
     Exit;
   end;

   //выбор native-счета, если не прислан по умолчанию, то из справочника
   if (rate_acc_un=Null) then
   begin
    cxButtonEdit_name_un.Text := pFIBDataSet_tip_info.FieldByName('DEF_NAME_CUSTOMER').AsString;
    cxTextEdit_mfo_un.Text := pFIBDataSet_tip_info.FieldByName('DEF_MFO').AsString;
    cxTextEdit_rsch_un.Text := pFIBDataSet_tip_info.FieldByName('DEF_RSCHET').AsString;
    cxTextEdit_bank_un.Text := pFIBDataSet_tip_info.FieldByName('DEF_BANK_NAME').AsString;
    rate_acc_un := pFIBDataSet_tip_info.FieldByName('DEF_ID_RATE_ACC_NATIVE').AsInteger;
   end;

//        cxDateEdit_krit_opl.Date := Date + pFIBDataSet_id_dokument.FieldByName('D_KRIT_DATE_DEF').AsInteger;

   //Тип договора в верху формы
        pFIBDataSet_tip_dog_add.Database := pFIBDatabase;
        pFIBDataSet_tip_dog_add.Transaction := pFIBTransactionRead;
        pFIBDataSet_tip_dog_add.Active := false;
        pFIBDataSet_tip_dog_add.ParamByName('pram_id_tip_dog').Value := id_t_d;
        pFIBDataSet_tip_dog_add.Active := true;

        Caption := 'Додання'+' '+pFIBDataSet_tip_dog_add.FieldByName('short_name').AsString+' '+
        '('+pFIBDataSet_tip_dog_add.FieldByName('tip_dog').AsString+')';

        Label2.Visible := false;
        cxTextEdit_reg_nomer.Visible := false;

      end
      else
      if Pr_vizova = 'prosmotr' then
////////////////////////Просмотр документа/////////////////////////////////
      begin
        inherited Create (Aowner);
        FormStyle := frmStyle;
        pFIBDatabase.Handle := DBHANDLE;
        pFIBDataSet_post.Database := pFIBDatabase;
        pFIBDataSet_post.Transaction := pFIBTransactionRead;

        pFIBDataSet_id_dokument.Database := pFIBDatabase;
        pFIBDataSet_id_dokument.Transaction := pFIBTransactionRead;

        pFIBDataSet_tip_dog.Database := pFIBDatabase;
        pFIBDataSet_tip_dog.Transaction := pFIBTransactionRead;

        pFIBDataSet_post.Active := false;
        pFIBDataSet_post.Active := true;

        pFIBDataSet_kekv.Database := pFIBDatabase;
        pFIBDataSet_kekv.Transaction := pFIBTransactionRead;

        pFIBDataSet_id_dokument.Active := false;
        pFIBDataSet_id_dokument.ParamByName('D_ID_DOG_VX').Value := id_dokument;
        pFIBDataSet_id_dokument.Active := true;

        if  not VarIsNull(pFIBDataSet_id_dokument.FBN('d_comment').AsVariant) then
        comment := pFIBDataSet_id_dokument.FBN('d_comment').asstring else
        comment := '';

        cxButtonEdit_otd.Text := pFIBDataSet_id_dokument.FBN('OTDEL_NAME_FULL').AsString;
        cxButton1.Enabled:=false;

        cxMaskEdit_n_dog.Text := pFIBDataSet_id_dokument.FieldByName('d_n_dog').AsString;
        cxDateEdit_dog.Date := pFIBDataSet_id_dokument.FieldByName('d_d_dog').AsDateTime;
        CurrencyEdit_summa.Text := pFIBDataSet_id_dokument.FieldByName('d_summa').AsString;
//        cxDateEdit_krit_opl.Date := pFIBDataSet_id_dokument.FieldByName('d_krit_date').AsDateTime;
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

          pFIBDataSet_kekv.Active := false;
          pFIBDataSet_kekv.ParamByName('id_kekv').Value := pFIBDataSet_smet_info.FieldByName('id_kekv').AsInteger;
          pFIBDataSet_kekv.ParamByName('actual_date').Value := Date;
          pFIBDataSet_kekv.Active := true;

          RxMemoryData_smet.FieldByName('name_kekv').Value := pFIBDataSet_kekv.FieldByName('KEKV_TITLE').AsString;
          RxMemoryData_smet.FieldByName('kod_kekv').Value := pFIBDataSet_kekv.FieldByName('KEKV_KODE').AsInteger;;

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
          RxMemoryData_smet.FieldByName('ID_DOG_BANKCARD').Value := pFIBDataSet_smet_info.FieldByName('ID_DOG_BANKCARD').AsVariant;

          //DataSet для  справочника людей
          Dataset_people := TpFIBDataSet.Create(Self);
          Dataset_people.Database := pFIBDatabase;
          Dataset_people.Transaction := pFIBTransactionRead;
          s := 'SELECT FAMILIA || '' '' || IMYA || '' '' || OTCHESTVO AS FIO FROM People WHERE  People.id_man='+VarToStr(pFIBDataSet_smet_info.FieldByName('id_people').AsVariant);
          Dataset_people.SelectSQL.Add(s);
          Dataset_people.Active := true;
          fio := Dataset_people.FieldByName('fio').AsString;
          Dataset_people.Free;

          RxMemoryData_smet.FieldByName('fio_people').Value := fio;


          RxMemoryData_smet.FieldByName('id').Value := pFIBDataSet_smet_info.FieldByName('id_dt_smet_dog').AsVariant;
          RxMemoryData_smet.FieldByName('flag_del').Value := 0;
          RxMemoryData_smet.Post;

          pFIBDataSet_smet_info.Next;
       end;

        Caption := 'Перегляд'+' '+pFIBDataSet_tip_dog.FieldByName('short_name').AsString+' '+
        '('+pFIBDataSet_tip_dog.FieldByName('tip_dog').AsString+')';

        cxMaskEdit_n_dog.Enabled := false;
        cxDateEdit_dog.Enabled := false;
        CurrencyEdit_sum_po_smet.Enabled := false;
        cxMemo_dog_note.Enabled := false;
//        cxDateEdit_krit_opl.Enabled := false;
        dxBarLargeButton_add.Enabled := false;
        dxBarLargeButton_del.Enabled := false;
       { cxButtonEdit_name_p.Enabled:=false;
        cxButtonEdit_name_un.Enabled:=false;
        cxTextEdit_bank_p.Enabled:=false;
        cxTextEdit_mfo_p.Enabled:=false;
        cxTextEdit_rsch_p.Enabled:=false;
        cxTextEdit_bank_un.Enabled:=false;
        cxTextEdit_mfo_un.Enabled:=false;
        cxTextEdit_rsch_un.Enabled:=false;}
        GroupBox2.Enabled := false;
        GroupBox3.Enabled := false;
        CurrencyEdit_opl.Enabled := false;

      end else
/////////////////////////история изменений////////////////
      if Pr_vizova = 'hist' then
      begin
        inherited Create (Aowner);
        FormStyle := frmStyle;
        pFIBDatabase.Handle := DBHANDLE;

        DataSetHistory.Database := pFIBDatabase;
        DataSetHistory.Transaction := pFIBTransactionRead;
        DataSetHistory.Active := false;
        DataSetHistory.ParamByName('id_history').Value := id_dokument;
        DataSetHistory.Active := true;

        if  not VarIsNull(DataSetHistory.FBN('d_comment').AsVariant) then
        comment := DataSetHistory.FBN('d_comment').asstring else
        comment := '';

        cxButtonEdit_otd.Text := DataSetHistory.FBN('OTDEL_NAME_FULL').AsString;

        cxMaskEdit_n_dog.Text := DataSetHistory.FieldByName('d_n_dog').AsString;
        cxDateEdit_dog.Date := DataSetHistory.FieldByName('d_d_dog').AsDateTime;
        CurrencyEdit_summa.Text := DataSetHistory.FieldByName('d_summa').AsString;
        cxMemo_dog_note.Text := DataSetHistory.FieldByName('d_dog_note').AsString;
        cxTextEdit_reg_nomer.Text := DataSetHistory.FieldByName('d_reg_nomer').AsString;
        CurrencyEdit_opl.Text := DataSetHistory.FieldByName('d_sum_opl').AsVariant;
        CurrencyEdit_summa_pay.Text := DataSetHistory.FieldByName('d_sum_pay').AsString;
        CurrencyEdit_sum_fulfil.Text := DataSetHistory.FieldByName('d_sum_fulfil').AsString;

        //Данные по native
        cxButtonEdit_name_un.Text := DataSetHistory.FieldByName('D_NAME_CUSTOMER_N').AsString;
        cxTextEdit_mfo_un.Text := DataSetHistory.FieldByName('D_MFO_N').AsString;
        cxTextEdit_bank_un.Text := DataSetHistory.FieldByName('D_BANK_NAME_N').AsString;
        cxTextEdit_rsch_un.Text := DataSetHistory.FieldByName('D_RSCH_N').AsString;
        rate_acc_un := DataSetHistory.FieldByName('D_ID_RATE_ACC_NATIVE').AsVariant;

        //Данные по контрагенту
        cxButtonEdit_name_p.Text := DataSetHistory.FieldByName('d_name_customer_k').AsString;
        cxTextEdit_mfo_p.Text := DataSetHistory.FieldByName('D_MFO_K').AsString;
        cxTextEdit_bank_p.Text := DataSetHistory.FieldByName('D_BANK_NAME_K').AsString;
        cxTextEdit_rsch_p.Text := DataSetHistory.FieldByName('D_RSCH_K').AsString;

        DataSetHistSmet.Database := pFIBDatabase;
        DataSetHistSmet.Transaction := pFIBTransactionRead;
        DataSetHistSmet.Active := false;
        DataSetHistSmet.ParamByName('id_history').Value := id_dokument;
        DataSetHistSmet.Active := true;
        DataSetHistSmet.FetchAll;
        DataSetHistSmet.First;
        for i:=0 to DataSetHistSmet.RecordCount-1 do
        begin
          RxMemoryData_smet.Open;
          RxMemoryData_smet.Insert;
          RxMemoryData_smet.FieldByName('name_kekv').Value := DataSetHistSmet.FieldByName('name_kekv').AsString;
          RxMemoryData_smet.FieldByName('kod_kekv').Value := DataSetHistSmet.FieldByName('kod_kekv').AsInteger;
          RxMemoryData_smet.FieldByName('name_smet').Value := DataSetHistSmet.FieldByName('name_smet').AsVariant;
          RxMemoryData_smet.FieldByName('kod_smety').Value := DataSetHistSmet.FieldByName('kod_smety').AsVariant;
          RxMemoryData_smet.FieldByName('n_razd').Value := DataSetHistSmet.FieldByName('n_razd').AsVariant;
          RxMemoryData_smet.FieldByName('name_razd').Value := DataSetHistSmet.FieldByName('name_razd').AsString;
          RxMemoryData_smet.FieldByName('name_stat').Value := DataSetHistSmet.FieldByName('name_stat').AsString;
          RxMemoryData_smet.FieldByName('n_stat').Value := DataSetHistSmet.FieldByName('n_stat').AsString;
          RxMemoryData_smet.FieldByName('sum_smet').Value := DataSetHistSmet.FieldByName('summa').AsString;
          RxMemoryData_smet.FieldByName('fio_people').Value := DataSetHistSmet.FieldByName('fio').AsString;
          RxMemoryData_smet.Post;
          DataSetHistSmet.Next;
        end;

        Caption := 'Історія зміни'+' '+DataSetHistory.FieldByName('short_name').AsString+' '+
       '('+DataSetHistory.FieldByName('tip_dog').AsString+')' + ' за '+ DataSetHistory.FieldByName('time_edit').AsString + ' ( '+
       DataSetHistory.FieldByName('Fio').AsString + ' )';

        cxButton_ok.Visible := false;
        cxMaskEdit_n_dog.Enabled := false;
        cxDateEdit_dog.Enabled := false;
        CurrencyEdit_sum_po_smet.Enabled := false;
        cxMemo_dog_note.Enabled := false;
        dxBarLargeButton_add.Enabled := false;
        dxBarLargeButton_del.Enabled := false;
        GroupBox2.Enabled := false;
        GroupBox3.Enabled := false;
        CurrencyEdit_opl.Enabled := false;
        cxButton_hist.Visible := false;

      end;
end;

 /////////////////////////////////////////////////////////////////////
function LoadShablon(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle;id_dokument: Variant;
                 Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;
var
  sh6: TfrmShablon6;
begin
  sh6 := TfrmShablon6.Create(AOwner, DBHANDLE, frmStyle, id_dokument, Pr_vizova, id_t_d,data);
  sh6.fProc := proc;
end;

//Данные по смете
function TfrmShablon6.GetSmeta(p_smeta,p_razdel,p_stat:String; sum_smet:Variant;
p_id_smet,p_kod_smet,p_nomer_razd,p_nomer_stat:Integer; id_smet, id_razd, id_stat: Variant;
p_id_people: Variant; p_name, p_otch, p_fam, p_fio: String;p_id_kekv: Variant; p_kod_kekv: Integer; p_name_kekv: String; p_ID_DOG_BANKCARD : int64):Variant;
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
  RxMemoryData_smet.FieldByName('id_people').Value := p_id_people;
  RxMemoryData_smet.FieldByName('name_people').Value := p_name;
  RxMemoryData_smet.FieldByName('otch_people').Value := p_otch;
  RxMemoryData_smet.FieldByName('fam_people').Value := p_fam;
  RxMemoryData_smet.FieldByName('fio_people').Value := p_fio;
  RxMemoryData_smet.FieldByName('id_kekv').Value := p_id_kekv;
  RxMemoryData_smet.FieldByName('kod_kekv').Value := p_kod_kekv;
  RxMemoryData_smet.FieldByName('name_kekv').Value := p_name_kekv;
  RxMemoryData_smet.FieldByName('ID_DOG_BANKCARD').Value := p_ID_DOG_BANKCARD;
  RxMemoryData_smet.Post;
end;

procedure TfrmShablon6.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SavePositionToRegistry(Self);
  Action := caFree;
end;

//Данные по контрагенту из внешнего справочника
procedure TfrmShablon6.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
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

procedure TfrmShablon6.FormCreate(Sender: TObject);
var
  reg       : TRegistry;
  DataSetOtd: TpFIBDataSet;
begin
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

 //Интерфейс
{  dxBarLargeButton_add.Caption              := rsh_add;
  dxBarLargeButton_del.Caption              := rsh_Del;
  Label4.Caption                            := rsh_Number;
  Label3.Caption                            := rsh_Vid;
  cxGrid1DBTableView1DBColumn_smeta.Caption := rsh_Smeta;
  cxGrid1DBTableView1DBColumn4.Caption      := rsh_Razd;
  cxGrid1DBTableView1DBColumn5.Caption      := rsh_Stat;
  cxGrid1DBTableView1DBColumn2.Caption      := rsh_Summa;
  cxGrid1DBTableView1DBColumn3.Caption      := rsh_Kekv;
  Label1.Caption                           := rsh_Kekv;
  Label18.Caption                           := rsh_Smeta;
  Label19.Caption                           := rsh_Razd;
  Label20.Caption                           := rsh_Stat;
  GroupBox3.Caption                         := rsh_Zvidki;
  Label24.Caption                           := rsh_Name_cust;
  Label6.Caption                            := rsh_MFO;
  Label7.Caption                            := rsh_RateAcc;
  Label8.Caption                            := rsh_Bank;
  Label9.Caption                            := rsh_MFO;
  Label10.Caption                           := rsh_RateAcc;
  Label11.Caption                           := rsh_Bank;
  Label14.Caption                           := rsh_Vipol;
  Label15.Caption                           := rsh_Opl;
  Label17.Caption                           := rsh_Sum_doc;
  Label16.Caption                           := rsh_Sum_opl;
  Label2.Caption                            := rsh_Reg_num;
}
  if Priznak_vizova = 'red' then
  begin
    Label17.font.color := clBlue;
    Label17.font.Style := [fsUnderline];
  end;

  if Priznak_vizova <> 'add' then
  begin
    Label14.font.color := clBlue;
    Label14.font.Style := [fsUnderline];
    Label15.font.color := clBlue;
    Label15.font.Style := [fsUnderline];
  end
  else
  begin
    reg := TRegistry.Create;
    reg.OpenKey(REG_KEY + 'Otdel', true);
    try
      id_otdel := reg.ReadInteger('id_otdel');
    except
      id_otdel := 0;
    end;
    reg.Free;

    if id_otdel > 0 then
    begin
      DataSetOtd := TpFIBDataSet.Create(Self);
      DataSetOtd.Database    := pFIBDatabase;
      DataSetOtd.Transaction := pFIBTransactionRead;
      DataSetOtd.SQLs.SelectSQL.Text := 'select * from sp_department d where d.id_department=:id_otdel AND ''NOW'' BETWEEN d.Use_Beg AND d.Use_End';
      DataSetOtd.ParamByName('id_otdel').Value := id_otdel;
      DataSetOtd.Open;
      cxButtonEdit_otd.Text := DataSetOtd.FBN('name_full').AsString;
      DataSetOtd.Close;
      DataSetOtd.Free;
    end
    else
    begin
      DataSetOtd := TpFIBDataSet.Create(Self);
      DataSetOtd.Database    := pFIBDatabase;
      DataSetOtd.Transaction := pFIBTransactionRead;
      DataSetOtd.SQLs.SelectSQL.Text := 'select d.*, s.local_department from ini_asup_consts s, sp_department d where  s.local_department=d.id_department AND ''NOW'' BETWEEN d.Use_Beg AND d.Use_End';
      DataSetOtd.Open;
      cxButtonEdit_otd.Text := DataSetOtd.FBN('name_full').AsString;
      id_otdel := DataSetOtd.FBN('id_department').AsInteger;
      DataSetOtd.Close;
      DataSetOtd.Free;
    end;
  end;

    if Application.MainForm.ActiveMDIChild <> Nil then
   if Application.MainForm.ActiveMDIChild.WindowState = wsMaximized then WindowState := wsMaximized;

end;

procedure TfrmShablon6.cxButton_cancelClick(Sender: TObject);
begin
  if Assigned(fProc) then fProc(-1, raClose);
  Close;
end;

//Данные по счетам ДонНУ из моего справочника
procedure TfrmShablon6.cxButtonEdit_name_unPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  ret: Variant;
begin
if Priznak_vizova = 'prosmotr'  then Exit
else
begin
  if VarIsClear(rate_acc_un) then rate_acc_un := -1;

  ret := LoadDogManedger.WorkSpMfoRsch(self, pFIBDatabase.Handle, fsNormal, 'get', rate_acc_un);
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

procedure TfrmShablon6.RxMemoryData_smetAfterScroll(DataSet: TDataSet);
begin
  Label21.Caption := RxMemoryData_smet.FieldByName('name_smet').AsString;
  Label22.Caption := RxMemoryData_smet.FieldByName('name_razd').AsString;
  Label23.Caption := RxMemoryData_smet.FieldByName('name_stat').AsString;
  Label25.Caption := RxMemoryData_smet.FieldByName('name_kekv').AsString;
  Label21.Hint := RxMemoryData_smet.FieldByName('name_smet').AsString;
  Label21.ShowHint := true;
  Label22.Hint := RxMemoryData_smet.FieldByName('name_razd').AsString;
  Label22.ShowHint := true;
  Label23.Hint := RxMemoryData_smet.FieldByName('name_stat').AsString;
  Label23.ShowHint := true;
  Label25.Hint := RxMemoryData_smet.FieldByName('name_kekv').AsString;
  Label25.ShowHint := true;
end;

procedure TfrmShablon6.cxButton_okClick(Sender: TObject);
var
  i, j: Integer;
  nds, sum_pay: Variant;
  sum_today: Variant; //Сумма к оплате
  D_date: TDate;
  s_smet, s_pay, s_doc, temp_sum, s_ful_fil, sum_k_opl: Currency;
  action : TResAction;
  DataSet_rate: TpFIBDataSet;
  s: String;
  reg : TRegistry;
begin
   action := raView;

   if Priznak_vizova = 'red' then
   begin
    if DatasetCheck.Active then DatasetCheck.Transaction.Commit;
    DatasetCheck.Close;
   end ;

   if Priznak_vizova = 'prosmotr' then
   begin
     Close;
     Exit;
   end;
  if cxDateEdit_dog.Text = '' then
   begin
      ShowMessage('Необхідно ввести дату договору');
      exit;
   end;

     //проверка реквизитов контрагента по дате
     DataSet_rate := TpFIBDataSet.Create(Self);
     DataSet_rate.Database := pFIBDatabase;
     DataSet_rate.Transaction := pFIBTransactionRead;
     s := 'SELECT date_beg, date_end FROM pub_sp_cust_rate_acc WHERE  id_rate_account=:param_id';
     DataSet_rate.Active := false;
     DataSet_rate.SQLs.SelectSQL.Add(s);
     DataSet_rate.ParamByName('param_id').Value := rate_acc_p;
     DataSet_rate.Active := true;

     if (Date < DataSet_rate.FieldByName('date_beg').AsDateTime)
     or (DataSet_rate.FieldByName('date_end').AsDateTime < Date) then
     ShowMessage('Счет контрагента не функционирует в данном периоде');
     DataSet_rate.Free;

     //проверка на корректность даты договора
     if Priznak_vizova = 'add' then
     begin
     action := raAdd;
      if (cxDateEdit_dog.Date > Date) then
      begin
        ShowMessage('Дата не повинна бути більш ніж поточна!');
        cxDateEdit_dog.SetFocus;
        Exit;
      end;

 {     D_date := Date - VarToDateTime(pFIBDataSet_id_dokument.FieldByName('D_DATE_D_DOG_DEF').Value);
      if (cxDateEdit_dog.Date < D_date) then
      begin
        ShowMessage('Дата не повинна бути менше ніж'+'  '+DateToStr(D_date));
        cxDateEdit_dog.SetFocus;
        Exit;
      end;}
    end;

        // проверка на  минусовую сумму
    if  CurrencyEdit_summa.Value <= 0 then
        begin
        MessageDlg('Увага', errSumOtr, mtError, [mbOk]);
        Exit;
    end;

    s_smet := CurrencyEdit_sum_po_smet.Value;
    s_pay  := CurrencyEdit_summa_pay.Value;
    s_ful_fil := CurrencyEdit_sum_fulfil.Value;
    s_doc  := CurrencyEdit_summa.Value;
    sum_k_opl := CurrencyEdit_opl.Value;

    if (abs(s_doc - (s_smet + s_pay)) > 0.000001) then
    begin
        ShowMessage('Сума кошторису не дорівнює сумі документа!');
        CurrencyEdit_opl.SetFocus;
        Exit;
    end;

         // проверка на заполнение номера договора
    if  Trim(cxMaskEdit_n_dog.Text) = '' then
        begin
        MessageDlg('Увага', errDtNotNumber, mtError, [mbOk]);
        cxMaskEdit_n_dog.SetFocus;
        Exit;
    end;

         //проверка на заполнение смет
     if s_doc <> s_pay then
     begin
       if Trim(CurrencyEdit_sum_po_smet.Text) = '' then
       begin
         MessageDlg('Увага', errNotSmet, mtError, [mbOk]);
         Exit;
       end;
     end;

         // проверка на заполнение контрагента
    if  Trim(cxButtonEdit_name_p.Text) = '' then
        begin
        MessageDlg('Увага', errDtNotKontragent, mtError, [mbOk]);
        cxButtonEdit_name_p.SetFocus;
        Exit;
    end;

         // проверка на заполнение счета ДонНУ
    if  Trim(cxButtonEdit_name_un.Text) = '' then
        begin
        MessageDlg('Увага', errDtNotDonnu, mtError, [mbOk]);
        cxButtonEdit_name_un.SetFocus;
        Exit;
    end;

       //проверка на заполнение основания
    if Trim(cxMemo_dog_note.Text) = '' then
      begin
        MessageDlg('Увага', errDtNotNote, mtError, [mbOk]);
        cxMemo_dog_note.SetFocus;
        Exit;
      end;

       //проверка на корректность критической даты оплаты
{    if (cxDateEdit_dog.Date > cxDateEdit_krit_opl.Date) then
      begin
        MessageDlg('Увага', errDtKritDate, mtError, [mbOk]);
        cxDateEdit_krit_opl.SetFocus;
        Exit;
      end;
}

    //Проверка на корректность суммы к оплате
    sum_today := CurrencyEdit_opl.Value;
    sum_doc   := CurrencyEdit_summa.Value;
    sum_pay   := CurrencyEdit_summa_pay.Value;
    if sum_today < 0 then sum_today := 0;
    if sum_doc   < 0 then sum_doc := 0;
    if sum_pay   < 0 then sum_pay := 0;
    temp_sum := sum_pay + s_ful_fil + sum_k_opl;

    if (s_doc < temp_sum) then
    begin
        ShowMessage('Некорректно задана сума до оплати!');
        CurrencyEdit_opl.SetFocus;
        CurrencyEdit_opl.Text := CurrToStr(s_doc - sum_pay - s_ful_fil);
        Exit;
    end;

    if (CurrencyEdit_opl.Value < CurrencyEdit_summa.Value) then
    begin
      ShowMessage('Сума до cплати менше суми документа!');
      CurrencyEdit_opl.SetFocus;
      Exit;
      end;


    if (CurrencyEdit_sum_po_smet.Value <> CurrencyEdit_summa.Value) then
    begin
        ShowMessage('Сума по кошторисам не дорівнює сумі документа!');
        CurrencyEdit_summa.SetFocus;
        Exit;
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

//    pFIBStoredProc_dt_add.ParamByName('D_KRIT_DAT').Value := cxDateEdit_krit_opl.Text;

    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACCOUNT').Value := rate_acc_p;
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACC_NATIVE').Value := rate_acc_un;

    pFIBStoredProc_dt_add.ParamByName('D_ID_CUSTOMER').Value := id_p;
    pFIBStoredProc_dt_add.ParamByName('D_NAME_CUSTOMER').Value := name_p;

    pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_CONTINUE').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_CLOSE').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_ID_TIP_DOG').Value := pFIBDataSet_tip_dog_add.fieldByName('id_tip_dog').AsVariant;
    if Trim(CurrencyEdit_opl.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_SUM_OPL').Value := 0 else
    pFIBStoredProc_dt_add.ParamByName('D_SUM_OPL').Value := CurrencyEdit_opl.Text;
    pFIBStoredProc_dt_add.ParamByName('d_sum_pay').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_SUM_FULFIL').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_ID_USER').Value := SYS_ID_USER;
    pFIBStoredProc_dt_add.ParamByName('D_IP_COMP').Value := GetIPAddress;
    pFIBStoredProc_dt_add.ParamByName('D_NAME_COMP').Value := GetCompName;
    pFIBStoredProc_dt_add.ParamByName('D_COMMENT').Value := comment;
    pFIBStoredProc_dt_add.ParamByName('D_ID_OTDEL').Value := id_otdel;

    try
      pFIBStoredProc_dt_add.ExecProc;
    except  on e:Exception do
      begin
        ShowMessage(e.Message);
        pFIBTransactionWrite.Rollback;
        Exit;
      end;
    end;
      kod_dog := pFIBStoredProc_dt_add.FieldByName('VIX_KOD_DOG').AsVariant;

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
               pFIBStoredProc_dt_add.StoredProcName := 'DOG_DT_SMET_INSERT';
               pFIBStoredProc_dt_add.Prepare;
               pFIBStoredProc_dt_add.ParamByName('D_ID_DOG').AsInt64 := kod_dog;
               pFIBStoredProc_dt_add.ParamByName('D_ID_SMETA').Value := RxMemoryData_smet.FieldByName('id_smet').Value;
               pFIBStoredProc_dt_add.ParamByName('D_RAZD').Value := RxMemoryData_smet.FieldByName('id_razd').Value;
               pFIBStoredProc_dt_add.ParamByName('D_ID_STAT').Value := RxMemoryData_smet.FieldByName('id_stat').Value;
               pFIBStoredProc_dt_add.ParamByName('D_ID_PEOPLE').Value := RxMemoryData_smet.FieldByName('id_people').Value;
               pFIBStoredProc_dt_add.ParamByName('D_ID_KEKV').Value := RxMemoryData_smet.FieldByName('id_kekv').Value;
               pFIBStoredProc_dt_add.ParamByName('D_SUMMA_SM').Value := RxMemoryData_smet.FieldByName('sum_smet').Value;
               pFIBStoredProc_dt_add.ParamByName('D_ID_DOG_BANKCARD').Value := RxMemoryData_smet.FieldByName('ID_DOG_BANKCARD').Value;
               try
                 pFIBStoredProc_dt_add.ExecProc;
                 except on e: Exception do
                   begin
                     ShowMessage(e.Message);
                     pFIBTransactionWrite.Rollback;
                     Exit;
                   end;
               end;
               RxMemoryData_smet.Next;
           end;
      end;
    pFIBTransactionWrite.Commit;
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

    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACCOUNT').Value := rate_acc_p;
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACC_NATIVE').Value := rate_acc_un;

    pFIBStoredProc_dt_add.ParamByName('D_ID_CUSTOMER').Value := id_p;
    pFIBStoredProc_dt_add.ParamByName('D_NAME_CUSTOMER').Value := name_p;

    if Trim(CurrencyEdit_summa.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_SUMMA').Value := 0 else
    pFIBStoredProc_dt_add.ParamByName('D_SUMMA').Value := CurrencyEdit_summa.Text;
    if Trim(cxMemo_dog_note.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_DOG_NOTE').Value := '' else
    pFIBStoredProc_dt_add.ParamByName('D_DOG_NOTE').Value := Trim(cxMemo_dog_note.Text);
//    pFIBStoredProc_dt_add.ParamByName('D_KRIT_DATE').Value := cxDateEdit_krit_opl.Date;
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACCOUNT').Value := rate_acc_p;
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACC_NATIVE').Value := rate_acc_un;
    pFIBStoredProc_dt_add.ParamByName('D_ID_DOG').AsInt64 := id_doc;
    pFIBStoredProc_dt_add.ParamByName('D_CONTINUE').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').Value := 0;
    if Trim(CurrencyEdit_opl.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_SUM_OPL').Value := 0 else
    pFIBStoredProc_dt_add.ParamByName('D_SUM_OPL').Value := CurrencyEdit_opl.Text;
    pFIBStoredProc_dt_add.ParamByName('D_ID_USER').Value := SYS_ID_USER;
    pFIBStoredProc_dt_add.ParamByName('D_IP_COMP').Value := GetIPAddress;
    pFIBStoredProc_dt_add.ParamByName('D_NAME_COMP').Value := GetCompName;
    pFIBStoredProc_dt_add.ParamByName('D_COMMENT').Value := comment;
    pFIBStoredProc_dt_add.ParamByName('D_ID_OTDEL').Value := id_otdel;

    try
      pFIBStoredProc_dt_add.ExecProc;
    except on e: Exception do
      begin
        ShowMessage(e.Message);
        pFIBTransactionWrite.Rollback;
        Exit;
      end;
    end;

        // Редактирование сметы
        {
        Если flag_del=0, то не удаляем
        Если id=0, то єто новая запись и ее нужно добавить
        }
    //Сначала удаляем сметы (если есть помеченные к удалению)
      RxMemoryData_smet.First;
      for i := 0 to RxMemoryData_smet.RecordCount-1 do
      begin
        if (RxMemoryData_smet.FieldByName('id').Value <> 0) and (RxMemoryData_smet.FieldByName('flag_del').Value = 1) then
        begin
          pFIBStoredProc_dt_add.Database := pFIBDatabase;
          pFIBStoredProc_dt_add.Transaction := pFIBTransactionWrite;
          pFIBStoredProc_dt_add.StoredProcName := 'DOG_DT_SMET_DELETE';
          pFIBStoredProc_dt_add.Prepare;
          pFIBStoredProc_dt_add.ParamByName('D_ID_DT_SMET').Value := RxMemoryData_smet.FieldByName('id').Value;
          try
            pFIBStoredProc_dt_add.ExecProc;
          except on e: Exception do
            begin
              ShowMessage(e.Message);
              pFIBTransactionWrite.Rollback;
              Exit;
            end;
          end;
        end;
      RxMemoryData_smet.Next;
      end;

   //Добавляем новые сметы
      RxMemoryData_smet.First;
      for j := 0 to RxMemoryData_smet.RecordCount-1 do
      begin
        if (RxMemoryData_smet.FieldByName('id').Value = 0) and
          (RxMemoryData_smet.FieldByName('flag_del').Value = 0) then
         begin
           pFIBStoredProc_dt_add.Database := pFIBDatabase;
           pFIBStoredProc_dt_add.Transaction := pFIBTransactionWrite;
           pFIBStoredProc_dt_add.StoredProcName := 'DOG_DT_SMET_INSERT';
           pFIBStoredProc_dt_add.Prepare;
           pFIBStoredProc_dt_add.ParamByName('D_ID_DOG').AsInt64 := id_dog_red;
           pFIBStoredProc_dt_add.ParamByName('D_ID_SMETA').Value := RxMemoryData_smet.FieldByName('id_smet').Value;
           pFIBStoredProc_dt_add.ParamByName('D_RAZD').Value := RxMemoryData_smet.FieldByName('id_razd').Value;
           pFIBStoredProc_dt_add.ParamByName('D_ID_STAT').Value := RxMemoryData_smet.FieldByName('id_stat').Value;
           pFIBStoredProc_dt_add.ParamByName('D_ID_PEOPLE').Value := RxMemoryData_smet.FieldByName('id_people').Value;
           pFIBStoredProc_dt_add.ParamByName('D_SUMMA_SM').Value := RxMemoryData_smet.FieldByName('sum_smet').Value;
           pFIBStoredProc_dt_add.ParamByName('D_ID_KEKV').Value := RxMemoryData_smet.FieldByName('id_kekv').Value;
           pFIBStoredProc_dt_add.ParamByName('D_ID_DOG_BANKCARD').Value := RxMemoryData_smet.FieldByName('D_ID_DOG_BANKCARD').Value;
           try
             pFIBStoredProc_dt_add.ExecProc;
           except on e: Exception do
             begin
               ShowMessage(e.Message);
               pFIBTransactionWrite.Rollback;
               Exit;
             end;
           end;
         end;
         RxMemoryData_smet.Next;
       end;

    pFIBTransactionWrite.Commit;
    Close;
    end;
  if Assigned(fProc) then fProc(kod_dog, action);

  //запись в реестр последнего id_department
  reg := TRegistry.Create;
  reg.OpenKey(REG_KEY + 'OTDEL', true);
  try
   reg.WriteInteger('id_otdel', id_otdel);
  except
  end;
  reg.Free;
  
end;


procedure TfrmShablon6.cxMaskEdit_n_dogKeyPress(Sender: TObject;
  var Key: Char);
begin
//  if not(key in ['0'..'9']) and (key<>#8)
//  then    key:=#0;
end;

//подсчет суммы документа
procedure TfrmShablon6.SummaDoc();
var
  temp: Variant;
  i: Integer;
begin
  if Priznak_vizova = 'add' then
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
//  ShowMessage(VarToStr(sum_doc));
end;

//Подсчет суммы по смете
procedure TfrmShablon6.Summa();
var
  i: Integer;
  temp: Variant;
  kol_vo_smet: Integer;
begin
  sum_po_smet := 0;
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
//   CurrencyEdit_summa.Text:=VarToStr(sum_po_smet);
end;

procedure TfrmShablon6.RxMemoryData_smetAfterDelete(DataSet: TDataSet);
begin
  Summa();
end;

procedure TfrmShablon6.RxMemoryData_smetAfterPost(DataSet: TDataSet);
begin
  Summa();
end;


procedure TfrmShablon6.cxGrid1DBTableView1KeyDown(Sender: TObject;
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

procedure TfrmShablon6.cxGrid1DBTableView1CustomDrawCell(
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

procedure TfrmShablon6.CurrencyEdit_sum_po_smetChange(Sender: TObject);
begin
  if Priznak_vizova = 'add' then
  CurrencyEdit_summa.Text:=CurrencyEdit_sum_po_smet.Text;
end;

procedure TfrmShablon6.CurrencyEdit_oplChange(Sender: TObject);
begin
{  if CurrencyEdit_summa.Value < CurrencyEdit_opl.Value then
  begin
    ShowMessage('Сумма до оплати перевищує суму документа');
    CurrencyEdit_opl.SetFocus;
  end;}
end;

procedure TfrmShablon6.CurrencyEdit_oplExit(Sender: TObject);
var
  sum_k_opl: Currency;
  sum_pay: Currency;
  sum_doc: Currency;
  sum_fulfil: Currency;
  temp: Variant;
begin

  if Priznak_vizova = 'add' then
  begin
    sum_pay := 0;
  end
  else
  begin
    if not VarIsNull(pFIBDataSet_id_dokument.FieldByName('d_sum_pay').AsVariant) then sum_pay := pFIBDataSet_id_dokument.FieldByName('d_sum_pay').AsCurrency else sum_pay := 0;
  end;

  if CurrencyEdit_sum_fulfil.Text = '' then
  sum_fulfil := 0 else
  sum_fulfil := CurrencyEdit_sum_fulfil.Value;

  if CurrencyEdit_opl.Text = '' then
  sum_k_opl := 0 else
  sum_k_opl := StrToFloat(CurrencyEdit_opl.Text);

  if CurrencyEdit_summa.Text = '' then sum_doc := 0 else
  sum_doc := StrToFloat(CurrencyEdit_summa.Text);

  temp := sum_pay + sum_fulfil + sum_k_opl;


  if (sum_doc < temp) then
  begin
    if  sum_k_opl = 0 then Exit;
    ShowMessage('Сума до сплати перевищує неоплачену суму документа');
    CurrencyEdit_opl.Text := CurrToStr(sum_doc - sum_fulfil - sum_pay);
  end;
end;

procedure TfrmShablon6.Label14Click(Sender: TObject);
begin
  if Priznak_vizova <> 'add' then
  ShowDogPayFulfil(Self, pFIBDatabase.Handle, pFIBTransactionRead.Handle, pFIBTransactionWrite.Handle, fsNormal, id_doc, -1);
end;

procedure TfrmShablon6.Label14MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Priznak_vizova <> 'add' then
  begin
    Label14.Cursor := crHandPoint;
  end;
end;

procedure TfrmShablon6.Label15Click(Sender: TObject);
begin
  if Priznak_vizova <> 'add' then
  ShowDogPayFulfil(Self, pFIBDatabase.Handle, pFIBTransactionRead.Handle, pFIBTransactionWrite.Handle, fsNormal, id_doc, -1);
end;

procedure TfrmShablon6.Label15MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Priznak_vizova <> 'add' then
  begin
    Label15.Cursor := crHandPoint;
  end;
end;

procedure TfrmShablon6.add_smetExecute(Sender: TObject);
begin
  dxBarLargeButton_addClick(Self);
end;

procedure TfrmShablon6.del_smetExecute(Sender: TObject);
begin
  dxBarLargeButton_delClick(Self);
end;

procedure TfrmShablon6.N1Click(Sender: TObject);
begin
  dxBarLargeButton_addClick(Self);
end;

procedure TfrmShablon6.N2Click(Sender: TObject);
begin
  dxBarLargeButton_delClick(Self);
end;

procedure TfrmShablon6.FormShow(Sender: TObject);
  var
   Str:String;
begin
   pFIBDataSet_id_dokument.Active := false;
   Str:=pFIBDataSet_id_dokument.SQLs.SelectSQL.Text;
   pFIBDataSet_id_dokument.SQLs.SelectSQL.Text :='select dog_sel_num_urzb_by_id_dog.id_urzb as NUM_URZB from dog_sel_num_urzb_by_id_dog('+IntToStr(kod_dog)+')';
   pFIBDataSet_id_dokument.Active := true;

   if  not(pFIBDataSet_id_dokument.IsEmpty) then  Caption:=Caption+'( № Юридичного зобо'+''''+'язання '+VarToStr(pFIBDataSet_id_dokument.FBN('NUM_URZB').AsVariant)+')';
   pFIBDataSet_id_dokument.Active := false;
   pFIBDataSet_id_dokument.SQLs.SelectSQL.Text:=Str;
   pFIBDataSet_id_dokument.Active := true;

  LoadPositionFromRegistry(Self);
  if Priznak_vizova = 'red' then
  CurrencyEdit_opl.SetFocus;
  if Priznak_vizova = 'prosmotr' then
  begin
    cxGrid1.PopupMenu := Nil;
    dxBarLargeButton_add.Enabled := False;
    dxBarLargeButton_del.Enabled := False;
  end;
  Height := 556;
  Width  := 580;
end;

procedure TfrmShablon6.EditSum();
begin
//
end;

procedure TfrmShablon6.Label17MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Priznak_vizova = 'red' then
  begin
    Label17.Cursor := crHandPoint;
  end;
end;

procedure TfrmShablon6.Label17Click(Sender: TObject);
var
  Ret : VAriant;
begin
  if Priznak_vizova <> 'red' then Exit;
  Ret := LoadDogManedger.EditSum(self, 2, pFIBDataSet_id_dokument.FieldByName('d_sum_pay').AsCurrency,
                                 pFIBDataSet_id_dokument.FieldByName('d_nds_pay').AsCurrency,
                                 CurrencyEdit_summa.Value, 0);
  if VarArrayDimCount(Ret)>0
  then begin
     if Ret[0]<>NULL
     then begin
       if Ret[0] > 0 then
       begin
         CurrencyEdit_summa.Value := Ret[0];
       end;
     end;
  end;
end;

procedure TfrmShablon6.dxBarLargeButton_addClick(Sender: TObject);
var
  Add_smet: TfrmAddSmetSh6;
  sum_dog, sum_smet, sum_opl, sum_pod_smet: Double;
begin
  if  CurrencyEdit_summa.Text = '' then sum_dog := 0 else
  sum_dog := StrToFloat(CurrencyEdit_summa.Text);

  if  CurrencyEdit_sum_po_smet.Text = '' then sum_pod_smet := 0 else
  sum_pod_smet := StrToFloat(CurrencyEdit_sum_po_smet.Text);

  if  CurrencyEdit_summa_pay.Text = '' then sum_opl := 0 else
  sum_opl := StrToFloat(CurrencyEdit_summa_pay.Text);

  sum_smet := sum_opl + sum_pod_smet;

{  if Priznak_vizova = 'red' then
  begin
    if sum_dog = sum_smet then
    begin
      ShowMessage('Сумма документа совпадает с суммой по сметам');
      Exit;
    end;
  end;
 }
//  Добавление человека в договор

  TfrmAddSmetSh6(Self.Owner).ProverkaSum(sum_dog, sum_smet,Priznak_vizova);

  Add_smet := TfrmAddSmetSh6.Create(Self, 0, 0, 0, '', '', '', 0, 0, 0, false, 0);
  Add_smet.ShowModal;
  SummaDoc();
  Add_smet.Free;

end;

procedure TfrmShablon6.dxBarLargeButton_delClick(Sender: TObject);
var
  id_sm: Variant;
begin

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
  SummaDoc();
  id_sm := RxMemoryData_smet.FieldByName('id').Value;
  RxMemoryData_smet.Locate('id', id_sm, []);

end;

procedure TfrmShablon6.FormResize(Sender: TObject);
begin
  Panel1.Left := Width div 2 - Panel1.Width div 2 - 6;
  Panel1.Top := Height div 2 - Panel1.Height div 2 - 18;

//Добавлено: нормализация размеров формы
//Герасименко Роман 23.07.2008

//  if self.WindowState=wsMaximized then
//    begin
//      self.WindowState:=wsNormal;
//    end;
//  Height := 556;
//  Width  := 580;

end;

procedure TfrmShablon6.cxButton_histClick(Sender: TObject);
var
  Hist: Variant;
  Query: TpFIBDataSet;
begin
 Query := TpFIBDataSet.Create(Self);
 Query.Transaction := pFIBTransactionRead;
 Query.SelectSQL.Text := 'SELECT COUNT(id_history) FROM   dog_dt_document_history, dog_dt_document '+
                         'WHERE  dog_dt_document_history.id_dog=dog_dt_document.id_dog AND    dog_dt_document.id_dog='+IntToStr(id_doc);
 Query.Open;
 if (Query['count'] = 0) then
 begin
   ShowMessage('Історія зміни по цьому документу відсутня.');
   Exit;
 end
 else
 Hist:=LoadDogManedger.History_dog(self, pFIBDatabase.Handle, kod_dog, fsNormal);
end;

procedure TfrmShablon6.saveExecute(Sender: TObject);
begin
  cxButton_okClick(Self);
end;

procedure TfrmShablon6.save1Execute(Sender: TObject);
begin
  cxButton_okClick(Self);
end;

procedure TfrmShablon6.insExecute(Sender: TObject);
begin
  dxBarLargeButton_addClick(Self);
end;

procedure TfrmShablon6.Label5Click(Sender: TObject);
var
  s       : Variant;
begin
  s := LoadDogManedger.Comment(Self, comment, Priznak_vizova);
  comment := s;  
end;

procedure TfrmShablon6.cxButtonEdit_depPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(pFIBDatabase.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;

            FieldValues['Root_Department'] := DogLoaderUnit.SYS_DEF_ID_DEPARTMENT;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
        // показать справочник и проанализировать результат (выбор одного подр.)
    sp.Show;
    if sp.Output = nil then
        ShowMessage('BUG: Output is NIL!!!')
    else
    if not sp.Output.IsEmpty then
    begin
        cxButtonEdit_otd.Text := sp.Output['Name_Full'];
    id_otdel := sp.Output['Id_Department'];
    end;
    sp.Free;
end;

procedure TfrmShablon6.btnEditClick(Sender: TObject);
var
  Add_smet: TfrmAddSmetSh6;
  sum_dog, sum_smet, sum_opl, sum_pod_smet: Double;
begin
  if  CurrencyEdit_summa.Text = '' then sum_dog := 0 else
  sum_dog := StrToFloat(CurrencyEdit_summa.Text);

  if  CurrencyEdit_sum_po_smet.Text = '' then sum_pod_smet := 0 else
  sum_pod_smet := StrToFloat(CurrencyEdit_sum_po_smet.Text);

  if  CurrencyEdit_summa_pay.Text = '' then sum_opl := 0 else
  sum_opl := StrToFloat(CurrencyEdit_summa_pay.Text);

  sum_smet := sum_opl + sum_pod_smet;

{  if Priznak_vizova = 'red' then
  begin
    if sum_dog = sum_smet then
    begin
      ShowMessage('Сумма документа совпадает с суммой по сметам');
      Exit;
    end;
  end;
 }
  TfrmAddSmetSh6(Self.Owner).ProverkaSum(sum_dog, sum_smet,Priznak_vizova);

  Add_smet := TfrmAddSmetSh6.Create(Self, 0, 0, 0, '', '', '', 0, 0, 0, false, 0);
  Add_smet.ShowModal;
  SummaDoc();
  Add_smet.Free;
end;

procedure TfrmShablon6.cxButton1Click(Sender: TObject);
 var
 i, o : TAArray;
begin

  i := TAArray.Create;
  o := TAArray.Create;
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsNormal;
  i['Caption'].AsString := 'Справочник оснований';
  i['CaptionEdit'].AsString := 'клас';
  i['TableName'].AsString := 'PUB_SP_OSN';
  i['KEY_FIELD'].AsString := 'id_osn';
  i['parent_field'].AsString := 'linkto';
  i['FIELDS'].AsString := 'name_osn';
  i['FIELDS_caption'].AsString := 'Наименование основания';
  i['SearchField'].AsString := 'name_osn';
  i['AddProc'].AsString := 'PUB_SP_OSN_ADD';
  i['DelProc'].AsString := 'PUB_SP_OSN_DEL';
  i['UpdProc'].AsString := 'PUB_SP_OSN_MOD';
  i['DBHandle'].AsInteger := integer(pFIBDatabase.handle);

  LoaderUnit.LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivTree.bpl', i, o);
  if o['MoadResult'].AsVariant = mrOk then
  begin

  cxMemo_dog_note.Text := o['name_osn'].AsString;
  end;
  i.Free;
  o.Free;
end;

end.



