unit UCloseSysThread;


interface

uses
  Classes, Forms,ComCtrls, Ibase,pFibStoredProc, Dialogs, Windows;

type
  TCloseSysThread = class(TThread)
  private
        SysDate:TDateTime;
        Form:TForm;
  protected
        procedure Execute; override;
  public
        constructor Create(CreateSuspended: Boolean; Form:TForm;SysDate:TDateTime);overload;
  end;

implementation

uses DateUtils,SysUtils,GlobalSpr, UMainAccounts,BaseTypes;


constructor TCloseSysThread.Create(CreateSuspended: Boolean; Form:TForm;SysDate:TDateTime);
begin
    inherited Create(true);
    self.Form:=Form;
    self.SysDate:=SysDate;
end;


procedure TCloseSysThread.Execute;
var DoSP:TpFibStoredProc;
begin
    try
            DoSP:=TpFibStoredProc.Create(nil);
            DoSP.Database   :=TfrmAccountMain(self.Form).WorkDatabase;
            DoSP.Transaction:=TfrmAccountMain(self.Form).WriteTransaction;
            TfrmAccountMain(self.Form).WriteTransaction.StartTransaction;

            DoSP.StoredProcName:='ST_ACCOUNTS_MAKE_SALDO';
            DoSP.Prepare;

            DoSP.ParamByName('KEY_SESSION').AsInt64     :=TfrmAccountMain(self.Form).CALC_KEY_SESSION;
            DoSP.ParamByName('NEW_OST_DATE').Value      :=SysDate;

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

