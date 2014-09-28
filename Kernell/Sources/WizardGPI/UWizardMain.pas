unit UWizardMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit,Ibase, FIBDatabase,
  pFIBDatabase, Kernel, pFibStoredProc,pFibDataSet, Menus, ActnList,FIBDataSet,
  UWizardTypes, UWizardSteps;

type
  ControlsArray = array of TcxTextEdit;

  TfrmProvInfoWizard1 = class(TForm)
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
    OKButton: TcxButton;
    CloseButton: TcxButton;
    Label1: TLabel;
    EdDbAN: TcxTextEdit;
    lbAnDb: TLabel;
    lbAnKr: TLabel;
    EdKrAn: TcxTextEdit;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    procedure FormShow(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    RunArray:array of RunProc;
    CLOSE_MFORM_FLAG:Boolean;
  public
    { Public declarations }

    GLOBAL_STRU : PWIZARD_GET_PROV_INFO;
    LOCAL_STRU  : WIZARD_GET_PROV_INFO;

    WORK_RESULT : Boolean;

    //Переопределенный конструктор для передачи параметров
    constructor Create(VWIZARD_GET_PROV_INFO:PWIZARD_GET_PROV_INFO);overload;

    //Инициализация менеджера
    procedure InitWizard;

    //Основная процедура менеджера
    procedure RunWizard;

    //Деинициализация менеджера
    procedure FreeWizard;

    //Клонирование структуры данных
    procedure CloneData;
    procedure ReturnData;

    //Загрузка ресурсов
    procedure SetLanguage;

    //Показ окончательных данных пользователю
    procedure ShowResultData;
  end;



implementation

uses GlobalSpr, UWizardGetInfo, UWizardResources, FIBQuery, DB;


{$R *.dfm}

constructor TfrmProvInfoWizard1.Create(VWIZARD_GET_PROV_INFO:PWIZARD_GET_PROV_INFO);
begin
     inherited Create(VWIZARD_GET_PROV_INFO^.AOWNER);

     GLOBAL_STRU        :=VWIZARD_GET_PROV_INFO;
     WorkDatabase.Handle:=GLOBAL_STRU^.DBHANDLE;
     ReadTransaction.StartTransaction;
end;

procedure TfrmProvInfoWizard1.FormShow(Sender: TObject);
begin
     CLOSE_MFORM_FLAG:=false;

     //Копирование глобальных данных в локальную структуру
     CloneData;


     //Загрузка ресурсов
     SetLanguage;


     //Конфигурирование мастера
     InitWizard;


     //Работа мастера
     RunWizard;

     //Освоюождение ресурсов
     FreeWizard;

     if WORK_RESULT then ShowResultData;

     If not GLOBAL_STRU^.WIZARD_FORM_SH then PostMessage(self.Handle,WM_CLOSE,0,0);
end;


procedure TfrmProvInfoWizard1.FreeWizard;
begin
     RunArray:=nil;
end;

procedure TfrmProvInfoWizard1.InitWizard;
begin
     //Настраиваем менеджер с учетом присланного режима
     case LOCAL_STRU.MODE of

               MODE21_CONST,
               MODE22_CONST         :begin //Начало работы менеджера с присланной системы или регистра бухгалтерского учета
                                          SetLength(RunArray,9);
                                          RunArray[0]:=Step21_22_1;       //Выбор главного счета
                                          RunArray[1]:=Step21_22_2;       //Выбор корреспондирующего счета
                                          RunArray[2]:=StepGetFacedInfo;  //Работа со встречными документами и проводками
                                          RunArray[3]:=StepCheckDefSmInfo;//Проверка настроект по умолчанию для бюджетов
                                          RunArray[4]:=Step21_22_3;       //Выбор бюджетов
                                          RunArray[5]:=Step21_22_4;       //Выбор разделов
                                          RunArray[6]:=Step21_22_5;       //Выбор статей
                                          RunArray[7]:=StepCheckDefKvInfo;//Проверка настроект по умолчанию для кодов затрат
                                          RunArray[8]:=Step21_22_6;       //Выбор кодов затрат
                                    end;
               MODE11_CONST         :begin //Режим для редактирования присланных значений
                                          SetLength(RunArray,8);
                                          RunArray[0]:=Step11_1;          //Проверка и выбор главного счета
                                          RunArray[1]:=Step11_2;          //Проверка и выбор корреспондирующего счета
                                          RunArray[2]:=StepCheckDefSmInfo;//Проверка настроект по умолчанию для бюджетов
                                          RunArray[3]:=Step11_3;          //Проверка и выбор бюджетов
                                          RunArray[4]:=Step11_4;          //Проверка и выбор разделов
                                          RunArray[5]:=Step11_5;          //Проверка и выбор статей
                                          RunArray[6]:=StepCheckDefKvInfo;//Проверка настроект по умолчанию для кодов затрат
                                          RunArray[7]:=Step11_6;          //Проверка и выбор кодов затрат
                                    end;
               MODE1_CONST          :begin //Начало работы менеджера с присланного рабочего баллансового счета
                                          SetLength(RunArray,8);
                                          RunArray[0]:=Step1_1;           //Выбор корреспондирующего счета
                                          RunArray[1]:=StepGetFacedInfo;  //Работа со встречными документами и проводками
                                          RunArray[2]:=StepCheckDefSmInfo;//Проверка настроект по умолчанию для бюджетов
                                          RunArray[3]:=Step1_2;           //Выбор бюджетов
                                          RunArray[4]:=Step1_3;           //Выбор разделов
                                          RunArray[5]:=Step1_4;           //Выбор статей
                                          RunArray[6]:=StepCheckDefKvInfo;//Проверка настроект по умолчанию для кодов затрат
                                          RunArray[7]:=Step1_5;           //Выбор кодов затрат
                                    end;
               MODE3_CONST          :begin //Начало работы менеджера для выбора бюджетов
                                          SetLength(RunArray,3);
                                          RunArray[0]:=Step3_1;           //Выбор бюджетов
                                          RunArray[1]:=Step3_2;           //Выбор разделов
                                          RunArray[2]:=Step3_3;           //Выбор статей
                                    end;
     end;
end;

procedure TfrmProvInfoWizard1.RunWizard;
var I,StepResult:Integer;
    Running:Boolean;
begin
    I:=0;
    WORK_RESULT:=true;
    Running:=true;
    StepResult:=1;

    while Running do
    begin
          StepResult:=RunArray[i](self,@LOCAL_STRU,WorkDatabase,ReadTransaction,StepResult);

          if (StepResult=0)
          then begin
                    Running    :=false;
                    WORK_RESULT:=false;
          end;

          if (StepResult=-1000)
          then begin
                    Running    :=false;
                    WORK_RESULT:=true;
          end;


          if ((StepResult>0) or (StepResult<0)) and (StepResult<>-1000)
          then begin
                    I:=I+StepResult;
          end;

          case LOCAL_STRU.MODE of
                      MODE21_CONST,
                      MODE22_CONST         :begin
                                                 if (I=9) then Running:=false;
                                            end;
                      MODE1_CONST          :begin
                                                 if (I=9) then Running:=false;
                                            end;
                      MODE11_CONST         :begin
                                                 if (I=8) then Running:=false;
                                            end;
                      MODE3_CONST          :begin
                                                 if (I=3) then Running:=false;
                                            end;
          end;
    end;
end;

procedure TfrmProvInfoWizard1.OKButtonClick(Sender: TObject);
begin
       Close;
end;

procedure TfrmProvInfoWizard1.CloseButtonClick(Sender: TObject);
begin
       self.WORK_RESULT:=false;
       Close;
end;

procedure TfrmProvInfoWizard1.CloneData;
begin
       LOCAL_STRU.DBHANDLE               :=GLOBAL_STRU^.DBHANDLE;
       LOCAL_STRU.ACTUAL_DATE            :=GLOBAL_STRU^.ACTUAL_DATE;
       LOCAL_STRU.MODE                   :=GLOBAL_STRU^.MODE;
       LOCAL_STRU.WIZARD_FORM_SH         :=GLOBAL_STRU^.WIZARD_FORM_SH;
       LOCAL_STRU.INFO_PANEL_SH          :=GLOBAL_STRU^.INFO_PANEL_SH;
       LOCAL_STRU.NOT_DIF_BDG_FG         :=GLOBAL_STRU^.NOT_DIF_BDG_FG;
       LOCAL_STRU.PROP_BUDG_NUM          :=GLOBAL_STRU^.PROP_BUDG_NUM;
       LOCAL_STRU.ID_LANGUAGE            :=GLOBAL_STRU^.ID_LANGUAGE;
       LOCAL_STRU.SCH_SET_FLAG           :=GLOBAL_STRU^.SCH_SET_FLAG;
       if (LOCAL_STRU.MODE=1)
       then LOCAL_STRU.CR_BY_DT               :=GLOBAL_STRU^.SCH_SET_FLAG
       else LOCAL_STRU.CR_BY_DT               :=GLOBAL_STRU^.CR_BY_DT;
       LOCAL_STRU.ID_FORM_UCH            :=GLOBAL_STRU^.ID_FORM_UCH;
       LOCAL_STRU.ID_REG_UCH             :=GLOBAL_STRU^.ID_REG_UCH;
       LOCAL_STRU.ID_SCH_IN              :=GLOBAL_STRU^.ID_SCH_IN;
       LOCAL_STRU.AOWNER                 :=GLOBAL_STRU^.AOWNER;
       LOCAL_STRU.ID_OPER                :=GLOBAL_STRU^.ID_OPER;
       LOCAL_STRU.KR_ID_SCH              :=GLOBAL_STRU^.KR_ID_SCH;
       LOCAL_STRU.KR_ID_SCH_KOD          :=GLOBAL_STRU^.KR_ID_SCH_KOD;
       LOCAL_STRU.KR_ID_SCH_TIT          :=GLOBAL_STRU^.KR_ID_SCH_TIT;
       LOCAL_STRU.DB_ID_SCH              :=GLOBAL_STRU^.DB_ID_SCH;
       LOCAL_STRU.DB_ID_SCH_KOD          :=GLOBAL_STRU^.DB_ID_SCH_KOD;
       LOCAL_STRU.DB_ID_SCH_TIT          :=GLOBAL_STRU^.DB_ID_SCH_TIT;
       LOCAL_STRU.DB_ID_SMETA            :=GLOBAL_STRU^.DB_ID_SMETA;
       LOCAL_STRU.DB_KOD_SMETA           :=GLOBAL_STRU^.DB_KOD_SMETA;
       LOCAL_STRU.DB_TITLE_SMETA         :=GLOBAL_STRU^.DB_TITLE_SMETA;
       LOCAL_STRU.DB_ID_RAZD             :=GLOBAL_STRU^.DB_ID_RAZD;
       LOCAL_STRU.DB_KOD_RAZD            :=GLOBAL_STRU^.DB_KOD_RAZD;
       LOCAL_STRU.DB_TITLE_RAZD          :=GLOBAL_STRU^.DB_TITLE_RAZD;
       LOCAL_STRU.DB_ID_STAT             :=GLOBAL_STRU^.DB_ID_STAT;
       LOCAL_STRU.DB_KOD_STAT            :=GLOBAL_STRU^.DB_KOD_STAT;
       LOCAL_STRU.DB_TITLE_STAT          :=GLOBAL_STRU^.DB_TITLE_STAT;
       LOCAL_STRU.DB_ID_SM_GR            :=GLOBAL_STRU^.DB_ID_SM_GR;
       LOCAL_STRU.DB_KOD_SM_GR           :=GLOBAL_STRU^.DB_KOD_SM_GR;
       LOCAL_STRU.DB_TITLE_SM_GR         :=GLOBAL_STRU^.DB_TITLE_SM_GR;


       LOCAL_STRU.DB_ID_KEKV             :=GLOBAL_STRU^.DB_ID_KEKV;
       LOCAL_STRU.DB_KOD_KEKV            :=GLOBAL_STRU^.DB_KOD_KEKV;
       LOCAL_STRU.DB_KEKV_TITLE          :=GLOBAL_STRU^.DB_KEKV_TITLE;

       LOCAL_STRU.KR_ID_SMETA            :=GLOBAL_STRU^.KR_ID_SMETA;
       LOCAL_STRU.KR_KOD_SMETA           :=GLOBAL_STRU^.KR_KOD_SMETA;
       LOCAL_STRU.KR_TITLE_SMETA         :=GLOBAL_STRU^.KR_TITLE_SMETA;
       LOCAL_STRU.KR_ID_RAZD             :=GLOBAL_STRU^.KR_ID_RAZD;
       LOCAL_STRU.KR_KOD_RAZD            :=GLOBAL_STRU^.KR_KOD_RAZD;
       LOCAL_STRU.KR_TITLE_RAZD          :=GLOBAL_STRU^.KR_TITLE_RAZD;
       LOCAL_STRU.KR_ID_STAT             :=GLOBAL_STRU^.KR_ID_STAT;
       LOCAL_STRU.KR_KOD_STAT            :=GLOBAL_STRU^.KR_KOD_STAT;
       LOCAL_STRU.KR_TITLE_STAT          :=GLOBAL_STRU^.KR_TITLE_STAT;
       LOCAL_STRU.KR_ID_SM_GR            :=GLOBAL_STRU^.KR_ID_SM_GR;
       LOCAL_STRU.KR_KOD_SM_GR           :=GLOBAL_STRU^.KR_KOD_SM_GR;
       LOCAL_STRU.KR_TITLE_SM_GR         :=GLOBAL_STRU^.KR_TITLE_SM_GR;


       LOCAL_STRU.KR_ID_KEKV             :=GLOBAL_STRU^.KR_ID_KEKV;
       LOCAL_STRU.KR_KOD_KEKV            :=GLOBAL_STRU^.KR_KOD_KEKV;
       LOCAL_STRU.KR_KEKV_TITLE          :=GLOBAL_STRU^.KR_KEKV_TITLE;

       LOCAL_STRU.FACED_FLAG             :=GLOBAL_STRU^.FACED_FLAG;
       LOCAL_STRU.FACED_ID_DOC           :=GLOBAL_STRU^.FACED_ID_DOC;
       LOCAL_STRU.FACED_ID_PROV          :=GLOBAL_STRU^.FACED_ID_PROV;
       LOCAL_STRU.FACED_CR_BY_DT         :=GLOBAL_STRU^.FACED_CR_BY_DT;
       LOCAL_STRU.FACED_PROV_SUMMA       :=GLOBAL_STRU^.FACED_PROV_SUMMA;
       LOCAL_STRU.FACED_ID_DOG           :=GLOBAL_STRU^.FACED_ID_DOG;
       LOCAL_STRU.FACED_KOD_DOG          :=GLOBAL_STRU^.FACED_KOD_DOG;
       LOCAL_STRU.FACED_ID_MAN           :=GLOBAL_STRU^.FACED_ID_MAN;
       LOCAL_STRU.FACED_ID_PAYER         :=GLOBAL_STRU^.FACED_ID_PAYER;
       LOCAL_STRU.EXIST_DB_AN            :=GLOBAL_STRU^.EXIST_DB_AN;
       LOCAL_STRU.EXIST_KR_AN            :=GLOBAL_STRU^.EXIST_KR_AN;
end;

procedure TfrmProvInfoWizard1.SetLanguage;
begin
     Caption             :=MAIN_FORM_TITLE[LOCAL_STRU.ID_LANGUAGE];
     lbDBtitle.Caption   :=MAIN_FORM_DB_TITLE[LOCAL_STRU.ID_LANGUAGE];
     lbKrtitle.Caption   :=MAIN_FORM_KR_TITLE[LOCAL_STRU.ID_LANGUAGE];
     OKButton.Caption    :=MAIN_FORM_OK_BUTTON[LOCAL_STRU.ID_LANGUAGE];
     CloseButton.Caption :=MAIN_FORM_CLOSE_BUTTON[LOCAL_STRU.ID_LANGUAGE];
     lbSchDb.Caption     :=MAIN_FORM_SCH_TITLE[LOCAL_STRU.ID_LANGUAGE];
     lbSchkr.Caption     :=MAIN_FORM_SCH_TITLE[LOCAL_STRU.ID_LANGUAGE];
     lbSmDb.Caption      :=MAIN_FORM_SMT_TITLE[LOCAL_STRU.ID_LANGUAGE];
     lbSmKr.Caption      :=MAIN_FORM_SMT_TITLE[LOCAL_STRU.ID_LANGUAGE];
     lbRzDb.Caption      :=MAIN_FORM_RAZ_TITLE[LOCAL_STRU.ID_LANGUAGE];
     lbRzKr.Caption      :=MAIN_FORM_RAZ_TITLE[LOCAL_STRU.ID_LANGUAGE];
     lbStDb.Caption      :=MAIN_FORM_STA_TITLE[LOCAL_STRU.ID_LANGUAGE];
     lbStKr.Caption      :=MAIN_FORM_STA_TITLE[LOCAL_STRU.ID_LANGUAGE];
     lbKVDb.Caption      :=MAIN_FORM_KVZ_TITLE[LOCAL_STRU.ID_LANGUAGE];
     lbKVKr.Caption      :=MAIN_FORM_KVZ_TITLE[LOCAL_STRU.ID_LANGUAGE];
     lbAnDb.Caption      :=MAIN_FORM_AN_TITLE[LOCAL_STRU.ID_LANGUAGE];
     lbAnKr.Caption      :=MAIN_FORM_AN_TITLE[LOCAL_STRU.ID_LANGUAGE];
     N1.Caption          :=MAIN_FORM_POPUP1[LOCAL_STRU.ID_LANGUAGE];
     N2.Caption          :=MAIN_FORM_POPUP2[LOCAL_STRU.ID_LANGUAGE];
     N3.Caption          :=MAIN_FORM_POPUP3[LOCAL_STRU.ID_LANGUAGE];
     N5.Caption          :=MAIN_FORM_POPUP4[LOCAL_STRU.ID_LANGUAGE];
     N6.Caption          :=MAIN_FORM_POPUP5[LOCAL_STRU.ID_LANGUAGE];
     N7.Caption          :=MAIN_FORM_POPUP6[LOCAL_STRU.ID_LANGUAGE];
     N4.Caption          :=MAIN_FORM_POPUP7[LOCAL_STRU.ID_LANGUAGE];
end;


procedure TfrmProvInfoWizard1.ReturnData;
begin

       GLOBAL_STRU^.ACTUAL_DATE       :=LOCAL_STRU.ACTUAL_DATE;
       GLOBAL_STRU^.CR_BY_DT          :=LOCAL_STRU.CR_BY_DT;
       GLOBAL_STRU^.ID_OPER           :=LOCAL_STRU.ID_OPER;
       GLOBAL_STRU^.KR_ID_SCH         :=LOCAL_STRU.KR_ID_SCH;
       GLOBAL_STRU^.KR_ID_SCH_KOD     :=LOCAL_STRU.KR_ID_SCH_KOD;
       GLOBAL_STRU^.KR_ID_SCH_TIT     :=LOCAL_STRU.KR_ID_SCH_TIT;
       GLOBAL_STRU^.DB_ID_SCH         :=LOCAL_STRU.DB_ID_SCH;
       GLOBAL_STRU^.DB_ID_SCH_KOD     :=LOCAL_STRU.DB_ID_SCH_KOD;
       GLOBAL_STRU^.DB_ID_SCH_TIT     :=LOCAL_STRU.DB_ID_SCH_TIT;
       GLOBAL_STRU^.DB_ID_SMETA       :=LOCAL_STRU.DB_ID_SMETA;
       GLOBAL_STRU^.DB_KOD_SMETA      :=LOCAL_STRU.DB_KOD_SMETA;
       GLOBAL_STRU^.DB_TITLE_SMETA    :=LOCAL_STRU.DB_TITLE_SMETA;
       GLOBAL_STRU^.DB_ID_RAZD        :=LOCAL_STRU.DB_ID_RAZD;
       GLOBAL_STRU^.DB_KOD_RAZD       :=LOCAL_STRU.DB_KOD_RAZD;
       GLOBAL_STRU^.DB_TITLE_RAZD     :=LOCAL_STRU.DB_TITLE_RAZD;
       GLOBAL_STRU^.DB_ID_STAT        :=LOCAL_STRU.DB_ID_STAT;
       GLOBAL_STRU^.DB_KOD_STAT       :=LOCAL_STRU.DB_KOD_STAT;
       GLOBAL_STRU^.DB_TITLE_STAT     :=LOCAL_STRU.DB_TITLE_STAT;
       GLOBAL_STRU^.DB_ID_SM_GR       :=LOCAL_STRU.DB_ID_SM_GR;
       GLOBAL_STRU^.DB_KOD_SM_GR      :=LOCAL_STRU.DB_KOD_SM_GR;
       GLOBAL_STRU^.DB_TITLE_SM_GR    :=LOCAL_STRU.DB_TITLE_SM_GR;
       GLOBAL_STRU^.DB_ID_KEKV        :=LOCAL_STRU.DB_ID_KEKV;
       GLOBAL_STRU^.DB_KOD_KEKV       :=LOCAL_STRU.DB_KOD_KEKV;
       GLOBAL_STRU^.DB_KEKV_TITLE     :=LOCAL_STRU.DB_KEKV_TITLE;
       GLOBAL_STRU^.KR_ID_SMETA       :=LOCAL_STRU.KR_ID_SMETA;
       GLOBAL_STRU^.KR_KOD_SMETA      :=LOCAL_STRU.KR_KOD_SMETA;
       GLOBAL_STRU^.KR_TITLE_SMETA    :=LOCAL_STRU.KR_TITLE_SMETA;
       GLOBAL_STRU^.KR_ID_RAZD        :=LOCAL_STRU.KR_ID_RAZD;
       GLOBAL_STRU^.KR_KOD_RAZD       :=LOCAL_STRU.KR_KOD_RAZD;
       GLOBAL_STRU^.KR_TITLE_RAZD     :=LOCAL_STRU.KR_TITLE_RAZD;
       GLOBAL_STRU^.KR_ID_STAT        :=LOCAL_STRU.KR_ID_STAT;
       GLOBAL_STRU^.KR_KOD_STAT       :=LOCAL_STRU.KR_KOD_STAT;
       GLOBAL_STRU^.KR_TITLE_STAT     :=LOCAL_STRU.KR_TITLE_STAT;
       GLOBAL_STRU^.KR_ID_SM_GR       :=LOCAL_STRU.KR_ID_SM_GR;
       GLOBAL_STRU^.KR_KOD_SM_GR      :=LOCAL_STRU.KR_KOD_SM_GR;
       GLOBAL_STRU^.KR_TITLE_SM_GR    :=LOCAL_STRU.KR_TITLE_SM_GR;
       GLOBAL_STRU^.KR_ID_KEKV        :=LOCAL_STRU.KR_ID_KEKV;
       GLOBAL_STRU^.KR_KOD_KEKV       :=LOCAL_STRU.KR_KOD_KEKV;
       GLOBAL_STRU^.KR_KEKV_TITLE     :=LOCAL_STRU.KR_KEKV_TITLE;
       GLOBAL_STRU^.FACED_FLAG        :=LOCAL_STRU.FACED_FLAG;
       GLOBAL_STRU^.FACED_ID_DOC      :=LOCAL_STRU.FACED_ID_DOC;
       GLOBAL_STRU^.FACED_ID_PROV     :=LOCAL_STRU.FACED_ID_PROV;
       GLOBAL_STRU^.FACED_CR_BY_DT    :=LOCAL_STRU.FACED_CR_BY_DT;
       GLOBAL_STRU^.FACED_PROV_SUMMA  :=LOCAL_STRU.FACED_PROV_SUMMA;
       GLOBAL_STRU^.FACED_ID_DOG      :=LOCAL_STRU.FACED_ID_DOG;
       GLOBAL_STRU^.FACED_KOD_DOG     :=LOCAL_STRU.FACED_KOD_DOG;
       GLOBAL_STRU^.FACED_ID_MAN      :=LOCAL_STRU.FACED_ID_MAN;
       GLOBAL_STRU^.FACED_ID_PAYER    :=LOCAL_STRU.FACED_ID_PAYER;
       GLOBAL_STRU^.EXIST_DB_AN       :=LOCAL_STRU.EXIST_DB_AN;
       GLOBAL_STRU^.EXIST_KR_AN       :=LOCAL_STRU.EXIST_KR_AN;
end;

procedure TfrmProvInfoWizard1.ShowResultData;
begin
     edDBSchNum.Text   :=LOCAL_STRU.DB_ID_SCH_KOD;
     edDBSchTitle.Text :=LOCAL_STRU.DB_ID_SCH_TIT;

     edKrSchNum.Text   :=LOCAL_STRU.KR_ID_SCH_KOD;
     edKrSchTitle.Text :=LOCAL_STRU.KR_ID_SCH_TIT;

     if GLOBAL_STRU^.NOT_DIF_BDG_FG
     then begin
               if (LOCAL_STRU.DB_TITLE_SMETA<>'') then edDBSm.Text       :=IntToStr(LOCAL_STRU.DB_KOD_SMETA)+' "'+LOCAL_STRU.DB_TITLE_SMETA+'"';
               if (LOCAL_STRU.DB_TITLE_SMETA<>'') then edKrSm.Text       :=IntToStr(LOCAL_STRU.DB_KOD_SMETA)+' "'+LOCAL_STRU.DB_TITLE_SMETA+'"';

               if (LOCAL_STRU.DB_TITLE_RAZD<>'') then edDBRz.Text       :=IntToStr(LOCAL_STRU.DB_KOD_RAZD)+' "'+LOCAL_STRU.DB_TITLE_RAZD+'"';
               if (LOCAL_STRU.DB_TITLE_RAZD<>'') then edKrRz.Text       :=IntToStr(LOCAL_STRU.DB_KOD_RAZD)+' "'+LOCAL_STRU.DB_TITLE_RAZD+'"';

               if (LOCAL_STRU.DB_TITLE_STAT<>'') then edDBSt.Text       :=IntToStr(LOCAL_STRU.DB_KOD_STAT)+' "'+LOCAL_STRU.DB_TITLE_STAT+'"';
               if (LOCAL_STRU.DB_TITLE_STAT<>'') then edKrSt.Text       :=IntToStr(LOCAL_STRU.DB_KOD_STAT)+' "'+LOCAL_STRU.DB_TITLE_STAT+'"';

               if (LOCAL_STRU.DB_KEKV_TITLE<>'') then edDBKV.Text       :=IntToStr(LOCAL_STRU.DB_KOD_KEKV)+' "'+LOCAL_STRU.DB_KEKV_TITLE+'"';
               if (LOCAL_STRU.DB_KEKV_TITLE<>'') then edKrKV.Text       :=IntToStr(LOCAL_STRU.DB_KOD_KEKV)+' "'+LOCAL_STRU.DB_KEKV_TITLE+'"';
     end
     else begin
               if (LOCAL_STRU.DB_TITLE_SMETA<>'') then edDBSm.Text       :=IntToStr(LOCAL_STRU.DB_KOD_SMETA)+' "'+LOCAL_STRU.DB_TITLE_SMETA+'"';
               if (LOCAL_STRU.kr_TITLE_SMETA<>'') then edKrSm.Text       :=IntToStr(LOCAL_STRU.KR_KOD_SMETA)+' "'+LOCAL_STRU.KR_TITLE_SMETA+'"';

               if (LOCAL_STRU.DB_TITLE_RAZD<>'') then edDBRz.Text       :=IntToStr(LOCAL_STRU.DB_KOD_RAZD)+' "'+LOCAL_STRU.DB_TITLE_RAZD+'"';
               if (LOCAL_STRU.KR_TITLE_RAZD<>'') then edKrRz.Text       :=IntToStr(LOCAL_STRU.KR_KOD_RAZD)+' "'+LOCAL_STRU.KR_TITLE_RAZD+'"';

               if (LOCAL_STRU.DB_TITLE_STAT<>'') then edDBSt.Text       :=IntToStr(LOCAL_STRU.DB_KOD_STAT)+' "'+LOCAL_STRU.DB_TITLE_STAT+'"';
               if (LOCAL_STRU.KR_TITLE_STAT<>'') then edKrSt.Text       :=IntToStr(LOCAL_STRU.KR_KOD_STAT)+' "'+LOCAL_STRU.KR_TITLE_STAT+'"';

               if (LOCAL_STRU.DB_KEKV_TITLE<>'') then edDBKV.Text       :=IntToStr(LOCAL_STRU.DB_KOD_KEKV)+' "'+LOCAL_STRU.DB_KEKV_TITLE+'"';
               if (LOCAL_STRU.KR_KEKV_TITLE<>'') then edKrKV.Text       :=IntToStr(LOCAL_STRU.KR_KOD_KEKV)+' "'+LOCAL_STRU.KR_KEKV_TITLE+'"';
     end;
end;

procedure TfrmProvInfoWizard1.Action1Execute(Sender: TObject);
begin
     Close;
end;

procedure TfrmProvInfoWizard1.Action2Execute(Sender: TObject);
begin
     Close;
end;

procedure TfrmProvInfoWizard1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if WORK_RESULT then ReturnData;
end;

end.
