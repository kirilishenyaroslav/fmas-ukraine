unit UDoCalculationsThread;

interface

uses
  Classes, Forms,ComCtrls, Ibase,pFibStoredProc, Dialogs, Windows,
  pFibDataSet,  StdCtrls, Controls;

type
  UDoCalclationsThread = class(TThread)
  private
        DoCalc:Boolean;
        DoRecalc:Boolean;
        DoAll:Boolean;
        FixedIdKod:Int64;
        PBStep:Integer;
        Form:TForm;
        GlobalProcessPB:TProgressBar;
        lbGlobalProcess:TLabel;
        GetDataMode:Integer;
        TypeCalc:Integer;
        FID_SESSION_FILTER:Int64;
        id_kod:string;
        WarnModalResult:TModalResult;
        procedure UpdatePB;
        procedure UpdateLB;
        procedure ClearPB;
        procedure ClearLB;
        procedure ShowWarnForm;
  protected
        procedure Execute; override;
  public
        constructor Create(CreateSuspended: Boolean;
                           Form:TForm;DoCalc,DoRecalc,DoAll:Boolean;
                           FixedIdKod:Int64;
                           Mode:Integer;
                           ID_SESSION_FILTER:Int64);overload;
  end;

implementation

uses DateUtils,SysUtils,GlobalSpr, UMainAccounts,BaseTypes, FIBDataSet,
  FIBQuery, WarninigForm;


constructor UDoCalclationsThread.Create(CreateSuspended: Boolean;
                                        Form:TForm;
                                        DoCalc,DoRecalc,DoAll:Boolean;
                                        FixedIdKod:Int64;
                                        Mode:Integer;
                                        ID_SESSION_FILTER:Int64);
begin
    inherited Create(true);
    self.Form:=Form;
    self.GlobalProcessPB:=TfrmAccountMain(Form).pbGlobalCalcProcess;
    self.lbGlobalProcess:=TfrmAccountMain(Form).lbGlobalCalcProcess;
    self.DoCalc:=DoCalc;
    self.DoRecalc:=DoRecalc;
    self.DoAll:=DoAll;
    self.FixedIdKod:=FixedIdKod;
    self.GetDataMode:=Mode;
    self.FID_SESSION_FILTER:=ID_SESSION_FILTER;
end;


procedure UDoCalclationsThread.ClearPB;
begin
    GlobalProcessPB.Position:=0;
    GlobalProcessPB.Update;
end;

procedure UDoCalclationsThread.UpdatePB;
begin
    GlobalProcessPB.Position:=PBStep;
    GlobalProcessPB.Update;
end;



procedure UDoCalclationsThread.Execute;
var DoCalcSP,ClearBeforeCalcDataProc:TpFibStoredProc;
    ChangeStatus:TpFibStoredProc;
    GetStudents:TpFibDataSet;
    I:Integer;
    ExcludeFromCalcFlag_In:Integer;
    ExcludeFromCalcFlag_Out:Variant;
    ExcludeFromCalcFlagAll:Integer;
    NotExcludeFlagAll:Integer;
begin
            //Обнуляем общий флаг
            ExcludeFromCalcFlagAll    :=0;
            ExcludeFromCalcFlag_Out   :=0;
            NotExcludeFlagAll         :=0;

            ClearPB;
            ClearLB;

            GetStudents:=TpFibDataSet.Create(nil);
            GetStudents.DataBase   :=TfrmAccountMain(self.Form).WorkDatabase;
            GetStudents.Transaction:=TfrmAccountMain(self.Form).ReadTransaction;

            //Поднимаем информацию по студентам
            TypeCalc:=0;
            GetStudents.SelectSQL.Text:='SELECT * FROM ST_ACCOUNT_GET_KODS_FOR_CALC2('+IntToStr(Integer(DoCalc))+','+
                                         TfrmAccountMain(self.Form).AccDataSet.FieldByName('ID_ACCOUNT').AsString+
                                         ','+IntToStr(GetDataMode)+','+IntToStr(FID_SESSION_FILTER)+','+IntToStr(FixedIdKod)+')';
            GetStudents.Open;
            GetStudents.FetchAll;
            GetStudents.First;

            self.GlobalProcessPB.Min:=0;
            self.GlobalProcessPB.Max:=GetStudents.RecordCount;
            PBStep:=0;
            UpdatePB;

            DoCalcSP:=TpFibStoredProc.Create(nil);
            DoCalcSP.Database   :=TfrmAccountMain(self.Form).WorkDatabase;
            DoCalcSP.Transaction:=TfrmAccountMain(self.Form).WriteTransaction;
            TfrmAccountMain(self.Form).WriteTransaction.StartTransaction;

            //Очищаем расчетную информацию по этому счету
            ClearBeforeCalcDataProc:=TpFibStoredProc.Create(nil);
            ClearBeforeCalcDataProc.Database   :=TfrmAccountMain(self.Form).WorkDatabase;
            ClearBeforeCalcDataProc.Transaction:=TfrmAccountMain(self.Form).WriteTransaction;

            ClearBeforeCalcDataProc.StoredProcName:='ST_DT_ACCOUNTS_DELETE_EX';
            ClearBeforeCalcDataProc.Prepare;
            ClearBeforeCalcDataProc.ParamByName('ID_ACCOUNT').AsInt64 :=StrToInt64(TfrmAccountMain(self.Form).AccDataSet.FieldByName('ID_ACCOUNT').AsString);
            ClearBeforeCalcDataProc.ExecProc;
            ClearBeforeCalcDataProc.Close;
            ClearBeforeCalcDataProc.Free;

            DoCalcSP.StoredProcName:='ST_ACCOUNTS_CALC2';
            DoCalcSP.Prepare;

            //Делаем расчет по студенту
            i:=0;
            while (i<=GetStudents.RecordCount-1) and (Not Terminated) do
            begin

                   if (NotExcludeFlagAll=1)
                   then begin
                             ExcludeFromCalcFlag_In    :=-1;
                   end;

                   try
                            DoCalcSP.ParamByName('CALC_KEY_SESSION').AsInt64:=TfrmAccountMain(self.Form).CALC_KEY_SESSION;
                            id_kod :=GetStudents.FieldByName('FIO').AsString;
                            DoCalcSP.ParamByName('ID_KOD').AsInt64          :=StrToInt64(GetStudents.FieldByName('ID_KOD').AsString);
                            DoCalcSP.ParamByName('ID_ACCOUNT').AsInt64      :=StrToInt64(TfrmAccountMain(self.Form).AccDataSet.FieldByName('ID_ACCOUNT').AsString);
                            DoCalcSP.ParamByName('DO_CALC').Value           :=Integer(DoCalc);
                            DoCalcSP.ParamByName('DO_RECALC').value         :=false;

                            DoCalcSP.ParamByName('EXCLUDEFROMCALCFLAGALL_IN').Value:=ExcludeFromCalcFlagAll;
                            DoCalcSP.ParamByName('EXCLUDEFROMCALCFLAG_IN').Value:=ExcludeFromCalcFlag_In;

                            DoCalcSP.ExecProc;

                            if ExcludeFromCalcFlagAll<>1
                            then ExcludeFromCalcFlag_Out:=DoCalcSP.ParamByName('EXCLUDEFROMCALCFLAG_OUT').Value
                            else ExcludeFromCalcFlag_Out:=1;

                            PBStep:=i;
                            UpdatePB;
                            UpdateLB;

                   except on E:Exception do
                             begin

                             end;
                   end;

                   if (NotExcludeFlagAll=0)
                   then begin
                             if (ExcludeFromCalcFlag_Out<>-1)
                             then begin
                                       ExcludeFromCalcFlag_In    :=0;
                                       GetStudents.Next;
                                       Inc(i);
                             end
                             else begin
                                       Synchronize(ShowWarnForm);
                                       if WarnModalResult=mrYes
                                       then begin
                                                 ExcludeFromCalcFlag_In    :=1;
                                                 GetStudents.Next;
                                                 Inc(i);
                                       end;

                                       if WarnModalResult=mrYesToAll
                                       then begin
                                                 ExcludeFromCalcFlag_In    :=1;
                                                 ExcludeFromCalcFlagAll    :=1;
                                                 GetStudents.Next;
                                                 Inc(i);
                                       end;

                                       if WarnModalResult=mrNo
                                       then begin
                                                 ExcludeFromCalcFlag_In    :=-1;
                                       end;
                                       if WarnModalResult=mrNoToAll
                                       then begin
                                                 NotExcludeFlagAll:=1;
                                       end;

                             end;
                   end
                   else begin
                             GetStudents.Next;
                             Inc(i);
                   end;
            end;

            ExcludeFromCalcFlagAll    :=0;
            ExcludeFromCalcFlag_Out   :=0;
            NotExcludeFlagAll         :=0;

            if GetStudents.Active then GetStudents.Close;
            TypeCalc:=1;
            GetStudents.SelectSQL.Text:='SELECT * FROM ST_ACCOUNT_GET_KODS_FOR_RECALC2('+IntToStr(Integer(DoReCalc))+','+
                                         TfrmAccountMain(self.Form).AccDataSet.FieldByName('ID_ACCOUNT').AsString+
                                         ','+IntToStr(GetDataMode)+','+IntToStr(FID_SESSION_FILTER)+','+IntToStr(FixedIdKod)+')';

            GetStudents.Open;
            GetStudents.FetchAll;
            GetStudents.First;

            self.GlobalProcessPB.Min:=0;
            self.GlobalProcessPB.Max:=GetStudents.RecordCount;
            PBStep:=0;
            UpdatePB;

            //Делаем расчет по студенту
            i:=0;
            while (i<=GetStudents.RecordCount-1) and (Not Terminated) do
            begin
                 if (NotExcludeFlagAll=1)
                 then begin
                             ExcludeFromCalcFlag_In    :=-1;
                 end;

                 try
                          DoCalcSP.ParamByName('CALC_KEY_SESSION').AsInt64:=TfrmAccountMain(self.Form).CALC_KEY_SESSION;
                          DoCalcSP.ParamByName('ID_KOD').AsInt64          :=StrToInt64(GetStudents.FieldByName('ID_KOD').AsString);
                          DoCalcSP.ParamByName('ID_ACCOUNT').AsInt64      :=StrToInt64(TfrmAccountMain(self.Form).AccDataSet.FieldByName('ID_ACCOUNT').AsString);
                          DoCalcSP.ParamByName('DO_CALC').Value           :=false;
                          DoCalcSP.ParamByName('DO_RECALC').value         :=Integer(DoRecalc);

                          DoCalcSP.ParamByName('EXCLUDEFROMCALCFLAGALL_IN').Value:=ExcludeFromCalcFlagAll;
                          DoCalcSP.ParamByName('EXCLUDEFROMCALCFLAG_IN').Value:=ExcludeFromCalcFlag_In;

                          DoCalcSP.ExecProc;

                          if ExcludeFromCalcFlagAll<>1
                          then ExcludeFromCalcFlag_Out:=DoCalcSP.ParamByName('EXCLUDEFROMCALCFLAG_OUT').Value
                          else ExcludeFromCalcFlag_Out:=1;

                          PBStep:=i;
                          Synchronize(UpdatePB);
                          Synchronize(UpdateLB);

                 except on E:Exception do
                           begin

                           end;
                 end;

                 if (NotExcludeFlagAll=0)
                 then begin
                             if (ExcludeFromCalcFlag_Out<>-1)
                             then begin
                                       ExcludeFromCalcFlag_In    :=0;
                                       GetStudents.Next;
                                       Inc(i);
                             end
                             else begin
                                       Synchronize(ShowWarnForm);
                                       if WarnModalResult=mrYes
                                       then begin
                                                 ExcludeFromCalcFlag_In    :=1;
                                                 GetStudents.Next;
                                                 Inc(i);
                                       end;

                                       if WarnModalResult=mrYesToAll
                                       then begin
                                                 ExcludeFromCalcFlag_In    :=1;
                                                 ExcludeFromCalcFlagAll    :=1;
                                                 GetStudents.Next;
                                                 Inc(i);
                                       end;

                                       if WarnModalResult=mrNo
                                       then begin
                                                 ExcludeFromCalcFlag_In    :=-1;
                                       end;
                                       if WarnModalResult=mrNoToAll
                                       then begin
                                                 NotExcludeFlagAll:=1;
                                       end;

                             end;
                 end
                 else begin
                           GetStudents.Next;
                           Inc(i);
                 end;
            end;

            ChangeStatus:=TpFibStoredProc.Create(nil);
            ChangeStatus.Database:=TfrmAccountMain(self.Form).WorkDatabase;
            ChangeStatus.Transaction:=TfrmAccountMain(self.Form).WriteTransaction;
            ChangeStatus.StoredProcName:='ST_DT_ACCOUNTS_UPDATE_STATUS';
            ChangeStatus.Prepare;
            ChangeStatus.ParamByName('ID_ACCOUNT').asInt64:=StrToInt64(TfrmAccountMain(self.Form).AccDataSet.FieldByName('ID_ACCOUNT').AsString);
            ChangeStatus.ParamByName('STATUS').asInt64    :=1;
            ChangeStatus.ExecProc;
            ChangeStatus.Close;

            if TfrmAccountMain(self.Form).WriteTransaction.InTransaction
            then TfrmAccountMain(self.Form).WriteTransaction.Commit;

            if Assigned(ChangeStatus) then ChangeStatus.Free;
            if Assigned(DoCalcSP)     then DoCalcSP.Free;

            GetStudents.Close;
            GetStudents.Free;
end;

procedure UDoCalclationsThread.UpdateLB;
begin
      if (self.TypeCalc=0)
      then self.lbGlobalProcess.Caption:='Оброблено записів(розрахунок) '+IntToStr(self.PBStep+1) + ' з '+IntToStr(self.GlobalProcessPB.Max)
      else self.lbGlobalProcess.Caption:='Оброблено записів(перерозрахунок) '+IntToStr(self.PBStep+1) + ' з '+IntToStr(self.GlobalProcessPB.Max);
end;

procedure UDoCalclationsThread.ClearLB;
begin
     self.lbGlobalProcess.Caption:='';
end;

procedure UDoCalclationsThread.ShowWarnForm;
var T:TfrmWarnFrm;
begin
     T:=TfrmWarnFrm.Create(Application.MainForm);
     T.Label2.Caption:=self.id_kod;
     WarnModalResult:=T.ShowModal;
     T.Free;
end;

end.


