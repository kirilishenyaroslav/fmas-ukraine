program AvanseOtchet;

uses
  Forms,
  Controls,
  AccMgmt,
  MainForm in 'MainForm.pas' {fmAvanceMainForm},
  Nastroyka in 'Nastroyka.pas' {fmNastroyka},
  SplashForm in 'SplashForm.pas' {fmSplashForm},
  LogInFormUnit in 'LogInFormUnit.pas' {LogInForm},
  ProgressFormAvance in 'ProgressFormAvance.pas' {fmProgressFormAvance},
  AvanceInfo in 'AvanceInfo.pas' {fmAvanceInfo},
  AvancePrintForm in 'AvancePrintForm.pas' {fmPrintForm},
  ClosePeriodAvance in 'ClosePeriodAvance.pas' {fmClosePeriodAvance},
  AvancePrintFormNewAlg in 'AvancePrintFormNewAlg.pas' {AvancePrintFormNewAlg},
  MainAvanceMonthSelect in 'MainAvanceMonthSelect.pas' {fmMainAvanceMonthSelect};

{$R *.res}

var
    Form : TLogInForm;
    InR  : TResultInfo;
    v : integer;
begin
    Application.Initialize;
    Application.Title := 'ÓÐñÏË';
    Form := TLogInForm.Create(nil);
    if Form.ShowModal = mrOk then
    begin
        InR := Form.InitResult;
        Form.Free;
        Application.CreateForm(TfmAvanceMainForm, fmAvanceMainForm);
        fmAvanceMainForm.Database.Handle := InR.DBHandle;
        fmAvanceMainForm.pFIBTransaction1.DefaultDatabase := fmAvanceMainForm.Database;
        fmAvanceMainForm.pFIBTransaction1.StartTransaction;
        fmAvanceMainForm.pFIBDataSet1.Close;
        fmAvanceMainForm.pFIBDataSet1.SQLs.SelectSQL.Text := 'select cust.SHORT_NAME as NAME from PUB_SYS_DATA s, PUB_SP_CUSTOMER cust where cust.ID_CUSTOMER = s.ORGANIZATION';
        fmAvanceMainForm.pFIBDataSet1.Open;
        fmAvanceMainForm.CAPTION := fmAvanceMainForm.pFIBDataSet1.FBN('NAME').AsString + ' ' + fmAvanceMainForm.CAPTION;
        fmAvanceMainForm.pFIBDataSet1.close;
        fmAvanceMainForm.pFIBDataSet1.sqls.selectSql.text := 'SELECT * FROM J4_INI';
        fmAvanceMainForm.pFIBDataSet1.Open;

        fmAvanceMainForm.DataSetNeos.Database    := fmAvanceMainForm.Database;
        fmAvanceMainForm.DataSetNeos.Transaction := fmAvanceMainForm.pFIBTransaction1;

       // fmAvanceMainForm.DSetIni.Database        := fmAvanceMainForm.Database;
       // fmAvanceMainForm.DSetIni.Transaction     := fmAvanceMainForm.pFIBTransaction1;

        fmAvanceMainForm.DataSetLang.Database    := fmAvanceMainForm.Database;
        fmAvanceMainForm.DataSetLang.Transaction := fmAvanceMainForm.pFIBTransaction1;

        fmAvanceMainForm.new_alg  := fmAvanceMainForm.pFIBDataSet1.FieldByName('FLAG_NEW_ALGORITHM').AsInteger;
        fmAvanceMainForm.date_alg := fmAvanceMainForm.pFIBDataSet1.FieldByName('DATE_NEW_ALGORITHM').AsDateTime;

        try v := fmAvanceMainForm.pFIBDataSet1.fbn('IS_USED_VEDOMOST').AsInteger; except v := 0; end;

        if (fmAvanceMainForm.pFIBDataSet1.fbn('J4_IS_VIEW_MO_ZVED_ZVIT').AsInteger = 1)
            then fmAvanceMainForm.N17.Visible := true
            else fmAvanceMainForm.N17.Visible := false;

        if v = 1
            then fmAvanceMainForm.N23.Visible := true
            else fmAvanceMainForm.N23.Visible := false;

        fmAvanceMainForm.pFIBDataSet1.close;
        Application.Run;
    end else
    begin
        Application.Terminate;
        Form.Free;
    end;
end.
