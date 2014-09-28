program UO;

uses
  Forms,
  Controls,
  AccMgmt,
  UOMainForm in 'UOMainForm.pas' {fmUOMainForm},
  UOLoadUsers in 'UOLoadUsers.pas' {fmUOLoadUsers},
  UoOptionWork in 'UoOptionWork.pas' {FormOptionWork};

{$R *.res}

var
    Form : TfmUOLoadUsers;
    InR  : TResultInfo;
begin
    Application.Initialize;
    Application.Title := 'Óקבמגטי ג³הה³כ';
    Form := TfmUOLoadUsers.Create(nil);
    if Form.ShowModal = mrOk then
    begin
        InR := Form.InitResult;
        Form.Free;
        Application.CreateForm(TfmUOMainForm, fmUOMainForm);
  fmUOMainForm.Database.Handle := InR.DBHandle;
        fmUOMainForm.pFIBTransaction1.DefaultDatabase := fmUOMainForm.Database;
        fmUOMainForm.pFIBTransaction1.StartTransaction;
        fmUOMainForm.pFIBDataSet1.Close;
        fmUOMainForm.pFIBDataSet1.SQLs.SelectSQL.Text := 'select cust.SHORT_NAME as NAME from PUB_SYS_DATA s, PUB_SP_CUSTOMER cust where cust.ID_CUSTOMER = s.ORGANIZATION';
        fmUOMainForm.pFIBDataSet1.Open;
        fmUOMainForm.CAPTION := fmUOMainForm.pFIBDataSet1.FBN('NAME').AsString + ' ' + fmUOMainForm.CAPTION;
        fmUOMainForm.pFIBDataSet1.close;
        Application.Run;
    end else
    begin
        Application.Terminate;
        Form.Free;
    end;
end.
