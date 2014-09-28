unit UDoProvsThread;

interface

uses
  Classes, Forms,ComCtrls, Ibase,pFibStoredProc, Dialogs, Windows;

type
  TDoProvsThread = class(TThread)
  private
    { Private declarations }
    Form:TForm;
  protected
        procedure Execute; override;
  public
        constructor Create(CreateSuspended: Boolean; Form:TForm);overload;
  end;

implementation

uses DateUtils,SysUtils,GlobalSpr, UMainAccounts,BaseTypes;


constructor TDoProvsThread.Create(CreateSuspended: Boolean; Form:TForm);
begin
    inherited Create(true);
    self.Form:=Form;
end;


procedure TDoProvsThread.Execute;
var DoSP:TpFibStoredProc;
begin
       try


            DoSP:=TpFibStoredProc.Create(nil);
            DoSP.Database   :=TfrmAccountMain(self.Form).WorkDatabase;
            DoSP.Transaction:=TfrmAccountMain(self.Form).WriteTransaction;
            TfrmAccountMain(self.Form).WriteTransaction.StartTransaction;

            DoSP.StoredProcName:='ST_ACCOUNTS_PROV';
            DoSP.Prepare;

            DoSP.ParamByName('KEY_SESSION').AsInt64     :=TfrmAccountMain(self.Form).CALC_KEY_SESSION;
            DoSP.ParamByName('ID_ACCOUNT').AsInt64      :=StrToInt64(TfrmAccountMain(self.Form).AccDataSet.FieldByName('ID_ACCOUNT').AsString);
            DoSP.ParamByName('ID_USER').AsInt64         :=TfrmAccountMain(self.Form).Id_User;
            DoSP.ParamByName('COMPUTER').AsString       :=GlobalSpr.GetComputerNetName;

            DoSP.ExecProc;

            if (DoSP.ParamByName('RESULT').AsInteger=1)
            then begin
                       if Assigned(TfrmAccountMain(self.Form).Calculat_Thread)
                       then TfrmAccountMain(self.Form).Calculat_Thread.Terminate;
                       TfrmAccountMain(self.Form).WriteTransaction.Commit;
                       TfrmAccountMain(self.Form).DoResult:=1;

            end
            else begin
                       TfrmAccountMain(self.Form).ErrorID_KOD:=DoSP.ParamByName('WARNING_MSG').AsString;
                       if Assigned(TfrmAccountMain(self.Form).Calculat_Thread)
                       then TfrmAccountMain(self.Form).Calculat_Thread.Terminate;
                       TfrmAccountMain(self.Form).WriteTransaction.Rollback;
                       TfrmAccountMain(self.Form).DoResult:=0;

            end;
            DoSP.Free;

       except on E:Exception do
                 begin
                       if Assigned(TfrmAccountMain(self.Form).Calculat_Thread)
                       then TfrmAccountMain(self.Form).Calculat_Thread.Terminate;

                       if TfrmAccountMain(self.Form).WriteTransaction.InTransaction
                       then TfrmAccountMain(self.Form).WriteTransaction.Rollback;
                       TfrmAccountMain(self.Form).DoResult:=0;
                 end;
       end;

end;

end.

