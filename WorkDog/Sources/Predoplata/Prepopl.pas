unit Prepopl;
{*******************************************************************************
* Shablon1                                                                     *
*                                                                              *
* Работа с договорами, Шаблон 1(счет-фактура, служебная записка)               *
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
  pFIBStoredProc, Menus, cxTL, Math, dogLoaderUnit, dogLangPackUnit2,
  dxStatusBar,uCommonSp,AArray,LoaderUnit;

resourcestring
    errDtNotNumber = 'Номер договору не заповнен!';
    errDtNotKontragent = 'Виберіть контрагента!';
    errDtNotDonnu = 'Виберіть рахунок!';
    errDtNotNote = 'Підстава договору не заповнена!';
    errDtKritDate = 'Некоректно введена критична дата оплати!';
    errNotSmet = 'Необхідно додати кошторис!';
    errNotSumOpl = 'Необхідно ввести суму до оплати!';
    errSumOtr = 'Сума повинна бути більше нуля!';

type
  TfrmPredopl = class(TForm)
    Panel1: TPanel;
    pFIBDatabase: TpFIBDatabase;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    RxMemoryData_smet: TRxMemoryData;
    DataSource_smet: TDataSource;
    pFIBStoredProc_dt_add: TpFIBStoredProc;
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
    pFIBDataSet_smet_info: TpFIBDataSet;
    pFIBDataSet_kekv: TpFIBDataSet;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label24: TLabel;
    cxTextEdit_mfo_p: TcxTextEdit;
    cxTextEdit_rsch_p: TcxTextEdit;
    cxTextEdit_bank_p: TcxTextEdit;
    cxTextEdit_name_p: TcxTextEdit;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    cxButtonEdit_name_un: TcxButtonEdit;
    cxTextEdit_mfo_un: TcxTextEdit;
    cxTextEdit_rsch_un: TcxTextEdit;
    cxTextEdit_bank_un: TcxTextEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    CurrencyEdit_opl: TCurrencyEdit;
    CurrencyEdit_summa: TCurrencyEdit;
    CurrencyEdit_summa_pay: TCurrencyEdit;
    CurrencyEdit_sum_fulfil: TCurrencyEdit;
    Label4: TLabel;
    cxMaskEdit_n_dog: TcxMaskEdit;
    Label3: TLabel;
    cxDateEdit_dog: TcxDateEdit;
    cxTextEdit_reg_nomer: TcxTextEdit;
    Label2: TLabel;
    GroupBox6: TGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn_smeta: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel4: TPanel;
    ToolButton_add: TSpeedButton;
    ToolButton_del: TSpeedButton;
    Panel3: TPanel;
    cxTextEdit_kol_vo_smet: TcxTextEdit;
    CurrencyEdit_sum_po_smet: TCurrencyEdit;
    Panel2: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label13: TLabel;
    Label27: TLabel;
    cxMemo_dog_note: TcxMemo;
    Bevel1: TBevel;
    cxButton_ok: TcxButton;
    cxButton_cancel: TcxButton;
    CurrencyEdit_nds: TCurrencyEdit;
    Label1: TLabel;
    DataSetHistory: TpFIBDataSet;
    DataSetHistSmet: TpFIBDataSet;
    cxButton_hist: TcxButton;
    ActionList1: TActionList;
    save: TAction;
    save1: TAction;
    ins: TAction;
    SpeedButton_red: TSpeedButton;
    dxStatusBar1: TdxStatusBar;
    edit: TAction;
    N3: TMenuItem;
    Label12: TLabel;
    Label26: TLabel;
    cxButtonEdit_otd: TcxButtonEdit;
    del: TAction;
    DataSetCheck: TpFIBDataSet;
    TransactionCheck: TpFIBTransaction;
    cxButton1: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButtonEdit_name_unPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RxMemoryData_smetAfterScroll(DataSet: TDataSet);
    procedure ToolButton_addClick(Sender: TObject);
    procedure cxButton_okClick(Sender: TObject);
    procedure cxMaskEdit_n_dogKeyPress(Sender: TObject; var Key: Char);
    procedure RxMemoryData_smetAfterDelete(DataSet: TDataSet);
    procedure RxMemoryData_smetAfterPost(DataSet: TDataSet);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ToolButton_delClick(Sender: TObject);
    procedure CurrencyEdit_sum_po_smetChange(Sender: TObject);
    procedure CurrencyEdit_oplChange(Sender: TObject);
    procedure CurrencyEdit_ndsExit(Sender: TObject);
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
    procedure FormResize(Sender: TObject);
    procedure cxButton_histClick(Sender: TObject);
    procedure saveExecute(Sender: TObject);
    procedure save1Execute(Sender: TObject);
    procedure insExecute(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label1Click(Sender: TObject);
    procedure SpeedButton_redClick(Sender: TObject);
    procedure editExecute(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure cxButtonEdit_depPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure delExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    fProc : TResProc;
    procedure Summa(); // считает сумму сметы
    procedure SumNds();
    procedure SummaDoc(); //считает сумму документа
    procedure SumToSmet(); // сумма, допустимая к разбивке
    procedure MakeNote();

  public
    flag :Boolean;
    kod_dog: Int64;
    id_dog_in : int64;
    procedure NotePredopl();
    constructor Create (Aowner:TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_dokument:
                        Variant; Pr_vizova: String; Id_t_d: Variant); overload;
   { Public declarations }
  end;

function LoadShablon(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle;id_dokument: Variant;
                 Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;stdcall;
exports LoadShablon;


var
  frmPredopl: TfrmPredopl;
  sum_predopl: Double;
  sum_kowt: Variant; //Для расчета разбивки по сметам
  cht: Double;
  id_p :Int64;
  name_p,
  rate_acc_un, rate_acc_p: Variant; //идентификаторы счетов ДонНУ и контрагента соответственно
  id_doc, id_dog:Int64;
  smeta, razdel, stat: String;  //переменные, содержащие данные по сметам из функции;
  Priznak_vizova :String;
  id_smeta, id_razdel, id_stat :Variant;
  title_smet: String;
  nds_procent, sum_nds: Variant;
  sum_po_smet : Variant;
  id_tip_dog: Variant;
  tip_dog_name: String;
  id_dog_red: Variant; //для редактирования сметы
  id_dt_smet: Variant; //Переменная для позиционирования
  sum_doc: Variant; //Сумма документа
  note_predopl: String;
  nds_predopl: Variant;
  summa_to_smet: Currency;
  comment : String;
  id_otdel: Integer;

implementation
uses
  add_predopl, Registry;


{$R *.dfm}

constructor TfrmPredopl.Create(Aowner:TComponent ;DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_dokument: Variant;
                               Pr_vizova: String; Id_t_d: Variant);
var
  i: Integer;
  nds_s: Currency;
begin

Priznak_vizova := Pr_vizova;
if Pr_vizova = 'red' then
      begin
        inherited Create (Aowner);
        pFIBDatabase.Handle := DBHANDLE;

        pFIBDataSet_id_dokument.Active := false;
        pFIBDataSet_id_dokument.ParamByName('D_ID_DOG_VX').AsInt64 := id_dokument;
        pFIBDataSet_id_dokument.Active := true;

        kod_dog := id_dokument; //позиционирование
        id_dog_in := id_dokument;

        if  not VarIsNull(pFIBDataSet_id_dokument.FBN('d_comment').AsVariant) then
        comment := pFIBDataSet_id_dokument.FBN('d_comment').asstring else
        comment := '';

        cxButtonEdit_otd.Text := pFIBDataSet_id_dokument.FBN('OTDEL_NAME_FULL').AsString;
        id_otdel := pFIBDataSet_id_dokument.FBN('ID_OTDEL').AsInteger;

        cxMaskEdit_n_dog.Text := pFIBDataSet_id_dokument.FieldByName('d_n_dog').AsString;


        ////////////////////////////////////////////////////////////////////////
        //                                                                    //
        //                                                                    //
        ////////////////////////////////////////////////////////////////////////

        if Trim(DateToStr(cxDateEdit_dog.Date))='' then
        begin
           MessageDlg('Увага', 'Дата договору не повинна бути пустою', mtError, [mbOk]);
           Exit;
        end;
        cxDateEdit_dog.Date := pFIBDataSet_id_dokument.FieldByName('d_d_dog').AsDateTime;


        CurrencyEdit_summa.Text := pFIBDataSet_id_dokument.FieldByName('d_summa').AsString;

        nds_s := pFIBDataSet_id_dokument.FieldByName('d_nds_sum').AsVariant;
        CurrencyEdit_nds.Text := pFIBDataSet_id_dokument.FieldByName('d_nds_sum').AsVariant;
        cxMemo_dog_note.Text := pFIBDataSet_id_dokument.FieldByName('d_dog_note').AsString;
        cxTextEdit_reg_nomer.Text := pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString;
        CurrencyEdit_summa_pay.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_pay').AsString;
        CurrencyEdit_sum_fulfil.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_fulfil').AsString;
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
        id_dog_red := pFIBDataSet_red_document.FieldByName('ID_DOG').AsVariant;

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
        cxTextEdit_name_p.Text := pFIBDataSet_id_dokument.FieldByName('d_name_customer_k').AsString;
        cxTextEdit_mfo_p.Text := pFIBDataSet_id_dokument.FieldByName('D_MFO_K').AsString;
        cxTextEdit_bank_p.Text := pFIBDataSet_id_dokument.FieldByName('D_BANK_NAME_K').AsString;
        cxTextEdit_rsch_p.Text := pFIBDataSet_id_dokument.FieldByName('D_RSCH_K').AsString;

        id_p := StrToInt64(VarTostr(pFIBDataSet_id_dokument.FieldByName('D_ID_CUSTOMER').AsVariant));

//        ShowMessage('#'+IntToStr(id_p));

        name_p := pFIBDataSet_id_dokument.FieldByName('D_NAME_CUSTOMER_K').AsString;

        //Данные по смете
        pFIBDataSet_smet_info.Active := false;
        pFIBDataSet_smet_info.ParamByName('param_doc').Value := id_dokument;
        pFIBDataSet_smet_info.Active := true;
        pFIBDataSet_smet_info.FetchAll;
        pFIBDataSet_smet_info.First;
        for i := 0 to pFIBDataSet_smet_info.RecordCount-1 do
        begin
          RxMemoryData_smet.Open;
          RxMemoryData_smet.Insert;

          pFIBDataSet_kekv.Active := false;
          pFIBDataSet_kekv.ParamByName('id_kekv').Value := pFIBDataSet_smet_info.FieldByName('id_kekv').AsInteger;
          pFIBDataSet_kekv.ParamByName('actual_date').Value := Date;
          pFIBDataSet_kekv.Active := true;

          RxMemoryData_smet.FieldByName('id_kekv').Value := pFIBDataSet_smet_info.FieldByName('id_kekv').AsInteger;
          RxMemoryData_smet.FieldByName('name_kekv').Value := pFIBDataSet_kekv.FieldByName('KEKV_TITLE').AsString;
          RxMemoryData_smet.FieldByName('kod_kekv').Value := pFIBDataSet_kekv.FieldByName('KEKV_KODE').AsInteger;;

          pFIBDataSet_smeta.Active := false;
          pFIBDataSet_smeta.ParamByName('id_smeta').Value := pFIBDataSet_smet_info.FieldByName('id_smeta').AsVariant;
          pFIBDataSet_smeta.Active := true;

          RxMemoryData_smet.FieldByName('id_smet').Value := pFIBDataSet_smet_info.FieldByName('id_smeta').AsVariant;
          RxMemoryData_smet.FieldByName('name_smet').Value := pFIBDataSet_smeta.FieldByName('SMETA_TITLE').AsVariant;
          RxMemoryData_smet.FieldByName('kod_smety').Value := pFIBDataSet_smeta.FieldByName('SMETA_KOD').AsVariant;

          pFIBDataSet_razd_st.Active := false;
          pFIBDataSet_razd_st.ParamByName('id_razd_st_in').Value := pFIBDataSet_smet_info.FieldByName('id_razd').AsVariant;
          pFIBDataSet_razd_st.Active := true;

          RxMemoryData_smet.FieldByName('id_razd').Value := pFIBDataSet_smet_info.FieldByName('id_razd').AsVariant;
          RxMemoryData_smet.FieldByName('n_razd').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_NUM').AsVariant;
          RxMemoryData_smet.FieldByName('name_razd').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_TITLE').AsVariant;

          pFIBDataSet_razd_st.Active := false;
          pFIBDataSet_razd_st.ParamByName('id_razd_st_in').Value := pFIBDataSet_smet_info.FieldByName('id_stat').AsVariant;
          pFIBDataSet_razd_st.Active := true;

          RxMemoryData_smet.FieldByName('id_stat').Value := pFIBDataSet_smet_info.FieldByName('id_stat').AsVariant;
          RxMemoryData_smet.FieldByName('name_stat').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_TITLE').AsVariant;
          RxMemoryData_smet.FieldByName('n_stat').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_NUM').AsVariant;
          RxMemoryData_smet.FieldByName('sum_smet').Value := pFIBDataSet_smet_info.FieldByName('summa').AsVariant;

          RxMemoryData_smet.FieldByName('id').Value := pFIBDataSet_smet_info.FieldByName('id_dt_smet_dog').AsVariant;
          RxMemoryData_smet.FieldByName('flag_del').Value := 0;
          RxMemoryData_smet.Post;

          pFIBDataSet_smet_info.Next;
      end;

        Caption := 'Редагування'+' '+pFIBDataSet_tip_dog.FieldByName('short_name').AsString + ' (12)';

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
        CurrencyEdit_nds.Enabled := false;


        FormStyle := frmStyle;
      end
      else
//////////////////////////////////////////////////////////////////////////////////////
      if Pr_vizova = 'add' then
      begin
        inherited Create (Aowner);

        FormStyle := frmStyle;
        pFIBDatabase.Handle := DBHANDLE;

        FormStyle := frmStyle;

        pFIBDataSet_id_dokument.Active := false;
        pFIBDataSet_id_dokument.ParamByName('D_ID_DOG_VX').AsInt64 := id_dokument;
        pFIBDataSet_id_dokument.Active := true;

        comment := '';
/////////////////////////////Сумма к предоплате/////////////////////////////////////
//////////////////////////////////////////          //////////////////////////////////////////
        {если оплачивать кредиторскую задолженность, то разбивка выбирается по а
        алгоритму, если нет - разбивка берется из под кошториса}


////////////////////////////////////////////////////////////////////////////////////

        cxDateEdit_dog.Date := Date;

   //Тип договора в верху формы
        pFIBDataSet_tip_dog_add.Active := false;
        pFIBDataSet_tip_dog_add.ParamByName('pram_id_tip_dog').Value := id_t_d;
        pFIBDataSet_tip_dog_add.Active := true;
        Caption := 'Додання'+' '+pFIBDataSet_tip_dog_add.FieldByName('short_name').AsString+ ' (12)';

        Label2.Visible := false;
        cxTextEdit_reg_nomer.Visible := false;

   //Выбор по умолчанию
        pFIBDataSet_tip_info.Active := false;
        pFIBDataSet_tip_info.ParamByName('d_id_tip_dog').Value := Id_t_d;
        pFIBDataSet_tip_info.Active := true;

   //Данные по native
        cxButtonEdit_name_un.Text := pFIBDataSet_id_dokument.FieldByName('D_NAME_CUSTOMER_N').AsString;
        cxTextEdit_mfo_un.Text := pFIBDataSet_id_dokument.FieldByName('D_MFO_N').AsString;
        cxTextEdit_bank_un.Text := pFIBDataSet_id_dokument.FieldByName('D_BANK_NAME_N').AsString;
        cxTextEdit_rsch_un.Text := pFIBDataSet_id_dokument.FieldByName('D_RSCH_N').AsString;

        if not VarIsNull(pFIBDataSet_id_dokument.FieldByName('D_ID_RATE_ACC_NATIVE').AsVariant) then
           rate_acc_un := pFIBDataSet_id_dokument.FieldByName('D_ID_RATE_ACC_NATIVE').AsVariant
        else
           rate_acc_un := 0;

   //Данные по контрагенту
         if not VarIsNull(pFIBDataSet_id_dokument.FieldByName('D_ID_RATE_ACCOUNT').AsVariant) then
            rate_acc_p := pFIBDataSet_id_dokument.FieldByName('D_ID_RATE_ACCOUNT').AsVariant
         else
            rate_acc_p := 0;


        cxTextEdit_name_p.Text := pFIBDataSet_id_dokument.FieldByName('d_name_customer_k').AsString;
        cxTextEdit_mfo_p.Text := pFIBDataSet_id_dokument.FieldByName('D_MFO_K').AsString;
        cxTextEdit_bank_p.Text := pFIBDataSet_id_dokument.FieldByName('D_BANK_NAME_K').AsString;
        cxTextEdit_rsch_p.Text := pFIBDataSet_id_dokument.FieldByName('D_RSCH_K').AsString;

//        ShowMessage('#'+VarToStr(pFIBDataSet_id_dokument.FieldByName('D_ID_CUSTOMER').AsVariant));
        if not VarIsNull(pFIBDataSet_id_dokument.FieldByName('D_ID_CUSTOMER').AsVariant) then
          id_p := StrToInt64(VarToStr(pFIBDataSet_id_dokument.FieldByName('D_ID_CUSTOMER').AsVariant))
        else
          id_p:=0;
//          ShowMessage('#'+IntToStr(id_p));

        name_p := pFIBDataSet_id_dokument.FieldByName('D_NAME_CUSTOMER_K').AsString;

   //Данные по смете
        pFIBDataSet_smet_info.Active := false;
        pFIBDataSet_smet_info.ParamByName('param_doc').AsInt64 := id_dokument;
        pFIBDataSet_smet_info.Active := true;

        id_doc := id_dokument;
        cxMaskEdit_n_dog.Text := pFIBDataSet_id_dokument.FieldByName('D_REGEST_NUM').AsString;

   /////////////////////////////формирование основания//////////////

//      cxMemo_dog_note.Text := pFIBDataSet_id_dokument.FieldByName('D_DOG_NOTE').AsString;


      end
      else
      if Pr_vizova = 'prosmotr' then
////////////////////////Просмотр документа
      begin
        inherited Create (Aowner);

        pFIBDatabase.Handle := DBHANDLE;
        FormStyle := frmStyle;

        pFIBDataSet_id_dokument.Active := false;
        pFIBDataSet_id_dokument.ParamByName('D_ID_DOG_VX').AsInt64 := id_dokument;
        pFIBDataSet_id_dokument.Active := true;

        if  not VarIsNull(pFIBDataSet_id_dokument.FBN('d_comment').AsVariant) then
        comment := pFIBDataSet_id_dokument.FBN('d_comment').asstring else
        comment := '';

        cxButtonEdit_otd.Text := pFIBDataSet_id_dokument.FBN('OTDEL_NAME_FULL').AsString;

        cxMaskEdit_n_dog.Text := pFIBDataSet_id_dokument.FieldByName('d_n_dog').AsString;
        cxDateEdit_dog.Date := pFIBDataSet_id_dokument.FieldByName('d_d_dog').AsDateTime;
        CurrencyEdit_summa.Text := pFIBDataSet_id_dokument.FieldByName('d_summa').AsString;

        if VarIsNull(pFIBDataSet_id_dokument.FieldByName('d_nds_sum').AsVariant)then
        begin
         nds_s:=0
        end else
        begin
         nds_s:=pFIBDataSet_id_dokument.FieldByName('d_nds_sum').AsVariant
        end;

        //nds_s := pFIBDataSet_id_dokument.FieldByName('d_nds_sum').AsVariant;

        if VarIsNull(pFIBDataSet_id_dokument.FieldByName('d_nds_sum').AsVariant) then
        begin
          CurrencyEdit_nds.Text := '0,00'
        end else
        begin
          CurrencyEdit_nds.Text := pFIBDataSet_id_dokument.FieldByName('d_nds_sum').AsString
        end;

        cxMemo_dog_note.Text := pFIBDataSet_id_dokument.FieldByName('d_dog_note').AsString;
        cxTextEdit_reg_nomer.Text := pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString;
        CurrencyEdit_summa_pay.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_pay').AsString;
        CurrencyEdit_sum_fulfil.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_fulfil').AsString;
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

        if Varisnull(pFIBDataSet_red_document.FieldByName('ID_DOG').AsVariant) then
          id_dog_red := pFIBDataSet_red_document.FieldByName('ID_DOG').AsVariant
        else
          id_dog_red :=0;  

       //Данные по типам договоров
        pFIBDataSet_tip_dog.Active := false;
        pFIBDataSet_tip_dog.ParamByName('param_document').AsInt64 := id_dokument;
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
        cxTextEdit_name_p.Text := pFIBDataSet_id_dokument.FieldByName('d_name_customer_k').AsString;
        cxTextEdit_mfo_p.Text := pFIBDataSet_id_dokument.FieldByName('D_MFO_K').AsString;
        cxTextEdit_bank_p.Text := pFIBDataSet_id_dokument.FieldByName('D_BANK_NAME_K').AsString;
        cxTextEdit_rsch_p.Text := pFIBDataSet_id_dokument.FieldByName('D_RSCH_K').AsString;

        //Данные по смете
        pFIBDataSet_smet_info.Active := false;
        pFIBDataSet_smet_info.ParamByName('param_doc').AsInt64  := id_dokument;
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

          RxMemoryData_smet.FieldByName('id').Value := pFIBDataSet_smet_info.FieldByName('id_dt_smet_dog').AsVariant;
          RxMemoryData_smet.FieldByName('flag_del').Value := 0;
          RxMemoryData_smet.Post;

          pFIBDataSet_smet_info.Next;
      end;
        Caption := 'Перегляд'+' '+pFIBDataSet_tip_dog.FieldByName('short_name').AsString+ ' (12)';
        cxMaskEdit_n_dog.Enabled := false;
        cxDateEdit_dog.Enabled := false;
        CurrencyEdit_sum_po_smet.Enabled := false;
        CurrencyEdit_nds.Enabled := false;
        cxMemo_dog_note.Enabled := false;
        ToolButton_add.Enabled := false;
        ToolButton_del.Enabled := false;
        cxTextEdit_name_p.Enabled:=false;
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

        Panel4.Visible         := false;

        ins.Enabled := false;
        edit.Enabled := false;
        del.Enabled := false;

        dxStatusBar1.Visible := false;

      end
      else
/////////////////////////история изменений////////////////
      if Pr_vizova = 'hist' then
      begin
        inherited Create (Aowner);
        FormStyle := frmStyle;
        pFIBDatabase.Handle := DBHANDLE;

        DataSetHistory.Active := false;
        DataSetHistory.ParamByName('id_history').AsInt64 := id_dokument;
        DataSetHistory.Active := true;

        if  not VarIsNull(DataSetHistory.FBN('d_comment').AsVariant) then
        comment := DataSetHistory.FBN('d_comment').asstring else
        comment := '';

        cxButtonEdit_otd.Text := DataSetHistory.FBN('OTDEL_NAME_FULL').AsString;

        cxMaskEdit_n_dog.Text := DataSetHistory.FieldByName('d_n_dog').AsString;
        cxDateEdit_dog.Date := DataSetHistory.FieldByName('d_d_dog').AsDateTime;
        CurrencyEdit_summa.Text := DataSetHistory.FieldByName('d_summa').AsString;
        CurrencyEdit_nds.Text := DataSetHistory.FieldByName('d_nds_sum').AsString;
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
        cxTextEdit_name_p.Text := DataSetHistory.FieldByName('d_name_customer_k').AsString;
        cxTextEdit_mfo_p.Text := DataSetHistory.FieldByName('D_MFO_K').AsString;
        cxTextEdit_bank_p.Text := DataSetHistory.FieldByName('D_BANK_NAME_K').AsString;
        cxTextEdit_rsch_p.Text := DataSetHistory.FieldByName('D_RSCH_K').AsString;

        DataSetHistSmet.Active := false;
        DataSetHistSmet.ParamByName('id_history').AsInt64 := id_dokument;
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
        CurrencyEdit_nds.Enabled := false;
        cxMemo_dog_note.Enabled := false;
        ToolButton_add.Enabled := false;
        ToolButton_del.Enabled := false;
        GroupBox2.Enabled := false;
        GroupBox3.Enabled := false;
        CurrencyEdit_opl.Enabled := false;
        cxButton_hist.Visible := false;

        Panel4.Visible         := false;

        ins.Enabled := false;
        edit.Enabled := false;
        del.Enabled := false;

        dxStatusBar1.Visible := false;
      end;
end;
 /////////////////////////////////////////////////////////////////////
function LoadShablon(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle;id_dokument: Variant;
                 Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;
var
  sh5: TfrmPredopl;
  PredoplAdd : TFrmAddPredopl;
  kr_zad, i: Integer;
  nds_s : Currency;
  nds_kowt: Variant;
  nds_proc: Variant;
  n_p: Variant; 
  d_summa:Variant;
  d_sum_fulfil:Variant;
  D_SUM_PAY:Variant;
begin

  sh5 := TfrmPredopl.Create(AOwner, DBHANDLE, frmStyle, id_dokument, Pr_vizova, id_t_d);
  if sh5.Flag then
  begin
    sh5.free;
    Exit;
  end;
  sh5.fProc := proc;

  if Pr_vizova = 'add' then
  begin

    //ShowMessage('Add #1 ');

    if VarIsNull(sh5.pFIBDataSet_id_dokument.FieldByName('d_summa').AsVariant) then
         d_summa:=0
    else
       d_summa:=sh5.pFIBDataSet_id_dokument.FieldByName('d_summa').AsVariant;

    if VarIsNull(sh5.pFIBDataSet_id_dokument.FieldByName('d_sum_fulfil').AsVariant) then
      d_sum_fulfil:=0
    else
      d_sum_fulfil:= sh5.pFIBDataSet_id_dokument.FieldByName('d_sum_fulfil').AsVariant;

    if VarisNull(sh5.pFIBDataSet_id_dokument.FieldByName('D_SUM_PAY').AsVariant) then
      D_SUM_PAY:=0
    else
      D_SUM_PAY := sh5.pFIBDataSet_id_dokument.FieldByName('D_SUM_PAY').AsVariant;

      //ShowMessage('Add #2 ');

    PredoplAdd := TFrmAddPredopl.Create(Aowner, d_summa,d_sum_fulfil,D_SUM_PAY);

//    ShowMessage('Add #3 ');
    if PredoplAdd.ShowModal <> mrOk then
    begin
      PredoplAdd.Free;
      sh5.Free;
      Exit;
    end
    else
    begin
      sum_predopl := 0;
      sum_predopl := StrToFloat(PredoplAdd.CurrencyEdit_sum_predopl.Text);
      if  PredoplAdd.cxCheckBox_kredit.Checked then kr_zad := 1 else kr_zad := -1;
      sh5.CurrencyEdit_summa.Text := FloatToStr(sum_predopl);
      sh5.CurrencyEdit_opl.Text   := FloatToStr(sum_predopl);
     //расчет сумм по сметам
      sum_kowt := sh5.pFIBDataSet_id_dokument.FieldByName('D_SUMMA').AsVariant;
      cht := sum_predopl/sum_kowt;

  //расчет НДС в соответствии с НДС кошториса
      nds_kowt := sh5.pFIBDataSet_id_dokument.FieldByName('D_NDS_SUM').AsVariant;

      n_p := (nds_kowt*100)/(sum_kowt-nds_kowt);


      nds_proc := RoundTo(n_p,-2);

      nds_predopl := (sum_predopl*nds_proc)/(100+nds_proc);


      //если нет омнования по умолчанию, то по старому алгоритму
      if (sh5.pFIBDataSet_tip_info.FBN('DEF_NOTE').AsString = '') then sh5.NotePredopl()
      else   sh5.MakeNote();

      sh5.CurrencyEdit_nds.Text := FloatToStr(nds_predopl);

      sh5.pFIBDataSet_smet_info.FetchAll;
      sh5.pFIBDataSet_smet_info.First;
      for i := 0 to sh5.pFIBDataSet_smet_info.RecordCount-1 do
      begin
        sh5.pFIBDataSet_smeta.Active := false;
        sh5.pFIBDataSet_smeta.ParamByName('id_smeta').Value := sh5.pFIBDataSet_smet_info.FieldByName('id_smeta').AsVariant;
        sh5.pFIBDataSet_smeta.Active := true;

        sh5.RxMemoryData_smet.Open;
        sh5.RxMemoryData_smet.Insert;

        sh5.pFIBDataSet_kekv.Active := false;
        sh5.pFIBDataSet_kekv.ParamByName('id_kekv').Value := sh5.pFIBDataSet_smet_info.FieldByName('id_kekv').AsInteger;
        sh5.pFIBDataSet_kekv.ParamByName('actual_date').Value := Date;
        sh5.pFIBDataSet_kekv.Active := true;

        sh5.RxMemoryData_smet.FieldByName('id_kekv').Value := sh5.pFIBDataSet_smet_info.FieldByName('id_kekv').AsInteger;
        sh5.RxMemoryData_smet.FieldByName('name_kekv').Value := sh5.pFIBDataSet_kekv.FieldByName('KEKV_TITLE').AsString;
        sh5.RxMemoryData_smet.FieldByName('kod_kekv').Value := sh5.pFIBDataSet_kekv.FieldByName('KEKV_KODE').AsInteger;

        sh5.RxMemoryData_smet.FieldByName('id_smet').Value := sh5.pFIBDataSet_smet_info.FieldByName('id_smeta').AsVariant;

        sh5.pFIBDataSet_razd_st.Active := false;
        sh5.pFIBDataSet_razd_st.ParamByName('id_razd_st_in').Value := sh5.pFIBDataSet_smet_info.FieldByName('id_razd').AsVariant;
        sh5.pFIBDataSet_razd_st.Active := true;

        sh5.RxMemoryData_smet.FieldByName('id_razd').Value := sh5.pFIBDataSet_smet_info.FieldByName('id_razd').AsVariant;

        sh5.RxMemoryData_smet.FieldByName('name_smet').Value := sh5.pFIBDataSet_smeta.FieldByName('SMETA_TITLE').AsVariant;
        sh5.RxMemoryData_smet.FieldByName('kod_smety').Value := sh5.pFIBDataSet_smeta.FieldByName('SMETA_KOD').AsVariant;
        sh5.RxMemoryData_smet.FieldByName('n_razd').Value := sh5.pFIBDataSet_razd_st.FieldByName('RAZD_ST_NUM').AsVariant;
        sh5.RxMemoryData_smet.FieldByName('name_razd').Value := sh5.pFIBDataSet_razd_st.FieldByName('RAZD_ST_TITLE').AsVariant;

        sh5.pFIBDataSet_razd_st.Active := false;
        sh5.pFIBDataSet_razd_st.ParamByName('id_razd_st_in').Value := sh5.pFIBDataSet_smet_info.FieldByName('id_stat').AsVariant;
        sh5.pFIBDataSet_razd_st.Active := true;

        sh5.RxMemoryData_smet.FieldByName('id_stat').Value := sh5.pFIBDataSet_smet_info.FieldByName('id_stat').AsVariant;

        sh5.RxMemoryData_smet.FieldByName('name_stat').Value := sh5.pFIBDataSet_razd_st.FieldByName('RAZD_ST_TITLE').AsVariant;
        sh5.RxMemoryData_smet.FieldByName('n_stat').Value := sh5.pFIBDataSet_razd_st.FieldByName('RAZD_ST_NUM').AsVariant;
        sh5.RxMemoryData_smet.FieldByName('sum_smet').Value := cht*(sh5.pFIBDataSet_smet_info.FieldByName('summa').AsVariant);

        sh5.RxMemoryData_smet.FieldByName('id').Value := sh5.pFIBDataSet_smet_info.FieldByName('id_dt_smet_dog').AsVariant;
        sh5.RxMemoryData_smet.FieldByName('flag_del').Value := 0;
        sh5.RxMemoryData_smet.Post;

        sh5.pFIBDataSet_smet_info.Next;
     end;

     //ShowMessage('The End.');

     PredoplAdd.Free;
//     sh5.fProc := proc;
     sh5.ShowModal;
     sh5.Free;
    end;

  end;
//  ShowMessage('Add #01');
end;


procedure TfrmPredopl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SavePositionToRegistry(Self);
  Action := caFree;
end;

procedure TfrmPredopl.FormCreate(Sender: TObject);
var
  reg       : TRegistry;
  DataSetOtd: TpFIBDataSet;
begin
 //Интерфейс
{  Label4.Caption                            := rsh_Number;
  Label3.Caption                            := rsh_Vid;
  cxGrid1DBTableView1DBColumn_smeta.Caption := rsh_Smeta;
  cxGrid1DBTableView1DBColumn4.Caption      := rsh_Razd;
  cxGrid1DBTableView1DBColumn5.Caption      := rsh_Stat;
  cxGrid1DBTableView1DBColumn2.Caption      := rsh_Summa;
  cxGrid1DBTableView1DBColumn3.Caption      := rsh_Kekv;
  Label13.Caption                           := rsh_Kekv;
  Label18.Caption                           := rsh_Smeta;
  Label19.Caption                           := rsh_Razd;
  Label20.Caption                           := rsh_Stat;
  Label1.Caption                            := rsh_Nds;
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
  Label27.Caption                           := rsh_Predopl_za;
}



  if Priznak_vizova = 'red' then
  begin
    Label17.font.color := clBlue;
    Label17.font.Style := [fsUnderline];
    Label1.font.color := clBlue;
    Label1.font.Style := [fsUnderline];
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

procedure TfrmPredopl.RxMemoryData_smetAfterScroll(DataSet: TDataSet);
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

  procedure TfrmPredopl.ToolButton_addClick(Sender: TObject);
var
  Add: Variant;
  cnt,i: Integer;
  id_adding_flag:Integer;
  smSmet:double;

begin
  smSmet:=0;
  id_adding_flag:=1;

  SumToSmet();
  Add := LoadDogManedger.AddKosht(self,pFIBDatabase.Handle,summa_to_smet,1,0,0,0,0,0,Date);

  if VarArrayDimCount(Add) > 0 then
  begin
   Cnt := VarArrayHighBound(Add, 1);
//   { Группировка }
//
   if RxMemoryData_smet.Locate('id_smet',Add[i][7],[])=true then
   begin
    if RxMemoryData_smet.Locate('id_razd',Add[i][8],[])=true then
    begin
     if RxMemoryData_smet.Locate('id_stat',Add[i][9],[])=true then
     begin
      if RxMemoryData_smet.Locate('id_kekv',Add[i][10],[])=true then
      begin
       RxMemoryData_smet.Open;
       RxMemoryData_smet.Edit;
       RxMemoryData_smet.FieldByName('sum_smet').Value := Add[i][3]+RxMemoryData_smet.FieldByName('sum_smet').Value;
       RxMemoryData_smet.Post;
       id_adding_flag:=0;

//       smSmet:=RxMemoryData_smet.FieldByName('sum_smet').Value;
//       RxMemoryData_smet.Delete;
      end;
     end;
    end;
   end;
  end;

  if id_adding_flag = 1 then
  begin

//   Cnt := VarArrayHighBound(Add, 1);
   for i := 0 to Cnt do
   begin
    id_smeta := Add[i][7];
    id_dt_smet := RxMemoryData_smet.FieldByName('id').AsVariant;
    RxMemoryData_smet.Locate('id', id_dt_smet, []);
    RxMemoryData_smet.Open;
    RxMemoryData_smet.Insert;
    RxMemoryData_smet.FieldByName('id_smet').Value := Add[i][7];
    RxMemoryData_smet.FieldByName('id_razd').Value := Add[i][8];
    RxMemoryData_smet.FieldByName('id_stat').Value := Add[i][9];
    RxMemoryData_smet.FieldByName('sum_smet').Value := Add[i][3];
    RxMemoryData_smet.FieldByName('name_smet').Value := Add[i][0];
    RxMemoryData_smet.FieldByName('name_razd').Value := Add[i][1];
    RxMemoryData_smet.FieldByName('name_stat').Value := Add[i][2];
    RxMemoryData_smet.FieldByName('kod_smety').Value := Add[i][4];
    RxMemoryData_smet.FieldByName('n_razd').Value := Add[i][5];
    RxMemoryData_smet.FieldByName('n_stat').Value := Add[i][6];
    RxMemoryData_smet.FieldByName('id_kekv').Value := Add[i][10];
    RxMemoryData_smet.FieldByName('kod_kekv').Value := Add[i][11];
    RxMemoryData_smet.FieldByName('name_kekv').Value := Add[i][12];
    RxMemoryData_smet.FieldByName('id').Value := 0;
    RxMemoryData_smet.FieldByName('flag_del').Value := 0;
    RxMemoryData_smet.Post;
   end;
   SumNds();
  end;
end;

procedure TfrmPredopl.cxButton_okClick(Sender: TObject);
var
  i, j: Integer;
  nds, sum_pay: Variant;
  sum_today: Variant; //Сумма к оплате
  D_date: TDate;
  s_smet, s_pay, s_doc, temp_sum, s_ful_fil, sum_k_opl: Currency;
  action : TResAction;
  id_dog_predopl: Int64;
  reg : TRegistry;

  TempStr:String;
begin
//       showmessage(pFIBStoredProc_dt_add.ParamByName('D_SUM_OPL').Value);
       action := raView;

        pFIBDataSet_id_dokument.Active := false;
        pFIBDataSet_id_dokument.ParamByName('D_ID_DOG_VX').AsInt64 := kod_dog;
        pFIBDataSet_id_dokument.Active := true;

     //проверка на корректность даты договора
   if Priznak_vizova = 'red' then
   begin
    if DatasetCheck.Transaction.Active then DatasetCheck.Transaction.Commit;
    DatasetCheck.Close;
   end ;

     if Priznak_vizova = 'add' then
     begin
     action := raAdd;

     if Trim(DateToStr(cxDateEdit_dog.Date))='00.00.0000'then
     begin
           MessageDlg('Увага', 'Дата договору не повинна бути пустою', mtError, [mbOk]);
           Exit;
     end;

      if (cxDateEdit_dog.Date > Date + 5) then
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
    end;

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
        ShowMessage('Сума по кошторисам не дорівнює сумі документа!');
        CurrencyEdit_summa.SetFocus;
        Exit;
    end;

    if (CurrencyEdit_opl.Value < CurrencyEdit_summa.Value) then
    begin
      ShowMessage('Сума до cплати менше суми документа!');
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
     if cxGrid1DBTableView1DBColumn_smeta.EditValue = 0 then
     begin
       MessageDlg('Увага', errNotSmet, mtError, [mbOk]);
       Exit;
     end;

         // проверка на заполнение контрагента
    if  Trim(cxTextEdit_name_p.Text) = '' then
        begin
        MessageDlg('Увага', errDtNotKontragent, mtError, [mbOk]);
        cxTextEdit_name_p.SetFocus;
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

    //Проверка на корректность суммы к оплате
    sum_today := CurrencyEdit_opl.Value;
    sum_doc   := CurrencyEdit_summa.Value;
    sum_pay   := CurrencyEdit_summa_pay.Value;
    if sum_today < 0 then sum_today := 0;
    if sum_doc   < 0 then sum_doc := 0;
    if sum_pay   < 0 then sum_pay := 0;
    if sum_pay <> sum_doc then
    begin
      temp_sum := sum_pay + sum_k_opl;
      if (s_doc < temp_sum) then
      begin
         ShowMessage('Некорректно задана сума до оплати');
        CurrencyEdit_opl.SetFocus;
        CurrencyEdit_opl.Text := CurrToStr(s_doc - sum_pay);
        Exit;
      end;
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
    pFIBTransactionWrite.StartTransaction;
    pFIBStoredProc_dt_add.StoredProcName := 'DOG_DT_DOCUMENT_INSERT';
    pFIBStoredProc_dt_add.Prepare;
    pFIBStoredProc_dt_add.ParamByName('D_KOD_DOG').AsInt64  := id_doc;

    TempStr:=TempStr+'D_KOD_DOG = '+pFIBStoredProc_dt_add.ParamByName('D_KOD_DOG').AsString+#13;

    pFIBStoredProc_dt_add.ParamByName('D_N_DOG').Value := cxMaskEdit_n_dog.Text;

    TempStr:=TempStr+'D_N_DOG = '+pFIBStoredProc_dt_add.ParamByName('D_N_DOG').AsString+#13;

    pFIBStoredProc_dt_add.ParamByName('D_D_DOG').Value := cxDateEdit_dog.Date;
    TempStr:=TempStr+'D_D_DOG = '+pFIBStoredProc_dt_add.ParamByName('D_D_DOG').AsString+#13;

    if Trim(CurrencyEdit_summa.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_SUMMA').Value := 0 else
    pFIBStoredProc_dt_add.ParamByName('D_SUMMA').Value := CurrencyEdit_summa.Text;

    TempStr:=TempStr+'D_SUMMA = '+pFIBStoredProc_dt_add.ParamByName('D_SUMMA').AsString+#13;

    if Trim(cxMemo_dog_note.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_DOG_NOTE').Value := '' else
    pFIBStoredProc_dt_add.ParamByName('D_DOG_NOTE').Value := Trim(cxMemo_dog_note.Text);

    TempStr:=TempStr+'D_DOG_NOTE = '+pFIBStoredProc_dt_add.ParamByName('D_DOG_NOTE').AsString+#13;

    if Trim(CurrencyEdit_nds.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_NDS_SUM').Value := 0 else
    pFIBStoredProc_dt_add.ParamByName('D_NDS_SUM').Value := CurrencyEdit_nds.Text;

    TempStr:=TempStr+'D_NDS_SUM = '+pFIBStoredProc_dt_add.ParamByName('D_NDS_SUM').AsString+#13;

    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACCOUNT').AsInt64 := rate_acc_p;

    TempStr:=TempStr+'D_ID_RATE_ACCOUNT = '+pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACCOUNT').AsString+#13;

    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACC_NATIVE').AsInt64 := rate_acc_un;

    TempStr:=TempStr+'D_ID_RATE_ACC_NATIVE = '+pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACC_NATIVE').AsString+#13;

    pFIBStoredProc_dt_add.ParamByName('D_ID_CUSTOMER').AsInt64   := id_p;

    TempStr:=TempStr+'D_ID_CUSTOMER = '+pFIBStoredProc_dt_add.ParamByName('D_ID_CUSTOMER').AsString+#13;

    pFIBStoredProc_dt_add.ParamByName('D_NAME_CUSTOMER').AsVariant := name_p;

    TempStr:=TempStr+'D_NAME_CUSTOMER = '+pFIBStoredProc_dt_add.ParamByName('D_NAME_CUSTOMER').AsString+#13;

    pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').Value := 0;

    TempStr:=TempStr+'D_NOT_SUMMA = '+pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').AsString+#13;

    pFIBStoredProc_dt_add.ParamByName('D_CONTINUE').Value := 0;

    TempStr:=TempStr+'D_CONTINUE = '+pFIBStoredProc_dt_add.ParamByName('D_CONTINUE').AsString+#13;

    pFIBStoredProc_dt_add.ParamByName('D_CLOSE').Value := 0;

    TempStr:=TempStr+'D_CLOSE = '+pFIBStoredProc_dt_add.ParamByName('D_CLOSE').AsString+#13;

    pFIBStoredProc_dt_add.ParamByName('D_ID_TIP_DOG').Value := pFIBDataSet_tip_dog_add.fieldByName('id_tip_dog').AsVariant;

    TempStr:=TempStr+'D_ID_TIP_DOG = '+pFIBStoredProc_dt_add.ParamByName('D_ID_TIP_DOG').AsString+#13;

    if Trim(CurrencyEdit_opl.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_SUM_OPL').Value := 0 else
    pFIBStoredProc_dt_add.ParamByName('D_SUM_OPL').Value := CurrencyEdit_opl.Text;

    TempStr:=TempStr+'D_SUM_OPL = '+pFIBStoredProc_dt_add.ParamByName('D_SUM_OPL').AsString+#13;

    pFIBStoredProc_dt_add.ParamByName('d_sum_pay').Value := 0;

    TempStr:=TempStr+'d_sum_pay = '+pFIBStoredProc_dt_add.ParamByName('d_sum_pay').AsString+#13;

    pFIBStoredProc_dt_add.ParamByName('D_NDS_PAY').Value := 0;

    TempStr:=TempStr+'D_NDS_PAY = '+pFIBStoredProc_dt_add.ParamByName('D_NDS_PAY').AsString+#13;

    pFIBStoredProc_dt_add.ParamByName('D_SUM_FULFIL').Value := 0;

    TempStr:=TempStr+'D_SUM_FULFIL = '+pFIBStoredProc_dt_add.ParamByName('D_SUM_FULFIL').AsString+#13;

    pFIBStoredProc_dt_add.ParamByName('D_ID_USER').Value := SYS_ID_USER;

    TempStr:=TempStr+'D_ID_USER = '+pFIBStoredProc_dt_add.ParamByName('D_ID_USER').AsString+#13;

    pFIBStoredProc_dt_add.ParamByName('D_IP_COMP').Value := GetIPAddress;

    TempStr:=TempStr+'D_IP_COMP = '+pFIBStoredProc_dt_add.ParamByName('D_IP_COMP').AsString+#13;

    pFIBStoredProc_dt_add.ParamByName('D_NAME_COMP').Value := GetCompName;

    TempStr:=TempStr+'D_NAME_COMP = '+pFIBStoredProc_dt_add.ParamByName('D_NAME_COMP').AsString+#13;

    pFIBStoredProc_dt_add.ParamByName('D_COMMENT').Value := comment;

    TempStr:=TempStr+'D_COMMENT = '+pFIBStoredProc_dt_add.ParamByName('D_COMMENT').AsString+#13;

    pFIBStoredProc_dt_add.ParamByName('D_ID_OTDEL').Value := id_otdel;

    TempStr:=TempStr+'D_ID_OTDEL = '+pFIBStoredProc_dt_add.ParamByName('D_ID_OTDEL').AsString+#13;

    try
      pFIBStoredProc_dt_add.ExecProc;
    except  on e:Exception do
      begin
        ShowMessage(e.Message);
        pFIBTransactionWrite.Rollback;
        Exit;
      end;
    end;
      id_dog_predopl := pFIBStoredProc_dt_add.FieldByName('VIX_ID_DOG').AsInt64;
      kod_dog := pFIBStoredProc_dt_add.FieldByName('VIX_KOD_DOG').AsInt64;

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
               pFIBStoredProc_dt_add.StoredProcName := 'DOG_DT_SMET_INSERT';
               pFIBStoredProc_dt_add.Prepare;
               pFIBStoredProc_dt_add.ParamByName('D_ID_DOG').AsInt64 := id_dog_predopl;
               pFIBStoredProc_dt_add.ParamByName('D_ID_SMETA').Value := RxMemoryData_smet.FieldByName('id_smet').Value;
               pFIBStoredProc_dt_add.ParamByName('D_RAZD').Value := RxMemoryData_smet.FieldByName('id_razd').Value;
               pFIBStoredProc_dt_add.ParamByName('D_ID_STAT').Value := RxMemoryData_smet.FieldByName('id_stat').Value;
               pFIBStoredProc_dt_add.ParamByName('D_ID_KEKV').Value := RxMemoryData_smet.FieldByName('id_kekv').Value;
               pFIBStoredProc_dt_add.ParamByName('D_SUMMA_SM').Value := RxMemoryData_smet.FieldByName('sum_smet').Value;
               try
                 pFIBStoredProc_dt_add.ExecProc;
                 except
                   pFIBTransactionWrite.Rollback;
                   Exit;
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
    pFIBTransactionWrite.StartTransaction;
    pFIBStoredProc_dt_add.StoredProcName := 'DOG_DT_DOCUMENT_UPDATE';
    pFIBStoredProc_dt_add.Prepare;
    pFIBStoredProc_dt_add.ParamByName('D_N_DOG').Value := cxMaskEdit_n_dog.Text;
    pFIBStoredProc_dt_add.ParamByName('D_D_DOG').Value := cxDateEdit_dog.Date;

    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACCOUNT').Value := rate_acc_p;
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACC_NATIVE').Value := rate_acc_un;

    pFIBStoredProc_dt_add.ParamByName('D_ID_CUSTOMER').AsInt64 := id_p;
    pFIBStoredProc_dt_add.ParamByName('D_NAME_CUSTOMER').Value := name_p;

    if Trim(CurrencyEdit_summa.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_SUMMA').Value := 0 else
    pFIBStoredProc_dt_add.ParamByName('D_SUMMA').Value := CurrencyEdit_summa.Text;
    if Trim(cxMemo_dog_note.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_DOG_NOTE').Value := '' else
    pFIBStoredProc_dt_add.ParamByName('D_DOG_NOTE').Value := Trim(cxMemo_dog_note.Text);
    if Trim(CurrencyEdit_nds.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_NDS_SUM').Value := 0 else
    pFIBStoredProc_dt_add.ParamByName('D_NDS_SUM').Value := CurrencyEdit_nds.Text;
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
    except
      begin
        pFIBTransactionWrite.Rollback;
        Exit;
      end;
    end;

   //удаляем все сметы
    pFIBStoredProc_dt_add.StoredProcName := 'DOG_DT_SMET_DELETE';
    pFIBStoredProc_dt_add.Prepare;
    pFIBStoredProc_dt_add.ParamByName('ID_DOG').AsInt64 := id_doc;
    try
      pFIBStoredProc_dt_add.ExecProc;
    except on e: Exception do
      begin
        ShowMessage(e.Message);
        pFIBTransactionWrite.Rollback;
        Exit;
      end;
    end;

   //добавляем все сметы, не помеченные к удалению
    RxMemoryData_smet.First;
    for j := 0 to RxMemoryData_smet.RecordCount-1 do
    begin
      if (RxMemoryData_smet.FieldByName('flag_del').Value = 0) then
       begin
         pFIBStoredProc_dt_add.StoredProcName := 'DOG_DT_SMET_INSERT';
         pFIBStoredProc_dt_add.Prepare;
         pFIBStoredProc_dt_add.ParamByName('D_ID_DOG').AsInt64 := id_doc;
         pFIBStoredProc_dt_add.ParamByName('D_ID_SMETA').Value := RxMemoryData_smet.FieldByName('id_smet').Value;
         pFIBStoredProc_dt_add.ParamByName('D_RAZD').Value := RxMemoryData_smet.FieldByName('id_razd').Value;
         pFIBStoredProc_dt_add.ParamByName('D_ID_STAT').Value := RxMemoryData_smet.FieldByName('id_stat').Value;
         pFIBStoredProc_dt_add.ParamByName('D_SUMMA_SM').Value := RxMemoryData_smet.FieldByName('sum_smet').Value;
         pFIBStoredProc_dt_add.ParamByName('D_ID_KEKV').Value := RxMemoryData_smet.FieldByName('id_kekv').Value;
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
  reg.OpenKey(REG_KEY + 'Otdel', true);
  try
   reg.WriteInteger('id_otdel', id_otdel);
  except
  end;
  reg.Free;

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
  SumNds();
//  ShowMessage(VarToStr(sum_doc));
end;

//Подсчет суммы по смете
procedure TfrmPredopl.Summa();
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

procedure TfrmPredopl.RxMemoryData_smetAfterDelete(DataSet: TDataSet);
begin
  Summa();
end;

procedure TfrmPredopl.RxMemoryData_smetAfterPost(DataSet: TDataSet);
begin
  Summa();
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
   end;}
end;

procedure TfrmPredopl.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Priznak_vizova = 'prosmotr') or (Priznak_vizova = 'hist')  then Exit;

if key = VK_DELETE then
  begin
    ToolButton_delClick(Self);
  end;
{if key = VK_INSERT then
  begin
    ToolButton_addClick(Self);
  end;}
end;

procedure TfrmPredopl.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect: TRect;
begin
  Arect := AViewInfo.Bounds;
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
    end;
end;

procedure TfrmPredopl.ToolButton_delClick(Sender: TObject);
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
  SumNds();
  SummaDoc();
  id_sm := RxMemoryData_smet.FieldByName('id').Value;
  RxMemoryData_smet.Locate('id', id_sm, []);

end;

procedure TfrmPredopl.CurrencyEdit_sum_po_smetChange(Sender: TObject);
begin
 // CurrencyEdit_summa.Text:=CurrencyEdit_sum_po_smet.Text;
{ if Priznak_vizova = 'add' then
  begin
    CurrencyEdit_summa.Text:=CurrencyEdit_sum_po_smet.Text;
  end;}
end;

procedure TfrmPredopl.CurrencyEdit_oplChange(Sender: TObject);
var
  sum_d: Currency;
begin
{  if CurrencyEdit_summa.Value < CurrencyEdit_opl.Value then
  begin
    ShowMessage('Сумма до оплати перевищує суму документа');
    CurrencyEdit_opl.SetFocus;
    Exit;
  end;   }

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
    sum_pay := pFIBDataSet_id_dokument.FieldByName('d_sum_pay').Value;
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
    ShowMessage('Сума до оплати перевищує неоплачену суму документа!');
    CurrencyEdit_opl.Text := CurrToStr(sum_doc - sum_fulfil - sum_pay);
  end;
end;

procedure TfrmPredopl.Label14Click(Sender: TObject);
begin
  if Priznak_vizova <> 'add' then
  ShowDogPayFulfil(Self, pFIBDatabase.Handle, pFIBTransactionRead.Handle, pFIBTransactionWrite.Handle, fsNormal, id_doc, -1);
end;

procedure TfrmPredopl.Label14MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Priznak_vizova <> 'add' then
  begin
    Label14.Cursor := crHandPoint;
  end;
end;

procedure TfrmPredopl.Label15Click(Sender: TObject);
begin
  if Priznak_vizova <> 'add' then
  ShowDogPayFulfil(Self, pFIBDatabase.Handle, pFIBTransactionRead.Handle, pFIBTransactionWrite.Handle, fsNormal, id_doc, -1);
end;

procedure TfrmPredopl.Label15MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Priznak_vizova <> 'add' then
  begin
    Label15.Cursor := crHandPoint;
  end;
end;

procedure TfrmPredopl.add_smetExecute(Sender: TObject);
begin
  ToolButton_addClick(Self);
end;

procedure TfrmPredopl.del_smetExecute(Sender: TObject);
begin
  ToolButton_delClick(Self);
end;

procedure TfrmPredopl.N1Click(Sender: TObject);
begin
  ToolButton_addClick(Self);
end;

procedure TfrmPredopl.N2Click(Sender: TObject);
begin
  ToolButton_delClick(Self);
end;

procedure TfrmPredopl.FormShow(Sender: TObject);
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
   pFIBDataSet_id_dokument.ParamByName('D_ID_DOG_VX').AsInt64 := id_dog_in;
   pFIBDataSet_id_dokument.Active := true;

  LoadPositionFromRegistry(Self);
  if Priznak_vizova = 'red' then
  CurrencyEdit_opl.SetFocus;
  SetForegroundWindow(Handle);
  if Priznak_vizova = 'prosmotr' then
  begin
    cxGrid1.PopupMenu := Nil;
    ToolButton_add.Enabled := False;
    ToolButton_del.Enabled := False;
  end;
  Height := 474;
  Width  := 674;
end;

procedure TfrmPredopl.Label17MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Priznak_vizova = 'red' then
  begin
    Label17.Cursor := crHandPoint;
  end;
end;

procedure TfrmPredopl.NotePredopl();
var
  str_nds: String;
  str_dog_note: String;//основание договора
  Nlength: Integer;
  str_ostatok: String;
  kol_vo_dog_note: Integer; //кол-во символов основания договора, к-е можно записать в платежку
  nomer: String;
begin
   //Формирование ндс

  if nds_predopl = 0 then
  begin
    str_nds := 'БЕЗ ПДВ';
  end
  else
  begin
    str_nds := 'В Т.Ч. ПДВ'+' '+ FormatFloat('0.00', nds_predopl);
  end;

//  ShowMessage('1');


  {note_predopl := 'ПЕРЕДПЛ. ЗГ. ДОГ.'+' '+pFIBDataSet_id_dokument.FieldByName('REG_NUM_SH2').AsString+' '+
               'ВІД'+' '+pFIBDataSet_id_dokument.FieldByName('D_DOG_SH2').AsString+' '+
               'КОШТ.'+' '+pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString+' '+
               'ЗА'+' '+pFIBDataSet_id_dokument.FieldByName('d_dog_note').AsString+' '+
               str_nds;

   Nlength := Length(note_predopl);

   str_ostatok := 'ПЕРЕДПЛ. ЗГ. ДОГ.'+' '+pFIBDataSet_id_dokument.FieldByName('REG_NUM_SH2').AsString+' '+
               'ВІД'+' '+pFIBDataSet_id_dokument.FieldByName('D_DOG_SH2').AsString+' '+
               'КОШТ.'+' '+pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString+' '+
               'ЗА'+' '+str_nds;

   kol_vo_dog_note := 160 - Length(str_ostatok);

   str_dog_note := pFIBDataSet_id_dokument.FieldByName('d_dog_note').AsString;
   If Nlength > 160 then
     begin
       Delete(str_dog_note,kol_vo_dog_note,NLength-160);
       note_predopl := 'ПЕРЕДПЛ. ЗГ. ДОГ.'+' '+pFIBDataSet_id_dokument.FieldByName('REG_NUM_SH2').AsString+' '+
               'ВІД'+' '+pFIBDataSet_id_dokument.FieldByName('D_DOG_SH2').AsString+' '+
               'КОШТ.'+' '+pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString+' '+
               'ЗА'+' '+str_dog_note+' '+str_nds;
     end;
   }
  if (pFIBDataSet_id_dokument.FieldByName('note_pl').AsVariant) = 1 then
  nomer := pFIBDataSet_id_dokument.FieldByName('D_N_DOG').AsString else
  nomer := pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString;


  note_predopl := 'ЗА'+' '+pFIBDataSet_id_dokument.FieldByName('d_dog_note').AsString+' '+
               'ЗГ.АКТА ВИП.РОБІТ' + ' ' + 'КОШТ.' + ' ' +
               nomer+' '+
               'ВІД'+' '+pFIBDataSet_id_dokument.FieldByName('D_D_DOG').AsString+' '+
               'ДОГ. № ' + pFIBDataSet_id_dokument.FieldByName('REG_NUM_SH2').AsString+' '+
               str_nds;

   Nlength := Length(note_predopl);

   str_ostatok := 'ЗА'+' '+'ЗГ.АКТА ВИП.РОБІТ' + ' ' + 'КОШТ.' + ' ' +
               nomer+' '+
               'ВІД'+' '+pFIBDataSet_id_dokument.FieldByName('D_D_DOG').AsString+' '+
               'ДОГ. № ' + pFIBDataSet_id_dokument.FieldByName('REG_NUM_SH2').AsString+' '+
               str_nds;

   kol_vo_dog_note := 160 - Length(str_ostatok);

   str_dog_note := pFIBDataSet_id_dokument.FieldByName('d_dog_note').AsString;
   If Nlength > 160 then
     begin
       Delete(str_dog_note,kol_vo_dog_note,NLength-160);
       note_predopl := 'ЗА'+' '+str_dog_note+' '+
               'ЗГ.АКТА ВИП.РОБІТ' + ' ' + 'КОШТ.' + ' ' +
               nomer+' '+
               'ВІД'+' '+pFIBDataSet_id_dokument.FieldByName('D_D_DOG').AsString+' '+
               'ДОГ. № ' + pFIBDataSet_id_dokument.FieldByName('REG_NUM_SH2').AsString+' '+
               str_nds;
     end;

  cxMemo_dog_note.Text := note_predopl;
end;

procedure TfrmPredopl.MakeNote();
var
  str      : String;
  i, cnt   : Integer;
  str_nds  : String;
  DataSetMakeNote : TpFIBDataSet;
  _fnote_dog             : String;
  _fdate_dog             : String;
  _fnum_dog              : String;
  _fregnum_doc           : String;
  _fsname_tipdog_dog     : String;
  _fnotecur              : String;
  _fdate_cur             : String;
  _fnumcur               : String;
  _fregnum_cur           : String;
  _fsname_tipdog_cur     : String;
  _fsumnds_cur           : String;
  _fnote_uplevel         : String;
  _fdate_uplevel         : String;
  _fnum_uplevel          : String;
  _fregnum_uplevel       : String;
  _fsname_tipdog_uplevel : String;
begin

  str := pFIBDataSet_tip_dog_add.FBN('DEF_NOTE').AsString;

  DataSetMakeNote := TpFIBDataSet.Create(Self);
  DataSetMakeNote.Database := pFIBTransactionWrite.DefaultDatabase;
  DataSetMakeNote.Transaction := pFIBTransactionWrite;
  DataSetMakeNote.SQLs.SelectSQL.Text := 'select * from DOG_SELECT_DATA_FOR_NOTE_PLAT(:id_dog)';
  DataSetMakeNote.ParamByName('id_dog').AsInt64 := id_doc;
  DataSetMakeNote.Active := true;

  //Основание самого вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FNOTE_DOG%%', str) > 0 do
    begin
      cnt := Pos('%%FNOTE_DOG%%', str);
      Delete(str, cnt, 13);
      Insert(DataSetMakeNote.FBN('FNOTE_DOG').AsString, str, cnt);
    end;
  end;

  //Дата заключения самого вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FDATE_DOG%%', str) > 0 do
    begin
      cnt := Pos('%%FDATE_DOG%%', str);
      Delete(str, cnt, 13);
      if not VarIsNull(DataSetMakeNote.FBN('FDATE_DOG').AsVariant) then
      Insert(DataSetMakeNote.FBN('FDATE_DOG').AsString, str, cnt);
    end;
  end;

  //Номер самого вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FNUM_DOG%%', str) > 0 do
    begin
      cnt := Pos('%%FNUM_DOG%%', str);
      Delete(str, cnt, 12);
      Insert(DataSetMakeNote.FBN('FNUM_DOG').AsString, str, cnt);
    end;
  end;

  //Регистрационный номер самого вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FREGNUM_DOG%%', str) > 0 do
    begin
      cnt := Pos('%%FREGNUM_DOG%%', str);
      Delete(str, cnt, 15);
      Insert(DataSetMakeNote.FBN('FREGNUM_DOG').AsString, str, cnt);
    end;
  end;

  //Краткое наименование типа договора самого вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FSNAME_TIPDOG_DOG%%', str) > 0 do
    begin
      cnt := Pos('%%FSNAME_TIPDOG_DOG%%', str);
      Delete(str, cnt, 21);
      Insert(DataSetMakeNote.FBN('FSNAME_TIPDOG_DOG').AsString, str, cnt);
    end;
  end;

  //Основание текущего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FNOTE_CUR%%', str) > 0 do
    begin
      cnt := Pos('%%FNOTE_CUR%%', str);
      Delete(str, cnt, 13);
      Insert(DataSetMakeNote.FBN('FNOTE_CUR').AsString, str, cnt);
    end;
  end;

  //Дата заключения текущего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FDATE_CUR%%', str) > 0 do
    begin
      cnt := Pos('%%FDATE_CUR%%', str);
      Delete(str, cnt, 13);
      if not VarIsNull(DataSetMakeNote.FBN('FDATE_CUR').AsVariant) then
      Insert(DataSetMakeNote.FBN('FDATE_CUR').AsString, str, cnt);
    end;
  end;

  //Номер текущего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FNUM_CUR%%', str) > 0 do
    begin
      cnt := Pos('%%FNUM_CUR%%', str);
      Delete(str, cnt, 12);
      Insert(DataSetMakeNote.FBN('FNUM_CUR').AsString, str, cnt);
    end;
  end;

  //Регистрационный номер текущего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FREGNUM_CUR%%', str) > 0 do
    begin
      cnt := Pos('%%FREGNUM_CUR%%', str);
      Delete(str, cnt, 15);
      Insert(DataSetMakeNote.FBN('FREGNUM_CUR').AsString, str, cnt);
    end;
  end;

  //Краткое наименование типа договора текущего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FSNAME_TIPDOG_CUR%%', str) > 0 do
    begin
      cnt := Pos('%%FSNAME_TIPDOG_CUR%%', str);
      Delete(str, cnt, 21);
      Insert(DataSetMakeNote.FBN('FSNAME_TIPDOG_CUR').AsString, str, cnt);
    end;
  end;

  //Сумма НДС текущего договора.
  for i := 0 to Length(str) do
  begin
    while Pos('%%FSUMNDS_CUR%%', str) > 0 do
    begin
      cnt := Pos('%%FSUMNDS_CUR%%', str);
      Delete(str, cnt, 15);
      if nds_predopl = 0 then
      begin
        str_nds := 'БЕЗ ПДВ';
      end
      else
      begin
        str_nds := 'В Т.Ч. ПДВ'+' '+ FormatFloat('0.00', nds_predopl);
      end;
      Insert(str_nds, str, cnt);
    end;
  end;

  //Основание вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FNOTE_UPLEVEL%%', str) > 0 do
    begin
      cnt := Pos('%%FNOTE_UPLEVEL%%', str);
      Delete(str, cnt, 17);
      Insert(DataSetMakeNote.FBN('FNOTE_UPLEVEL').AsString, str, cnt);
    end;
  end;

  //Дата заключения вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FDATE_UPLEVEL%%', str) > 0 do
    begin
      cnt := Pos('%%FDATE_UPLEVEL%%', str);
      Delete(str, cnt, 17);
      if not VarIsNull(DataSetMakeNote.FBN('FDATE_UPLEVEL').AsVariant) then
      Insert(DataSetMakeNote.FBN('FDATE_UPLEVEL').AsString, str, cnt);
    end;
  end;

  //Номер вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FNUM_UPLEVEL%%', str) > 0 do
    begin
      cnt := Pos('%%FNUM_UPLEVEL%%', str);
      Delete(str, cnt, 16);
      Insert(DataSetMakeNote.FBN('FNUM_UPLEVEL').AsString, str, cnt);
    end;
  end;

  //Регистрационный номер вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FREGNUM_UPLEVEL%%', str) > 0 do
    begin
      cnt := Pos('%%FREGNUM_UPLEVEL%%', str);
      Delete(str, cnt, 19);
      Insert(DataSetMakeNote.FBN('FREGNUM_UPLEVEL').AsString, str, cnt);
    end;
  end;

  //Краткое наименование типа договора вышестоящего договора
  for i := 0 to Length(str) do
  begin
    while Pos('%%FSNAME_TIPDOG_UPLEVEL%%', str) > 0 do
    begin
      cnt := Pos('%%FSNAME_TIPDOG_UPLEVEL%%', str);
      Delete(str, cnt, 25);
      Insert(DataSetMakeNote.FBN('FSNAME_TIPDOG_UPLEVEL').AsString, str, cnt);
    end;
  end;

  DataSetMakeNote.Active := false;
  DataSetMakeNote.Free;
//  Showmessage(str);

  cxMemo_dog_note.Text := str;
end;

procedure TfrmPredopl.FormResize(Sender: TObject);
begin
  Panel1.Left := Width div 2 - Panel1.Width div 2 - 6;
  Panel1.Top := Height div 2 - Panel1.Height div 2 - 18;
end;

procedure TfrmPredopl.cxButton_histClick(Sender: TObject);
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

procedure TfrmPredopl.saveExecute(Sender: TObject);
begin
  cxButton_okClick(Self);
end;

procedure TfrmPredopl.save1Execute(Sender: TObject);
begin
  cxButton_okClick(Self);
end;

procedure TfrmPredopl.insExecute(Sender: TObject);
begin
  ToolButton_addClick(Self);
end;

procedure TfrmPredopl.Label17Click(Sender: TObject);
var
  Ret : VAriant;
begin
  if Priznak_vizova <> 'red' then Exit;
  Ret := LoadDogManedger.EditSum(self, 1, pFIBDataSet_id_dokument.FieldByName('d_sum_pay').AsCurrency,
                                 pFIBDataSet_id_dokument.FieldByName('d_nds_pay').AsCurrency,
                                 CurrencyEdit_summa.Value, CurrencyEdit_nds.Value);
  if VarArrayDimCount(Ret)>0
  then begin
     if Ret[0]<>NULL
     then begin
       if Ret[0] > 0 then CurrencyEdit_summa.Value := Ret[0];
       if Ret[1] > 0 then CurrencyEdit_nds.Value   := Ret[1];
     end;
  end;
end;

procedure TfrmPredopl.Label1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if Priznak_vizova = 'red' then
  begin
    Label1.Cursor := crHandPoint;
  end;
end;

procedure TfrmPredopl.Label1Click(Sender: TObject);
begin
  Label17Click(Self);
end;

procedure TfrmPredopl.SpeedButton_redClick(Sender: TObject);
var
  Add: Variant;
  d_dogovor: TDate;
  cnt, i: Integer;
  id_adding_flag:Integer;
  smSmet:double;
begin
  id_adding_flag:=1;
  d_dogovor := cxDateEdit_dog.Date;
  SumToSmet();

  Add := LoadDogManedger.AddKosht(self,pFIBDatabase.Handle,
         //summa_to_smet,
         -1,2,
         RxMemoryData_smet.FieldByName('id_smet').AsInteger,
         RxMemoryData_smet.FieldByName('id_razd').AsInteger,
         RxMemoryData_smet.FieldByName('id_stat').AsInteger,
         RxMemoryData_smet.FieldByName('id_kekv').AsInteger,
         RxMemoryData_smet.FieldByName('sum_smet').AsCurrency,
         d_dogovor);

//  if VarArrayDimCount(Add) > 0 then
//  begin
//   { Группировка }
//
//   if RxMemoryData_smet.Locate('id_smet',Add[i][7],[])=true then
//   begin
//    if RxMemoryData_smet.Locate('id_razd',Add[i][8],[])=true then
//    begin
//     if RxMemoryData_smet.Locate('id_stat',Add[i][9],[])=true then
//     begin
//      if RxMemoryData_smet.Locate('id_kekv',Add[i][10],[])=true then
//      begin
//       RxMemoryData_smet.Edit;
//       RxMemoryData_smet.FieldByName('sum_smet').Value := Add[i][3]+RxMemoryData_smet.FieldByName('sum_smet').Value;
//       smSmet:=Add[i][3];
//       RxMemoryData_smet.Delete;

//       RxMemoryData_smet.Post;
//       id_adding_flag:=0;
//      end;
//     end;
//    end;
//   end;
//  end;




  if id_adding_flag = 1 then
  begin
    Cnt := VarArrayHighBound(Add, 1);

    for i := 0 to Cnt do
    begin
          id_smeta := Add[i][7];
          id_dt_smet := RxMemoryData_smet.FieldByName('id').AsVariant;
          RxMemoryData_smet.Locate('id', id_dt_smet, []);
          RxMemoryData_smet.Open;
          RxMemoryData_smet.Edit;
          RxMemoryData_smet.FieldByName('id_smet').Value := Add[i][7];
          RxMemoryData_smet.FieldByName('id_razd').Value := Add[i][8];
          RxMemoryData_smet.FieldByName('id_stat').Value := Add[i][9];
          RxMemoryData_smet.FieldByName('sum_smet').Value := Add[i][3];//+smSmet;
          RxMemoryData_smet.FieldByName('name_smet').Value := Add[i][0];
          RxMemoryData_smet.FieldByName('name_razd').Value := Add[i][1];
          RxMemoryData_smet.FieldByName('name_stat').Value := Add[i][2];
          RxMemoryData_smet.FieldByName('kod_smety').Value := Add[i][4];
          RxMemoryData_smet.FieldByName('n_razd').Value := Add[i][5];
          RxMemoryData_smet.FieldByName('n_stat').Value := Add[i][6];
          RxMemoryData_smet.FieldByName('id_kekv').Value := Add[i][10];
          RxMemoryData_smet.FieldByName('kod_kekv').Value := Add[i][11];
          RxMemoryData_smet.FieldByName('name_kekv').Value := Add[i][12];
//          RxMemoryData_smet.FieldByName('flag_del').Value := 0;
          RxMemoryData_smet.Post;
        end;
      SumNds();
      end;
end;

procedure TfrmPredopl.SumToSmet();
var
  summa_d, summa_smet, sum_pay, sum_fulfil : Currency;
begin
  if Priznak_vizova <> 'red' then
  begin
    summa_to_smet := -1;
  end
  else
  begin
  //сумма, которую можно разбить по сметам
    summa_smet := CurrencyEdit_sum_po_smet.Value;
    sum_pay := CurrencyEdit_summa_pay.Value;
    sum_fulfil := CurrencyEdit_sum_fulfil.Value;
    summa_d := CurrencyEdit_summa.Value;

    summa_to_smet := summa_d - summa_smet;
  end;
end;


procedure TfrmPredopl.editExecute(Sender: TObject);
begin
  SpeedButton_redClick(Self);
end;

procedure TfrmPredopl.N3Click(Sender: TObject);
begin
  SpeedButton_redClick(Self);
end;

procedure TfrmPredopl.Label12Click(Sender: TObject);
var
  s       : Variant;
begin
  s := LoadDogManedger.Comment(Self, comment, Priznak_vizova);
  comment := s;   
end;

procedure TfrmPredopl.cxButtonEdit_depPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    sp: TSprav;
begin
  if (Priznak_vizova = 'prosmotr') or (Priznak_vizova = 'hist')  then Exit;
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

procedure TfrmPredopl.delExecute(Sender: TObject);
begin
  ToolButton_delClick(Self);
end;

procedure TfrmPredopl.cxButton1Click(Sender: TObject);
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



