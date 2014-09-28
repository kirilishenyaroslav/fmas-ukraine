unit Shablon8;
{*******************************************************************************
* Shablon2                                                                     *
*                                                                              *
* Работа с договорами, Шаблон 2(договор с поставщиком-подрядчиком)             *
* Copyright ©  2004, Бурмистрова Е.                                            *
*******************************************************************************}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, iBase, FIBDatabase, pFIBDatabase, ComCtrls, StdCtrls, ExtCtrls,
  cxLookAndFeelPainters, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  Mask, ToolEdit, CurrEdit, cxMemo, cxButtonEdit, cxCheckBox, DB,
  FIBDataSet, pFIBDataSet, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  GlobalSPR, ImgList, ToolWin, RxMemDS, cxCurrencyEdit,
  FIBQuery, pFIBQuery, pFIBStoredProc, ActnList, Menus, cxTL,LoadDogManedger,
  dxBar, dxBarExtItems, DogLoaderUnit, Buttons, dogLangPackUnit2,
  dxStatusBar,uCommonSp,AArray,LoaderUnit;

resourcestring
    errDtNotNumber = 'Номер договору не заповнен!';
    errDtNotFiz = 'Виберіть фізичну особу!';
    errDtNotDonnu = 'Виберіть рахунок Дніпрожзержинськводоканала!';
    errDtNotNotDBeg = 'Введите начальную дату!';
    errDtNotNotDEnd = 'Введите конечную дату!';
    errDtNotNotDEnd_DBeg = 'Некорректно задан период!';
    errDtSumma = 'Сума договору не дорівнює сумі по кошторису!';
    errNotSmet = 'Необхідно додати кошторис!';
    errNotNote = 'Необхідно ввести підставу договору!';

type
  TfrmShablon8 = class(TForm)
    Panel1: TPanel;
    pFIBDatabase: TpFIBDatabase;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBStoredProc_dt_add: TpFIBStoredProc;
    pFIBDataSet_id_dokument: TpFIBDataSet;
    pFIBDataSet_tip_dog: TpFIBDataSet;
    pFIBDataSet_tip_dog_add: TpFIBDataSet;
    pFIBDataSet_tip_info: TpFIBDataSet;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
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
    dxBarLargeButton_add: TdxBarLargeButton;
    dxBarLargeButton_red: TdxBarLargeButton;
    dxBarLargeButton_prosm: TdxBarLargeButton;
    dxBarLargeButton_del: TdxBarLargeButton;
    RxMemoryData_smet: TRxMemoryData;
    DataSource1: TDataSource;
    pFIBDataSet_kekv: TpFIBDataSet;
    pFIBDataSet_razd_st: TpFIBDataSet;
    pFIBDataSet_smet_info: TpFIBDataSet;
    pFIBDataSet_smeta: TpFIBDataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label16: TLabel;
    Label2: TLabel;
    Label13: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    cxButtonEdit_fio: TcxButtonEdit;
    cxTextEdit_inn: TcxTextEdit;
    cxTextEdit_data_rojd: TcxTextEdit;
    cxCheckBox_not_summa: TcxCheckBox;
    CurrencyEditsum_dog: TCurrencyEdit;
    GroupBox8: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    cxButtonEdit_name_un: TcxButtonEdit;
    cxTextEdit_mfo_un: TcxTextEdit;
    cxTextEdit_rsch_un: TcxTextEdit;
    cxTextEdit_bank_un: TcxTextEdit;
    cxMaskEdit_n_dog: TcxMaskEdit;
    cxMemo_note_dog: TcxMemo;
    cxDateEdit_dog: TcxDateEdit;
    cxTextEdit_reg_n: TcxTextEdit;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    cxDateEdit_date_beg: TcxDateEdit;
    cxDateEdit_date_end: TcxDateEdit;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    cxTextEdit_ot_donnu: TcxTextEdit;
    cxTextEdit_ot_post: TcxTextEdit;
    TabSheet2: TTabSheet;
    GroupBox7: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    cxTextEdit_def_n_dog2: TcxTextEdit;
    cxTextEdit_def_d_dog2: TcxTextEdit;
    cxTextEdit_reg_n2: TcxTextEdit;
    GroupBox14: TGroupBox;
    Label32: TLabel;
    CurrencyEdit_nds: TCurrencyEdit;
    GroupBox9: TGroupBox;
    Label14: TLabel;
    Label20: TLabel;
    cxDateEdit_nomn_d: TcxDateEdit;
    GroupBox10: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    CurrencyEdit_summa_pay: TCurrencyEdit;
    CurrencyEdit_sum_fulfil: TCurrencyEdit;
    cxButton_ok: TcxButton;
    cxButton_cancel: TcxButton;
    Label5: TLabel;
    DataSetHistory: TpFIBDataSet;
    DataSetHistSmet: TpFIBDataSet;
    cxButton_hist: TcxButton;
    ActionList1: TActionList;
    save: TAction;
    save1: TAction;
    ins: TAction;
    Label8: TLabel;
    cxTextEdit_tn: TcxTextEdit;
    Label23: TLabel;
    dxStatusBar1: TdxStatusBar;
    edit: TAction;
    Label1: TLabel;
    Label33: TLabel;
    cxButtonEdit_otd: TcxButtonEdit;
    GroupBox1: TGroupBox;
    Panel4: TPanel;
    ToolButton_add: TSpeedButton;
    ToolButton_del: TSpeedButton;
    SpeedButton_red: TSpeedButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn_smeta: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    GroupBox13: TGroupBox;
    CurrencyEdit_sum_po_smet: TCurrencyEdit;
    cxTextEdit_kol_vo_smet: TcxTextEdit;
    Panel3: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    del: TAction;
    cxTextEdit_nomn: TcxTextEdit;
    DataSetCheck: TpFIBDataSet;
    TransactionCheck: TpFIBTransaction;
    cxButton1: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButtonEdit_name_pPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxMaskEdit_n_dogPropertiesChange(Sender: TObject);
    procedure cxButton_okClick(Sender: TObject);
    procedure cxDateEdit_dogPropertiesChange(Sender: TObject);
    procedure CurrencyEditsum_dogChange(Sender: TObject);
    procedure cxDateEdit_date_endPropertiesChange(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxCheckBox_not_summaPropertiesChange(Sender: TObject);
    procedure cxButtonEdit_name_unPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure Label22Click(Sender: TObject);
    procedure ToolButton_addClick(Sender: TObject);
    procedure RxMemoryData_smetAfterPost(DataSet: TDataSet);
    procedure RxMemoryData_smetAfterDelete(DataSet: TDataSet);
    procedure ToolButton_delClick(Sender: TObject);
    procedure RxMemoryData_smetAfterScroll(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);
    procedure Label21Click(Sender: TObject);
    procedure Label21MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label22MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxButton_histClick(Sender: TObject);
    procedure addExecute(Sender: TObject);
    procedure delExecute(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure saveExecute(Sender: TObject);
    procedure save1Execute(Sender: TObject);
    procedure insExecute(Sender: TObject);
    procedure CurrencyEdit_sum_po_smetChange(Sender: TObject);
    procedure SpeedButton_redClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure editExecute(Sender: TObject);
    procedure Label16MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label16Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure cxButtonEdit_depPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
  private
  fProc : TResProc;
  procedure SumNds();
  procedure ButtonEn();
  procedure Summa();
  procedure SumToSmet(); // сумма, допустимая к разбивке

  public
    id_doc: Int64;
    id_smeta: Variant;
    rate_acc_un: Variant; //идентификатор собственного счета
    smeta, razdel, stat: String;  //переменные, содержащие данные из функции;
    Priznak_vizova: String;
    id_dog, kod_dog: Int64;
    sum_po_smet: Variant; //В процедуре Summa()
    id_dt_smet: Variant; //Переменная для позиционирования
    nds_procent, sum_nds: Variant;
    id_man: Variant;
    summa_to_smet: Currency;
    comment : String;
    id_otdel: Integer;
    flag :Boolean;
    constructor Create (Aowner:TComponent;DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_dokument: Variant; Pr_vizova: String; Id_t_d: Variant; data : PShablonInputData = nil); overload;
  end;

function LoadShablon(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle;id_dokument: Variant;
                 Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;stdcall;
exports LoadShablon;

var
  frmShablon8: TfrmShablon8;

implementation
uses
  Registry;

{$R *.dfm}

constructor TfrmShablon8.Create (Aowner:TComponent;DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_dokument: Variant; Pr_vizova: String; Id_t_d: Variant; data : PShablonInputData = nil);
var
  i,j: Integer;
  post: Variant;
  Dataset_people: TpFIBDataSet;
  s: String;
begin
  if TForm(Aowner).FormStyle = fsNormal then frmStyle := fsNormal;
  self.kod_dog:=id_dokument;
  Priznak_vizova := Pr_vizova;
  if Pr_vizova = 'red' then
      begin
        inherited Create (Aowner);
        FormStyle := frmStyle;
        pFIBDatabase.Handle := DBHANDLE;

        pFIBDataSet_tip_dog.Active := false;
        pFIBDataSet_tip_dog.ParamByName('param_document').Value := id_dokument;
        pFIBDataSet_tip_dog.Active := true;
        kod_dog := id_dokument; //позиционирование

        pFIBDataSet_id_dokument.Active := false;
        pFIBDataSet_id_dokument.ParamByName('D_ID_DOCUMENT').AsInt64 := id_dokument;
        pFIBDataSet_id_dokument.Active := true;

        if  not VarIsNull(pFIBDataSet_id_dokument.FBN('d_comment').AsVariant) then
        comment := pFIBDataSet_id_dokument.FBN('d_comment').asstring else
        comment := '';

        cxButtonEdit_otd.Text := pFIBDataSet_id_dokument.FBN('OTDEL_NAME_FULL').AsString;
        id_otdel := pFIBDataSet_id_dokument.FBN('ID_OTDEL').AsInteger;

        cxMaskEdit_n_dog.Text := pFIBDataSet_id_dokument.FieldByName('d_n_dog').AsString;
        cxDateEdit_dog.Date := pFIBDataSet_id_dokument.FieldByName('d_d_dog').AsDateTime;
        CurrencyEditsum_dog.Text := CurrToStr(pFIBDataSet_id_dokument.FieldByName('d_summa').AsCurrency);
        id_doc := id_dokument;
        cxMemo_note_dog.Text := pFIBDataSet_id_dokument.FieldByName('d_dog_note').AsString;
        cxDateEdit_date_beg.Date := pFIBDataSet_id_dokument.FieldByName('d_date_beg').AsDateTime;
        cxDateEdit_date_end.Date := pFIBDataSet_id_dokument.FieldByName('d_date_end').AsDateTime;
        cxTextEdit_ot_donnu.Text := pFIBDataSet_id_dokument.FieldByName('d_fio_dongu').AsString;
        cxTextEdit_ot_post.Text := pFIBDataSet_id_dokument.FieldByName('d_fio_postav').AsString;
        cxCheckBox_not_summa.Checked := pFIBDataSet_id_dokument.FieldByName('d_not_summa').AsBoolean;
        if cxCheckBox_not_summa.Checked = false then
        begin
          CurrencyEditsum_dog.Text := '999999999,99';
//         ToolButton_add.Enabled := false;
//          SpeedButton_red.Enabled := false;
//          ToolButton_del.Enabled := false;
        end;
        cxTextEdit_nomn.Text := pFIBDataSet_id_dokument.FieldByName('d_nomn_dog').AsString;
        CurrencyEdit_nds.Text := pFIBDataSet_id_dokument.FieldByName('d_nds_sum').AsString;;
        CurrencyEdit_summa_pay.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_pay').AsString;
        CurrencyEdit_sum_fulfil.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_fulfil').AsString;

        if pFIBDataSet_id_dokument.FieldByName('d_nomd_dog').AsDateTime = 0 then
        cxDateEdit_nomn_d.Text := '' else
        cxDateEdit_nomn_d.Date := pFIBDataSet_id_dokument.FieldByName('d_nomd_dog').AsDateTime;

        cxTextEdit_reg_n.Text  := pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString;
        cxTextEdit_reg_n2.Text := pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString;

         //Данные по типу договора
        pFIBDataSet_tip_dog_add.Active := false;
        pFIBDataSet_tip_dog_add.ParamByName('pram_id_tip_dog').Value := id_t_d;
        pFIBDataSet_tip_dog_add.Active := true;

        Caption := 'Редагування'+' '+pFIBDataSet_tip_dog.FieldByName('SHORT_NAME').AsString+' '+
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
        //Данные по физ. лицу
        id_man := pFIBDataSet_id_dokument.FieldByName('id_man').AsVariant;
        Dataset_people := TpFIBDataSet.Create(Self);
        Dataset_people.Database := pFIBDatabase;
        Dataset_people.Transaction := pFIBTransactionRead;
        s := 'SELECT FAMILIA || '' '' || IMYA || '' '' || OTCHESTVO AS FIO, ' +
              'BIRTH_DATE, TIN, pc.tn ' +
              'from   People p ' +
              'LEFT JOIN private_cards pc ON P.ID_MAN=PC.ID_MAN ' +
              'where  People.id_man =' + VarToStr(id_man);
        Dataset_people.SelectSQL.Add(s);
        Dataset_people.Active := true;
        cxButtonEdit_fio.Text := Dataset_people.FieldByName('fio').AsString;
        cxTextEdit_tn.Text := Dataset_people.FieldByName('tn').AsString;
        cxTextEdit_data_rojd.Text := Dataset_people.FieldByName('BIRTH_DATE').AsString;
        cxTextEdit_inn.Text := Dataset_people.FieldByName('TIN').AsString;
        Dataset_people.Free;

        //Данные по native
        cxButtonEdit_name_un.Text := pFIBDataSet_id_dokument.FieldByName('D_NAME_CUSTOMER_N').AsString;
        cxTextEdit_mfo_un.Text := pFIBDataSet_id_dokument.FieldByName('D_MFO_N').AsString;
        cxTextEdit_bank_un.Text := pFIBDataSet_id_dokument.FieldByName('D_BANK_NAME_N').AsString;
        cxTextEdit_rsch_un.Text := pFIBDataSet_id_dokument.FieldByName('D_RSCH_N').AsString;
        rate_acc_un := pFIBDataSet_id_dokument.FieldByName('D_ID_RATE_ACC_NATIVE').AsVariant;

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
      end
      else

////////////////////////////////////////////////////////////////////////////////////////

      if Pr_vizova = 'add' then
      begin
        inherited Create (Aowner);
        FormStyle := frmStyle;
        pFIBDatabase.Handle := DBHANDLE;

        pFIBDataSet_id_dokument.Active := false;
        pFIBDataSet_id_dokument.Active := true;

        pFIBDataSet_tip_info.Active := false;
        pFIBDataSet_tip_info.ParamByName('d_id_tip_dog').Value := Id_t_d;
        pFIBDataSet_tip_info.Active := true;

        comment := '';

   if data <> NIL then
   begin
     if data^.num <> '' then
     cxMaskEdit_n_dog.Text := data^.num else
     cxMaskEdit_n_dog.Text := pFIBDataSet_tip_info.FieldByName('DEF_NUMBER').AsString;

     if DateToStr(data^.date_dog) <> '' then
     cxDateEdit_dog.Date := data^.date_dog else
     cxDateEdit_dog.Text := pFIBDataSet_tip_info.FieldByName('DEF_DATE').AsString;

     if data^.note <> '' then
     cxMemo_note_dog.Text := data^.note else
     cxMemo_note_dog.Text := pFIBDataSet_tip_info.FieldByName('DEF_NOTE').AsString;
   end
   else
   begin
     cxMemo_note_dog.Text := pFIBDataSet_tip_info.FieldByName('DEF_NOTE').AsString;
     cxMaskEdit_n_dog.Text := pFIBDataSet_tip_info.FieldByName('DEF_NUMBER').AsString;
     cxDateEdit_dog.Date := pFIBDataSet_tip_info.FieldByName('DEF_DATE').AsDateTime;
   end;
     if cxDateEdit_dog.Text = '30.12.1899' then cxDateEdit_dog.Date := Date;

   //выбор native-счета
    cxButtonEdit_name_un.Text := pFIBDataSet_tip_info.FieldByName('DEF_NAME_CUSTOMER').AsString;
    cxTextEdit_mfo_un.Text := pFIBDataSet_tip_info.FieldByName('DEF_MFO').AsString;
    cxTextEdit_rsch_un.Text := pFIBDataSet_tip_info.FieldByName('DEF_RSCHET').AsString;
    cxTextEdit_bank_un.Text := pFIBDataSet_tip_info.FieldByName('DEF_BANK_NAME').AsString;

    rate_acc_un := pFIBDataSet_tip_info.FieldByName('DEF_ID_RATE_ACC_NATIVE').AsInteger;
    cxTextEdit_ot_donnu.Text := pFIBDataSet_id_dokument.FieldByName('D_FIO_DONNU_DEF').AsString;

    cxTextEdit_reg_n.Visible := false;
    Label4.Visible := false;
    cxTextEdit_reg_n2.Visible := false;
    Label19.Visible := false;
    cxDateEdit_date_beg.Date := Date;
    cxDateEdit_date_end.Date := date+365;

       //Тип договора в верху формы
    pFIBDataSet_tip_dog_add.Active := false;
    pFIBDataSet_tip_dog_add.ParamByName('pram_id_tip_dog').Value := id_t_d;
    pFIBDataSet_tip_dog_add.Active := true;

     Caption := 'Додання'+' '+pFIBDataSet_tip_dog_add.FieldByName('short_name').AsString+' '+
    '('+pFIBDataSet_tip_dog_add.FieldByName('tip_dog').AsString+')';

    id_doc := id_dokument;
      end
      else
/////////////////////Просмотр документа//////////////////////////
      if Pr_vizova = 'prosmotr' then
      begin
        inherited Create (Aowner);
        FormStyle := frmStyle;
        pFIBDatabase.Handle := DBHANDLE;

        pFIBDataSet_tip_dog.Active := false;
        pFIBDataSet_tip_dog.ParamByName('param_document').Value := id_dokument;
        pFIBDataSet_tip_dog.Active := true;

        pFIBDataSet_id_dokument.Active := false;
        pFIBDataSet_id_dokument.ParamByName('D_ID_DOCUMENT').AsInt64 := id_dokument;
        pFIBDataSet_id_dokument.Active := true;

        if  not VarIsNull(pFIBDataSet_id_dokument.FBN('d_comment').AsVariant) then
        comment := pFIBDataSet_id_dokument.FBN('d_comment').asstring else
        comment := '';

        cxButtonEdit_otd.Text := pFIBDataSet_id_dokument.FBN('OTDEL_NAME_FULL').AsString;

        cxMaskEdit_n_dog.Text := pFIBDataSet_id_dokument.FieldByName('d_n_dog').AsString;
        cxDateEdit_dog.Date := pFIBDataSet_id_dokument.FieldByName('d_d_dog').AsDateTime;
        CurrencyEditsum_dog.Text := pFIBDataSet_id_dokument.FieldByName('d_summa').AsVariant;
        id_doc := id_dokument;
        cxButton1.Enabled:=false;
        cxMemo_note_dog.Text := pFIBDataSet_id_dokument.FieldByName('d_dog_note').AsString;
        cxDateEdit_date_beg.Date := pFIBDataSet_id_dokument.FieldByName('d_date_beg').AsDateTime;
        cxDateEdit_date_end.Date := pFIBDataSet_id_dokument.FieldByName('d_date_end').AsDateTime;
        cxTextEdit_ot_donnu.Text := pFIBDataSet_id_dokument.FieldByName('d_fio_dongu').AsString;
        cxTextEdit_ot_post.Text := pFIBDataSet_id_dokument.FieldByName('d_fio_postav').AsString;
        cxCheckBox_not_summa.Checked := pFIBDataSet_id_dokument.FieldByName('d_not_summa').AsBoolean;
        if cxCheckBox_not_summa.Checked = false then
        begin
          CurrencyEditsum_dog.Text := '999999999,99';
//          ToolButton_add.Enabled := false;
//         SpeedButton_red.Enabled := false;
//          ToolButton_del.Enabled := false;
        end;
        CurrencyEdit_nds.Text := pFIBDataSet_id_dokument.FieldByName('d_nds_sum').AsString;;
        CurrencyEdit_summa_pay.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_pay').AsString;
        CurrencyEdit_sum_fulfil.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_fulfil').AsString;

        if pFIBDataSet_id_dokument.FieldByName('d_nomd_dog').AsDateTime = 0 then
        cxDateEdit_nomn_d.Text := '' else
        cxDateEdit_nomn_d.Date := pFIBDataSet_id_dokument.FieldByName('d_nomd_dog').AsDateTime;

        cxTextEdit_nomn.Text := pFIBDataSet_id_dokument.FieldByName('d_nomn_dog').AsString;

        cxTextEdit_reg_n.Text  := pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString;
        cxTextEdit_reg_n2.Text := pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString;

         //Данные по типу договора
        pFIBDataSet_tip_dog_add.Active := false;
        pFIBDataSet_tip_dog_add.ParamByName('pram_id_tip_dog').Value := id_t_d;
        pFIBDataSet_tip_dog_add.Active := true;

        //Данные по физ. лицу
        id_man := pFIBDataSet_id_dokument.FieldByName('id_man').AsVariant;
        Dataset_people := TpFIBDataSet.Create(Self);
        Dataset_people.Database := pFIBDatabase;
        Dataset_people.Transaction := pFIBTransactionRead;
        s := 'SELECT FAMILIA || '' '' || IMYA || '' '' || OTCHESTVO AS FIO, ' +
              'BIRTH_DATE, TIN, pc.tn ' +
              'from   People p ' +
              'LEFT JOIN private_cards pc ON P.ID_MAN=PC.ID_MAN ' +
              'where  People.id_man =' + VarToStr(id_man);
        Dataset_people.SelectSQL.Add(s);
        Dataset_people.Active := true;
        cxButtonEdit_fio.Text := Dataset_people.FieldByName('fio').AsString;
        cxTextEdit_tn.Text := Dataset_people.FieldByName('tn').AsString;
        cxTextEdit_data_rojd.Text := Dataset_people.FieldByName('BIRTH_DATE').AsString;
        cxTextEdit_inn.Text := Dataset_people.FieldByName('TIN').AsString;
        Dataset_people.Free;

        //Данные по native
        cxButtonEdit_name_un.Text := pFIBDataSet_id_dokument.FieldByName('D_NAME_CUSTOMER_N').AsString;
        cxTextEdit_mfo_un.Text := pFIBDataSet_id_dokument.FieldByName('D_MFO_N').AsString;
        cxTextEdit_bank_un.Text := pFIBDataSet_id_dokument.FieldByName('D_BANK_NAME_N').AsString;
        cxTextEdit_rsch_un.Text := pFIBDataSet_id_dokument.FieldByName('D_RSCH_N').AsString;
        rate_acc_un := pFIBDataSet_id_dokument.FieldByName('D_ID_RATE_ACC_NATIVE').AsVariant;

        Caption := 'Просмотр'+' '+pFIBDataSet_tip_dog.FieldByName('short_name').AsString+' '+
        '('+pFIBDataSet_tip_dog.FieldByName('tip_dog').AsString+')';

        //Данные по смете
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

          RxMemoryData_smet.FieldByName('id').Value := pFIBDataSet_smet_info.FieldByName('id_dt_smet_dog').AsVariant;
          RxMemoryData_smet.FieldByName('flag_del').Value := 0;
          RxMemoryData_smet.Post;

          pFIBDataSet_smet_info.Next;
      end;

        dxBarLargeButton_add.Enabled := false;
        dxBarLargeButton_red.Enabled := false;
        dxBarLargeButton_del.Enabled := false;
        cxMaskEdit_n_dog.Properties.ReadOnly := true;
        cxDateEdit_dog.Properties.ReadOnly := true;
        cxMemo_note_dog.Properties.ReadOnly := true;
        cxDateEdit_date_beg.Properties.ReadOnly := true;
        cxDateEdit_date_end.Properties.ReadOnly := true;
        cxTextEdit_ot_post.Properties.ReadOnly := true;
        cxTextEdit_ot_donnu.Properties.ReadOnly := true;
        CurrencyEditsum_dog.ReadOnly := true;
        cxCheckBox_not_summa.Properties.ReadOnly := true;
        cxTextEdit_nomn.Properties.ReadOnly := true;
        cxDateEdit_nomn_d.Properties.ReadOnly := true;
        ToolButton_add.Enabled := false;
        SpeedButton_red.Enabled := false;
        ToolButton_del.Enabled := false;

        Panel4.Visible := false;
        
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
        DataSetHistory.ParamByName('id_history').Value := id_dokument;
        DataSetHistory.Active := true;

        if  not VarIsNull(DataSetHistory.FBN('d_comment').AsVariant) then
        comment := DataSetHistory.FBN('d_comment').asstring else
        comment := '';

        cxButtonEdit_otd.Text := DataSetHistory.FBN('OTDEL_NAME_FULL').AsString;

        cxMaskEdit_n_dog.Text := DataSetHistory.FieldByName('d_n_dog').AsString;
        cxDateEdit_dog.Date := DataSetHistory.FieldByName('d_d_dog').AsDateTime;
        CurrencyEditsum_dog.Text := DataSetHistory.FieldByName('d_summa').AsString;
        CurrencyEdit_nds.Text := DataSetHistory.FieldByName('d_nds_sum').AsString;
        cxMemo_note_dog.Text := DataSetHistory.FieldByName('d_dog_note').AsString;
        cxTextEdit_reg_n.Text := DataSetHistory.FieldByName('d_reg_nomer').AsString;
        cxTextEdit_reg_n2.Text := DataSetHistory.FieldByName('d_reg_nomer').AsString;
        CurrencyEdit_summa_pay.Text := DataSetHistory.FieldByName('d_sum_pay').AsString;
        CurrencyEdit_sum_fulfil.Text := DataSetHistory.FieldByName('d_sum_fulfil').AsString;
        cxTextEdit_ot_donnu.Text := DataSetHistory.FieldByName('D_FIO_DONGU').AsString;
        cxTextEdit_ot_post.Text := DataSetHistory.FieldByName('D_FIO_POSTAV').AsString;
        cxTextEdit_nomn.Text := DataSetHistory.FieldByName('D_NOMN_DOG').AsString;
        cxDateEdit_nomn_d.Text := DataSetHistory.FieldByName('D_NOMD_DOG').AsString;
        cxDateEdit_date_beg.Date := DataSetHistory.FieldByName('D_DATE_BEG').AsDateTime;
        cxDateEdit_date_end.Date := DataSetHistory.FieldByName('D_DATE_END').AsDateTime;

        //Данные по native
        cxButtonEdit_name_un.Text := DataSetHistory.FieldByName('D_NAME_CUSTOMER_N').AsString;
        cxTextEdit_mfo_un.Text := DataSetHistory.FieldByName('D_MFO_N').AsString;
        cxTextEdit_bank_un.Text := DataSetHistory.FieldByName('D_BANK_NAME_N').AsString;
        cxTextEdit_rsch_un.Text := DataSetHistory.FieldByName('D_RSCH_N').AsString;
        rate_acc_un := DataSetHistory.FieldByName('D_ID_RATE_ACC_NATIVE').AsVariant;

        //Данные по физ. лицу
        id_man := pFIBDataSet_id_dokument.FieldByName('id_man').AsVariant;
        Dataset_people := TpFIBDataSet.Create(Self);
        Dataset_people.Database := pFIBDatabase;
        Dataset_people.Transaction := pFIBTransactionRead;
        s := 'SELECT FAMILIA || '' '' || IMYA || '' '' || OTCHESTVO AS FIO, ' +
              'BIRTH_DATE, TIN, pc.tn ' +
              'from   People p ' +
              'LEFT JOIN private_cards pc ON P.ID_MAN=PC.ID_MAN ' +
              'where  People.id_man =' + VarToStr(id_man);
        Dataset_people.SelectSQL.Add(s);
        Dataset_people.Active := true;
        cxButtonEdit_fio.Text := Dataset_people.FieldByName('fio').AsString;
        cxTextEdit_tn.Text := Dataset_people.FieldByName('tn').AsString;
        cxTextEdit_data_rojd.Text := Dataset_people.FieldByName('BIRTH_DATE').AsString;
        cxTextEdit_inn.Text := Dataset_people.FieldByName('TIN').AsString;
        Dataset_people.Free;

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
        cxMemo_note_dog.Enabled := false;
        ToolButton_add.Enabled := false;
        SpeedButton_red.Enabled := false;
        ToolButton_del.Enabled := false;
        GroupBox2.Enabled := false;
        GroupBox3.Enabled := false;
        cxButton_hist.Visible := false;

        Panel4.Visible := false;
        
        ins.Enabled := false;
        edit.Enabled := false;
        del.Enabled := false;

        dxStatusBar1.Visible := false;
      end;
end;



function LoadShablon(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle;id_dokument: Variant;
                 Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;
var
  sh1: TfrmShablon8;
begin
  sh1 := TfrmShablon8.Create(AOwner,DBHANDLE,frmStyle,id_dokument,Pr_vizova,id_t_d,data);
  if sh1.Flag then
  begin
    sh1.free;
    Exit;
  end;
  sh1.fProc := proc;
end;

procedure TfrmShablon8.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmShablon8.FormCreate(Sender: TObject);
var
  reg       : TRegistry;
  DataSetOtd: TpFIBDataSet;
begin
  //Интерфейс
  {TabSheet1.Caption:=Resources_unit.DT_OSN_DANNIE;
  TabSheet2.Caption:=Resources_unit.DT_DOP_DANNIE;
  TabSheet3.Caption:=Resources_unit.DT_SMETI;
  cxButton_ok.Caption:=Resources_unit.PUB_BUTTON_OK_CONST;
  cxButton_cancel.Caption:=Resources_unit.PUB_BUTTON_CANCEL_CONST;
  ToolButton_add.Caption:=Resources_unit.PUB_ACTION_ADD_CONST;
  ToolButton_red.Caption:=Resources_unit.PUB_ACTION_UPDATE_CONST;
  ToolButton_del.Caption:=Resources_unit.PUB_ACTION_DELETE_CONST;

  Label22.Caption                           := rsh_Vipol;
  Label21.Caption                           := rsh_Opl;}
  TabSheet1.Caption:='Основні дані';
  TabSheet2.Caption:='Значення за замовчуванням';
  if Priznak_vizova = 'red' then
  begin
    Label16.font.color := clBlue;
    Label16.font.Style := [fsUnderline];
    Label32.font.color := clBlue;
    Label32.font.Style := [fsUnderline];
  end;

  if Priznak_vizova <> 'add' then
  begin
    Label21.font.color := clBlue;
    Label21.font.Style := [fsUnderline];
    Label22.font.color := clBlue;
    Label22.font.Style := [fsUnderline];
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

procedure TfrmShablon8.cxButton_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmShablon8.cxButtonEdit_name_pPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  SprPeople: Variant;
begin
  SprPeople := LoadDogManedger.SprPeople(Self, pFIBDatabase.Handle, false, true, -1);
  if VarArrayDimCount(SprPeople) > 0 then
  begin
    id_man := SprPeople[0];
    cxButtonEdit_fio.Text := SprPeople[1];
    if  not VarIsNull(SprPeople[8]) then
      cxTextEdit_data_rojd.Text := SprPeople[8]
      else cxTextEdit_data_rojd.Text := '';
    if  not VarIsNull (SprPeople[9]) then
      cxTextEdit_inn.Text := SprPeople[9]
      else cxTextEdit_inn.Text := '';
    if  not VarIsNull (SprPeople[10]) then
      cxTextEdit_tn.Text := SprPeople[10]
      else cxTextEdit_tn.Text := '';
  end;
end;

procedure TfrmShablon8.cxMaskEdit_n_dogPropertiesChange(Sender: TObject);
begin
  cxTextEdit_def_n_dog2.Text := cxMaskEdit_n_dog.Text;
end;


procedure TfrmShablon8.Summa();
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


procedure TfrmShablon8.cxButton_okClick(Sender: TObject);
var
  i,j: Integer;
  action : TResAction;
  DataSet_rate: TpFIBDataSet;
  s: String;
  s_pay, s_doc, s_smet: Currency;
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

         // проверка на заполнение номера договора
    if  Trim(cxMaskEdit_n_dog.Text) = '' then
        begin
        MessageDlg('Увага', errDtNotNumber, mtError, [mbOk]);
        cxMaskEdit_n_dog.SetFocus;
        Exit;
    end;

         // проверка на заполнение основания
    if  Trim(cxMemo_note_dog.Text)='' then
        begin
        MessageDlg('Увага', errNotNote, mtError, [mbOk]);
        cxMemo_note_dog.SetFocus;
        Exit;
    end;

         // проверка на заполнение контрагента
    if  Trim(cxButtonEdit_fio.Text)='' then
        begin
        MessageDlg('Увага', errDtNotFiz, mtError, [mbOk]);
        cxButtonEdit_fio.SetFocus;
        Exit;
    end;

         // проверка на заполнение счета ДонНУ
    if  Trim(cxButtonEdit_name_un.Text)='' then
        begin
        MessageDlg('Увага', errDtNotDonnu, mtError, [mbOk]);
        cxButtonEdit_name_un.SetFocus;
        Exit;
    end;

         // проверка на заполнение даты
    if  Trim(cxDateEdit_date_beg.Text)='' then
        begin
          MessageDlg('Увага', errDtNotNotDBeg, mtError, [mbOk]);
          cxDateEdit_date_beg.SetFocus;
          Exit;
        end;

        // проверка на заполнение даты
    if  Trim(cxDateEdit_date_end.Text)='' then
        begin
          MessageDlg('Увага', errDtNotNotDEnd, mtError, [mbOk]);
          cxDateEdit_date_end.SetFocus;
          Exit;
          end;

        // проверка на корректность даты
    if  cxDateEdit_date_beg.Date>cxDateEdit_date_end.Date then
        begin
          MessageDlg('Увага', errDtNotNotDEnd_DBeg, mtError, [mbOk]);
          cxDateEdit_date_beg.SetFocus;
          Exit;
        end;

       //проверка на заполнение смет
  if cxCheckBox_not_summa.Checked = false then
  begin //проверка на договор без суммы
    s_pay  := CurrencyEdit_summa_pay.Value;
    s_doc  := CurrencyEditsum_dog.Value;

     if s_doc <> s_pay then
     begin
       if Trim(CurrencyEdit_sum_po_smet.Text) = '' then
       begin
         MessageDlg('Увага', errNotSmet, mtError, [mbOk]);
         Exit;
       end;
     end;

    s_smet := CurrencyEdit_sum_po_smet.Value;

    if (abs(s_doc - (s_smet + s_pay)) > 0.000001) then
    begin
        ShowMessage('Сума кошторису не дорівнює сумі документа');
        Exit;
    end;
  end;

if Priznak_vizova = 'add' then
begin
    action := raAdd;
    pFIBTransactionWrite.StartTransaction;
    pFIBStoredProc_dt_add.StoredProcName := 'DOG_DT_DOCUMENT_INSERT';
    pFIBStoredProc_dt_add.Prepare;
    pFIBStoredProc_dt_add.ParamByName('D_KOD_DOG').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_N_DOG').Value := cxMaskEdit_n_dog.Text;
    pFIBStoredProc_dt_add.ParamByName('D_D_DOG').Value := cxDateEdit_dog.Date;
    if Trim(CurrencyEditsum_dog.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_SUMMA').Value := 0 else
    pFIBStoredProc_dt_add.ParamByName('D_SUMMA').Value := CurrencyEditsum_dog.Text;
    if Trim(cxMemo_note_dog.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_DOG_NOTE').Value := '' else
    pFIBStoredProc_dt_add.ParamByName('D_DOG_NOTE').Value := Trim(cxMemo_note_dog.Text);

    pFIBDataSet_tip_info.active := true;
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACC_NATIVE').Value := rate_acc_un;

    if Trim(cxTextEdit_nomn.Text)='' then
    pFIBStoredProc_dt_add.ParamByName('D_NOMN_DOG').Value := null else
    pFIBStoredProc_dt_add.ParamByName('D_NOMN_DOG').Value := cxTextEdit_nomn.Text;

    if Trim(cxDateEdit_nomn_d.Text)='' then
    pFIBStoredProc_dt_add.ParamByName('D_NOMD_DOG').Value := null else
    pFIBStoredProc_dt_add.ParamByName('D_NOMD_DOG').Value := cxDateEdit_nomn_d.Date;

    pFIBStoredProc_dt_add.ParamByName('D_DATE_BEG').Value := cxDateEdit_date_beg.Date;
    pFIBStoredProc_dt_add.ParamByName('D_DATE_END').Value := cxDateEdit_date_end.Date;
    pFIBStoredProc_dt_add.ParamByName('D_CLOSE').Value := 0;
    if cxCheckBox_not_summa.Checked then
      begin
        pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').Value := 1;
        pFIBStoredProc_dt_add.ParamByName('D_SUMMA').Value := '999999999,99';
        pFIBStoredProc_dt_add.ParamByName('D_NDS_SUM').Value := null;
      end
    else
      begin
        pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').Value := 0;
        if Trim(CurrencyEdit_nds.Text)='' then
        pFIBStoredProc_dt_add.ParamByName('D_NDS_SUM').Value := null else
        pFIBStoredProc_dt_add.ParamByName('D_NDS_SUM').Value := CurrencyEdit_nds.Text;
      end;

    pFIBStoredProc_dt_add.ParamByName('D_FIO_DONGU').Value := cxTextEdit_ot_donnu.Text;
    if Trim(cxTextEdit_ot_post.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_FIO_POSTAV').Value := '' else
    pFIBStoredProc_dt_add.ParamByName('D_FIO_POSTAV').Value := cxTextEdit_ot_post.Text;

    pFIBDataSet_tip_dog_add.Active := true;
    pFIBStoredProc_dt_add.ParamByName('D_ID_TIP_DOG').Value := pFIBDataSet_tip_dog_add.fieldByName('id_tip_dog').AsVariant;
    pFIBStoredProc_dt_add.ParamByName('D_SUM_OPL').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('d_sum_pay').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_SUM_FULFIL').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_NDS_PAY').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_ID_MAN').Value := id_man;
    
    pFIBStoredProc_dt_add.ParamByName('D_ID_USER').Value := SYS_ID_USER;
    pFIBStoredProc_dt_add.ParamByName('D_IP_COMP').Value := GetIPAddress;
    pFIBStoredProc_dt_add.ParamByName('D_NAME_COMP').Value := GetCompName;

    pFIBStoredProc_dt_add.ParamByName('D_COMMENT').Value := comment;
    pFIBStoredProc_dt_add.ParamByName('D_ID_OTDEL').Value := id_otdel;

    try
      pFIBStoredProc_dt_add.ExecProc;
    except on e:Exception do
      begin
        ShowMessage(e.Message);
        pFIBTransactionWrite.Rollback;
        Exit;
      end;
    end;
      kod_dog := pFIBStoredProc_dt_add.FieldByName('VIX_KOD_DOG').AsVariant;

    // Добавление сметы
    if cxCheckBox_not_summa.Checked = false then
    begin //проверка на договор без суммы
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
               pFIBStoredProc_dt_add.ParamByName('D_ID_DOG').AsInt64 := kod_dog;
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
               RxMemoryData_smet.Next;
           end;
      end;
    end;
    pFIBTransactionWrite.Commit;
    Close;
    end
    else


/////////////////////////////////////////Редактирование шаблона 8//////////////////////////////////////////////
    begin
    action := raEdit;
    pFIBTransactionWrite.StartTransaction;
    pFIBStoredProc_dt_add.StoredProcName := 'DOG_DT_DOCUMENT_UPDATE';
    pFIBStoredProc_dt_add.Prepare;
    pFIBStoredProc_dt_add.ParamByName('D_ID_DOG').AsInt64 := id_doc;
    pFIBStoredProc_dt_add.ParamByName('D_N_DOG').Value := cxMaskEdit_n_dog.Text;
    pFIBStoredProc_dt_add.ParamByName('D_D_DOG').Value := cxDateEdit_dog.Text;

    if Trim(CurrencyEditsum_dog.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_SUMMA').Value := 0 else
    pFIBStoredProc_dt_add.ParamByName('D_SUMMA').Value := CurrencyEditsum_dog.Text;

    if cxCheckBox_not_summa.Checked then
      begin
        pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').Value := 1;
        pFIBStoredProc_dt_add.ParamByName('D_SUMMA').Value := '999999999,99';
        pFIBStoredProc_dt_add.ParamByName('D_NDS_SUM').Value := null;
      end
      else
      begin
        pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').Value := 0;
        if Trim(CurrencyEdit_nds.Text)='' then
        pFIBStoredProc_dt_add.ParamByName('D_NDS_SUM').Value := null else
        pFIBStoredProc_dt_add.ParamByName('D_NDS_SUM').Value := CurrencyEdit_nds.Text;
      end;

    pFIBStoredProc_dt_add.ParamByName('D_DOG_NOTE').Value := Trim(cxMemo_note_dog.Text);
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACC_NATIVE').Value := rate_acc_un;

    if Trim(cxDateEdit_nomn_d.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_NOMD_DOG').Value := null else
    pFIBStoredProc_dt_add.ParamByName('D_NOMD_DOG').Value := cxDateEdit_nomn_d.Text;

    if Trim(cxTextEdit_nomn.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_NOMN_DOG').Value := Null else
    pFIBStoredProc_dt_add.ParamByName('D_NOMN_DOG').Value := cxTextEdit_nomn.Text;

    pFIBStoredProc_dt_add.ParamByName('D_DATE_BEG').Value := cxDateEdit_date_beg.Date;
    pFIBStoredProc_dt_add.ParamByName('D_DATE_END').Value := cxDateEdit_date_end.Date;

    if cxCheckBox_not_summa.Checked then
      pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').Value := 1
    else
      pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_FIO_DONGU').Value := cxTextEdit_ot_donnu.Text;
    pFIBStoredProc_dt_add.ParamByName('D_FIO_POSTAV').Value := cxTextEdit_ot_post.Text;
    pFIBStoredProc_dt_add.ParamByName('D_SUM_OPL').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_ID_MAN').Value := id_man;
    
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
///////////////////////////////////////////////////////////////////////
    if cxCheckBox_not_summa.Checked = false then
    begin //проверка на договор без суммы
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
    end//проверка на договор без суммы
    else
    begin
      //если договор без суммы, то удаляем все сметы под этим договором
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


procedure TfrmShablon8.cxDateEdit_dogPropertiesChange(Sender: TObject);
begin
  cxTextEdit_def_d_dog2.Text := cxDateEdit_dog.Text;
end;

procedure TfrmShablon8.CurrencyEditsum_dogChange(Sender: TObject);
begin
//
end;

procedure TfrmShablon8.cxDateEdit_date_endPropertiesChange(
  Sender: TObject);
begin
      if  cxDateEdit_date_beg.Date > cxDateEdit_date_end.Date then
        begin
          MessageDlg('Увага', errDtNotNotDEnd_DBeg, mtError, [mbOk]);
          cxDateEdit_date_end.SetFocus;
          Exit;
        end;
end;

procedure TfrmShablon8.cxGrid1DBTableView1CustomDrawCell(
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

procedure TfrmShablon8.cxCheckBox_not_summaPropertiesChange(
  Sender: TObject);
begin
  ButtonEn();
  if cxCheckBox_not_summa.Checked then
  begin
    CurrencyEditsum_dog.Visible := false;
    Label16.Visible := false;
//    CurrencyEditsum_dog.Text := '999999999,99';
    ToolButton_add.Enabled := false;
    SpeedButton_red.Enabled := false;
    ToolButton_del.Enabled := false;
    CurrencyEdit_nds.ReadOnly := true;
  end
  else
  begin
    ToolButton_add.Enabled := true;
    SpeedButton_red.Enabled := true;
    ToolButton_del.Enabled := true;
    CurrencyEdit_nds.ReadOnly := false;
    CurrencyEditsum_dog.Visible := true;
    Label16.Visible := true;
  end;
end;

procedure TfrmShablon8.cxButtonEdit_name_unPropertiesButtonClick(
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

procedure TfrmShablon8.FormShow(Sender: TObject);
  var
    Str:string;
begin
    pFIBDataSet_id_dokument.Active := false;
   Str:=pFIBDataSet_id_dokument.SQLs.SelectSQL.Text;
   pFIBDataSet_id_dokument.SQLs.SelectSQL.Text :='select dog_sel_num_urzb_by_id_dog.id_urzb as NUM_URZB from dog_sel_num_urzb_by_id_dog('+IntToStr(kod_dog)+')';
   pFIBDataSet_id_dokument.Active := true;

   if  not(pFIBDataSet_id_dokument.IsEmpty) then  Caption:=Caption+'( № Юридичного зобо'+''''+'язання '+VarToStr(pFIBDataSet_id_dokument.FBN('NUM_URZB').AsVariant)+')';
   pFIBDataSet_id_dokument.Active := false;
   pFIBDataSet_id_dokument.SQLs.SelectSQL.Text:=Str;
   
  if Priznak_vizova = 'prosmotr' then
  begin
    cxGrid1.PopupMenu := Nil;
    ToolButton_add.Enabled := False;
    SpeedButton_red.Enabled := false;
    ToolButton_del.Enabled := False;
  end;
  Height := 499;
  Width  := 498;
end;

procedure TfrmShablon8.Label22Click(Sender: TObject);
begin
  if Priznak_vizova <> 'add' then
  ShowDogPayFulfil(Self, pFIBDatabase.Handle, pFIBTransactionRead.Handle, pFIBTransactionWrite.Handle, fsNormal, id_doc, -1);
end;

procedure TfrmShablon8.ToolButton_addClick(Sender: TObject);
var
  Add: Variant;
  cnt,i: Integer;
begin
  SumToSmet();
  Add := LoadDogManedger.AddKosht(self,pFIBDatabase.Handle,summa_to_smet,1,0,0,0,0,0,Date);
      if VarArrayDimCount(Add) > 0 then
      begin
      Cnt := VarArrayHighBound(Add, 1);
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

procedure TfrmShablon8.RxMemoryData_smetAfterPost(DataSet: TDataSet);
begin
  Summa();
  ButtonEn();
end;

procedure TfrmShablon8.RxMemoryData_smetAfterDelete(DataSet: TDataSet);
begin
  Summa();
  ButtonEn();
end;

procedure TfrmShablon8.ButtonEn();
begin
{  if cxCheckBox_not_summa.Checked then
  begin
    Exit;
  end
  else
  begin
    if (CurrencyEditsum_dog.Value >= CurrencyEdit_sum_po_smet.Value) then
    ToolButton_add.Enabled := false;
  end; }
end;

procedure TfrmShablon8.ToolButton_delClick(Sender: TObject);
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
  Summa();
  id_sm := RxMemoryData_smet.FieldByName('id').Value;
  RxMemoryData_smet.Locate('id', id_sm, []);
end;

procedure TfrmShablon8.SumNds();
var
  sum_d: Currency;
  pFIBDataSet_nds_procent: TpFIBDataSet;
begin
      pFIBDataSet_nds_procent := TpFIBDataSet.Create(Self);
      pFIBDataSet_nds_procent.Database := pFIBDatabase;
      pFIBDataSet_nds_procent.Transaction := pFIBTransactionRead;
      pFIBDataSet_nds_procent.SelectSQL.Text := 'select * from pub_nds_procent_info(:d_d_dog)';
      pFIBDataSet_nds_procent.ParamByName('D_D_DOG').Value := cxDateEdit_dog.Date;
      pFIBDataSet_nds_procent.Active := true;
      sum_d := CurrencyEdit_sum_po_smet.Value;
      nds_procent := pFIBDataSet_nds_procent.FieldByName('D_NDS_PROCENT').AsVariant;
      if nds_procent<=0 then nds_procent := 20;
      sum_nds := (sum_d*nds_procent)/(100+nds_procent);
      CurrencyEdit_nds.Text := VarToStr(sum_nds);
end;

procedure TfrmShablon8.RxMemoryData_smetAfterScroll(DataSet: TDataSet);
begin
  Label27.Caption := RxMemoryData_smet.FieldByName('name_smet').AsString;
  Label28.Caption := RxMemoryData_smet.FieldByName('name_razd').AsString;
  Label29.Caption := RxMemoryData_smet.FieldByName('name_stat').AsString;
  Label31.Caption := RxMemoryData_smet.FieldByName('name_kekv').AsString;
  Label27.Hint := RxMemoryData_smet.FieldByName('name_smet').AsString;
  Label27.ShowHint := true;
  Label28.Hint := RxMemoryData_smet.FieldByName('name_razd').AsString;
  Label28.ShowHint := true;
  Label29.Hint := RxMemoryData_smet.FieldByName('name_stat').AsString;
  Label29.ShowHint := true;
  Label31.Hint := RxMemoryData_smet.FieldByName('name_kekv').AsString;
  Label31.ShowHint := true;
end;

procedure TfrmShablon8.FormResize(Sender: TObject);
begin
  Panel1.Left := Width div 2 - Panel1.Width div 2 - 6;
  Panel1.Top := Height div 2 - Panel1.Height div 2 - 18;
end;

procedure TfrmShablon8.Label21Click(Sender: TObject);
begin
  if Priznak_vizova <> 'add' then
  ShowDogPayFulfil(Self, pFIBDatabase.Handle, pFIBTransactionRead.Handle, pFIBTransactionWrite.Handle, fsNormal, id_doc, -1);
end;

procedure TfrmShablon8.Label21MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Priznak_vizova <> 'add' then
  begin
    Label21.Cursor := crHandPoint;
  end;
end;

procedure TfrmShablon8.Label22MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Priznak_vizova <> 'add' then
  begin
    Label22.Cursor := crHandPoint;
  end;
end;

procedure TfrmShablon8.cxButton_histClick(Sender: TObject);
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

procedure TfrmShablon8.addExecute(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 1 then ToolButton_addClick(Self);
end;

procedure TfrmShablon8.delExecute(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 1 then   ToolButton_delClick(Self);
end;

procedure TfrmShablon8.cxGrid1DBTableView1KeyDown(Sender: TObject;
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

procedure TfrmShablon8.saveExecute(Sender: TObject);
begin
  cxButton_okClick(Self);
end;

procedure TfrmShablon8.save1Execute(Sender: TObject);
begin
  cxButton_okClick(Self);
end;

procedure TfrmShablon8.insExecute(Sender: TObject);
begin
  ToolButton_addClick(Self);
end;

procedure TfrmShablon8.CurrencyEdit_sum_po_smetChange(Sender: TObject);
begin
  if Priznak_vizova = 'add' then
  CurrencyEditsum_dog.Value := CurrencyEdit_sum_po_smet.Value;
end;

procedure TfrmShablon8.SpeedButton_redClick(Sender: TObject);
var
  Add: Variant;
  d_dogovor: TDate;
  cnt, i: Integer;
begin
  if RxMemoryData_smet.RecordCount <= 0 then Exit;

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
      if VarArrayDimCount(Add) > 0 then
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
//          RxMemoryData_smet.FieldByName('flag_del').Value := 0;
          RxMemoryData_smet.Post;
        end;
      SumNds();
      end;
end;

procedure TfrmShablon8.SumToSmet();
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
    summa_d := CurrencyEditsum_dog.Value;

    summa_to_smet := summa_d - summa_smet;
  end;
end;

procedure TfrmShablon8.N3Click(Sender: TObject);
begin
  SpeedButton_redClick(Self);
end;

procedure TfrmShablon8.editExecute(Sender: TObject);
begin
  SpeedButton_redClick(Self);
end;

procedure TfrmShablon8.Label16MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Priznak_vizova = 'red' then
  begin
    Label16.Cursor := crHandPoint;
  end;
end;

procedure TfrmShablon8.Label16Click(Sender: TObject);
var
  Ret : VAriant;
begin
  if Priznak_vizova <> 'red' then Exit;
  Ret := LoadDogManedger.EditSum(self, 2, pFIBDataSet_id_dokument.FieldByName('d_sum_pay').AsCurrency,
                                 pFIBDataSet_id_dokument.FieldByName('d_nds_pay').AsCurrency,
                                 CurrencyEditsum_dog.Value, 0);
  if VarArrayDimCount(Ret)>0
  then begin
     if Ret[0]<>NULL
     then begin
       if Ret[0] > 0 then CurrencyEditsum_dog.Value := Ret[0];
     end;
  end;
end;

procedure TfrmShablon8.Label1Click(Sender: TObject);
var
  s       : Variant;
begin
  s := LoadDogManedger.Comment(Self, comment, Priznak_vizova);
  comment := s;  
end;

procedure TfrmShablon8.cxButtonEdit_depPropertiesButtonClick(
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

procedure TfrmShablon8.cxButton1Click(Sender: TObject);
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

  cxMemo_note_dog.Text := o['name_osn'].AsString;
  end;
  i.Free;
  o.Free;
end;

end.
