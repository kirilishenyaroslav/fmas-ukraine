unit uCnCalcMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, cxButtons,
  cn_Common_Types, frxDesgn, frxClass, frxDBSet, DM_Calc, DB, FIBDataSet,
  pFIBDataSet, ActnList;

type
  TfmCalcMain = class(TForm)
    cxButtonOk: TcxButton;
    cxButtonCancel: TcxButton;
    Label1: TLabel;
    cxDateCalc: TcxDateEdit;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    DataSet: TpFIBDataSet;
    frxReport: TfrxReport;
    ActionList1: TActionList;
    acDebug: TAction;
    procedure FormCreate(Sender: TObject);
    procedure cxButtonCancelClick(Sender: TObject);
    procedure cxButtonOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acDebugExecute(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM :TdmCalc;
    DM2:TdmCalc;
    id_session_pay  : int64;
    id_session_calc : int64;
    ID_TRANSACTION  : int64;
    ID_STUD         : int64;
    ID_DOG_ROOT     : int64;
    NUM_DOG: string;
    NUM_SPRAV:String;
    DATE_DOG : TDate;
  public
    IsDebugMode: boolean;
    res:Variant;
    constructor Create(Aparameter:TcnSimpleParamsEx);reintroduce;
  end;

  function PrintCalc(AParameter:TcnSimpleParamsEx):Variant;stdcall;
  exports PrintCalc;

var
  fmCalcMain: TfmCalcMain;

implementation

{$R *.dfm}
function PrintCalc(AParameter:TcnSimpleParamsEx):Variant;stdcall;
var
  T: TfmCalcMain;
begin
  T:=TfmCalcMain.Create(AParameter);
  T.ShowModal;
  T.Free;
end;

constructor TfmCalcMain.Create(Aparameter:TcnSimpleParamsEx);
begin
  inherited Create(Aparameter.Owner);
  DM:=TdmCalc.Create(Self);
  DM.DB.Handle:=Aparameter.Db_Handle;
  ID_STUD:=AParameter.cnParamsToPakage.ID_STUD;
  ID_DOG_ROOT:=AParameter.cnParamsToPakage.ID_DOG_ROOT;
  NUM_DOG:=Aparameter.cnParamsToPakage.Num_Doc;
  DATE_DOG := Aparameter.cnParamsToPakage.DATE_DOG;
end;


procedure TfmCalcMain.FormCreate(Sender: TObject);
begin
  cxDateCalc.Date:=Date;
  cxButtonOk.Caption:='Прийняти';
  cxButtonCancel.Caption:='Відмінити';
end;

procedure TfmCalcMain.cxButtonCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCalcMain.cxButtonOkClick(Sender: TObject);
var cnUplSum, cnSumDoc, cnSNeed, SegodnyaOpl : Currency;
    cnDATEOPL: TDate;
    Cur_date:TDate;
    FIO:String;
begin
  DM.ReadDataSet.SelectSQL.Clear;
  DM.ReadDataSet.SelectSQL.Text:= 'select * from CN_DT_STUDINFO_CALC_SELECT('+ inttostr(ID_STUD) +')' ;
  DM.ReadDataSet.Open;
  FIO :=DM.ReadDataSet['FIO_PEOPLE'];

  DM.ReadDataSet.close;
  DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from CN_SUM_ENTRYREST_SELECT('+
                                         inttostr(ID_STUD)
                                         + ','+ inttostr(ID_DOG_ROOT)
                                         +')';
  DM.ReadDataSet.open;
  DM.ReadDataSet.Close;

  // формирование корректных счетов и операций на сегодня
  With DM.StProc do
              begin
              try
              StoredProcName:='CN_DATE_PROV_SYS_DATA_CHECK_UPT';
              Transaction.StartTransaction;
              Prepare;
              ExecProc;
              Transaction.Commit;
              Close;
              except
              Transaction.Rollback;
              ShowMessage('Произошла ошибка при выполнении процедуры CN_DATE_PROV_SYS_DATA_CHECK_UPT!'+ #13+'Сбой в работе системы.');
              raise;
            end;
   end;



  With DM.StProc do
  begin
    try
      StoredProcName := 'CN_PAY';
      Transaction.StartTransaction;
      Prepare;
      ParamByName('ID_STUD').AsInt64 := ID_STUD;
      ParamByName('DATE_PROV_CHECK').AsShort := 1;
      ParamByName('IS_DOC_GEN').AsShort := 1;
      ParamByName('IS_PROV_GEN').AsShort := 1;
      ParamByName('IS_SMET_GEN').AsShort := 1;
      ParamByName('NOFPROV').AsShort := 1;
      ParamByName('DIGNORDOCID').AsShort := 1;
      ExecProc;


      cnUplSum:=ParamByName('CNUPLSUM').AsCurrency;
      cnSumDoc:=ParamByName('SUMMA_ALL').AsCurrency;

      id_session_pay:= ParamByName('ID_SESSION').AsInt64;

      Transaction.Commit;
      Close;

      // --------------запуск процедуры cn_calc------------------------------
      //
      StoredProcName := 'CN_CALC';
      Transaction.StartTransaction;
      Prepare;
      ParamByName('ID_STUD').AsInt64 := ID_STUD;
      if cnUplSum > cnSumDoc then
        ParamByName('CNUPLSUM').AsCurrency := cnUplSum
      else
        ParamByName('CNUPLSUM').AsCurrency := cnSumDoc; // это уже с уплаченной суммой
      ExecProc;

      cnSNeed:= ParamByName('CN_SNEED').AsCurrency;      //  сумма, необходимая для уплаты за весь период
      cnDATEOPL:= ParamByName('CNDATEOPL').AsDateTime;   // дата, по которую оплачено

      id_session_calc:= ParamByName('ID_SESSION').AsInt64;

      Transaction.Commit;
      Close;

      StoredProcName := 'CN_CALC_TMP_CLEAR';
      Transaction.StartTransaction;
      Prepare;
      ParamByName('ID_SESSION').AsInt64 := id_session_calc;
      ExecProc;
      Transaction.Commit;
      Close;

      // --------------запуск процедуры cn_calc------------------------------
      Cur_date:= cxDateCalc.EditValue;

      //
      if (cnDATEOPL <= Cur_date) then
      begin
        StoredProcName := 'CN_CALC';
        Transaction.StartTransaction;
        Prepare;
        ParamByName('ID_STUD').AsInt64 := ID_STUD;
        ParamByName('BEG_CHECK').AsVariant := cnDATEOPL;
        ParamByName('CNUPLSUM').AsVariant := null;
        ParamByName('END_CHECK').AsDate := Cur_date;

        ExecProc;
        SegodnyaOpl:=ParamByName('cn_SNEED').AsCurrency;
        id_session_calc:= ParamByName('ID_SESSION').AsInt64;
        Transaction.Commit;
        Close;
      end
      else
        SegodnyaOpl:=0;

      StoredProcName := 'CN_CALC_TMP_CLEAR';
      Transaction.StartTransaction;
      Prepare;
      ParamByName('ID_SESSION').AsInt64 := id_session_calc;
      ExecProc;
      Transaction.Commit;
      Close;

      // новый способ вызова
      StoredProcName:='CN_FR_GET_ID_SESSION';
      Transaction.StartTransaction;
      Prepare;
      ExecProc;
      ID_TRANSACTION:= FieldByName('ID_SESSION').AsInt64;
      Transaction.Commit;
      Close;

      //отбор данных из базы
      StoredProcName:='CN_PRINT_CN_CALC';
      Transaction.StartTransaction;
      Prepare;
      ParamByName('ID_STUD').AsInt64:=ID_STUD;
      ParamByName('end_check').AsDate:=now;
      ParamByName('ID_SESSION').AsInt64:=ID_TRANSACTION;
      ExecProc;
      Transaction.Commit;
      Close;

      StoredProcName := 'CN_DT_NUMBER_SPAV_SELECT';
      Transaction.StartTransaction;
      Prepare;
      ExecProc;
      Num_Sprav:=ParamByName('number_sprav').AsString;
      Transaction.Commit;
      Close;
    except
      Transaction.Rollback;
      showmessage('Непередбачена помилка! Зверніться до Адміністратора.');
    raise;
    end;

    DM2:=TdmCalc.Create(Self);
    DM2.DB.Handle:=DM.DB.Handle;
    DM2.DataSet.SelectSQL.Clear;
    DM2.DataSet.SelectSQL.text:= 'select * from cn_tmp_print_cn_calc where id_session ='+ IntToStr(ID_TRANSACTION);
    DM2.DataSet.closeopen(true);

  end;


  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\'+'PeoplePay.fr3');
  frxReport.Variables.Clear;
  frxDBDataset1.DataSet:=DM2.DataSet;
  DataSet.Close;
  DataSet.SQLs.SelectSQL.Clear;
  DataSet.SQLs.SelectSQL.add('select psc.name_customer, cn_buhg, cn_buhg_title');
  DataSet.SQLs.SelectSQL.add('From pub_sys_data psd, pub_sp_customer psc');
  DataSet.SQLs.SelectSQL.add('where (psc.id_customer=psd.organization)');
  DataSet.Open;

  frxReport.Variables['Date']:=''''+DateToStr(Now)+'''';
  frxReport.Variables['NUM_DOG']:=''''+NUM_DOG+'''';
  frxReport.Variables['NUMBER']:=''''+NUM_SPRAV+'''';
  frxReport.Variables['DATE_DOG']:=''''+DateToStr(DATE_DOG)+'''';

  if DataSet['NAME_CUSTOMER'] <> null then
    frxReport.Variables['ORG']:=''''+DataSet['NAME_CUSTOMER']+'''';

  frxReport.Variables['NADO_FINAL']:=''''+FloatToStr(SegodnyaOpl)+'''';
  frxReport.Variables['PLATIL_FINAL']:=''''+FloatToStr(cnUplSum)+'''';

  if cnUplSum > cnSumDoc
   then frxReport.Variables['DOLG_FINAL']:= ''''+FloatTostr(cnSNeed - cnUplSum)+''''
   else frxReport.Variables['DOLG_FINAL']:= ''''+FloatToStr(cnSNeed - cnSumDoc)+'''';

  frxReport.Variables['CNDATEOPL']:=''''+DateToStr(cnDATEOPL)+'''';
  frxReport.Variables['FIO']:= QuotedStr(FIO);

  frxReport.Variables['PAYCONF1']:=''''+'Сплачено'+'''';
  frxReport.Variables['PAYCONF2']:=QuotedStr('повністю');

  if DataSet['CN_BUHG_TITLE'] <> null
   then frxReport.Variables['BUHG_TITLE']:=''''+DataSet['CN_BUHG_TITLE']+'''';

  if DataSet['CN_BUHG'] <> null
   then frxReport.Variables['BUHG']:=''''+DataSet['CN_BUHG']+'''';

  frxReport.PrepareReport;

  if IsDebugMode
   then frxReport.DesignReport
   else frxReport.ShowPreparedReport;
end;

procedure TfmCalcMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  With DM.StProc do
  begin
  StoredProcName := 'CN_PAY_TMP_CLEAR';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_SESSION').AsInt64 := id_session_pay;
  ExecProc;
  Transaction.Commit;
  Close;

  StoredProcName := 'CN_CALC_TMP_CLEAR';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_SESSION').AsInt64 := id_session_calc;
  ExecProc;
  Transaction.Commit;
  Close;

  StoredProcName := 'CN_TMP_PRINT_CN_CALC_DELETE';
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_SESSION').AsInt64:=ID_TRANSACTION;
  ExecProc;
  Transaction.Commit;
  Close;

  end;

  DM.Free;
  DM2.Free;
end;

procedure TfmCalcMain.acDebugExecute(Sender: TObject);
begin
 If not IsDebugMode
  then
   Begin
    IsDebugMode:=true;
    Caption:=' *debug';
   End
  Else
   Begin
    IsDebugMode:=false;
    Caption:='';
   End;
end;

end.
