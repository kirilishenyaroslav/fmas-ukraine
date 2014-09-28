program Vedomost;

uses
  Forms,
  Controls,
  AccMgmt,
  UWMainForm in 'UWMainForm.pas' {fmUWMainForm},
  LogInFormUnitUW in 'LogInFormUnitUW.pas' {fmLogInFormUnitUW},
  SplashFormUW in 'SplashFormUW.pas' {fmSplashFormUW};

{$R *.res}

var
    Form : TfmLogInFormUnitUW;
    InR  : TResultInfo;
begin
    Application.Initialize;
    Application.Title := 'Облік відомостей';
  Form := TfmLogInFormUnitUW.Create(nil);
    if Form.ShowModal = mrOk then
    begin
        InR := Form.InitResult;
        Form.Free;
        Application.CreateForm(TfmUWMainForm, fmUWMainForm);
  fmUWMainForm.Database.Handle := InR.DBHandle;
        fmUWMainForm.pFIBTransaction1.DefaultDatabase := fmUWMainForm.Database;
        fmUWMainForm.pFIBTransaction1.StartTransaction;
        fmUWMainForm.pFIBDataSet1.Close;
        fmUWMainForm.pFIBDataSet1.SQLs.SelectSQL.Text := 'select cust.SHORT_NAME as NAME from PUB_SYS_DATA s, PUB_SP_CUSTOMER cust where cust.ID_CUSTOMER = s.ORGANIZATION';
        fmUWMainForm.pFIBDataSet1.Open;
        fmUWMainForm.CAPTION := fmUWMainForm.pFIBDataSet1.FBN('NAME').AsString + ' ' + fmUWMainForm.CAPTION;
        fmUWMainForm.pFIBDataSet1.close;
        Application.Run;
    end else
    begin
        Application.Terminate;
        Form.Free;
    end;
end.
