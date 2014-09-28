unit Shablon11;

interface

uses       
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, iBase, LoadDogManedger, dogLoaderUnit, StdCtrls, Mask, ToolEdit,
  CurrEdit, cxCheckBox, cxButtonEdit, cxMemo, cxTextEdit, cxDropDownEdit,
  cxCalendar, cxControls, cxContainer, cxEdit, cxMaskEdit, ComCtrls,
  FIBDatabase, pFIBDatabase, uCommonSp, cxLookAndFeelPainters, cxButtons,
  DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc,
  ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxCurrencyEdit, ImgList, cxGridTableView, cxTL,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, dxBar, dxBarExtItems,AArray,LoaderUnit;

resourcestring
    errDtNotNumber = 'Номер договору не заповнен.';
    errDtNotKontragent = 'Виберіть контрагента.';
    errDtNotKred = 'Виберіть кредитора.';
    errDtNotDonnu = 'Виберіть рахунок.';
    errDtNotNotDBeg = 'Введите начальную дату.';
    errDtNotNotDEnd = 'Введите конечную дату.';
    errDtNotNotDEnd_DBeg = 'Некорректно задан период.';   
    errNotNote = 'Необхідно ввести підставу договору.';
    errSumOtr = 'Сума повинна бути більше нуля.';
    errSumKsh = 'Неможливо додати которис: сума по договору дорівнює сумі кошторисів.';
    errDepart = 'Віберіть підрозділ.';

type
  TfrmShablon11 = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    cxMaskEdit_n_dog: TcxMaskEdit;
    cxDateEdit_dog: TcxDateEdit;
    cxTextEdit_reg_n: TcxTextEdit;
    cxMemo_note_dog: TcxMemo;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cxButtonEdit_name_guar: TcxButtonEdit;
    cxTextEdit_mfo_guar: TcxTextEdit;
    cxTextEdit_rsch_guar: TcxTextEdit;
    cxTextEdit_bank_guar: TcxTextEdit;
    GroupBox8: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    cxButtonEdit_name_debt: TcxButtonEdit;
    cxTextEdit_mfo_debt: TcxTextEdit;
    cxTextEdit_rsch_debt: TcxTextEdit;
    cxTextEdit_bank_debt: TcxTextEdit;
    cxCheckBox_not_summa: TcxCheckBox;
    CurrencyEditsum_dog: TCurrencyEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label14: TLabel;
    cxButtonEdit_name_cred: TcxButtonEdit;
    cxTextEdit_mfo_cred: TcxTextEdit;
    cxTextEdit_rate_acc_cred: TcxTextEdit;
    cxTextEdit_bank_cred: TcxTextEdit;
    TabSheet2: TTabSheet;
    Label15: TLabel;
    Label18: TLabel;
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
    cxCheckBox_continue: TcxCheckBox;
    cxButtonEdit_otd: TcxButtonEdit;
    GroupBox9: TGroupBox;
    Label17: TLabel;
    Label20: TLabel;
    cxDateEdit_nomn_d: TcxDateEdit;
    cxTextEdit_nomn: TcxTextEdit;
    GroupBox10: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    CurrencyEdit_summa_pay: TCurrencyEdit;
    CurrencyEdit_sum_fulfil: TCurrencyEdit;
    TabSheet3: TTabSheet;
    cxButton_ok: TcxButton;
    cxButton_cancel: TcxButton;
    Database: TpFIBDatabase;
    WTransaction: TpFIBTransaction;
    RTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    DataSetTipDog: TpFIBDataSet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn_note: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn_sum_smet: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn_vipolneno: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn_oplacheno: TcxGridDBColumn;
    flag_del: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
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
    dxBarLargeButton_edit: TdxBarLargeButton;
    dxBarLargeButton_del: TdxBarLargeButton;
    dxBarLargeButton_up: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton_view: TdxBarLargeButton;
    DataSetSmets: TpFIBDataSet;
    DataSource: TDataSource;
    Label31: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    cxButton_hist: TcxButton;
    DataSetCheck: TpFIBDataSet;
    TransactionCheck: TpFIBTransaction;
    cxButton1: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonEdit_name_pPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit_otdPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit_name_credPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit_name_debtPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButton_okClick(Sender: TObject);
    procedure Label18Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure cxCheckBox_not_summaPropertiesChange(Sender: TObject);
    procedure dxBarLargeButton_addClick(Sender: TObject);
    procedure dxBarLargeButton_editClick(Sender: TObject);
    procedure dxBarLargeButton_delClick(Sender: TObject);
    procedure dxBarLargeButton_viewClick(Sender: TObject);
    procedure dxBarLargeButton_upClick(Sender: TObject);
    procedure DataSetSmetsAfterScroll(DataSet: TDataSet);
    procedure Label21Click(Sender: TObject);
    procedure Label22Click(Sender: TObject);
    procedure Label21MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label22MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxButton_histClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    fProc            : TResProc;
    id_acc_debtor    : Int64; //р/счет должника (Укрпромводчермет)
    id_guarantor     : Int64; //поручитель 
    id_acc_guarantor : Int64; //р/счет поручителя
    id_creditor      : Int64; //кредитор
    id_acc_creditor  : Int64; //р/счет кредитора
    id_tip_dog       : Variant;
    id_otdel         : Int64;
    comment          : String;
    kod_dog          : Int64;
    id_dog           : Int64;
    flag :Boolean; 
    procedure SaveDog();
    procedure SelectAll();
    { Private declarations }
  public
    Priznak_vizova: String;
    constructor Create (Aowner:TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_dokument: Variant; Pr_vizova: String;
                        Id_t_d: Variant; data : PShablonInputData = nil); overload;
    { Public declarations }
  end;

function LoadShablon(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle;id_dokument: Variant;
                 Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;stdcall;
exports LoadShablon;
  
var
  frmShablon11: TfrmShablon11;

implementation
uses
  Registry;

{$R *.dfm}

constructor TfrmShablon11.Create(Aowner:TComponent ;DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_dokument: Variant; Pr_vizova: String;
                                Id_t_d: Variant; data : PShablonInputData = nil);
begin
  if TForm(Aowner).FormStyle = fsNormal then frmStyle := fsNormal;
  self.kod_dog:=id_dokument;
  Priznak_vizova := Pr_vizova;
  id_tip_dog     := id_t_d;
  id_dog         := id_dokument; 
  inherited Create (Aowner);
  FormStyle := frmStyle;
  Database.Handle := DBHANDLE;

  if Pr_vizova <> 'add' then
  begin
    DataSet.Active := false;
    DataSet.ParamByName('id_dog').AsInt64 := id_dog;
    DataSet.Active := true;

    cxMaskEdit_n_dog.Text          := DataSet.FieldByName('d_n_dog').AsString;
    cxDateEdit_dog.Date            := DataSet.FieldByName('d_d_dog').AsDateTime;
    CurrencyEditsum_dog.Text       := CurrToStr(DataSet.FieldByName('d_summa').AsCurrency);
    cxMemo_note_dog.Text           := DataSet.FieldByName('d_dog_note').AsString;
    cxDateEdit_date_beg.Date       := DataSet.FieldByName('d_date_beg').AsDateTime;
    cxDateEdit_date_end.Date       := DataSet.FieldByName('d_date_end').AsDateTime;
    cxTextEdit_ot_donnu.Text       := DataSet.FieldByName('d_fio_dongu').AsString;
    cxTextEdit_ot_post.Text        := DataSet.FieldByName('d_fio_postav').AsString;
    cxCheckBox_continue.Checked    := DataSet.FieldByName('d_continue').AsBoolean;
    cxCheckBox_not_summa.Checked   := DataSet.FieldByName('d_not_summa').AsBoolean;
    CurrencyEdit_summa_pay.Text    := DataSet.FieldByName('d_sum_pay').AsString;
    CurrencyEdit_sum_fulfil.Text   := DataSet.FieldByName('d_sum_fulfil').AsString;
    cxTextEdit_nomn.Text           := DataSet.FieldByName('d_nomn_dog').AsString;
    cxButtonEdit_otd.Text          := DataSet.FieldByName('otdel_name_full').AsString;
    id_otdel                       := DataSet.FieldByName('id_otdel').AsInteger;
    if  not VarIsNull(DataSet.FBN('d_comment').AsVariant) then
    comment := DataSet.FBN('d_comment').asstring else
    comment := ''; 

    

    if DataSet.FieldByName('d_nomd_dog').AsDateTime = 0 then
    cxDateEdit_nomn_d.Text := '' else
    cxDateEdit_nomn_d.Date := DataSet.FieldByName('d_nomd_dog').AsDateTime;

    cxTextEdit_reg_n.Text  := DataSet.FieldByName('d_reg_nomer').AsString;
    Caption := 'Редагування'+' '+DataSet.FieldByName('SHORT_NAME').AsString+' '+
               '('+DataSet.FieldByName('tip_dog').AsString+')';

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
         //Данные по поручителю
    id_guarantor                   := DataSet.FieldByName('D_ID_CUSTOMER').AsVariant;
    id_acc_guarantor               := DataSet.FieldByName('D_ID_RATE_ACCOUNT').AsVariant;
    cxTextEdit_rsch_guar.Text      := DataSet.FieldByName('D_RSCH_K').AsString;
    cxTextEdit_mfo_guar.Text       := DataSet.FieldByName('D_MFO_K').AsString;
    cxTextEdit_bank_guar.Text      := DataSet.FieldByName('D_BANK_NAME_K').AsString;
    cxButtonEdit_name_guar.Text    := DataSet.FieldByName('D_NAME_CUSTOMER_K').AsString;

        //Данные по кредитору
    id_creditor                   := DataSet.FieldByName('D_ID_CREDITOR').AsVariant;
    id_acc_creditor               := DataSet.FieldByName('D_ID_ACC_CREDITOR').AsVariant;
    cxTextEdit_rate_acc_cred.Text := DataSet.FieldByName('D_RSCH_C').AsString;
    cxTextEdit_mfo_cred.Text      := DataSet.FieldByName('D_MFO_C').AsString;
    cxTextEdit_bank_cred.Text     := DataSet.FieldByName('D_BANK_NAME_C').AsString;
    cxButtonEdit_name_cred.Text   := DataSet.FieldByName('D_CREDITOR').AsString;

       //Данные по собственномму р/счету
    id_acc_debtor                  := DataSet.FieldByName('D_ID_RATE_ACC_NATIVE').AsVariant;
    cxButtonEdit_name_debt.Text    := DataSet.FieldByName('D_NAME_CUSTOMER_N').AsString;
    cxTextEdit_mfo_debt.Text       := DataSet.FieldByName('D_MFO_N').AsString;
    cxTextEdit_rsch_debt.Text      := DataSet.FieldByName('D_RSCH_N').AsString;
    cxTextEdit_bank_debt.Text      := DataSet.FieldByName('D_BANK_NAME_N').AsString;

    id_otdel                       := DataSet.FieldByName('ID_OTDEL').AsInteger;

    SelectAll();
  end
  else
  begin
    dxBarLargeButton_add.Enabled    := false;
    dxBarLargeButton_edit.Enabled   := false;
    dxBarLargeButton_del.Enabled    := false;
    dxBarLargeButton_up.Enabled     := false;
    dxBarLargeButton_view.Enabled   := false;

    cxDateEdit_date_beg.Date := Date;
    cxDateEdit_date_end.Date := date+365;

    DataSet.Active := false;
    DataSet.Active := true;
    cxTextEdit_ot_donnu.Text := DataSet.FieldByName('D_FIO_DONNU_DEF').AsString;

       //данные по умолчанию
    DataSetTipDog.Active := false;
    DataSetTipDog.ParamByName('id_tip_dog').Value := id_tip_dog;
    DataSetTipDog.Active := true;

    cxDateEdit_dog.Date            := Date;
    
    cxMaskEdit_n_dog.Text          := DataSetTipDog.FieldByName('DEF_NUMBER').AsString;
    cxDateEdit_dog.Date            := DataSetTipDog.FieldByName('DEF_DATE').AsDateTime;
    cxMemo_note_dog.Text           := DataSetTipDog.FieldByName('DEF_NOTE').AsString;

      //Данные по поручителю
    if not varisnull (DataSetTipDog.FieldByName('DEF_ID_RATE_ACC').AsVariant)  then
    begin
      id_guarantor                   := DataSetTipDog.FieldByName('DEF_CUSTOMER').AsVariant;
      id_acc_guarantor               := DataSetTipDog.FieldByName('DEF_ID_RATE_ACC').AsVariant;
      cxTextEdit_rsch_guar.Text      := DataSetTipDog.FieldByName('DEF_CUST_RSCHET').AsString;
      cxTextEdit_mfo_guar.Text       := DataSetTipDog.FieldByName('DEF_CUST_MFO').AsString;
      cxTextEdit_bank_guar.Text      := DataSetTipDog.FieldByName('DEF_CUST_MFO_NAME').AsString;
      cxButtonEdit_name_guar.Text    := DataSetTipDog.FieldByName('DEF_CUSTOMER_NAME').AsString;
    end
    else
    begin
      cxButtonEdit_name_pPropertiesButtonClick(Self, 0);         
    end;
      
       //Данные по собственномму р/счету
    if not varisnull (DataSetTipDog.FieldByName('DEF_ID_RATE_ACC_NATIVE').AsVariant)  then
    begin
      id_acc_debtor                  := DataSetTipDog.FieldByName('DEF_ID_RATE_ACC_NATIVE').AsVariant;
      cxButtonEdit_name_debt.Text    := DataSetTipDog.FieldByName('DEF_NAME_CUSTOMER').AsString;
      cxTextEdit_mfo_debt.Text       := DataSetTipDog.FieldByName('DEF_MFO').AsString;
      cxTextEdit_rsch_debt.Text      := DataSetTipDog.FieldByName('DEF_ACCOUNT').AsString;
      cxTextEdit_bank_debt.Text      := DataSetTipDog.FieldByName('DEF_BANK_NAME').AsString;
   end;    
    
  end;  

  if Pr_vizova = 'prosmotr' then
  begin
    dxBarLargeButton_add.Enabled := false;
    dxBarLargeButton_edit.Enabled := false;
    dxBarLargeButton_del.Enabled := false;
    cxMaskEdit_n_dog.Properties.ReadOnly := true;
    cxDateEdit_dog.Properties.ReadOnly := true;
    cxMemo_note_dog.Properties.ReadOnly := true;
    cxDateEdit_date_beg.Properties.ReadOnly := true;
    cxButton1.Enabled:=false;
    cxDateEdit_date_end.Properties.ReadOnly := true;
    cxTextEdit_ot_post.Properties.ReadOnly := true;
    cxTextEdit_ot_donnu.Properties.ReadOnly := true;
    CurrencyEditsum_dog.ReadOnly := true;
    cxCheckBox_continue.Properties.ReadOnly := true;
    cxCheckBox_not_summa.Properties.ReadOnly := true;
    cxTextEdit_nomn.Properties.ReadOnly := true;
    cxDateEdit_nomn_d.Properties.ReadOnly := true;
  end;
  
end;

function LoadShablon(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle;id_dokument: Variant;
                 Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;
var
  sh11: TfrmShablon11;
begin
  sh11 := TfrmShablon11.Create(AOwner, DBHANDLE, frmStyle, id_dokument, Pr_vizova, id_t_d,data);
  if sh11.Flag then
  begin
    sh11.free;
    Exit;
  end;
  sh11.fProc := proc;
end;


procedure TfrmShablon11.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfrmShablon11.cxButtonEdit_name_pPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  post: Variant;
  i, o : TSpravParams;
begin
    if Priznak_vizova = 'prosmotr'  then Exit;
    
    if VarIsClear(id_guarantor) then id_guarantor := -1;
    if VarIsClear(id_acc_guarantor) then id_acc_guarantor := -1;

    i := TSpravParams.Create;
    o := TSpravParams.Create;
    i['DataBase']     := Integer(Database.Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := selRateAccount;
    i['id_customer']  := id_guarantor;
    i['id_rate_account']   := id_acc_guarantor;
    i['show_all']   := 1;
    DogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
    begin
        id_guarantor := o['ID_CUSTOMER'];
        id_acc_guarantor := o['ID_RATE_ACCOUNT'];
        cxTextEdit_rsch_guar.Text := o['RATE_ACCOUNT'];
        cxTextEdit_mfo_guar.Text := o['MFO'];
        cxTextEdit_bank_guar.Text := o['NAME_BANK'];
        cxButtonEdit_name_guar.Text := o['NAME_CUSTOMER'];
    end;
    i.Free;
    o.Free;  
end;

procedure TfrmShablon11.cxButtonEdit_otdPropertiesButtonClick(
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
            FieldValues['DBHandle'] := Integer(Database.Handle);
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

procedure TfrmShablon11.cxButtonEdit_name_credPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  post: Variant;
  i, o : TSpravParams;
begin
    if Priznak_vizova = 'prosmotr'  then Exit;
    
    if VarIsClear(id_creditor) then id_creditor := -1;
    if VarIsClear(id_acc_creditor) then id_acc_creditor := -1;

    i := TSpravParams.Create;
    o := TSpravParams.Create;
    i['DataBase']     := Integer(Database.Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := selRateAccount;
    i['id_customer']  := id_creditor;
    i['id_rate_account']   := id_acc_creditor;
    i['show_all']   := 1;
    DogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
    begin
        id_creditor := o['ID_CUSTOMER'];
        id_acc_creditor := o['ID_RATE_ACCOUNT'];
        cxTextEdit_rate_acc_cred.Text := o['RATE_ACCOUNT'];
        cxTextEdit_mfo_cred.Text := o['MFO'];
        cxTextEdit_bank_cred.Text := o['NAME_BANK'];
        cxButtonEdit_name_cred.Text := o['NAME_CUSTOMER'];
    end;
    i.Free;
    o.Free;  
end;

procedure TfrmShablon11.cxButtonEdit_name_debtPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  ret: Variant;
begin
  if Priznak_vizova = 'prosmotr'  then Exit;
  
  if VarIsClear(id_acc_debtor) then id_acc_debtor := -1;

  ret := LoadDogManedger.WorkSpMfoRsch(self, Database.Handle, fsNormal, 'get', id_acc_debtor);
  if VarArrayDimCount(ret) > 0 then
  begin
    if ret[0][0] > 0 then
    begin
      id_acc_debtor := ret[0][0];
      cxButtonEdit_name_debt.Text := ret[0][1];
      cxTextEdit_mfo_debt.Text := ret[0][2];
      cxTextEdit_rsch_debt.Text := ret[0][3];
      cxTextEdit_bank_debt.Text := ret[0][4];
    end;
  end;

end;

procedure TfrmShablon11.cxButton_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmShablon11.SaveDog;
var
  reg : TRegistry;
  action : TResAction;
begin

if Priznak_vizova = 'add' then
begin
    action := raAdd;
    WTransaction.StartTransaction;
    StoredProc.StoredProcName := 'DOG_DT_DOCUMENT_INSERT';
    StoredProc.Prepare;
    StoredProc.ParamByName('D_KOD_DOG').Value := 0;
    StoredProc.ParamByName('D_N_DOG').Value := cxMaskEdit_n_dog.Text;
    StoredProc.ParamByName('D_D_DOG').Value := cxDateEdit_dog.Date;
    if Trim(CurrencyEditsum_dog.Text) = '' then
    StoredProc.ParamByName('D_SUMMA').Value := 0 else
    StoredProc.ParamByName('D_SUMMA').Value := CurrencyEditsum_dog.Text;
    if Trim(cxMemo_note_dog.Text) = '' then
    StoredProc.ParamByName('D_DOG_NOTE').Value := '' else
    StoredProc.ParamByName('D_DOG_NOTE').Value := Trim(cxMemo_note_dog.Text);

    StoredProc.ParamByName('D_ID_RATE_ACCOUNT').AsInt64 := id_acc_guarantor;
    StoredProc.ParamByName('D_ID_RATE_ACC_NATIVE').AsInt64 := id_acc_debtor;

    if Trim(cxTextEdit_nomn.Text)='' then
    StoredProc.ParamByName('D_NOMN_DOG').Value := null else
    StoredProc.ParamByName('D_NOMN_DOG').Value := cxTextEdit_nomn.Text;

    if Trim(cxDateEdit_nomn_d.Text)='' then
    StoredProc.ParamByName('D_NOMD_DOG').Value := null else
    StoredProc.ParamByName('D_NOMD_DOG').Value := cxDateEdit_nomn_d.Date;

    StoredProc.ParamByName('D_DATE_BEG').Value := cxDateEdit_date_beg.Date;
    StoredProc.ParamByName('D_DATE_END').Value := cxDateEdit_date_end.Date;

    StoredProc.ParamByName('D_CLOSE').Value := 0;
    if cxCheckBox_continue.Checked then
      StoredProc.ParamByName('D_CONTINUE').Value := 1
    else
      StoredProc.ParamByName('D_CONTINUE').Value := 0;

    if cxCheckBox_not_summa.Checked then
      begin
        StoredProc.ParamByName('D_NOT_SUMMA').Value := 1;
        StoredProc.ParamByName('D_SUMMA').Value := '999999999,99';
      end
    else
      begin
        StoredProc.ParamByName('D_NOT_SUMMA').Value := 0;
      end;

    StoredProc.ParamByName('D_FIO_DONGU').Value := cxTextEdit_ot_donnu.Text;
    if Trim(cxTextEdit_ot_post.Text) = '' then
    StoredProc.ParamByName('D_FIO_POSTAV').Value := '' else
    StoredProc.ParamByName('D_FIO_POSTAV').Value := cxTextEdit_ot_post.Text;
    
    StoredProc.ParamByName('D_ID_CUSTOMER').AsInt64 := id_guarantor;

    StoredProc.ParamByName('D_ID_TIP_DOG').Value := id_tip_dog;
    StoredProc.ParamByName('D_SUM_OPL').Value := 0;
    StoredProc.ParamByName('d_sum_pay').Value := 0;
    StoredProc.ParamByName('D_SUM_FULFIL').Value := 0;
    StoredProc.ParamByName('D_NDS_PAY').Value := 0;
    StoredProc.ParamByName('D_NDS_SUM').Value := 0;

    StoredProc.ParamByName('D_COMMENT').Value := comment;
    StoredProc.ParamByName('D_ID_OTDEL').AsInt64 := id_otdel;

    StoredProc.ParamByName('D_ID_USER').Value := SYS_ID_USER;
    StoredProc.ParamByName('D_IP_COMP').Value := GetIPAddress;
    StoredProc.ParamByName('D_NAME_COMP').Value := GetCompName;

    try
      StoredProc.ExecProc;
    except on e:Exception do
      begin
        ShowMessage(e.Message);
        WTransaction.Rollback;
        Exit;
      end;
    end;
    kod_dog := StoredProc.FieldByName('VIX_KOD_DOG').AsVariant;
    id_dog  := StoredProc.FieldByName('VIX_ID_DOG').AsVariant;

    //добавляем запись в таблицу связь 1-1
    StoredProc.StoredProcName := 'DOG_DT_DOCUMENT_REL_INS';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_DOG').AsInt64 := id_dog;
    StoredProc.ParamByName('ID_ACC_CREDITOR').AsInt64 := id_acc_creditor;
    try
      StoredProc.ExecProc;
    except on e:Exception do
      begin
        ShowMessage(e.Message);
        WTransaction.Rollback;
        Exit;
      end;
    end;
     
    WTransaction.Commit;
    Close;
   end
   else

////////////////////////Редактирование шаблона 11///////////////////////////////
    begin
    action := raEdit;
    WTransaction.StartTransaction;
    StoredProc.StoredProcName := 'DOG_DT_DOCUMENT_UPDATE';
    StoredProc.Prepare;
    StoredProc.ParamByName('D_ID_DOG').AsInt64 := id_dog;
    StoredProc.ParamByName('D_N_DOG').Value := cxMaskEdit_n_dog.Text;
    StoredProc.ParamByName('D_D_DOG').Value := cxDateEdit_dog.Text;

    if Trim(CurrencyEditsum_dog.Text) = '' then
    StoredProc.ParamByName('D_SUMMA').Value := 0 else
    StoredProc.ParamByName('D_SUMMA').Value := CurrencyEditsum_dog.Text;

    if cxCheckBox_not_summa.Checked then
      begin
        StoredProc.ParamByName('D_NOT_SUMMA').Value := 1;
        StoredProc.ParamByName('D_SUMMA').Value := '999999999,99';
      end
    else
      begin
        StoredProc.ParamByName('D_NOT_SUMMA').Value := 0;
      end;

    StoredProc.ParamByName('D_DOG_NOTE').Value := Trim(cxMemo_note_dog.Text);
    StoredProc.ParamByName('D_ID_RATE_ACCOUNT').AsInt64 := id_acc_guarantor; 
    StoredProc.ParamByName('D_ID_RATE_ACC_NATIVE').AsInt64 := id_acc_debtor;
    StoredProc.ParamByName('D_ID_CUSTOMER').AsInt64 := id_guarantor;

    if Trim(cxDateEdit_nomn_d.Text) = '' then
    StoredProc.ParamByName('D_NOMD_DOG').Value := null else
    StoredProc.ParamByName('D_NOMD_DOG').Value := cxDateEdit_nomn_d.Text;

    if Trim(cxTextEdit_nomn.Text) = '' then
    StoredProc.ParamByName('D_NOMN_DOG').Value := Null else
    StoredProc.ParamByName('D_NOMN_DOG').Value := cxTextEdit_nomn.Text;

    StoredProc.ParamByName('D_DATE_BEG').Value := cxDateEdit_date_beg.Date;
    StoredProc.ParamByName('D_DATE_END').Value := cxDateEdit_date_end.Date;

    if cxCheckBox_continue.Checked then
      StoredProc.ParamByName('D_CONTINUE').Value := 1
    else
      StoredProc.ParamByName('D_CONTINUE').Value := 0;

    if cxCheckBox_not_summa.Checked then
      StoredProc.ParamByName('D_NOT_SUMMA').Value := 1
    else
      StoredProc.ParamByName('D_NOT_SUMMA').Value := 0;
      StoredProc.ParamByName('D_FIO_DONGU').Value := cxTextEdit_ot_donnu.Text;
      StoredProc.ParamByName('D_FIO_POSTAV').Value := cxTextEdit_ot_post.Text;
      StoredProc.ParamByName('D_COMMENT').Value := comment;
      StoredProc.ParamByName('D_ID_OTDEL').AsInt64 := id_otdel;

      StoredProc.ParamByName('D_ID_USER').Value := SYS_ID_USER;
      StoredProc.ParamByName('D_IP_COMP').Value := GetIPAddress;
      StoredProc.ParamByName('D_NAME_COMP').Value := GetCompName;

    try
      StoredProc.ExecProc;
    except on e: Exception do
      begin
        ShowMessage(e.Message);
        WTransaction.Rollback;
        Exit;
      end;
    end;

    //изменяем запись в таблице связь 1-1
    StoredProc.StoredProcName := 'DOG_DT_DOCUMENT_REL_UPD';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_DOG').AsInt64 := id_dog;
    StoredProc.ParamByName('ID_ACC_CREDITOR').AsInt64 := id_acc_creditor;
    try
      StoredProc.ExecProc;
    except on e:Exception do
      begin
        ShowMessage(e.Message);
        WTransaction.Rollback;
        Exit;
      end;
    end;
    
    WTransaction.Commit;
    Close;
    end;//конец условия на редактирование
    if Assigned(fProc) then fProc(id_dog, action);

  //запись в реестр последнего id_department
  reg := TRegistry.Create;
  reg.OpenKey(REG_KEY + 'Otdel', true);
  try
   reg.WriteInteger('id_otdel', id_otdel);
  except
  end;
  reg.Free;

end;

procedure TfrmShablon11.cxButton_okClick(Sender: TObject);
var
  action : TResAction;
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

       // проверка на заполнение поручителя
  if  Trim(cxButtonEdit_name_guar.Text)='' then
      begin
      MessageDlg('Увага', errDtNotKontragent, mtError, [mbOk]);
      cxButtonEdit_name_guar.SetFocus;
      Exit;
  end;

       // проверка на заполнение счета кредитора
  if  Trim(cxButtonEdit_name_cred.Text)='' then
      begin
      MessageDlg('Увага', errDtNotKred, mtError, [mbOk]);
      cxButtonEdit_name_cred.SetFocus;
      Exit;
  end;

       // проверка на заполнение счета ДонНУ
  if  Trim(cxButtonEdit_name_debt.Text)='' then
      begin
      MessageDlg('Увага', errDtNotDonnu, mtError, [mbOk]);
      cxButtonEdit_name_debt.SetFocus;
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

     // проверка на заполнение суммы
  if  CurrencyEditsum_dog.Text = '' then
      begin
        MessageDlg('Увага', errSumOtr, mtError, [mbOk]);
        CurrencyEditsum_dog.SetFocus;
        Exit;
      end;

     // проверка на заполнение подразделения
  if  cxButtonEdit_otd.Text = '' then
      begin
        MessageDlg('Увага', errDepart, mtError, [mbOk]);
        cxButtonEdit_otd.SetFocus;
        Exit;
      end;

  SaveDog();
end;

procedure TfrmShablon11.Label18Click(Sender: TObject);
var
  s       : Variant;
begin
  s := LoadDogManedger.Comment(Self, comment, Priznak_vizova);
  comment := s;  
end;

procedure TfrmShablon11.FormResize(Sender: TObject);
begin
  Panel1.Left := Width div 2 - Panel1.Width div 2 - 6;
  Panel1.Top := Height div 2 - Panel1.Height div 2 - 18;
end;

procedure TfrmShablon11.cxCheckBox_not_summaPropertiesChange(
  Sender: TObject);
begin
  if cxCheckBox_not_summa.Checked then
  begin
    CurrencyEditsum_dog.Visible := false;
    Label16.Visible := false;
  end
  else
  begin
    CurrencyEditsum_dog.Visible := true;
    Label16.Visible := true;
  end;
end;

procedure TfrmShablon11.dxBarLargeButton_addClick(Sender: TObject);
var
  HandlePack: HModule;
  MDIFUNC   :function(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle;id_dokument: Variant;
                      Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;stdcall;
  Res:Variant;
  Name_sh: PAnsiChar;
  DataSetSum: TpFIBDataSet;
begin
//если сумма по кошторисам равна сумме договора то нельзя добавлять коштоис
  DataSetSum := TpFIBDataSet.Create(Self);
  DataSetSum.Database := Database;
  DataSetSum.Transaction := RTransaction;
        
  DataSetSum.SQLs.SelectSQL.Text := 'select sum(d.summa) from dog_dt_document d ' +
                                        'where  d.kod_dog=:kod_dog and d.dog_close=0 ' +
                                        'and    d.use_end=''31.12.9999''and  d.id_dog<>d.kod_dog';
  DataSetSum.ParamByName('kod_dog').AsInt64 := DataSet['kod_dog'];
  DataSetSum.Active := true;
  if (DataSet.FieldByName('d_summa').AsCurrency = DataSetSum.FBN('sum').AsCurrency) then
  begin
    MessageDlg('Увага', errSumKsh, mtError, [mbOk]);
    Exit;
  end;
  
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
              then Res:=MDIFUNC(Self, Database.Handle, fsNormal, id_dog, 'add', SYS_ID_SMETA, Nil, Nil);
    end;
////////////////////////////////////////////////////////////
  SelectAll();
  DataSetSmets.Locate('id_dog', res, []);

end;

procedure TfrmShablon11.SelectAll();
begin
  DataSetSmets.Active := false;
  DataSetSmets.ParamByName('id_dog').AsInt64 := id_dog;
  DataSetSmets.Active := true;
end;                                                         

procedure TfrmShablon11.dxBarLargeButton_editClick(Sender: TObject);
var
  temp : Int64;
  HandlePack: HModule;
  MDIFUNC   :function(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle;id_dokument: Variant;
                      Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;stdcall;
  Res:Variant;
  Name_sh: PAnsiChar;
begin
  if DataSetSmets.IsEmpty then Exit;
  temp := DataSetSmets.FieldByName('id_dog').AsVariant ;
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
              then Res:=MDIFUNC(Self, Database.Handle, fsNormal, temp, 'red', SYS_ID_SMETA, Nil, Nil);
    end;
////////////////////////////////////////////////////////////
  SelectAll();
  DataSetSmets.Locate('id_dog', temp, []);
end;

procedure TfrmShablon11.dxBarLargeButton_delClick(Sender: TObject);
var
 selected : integer;
begin
 if DataSetSmets.RecordCount = 0 then exit;
 selected := cxGrid1DBTableView1.DataController.FocusedRowIndex;
 if MessageDlg('Увага', 'Ви дійсно бажаєте видалити запис?', mtConfirmation, [mbYes, mbNo]) <> mrYes then exit;
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('DOG_DT_DOCUMENT_DELETE', [DataSetSmets.FieldByName('ID_DOG').AsVariant]);
 StoredProc.Transaction.Commit;
 SelectAll;
 cxGrid1DBTableView1.DataController.FocusedRowIndex := selected;
end;

procedure TfrmShablon11.dxBarLargeButton_viewClick(Sender: TObject);
var
  temp : Integer;
  HandlePack: HModule;
  MDIFUNC   :function(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle;id_dokument: Variant;
                      Pr_vizova: String; Id_t_d: Variant; proc : TResProc; data : PShablonInputData = nil):Variant;stdcall;
  Res:Variant;
  Name_sh: PAnsiChar;
begin
  if DataSetSmets.IsEmpty then Exit;
  temp := DataSetSmets.FieldByName('id_dog').AsInteger;
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
              then Res:=MDIFUNC(Self, Database.Handle, fsNormal, temp, 'prosmotr', SYS_ID_SMETA, Nil, Nil);
    end;
////////////////////////////////////////////////////////////
end;

procedure TfrmShablon11.dxBarLargeButton_upClick(Sender: TObject);
begin
  SelectAll();
end;

procedure TfrmShablon11.DataSetSmetsAfterScroll(DataSet: TDataSet);
begin
  Label40.Caption  := DataSetSmets.FieldByName('regest_num').AsString;
  Label40.Hint     := DataSetSmets.FieldByName('regest_num').AsString;
  Label40.ShowHint := true;
  Label32.Caption  := DataSetSmets.FieldByName('n_dog').AsString;
  Label32.Hint     := DataSetSmets.FieldByName('n_dog').AsString;
  Label32.ShowHint := true;        //
  Label35.Caption  := DataSetSmets.FieldByName('d_dog').AsString;
  Label35.Hint     := DataSetSmets.FieldByName('d_dog').AsString;
  Label35.ShowHint := true;
end;

procedure TfrmShablon11.Label21Click(Sender: TObject);
begin
  if Priznak_vizova <> 'add' then
  ShowDogPayFulfil(Self, Database.Handle, RTransaction.Handle, WTransaction.Handle, fsNormal, id_dog, -1);
end;

procedure TfrmShablon11.Label22Click(Sender: TObject);
begin
  if Priznak_vizova <> 'add' then
  ShowDogPayFulfil(Self, Database.Handle, RTransaction.Handle, WTransaction.Handle, fsNormal, id_dog, -1);
end;

procedure TfrmShablon11.Label21MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Priznak_vizova <> 'add' then
  begin
    Label21.Cursor := crHandPoint;
  end;
end;

procedure TfrmShablon11.Label22MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Priznak_vizova <> 'add' then
  begin
    Label22.Cursor := crHandPoint;
  end;
end;

procedure TfrmShablon11.FormCreate(Sender: TObject);
var
  reg       : TRegistry;
  DataSetOtd: TpFIBDataSet;
begin
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
      DataSetOtd.Database    := Database;
      DataSetOtd.Transaction := RTransaction;
      DataSetOtd.SQLs.SelectSQL.Text := 'select * from sp_department d where d.id_department=:id_otdel AND ''NOW'' BETWEEN d.Use_Beg AND d.Use_End';
      DataSetOtd.ParamByName('id_otdel').AsInt64 := id_otdel;

      DataSetOtd.Active := true;
      cxButtonEdit_otd.Text := DataSetOtd.FBN('name_full').AsString;

      DataSetOtd.Close;
      DataSetOtd.Free;
    end
    else
    begin
      DataSetOtd := TpFIBDataSet.Create(Self);
      DataSetOtd.Database    := Database;
      DataSetOtd.Transaction := RTransaction;
      DataSetOtd.SQLs.SelectSQL.Text := 'select d.*, s.local_department from ini_asup_consts s, sp_department d where  s.local_department=d.id_department AND ''NOW'' BETWEEN d.Use_Beg AND d.Use_End';
      DataSetOtd.Open;
      cxButtonEdit_otd.Text := DataSetOtd.FBN('name_full').AsString;
      id_otdel := DataSetOtd['id_department'];
      DataSetOtd.Active := false;
      DataSetOtd.Free;
    end;
  end;

end;

procedure TfrmShablon11.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  dxBarLargeButton_viewClick(Self);
end;

procedure TfrmShablon11.cxButton_histClick(Sender: TObject);
var
  kod_dog_l:int64;
  Hist: Variant;
  Query: TpFIBDataSet;
  MyQuery: TpFIBDataSet;
  Str:String;
begin
 Str:='select DDD.KOD_DOG ';
 Str:=Str+'from DOG_DT_DOCUMENT DDD ';
 Str:=Str+'where DDD.ID_DOG=:'+IntToStr(id_dog);
 MyQuery := TpFIBDataSet.Create(Self);
 MyQuery.Transaction := RTransaction;
 MyQuery.SelectSQL.Text :=Str;

 MyQuery.Open;
 MyQuery.Free;

 kod_dog_l:=MyQuery['KOD_DOG'];

 Query := TpFIBDataSet.Create(Self);
 Query.Transaction := RTransaction;
 Query.SelectSQL.Text := 'SELECT COUNT(id_history) FROM   dog_dt_document_history, dog_dt_document '+
                         'WHERE  dog_dt_document_history.id_dog=dog_dt_document.id_dog AND    dog_dt_document.id_dog='+IntToStr(id_dog);
 Query.Open;
 if (Query['count'] = 0) then
 begin
   ShowMessage('Історія зміни по цьому документу відсутня.');
   Exit;
 end
 else
 Hist:=LoadDogManedger.History_dog(self, Database.Handle, kod_dog_l, fsNormal);
end;


procedure TfrmShablon11.FormShow(Sender: TObject);
 var
  Str:String;
begin
   DataSet.Active := false;
   Str:=Dataset.SQLs.SelectSQL.Text;
   Dataset.SQLs.SelectSQL.Text :='select dog_sel_num_urzb_by_id_dog.id_urzb as NUM_URZB from dog_sel_num_urzb_by_id_dog('+IntToStr(kod_dog)+')';
   Dataset.Active := true;

   if  not(Dataset.IsEmpty) then  Caption:=Caption+'( № Юридичного зобо'+''''+'язання '+VarToStr(Dataset.FBN('NUM_URZB').AsVariant)+')';
   Dataset.Active := false;
   Dataset.SQLs.SelectSQL.Text:=Str;
end;

procedure TfrmShablon11.cxButton1Click(Sender: TObject);
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
  i['DBHandle'].AsInteger := integer(Database.handle);

  LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivTree.bpl', i, o);
  if o['MoadResult'].AsVariant = mrOk then
  begin

  cxMemo_note_dog.Text := o['name_osn'].AsString;
  end;
  i.Free;
  o.Free;
end;

end.
