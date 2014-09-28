unit WorkWithDublicate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList,
  FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc, DB,
  FIBDataSet, pFIBDataSet, cxCalc, cxMaskEdit, ExtCtrls, cxMemo,
  cxTextEdit, cxButtonEdit, cxControls, cxContainer, cxEdit,
  cxDropDownEdit, cxCalendar,ConstClBank,IBase;

type
  TfrmWorkWithDublicate = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    cxButtonReplace: TcxButton;
    cxButtonReplaceAll: TcxButton;
    cxButtonIgnor: TcxButton;
    cxButtonIgnorAll: TcxButton;
    cxButtonAdd: TcxButton;
    cxButtonAddAll: TcxButton;
    StatusBar2: TStatusBar;
    GroupBoxDb: TGroupBox;
    GroupBoxDateDoc: TGroupBox;
    cxDateEditDoc: TcxDateEdit;
    GroupBoxDateVip: TGroupBox;
    cxDateEditDateVip: TcxDateEdit;
    GroupBoxRSCustormer: TGroupBox;
    LabelMFO_: TLabel;
    LabelRS_: TLabel;
    cxButtonEditRSPost: TcxButtonEdit;
    cxTextEditMFOPost: TcxTextEdit;
    cxTextEditPSPost: TcxTextEdit;
    GroupBoxNote: TGroupBox;
    cxMemoNote: TcxMemo;
    RadioGroupTypeDoc: TRadioGroup;
    GroupBoxNumberDoc: TGroupBox;
    cxMaskEditNumdoc: TcxMaskEdit;
    GroupBoxSumma: TGroupBox;
    cxMaskEditSumma: TcxCalcEdit;
    GroupBoxRSLeman: TGroupBox;
    cxButtonEditRSNative: TcxButtonEdit;
    pFIBDataSetEditDoc: TpFIBDataSet;
    pFIBStoredProc: TpFIBStoredProc;
    Database: TpFIBDatabase;
    TransactionRead: TpFIBTransaction;
    TransactionWrite: TpFIBTransaction;
    ActionList1: TActionList;
    ActionAdd: TAction;
    pFIBDataSetWorkDublicate: TpFIBDataSet;
    GroupBoxBuff: TGroupBox;
    GroupBoxDateDocBuff: TGroupBox;
    cxDateEditBuff: TcxDateEdit;
    GroupBoxDateVipBuff: TGroupBox;
    cxDateEditDateVipBuff: TcxDateEdit;
    GroupBoxRSCustormerBuff: TGroupBox;
    LabelMFO_Buff: TLabel;
    LabelRS_Buff: TLabel;
    cxButtonEditRSPostBuff: TcxButtonEdit;
    cxTextEditMFOPostBuff: TcxTextEdit;
    cxTextEditPSPostBuff: TcxTextEdit;
    GroupBoxNoteBuff: TGroupBox;
    cxMemoNoteBuff: TcxMemo;
    RadioGroupTypeDocBuff: TRadioGroup;
    GroupBoxNumberDocBuff: TGroupBox;
    cxMaskEditNumdocBuff: TcxMaskEdit;
    GroupBoxSummaBuff: TGroupBox;
    cxMaskEditSummaBuff: TcxCalcEdit;
    GroupBoxRSLemanBuff: TGroupBox;
    cxButtonEditRSNativeBuff: TcxButtonEdit;
    pFIBDataSetEditDocBuff: TpFIBDataSet;
    pFIBDataSetIgnor: TpFIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure cxButtonIgnorClick(Sender: TObject);
    procedure cxButtonIgnorAllClick(Sender: TObject);
    procedure cxButtonAddClick(Sender: TObject);
    procedure cxButtonAddAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure work(IN_ID_KEY_LOCAL:Int64;IN_BANK:Int64;DB:TISC_DB_HANDLE);
    { Public declarations }
  end;

var
  frmWorkWithDublicate: TfrmWorkWithDublicate;
  LOC_ID_KEY_LOCAL:Int64;
  LOC_BANK:Int64;
implementation

{$R *.dfm}

procedure TfrmWorkWithDublicate.work(IN_ID_KEY_LOCAL:Int64;IN_BANK:Int64;DB:TISC_DB_HANDLE);
begin
  Database.Handle:=DB;
  LOC_ID_KEY_LOCAL:=IN_ID_KEY_LOCAL;
  LOC_BANK:=IN_BANK;

  pFIBDataSetWorkDublicate.Database:=Database;
  pFIBDataSetWorkDublicate.Transaction:=TransactionRead;
  pFIBDataSetWorkDublicate.Active:=false;
  pFIBDataSetWorkDublicate.ParamByName('ID_KEY_LOCAL').AsInt64:=LOC_ID_KEY_LOCAL;
  pFIBDataSetWorkDublicate.ParamByName('IN_BANK').AsInt64:=LOC_BANK;
  pFIBDataSetWorkDublicate.Active:=true;

  GroupBoxDb.Caption:=GroupBoxDb.Caption+'(Кількість документів:'+  VarToStr(pFIBDataSetWorkDublicate.FieldByName('OUT_CNT_DB').AsVariant)+')';
  GroupBoxBuff.Caption:=GroupBoxBuff.Caption+'(Кількість документів:'+  VarToStr(pFIBDataSetWorkDublicate.FieldByName('OUT_CNT_BUFF').AsVariant)+')';

  //показываем документ из БД
  pFIBDataSetEditDoc.Active:=false;
  pFIBDataSetEditDoc.ParamByName('param_doc').AsInt64:=pFIBDataSetWorkDublicate.FieldByName('OUT_ID_DOC_DB').asVariant;
  pFIBDataSetEditDoc.Active:=true;
  cxDateEditDoc.Date:=pFIBDataSetEditDoc.FieldByName('date_doc').AsDateTime;
  cxDateEditDateVip.Date:=pFIBDataSetEditDoc.FieldByName('date_vip').AsDateTime;
  if pFIBDataSetEditDoc.FieldByName('type_doc').AsInteger=1 then
    begin
      RadioGroupTypeDoc.ItemIndex:=0;
    end
    else
    begin
      RadioGroupTypeDoc.ItemIndex:=1;
    end;
  cxMaskEditNumdoc.Text:=pFIBDataSetEditDoc.FieldByName('num_doc').AsString;
  cxButtonEditRSNative.Text:=pFIBDataSetEditDoc.FieldByName('native_MFO').AsString+' '+pFIBDataSetEditDoc.FieldByName('native_rate_account').AsString;
  cxButtonEditRSPost.Text:=pFIBDataSetEditDoc.FieldByName('p_name_cust').AsString;
  cxTextEditMFOPost.Text:=pFIBDataSetEditDoc.FieldByName('p_MFO').AsString;
  cxTextEditPSPost.Text:=pFIBDataSetEditDoc.FieldByName('p_rate_account').AsString;
  cxMaskEditSumma.Text:=pFIBDataSetEditDoc.FieldByName('sum_doc').AsString;
  cxMemoNote.Text:=pFIBDataSetEditDoc.FieldByName('note').AsString;


  pFIBDataSetEditDocBuff.Database:=Database;
  pFIBDataSetEditDocBuff.Transaction:=TransactionRead;
  pFIBDataSetEditDocBuff.Active:=false;
  pFIBDataSetEditDocBuff.ParamByName('ID_KEY_LOCAL').AsInt64:=LOC_ID_KEY_LOCAL;
  pFIBDataSetEditDocBuff.ParamByName('IN_BANK').AsInt64:=LOC_BANK;
  pFIBDataSetEditDocBuff.Active:=true;

  //показываем документ из буффера

  cxDateEditBuff.Date:=pFIBDataSetEditDocBuff.FieldByName('out_date_doc').AsDateTime;
  cxDateEditDateVipBuff.Date:=pFIBDataSetEditDocBuff.FieldByName('out_date_vip').AsDateTime;
  if pFIBDataSetEditDocBuff.FieldByName('out_type_doc').AsInteger=1 then
    begin
      RadioGroupTypeDocBuff.ItemIndex:=0;
    end
    else
    begin
      RadioGroupTypeDocBuff.ItemIndex:=1;
    end;
  cxMaskEditNumdocBuff.Text:=pFIBDataSetEditDocBuff.FieldByName('out_num_doc').AsString;
  cxButtonEditRSNativeBuff.Text:=pFIBDataSetEditDocBuff.FieldByName('OUT_NATIVE').AsString;
  cxTextEditMFOPostBuff.Text:=pFIBDataSetEditDocBuff.FieldByName('OUT_MFO').AsString;
  cxTextEditPSPostBuff.Text:=pFIBDataSetEditDocBuff.FieldByName('OUT_RS').AsString;
  cxMaskEditSummaBuff.Text:=pFIBDataSetEditDocBuff.FieldByName('OUT_SUMMA').AsString;
  cxMemoNoteBuff.Text:=pFIBDataSetEditDocBuff.FieldByName('OUT_NOTE').AsString;
  cxButtonEditRSPostBuff.Text:=pFIBDataSetEditDocBuff.FieldByName('OUT_CUSTOMER').AsString;

  ShowModal;
end;

procedure TfrmWorkWithDublicate.FormCreate(Sender: TObject);
begin
  GroupBoxDateDoc.Caption:=ConstClBank.ClBank_date_doc;
  GroupBoxDateVip.Caption:=ConstClBank.ClBank_date_vip;
  GroupBoxNumberDoc.Caption:=ConstClBank.ClBank_number_doc;
  GroupBoxSumma.Caption:=ConstClBank.ClBank_summa;
  GroupBoxNote.Caption:=ConstClBank.ClBank_note;
  GroupBoxRSLeman.Caption:=ConstClBank.ClBank_rs_native;
  GroupBoxRSCustormer.Caption:=ConstClBank.ClBank_rs_customer;
  RadioGroupTypeDoc.Caption:=ConstClBank.ClBank_type_doc;
  RadioGroupTypeDoc.Items.Clear;
  RadioGroupTypeDoc.Items.Add(ConstClBank.ClBank_prihod);
  RadioGroupTypeDoc.Items.Add(ConstClBank.ClBank_rashod);
  LabelMFO_.Caption:=ConstClBank.ClBank_mfo;
  LabelRS_.Caption:=ConstClBank.ClBank_rs;

  GroupBoxDateDocBuff.Caption:=ConstClBank.ClBank_date_doc;
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
  LabelRS_Buff.Caption:=ConstClBank.ClBank_rs;

end;

procedure TfrmWorkWithDublicate.cxButtonIgnorClick(Sender: TObject);
begin
  pFIBStoredProc.StoredProcName:='CLBANK_DEL_DUBLICATE';
  TransactionWrite.StartTransaction;
  pFIBStoredProc.Prepare;
  pFIBStoredProc.ParamByName('IN_ID_KEY_LOCAL').AsInt64:=LOC_ID_KEY_LOCAL;
  try
    pFIBStoredProc.ExecProc;
    except
      begin
        TransactionWrite.Rollback;
        Exit;
      end;
  end;
  TransactionWrite.Commit;
close;  
end;

procedure TfrmWorkWithDublicate.cxButtonIgnorAllClick(Sender: TObject);
var
  i:Integer;
begin
  pFIBDataSetIgnor.Database:=Database;
  pFIBDataSetIgnor.Transaction:=TransactionRead;
  pFIBDataSetIgnor.Active:=false;
  pFIBDataSetIgnor.ParamByName('ID_KEY_LOCAL').AsInt64:=LOC_ID_KEY_LOCAL;
  pFIBDataSetIgnor.ParamByName('ID_BANK').AsInt64:=LOC_BANK;
  pFIBDataSetIgnor.Active:=true;
  pFIBDataSetIgnor.FetchAll;

  for i:=0 to pFIBDataSetIgnor.RecordCount-1 do
    begin
      pFIBStoredProc.StoredProcName:='CLBANK_DEL_DUBLICATE';
      TransactionWrite.StartTransaction;
      pFIBStoredProc.Prepare;
      pFIBStoredProc.ParamByName('IN_ID_KEY_LOCAL').AsInt64:=pFIBDataSetIgnor.FieldByName('OUT_ID_DOC_BUFF').asVariant;
      try
        pFIBStoredProc.ExecProc;
        except
          begin
            TransactionWrite.Rollback;
            Exit;
          end;
      end;
      TransactionWrite.Commit;
    end;
close;
end;

procedure TfrmWorkWithDublicate.cxButtonAddClick(Sender: TObject);
begin

pFIBStoredProc.StoredProcName:='CLBANK_TMP_BUFFER_START';
TransactionWrite.StartTransaction;
pFIBStoredProc.Prepare;
pFIBStoredProc.ParamByName('ID_KEY_LOCAL').AsInt64:=LOC_ID_KEY_LOCAL;
pFIBStoredProc.ParamByName('IN_SAVE').AsInteger:=1;
try
  pFIBStoredProc.ExecProc;
  except
    begin
    TransactionWrite.Rollback;
    Exit;
    end;
  end;
TransactionWrite.Commit;
close;
end;

procedure TfrmWorkWithDublicate.cxButtonAddAllClick(Sender: TObject);
var
  i:Integer;
begin
  pFIBDataSetIgnor.Database:=Database;
  pFIBDataSetIgnor.Transaction:=TransactionRead;
  pFIBDataSetIgnor.Active:=false;
  pFIBDataSetIgnor.ParamByName('ID_KEY_LOCAL').AsInt64:=LOC_ID_KEY_LOCAL;
  pFIBDataSetIgnor.ParamByName('ID_BANK').AsInt64:=LOC_BANK;
  pFIBDataSetIgnor.Active:=true;
  pFIBDataSetIgnor.FetchAll;

  for i:=0 to pFIBDataSetIgnor.RecordCount-1 do
    begin
      pFIBStoredProc.StoredProcName:='CLBANK_TMP_BUFFER_START';
      TransactionWrite.StartTransaction;
      pFIBStoredProc.Prepare;
      pFIBStoredProc.ParamByName('ID_KEY_LOCAL').AsInt64:=pFIBDataSetIgnor.FieldByName('OUT_ID_DOC_BUFF').asVariant;
      pFIBStoredProc.ParamByName('IN_SAVE').AsInteger:=1;
      try
        pFIBStoredProc.ExecProc;
        except
          begin
          TransactionWrite.Rollback;
          Exit;
          end;
        end;
      TransactionWrite.Commit;
    end;
close;
end;

end.
