unit UWizardSteps;

interface

uses Windows,   Forms,   Dialogs,   Ibase,   Controls,   Kernel,   Classes,   pFibDatabase,
     SysUtils,  pFibDataSet,  pFibStoredProc, Variants;

//Steps
function Step1_1(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
function Step1_2(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
function Step1_3(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
function Step1_4(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
function Step1_5(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;

function Step11_1(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
function Step11_2(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
function Step11_3(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
function Step11_4(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
function Step11_5(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
function Step11_6(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;

function Step21_22_1(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
function Step21_22_2(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
function Step21_22_3(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
function Step21_22_4(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
function Step21_22_5(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
function Step21_22_6(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;

function Step3_1(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
function Step3_2(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
function Step3_3(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;


function StepGetFacedInfo(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
function StepCheckDefSmInfo(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
function StepCheckDefKvInfo(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;

//Utils
function  isFond(ID_SCH:Int64;ActualDate:TDateTime;Database:TpFibDatabase;Transaction:TpFibTransaction):Boolean;
function  getSmPlan(ID_SM:Int64;ActualDate:TDateTime;Database:TpFibDatabase;Transaction:TpFibTransaction):Int64;
function  checkSchInfo(LOCAL_STRU:PWIZARD_GET_PROV_INFO;isDB:Integer;Database:TpFibDatabase;Transaction:TpFibTransaction):Boolean;
function  checkCorrSchInfo(LOCAL_STRU:PWIZARD_GET_PROV_INFO;isDB:Integer;Database:TpFibDatabase;Transaction:TpFibTransaction):Boolean;
function  checkSmInfo(LOCAL_STRU:PWIZARD_GET_PROV_INFO;isDB:Integer;Database:TpFibDatabase;Transaction:TpFibTransaction):Boolean;
function  checkRzInfo(LOCAL_STRU:PWIZARD_GET_PROV_INFO;isDB:Integer;Database:TpFibDatabase;Transaction:TpFibTransaction):Boolean;
function  checkStInfo(LOCAL_STRU:PWIZARD_GET_PROV_INFO;isDB:Integer;Database:TpFibDatabase;Transaction:TpFibTransaction):Boolean;
function  checkKVInfo(LOCAL_STRU:PWIZARD_GET_PROV_INFO;isDB:Integer;Database:TpFibDatabase;Transaction:TpFibTransaction):Boolean;

implementation

uses UWizardGetInfo;

//*********************************************************************************************
//***********************Реализация шагов для режимов 1****************************************
//*********************************************************************************************
function Step1_1(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var GetForm:TfrmGetData;
    GetFormResult:TModalResult;
    NextStep:Integer;
begin
       //выбираем счет по присланному рабочему

       if checkSchInfo(LOCAL_STRU,LOCAL_STRU^.CR_BY_DT,Database,Transaction)
       then begin
                 NextStep:=0;

                 if (LOCAL_STRU^.CR_BY_DT=1)
                 then LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.DB_ID_SCH
                 else LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.KR_ID_SCH;

                 GetForm      :=TfrmGetData.Create(AOwner,5,LOCAL_STRU^,0);

                 //Определяем компоненты для подсветки
                 if (LOCAL_STRU^.CR_BY_DT=1)
                 then begin
                           SetLength(GetForm.SplashEdit,2);
                           GetForm.SplashEdit[0]:=GetForm.edKRSchNum;
                           GetForm.SplashEdit[1]:=GetForm.edKRSchTitle;
                 end
                 else begin
                           SetLength(GetForm.SplashEdit,2);
                           GetForm.SplashEdit[0]:=GetForm.edDBSchNum;
                           GetForm.SplashEdit[1]:=GetForm.edDBSchTitle;
                 end;

                 GetFormResult:=GetForm.ShowModal;

                 if (GetFormResult=mrNoToAll) then begin
                                                        //Вернуться к предыдущему шагу работы мастера
                                                        NextStep:= 0;
                                              end;
                 if (GetFormResult=mrYes)     then begin
                                                        //Был выбран счет
                                                        NextStep:= 1;

                                                        //Сохраняем в структуру выбранные данные
                                                        if (LOCAL_STRU^.CR_BY_DT=1)
                                                        then begin //Сохраняем информацию в дебетовый счет
                                                                   LOCAL_STRU^.KR_ID_SCH    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                   LOCAL_STRU^.KR_ID_SCH_KOD:=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString;
                                                                   LOCAL_STRU^.KR_ID_SCH_TIT:=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;
                                                        end
                                                        else begin //Сохраняем информацию в кредитовый счет
                                                                   LOCAL_STRU^.DB_ID_SCH    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                   LOCAL_STRU^.DB_ID_SCH_KOD:=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString;
                                                                   LOCAL_STRU^.DB_ID_SCH_TIT:=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;
                                                        end;
                                              end;
                 if (GetFormResult=mrCancel)  then begin
                                                        //Завершить работу с мастером
                                                        NextStep:= 0;
                                              end;

                 GetForm.Free;
       end
       else NextStep:=0;

       Result:=NextStep;
end;

function Step1_2(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var GetForm:TfrmGetData;
    GetFormResult:TModalResult;
    NextStep:Integer;
    DB_IS_FOND,KR_IS_FOND:Boolean;
begin
     //выбираем сметы

     NextStep:=0;

     //Поднимаем информацию о том, являются ли счета фондами
     DB_IS_FOND:=IsFond(LOCAL_STRU^.DB_ID_SCH,LOCAL_STRU^.ACTUAL_DATE,Database,Transaction);
     KR_IS_FOND:=IsFond(LOCAL_STRU^.KR_ID_SCH,LOCAL_STRU^.ACTUAL_DATE,Database,Transaction);


     //проверяем различаются ли бюджеты в дебете и кредите
     If (DB_IS_FOND and KR_IS_FOND)
     then begin
               if LOCAL_STRU^.NOT_DIF_BDG_FG then LOCAL_STRU^.NOT_DIF_BDG_FG:=false;
     end;
     If DB_IS_FOND and not KR_IS_FOND
     then begin
               LOCAL_STRU^.ID_SCH_IN     :=LOCAL_STRU^.DB_ID_SCH;
               //LOCAL_STRU^.NOT_DIF_BDG_FG:=false;
     end;
     If not DB_IS_FOND and KR_IS_FOND
     then begin
               LOCAL_STRU^.ID_SCH_IN     :=LOCAL_STRU^.KR_ID_SCH;
               //LOCAL_STRU^.NOT_DIF_BDG_FG:=false;
     end;
     If not DB_IS_FOND and not KR_IS_FOND
     then begin
               LOCAL_STRU^.ID_SCH_IN     :=0;
     end;


     if LOCAL_STRU.NOT_DIF_BDG_FG
     then begin
                         GetForm      :=TfrmGetData.Create(AOwner,1,LOCAL_STRU^,-1);

                         //Определяем компоненты для подсветки
                         SetLength(GetForm.SplashEdit,2);
                         GetForm.SplashEdit[0]:=GetForm.edKrSm;
                         GetForm.SplashEdit[1]:=GetForm.edDbSm;

                         GetFormResult:=GetForm.ShowModal;

                         if (GetFormResult=mrNoToAll) then begin
                                                                //Вернуться к предыдущему шагу работы мастера
                                                                NextStep:= -1;
                                                      end;
                         if (GetFormResult=mrYes)     then begin
                                                                //Была выбрана смета
                                                                NextStep:= 1;

                                                                //Сохраняем в структуру выбранные данные
                                                                LOCAL_STRU^.KR_ID_SMETA    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_SMETA').AsString);
                                                                LOCAL_STRU^.KR_KOD_SMETA   :=GetForm.ObjectsDataSet.FieldByName('SMETA_KOD').Value;
                                                                LOCAL_STRU^.KR_TITLE_SMETA :=GetForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString;

                                                                LOCAL_STRU^.DB_ID_SMETA    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_SMETA').AsString);
                                                                LOCAL_STRU^.DB_KOD_SMETA   :=GetForm.ObjectsDataSet.FieldByName('SMETA_KOD').Value;
                                                                LOCAL_STRU^.DB_TITLE_SMETA :=GetForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString;

                                                      end;
                         if (GetFormResult=mrCancel)  then begin
                                                                //Завершить работу с мастером
                                                                NextStep:= 0;
                                                      end;

                         GetForm.Free;
     end
     else begin
                         IF DB_IS_FOND
                         then LOCAL_STRU^.ID_SCH_IN     :=LOCAL_STRU^.DB_ID_SCH
                         else LOCAL_STRU^.ID_SCH_IN     :=0;

                         GetForm      :=TfrmGetData.Create(AOwner,1,LOCAL_STRU^,1);

                         //Определяем компоненты для подсветки
                         SetLength(GetForm.SplashEdit,1);
                         GetForm.SplashEdit[0]:=GetForm.edDbSm;

                         GetFormResult:=GetForm.ShowModal;

                         if (GetFormResult=mrNoToAll) then begin
                                                                //Вернуться к предыдущему шагу работы мастера
                                                                NextStep:= -1;
                                                      end;
                         if (GetFormResult=mrYes)     then begin
                                                                //Была выбрана смета
                                                                NextStep:= 1;

                                                                //Сохраняем в структуру выбранные данные

                                                                LOCAL_STRU^.DB_ID_SMETA    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_SMETA').AsString);
                                                                LOCAL_STRU^.DB_KOD_SMETA   :=GetForm.ObjectsDataSet.FieldByName('SMETA_KOD').Value;
                                                                LOCAL_STRU^.DB_TITLE_SMETA :=GetForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString;

                                                      end;
                         if (GetFormResult=mrCancel)  then begin
                                                                //Завершить работу с мастером
                                                                NextStep:= 0;
                                                      end;

                         GetForm.Free;


                         IF KR_IS_FOND
                         then LOCAL_STRU^.ID_SCH_IN     :=LOCAL_STRU^.KR_ID_SCH
                         else LOCAL_STRU^.ID_SCH_IN     :=0;

                         GetForm      :=TfrmGetData.Create(AOwner,1,LOCAL_STRU^,0);

                         //Определяем компоненты для подсветки
                         SetLength(GetForm.SplashEdit,1);
                         GetForm.SplashEdit[0]:=GetForm.edKrSm;

                         GetFormResult:=GetForm.ShowModal;

                         if (GetFormResult=mrNoToAll) then begin
                                                                //Вернуться к предыдущему шагу работы мастера
                                                                NextStep:= -1;
                                                      end;
                         if (GetFormResult=mrYes)     then begin
                                                                //Была выбрана смета
                                                                NextStep:= 1;

                                                                //Сохраняем в структуру выбранные данные

                                                                LOCAL_STRU^.KR_ID_SMETA    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_SMETA').AsString);
                                                                LOCAL_STRU^.KR_KOD_SMETA   :=GetForm.ObjectsDataSet.FieldByName('SMETA_KOD').Value;
                                                                LOCAL_STRU^.KR_TITLE_SMETA :=GetForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString;

                                                      end;
                         if (GetFormResult=mrCancel)  then begin
                                                                //Завершить работу с мастером
                                                                NextStep:= 0;
                                                      end;

                         GetForm.Free;
     end;
     Result:=NextStep;
end;

function Step1_3(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var GetForm:TfrmGetData;
    GetFormResult:TModalResult;
    NextStep:Integer;
begin
     NextStep:=0;
     //Выбираем разделы
     if (LOCAL_STRU^.NOT_DIF_BDG_FG)
     then begin
                         LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.DB_ID_SMETA;

                         GetForm      :=TfrmGetData.Create(AOwner,2,LOCAL_STRU^,-1);

                         //Определяем компоненты для подсветки
                         SetLength(GetForm.SplashEdit,2);
                         GetForm.SplashEdit[0]:=GetForm.edKrRz;
                         GetForm.SplashEdit[1]:=GetForm.edDbRz;

                         GetFormResult:=GetForm.ShowModal;

                         if (GetFormResult=mrNoToAll) then begin
                                                                //Вернуться к предыдущему шагу работы мастера
                                                                NextStep:= -1;
                                                      end;
                         if (GetFormResult=mrYes)     then begin
                                                                //Был выбран счет
                                                                NextStep:= 1;

                                                                //Сохраняем в структуру выбранные данные
                                                                LOCAL_STRU^.KR_ID_RAZD    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                LOCAL_STRU^.KR_KOD_RAZD   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                LOCAL_STRU^.KR_TITLE_RAZD :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                                LOCAL_STRU^.DB_ID_RAZD    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                LOCAL_STRU^.DB_KOD_RAZD   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                LOCAL_STRU^.DB_TITLE_RAZD :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                      end;
                         if (GetFormResult=mrCancel)  then begin
                                                                //Завершить работу с мастером
                                                                NextStep:= 0;
                                                      end;

                         GetForm.Free;
     end
     else begin
                         LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.DB_ID_SMETA;

                         GetForm      :=TfrmGetData.Create(AOwner,2,LOCAL_STRU^,1);

                         //Определяем компоненты для подсветки
                         SetLength(GetForm.SplashEdit,1);
                         GetForm.SplashEdit[0]:=GetForm.edDBRz;

                         GetFormResult:=GetForm.ShowModal;

                         if (GetFormResult=mrNoToAll) then begin
                                                                //Вернуться к предыдущему шагу работы мастера
                                                                NextStep:= -1;
                                                      end;
                         if (GetFormResult=mrYes)     then begin
                                                                //Был выбран счет
                                                                NextStep:= 1;

                                                                //Сохраняем в структуру выбранные данные
                                                                LOCAL_STRU^.DB_ID_RAZD    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                LOCAL_STRU^.DB_KOD_RAZD   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                LOCAL_STRU^.DB_TITLE_RAZD :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                      end;
                         if (GetFormResult=mrCancel)  then begin
                                                                //Завершить работу с мастером
                                                                NextStep:= 0;
                                                      end;

                         GetForm.Free;

                         LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.DB_ID_SMETA;

                         GetForm      :=TfrmGetData.Create(AOwner,2,LOCAL_STRU^,0);

                         //Определяем компоненты для подсветки
                         SetLength(GetForm.SplashEdit,1);
                         GetForm.SplashEdit[0]:=GetForm.edKrRz;

                         GetFormResult:=GetForm.ShowModal;

                         if (GetFormResult=mrNoToAll) then begin
                                                                //Вернуться к предыдущему шагу работы мастера
                                                                NextStep:= -1;
                                                      end;
                         if (GetFormResult=mrYes)     then begin
                                                                //Был выбран счет
                                                                NextStep:= 1;

                                                                //Сохраняем в структуру выбранные данные
                                                                LOCAL_STRU^.KR_ID_RAZD    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                LOCAL_STRU^.KR_KOD_RAZD   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                LOCAL_STRU^.KR_TITLE_RAZD :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;
                                                      end;
                         if (GetFormResult=mrCancel)  then begin
                                                                //Завершить работу с мастером
                                                                NextStep:= 0;
                                                      end;

                         GetForm.Free;
     end;

     Result:=NextStep;
end;


function Step1_4(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var GetForm:TfrmGetData;
    GetFormResult:TModalResult;
    NextStep:Integer;
begin
     NextStep:=0;
     //Выбираем статьи
     if LOCAL_STRU^.NOT_DIF_BDG_FG
     then begin
                           LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.DB_ID_RAZD;
                           LOCAL_STRU^.ID_OPER  :=LOCAL_STRU^.DB_ID_SMETA;

                           GetForm      :=TfrmGetData.Create(AOwner,3,LOCAL_STRU^,-1);

                           //Определяем компоненты для подсветки
                           SetLength(GetForm.SplashEdit,2);
                           GetForm.SplashEdit[0]:=GetForm.edKrSt;
                           GetForm.SplashEdit[1]:=GetForm.edDbSt;

                           GetFormResult:=GetForm.ShowModal;

                           if (GetFormResult=mrNoToAll) then begin
                                                                  //Вернуться к предыдущему шагу работы мастера
                                                                  NextStep:= -1;
                                                        end;
                           if (GetFormResult=mrYes)     then begin
                                                                  //Был выбрана статья
                                                                  NextStep:= 1;

                                                                  //Сохраняем в структуру выбранные данные
                                                                  LOCAL_STRU^.KR_ID_STAT    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                  LOCAL_STRU^.KR_KOD_STAT   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                  LOCAL_STRU^.KR_TITLE_STAT :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                                  LOCAL_STRU^.DB_ID_STAT    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                  LOCAL_STRU^.DB_KOD_STAT   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                  LOCAL_STRU^.DB_TITLE_STAT :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                        end;
                           if (GetFormResult=mrCancel)  then begin
                                                                  //Завершить работу с мастером
                                                                  NextStep:= 0;
                                                        end;

                           GetForm.Free;
     end
     else begin
                           LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.DB_ID_RAZD;
                           LOCAL_STRU^.ID_OPER  :=LOCAL_STRU^.DB_ID_SMETA;

                           GetForm      :=TfrmGetData.Create(AOwner,3,LOCAL_STRU^,1);

                           //Определяем компоненты для подсветки
                           SetLength(GetForm.SplashEdit,1);
                           GetForm.SplashEdit[0]:=GetForm.edDbSt;

                           GetFormResult:=GetForm.ShowModal;

                           if (GetFormResult=mrNoToAll) then begin
                                                                  //Вернуться к предыдущему шагу работы мастера
                                                                  NextStep:= -1;
                                                        end;
                           if (GetFormResult=mrYes)     then begin
                                                                  //Был выбрана статья
                                                                  NextStep:= 1;

                                                                  //Сохраняем в структуру выбранные данные
                                                                  LOCAL_STRU^.DB_ID_STAT    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                  LOCAL_STRU^.DB_KOD_STAT   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                  LOCAL_STRU^.DB_TITLE_STAT :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                        end;
                           if (GetFormResult=mrCancel)  then begin
                                                                  //Завершить работу с мастером
                                                                  NextStep:= 0;
                                                        end;

                           GetForm.Free;


                           LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.KR_ID_RAZD;
                           LOCAL_STRU^.ID_OPER  :=LOCAL_STRU^.KR_ID_SMETA;

                           GetForm      :=TfrmGetData.Create(AOwner,3,LOCAL_STRU^,0);

                           //Определяем компоненты для подсветки
                           SetLength(GetForm.SplashEdit,1);
                           GetForm.SplashEdit[0]:=GetForm.edKrSt;

                           GetFormResult:=GetForm.ShowModal;

                           if (GetFormResult=mrNoToAll) then begin
                                                                  //Вернуться к предыдущему шагу работы мастера
                                                                  NextStep:= -1;
                                                        end;
                           if (GetFormResult=mrYes)     then begin
                                                                  //Был выбрана статья
                                                                  NextStep:= 1;

                                                                  //Сохраняем в структуру выбранные данные
                                                                  LOCAL_STRU^.KR_ID_STAT    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                  LOCAL_STRU^.KR_KOD_STAT   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                  LOCAL_STRU^.KR_TITLE_STAT :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                        end;
                           if (GetFormResult=mrCancel)  then begin
                                                                  //Завершить работу с мастером
                                                                  NextStep:= 0;
                                                        end;
                           GetForm.Free;
     end;
     Result:=NextStep;
end;


function Step1_5(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var  GetForm:TfrmGetData;
     GetFormResult:TModalResult;
     NextStep:Integer;
begin
     NextStep:=0;
     //Выбираем коды затрат
     if LOCAL_STRU^.NOT_DIF_BDG_FG
     then begin
                         GetForm      :=TfrmGetData.Create(AOwner,6,LOCAL_STRU^,-1);

                         //Определяем компоненты для подсветки
                         SetLength(GetForm.SplashEdit,2);
                         GetForm.SplashEdit[0]:=GetForm.edKrKV;
                         GetForm.SplashEdit[1]:=GetForm.edDbKV;

                         GetFormResult:=GetForm.ShowModal;

                         if (GetFormResult=mrNoToAll) then begin
                                                                //Вернуться к предыдущему шагу работы мастера
                                                                NextStep:= -1;
                                                      end;
                         if (GetFormResult=mrYes)     then begin
                                                                //Был выбрана статья
                                                                NextStep:= 1;

                                                                //Сохраняем в структуру выбранные данные
                                                                LOCAL_STRU^.KR_ID_KEKV    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                LOCAL_STRU^.KR_KOD_KEKV   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                LOCAL_STRU^.KR_KEKV_TITLE :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                                LOCAL_STRU^.DB_ID_KEKV    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                LOCAL_STRU^.DB_KOD_KEKV   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                LOCAL_STRU^.DB_KEKV_TITLE :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                      end;
                         if (GetFormResult=mrCancel)  then begin
                                                                //Завершить работу с мастером
                                                                NextStep:= 0;
                                                      end;

                         GetForm.Free;
     end
     else begin
                         GetForm      :=TfrmGetData.Create(AOwner,6,LOCAL_STRU^,1);

                         //Определяем компоненты для подсветки
                         SetLength(GetForm.SplashEdit,1);
                         GetForm.SplashEdit[0]:=GetForm.edDbKV;

                         GetFormResult:=GetForm.ShowModal;

                         if (GetFormResult=mrNoToAll) then begin
                                                                //Вернуться к предыдущему шагу работы мастера
                                                                NextStep:= -1;
                                                      end;
                         if (GetFormResult=mrYes)     then begin
                                                                //Был выбрана статья
                                                                NextStep:= 1;

                                                                //Сохраняем в структуру выбранные данные
                                                                LOCAL_STRU^.DB_ID_KEKV    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                LOCAL_STRU^.DB_KOD_KEKV   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                LOCAL_STRU^.DB_KEKV_TITLE :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                      end;
                         if (GetFormResult=mrCancel)  then begin
                                                                //Завершить работу с мастером
                                                                NextStep:= 0;
                                                      end;

                         GetForm.Free;


                         GetForm      :=TfrmGetData.Create(AOwner,6,LOCAL_STRU^,0);

                         //Определяем компоненты для подсветки
                         SetLength(GetForm.SplashEdit,1);
                         GetForm.SplashEdit[0]:=GetForm.edDbKV;

                         GetFormResult:=GetForm.ShowModal;

                         if (GetFormResult=mrNoToAll) then begin
                                                                //Вернуться к предыдущему шагу работы мастера
                                                                NextStep:= -1;
                                                      end;
                         if (GetFormResult=mrYes)     then begin
                                                                //Был выбрана статья
                                                                NextStep:= 1;

                                                                //Сохраняем в структуру выбранные данные
                                                                LOCAL_STRU^.KR_ID_KEKV    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                LOCAL_STRU^.KR_KOD_KEKV   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                LOCAL_STRU^.KR_KEKV_TITLE :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                      end;
                         if (GetFormResult=mrCancel)  then begin
                                                                //Завершить работу с мастером
                                                                NextStep:= 0;
                                                      end;

                         GetForm.Free;
     end;

     Result:=NextStep;
end;

//*********************************************************************************************
//*********************************************************************************************
//*********************************************************************************************


//*********************************************************************************************
//***********************Реализация шагов для режимов 11***************************************
//*********************************************************************************************
function Step11_1(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var GetForm:TfrmGetData;
    GetFormResult:TModalResult;
    NextStep:Integer;
begin
     if (PrevStep<0)
     then begin
               if LOCAL_STRU^.CR_BY_DT=1
               then LOCAL_STRU^.DB_ID_SCH:=-1
               else LOCAL_STRU^.KR_ID_SCH:=-1;
     end;

     //Поднимаем информацию по присланному рабочему счету
     if not checkSchInfo(LOCAL_STRU,LOCAL_STRU^.CR_BY_DT,Database,Transaction)
     then begin
               //Процедура выбора рабочего счета
               NextStep     :=0;

               GetForm      :=TfrmGetData.Create(AOwner,7,LOCAL_STRU^,0);

               //Определяем компоненты для подсветки
               if (LOCAL_STRU^.CR_BY_DT=1)
               then begin
                         SetLength(GetForm.SplashEdit,2);
                         GetForm.SplashEdit[0]:=GetForm.edDBSchNum;
                         GetForm.SplashEdit[1]:=GetForm.edDBSchTitle;
               end
               else begin
                         SetLength(GetForm.SplashEdit,2);
                         GetForm.SplashEdit[0]:=GetForm.edKrSchNum;
                         GetForm.SplashEdit[1]:=GetForm.edKrSchTitle;
               end;

               GetFormResult:=GetForm.ShowModal;

               if (GetFormResult=mrNoToAll) then begin
                                                      //Вернуться к предыдущему шагу работы мастера
                                                      NextStep:= 0;
                                            end;
               if (GetFormResult=mrYes)     then begin
                                                      //Был выбран счет
                                                      NextStep:= 1;

                                                      //Сохраняем в структуру выбранные данные
                                                      if (LOCAL_STRU^.CR_BY_DT=1)
                                                      then begin //Сохраняем информацию в дебетовый счет
                                                                 LOCAL_STRU^.DB_ID_SCH    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                 LOCAL_STRU^.DB_ID_SCH_KOD:=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString;
                                                                 LOCAL_STRU^.DB_ID_SCH_TIT:=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;
                                                      end
                                                      else begin //Сохраняем информацию в кредитовый счет
                                                                 LOCAL_STRU^.KR_ID_SCH    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                 LOCAL_STRU^.KR_ID_SCH_KOD:=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString;
                                                                 LOCAL_STRU^.KR_ID_SCH_TIT:=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;
                                                      end;
                                            end;
               if (GetFormResult=mrCancel)  then begin
                                                      //Завершить работу с мастером
                                                      NextStep:= 0;
                                            end;

               GetForm.Free;
     end
     else NextStep:=1;

     Result:=NextStep;
end;

function Step11_2(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var GetForm:TfrmGetData;
    GetFormResult:TModalResult;
    NextStep:Integer;
begin
     if (PrevStep<0)
     then begin
               if LOCAL_STRU^.CR_BY_DT=1
               then LOCAL_STRU^.KR_ID_SCH:=-1
               else LOCAL_STRU^.DB_ID_SCH:=-1;
     end;

     //проверяем корректность корреспондирующего счета
     if not checkCorrSchInfo(LOCAL_STRU,{1-}LOCAL_STRU^.CR_BY_DT,Database,Transaction)
     then begin
                 NextStep     :=0;

                 if (LOCAL_STRU^.CR_BY_DT=1)
                 then LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.DB_ID_SCH
                 else LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.KR_ID_SCH;

                 GetForm      :=TfrmGetData.Create(AOwner,5,LOCAL_STRU^,0);

                 //Определяем компоненты для подсветки
                 if (LOCAL_STRU^.CR_BY_DT=1)
                 then begin
                           SetLength(GetForm.SplashEdit,2);
                           GetForm.SplashEdit[0]:=GetForm.edKRSchNum;
                           GetForm.SplashEdit[1]:=GetForm.edKRSchTitle;
                 end
                 else begin
                           SetLength(GetForm.SplashEdit,2);
                           GetForm.SplashEdit[0]:=GetForm.edDBSchNum;
                           GetForm.SplashEdit[1]:=GetForm.edDBSchTitle;
                 end;

                 GetFormResult:=GetForm.ShowModal;

                 if (GetFormResult=mrNoToAll) then begin
                                                        //Вернуться к предыдущему шагу работы мастера
                                                        NextStep:= -1;
                                              end;
                 if (GetFormResult=mrYes)     then begin
                                                        //Был выбран счет
                                                        NextStep:= 1;

                                                        //Сохраняем в структуру выбранные данные
                                                        if (LOCAL_STRU^.CR_BY_DT=1)
                                                        then begin //Сохраняем информацию в дебетовый счет
                                                                   LOCAL_STRU^.KR_ID_SCH    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                   LOCAL_STRU^.KR_ID_SCH_KOD:=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString;
                                                                   LOCAL_STRU^.KR_ID_SCH_TIT:=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;
                                                        end
                                                        else begin //Сохраняем информацию в кредитовый счет
                                                                   LOCAL_STRU^.DB_ID_SCH    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                   LOCAL_STRU^.DB_ID_SCH_KOD:=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString;
                                                                   LOCAL_STRU^.DB_ID_SCH_TIT:=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;
                                                        end;
                                              end;
                 if (GetFormResult=mrCancel)  then begin
                                                        //Завершить работу с мастером
                                                        NextStep:= 0;
                                              end;

                 GetForm.Free;

     end
     else NextStep:=1;

     Result:=NextStep;
end;

function Step11_3(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var GetForm:TfrmGetData;
    GetFormResult:TModalResult;
    NextStep:Integer;
    DB_IS_FOND,KR_IS_FOND:Boolean;
begin
     NextStep:=0;

     //Поднимаем информацию о том, являются ли счета фондами
     DB_IS_FOND:=IsFond(LOCAL_STRU^.DB_ID_SCH,LOCAL_STRU^.ACTUAL_DATE,Database,Transaction);
     KR_IS_FOND:=IsFond(LOCAL_STRU^.KR_ID_SCH,LOCAL_STRU^.ACTUAL_DATE,Database,Transaction);


     //проверяем различаются ли бюджеты в дебете и кредите
     LOCAL_STRU^.ID_SCH_IN:=0;

     If (DB_IS_FOND and KR_IS_FOND)
     then begin
               if LOCAL_STRU^.NOT_DIF_BDG_FG
               then LOCAL_STRU^.NOT_DIF_BDG_FG:=false;
     end;
     If DB_IS_FOND and not KR_IS_FOND
     then begin
               LOCAL_STRU^.ID_SCH_IN     :=LOCAL_STRU^.DB_ID_SCH;
               //LOCAL_STRU^.NOT_DIF_BDG_FG:=false;
     end;
     If not DB_IS_FOND and KR_IS_FOND
     then begin
               LOCAL_STRU^.ID_SCH_IN     :=LOCAL_STRU^.KR_ID_SCH;
               //LOCAL_STRU^.NOT_DIF_BDG_FG:=false;
     end;
     If not DB_IS_FOND and not KR_IS_FOND
     then begin
               LOCAL_STRU^.ID_SCH_IN     :=0;
     end;

     if LOCAL_STRU.NOT_DIF_BDG_FG
     then begin

               if (PrevStep<0)
               then  begin
                          LOCAL_STRU^.DB_ID_SMETA:=-1;
                          LOCAL_STRU^.KR_ID_SMETA:=-1;
               end;

               //проверяем смету по проводке
               if not checkSmInfo(LOCAL_STRU,-1,Database,Transaction)
               then begin
                         GetForm      :=TfrmGetData.Create(AOwner,1,LOCAL_STRU^,-1);

                         //Определяем компоненты для подсветки
                         SetLength(GetForm.SplashEdit,2);
                         GetForm.SplashEdit[0]:=GetForm.edKrSm;
                         GetForm.SplashEdit[1]:=GetForm.edDbSm;

                         GetFormResult:=GetForm.ShowModal;

                         if (GetFormResult=mrNoToAll) then begin
                                                                //Вернуться к предыдущему шагу работы мастера
                                                                NextStep:= -2;
                                                      end;
                         if (GetFormResult=mrYes)     then begin
                                                                //Была выбрана смета
                                                                NextStep:= 1;

                                                                //Сохраняем в структуру выбранные данные
                                                                LOCAL_STRU^.KR_ID_SMETA    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_SMETA').AsString);
                                                                LOCAL_STRU^.KR_KOD_SMETA   :=GetForm.ObjectsDataSet.FieldByName('SMETA_KOD').Value;
                                                                LOCAL_STRU^.KR_TITLE_SMETA :=GetForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString;

                                                                LOCAL_STRU^.DB_ID_SMETA    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_SMETA').AsString);
                                                                LOCAL_STRU^.DB_KOD_SMETA   :=GetForm.ObjectsDataSet.FieldByName('SMETA_KOD').Value;
                                                                LOCAL_STRU^.DB_TITLE_SMETA :=GetForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString;

                                                      end;
                         if (GetFormResult=mrCancel)  then begin
                                                                //Завершить работу с мастером
                                                                NextStep:= 0;
                                                      end;

                         GetForm.Free;
               end
               else NextStep:=1;
     end
     else begin
               //проверяем смету в дебете
               if (PrevStep<0)
               then  begin
                          LOCAL_STRU^.DB_ID_SMETA:=-1;
               end;


               if not checkSmInfo(LOCAL_STRU,1,Database,Transaction)
               then begin
                         IF DB_IS_FOND
                         then LOCAL_STRU^.ID_SCH_IN     :=LOCAL_STRU^.DB_ID_SCH
                         else LOCAL_STRU^.ID_SCH_IN     :=0;

                         GetForm      :=TfrmGetData.Create(AOwner,1,LOCAL_STRU^,1);

                         //Определяем компоненты для подсветки
                         SetLength(GetForm.SplashEdit,1);
                         GetForm.SplashEdit[0]:=GetForm.edDbSm;

                         GetFormResult:=GetForm.ShowModal;

                         if (GetFormResult=mrNoToAll) then begin
                                                                //Вернуться к предыдущему шагу работы мастера
                                                                NextStep:= -1;
                                                      end;
                         if (GetFormResult=mrYes)     then begin
                                                                //Была выбрана смета
                                                                NextStep:= 1;

                                                                //Сохраняем в структуру выбранные данные

                                                                LOCAL_STRU^.DB_ID_SMETA    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_SMETA').AsString);
                                                                LOCAL_STRU^.DB_KOD_SMETA   :=GetForm.ObjectsDataSet.FieldByName('SMETA_KOD').Value;
                                                                LOCAL_STRU^.DB_TITLE_SMETA :=GetForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString;

                                                      end;
                         if (GetFormResult=mrCancel)  then begin
                                                                //Завершить работу с мастером
                                                                NextStep:= 0;
                                                      end;

                         GetForm.Free;
               end
               else NextStep:=1;

               //проверяем смету в кредите

               if (PrevStep<0)
               then  begin
                          LOCAL_STRU^.KR_ID_SMETA:=-1;
               end;

               if not checkSmInfo(LOCAL_STRU,0,Database,Transaction)
               then begin
                         IF KR_IS_FOND
                         then LOCAL_STRU^.ID_SCH_IN     :=LOCAL_STRU^.KR_ID_SCH
                         else LOCAL_STRU^.ID_SCH_IN     :=0;

                         GetForm      :=TfrmGetData.Create(AOwner,1,LOCAL_STRU^,0);

                         //Определяем компоненты для подсветки
                         SetLength(GetForm.SplashEdit,1);
                         GetForm.SplashEdit[0]:=GetForm.edKrSm;

                         GetFormResult:=GetForm.ShowModal;

                         if (GetFormResult=mrNoToAll) then begin
                                                                //Вернуться к предыдущему шагу работы мастера
                                                                NextStep:= -1;
                                                      end;
                         if (GetFormResult=mrYes)     then begin
                                                                //Была выбрана смета
                                                                NextStep:= 1;

                                                                //Сохраняем в структуру выбранные данные

                                                                LOCAL_STRU^.KR_ID_SMETA    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_SMETA').AsString);
                                                                LOCAL_STRU^.KR_KOD_SMETA   :=GetForm.ObjectsDataSet.FieldByName('SMETA_KOD').Value;
                                                                LOCAL_STRU^.KR_TITLE_SMETA :=GetForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString;

                                                      end;
                         if (GetFormResult=mrCancel)  then begin
                                                                //Завершить работу с мастером
                                                                NextStep:= 0;
                                                      end;

                         GetForm.Free;
               end
               else NextStep:=1;
     end;
     Result:=NextStep;
end;


function Step11_4(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var  GetForm:TfrmGetData;
     GetFormResult:TModalResult;
     NextStep:Integer;
begin
     NextStep:=0;
     //Проверяем разные ли разделы в дебете и кредите
     if (LOCAL_STRU^.NOT_DIF_BDG_FG)
     then begin

               if (PrevStep<0)
               then  begin
                          LOCAL_STRU^.DB_ID_RAZD:=-1;
                          LOCAL_STRU^.KR_ID_RAZD:=-1;
               end;

               if not checkRzInfo(LOCAL_STRU,-1,Database,Transaction)
               then begin
                         LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.DB_ID_SMETA;

                         GetForm      :=TfrmGetData.Create(AOwner,2,LOCAL_STRU^,-1);

                         //Определяем компоненты для подсветки
                         SetLength(GetForm.SplashEdit,2);
                         GetForm.SplashEdit[0]:=GetForm.edKrRz;
                         GetForm.SplashEdit[1]:=GetForm.edDbRz;

                         GetFormResult:=GetForm.ShowModal;

                         if (GetFormResult=mrNoToAll) then begin
                                                                //Вернуться к предыдущему шагу работы мастера
                                                                NextStep:= -1;
                                                      end;
                         if (GetFormResult=mrYes)     then begin
                                                                //Был выбран счет
                                                                NextStep:= 1;

                                                                //Сохраняем в структуру выбранные данные
                                                                LOCAL_STRU^.KR_ID_RAZD    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                LOCAL_STRU^.KR_KOD_RAZD   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                LOCAL_STRU^.KR_TITLE_RAZD :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                                LOCAL_STRU^.DB_ID_RAZD    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                LOCAL_STRU^.DB_KOD_RAZD   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                LOCAL_STRU^.DB_TITLE_RAZD :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                      end;
                         if (GetFormResult=mrCancel)  then begin
                                                                //Завершить работу с мастером
                                                                NextStep:= 0;
                                                      end;

                         GetForm.Free;
               end
               else NextStep:=1;
     end
     else begin

               if (PrevStep<0)
               then  begin
                          LOCAL_STRU^.DB_ID_RAZD:=-1;
                          LOCAL_STRU^.KR_ID_RAZD:=-1;
               end;

               if not checkRzInfo(LOCAL_STRU,1,Database,Transaction)
               then begin
                         LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.DB_ID_SMETA;

                         GetForm      :=TfrmGetData.Create(AOwner,2,LOCAL_STRU^,1);

                         //Определяем компоненты для подсветки
                         SetLength(GetForm.SplashEdit,1);
                         GetForm.SplashEdit[0]:=GetForm.edDBRz;

                         GetFormResult:=GetForm.ShowModal;

                         if (GetFormResult=mrNoToAll) then begin
                                                                //Вернуться к предыдущему шагу работы мастера
                                                                NextStep:= -1;
                                                      end;
                         if (GetFormResult=mrYes)     then begin
                                                                //Был выбран счет
                                                                NextStep:= 1;

                                                                //Сохраняем в структуру выбранные данные
                                                                LOCAL_STRU^.DB_ID_RAZD    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                LOCAL_STRU^.DB_KOD_RAZD   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                LOCAL_STRU^.DB_TITLE_RAZD :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                      end;
                         if (GetFormResult=mrCancel)  then begin
                                                                //Завершить работу с мастером
                                                                NextStep:= 0;
                                                      end;

                         GetForm.Free;
               end
               else NextStep:=1;

               if not checkRzInfo(LOCAL_STRU,0,Database,Transaction)
               then begin
                         LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.KR_ID_SMETA;

                         GetForm      :=TfrmGetData.Create(AOwner,2,LOCAL_STRU^,0);

                         //Определяем компоненты для подсветки
                         SetLength(GetForm.SplashEdit,1);
                         GetForm.SplashEdit[0]:=GetForm.edKrRz;

                         GetFormResult:=GetForm.ShowModal;

                         if (GetFormResult=mrNoToAll) then begin
                                                                //Вернуться к предыдущему шагу работы мастера
                                                                NextStep:= -1;
                                                      end;
                         if (GetFormResult=mrYes)     then begin
                                                                //Был выбран счет
                                                                NextStep:= 1;

                                                                //Сохраняем в структуру выбранные данные
                                                                LOCAL_STRU^.KR_ID_RAZD    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                LOCAL_STRU^.KR_KOD_RAZD   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                LOCAL_STRU^.KR_TITLE_RAZD :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;
                                                      end;
                         if (GetFormResult=mrCancel)  then begin
                                                                //Завершить работу с мастером
                                                                NextStep:= 0;
                                                      end;

                         GetForm.Free;
               end
               else NextStep:=1;
     end;

     Result:=NextStep;
end;


function Step11_5(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var  GetForm:TfrmGetData;
     GetFormResult:TModalResult;
     NextStep:Integer;
begin
     NextStep:=0;

     if (PrevStep<0)
     then  begin
                LOCAL_STRU^.DB_ID_STAT:=-1;
                LOCAL_STRU^.KR_ID_STAT:=-1;
     end;


     if LOCAL_STRU^.NOT_DIF_BDG_FG
     then begin
               if not checkStInfo(LOCAL_STRU,-1,Database,Transaction)
               then begin
                           LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.DB_ID_RAZD;
                           LOCAL_STRU^.ID_OPER  :=LOCAL_STRU^.DB_ID_SMETA;

                           GetForm      :=TfrmGetData.Create(AOwner,3,LOCAL_STRU^,-1);

                           //Определяем компоненты для подсветки
                           SetLength(GetForm.SplashEdit,2);
                           GetForm.SplashEdit[0]:=GetForm.edKrSt;
                           GetForm.SplashEdit[1]:=GetForm.edDbSt;

                           GetFormResult:=GetForm.ShowModal;

                           if (GetFormResult=mrNoToAll) then begin
                                                                  //Вернуться к предыдущему шагу работы мастера
                                                                  NextStep:= -1;
                                                        end;
                           if (GetFormResult=mrYes)     then begin
                                                                  //Был выбрана статья
                                                                  NextStep:= 1;

                                                                  //Сохраняем в структуру выбранные данные
                                                                  LOCAL_STRU^.KR_ID_STAT    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                  LOCAL_STRU^.KR_KOD_STAT   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                  LOCAL_STRU^.KR_TITLE_STAT :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                                  LOCAL_STRU^.DB_ID_STAT    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                  LOCAL_STRU^.DB_KOD_STAT   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                  LOCAL_STRU^.DB_TITLE_STAT :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                        end;
                           if (GetFormResult=mrCancel)  then begin
                                                                  //Завершить работу с мастером
                                                                  NextStep:= 0;
                                                        end;

                           GetForm.Free;
               end
               else NextStep:=1;
     end
     else begin
               if not checkStInfo(LOCAL_STRU,1,Database,Transaction)
               then begin
                           LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.DB_ID_RAZD;
                           LOCAL_STRU^.ID_OPER  :=LOCAL_STRU^.DB_ID_SMETA;

                           GetForm      :=TfrmGetData.Create(AOwner,3,LOCAL_STRU^,1);

                           //Определяем компоненты для подсветки
                           SetLength(GetForm.SplashEdit,1);
                           GetForm.SplashEdit[0]:=GetForm.edDbSt;

                           GetFormResult:=GetForm.ShowModal;

                           if (GetFormResult=mrNoToAll) then begin
                                                                  //Вернуться к предыдущему шагу работы мастера
                                                                  NextStep:= -1;
                                                        end;
                           if (GetFormResult=mrYes)     then begin
                                                                  //Был выбрана статья
                                                                  NextStep:= 1;

                                                                  //Сохраняем в структуру выбранные данные
                                                                  LOCAL_STRU^.DB_ID_STAT    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                  LOCAL_STRU^.DB_KOD_STAT   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                  LOCAL_STRU^.DB_TITLE_STAT :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                        end;
                           if (GetFormResult=mrCancel)  then begin
                                                                  //Завершить работу с мастером
                                                                  NextStep:= 0;
                                                        end;

                           GetForm.Free;
               end
               else NextStep:=1;

               if not checkStInfo(LOCAL_STRU,0,Database,Transaction)
               then begin
                           LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.KR_ID_RAZD;
                           LOCAL_STRU^.ID_OPER  :=LOCAL_STRU^.KR_ID_SMETA;

                           GetForm      :=TfrmGetData.Create(AOwner,3,LOCAL_STRU^,0);

                           //Определяем компоненты для подсветки
                           SetLength(GetForm.SplashEdit,1);
                           GetForm.SplashEdit[0]:=GetForm.edKrSt;

                           GetFormResult:=GetForm.ShowModal;

                           if (GetFormResult=mrNoToAll) then begin
                                                                  //Вернуться к предыдущему шагу работы мастера
                                                                  NextStep:= -1;
                                                        end;
                           if (GetFormResult=mrYes)     then begin
                                                                  //Был выбрана статья
                                                                  NextStep:= 1;

                                                                  //Сохраняем в структуру выбранные данные
                                                                  LOCAL_STRU^.KR_ID_STAT    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                  LOCAL_STRU^.KR_KOD_STAT   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                  LOCAL_STRU^.KR_TITLE_STAT :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                        end;
                           if (GetFormResult=mrCancel)  then begin
                                                                  //Завершить работу с мастером
                                                                  NextStep:= 0;
                                                        end;

                           GetForm.Free;
               end
               else NextStep:=1;
     end;
     Result:=NextStep;
end;


function Step11_6(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var  GetForm:TfrmGetData;
     GetFormResult:TModalResult;
     NextStep:Integer;
begin
     NextStep:=0;

     if (PrevStep<0)
     then  begin
                LOCAL_STRU^.DB_ID_KEKV:=-1;
                LOCAL_STRU^.KR_ID_KEKV:=-1;
     end;

     if LOCAL_STRU^.NOT_DIF_BDG_FG
     then begin
               if not checkKVInfo(LOCAL_STRU,-1,Database,Transaction)
               then begin
                         GetForm      :=TfrmGetData.Create(AOwner,6,LOCAL_STRU^,-1);

                         //Определяем компоненты для подсветки
                         SetLength(GetForm.SplashEdit,2);
                         GetForm.SplashEdit[0]:=GetForm.edKrKV;
                         GetForm.SplashEdit[1]:=GetForm.edDbKV;

                         GetFormResult:=GetForm.ShowModal;

                         if (GetFormResult=mrNoToAll) then begin
                                                                //Вернуться к предыдущему шагу работы мастера
                                                                NextStep:= -2;
                                                      end;
                         if (GetFormResult=mrYes)     then begin
                                                                //Был выбрана статья
                                                                NextStep:= 1;

                                                                //Сохраняем в структуру выбранные данные
                                                                LOCAL_STRU^.KR_ID_KEKV    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                LOCAL_STRU^.KR_KOD_KEKV   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                LOCAL_STRU^.KR_KEKV_TITLE :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                                LOCAL_STRU^.DB_ID_KEKV    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                LOCAL_STRU^.DB_KOD_KEKV   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                LOCAL_STRU^.DB_KEKV_TITLE :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                      end;
                         if (GetFormResult=mrCancel)  then begin
                                                                //Завершить работу с мастером
                                                                NextStep:= 0;
                                                      end;

                         GetForm.Free;
               end
               else NextStep:=1;
     end
     else begin
               if not checkKVInfo(LOCAL_STRU,1,Database,Transaction)
               then begin
                         GetForm      :=TfrmGetData.Create(AOwner,6,LOCAL_STRU^,1);

                         //Определяем компоненты для подсветки
                         SetLength(GetForm.SplashEdit,1);
                         GetForm.SplashEdit[0]:=GetForm.edDbKV;

                         GetFormResult:=GetForm.ShowModal;

                         if (GetFormResult=mrNoToAll) then begin
                                                                //Вернуться к предыдущему шагу работы мастера
                                                                NextStep:= -1;
                                                      end;
                         if (GetFormResult=mrYes)     then begin
                                                                //Был выбрана статья
                                                                NextStep:= 1;

                                                                //Сохраняем в структуру выбранные данные
                                                                LOCAL_STRU^.DB_ID_KEKV    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                LOCAL_STRU^.DB_KOD_KEKV   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                LOCAL_STRU^.DB_KEKV_TITLE :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                      end;
                         if (GetFormResult=mrCancel)  then begin
                                                                //Завершить работу с мастером
                                                                NextStep:= 0;
                                                      end;

                         GetForm.Free;
               end
               else NextStep:=1;


               if not checkKVInfo(LOCAL_STRU,0,Database,Transaction)
               then begin
                         GetForm      :=TfrmGetData.Create(AOwner,6,LOCAL_STRU^,0);

                         //Определяем компоненты для подсветки
                         SetLength(GetForm.SplashEdit,1);
                         GetForm.SplashEdit[0]:=GetForm.edDbKV;

                         GetFormResult:=GetForm.ShowModal;

                         if (GetFormResult=mrNoToAll) then begin
                                                                //Вернуться к предыдущему шагу работы мастера
                                                                NextStep:= -1;
                                                      end;
                         if (GetFormResult=mrYes)     then begin
                                                                //Был выбрана статья
                                                                NextStep:= 1;

                                                                //Сохраняем в структуру выбранные данные
                                                                LOCAL_STRU^.KR_ID_KEKV    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                LOCAL_STRU^.KR_KOD_KEKV   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                LOCAL_STRU^.KR_KEKV_TITLE :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                      end;
                         if (GetFormResult=mrCancel)  then begin
                                                                //Завершить работу с мастером
                                                                NextStep:= 0;
                                                      end;

                         GetForm.Free;
               end
               else NextStep:=1;
     end;

     Result:=NextStep;
end;


//*********************************************************************************************
//*********************************************************************************************
//*********************************************************************************************



//*********************************************************************************************
//***********************Реализация шагов для режимов 21,22************************************
//*********************************************************************************************
function Step21_22_1(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var GetForm:TfrmGetData;
    GetFormResult:TModalResult;
    NextStep:Integer;
begin
     //Процедура выбора рабочего счета для операции по форме или регистру учета
     NextStep     :=0;

     if (LOCAL_STRU^.ID_FORM_UCH<>1)
     then GetForm      :=TfrmGetData.Create(AOwner,4,LOCAL_STRU^,0)
     else GetForm      :=TfrmGetData.Create(AOwner,4,LOCAL_STRU^,0);

     //Определяем компоненты для подсветки
     if (LOCAL_STRU^.CR_BY_DT=1)
     then begin
               SetLength(GetForm.SplashEdit,2);
               GetForm.SplashEdit[0]:=GetForm.edDBSchNum;
               GetForm.SplashEdit[1]:=GetForm.edDBSchTitle;
     end
     else begin
               SetLength(GetForm.SplashEdit,2);
               GetForm.SplashEdit[0]:=GetForm.edKrSchNum;
               GetForm.SplashEdit[1]:=GetForm.edKrSchTitle;
     end;

     GetFormResult:=GetForm.ShowModal;

     if (GetFormResult=mrNoToAll) then begin
                                            //Завершить работу с мастером
                                            NextStep:= 0;
                                  end;
     if (GetFormResult=mrYes)     then begin
                                            //Был выбран счет
                                            NextStep:= 1;

                                            //Сохраняем в структуру выбранные данные
                                            if (LOCAL_STRU^.CR_BY_DT=1)
                                            then begin //Сохраняем информацию в дебетовый счет
                                                       LOCAL_STRU^.DB_ID_SCH    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                       LOCAL_STRU^.DB_ID_SCH_KOD:=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString;
                                                       LOCAL_STRU^.DB_ID_SCH_TIT:=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;
                                            end
                                            else begin //Сохраняем информацию в кредитовый счет
                                                       LOCAL_STRU^.KR_ID_SCH    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                       LOCAL_STRU^.KR_ID_SCH_KOD:=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString;
                                                       LOCAL_STRU^.KR_ID_SCH_TIT:=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;
                                            end;

                                  end;
     if (GetFormResult=mrCancel)  then begin
                                            //Завершить работу с мастером
                                            NextStep:= 0;
                                  end;

     GetForm.Free;

     Result:=NextStep;
end;


function Step21_22_2(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var GetForm:TfrmGetData;
    GetFormResult:TModalResult;
    NextStep:Integer;
begin
     //Процедура выбора корреспондирующего счета по выбранному рабочему
     NextStep     :=0;

     if (LOCAL_STRU^.CR_BY_DT=1)
     then LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.DB_ID_SCH
     else LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.KR_ID_SCH;

     GetForm      :=TfrmGetData.Create(AOwner,5,LOCAL_STRU^,0);

     //Определяем компоненты для подсветки
     if (LOCAL_STRU^.CR_BY_DT=1)
     then begin
               SetLength(GetForm.SplashEdit,2);
               GetForm.SplashEdit[0]:=GetForm.edKRSchNum;
               GetForm.SplashEdit[1]:=GetForm.edKRSchTitle;
     end
     else begin
               SetLength(GetForm.SplashEdit,2);
               GetForm.SplashEdit[0]:=GetForm.edDBSchNum;
               GetForm.SplashEdit[1]:=GetForm.edDBSchTitle;
     end;

     GetFormResult:=GetForm.ShowModal;

     if (GetFormResult=mrNoToAll) then begin
                                            //Вернуться к предыдущему шагу работы мастера
                                            NextStep:= -1;
                                  end;
     if (GetFormResult=mrYes)     then begin
                                            //Был выбран счет
                                            NextStep:= 1;

                                            //Сохраняем в структуру выбранные данные
                                            if (LOCAL_STRU^.CR_BY_DT=1)
                                            then begin //Сохраняем информацию в дебетовый счет
                                                       LOCAL_STRU^.KR_ID_SCH    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                       LOCAL_STRU^.KR_ID_SCH_KOD:=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString;
                                                       LOCAL_STRU^.KR_ID_SCH_TIT:=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;
                                            end
                                            else begin //Сохраняем информацию в кредитовый счет
                                                       LOCAL_STRU^.DB_ID_SCH    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                       LOCAL_STRU^.DB_ID_SCH_KOD:=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString;
                                                       LOCAL_STRU^.DB_ID_SCH_TIT:=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;
                                            end;
                                  end;
     if (GetFormResult=mrCancel)  then begin
                                            //Завершить работу с мастером
                                            NextStep:= 0;
                                  end;

     GetForm.Free;

     Result:=NextStep;
end;

function Step21_22_3(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var GetForm:TfrmGetData;
    GetFormResult:TModalResult;
    NextStep:Integer;
    DB_IS_FOND,KR_IS_FOND:Boolean;
begin
     //Процедура выбора бюджетов
     NextStep     :=0;

     //Поднимаем информацию о том, являются ли счета фондами
     DB_IS_FOND:=IsFond(LOCAL_STRU^.DB_ID_SCH,LOCAL_STRU^.ACTUAL_DATE,Database,Transaction);
     KR_IS_FOND:=IsFond(LOCAL_STRU^.KR_ID_SCH,LOCAL_STRU^.ACTUAL_DATE,Database,Transaction);

     If (DB_IS_FOND and KR_IS_FOND)
     then begin
               if LOCAL_STRU^.NOT_DIF_BDG_FG then LOCAL_STRU^.NOT_DIF_BDG_FG:=false;
     end;
     If DB_IS_FOND and not KR_IS_FOND     then LOCAL_STRU^.ID_SCH_IN     :=LOCAL_STRU^.DB_ID_SCH;
     If not DB_IS_FOND and KR_IS_FOND     then LOCAL_STRU^.ID_SCH_IN     :=LOCAL_STRU^.KR_ID_SCH;
     If not DB_IS_FOND and not KR_IS_FOND then LOCAL_STRU^.ID_SCH_IN     :=LOCAL_STRU^.DB_ID_SCH;


     If (LOCAL_STRU^.NOT_DIF_BDG_FG)
     then begin  //Бюджеты в дебете и кредите одинаковы

                 GetForm      :=TfrmGetData.Create(AOwner,1,LOCAL_STRU^,-1);

                 //Определяем компоненты для подсветки
                 SetLength(GetForm.SplashEdit,2);
                 GetForm.SplashEdit[0]:=GetForm.edKrSm;
                 GetForm.SplashEdit[1]:=GetForm.edDbSm;

                 GetFormResult:=GetForm.ShowModal;

                 if (GetFormResult=mrNoToAll) then begin
                                                        //Вернуться к предыдущему шагу работы мастера
                                                        NextStep:= -1;
                                              end;
                 if (GetFormResult=mrYes)     then begin
                                                        //Был выбран счет
                                                        NextStep:= 1;

                                                        //Сохраняем в структуру выбранные данные
                                                        LOCAL_STRU^.KR_ID_SMETA    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_SMETA').AsString);
                                                        LOCAL_STRU^.KR_KOD_SMETA   :=GetForm.ObjectsDataSet.FieldByName('SMETA_KOD').Value;
                                                        LOCAL_STRU^.KR_TITLE_SMETA :=GetForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString;

                                                        LOCAL_STRU^.DB_ID_SMETA    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_SMETA').AsString);
                                                        LOCAL_STRU^.DB_KOD_SMETA   :=GetForm.ObjectsDataSet.FieldByName('SMETA_KOD').Value;
                                                        LOCAL_STRU^.DB_TITLE_SMETA :=GetForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString;

                                              end;
                 if (GetFormResult=mrCancel)  then begin
                                                        //Завершить работу с мастером
                                                        NextStep:= 0;
                                              end;

                 GetForm.Free;
     end
     else begin  //Бюджеты в дебете и кредите различаются

                 //Выбираем бюджет для дебета

                 //Определяем является дебетовый счет фондом
                 LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.DB_ID_SCH;

                 GetForm      :=TfrmGetData.Create(AOwner,1,LOCAL_STRU^,1);

                 //Определяем компоненты для подсветки
                 SetLength(GetForm.SplashEdit,1);

                 GetForm.SplashEdit[0]:=GetForm.edDbSm;

                 GetFormResult:=GetForm.ShowModal;

                 if (GetFormResult=mrNoToAll) then begin
                                                        //Вернуться к предыдущему шагу работы мастера
                                                        NextStep:= -1;
                                              end;
                 if (GetFormResult=mrYes)     then begin
                                                        //Был выбран счет
                                                        NextStep:= 1;

                                                        //Сохраняем в структуру выбранные данные
                                                        LOCAL_STRU^.DB_ID_SMETA    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_SMETA').AsString);
                                                        LOCAL_STRU^.DB_KOD_SMETA   :=GetForm.ObjectsDataSet.FieldByName('SMETA_KOD').Value;
                                                        LOCAL_STRU^.DB_TITLE_SMETA :=GetForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString;

                                              end;
                 if (GetFormResult=mrCancel)  then begin
                                                        //Завершить работу с мастером
                                                        NextStep:= 0;
                                              end;

                 GetForm.Free;

                 //Выбираем бюджет для кредита
                 if (NextStep=1)
                 then begin
                           //Определяем является кредитовый счет фондом
                           LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.KR_ID_SCH;

                           GetForm      :=TfrmGetData.Create(AOwner,1,LOCAL_STRU^,0);

                           //Определяем компоненты для подсветки
                           SetLength(GetForm.SplashEdit,1);
                           GetForm.SplashEdit[0]:=GetForm.edKrSm;

                           GetFormResult:=GetForm.ShowModal;

                           if (GetFormResult=mrNoToAll) then begin
                                                                  //Вернуться к предыдущему шагу работы мастера
                                                                  NextStep:= -1;
                                                        end;
                           if (GetFormResult=mrYes)     then begin
                                                                  //Был выбран счет
                                                                  NextStep:= 1;

                                                                  //Сохраняем в структуру выбранные данные
                                                                  LOCAL_STRU^.KR_ID_SMETA    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_SMETA').AsString);
                                                                  LOCAL_STRU^.KR_KOD_SMETA   :=GetForm.ObjectsDataSet.FieldByName('SMETA_KOD').Value;
                                                                  LOCAL_STRU^.KR_TITLE_SMETA :=GetForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString;

                                                        end;
                           if (GetFormResult=mrCancel)  then begin
                                                                  //Завершить работу с мастером
                                                                  NextStep:= 0;
                                                        end;

                           GetForm.Free;
                 end;

     end;

     Result:=NextStep;
end;

function Step21_22_4(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var GetForm:TfrmGetData;
    GetFormResult:TModalResult;
    NextStep:Integer;
begin
     //Процедура выбора разделов
     NextStep     :=0;

     If (LOCAL_STRU^.NOT_DIF_BDG_FG)
     then begin  //Бюджеты в дебете и кредите одинаковы

                 LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.DB_ID_SMETA;

                 GetForm      :=TfrmGetData.Create(AOwner,2,LOCAL_STRU^,-1);

                 //Определяем компоненты для подсветки
                 SetLength(GetForm.SplashEdit,2);
                 GetForm.SplashEdit[0]:=GetForm.edKrRz;
                 GetForm.SplashEdit[1]:=GetForm.edDbRz;

                 GetFormResult:=GetForm.ShowModal;

                 if (GetFormResult=mrNoToAll) then begin
                                                        //Вернуться к предыдущему шагу работы мастера
                                                        NextStep:= -1;
                                              end;
                 if (GetFormResult=mrYes)     then begin
                                                        //Был выбран счет
                                                        NextStep:= 1;

                                                        //Сохраняем в структуру выбранные данные
                                                        LOCAL_STRU^.KR_ID_RAZD    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                        LOCAL_STRU^.KR_KOD_RAZD   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                        LOCAL_STRU^.KR_TITLE_RAZD :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                        LOCAL_STRU^.DB_ID_RAZD    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                        LOCAL_STRU^.DB_KOD_RAZD   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                        LOCAL_STRU^.DB_TITLE_RAZD :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                              end;
                 if (GetFormResult=mrCancel)  then begin
                                                        //Завершить работу с мастером
                                                        NextStep:= 0;
                                              end;

                 GetForm.Free;
     end
     else begin  //Бюджеты в дебете и кредите различаются

                 //Выбираем бюджет для дебета

                 LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.DB_ID_SMETA;

                 GetForm      :=TfrmGetData.Create(AOwner,2,LOCAL_STRU^,1);

                 //Определяем компоненты для подсветки
                 SetLength(GetForm.SplashEdit,1);

                 GetForm.SplashEdit[0]:=GetForm.edDbRz;

                 GetFormResult:=GetForm.ShowModal;

                 if (GetFormResult=mrNoToAll) then begin
                                                        //Вернуться к предыдущему шагу работы мастера
                                                        NextStep:= -1;
                                              end;
                 if (GetFormResult=mrYes)     then begin
                                                        //Был выбран счет
                                                        NextStep:= 1;

                                                        //Сохраняем в структуру выбранные данные
                                                        LOCAL_STRU^.DB_ID_RAZD    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                        LOCAL_STRU^.DB_KOD_RAZD   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                        LOCAL_STRU^.DB_TITLE_RAZD :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                              end;
                 if (GetFormResult=mrCancel)  then begin
                                                        //Завершить работу с мастером
                                                        NextStep:= 0;
                                              end;

                 GetForm.Free;

                 //Выбираем бюджет для кредита
                 if (NextStep=1)
                 then begin
                           LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.KR_ID_SMETA;

                           GetForm      :=TfrmGetData.Create(AOwner,2,LOCAL_STRU^,0);

                           //Определяем компоненты для подсветки
                           SetLength(GetForm.SplashEdit,1);
                           GetForm.SplashEdit[0]:=GetForm.edKrRz;

                           GetFormResult:=GetForm.ShowModal;

                           if (GetFormResult=mrNoToAll) then begin
                                                                  //Вернуться к предыдущему шагу работы мастера
                                                                  NextStep:= -1;
                                                        end;
                           if (GetFormResult=mrYes)     then begin
                                                                  //Был выбран счет
                                                                  NextStep:= 1;

                                                                  //Сохраняем в структуру выбранные данные
                                                                  LOCAL_STRU^.KR_ID_RAZD    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                  LOCAL_STRU^.KR_KOD_RAZD   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                  LOCAL_STRU^.KR_TITLE_RAZD :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                        end;
                           if (GetFormResult=mrCancel)  then begin
                                                                  //Завершить работу с мастером
                                                                  NextStep:= 0;
                                                        end;

                           GetForm.Free;
                 end;

     end;

     Result:=NextStep;
end;

function Step21_22_5(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var GetForm:TfrmGetData;
    GetFormResult:TModalResult;
    NextStep:Integer;
begin
     //Процедура выбора статей
     NextStep     :=0;

     If (LOCAL_STRU^.NOT_DIF_BDG_FG)
     then begin  //Бюджеты в дебете и кредите одинаковы

                 LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.DB_ID_RAZD;
                 LOCAL_STRU^.ID_OPER  :=LOCAL_STRU^.DB_ID_SMETA;

                 GetForm      :=TfrmGetData.Create(AOwner,3,LOCAL_STRU^,-1);

                 //Определяем компоненты для подсветки
                 SetLength(GetForm.SplashEdit,2);
                 GetForm.SplashEdit[0]:=GetForm.edKrSt;
                 GetForm.SplashEdit[1]:=GetForm.edDbSt;

                 GetFormResult:=GetForm.ShowModal;

                 if (GetFormResult=mrNoToAll) then begin
                                                        //Вернуться к предыдущему шагу работы мастера
                                                        NextStep:= -1;
                                              end;
                 if (GetFormResult=mrYes)     then begin
                                                        //Был выбрана статья
                                                        NextStep:= 1;

                                                        //Сохраняем в структуру выбранные данные
                                                        LOCAL_STRU^.KR_ID_STAT    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                        LOCAL_STRU^.KR_KOD_STAT   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                        LOCAL_STRU^.KR_TITLE_STAT :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                        LOCAL_STRU^.DB_ID_STAT    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                        LOCAL_STRU^.DB_KOD_STAT   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                        LOCAL_STRU^.DB_TITLE_STAT :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                              end;
                 if (GetFormResult=mrCancel)  then begin
                                                        //Завершить работу с мастером
                                                        NextStep:= 0;
                                              end;

                 GetForm.Free;
     end
     else begin  //Бюджеты в дебете и кредите различаются

                 //Выбираем статью для дебета

                 LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.DB_ID_RAZD;
                 LOCAL_STRU^.ID_OPER  :=LOCAL_STRU^.DB_ID_SMETA;

                 GetForm      :=TfrmGetData.Create(AOwner,3,LOCAL_STRU^,1);

                 //Определяем компоненты для подсветки
                 SetLength(GetForm.SplashEdit,1);

                 GetForm.SplashEdit[0]:=GetForm.edDbSt;

                 GetFormResult:=GetForm.ShowModal;

                 if (GetFormResult=mrNoToAll) then begin
                                                        //Вернуться к предыдущему шагу работы мастера
                                                        NextStep:= -1;
                                              end;
                 if (GetFormResult=mrYes)     then begin
                                                        //Был выбран счет
                                                        NextStep:= 1;

                                                        //Сохраняем в структуру выбранные данные
                                                        LOCAL_STRU^.DB_ID_STAT    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                        LOCAL_STRU^.DB_KOD_STAT   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                        LOCAL_STRU^.DB_TITLE_STAT :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                              end;
                 if (GetFormResult=mrCancel)  then begin
                                                        //Завершить работу с мастером
                                                        NextStep:= 0;
                                              end;

                 GetForm.Free;

                 //Выбираем статья для кредита
                 if (NextStep=1)
                 then begin
                           LOCAL_STRU^.ID_SCH_IN:=LOCAL_STRU^.KR_ID_RAZD;
                           LOCAL_STRU^.ID_OPER  :=LOCAL_STRU^.KR_ID_SMETA;

                           GetForm      :=TfrmGetData.Create(AOwner,3,LOCAL_STRU^,0);

                           //Определяем компоненты для подсветки
                           SetLength(GetForm.SplashEdit,1);
                           GetForm.SplashEdit[0]:=GetForm.edKrSt;

                           GetFormResult:=GetForm.ShowModal;

                           if (GetFormResult=mrNoToAll) then begin
                                                                  //Вернуться к предыдущему шагу работы мастера
                                                                  NextStep:= -1;
                                                        end;
                           if (GetFormResult=mrYes)     then begin
                                                                  //Был выбрана статья
                                                                  NextStep:= 1;

                                                                  //Сохраняем в структуру выбранные данные
                                                                  LOCAL_STRU^.KR_ID_STAT    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                  LOCAL_STRU^.KR_KOD_STAT   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                  LOCAL_STRU^.KR_TITLE_STAT :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                        end;
                           if (GetFormResult=mrCancel)  then begin
                                                                  //Завершить работу с мастером
                                                                  NextStep:= 0;
                                                        end;

                           GetForm.Free;
                 end;

     end;

     Result:=NextStep;
end;

function Step21_22_6(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var GetForm:TfrmGetData;
    GetFormResult:TModalResult;
    NextStep:Integer;
begin
     //Процедура выбора статей
     NextStep     :=0;

     If (LOCAL_STRU^.NOT_DIF_BDG_FG)
     then begin  //Бюджеты в дебете и кредите одинаковы

                 GetForm      :=TfrmGetData.Create(AOwner,6,LOCAL_STRU^,-1);

                 //Определяем компоненты для подсветки
                 SetLength(GetForm.SplashEdit,2);
                 GetForm.SplashEdit[0]:=GetForm.edKrKV;
                 GetForm.SplashEdit[1]:=GetForm.edDbKV;

                 GetFormResult:=GetForm.ShowModal;

                 if (GetFormResult=mrNoToAll) then begin
                                                        //Вернуться к предыдущему шагу работы мастера
                                                        NextStep:= -1;
                                              end;
                 if (GetFormResult=mrYes)     then begin
                                                        //Был выбрана статья
                                                        NextStep:= 1;

                                                        //Сохраняем в структуру выбранные данные
                                                        LOCAL_STRU^.KR_ID_KEKV    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                        LOCAL_STRU^.KR_KOD_KEKV   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                        LOCAL_STRU^.KR_KEKV_TITLE :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                        LOCAL_STRU^.DB_ID_KEKV    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                        LOCAL_STRU^.DB_KOD_KEKV   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                        LOCAL_STRU^.DB_KEKV_TITLE :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                              end;
                 if (GetFormResult=mrCancel)  then begin
                                                        //Завершить работу с мастером
                                                        NextStep:= 0;
                                              end;

                 GetForm.Free;
     end
     else begin  //Бюджеты в дебете и кредите различаются

                 //Выбираем статью для дебета

                 GetForm      :=TfrmGetData.Create(AOwner,6,LOCAL_STRU^,1);

                 //Определяем компоненты для подсветки
                 SetLength(GetForm.SplashEdit,1);

                 GetForm.SplashEdit[0]:=GetForm.edDbKV;

                 GetFormResult:=GetForm.ShowModal;

                 if (GetFormResult=mrNoToAll) then begin
                                                        //Вернуться к предыдущему шагу работы мастера
                                                        NextStep:= -1;
                                              end;
                 if (GetFormResult=mrYes)     then begin
                                                        //Был выбран счет
                                                        NextStep:= 1;

                                                        //Сохраняем в структуру выбранные данные
                                                        LOCAL_STRU^.DB_ID_KEKV    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                        LOCAL_STRU^.DB_KOD_KEKV   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                        LOCAL_STRU^.DB_KEKV_TITLE :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                              end;
                 if (GetFormResult=mrCancel)  then begin
                                                        //Завершить работу с мастером
                                                        NextStep:= 0;
                                              end;

                 GetForm.Free;

                 //Выбираем статья для кредита
                 if (NextStep=1)
                 then begin
                           GetForm      :=TfrmGetData.Create(AOwner,6,LOCAL_STRU^,0);

                           //Определяем компоненты для подсветки
                           SetLength(GetForm.SplashEdit,1);
                           GetForm.SplashEdit[0]:=GetForm.edKrKV;

                           GetFormResult:=GetForm.ShowModal;

                           if (GetFormResult=mrNoToAll) then begin
                                                                  //Вернуться к предыдущему шагу работы мастера
                                                                  NextStep:= -1;
                                                        end;
                           if (GetFormResult=mrYes)     then begin
                                                                  //Был выбрана статья
                                                                  NextStep:= 1;

                                                                  //Сохраняем в структуру выбранные данные
                                                                  LOCAL_STRU^.KR_ID_KEKV    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_OBJECT').AsString);
                                                                  LOCAL_STRU^.KR_KOD_KEKV   :=GetForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                                                                  LOCAL_STRU^.KR_KEKV_TITLE :=GetForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;

                                                        end;
                           if (GetFormResult=mrCancel)  then begin
                                                                  //Завершить работу с мастером
                                                                  NextStep:= 0;
                                                        end;

                           GetForm.Free;
                 end;

     end;

     Result:=NextStep;
end;
//*********************************************************************************************
//*********************************************************************************************
//*********************************************************************************************



//*********************************************************************************************
//***********************Реализация шагов для режимов 3****************************************
//*********************************************************************************************

function Step3_1(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
begin
     result:=1;
end;

function Step3_2(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
begin
     result:=1;
end;

function Step3_3(AOwner:TComponent;LOCAL_STRU  : PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
begin
     result:=1;
end;

//*********************************************************************************************
//***********************Реализация межрежимных шагов******************************************
//*********************************************************************************************
function StepGetFacedInfo(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var  OperInfoDS:TpFibDataSet;
     NextStep:Integer;
     GetForm:TfrmGetData;
     GetFormResult:TModalResult;
begin
     NextStep:=0;

     OperInfoDS:=TpFibDataSet.Create(nil);
     OperInfoDS.Database:=Database;
     OperInfoDS.Transaction:=Transaction;
     OperInfoDS.SelectSQL.Text:=' SELECT * FROM PUB_SP_MAIN_OPER '+
                                '  WHERE OPER_DB_ID_SCH='+IntToStr(LOCAL_STRU^.DB_ID_SCH)+
                                '    AND OPER_KR_ID_SCH='+IntToStr(LOCAL_STRU^.KR_ID_SCH)+
                                '    AND DATE_BEG<='+''''+DateToStr(LOCAL_STRU^.ACTUAL_DATE)+''''+
                                '    AND DATE_END>='+''''+DateToStr(LOCAL_STRU^.ACTUAL_DATE)+'''';

     OperInfoDS.Open;
     OperInfoDS.FetchAll;
     if (OperInfoDS.RecordCount>0)
     then begin
               LOCAL_STRU^.ID_OPER:=StrToInt64(OperInfoDS.FieldByName('ID_OPER').AsString);

               If (OperInfoDS.FieldByName('OPER_DB_CR_DOC').AsInteger=1)
               and(OperInfoDS.FieldByName('OPER_KR_CR_DOC').AsInteger=1) //проводка для встречного документа
               then begin
                         {if   ((LOCAL_STRU^.CR_BY_DT=1) and (OperInfoDS.FieldByName('OPER_KR_CR_PROV').AsInteger=1))
                         or   ((LOCAL_STRU^.CR_BY_DT=0) and (OperInfoDS.FieldByName('OPER_DB_CR_PROV').AsInteger=1))
                         then begin}
                                   //Устанавливаем правильно флаг CR_BY_DT
                                   If (OperInfoDS.FieldByName('OPER_DB_CR_PROV').AsInteger=1) then LOCAL_STRU^.CR_BY_DT:=0;
                                   If (OperInfoDS.FieldByName('OPER_KR_CR_PROV').AsInteger=1) then LOCAL_STRU^.CR_BY_DT:=1;

                                   //Выбираем встречную проводку
                                   GetForm      :=TfrmGetData.Create(AOwner,8,LOCAL_STRU^,0);

                                   GetFormResult:=GetForm.ShowModal;

                                   if (GetFormResult=mrNoToAll) then begin
                                                                          //Вернуться к предыдущему шагу работы мастера
                                                                          NextStep:= -1;
                                                                end;
                                   if (GetFormResult=mrYes)     then begin
                                                                           //Был выбрана проводка
                                                                           NextStep:= -1000;

                                                                           //Перетягиваем из встречной проводки смету, раздел, статью, код затрат

                                                                           LOCAL_STRU^.DB_ID_SMETA:=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_SM').AsString);
                                                                           LOCAL_STRU^.KR_ID_SMETA:=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_SM').AsString);

                                                                           LOCAL_STRU^.DB_ID_RAZD:=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_RZ').AsString);
                                                                           LOCAL_STRU^.KR_ID_RAZD:=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_RZ').AsString);

                                                                           LOCAL_STRU^.DB_ID_STAT:=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_ST').AsString);
                                                                           LOCAL_STRU^.KR_ID_STAT:=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_ST').AsString);

                                                                           LOCAL_STRU^.DB_ID_KEKV:=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_KV').AsString);
                                                                           LOCAL_STRU^.KR_ID_KEKV:=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_KV').AsString);


                                                                           checkKvInfo(LOCAL_STRU,1,Database,Transaction);
                                                                           checkKvInfo(LOCAL_STRU,0,Database,Transaction);

                                                                           checkSmInfo(LOCAL_STRU,1,Database,Transaction);
                                                                           checkSmInfo(LOCAL_STRU,0,Database,Transaction);

                                                                           checkRzInfo(LOCAL_STRU,1,Database,Transaction);
                                                                           checkRzInfo(LOCAL_STRU,0,Database,Transaction);

                                                                           checkStInfo(LOCAL_STRU,1,Database,Transaction);
                                                                           checkStInfo(LOCAL_STRU,0,Database,Transaction);

                                                                           LOCAL_STRU^.FACED_FLAG       :=true;
                                                                           LOCAL_STRU^.FACED_ID_DOC     :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_DOC').AsString);
                                                                           LOCAL_STRU^.FACED_ID_PROV    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_PROV').AsString);

                                                                           LOCAL_STRU^.FACED_CR_BY_DT   :=GetForm.ObjectsDataSet.FieldByName('CR_BY_DT').AsInteger;
                                                                           LOCAL_STRU^.FACED_PROV_SUMMA :=GetForm.ObjectsDataSet.FieldByName('SUMMA_PROV').Value;


                                                                           if GetForm.ObjectsDataSet.FieldByName('DB_ID_DOG').Value<>NULL
                                                                           then LOCAL_STRU^.FACED_ID_DOG     :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('DB_ID_DOG').AsString)
                                                                           else LOCAL_STRU^.FACED_ID_DOG     :=0;

                                                                           if GetForm.ObjectsDataSet.FieldByName('DB_KOD_DOG').Value<>NULL
                                                                           then LOCAL_STRU^.FACED_KOD_DOG    :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('DB_KOD_DOG').AsString)
                                                                           else LOCAL_STRU^.FACED_KOD_DOG    :=0;

                                                                           if GetForm.ObjectsDataSet.FieldByName('ID_MEN').Value<>NULL
                                                                           then LOCAL_STRU^.FACED_ID_MAN     :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_MEN').AsString)
                                                                           else LOCAL_STRU^.FACED_ID_MAN     :=0;

                                                                           if GetForm.ObjectsDataSet.FieldByName('ID_PAYER').Value<>NULL
                                                                           then LOCAL_STRU^.FACED_ID_PAYER   :=StrToInt64(GetForm.ObjectsDataSet.FieldByName('ID_PAYER').AsString)
                                                                           else LOCAL_STRU^.FACED_ID_PAYER   :=0;
                                                                end;
                                   if (GetFormResult=mrCancel)  then begin
                                                                          //Завершить работу с мастером
                                                                          NextStep:= 0;
                                                                end;

                                   GetForm.Free;
                         {end
                         else begin
                                   NextStep:=1;
                                   LOCAL_STRU^.FACED_FLAG:=false;
                         end;}
               end
               else begin
                         NextStep:=1;
                         LOCAL_STRU^.FACED_FLAG:=false;
               end;
     end;
     OperInfoDS.Close;
     OperInfoDS.Free;


     Result:=NextStep;
end;

function StepCheckDefSmInfo(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var CheckDefSmInfoSP:TpFibDataSet;
    NextStep:Integer;
begin
     Screen.Cursor:=crSQLWait;
     NextStep:=1;
     CheckDefSmInfoSP:=TpFibDataSet.Create(nil);
     CheckDefSmInfoSP.Database:=Database;
     CheckDefSmInfoSP.Transaction:=Transaction;
     CheckDefSmInfoSP.SelectSQL.Text:=' SELECT * FROM MBOOK_INI_DATA ';
     CheckDefSmInfoSP.Open;
     CheckDefSmInfoSP.FetchAll;
     if (CheckDefSmInfoSP.RecordCount>0)
     then begin
               if (CheckDefSmInfoSP.FieldByName('USE_DEFAULT_VALUES').AsInteger=1)
               then begin
                         NextStep:=4;

                         LOCAL_STRU^.DB_ID_SMETA:=StrToInt64(CheckDefSmInfoSP.FieldByName('DEFAULT_SMETA').AsString);
                         LOCAL_STRU^.KR_ID_SMETA:=StrToInt64(CheckDefSmInfoSP.FieldByName('DEFAULT_SMETA').AsString);

                         LOCAL_STRU^.DB_ID_RAZD:=StrToInt64(CheckDefSmInfoSP.FieldByName('DEFAULT_RAZD').AsString);
                         LOCAL_STRU^.KR_ID_RAZD:=StrToInt64(CheckDefSmInfoSP.FieldByName('DEFAULT_RAZD').AsString);

                         LOCAL_STRU^.DB_ID_STAT:=StrToInt64(CheckDefSmInfoSP.FieldByName('DEFAULT_ST').AsString);
                         LOCAL_STRU^.KR_ID_STAT:=StrToInt64(CheckDefSmInfoSP.FieldByName('DEFAULT_ST').AsString);

                         checkSmInfo(LOCAL_STRU,1,Database,Transaction);
                         checkSmInfo(LOCAL_STRU,0,Database,Transaction);

                         checkRzInfo(LOCAL_STRU,1,Database,Transaction);
                         checkRzInfo(LOCAL_STRU,0,Database,Transaction);

                         checkStInfo(LOCAL_STRU,1,Database,Transaction);
                         checkStInfo(LOCAL_STRU,0,Database,Transaction);
               end
               else NextStep:=1;
     end;
     CheckDefSmInfoSP.Close;
     CheckDefSmInfoSP.Free;

     Screen.Cursor:=crDefault;
     Result:=NextStep;
end;

function StepCheckDefKvInfo(AOwner:TComponent;LOCAL_STRU:PWIZARD_GET_PROV_INFO;Database:TpFibDatabase;Transaction:TpFibTransaction;PrevStep:Integer):Integer;
var CheckDefSmInfoSP:TpFibDataSet;
    NextStep:Integer;
begin
     Screen.Cursor:=crSQLWait;
     NextStep:=1;
     CheckDefSmInfoSP:=TpFibDataSet.Create(nil);
     CheckDefSmInfoSP.Database:=Database;
     CheckDefSmInfoSP.Transaction:=Transaction;
     CheckDefSmInfoSP.SelectSQL.Text:=' SELECT * FROM MBOOK_INI_DATA ';
     CheckDefSmInfoSP.Open;
     CheckDefSmInfoSP.FetchAll;
     if (CheckDefSmInfoSP.RecordCount>0)
     then begin
               if (CheckDefSmInfoSP.FieldByName('USE_DEFAULT_KEKV').AsInteger=1)
               then begin
                         NextStep:=-1000;

                         LOCAL_STRU^.DB_ID_KEKV:=StrToInt64(CheckDefSmInfoSP.FieldByName('DEFAULT_KEKV').AsString);
                         LOCAL_STRU^.KR_ID_KEKV:=StrToInt64(CheckDefSmInfoSP.FieldByName('DEFAULT_KEKV').AsString);
                         checkKvInfo(LOCAL_STRU,-1,Database,Transaction);
               end
               else NextStep:=1;
     end;
     CheckDefSmInfoSP.Close;
     CheckDefSmInfoSP.Free;

     Screen.Cursor:=crDefault;
     Result:=NextStep;
end;


//*********************************************************************************************
//*********************************************************************************************
//*********************************************************************************************

//*********************************************************************************************
//************************UTILS****************************************************************
//*********************************************************************************************

function IsFond(ID_SCH:Int64;ActualDate:TDateTime;Database:TpFibDatabase;Transaction:TpFibTransaction):Boolean;
  var ReCnt:Boolean;
      IsFondSP:TpFibStoredProc;
begin
      Screen.Cursor:=crSQLWait;
      IsFondSP:=TpFibStoredProc.Create(nil);
      IsFondSP.Database:=Database;
      IsFondSP.Transaction:=Transaction;
      IsFondSP.StoredProcName:='KERNEL_SCH_IS_FOND';
      IsFondSP.Prepare;
      IsFondSP.ParamByName('ID_SCH').AsInt64:=ID_SCH;
      IsFondSP.ParamByName('ACTUAL_DATE').Value:=ActualDate;
      IsFondSP.ExecProc;
      if (IsFondSP.ParamByName('RESULT').asInteger=1)
      then ReCnt:=true
      else ReCnt:=false;
      IsFondSP.Free;
      Screen.Cursor:=crDefault;
      Result:=ReCnt;
end;

function GetSmPlan(ID_SM:Int64;ActualDate:TDateTime;Database:TpFibDatabase;Transaction:TpFibTransaction):Int64;
var   PlanInfoQuery:TpFibDataSet;
      ResPlan:Int64;
begin
      Screen.Cursor:=crSQLWait;
      ResPlan:=0;
      PlanInfoQuery:=TpFibDataSet.Create(nil);
      PlanInfoQuery.Database:=Database;
      PlanInfoQuery.Transaction:=Transaction;
      PlanInfoQuery.SelectSQL.Text:=' SELECT *                               '+
                                    '   FROM BU_SMET_PLUS_PERIODS            '+
                                    '  WHERE  ID_SMETA='+IntToStr(ID_SM)+
                                    '    AND  DATE_BEG<= '+''''+DateToStr(ActualDate)+''''+
                                    '    AND  DATE_END>= '+''''+DateToStr(ActualDate)+'''';
      PlanInfoQuery.Open;
      PlanInfoQuery.FetchAll;
      if (PlanInfoQuery.RecordCount>0) then ResPlan:=StrToInt64(PlanInfoQuery.FieldByName('ID_PLAN').AsString);

      PlanInfoQuery.Close;
      PlanInfoQuery.Free;
      Screen.Cursor:=crDefault;
      Result:=ResPlan;
end;

function checkSchInfo(LOCAL_STRU:PWIZARD_GET_PROV_INFO;isDB:Integer;Database:TpFibDatabase;Transaction:TpFibTransaction):Boolean;
var  SchInfoQuery:TpFibDataSet;
     Res:Boolean;
begin
     //проверить корректность счета
     SchInfoQuery:=TpFibDataSet.Create(nil);
     SchInfoQuery.Database:=Database;
     SchInfoQuery.Transaction:=Transaction;

     try

             if (LOCAL_STRU^.CR_BY_DT=1)
             then SchInfoQuery.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_SCH_SELECT('+''''+DateToStr(LOCAL_STRU^.ACTUAL_DATE)+''''+',1) WHERE (NOT OPEN_SCH IS NULL) AND ID_SCH='+IntToStr(LOCAL_STRU^.DB_ID_SCH)
             else SchInfoQuery.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_SCH_SELECT('+''''+DateToStr(LOCAL_STRU^.ACTUAL_DATE)+''''+',1) WHERE (NOT OPEN_SCH IS NULL) AND ID_SCH='+IntToStr(LOCAL_STRU^.KR_ID_SCH);

             SchInfoQuery.Open;

             SchInfoQuery.FetchAll;

             //заполняем информацией по счету структуру
             if (SchInfoQuery.RecordCount>0)
             then begin
                       Res:=true;
                       if (LOCAL_STRU^.CR_BY_DT=1)
                       then begin //Сохраняем информацию в дебетовый счет
                                 //Showmessage('update main db');
                                 LOCAL_STRU^.DB_ID_SCH    :=StrToInt64(SchInfoQuery.FieldByName('ID_SCH').AsString);
                                 LOCAL_STRU^.DB_ID_SCH_KOD:=SchInfoQuery.FieldByName('SCH_NUMBER').AsString;
                                 LOCAL_STRU^.DB_ID_SCH_TIT:=SchInfoQuery.FieldByName('SCH_TITLE').AsString;
                       end
                       else begin //Сохраняем информацию в кредитовый счет
                                 //Showmessage('update main kr');
                                 LOCAL_STRU^.KR_ID_SCH    :=StrToInt64(SchInfoQuery.FieldByName('ID_SCH').AsString);
                                 LOCAL_STRU^.KR_ID_SCH_KOD:=SchInfoQuery.FieldByName('SCH_NUMBER').AsString;
                                 LOCAL_STRU^.KR_ID_SCH_TIT:=SchInfoQuery.FieldByName('SCH_TITLE').AsString;
                       end;
             end
             else Res:=false;
             if SchInfoQuery.Active then SchInfoQuery.Close;
     except on E:Exception do
             begin
                   ShowMessage(E.Message);
                   Res:=false;
             end;
     end;

     if Assigned(SchInfoQuery) then SchInfoQuery.Free;

     Result:=Res;
end;

function  checkCorrSchInfo(LOCAL_STRU:PWIZARD_GET_PROV_INFO;isDB:Integer;Database:TpFibDatabase;Transaction:TpFibTransaction):Boolean;
var  SchInfoQuery, OperInfo:TpFibDataSet;
     Res:Boolean;
begin
     //проверить корректность счета
     SchInfoQuery:=TpFibDataSet.Create(nil);
     SchInfoQuery.Database:=Database;
     SchInfoQuery.Transaction:=Transaction;

     OperInfo:=TpFibDataSet.Create(nil);
     OperInfo.Database:=Database;
     OperInfo.Transaction:=Transaction;

     if (isDB=1)
     then SchInfoQuery.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_SCH_SELECT('+''''+DateToStr(LOCAL_STRU^.ACTUAL_DATE)+''''+',1) WHERE (NOT OPEN_SCH IS NULL) AND ID_SCH='+IntToStr(LOCAL_STRU^.KR_ID_SCH)
     else SchInfoQuery.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_SCH_SELECT('+''''+DateToStr(LOCAL_STRU^.ACTUAL_DATE)+''''+',1) WHERE (NOT OPEN_SCH IS NULL) AND ID_SCH='+IntToStr(LOCAL_STRU^.DB_ID_SCH);

     SchInfoQuery.Open;
     SchInfoQuery.FetchAll;

     //заполняем информацией по счету структуру
     if (SchInfoQuery.RecordCount>0)
     then begin
               //Проверяем существование операции между счетами
               if  OperInfo.Active then OperInfo.Close;
               OperInfo.SelectSQL.Text:=' SELECT * '+
                                        '   FROM PUB_SP_MAIN_OPER '+
                                        '  WHERE OPER_DB_ID_SCH ='+IntToStr(LOCAL_STRU^.DB_ID_SCH)+
                                        '    AND OPER_KR_ID_SCH ='+IntToStr(LOCAL_STRU^.KR_ID_SCH)+
                                        '    AND DATE_BEG<='+''''+DateToStr(LOCAL_STRU^.ACTUAL_DATE)+''''+
                                        '    AND DATE_END>='+''''+DateToStr(LOCAL_STRU^.ACTUAL_DATE)+'''';

               //ShowMessage(OperInfo.SelectSQL.Text);

               OperInfo.Open;
               OperInfo.FetchAll;
               if (OperInfo.RecordCount>0)
               then begin
                         Res:=true;
                         if (isDb=1)
                         then begin //Сохраняем информацию в дебетовый счет
                                   //Showmessage('update corr kr');
                                   LOCAL_STRU^.KR_ID_SCH    :=StrToInt64(SchInfoQuery.FieldByName('ID_SCH').AsString);
                                   LOCAL_STRU^.KR_ID_SCH_KOD:=SchInfoQuery.FieldByName('SCH_NUMBER').AsString;
                                   LOCAL_STRU^.KR_ID_SCH_TIT:=SchInfoQuery.FieldByName('SCH_TITLE').AsString;
                         end
                         else begin //Сохраняем информацию в кредитовый счет
                                   //Showmessage('update corr db');
                                   LOCAL_STRU^.DB_ID_SCH    :=StrToInt64(SchInfoQuery.FieldByName('ID_SCH').AsString);
                                   LOCAL_STRU^.DB_ID_SCH_KOD:=SchInfoQuery.FieldByName('SCH_NUMBER').AsString;
                                   LOCAL_STRU^.DB_ID_SCH_TIT:=SchInfoQuery.FieldByName('SCH_TITLE').AsString;
                         end;
                end
                else Res:=false;
     end
     else Res:=false;

     OperInfo.Close;
     OperInfo.Free;

     SchInfoQuery.Close;
     SchInfoQuery.Free;

     Result:=Res;
end;

function  checkSmInfo(LOCAL_STRU:PWIZARD_GET_PROV_INFO;isDB:Integer;Database:TpFibDatabase;Transaction:TpFibTransaction):Boolean;
var  SmInfoQuery,PlanInfoQuery:TpFibDataSet;
     SmUnderFond:TpFibStoredProc;
     Res:Boolean;
     KR_SCH_IS_FOND,DB_SCH_IS_FOND:Boolean;
begin
     SmInfoQuery:=TpFibDataSet.Create(nil);
     SmInfoQuery.Database:=Database;
     SmInfoQuery.Transaction:=Transaction;

     if (isDB=1)or(isDB=-1)
     then SmInfoQuery.SelectSQL.Text:=' SELECT * FROM PUB_SPR_SMETA WHERE ID_SMETA='+IntToStr(LOCAL_STRU^.DB_ID_SMETA)
     else SmInfoQuery.SelectSQL.Text:=' SELECT * FROM PUB_SPR_SMETA WHERE ID_SMETA='+IntToStr(LOCAL_STRU^.KR_ID_SMETA);

     SmInfoQuery.Open;
     SmInfoQuery.FetchAll;

     if (SmInfoQuery.RecordCount>0)
     then begin

               PlanInfoQuery:=TpFibDataSet.Create(nil);
               PlanInfoQuery.Database:=Database;
               PlanInfoQuery.Transaction:=Transaction;
               if (isDB=1) or(isDB=-1)
               then PlanInfoQuery.SelectSQL.Text:=' SELECT * FROM BU_SMET_PLUS_PERIODS WHERE ID_SMETA='+IntToStr(LOCAL_STRU^.DB_ID_SMETA)
               else PlanInfoQuery.SelectSQL.Text:=' SELECT * FROM BU_SMET_PLUS_PERIODS WHERE ID_SMETA='+IntToStr(LOCAL_STRU^.KR_ID_SMETA);
               PlanInfoQuery.SelectSQL.Text:=PlanInfoQuery.SelectSQL.Text+
                                             '   AND DATE_BEG<='+''''+DateToStr(LOCAL_STRU^.ACTUAL_DATE)+''''+
                                             '   AND DATE_END>='+''''+DateToStr(LOCAL_STRU^.ACTUAL_DATE)+'''';
               PlanInfoQuery.Open;
               PlanInfoQuery.FetchAll;
               if (PlanInfoQuery.RecordCount>0)
               then begin
                         Res:=true;
                         if (isDB=1)
                         then begin
                                   KR_SCH_IS_FOND:=IsFond(LOCAL_STRU^.DB_ID_SCH,LOCAL_STRU^.ACTUAL_DATE,Database,Transaction);
                                   IF KR_SCH_IS_FOND
                                   then begin
                                             //Проверяем принадлежит ли смета к группе фонда
                                             SmUnderFond:=TpFibStoredProc.Create(nil);
                                             SmUnderFond.Database:=Database;
                                             SmUnderFond.Transaction:=Transaction;
                                             SmUnderFond.StoredProcName :='BU_CHECK_SM_UNDER_FOND';
                                             SmUnderFond.Prepare;
                                             SmUnderFond.ParamByName('ID_FOND').asInt64:=LOCAL_STRU^.DB_ID_SCH;
                                             SmUnderFond.ParamByName('ID_SMETA').asInt64:=LOCAL_STRU^.DB_ID_SMETA;
                                             SmUnderFond.ParamByName('ACTUAL_DATE').Value:=LOCAL_STRU^.ACTUAL_DATE;
                                             SmUnderFond.ExecProc;
                                             if SmUnderFond.ParamByName('RESULT').AsInteger=1
                                             then begin
                                                       LOCAL_STRU^.DB_ID_SMETA   :=StrToInt64(SmInfoQuery.FieldByName('ID_SMETA').AsString);
                                                       LOCAL_STRU^.DB_KOD_SMETA  :=SmInfoQuery.FieldByName('SMETA_KOD').Value;
                                                       LOCAL_STRU^.DB_TITLE_SMETA:=SmInfoQuery.FieldByName('SMETA_TITLE').AsString;
                                             end
                                             else Res:=false;
                                             SmUnderFond.Free;
                                   end
                                   else begin
                                             LOCAL_STRU^.DB_ID_SMETA   :=StrToInt64(SmInfoQuery.FieldByName('ID_SMETA').AsString);
                                             LOCAL_STRU^.DB_KOD_SMETA  :=SmInfoQuery.FieldByName('SMETA_KOD').Value;
                                             LOCAL_STRU^.DB_TITLE_SMETA:=SmInfoQuery.FieldByName('SMETA_TITLE').AsString;
                                   end;
                         end;

                         if (IsDb=0)
                         then begin
                                   KR_SCH_IS_FOND:=IsFond(LOCAL_STRU^.KR_ID_SCH,LOCAL_STRU^.ACTUAL_DATE,Database,Transaction);
                                   If KR_SCH_IS_FOND
                                   then begin
                                             //Проверяем принадлежит ли смета к группе фонда
                                             SmUnderFond:=TpFibStoredProc.Create(nil);
                                             SmUnderFond.Database:=Database;
                                             SmUnderFond.Transaction:=Transaction;
                                             SmUnderFond.StoredProcName :='BU_CHECK_SM_UNDER_FOND';
                                             SmUnderFond.Prepare;
                                             SmUnderFond.ParamByName('ID_FOND').asInt64:=LOCAL_STRU^.KR_ID_SCH;
                                             SmUnderFond.ParamByName('ID_SMETA').asInt64:=LOCAL_STRU^.KR_ID_SMETA;
                                             SmUnderFond.ParamByName('ACTUAL_DATE').Value:=LOCAL_STRU^.ACTUAL_DATE;
                                             SmUnderFond.ExecProc;
                                             if SmUnderFond.ParamByName('RESULT').AsInteger=1
                                             then begin
                                                       LOCAL_STRU^.KR_ID_SMETA   :=StrToInt64(SmInfoQuery.FieldByName('ID_SMETA').AsString);
                                                       LOCAL_STRU^.KR_KOD_SMETA  :=SmInfoQuery.FieldByName('SMETA_KOD').Value;
                                                       LOCAL_STRU^.KR_TITLE_SMETA:=SmInfoQuery.FieldByName('SMETA_TITLE').AsString;
                                             end
                                             else Res:=false;
                                             SmUnderFond.Free;
                                   end
                                   else begin
                                             LOCAL_STRU^.KR_ID_SMETA   :=StrToInt64(SmInfoQuery.FieldByName('ID_SMETA').AsString);
                                             LOCAL_STRU^.KR_KOD_SMETA  :=SmInfoQuery.FieldByName('SMETA_KOD').Value;
                                             LOCAL_STRU^.KR_TITLE_SMETA:=SmInfoQuery.FieldByName('SMETA_TITLE').AsString;
                                   end;
                         end;

                         if (IsDb=-1)
                         then begin
                                   KR_SCH_IS_FOND:=IsFond(LOCAL_STRU^.KR_ID_SCH,LOCAL_STRU^.ACTUAL_DATE,Database,Transaction);
                                   DB_SCH_IS_FOND:=IsFond(LOCAL_STRU^.DB_ID_SCH,LOCAL_STRU^.ACTUAL_DATE,Database,Transaction);

                                   If KR_SCH_IS_FOND and (NOT DB_SCH_IS_FOND)
                                   then begin
                                             //Проверяем принадлежит ли смета к группе фонда
                                             SmUnderFond:=TpFibStoredProc.Create(nil);
                                             SmUnderFond.Database:=Database;
                                             SmUnderFond.Transaction:=Transaction;
                                             SmUnderFond.StoredProcName :='BU_CHECK_SM_UNDER_FOND';
                                             SmUnderFond.Prepare;
                                             SmUnderFond.ParamByName('ID_FOND').asInt64:=LOCAL_STRU^.KR_ID_SCH;
                                             SmUnderFond.ParamByName('ID_SMETA').asInt64:=LOCAL_STRU^.KR_ID_SMETA;
                                             SmUnderFond.ParamByName('ACTUAL_DATE').Value:=LOCAL_STRU^.ACTUAL_DATE;
                                             SmUnderFond.ExecProc;
                                             if SmUnderFond.ParamByName('RESULT').AsInteger=1
                                             then begin
                                                       LOCAL_STRU^.KR_ID_SMETA   :=StrToInt64(SmInfoQuery.FieldByName('ID_SMETA').AsString);
                                                       LOCAL_STRU^.KR_KOD_SMETA  :=SmInfoQuery.FieldByName('SMETA_KOD').Value;
                                                       LOCAL_STRU^.KR_TITLE_SMETA:=SmInfoQuery.FieldByName('SMETA_TITLE').AsString;

                                                       LOCAL_STRU^.DB_ID_SMETA   :=StrToInt64(SmInfoQuery.FieldByName('ID_SMETA').AsString);
                                                       LOCAL_STRU^.DB_KOD_SMETA  :=SmInfoQuery.FieldByName('SMETA_KOD').Value;
                                                       LOCAL_STRU^.DB_TITLE_SMETA:=SmInfoQuery.FieldByName('SMETA_TITLE').AsString;
                                             end
                                             else Res:=false;
                                             SmUnderFond.Free;
                                   end;

                                   If (not KR_SCH_IS_FOND) and (DB_SCH_IS_FOND)
                                   then begin
                                             //Проверяем принадлежит ли смета к группе фонда в дебете
                                             SmUnderFond:=TpFibStoredProc.Create(nil);
                                             SmUnderFond.Database:=Database;
                                             SmUnderFond.Transaction:=Transaction;
                                             SmUnderFond.StoredProcName :='BU_CHECK_SM_UNDER_FOND';
                                             SmUnderFond.Prepare;
                                             SmUnderFond.ParamByName('ID_FOND').asInt64:=LOCAL_STRU^.DB_ID_SCH;
                                             SmUnderFond.ParamByName('ID_SMETA').asInt64:=LOCAL_STRU^.DB_ID_SMETA;
                                             SmUnderFond.ParamByName('ACTUAL_DATE').Value:=LOCAL_STRU^.ACTUAL_DATE;
                                             SmUnderFond.ExecProc;
                                             if SmUnderFond.ParamByName('RESULT').AsInteger=1
                                             then begin
                                                       LOCAL_STRU^.KR_ID_SMETA   :=StrToInt64(SmInfoQuery.FieldByName('ID_SMETA').AsString);
                                                       LOCAL_STRU^.KR_KOD_SMETA  :=SmInfoQuery.FieldByName('SMETA_KOD').Value;
                                                       LOCAL_STRU^.KR_TITLE_SMETA:=SmInfoQuery.FieldByName('SMETA_TITLE').AsString;

                                                       LOCAL_STRU^.DB_ID_SMETA   :=StrToInt64(SmInfoQuery.FieldByName('ID_SMETA').AsString);
                                                       LOCAL_STRU^.DB_KOD_SMETA  :=SmInfoQuery.FieldByName('SMETA_KOD').Value;
                                                       LOCAL_STRU^.DB_TITLE_SMETA:=SmInfoQuery.FieldByName('SMETA_TITLE').AsString;
                                             end
                                             else Res:=false;
                                             SmUnderFond.Free;
                                   end;

                                   If (not KR_SCH_IS_FOND) and (not DB_SCH_IS_FOND)
                                   then begin
                                                       LOCAL_STRU^.KR_ID_SMETA   :=StrToInt64(SmInfoQuery.FieldByName('ID_SMETA').AsString);
                                                       LOCAL_STRU^.KR_KOD_SMETA  :=SmInfoQuery.FieldByName('SMETA_KOD').Value;
                                                       LOCAL_STRU^.KR_TITLE_SMETA:=SmInfoQuery.FieldByName('SMETA_TITLE').AsString;

                                                       LOCAL_STRU^.DB_ID_SMETA   :=StrToInt64(SmInfoQuery.FieldByName('ID_SMETA').AsString);
                                                       LOCAL_STRU^.DB_KOD_SMETA  :=SmInfoQuery.FieldByName('SMETA_KOD').Value;
                                                       LOCAL_STRU^.DB_TITLE_SMETA:=SmInfoQuery.FieldByName('SMETA_TITLE').AsString;
                                   end;

                                   If (KR_SCH_IS_FOND) and (DB_SCH_IS_FOND)
                                   then begin
                                             Res:=false;
                                             LOCAL_STRU^.NOT_DIF_BDG_FG:=false;
                                   end;

                         end;

               end
               else Res:=false;
               PlanInfoQuery.Close;
               PlanInfoQuery.Free;
     end
     else Res:=false;

     SmInfoQuery.Close;
     SmInfoQuery.Free;

     Result:=Res;
end;

function  checkRzInfo(LOCAL_STRU:PWIZARD_GET_PROV_INFO;isDB:Integer;Database:TpFibDatabase;Transaction:TpFibTransaction):Boolean;
var  RazdStInfo,RazdInStru:TpFibDataSet;
     Id_Plan:Int64;
     Res:Boolean;
begin
     //проверить корректность раздела
     RazdStInfo:=TpFibDataSet.Create(nil);
     RazdStInfo.Database:=Database;
     RazdStInfo.Transaction:=Transaction;
     if ((isDB=1) or (isDB=-1))
     then RazdStInfo.SelectSQL.Text:='SELECT * FROM PUB_SPR_RAZD_ST WHERE ID_RAZD_ST='+IntToStr(LOCAL_STRU^.DB_ID_RAZD)+' AND ENABLE=1'
     else RazdStInfo.SelectSQL.Text:='SELECT * FROM PUB_SPR_RAZD_ST WHERE ID_RAZD_ST='+IntToStr(LOCAL_STRU^.KR_ID_RAZD)+' AND ENABLE=1';

     RazdStInfo.Open;
     RazdStInfo.FetchAll;

     if (RazdStInfo.RecordCount>0)
     then begin
               if ((isDB=1) or (isDB=-1))
               then Id_Plan:=getSmPlan(LOCAL_STRU^.DB_ID_SMETA,LOCAL_STRU^.ACTUAL_DATE, Database, Transaction)
               else Id_Plan:=getSmPlan(LOCAL_STRU^.KR_ID_SMETA,LOCAL_STRU^.ACTUAL_DATE, Database, Transaction);

               RazdInStru:=TpFibDataSet.Create(nil);
               RazdInStru.Database:=Database;
               RazdInStru.Transaction:=Transaction;
               RazdInStru.SelectSQL.Text:=' SELECT * FROM BU_SMET_STRUCTURE    '+
                                          '  WHERE ID_PLAN='+IntToStr(Id_Plan)  +
                                          '    AND ID_TYPE_OBJ=0               ';
               if ((isDB=1) or (isDB=-1))
               then RazdInStru.SelectSQL.Text:=RazdInStru.SelectSQL.Text+'    AND ID_PLAN_OBJ='+IntToStr(LOCAL_STRU^.DB_ID_RAZD)
               else RazdInStru.SelectSQL.Text:=RazdInStru.SelectSQL.Text+'    AND ID_PLAN_OBJ='+IntToStr(LOCAL_STRU^.KR_ID_RAZD);

               RazdInStru.Open;
               RazdInStru.FetchAll;
               if (RazdInStru.RecordCount>0)
               then begin
                         Res:=true;
                         if isDb=1
                         then begin
                                   LOCAL_STRU^.DB_ID_RAZD   :=StrToInt64(RazdStInfo.FieldByName('ID_RAZD_ST').AsString);
                                   LOCAL_STRU^.DB_KOD_RAZD  :=RazdStInfo.FieldByName('RAZD_ST_NUM').Value;
                                   LOCAL_STRU^.DB_TITLE_RAZD:=RazdStInfo.FieldByName('RAZD_ST_TITLE').AsString;
                         end;

                         if isDb=0
                         then begin
                                   LOCAL_STRU^.KR_ID_RAZD   :=StrToInt64(RazdStInfo.FieldByName('ID_RAZD_ST').AsString);
                                   LOCAL_STRU^.KR_KOD_RAZD  :=RazdStInfo.FieldByName('RAZD_ST_NUM').Value;
                                   LOCAL_STRU^.KR_TITLE_RAZD:=RazdStInfo.FieldByName('RAZD_ST_TITLE').AsString;
                         end;

                         if isDb=-1
                         then begin
                                   LOCAL_STRU^.KR_ID_RAZD   :=StrToInt64(RazdStInfo.FieldByName('ID_RAZD_ST').AsString);
                                   LOCAL_STRU^.KR_KOD_RAZD  :=RazdStInfo.FieldByName('RAZD_ST_NUM').Value;
                                   LOCAL_STRU^.KR_TITLE_RAZD:=RazdStInfo.FieldByName('RAZD_ST_TITLE').AsString;

                                   LOCAL_STRU^.DB_ID_RAZD   :=StrToInt64(RazdStInfo.FieldByName('ID_RAZD_ST').AsString);
                                   LOCAL_STRU^.DB_KOD_RAZD  :=RazdStInfo.FieldByName('RAZD_ST_NUM').Value;
                                   LOCAL_STRU^.DB_TITLE_RAZD:=RazdStInfo.FieldByName('RAZD_ST_TITLE').AsString;
                         end;

               end
               else Res:=false;

               RazdInStru.Close;
               RazdInStru.Free;
     end
     else Res:=false;

     RazdStInfo.Close;
     RazdStInfo.Free;

     Result:=Res;
end;

function  checkStInfo(LOCAL_STRU:PWIZARD_GET_PROV_INFO;isDB:Integer;Database:TpFibDatabase;Transaction:TpFibTransaction):Boolean;
var  StInfo:TpFibDataSet;
     Res:Boolean;
begin

     StInfo:=TpFibDataSet.Create(nil);
     StInfo.Database:=Database;
     StInfo.Transaction:=Transaction;

     if (isDB=1) or (isDB=-1)
     then StInfo.SelectSQL.Text:='SELECT * FROM PUB_SPR_RAZD_ST '+
                                 ' WHERE ID_RAZD_ST='+IntToStr(LOCAL_STRU^.DB_ID_STAT)+
                                 '   AND LINKTO='+IntToStr(LOCAL_STRU^.DB_ID_RAZD)

     else StInfo.SelectSQL.Text:='SELECT * FROM PUB_SPR_RAZD_ST '+
                                 ' WHERE ID_RAZD_ST='+IntToStr(LOCAL_STRU^.KR_ID_STAT)+
                                 '   AND LINKTO='+IntToStr(LOCAL_STRU^.KR_ID_RAZD);

     StInfo.Open;
     StInfo.FetchAll;

     if (StInfo.RecordCount>0)
     then begin
               Res:=true;
               if isDb=1
               then begin
                         LOCAL_STRU^.DB_ID_STAT   :=StrToInt64(StInfo.FieldByName('ID_RAZD_ST').AsString);
                         LOCAL_STRU^.DB_KOD_STAT  :=StInfo.FieldByName('RAZD_ST_NUM').Value;
                         LOCAL_STRU^.DB_TITLE_STAT:=StInfo.FieldByName('RAZD_ST_TITLE').AsString;
               end;

               if isDb=0
               then begin
                         LOCAL_STRU^.KR_ID_STAT   :=StrToInt64(StInfo.FieldByName('ID_RAZD_ST').AsString);
                         LOCAL_STRU^.KR_KOD_STAT  :=StInfo.FieldByName('RAZD_ST_NUM').Value;
                         LOCAL_STRU^.KR_TITLE_STAT:=StInfo.FieldByName('RAZD_ST_TITLE').AsString;
               end;

               if isDb=-1
               then begin
                         LOCAL_STRU^.KR_ID_STAT   :=StrToInt64(StInfo.FieldByName('ID_RAZD_ST').AsString);
                         LOCAL_STRU^.KR_KOD_STAT  :=StInfo.FieldByName('RAZD_ST_NUM').Value;
                         LOCAL_STRU^.KR_TITLE_STAT:=StInfo.FieldByName('RAZD_ST_TITLE').AsString;

                         LOCAL_STRU^.DB_ID_STAT   :=StrToInt64(StInfo.FieldByName('ID_RAZD_ST').AsString);
                         LOCAL_STRU^.DB_KOD_STAT  :=StInfo.FieldByName('RAZD_ST_NUM').Value;
                         LOCAL_STRU^.DB_TITLE_STAT:=StInfo.FieldByName('RAZD_ST_TITLE').AsString;
               end;
     end
     else begin
               if StInfo.Active then StInfo.Close;
               if (isDB=1) or (isDB=-1)
               then StInfo.SelectSQL.Text:='SELECT * FROM PUB_SPR_RAZD_ST '+
                                           ' WHERE RAZD_ST_NUM='+IntToStr(LOCAL_STRU^.DB_KOD_STAT)+
                                           '   AND LINKTO='+IntToStr(LOCAL_STRU^.DB_ID_RAZD)

               else StInfo.SelectSQL.Text:='SELECT * FROM PUB_SPR_RAZD_ST '+
                                           ' WHERE RAZD_ST_NUM='+IntToStr(LOCAL_STRU^.KR_KOD_STAT)+
                                           '   AND LINKTO='+IntToStr(LOCAL_STRU^.KR_ID_RAZD);
               StInfo.Open;
               StInfo.FetchAll;
               if (StInfo.RecordCount>0)
               then begin
                         Res:=true;
                         if isDb=1
                         then begin
                                   LOCAL_STRU^.DB_ID_STAT   :=StrToInt64(StInfo.FieldByName('ID_RAZD_ST').AsString);
                                   LOCAL_STRU^.DB_KOD_STAT  :=StInfo.FieldByName('RAZD_ST_NUM').Value;
                                   LOCAL_STRU^.DB_TITLE_STAT:=StInfo.FieldByName('RAZD_ST_TITLE').AsString;
                         end;

                         if isDb=0
                         then begin
                                   LOCAL_STRU^.KR_ID_STAT   :=StrToInt64(StInfo.FieldByName('ID_RAZD_ST').AsString);
                                   LOCAL_STRU^.KR_KOD_STAT  :=StInfo.FieldByName('RAZD_ST_NUM').Value;
                                   LOCAL_STRU^.KR_TITLE_STAT:=StInfo.FieldByName('RAZD_ST_TITLE').AsString;
                         end;

                         if isDb=-1
                         then begin
                                   LOCAL_STRU^.DB_ID_STAT   :=StrToInt64(StInfo.FieldByName('ID_RAZD_ST').AsString);
                                   LOCAL_STRU^.DB_KOD_STAT  :=StInfo.FieldByName('RAZD_ST_NUM').Value;
                                   LOCAL_STRU^.DB_TITLE_STAT:=StInfo.FieldByName('RAZD_ST_TITLE').AsString;

                                   LOCAL_STRU^.KR_ID_STAT   :=StrToInt64(StInfo.FieldByName('ID_RAZD_ST').AsString);
                                   LOCAL_STRU^.KR_KOD_STAT  :=StInfo.FieldByName('RAZD_ST_NUM').Value;
                                   LOCAL_STRU^.KR_TITLE_STAT:=StInfo.FieldByName('RAZD_ST_TITLE').AsString;
                         end;

               end
               else Res:=false;
     end;

     StInfo.Close;
     StInfo.Free;

     Result:=Res;
end;

function  checkKVInfo(LOCAL_STRU:PWIZARD_GET_PROV_INFO;isDB:Integer;Database:TpFibDatabase;Transaction:TpFibTransaction):Boolean;
var  KEKVInfo:TpFibDataSet;
     Res:Boolean;
begin
     KEKVInfo:=TpFibDataSet.Create(nil);
     KEKVInfo.Database:=Database;
     KEKVInfo.Transaction:=Transaction;
     if (isDB=1) or (isDB=-1)
     then KEKVInfo.SelectSQL.Text:='SELECT * FROM PUB_WIZARD_KEKV_SELECT('+''''+DateToStr(LOCAL_STRU^.ACTUAL_DATE)+''''+','+IntToStr(LOCAL_STRU^.DB_ID_SMETA)+')'+
                                   ' WHERE ID_KEKV='+IntToStr(LOCAL_STRU^.DB_ID_KEKV)

     else KEKVInfo.SelectSQL.Text:='SELECT * FROM PUB_WIZARD_KEKV_SELECT('+''''+DateToStr(LOCAL_STRU^.ACTUAL_DATE)+''''+','+IntToStr(LOCAL_STRU^.KR_ID_SMETA)+')'+
                                   ' WHERE ID_KEKV='+IntToStr(LOCAL_STRU^.KR_ID_KEKV);

     KEKVInfo.Open;
     KEKVInfo.FetchAll;

     if (KEKVInfo.RecordCount>0)
     then begin
               Res:=true;
               if isDb=1
               then begin
                         LOCAL_STRU^.DB_ID_KEKV   :=StrToInt64(KEKVInfo.FieldByName('ID_KEKV').AsString);
                         LOCAL_STRU^.DB_KOD_KEKV  :=KEKVInfo.FieldByName('KEKV_CODE').Value;
                         LOCAL_STRU^.DB_KEKV_TITLE:=KEKVInfo.FieldByName('KEKV_TITLE').AsString;
               end;

               if isdb=0
               then begin
                         LOCAL_STRU^.KR_ID_KEKV   :=StrToInt64(KEKVInfo.FieldByName('ID_KEKV').AsString);
                         LOCAL_STRU^.KR_KOD_KEKV  :=KEKVInfo.FieldByName('KEKV_CODE').Value;
                         LOCAL_STRU^.KR_KEKV_TITLE:=KEKVInfo.FieldByName('KEKV_TITLE').AsString;
               end;

               if isdb=-1
               then begin
                         LOCAL_STRU^.KR_ID_KEKV   :=StrToInt64(KEKVInfo.FieldByName('ID_KEKV').AsString);
                         LOCAL_STRU^.KR_KOD_KEKV  :=KEKVInfo.FieldByName('KEKV_KODE').Value;
                         LOCAL_STRU^.KR_KEKV_TITLE:=KEKVInfo.FieldByName('KEKV_TITLE').AsString;

                         LOCAL_STRU^.DB_ID_KEKV   :=StrToInt64(KEKVInfo.FieldByName('ID_KEKV').AsString);
                         LOCAL_STRU^.DB_KOD_KEKV  :=KEKVInfo.FieldByName('KEKV_KODE').Value;
                         LOCAL_STRU^.DB_KEKV_TITLE:=KEKVInfo.FieldByName('KEKV_TITLE').AsString;
               end;

     end
     else Res:=false;

     KEKVInfo.Close;
     KEKVInfo.Free;
     
     Result:=Res;
end;


end.
