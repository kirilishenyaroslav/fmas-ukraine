unit uPRK_DT_ABIT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,AArray,ibase, cxStyles, Placemnt,ib_externals, cxContainer,
  cxEdit, cxControls, cxGroupBox, ComCtrls, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxDBEdit, cxLabel, uFrameVstup,
  dxBar, uDocEducation, dxBarExtItems, ImgList, ActnList, uFrameOcenki,
  uFrameFioAbit, StdCtrls, uFramePerevagi, uFrameWorkStaj, uFrameParents,
  uFrameDopolnVedomosti, cxLookAndFeelPainters, cxButtons, cxSplitter,
  uFrameDopDoc, uFrameInLang, uSertifikat, pFIBErrorHandler, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, cxCheckBox, cxCalendar;

type
  TFormPRK_DT_ABIT = class(TForm)
    FormStorageAbit: TFormStorage;
    StyleRepositoryAbit: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyleHeader: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyleInactive: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyleBackGround_Content: TcxStyle;
    cxStyleSelection: TcxStyle;
    cxEditStyleControllerAbit: TcxEditStyleController;
    PageControlAbit: TPageControl;
    TabSheetVstup: TTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    DataBasePrK_ABIT: TpFIBDatabase;
    TransactionReadPrK_ABIT: TpFIBTransaction;
    TransactionWritePrK_ABIT: TpFIBTransaction;
    StoredProcPrK_ABIT: TpFIBStoredProc;
    DataSetPrK_ABIT: TpFIBDataSet;
    DataSourcePrK_ABIT: TDataSource;
    TabSheetDocEducation: TTabSheet;
    dxBarDockControlDocEducation: TdxBarDockControl;
    ActionListVuzLicense: TActionList;
    ActionADDDE: TAction;
    ActionChangeDE: TAction;
    ActionDELDE: TAction;
    ActionViewDE: TAction;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    ImageListVuzLicense: TImageList;
    dxBarManageDT_ABIT: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    dxBarLargeButtonChange: TdxBarLargeButton;
    dxBarLargeButtonDel: TdxBarLargeButton;
    dxBarLargeButtonVibrat: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    dxBarLargeButtonView: TdxBarLargeButton;
    TabSheetOcenki: TTabSheet;
    TabSheetFioAbit: TTabSheet;
    cxLabelFioAbit: TcxLabel;
    TabSheetPerevagi: TTabSheet;
    cxStyleSkyBlue: TcxStyle;
    TabSheetWorkStaj: TTabSheet;
    TFrameVstup1: TFrameVstup;
    TFrameDocEducation1: TFrameDocEducation;
    TFrameOcenki1: TFrameOcenki;
    TFrameWorkStaj1: TFrameWorkStaj;
    TFrameFioAbit1: TFrameFioAbit;
    TabSheetParents: TTabSheet;
    TFrameParents1: TFrameParents;
    TFramePerevagi1: TFramePerevagi;
    TabSheetDopolnVedomosti: TTabSheet;
    TFrameDopolnVedomosti1: TFrameDopolnVedomosti;
    DataSetFizlAbit: TpFIBDataSet;
    cxButtonCansel: TcxButton;
    cxButtonOK: TcxButton;
    ActionListAbitSave: TActionList;
    ActionSave: TAction;
    ActionExit: TAction;
    StoredProcFizlAbitOcen: TpFIBStoredProc;
    cxButtonDelAbit: TcxButton;
    ActionDelAbit: TAction;
    cxLabelInfo: TcxLabel;
    ActionPrintAbit: TAction;
    cxButtonPrint: TcxButton;
    ActionAdminInfo: TAction;
    cxGroupBoxDopDoc: TcxGroupBox;
    TFrameDopDoc1: TFrameDopDoc;
    cxSplitterNapr: TcxSplitter;
    dxBarDockControlDopDoc: TdxBarDockControl;
    ActionAddDD: TAction;
    ActionChangeDD: TAction;
    ActionDelDD: TAction;
    ActionViewDD: TAction;
    dxBarLargeButtonAddDD: TdxBarLargeButton;
    dxBarLargeButtonChangeDD: TdxBarLargeButton;
    dxBarLargeButtonDelDD: TdxBarLargeButton;
    dxBarLargeButtonViewDD: TdxBarLargeButton;
    cxGroupBoxInLang: TcxGroupBox;
    TFrameInLang1: TFrameInLang;
    dxBarDockControlInLang: TdxBarDockControl;
    dxBarLargeButtonAddIL: TdxBarLargeButton;
    dxBarLargeButtonChangeIL: TdxBarLargeButton;
    dxBarLargeButtonDelIL: TdxBarLargeButton;
    dxBarLargeButtonViewIL: TdxBarLargeButton;
    ActionAddIL: TAction;
    ActionChangeIL: TAction;
    ActionDelIL: TAction;
    ActionViewIL: TAction;
    TabSheetSertifikat: TTabSheet;
    Panel1: TPanel;
    dxBarDockControlCertifikat: TdxBarDockControl;
    BBAddSertifikat: TdxBarLargeButton;
    BBEditSertifikat: TdxBarLargeButton;
    BBDelSertifikat: TdxBarLargeButton;
    BBViewSertifikat: TdxBarLargeButton;
    TFrameSertifikat1: TFrameSertifikat;
    BBCheckSertifikat: TdxBarLargeButton;
    DataSetConsts: TpFIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionADDDEExecute(Sender: TObject);
    procedure ActionChangeDEExecute(Sender: TObject);
    procedure ActionViewDEExecute(Sender: TObject);
    procedure ActionDELDEExecute(Sender: TObject);
    procedure PageControlAbitChanging(Sender: TObject; var AllowChange: Boolean);
    procedure TabSheetOcenkiShow(Sender: TObject);
    procedure TabSheetPerevagiShow(Sender: TObject);
    procedure TabSheetDopolnVedomostiShow(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
    procedure ActionDelAbitExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure PageControlAbitChange(Sender: TObject);
    procedure ActionPrintAbitExecute(Sender: TObject);
    procedure ActionAdminInfoExecute(Sender: TObject);
    procedure ActionAddDDExecute(Sender: TObject);
    procedure ActionChangeDDExecute(Sender: TObject);
    procedure ActionDelDDExecute(Sender: TObject);
    procedure ActionViewDDExecute(Sender: TObject);
    procedure ActionAddILExecute(Sender: TObject);
    procedure ActionChangeILExecute(Sender: TObject);
    procedure ActionViewILExecute(Sender: TObject);
    procedure ActionDelILExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBAddSertifikatClick(Sender: TObject);
    procedure BBEditSertifikatClick(Sender: TObject);
    procedure BBDelSertifikatClick(Sender: TObject);
    procedure BBViewSertifikatClick(Sender: TObject);
    procedure TFrameSertifikat1cxGridViewMarks_OCENKAPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure BBCheckSertifikatClick(Sender: TObject);
  private
    DBHANDLE             :TISC_DB_HANDLE;
    Layout: array[0.. KL_NAMELENGTH] of char;
    Add_Ocen_orChange    :Boolean;
    FSelectSQLText: String;
    FInicFormCaption: String;
    FIndLangAbit: integer;
    FSelectSQLTextFizlAbit: String;
    FSelectSQLTextConsts: string;
    FSelectTextFizlAbit: boolean;
    procedure InicCaption;
    procedure InicDataAbit;
    procedure SetSelectSQLText(const Value: String);
    procedure SetSelectSQLTextConsts(const Value: String);
    procedure SetInicFormCaption(const Value: String);
    procedure SetIndLangAbit(const Value: integer);
    procedure SetSelectSQLTextFizlAbit(const Value: String);
    procedure SaveFizlAbit;
    procedure SaveOcen;
    procedure SaveDT_ABIT;
    procedure SetSelectTextFizlAbit(const Value: boolean);
  public
    ID_GOD_NABORA_GLOBAL :int64; //  переменная данные для которой всегда передаются!
    ID_DT_ABIT_GLOBAL    :int64; //  переменная данные для которой всегда передаются!
    ID_USER_GLOBAL       :int64; //  переменная данные для которой всегда передаются!
    ID_ABIT_OUT          :int64;
    ID_DT_FIZL_ABIT_OUT  :int64;
    ID_KAT_STUD          :int64; //  категория обучения, нужна для печати заявления
    TextViewColor        :TColor;
    ResultArray          :TAArray;
    CanCommitAbitTr      :boolean;  
    constructor Create(aOwner: TComponent;aParam :TAArray);overload;
    Property IndLangAbit :integer read FIndLangAbit write SetIndLangAbit;
    Property InicFormCaption          :String  read FInicFormCaption       write SetInicFormCaption;
    Property SelectSQLText            :String  read FSelectSQLText         write SetSelectSQLText;
    Property SelectSQLTextFizlAbit    :String  read FSelectSQLTextFizlAbit write SetSelectSQLTextFizlAbit;
    property SelectTextFizlAbit       :boolean read FSelectTextFizlAbit    write SetSelectTextFizlAbit;
    Property SelectSQLTextConsts      :String  read FSelectSQLTextConsts   write SetSelectSQLTextConsts;
  end;

  procedure ShowAbit (aOwner: TComponent;aParam :TAArray);stdcall;
  exports   ShowAbit;

var
  FormPRK_DT_ABIT: TFormPRK_DT_ABIT;

implementation
uses
 uConstants,uPrK_Resources,uPrintAbit;
{$R *.dfm}

procedure ShowAbit (aOwner: TComponent;aParam :TAArray);
var
 T :TFormPRK_DT_ABIT;
begin
   T:=TFormPRK_DT_ABIT.Create(aOwner,aParam);

   T.FormStyle:= aParam['Input']['aFrmStyle'].AsVariant;
   case T.FormStyle of
     fsNormal:   begin
                   T.ShowModal;
                 end;
     fsMDIChild: begin
                   // если вдруг на будущее понадобиться, тогда сюда дописать что-нибудь, если нет - то можно убрать такую форму записи
                 end;
     else
        T.Free;
   end;

end;

{ TFormPRK_DT_ABIT }

constructor TFormPRK_DT_ABIT.Create(aOwner: TComponent; aParam: TAArray);
begin
   if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
   begin
      DBHANDLE      :=PVoid(aParam['Input']['aDBHANDLE'].asInteger);
      ResultArray   := aParam;
      IndLangAbit   :=SelectLanguage;
      TextViewColor :=cl3DLight;
      ID_DT_FIZL_ABIT_OUT :=-999;
      inherited Create(aOwner);
      if SelectShemaColor=1 then
       begin
          cxStyleBackGround_Content.Color       := $00EBC4A4;
          cxStyleInactive.Color                 := $00F7EAD9;
          cxEditStyleControllerAbit.Style.Color := $00EBC4A4;
       end;
   end
   else ShowMessage('Ошибка HANDLE`a Базы');
end;

procedure TFormPRK_DT_ABIT.FormCreate(Sender: TObject);
var
  CanViewActionDelAbit:boolean;
begin
  {ID_NAME_FAK_CENTER :='ID_FAK_CENTER';
  ID_NAME_KAT_STUD   :='ID_CN_SP_KAT_STUD';
  ID_NAME_FAK        :='ID_CN_SP_FAK';
  ID_NAME_SPEC       :='ID_CN_JN_FACUL_SPEC';
  ID_NAME_FORM_STUD  :='ID_CN_SP_FORM_STUD'; }

  CanViewActionDelAbit :=false;
  InicFormCaption      :=nFormPRK_DT_ABIT_Caption[IndLangAbit];

  ID_GOD_NABORA_GLOBAL   :=ResultArray['Input']['GodNabora'].AsInt64;
  ID_DT_ABIT_GLOBAL      :=ResultArray['Input']['ID_DT_ABIT'].AsInt64;
  ID_USER_GLOBAL         :=ResultArray['Input']['ID_USER_GLOBAL'].AsInt64;

  if ResultArray['Input']['Rejim'].AsVariant=DelPrK then
      begin
       // делается для того, чтобы не были активны режимы редактирования
       ResultArray['Input']['Rejim'].AsVariant :=ViewPrK;
       ActionPrintAbit.Enabled                 :=false;
       CanViewActionDelAbit                    :=true;
      end;

  SelectSQLText          :='Select * from PRK_DT_ABIT_SELECT(:ID_DT_ABIT,:ID_SP_GOD_NABORA,:ID_USER)';
  SelectSQLTextConsts    :='Select * from PRK_INI';
  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';

  ActionADDDE.Enabled    :=false;
  ActionChangeDE.Enabled :=false;
  ActionDELDE.Enabled    :=false;
  ActionViewDE.Enabled   :=false;

  case RejimPrK(ResultArray['Input']['Rejim'].AsVariant) of
      AddPrK: begin
               ActionDelAbit.Enabled   :=false;
               ActionPrintAbit.Enabled :=false;
               TFrameFioAbit1.cxButtonEditFioAbit.Properties.OnButtonClick(self,0);
               if TFrameVstup1.DataSetTypeDepart.RecordCount =1
                 then TFrameVstup1.cxLookupComboBoxTypeDepart.Text := TFrameVstup1.DataSetTypeDepart.FieldValues['SHORT_NAME'];
              end;
   ChangePrK: begin
               ActionDelAbit.Enabled   :=false;
              end;
     ViewPrK: begin
               if CanViewActionDelAbit=true
                then  ActionDelAbit.Enabled   :=true
                else  ActionDelAbit.Enabled   :=false;
               ActionSave.Enabled      :=false;
              end;
  end;
  TFrameSertifikat1.SetInitData;
  TabSheetVstup.Show;
end;

procedure TFormPRK_DT_ABIT.SetInicFormCaption(const Value: String);
begin
  FInicFormCaption := Value;
  InicCaption;
end;

procedure TFormPRK_DT_ABIT.InicCaption;
begin
  TFormPRK_DT_ABIT(self).Caption :=InicFormCaption;
  cxLabelFioAbit.Caption       := '';

  case RejimPrK(ResultArray['Input']['Rejim'].AsVariant) of
       AddPrK    :cxLabelInfo.Caption:=nLabelInfoNewData[IndLangAbit];
       ChangePrK :cxLabelInfo.Caption:=nLabelInfoChangeData[IndLangAbit];
       DelPrK    :cxLabelInfo.Caption:=nLabelInfoDelData[IndLangAbit];
       ViewPrK   :cxLabelInfo.Caption:=nLabelInfoViewData[IndLangAbit];
  end;

  TabSheetVstup.Caption           := nTabSheetVstup[IndLangAbit];
  TabSheetDocEducation.Caption    := nTabSheetDocEducation[IndLangAbit];
  TabSheetOcenki.Caption          := nTabSheetOcenki[IndLangAbit];
  TabSheetPerevagi.Caption        := nTabSheetPerevagi[IndLangAbit];
  TabSheetDopolnVedomosti.Caption := nTabSheetDopolnVedomosti[IndLangAbit];
  TabSheetWorkStaj.Caption        := nTabSheetWorkStaj[IndLangAbit];
  TabSheetParents.Caption         := nTabSheetParents[IndLangAbit];
  TabSheetFioAbit.Caption         := nTabSheetFioAbit[IndLangAbit];
  TabSheetSertifikat.Caption      := nTabSheetSertifikat[IndLangAbit];

  ActionADDDE.Caption                   :=nAction_Add[IndLangAbit];
  ActionChangeDE.Caption                :=nAction_Change[IndLangAbit];
  ActionDELDE.Caption                   :=nAction_Del[IndLangAbit];
  ActionViewDE.Caption                  :=nAction_View[IndLangAbit];
  ActionADDDE.Hint                      :=nHintAction_Add[IndLangAbit];
  ActionChangeDE.Hint                   :=nHintAction_Change[IndLangAbit];
  ActionDELDE.Hint                      :=nHintAction_Del[IndLangAbit];
  ActionViewDE.Hint                     :=nHintAction_View[IndLangAbit];

  ActionADDDD.Caption                   :=nAction_Add[IndLangAbit];
  ActionChangeDD.Caption                :=nAction_Change[IndLangAbit];
  ActionDELDD.Caption                   :=nAction_Del[IndLangAbit];
  ActionViewDD.Caption                  :=nAction_View[IndLangAbit];
  ActionADDDD.Hint                      :=nHintAction_Add[IndLangAbit];
  ActionChangeDD.Hint                   :=nHintAction_Change[IndLangAbit];
  ActionDELDD.Hint                      :=nHintAction_Del[IndLangAbit];
  ActionViewDD.Hint                     :=nHintAction_View[IndLangAbit];

  ActionAddIL.Caption                   :=nAction_Add[IndLangAbit];
  ActionChangeIL.Caption                :=nAction_Change[IndLangAbit];
  ActionDELIL.Caption                   :=nAction_Del[IndLangAbit];
  ActionViewIL.Caption                  :=nAction_View[IndLangAbit];
  ActionADDIL.Hint                      :=nHintAction_Add[IndLangAbit];
  ActionChangeIL.Hint                   :=nHintAction_Change[IndLangAbit];
  ActionDELIL.Hint                      :=nHintAction_Del[IndLangAbit];
  ActionViewIL.Hint                     :=nHintAction_View[IndLangAbit];

  ActionDelAbit.Caption                 :=nActionDelAbit[IndLangAbit];
  ActionSave.Caption                    :=nActionSave[IndLangAbit];
  ActionExit.Caption                    :=nActionExit[IndLangAbit];
  ActionPrintAbit.Caption               :=nActiontPrint[IndLangAbit];

  ActionSave.Hint                       :=nHintActionSave[IndLangAbit];
  ActionPrintAbit.Hint                  :=nHintActiontPrint[IndLangAbit];

  cxGroupBoxDopDoc.Caption              :=ncxGroupBoxDopDoc[IndLangAbit];
  cxGroupBoxInLang.Caption              :=ncxGroupBoxInLang[IndLangAbit];

  BBAddSertifikat.Caption               :=nAction_Add[IndLangAbit];
  BBEditSertifikat.Caption              :=nAction_Change[IndLangAbit];
  BBDelSertifikat.Caption               :=nAction_Del[IndLangAbit];
  BBViewSertifikat.Caption              :=nAction_View[IndLangAbit];
  BBCheckSertifikat.Caption             :=nAction_CheckSert[IndLangAbit];
  BBAddSertifikat.Hint                  :=nHintAction_Add[IndLangAbit];
  BBEditSertifikat.Hint                 :=nHintAction_Change[IndLangAbit];
  BBDelSertifikat.Hint                  :=nHintAction_Del[IndLangAbit];
  BBViewSertifikat.Hint                 :=nHintAction_View[IndLangAbit];

  TFrameVstup1.InicCaptionFrame;
  TFrameDocEducation1.InicCaptionFrame;
  TFrameDopDoc1.InicCaptionFrame;
  TFrameOcenki1.InicCaptionFrame;
  TFrameInLang1.InicCaptionFrame;
  TFramePerevagi1.InicCaptionFrame;
  TFrameDopolnVedomosti1.InicCaptionFrame;
  TFrameWorkStaj1.InicCaptionFrame;
  TFrameParents1.InicCaptionFrame;
  TFrameFioAbit1.InicCaptionFrame;
  TFrameSertifikat1.InicCaptionFrame;
end;

procedure TFormPRK_DT_ABIT.SetSelectSQLText(const Value: String);
begin
  FSelectSQLText := Value;
    DataBasePrK_ABIT.close;
    DataSetPrK_ABIT.Active                         :=false;
    DataBasePrK_ABIT.Handle                        :=DBHANDLE;
    DataBasePrK_ABIT.DefaultTransaction            := TransactionReadPrK_ABIT;
    DataSetPrK_ABIT.Database                       := DataBasePrK_ABIT;
    DataSetPrK_ABIT.Transaction                    := TransactionReadPrK_ABIT;
    DataSetPrK_ABIT.SelectSQL.Clear;
    DataSetPrK_ABIT.SQLs.SelectSQL.Text            := FSelectSQLText;

    if ResultArray['Input']['Rejim'].AsVariant=AddPrK then
     begin
         TFrameVstup1.cxLookupComboBoxFacul.Enabled         :=false;
         TFrameVstup1.cxLookupComboBoxKatStud.Enabled       :=false;
         TFrameVstup1.cxLookupComboBoxSpec.Enabled          :=false;
         TFrameVstup1.cxLookupComboBoxFormStudy.Enabled     :=false;
         TFrameVstup1.cxLookupComboBoxDergZakaz.Enabled     :=false;
         TFrameVstup1.cxLookupComboBoxKurs.Enabled          :=false;
         TFrameVstup1.cxLookupComboBoxSrokOb.Enabled        :=false;
         TFrameVstup1.cxLookupComboBoxVid_Dii.Enabled       :=false;
         TFrameVstup1.cxLookupComboBoxNpk.Enabled           :=false;
     end;

  // Вызов slectov должен быть именно в такой последователности
    TFrameDocEducation1.SelectTextFrameDocEducation :=true;
    TFrameVstup1.SelectTextFrameVstup               :=true;
    TFrameOcenki1.SelectTextFrameOcenki             :=true;
    TFramePerevagi1.SelectTextFramePerevagi         :=true;

    if (ResultArray['Input']['Rejim'].AsVariant=ChangePrk) or
       (ResultArray['Input']['Rejim'].AsVariant=ViewPrK) then
    begin
      DataSetPrK_ABIT.ParamByName('ID_DT_ABIT').AsInt64       :=ID_DT_ABIT_GLOBAL;
      DataSetPrK_ABIT.ParamByName('ID_SP_GOD_NABORA').AsInt64 :=ID_GOD_NABORA_GLOBAL;
      DataSetPrK_ABIT.ParamByName('ID_USER').AsInt64          :=ID_USER_GLOBAL;
      DataSetPrK_ABIT.CloseOpen(false);
      SelectSQLTextFizlAbit := 'Select * from PRK_DT_FIZL_ABIT_SELECT(:ID_MAN)';
      InicDataAbit;
    end;
end;


procedure TFormPRK_DT_ABIT.SetSelectTextFizlAbit(const Value: boolean);
begin
  FSelectTextFizlAbit := Value;
  if FSelectTextFizlAbit=true then
  begin
    DataSetFizlAbit.Active                         :=false;
    DataSetFizlAbit.Database                       := DataBasePrK_ABIT;
    DataSetFizlAbit.Transaction                    := TransactionReadPrK_ABIT;
    DataSetFizlAbit.SelectSQL.Clear;
    DataSetFizlAbit.SQLs.SelectSQL.Text            := 'Select * from PRK_DT_FIZL_ABIT_SELECT(:ID_MAN)';
    DataSetFizlAbit.ParamByName('ID_MAN').AsInt64  := ResultArray['AbitData']['ID_MAN'].AsInt64;
    DataSetFizlAbit.CloseOpen(false);
    if DataSetFizlAbit.FieldValues['ID_DT_FIZL_ABIT']<>Null
     then ID_DT_FIZL_ABIT_OUT:=DataSetFizlAbit.FieldValues['ID_DT_FIZL_ABIT'];
    TFrameParents1.InicDataFrame(ChangePrK);
  end;
end;

procedure TFormPRK_DT_ABIT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if ResultArray['Input']['Rejim'].AsVariant<>AddPrk then
    begin
        ResultArray:=nil;
        ResultArray.Free;
    end
    else
        ResultArray['Output']['ID_ABIT_OUT'].AsInt64:=ID_ABIT_OUT;
    TFrameOcenki1.RxMemoryDataCanUpdateOcenki.Close;
    TFrameOcenki1.RxMemoryDataOcenki.Close;
    TFrameOcenki1.RxMemoryDataCanUpdateOcenki.Free;
    TFrameOcenki1.RxMemoryDataOcenki.Free;
    TFrameDocEducation1.RxMemoryDataDocEducation.Free;
    TFrameDopDoc1.RxMemoryDataDopDoc.Free;
    TFrameInLang1.RxMemoryDataInLang.Free;
    if FormStyle= fsMDIChild then Action:=caFree;
  Release;
end;

procedure TFormPRK_DT_ABIT.SetIndLangAbit(const Value: integer);
begin
  FIndLangAbit := Value;
end;

procedure TFormPRK_DT_ABIT.ActionADDDEExecute(Sender: TObject);
begin
   TFrameDocEducation1.ADDDocEduc;
end;

procedure TFormPRK_DT_ABIT.ActionChangeDEExecute(Sender: TObject);
begin
  if TFrameDocEducation1.RxMemoryDataDocEducation.RecordCount>0
   then TFrameDocEducation1.ChangeDocEduc;

end;

procedure TFormPRK_DT_ABIT.ActionViewDEExecute(Sender: TObject);
begin
  if TFrameDocEducation1.RxMemoryDataDocEducation.RecordCount>0
   then TFrameDocEducation1.ViewDocEduc;
end;

procedure TFormPRK_DT_ABIT.ActionDELDEExecute(Sender: TObject);
begin
  if TFrameDocEducation1.RxMemoryDataDocEducation.RecordCount>0
   then TFrameDocEducation1.DelDocEduc;

end;

procedure TFormPRK_DT_ABIT.ActionAddDDExecute(Sender: TObject);
begin
   TFrameDopDoc1.ADDDopDoc;
end;

procedure TFormPRK_DT_ABIT.ActionChangeDDExecute(Sender: TObject);
begin
  if TFrameDopDoc1.RxMemoryDataDopDoc.RecordCount>0
   then TFrameDopDoc1.ChangeDopDoc;
end;

procedure TFormPRK_DT_ABIT.ActionViewDDExecute(Sender: TObject);
begin
  if TFrameDopDoc1.RxMemoryDataDopDoc.RecordCount>0
   then TFrameDopDoc1.ViewDopDoc;
end;

procedure TFormPRK_DT_ABIT.ActionDelDDExecute(Sender: TObject);
begin
  if TFrameDopDoc1.RxMemoryDataDopDoc.RecordCount>0
   then TFrameDopDoc1.DelDopDoc;
end;

procedure TFormPRK_DT_ABIT.ActionAddILExecute(Sender: TObject);
begin
   TFrameInLang1.ADDInLAng;
end;

procedure TFormPRK_DT_ABIT.ActionChangeILExecute(Sender: TObject);
begin
  if TFrameInLang1.RxMemoryDataInLang.RecordCount>0
   then TFrameInLang1.ChangeInLAng;
end;

procedure TFormPRK_DT_ABIT.ActionViewILExecute(Sender: TObject);
begin
  if TFrameInLang1.RxMemoryDataInLang.RecordCount>0
   then TFrameInLang1.ViewInLAng;
end;

procedure TFormPRK_DT_ABIT.ActionDelILExecute(Sender: TObject);
begin
  if TFrameInLang1.RxMemoryDataInLang.RecordCount>0
   then TFrameInLang1.DELInLAng;
end;

procedure TFormPRK_DT_ABIT.PageControlAbitChange(Sender: TObject);
begin
 if PageControlAbit.ActivePage.Name=TabSheetDocEducation.Name then
  begin
    if (ResultArray['Input']['Rejim'].AsVariant<>ViewPrK) then
    begin
      ActionADDDE.Enabled    :=true;
      ActionChangeDE.Enabled :=true;
      ActionDELDE.Enabled    :=true;

      ActionADDDD.Enabled    :=true;
      ActionChangeDD.Enabled :=true;
      ActionDELDD.Enabled    :=true;

      ActionADDIL.Enabled    :=true;
      ActionChangeIL.Enabled :=true;
      ActionDELIL.Enabled    :=true;
    end;
     ActionViewDE.Enabled   :=true;
     ActionViewDD.Enabled   :=true;
     ActionViewIL.Enabled   :=true;
  end
  else begin
     ActionADDDE.Enabled    :=false;
     ActionChangeDE.Enabled :=false;
     ActionDELDE.Enabled    :=false;
     ActionViewDE.Enabled   :=false;

     ActionADDDD.Enabled    :=false;
     ActionChangeDD.Enabled :=false;
     ActionDELDD.Enabled    :=false;
     ActionViewDD.Enabled   :=false;

  end;

 if PageControlAbit.ActivePage.Name=TabSheetOcenki.Name then
  begin
    if (ResultArray['Input']['Rejim'].AsVariant<>ViewPrK) then
    begin
      ActionADDIL.Enabled    :=true;
      ActionChangeIL.Enabled :=true;
      ActionDELIL.Enabled    :=true;
    end;
      ActionViewIL.Enabled   :=true;
  end
  else begin
     ActionADDIL.Enabled    :=false;
     ActionChangeIL.Enabled :=false;
     ActionDELIL.Enabled    :=false;
     ActionViewIL.Enabled   :=false;
  end;
  if PageControlAbit.ActivePage=TabSheetSertifikat
  then begin
      TFrameSertifikat1.DSetSertifikat.CloseOpen(true);
      TFrameSertifikat1.DSetMarks.CloseOpen(true);
  end;
end;


procedure TFormPRK_DT_ABIT.PageControlAbitChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
 if PageControlAbit.ActivePage.Name= TabSheetOcenki.Name
   then AllowChange:=TFrameOcenki1.CanChangeSheet;
end;

procedure TFormPRK_DT_ABIT.TabSheetOcenkiShow(Sender: TObject);
begin
   TFrameOcenki1.OnActiveSheetOcenki;
end;

procedure TFormPRK_DT_ABIT.TabSheetPerevagiShow(Sender: TObject);
begin
    TFramePerevagi1.OnActiveSheetPerevagi;
end;

procedure TFormPRK_DT_ABIT.TabSheetDopolnVedomostiShow(Sender: TObject);
begin
    TFrameDopolnVedomosti1.OnActiveSheetDopVedom;
end;

procedure TFormPRK_DT_ABIT.SetSelectSQLTextFizlAbit(const Value: String);
begin
  FSelectSQLTextFizlAbit := Value;
  DataSetFizlAbit.Active                         :=false;
    DataSetFizlAbit.Database                       := DataBasePrK_ABIT;
    DataSetFizlAbit.Transaction                    := TransactionReadPrK_ABIT;
    DataSetFizlAbit.SelectSQL.Clear;
    DataSetFizlAbit.SQLs.SelectSQL.Text            := FSelectSQLTextFizlAbit;
    DataSetFizlAbit.ParamByName('ID_MAN').AsInt64  := DataSetPrK_ABIT.FieldValues['ID_MAN'];
  DataSetFizlAbit.CloseOpen(false);
end;

procedure TFormPRK_DT_ABIT.SetSelectSQLTextConsts(const Value: String);
begin
    FSelectSQLTextConsts := Value;
    DataSetConsts.Active                         :=false;
    DataSetConsts.Database                       := DataBasePrK_ABIT;
    DataSetConsts.Transaction                    := TransactionReadPrK_ABIT;
    DataSetConsts.SelectSQL.Clear;
    DataSetConsts.SQLs.SelectSQL.Text            := FSelectSQLTextConsts;
    DataSetConsts.CloseOpen(false);
end;

procedure TFormPRK_DT_ABIT.InicDataAbit;
begin
  if ResultArray['Input']['Rejim'].AsVariant=ViewPrK
   then cxEditStyleControllerAbit.Style.Color :=TextViewColor;

  TFrameFioAbit1.InicDataFrame(ResultArray['Input']['Rejim'].AsVariant);

  TFrameDocEducation1.SelectTextFrameDocEducation :=true;
  TFrameDopDoc1.SelectTextFrameDopDoc             :=true;
  TFrameInLang1.SelectTextFrameInLang             :=true;

  TFrameVstup1.InicDataFrame(ResultArray['Input']['Rejim'].AsVariant);
  TFrameDocEducation1.InicDataFrame(ResultArray['Input']['Rejim'].AsVariant);
  TFrameDopDoc1.InicDataFrame(ResultArray['Input']['Rejim'].AsVariant);
  TFrameOcenki1.InicDataFrame(ResultArray['Input']['Rejim'].AsVariant);
  TFrameInLang1.InicDataFrame(ResultArray['Input']['Rejim'].AsVariant);
  TFramePerevagi1.InicDataFrame(ResultArray['Input']['Rejim'].AsVariant);
  TFrameParents1.InicDataFrame(ResultArray['Input']['Rejim'].AsVariant);
  TFrameWorkStaj1.InicDataFrame(ResultArray['Input']['Rejim'].AsVariant);
  TFrameDopolnVedomosti1.InicDataFrame(ResultArray['Input']['Rejim'].AsVariant);
end;

procedure TFormPRK_DT_ABIT.ActionSaveExecute(Sender: TObject);
begin
//----------FizlAbit---------------\\
   if trim(TFrameFioAbit1.cxButtonEditFioAbit.Text)='' then
   begin
     ShowMessage(nMsgEmptyFioAbit[IndLangAbit]);
     TabSheetFioAbit.Show;
     TFrameFioAbit1.cxButtonEditFioAbit.SetFocus;
     exit;
   end;

   //----------Prk_Dt_Abit_Change---------------\\
   if TFrameVstup1.ProverkaOnExists=1
    then exit;
   if TFrameDocEducation1.ProverkaOnExists=1
    then exit;
   if TFrameInLang1.ProverkaOnExists=1
    then exit;

//----------FizlAbit---------------\\
   if TFrameDopolnVedomosti1.ProverkaOnExists=1
    then exit;

//----------Ocenki---------------\\
   if TFrameDocEducation1.OnMainDocObrIsNotDovidka=1 then
   begin
       TFrameOcenki1.RxMemoryDataOcenki.First;
       while not TFrameOcenki1.RxMemoryDataOcenki.Eof do
       begin
         if ((TFrameOcenki1.RxMemoryDataOcenki.FieldValues['OCENKA']=Null)               or
             (Trim(VarToStr(TFrameOcenki1.RxMemoryDataOcenki.FieldValues['OCENKA']))='' )  )  then
            begin
            //  TFrameOcenki1.RxMemoryDataOcenki.FieldValues['OCENKA']:= 0
           {   ShowMessage(nMsgEmptyOCENKA[IndLangAbit]);
               TabSheetOcenki.Show;
               exit;  }
            end;
         TFrameOcenki1.RxMemoryDataOcenki.Next;
       end;
   end;

   if Trim(TFrameOcenki1.cxPopupEditSeredniyBal.Text)='' then
       begin
          TFrameOcenki1.cxPopupEditSeredniyBal.Text := '0';
          {  ShowMessage(nMsgEmptySrBal[IndLangAbit]);
            TabSheetOcenki.Show;
            TFrameOcenki1.cxPopupEditSeredniyBal.SetFocus;
            exit; }
        end;

//---------Save FizlAbit&Ocenki----------\\
   StoredProcFizlAbitOcen.Transaction.StartTransaction;
    SaveFizlAbit;
    SaveOcen;
{   try
      StoredProcFizlAbitOcen.Transaction.commit;
      TFrameFioAbit1.cxButtonEditFioAbit.Enabled:=false;
   except on e: Exception do
      begin
         MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangAbit]+chr(13)+
                    nMsgTryAgain[IndLangAbit]+nMsgOr[IndLangAbit]+nMsgToAdmin[IndLangAbit]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[IndLangAbit]),MB_OK or MB_ICONWARNING);
         StoredProcFizlAbitOcen.Transaction.Rollback;
         TFrameFioAbit1.cxButtonEditFioAbit.Enabled:=True;
         ID_DT_FIZL_ABIT_OUT:=-999;
         Exit;
      end;
   end;   }
//---------Save Prk_Dt_Abit----------\\
  CanCommitAbitTr:=true;
//  StoredProcPrK_ABIT.Transaction.StartTransaction;
    SaveDT_ABIT;
    if CanCommitAbitTr then TFrameDocEducation1.SaveDocEduc;
    if CanCommitAbitTr then TFrameDopDoc1.SaveDopDoc;
    if CanCommitAbitTr then TFramePerevagi1.SavePreim;
    if CanCommitAbitTr then TFrameInLang1.SaveInLang;
    if CanCommitAbitTr then TFrameDopolnVedomosti1.SaveDopolnVedomosti;

    if not CanCommitAbitTr then
      begin
{//}        ID_DT_FIZL_ABIT_OUT:=-999;
       //    StoredProcPrK_ABIT.Transaction.Rollback;
             Exit;
      end
    else
   try
      StoredProcPrK_ABIT.Transaction.commit;
{//}      TFrameFioAbit1.cxButtonEditFioAbit.Enabled:=false;
      TFrameDocEducation1.RxMemoryDataDocEducation.Edit;
      TFrameDocEducation1.RxMemoryDataDocEducation.Post;
   except on e: Exception do
      begin
         MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangAbit]+chr(13)+
                    nMsgTryAgain[IndLangAbit]+nMsgOr[IndLangAbit]+nMsgToAdmin[IndLangAbit]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[IndLangAbit]),MB_OK or MB_ICONWARNING);
         StoredProcPrK_ABIT.Transaction.Rollback;
{//}        TFrameFioAbit1.cxButtonEditFioAbit.Enabled:=True;
{//}        ID_DT_FIZL_ABIT_OUT:=-999;
         TFrameDocEducation1.RxMemoryDataDocEducation.Cancel;
         Exit;
      end;
   end;

 //-------------------
  DataSetPrK_ABIT.CloseOpen(false); //04.03.07 возможны бока
  ShowMessage(nMsgSaveAbitWasOk[IndLangAbit]);

  if RejimPrK(ResultArray['Input']['Rejim'].AsVariant)=AddPrK
   then CLOSE;// Можно будет обойтись без CLOSE, но только нужно всю форму заново обновить!!!
end;

procedure TFormPRK_DT_ABIT.SaveFizlAbit;
begin

   case RejimPrK(ResultArray['Input']['Rejim'].AsVariant) of
     AddPrK:    begin
                   if ID_DT_FIZL_ABIT_OUT=-999 then
                    begin
                       StoredProcFizlAbitOcen.StoredProcName:='PRK_DT_FIZL_ABIT_ADD';
                       StoredProcFizlAbitOcen.Prepare;
                       StoredProcFizlAbitOcen.ParamByName('ID_MAN').AsInt64           :=ResultArray['AbitData']['ID_MAN'].AsInt64;
                       Add_Ocen_orChange:=true;
                    end
                    else begin
                       StoredProcFizlAbitOcen.StoredProcName:='PRK_DT_FIZL_ABIT_CHANGE';
                       StoredProcFizlAbitOcen.Prepare;
                       StoredProcFizlAbitOcen.ParamByName('ID_DT_FIZL_ABIT').AsInt64   :=ID_DT_FIZL_ABIT_OUT;
                       Add_Ocen_orChange:=false;
                    end;
                end;
     ChangePrK: begin
                   StoredProcFizlAbitOcen.StoredProcName:='PRK_DT_FIZL_ABIT_CHANGE';
                   StoredProcFizlAbitOcen.Prepare;
                   StoredProcFizlAbitOcen.ParamByName('ID_DT_FIZL_ABIT').AsInt64   :=DataSetFizlAbit.FieldValues['ID_DT_FIZL_ABIT'];
                end;
   end;
   StoredProcFizlAbitOcen.ParamByName('ID_SP_UKR_LANG').AsInt64   :=ResultArray['AbitData']['ID_SP_UKR_LANG'].AsInt64;
   StoredProcFizlAbitOcen.ParamByName('ID_SP_GURTOG').AsInt64     :=ResultArray['AbitData']['ID_SP_GURTOG'].AsInt64;
   StoredProcFizlAbitOcen.ParamByName('ID_CN_SP_NATIONAL').AsInt64:=ResultArray['AbitData']['ID_CN_SP_NATIONAL'].AsInt64;
   StoredProcFizlAbitOcen.ParamByName('MEST_RAB').AsString        :=TFrameWorkStaj1.cxTextEditMestoRaboti.Text;
   StoredProcFizlAbitOcen.ParamByName('DOLGN_RAB').AsString       :=TFrameWorkStaj1.cxTextEditDoljnost.Text;
   if trim(TFrameWorkStaj1.cxTextEditAllStaj.Text)=''
      then StoredProcFizlAbitOcen.ParamByName('OB_STAG').AsInteger        :=0
      else StoredProcFizlAbitOcen.ParamByName('OB_STAG').AsInteger        :=StrToInt(TFrameWorkStaj1.cxTextEditAllStaj.Text);
   StoredProcFizlAbitOcen.ParamByName('O_FAMILIA').AsString       :=TFrameParents1.cxTextEditOtecFam.Text;
   StoredProcFizlAbitOcen.ParamByName('O_IMYA').AsString          :=TFrameParents1.cxTextEditOtecName.Text;
   StoredProcFizlAbitOcen.ParamByName('O_OTCHESTVO').AsString     :=TFrameParents1.cxTextEditOtecOtch.Text;
   StoredProcFizlAbitOcen.ParamByName('O_MEST_RAB').AsString      :=TFrameParents1.cxTextEditOtecMestoRaboti.Text;
   StoredProcFizlAbitOcen.ParamByName('O_DOLGN_RAB').AsString     :=TFrameParents1.cxTextEditOtecDoljnost.Text;
   StoredProcFizlAbitOcen.ParamByName('O_PHONE').AsString         :=TFrameParents1.cxMaskEditOtecTel.Text;
   StoredProcFizlAbitOcen.ParamByName('M_FAMILIA').AsString       :=TFrameParents1.cxTextEditMotherFam.Text;
   StoredProcFizlAbitOcen.ParamByName('M_IMYA').AsString          :=TFrameParents1.cxTextEditMotherName.Text;
   StoredProcFizlAbitOcen.ParamByName('M_OTCHESTVO').AsString     :=TFrameParents1.cxTextEditMotherOtch.Text;
   StoredProcFizlAbitOcen.ParamByName('M_MEST_RAB').AsString      :=TFrameParents1.cxTextEditMotherMestoRaboti.Text;
   StoredProcFizlAbitOcen.ParamByName('M_DOLGN_RAB').AsString     :=TFrameParents1.cxTextEditMotherDoljnost.Text;
   StoredProcFizlAbitOcen.ParamByName('M_PHONE').AsString         :=TFrameParents1.cxMaskEditMotherTel.Text;
   StoredProcFizlAbitOcen.ParamByName('ID_USER').AsInt64          :=ID_USER_GLOBAL;
   StoredProcFizlAbitOcen.ExecProc;
   if StoredProcFizlAbitOcen.StoredProcName='PRK_DT_FIZL_ABIT_ADD'
    then ID_DT_FIZL_ABIT_OUT:=StoredProcFizlAbitOcen.FieldByName('ID_OUT').AsInt64
end;


procedure TFormPRK_DT_ABIT.SaveOcen;
begin
   TFrameOcenki1.RxMemoryDataOcenki.First;
   while not TFrameOcenki1.RxMemoryDataOcenki.eof do
    begin
     case RejimPrK(ResultArray['Input']['Rejim'].AsVariant) of
       AddPrK:    begin
                     if (( (TFrameOcenki1.RxMemoryDataOcenki.FieldValues['ID_DT_OCEN_AT']=null) or
                           (TFrameOcenki1.RxMemoryDataOcenki.FieldValues['ID_DT_OCEN_AT']<=0)
                         ) and
                          (Add_Ocen_orChange=true))
                      then begin
                       StoredProcFizlAbitOcen.StoredProcName:='PRK_DT_OCEN_AT_ADD';
                       StoredProcFizlAbitOcen.Prepare;
                      end
                      else begin
                       StoredProcFizlAbitOcen.StoredProcName:='PRK_DT_OCEN_AT_CHANGE';
                       StoredProcFizlAbitOcen.Prepare;
                       StoredProcFizlAbitOcen.ParamByName('ID_DT_OCEN_AT').AsInt64  :=
                       TFrameOcenki1.RxMemoryDataOcenki.FieldValues['ID_DT_OCEN_AT'];
                      end;
                  end;
       ChangePrK: begin
                     if ( (TFrameOcenki1.RxMemoryDataOcenki.FieldValues['ID_DT_OCEN_AT']=null) or
                          (TFrameOcenki1.RxMemoryDataOcenki.FieldValues['ID_DT_OCEN_AT']<=0  )   )

                      then begin
                       StoredProcFizlAbitOcen.StoredProcName:='PRK_DT_OCEN_AT_ADD';
                       StoredProcFizlAbitOcen.Prepare;
                      end
                      else begin
                       StoredProcFizlAbitOcen.StoredProcName:='PRK_DT_OCEN_AT_CHANGE';
                       StoredProcFizlAbitOcen.Prepare;
                       StoredProcFizlAbitOcen.ParamByName('ID_DT_OCEN_AT').AsInt64  :=
                         TFrameOcenki1.RxMemoryDataOcenki.FieldValues['ID_DT_OCEN_AT'];
                      end;

                  end;
     end;
     StoredProcFizlAbitOcen.ParamByName('ID_MAN').AsInt64           :=ResultArray['AbitData']['ID_MAN'].AsInt64;
     StoredProcFizlAbitOcen.ParamByName('ID_SP_PREDM_AT').AsInt64   :=TFrameOcenki1.RxMemoryDataOcenki.FieldValues['ID_SP_PREDM_AT'];
     StoredProcFizlAbitOcen.ParamByName('IS_OLD_AT').AsInteger      :=TFrameOcenki1.RxMemoryDataOcenki.FieldValues['IS_OLD_AT'];
   if TFrameDocEducation1.OnMainDocObrIsNotDovidka=1
    then  begin
           if ((TFrameOcenki1.RxMemoryDataOcenki.FieldValues['OCENKA']=Null) or
            (VarToStr(TFrameOcenki1.RxMemoryDataOcenki.FieldValues['OCENKA'])=''  )   )
           then StoredProcFizlAbitOcen.ParamByName('OCENKA').AsInteger       :=0
           else StoredProcFizlAbitOcen.ParamByName('OCENKA').AsInteger       :=TFrameOcenki1.RxMemoryDataOcenki.FieldValues['OCENKA'];
          end
    else begin
       if ((TFrameOcenki1.RxMemoryDataOcenki.FieldValues['OCENKA']=Null) or
           (VarToStr(TFrameOcenki1.RxMemoryDataOcenki.FieldValues['OCENKA'])=''  )   )
        then StoredProcFizlAbitOcen.ParamByName('OCENKA').AsInteger       :=0
        else StoredProcFizlAbitOcen.ParamByName('OCENKA').AsInteger       :=TFrameOcenki1.RxMemoryDataOcenki.FieldValues['OCENKA'];
    end;

     StoredProcFizlAbitOcen.ParamByName('ID_USER').AsInt64          :=ID_USER_GLOBAL;
     StoredProcFizlAbitOcen.ExecProc;
     TFrameOcenki1.RxMemoryDataOcenki.next;
    end
end;

procedure TFormPRK_DT_ABIT.SaveDT_ABIT;
var
   NomerDela:integer;
begin
   if (Trim(TFrameVstup1.cxTextEditNomerDela.Text)='') or
      (StrToInt(TFrameVstup1.cxTextEditNomerDela.Text)=0) then
    begin
      NomerDela:=TFrameVstup1.GetNomerDela;
    end
    else NomerDela:= StrToInt(TFrameVstup1.cxTextEditNomerDela.Text);

   StoredProcPrK_ABIT.StoredProcName:='PRK_DT_ABIT_CHANGE';
   StoredProcPrK_ABIT.Prepare;
   case RejimPrK(ResultArray['Input']['Rejim'].AsVariant) of
     AddPrK:    StoredProcPrK_ABIT.ParamByName('ID_DT_ABIT').AsInt64  :=-1;
     ChangePrK: StoredProcPrK_ABIT.ParamByName('ID_DT_ABIT').AsInt64  :=ID_DT_ABIT_GLOBAL;
   end;
   StoredProcPrK_ABIT.ParamByName('ID_SP_GOD_NABORA').AsInt64     :=ID_GOD_NABORA_GLOBAL;
   StoredProcPrK_ABIT.ParamByName('ID_MAN').AsInt64               :=ResultArray['AbitData']['ID_MAN'].AsInt64;
   StoredProcPrK_ABIT.ParamByName('ID_FAK_CENTER').AsInt64        :=TFrameVstup1.DataSetTypeDepart.fieldValues['ID_FAK_CENTER'];
   StoredProcPrK_ABIT.ParamByName('ID_SP_DEPARTMENT_FAK').AsInt64 :=TFrameVstup1.DataSetFacul.fieldValues['ID_CN_SP_FAK'];
   StoredProcPrK_ABIT.ParamByName('ID_CN_JN_FACUL_SPEC').AsInt64  :=TFrameVstup1.DataSetSpec.fieldValues['ID_CN_JN_FACUL_SPEC'];
   StoredProcPrK_ABIT.ParamByName('ID_CN_SP_FORM_STUD').AsInt64   :=TFrameVstup1.DataSetFormStudy.fieldValues['ID_CN_SP_FORM_STUD'];
   StoredProcPrK_ABIT.ParamByName('ID_SP_DERG_ZAKAZ').AsInt64     :=TFrameVstup1.DataSetDergZakaz.fieldValues['ID_SP_DERG_ZAKAZ'];
   StoredProcPrK_ABIT.ParamByName('ID_SP_KURS').AsInt64           :=TFrameVstup1.DataSetKurs.fieldValues['ID_SP_KURS'];
   StoredProcPrK_ABIT.ParamByName('ID_CN_SP_KAT_STUD').AsInt64    :=TFrameVstup1.DataSetKatStud.fieldValues['ID_CN_SP_KAT_STUD'];
   if Trim(TFrameDopolnVedomosti1.cxButtonEditVID_DOG.Text)=''
    then  StoredProcPrK_ABIT.ParamByName('ID_SP_VID_DOG').AsInt64        :=-1
    else  StoredProcPrK_ABIT.ParamByName('ID_SP_VID_DOG').AsInt64        :=ResultArray['AbitData']['ID_SP_VID_DOG'].AsInt64;
   StoredProcPrK_ABIT.ParamByName('ID_SP_VID_DII').AsInt64        := TFrameVstup1.DataSetVid_Dii.fieldValues['ID_SP_VID_DII'];
   StoredProcPrK_ABIT.ParamByName('ID_SP_NPK').AsInt64            := TFrameVstup1.DataSetNpk.fieldValues['ID_SP_NPK'];
   StoredProcPrK_ABIT.ParamByName('ID_SP_SROK_OB').AsInt64        :=TFrameVstup1.DataSetSrokOb.fieldValues['ID_SP_SROK_OB'];
   StoredProcPrK_ABIT.ParamByName('NOMER_DELA').AsInteger         :=NomerDela;
   StoredProcPrK_ABIT.ParamByName('GRUPPA').AsInt64               :=-1;
   StoredProcPrK_ABIT.ParamByName('DATE_BEG').AsDate              :=TFrameDopolnVedomosti1.cxDateEditDateBeg.Date;
   StoredProcPrK_ABIT.ParamByName('ID_DT_ABIT_12').AsInt64        :=-1;
   StoredProcPrK_ABIT.ParamByName('ID_SP_KAT_PRI_X').AsInt64      :=-1;
   StoredProcPrK_ABIT.ParamByName('ID_SP_KAT_PRI_D').AsInt64      :=-1;

   if trim(TFrameDopolnVedomosti1.cxButtonEditCel_Zamovnik.Text)=''
    then StoredProcPrK_ABIT.ParamByName('ID_SP_CEL_ZAMOVNIK').AsInt64 :=-1
    else StoredProcPrK_ABIT.ParamByName('ID_SP_CEL_ZAMOVNIK').AsInt64 :=ResultArray['AbitData']['ID_SP_CEL_ZAMOVNIK'].AsInt64;

   StoredProcPrK_ABIT.ParamByName('ID_SP_POTOK').AsInt64          :=ResultArray['AbitData']['ID_SP_POTOK'].AsInt64;

   if TFrameDopolnVedomosti1.cxCheckBoxIS_SB_OTKAZ.Checked=true
    then StoredProcPrK_ABIT.ParamByName('IS_SB_OTKAZ').AsInteger      :=1
    else StoredProcPrK_ABIT.ParamByName('IS_SB_OTKAZ').AsInteger      :=0;

   if trim(TFrameWorkStaj1.cxTextEditSpecStaj.Text)=''
    then StoredProcPrK_ABIT.ParamByName('SPEC_STAG').AsInteger        :=0
    else StoredProcPrK_ABIT.ParamByName('SPEC_STAG').AsInteger        :=StrToInt(TFrameWorkStaj1.cxTextEditSpecStaj.Text);

   StoredProcPrK_ABIT.ParamByName('SBAL').AsDouble                :=StrToFloat(TFrameOcenki1.cxPopupEditSeredniyBal.text);
   StoredProcPrK_ABIT.ParamByName('ID_USER').AsInt64              :=ID_USER_GLOBAL;

     try
        StoredProcPrK_ABIT.ExecProc;
     except on e: Exception do
        begin
           MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangAbit]+chr(13)+
                      nMsgTryAgain[IndLangAbit]+nMsgOr[IndLangAbit]+nMsgToAdmin[IndLangAbit]+chr(13)+
                      e.Message),Pchar(nMsgBoxTitle[IndLangAbit]),MB_OK or MB_ICONWARNING);
           StoredProcPrK_ABIT.Transaction.Rollback;
           CanCommitAbitTr:=false;
           exit;
        end;
     end;

   ID_ABIT_OUT:=StoredProcPrK_ABIT.FieldByName('ID_OUT_ABIT').AsInt64
end;

procedure TFormPRK_DT_ABIT.ActionDelAbitExecute(Sender: TObject);
begin
   if prkMessageDlg(nMsgBoxTitle[IndLangAbit],nMsgDelAbit[IndLangAbit],
                        mtInformation,mbOKCancel,IndLangAbit)=mrOK then
         begin
            StoredProcPrK_ABIT.Transaction.StartTransaction;
            StoredProcPrK_ABIT.StoredProcName:='PRK_DT_ABIT_DEL';
            StoredProcPrK_ABIT.Prepare;
            StoredProcPrK_ABIT.ParamByName('ID_USER').AsInt64   :=ID_USER_GLOBAL;
            StoredProcPrK_ABIT.ParamByName('ID_DT_ABIT').AsInt64:=ID_DT_ABIT_GLOBAL;
            try
              StoredProcPrK_ABIT.ExecProc;
              StoredProcPrK_ABIT.Transaction.Commit;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangAbit]+chr(13)+
                        nMsgTryAgain[IndLangAbit]+nMsgOr[IndLangAbit]+nMsgToAdmin[IndLangAbit]+chr(13)+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangAbit]),MB_OK or MB_ICONWARNING);
                 StoredProcPrK_ABIT.Transaction.Rollback;
               end;
            end;
            close;
         end;
end;

procedure TFormPRK_DT_ABIT.ActionExitExecute(Sender: TObject);
begin
   close;
end;

procedure TFormPRK_DT_ABIT.ActionPrintAbitExecute(Sender: TObject);
var
   T:TFormPrintAbit;
begin
   ID_KAT_STUD := TFrameVstup1.DataSetKatStud.FieldValues['Id_Sp_Type_Kat_Stud'];
   T:= TFormPrintAbit.Create(self);
   T.ShowModal;
   T.Free;
end;

procedure TFormPRK_DT_ABIT.ActionAdminInfoExecute(Sender: TObject);
begin
    TFrameVstup1.ShowIdValues;
end;

procedure TFormPRK_DT_ABIT.FormShow(Sender: TObject);
begin
                                       {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[IndLangAbit]),KLF_ACTIVATE);
end;


procedure TFormPRK_DT_ABIT.BBAddSertifikatClick(Sender: TObject);
begin
    TFrameSertifikat1.AddSertifikat;
end;

procedure TFormPRK_DT_ABIT.BBEditSertifikatClick(Sender: TObject);
begin
    TFrameSertifikat1.EditSertifikat;
end;

procedure TFormPRK_DT_ABIT.BBDelSertifikatClick(Sender: TObject);
begin
    TFrameSertifikat1.DelSertifikat;
end;

procedure TFormPRK_DT_ABIT.BBViewSertifikatClick(Sender: TObject);
begin
    TFrameSertifikat1.ViewSertifikat;
end;

procedure TFormPRK_DT_ABIT.TFrameSertifikat1cxGridViewMarks_OCENKAPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
    TFrameSertifikat1.ChangeMark(DisplayValue);
end;

procedure TFormPRK_DT_ABIT.BBCheckSertifikatClick(Sender: TObject);
begin
    TFrameSertifikat1.CheckMarks;
end;

end.
