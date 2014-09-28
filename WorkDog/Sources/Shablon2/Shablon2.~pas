unit Shablon2;
{**************** ***************************************************************
* Shablon2                                                                     *
*                                                                               *
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
  GlobalSPR, ImgList, ToolWin, RxMemDS,  cxCurrencyEdit,
  FIBQuery, pFIBQuery, pFIBStoredProc, ActnList, Menus, cxTL,LoadDogManedger,
  dxBar, dxBarExtItems, DogLoaderUnit, dogLangPackUnit2, uCommonSp,AArray,LoaderUnit;

resourcestring
    errDtNotNumber = 'Номер договору не заповнен.';
    errDtNotKontragent = ' Виберіть контрагента.';
    errDtNotDonnu = 'Виберіть рахунок.';
    errDtNotNotDBeg = 'Введите начальную дату.';
    errDtNotNotDEnd = 'Введите конечную дату.';
    errDtNotNotDEnd_DBeg = 'Некорректно задан период.';   
    errNotNote = 'Необхідно ввести підставу договору.';
    errSumOtr = 'Сума повинна бути більше нуля.';
    errSumKsh = 'Неможливо додати которис: сума по договору дорівнює сумі кошторисів.';

type
  TfrmShablonTwo = class(TForm)
    Panel1: TPanel;
    WorkDatabase: TpFIBDatabase;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    DataSource_smet: TDataSource;
    pFIBStoredProc_dt_add: TpFIBStoredProc;
    pFIBDataSet_id_dokument: TpFIBDataSet;
    pFIBDataSet_tip_dog: TpFIBDataSet;
    pFIBDataSet_tip_dog_add: TpFIBDataSet;
    pFIBDataSet_tip_info: TpFIBDataSet;
    pFIBDataSet_post: TpFIBDataSet;
    ActionList: TActionList;
    add: TAction;
    del: TAction;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    LargeImages: TImageList;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton_add: TdxBarLargeButton;
    dxBarLargeButton_red: TdxBarLargeButton;
    dxBarLargeButton_prosm: TdxBarLargeButton;
    dxBarLargeButton_del: TdxBarLargeButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label13: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cxButtonEdit_name_p: TcxButtonEdit;
    cxTextEdit_mfo_p: TcxTextEdit;
    cxTextEdit_rsch_p: TcxTextEdit;
    cxTextEdit_bank_p: TcxTextEdit;
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
    cxDateEdit_dog: TcxDateEdit;
    cxTextEdit_reg_n: TcxTextEdit;
    cxMemo_note_dog: TcxMemo;
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
    GroupBox9: TGroupBox;
    Label14: TLabel;
    Label20: TLabel;
    cxDateEdit_nomn_d: TcxDateEdit;
    GroupBox10: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    CurrencyEdit_summa_pay: TCurrencyEdit;
    CurrencyEdit_sum_fulfil: TCurrencyEdit;
    TabSheet3: TTabSheet;
    GroupBox12: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    cxTextEdit_def_n_dog3: TcxTextEdit;
    cxTextEdit_def_d_dog3: TcxTextEdit;
    cxTextEdit_reg_n3: TcxTextEdit;
    cxCurrencyEdit_def_sum: TcxCurrencyEdit;
    GroupBox14: TGroupBox;
    Label29: TLabel;
    cxTextEdit_n_cust: TcxTextEdit;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn_note: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn_sum_smet: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn_vipolneno: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn_oplacheno: TcxGridDBColumn;
    flag_del: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Label31: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    dxBarDockControl1: TdxBarDockControl;
    cxButton_cancel: TcxButton;
    cxButton_ok: TcxButton;
    cxTextEdit_dop_cust: TcxTextEdit;
    Label23: TLabel;
    view: TAction;
    edit: TAction;
    cxButton_hist: TcxButton;
    DataSetHistory: TpFIBDataSet;
    DataSetHistSmet: TpFIBDataSet;
    save: TAction;
    save1: TAction;
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
    dxBarLargeButton_upd: TdxBarLargeButton;
    cxCheckBox_continue: TcxCheckBox;
    cxCheckBox_is_project: TcxCheckBox;
    upd: TAction;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    cxDateEdit_date_beg: TcxDateEdit;
    cxDateEdit_date_end: TcxDateEdit;
    pFIBDataSet_smets: TpFIBDataSet;
    Label1: TLabel;
    Label5: TLabel;
    cxButtonEdit_otd: TcxButtonEdit;
    cxTextEdit_nomn: TcxTextEdit;
    DatasetCheck: TpFIBDataSet;
    TransactionCheck: TpFIBTransaction;
    cxButton1: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButtonEdit_name_pPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit_name_pPropertiesChange(Sender: TObject);
    procedure cxMaskEdit_n_dogPropertiesChange(Sender: TObject);
    procedure cxButton_okClick(Sender: TObject);
    procedure cxDateEdit_dogPropertiesChange(Sender: TObject);
    procedure CurrencyEditsum_dogChange(Sender: TObject);
    procedure cxDateEdit_date_endPropertiesChange(Sender: TObject);
    procedure cxTextEdit_mfo_pPropertiesChange(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxCheckBox_not_summaPropertiesChange(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure dxBarLargeButton_addClick(Sender: TObject);
    procedure dxBarLargeButton_redClick(Sender: TObject);
    procedure dxBarLargeButton_prosmClick(Sender: TObject);
    procedure cxButtonEdit_name_unPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure CurrencyEditsum_dogExit(Sender: TObject);
    procedure Label22Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Label21Click(Sender: TObject);
    procedure Label21MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label22MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label22MouseLeave(Sender: TObject);
    procedure viewExecute(Sender: TObject);
    procedure editExecute(Sender: TObject);
    procedure addExecute(Sender: TObject);
    procedure cxButton_histClick(Sender: TObject);
    procedure saveExecute(Sender: TObject);
    procedure save1Execute(Sender: TObject);
    procedure dxBarLargeButton_updClick(Sender: TObject);
    procedure dxBarLargeButton_delClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure updExecute(Sender: TObject);
    procedure cxCheckBox_is_projectPropertiesChange(Sender: TObject);
    procedure pFIBDataSet_smetsAfterScroll(DataSet: TDataSet);
    procedure N2Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure cxButtonEdit_depPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);

    procedure cxButton1Click(Sender: TObject);
  private
  fProc : TResProc;
  procedure SelectAll();
    { Private declarations }
  public
    id_p, name_p, id_smeta, id_doc: Variant;
    rate_acc_p, rate_acc_un: Variant; //идентификаторы счетов контрагента и ДонНУ
    Priznak_vizova: String;
    id_dog, kod_dog: int64;
    comment : String;
    id_otdel: Integer;
    ID_DOG_GLOBAL:int64;
      flag :Boolean;
      isNewDogExist :Boolean;
    Old_sum_dog:String;// Переменная для хранения значения CurrencyEditsum_dog при изменении с договора без суммы и наоборот.
    procedure ResProc(id : integer; Action : TResAction);
    constructor Create (Aowner:TComponent;DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_dokument: Variant; Pr_vizova: String; Id_t_d: Variant; data : PShablonInputData = nil); reintroduce;
    { Public declarations }
  end;

function LoadShablon(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle;id_dokument: Variant;
                 Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;stdcall;
exports LoadShablon;

var
  frmShablonTwo: TfrmShablonTwo;

implementation
uses
  Registry, Math, Accmgmt;
{$R *.dfm}

constructor TfrmShablonTwo.Create (Aowner:TComponent;DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_dokument: Variant; Pr_vizova: String; Id_t_d: Variant; data : PShablonInputData = nil);
var
  DataSetCust: TpFIBDataSet;
  t, o : TSpravParams;
  var  Y, M, D: Word;
     dt: TDateTime;

begin
  inherited Create (Aowner);
  WorkDatabase.Handle := DBHANDLE;
  if TForm(Aowner).FormStyle = fsNormal then frmStyle := fsNormal else  FormStyle := frmStyle;
//  FormStyle := frmStyle;
  FormStyle := frmStyle;
  Priznak_vizova := Pr_vizova;
  kod_dog:=id_dokument;
  TabSheet1.Caption := 'Основні дані';
  TabSheet2.Caption := 'Додаткова інформація';
  TabSheet3.Caption := 'Кошториси';


   if fibCheckPermission('/ROOT/DOG/TIP_DOG/KOSHT', 'Add') <> 0 then dxBarLargeButton_add.Enabled := false;
   if fibCheckPermission('/ROOT/DOG/TIP_DOG/KOSHT', 'Del') <> 0 then dxBarLargeButton_del.Enabled := false;
   if fibCheckPermission('/ROOT/DOG/TIP_DOG/KOSHT', 'Edit') <> 0 then dxBarLargeButton_red.Enabled := false;

  ID_DOG_GLOBAL     := id_dokument;
  if Pr_vizova = 'red' then
      begin
        kod_dog := id_dokument; //позиционирование

        pFIBDataSet_tip_dog.Active := false;
        pFIBDataSet_tip_dog.ParamByName('param_document').AsInt64 := kod_dog;
        pFIBDataSet_tip_dog.Active := true;

        pFIBDataSet_post.Active := false;
        pFIBDataSet_post.Active := true;
        pFIBDataSet_id_dokument.Active := false;
        pFIBDataSet_id_dokument.ParamByName('D_ID_DOCUMENT').AsInt64 :=kod_dog;
        pFIBDataSet_id_dokument.Active := true;

        pFIBDataSet_smets.Active := false;
        pFIBDataSet_smets.ParamByName('param').AsInt64 :=kod_dog;
        pFIBDataSet_smets.Active := true;

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
        cxCheckBox_continue.Checked := pFIBDataSet_id_dokument.FieldByName('d_continue').AsBoolean;
        cxCheckBox_not_summa.Checked := pFIBDataSet_id_dokument.FieldByName('d_not_summa').AsBoolean;
        cxTextEdit_nomn.Text := pFIBDataSet_id_dokument.FieldByName('d_nomn_dog').AsString;
        CurrencyEdit_summa_pay.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_pay').AsString;
        CurrencyEdit_sum_fulfil.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_fulfil').AsString;

        if pFIBDataSet_id_dokument.FieldByName('d_nomd_dog').AsDateTime = 0 then
        cxDateEdit_nomn_d.Text := '' else
        cxDateEdit_nomn_d.Date := pFIBDataSet_id_dokument.FieldByName('d_nomd_dog').AsDateTime;

        cxTextEdit_reg_n.Text  := pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString;
        cxTextEdit_reg_n2.Text := pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString;
        cxTextEdit_reg_n3.Text := pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString;

         //Данные по типу договора
        pFIBDataSet_tip_dog_add.Active := false;
        pFIBDataSet_tip_dog_add.ParamByName('pram_id_tip_dog').Value := id_t_d;
        pFIBDataSet_tip_dog_add.Active := true;

        Caption := 'Редагування'+' '+pFIBDataSet_tip_dog.FieldByName('SHORT_NAME').AsString+' '+
        '('+pFIBDataSet_tip_dog.FieldByName('tip_dog').AsString+')';

        //----------------------------------------------------------------------
        DatasetCheck.Close;
        DatasetCheck.SQLs.SelectSQL.Text:='select * from dog_dt_document where ID_DOG='+VarToStr(self.kod_dog)+' with lock';
        DatasetCheck.Transaction.StartTransaction;
        try
         DatasetCheck.Open;
        except
         DatasetCheck.Transaction.Rollback;
         DatasetCheck.Close;
         ShowMessage('Договір заблоковано іншим користувачем, редагування неможливе.');
         exit;
        end;
        //----------------------------------------------------------------------

        //Данные по контрагенту
        rate_acc_p := pFIBDataSet_id_dokument.FieldByName('D_ID_RATE_ACCOUNT').AsVariant;
        cxButtonEdit_name_p.Text := pFIBDataSet_id_dokument.FieldByName('d_name_customer_k').AsString;
        cxTextEdit_mfo_p.Text := pFIBDataSet_id_dokument.FieldByName('D_MFO_K').AsString;
        cxTextEdit_bank_p.Text := pFIBDataSet_id_dokument.FieldByName('D_BANK_NAME_K').AsString;
        cxTextEdit_rsch_p.Text := pFIBDataSet_id_dokument.FieldByName('D_RSCH_K').AsString;
        id_p := pFIBDataSet_id_dokument.FieldByName('D_ID_CUSTOMER').AsVariant;
        name_p := pFIBDataSet_id_dokument.FieldByName('D_NAME_CUSTOMER_K').AsString;

        //Данные по native//
        cxButtonEdit_name_un.Text := pFIBDataSet_id_dokument.FieldByName('D_NAME_CUSTOMER_N').AsString;
        cxTextEdit_mfo_un.Text := pFIBDataSet_id_dokument.FieldByName('D_MFO_N').AsString;
        cxTextEdit_bank_un.Text := pFIBDataSet_id_dokument.FieldByName('D_BANK_NAME_N').AsString;
        cxTextEdit_rsch_un.Text := pFIBDataSet_id_dokument.FieldByName('D_RSCH_N').AsString;

        rate_acc_un := pFIBDataSet_id_dokument.FieldByName('D_ID_RATE_ACC_NATIVE').AsVariant;
        if pFIBDataSet_id_dokument.FBN('d_is_project').Value = 1 then
        begin
          cxCheckBox_is_project.Checked := true;
          cxCheckBox_is_project.Style.Color := clRed;
        end
        else
        begin
          cxCheckBox_is_project.Checked := false;
          cxCheckBox_is_project.Style.Color := clBtnFace;
        end;
      end
      else

////////////////////////////////////////////////////////////////////////////////////////
       //-----------------------------------------------------------------------
        pFIBDataSet_tip_dog_add.Active := false;
        pFIBDataSet_tip_dog_add.ParamByName('pram_id_tip_dog').Value := Id_t_d;
        pFIBDataSet_tip_dog_add.Active := true;
       //-----------------------------------------------------------------------
      if Pr_vizova = 'add' then
      begin
        TabSheet3.Visible := false;

        pFIBDataSet_post.Active := false;
        pFIBDataSet_post.Active := true;
        pFIBDataSet_tip_dog_add.Active := false;
        pFIBDataSet_tip_dog_add.Active := true;

        pFIBDataSet_id_dokument.Active := false;
        pFIBDataSet_id_dokument.Active := true;

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
     cxMemo_note_dog.Text := data^.note else
     cxMemo_note_dog.Text := pFIBDataSet_tip_info.FieldByName('DEF_NOTE').AsString;

     if data^.id_rate_account > 0 then
     begin
       rate_acc_p := data^.id_rate_account;
       DataSetCust := TpFIBDataSet.Create(Self);
       DataSetCust.Database := WorkDatabase;
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
       DataSetCust.Database := WorkDatabase;
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
     cxMemo_note_dog.Text := pFIBDataSet_tip_info.FieldByName('DEF_NOTE').AsString;
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
    t := dogLoaderUnit.TSpravParams.Create;
    o := dogLoaderUnit.TSpravParams.Create;
    t['DataBase']     := Integer(WorkDatabase.Handle);
    t['FormStyle']    := fsNormal;
    t['bMultiSelect'] := false;
    t['id_session']   := -1;
    t['SelectMode']   := selRateAccount;
    t['show_all']   := 1;
    dogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self,t, o);
    if o['ModalResult'] = mrOk then
    begin
        id_p := o['ID_CUSTOMER'];
        rate_acc_p := o['ID_RATE_ACCOUNT'];
        cxTextEdit_rsch_p.Text := o['RATE_ACCOUNT'];
        cxTextEdit_mfo_p.Text := o['MFO'];
        cxTextEdit_bank_p.Text := o['NAME_BANK'];
        pFIBDataSet_post.Active := false;
        pFIBDataSet_post.ParamByName('param_cust').Value := id_p;
        pFIBDataSet_post.Active := true;
        name_p := pFIBDataSet_post.FieldByName('name_customer').AsString;
        cxButtonEdit_name_p.Text := name_p;
    end;
    t.Free;
    o.Free;  
  end;

{ if (rate_acc_p=Null) then
  begin
    id_p := -1;
    rate_acc_p := -1;
    post := ShowCustomers(Self, WorkDatabase.Handle, fsNormal, Date, csmRateAcc,id_p,rate_acc_p);

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
  end;}
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

        cxTextEdit_ot_donnu.Text := pFIBDataSet_id_dokument.FieldByName('D_FIO_DONNU_DEF').AsString;

        cxTextEdit_reg_n.Visible := false;
        Label4.Visible := false;
        cxTextEdit_reg_n2.Visible := false;
        Label19.Visible := false;
        cxTextEdit_reg_n3.Visible := false;
        Label27.Visible := false;
        cxDateEdit_date_beg.Date := Date;
        DecodeDate(Date, Y, M, D);
        dt := EncodeDate(Y,12,31);

        cxDateEdit_date_end.Date := dt;



           //Тип договора в верху формы
        pFIBDataSet_tip_dog_add.Active := false;
        pFIBDataSet_tip_dog_add.ParamByName('pram_id_tip_dog').Value := id_t_d;
        pFIBDataSet_tip_dog_add.Active := true;

         Caption := 'Додання'+' '+pFIBDataSet_tip_dog_add.FieldByName('short_name').AsString+' '+
        '('+pFIBDataSet_tip_dog_add.FieldByName('tip_dog').AsString+')';

        id_doc := id_dokument;

        dxBarLargeButton_add.Enabled   := True;
        dxBarLargeButton_prosm.Enabled := True;
        dxBarLargeButton_red.Enabled   := True;
        dxBarLargeButton_del.Enabled   := True;
        dxBarLargeButton_upd.Enabled   := True;
        if pFIBDataSet_id_dokument.FBN('d_is_project').Value = 1 then

        cxCheckBox_is_project.Checked := true;
        cxCheckBox_is_project.Style.Color := clRed;
      end
      else
/////////////////////Просмотр документа//////////////////////////
      if Pr_vizova = 'prosmotr' then
      begin
        kod_dog:=id_dokument;
        pFIBDataSet_tip_dog.Active := false;
        pFIBDataSet_tip_dog.ParamByName('param_document').AsInt64 := kod_dog;
        pFIBDataSet_tip_dog.Active := true;

        kod_dog := id_dokument; //позиционирование

        pFIBDataSet_post.Active := false;
        pFIBDataSet_post.Active := true;
        pFIBDataSet_id_dokument.Active := false;
        pFIBDataSet_id_dokument.ParamByName('D_ID_DOCUMENT').AsInt64 := kod_dog;
        pFIBDataSet_id_dokument.Active := true;

        cxButtonEdit_otd.Text := pFIBDataSet_id_dokument.FBN('OTDEL_NAME_FULL').AsString;

        if  not VarIsNull(pFIBDataSet_id_dokument.FBN('d_comment').AsVariant) then
        comment := pFIBDataSet_id_dokument.FBN('d_comment').asstring else
        comment := '';

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
        cxTextEdit_nomn.Text := pFIBDataSet_id_dokument.FieldByName('d_nomn_dog').AsString;
        cxDateEdit_nomn_d.Text := pFIBDataSet_id_dokument.FieldByName('d_nomd_dog').AsString;
        cxCheckBox_continue.Checked := pFIBDataSet_id_dokument.FieldByName('d_continue').AsBoolean;
        cxCheckBox_not_summa.Checked := pFIBDataSet_id_dokument.FieldByName('d_not_summa').AsBoolean;
        CurrencyEdit_summa_pay.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_pay').AsString;
        CurrencyEdit_sum_fulfil.Text := pFIBDataSet_id_dokument.FieldByName('d_sum_fulfil').AsString;

        if pFIBDataSet_id_dokument.FieldByName('d_nomd_dog').AsDateTime = 0 then
        cxDateEdit_nomn_d.Text := '' else
        cxDateEdit_nomn_d.Date := pFIBDataSet_id_dokument.FieldByName('d_nomd_dog').AsDateTime;

        cxTextEdit_nomn.Text := pFIBDataSet_id_dokument.FieldByName('d_nomn_dog').AsString;

        cxTextEdit_reg_n.Text  := pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString;
        cxTextEdit_reg_n2.Text := pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString;
        cxTextEdit_reg_n3.Text := pFIBDataSet_id_dokument.FieldByName('d_reg_nomer').AsString;

         //Данные по типу договора
        pFIBDataSet_tip_dog_add.Active := false;
        pFIBDataSet_tip_dog_add.ParamByName('pram_id_tip_dog').Value := id_t_d;
        pFIBDataSet_tip_dog_add.Active := true;

        //Данные по контрагенту
        rate_acc_p := pFIBDataSet_id_dokument.FieldByName('D_ID_RATE_ACCOUNT').AsVariant;
        cxButtonEdit_name_p.Text := pFIBDataSet_id_dokument.FieldByName('d_name_customer_k').AsString;
        cxTextEdit_mfo_p.Text := pFIBDataSet_id_dokument.FieldByName('D_MFO_K').AsString;
        cxTextEdit_bank_p.Text := pFIBDataSet_id_dokument.FieldByName('D_BANK_NAME_K').AsString;
        cxTextEdit_rsch_p.Text := pFIBDataSet_id_dokument.FieldByName('D_RSCH_K').AsString;

        //Данные по native
        cxButtonEdit_name_un.Text := pFIBDataSet_id_dokument.FieldByName('D_NAME_CUSTOMER_N').AsString;
        cxTextEdit_mfo_un.Text := pFIBDataSet_id_dokument.FieldByName('D_MFO_N').AsString;
        cxTextEdit_bank_un.Text := pFIBDataSet_id_dokument.FieldByName('D_BANK_NAME_N').AsString;
        cxTextEdit_rsch_un.Text := pFIBDataSet_id_dokument.FieldByName('D_RSCH_N').AsString;
        rate_acc_un := pFIBDataSet_id_dokument.FieldByName('D_ID_RATE_ACC_NATIVE').AsVariant;

        pFIBDataSet_smets.Active := false;
        pFIBDataSet_smets.ParamByName('param').Value := id_dokument;
        pFIBDataSet_smets.Active := true;

        Caption := 'Перегляд'+' '+pFIBDataSet_tip_dog.FieldByName('short_name').AsString+' '+
        '('+pFIBDataSet_tip_dog.FieldByName('tip_dog').AsString+')';

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
        cxCheckBox_continue.Properties.ReadOnly := true;
        cxCheckBox_not_summa.Properties.ReadOnly := true;
        cxTextEdit_nomn.Properties.ReadOnly := true;
        cxDateEdit_nomn_d.Properties.ReadOnly := true;
        if pFIBDataSet_id_dokument.FBN('d_is_project').Value = 1 then
        begin
          cxCheckBox_is_project.Checked := true;
          cxCheckBox_is_project.Style.Color := clRed;
        end
        else
        begin
          cxCheckBox_is_project.Checked := false;
          cxCheckBox_is_project.Style.Color := clBtnFace;
        end;
      end
      else
/////////////////////////история изменений////////////////
      if Pr_vizova = 'hist' then
      begin
        {inherited Create (Aowner);
        FormStyle := frmStyle;
        WorkDatabase.Handle := DBHANDLE;}
        kod_dog:=id_dokument;
        DataSetHistory.Active := false;
        DataSetHistory.ParamByName('id_history').AsInt64 := kod_dog;
        DataSetHistory.Active := true;

        if  not VarIsNull(DataSetHistory.FBN('d_comment').AsVariant) then
        comment := DataSetHistory.FBN('d_comment').asstring else
        comment := '';

        cxButtonEdit_otd.Text := DataSetHistory.FBN('OTDEL_NAME_FULL').AsString;

        cxMaskEdit_n_dog.Text := DataSetHistory.FieldByName('d_n_dog').AsString;
        cxDateEdit_dog.Date := DataSetHistory.FieldByName('d_d_dog').AsDateTime;
        CurrencyEditsum_dog.Text := DataSetHistory.FieldByName('d_summa').AsString;
        cxMemo_note_dog.Text := DataSetHistory.FieldByName('d_dog_note').AsString;
        cxTextEdit_reg_n.Text := DataSetHistory.FieldByName('d_reg_nomer').AsString;
        cxTextEdit_reg_n2.Text := DataSetHistory.FieldByName('d_reg_nomer').AsString;
        cxTextEdit_reg_n3.Text := DataSetHistory.FieldByName('d_reg_nomer').AsString;
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

        pFIBDataSet_smets.Active := false;
        pFIBDataSet_smets.ParamByName('param').Value := id_dokument;
        pFIBDataSet_smets.Active := true;

        Caption := 'Історія зміни'+' '+DataSetHistory.FieldByName('short_name').AsString+' '+
       '('+DataSetHistory.FieldByName('tip_dog').AsString+')' + ' за '+ DataSetHistory.FieldByName('time_edit').AsString + ' ( '+
       DataSetHistory.FieldByName('Fio').AsString + ' )';

        cxButton_ok.Visible := false;
        cxMaskEdit_n_dog.Enabled := false;
        cxDateEdit_dog.Enabled := false;
        cxMemo_note_dog.Enabled := false;
        dxBarLargeButton_add.Enabled := false;
        dxBarLargeButton_del.Enabled := false;
        dxBarLargeButton_red.Enabled := False;
        GroupBox2.Enabled := false;
        GroupBox3.Enabled := false;
        cxButton_hist.Visible := false;
        if DataSetHistory.FBN('d_is_project').Value = 1 then
        begin
          cxCheckBox_is_project.Checked := true;
          cxCheckBox_is_project.Style.Color := clRed;
        end
        else
        begin
          cxCheckBox_is_project.Checked := false;
          cxCheckBox_is_project.Style.Color := clBtnFace;
        end;
      end;
  if Pr_vizova <> 'hist' then if pFIBDataSet_id_dokument.FBN('sys_is_project').Value<>1 then
  begin
    cxCheckBox_is_project.Checked := false;
    cxCheckBox_is_project.Style.Color := clBtnFace;
    cxCheckBox_is_project.Visible := false;
  end;

end;

function LoadShablon(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle;id_dokument: Variant;
                 Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;
var
  sh1: TfrmShablonTwo;
begin
  sh1 := TfrmShablonTwo.Create(AOwner,DBHANDLE,frmStyle,id_dokument,Pr_vizova,id_t_d, data);
  if sh1.Flag then
  begin
    sh1.free;
    Exit;
  end;
  sh1.fProc := proc;
end;


procedure TfrmShablonTwo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmShablonTwo.FormCreate(Sender: TObject);
var
  reg       : TRegistry;
  DataSetOtd: TpFIBDataSet;
begin
  isNewDogExist:=False;
  pFIBDataSet_post.Active := false;
  pFIBDataSet_post.Active := true;
  pFIBDataSet_id_dokument.Active := false;
  pFIBDataSet_id_dokument.Active := true;
  pFIBDataSet_tip_dog.Active := false;
  pFIBDataSet_tip_dog.Active := true;
  pFIBDataSet_tip_dog_add.Active := false;
  pFIBDataSet_tip_dog_add.Active := true;
  pFIBDataSet_tip_info.Active := false;
  pFIBDataSet_tip_info.Active := true;

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
      DataSetOtd.Database    := WorkDatabase;
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
      DataSetOtd.Database    := WorkDatabase;
      DataSetOtd.Transaction := pFIBTransactionRead;
      DataSetOtd.SQLs.SelectSQL.Text := 'select d.*, s.local_department from ini_asup_consts s, sp_department d where  s.local_department=d.id_department AND ''NOW'' BETWEEN d.Use_Beg AND d.Use_End';
      DataSetOtd.Open;
      cxButtonEdit_otd.Text := DataSetOtd.FBN('name_full').AsString;
      id_otdel := DataSetOtd.FBN('id_department').AsInteger;
      DataSetOtd.Close;
      DataSetOtd.Free;
    end;
  end;

 {/ Label22.Caption                           := rsh_Vipol;
  Label21.Caption                           := rsh_Opl;}
end;

procedure TfrmShablonTwo.cxButton_cancelClick(Sender: TObject);
begin


  if Priznak_vizova = 'add' then
  begin
   
  end;

  Close;
end;

procedure TfrmShablonTwo.cxButtonEdit_name_pPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  //post: Variant;
  i, o : TSpravParams;
begin
if Priznak_vizova = 'prosmotr'  then Exit
else
begin
    if VarIsClear(id_p) then id_p := -1;
    if VarIsClear(rate_acc_p) then rate_acc_p := -1;

    i := dogLoaderUnit.TSpravParams.Create;
    o := dogLoaderUnit.TSpravParams.Create;
    i['DataBase']     := Integer(WorkDatabase.Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := selRateAccount;
    i['id_customer']   := id_p;
    i['id_rate_account']   := rate_acc_p;
    i['show_all']   := 1;
    dogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
    begin
        id_p := o['ID_CUSTOMER'];
        rate_acc_p := o['ID_RATE_ACCOUNT'];
        cxTextEdit_rsch_p.Text := o['RATE_ACCOUNT'];
        cxTextEdit_mfo_p.Text := o['MFO'];
        cxTextEdit_bank_p.Text := o['NAME_BANK'];
        pFIBDataSet_post.Active := false;
        pFIBDataSet_post.ParamByName('param_cust').Value := id_p;
        pFIBDataSet_post.Active := true;
        name_p := pFIBDataSet_post.FieldByName('name_customer').AsString;
        cxButtonEdit_name_p.Text := name_p;
    end;
    i.Free;
    o.Free;  

{  post := ShowCustomers(Self, WorkDatabase.Handle,fsNormal,Date,csmRateAcc,id_p,rate_acc_p);
  if VarArrayDimCount(post)>0 then
  begin
    if post[0]>0 then
        begin
          id_p := post[0];  // Идентификатор контрагента
          rate_acc_p := post[1];            //Идентификатор счета контрагента
          cxTextEdit_rsch_p.Text := post[2];
          cxTextEdit_mfo_p.Text := post[5];
          cxTextEdit_bank_p.Text := post[6];
          pFIBDataSet_post.Active := false;
          pFIBDataSet_post.ParamByName('param_cust').Value := id_p;
          pFIBDataSet_post.Active := true;
          name_p := pFIBDataSet_post.FieldByName('name_customer').AsString;
          cxButtonEdit_name_p.Text := name_p;
        end;
  end; }
 end;
end;

procedure TfrmShablonTwo.cxButtonEdit_name_pPropertiesChange(
  Sender: TObject);
begin
//  cxTextEdit_dop_cust.Text:=pFIBDataSet_post.FieldByName('name_customer').AsString;
//  cxTextEdit_n_cust.Text:=pFIBDataSet_post.FieldByName('name_customer').AsString;
end;

procedure TfrmShablonTwo.cxMaskEdit_n_dogPropertiesChange(Sender: TObject);
begin
  cxTextEdit_def_n_dog2.Text := cxMaskEdit_n_dog.Text;
  cxTextEdit_def_n_dog3.Text := cxMaskEdit_n_dog.Text;
end;

procedure TfrmShablonTwo.cxButton_okClick(Sender: TObject);
var
//  i,j: Integer;
  action : TResAction;
  DataSet_rate: TpFIBDataSet;
  s: String;
  reg : TRegistry;
  Sum :Currency;
  k:Integer;
  d: Boolean;
begin
  if (isNewDogExist)then action:=raAdd else
   action := raView ;

   if Priznak_vizova = 'red' then
   begin
    if DatasetCheck.Active then DatasetCheck.Transaction.Commit;
    DatasetCheck.Close;
   end ;
   //-------------------- Проверка суммы договораи смет на коректность ---------
      Sum:=0;

      for k:=0 to cxGrid1DBTableView1.DataController.RecordCount-1 do
      begin
       Sum:=Sum+cxGrid1DBTableView1.DataController.Values[k,1];
      end;

     if cxCheckBox_not_summa.Checked then CurrencyEditsum_dog.Text:='999999999,99';
       if not (RoundTo(100*(StrToFloat(CurrencyEditsum_dog.Text)),0) >= Roundto(Sum*100,0) )then
       begin
         ShowMessage('Сума договору не дорівнює сумі кошторисів');
         CurrencyEditsum_dog.Text:=FloatTostr(Sum);
         Exit;
       end;
   //---------------------------------------------------------------------------

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
     DataSet_rate.Database := WorkDatabase;
     DataSet_rate.Transaction := pFIBTransactionRead;
     s := 'SELECT date_beg, date_end FROM   pub_sp_cust_rate_acc WHERE  id_rate_account=:param_id';
     DataSet_rate.Active := false;
     DataSet_rate.SQLs.SelectSQL.Add(s);
     DataSet_rate.ParamByName('param_id').Value := rate_acc_p;
     DataSet_rate.Active := true;

     if (Date < DataSet_rate.FieldByName('date_beg').AsDateTime)
     or (DataSet_rate.FieldByName('date_end').AsDateTime < Date) then
     ShowMessage('Счет контрагента не функционирует в данном периоде');
     DataSet_rate.Free;

(*     //сумма не должна превышать сумму по кошторисам
    if (CurrencyEditsum_dog.Value < CurrencyEdit_sum_po_smet.Value) then
    begin
      if  cxCheckBox_not_summa.Checked then
        begin
          //
        end
        else
        begin
          ShowMessage('Сума договору не може бути менш ніж сума заявлених кошторисів');
          CurrencyEditsum_dog.Value := CurrencyEdit_sum_po_smet.Value;
          cxCurrencyEdit_def_sum.Text := CurrencyEditsum_dog.Text;
          Exit;
        end;
    end;
    *)

         // проверка на заполнение номера договора
    if  Trim(cxMaskEdit_n_dog.Text) = '' then
        begin
        MessageDlg('Увага', errDtNotNumber, mtError, [mbOk]);
        PageControl1.ActivePageIndex:=0;
        cxMaskEdit_n_dog.SetFocus;
        Exit;
    end;


         // проверка на заполнение основания
    if  Trim(cxMemo_note_dog.Text)='' then
        begin
        MessageDlg('Увага', errNotNote, mtError, [mbOk]);
        PageControl1.ActivePageIndex:=0;
        cxMemo_note_dog.SetFocus;
        Exit;
    end;


         /// проверка на заполнение контрагента
    if  Trim(cxButtonEdit_name_p.Text)='' then
        begin
        MessageDlg('Увага', errDtNotKontragent, mtError, [mbOk]);
        PageControl1.ActivePageIndex:=0;
        cxButtonEdit_name_p.SetFocus;
        Exit;
    end;

         // проверка на заполнение счета ДонНУ
    if  Trim(cxButtonEdit_name_un.Text)='' then
        begin
        MessageDlg('Увага', errDtNotDonnu, mtError, [mbOk]);
        PageControl1.ActivePageIndex:=0;
        cxButtonEdit_name_un.SetFocus;
        Exit;
    end;

         // проверка на заполнение даты
    if  Trim(cxDateEdit_date_beg.Text)='' then
        begin
          MessageDlg('Увага', errDtNotNotDBeg, mtError, [mbOk]);
          PageControl1.ActivePageIndex:=0;
          cxDateEdit_date_beg.SetFocus;
          Exit;
        end;

        // проверка на заполнение даты
    if  Trim(cxDateEdit_date_end.Text)='' then
        begin
          MessageDlg('Увага', errDtNotNotDEnd, mtError, [mbOk]);
          PageControl1.ActivePageIndex:=0;
          cxDateEdit_date_end.SetFocus;
          Exit;
          end;

        // проверка на корректность даты
    if  cxDateEdit_date_beg.Date>cxDateEdit_date_end.Date then
        begin
          MessageDlg('Увага', errDtNotNotDEnd_DBeg, mtError, [mbOk]);
          PageControl1.ActivePageIndex:=0;
          cxDateEdit_date_beg.SetFocus;
          Exit;
        end;

if (Priznak_vizova = 'add')  then
begin

   if (ID_DOG_GLOBAL=0) then
   begin
    action := raAdd;

//    pFIBStoredProc_dt_add.Database := pFIBDatabase;
//    pFIBStoredProc_dt_add.Transaction := pFIBTransactionWrite;
//    pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
    pFIBTransactionWrite.StartTransaction;
    pFIBStoredProc_dt_add.StoredProcName := 'DOG_DT_DOCUMENT_INSERT';
    pFIBStoredProc_dt_add.Prepare;
    //

    //

    pFIBStoredProc_dt_add.ParamByName('D_ID_TIP_DOG').Value := pFIBDataSet_tip_dog_add.fieldByName('id_tip_dog').AsVariant;

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
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACCOUNT').Value := rate_acc_p;
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
    if cxCheckBox_continue.Checked then
      pFIBStoredProc_dt_add.ParamByName('D_CONTINUE').Value := 1
    else
      pFIBStoredProc_dt_add.ParamByName('D_CONTINUE').Value := 0;

    if cxCheckBox_not_summa.Checked then
      begin
        pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').Value := 1;
        pFIBStoredProc_dt_add.ParamByName('D_SUMMA').Value := '999999999,99';
      end
    else
      begin
        pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').Value := 0;
      end;
    pFIBStoredProc_dt_add.ParamByName('D_FIO_DONGU').Value := cxTextEdit_ot_donnu.Text;
    if Trim(cxTextEdit_ot_post.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_FIO_POSTAV').Value := '' else
    pFIBStoredProc_dt_add.ParamByName('D_FIO_POSTAV').Value := cxTextEdit_ot_post.Text;

    pFIBDataSet_post.Active := true;
    pFIBStoredProc_dt_add.ParamByName('D_ID_CUSTOMER').Value := id_p;
    pFIBStoredProc_dt_add.ParamByName('D_NAME_CUSTOMER').Value := name_p;

    pFIBDataSet_tip_dog_add.Active := true;
    pFIBStoredProc_dt_add.ParamByName('D_ID_TIP_DOG').Value := pFIBDataSet_tip_dog_add.fieldByName('id_tip_dog').AsVariant;
    pFIBStoredProc_dt_add.ParamByName('D_SUM_OPL').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('d_sum_pay').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_SUM_FULFIL').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_NDS_PAY').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_NDS_SUM').Value := 0;
    if cxCheckBox_is_project.Checked then
      pFIBStoredProc_dt_add.ParamByName('D_is_project').Value := 1
    else
      pFIBStoredProc_dt_add.ParamByName('D_is_project').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_COMMENT').Value := comment;
    pFIBStoredProc_dt_add.ParamByName('D_ID_OTDEL').Value := id_otdel;

    pFIBStoredProc_dt_add.ParamByName('D_ID_USER').Value := SYS_ID_USER;
    pFIBStoredProc_dt_add.ParamByName('D_IP_COMP').Value := GetIPAddress;
    pFIBStoredProc_dt_add.ParamByName('D_NAME_COMP').Value := GetCompName;

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
          pFIBTransactionWrite.Commit;
         Close;
   end;
  end

   else

/////////////////////////////////////////Редактирование шаблона 2//////////////////////////////////////////////
    begin

       if ID_DOG_GLOBAL<>0 then id_doc := ID_DOG_GLOBAL ;

            action := raEdit;
            pFIBTransactionWrite.StartTransaction;
            pFIBStoredProc_dt_add.StoredProcName := 'DOG_DT_DOCUMENT_UPDATE';
            pFIBStoredProc_dt_add.Prepare;
            pFIBStoredProc_dt_add.ParamByName('D_ID_DOG').AsInt64 := id_doc;
            pFIBStoredProc_dt_add.ParamByName('D_N_DOG').AsString := cxMaskEdit_n_dog.Text;
            pFIBStoredProc_dt_add.ParamByName('D_D_DOG').AsDate := cxDateEdit_dog.Date;

            if Trim(CurrencyEditsum_dog.Text) = '' then
            pFIBStoredProc_dt_add.ParamByName('D_SUMMA').AsCurrency := 0 else
            pFIBStoredProc_dt_add.ParamByName('D_SUMMA').AsCurrency := StrToFloat(CurrencyEditsum_dog.Text);

            if cxCheckBox_not_summa.Checked then
              begin
                pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').AsInteger := 1;
                pFIBStoredProc_dt_add.ParamByName('D_SUMMA').AsCurrency := 999999999.99;
              end
            else
              begin
                pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').AsInteger := 0;
              end;

            pFIBStoredProc_dt_add.ParamByName('D_DOG_NOTE').AsString := Trim(cxMemo_note_dog.Text);
            pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACCOUNT').AsInt64 := rate_acc_p;
            pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACC_NATIVE').AsInt64 := rate_acc_un;
            pFIBStoredProc_dt_add.ParamByName('D_ID_CUSTOMER').AsInt64 := id_p;
            pFIBStoredProc_dt_add.ParamByName('D_NAME_CUSTOMER').AsString := name_p;

            if Trim(cxDateEdit_nomn_d.Text) = '' then
            pFIBStoredProc_dt_add.ParamByName('D_NOMD_DOG').AsVariant := null else
            pFIBStoredProc_dt_add.ParamByName('D_NOMD_DOG').AsString := cxDateEdit_nomn_d.Text;

            if Trim(cxTextEdit_nomn.Text) = '' then
            pFIBStoredProc_dt_add.ParamByName('D_NOMN_DOG').AsVariant := Null else
            pFIBStoredProc_dt_add.ParamByName('D_NOMN_DOG').AsString := cxTextEdit_nomn.Text;

            pFIBStoredProc_dt_add.ParamByName('D_DATE_BEG').AsDate := cxDateEdit_date_beg.Date;
            pFIBStoredProc_dt_add.ParamByName('D_DATE_END').AsDate := cxDateEdit_date_end.Date;

            if cxCheckBox_continue.Checked then
              pFIBStoredProc_dt_add.ParamByName('D_CONTINUE').AsInteger := 1
            else
              pFIBStoredProc_dt_add.ParamByName('D_CONTINUE').AsInteger := 0;

            if cxCheckBox_not_summa.Checked then
              pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').AsInteger := 1
            else
            pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').AsInteger := 0;
            pFIBStoredProc_dt_add.ParamByName('D_FIO_DONGU').AsString := cxTextEdit_ot_donnu.Text;
            pFIBStoredProc_dt_add.ParamByName('D_FIO_POSTAV').AsString := cxTextEdit_ot_post.Text;
            if cxCheckBox_is_project.Checked then
              pFIBStoredProc_dt_add.ParamByName('D_IS_PROJECT').AsInteger := 1
            else
              pFIBStoredProc_dt_add.ParamByName('D_IS_PROJECT').AsInteger := 0;
            pFIBStoredProc_dt_add.ParamByName('D_COMMENT').AsString := comment;
            pFIBStoredProc_dt_add.ParamByName('D_ID_OTDEL').AsInt64 := id_otdel;

            pFIBStoredProc_dt_add.ParamByName('D_ID_USER').asInteger := SYS_ID_USER;
            pFIBStoredProc_dt_add.ParamByName('D_IP_COMP').asString := GetIPAddress;
            pFIBStoredProc_dt_add.ParamByName('D_NAME_COMP').asString :=  GetCompName;

            try
              pFIBStoredProc_dt_add.ExecProc;
            except on e: Exception do
              begin
                ShowMessage(e.Message);
                pFIBTransactionWrite.Rollback;
                Exit;
              end;
            end;

            pFIBTransactionWrite.Commit;
            Close;

    end;//конец условия на редактирование



    if  Assigned(fProc) then
    begin
     fProc(kod_dog, action);
    end;
    //запись в реестр последнего id_department
    reg := TRegistry.Create;
    reg.OpenKey(REG_KEY + 'Otdel', true);
    try
      reg.WriteInteger('id_otdel', id_otdel);
    except
    end;
    reg.Free;

    Close;
end;


procedure TfrmShablonTwo.cxDateEdit_dogPropertiesChange(Sender: TObject);
begin
  cxTextEdit_def_d_dog2.Text := cxDateEdit_dog.Text;
  cxTextEdit_def_d_dog3.Text := cxDateEdit_dog.Text;
end;

procedure TfrmShablonTwo.CurrencyEditsum_dogChange(Sender: TObject);
begin
 cxCurrencyEdit_def_sum.Value := CurrencyEditsum_dog.Value;
end;

procedure TfrmShablonTwo.cxDateEdit_date_endPropertiesChange(
  Sender: TObject);
begin
      if  cxDateEdit_date_beg.Date > cxDateEdit_date_end.Date then
        begin
          MessageDlg('Увага', errDtNotNotDEnd_DBeg, mtError, [mbOk]);
          PageControl1.ActivePageIndex:=0;
          cxDateEdit_date_end.SetFocus;
          Exit;
        end;
end;

procedure TfrmShablonTwo.cxTextEdit_mfo_pPropertiesChange(Sender: TObject);
begin
  cxTextEdit_dop_cust.Text := cxButtonEdit_name_p.Text;
  cxTextEdit_n_cust.Text := cxButtonEdit_name_p.Text;
end;

procedure TfrmShablonTwo.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect:TRect;
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

procedure TfrmShablonTwo.cxCheckBox_not_summaPropertiesChange(
  Sender: TObject);
begin
  if cxCheckBox_not_summa.Checked then
  begin
    CurrencyEditsum_dog.Visible := false;
    Label16.Visible := false;
    label28.Visible := false;
    cxCurrencyEdit_def_sum.Visible := false;
  end
  else
  begin
    CurrencyEditsum_dog.Visible := true;
    Label16.Visible := true;
    label28.Visible := true;
    cxCurrencyEdit_def_sum.Visible := true;
  end;
end;

procedure TfrmShablonTwo.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  dxBarLargeButton_prosmClick(Self);
end;

procedure TfrmShablonTwo.N1Click(Sender: TObject);
begin
  dxBarLargeButton_addClick(Self);
end;

procedure TfrmShablonTwo.N3Click(Sender: TObject);
begin
  dxBarLargeButton_redClick(Self);
end;

procedure TfrmShablonTwo.dxBarLargeButton_addClick(Sender: TObject);
var
  HandlePack: HModule;
  MDIFUNC   :function(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle;id_dokument: Variant;
                      Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;stdcall;
  Res:Variant;
  Name_sh: PAnsiChar;
  //DataSetSum: TpFIBDataSet;
  DataSet_rate: TpFIBDataSet;
  s: String;
//  p:Int64;
begin
////////////////////////////////////////////////////////////////////////////////
            
if (Priznak_vizova = 'add') and (ID_DOG_GLOBAL=0) then             
begin            
           s:='Шановний користувач , додання кошториса без додання договору не можливе.'+#13;
           s:=s+'Для додання кошториса зараз натисніть '+''''+'Так'+''''+' ,після чого до бази данних буде'+#13;
           s:=s+'додано новий договір.Якщо ви бажаєте додати кошторис пізніше'+'-  натисніть '+''''+'Ні'+''''+'.'+#13;

     if cxCheckBox_not_summa.Checked then CurrencyEditsum_dog.Text:='999999999,99';

      if MessageDlg('Увага', s, mtConfirmation, [mbYes, mbNo]) <> mrYes then
      begin
        Exit;
      end;
       isNewDogExist:=true;
     if (Trim(CurrencyEditsum_dog.Text))=''  then
     begin
       if CurrencyEditsum_dog.Visible then
       begin
         MessageDlg('Увага', 'Сума договору має бути більша за нуль.', mtError, [mbOk]);
         PageControl1.ActivePageIndex:=0;
         CurrencyEditsum_dog.SetFocus;
         Exit;
       end;
     end;

    ////////////////////////////////////////////////////////////////////////////////
    //проверка реквизитов контрагента по дате
     DataSet_rate := TpFIBDataSet.Create(Self);
     DataSet_rate.Database := WorkDatabase;
     DataSet_rate.Transaction := pFIBTransactionRead;
     s := 'SELECT date_beg, date_end FROM   pub_sp_cust_rate_acc WHERE  id_rate_account=:param_id';
     DataSet_rate.Active := false;
     DataSet_rate.SQLs.SelectSQL.Add(s);
     DataSet_rate.ParamByName('param_id').Value := rate_acc_p;
     DataSet_rate.Active := true;

     if (Date < DataSet_rate.FieldByName('date_beg').AsDateTime)
     or (DataSet_rate.FieldByName('date_end').AsDateTime < Date) then
     ShowMessage('Счет контрагента не функционирует в данном периоде');
     DataSet_rate.Free;

(*     //сумма не должна превышать сумму по кошторисам
    if (CurrencyEditsum_dog.Value < CurrencyEdit_sum_po_smet.Value) then
    begin
      if  cxCheckBox_not_summa.Checked then
        begin
          //
        end
        else
        begin
          ShowMessage('Сума договору не може бути менш ніж сума заявлених кошторисів');
          CurrencyEditsum_dog.Value := CurrencyEdit_sum_po_smet.Value;
          cxCurrencyEdit_def_sum.Text := CurrencyEditsum_dog.Text;
          Exit;
        end;
    end;
    *)

         // проверка на заполнение номера договора
    if  Trim(cxMaskEdit_n_dog.Text) = '' then
        begin
        MessageDlg('Увага', errDtNotNumber, mtError, [mbOk]);
        PageControl1.ActivePageIndex:=0;
        cxMaskEdit_n_dog.SetFocus;
        Exit;
    end;


         // проверка на заполнение основания
    if  Trim(cxMemo_note_dog.Text)='' then
        begin
        MessageDlg('Увага', errNotNote, mtError, [mbOk]);
        PageControl1.ActivePageIndex:=0;
        cxMemo_note_dog.SetFocus;
        Exit;
    end;


         /// проверка на заполнение контрагента
    if  Trim(cxButtonEdit_name_p.Text)='' then
        begin
        MessageDlg('Увага', errDtNotKontragent, mtError, [mbOk]);
        PageControl1.ActivePageIndex:=0;
        cxButtonEdit_name_p.SetFocus;
        Exit;
    end;

         // проверка на заполнение счета ДонНУ
    if  Trim(cxButtonEdit_name_un.Text)='' then
        begin
        MessageDlg('Увага', errDtNotDonnu, mtError, [mbOk]);
        PageControl1.ActivePageIndex:=0;
        cxButtonEdit_name_un.SetFocus;
        Exit;
    end;

         // проверка на заполнение даты
    if  Trim(cxDateEdit_date_beg.Text)='' then
        begin
          MessageDlg('Увага', errDtNotNotDBeg, mtError, [mbOk]);
          PageControl1.ActivePageIndex:=0;
          cxDateEdit_date_beg.SetFocus;
          Exit;
        end;

        // проверка на заполнение даты
    if  Trim(cxDateEdit_date_end.Text)='' then
        begin
          MessageDlg('Увага', errDtNotNotDEnd, mtError, [mbOk]);
          PageControl1.ActivePageIndex:=0;
          cxDateEdit_date_end.SetFocus;
          Exit;
          end;

        // проверка на корректность даты
    if  cxDateEdit_date_beg.Date>cxDateEdit_date_end.Date then
        begin
          MessageDlg('Увага', errDtNotNotDEnd_DBeg, mtError, [mbOk]);
          PageControl1.ActivePageIndex:=0;
          cxDateEdit_date_beg.SetFocus;
          Exit;
        end;
     if cxDateEdit_dog.Text='' then
     begin
      MessageDlg('Увага', 'Дата договору не може бути пустою.', mtError, [mbOk]);
      PageControl1.ActivePageIndex:=0;
      cxDateEdit_dog.SetFocus;
      Exit;
     end;
    ////////////////////////////////////////////////////////////////////////////////
//    pFIBStoredProc_dt_add.Database := pFIBDatabase;
//    pFIBStoredProc_dt_add.Transaction := pFIBTransactionWrite;
//    pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
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
    pFIBStoredProc_dt_add.ParamByName('D_ID_RATE_ACCOUNT').Value := rate_acc_p;
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
    if cxCheckBox_continue.Checked then
      pFIBStoredProc_dt_add.ParamByName('D_CONTINUE').Value := 1
    else
      pFIBStoredProc_dt_add.ParamByName('D_CONTINUE').Value := 0;
    if cxCheckBox_not_summa.Checked then
      begin
        pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').Value := 1;
        pFIBStoredProc_dt_add.ParamByName('D_SUMMA').Value := '999999999,99';
      end
    else
      begin
        pFIBStoredProc_dt_add.ParamByName('D_NOT_SUMMA').Value := 0;
      end;
    pFIBStoredProc_dt_add.ParamByName('D_FIO_DONGU').Value := cxTextEdit_ot_donnu.Text;
    if Trim(cxTextEdit_ot_post.Text) = '' then
    pFIBStoredProc_dt_add.ParamByName('D_FIO_POSTAV').Value := '' else
    pFIBStoredProc_dt_add.ParamByName('D_FIO_POSTAV').Value := cxTextEdit_ot_post.Text;

    pFIBDataSet_post.Active := true;
    pFIBStoredProc_dt_add.ParamByName('D_ID_CUSTOMER').Value := id_p;
    pFIBStoredProc_dt_add.ParamByName('D_NAME_CUSTOMER').Value := name_p;

    pFIBDataSet_tip_dog_add.Active := true;
    pFIBStoredProc_dt_add.ParamByName('D_ID_TIP_DOG').Value := pFIBDataSet_tip_dog_add.fieldByName('id_tip_dog').AsVariant;
    pFIBStoredProc_dt_add.ParamByName('D_SUM_OPL').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('d_sum_pay').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_SUM_FULFIL').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_NDS_PAY').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_NDS_SUM').Value := 0;
    if cxCheckBox_is_project.Checked then
      pFIBStoredProc_dt_add.ParamByName('D_is_project').Value := 1
    else
      pFIBStoredProc_dt_add.ParamByName('D_is_project').Value := 0;
    pFIBStoredProc_dt_add.ParamByName('D_COMMENT').Value := comment;
    pFIBStoredProc_dt_add.ParamByName('D_ID_OTDEL').Value := id_otdel;

    pFIBStoredProc_dt_add.ParamByName('D_ID_USER').Value := SYS_ID_USER;
    pFIBStoredProc_dt_add.ParamByName('D_IP_COMP').Value := GetIPAddress;
    pFIBStoredProc_dt_add.ParamByName('D_NAME_COMP').Value := GetCompName;

    try
      pFIBStoredProc_dt_add.ExecProc;
    except on e:Exception do
      begin
        ShowMessage(e.Message);
        pFIBTransactionWrite.Rollback;
        Exit;
      end;
    end;

    ID_DOG_GLOBAL:=pFIBStoredProc_dt_add.FieldByName('VIX_ID_DOG').AsInt64;

    kod_dog:=ID_DOG_GLOBAL;
    id_doc:=ID_DOG_GLOBAL;
    pFIBTransactionWrite.Commit;

   end;

////////////////////////////////////////////////////////////////////////////////



//если сумма по кошторисам равна сумме договора то нельзя добавлять коштоис
{
  DataSetSum := TpFIBDataSet.Create(Self);
  DataSetSum.Database := WorkDatabase;
  DataSetSum.Transaction := pFIBTransactionRead;

  DataSetSum.SQLs.SelectSQL.Text := 'select sum(d.summa) from dog_dt_document d ' +
                                        'where  d.kod_dog=:kod_dog and d.dog_close=0 ' +
                                        'and    d.use_end=''31.12.9999''and  d.id_dog<>d.kod_dog';


//  int64(pFIBDataSet_id_dokument.FieldByName('kod_dog').as)
  p := TFIBBCDField(pFIBDataSet_id_dokument.FieldByName('kod_dog')).AsInt64;

  ShowMessage('#2');
  DataSetSum.ParamByName('kod_dog').AsInt64 := p;
  DataSetSum.Active := true;

  if (pFIBDataSet_id_dokument.FieldByName('d_summa').AsCurrency = DataSetSum.FBN('sum').AsCurrency) then
  begin
    MessageDlg('Увага', errSumKsh, mtError, [mbOk]);
    Exit;
  end;
  }
//////////////////////////////////////////////////////////
  Name_sh:='Kowtoris.bpl';
  HandlePack:=GetModuleHandle(Name_sh);
                                                 
   if HandlePack<32          
     then begin                                      
        Screen.Cursor:=crHourGlass;
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+Name_sh);
        Screen.Cursor:=crDefault;
     end;
    if HandlePack > 0 then    
      begin
              @MDIFUNC:=GetProcAddress(HandlePack,PChar('LoadShablon'));
              if @MDIFUNC<>nil
              then Res:=MDIFUNC(Self, WorkDatabase.Handle, fsNormal, id_doc, 'add', SYS_ID_SMETA, Nil, Nil);
    end;
//    Result := Res;
//  LoadDogManedger.LoadShablon(self, WorkDatabase.Handle, fsNormal, id_doc, 'add', SYS_ID_SMETA, 'Kowtoris.bpl', ResProc);
////////////////////////////////////////////////////////////
  SelectAll();
  pFIBDataSet_smets.Locate('id_dog', res, []);
end;

procedure TfrmShablonTwo.dxBarLargeButton_redClick(Sender: TObject);
var
  temp : Variant;
  HandlePack: HModule;
  MDIFUNC   :function(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle;id_dokument: Variant;
                      Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;stdcall;
  Res:Variant;
  Name_sh: PAnsiChar;
begin
  if pFIBDataSet_smets.IsEmpty then Exit;
  temp := TFIBBCDField(pFIBDataSet_smets.FBN('id_dog')).AsInt64;
/////////////////////////////////////////////////////////////
  Name_sh:='Kowtoris.bpl';       
  HandlePack:=GetModuleHandle(Name_sh);

   if HandlePack<32
     then begin
        Screen.Cursor:=crHourGlass;
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+Name_sh);
        Screen.Cursor:=crDefault;
     end;
    if HandlePack > 0 then
    begin
              @MDIFUNC:=GetProcAddress(HandlePack,PChar('LoadShablon'));
              if @MDIFUNC<>nil
              then Res:=MDIFUNC(Self, WorkDatabase.Handle, fsNormal, temp, 'red', SYS_ID_SMETA, Nil, Nil);
    end;
//  LoadDogManedger.LoadShablon(self., WorkDatabase.Handle, fsNormal, temp, 'red', SYS_ID_SMETA, 'Kowtoris.bpl', Nil);
////////////////////////////////////////////////////////////
  SelectAll();
  pFIBDataSet_smets.Locate('id_dog', temp, []);
end;

procedure TfrmShablonTwo.dxBarLargeButton_prosmClick(Sender: TObject);
var
  temp : Variant;       
  HandlePack: HModule;
  MDIFUNC   :function(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle;id_dokument: Variant;
                      Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;stdcall;
  Res:Variant;
  Name_sh: PAnsiChar;
begin
      {
        pFIBDataSet_smets.Active := false;
        pFIBDataSet_smets.SQLs.SelectSQL.Text:='select * from   dog_dt_document  where  kod_dog = :param and    kod_dog<>id_dog and    use_end='+''''+'31.12.9999'+'''';

        pFIBDataSet_smets.ParamByName('param').AsInt64 :=id_dog;
        pFIBDataSet_smets.Active := true;
       }
          if pFIBDataSet_smets.IsEmpty then Exit;
  temp := TFIBBCDField(pFIBDataSet_smets.FBN('id_dog')).AsInt64;
//   pFIBDataSet_smets.FieldByName('id_dog').AsInt64;
/////////////////////////////////////////////////////////////
  Name_sh:='Kowtoris.bpl';
  HandlePack:=GetModuleHandle(Name_sh);

   if HandlePack<32
     then begin
        Screen.Cursor:=crHourGlass;
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+PathDogovor+Name_sh);
        Screen.Cursor:=crDefault;
     end;
    if HandlePack > 0 then
    begin
              @MDIFUNC:=GetProcAddress(HandlePack,PChar('LoadShablon'));
              if @MDIFUNC<>nil
              then Res:=MDIFUNC(Self, WorkDatabase.Handle, fsNormal, temp, 'prosmotr', SYS_ID_SMETA, Nil, Nil);
    end;
//  LoadDogManedger.LoadShablon(self., WorkDatabase.Handle, fsNormal, temp, 'red', SYS_ID_SMETA, 'Kowtoris.bpl', Nil);
////////////////////////////////////////////////////////////
end;

procedure TfrmShablonTwo.cxButtonEdit_name_unPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  ret: Variant;
begin
if Priznak_vizova = 'prosmotr'  then Exit
else
begin
  if VarIsClear(rate_acc_un) then rate_acc_un := -1;

  ret := LoadDogManedger.WorkSpMfoRsch(self, WorkDatabase.Handle, fsNormal, 'get', rate_acc_un);
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

procedure TfrmShablonTwo.FormShow(Sender: TObject);
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

 ID_DOG_GLOBAL:=0;
 PageControl1.TabIndex:=0;
  if Priznak_vizova = 'prosmotr' then
  begin
    cxGrid1.PopupMenu := Nil;
    add.Enabled := False;
    del.Enabled := False;
  end;
  Width := 538;
  Height := 443;
end;

procedure TfrmShablonTwo.CurrencyEditsum_dogExit(Sender: TObject);
begin
 { if (CurrencyEditsum_dog.Value < CurrencyEdit_sum_po_smet.Value) then
  begin
    ShowMessage('Сума договору не може бути менш ніж сума заявлених кошторисів');
    CurrencyEditsum_dog.Value := CurrencyEdit_sum_po_smet.Value;
    cxCurrencyEdit_def_sum.Text := CurrencyEditsum_dog.Text;
  end;}
end;

procedure TfrmShablonTwo.Label22Click(Sender: TObject);
begin
  if Priznak_vizova <> 'add' then
  ShowDogPayFulfil(Self, WorkDatabase.Handle, pFIBTransactionRead.Handle, pFIBTransactionWrite.Handle, fsNormal, id_doc, -1);
end;

procedure TfrmShablonTwo.FormResize(Sender: TObject);
begin
  Panel1.Left := Width div 2 - Panel1.Width div 2 - 6;
  Panel1.Top := Height div 2 - Panel1.Height div 2 - 18;
end;

procedure TfrmShablonTwo.Label21Click(Sender: TObject);
begin
  if Priznak_vizova <> 'add' then begin
//    ShowMessage(VarToStr(id_doc));
    ShowDogPayFulfil(Self, WorkDatabase.Handle, pFIBTransactionRead.Handle, pFIBTransactionWrite.Handle, fsNormal, id_doc, -1);
  end;
end;

procedure TfrmShablonTwo.Label21MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Priznak_vizova <> 'add' then
  begin
    Label21.Cursor := crHandPoint;
  end;
end;

procedure TfrmShablonTwo.Label22MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Priznak_vizova <> 'add' then
  begin
    Label22.Cursor := crHandPoint;
  end;
end;

procedure TfrmShablonTwo.Label22MouseLeave(Sender: TObject);
begin
  Label22.font.color := clBlack;
  Label22.font.Style := [fsBold];
end;

procedure TfrmShablonTwo.viewExecute(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 2 then dxBarLargeButton_prosmClick(Self);
end;

procedure TfrmShablonTwo.editExecute(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 2 then dxBarLargeButton_redClick(Self);
end;

procedure TfrmShablonTwo.addExecute(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 2 then dxBarLargeButton_addClick(Self);
end;

procedure TfrmShablonTwo.cxButton_histClick(Sender: TObject);
var
  Hist: Variant;
  Query: TpFIBDataSet;
begin
 Query := TpFIBDataSet.Create(Self);
 Query.Transaction := pFIBTransactionRead;
 Query.SelectSQL.Text := 'SELECT COUNT(id_history) FROM   dog_dt_document_history, dog_dt_document '+
                         'WHERE  dog_dt_document_history.id_dog=dog_dt_document.id_dog AND    dog_dt_document.id_dog='+VarToStr(id_doc);
 Query.Open;
 if (Query['count'] = 0) then
 begin
   ShowMessage('Історія зміни по цьому документу відсутня.');
   Exit;
 end
 else
 Hist:=LoadDogManedger.History_dog(Owner, WorkDatabase.Handle, kod_dog, fsNormal);
end;

procedure TfrmShablonTwo.saveExecute(Sender: TObject);
begin
  cxButton_okClick(Self);
end;

procedure TfrmShablonTwo.save1Execute(Sender: TObject);
begin
  cxButton_okClick(Self);
end;

procedure TfrmShablonTwo.SelectAll();
var
s :String;
begin
  pFIBDataSet_smets.Active := false;
  {
  if (Priznak_vizova='add') and (ID_DOG_GLOBAL = 0) then  pFIBDataSet_smets.ParamByName('param').AsInt64 := kod_dog
  else   pFIBDataSet_smets.ParamByName('param').AsInt64 := ID_DOG_GLOBAL;
   }
  {
  ShowMessage('Select_ALL kod_dog =' + VarToStr(kod_dog)+pFIBDataSet_smets.SQLs.SelectSQL.Text);
  pFIBDataSet_smets.ParamByName('param').AsInt64 := kod_dog;
  }

  s:='select * ';
  s:=s+'from   dog_dt_document ';
  s:=s+'where  kod_dog ='+IntToStr(kod_dog)+' ';
  s:=s+'and    kod_dog<>id_dog ';
  s:=s+'and    use_end='+''''+'31.12.9999'+'''';
  pFIBDataSet_smets.SQLs.SelectSQL.Text:=s;

  pFIBDataSet_smets.Active := true;
end;

procedure TfrmShablonTwo.dxBarLargeButton_updClick(Sender: TObject);
begin
  SelectAll();
end;

procedure TfrmShablonTwo.dxBarLargeButton_delClick(Sender: TObject);
var
 selected : integer;
 TempDataSet:TpFIBDataSet;
begin
 if pFIBDataSet_smets.RecordCount = 0 then exit;

 {select * from dog_dt_document d where d.kod_dog = :ID_DOG}
 TempDataSet:=TpFIBDataSet.Create(nil);  
 TempDataSet.Database := WorkDatabase;       
 TempDataSet.Transaction := pFIBTransactionRead;
 TempDataSet.SQLs.SelectSQL.Text := 'select * from dog_dt_document d where d.kod_dog = '+ pFIBDataSet_smets.FieldByName('ID_DOG').AsString;
 TempDataSet.Active:=false;
 TempDataSet.Active:=true;
 if not TempDataSet.IsEmpty then
 begin
    ShowMessage('Не можливо видалити кошторис. За ним вже сформовано передплату.');
    TempDataSet.Free;
    Exit;
 end;

  TempDataSet.Free;
 {
       DataSetCust.Database := WorkDatabase;
       DataSetCust.Transaction := pFIBTransactionRead;
       DataSetCust.SQLs.SelectSQL.Text := 'SELECT MFO, Name_MFO, Rate_Account, Name_customer, C.id_customer '+
                                          'FROM Pub_Sp_Cust_Rate_Acc A, Pub_Sp_Bank B, Pub_sp_customer C '+
                                          'WHERE A.Id_Bank = B.Id_Bank '+
                                          'AND   A.id_customer=C.id_customer '+
                                          'AND   A.id_rate_account =' + VarToStr(rate_acc_p);
       DataSetCust.Active := true;
 }



 selected := cxGrid1DBTableView1.DataController.FocusedRowIndex;
 if MessageDlg('Увага', 'Ви дійсно бажаєте видалити запис?', mtConfirmation, [mbYes, mbNo]) <> mrYes then exit;
 pFIBStoredProc_dt_add.Transaction.StartTransaction;
 pFIBStoredProc_dt_add.ExecProcedure('DOG_DT_DOCUMENT_DELETE', [pFIBDataSet_smets.FieldByName('ID_DOG').AsVariant]);
 pFIBStoredProc_dt_add.Transaction.Commit;
 SelectAll;
 cxGrid1DBTableView1.DataController.FocusedRowIndex := selected;
end;

procedure TfrmShablonTwo.Timer1Timer(Sender: TObject);
begin
//  SelectAll();
//  Timer1.Enabled := false;
end;

procedure TfrmShablonTwo.ResProc(id: integer; Action: TResAction);
begin
 if (Action <> raView) and (Action <> raClose) then
 begin
  SelectAll;
  pFIBDataSet_smets.Locate('ID_DOG', id, []);
 end;
end;

procedure TfrmShablonTwo.updExecute(Sender: TObject);
begin
  dxBarLargeButton_updClick(Self);
end;

procedure TfrmShablonTwo.cxCheckBox_is_projectPropertiesChange(
  Sender: TObject);
begin
  if (cxCheckBox_is_project.Checked=true) then
  begin
    cxCheckBox_is_project.Style.Color := clRed;
  end
  else
  begin
    cxCheckBox_is_project.Style.Color := clBtnFace;
  end;
end;

procedure TfrmShablonTwo.pFIBDataSet_smetsAfterScroll(DataSet: TDataSet);
begin
  Label40.Caption  := pFIBDataSet_smets.FieldByName('regest_num').AsString;
  Label40.Hint     := pFIBDataSet_smets.FieldByName('regest_num').AsString;
  Label40.ShowHint := true;
  Label32.Caption  := pFIBDataSet_smets.FieldByName('n_dog').AsString;
  Label32.Hint     := pFIBDataSet_smets.FieldByName('n_dog').AsString;
  Label32.ShowHint := true;
  Label35.Caption  := pFIBDataSet_smets.FieldByName('d_dog').AsString;
  Label35.Hint     := pFIBDataSet_smets.FieldByName('d_dog').AsString;
  Label35.ShowHint := true;
end;

procedure TfrmShablonTwo.N2Click(Sender: TObject);
begin
  dxBarLargeButton_delClick(Self);
end;

procedure TfrmShablonTwo.Label1Click(Sender: TObject);
var
  s       : Variant;
begin
  s := LoadDogManedger.Comment(Self, comment, Priznak_vizova);
  comment := s;  
end;

procedure TfrmShablonTwo.cxButtonEdit_depPropertiesButtonClick(
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
            FieldValues['DBHandle'] := Integer(WorkDatabase.Handle);
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

procedure TfrmShablonTwo.cxButton1Click(Sender: TObject);
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
  i['DBHandle'].AsInteger := integer(WorkDatabase.handle);

  LoaderUnit.LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivTree.bpl', i, o);
  if o['MoadResult'].AsVariant = mrOk then
  begin

  cxMemo_note_dog.Text := o['name_osn'].AsString;
  end;
  i.Free;
  o.Free;

//   ShowMessage(VarToStr(GetIPAddress));
end;

end.

