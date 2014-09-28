unit filter_intf;

interface

uses AppStruClasses, Forms, Classes, Ibase, Messages, Windows,
     Dialogs, SysUtils, MainForm, FilterPredefines, Controls,
     pFibDataBase,  pFibDataSet, pFibQuery, Variants;

type
     TUPFilter=class(TFMASAppModule,IFMASModule,IFMASTemporaryDataStorage,IFMASFilterControl)
     private
           KeySession:Int64;
           FFilterParams:TParamsContainer;
           WorkMainForm:TForm;
           PredefinedForm:TForm;
           function CheckExistDefValue:Boolean;
     public
           Count:Integer;
           procedure Run;
           procedure ClearTmpData;
           procedure OnLanguageChange(var Msg:TMessage); message FMAS_MESS_CHANGE_LANG;
           procedure OnGridStylesChange(var Msg:TMessage); message FMAS_MESS_CHANGE_GSTYLE;
           procedure SetFilterParams(FilterParams:TParamsContainer);
           procedure UpdateFilterControls;
           function GetFilterParams:TParamsContainer;
           {$WARNINGS OFF}
           destructor Destroy; override;
           constructor Create(AOwner: TComponent);override;
           {$WARNINGS ON}
     end;


implementation

uses AssociationList;

{ TUPFilter }

{$WARNINGS OFF}
function TUPFilter.CheckExistDefValue: Boolean;
var
     LD:TpFibDataBase;
     LT:TpFibTransaction;
     CheckDS:TpFibDataSet;
     ShowFilter:Boolean;
begin
     LD:=TpFibDataBase.Create(nil);
     LD.SQLDialect:=3;
     LT:=TpFibTransaction.Create(nil);
     LT.DefaultDatabase:=LD;
     LD.DefaultTransaction:=LT;
     LD.DefaultUpdateTransaction:=LT;
     LD.Handle:=TISC_DB_HANDLE(PInteger(self.InParams.Items['DbHandle']))^;
     LT.StartTransaction;
     CheckDS:=TpFibDataSet.Create(nil);
     CheckDS.Database:=LD;
     CheckDS.Transaction:=LT;
     CheckDS.SelectSQL.Text:='select * from UP_DT_KERNELL_FILTER_DEFINE where id_order_type='+IntToStr(PInteger(self.InParams.Items['Id_order_type'])^);
     CheckDS.Open;
     ShowFilter:=false;
     if CheckDS.RecordCount>0 then ShowFilter:=true;
     LT.Commit;
     LD.Close;
     LT.Free;
     LD.Free;
     Result:=ShowFilter;
end;

procedure TUPFilter.ClearTmpData;
var
     LD:TpFibDataBase;
     LT:TpFibTransaction;
     CheckDS:TpFibQuery;
begin
     LD:=TpFibDataBase.Create(nil);
     LD.SQLDialect:=3;
     LT:=TpFibTransaction.Create(nil);
     LT.DefaultDatabase:=LD;
     LD.DefaultTransaction:=LT;
     LD.DefaultUpdateTransaction:=LT;
     LD.Handle:=TISC_DB_HANDLE(PInteger(self.InParams.Items['DbHandle']))^;
     LT.StartTransaction;
     CheckDS:=TpFibQuery.Create(nil);
     CheckDS.Database:=LD;
     CheckDS.Transaction:=LT;
     CheckDS.SQL.Text:='DELETE FROM UP_DT_KERNELL_MOVINGS where KEY_SESSION='+IntToStr(PInt64(self.InParams.Items['KEY_SESSION'])^);
     CheckDS.ExecQuery;
     LT.Commit;
     LD.Close;
     LT.Free;
     LD.Free;
end;

constructor TUPFilter.Create(AOwner: TComponent);
begin
     inherited Create(Aowner);
end;

destructor TUPFilter.Destroy;
begin
     if self.InParams.IndexOf('ClearOnFree')>0
     then begin
               if PInteger(self.InParams.Items['ClearOnFree'])^ =1
               then self.ClearTmpData;
     end;          


     if Assigned(self.WorkMainForm)   then self.WorkMainForm.Free;
     if Assigned(self.PredefinedForm) then self.PredefinedForm.Free;
     if Assigned(FFilterParams)       then self.FFilterParams.Free;
     inherited Destroy;
end;
{$WARNINGS ON}

function TUPFilter.GetFilterParams: TParamsContainer;
var FilterParams: TParamsContainer;
    Date_beg, Date_End, ActualDate, DATE_END_AFTER:Variant;
    CHECK_MMDATE_BEG_VALUE,
    CHECK_MMDATE_END_VALUE,
    CHECK_MMDATE_VALUE,
    CHECK_POSTSALARY_VALUE,
    POSTSALARY_VALUE,
    PCARD_VALUE,
    CHECK_WORKCOND_VALUE,
    WORKCOND_VALUE,
    CHECK_ID_WORK_REASON,
    ID_WORK_REASON,
    CHECK_PCARD_VALUE,
    CHECK_CATEGORY_VALUE,
    CATEGORY_VALUE,
    CHECK_DATE_END_AFTER:Variant;
begin
             FilterParams:=TParamsContainer.Create(true);

             CHECK_PCARD_VALUE:=TFilterMainForm(WorkMainForm).CheckPrivateCard.Checked;
             FilterParams.Add('CHECK_PCARD_VALUE',      PVariant(@CHECK_PCARD_VALUE));

             CHECK_MMDATE_BEG_VALUE:=TFilterMainForm(WorkMainForm).CheckMMDateBeg.Checked;
             FilterParams.Add('CHECK_MMDATE_BEG_VALUE', PVariant(@CHECK_MMDATE_BEG_VALUE));

             CHECK_MMDATE_END_VALUE:=TFilterMainForm(WorkMainForm).CheckMMDateEnd.Checked;
             FilterParams.Add('CHECK_MMDATE_END_VALUE', PVariant(@CHECK_MMDATE_END_VALUE));

             CHECK_MMDATE_VALUE:=TFilterMainForm(WorkMainForm).CheckMMDate.Checked;
             FilterParams.Add('CHECK_MMDATE_VALUE',     PVariant(@CHECK_MMDATE_VALUE));

             CHECK_POSTSALARY_VALUE:=TFilterMainForm(WorkMainForm).CheckPostSalary.Checked;
             FilterParams.Add('CHECK_POSTSALARY_VALUE', PVariant(@CHECK_POSTSALARY_VALUE));

             PCARD_VALUE:=TFilterMainForm(WorkMainForm).PCardValue.Value;
             FilterParams.Add('PCARD_VALUE',            PVariant(@PCARD_VALUE));

             Date_beg:=TFilterMainForm(WorkMainForm).MMDateBeg.Value;
             FilterParams.Add('MMDATE_BEG_VALUE',       PVariant(@Date_beg));

             Date_end:=TFilterMainForm(WorkMainForm).MMDateEnd.Value;
             FilterParams.Add('MMDATE_END_VALUE',       PVariant(@Date_end));

             ActualDate:=TFilterMainForm(WorkMainForm).MMDate.Value;
             FilterParams.Add('MMDATE_VALUE',           PVariant(@ActualDate));

             POSTSALARY_VALUE:=TFilterMainForm(WorkMainForm).PostSalaryValue.Value;
             FilterParams.Add('POSTSALARY_VALUE',       PVariant(@POSTSALARY_VALUE));

             CHECK_WORKCOND_VALUE:=TFilterMainForm(WorkMainForm).CheckWorkCond.Checked;
             FilterParams.Add('CHECK_WORKCOND_VALUE',   PVariant(@CHECK_WORKCOND_VALUE));

             WORKCOND_VALUE:=TFilterMainForm(WorkMainForm).WorkCondValue.Value;
             FilterParams.Add('WORKCOND_VALUE',         PVariant(@WORKCOND_VALUE));

             CHECK_ID_WORK_REASON:=TFilterMainForm(WorkMainForm).CheckWorkReason.Checked;
             FilterParams.Add('CHECK_ID_WORK_REASON',         PVariant(@CHECK_ID_WORK_REASON));

             ID_WORK_REASON:=TFilterMainForm(WorkMainForm).WorkReasonValue.Value;
             FilterParams.Add('ID_WORK_REASON', PVariant(@ID_WORK_REASON));

             //Добавил фильтр Турчин
             ID_WORK_REASON:=TFilterMainForm(WorkMainForm).WorkReasonValue.Value;
             FilterParams.Add('CHECK_CATEGORY_VALUE', PVariant(@CHECK_CATEGORY_VALUE));

             ID_WORK_REASON:=TFilterMainForm(WorkMainForm).WorkReasonValue.Value;
             FilterParams.Add('CATEGORY_VALUE', PVariant(@CATEGORY_VALUE));

             CHECK_DATE_END_AFTER:=TFilterMainForm(WorkMainForm).CheckDateEndAfter.Checked;
             FilterParams.Add('CHECK_DATE_END_AFTER', PVariant(@CHECK_DATE_END_AFTER));

             DATE_END_AFTER:=TFilterMainForm(WorkMainForm).DateEndAfter.Value;
             FilterParams.Add('DATE_END_AFTER', PVariant(@DATE_END_AFTER));
             //------------------------------------------------------------

               {FilterParams.Add('CHECK_WORKMODE_VALUE' integer(CheckWorkMode.Checked);
               FilterParams.Add('WORKMODE_VALUE' WorkModeValue.Value;
               FilterParams.Add('CHECK_FORMPAY_VALUE' integer(CheckFormPayValue.Checked);
               FilterParams.Add('FORMPAY_VALUE'  FormPayValue.Value;
               FilterParams.Add('CHECK_BUDGET_VALUE'  integer(CheckBudgetValue.Checked);
               FilterParams.Add('BUDGET_VALUE'  BudgetValue.Value;
               FilterParams.Add('CHECK_DEPARTMENT_VALUE' integer(CheckDepartmentValue.Checked);
               FilterParams.Add('DEPARTMENT_VALUE'   DepartmentValue.Value;
               FilterParams.Add('CHECK_EXISTRATE'  integer(CheckExistRate.Checked);
               FilterParams.Add('EXISTRATE_VALUE'  ExistRateValue.Value;
               FilterParams.Add('CHECK_BUDGETRATE'  integer(CheckBudgetRate.Checked);
               FilterParams.Add('BUDGETRATE_VALUE'  BudgetRate.Value;
               FilterParams.Add('EXISTRATEDATE_VALUE'  VarAsType(ExistRateDateValue.Value,varDate);
               FilterParams.Add('EXISTTYPERATE_VALUE' ExistTypeRateValue.ItemIndex;
               //FilterParams.Add('EXISTPERCENT_RATE_VALUE').Value   :=null;
               //FilterParams.Add('EXISTSUM_RATE_VALUE').Value       :=null;
               FilterParams.Add('CHECK_NOTEXISTSRATE').Value       :=integer(CheckNotExistsRate.Checked);
               FilterParams.Add('NOTEXISTRATE_VALUE').Value        :=NotExistRateValue.Value;
               FilterParams.Add('NOTEXISTRATEDATE_VALUE').Value    :=VarAsType(NotExistRateDateValue.Value,varDate);
               FilterParams.Add('NOTEXISTTYPERATE_VALUE').Value    :=NotExistTypeRateValue.ItemIndex;
               FilterParams.Add('NOTEXISTSUM_RATE_VALUE').Value    :=null;
               FilterParams.Add('NOTEXISTPERCENT_RATE_VALUE').Value:=null;
               FilterParams.Add('CHECK_IS_MAIN_VALUE').Value       :=Integer(CheckIsMain.Checked);
               FilterParams.Add('IS_MAIN_VALUE').Value             :=IsMainValue.ItemIndex;
               FilterParams.Add('CHECK_CATEGORY_VALUE').Value      :=integer(CheckCategory.Checked);
               FilterParams.Add('CATEGORY_VALUE').Value            :=CategoryValue.Value;
               FilterParams.Add('CHECK_SEX_VALUE').Value           :=CheckSex.Checked;
               FilterParams.Add('SEX_VALUE').Value                 :=SexValue.Value;
               FilterParams.Add('CHECK_ID_MAN').Value              :=CheckIdMen.Checked;
               FilterParams.Add('ID_MEN').Value                    :=ManValue.Value;
               FilterParams.Add('CHECK_CHILD_DEPARTMENT').Value    :=Integer(CHECK_CHILD_DEPARTMENT.Checked);
               FilterParams.Add('CHECK_STAJ_VALUE').Value          :=Integer(CheckStaj.Checked);
               FilterParams.Add('ID_STAJ_VALUE').Value             :=TypeStajValue.Value;
               FilterParams.Add('STAJ_VALUE_MIN').Value            :=StajValueMin.Value;
               FilterParams.Add('STAJ_VALUE_MAX').Value            :=StajValueMax.Value;
               FilterParams.Add('STAJ_DATE').Value                 :=VarAsType(StajDate.Value,varDate);
               FilterParams.Add('CHECK_RATES').Value               :=Integer(CheckRates.Checked);
               FilterParams.Add('RATE_MIN').Value                  :=RateMinValue.Value;
               FilterParams.Add('RATE_MAX').Value                  :=RateMaxValue.Value;
               FilterParams.Add('IS_IN_SOVM').Value                :=Integer(cxIsInSovm.Checked);
               FilterParams.Add('IS_EXT_SOVM').Value               :=Integer(cxIsExtSovm.Checked);
               FilterParams.Add('check_post_razr').Value           :=Integer(CheckPostRazr.Checked);
               FilterParams.Add('post_razr').Value                 :=PostRazr.Value;
               FilterParams.Add('check_post_sum').Value            :=Integer(CheckPostSum.Checked);
               FilterParams.Add('min_post_sum').Value              :=MinPostSumValue.Value;
               FilterParams.Add('max_post_sum').Value              :=MaxPostSumValue.Value;}


               Result :=FilterParams;

end;

procedure TUPFilter.OnGridStylesChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TUPFilter.OnLanguageChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TUPFilter.Run;
begin
     self.KeySession:=PInt64(self.InParams.Items['KEY_SESSION'])^;

     if self.CheckExistDefValue
     then begin
               if not Assigned(PredefinedForm)
               then begin
                         PredefinedForm:=TfrmGetFilterPredefine.Create(TComponent(self.InParams.Items['AOwner']^),
                                                                       TISC_DB_HANDLE(PInteger(self.InParams.Items['DbHandle']))^,
                                                                       PInteger(self.InParams.Items['Id_order_type'])^);

               end;

               if Assigned(PredefinedForm)
               then begin
                         if PredefinedForm.ShowModal=mrYes
                         then begin
                                   if not Assigned(WorkMainForm)
                                   then begin
                                             WorkMainForm:=TFilterMainForm.Create(TComponent(self.InParams.Items['AOwner']^),
                                                                     TISC_DB_HANDLE(PInteger(self.InParams.Items['DbHandle'])^),
                                                                                    PInteger(self.InParams.Items['Id_User'])^,
                                                                                    PInt64(self.InParams.Items['KEY_SESSION'])^,
                                                                                    PInteger(self.InParams.Items['Id_order_type'])^,
                                                                                    TfrmGetFilterPredefine(PredefinedForm).id_predefine);
                                   end;

                                   if  Assigned(WorkMainForm) then WorkMainForm.ShowModal;
                                   self.Count:=TFilterMainForm(WorkMainForm).Count;

                         end;
               end;
     end
     else begin
                         if not Assigned(WorkMainForm)
                         then begin
                                   WorkMainForm:=TFilterMainForm.Create(TComponent(self.InParams.Items['AOwner']^),
                                                           TISC_DB_HANDLE(PInteger(self.InParams.Items['DbHandle'])^),
                                                                          PInteger(self.InParams.Items['Id_User'])^,
                                                                          PInt64(self.InParams.Items['KEY_SESSION'])^,
                                                                          PInteger(self.InParams.Items['Id_order_type'])^,
                                                                          -1);

                                   UpdateFilterControls;

                         end;
                         if  Assigned(WorkMainForm) then WorkMainForm.ShowModal;

                         self.Count:=TFilterMainForm(WorkMainForm).Count;
     end;

      self.OutParams['Count']:=PInteger(@self.Count);
end;

procedure TUPFilter.SetFilterParams(FilterParams: TParamsContainer);
begin
     self.FFilterParams:=FilterParams;
end;

procedure TUPFilter.UpdateFilterControls;
var InfoDS:TpFibDataSet;
begin
     if Assigned(FFilterParams)
     then begin
               InfoDS:=TpFibDataSet.Create(nil);
               InfoDS.Database:=TFilterMainForm(WorkMainForm).WorkDatabase;
               InfoDS.Transaction:=TFilterMainForm(WorkMainForm).ReadTransaction;

               if  (FFilterParams.Items['CHECK_PCARD_VALUE']<>nil)
               and (FFilterParams.Items['PCARD_VALUE']<>nil)
               then begin
                         InfoDS.SelectSQL.Text:='select first 1 id_pcard from private_cards where tn='+IntToStr(PVariant(FFilterParams.Items['PCARD_VALUE'])^);
                         InfoDS.Open;
                         if InfoDS.RecordCount>0
                         then begin
                                   TFilterMainForm(WorkMainForm).PCardValue.Value:=InfoDS.FieldByName('id_pcard').Value;
                                   TFilterMainForm(WorkMainForm).PCardValue.DisplayText:=PVariant(FFilterParams.Items['PCARD_VALUE'])^;
                                   TFilterMainForm(WorkMainForm).CheckPrivateCard.Checked:=PVariant(FFilterParams.Items['CHECK_PCARD_VALUE'])^;
                         end;
                         InfoDS.Close;
               end;

               if  (FFilterParams.Items['CHECK_ID_WORK_REASON']<>nil)
               and (FFilterParams.Items['ID_WORK_REASON']<>nil)
               then begin
                         InfoDS.SelectSQL.Text:='select * from asup_ini_work_reason where id_work_reason='+IntToStr(PVariant(FFilterParams.Items['ID_WORK_REASON'])^);
                         InfoDS.Open;
                         if InfoDS.RecordCount>0
                         then begin
                                   TFilterMainForm(WorkMainForm).WorkReasonValue.Value:=PVariant(FFilterParams.Items['ID_WORK_REASON'])^;
                                   TFilterMainForm(WorkMainForm).WorkReasonValue.DisplayText:=InfoDS.FieldByName('name_full').Value;
                                   TFilterMainForm(WorkMainForm).CheckWorkReason.Checked:=PVariant(FFilterParams.Items['CHECK_ID_WORK_REASON'])^;
                         end;
                         InfoDS.Close;
               end;
               // Добавил Турчин
               if  (FFilterParams.Items['CHECK_CATEGORY_VALUE']<>nil)
               and (FFilterParams.Items['CATEGORY_VALUE']<>nil)
               then begin
                         InfoDS.SelectSQL.Text:='select * from SP_TYPE_POST where id_type_post='+IntToStr(PVariant(FFilterParams.Items['CATEGORY_VALUE'])^);
                         InfoDS.Open;
                         if InfoDS.RecordCount>0
                         then begin
                                   TFilterMainForm(WorkMainForm).CATEGORYValue.Value:=PVariant(FFilterParams.Items['CATEGORY_VALUE'])^;
                                   TFilterMainForm(WorkMainForm).CATEGORYValue.DisplayText:=InfoDS.FieldByName('NAME_TYPE_POST').Value;
                                   TFilterMainForm(WorkMainForm).CheckCATEGORY.Checked:=PVariant(FFilterParams.Items['CHECK_CATEGORY_VALUE'])^;
                         end;
                         InfoDS.Close;
               end;
               //----------------------------------------------------
               if  (FFilterParams.Items['CHECK_MMDATE_VALUE']<>nil)
               and (FFilterParams.Items['MMDATE_VALUE']<>nil)
               then begin
                         TFilterMainForm(WorkMainForm).MMDate.Value:=VarToDateTime(PVariant(FFilterParams.Items['MMDATE_VALUE'])^);
                         TFilterMainForm(WorkMainForm).CheckMMDate.Checked:=PVariant(FFilterParams.Items['CHECK_MMDATE_VALUE'])^;
               end;

               if  (FFilterParams.Items['CHECK_DATE_END_AFTER']<>nil)
               and (FFilterParams.Items['DATE_END_AFTER']<>nil)
               then begin
                         TFilterMainForm(WorkMainForm).DateEndAfter.Value:=VarToDateTime(PVariant(FFilterParams.Items['DATE_END_AFTER'])^);
                         TFilterMainForm(WorkMainForm).CheckDateEndAfter.Checked:=PVariant(FFilterParams.Items['CHECK_DATE_END_AFTER'])^;
               end;

               InfoDS.Free;
     end;
end;

initialization
     //Регистрация класса в глобальном реестре
     RegisterAppModule(TUPFilter,'up_filter');
end.
