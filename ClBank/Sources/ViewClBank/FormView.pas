unit FormView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, cxCalc, cxMaskEdit,
  ExtCtrls, cxMemo, cxTextEdit, cxButtonEdit, StdCtrls, cxControls,
  cxContainer, cxEdit, cxDropDownEdit, cxCalendar, ComCtrls,IBase,
  ConstClBank, cxLookAndFeelPainters, cxButtons;

type
  TfrmFormView = class(TForm)
    StatusBar1: TStatusBar;
    StatusBar2: TStatusBar;
    GroupBoxBuff: TGroupBox;
    GroupBoxDateDocBuff: TGroupBox;
    cxDateEditBuff: TcxDateEdit;
    GroupBoxDateVipBuff: TGroupBox;
    cxDateEditDateVipBuff: TcxDateEdit;
    GroupBoxRSCustormerBuff: TGroupBox;
    LabelMFO_ABuff: TLabel;
    LabelRS_Buff: TLabel;
    cxButtonEditRSPos_AtBuff: TcxButtonEdit;
    cxTextEditMFOPost_ABuff: TcxTextEdit;
    cxTextEditRR_APostBuff: TcxTextEdit;
    GroupBoxNoteBuff: TGroupBox;
    cxMemoNoteBuff: TcxMemo;
    GroupBoxNumberDocBuff: TGroupBox;
    cxMaskEditNumdocBuff: TcxMaskEdit;
    GroupBoxSummaBuff: TGroupBox;
    cxMaskEditSummaBuff: TcxCalcEdit;
    pFIBStoredProc: TpFIBStoredProc;
    Database: TpFIBDatabase;
    TransactionRead: TpFIBTransaction;
    TransactionWrite: TpFIBTransaction;
    ActionList1: TActionList;
    ActionAdd: TAction;
    pFIBDataSetEditDocBuff: TpFIBDataSet;
    cxButtonReplace: TcxButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cxButtonEditRSPos_BtBuff: TcxButtonEdit;
    cxTextEditMFOPost_BBuff: TcxTextEdit;
    cxTextEditRR_BPostBuff: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure cxButtonReplaceClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure work(IN_ID_KEY_LOCAL:Int64;IN_BANK:Int64;DB:TISC_DB_HANDLE);
    { Public declarations }
  end;

var
  frmFormView: TfrmFormView;
  LOC_ID_KEY_LOCAL:Int64;
  LOC_BANK:Int64;
implementation

{$R *.dfm}

procedure TfrmFormView.work(IN_ID_KEY_LOCAL:Int64;IN_BANK:Int64;DB:TISC_DB_HANDLE);
begin
  Database.Handle:=DB;
  LOC_ID_KEY_LOCAL:=IN_ID_KEY_LOCAL;
  LOC_BANK:=IN_BANK;

  //показываем документ из буффера

  pFIBDataSetEditDocBuff.Active:=false;
  pFIBDataSetEditDocBuff.ParamByName('ID_KEY_LOCAL').AsInt64:=IN_ID_KEY_LOCAL;
  pFIBDataSetEditDocBuff.Active:=true;

  cxDateEditBuff.Date:=pFIBDataSetEditDocBuff.FieldByName('DATE_DOC').AsDateTime;
  cxDateEditDateVipBuff.Date:=pFIBDataSetEditDocBuff.FieldByName('DATE_PROV').AsDateTime;

  cxMaskEditNumdocBuff.Text:=pFIBDataSetEditDocBuff.FieldByName('NUMBER_DOC').AsString;

  cxButtonEditRSPos_AtBuff.Text:='ОКПО_А '+pFIBDataSetEditDocBuff.FieldByName('OKPO_A').AsString+' '+pFIBDataSetEditDocBuff.FieldByName('NAME_CUSTOMER_A').AsString;
  cxTextEditMFOPost_ABuff.Text:='МФО_А_ '+pFIBDataSetEditDocBuff.FieldByName('MFO_A').AsString+' Банк_А '+pFIBDataSetEditDocBuff.FieldByName('BANK_A').AsString;
  cxTextEditRR_APostBuff.Text:=pFIBDataSetEditDocBuff.FieldByName('ACC_A').AsString;

  cxButtonEditRSPos_BtBuff.Text:='ОКПО_B '+pFIBDataSetEditDocBuff.FieldByName('OKPO_B').AsString+' '+pFIBDataSetEditDocBuff.FieldByName('NAME_CUSTOMER_B').AsString;
  cxTextEditMFOPost_BBuff.Text:='МФО_B '+pFIBDataSetEditDocBuff.FieldByName('MFO_B').AsString+' Банк_B '+pFIBDataSetEditDocBuff.FieldByName('BANK_B').AsString;
  cxTextEditRR_BPostBuff.Text:=pFIBDataSetEditDocBuff.FieldByName('ACC_B').AsString;
  cxMaskEditSummaBuff.Text:=pFIBDataSetEditDocBuff.FieldByName('SUM_DOC').AsString;
  cxMemoNoteBuff.Text:=pFIBDataSetEditDocBuff.FieldByName('DETAILS_DOC').AsString;


  ShowModal;
end;


procedure TfrmFormView.FormCreate(Sender: TObject);
begin
{  GroupBoxDateDocBuff.Caption:=ConstClBank.ClBank_date_doc;
  GroupBoxDateVipBuff.Caption:=ConstClBank.ClBank_date_vip;
  GroupBoxNumberDocBuff.Caption:=ConstClBank.ClBank_number_doc;
  GroupBoxSummaBuff.Caption:=ConstClBank.ClBank_summa;
  GroupBoxNoteBuff.Caption:=ConstClBank.ClBank_note;
  GroupBoxRSLemanBuff.Caption:=ConstClBank.ClBank_rs_native;
  GroupBoxRSCustormerBuff.Caption:=ConstClBank.ClBank_rs_customer;
  RadioGroupTypeDocBuff.Caption:=ConstClBank.ClBank_type_doc;
  RadioGroupTypeDocBuff.Items.Clear;
  RadioGroupTypeDocBuff.Items.Add(ConstClBank.ClBank_prihod);
  RadioGroupTypeDocBuff.Items.Add(ConstClBank.ClBank_rashod);
  LabelMFO_Buff.Caption:=ConstClBank.ClBank_mfo;
  LabelRS_Buff.Caption:=ConstClBank.ClBank_rs;}
end;

procedure TfrmFormView.cxButtonReplaceClick(Sender: TObject);
begin
  Close;
end;

end.
