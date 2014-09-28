unit UCnDoCalculationsThread;

interface

uses
  Classes, Forms,ComCtrls, Ibase,pFibStoredProc, Dialogs, Windows,
  pFibDataSet,  StdCtrls, cn_Common_Funcs, Controls;

type
  UDoCalclationsThread = class(TThread)
  private
        PBStep:Integer;
        Form:TForm;
        CurID_STUD:String;
        GlobalProcessPB:TProgressBar;
        lbGlobalProcess:TLabel;
        TypeCalc:Integer;
        WarnModalResult:TModalResult;
        type_calc_str:string;
        id_kod:String;


        FDoCalc : Boolean;
        FDoReversCalc         : Boolean;
        FDoRecalc             : Boolean;
        FDoRecalcByFilter     : Boolean;
        FDoRecalcWithoutFilter: Boolean;
        FDoRecalcWithCheckEdit: Boolean;
        FUsedFixedIdKod       : Int64;
        FUsed_SESSION_FILTER  : Int64;
        FGetDataMode          : Integer;
        FIdAccount            : Int64;


        procedure UpdatePB;
        procedure UpdateLB;
        procedure ClearPB;
        procedure ClearLB;
        procedure ShowWarnForm;
      protected
       procedure Execute; override;
      public
       constructor Create(CreateSuspended      : Boolean;
                          Form                 : TForm;
                          DoCalc               : Boolean;
                          DoReversCalc         : Boolean;
                          DoRecalc             : Boolean;
                          DoRecalcByFilter     : Boolean;
                          DoRecalcWithoutFilter: Boolean;
                          DoRecalcWithCheckEdit: Boolean;
                          UsedFixedIdKod       : Int64;
                          Used_SESSION_FILTER  : Int64;
                          GetDataMode          :Integer;
                          IdAccount            :Int64);overload;
    end;

implementation

uses DateUtils,SysUtils,GlobalSpr, UCnMainAccounts,BaseTypes, FIBDataSet,
UCnWarnForm;

constructor UDoCalclationsThread.Create(CreateSuspended      : Boolean;
                                        Form                 : TForm;
                                        DoCalc               : Boolean;
                                        DoReversCalc         : Boolean;
                                        DoRecalc             : Boolean;
                                        DoRecalcByFilter     : Boolean;
                                        DoRecalcWithoutFilter: Boolean;
                                        DoRecalcWithCheckEdit: Boolean;
                                        UsedFixedIdKod       : Int64;
                                        Used_SESSION_FILTER  : Int64;
                                        GetDataMode          : Integer;
                                        IdAccount            : Int64);
begin
    inherited Create(true);
    self.Form                   :=Form;
    self.GlobalProcessPB        :=TfrmAccountMain(Form).pbGlobalCalcProcess;
    self.lbGlobalProcess        :=TfrmAccountMain(Form).lbGlobalCalcProcess;
    self.FDoCalc                :=DoCalc;
    self.FDoReversCalc          :=DoReversCalc;
    self.FDoRecalc              :=DoRecalc;
    self.FDoRecalcByFilter      :=DoRecalcByFilter;
    self.FDoRecalcWithoutFilter :=DoRecalcWithoutFilter;
    self.FDoRecalcWithCheckEdit :=DoRecalcWithCheckEdit;
    self.FUsedFixedIdKod        :=UsedFixedIdKod;
    self.FUsed_SESSION_FILTER   :=Used_SESSION_FILTER;
    self.FGetDataMode           :=GetDataMode;
    self.FIdAccount             :=IdAccount;
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
var
  DoCalcSP,ClearBeforeCalcDataProc:TpFibStoredProc;
  ChangeStatus:TpFibStoredProc;
  GetStudents:TpFibDataSet;
  I:Integer;
  ExcludeFromCalcFlag_In:Integer;
  ExcludeFromCalcFlag_Out:Variant;
  ExcludeFromCalcFlagAll:Integer;
  NotExcludeFlagAll:Integer;
begin
            Synchronize(ClearPB);
            Synchronize(ClearLB);

            GetStudents:=TpFibDataSet.Create(nil);
            GetStudents.DataBase   :=TfrmAccountMain(self.Form).WorkDatabase;
            GetStudents.Transaction:=TfrmAccountMain(self.Form).ReadTransaction;

            //Поднимаем информацию по студентам
            TypeCalc:=0;
            GetStudents.SelectSQL.Text:='SELECT * FROM CN_ACCOUNT_GET_KODS_FOR_CALC2('+
                                         IntToStr(Integer(self.FDoCalc))+','+
                                         IntToStr(FGetDataMode)+','+
                                         IntToStr(FUsed_SESSION_FILTER)+','+
                                         IntToStr(FUsedFixedIdKod)+')';
            GetStudents.Open;
            GetStudents.FetchAll;
            GetStudents.First;

            self.GlobalProcessPB.Min:=0;
            self.GlobalProcessPB.Max:=GetStudents.RecordCount;
            PBStep:=0;
            Synchronize(UpdatePB);

            DoCalcSP:=TpFibStoredProc.Create(nil);
            DoCalcSP.Database   :=TfrmAccountMain(self.Form).WorkDatabase;
            DoCalcSP.Transaction:=TfrmAccountMain(self.Form).WriteTransaction;
            TfrmAccountMain(self.Form).WriteTransaction.StartTransaction;

            //Очищаем расчетную информацию по этому счету
            ClearBeforeCalcDataProc:=TpFibStoredProc.Create(nil);
            ClearBeforeCalcDataProc.Database   :=TfrmAccountMain(self.Form).WorkDatabase;
            ClearBeforeCalcDataProc.Transaction:=TfrmAccountMain(self.Form).WriteTransaction;

            ClearBeforeCalcDataProc.StoredProcName:='CN_DT_ACCOUNTS_DELETE_EX';
            ClearBeforeCalcDataProc.Prepare;
            ClearBeforeCalcDataProc.ParamByName('ID_ACCOUNT').AsInt64 :=FIdAccount;
            ClearBeforeCalcDataProc.ExecProc;
            ClearBeforeCalcDataProc.Close;
            ClearBeforeCalcDataProc.Free;

            DoCalcSP.StoredProcName:='CN_ACCOUNTS_CALC2';
            DoCalcSP.Prepare;

            //Обнуляем флагs
            ExcludeFromCalcFlagAll    :=0;
            ExcludeFromCalcFlag_Out   :=0;
            NotExcludeFlagAll         :=0;
            ExcludeFromCalcFlag_In    :=0;
            type_calc_str := 'розрахунок';

            //Делаем расчет по студенту
            i:=0;
            while (i<=GetStudents.RecordCount-1) and (Not Terminated) do
            begin

              if (NotExcludeFlagAll=1)
              then begin
                             ExcludeFromCalcFlag_In    :=-1;
              end;



              try
               PBStep:=i;
               Synchronize(UpdateLB);
               Synchronize(UpdatePB);

               DoCalcSP.ParamByName('CALC_KEY_SESSION').AsInt64 := TfrmAccountMain(self.Form).CALC_KEY_SESSION;
               id_kod                                           := GetStudents.FieldByName('FIO').AsString;
               DoCalcSP.ParamByName('ID_STUD').AsInt64          := StrToInt64(GetStudents.FieldByName('ID_STUD').AsString);

               CurID_STUD                                       := GetStudents.FieldByName('ID_STUD').AsString;

               DoCalcSP.ParamByName('ID_ACCOUNT').AsInt64       := FIdAccount;
               DoCalcSP.ParamByName('DOCALC').Value             := Integer(FDoCalc);
               DoCalcSP.ParamByName('DORECALC').value           := false;
               DoCalcSP.ParamByName('DOREVERSCALC').AsInteger   := Integer(FDoReversCalc);


               DoCalcSP.ParamByName('EXCLUDEFROMCALCFLAGALL_IN').Value:=ExcludeFromCalcFlagAll;
               DoCalcSP.ParamByName('EXCLUDEFROMCALCFLAG_IN').Value   :=ExcludeFromCalcFlag_In;

               DoCalcSP.ExecProc;

               if ExcludeFromCalcFlagAll<>1
               then ExcludeFromCalcFlag_Out:=DoCalcSP.ParamByName('EXCLUDEFROMCALCFLAG_OUT').Value
               else ExcludeFromCalcFlag_Out:=1;

               if DoCalcSP.ParamByName('RESULT').Value=0 then
                begin
                 MessageBox(Application.MainForm.Handle,
                            PChar('Помилка під час розрахунка!'+#13+
                            'Договір:'+CurID_STUD),
                            'Увага!',
                            MB_OK);
                end;

              except on E:Exception do
               begin
                ShowMessage('Помилка під час розрахунка!'+#13+
                            E.Message+
                            'Договір:'+CurID_STUD);
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

            if GetStudents.Active then GetStudents.Close;
            TypeCalc:=1;
            GetStudents.SelectSQL.Text:='SELECT * FROM CN_ACCOUNT_GET_KODS_FOR_RECALC2('+
                                         IntToStr(Integer(FDoRecalc))+','+
                                         IntToStr(FGetDataMode)+','+
                                         IntToStr(Integer(FDoRecalcByFilter))+','+
                                         IntToStr(Integer(FDoRecalcWithoutFilter))+','+
                                         IntToStr(Integer(FDoRecalcWithCheckEdit))+','+
                                         IntToStr(FUsed_SESSION_FILTER)+','+
                                         IntToStr(FUsedFixedIdKod)+')';

            GetStudents.Open;
            GetStudents.FetchAll;
            GetStudents.First;

            self.GlobalProcessPB.Min:=0;
            self.GlobalProcessPB.Max:=GetStudents.RecordCount;
            PBStep:=0;
            Synchronize(UpdatePB);

            //Делаем расчет по студенту
            i:=0;
            type_calc_str := 'перерозрахунок';

            //Обнуляем флагs
            ExcludeFromCalcFlagAll    :=0;
            ExcludeFromCalcFlag_Out   :=0;
            NotExcludeFlagAll         :=0;

            while (i<=GetStudents.RecordCount-1) and (Not Terminated) do
             begin
                  if (NotExcludeFlagAll=1)
                  then begin
                            ExcludeFromCalcFlag_In    :=-1;
                  end;


              try
               PBStep:=i;
               Synchronize(UpdateLB);
               Synchronize(UpdatePB);

               DoCalcSP.ParamByName('CALC_KEY_SESSION').AsInt64 :=TfrmAccountMain(self.Form).CALC_KEY_SESSION;
               DoCalcSP.ParamByName('ID_STUD').AsInt64          :=StrToInt64(GetStudents.FieldByName('ID_STUD').AsString);

               CurID_STUD:=GetStudents.FieldByName('ID_STUD').AsString;

               DoCalcSP.ParamByName('ID_ACCOUNT').AsInt64       :=FIdAccount;
               DoCalcSP.ParamByName('DOCALC').Value             :=false;
               DoCalcSP.ParamByName('DORECALC').value           :=Integer(FDoRecalc);
               DoCalcSP.ParamByName('DOREVERSCALC').value       :=false;
               DoCalcSP.ParamByName('EXCLUDEFROMCALCFLAGALL_IN').Value:=ExcludeFromCalcFlagAll;
               DoCalcSP.ParamByName('EXCLUDEFROMCALCFLAG_IN').Value   :=ExcludeFromCalcFlag_In;

               DoCalcSP.ExecProc;

               if ExcludeFromCalcFlagAll<>1
               then ExcludeFromCalcFlag_Out:=DoCalcSP.ParamByName('EXCLUDEFROMCALCFLAG_OUT').Value
               else ExcludeFromCalcFlag_Out:=1;


               if DoCalcSP.ParamByName('RESULT').Value=0 then
                begin
                 MessageBox(Application.MainForm.Handle,
                            PChar('Помилка під час розрахунка!'+#13+
                            'Договір:'+CurID_STUD),
                            'Увага!',
                            MB_OK);
                end;

              except on E:Exception do
               begin
                ShowMessage('Помилка під час розрахунка!'+#13+
                            E.Message+
                            'Договір:'+CurID_STUD);
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
            ChangeStatus.StoredProcName:='CN_DT_ACCOUNTS_UPDATE_STATUS';
            ChangeStatus.Prepare;
            ChangeStatus.ParamByName('ID_ACCOUNT').asInt64:=FIdAccount;
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
      then self.lbGlobalProcess.Caption:='Оброблено записів(розрахунок) '+IntToStr(self.PBStep+1) + ' з '+IntToStr(self.GlobalProcessPB.Max) +' поточний договір ' +CurID_STUD
      else self.lbGlobalProcess.Caption:='Оброблено записів(перерозрахунок) '+IntToStr(self.PBStep+1) + ' з '+IntToStr(self.GlobalProcessPB.Max) + ' поточний договір '+ CurID_STUD;
end;

procedure UDoCalclationsThread.ClearLB;
begin
     self.lbGlobalProcess.Caption:='';
end;

procedure UDoCalclationsThread.ShowWarnForm;
var T:TfrmCnWarnForm;
begin
  T := TfrmCnWarnForm.Create(Application.MainForm);
  T.Label2.Caption:=self.id_kod;
  //T.Label5.Caption:=self.type_calc_str;
  WarnModalResult:=T.ShowModal;
  T.Free;
end;

end.


