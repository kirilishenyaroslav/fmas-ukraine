program Kassa;

uses
  Forms,
  Controls,
  AccMGMT,
  MainFormKassa in 'MainFormKassa.pas' {fmMainForm},
  NastroykaKassa in 'NastroykaKassa.pas' {fmNastroyka},
  SplashFormKassa in 'SplashFormKassa.pas' {fmSplashForm},
  LogInFormUnit in 'LogInFormUnit.pas' {LogInForm},
  fmPrintKassaJo in 'fmPrintKassaJo.pas' {PrintKassaJo},
  ClosePeriodKassa in 'ClosePeriodKassa.pas' {fmClosePeriodKassa},
  ProgressFormKassa in 'ProgressFormKassa.pas' {fmProgressFormKassa},
  KassaInfo in 'KassaInfo.pas' {fmKassaInfo},
  KassaService in 'KassaService.pas' {fmKassaService};

{$R *.res}
var
    Form : TLogInForm;
    InR  : TResultInfo;
begin
    Application.Initialize;
    Application.Title := 'Касса';
    Form := TLogInForm.Create(nil);
    if Form.ShowModal = mrOk then
    begin
        InR := Form.InitResult;
        Form.Free;
        Application.CreateForm(TfmMainForm, fmMainForm);
  
  fmMainForm.Database.Handle := InR.DBHandle;
        fmMainForm.pFIBTransaction1.DefaultDatabase := fmMainForm.Database;
        fmMainForm.pFIBTransaction1.StartTransaction;
        fmMainForm.pFIBDataSet1.Close;
        fmMainForm.pFIBDataSet1.SQLs.SelectSQL.Text := 'select cust.SHORT_NAME as NAME from PUB_SYS_DATA s, PUB_SP_CUSTOMER cust where cust.ID_CUSTOMER = s.ORGANIZATION';
        fmMainForm.pFIBDataSet1.Open;
        fmMainForm.CAPTION := fmMainForm.pFIBDataSet1.FBN('NAME').AsString + ' ' + fmMainForm.CAPTION;
        fmMainForm.pFIBDataSet1.close;
        Application.Run;
    end else
    begin
        Application.Terminate;
        Form.Free;
    end;

end.

