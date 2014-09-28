unit GetProvInfoWizard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit,Ibase, FIBDatabase,
  pFIBDatabase,Kernel,pFibStoredProc,pFibDataSet, Menus, ActnList,FIBDataSet,
  FMTBcd;

type
  ControlsArray = array of TcxTextEdit;

  TfrmProvInfoWizard = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N4: TMenuItem;
    N7: TMenuItem;
    InfoPanel: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lbDBtitle: TLabel;
    lbSchDb: TLabel;
    lbSchkr: TLabel;
    lbKRtitle: TLabel;
    lbSmDb: TLabel;
    lbRzDb: TLabel;
    lbStDb: TLabel;
    lbSmKr: TLabel;
    lbRzKr: TLabel;
    lbStKr: TLabel;
    lbKVDb: TLabel;
    lbKVKr: TLabel;
    edDBSchNum: TcxTextEdit;
    edDBSchTitle: TcxTextEdit;
    edKrSchTitle: TcxTextEdit;
    edKrSchNum: TcxTextEdit;
    edDBSm: TcxTextEdit;
    edDBRz: TcxTextEdit;
    edDbSt: TcxTextEdit;
    edKrSm: TcxTextEdit;
    edKrSt: TcxTextEdit;
    edKrRz: TcxTextEdit;
    edDBKV: TcxTextEdit;
    edKrKV: TcxTextEdit;
    Panel1: TPanel;
    BackButton: TcxButton;
    OKButton: TcxButton;
    CloseButton: TcxButton;
    Label1: TLabel;
    EdDbAN: TcxTextEdit;
    lbAnDb: TLabel;
    lbAnKr: TLabel;
    EdKrAn: TcxTextEdit;
    ActionList1: TActionList;
    Action1: TAction;
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    Work_result:Boolean;


    { Public declarations }
    tempID_SCH                  :Int64;
    tempID_SCH_for_corr         :Int64;
    tempID_DbGR                 :Int64;
    tempID_DbSM                 :Int64;
    tempID_DbRZ                 :Int64;
    tempID_DbST                 :int64;
    tempID_DbKV                 :Int64;
    tempID_KrGR                 :Int64;
    tempID_KrSM                 :Int64;
    tempID_KrRZ                 :Int64;
    tempID_KrST                 :int64;
    tempID_KrKV                 :Int64;
    edCr_by_dt                  :Boolean;
    edDBSchNum_x                :String;
    edDBSchTitle_x              :String;
    edKrSchNum_x                :String;
    edKrSchTitle_x              :String;
    edDbSm_x                    :String;
    edKrSm_x                    :String;
    edDbRz_x                    :String;
    edDbSt_x                    :String;
    edDbKV_x                    :String;
    edKrRz_x                    :String;
    edKrSt_x                    :String;
    edKrKV_x                    :String;

    edDbSm_Kod_x                :Integer;
    edKrSm_Kod_x                :Integer;
    edDbRz_Kod_x                :Integer;
    edDbSt_Kod_x                :Integer;
    edDbKV_Kod_x                :Integer;
    edKrRz_Kod_x                :Integer;
    edKrSt_Kod_x                :Integer;
    edKrKV_Kod_x                :Integer;


    edDbAn_x                    :String;
    edKrAn_x                    :String;
    need_faced_part             :Boolean;
    copy_db_bdg_from_faced_part :Boolean;
    stop_work_with_bdgts        :Boolean;

    DB_ANALITIC1                :Integer;
    DB_ANALITIC2                :Integer;
    DB_ANALITIC3                :Integer;
    DB_ANALITIC4                :Integer;
    DB_ANALITIC5                :Integer;
    DB_ANALITIC6                :Integer;
    DB_ANALITIC7                :Integer;
    DB_ANALITIC8                :Integer;
    DB_ANALITIC9                :Integer;
    DB_ANALITIC10               :Integer;

    KR_ANALITIC1                :Integer;
    KR_ANALITIC2                :Integer;
    KR_ANALITIC3                :Integer;
    KR_ANALITIC4                :Integer;
    KR_ANALITIC5                :Integer;
    KR_ANALITIC6                :Integer;
    KR_ANALITIC7                :Integer;
    KR_ANALITIC8                :Integer;
    KR_ANALITIC9                :Integer;
    KR_ANALITIC10               :Integer;

    Mode  : Integer;
    PSTRU : PWIZARD_GET_PROV_INFO;
    constructor Create(VWIZARD_GET_PROV_INFO:PWIZARD_GET_PROV_INFO);overload;
    procedure Mode1(Step:Integer);
    procedure Mode2(Step:Integer);
    procedure Mode3(Step:Integer);
    procedure Mode11(Step:Integer);
    function Stepx1:Integer;
    function Stepx2:Integer;
    function Stepx3:Integer;
    function Stepx4(IsDbPart:Integer):Integer;
    function Stepx5(IsDbPart:Integer):Integer;
    function Stepx6(IsDbPart:Integer):Integer;
    function Stepx7(IsDbPart:Integer):Integer;
    function StepxAn(IsDbPart:Integer):Integer;
    procedure Main(Step:Integer);
    function CheckSm(IsDbPart:Integer):Boolean;
    function CheckRz(IsDbPart:Integer):Boolean;
    function CheckSt(IsDbPart:Integer):Boolean;
    function CheckKv(IsDbPart:Integer):Boolean;
    function CheckAn(IsDbPart:Integer):Boolean;
    function CheckSch:Boolean;
  end;


function RunWizard(VWIZARD_GET_PROV_INFO:PWIZARD_GET_PROV_INFO):Boolean;stdcall;
exports RunWizard;

implementation

uses GlobalSpr,GetProvInfoWizardBU,GetProvInfoWizardFaced, GetProvInfoWizardResources,
  FIBQuery, DB;

function RunWizard(VWIZARD_GET_PROV_INFO:PWIZARD_GET_PROV_INFO):Boolean;
var
     workForm:TfrmProvInfoWizard;
     Res:TModalResult;
     R:Boolean;
begin
     if VWIZARD_GET_PROV_INFO^.ID_LANGUAGE<>2
     then VWIZARD_GET_PROV_INFO^.ID_LANGUAGE:=1;
     VWIZARD_GET_PROV_INFO^.FACED_FLAG:=false;
     R:=False;

     if VWIZARD_GET_PROV_INFO^.MODE<>11
     then begin
          VWIZARD_GET_PROV_INFO^.DB_ANALIZE1 :=0;
          VWIZARD_GET_PROV_INFO^.DB_ANALIZE2 :=0;
          VWIZARD_GET_PROV_INFO^.DB_ANALIZE3 :=0;
          VWIZARD_GET_PROV_INFO^.DB_ANALIZE4 :=0;
          VWIZARD_GET_PROV_INFO^.DB_ANALIZE5 :=0;
          VWIZARD_GET_PROV_INFO^.DB_ANALIZE6 :=0;
          VWIZARD_GET_PROV_INFO^.DB_ANALIZE7 :=0;
          VWIZARD_GET_PROV_INFO^.DB_ANALIZE8 :=0;
          VWIZARD_GET_PROV_INFO^.DB_ANALIZE9 :=0;
          VWIZARD_GET_PROV_INFO^.DB_ANALIZE10:=0;

          VWIZARD_GET_PROV_INFO^.KR_ANALIZE1 :=0;
          VWIZARD_GET_PROV_INFO^.KR_ANALIZE2 :=0;
          VWIZARD_GET_PROV_INFO^.KR_ANALIZE3 :=0;
          VWIZARD_GET_PROV_INFO^.KR_ANALIZE4 :=0;
          VWIZARD_GET_PROV_INFO^.KR_ANALIZE5 :=0;
          VWIZARD_GET_PROV_INFO^.KR_ANALIZE6 :=0;
          VWIZARD_GET_PROV_INFO^.KR_ANALIZE7 :=0;
          VWIZARD_GET_PROV_INFO^.KR_ANALIZE8 :=0;
          VWIZARD_GET_PROV_INFO^.KR_ANALIZE9 :=0;
          VWIZARD_GET_PROV_INFO^.KR_ANALIZE10:=0;

          VWIZARD_GET_PROV_INFO^.EXIST_DB_AN:=false;
          VWIZARD_GET_PROV_INFO^.EXIST_KR_AN:=false;
     end;

     workForm:=TfrmProvInfoWizard.Create(VWIZARD_GET_PROV_INFO);
     workForm.ShowModal;
     if workForm.Work_result
     then R:=true
     else R:=false;

     //Identifies
     VWIZARD_GET_PROV_INFO^.DB_ID_SMETA:=workForm.tempID_DbSM;
     VWIZARD_GET_PROV_INFO^.DB_ID_RAZD :=workForm.tempID_DbRZ;
     VWIZARD_GET_PROV_INFO^.DB_ID_STAT :=workForm.tempID_DbST;
     VWIZARD_GET_PROV_INFO^.DB_ID_KEKV :=workForm.tempID_DbKV;
     VWIZARD_GET_PROV_INFO^.DB_ID_SM_GR:=workForm.tempID_DbGR;

     VWIZARD_GET_PROV_INFO^.KR_ID_SMETA:=workForm.tempID_KrSM;
     VWIZARD_GET_PROV_INFO^.KR_ID_RAZD :=workForm.tempID_KrRZ;
     VWIZARD_GET_PROV_INFO^.KR_ID_STAT :=workForm.tempID_KrST;
     VWIZARD_GET_PROV_INFO^.KR_ID_KEKV :=workForm.tempID_KrKV;
     VWIZARD_GET_PROV_INFO^.KR_ID_SM_GR:=workForm.tempID_KrGR;

     //Codes+Titles
     VWIZARD_GET_PROV_INFO^.DB_TITLE_SMETA:=workForm.edDBSm.Text;
     VWIZARD_GET_PROV_INFO^.DB_TITLE_RAZD :=workForm.edDbRz.Text;
     VWIZARD_GET_PROV_INFO^.DB_TITLE_STAT :=workForm.edDbSt.Text;
     VWIZARD_GET_PROV_INFO^.DB_KEKV_TITLE :=workForm.edDbKV.Text;

     VWIZARD_GET_PROV_INFO^.DB_KOD_SMETA  :=workForm.edDbSm_Kod_x;
     VWIZARD_GET_PROV_INFO^.DB_KOD_RAZD   :=workForm.edDbRz_Kod_x;
     VWIZARD_GET_PROV_INFO^.DB_KOD_STAT   :=workForm.edDbSt_Kod_x;
     VWIZARD_GET_PROV_INFO^.DB_KOD_KEKV   :=workForm.edDbKV_Kod_x;

     VWIZARD_GET_PROV_INFO^.KR_TITLE_SMETA:=workForm.edKrSm.Text;
     VWIZARD_GET_PROV_INFO^.KR_TITLE_RAZD :=workForm.edKrRz.Text;
     VWIZARD_GET_PROV_INFO^.KR_TITLE_STAT :=workForm.edKrSt.Text;
     VWIZARD_GET_PROV_INFO^.KR_KEKV_TITLE :=workForm.edKrKV.Text;

     VWIZARD_GET_PROV_INFO^.KR_KOD_SMETA  :=workForm.edKrSm_Kod_x;
     VWIZARD_GET_PROV_INFO^.KR_KOD_RAZD   :=workForm.edKrRz_Kod_x;
     VWIZARD_GET_PROV_INFO^.KR_KOD_STAT   :=workForm.edKrSt_Kod_x;
     VWIZARD_GET_PROV_INFO^.KR_KOD_KEKV   :=workForm.edKrKV_Kod_x;


     VWIZARD_GET_PROV_INFO^.KR_ID_SCH_KOD:=workForm.edKrSchNum.Text;
     VWIZARD_GET_PROV_INFO^.KR_ID_SCH_TIT:=workForm.edKrSchTitle.Text;
     VWIZARD_GET_PROV_INFO^.DB_ID_SCH_KOD:=workForm.edDBSchNum.Text;
     VWIZARD_GET_PROV_INFO^.DB_ID_SCH_TIT:=workForm.edDBSchTitle.Text;

     workForm.Free;
     Result:=R;
end;

{$R *.dfm}

constructor TfrmProvInfoWizard.Create(VWIZARD_GET_PROV_INFO:PWIZARD_GET_PROV_INFO);
begin
     inherited Create(VWIZARD_GET_PROV_INFO^.AOWNER);
     PSTRU:=VWIZARD_GET_PROV_INFO;
     Mode:=PSTRU^.MODE;
     WorkDatabase.Handle:=PSTRU^.DBHANDLE;
     ReadTransaction.StartTransaction;
end;

procedure TfrmProvInfoWizard.OKButtonClick(Sender: TObject);
begin
     Work_result:=true;
     ModalResult:=mrYes;
end;

procedure TfrmProvInfoWizard.FormShow(Sender: TObject);
begin
     self.Caption        :=GetProvInfoWizardResources.MAIN_FORM_TITLE[PSTRU^.ID_LANGUAGE];
     lbDBtitle.Caption   :=GetProvInfoWizardResources.MAIN_FORM_DB_TITLE[PSTRU^.ID_LANGUAGE];
     lbKrtitle.Caption   :=GetProvInfoWizardResources.MAIN_FORM_KR_TITLE[PSTRU^.ID_LANGUAGE];
     BackButton.Caption  :=GetProvInfoWizardResources.MAIN_FORM_BACK_BUTTON[PSTRU^.ID_LANGUAGE];
     OKButton.Caption    :=GetProvInfoWizardResources.MAIN_FORM_OK_BUTTON[PSTRU^.ID_LANGUAGE];
     CloseButton.Caption :=GetProvInfoWizardResources.MAIN_FORM_CLOSE_BUTTON[PSTRU^.ID_LANGUAGE];
     lbSchDb.Caption     :=GetProvInfoWizardResources.MAIN_FORM_SCH_TITLE[PSTRU^.ID_LANGUAGE];
     lbSchkr.Caption     :=GetProvInfoWizardResources.MAIN_FORM_SCH_TITLE[PSTRU^.ID_LANGUAGE];
     lbSmDb.Caption      :=GetProvInfoWizardResources.MAIN_FORM_SMT_TITLE[PSTRU^.ID_LANGUAGE];
     lbSmKr.Caption      :=GetProvInfoWizardResources.MAIN_FORM_SMT_TITLE[PSTRU^.ID_LANGUAGE];
     lbRzDb.Caption      :=GetProvInfoWizardResources.MAIN_FORM_RAZ_TITLE[PSTRU^.ID_LANGUAGE];
     lbRzKr.Caption      :=GetProvInfoWizardResources.MAIN_FORM_RAZ_TITLE[PSTRU^.ID_LANGUAGE];
     lbStDb.Caption      :=GetProvInfoWizardResources.MAIN_FORM_STA_TITLE[PSTRU^.ID_LANGUAGE];
     lbStKr.Caption      :=GetProvInfoWizardResources.MAIN_FORM_STA_TITLE[PSTRU^.ID_LANGUAGE];
     lbKVDb.Caption      :=GetProvInfoWizardResources.MAIN_FORM_KVZ_TITLE[PSTRU^.ID_LANGUAGE];
     lbKVKr.Caption      :=GetProvInfoWizardResources.MAIN_FORM_KVZ_TITLE[PSTRU^.ID_LANGUAGE];
     lbAnDb.Caption      :=GetProvInfoWizardResources.MAIN_FORM_AN_TITLE[PSTRU^.ID_LANGUAGE];
     lbAnKr.Caption      :=GetProvInfoWizardResources.MAIN_FORM_AN_TITLE[PSTRU^.ID_LANGUAGE];


     N1.Caption          :=GetProvInfoWizardResources.MAIN_FORM_POPUP1[PSTRU^.ID_LANGUAGE];
     N2.Caption          :=GetProvInfoWizardResources.MAIN_FORM_POPUP2[PSTRU^.ID_LANGUAGE];
     N3.Caption          :=GetProvInfoWizardResources.MAIN_FORM_POPUP3[PSTRU^.ID_LANGUAGE];
     N5.Caption          :=GetProvInfoWizardResources.MAIN_FORM_POPUP4[PSTRU^.ID_LANGUAGE];
     N6.Caption          :=GetProvInfoWizardResources.MAIN_FORM_POPUP5[PSTRU^.ID_LANGUAGE];
     N7.Caption          :=GetProvInfoWizardResources.MAIN_FORM_POPUP6[PSTRU^.ID_LANGUAGE];
     N4.Caption          :=GetProvInfoWizardResources.MAIN_FORM_POPUP7[PSTRU^.ID_LANGUAGE];

     Main(1);

     if edCr_by_dt
     then lbDBtitle.Caption:=lbDBtitle.Caption+'(!)'
     else lbKrtitle.Caption:=lbKrtitle.Caption+'(!)';

     //заполнение информации по счетам
     edDBSchNum.Text     := edDBSchNum_x;
     edDBSchTitle.Text   := edDBSchTitle_x;

     edKrSchNum.Text     := edKrSchNum_x;
     edKrSchTitle.Text   := edKrSchTitle_x;

     //заполнение информации по бюджетам
     edDBSm.Text         := edDbSm_x;
     edDBRz.Text         := edDbRz_x;
     edDbSt.Text         := edDbSt_x;
     edDBKV.Text         := edDbKV_x;

     edKrSm.Text         := edKrSm_x;
     edKrRz.Text         := edKrRz_x;
     edKrSt.Text         := edKrSt_x;
     edKrKV.Text         := edKrKV_x;

     edDBAn.Text         := edDbAn_x;
     edKrAn.Text         := edKrAn_x;
end;

procedure TfrmProvInfoWizard.Main(Step:Integer);
begin
    {Основной алгоритм работы мастера}
    if (Mode=1)  then Mode1(Step);
    if (Mode=11) then Mode11(Step);
    if (Mode=21) then Mode2(Step);
    if (Mode=22) then Mode2(Step);
    if (Mode=3)  then begin
                          // ShowMessage('1');
                           Mode3(Step);
                 end;
end;

procedure TfrmProvInfoWizard.Mode1(Step:Integer);
label Step1, Step2, Step3,Step4, Step5, Step6, Step7, Step8;
var   NextStepFlag:Integer;
begin
   NextStepFlag:=1;

   N1.Enabled:=false;
   N2.Enabled:=false;
   N3.Enabled:=true;
   N5.Enabled:=true;
   N6.Enabled:=true;

   if (Step=1) then goto Step1;
   if (Step=2) then goto Step2;
   if (Step=3) then goto Step3;
   if (Step=4) then goto Step4;
   if (Step=5) then goto Step5;
   if (Step=6) then goto Step6;
   if (Step=7) then goto Step7;
   if (Step=8) then goto Step8;


   Step1: NextStepFlag:=Stepx1;
   Step2: {Для данного режима этот шаг недоступен}
   Step3: if NextStepFlag=1 then NextStepFlag:=Stepx3;
   Step4: if not stop_work_with_bdgts
          then begin
                    if PSTRU^.NOT_DIF_BDG_FG
                    then begin
                              if NextStepFlag=1   then NextStepFlag:=Stepx4(-1);
                    end
                    else begin
                         if need_faced_part
                         then begin
                              if copy_db_bdg_from_faced_part
                              then begin
                                   if NextStepFlag=1 then NextStepFlag:=Stepx4(0);
                              end
                              else begin
                                   if NextStepFlag=1 then NextStepFlag:=Stepx4(1);
                              end;
                         end
                         else begin
                              if NextStepFlag=1 then NextStepFlag:=Stepx4(1);
                              if NextStepFlag=1 then NextStepFlag:=Stepx4(0);
                         end;
                    end;
          end;
   Step5: if not stop_work_with_bdgts
          then begin
                    if PSTRU^.NOT_DIF_BDG_FG
                    then begin
                         if NextStepFlag=1 then NextStepFlag:=Stepx5(-1);
                    end
                    else begin
                         if need_faced_part
                         then begin
                              if copy_db_bdg_from_faced_part
                              then begin
                                   if NextStepFlag=1 then NextStepFlag:=Stepx5(0);
                              end
                              else begin
                                   if NextStepFlag=1 then NextStepFlag:=Stepx5(1);
                              end;
                         end
                         else begin
                              if NextStepFlag=1 then NextStepFlag:=Stepx5(1);
                              if NextStepFlag=1 then NextStepFlag:=Stepx5(0);
                         end;
                    end;
          end;
   Step6: if not stop_work_with_bdgts
          then begin
                    if PSTRU^.NOT_DIF_BDG_FG
                    then begin
                         if NextStepFlag=1 then NextStepFlag:=Stepx6(-1);
                    end
                    else begin
                         if need_faced_part
                         then begin
                              if copy_db_bdg_from_faced_part
                              then begin
                                   if NextStepFlag=1 then NextStepFlag:=Stepx6(0);
                              end
                              else begin
                                   if NextStepFlag=1 then NextStepFlag:=Stepx6(1);
                              end;
                         end
                         else begin
                              if NextStepFlag=1 then NextStepFlag:=Stepx6(1);
                              if NextStepFlag=1 then NextStepFlag:=Stepx6(0);
                         end;
                    end;
          end;
   Step7: if not stop_work_with_bdgts
          then begin
                   if PSTRU^.NOT_DIF_BDG_FG
                   then begin
                        if NextStepFlag=1 then NextStepFlag:=Stepx7(-1);
                   end
                   else begin
                        if need_faced_part
                        then begin
                             if copy_db_bdg_from_faced_part
                             then begin
                                  if NextStepFlag=1 then NextStepFlag:=Stepx7(0);
                             end
                             else begin
                                  if NextStepFlag=1 then NextStepFlag:=Stepx7(1);
                             end;
                        end
                        else begin
                             if NextStepFlag=1 then NextStepFlag:=Stepx7(1);
                             if NextStepFlag=1 then NextStepFlag:=Stepx7(0);
                        end;
                   end;
          end;

   Step8: if NextStepFlag=1 then NextStepFlag:=StepxAn(1);
          if NextStepFlag=1 then NextStepFlag:=StepxAn(0);


   if not PSTRU^.WIZARD_FORM_SH
   then begin
        Work_result:=true;
        PostMessage(handle,WM_CLOSE,0,0);
   end;

end;

procedure TfrmProvInfoWizard.Mode11(Step:Integer);
label Step1, Step2, Step3,Step4, Step5, Step6, Step7, Step8;
var   NextStepFlag:Integer;
begin

   if (PSTRU^.CR_BY_DT=1)
   then begin
      edDBSchNum_x   :=PSTRU^.DB_ID_SCH_KOD;
      edDBSchTitle_x :=PSTRU^.DB_ID_SCH_TIT;
   end
   else begin
      edKRSchNum_x   :=PSTRU^.KR_ID_SCH_KOD;
      edKRSchTitle_x :=PSTRU^.KR_ID_SCH_TIT;
   end;

   NextStepFlag:=1;

   N1.Enabled:=false;
   N2.Enabled:=false;
   N3.Enabled:=true;
   N5.Enabled:=true;
   N6.Enabled:=true;

   if (Step=1) then goto Step1;
   if (Step=2) then goto Step2;
   if (Step=3) then goto Step3;
   if (Step=4) then goto Step4;
   if (Step=5) then goto Step5;
   if (Step=6) then goto Step6;
   if (Step=7) then goto Step7;
   if (Step=8) then goto Step8;


   Step1: NextStepFlag:=Stepx1;
   Step2: {Для данного режима этот шаг недоступен}
   Step3: if NextStepFlag=1
          then begin
               if CheckSch
               then NextStepFlag:=Stepx3;
          end;
   Step4: if not stop_work_with_bdgts
          then begin
                    if PSTRU^.NOT_DIF_BDG_FG
                    then begin

                              if NextStepFlag=1
                              then begin
                                   if (CheckSm(1))
                                   then NextStepFlag:=Stepx4(-1);
                              end;
                    end
                    else begin
                         if need_faced_part
                         then begin
                              if copy_db_bdg_from_faced_part
                              then begin
                                   if NextStepFlag=1
                                   then begin
                                        if CheckSm(0)
                                        then NextStepFlag:=Stepx4(0);
                                   end;
                              end
                              else begin
                                   if NextStepFlag=1
                                   then begin
                                        if CheckSm(1)
                                        then NextStepFlag:=Stepx4(1);
                                   end;
                              end;
                         end
                         else begin
                              if NextStepFlag=1
                              then begin
                                   if CheckSm(1)
                                   then NextStepFlag:=Stepx4(1);
                              end;
                              if NextStepFlag=1
                              then begin
                                   if CheckSm(0)
                                   then NextStepFlag:=Stepx4(0);
                              end;
                         end;
                    end;
          end;
   Step5: if not stop_work_with_bdgts
          then begin
                    if PSTRU^.NOT_DIF_BDG_FG
                    then begin
                         if NextStepFlag=1
                         then begin
                              if CheckRz(1)
                              then NextStepFlag:=Stepx5(-1);
                         end;
                    end
                    else begin
                         if need_faced_part
                         then begin
                              if copy_db_bdg_from_faced_part
                              then begin
                                   if NextStepFlag=1
                                   then begin
                                        if CheckRz(0)
                                        then NextStepFlag:=Stepx5(0);
                                   end;
                              end
                              else begin
                                   if NextStepFlag=1
                                   then begin
                                        if CheckRz(1)
                                        then NextStepFlag:=Stepx5(1);
                                   end;
                              end;
                         end
                         else begin
                              if NextStepFlag=1
                              then begin
                                   if CheckRz(1)
                                   then NextStepFlag:=Stepx5(1);
                              end;
                              if NextStepFlag=1
                              then begin
                                   if CheckRz(0)
                                   then NextStepFlag:=Stepx5(0);
                              end;
                         end;
                    end;
          end;
   Step6: if not stop_work_with_bdgts
          then begin
                    if PSTRU^.NOT_DIF_BDG_FG
                    then begin
                         if NextStepFlag=1
                         then begin
                              if CheckSt(1)
                              then NextStepFlag:=Stepx6(-1);
                         end;
                    end
                    else begin
                         if need_faced_part
                         then begin
                              if copy_db_bdg_from_faced_part
                              then begin
                                   if NextStepFlag=1
                                   then begin
                                        if CheckSt(0)
                                        then begin
                                             NextStepFlag:=Stepx6(0);
                                        end;
                                   end
                              end
                              else begin
                                   if NextStepFlag=1
                                   then begin
                                        if CheckSt(1)
                                        then NextStepFlag:=Stepx6(1);
                                   end;
                              end;
                         end
                         else begin
                              if NextStepFlag=1
                              then begin
                                   if CheckSt(1)
                                   then NextStepFlag:=Stepx6(1);
                              end;
                              if NextStepFlag=1
                              then begin
                                   if CheckSt(0)
                                   then NextStepFlag:=Stepx6(0);
                              end;
                         end;
                    end;
          end;
   Step7: if not stop_work_with_bdgts
          then begin
                   if PSTRU^.NOT_DIF_BDG_FG
                   then begin
                        if NextStepFlag=1
                        then begin
                             if CheckKv(1)
                             then NextStepFlag:=Stepx7(-1);
                        end;
                   end
                   else begin
                        if need_faced_part
                        then begin
                             if copy_db_bdg_from_faced_part
                             then begin
                                  if NextStepFlag=1
                                  then begin
                                       if CheckKv(0)
                                       then NextStepFlag:=Stepx7(0);
                                  end;
                             end
                             else begin
                                  if NextStepFlag=1
                                  then begin
                                       if Checkkv(1)
                                       then NextStepFlag:=Stepx7(1);
                                  end;
                             end;
                        end
                        else begin
                             if NextStepFlag=1
                             then begin
                                  if CheckKv(1)
                                  then NextStepFlag:=Stepx7(1);
                             end;
                             if NextStepFlag=1
                             then begin
                                  if CheckKv(0)
                                  then NextStepFlag:=Stepx7(0);
                             end;
                        end;
                   end;
          end;

   Step8: if NextStepFlag=1
          then begin
               if CheckAn(1)
               then NextStepFlag:=StepxAn(1);
          end;
          if NextStepFlag=1
          then begin
               if CheckAn(0)
               then NextStepFlag:=StepxAn(0);
          end;


   if not PSTRU^.WIZARD_FORM_SH
   then begin
        Work_result:=true;
        PostMessage(handle,WM_CLOSE,0,0);
   end;

end;



procedure TfrmProvInfoWizard.Mode2(Step:Integer);
label Step1, Step2, Step3,Step4, Step5, Step6, Step7, Step8;
var NextStepFlag:Integer;
begin
   NextStepFlag:=1;

   N1.Enabled:=false;
   N2.Enabled:=true;
   N3.Enabled:=true;
   N5.Enabled:=true;
   N6.Enabled:=true;

   if Step=1 then goto Step1;
   if Step=2 then goto Step2;
   if Step=3 then goto Step3;
   if Step=4 then goto Step4;
   if Step=5 then goto Step5;
   if Step=6 then goto Step6;
   if Step=7 then goto Step7;
   if Step=8 then goto Step8;

   //Получаем информацию о присланном счете

   Step1: NextStepFlag:=Stepx1;

   Step2: if NextStepFlag=1 then NextStepFlag:=Stepx2;

   Step3: if NextStepFlag=1 then NextStepFlag:=Stepx3;

   Step4: if not stop_work_with_bdgts
          then begin
                    if PSTRU^.NOT_DIF_BDG_FG
                    then begin
                         if NextStepFlag=1 then NextStepFlag:=Stepx4(-1);
                    end
                    else begin
                         if need_faced_part
                         then begin
                              if copy_db_bdg_from_faced_part
                              then begin
                                   if NextStepFlag=1 then NextStepFlag:=Stepx4(0);
                              end
                              else begin
                                   if NextStepFlag=1 then NextStepFlag:=Stepx4(1);
                              end;
                         end
                         else begin
                              if NextStepFlag=1 then NextStepFlag:=Stepx4(1);
                              if NextStepFlag=1 then NextStepFlag:=Stepx4(0);
                         end;
                    end;;
          end;
   Step5: if not stop_work_with_bdgts
          then begin
                    if PSTRU^.NOT_DIF_BDG_FG
                    then begin
                         if NextStepFlag=1 then NextStepFlag:=Stepx5(-1);
                    end
                    else begin
                         if need_faced_part
                         then begin
                              if copy_db_bdg_from_faced_part
                              then begin
                                   if NextStepFlag=1 then NextStepFlag:=Stepx5(0);
                              end
                              else begin
                                   if NextStepFlag=1 then NextStepFlag:=Stepx5(1);
                              end;
                         end
                         else begin
                              if NextStepFlag=1 then NextStepFlag:=Stepx5(1);
                              if NextStepFlag=1 then NextStepFlag:=Stepx5(0);
                         end;
                    end;
          end;
   Step6: if not stop_work_with_bdgts
          then begin
                    if PSTRU^.NOT_DIF_BDG_FG
                    then begin
                         if NextStepFlag=1 then NextStepFlag:=Stepx6(-1);
                    end
                    else begin
                         if need_faced_part
                         then begin
                              if copy_db_bdg_from_faced_part
                              then begin
                                   if NextStepFlag=1 then NextStepFlag:=Stepx6(0);
                              end
                              else begin
                                   if NextStepFlag=1 then NextStepFlag:=Stepx6(1);
                              end;
                         end
                         else begin
                              if NextStepFlag=1 then NextStepFlag:=Stepx6(1);
                              if NextStepFlag=1 then NextStepFlag:=Stepx6(0);
                         end;
                    end;
          end;

   Step7: if not stop_work_with_bdgts
          then begin
                    if PSTRU^.NOT_DIF_BDG_FG
                    then begin
                         if NextStepFlag=1 then NextStepFlag:=Stepx7(-1);
                    end
                    else begin
                         if need_faced_part
                         then begin
                              if copy_db_bdg_from_faced_part
                              then begin
                                   if NextStepFlag=1 then NextStepFlag:=Stepx7(0);
                              end
                              else begin
                                   if NextStepFlag=1 then NextStepFlag:=Stepx7(1);
                              end;
                         end
                         else begin
                              if NextStepFlag=1 then NextStepFlag:=Stepx7(1);
                              if NextStepFlag=1 then NextStepFlag:=Stepx7(0);
                         end;
                    end;
          end;

   Step8: if NextStepFlag=1 then NextStepFlag:=StepxAn(1);
          if NextStepFlag=1 then NextStepFlag:=StepxAn(0);

   if not PSTRU^.WIZARD_FORM_SH
   then begin
        Work_result:=true;
        PostMessage(handle,WM_CLOSE,0,0);
   end;

end;


procedure TfrmProvInfoWizard.Mode3(Step: Integer);
label Step1, Step2, Step3,Step4, Step5, Step6, Step7;
  var NextStepFlag:Integer;
      default_values :TpfibDataSet;
begin
   NextStepFlag:=1;
   default_values            :=TpfibDataSet.Create(self);
   default_values.Database   :=WorkDatabase;
   default_values.Transaction:=ReadTransaction;
   default_values.SelectSQL.Text:=' SELECT * FROM MBOOK_INI_DATA_SELECT ';
   default_values.Open;
   if default_values.FieldByName('USE_DEFAULT_VALUES').AsInteger=0
   then begin
          N1.Enabled:=false;
          N2.Enabled:=false;
          N3.Enabled:=true;
          N5.Enabled:=true;
          N6.Enabled:=true;

          if Step=1 then goto Step1;
          if Step=2 then goto Step2;
          if Step=3 then goto Step3;
          if Step=4 then goto Step4;
          if Step=5 then goto Step5;
          if Step=6 then goto Step6;

          //Получаем информацию о присланном счете


          Step1: {}

          Step2: {}

          Step3: {}

          Step4: if NextStepFlag=1 then NextStepFlag:=Stepx4(-1);

          Step5: if NextStepFlag=1 then NextStepFlag:=Stepx5(-1);

          Step6: if NextStepFlag=1 then NextStepFlag:=Stepx6(-1);

          Step7: if NextStepFlag=1 then NextStepFlag:=Stepx7(-1);

          if not PSTRU^.WIZARD_FORM_SH
          then PostMessage(handle,WM_CLOSE,0,0);

   end
   else begin
              tempID_DbSM     :=default_values.FieldByName('DEFAULT_SMETA').Value;
              edDBSm_x        :=default_values.FieldByName('DEFAULT_SMETA_TITLE').AsString;
              tempID_DbRZ     :=default_values.FieldByName('DEFAULT_RAZD').Value;
              edDbRz_x        :=default_values.FieldByName('DEFAULT_RAZD_TITLE').AsString;
              tempID_DbST     :=default_values.FieldByName('DEFAULT_ST').Value;
              edDbSt_x        :=default_values.FieldByName('DEFAULT_ST_TITLE').AsString;
              tempID_DbKV     :=default_values.FieldByName('DEFAULT_KEKV').Value;
              edDbKV_x        :=default_values.FieldByName('DEFAULT_KEKV_TITLE').AsString;

              tempID_KrSM     :=default_values.FieldByName('DEFAULT_SMETA').Value;
              edKrSm_x        :=default_values.FieldByName('DEFAULT_SMETA_TITLE').AsString;
              tempID_KrRZ     :=default_values.FieldByName('DEFAULT_RAZD').Value;
              edKrRz_x        :=default_values.FieldByName('DEFAULT_RAZD_TITLE').AsString;
              tempID_KrST     :=default_values.FieldByName('DEFAULT_ST').Value;
              edKrSt_x        :=default_values.FieldByName('DEFAULT_ST_TITLE').AsString;
              tempID_KrKV     :=default_values.FieldByName('DEFAULT_KEKV').Value;
              edKrKV_x        :=default_values.FieldByName('DEFAULT_KEKV_TITLE').AsString;

              if not PSTRU^.WIZARD_FORM_SH
              then begin
                   Work_result:=true;
                   PostMessage(handle,WM_CLOSE,0,0);
              end;
   end;
   default_values.Free;
end;

procedure TfrmProvInfoWizard.N1Click(Sender: TObject);
begin
    if (Mode=1)  then Mode1(1);
    if (Mode=2)  then Mode2(1);
    if (Mode=3)  then Mode3(1);
end;

procedure TfrmProvInfoWizard.N2Click(Sender: TObject);
begin
    if (Mode=1)  then Mode1(2);
    if (Mode=2)  then Mode2(2);
    if (Mode=3)  then Mode3(2);
end;

procedure TfrmProvInfoWizard.N3Click(Sender: TObject);
begin
    if (Mode=1)  then Mode1(3);
    if (Mode=2)  then Mode2(3);
    if (Mode=3)  then Mode3(3);
end;

procedure TfrmProvInfoWizard.N5Click(Sender: TObject);
begin
    if (Mode=1)  then Mode1(4);
    if (Mode=2)  then Mode2(4);
    if (Mode=3)  then Mode3(4);
end;

function TfrmProvInfoWizard.Stepx1:Integer;
begin
     if (PSTRU^.CR_BY_DT=1) then edCr_by_dt:=true
                            else edCr_by_dt:=false;

     Result:=1;
end;

function TfrmProvInfoWizard.Stepx2:Integer;
    var CBUForm:TfrmChooseBUObjects;
        Res:TModalResult;
        RB:Integer;
        Sp:ControlsArray;
begin
         stop_work_with_bdgts:=false;
         CBUForm:=TfrmChooseBUObjects.Create(self,4,tempID_SCH,0,-1);
         SetLength(Sp,2);


         if (PSTRU^.CR_BY_DT=1)
         then begin
              Sp[0]:=CBUForm.edDBSchNum;
              Sp[1]:=CBUForm.edDBSchTitle;
         end
         else begin
              Sp[0]:=CBUForm.edKrSchNum;
              Sp[1]:=CBUForm.edKrSchTitle;
         end;


         CBUForm.SplashEdit:=Sp;
         Res:=CBUForm.ShowModal;
         if Res=mrYes
         then begin
              tempID_SCH:=CBUForm.ObjectsDataSet.FieldByName('ID_OBJECT').Value;
              if (PSTRU^.CR_BY_DT=1)
              then begin
                 edDBSchNum_x   :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString;
                 edDBSchTitle_x :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;
                 PSTRU^.DB_ID_SCH:=tempID_SCH;
              end
              else begin
                 edKRSchNum_x   :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString;
                 edKRSchTitle_x :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;
                 PSTRU^.KR_ID_SCH:=tempID_SCH;
              end;
              RB:=1;
         end;
         CBUForm.Free;
         Sp:=nil;
         if Res=mrNoToAll
         then rb:=-1;

         result:=rb;
end;

function TfrmProvInfoWizard.Stepx3:Integer;
var tempDataSet:TpFibDataSet;
    CBUForm:TfrmChooseBUObjects;
    Res,Faced:TModalResult;
    RB :Integer;
    GetOperInfo:TpFibStoredProc;
    frmGetFaced: TfrmGetFaced;
    default_values:TpfibDataSet;
    Sp:ControlsArray;
begin
   stop_work_with_bdgts:=false;
   if (tempID_SCH=0) 
   then begin
        if (PSTRU.MODE=1)
        then tempID_SCH:=PSTRU^.ID_SCH_IN;

        if (PSTRU^.MODE in [21,22])
        then begin
           if PSTRU^.CR_BY_DT=1
           then tempID_SCH:=PSTRU^.DB_ID_SCH
           else tempID_SCH:=PSTRU^.KR_ID_SCH
        end;

        if (PSTRU^.MODE =11)
        then begin
           if PSTRU^.SCH_SET_FLAG=1
           then tempID_SCH:=PSTRU^.DB_ID_SCH
           else tempID_SCH:=PSTRU^.KR_ID_SCH
        end;
   end;

   if (Mode=1)
   then begin
        tempDataSet:=TpFibDataSet.Create(self);
        tempDataSet.Database      :=WorkDatabase;
        tempDataSet.Transaction   :=ReadTransaction;
        tempDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_SCH_INFO('+''''+DateTimeToStr(PSTRU^.ACTUAL_DATE)+''''+','+IntToStr(tempID_SCH)+')';
        tempDataSet.Open;

        if (PSTRU^.SCH_SET_FLAG=1)
        then begin
           edDBSchNum_x  :=tempDataSet.FieldByName('SCH_NUMBER').AsString;
           edDBSchTitle_x:=tempDataSet.FieldByName('SCH_TITLE').AsString;
           PSTRU^.DB_ID_SCH :=tempID_SCH;
           tempID_SCH_for_corr:=PSTRU^.KR_ID_SCH;
        end
        else begin
           edKRSchNum_x  :=tempDataSet.FieldByName('SCH_NUMBER').AsString;
           edKRSchTitle_x:=tempDataSet.FieldByName('SCH_TITLE').AsString;
           PSTRU^.KR_ID_SCH :=tempID_SCH;
           tempID_SCH_for_corr:=PSTRU^.KR_ID_SCH;
        end;
        tempDataSet.Free;
   end;

   //Выбираем счет для корреспонденции
   CBUForm:=TfrmChooseBUObjects.Create(self,5,tempID_SCH_for_corr,0,-1);
   SetLength(Sp,2);

   if (Mode=1)
   then begin
        if (PSTRU^.SCH_SET_FLAG=1)
        then begin
             Sp[0]:=CBUForm.edKrSchNum;
             Sp[1]:=CBUForm.edKrSchTitle;
        end
        else begin
             Sp[0]:=CBUForm.edDbSchNum;
             Sp[1]:=CBUForm.edDbSchTitle;
        end;
   end
   else begin
        if (PSTRU^.CR_BY_DT=1)
        then begin
             Sp[0]:=CBUForm.edKrSchNum;
             Sp[1]:=CBUForm.edKrSchTitle;
        end
        else begin
             Sp[0]:=CBUForm.edDbSchNum;
             Sp[1]:=CBUForm.edDbSchTitle;
        end;
   end;
   CBUForm.SplashEdit:=Sp;

   Res:=CBUForm.ShowModal;
   if Res=mrYes
   then begin
           tempID_SCH_for_corr:=CBUForm.ObjectsDataSet.FieldByName('ID_OBJECT').Value;

           if (Mode=1)
           then begin
                if (PSTRU^.SCH_SET_FLAG=1)
                then begin
                     edKRSchNum_x  :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString;
                     edKRSchTitle_x:=CBUForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;
                     PSTRU^.KR_ID_SCH :=tempID_SCH_for_corr;
                end
                else begin
                     edDBSchNum_x  :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString;
                     edDBSchTitle_x:=CBUForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;
                     PSTRU^.DB_ID_SCH :=tempID_SCH_for_corr;
                end;
           end
           else begin
                if (PSTRU^.CR_BY_DT=1)
                then begin
                     edKRSchNum_x  :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString;
                     edKRSchTitle_x:=CBUForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;
                     PSTRU^.KR_ID_SCH :=tempID_SCH_for_corr;
                end
                else begin
                     edDBSchNum_x  :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString;
                     edDBSchTitle_x:=CBUForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString;
                     PSTRU^.DB_ID_SCH :=tempID_SCH_for_corr;
                end;
           end;
           RB:=1;
    end;

    if Res<>mrYes then RB:=-1;

    CBUForm.Free;



    default_values            :=TpfibDataSet.Create(self);
    default_values.Database   :=WorkDatabase;
    default_values.Transaction:=ReadTransaction;
    default_values.SelectSQL.Text:=' SELECT * FROM MBOOK_INI_DATA_SELECT ';
    default_values.Open;
    showmessage('1');
    if default_values.FieldByName('USE_DEFAULT_VALUES').AsInteger=0
    then begin
              showmessage('2');
              GetOperInfo               :=TpFibStoredProc.Create(self);
              GetOperInfo.Database      :=WorkDatabase;
              GetOperInfo.Transaction   :=ReadTransaction;
              GetOperInfo.StoredProcName:='PUB_SP_MAIN_OPER_SELECT_EX2';
              GetOperInfo.Prepare;
              GetOperInfo.ParamByName('P_ACTUAL_DATE').Value:=PSTRU^.ACTUAL_DATE;
              GetOperInfo.ParamByName('P_ID_KR_SCH').AsInt64:=PSTRU^.KR_ID_SCH;
              GetOperInfo.ParamByName('P_ID_DB_SCH').AsInt64:=PSTRU^.DB_ID_SCH;
              GetOperInfo.ExecProc;
              PSTRU^.ID_OPER:=GetOperInfo.ParamByName('ID_OPER').AsInt64;

              IF ((GetOperInfo.ParamByName('OPER_KR_CR_PROV').AsInteger=1) and (PSTRU^.CR_BY_DT=1))
              or ((GetOperInfo.ParamByName('OPER_DB_CR_PROV').AsInteger=1) and (PSTRU^.CR_BY_DT=0))
              then begin
                       //Документ требует встречную проводку
                       showmessage('3');
                       need_faced_part          :=true;
                       frmGetFaced:=TfrmGetFaced.Create(self);
                       frmGetFaced.ID_OPER:=PSTRU^.ID_OPER;
                       frmGetFaced.ACTUAL_DATE:=PSTRU^.ACTUAL_DATE;
                       Faced:=frmGetFaced.ShowModal;
                       if Faced=mrYes
                       then begin
                                PSTRU^.FACED_FLAG:=true;
                                if PSTRU^.NOT_DIF_BDG_FG
                                then begin
                                     tempID_DbGR     :=frmGetFaced.FacedDataSet.FieldByName('ID_SM_GR').Value;
                                     tempID_DbSM     :=frmGetFaced.FacedDataSet.FieldByName('ID_SM').Value;
                                     edDbSm_x        :='№ '+frmGetFaced.FacedDataSet.FieldByName('SM_KOD').AsString+' "'+frmGetFaced.FacedDataSet.FieldByName('SM_V').AsString+'"';
                                     edDbSm_Kod_x    :=frmGetFaced.FacedDataSet.FieldByName('SM_KOD').Value;
                                     tempID_DbRZ     :=frmGetFaced.FacedDataSet.FieldByName('ID_RZ').Value;
                                     edDbRz_x        :='№ '+frmGetFaced.FacedDataSet.FieldByName('RZ_KOD').AsString+' "'+frmGetFaced.FacedDataSet.FieldByName('RZ_V').AsString+'"';
                                     edDbRz_Kod_x    :=frmGetFaced.FacedDataSet.FieldByName('RZ_KOD').Value;
                                     tempID_DbST     :=frmGetFaced.FacedDataSet.FieldByName('ID_ST').Value;
                                     edDbSt_x        :='№ '+frmGetFaced.FacedDataSet.FieldByName('ST_KOD').AsString+' "'+frmGetFaced.FacedDataSet.FieldByName('ST_V').AsString+'"';
                                     edDbSt_Kod_x    :=frmGetFaced.FacedDataSet.FieldByName('ST_KOD').Value;
                                     tempID_DbKV     :=frmGetFaced.FacedDataSet.FieldByName('ID_KV').Value;
                                     edDbKV_x        :='№ '+frmGetFaced.FacedDataSet.FieldByName('KV_KOD').AsString+' "'+frmGetFaced.FacedDataSet.FieldByName('KV_V').AsString+'"';
                                     edDbKv_Kod_x    :=frmGetFaced.FacedDataSet.FieldByName('KV_KOD').Value;

                                     tempID_KrGR     :=frmGetFaced.FacedDataSet.FieldByName('ID_SM_GR').Value;
                                     tempID_KrSM     :=frmGetFaced.FacedDataSet.FieldByName('ID_SM').Value;
                                     edKrSm_x        :='№ '+frmGetFaced.FacedDataSet.FieldByName('SM_KOD').AsString+' "'+frmGetFaced.FacedDataSet.FieldByName('SM_V').AsString+'"';
                                     edKrSm_Kod_x    :=frmGetFaced.FacedDataSet.FieldByName('SM_KOD').Value;
                                     tempID_KrRZ     :=frmGetFaced.FacedDataSet.FieldByName('ID_RZ').Value;
                                     edKrRz_x        :='№ '+frmGetFaced.FacedDataSet.FieldByName('RZ_KOD').AsString+' "'+frmGetFaced.FacedDataSet.FieldByName('RZ_V').AsString+'"';
                                     edKrRz_Kod_x    :=frmGetFaced.FacedDataSet.FieldByName('RZ_KOD').Value;
                                     tempID_KrST     :=frmGetFaced.FacedDataSet.FieldByName('ID_ST').Value;
                                     edKrSt_x        :='№ '+frmGetFaced.FacedDataSet.FieldByName('ST_KOD').AsString+' "'+frmGetFaced.FacedDataSet.FieldByName('ST_V').AsString+'"';
                                     edKrSt_Kod_x    :=frmGetFaced.FacedDataSet.FieldByName('ST_KOD').Value;
                                     tempID_KrKV     :=frmGetFaced.FacedDataSet.FieldByName('ID_KV').Value;
                                     edKrKV_x        :='№ '+frmGetFaced.FacedDataSet.FieldByName('KV_KOD').AsString+' "'+frmGetFaced.FacedDataSet.FieldByName('KV_V').AsString+'"';
                                     edKrKv_Kod_x    :=frmGetFaced.FacedDataSet.FieldByName('KV_KOD').Value;

                                     stop_work_with_bdgts:=true;
                                end
                                else begin

                                     if GetOperInfo.ParamByName('OPER_DB_CR_PROV').AsInteger=1
                                     then begin
                                           copy_db_bdg_from_faced_part :=true;
                                           tempID_DbGR     :=frmGetFaced.FacedDataSet.FieldByName('ID_SM_GR').Value;
                                           tempID_DbSM     :=frmGetFaced.FacedDataSet.FieldByName('ID_SM').Value;
                                           edDbSm_x        :='№ '+frmGetFaced.FacedDataSet.FieldByName('SM_KOD').AsString+' "'+frmGetFaced.FacedDataSet.FieldByName('SM_V').AsString+'"';
                                           edDbSm_Kod_x    :=frmGetFaced.FacedDataSet.FieldByName('SM_KOD').Value;
                                           tempID_DbRZ     :=frmGetFaced.FacedDataSet.FieldByName('ID_RZ').Value;
                                           edDbRz_x        :='№ '+frmGetFaced.FacedDataSet.FieldByName('RZ_KOD').AsString+' "'+frmGetFaced.FacedDataSet.FieldByName('RZ_V').AsString+'"';
                                           edDbRz_Kod_x    :=frmGetFaced.FacedDataSet.FieldByName('RZ_KOD').Value;
                                           tempID_DbST     :=frmGetFaced.FacedDataSet.FieldByName('ID_ST').Value;
                                           edDbSt_x        :='№ '+frmGetFaced.FacedDataSet.FieldByName('ST_KOD').AsString+' "'+frmGetFaced.FacedDataSet.FieldByName('ST_V').AsString+'"';
                                           edDbSt_Kod_x    :=frmGetFaced.FacedDataSet.FieldByName('ST_KOD').Value;
                                           tempID_DbKV     :=frmGetFaced.FacedDataSet.FieldByName('ID_KV').Value;
                                           edDbKV_x        :='№ '+frmGetFaced.FacedDataSet.FieldByName('KV_KOD').AsString+' "'+frmGetFaced.FacedDataSet.FieldByName('KV_V').AsString+'"';
                                           edDbKv_Kod_x    :=frmGetFaced.FacedDataSet.FieldByName('KV_KOD').Value;
                                     end
                                     else begin
                                           copy_db_bdg_from_faced_part :=false;
                                           tempID_KrGR     :=frmGetFaced.FacedDataSet.FieldByName('ID_SM_GR').Value;
                                           tempID_KrSM     :=frmGetFaced.FacedDataSet.FieldByName('ID_SM').Value;
                                           edKrSm_x        :='№ '+frmGetFaced.FacedDataSet.FieldByName('SM_KOD').AsString+' "'+frmGetFaced.FacedDataSet.FieldByName('SM_V').AsString+'"';
                                           edKrSm_Kod_x    :=frmGetFaced.FacedDataSet.FieldByName('SM_KOD').Value;
                                           tempID_KrRZ     :=frmGetFaced.FacedDataSet.FieldByName('ID_RZ').Value;
                                           edKrRz_x        :='№ '+frmGetFaced.FacedDataSet.FieldByName('RZ_KOD').AsString+' "'+frmGetFaced.FacedDataSet.FieldByName('RZ_V').AsString+'"';
                                           edKrRz_Kod_x    :=frmGetFaced.FacedDataSet.FieldByName('RZ_KOD').Value;
                                           tempID_KrST     :=frmGetFaced.FacedDataSet.FieldByName('ID_ST').Value;
                                           edKrSt_x        :='№ '+frmGetFaced.FacedDataSet.FieldByName('ST_KOD').AsString+' "'+frmGetFaced.FacedDataSet.FieldByName('ST_V').AsString+'"';
                                           edKrSt_Kod_x    :=frmGetFaced.FacedDataSet.FieldByName('ST_KOD').Value;
                                           tempID_KrKV     :=frmGetFaced.FacedDataSet.FieldByName('ID_KV').Value;
                                           edKrKV_x        :='№ '+frmGetFaced.FacedDataSet.FieldByName('KV_KOD').AsString+' "'+frmGetFaced.FacedDataSet.FieldByName('KV_V').AsString+'"';
                                           edKrKv_Kod_x    :=frmGetFaced.FacedDataSet.FieldByName('KV_KOD').Value;
                                     end;
                                end;

                                PSTRU^.FACED_ID_DOC    :=StrToInt64(frmGetFaced.FacedDataSet.FieldByName('ID_DOC').asString);
                                PSTRU^.FACED_ID_PROV   :=StrToInt64(frmGetFaced.FacedDataSet.FieldByName('ID_PROV').AsString);
                                PSTRU^.FACED_CR_BY_DT  :=frmGetFaced.FacedDataSet.FieldByName('CR_BY_DT').AsInteger;
                                PSTRU^.FACED_PROV_SUMMA:=frmGetFaced.FacedDataSet.FieldByName('SUMMA_PROV').AsCurrency;
                                PSTRU^.FACED_ID_DOG    :=StrToInt64(frmGetFaced.FacedDataSet.FieldByName('ID_DOG').AsString);
                                PSTRU^.FACED_KOD_DOG   :=StrToInt64(frmGetFaced.FacedDataSet.FieldByName('KOD_DOG').AsString);
                                PSTRU^.FACED_ID_MAN    :=StrToInt64(frmGetFaced.FacedDataSet.FieldByName('ID_MEN').AsString);
                                PSTRU^.FACED_ID_PAYER  :=StrToInt64(frmGetFaced.FacedDataSet.FieldByName('ID_PAYER').AsString);
                                res:=mrNone;
                       end;
                       frmGetFaced.Free;

                       if Faced=mrNoToAll
                       then Res:=Faced;
              end
              else begin
                   need_faced_part          :=false;
                   Res:=mrYes;
              end;

              GetOperInfo.Free;

              if {Res=mrNoToAll}rb=-1
              then begin
                   if Mode<>1 then main(2);
                   rb:=-1;
              end

    end
    else begin
              tempID_DbSM     :=default_values.FieldByName('DEFAULT_SMETA').Value;
              edDBSm_x        :=default_values.FieldByName('DEFAULT_SMETA_TITLE').AsString;
              tempID_DbRZ     :=default_values.FieldByName('DEFAULT_RAZD').Value;
              edDbRz_x        :=default_values.FieldByName('DEFAULT_RAZD_TITLE').AsString;
              tempID_DbST     :=default_values.FieldByName('DEFAULT_ST').Value;
              edDbSt_x        :=default_values.FieldByName('DEFAULT_ST_TITLE').AsString;
              tempID_DbKV     :=default_values.FieldByName('DEFAULT_KEKV').Value;
              edDbKV_x        :=default_values.FieldByName('DEFAULT_KEKV_TITLE').AsString;

              tempID_KrSM     :=default_values.FieldByName('DEFAULT_SMETA').Value;
              edKrSm_x        :=default_values.FieldByName('DEFAULT_SMETA_TITLE').AsString;
              tempID_KrRZ     :=default_values.FieldByName('DEFAULT_RAZD').Value;
              edKrRz_x        :=default_values.FieldByName('DEFAULT_RAZD_TITLE').AsString;
              tempID_KrST     :=default_values.FieldByName('DEFAULT_ST').Value;
              edKrSt_x        :=default_values.FieldByName('DEFAULT_ST_TITLE').AsString;
              tempID_KrKV     :=default_values.FieldByName('DEFAULT_KEKV').Value;
              edKrKV_x        :=default_values.FieldByName('DEFAULT_KEKV_TITLE').AsString;


              stop_work_with_bdgts:=true;
              rb:=-1;
    end;
    default_values.Free;
    Result:=rb;

end;

function TfrmProvInfoWizard.Stepx4(IsDbPart:Integer):Integer;
    var CBUForm:TfrmChooseBUObjects;
    Res:TModalResult;
    RB:Integer;
    Sp:ControlsArray;
begin
    if Mode=3
    then CBUForm:=TfrmChooseBUObjects.Create(self,1,0,0,IsDbPart)
    else CBUForm:=TfrmChooseBUObjects.Create(self,1,0,tempID_SCH_for_corr,IsDbPart);

    if PSTRU^.NOT_DIF_BDG_FG
    then begin
          SetLength(Sp,2);
          Sp[0]:=CBUForm.edKrSm;
          Sp[1]:=CBUForm.edDbSm;
    end
    else begin
          if IsDbPart=1
          then begin
               SetLength(Sp,1);
               Sp[0]:=CBUForm.edDbSm;
          end
          else begin
               SetLength(Sp,1);
               Sp[0]:=CBUForm.edKrSm;
          end;
    end;
    CBUForm.SplashEdit:=Sp;

    Res:=CBUForm.ShowModal;
    if Res=mrYes
    then begin
         if PSTRU^.NOT_DIF_BDG_FG
         then begin
               if (edDbSm_x<>'№ '+CBUForm.ObjectsDataSet.FieldByName('SMETA_KOD').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString+'"')
               then begin
                   edDbRz_x:='';
                   edKrRz_x:='';
                   edDbSt_x:='';
                   edKrSt_x:='';
               end;

               tempID_DbGR     :=CBUForm.ObjectsDataSet.FieldByName('ID_SM_GROUP').Value;
               tempID_DbSM     :=CBUForm.ObjectsDataSet.FieldByName('ID_SMETA').Value;
               edDbSm_x        :='№ '+CBUForm.ObjectsDataSet.FieldByName('SMETA_KOD').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString+'"';
               edDbSm_Kod_x    :=CBUForm.ObjectsDataSet.FieldByName('SMETA_KOD').Value;

               tempID_KrGR     :=CBUForm.ObjectsDataSet.FieldByName('ID_SM_GROUP').Value;
               tempID_KrSM     :=CBUForm.ObjectsDataSet.FieldByName('ID_SMETA').Value;
               edKrSm_x        :='№ '+CBUForm.ObjectsDataSet.FieldByName('SMETA_KOD').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString+'"';
               edKrSm_Kod_x    :=CBUForm.ObjectsDataSet.FieldByName('SMETA_KOD').Value;
         end
         else begin
               if IsDbPart=1
               then begin
                    if (edDbSm_x<>'№ '+CBUForm.ObjectsDataSet.FieldByName('SMETA_KOD').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString+'"')
                    then begin
                        edDbRz_x:='';
                        edDbSt_x:='';
                    end;
                    tempID_DbGR     :=CBUForm.ObjectsDataSet.FieldByName('ID_SM_GROUP').Value;
                    tempID_DbSM     :=CBUForm.ObjectsDataSet.FieldByName('ID_SMETA').Value;
                    edDbSm_x          :='№ '+CBUForm.ObjectsDataSet.FieldByName('SMETA_KOD').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString+'"';
                    edDbSm_Kod_x    :=CBUForm.ObjectsDataSet.FieldByName('SMETA_KOD').Value;
               end
               else begin
                    if (edKrSm_x<>'№ '+CBUForm.ObjectsDataSet.FieldByName('SMETA_KOD').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString+'"')
                    then begin
                        edKrRz_x:='';
                        edKrSt_x:='';
                    end;
                    tempID_KrGR     :=CBUForm.ObjectsDataSet.FieldByName('ID_SM_GROUP').Value;
                    tempID_KrSM     :=CBUForm.ObjectsDataSet.FieldByName('ID_SMETA').Value;
                    edKrSm_x          :='№ '+CBUForm.ObjectsDataSet.FieldByName('SMETA_KOD').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('SMETA_TITLE').AsString+'"';
                    edKrSm_Kod_x    :=CBUForm.ObjectsDataSet.FieldByName('SMETA_KOD').Value;
               end;
         end;
         RB:=1;
    end;
    CBUForm.Free;
    if Res=mrNoToAll
    then begin
         if (Mode<>3) then main(3);
         RB:=-1;
    end;
    Result:=rb;
end;

function TfrmProvInfoWizard.Stepx5(IsDbPart:Integer):Integer;
var CBUForm:TfrmChooseBUObjects;
    Res:TModalResult;
    RB:Integer;
    Sp:ControlsArray;
begin
         if IsDbPart=0  then CBUForm:=TfrmChooseBUObjects.Create(self,2,tempID_KrRZ,tempID_KrSM,IsDbPart);
         if IsDbPart=1  then CBUForm:=TfrmChooseBUObjects.Create(self,2,tempID_DbRZ,tempID_DbSM,IsDbPart);
         if IsDbPart=-1 then CBUForm:=TfrmChooseBUObjects.Create(self,2,tempID_DbRZ,tempID_DbSM,IsDbPart);

         if PSTRU^.NOT_DIF_BDG_FG
         then begin
               SetLength(Sp,2);
               Sp[0]:=CBUForm.edKrRz;
               Sp[1]:=CBUForm.edDbRz;
         end
         else begin
               if IsDbPart=1
               then begin
                    SetLength(Sp,1);
                    Sp[0]:=CBUForm.edDbRz;
               end
               else begin
                    SetLength(Sp,1);
                    Sp[0]:=CBUForm.edKrRz;
               end;
         end;
         CBUForm.SplashEdit:=Sp;
         Res:=CBUForm.ShowModal;
         if Res=mrYes
         then begin
              if PSTRU^.NOT_DIF_BDG_FG
              then begin
                   tempID_DbRZ:=CBUForm.ObjectsDataSet.FieldByName('ID_OBJECT').Value;
                   edDbRz_x     :='№ '+CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString+'"';
                   edDbRz_Kod_x    :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;

                   tempID_KrRZ:=CBUForm.ObjectsDataSet.FieldByName('ID_OBJECT').Value;
                   edKrRz_x     :='№ '+CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString+'"';
                   edKrRz_Kod_x    :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
              end
              else begin
                    if IsDbPart=1
                    then begin
                         tempID_DbRZ:=CBUForm.ObjectsDataSet.FieldByName('ID_OBJECT').Value;
                         edDbRz_x     :='№ '+CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString+'"';
                         edDbRz_Kod_x    :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                    end
                    else begin
                         tempID_KrRZ:=CBUForm.ObjectsDataSet.FieldByName('ID_OBJECT').Value;
                         edKrRz_x   :='№ '+CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString+'"';
                         edKrRz_Kod_x    :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                    end;
              end;
              RB:=1;
         end;
         CBUForm.Free;
         if Res=mrNoToAll
         then begin
              main(4);
              RB:=-1;
         end;
         Result:=rb;
end;

function TfrmProvInfoWizard.Stepx6(IsDbPart:Integer):Integer;
var CBUForm:TfrmChooseBUObjects;
    Res:TModalResult;
    RB:Integer;
    Sp:ControlsArray;
begin
         if IsDbPart=0  then CBUForm:=TfrmChooseBUObjects.Create(self,3,tempID_KrSt,tempID_KrRZ,IsDbPart);
         if IsDbPart=1  then CBUForm:=TfrmChooseBUObjects.Create(self,3,tempID_DbSt,tempID_DbRZ,IsDbPart);
         if IsDbPart=-1 then CBUForm:=TfrmChooseBUObjects.Create(self,3,tempID_DbSt,tempID_DbRZ,IsDbPart);

         if PSTRU^.NOT_DIF_BDG_FG
         then begin
               SetLength(Sp,2);
               Sp[0]:=CBUForm.edKrSt;
               Sp[1]:=CBUForm.edDbSt;
         end
         else begin
               if IsDbPart=1
               then begin
                    SetLength(Sp,1);
                    Sp[0]:=CBUForm.edDbSt;
               end
               else begin
                    SetLength(Sp,1);
                    Sp[0]:=CBUForm.edKrSt;
               end;
         end;
         CBUForm.SplashEdit:=Sp;
         Res:=CBUForm.ShowModal;
         if Res=mrYes
         then begin
              if PSTRU^.NOT_DIF_BDG_FG
              then begin
                   tempID_DbST:=CBUForm.ObjectsDataSet.FieldByName('ID_OBJECT').Value;
                   edDbSt_x     :='№ '+CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString+'"';
                   edDbSt_Kod_x :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;

                   tempID_KrST:=CBUForm.ObjectsDataSet.FieldByName('ID_OBJECT').Value;
                   edKrSt_x     :='№ '+CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString+'"';
                   edKrSt_Kod_x :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
              end
              else begin
                    if IsDbPart=1
                    then begin
                         tempID_DbST:=CBUForm.ObjectsDataSet.FieldByName('ID_OBJECT').Value;
                         edDbSt_x     :='№ '+CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString+'"';
                         edDbSt_Kod_x :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                    end
                    else begin
                         tempID_KrST:=CBUForm.ObjectsDataSet.FieldByName('ID_OBJECT').Value;
                         edKrSt_x     :='№ '+CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString+'"';
                         edKrSt_Kod_x :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                    end;
              end;
              RB:=1;
         end;
         CBUForm.Free;
         if Res=mrNoToAll
         then begin
              main(5);
              RB:=-1;
         end;
         Result:=rb;
end;

function TfrmProvInfoWizard.Stepx7(IsDbPart:Integer):Integer;
var  CBUForm:TfrmChooseBUObjects;
     Res:TModalResult;
     RB:Integer;
     Sp:ControlsArray;
begin
         if IsDbPart=0   then CBUForm:=TfrmChooseBUObjects.Create(self,6,tempID_KrKv,0,IsDbPart);
         if IsDbPart=1   then CBUForm:=TfrmChooseBUObjects.Create(self,6,tempID_DbKv,0,IsDbPart);
         if IsDbPart=-1  then CBUForm:=TfrmChooseBUObjects.Create(self,6,tempID_DbKv,0,IsDbPart);

         if PSTRU^.NOT_DIF_BDG_FG
         then begin
               SetLength(Sp,2);
               Sp[0]:=CBUForm.edKrKv;
               Sp[1]:=CBUForm.edDbKv;
         end
         else begin
               if IsDbPart=1
               then begin
                    SetLength(Sp,1);
                    Sp[0]:=CBUForm.edDbKv;
               end
               else begin
                    SetLength(Sp,1);
                    Sp[0]:=CBUForm.edKrKv;
               end;
         end;

         CBUForm.SplashEdit:=Sp;
         Res:=CBUForm.ShowModal;
         if Res=mrYes
         then begin
              if PSTRU^.NOT_DIF_BDG_FG
              then begin
                   tempID_KrKV:=CBUForm.ObjectsDataSet.FieldByName('ID_OBJECT').Value;
                   edKrKV_x     :='№ '+CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString+'"';
                   edKrKV_Kod_x :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;

                   tempID_DbKV:=CBUForm.ObjectsDataSet.FieldByName('ID_OBJECT').Value;
                   edDbKV_x     :='№ '+CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString+'"';
                   edDbKV_Kod_x :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
              end
              else begin
                    if IsDbPart=1
                    then begin
                         tempID_DbKV:=CBUForm.ObjectsDataSet.FieldByName('ID_OBJECT').Value;
                         edDbKV_x     :='№ '+CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString+'"';
                         edDBKV_Kod_x :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                    end
                    else begin
                         tempID_KrKV:=CBUForm.ObjectsDataSet.FieldByName('ID_OBJECT').Value;
                         edKrKV_x     :='№ '+CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').AsString+' "'+CBUForm.ObjectsDataSet.FieldByName('OBJECT_TITLE').AsString+'"';
                         edKrKV_Kod_x :=CBUForm.ObjectsDataSet.FieldByName('OBJECT_NUM').Value;
                    end;
              end;
              RB:=1;
         end;
         CBUForm.Free;
         if Res=mrNoToAll
         then begin
              main(6);
              RB:=-1;
         end;
         Result:=RB;
end;


function TfrmProvInfoWizard.StepxAn(IsDbPart:Integer):Integer;
var  CBUForm:TfrmChooseBUObjects;
     Res:TModalResult;
     RB:Integer;
     Sp:ControlsArray;
     id_check_sch:Int64;
     CheckSchAn:TpFibDataSet;
begin

     if IsDbPart=0
     then begin
          CBUForm:=TfrmChooseBUObjects.Create(self,7,0,PSTRU^.KR_ID_SCH,IsDbPart);
          id_check_sch:=PSTRU^.KR_ID_SCH;
          SetLength(Sp,3);
          Sp[0]:=CBUForm.edKrAn;
          Sp[1]:=CBUForm.edKrSchTitle;
          Sp[2]:=CBUForm.edKrSchNum;
     end;

     if IsDbPart=1
     then begin
          CBUForm:=TfrmChooseBUObjects.Create(self,7, 0,PSTRU^.DB_ID_SCH,IsDbPart);
          id_check_sch:=PSTRU^.DB_ID_SCH;
          SetLength(Sp,3);
          Sp[0]:=CBUForm.edDbAn;
          Sp[1]:=CBUForm.edDbSchTitle;
          Sp[2]:=CBUForm.edDbSchNum;
     end;

     RB:=1;
     CheckSchAn:=TpFibDataSet.Create(self);
     CheckSchAn.Database:=WorkDatabase;
     CheckSchAn.Transaction:=ReadTransaction;
     CheckSchAn.SelectSQL.Text:='SELECT * FROM PUB_DT_SCH_ANALITIC_SELECT_EX2('+IntToStr(id_check_sch)+')';
     CheckSchAn.Open;
     if CheckSchAn.RecordCount>0
     then begin
               CBUForm.SplashEdit:=Sp;
               Res:=CBUForm.ShowModal;
               if Res=mrYes
               then begin
                         if IsDbPart=1
                         then begin
                                   PSTRU^.DB_ANALIZE1 :=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE1').Value;
                                   PSTRU^.DB_ANALIZE2 :=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE2').Value;
                                   PSTRU^.DB_ANALIZE3 :=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE3').Value;
                                   PSTRU^.DB_ANALIZE4 :=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE4').Value;
                                   PSTRU^.DB_ANALIZE5 :=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE5').Value;
                                   PSTRU^.DB_ANALIZE6 :=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE6').Value;
                                   PSTRU^.DB_ANALIZE7 :=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE7').Value;
                                   PSTRU^.DB_ANALIZE8 :=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE8').Value;
                                   PSTRU^.DB_ANALIZE9 :=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE9').Value;
                                   PSTRU^.DB_ANALIZE10:=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE10').Value;

                                   EdDbAN_x:=ANALITIC_FORM_RESULT_OK[PSTRU^.ID_LANGUAGE];
                         end
                         else begin
                                   PSTRU^.KR_ANALIZE1 :=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE1').Value;
                                   PSTRU^.KR_ANALIZE2 :=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE2').Value;
                                   PSTRU^.KR_ANALIZE3 :=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE3').Value;
                                   PSTRU^.KR_ANALIZE4 :=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE4').Value;
                                   PSTRU^.KR_ANALIZE5 :=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE5').Value;
                                   PSTRU^.KR_ANALIZE6 :=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE6').Value;
                                   PSTRU^.KR_ANALIZE7 :=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE7').Value;
                                   PSTRU^.KR_ANALIZE8 :=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE8').Value;
                                   PSTRU^.KR_ANALIZE9 :=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE9').Value;
                                   PSTRU^.KR_ANALIZE10:=CBUForm.ObjectsDataSet.FieldByName('DEFAULT_VALUE10').Value;

                                   EdKrAN_x:=ANALITIC_FORM_RESULT_OK[PSTRU^.ID_LANGUAGE];
                         end;
                         RB:=1;
               end;
               CBUForm.Free;
               if Res=mrNoToAll
               then begin
                        main(7);
                        RB:=-1;
               end;
     end
     else begin
          if IsDbPart=1
          then EdDbAN_x:=ANALITIC_FORM_RESULT_NONE[PSTRU^.ID_LANGUAGE]
          else EdKrAN_x:=ANALITIC_FORM_RESULT_NONE[PSTRU^.ID_LANGUAGE];
     end;
     CheckSchAn.Close;
     CheckSchAn.Free;
     Result:=RB;
end;

procedure TfrmProvInfoWizard.N6Click(Sender: TObject);
begin
    if Mode=1  then Mode1(5);
    if Mode=2  then Mode2(5);
    if Mode=3  then Mode3(5);
end;

procedure TfrmProvInfoWizard.cxButton3Click(Sender: TObject);
begin
    ModalResult:=mrNoToAll;
end;

procedure TfrmProvInfoWizard.N4Click(Sender: TObject);
begin
    if Mode=1  then Mode1(7);
    if Mode=2  then Mode2(7);
    if Mode=3  then Mode3(7);
end;

procedure TfrmProvInfoWizard.N7Click(Sender: TObject);
begin
    if Mode=1  then Mode1(6);
    if Mode=2  then Mode2(6);
    if Mode=3  then Mode3(6);
end;


procedure TfrmProvInfoWizard.FormCreate(Sender: TObject);
begin
    edDBSchNum_x           :='';
    edDBSchTitle_x         :='';
    edKrSchNum_x           :='';
    edKrSchTitle_x         :='';
    edDbSm_x               :='';
    edKrSm_x               :='';
    edDbRz_x               :='';
    edDbSt_x               :='';
    edDbKV_x               :='';
    stop_work_with_bdgts :=false;
end;

procedure TfrmProvInfoWizard.CloseButtonClick(Sender: TObject);
begin
    Work_result:=false;
    ModalResult:=mrNo;
end;

function TfrmProvInfoWizard.CheckSm(IsDbPart:Integer): Boolean;
var CheckProcedure:TpFibStoredProc;
    Res:Boolean;
begin
     {Необходимо проверить функционирует ли присланная смета в присланном периоде}
     CheckProcedure:=TpFibStoredProc.Create(self);
     CheckProcedure.Database:=WorkDatabase;
     CheckProcedure.Transaction:=ReadTransaction;
     CheckProcedure.StoredProcName:='PUB_GET_NAME_BUDG_BY_ID';
     CheckProcedure.Prepare;
     CheckProcedure.ParamByName('ACTUAL_DATE').AsDateTime:=PSTRU^.ACTUAL_DATE;
     CheckProcedure.ParamByName('TYPE_OBJECT').value:=1;
     if (IsDbPart=1)
     then CheckProcedure.ParamByName('ID_OBJECT').asInt64:=PSTRU^.DB_ID_SMETA
     else CheckProcedure.ParamByName('ID_OBJECT').asInt64:=PSTRU^.KR_ID_SMETA;

     CheckProcedure.ExecProc;

     if CheckProcedure.ParamByName('TITLE_OBJECT').Value=NULL
     then Res:=true
     else begin
          Res:=false;
          if PSTRU^.NOT_DIF_BDG_FG
          then begin
                     PSTRU^.DB_KOD_SMETA:=CheckProcedure.ParamByName('KOD_OBJECT').Value;
                     PSTRU^.DB_TITLE_SMETA:=CheckProcedure.ParamByName('KOD_OBJECT').AsString+' "'+CheckProcedure.ParamByName('TITLE_OBJECT').AsString+'"';
                     edDbSm_x:=CheckProcedure.ParamByName('KOD_OBJECT').AsString+' "'+CheckProcedure.ParamByName('TITLE_OBJECT').AsString+'"';
                     edDbSm_Kod_x:=CheckProcedure.ParamByName('KOD_OBJECT').Value;
                     tempID_DbSM :=PSTRU^.DB_ID_SMETA;

                     PSTRU^.KR_KOD_SMETA:=CheckProcedure.ParamByName('KOD_OBJECT').Value;
                     PSTRU^.KR_TITLE_SMETA:=CheckProcedure.ParamByName('KOD_OBJECT').AsString+' "'+CheckProcedure.ParamByName('TITLE_OBJECT').AsString+'"';
                     edKRSm_x:=CheckProcedure.ParamByName('KOD_OBJECT').AsString+' "'+CheckProcedure.ParamByName('TITLE_OBJECT').AsString+'"';
                     edKRSm_Kod_x:=CheckProcedure.ParamByName('KOD_OBJECT').Value;
                     tempID_KRSM :=PSTRU^.DB_ID_SMETA;
          end
          else begin
                if (IsDbPart=1)
                then begin
                     PSTRU^.DB_KOD_SMETA:=CheckProcedure.ParamByName('KOD_OBJECT').Value;
                     PSTRU^.DB_TITLE_SMETA:=CheckProcedure.ParamByName('KOD_OBJECT').AsString+' "'+CheckProcedure.ParamByName('TITLE_OBJECT').AsString+'"';
                     edDbSm_x:=CheckProcedure.ParamByName('KOD_OBJECT').AsString+' "'+CheckProcedure.ParamByName('TITLE_OBJECT').AsString+'"';
                     edDbSm_Kod_x:=CheckProcedure.ParamByName('KOD_OBJECT').Value;
                     tempID_DbSM :=PSTRU^.DB_ID_SMETA;
                end
                else begin
                     PSTRU^.KR_KOD_SMETA:=CheckProcedure.ParamByName('KOD_OBJECT').Value;
                     PSTRU^.KR_TITLE_SMETA:=CheckProcedure.ParamByName('KOD_OBJECT').AsString+' "'+CheckProcedure.ParamByName('TITLE_OBJECT').AsString+'"';
                     edKrSm_x:=CheckProcedure.ParamByName('KOD_OBJECT').AsString+' "'+CheckProcedure.ParamByName('TITLE_OBJECT').AsString+'"';
                     edKrSm_Kod_x:=CheckProcedure.ParamByName('KOD_OBJECT').Value;
                     tempID_KRSM :=PSTRU^.KR_ID_SMETA;
                end;
          end;
     end;


     CheckProcedure.Free;

     Result:=res;
end;

function TfrmProvInfoWizard.CheckRz(IsDbPart:Integer): Boolean;
var CheckProcedure:TpFibStoredProc;
    Res:Boolean;
begin
     {Необходимо проверить функционирует ли присланный Смета+раздел в присланном периоде}
     CheckProcedure:=TpFibStoredProc.Create(self);
     CheckProcedure.Database:=WorkDatabase;
     CheckProcedure.Transaction:=ReadTransaction;
     CheckProcedure.StoredProcName:='PUB_IS_CORRECT_SM_RAZD_ST';
     CheckProcedure.Prepare;
     CheckProcedure.ParamByName('ACTUAL_DATE').AsDateTime:=PSTRU^.ACTUAL_DATE;

     if (IsDbPart=1)
     then begin
          CheckProcedure.ParamByName('ID_SMETA').asInt64:=PSTRU^.DB_ID_SMETA;
          CheckProcedure.ParamByName('ID_RAZD').asInt64:=PSTRU^.DB_ID_RAZD;
          CheckProcedure.ParamByName('ID_STAT').Value:=null;
     end
     else begin
          CheckProcedure.ParamByName('ID_SMETA').asInt64:=PSTRU^.KR_ID_SMETA;
          CheckProcedure.ParamByName('ID_RAZD').asInt64:=PSTRU^.KR_ID_RAZD;
          CheckProcedure.ParamByName('ID_STAT').value:=null;
     end;

     CheckProcedure.ExecProc;
     if CheckProcedure.ParamByName('RESULT_VALUE').Value=0
     then Res:=true
     else begin
          Res:=false;
          if PSTRU^.NOT_DIF_BDG_FG
          then begin
                     PSTRU^.DB_KOD_RAZD:=CheckProcedure.ParamByName('RAZD_KOD').Value;
                     PSTRU^.DB_TITLE_RAZD:=CheckProcedure.ParamByName('RAZD_KOD').AsString+' "'+CheckProcedure.ParamByName('RAZD_TITLE').AsString+'"';
                     edDbRz_x:=CheckProcedure.ParamByName('RAZD_KOD').AsString+' "'+CheckProcedure.ParamByName('RAZD_TITLE').AsString+'"';
                     edDbRz_Kod_x:=CheckProcedure.ParamByName('RAZD_KOD').Value;
                     tempID_DBRz :=PSTRU^.DB_ID_RAZD;

                     PSTRU^.KR_KOD_RAZD:=CheckProcedure.ParamByName('RAZD_KOD').Value;
                     PSTRU^.KR_TITLE_RAZD:=CheckProcedure.ParamByName('RAZD_KOD').AsString+' "'+CheckProcedure.ParamByName('RAZD_TITLE').AsString+'"';
                     edKRrz_x:=CheckProcedure.ParamByName('RAZD_KOD').AsString+' "'+CheckProcedure.ParamByName('RAZD_TITLE').AsString+'"';
                     edKrRz_Kod_x:=CheckProcedure.ParamByName('RAZD_KOD').Value;
                     tempID_KRRz :=PSTRU^.DB_ID_RAZD;
          end
          else begin
                if (IsDbPart=1)
                then begin
                     PSTRU^.DB_KOD_RAZD:=CheckProcedure.ParamByName('RAZD_KOD').Value;
                     PSTRU^.DB_TITLE_RAZD:=CheckProcedure.ParamByName('RAZD_KOD').AsString+' "'+CheckProcedure.ParamByName('RAZD_TITLE').AsString+'"';
                     edDbRz_x:=CheckProcedure.ParamByName('RAZD_KOD').AsString+' "'+CheckProcedure.ParamByName('RAZD_TITLE').AsString+'"';
                     edDbRz_Kod_x:=CheckProcedure.ParamByName('RAZD_KOD').Value;
                     tempID_DBRz :=PSTRU^.DB_ID_RAZD;
                end
                else begin
                     PSTRU^.KR_KOD_RAZD:=CheckProcedure.ParamByName('RAZD_KOD').Value;
                     PSTRU^.KR_TITLE_RAZD:=CheckProcedure.ParamByName('RAZD_KOD').AsString+' "'+CheckProcedure.ParamByName('RAZD_TITLE').AsString+'"';
                     edKRRz_x:=CheckProcedure.ParamByName('RAZD_KOD').AsString+' "'+CheckProcedure.ParamByName('RAZD_TITLE').AsString+'"';
                     edKRRz_Kod_x:=CheckProcedure.ParamByName('RAZD_KOD').Value;
                     tempID_KrRz :=PSTRU^.KR_ID_RAZD;
                end;
          end;
     end;

     CheckProcedure.Free;

     Result:=res;
end;

function TfrmProvInfoWizard.CheckKv(IsDbPart:Integer): Boolean;
var CheckProcedure:TpFibStoredProc;
    Res:Boolean;
begin
     {Необходимо проверить функционирует ли присланный раздел+статья}
     CheckProcedure:=TpFibStoredProc.Create(self);
     CheckProcedure.Database:=WorkDatabase;
     CheckProcedure.Transaction:=ReadTransaction;
     CheckProcedure.StoredProcName:='PUB_SPR_KEKV_INFO';
     CheckProcedure.Prepare;
     CheckProcedure.ParamByName('ACTUAL_DATE').AsDateTime:=PSTRU^.ACTUAL_DATE;
     if (IsDbPart=1)
     then begin
          CheckProcedure.ParamByName('ID_KEKV').asInt64:=PSTRU^.DB_ID_KEKV;
     end
     else begin
          CheckProcedure.ParamByName('ID_KEKV').asInt64:=PSTRU^.KR_ID_KEKV;
     end;

     CheckProcedure.ExecProc;
     if CheckProcedure.ParamByName('KEKV_KODE').Value=null
     then Res:=true
     else begin
          Res:=false;

          if PSTRU^.NOT_DIF_BDG_FG
          then begin
                    PSTRU^.DB_KOD_KEKV:=CheckProcedure.ParamByName('KEKV_KODE').Value;
                    PSTRU^.DB_KEKV_TITLE:=CheckProcedure.ParamByName('KEKV_KODE').asString+' "'+CheckProcedure.ParamByName('KEKV_TITLE').AsString+'"';
                    edDbKv_x:=CheckProcedure.ParamByName('KEKV_KODE').asString+' "'+CheckProcedure.ParamByName('KEKV_TITLE').AsString+'"';
                    edDbKv_Kod_x:=CheckProcedure.ParamByName('KEKV_KODE').Value;
                    tempID_DbKv :=PSTRU^.DB_ID_KEKV;

                    PSTRU^.KR_KOD_KEKV:=CheckProcedure.ParamByName('KEKV_KODE').Value;
                    PSTRU^.KR_KEKV_TITLE:=CheckProcedure.ParamByName('KEKV_KODE').asString+' "'+CheckProcedure.ParamByName('KEKV_TITLE').AsString+'"';
                    edKrKv_x:=CheckProcedure.ParamByName('KEKV_KODE').asString+' "'+CheckProcedure.ParamByName('KEKV_TITLE').AsString+'"';
                    edKrKv_Kod_x:=CheckProcedure.ParamByName('KEKV_KODE').Value;
                    tempID_KrKv :=PSTRU^.DB_ID_KEKV;
          end
          else begin
               if (IsDbPart=1)
               then begin
                    PSTRU^.DB_KOD_KEKV:=CheckProcedure.ParamByName('KEKV_KODE').Value;
                    PSTRU^.DB_KEKV_TITLE:=CheckProcedure.ParamByName('KEKV_KODE').asString+' "'+CheckProcedure.ParamByName('KEKV_TITLE').AsString+'"';
                    edDbKv_x:=CheckProcedure.ParamByName('KEKV_KODE').asString+' "'+CheckProcedure.ParamByName('KEKV_TITLE').AsString+'"';
                    edDbKv_Kod_x:=CheckProcedure.ParamByName('KEKV_KODE').Value;
                    tempID_DbKv :=PSTRU^.DB_ID_KEKV;
               end
               else begin
                    PSTRU^.Kr_KOD_KEKV:=CheckProcedure.ParamByName('KEKV_KODE').Value;
                    PSTRU^.Kr_KEKV_TITLE:=CheckProcedure.ParamByName('KEKV_KODE').asString+' "'+CheckProcedure.ParamByName('KEKV_TITLE').AsString+'"';
                    edKrKv_x:=CheckProcedure.ParamByName('KEKV_KODE').asString+' "'+CheckProcedure.ParamByName('KEKV_TITLE').AsString+'"';
                    edKrKv_Kod_x:=CheckProcedure.ParamByName('KEKV_KODE').Value;
                    tempID_KrKv :=PSTRU^.Kr_ID_KEKV;
               end;
          end;
     end;

     CheckProcedure.Free;

     Result:=res;
end;

function TfrmProvInfoWizard.CheckSt(IsDbPart:Integer): Boolean;
var CheckProcedure:TpFibStoredProc;
    Res:Boolean;
begin
     {Необходимо проверить функционирует ли присланный раздел+статья}
     CheckProcedure:=TpFibStoredProc.Create(self);
     CheckProcedure.Database:=WorkDatabase;
     CheckProcedure.Transaction:=ReadTransaction;
     CheckProcedure.StoredProcName:='PUB_IS_CORRECT_SM_RAZD_ST';
     CheckProcedure.Prepare;
     CheckProcedure.ParamByName('ACTUAL_DATE').AsDateTime:=PSTRU^.ACTUAL_DATE;
     if (IsDbPart=1)
     then begin
          CheckProcedure.ParamByName('ID_SMETA').value:=null;
          CheckProcedure.ParamByName('ID_RAZD').asInt64:=PSTRU^.DB_ID_RAZD;
          CheckProcedure.ParamByName('ID_STAT').asInt64:=PSTRU^.DB_ID_STAT;;
     end
     else begin
          CheckProcedure.ParamByName('ID_SMETA').value:=null;
          CheckProcedure.ParamByName('ID_RAZD').asInt64:=PSTRU^.KR_ID_RAZD;
          CheckProcedure.ParamByName('ID_STAT').asInt64:=PSTRU^.KR_ID_STAT;
     end;

     CheckProcedure.ExecProc;
     if CheckProcedure.ParamByName('RESULT_VALUE').Value=0
     then Res:=true
     else begin
          Res:=false;

          if PSTRU^.NOT_DIF_BDG_FG
          then begin
                     PSTRU^.DB_KOD_STAT:=CheckProcedure.ParamByName('ST_KOD').Value;
                     PSTRU^.DB_TITLE_STAT:=CheckProcedure.ParamByName('ST_KOD').AsString+' "'+CheckProcedure.ParamByName('ST_TITLE').AsString+'"';
                     edDbSt_x:=CheckProcedure.ParamByName('ST_KOD').AsString+' "'+CheckProcedure.ParamByName('ST_TITLE').AsString+'"';
                     edDbSt_Kod_x:=CheckProcedure.ParamByName('ST_KOD').Value;
                     tempID_DbSt :=PSTRU^.DB_ID_STAT;

                     PSTRU^.KR_KOD_STAT:=CheckProcedure.ParamByName('ST_KOD').Value;
                     PSTRU^.KR_TITLE_STAT:=CheckProcedure.ParamByName('ST_KOD').AsString+' "'+CheckProcedure.ParamByName('ST_TITLE').AsString+'"';
                     edKrSt_x:=CheckProcedure.ParamByName('ST_KOD').AsString+' "'+CheckProcedure.ParamByName('ST_TITLE').AsString+'"';
                     edKrSt_Kod_x:=CheckProcedure.ParamByName('ST_KOD').Value;
                     tempID_KrSt :=PSTRU^.DB_ID_STAT;
          end
          else begin
                if (IsDbPart=1)
                then begin
                     PSTRU^.DB_KOD_STAT:=CheckProcedure.ParamByName('ST_KOD').Value;
                     PSTRU^.DB_TITLE_STAT:=CheckProcedure.ParamByName('ST_KOD').AsString+' "'+CheckProcedure.ParamByName('ST_TITLE').AsString+'"';
                     edDbSt_x:=CheckProcedure.ParamByName('ST_KOD').AsString+' "'+CheckProcedure.ParamByName('ST_TITLE').AsString+'"';
                     edDbSt_Kod_x:=CheckProcedure.ParamByName('ST_KOD').Value;
                     tempID_DbSt :=PSTRU^.DB_ID_STAT;
                end
                else begin
                     PSTRU^.KR_KOD_STAT:=CheckProcedure.ParamByName('ST_KOD').Value;
                     PSTRU^.KR_TITLE_STAT:=CheckProcedure.ParamByName('ST_KOD').AsString+' "'+CheckProcedure.ParamByName('ST_TITLE').AsString+'"';
                     edKrSt_x:=CheckProcedure.ParamByName('ST_KOD').AsString+' "'+CheckProcedure.ParamByName('ST_TITLE').AsString+'"';
                     edKrSt_Kod_x:=CheckProcedure.ParamByName('ST_KOD').Value;
                     tempID_KrSt :=PSTRU^.Kr_ID_STAT;
                end;
          end;
     end;

     CheckProcedure.Free;

     Result:=res;
end;

function TfrmProvInfoWizard.CheckAn(IsDbPart: Integer): Boolean;
var CheckProcedure:TpFibStoredProc;
    Res:Boolean;
begin
    CheckProcedure:=TpFibStoredProc.Create(self);
    CheckProcedure.Database:=WorkDatabase;
    CheckProcedure.Transaction:=ReadTransaction;
    CheckProcedure.StoredProcName:='PUB_CHECK_SCH_ANALITIC';
    CheckProcedure.Prepare;
    if (IsDbPart=1)
    then begin
         CheckProcedure.ParamByName('ID_SCH').AsDateTime:=PSTRU^.DB_ID_SCH;
         CheckProcedure.ParamByName('DEFAULT_VALUE1').AsDateTime :=PSTRU^.DB_ANALIZE1;
         CheckProcedure.ParamByName('DEFAULT_VALUE2').AsDateTime :=PSTRU^.DB_ANALIZE2;
         CheckProcedure.ParamByName('DEFAULT_VALUE3').AsDateTime :=PSTRU^.DB_ANALIZE3;
         CheckProcedure.ParamByName('DEFAULT_VALUE4').AsDateTime :=PSTRU^.DB_ANALIZE4;
         CheckProcedure.ParamByName('DEFAULT_VALUE5').AsDateTime :=PSTRU^.DB_ANALIZE5;
         CheckProcedure.ParamByName('DEFAULT_VALUE6').AsDateTime :=PSTRU^.DB_ANALIZE6;
         CheckProcedure.ParamByName('DEFAULT_VALUE7').AsDateTime :=PSTRU^.DB_ANALIZE7;
         CheckProcedure.ParamByName('DEFAULT_VALUE8').AsDateTime :=PSTRU^.DB_ANALIZE8;
         CheckProcedure.ParamByName('DEFAULT_VALUE9').AsDateTime :=PSTRU^.DB_ANALIZE9;
         CheckProcedure.ParamByName('DEFAULT_VALUE10').AsDateTime:=PSTRU^.DB_ANALIZE10;
    end
    else begin
         CheckProcedure.ParamByName('ID_SCH').AsDateTime:=PSTRU^.KR_ID_SCH;
         CheckProcedure.ParamByName('DEFAULT_VALUE1').AsDateTime :=PSTRU^.KR_ANALIZE1;
         CheckProcedure.ParamByName('DEFAULT_VALUE2').AsDateTime :=PSTRU^.KR_ANALIZE2;
         CheckProcedure.ParamByName('DEFAULT_VALUE3').AsDateTime :=PSTRU^.KR_ANALIZE3;
         CheckProcedure.ParamByName('DEFAULT_VALUE4').AsDateTime :=PSTRU^.KR_ANALIZE4;
         CheckProcedure.ParamByName('DEFAULT_VALUE5').AsDateTime :=PSTRU^.KR_ANALIZE5;
         CheckProcedure.ParamByName('DEFAULT_VALUE6').AsDateTime :=PSTRU^.KR_ANALIZE6;
         CheckProcedure.ParamByName('DEFAULT_VALUE7').AsDateTime :=PSTRU^.KR_ANALIZE7;
         CheckProcedure.ParamByName('DEFAULT_VALUE8').AsDateTime :=PSTRU^.KR_ANALIZE8;
         CheckProcedure.ParamByName('DEFAULT_VALUE9').AsDateTime :=PSTRU^.KR_ANALIZE9;
         CheckProcedure.ParamByName('DEFAULT_VALUE10').AsDateTime:=PSTRU^.KR_ANALIZE10;
    end;

    if CheckProcedure.ParamByName('RETVALUE').Value>0
    then begin
         Res:=true;
         if IsDbPart=1
         then begin
              PSTRU^.EXIST_DB_AN:=true;
              EdDbAN_x:=ANALITIC_FORM_RESULT_OK[PSTRU^.ID_LANGUAGE];
         end
         else begin
              PSTRU^.EXIST_KR_AN:=true;
              EdKrAN_x:=ANALITIC_FORM_RESULT_OK[PSTRU^.ID_LANGUAGE];
         end;
    end
    else begin
         Res:=false;
         if IsDbPart=1
         then begin
              PSTRU^.EXIST_DB_AN:=false;
              EdDbAN_x:=ANALITIC_FORM_RESULT_NONE[PSTRU^.ID_LANGUAGE];
         end
         else begin
              PSTRU^.EXIST_KR_AN:=false;
              EdKrAN_x:=ANALITIC_FORM_RESULT_NONE[PSTRU^.ID_LANGUAGE];
         end
    end;

    CheckProcedure.Free;

    Result:=Res;
end;

function TfrmProvInfoWizard.CheckSch: Boolean;
var CheckProcedure:TpFibStoredProc;
    Res:Boolean;
    SchForInfo,SchForCheck:Int64;
begin
    Res:=false;
    IF (PSTRU^.SCH_SET_FLAG=0)
    then begin
       {Присылается кредитовый счет и необходимо проверить счет в дебете}
       SchForCheck:=PSTRU^.DB_ID_SCH;
       SchForInfo :=PSTRU^.KR_ID_SCH;
    end
    else begin
       {Присылается дебетовый счет и необходимо проверить счет в кредите}
       SchForCheck:=PSTRU^.KR_ID_SCH;
       SchForInfo :=PSTRU^.DB_ID_SCH;
    end;

    CheckProcedure:=TpFibStoredProc.Create(self);
    CheckProcedure.Database:=WorkDatabase;
    CheckProcedure.Transaction:=ReadTransaction;
    CheckProcedure.StoredProcName:='PUB_SP_MAIN_SCH_INFO';
    CheckProcedure.Prepare;
    CheckProcedure.ParamByName('P_BOOK_DATE').AsDateTime:=PSTRU^.ACTUAL_DATE;
    CheckProcedure.ParamByName('ID_SCH_IN').AsInt64:=SchForInfo;
    CheckProcedure.ExecProc;

    if CheckProcedure.ParamByName('SCH_TITLE').Value<>null
    then begin
              if (PSTRU^.SCH_SET_FLAG=0)
              then begin
                   edKrSchTitle_x:=CheckProcedure.ParamByName('SCH_TITLE').AsString;
                   edKrSchNum_x  :=CheckProcedure.ParamByName('SCH_NUMBER').AsString;
              end
              else begin
                   edDbSchTitle_x:=CheckProcedure.ParamByName('SCH_TITLE').AsString;
                   edDbSchNum_x  :=CheckProcedure.ParamByName('SCH_NUMBER').AsString;
              end;

              CheckProcedure.StoredProcName:='PUB_SP_MAIN_OPER_SELECT_EX2';
              CheckProcedure.Prepare;
              CheckProcedure.ParamByName('P_ACTUAL_DATE').AsDateTime:=PSTRU^.ACTUAL_DATE;
              CheckProcedure.ParamByName('P_ID_KR_SCH').AsInt64:=PSTRU^.KR_ID_SCH;
              CheckProcedure.ParamByName('P_ID_DB_SCH').AsInt64:=PSTRU^.DB_ID_SCH;
              CheckProcedure.ExecProc;

              if CheckProcedure.ParamByName('ID_OPER').Value<>null
              then begin
                      CheckProcedure.StoredProcName:='PUB_SP_MAIN_SCH_INFO';
                      CheckProcedure.Prepare;
                      CheckProcedure.ParamByName('P_BOOK_DATE').AsDateTime:=PSTRU^.ACTUAL_DATE;
                      CheckProcedure.ParamByName('ID_SCH_IN').AsInt64:=SchForCheck;
                      CheckProcedure.ExecProc;

                      if CheckProcedure.ParamByName('SCH_TITLE').Value<>null
                      then begin
                                if (PSTRU^.SCH_SET_FLAG=0)
                                then begin
                                     edDBSchTitle_x:=CheckProcedure.ParamByName('SCH_TITLE').AsString;
                                     edDBSchNum_x  :=CheckProcedure.ParamByName('SCH_NUMBER').AsString;
                                end
                                else begin
                                     edKrSchTitle_x:=CheckProcedure.ParamByName('SCH_TITLE').AsString;
                                     edKrSchNum_x  :=CheckProcedure.ParamByName('SCH_NUMBER').AsString;
                                end;
                      end
                      else Res:=true;
              end
              else Res:=true;
    end
    else Res:=true;
    CheckProcedure.Free;
    Result:=Res;
end;

procedure TfrmProvInfoWizard.Action1Execute(Sender: TObject);
begin
     OKButton.OnClick(self);
end;

end.
