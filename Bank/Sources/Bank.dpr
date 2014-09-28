program Bank;

uses
  Forms,
  Controls,
  AccMgmt,
  BankMainForm in 'MainFormBank\BankMainForm.pas' {fmBankMainForm},
  SplashFormBank in 'MainFormBank\SplashFormBank.pas' {fmSplashFormBank},
  bankInfo in 'MainFormBank\bankInfo.pas' {fmBankInfo},
  LogInFormUnitBank in 'MainFormBank\LogInFormUnitBank.pas' {fmLogInFormUnitBank},
  ProgressFormBank in 'MainFormBank\ProgressFormBank.pas' {fmProgressFormBank},
  PrintBankJo in 'MainFormBank\PrintBankJo.pas' {fmPrintBankJo},
  Bank_service in 'MainFormBank\Bank_service.pas' {fmBankService};

{$R *.res}

{begin
  Application.Initialize;
  Application.CreateForm(TfmBankMainForm, fmBankMainForm);
  Application.Run;
end.}

var
    Form : TfmLogInFormUnitBank;
    InR  : TResultInfo;
begin
    Application.Initialize;
    Application.Title := 'Банк';
    Form := TfmLogInFormUnitBank.Create(nil);
    if Form.ShowModal = mrOk then
    begin
        InR := Form.InitResult;
        Form.Free;
        Application.CreateForm(TfmBankMainForm, fmBankMainForm);
  fmBankMainForm.Database.Handle := InR.DBHandle;
        fmBankMainForm.pFIBTransaction1.DefaultDatabase := fmBankMainForm.Database;
        fmBankMainForm.pFIBTransaction1.StartTransaction;
        fmBankMainForm.pFIBDataSet1.Close;
        fmBankMainForm.pFIBDataSet1.SQLs.SelectSQL.Text := 'select cust.SHORT_NAME as NAME from PUB_SYS_DATA s, PUB_SP_CUSTOMER cust where cust.ID_CUSTOMER = s.ORGANIZATION';
        fmBankMainForm.pFIBDataSet1.Open;
        fmBankMainForm.CAPTION := fmBankMainForm.pFIBDataSet1.FBN('NAME').AsString + ' ' + fmBankMainForm.CAPTION;
        fmBankMainForm.pFIBDataSet1.close;
        Application.Run;
    end else
    begin
        Application.Terminate;
        Form.Free;
    end;
end.
