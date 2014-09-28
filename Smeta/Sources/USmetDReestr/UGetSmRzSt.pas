unit UGetSmRzSt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxMaskEdit, cxButtonEdit, cxControls, cxContainer, cxEdit, cxTextEdit,
  pFibStoredProc;

type
  TfrmGetSmRzSt = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EdKrSt: TcxButtonEdit;
    Bevel2: TBevel;
    EdDbSt: TcxButtonEdit;
    EdDbRazdel: TcxButtonEdit;
    EdDbBudget: TcxButtonEdit;
    EdKrBudget: TcxButtonEdit;
    EdKrRazdel: TcxButtonEdit;
    Label7: TLabel;
    Label8: TLabel;
    EdDbBudgetTitle: TcxTextEdit;
    EdDbRazdelTitle: TcxTextEdit;
    EdDbStTitle: TcxTextEdit;
    EdKrRazdelTitle: TcxTextEdit;
    EdKrStTitle: TcxTextEdit;
    EdKrBudgetTitle: TcxTextEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure EdDbBudgetPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdKrBudgetPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdDbRazdelPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdKrRazdelPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdDbStPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdKrStPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    procedure GetInfoFromTemplate; 
  public
    DB_ID_SM:Integer;
    DB_ID_RZ:Integer;
    DB_ID_ST:Integer;
    KR_ID_SM:Integer;
    KR_ID_RZ:Integer;
    KR_ID_ST:Integer;

    KR_ID_PLAN :Int64;
    DB_ID_PLAN :Int64;
    { Public declarations }
    Constructor Create(AOwner:TComponent;DB_ID_SM,DB_ID_RZ,DB_ID_ST,KR_ID_SM, KR_ID_RZ, KR_ID_ST:Integer);overload;
  end;


implementation

uses GlobalSpr,UDocDetail,BaseTypes;
{$R *.dfm}


constructor TfrmGetSmRzSt.Create(AOwner: TComponent; DB_ID_SM, DB_ID_RZ,
  DB_ID_ST, KR_ID_SM, KR_ID_RZ, KR_ID_ST: Integer);
begin
     inherited Create(AOwner);
     self.DB_ID_SM:=DB_ID_SM;
     self.DB_ID_RZ:=DB_ID_RZ;
     self.DB_ID_ST:=DB_ID_ST;
     self.KR_ID_SM:=KR_ID_SM;
     self.KR_ID_RZ:=KR_ID_RZ;
     self.KR_ID_ST:=KR_ID_ST;
     GetInfoFromTemplate;
end;

procedure TfrmGetSmRzSt.cxButton1Click(Sender: TObject);
begin
     if (EdDBBudget.Text='') or (EdDBrazdel.Text='') or (EdDBSt.Text='')
     or (EdKrBudget.Text='') or (EdKrrazdel.Text='') or (EdKrSt.Text='')
     then begin
               agShowMessage('Не булі вибрані всі об'+''''+'єкти для проводки');
               Exit;
     end;
     ModalResult:=mrYes;
end;

procedure TfrmGetSmRzSt.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmGetSmRzSt.GetInfoFromTemplate;
var CheckProc:TpFibStoredProc;
    RDB_SM,RDB_RZ,RDB_ST,RKR_SM,RKR_RZ,RKR_ST:Boolean;
    RDB_SM_RZ,RKR_SM_RZ:Boolean;
    RDB_SM_RZ_ST,RKR_SM_RZ_ST:Boolean;
begin
     RDB_SM:=false;
     RDB_RZ:=false;
     RDB_ST:=false;
     RKR_SM:=false;
     RKR_RZ:=false;
     RKR_ST:=false;

     RDB_SM_RZ:=false;
     RKR_SM_RZ:=false;

     RDB_SM_RZ_ST:=false;
     RKR_SM_RZ_ST:=false;

     {Проверяем на существование объектов бюджетирования в БД}
     CheckProc:=TpFibStoredProc.Create(self);
     CheckProc.Database:=TfrmDocDetail(Owner).WorkDatabase;
     CheckProc.Transaction:=TfrmDocDetail(Owner).ReadTransaction;

     {Проверяем дебетовую смету}
     CheckProc.StoredProcName:='PUB_SPR_SMETA_INFO';
     CheckProc.Prepare;
     CheckProc.ParamByName('ID_SMETA').Value  :=DB_ID_SM;
     CheckProc.ExecProc;
     if (CheckProc.ParamByName('SMETA_KOD').Value<>NULL)
     then begin
               RDB_SM:=true;
               EdDbBudget.Text:=CheckProc.ParamByName('SMETA_KOD').AsString;
               EdDbBudgetTitle.Text:=CheckProc.ParamByName('SMETA_TITLE').AsString;
     end;

     if RDB_SM
     then begin
               CheckProc.StoredProcName:='BU_GET_PLAN_BY_DATES_EX';
               CheckProc.Prepare;
               CheckProc.ParamByName('ID_SMETA').Value:=DB_ID_SM;
               CheckProc.ParamByName('ACTUAL_DATE').Value:=TfrmDocDetail(Owner).ActualDate;
               CheckProc.ExecProc;
               if CheckProc.ParamByName('ID_PLAN').asInt64>0
               then begin
                         DB_ID_PLAN:=CheckProc.ParamByName('ID_PLAN').asInt64;
               end;
     end;

     {Проверяем кредитовую смету}
     CheckProc.StoredProcName:='PUB_SPR_SMETA_INFO';
     CheckProc.Prepare;
     CheckProc.ParamByName('ID_SMETA').Value  :=KR_ID_SM;
     CheckProc.ExecProc;
     if (CheckProc.ParamByName('SMETA_KOD').Value<>NULL)
     then begin
               RKR_SM:=true;
               EdKrBudget.Text:=CheckProc.ParamByName('SMETA_KOD').AsString;
               EdKrBudgetTitle.Text:=CheckProc.ParamByName('SMETA_TITLE').AsString;
     end;

     if RKR_SM
     then begin
               CheckProc.StoredProcName:='BU_GET_PLAN_BY_DATES_EX';
               CheckProc.Prepare;
               CheckProc.ParamByName('ID_SMETA').Value:=KR_ID_SM;
               CheckProc.ParamByName('ACTUAL_DATE').Value:=TfrmDocDetail(Owner).ActualDate;
               CheckProc.ExecProc;
               if CheckProc.ParamByName('ID_PLAN').asInt64>0
               then begin
                         KR_ID_PLAN:=CheckProc.ParamByName('ID_PLAN').asInt64;
               end;
     end;

     {Проверяем дебетовый раздел}
     CheckProc.StoredProcName:='PUB_SPR_RAZD_ST_INFO';
     CheckProc.Prepare;
     CheckProc.ParamByName('ID_RAZD_ST_IN').Value:=DB_ID_RZ;
     CheckProc.ExecProc;
     if (CheckProc.ParamByName('RAZD_ST_NUM').Value<>Null)
     then begin
               RDB_RZ   :=true;
               EdDbRazdel.Text:=CheckProc.ParamByName('RAZD_ST_NUM').AsString;
               EdDbRazdelTitle.Text:=CheckProc.ParamByName('RAZD_ST_TITLE').AsString;
               if RDB_SM
               then begin
                         CheckProc.StoredProcName:='PUB_IS_CORRECT_SM_RAZD_ST';
                         CheckProc.Prepare;
                         CheckProc.ParamByName('ID_SMETA').Value   :=DB_ID_SM;
                         CheckProc.ParamByName('ID_RAZD').Value    :=DB_ID_RZ;
                         CheckProc.ParamByName('ID_STAT').Value    :=NULL;
                         CheckProc.ParamByName('ACTUAL_DATE').Value:=TfrmDocDetail(Owner).ActualDate;
                         CheckProc.ExecProc;

                         if (CheckProc.ParamByName('RESULT_VALUE').AsInteger=1)
                         then begin
                                    RDB_SM_RZ:=true;
                         end
                         else begin
                                    RDB_SM_RZ:=false;
                                    EdDbRazdel.Text:='';
                                    EdDbRazdelTitle.Text:='';
                         end;
               end;
     end
     else begin
               RDB_RZ   :=true;
               EdDbRazdel.Text:='';
               EdDbRazdelTitle.Text:='';
     end;

     {Проверяем кредитовый раздел}
     CheckProc.StoredProcName:='PUB_SPR_RAZD_ST_INFO';
     CheckProc.Prepare;
     CheckProc.ParamByName('ID_RAZD_ST_IN').Value:=KR_ID_RZ;
     CheckProc.ExecProc;
     if (CheckProc.ParamByName('RAZD_ST_NUM').Value<>Null)
     then begin
               EdKRRazdel.Text:=CheckProc.ParamByName('RAZD_ST_NUM').AsString;
               EdKRRazdelTitle.Text:=CheckProc.ParamByName('RAZD_ST_TITLE').AsString;
               RKR_RZ   :=true;
               if RKR_SM
               then begin
                         CheckProc.StoredProcName:='PUB_IS_CORRECT_SM_RAZD_ST';
                         CheckProc.Prepare;
                         CheckProc.ParamByName('ID_SMETA').Value   :=KR_ID_SM;
                         CheckProc.ParamByName('ID_RAZD').Value    :=KR_ID_RZ;
                         CheckProc.ParamByName('ID_STAT').Value    :=NULL;
                         CheckProc.ParamByName('ACTUAL_DATE').Value:=TfrmDocDetail(Owner).ActualDate;
                         CheckProc.ExecProc;

                         if (CheckProc.ParamByName('RESULT_VALUE').AsInteger=1)
                         then begin
                                    RKR_SM_RZ:=true;
                         end
                         else begin
                                    RKR_SM_RZ:=false;
                                    EdKRRazdel.Text:='';
                                    EdDbRazdelTitle.Text:='';
                         end;
               end;
     end
     else begin
                RKR_RZ   :=false;
                EdKRRazdel.Text:='';
                EdDbRazdelTitle.Text:='';
     end;

     {Проверяем дебетовую статью}
     if RDB_RZ
     then begin
               CheckProc.StoredProcName:='PUB_SPR_RAZD_ST_INFO';
               CheckProc.Prepare;
               CheckProc.ParamByName('ID_RAZD_ST_IN').Value:=DB_ID_ST;
               CheckProc.ExecProc;
               if (CheckProc.ParamByName('RAZD_ST_NUM').Value<>Null)
               then begin
                         EdDbSt.Text:=CheckProc.ParamByName('RAZD_ST_NUM').AsString;
                         EdDbStTitle.Text:=CheckProc.ParamByName('RAZD_ST_TITLE').AsString;
                         RDB_ST      :=true;
                         if RDB_SM_RZ
                         then begin
                                   {Проверяем совпадение номеров статей под разными разделами}
                                   CheckProc.StoredProcName:='PUB_GET_NAME_ST_BY_KOD_EX';
                                   CheckProc.Prepare;
                                   CheckProc.ParamByName('NUM_RAZD').Value:=Trim(EdDbRazdel.Text);
                                   CheckProc.ParamByName('NUM_ST').Value  :=Trim(EdDbSt.Text);
                                   CheckProc.ExecProc;
                                   if CheckProc.ParamByName('ID_ST').Value>0
                                   then DB_ID_ST:=CheckProc.ParamByName('ID_ST').Value;

                                   CheckProc.StoredProcName:='PUB_IS_CORRECT_SM_RAZD_ST';
                                   CheckProc.Prepare;

                                   CheckProc.ParamByName('ID_SMETA').Value   :=DB_ID_SM;
                                   CheckProc.ParamByName('ID_RAZD').Value    :=DB_ID_RZ;
                                   CheckProc.ParamByName('ID_STAT').Value    :=DB_ID_ST;
                                   CheckProc.ParamByName('ACTUAL_DATE').Value:=TfrmDocDetail(Owner).ActualDate;
                                   CheckProc.ExecProc;


                                   if (CheckProc.ParamByName('RESULT_VALUE').AsInteger=1)
                                   then begin
                                              RDB_SM_RZ_ST:=true;
                                   end
                                   else begin
                                              EdDbSt.Text:='';
                                              EdDbStTitle.Text:='';
                                              RDB_SM_RZ_ST:=false;
                                   end;
                         end;
               end
               else begin
                         RDB_ST      :=false;
                         EdDbSt.Text:='';
                         EdDbStTitle.Text:='';
               end;
     end;


     {Проверяем кредитовую статью}
     if RKR_RZ
     then begin
               CheckProc.StoredProcName:='PUB_SPR_RAZD_ST_INFO';
               CheckProc.Prepare;
               CheckProc.ParamByName('ID_RAZD_ST_IN').Value:=KR_ID_ST;
               CheckProc.ExecProc;
               if (CheckProc.ParamByName('RAZD_ST_NUM').Value<>Null)
               then begin
                         EdKrSt.Text:=CheckProc.ParamByName('RAZD_ST_NUM').AsString;
                         EdKrStTitle.Text:=CheckProc.ParamByName('RAZD_ST_TITLE').AsString;
                         RKR_ST      :=true;
                         if RKR_SM_RZ
                         then begin
                                   {Проверяем совпадение номеров статей под разными разделами}
                                   CheckProc.StoredProcName:='PUB_GET_NAME_ST_BY_KOD_EX';
                                   CheckProc.Prepare;
                                   CheckProc.ParamByName('NUM_RAZD').Value:=Trim(EdKrRazdel.Text);
                                   CheckProc.ParamByName('NUM_ST').Value  :=Trim(EdKrSt.Text);
                                   CheckProc.ExecProc;
                                   if CheckProc.ParamByName('ID_ST').Value>0
                                   then KR_ID_ST:=CheckProc.ParamByName('ID_ST').Value;

                                   CheckProc.StoredProcName:='PUB_IS_CORRECT_SM_RAZD_ST';
                                   CheckProc.Prepare;
                                   CheckProc.ParamByName('ID_SMETA').Value   :=KR_ID_SM;
                                   CheckProc.ParamByName('ID_RAZD').Value    :=KR_ID_RZ;
                                   CheckProc.ParamByName('ID_STAT').Value    :=KR_ID_ST;
                                   CheckProc.ParamByName('ACTUAL_DATE').Value:=TfrmDocDetail(Owner).ActualDate;
                                   CheckProc.ExecProc;

                                   if (CheckProc.ParamByName('RESULT_VALUE').AsInteger=1)
                                   then begin
                                              RKR_SM_RZ_ST:=true;
                                   end
                                   else begin
                                              RKR_SM_RZ_ST:=false;
                                              EdKrSt.Text:='';
                                              EdKrStTitle.Text:='';
                                   end;
                         end;
               end
               else begin
                         RKR_ST      :=false;
               end;
     end;

     CheckProc.Close;
     CheckProc.Free;


end;

procedure TfrmGetSmRzSt.EdDbBudgetPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GlobalSPR.GetSmets(self,
                       TfrmDocDetail(Owner).WorkDatabase.Handle,
                       TfrmDocDetail(Owner).ActualDate,
                       psmSmet);
    if (VarArrayDimCount(Res)>0)
    then begin
                         DB_ID_SM:=Res[0];
                         EdDBBudget.Text:=VarToStr(Res[3]);
                         GetInfoFromTemplate;
    end;
end;

procedure TfrmGetSmRzSt.EdKrBudgetPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GlobalSPR.GetSmets(self,
                       TfrmDocDetail(Owner).WorkDatabase.Handle,
                       TfrmDocDetail(Owner).ActualDate,
                       psmSmet);
    if (VarArrayDimCount(Res)>0)
    then begin
                         KR_ID_SM:=Res[0];
                         EdKrBudget.Text:=VarToStr(Res[3]);
                         GetInfoFromTemplate;
    end;

end;

procedure TfrmGetSmRzSt.EdDbRazdelPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GetRazdStSpr(self,
                      TfrmDocDetail(Owner).WorkDatabase.Handle,
                      fsNormal,
                      TfrmDocDetail(Owner).ActualDate,
                      DB_ID_PLAN,
                      allExistInPlan,
                      cmRazd);
    if (Res<>NULL)
    then begin
                   DB_ID_RZ:=Res;
                   GetInfoFromTemplate;
    end;
end;

procedure TfrmGetSmRzSt.EdKrRazdelPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GetRazdStSpr(self,
                      TfrmDocDetail(Owner).WorkDatabase.Handle,
                      fsNormal,
                      TfrmDocDetail(Owner).ActualDate,
                      KR_ID_PLAN,
                      allExistInPlan,
                      cmRazd);
    if (Res<>Null)
    then begin
                   KR_ID_RZ:=Res;
                   GetInfoFromTemplate;
    end;
end;

procedure TfrmGetSmRzSt.EdDbStPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GetRazdStSpr(self,
                      TfrmDocDetail(Owner).WorkDatabase.Handle,
                      fsNormal,
                      TfrmDocDetail(Owner).ActualDate,
                      DB_ID_RZ,
                      allExistInPlanSt,
                      cmSt);
    if (Res<>Null)
    then begin
                   DB_ID_ST:=Res;
                   GetInfoFromTemplate;
    end;
end;

procedure TfrmGetSmRzSt.EdKrStPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GetRazdStSpr(self,
                      TfrmDocDetail(Owner).WorkDatabase.Handle,
                      fsNormal,
                      TfrmDocDetail(Owner).ActualDate,
                      KR_ID_RZ,
                      allExistInPlanSt,
                      cmSt);
    if (Res<>NULL)
    then begin
                   KR_ID_ST:=Res;
                   GetInfoFromTemplate;
    end;
end;

end.


