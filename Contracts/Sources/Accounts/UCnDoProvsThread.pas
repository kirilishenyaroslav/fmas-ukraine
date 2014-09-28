unit UCnDoProvsThread;

interface

uses
  Classes, Forms,ComCtrls, Ibase,pFibStoredProc, Dialogs, Windows,
  cn_Common_Funcs;

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

uses DateUtils,SysUtils,GlobalSpr, UCnMainAccounts,BaseTypes, Kernel;


constructor TDoProvsThread.Create(CreateSuspended: Boolean; Form:TForm);
begin
    inherited Create(true);
    self.Form:=Form;
end;


procedure TDoProvsThread.Execute;
var DoSP:TpFibStoredProc;
    ErrorList:TStringList;
    MSG_STRING:String;
    Stru:KERNEL_MODE_STRUCTURE;
    i:Integer;
begin
  //start_sql_monitor;
       try
            DoSP:=TpFibStoredProc.Create(nil);
            DoSP.Database   :=TfrmAccountMain(self.Form).WorkDatabase;
            DoSP.Transaction:=TfrmAccountMain(self.Form).WriteTransaction;
            TfrmAccountMain(self.Form).WriteTransaction.StartTransaction;

            DoSP.StoredProcName:='CN_ACCOUNTS_PROV';
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
                       STRU.DBHANDLE:=TfrmAccountMain(self.Form).WorkDatabase.Handle;
                       STRU.TRHANDLE:=TfrmAccountMain(self.Form).WriteTransaction.Handle;
                       STRU.KEY_SESSION:=TfrmAccountMain(self.Form).CALC_KEY_SESSION;
                       ErrorList:=Kernel.GetDocErrorsListEx(@STRU);
                       MSG_STRING:='При видаленні документа були виявленні помилки. '+Chr(10)+chr(13);
                       if ErrorList<>nil
                       then begin
                                 for i:=0 to  ErrorList.Count-1 do
                                 begin
                                      MSG_STRING:=MSG_STRING+' ПОМИЛКА- '+ErrorList.Strings[i];
                                 end;
                       end;
                       TfrmAccountMain(self.Form).ErrorID_KOD:=MSG_STRING;
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

                   //Send_mail(e.Message);
                 end;
       end;
  //stop_sql_monitor;
end;

end.

