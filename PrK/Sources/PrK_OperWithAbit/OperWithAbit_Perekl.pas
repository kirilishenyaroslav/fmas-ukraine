unit OperWithAbit_Perekl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, AArray, FIBQuery,
  pFIBQuery, pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, IBase, ib_externals,
  cxStyles, cxContainer, cxEdit, cxTextEdit, cxLabel, cxGroupBox,
  cxButtonEdit, cxControls, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, OperWithAbit_uFrameVstup,
  cxLookAndFeelPainters, cxButtons, ActnList;

type
  TFPrKPereklad = class(TForm)
    FrameVstup2: TFrameVstup;
    DataBasePrK_Abit: TpFIBDatabase;
    TransactionReadPrK_ABIT: TpFIBTransaction;
    TransactionWritePrK_ABIT: TpFIBTransaction;
    StoredProcPrK_ABIT: TpFIBStoredProc;
    cxEditStyleControllerAbit: TcxEditStyleController;
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
    cxStyleSkyBlue: TcxStyle;
    OldGB: TGroupBox;
    GroupBoxVstup: TcxGroupBox;
    LabelFacul: TcxLabel;
    LabelFormStudy: TcxLabel;
    LabelKatStud: TcxLabel;
    LabelSpec: TcxLabel;
    LabelTypeDepart: TcxLabel;
    LabelDergZakaz: TcxLabel;
    LabelKurs: TcxLabel;
    LabelNomerDela: TcxLabel;
    LabelNomerDela_Pristavka: TcxLabel;
    LabelPotok: TcxLabel;
    TextEditNomerDela: TcxTextEdit;
    DSetPerekl: TpFIBDataSet;
    DSourcePerekl: TDataSource;
    TypeDepartTE: TcxTextEdit;
    SpecTE: TcxTextEdit;
    KatStud: TcxTextEdit;
    FaculTE: TcxTextEdit;
    DergZakazTE: TcxTextEdit;
    FormStudyTE: TcxTextEdit;
    KursTE: TcxTextEdit;
    PotokTE: TcxTextEdit;
    PereklBtn: TcxButton;
    DelBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList1: TActionList;
    PereklAction: TAction;
    DelAction: TAction;
    CancelAction: TAction;
    FIOLabel: TcxLabel;
    NewGB: TGroupBox;
    procedure FormCreate(Sender: TObject);
    procedure PereklActionExecute(Sender: TObject);
    procedure DelActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
  private
    DBHANDLE             :TISC_DB_HANDLE;
  public
    ID_GOD_NABORA_GLOBAL :int64; //  переменная данные для которой всегда передаются!
    ID_DT_ABIT_GLOBAL    :int64; //  переменная данные для которой всегда передаются!
    ID_USER_GLOBAL       :int64; //  переменная данные для которой всегда передаются!
    ID_ABIT_OUT          :int64;
    ID_DT_FIZL_ABIT_OUT  :int64;
    TextViewColor        :TColor;
    ResultArray          :TAArray;
//    CanCommitAbitTr      :boolean;
    IndLangAbit:Integer;
    New_ID_DT_ABIT:Int64;
    constructor Create(aOwner: TComponent;aParam :TAArray);reintroduce;
  end;

implementation

{$R *.dfm}

uses uConstants, uPrK_Resources, DateUtils;

constructor TFPrKPereklad.Create(aOwner: TComponent; aParam: TAArray);
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

procedure TFPrKPereklad.FormCreate(Sender: TObject);
var i:Integer;
begin
  ID_GOD_NABORA_GLOBAL   :=ResultArray['Input']['GodNabora'].AsInt64;
  ID_DT_ABIT_GLOBAL      :=ResultArray['Input']['ID_DT_ABIT'].AsInt64;
  ID_USER_GLOBAL         :=ResultArray['Input']['ID_USER_GLOBAL'].AsInt64;

  New_ID_DT_ABIT:=-1;

// Старое неактивное
 i:=IndLangAbit;

 Caption:=nFormPRK_Perekl_Caption[i];
 OldGB.Caption:=nOldData[i];
 NewGB.Caption:=nNewData[i];

 LabelTypeDepart.Caption :=nLabelTypeDepart[i];
 LabelKatStud.Caption    :=nLabelCnKatStud[i];
 LabelFacul.Caption      :=nLabelNameCnFak[i];
 LabelSpec.Caption       :=nLabelNameSpec[i];
 LabelFormStudy.Caption  :=nLabelCnFormStud[i];
 LabelDergZakaz.Caption  :=nLabelDergZakaz[i];
 LabelKurs.Caption       :=nLabelKurs[i];
 LabelPotok.Caption      :=nLabelPotok[i];

 LabelNomerDela.Caption  :=nLabelNomerDela[i];
 LabelNomerDela_Pristavka.Caption:='';

 TextEditNomerDela.Text    := '0';

 // Новое активное
 FrameVstup2.InicCaptionFrame;

// Действия
 CancelAction.Caption:=nActiont_Otmena[i];
 PereklAction.Caption:=nActionPerekl[i];
 DelAction.Caption   :=nAction_Del[i];

 CancelAction.Hint:=nActiont_Otmena[i];
 PereklAction.Hint:=nActionPerekl[i];
 DelAction.Hint   :=nAction_Del[i];

  DataBasePrK_Abit.Handle:=DBHANDLE;
  TransactionReadPrK_ABIT.Active:=True;

  if DSetPerekl.Active then DSetPerekl.Close;
  DSetPerekl.SQLs.SelectSQL.Text:='SELECT * FROM PRK_DT_ABIT_PEREKL_SELECT('
                                  +IntToStr(ID_DT_ABIT_GLOBAL)+','+IntToStr(ID_GOD_NABORA_GLOBAL)+')';
  DSetPerekl.Open;

  TypeDepartTE.Text:=DSetPerekl['NAME_FAK_CENTER'];
  KatStud.Text     :=DSetPerekl['SHORT_NAME_KAT_STUD'];
  FaculTE.Text     :=DSetPerekl['SHORT_NAME_FAK'];
  SpecTE.Text      :=DSetPerekl['SHORT_NAME_SPEC'];
  FormStudyTE.Text :=DSetPerekl['SHORT_NAME_FORM_STUD'];
  DergZakazTE.Text :=DSetPerekl['SHORT_NAME_DERG_ZAKAZ'];
  KursTE.Text      :=DSetPerekl['SHORT_NAME_KURS'];
  PotokTE.Text     :=DSetPerekl['NAME_POTOK'];

  TextEditNomerDela.Text:=DSetPerekl['NOMER_DELA'];
  LabelNomerDela_Pristavka.Caption:=DSetPerekl['SMALL_NAME_SPEC']+'-';

  FIOLabel.Caption:=DSetPerekl['FIO'];

  FrameVstup2.SelectTextFrameVstup:=True;

  FrameVstup2.InicDataFrame(AddPrK);

end;

procedure TFPrKPereklad.PereklActionExecute(Sender: TObject);
begin
  if (FrameVstup2.ProverkaOnExists=1) then Exit;

  try
   StoredProcPrK_ABIT.Transaction.StartTransaction;
   StoredProcPrK_ABIT.StoredProcName:='PRK_DT_ABIT_PEREKL_ADD';
   StoredProcPrK_ABIT.Prepare;

   StoredProcPrK_ABIT.ParamByName('ID_DT_ABIT').AsInt64  :=ID_DT_ABIT_GLOBAL;
   StoredProcPrK_ABIT.ParamByName('ID_SP_GOD_NABORA').AsInt64     :=ID_GOD_NABORA_GLOBAL;
   StoredProcPrK_ABIT.ParamByName('ID_FAK_CENTER').AsInt64        :=FrameVstup2.DataSetTypeDepart.fieldValues['ID_FAK_CENTER'];
   StoredProcPrK_ABIT.ParamByName('ID_SP_DEPARTMENT_FAK').AsInt64 :=FrameVstup2.DataSetFacul.fieldValues['ID_CN_SP_FAK'];
   StoredProcPrK_ABIT.ParamByName('ID_CN_JN_FACUL_SPEC').AsInt64  :=FrameVstup2.DataSetSpec.fieldValues['ID_CN_JN_FACUL_SPEC'];
   StoredProcPrK_ABIT.ParamByName('ID_CN_SP_FORM_STUD').AsInt64   :=FrameVstup2.DataSetFormStudy.fieldValues['ID_CN_SP_FORM_STUD'];
   StoredProcPrK_ABIT.ParamByName('ID_SP_DERG_ZAKAZ').AsInt64     :=FrameVstup2.DataSetDergZakaz.fieldValues['ID_SP_DERG_ZAKAZ'];
   StoredProcPrK_ABIT.ParamByName('ID_SP_KURS').AsInt64           :=FrameVstup2.DataSetKurs.fieldValues['ID_SP_KURS'];
   StoredProcPrK_ABIT.ParamByName('ID_CN_SP_KAT_STUD').AsInt64    :=FrameVstup2.DataSetKatStud.fieldValues['ID_CN_SP_KAT_STUD'];
   StoredProcPrK_ABIT.ParamByName('ID_SP_NPK').AsInt64            :=FrameVstup2.DataSetNpk.fieldValues['ID_SP_NPK'];
   StoredProcPrK_ABIT.ParamByName('ID_SP_SROK_OB').AsInt64        :=FrameVstup2.DataSetSrokOb.fieldValues['ID_SP_SROK_OB'];
   if (FrameVstup2.cxTextEditNomerDela.Text='') or (FrameVstup2.cxTextEditNomerDela.Text='0') then
     StoredProcPrK_ABIT.ParamByName('NOMER_DELA').AsInteger         :=0
   else
     StoredProcPrK_ABIT.ParamByName('NOMER_DELA').AsInteger         :=StrToInt(FrameVstup2.cxTextEditNomerDela.Text);

   StoredProcPrK_ABIT.ParamByName('ID_SP_POTOK').AsInt64        :=ResultArray['AbitData']['ID_SP_POTOK'].AsInt64;
   StoredProcPrK_ABIT.ParamByName('DATE_PEREKL').AsDate              :=FrameVstup2.cxDateEditDatePerekl.Date;
   StoredProcPrK_ABIT.ParamByName('ID_USER').AsInt64        :=   ID_USER_GLOBAL;

   StoredProcPrK_ABIT.ParamByName('ID_SP_TYPE_PEREKL').AsInt64:=ResultArray['AbitData']['ID_SP_TYPE_PEREKL'].AsInt64;
   StoredProcPrK_ABIT.ExecProc;
   New_ID_DT_ABIT:=StoredProcPrK_ABIT.FN('ID_OUT_ABIT').AsInt64;
   StoredProcPrK_ABIT.Transaction.Commit;

   ModalResult:=mrYes;

  except on e: Exception do
    begin
      MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangAbit]+chr(13)+
                      nMsgTryAgain[IndLangAbit]+nMsgOr[IndLangAbit]+nMsgToAdmin[IndLangAbit]+chr(13)+
                      e.Message),Pchar(nMsgBoxTitle[IndLangAbit]),MB_OK or MB_ICONWARNING);
      StoredProcPrK_ABIT.Transaction.Rollback;
    end;
 end;
end;

procedure TFPrKPereklad.DelActionExecute(Sender: TObject);
begin
  if prkMessageDlg(nMsgBoxTitle[IndLangAbit],nMsgDelAbit[IndLangAbit],mtConfirmation,[mbYes,mbNo],IndLangAbit)=mrNo then Exit;
  try
   StoredProcPrK_ABIT.Transaction.StartTransaction;
   StoredProcPrK_ABIT.StoredProcName:='PRK_DT_ABIT_PEREKL_DEL';
   StoredProcPrK_ABIT.Prepare;

   StoredProcPrK_ABIT.ParamByName('ID_DT_ABIT').AsInt64  :=ID_DT_ABIT_GLOBAL;
   StoredProcPrK_ABIT.ParamByName('ID_USER').AsInt64        :=   ID_USER_GLOBAL;

   StoredProcPrK_ABIT.ExecProc;
   StoredProcPrK_ABIT.Transaction.Commit;

   ModalResult:=mrNo;

  except on e: Exception do
    begin
      MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangAbit]+chr(13)+
                      nMsgTryAgain[IndLangAbit]+nMsgOr[IndLangAbit]+nMsgToAdmin[IndLangAbit]+chr(13)+
                      e.Message),Pchar(nMsgBoxTitle[IndLangAbit]),MB_OK or MB_ICONWARNING);
      StoredProcPrK_ABIT.Transaction.Rollback;
    end;
 end;
end;

procedure TFPrKPereklad.CancelActionExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
