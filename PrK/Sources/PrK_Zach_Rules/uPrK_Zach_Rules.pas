unit uPrK_Zach_Rules;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxContainer, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, Placemnt, dxBar, dxBarExtItems, ActnList, ImgList,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxGroupBox, cxSplitter, dxStatusBar, cxTextEdit, cxMemo, cxDBEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxLabel,AArray,ibase,ib_externals, cxCheckBox;

type
  TFormPrK_Zach_Rules = class(TForm)
    dxStatusBarPrK: TdxStatusBar;
    cxSplitterRules: TcxSplitter;
    cxGroupBoxFraza: TcxGroupBox;
    dxBarDockControl1: TdxBarDockControl;
    cxGridPrKFraza: TcxGrid;
    cxGridPrKFrazaDBTableView1: TcxGridDBTableView;
    cxGridPrKFrazaLevel1: TcxGridLevel;
    cxGroupBoxRules: TcxGroupBox;
    cxGridPrKRules: TcxGrid;
    cxGridPrKRulesDBTableView1: TcxGridDBTableView;
    cxGridPrKRulesLevel1: TcxGridLevel;
    dxBarDockControl2: TdxBarDockControl;
    ImageListPrK: TImageList;
    ActionListPrK: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionObnov: TAction;
    ActionOtmena: TAction;
    ActionAddPrKFraza: TAction;
    ActionChangePrKFraza: TAction;
    ActionDelPrKFraza: TAction;
    ActionObnovPrKFraza: TAction;
    StyleRepositoryPrK: TcxStyleRepository;
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
    dxBarManagerPrk: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    dxBarLargeButtonChange: TdxBarLargeButton;
    dxBarLargeButtonDel: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    dxBarLargeButtonAddPrKFndComp: TdxBarLargeButton;
    dxBarLargeButtonChangePrKStat: TdxBarLargeButton;
    dxBarLargeButtonDelPrKStat: TdxBarLargeButton;
    dxBarLargeButtonObnovFndComp: TdxBarLargeButton;
    FormStoragePrK: TFormStorage;
    TransactionWritePrK: TpFIBTransaction;
    StoredProcPrK: TpFIBStoredProc;
    DataSetPrKRules: TpFIBDataSet;
    TransactionReadPrK: TpFIBTransaction;
    DataBasePrK: TpFIBDatabase;
    DataSourcePrKRules: TDataSource;
    DataSetPrKFraza: TpFIBDataSet;
    DataSourcePrKFraza: TDataSource;
    cxEditStyleControllerPrK: TcxEditStyleController;
    cxGroupBox1: TcxGroupBox;
    dxBarDockControl3: TdxBarDockControl;
    cxLabelTYP_KT_STD: TcxLabel;
    cxLookupComboBoxTYP_KT_STD: TcxLookupComboBox;
    DataSetTYP_KT_STD: TpFIBDataSet;
    DataSourceTYP_KT_STD: TDataSource;
    cxLabelKatStud: TcxLabel;
    cxLookupComboBoxKatStud: TcxLookupComboBox;
    DataSetKatStud: TpFIBDataSet;
    DataSourceKatStud: TDataSource;
    cxLabelFormStudy: TcxLabel;
    cxLookupComboBoxFormStudy: TcxLookupComboBox;
    DataSetFormStudy: TpFIBDataSet;
    DataSourceFormStudy: TDataSource;
    cxLabelFRM_OB_KAT: TcxLabel;
    cxLookupComboBoxFRM_OB_KAT: TcxLookupComboBox;
    DataSetFRM_OB_KAT: TpFIBDataSet;
    DataSourceFRM_OB_KAT: TDataSource;
    cxLabelSpec: TcxLabel;
    cxLookupComboBoxSpec: TcxLookupComboBox;
    DataSetSpec: TpFIBDataSet;
    DataSourceSpec: TDataSource;
    colNAME_PREIM: TcxGridDBColumn;
    colNAME_KAT_PRI_D: TcxGridDBColumn;
    colNOMER_PRAVIL: TcxGridDBColumn;
    colORDER_ZACH: TcxGridDBColumn;
    colIS_READONLY: TcxGridDBColumn;
    colIS_ZACH_RULE: TcxGridDBColumn;
    colFRAZA: TcxGridDBColumn;
    colNPP: TcxGridDBColumn;
    cxMemoSQL_SQRIPT: TcxMemo;
    dxBarLargeButtonSaveSqlScript: TdxBarLargeButton;
    ActionSaveSqlScript: TAction;
    collNAME_TYPE_ZACH: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionAddPrKFrazaExecute(Sender: TObject);
    procedure ActionChangePrKFrazaExecute(Sender: TObject);
    procedure ActionDelPrKFrazaExecute(Sender: TObject);
    procedure ActionObnovPrKFrazaExecute(Sender: TObject);
    procedure cxLookupComboBoxTYP_KT_STDPropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxKatStudPropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxFormStudyPropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxFRM_OB_KATPropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxSpecPropertiesChange(Sender: TObject);
    procedure cxGridPrKRulesDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridPrKFrazaDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ActionSaveSqlScriptExecute(Sender: TObject);
    procedure DataSetPrKRulesAfterScroll(DataSet: TDataSet);
    procedure cxMemoSQL_SQRIPTFocusChanged(Sender: TObject);
  private
    FSelectSQLTextTYP_KT_STD: String;
    FSelectSQLTextKatStud: String;
    FSelectSQLTextFormStudy: String;
    Layout: array[0.. KL_NAMELENGTH] of char;
    Can_Update           :Boolean;
    DBHANDLE             :TISC_DB_HANDLE;
    ResultArray          :TAArray;
    IndLang              :integer;
    TextViewColor        :TColor;
    ID_USER_GLOBAL       :int64;
    ID_GOD_NABORA_GLOBAL :int64;
    FSelectSQLTextFRM_OB_KAT: String;
    FSelectSQLTextSpec: String;
    FSelectSQLTextZACH_RULES: String;
    FSelectSQLTextFraza: String;
    procedure SetSelectSQLTextFormStudy(const Value: String);
    procedure SetSelectSQLTextKatStud(const Value: String);
    procedure SetSelectSQLTextTYP_KT_STD(const Value: String);
    procedure SetSelectSQLTextFRM_OB_KAT(const Value: String);
    procedure SetSelectSQLTextSpec(const Value: String);
    procedure InicCapton;
    procedure Obnovit(id_obnovit : int64);
    procedure Obnovit_Fraza(id_obnovit : int64);
    procedure SetSelectSQLTextZACH_RULES(const Value: String);
    procedure SetSelectSQLTextFraza(const Value: String);
  public
    constructor Create(aOwner: TComponent;aParam :TAArray);overload;
    Property SelectSQLTextTYP_KT_STD :String read FSelectSQLTextTYP_KT_STD write SetSelectSQLTextTYP_KT_STD;
    Property SelectSQLTextKatStud    :String read FSelectSQLTextKatStud write SetSelectSQLTextKatStud;
    Property SelectSQLTextFormStudy  :String read FSelectSQLTextFormStudy write SetSelectSQLTextFormStudy;
    Property SelectSQLTextFRM_OB_KAT :String read FSelectSQLTextFRM_OB_KAT write SetSelectSQLTextFRM_OB_KAT;
    Property SelectSQLTextSpec       :String read FSelectSQLTextSpec write SetSelectSQLTextSpec;
    Property SelectSQLTextZACH_RULES :String read FSelectSQLTextZACH_RULES write SetSelectSQLTextZACH_RULES;
    Property SelectSQLTextFraza      :String read FSelectSQLTextFraza write SetSelectSQLTextFraza;
  end;

  procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);stdcall;
  exports   ShowAllPrkBpl;

var
  FormPrK_Zach_Rules: TFormPrK_Zach_Rules;

implementation
uses
   uPrK_Resources,uConstants,uPrK_Loader,
   uPrK_Zach_Rules_Edit,uPrK_Zach_Fraza_Edit;
{$R *.dfm}

{ TFormPrK_Zach_Rules }

procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
var
 T :TFormPrK_Zach_Rules;
begin
   T:=TFormPrK_Zach_Rules.Create(aOwner,aParam);

   T.FormStyle:= aParam['Input']['aFrmStyle'].AsVariant;
   case T.FormStyle of
     fsNormal:   begin
                   T.ShowModal;
                 end;
     fsMDIChild: begin
                 end;
     else
        T.Free;
   end;
end;

constructor TFormPrK_Zach_Rules.Create(aOwner: TComponent;
  aParam: TAArray);
begin
   if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
   begin
      DBHANDLE      :=PVoid(aParam['Input']['aDBHANDLE'].asInteger);
      ResultArray   :=aParam;
      IndLang       :=SelectLanguage;
      TextViewColor :=cl3DLight;
      ID_USER_GLOBAL         :=ResultArray['Input']['ID_USER_GLOBAL'].AsInt64;
      ID_GOD_NABORA_GLOBAL   :=ResultArray['Input']['GodNabora'].AsInt64;
      inherited Create(aOwner);
      if SelectShemaColor=1 then
       begin
           cxStyleBackGround_Content.Color               := $00EBC4A4;
           cxStyleInactive.Color                         := $00F7EAD9;
          cxEditStyleControllerPrK.Style.Color := $00EBC4A4;
       end;
   end
   else ShowMessage('Ошибка HANDLE`a Базы');
end;

procedure TFormPrK_Zach_Rules.InicCapton;
begin
    TFormPrK_Zach_Rules(self).Caption       :=nFormPrK_Zach_Rules_Caption[IndLang];

    ActionADD.Caption                       :=nAction_Add[IndLang];
    ActionChange.Caption                    :=nAction_Change[IndLang];
    ActionDEL.Caption                       :=nAction_Del[IndLang];
    ActionObnov.Caption                     :=nAction_Sklasti[IndLang];
    ActionOtmena.Caption                    :=nAction_Exit[IndLang];
    ActionSaveSqlScript.Caption             :='Зберегти Sql скрипт';

    ActionADD.Hint                          :=nHintAction_Add[IndLang];
    ActionChange.Hint                       :=nHintAction_Change[IndLang];
    ActionDEL.Hint                          :=nHintAction_Del[IndLang];
    ActionObnov.Hint                        :=nAction_Sklasti[IndLang];
    ActionOtmena.Hint                       :=nHintAction_Exit[IndLang];
    ActionSaveSqlScript.Hint                :='Зберегти Sql скрипт';

    ActionAddPrKFraza.Caption               :=nAction_Add[IndLang];
    ActionChangePrKFraza.Caption            :=nAction_Change[IndLang];
    ActionDelPrKFraza.Caption               :=nAction_Del[IndLang];
    ActionObnovPrKFraza.Caption             :=nActiont_Obnov[IndLang];

    ActionAddPrKFraza.Hint                  :=nHintAction_Add[IndLang];
    ActionChangePrKFraza.Hint               :=nHintAction_Change[IndLang];
    ActionDelPrKFraza.Hint                  :=nHintAction_Del[IndLang];
    ActionObnovPrKFraza.Hint                :=nActiont_Obnov[IndLang];


    cxLabelTYP_KT_STD.Caption :=nLabelTYP_KT_STD[IndLang];
    cxLabelFRM_OB_KAT.Caption :=nLabelNameObuchKat[IndLang];
    cxLabelKatStud.Caption    :=nLabelCnKatStud[IndLang];
    cxLabelFormStudy.Caption  :=nLabelCnFormStud[IndLang];
    cxLabelSpec.Caption       :=nLabelNameSpec[IndLang];

    colNPP.Caption            :=ncolNPP[IndLang];
    colFRAZA.Caption          :=ncolFRAZA_Protokola[IndLang];
    colORDER_ZACH.Caption     :=ncolORDER_ZACH[IndLang];
    colIS_ZACH_RULE.Caption   :=ncolIS_ZACH_RULE[IndLang];
    colNAME_KAT_PRI_D.Caption :=ncolKat_Pri_D[IndLang];
    colNAME_PREIM.Caption     :=ncolNAME_PREIM[IndLang];
    colNOMER_PRAVIL.Caption   :=ncolNOMER[IndLang];
    collNAME_TYPE_ZACH.Caption:=ncolNAME_ZACH_TYPE[IndLang];
end;

procedure TFormPrK_Zach_Rules.FormCreate(Sender: TObject);
begin
  InicCapton;
  Can_Update              :=False;
  SelectSQLTextTYP_KT_STD :='select * from PRK_ZACH_RULES_TYPE_KAT_STUD(:id_sp_god_nabora)';
  SelectSQLTextKatStud    :='select * from PRK_ZACH_RULES_KAT_STUD  (:id_sp_god_nabora)';
  SelectSQLTextFormStudy  :='select * from PRK_ZACH_RULES_FORM_STUD (:id_sp_god_nabora)';
  SelectSQLTextFRM_OB_KAT :='select * from PRK_ZACH_RULES_KAT_FORM_STUD(:id_sp_god_nabora)';
  SelectSQLTextSpec       :='select * from PRK_ZACH_RULES_SPEC(:id_sp_god_nabora)';
end;

procedure TFormPrK_Zach_Rules.SetSelectSQLTextTYP_KT_STD(
  const Value: String);
begin
  FSelectSQLTextTYP_KT_STD := Value;
    DataBasePrK.close;
    DataSetTYP_KT_STD.Active                         :=false;
    DataBasePrK.Handle                               :=DBHANDLE;
    DataBasePrK.DefaultTransaction                   := TransactionReadPrK;
    DataSetTYP_KT_STD.Database                       := DataBasePrK;
    DataSetTYP_KT_STD.Transaction                    := TransactionReadPrK;
    DataSetTYP_KT_STD.SelectSQL.Clear;
    DataSetTYP_KT_STD.SQLs.SelectSQL.Text            := FSelectSQLTextTYP_KT_STD;
    DataSetTYP_KT_STD.ParamByName('id_sp_god_nabora').AsInt64      :=ResultArray['Input']['GodNabora'].AsInt64;
    DataSetTYP_KT_STD.CloseOpen(false);   
    DataSetTYP_KT_STD.First;
    cxLookupComboBoxTYP_KT_STD.Text    :=DataSetTYP_KT_STD.FieldValues['SHORT_NAME'];
end;

procedure TFormPrK_Zach_Rules.SetSelectSQLTextKatStud(const Value: String);
begin
  FSelectSQLTextKatStud := Value;
    DataSetKatStud.Active                         :=false;
    DataSetKatStud.Database                       := DataBasePrK;
    DataSetKatStud.Transaction                    := TransactionReadPrK;
    DataSetKatStud.SelectSQL.Clear;
    DataSetKatStud.SQLs.SelectSQL.Text            := FSelectSQLTextKatStud;
    DataSetKatStud.ParamByName('id_sp_god_nabora').AsInt64     :=ResultArray['Input']['GodNabora'].AsInt64;
    DataSetKatStud.CloseOpen(false);
    DataSetKatStud.First;
    cxLookupComboBoxKatStud.Text    :=DataSetKatStud.FieldValues['SHORT_NAME'];
end;

procedure TFormPrK_Zach_Rules.SetSelectSQLTextFormStudy(
  const Value: String);
begin
  FSelectSQLTextFormStudy := Value;
    FSelectSQLTextFormStudy := Value;
    DataSetFormStudy.Active                         :=false;
    DataSetFormStudy.Database                       := DataBasePrK;
    DataSetFormStudy.Transaction                    := TransactionReadPrK;
    DataSetFormStudy.SelectSQL.Clear;
    DataSetFormStudy.SQLs.SelectSQL.Text            := FSelectSQLTextFormStudy;
    DataSetFormStudy.ParamByName('id_sp_god_nabora').AsInt64     :=ResultArray['Input']['GodNabora'].AsInt64;
    DataSetFormStudy.CloseOpen(false);

    DataSetFormStudy.First;
    cxLookupComboBoxFormStudy.Text    :=DataSetFormStudy.FieldValues['SHORT_NAME'];
end;

procedure TFormPrK_Zach_Rules.SetSelectSQLTextFRM_OB_KAT(
  const Value: String);
begin
  FSelectSQLTextFRM_OB_KAT := Value;
    DataSetFRM_OB_KAT.Active                         :=false;
    DataSetFRM_OB_KAT.Database                       := DataBasePrK;
    DataSetFRM_OB_KAT.Transaction                    := TransactionReadPrK;
    DataSetFRM_OB_KAT.SelectSQL.Clear;
    DataSetFRM_OB_KAT.SQLs.SelectSQL.Text            := FSelectSQLTextFRM_OB_KAT;
    DataSetFRM_OB_KAT.ParamByName('id_sp_god_nabora').AsInt64            :=ResultArray['Input']['GodNabora'].AsInt64;
    DataSetFRM_OB_KAT.CloseOpen(false);
    DataSetFRM_OB_KAT.First;
    cxLookupComboBoxFRM_OB_KAT.Text    :=DataSetFRM_OB_KAT.FieldValues['SHORT_NAME'];
end;

procedure TFormPrK_Zach_Rules.SetSelectSQLTextSpec(const Value: String);
begin
  FSelectSQLTextSpec := Value;
    DataSetSpec.Active                         :=false;
    DataSetSpec.Database                       := DataBasePrK;
    DataSetSpec.Transaction                    := TransactionReadPrK;
    DataSetSpec.SelectSQL.Clear;
    DataSetSpec.SQLs.SelectSQL.Text            := FSelectSQLTextSpec;
    DataSetSpec.ParamByName('id_sp_god_nabora').AsInt64            :=ResultArray['Input']['GodNabora'].AsInt64;
    DataSetSpec.CloseOpen(false);
    DataSetSpec.First;
    cxLookupComboBoxSpec.Text    :=DataSetSpec.FieldValues['SHORT_NAME'];
end;

procedure TFormPrK_Zach_Rules.ActionObnovExecute(Sender: TObject);
begin
  Can_Update:=true;

  SelectSQLTextZACH_RULES :='select * from PRK_SP_ZACH_RULES_SELECT(:ID_SP_SPEC,:ID_CN_SP_FORM_STUD,'
                                    +':ID_SP_FORM_OBUCH_KATEGORY,:ID_CN_SP_KAT_STUD,:ID_SP_TYPE_KAT_STUD)';
  SelectSQLTextFraza      :='Select * from PRK_SP_FRAZA_PROTOKOLA_SELECT where ?Mas_ID_SP_ZACH_RULES=ID_SP_ZACH_RULES';
end;

procedure TFormPrK_Zach_Rules.SetSelectSQLTextZACH_RULES(
  const Value: String);
begin
  FSelectSQLTextZACH_RULES := Value;
    DataSetPrKRules.Active                                  :=false;
    DataSetPrKRules.Database                                := DataBasePrK;
    DataSetPrKRules.Transaction                             := TransactionReadPrK;
    DataSetPrKRules.SelectSQL.Clear;
    DataSetPrKRules.SQLs.SelectSQL.Text                     := FSelectSQLTextZACH_RULES;
    DataSetPrKRules.ParamByName('ID_CN_SP_KAT_STUD').AsInt64         :=DataSetKatStud.fieldvalues['ID_CN_SP_KAT_STUD'];
    DataSetPrKRules.ParamByName('ID_CN_SP_FORM_STUD').AsInt64        :=DataSetFormStudy.fieldvalues['ID_CN_SP_FORM_STUD'];
    DataSetPrKRules.ParamByName('ID_SP_FORM_OBUCH_KATEGORY').AsInt64 :=DataSetFRM_OB_KAT.fieldvalues['ID_SP_FORM_OBUCH_KATEGORY'];
    DataSetPrKRules.ParamByName('ID_SP_SPEC').AsInt64                :=DataSetSpec.fieldvalues['ID_SP_SPEC'];
    DataSetPrKRules.ParamByName('ID_SP_TYPE_KAT_STUD').AsInt64       :=DataSetTYP_KT_STD.fieldvalues['ID_SP_TYPE_KAT_STUD'];
    DataSetPrKRules.CloseOpen(false);
end;

procedure TFormPrK_Zach_Rules.SetSelectSQLTextFraza(const Value: String);
begin
  FSelectSQLTextFraza := Value;
    DataSetPrKFraza.Active                                  :=false;
    DataSetPrKFraza.Database                                := DataBasePrK;
    DataSetPrKFraza.Transaction                             := TransactionReadPrK;
    DataSetPrKFraza.SelectSQL.Clear;
    DataSetPrKFraza.SQLs.SelectSQL.Text                     := FSelectSQLTextFraza;
    DataSetPrKFraza.CloseOpen(false);
end;

procedure TFormPrK_Zach_Rules.Obnovit(id_obnovit: int64);
begin
    DataSetPrKRules.CloseOpen(false);
    DataSetPrKRules.Locate('ID_SP_ZACH_RULES',id_obnovit,[]);
    DataSetPrKFraza.CloseOpen(false);
end;

procedure TFormPrK_Zach_Rules.ActionADDExecute(Sender: TObject);
var
   DataVLAdd :TAArray;
   T:TFormPrK_Zach_Rules_Edit;
   TryAgain :boolean;
begin
   ActionObnovExecute(sender);

   TryAgain:=false;

   DataVLAdd :=TAArray.Create;
   DataVLAdd['SHORT_NAME_PREIM'].asString           :='';
   DataVLAdd['SHORT_NAME_KAT_PRI_D'].AsString       :='';
   DataVLAdd['NOMER_PRAVIL'].AsString               :='';
   DataVLAdd['ORDER_ZACH'].AsInteger                :=0;
   DataVLAdd['IS_ZACH_RULE'].AsInteger              :=0;

   if DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']<>Null
      then DataVLAdd['ID'].AsInt64:=StrToInt64( DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']);

   T := TFormPrK_Zach_Rules_Edit.Create(self,DataVLAdd);

   T.Caption :=nFormKlassSpravEdit_Add[IndLang];

   if T.ShowModal=MrOk then
    begin
       StoredProcPrK.Transaction.StartTransaction;
       StoredProcPrK.StoredProcName:='PRK_SP_ZACH_RULES_ADD';
       StoredProcPrK.Prepare;
       StoredProcPrK.ParamByName('ID_SP_SPEC').AsInt64                :=DataSetSpec.FieldValues['ID_SP_SPEC'];
       StoredProcPrK.ParamByName('ID_CN_SP_FORM_STUD').AsInt64        :=DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
       StoredProcPrK.ParamByName('ID_SP_FORM_OBUCH_KATEGORY').AsInt64 :=DataSetFRM_OB_KAT.FieldValues['ID_SP_FORM_OBUCH_KATEGORY'];
       StoredProcPrK.ParamByName('ID_CN_SP_KAT_STUD').AsInt64         :=DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
       StoredProcPrK.ParamByName('ID_SP_TYPE_KAT_STUD').AsInt64       :=DataSetTYP_KT_STD.FieldValues['ID_SP_TYPE_KAT_STUD'];

       StoredProcPrK.ParamByName('ID_SP_PREIM').AsInt64               :=DataVLAdd['ID_SP_PREIM'].AsInt64;
       StoredProcPrK.ParamByName('ID_SP_KAT_PRI_D').AsInt64           :=DataVLAdd['ID_SP_KAT_PRI_D'].AsInt64;

       StoredProcPrK.ParamByName('ORDER_ZACH').AsInteger              :=DataVLAdd['ORDER_ZACH'].AsInteger;
       StoredProcPrK.ParamByName('NOMER_PRAVIL').AsString             :=DataVLAdd['NOMER_PRAVIL'].AsString;
       StoredProcPrK.ParamByName('IS_ZACH_RULE').AsInteger            :=DataVLAdd['IS_ZACH_RULE'].AsInteger;
       try
          StoredProcPrK.ExecProc;
          StoredProcPrK.Transaction.commit;
          DataVLAdd['ID'].AsInt64:=StoredProcPrK.FieldByName('ID_OUT').AsInt64;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLang]+chr(13)+
                        nMsgTryAgain[IndLang]+nMsgOr[IndLang]+nMsgToAdmin[IndLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONWARNING);
             StoredProcPrK.Transaction.Rollback;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
   Obnovit(DataVLAdd['ID'].AsInt64);
   DataVLAdd.Free;
   DataVLAdd:=Nil;

   if TryAgain=true
      then ActionADDExecute(Sender);
end;

procedure TFormPrK_Zach_Rules.ActionChangeExecute(Sender: TObject);
var
   DataVLChange :TAArray;
   T:TFormPrK_Zach_Rules_Edit;
   TryAgain :boolean;
begin
 if Can_Update=false then exit;
 
   TryAgain:=false;

 if  DataSetPrKRules.FieldValues['IS_READONLY']<>0 then
  begin
   ShowMessage('Дане правило прийому призначено тільки для перегляду');
   exit;
  end;


 if DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']<>Null then
  begin
   DataVLChange :=TAArray.Create;
   DataVLChange['ID'].AsInt64:=StrToInt64( DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']);
   DataVLChange['ID_SP_PREIM'].AsInt64                 :=DataSetPrKRules.FieldValues['ID_SP_PREIM'];
   DataVLChange['SHORT_NAME_PREIM'].asString           :=DataSetPrKRules.FieldValues['SHORT_NAME_PREIM'];
   DataVLChange['ID_SP_KAT_PRI_D'].AsInt64             :=DataSetPrKRules.FieldValues['ID_SP_KAT_PRI_D'];
   DataVLChange['SHORT_NAME_KAT_PRI_D'].AsString       :=DataSetPrKRules.FieldValues['SHORT_NAME_KAT_PRI_D'];
   DataVLChange['NOMER_PRAVIL'].AsString               :=DataSetPrKRules.FieldValues['NOMER_PRAVIL'];
   DataVLChange['ORDER_ZACH'].AsInteger                :=DataSetPrKRules.FieldValues['ORDER_ZACH'];
   DataVLChange['IS_ZACH_RULE'].AsInteger              :=DataSetPrKRules.FieldValues['IS_ZACH_RULE'];

   T := TFormPrK_Zach_Rules_Edit.Create(self,DataVLChange);

   T.Caption :=nFormKlassSpravEdit_Change[IndLang];

   if T.ShowModal=MrOk then
    begin
       StoredProcPrK.Transaction.StartTransaction;
       StoredProcPrK.StoredProcName:='PRK_SP_ZACH_RULES_CHANGE';
       StoredProcPrK.Prepare;
       StoredProcPrK.ParamByName('ID_SP_ZACH_RULES').AsInt64          :=DataVLChange['ID'].AsInt64;
       StoredProcPrK.ParamByName('ID_SP_SPEC').AsInt64                :=DataSetSpec.FieldValues['ID_SP_SPEC'];
       StoredProcPrK.ParamByName('ID_CN_SP_FORM_STUD').AsInt64        :=DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
       StoredProcPrK.ParamByName('ID_SP_FORM_OBUCH_KATEGORY').AsInt64 :=DataSetFRM_OB_KAT.FieldValues['ID_SP_FORM_OBUCH_KATEGORY'];
       StoredProcPrK.ParamByName('ID_CN_SP_KAT_STUD').AsInt64         :=DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
       StoredProcPrK.ParamByName('ID_SP_TYPE_KAT_STUD').AsInt64       :=DataSetTYP_KT_STD.FieldValues['ID_SP_TYPE_KAT_STUD'];

       StoredProcPrK.ParamByName('ID_SP_PREIM').AsInt64               :=DataVLChange['ID_SP_PREIM'].AsInt64;
       StoredProcPrK.ParamByName('ID_SP_KAT_PRI_D').AsInt64           :=DataVLChange['ID_SP_KAT_PRI_D'].AsInt64;

       StoredProcPrK.ParamByName('ORDER_ZACH').AsInteger              :=DataVLChange['ORDER_ZACH'].AsInteger;
       StoredProcPrK.ParamByName('NOMER_PRAVIL').AsString             :=DataVLChange['NOMER_PRAVIL'].AsString;
       StoredProcPrK.ParamByName('IS_ZACH_RULE').AsInteger            :=DataVLChange['IS_ZACH_RULE'].AsInteger;
       try
          StoredProcPrK.ExecProc;
          StoredProcPrK.Transaction.commit;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLang]+chr(13)+
                        nMsgTryAgain[IndLang]+nMsgOr[IndLang]+nMsgToAdmin[IndLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONWARNING);
             StoredProcPrK.Transaction.Rollback;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
   Obnovit(DataVLChange['ID'].AsInt64);
   DataVLChange.Free;
   DataVLChange:=Nil;

   if TryAgain=true
      then ActionChangeExecute(Sender);
  end;
end;

procedure TFormPrK_Zach_Rules.ActionDELExecute(Sender: TObject);
begin
  if Can_Update=false then exit;

  if  DataSetPrKRules.FieldValues['IS_READONLY']<>0 then
  begin
   ShowMessage('Дане правило прийому призначено тільки для перегляду');
   exit;
  end;

  if DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[IndLang],nMsgDel[IndLang],
                        mtInformation,mbOKCancel,IndLang)=mrOK then
         begin
            StoredProcPrK.Transaction.StartTransaction;
            StoredProcPrK.StoredProcName:='PRK_SP_ZACH_RULES_DEL';
            StoredProcPrK.Prepare;
            StoredProcPrK.ParamByName('ID_SP_ZACH_RULES').AsInt64:= DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES'];
            try
              StoredProcPrK.ExecProc;
              StoredProcPrK.Transaction.Commit;
              cxGridPrKRulesDBTableView1.NavigatorButtons.Prior.Click;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLang]+chr(13)+
                        nMsgTryAgain[IndLang]+nMsgOr[IndLang]+nMsgToAdmin[IndLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONWARNING);
                 StoredProcPrK.Transaction.Rollback;
               end;
            end;
         end;
         Obnovit(StrToInt64(DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']));
     end;
end;

procedure TFormPrK_Zach_Rules.ActionOtmenaExecute(Sender: TObject);
begin
   close;
end;

procedure TFormPrK_Zach_Rules.Obnovit_Fraza(id_obnovit: int64);
begin
    DataSetPrKFraza.CloseOpen(false);
    DataSetPrKFraza.Locate('ID_SP_FRAZA_PROTOKOLA',id_obnovit,[]);
end;

procedure TFormPrK_Zach_Rules.ActionAddPrKFrazaExecute(Sender: TObject);
var
   DataVLAdd :TAArray;
   T:TFormPrK_Zach_Fraza_Edit;
   TryAgain :boolean;
begin
  if Can_Update=false then exit;

  if  DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']=Null then exit;

  if  DataSetPrKRules.FieldValues['IS_READONLY']<>0 then
  begin
   ShowMessage('Дане правило прийому призначено тільки для перегляду');
   exit;
  end;

   TryAgain:=false;
   DataVLAdd :=TAArray.Create;
   DataVLAdd['FRAZA'].asString      :='';
   DataVLAdd['NPP'].AsString        :='';

   if DataSetPrKFraza.FieldValues['ID_SP_FRAZA_PROTOKOLA']<>Null
      then DataVLAdd['ID'].AsInt64:=StrToInt64( DataSetPrKFraza.FieldValues['ID_SP_FRAZA_PROTOKOLA']);

   T := TFormPrK_Zach_Fraza_Edit.Create(self,DataVLAdd);

   T.Caption :=nFormKlassSpravEdit_Add[IndLang];

   if T.ShowModal=MrOk then
    begin
       StoredProcPrK.Transaction.StartTransaction;
       StoredProcPrK.StoredProcName:='PRK_SP_FRAZA_PROTOKOLA_ADD';
       StoredProcPrK.Prepare;
       StoredProcPrK.ParamByName('FRAZA').AsString           :=DataVLAdd['FRAZA'].AsString;
       StoredProcPrK.ParamByName('NPP').AsInteger            :=DataVLAdd['NPP'].AsInteger;
       StoredProcPrK.ParamByName('ID_SP_ZACH_RULES').AsInt64 :=DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES'];
       try
          StoredProcPrK.ExecProc;
          StoredProcPrK.Transaction.commit;
          DataVLAdd['ID'].AsInt64:=StoredProcPrK.FieldByName('ID_OUT').AsInt64;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLang]+chr(13)+
                        nMsgTryAgain[IndLang]+nMsgOr[IndLang]+nMsgToAdmin[IndLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONWARNING);
             StoredProcPrK.Transaction.Rollback;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
   Obnovit_Fraza(DataVLAdd['ID'].AsInt64);
   DataVLAdd.Free;
   DataVLAdd:=Nil;

   if TryAgain=true
      then ActionAddPrKFrazaExecute(Sender);
end;

procedure TFormPrK_Zach_Rules.ActionChangePrKFrazaExecute(Sender: TObject);
var
   DataVLChange :TAArray;
   T:TFormPrK_Zach_Fraza_Edit;
   TryAgain :boolean;
begin
  if Can_Update=false then exit;

  if  DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']=Null then exit;

  if  DataSetPrKRules.FieldValues['IS_READONLY']<>0 then
  begin
   ShowMessage('Дане правило прийому призначено тільки для перегляду');
   exit;
  end;

   TryAgain:=false;

 if DataSetPrKFraza.FieldValues['ID_SP_FRAZA_PROTOKOLA']<>Null then
  begin
   DataVLChange :=TAArray.Create;
   DataVLChange['ID'].AsInt64:=StrToInt64(DataSetPrKFraza.FieldValues['ID_SP_FRAZA_PROTOKOLA']);
   DataVLChange['FRAZA'].asString      :=DataSetPrKFraza.FieldValues['FRAZA'];
   DataVLChange['NPP'].AsString        :=DataSetPrKFraza.FieldValues['NPP'];

   T := TFormPrK_Zach_Fraza_Edit.Create(self,DataVLChange);

   T.Caption :=nFormKlassSpravEdit_Change[IndLang];

   if T.ShowModal=MrOk then
    begin
       StoredProcPrK.Transaction.StartTransaction;
       StoredProcPrK.StoredProcName:='PRK_SP_FRAZA_PROTOKOLA_CHANGE';
       StoredProcPrK.Prepare;
       StoredProcPrK.ParamByName('ID_SP_FRAZA_PROTOKOLA').AsInt64  :=DataVLChange['ID'].AsInt64;
       StoredProcPrK.ParamByName('FRAZA').AsString                 :=DataVLChange['FRAZA'].AsString;
       StoredProcPrK.ParamByName('NPP').AsInteger                  :=DataVLChange['NPP'].AsInteger;
       StoredProcPrK.ParamByName('ID_SP_ZACH_RULES').AsInt64       :=DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES'];
       try
          StoredProcPrK.ExecProc;
          StoredProcPrK.Transaction.commit;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLang]+chr(13)+
                        nMsgTryAgain[IndLang]+nMsgOr[IndLang]+nMsgToAdmin[IndLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONWARNING);
             StoredProcPrK.Transaction.Rollback;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
   Obnovit_Fraza(DataVLChange['ID'].AsInt64);
   DataVLChange.Free;
   DataVLChange:=Nil;

   if TryAgain=true
      then ActionChangePrKFrazaExecute(Sender);
 end;
end;

procedure TFormPrK_Zach_Rules.ActionDelPrKFrazaExecute(Sender: TObject);
begin
  if Can_Update=false then exit;

  if  DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']=Null then exit;

  if  DataSetPrKRules.FieldValues['IS_READONLY']<>0 then
  begin
   ShowMessage('Дане правило прийому призначено тільки для перегляду');
   exit;
  end;

  if DataSetPrKFraza.FieldValues['ID_SP_FRAZA_PROTOKOLA']<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[IndLang],nMsgDel[IndLang],
                        mtInformation,mbOKCancel,IndLang)=mrOK then
         begin
            StoredProcPrK.Transaction.StartTransaction;
            StoredProcPrK.StoredProcName:='PRK_SP_FRAZA_PROTOKOLA_DEL';
            StoredProcPrK.Prepare;
            StoredProcPrK.ParamByName('ID_SP_FRAZA_PROTOKOLA').AsInt64:= DataSetPrKFraza.FieldValues['ID_SP_FRAZA_PROTOKOLA'];
            try
              StoredProcPrK.ExecProc;
              StoredProcPrK.Transaction.Commit;
              cxGridPrKFrazaDBTableView1.NavigatorButtons.Prior.Click;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLang]+chr(13)+
                        nMsgTryAgain[IndLang]+nMsgOr[IndLang]+nMsgToAdmin[IndLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONWARNING);
                 StoredProcPrK.Transaction.Rollback;
               end;
            end;
         end;
         Obnovit_Fraza(StrToInt64(DataSetPrKFraza.FieldValues['ID_SP_FRAZA_PROTOKOLA']));
     end;
end;

procedure TFormPrK_Zach_Rules.ActionObnovPrKFrazaExecute(Sender: TObject);
begin
  if Can_Update=false then exit;
  
  if DataSetPrKFraza.FieldValues['ID_SP_FRAZA_PROTOKOLA']<>Null
   then Obnovit_Fraza(StrToInt64(DataSetPrKFraza.FieldValues['ID_SP_FRAZA_PROTOKOLA']))
   else Obnovit_Fraza(-1);
end;

procedure TFormPrK_Zach_Rules.cxLookupComboBoxTYP_KT_STDPropertiesChange(
  Sender: TObject);
var
 id:Int64;
begin
  if Can_Update=true then
  begin
   if DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']<>Null
   then id:=DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']
   else id:=-1;

   DataSetPrKRules.active:=false;
    DataSetPrKRules.ParamByName('ID_CN_SP_KAT_STUD').AsInt64         :=DataSetKatStud.fieldvalues['ID_CN_SP_KAT_STUD'];
    DataSetPrKRules.ParamByName('ID_CN_SP_FORM_STUD').AsInt64        :=DataSetFormStudy.fieldvalues['ID_CN_SP_FORM_STUD'];
    DataSetPrKRules.ParamByName('ID_SP_FORM_OBUCH_KATEGORY').AsInt64 :=DataSetFRM_OB_KAT.fieldvalues['ID_SP_FORM_OBUCH_KATEGORY'];
    DataSetPrKRules.ParamByName('ID_SP_SPEC').AsInt64                :=DataSetSpec.fieldvalues['ID_SP_SPEC'];
    DataSetPrKRules.ParamByName('ID_SP_TYPE_KAT_STUD').AsInt64       :=DataSetTYP_KT_STD.fieldvalues['ID_SP_TYPE_KAT_STUD'];
    DataSetPrKRules.CloseOpen(false);
   DataSetPrKRules.Locate('ID_SP_ZACH_RULES',id,[]);
   DataSetPrKFraza.CloseOpen(false);
  end;
end;

procedure TFormPrK_Zach_Rules.cxLookupComboBoxKatStudPropertiesChange(
  Sender: TObject);
var
 id:Int64;
begin
  if Can_Update=true then
  begin
   if DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']<>Null
   then id:=DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']
   else id:=-1;

   DataSetPrKRules.active:=false;
    DataSetPrKRules.ParamByName('ID_CN_SP_KAT_STUD').AsInt64         :=DataSetKatStud.fieldvalues['ID_CN_SP_KAT_STUD'];
    DataSetPrKRules.ParamByName('ID_CN_SP_FORM_STUD').AsInt64        :=DataSetFormStudy.fieldvalues['ID_CN_SP_FORM_STUD'];
    DataSetPrKRules.ParamByName('ID_SP_FORM_OBUCH_KATEGORY').AsInt64 :=DataSetFRM_OB_KAT.fieldvalues['ID_SP_FORM_OBUCH_KATEGORY'];
    DataSetPrKRules.ParamByName('ID_SP_SPEC').AsInt64                :=DataSetSpec.fieldvalues['ID_SP_SPEC'];
    DataSetPrKRules.ParamByName('ID_SP_TYPE_KAT_STUD').AsInt64       :=DataSetTYP_KT_STD.fieldvalues['ID_SP_TYPE_KAT_STUD'];
    DataSetPrKRules.CloseOpen(false);
   DataSetPrKRules.Locate('ID_SP_ZACH_RULES',id,[]);
   DataSetPrKFraza.CloseOpen(false);
  end;
end;

procedure TFormPrK_Zach_Rules.cxLookupComboBoxFormStudyPropertiesChange(
  Sender: TObject);
var
 id:Int64;
begin
  if Can_Update=true then
  begin
   if DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']<>Null
   then id:=DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']
   else id:=-1;

   DataSetPrKRules.active:=false;
    DataSetPrKRules.ParamByName('ID_CN_SP_KAT_STUD').AsInt64         :=DataSetKatStud.fieldvalues['ID_CN_SP_KAT_STUD'];
    DataSetPrKRules.ParamByName('ID_CN_SP_FORM_STUD').AsInt64        :=DataSetFormStudy.fieldvalues['ID_CN_SP_FORM_STUD'];
    DataSetPrKRules.ParamByName('ID_SP_FORM_OBUCH_KATEGORY').AsInt64 :=DataSetFRM_OB_KAT.fieldvalues['ID_SP_FORM_OBUCH_KATEGORY'];
    DataSetPrKRules.ParamByName('ID_SP_SPEC').AsInt64                :=DataSetSpec.fieldvalues['ID_SP_SPEC'];
    DataSetPrKRules.ParamByName('ID_SP_TYPE_KAT_STUD').AsInt64       :=DataSetTYP_KT_STD.fieldvalues['ID_SP_TYPE_KAT_STUD'];
    DataSetPrKRules.CloseOpen(false);
   DataSetPrKRules.Locate('ID_SP_ZACH_RULES',id,[]);
   DataSetPrKFraza.CloseOpen(false);
  end;
end;

procedure TFormPrK_Zach_Rules.cxLookupComboBoxFRM_OB_KATPropertiesChange(
  Sender: TObject);
var
 id:Int64;
begin
  if Can_Update=true then
  begin
   if DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']<>Null
   then id:=DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']
   else id:=-1;

   DataSetPrKRules.active:=false;
    DataSetPrKRules.ParamByName('ID_CN_SP_KAT_STUD').AsInt64         :=DataSetKatStud.fieldvalues['ID_CN_SP_KAT_STUD'];
    DataSetPrKRules.ParamByName('ID_CN_SP_FORM_STUD').AsInt64        :=DataSetFormStudy.fieldvalues['ID_CN_SP_FORM_STUD'];
    DataSetPrKRules.ParamByName('ID_SP_FORM_OBUCH_KATEGORY').AsInt64 :=DataSetFRM_OB_KAT.fieldvalues['ID_SP_FORM_OBUCH_KATEGORY'];
    DataSetPrKRules.ParamByName('ID_SP_SPEC').AsInt64                :=DataSetSpec.fieldvalues['ID_SP_SPEC'];
    DataSetPrKRules.ParamByName('ID_SP_TYPE_KAT_STUD').AsInt64       :=DataSetTYP_KT_STD.fieldvalues['ID_SP_TYPE_KAT_STUD'];
    DataSetPrKRules.CloseOpen(false);
   DataSetPrKRules.Locate('ID_SP_ZACH_RULES',id,[]);
   DataSetPrKFraza.CloseOpen(false);
  end;
end;

procedure TFormPrK_Zach_Rules.cxLookupComboBoxSpecPropertiesChange(
  Sender: TObject);
var
 id:Int64;
begin
  if Can_Update=true then
  begin
   if DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']<>Null
   then id:=DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']
   else id:=-1;

   DataSetPrKRules.active:=false;
    DataSetPrKRules.ParamByName('ID_CN_SP_KAT_STUD').AsInt64         :=DataSetKatStud.fieldvalues['ID_CN_SP_KAT_STUD'];
    DataSetPrKRules.ParamByName('ID_CN_SP_FORM_STUD').AsInt64        :=DataSetFormStudy.fieldvalues['ID_CN_SP_FORM_STUD'];
    DataSetPrKRules.ParamByName('ID_SP_FORM_OBUCH_KATEGORY').AsInt64 :=DataSetFRM_OB_KAT.fieldvalues['ID_SP_FORM_OBUCH_KATEGORY'];
    DataSetPrKRules.ParamByName('ID_SP_SPEC').AsInt64                :=DataSetSpec.fieldvalues['ID_SP_SPEC'];
    DataSetPrKRules.ParamByName('ID_SP_TYPE_KAT_STUD').AsInt64       :=DataSetTYP_KT_STD.fieldvalues['ID_SP_TYPE_KAT_STUD'];
    DataSetPrKRules.CloseOpen(false);
   DataSetPrKRules.Locate('ID_SP_ZACH_RULES',id,[]);
   DataSetPrKFraza.CloseOpen(false);
  end;
end;

procedure TFormPrK_Zach_Rules.cxGridPrKRulesDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[cxGridPrKRulesDBTableView1.IndexOfItem(cxGridPrKRulesDBTableView1.FindItemByName('colIS_READONLY'))] <> 0 then
   begin
     ADone := false;
     ACanvas.Font.Color     := clGrayText;
     ACanvas.Brush.Color    := $00D2D6C9;
   end;
end;

procedure TFormPrK_Zach_Rules.cxGridPrKFrazaDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
   if DataSetPrKRules.FieldValues['IS_READONLY']<>0 then
    begin
     ADone := false;
     ACanvas.Font.Color  := clGrayText;
     ACanvas.Brush.Color    := $00D2D6C9;
    end;
end;

procedure TFormPrK_Zach_Rules.ActionSaveSqlScriptExecute(Sender: TObject);
var
  id :int64;
begin
  if Can_Update=false then exit;

  if  DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']=Null then exit;

  if  DataSetPrKRules.FieldValues['IS_READONLY']<>0 then
  begin
   ShowMessage('Дане правило прийому призначено тільки для перегляду');
   exit;
  end;

   id := DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES'];

   StoredProcPrK.Transaction.StartTransaction;
   StoredProcPrK.StoredProcName:='PRK_SP_ZACH_RULES_SCRIPT_CHANGE';
   StoredProcPrK.Prepare;
   StoredProcPrK.ParamByName('ID_SP_ZACH_RULES').AsInt64 := id;
   StoredProcPrK.ParamByName('SQL_SCRIPT').AsString      := cxMemoSQL_SQRIPT.Text;
   try
     StoredProcPrK.ExecProc;
     StoredProcPrK.Transaction.Commit;
     cxGridPrKRulesDBTableView1.NavigatorButtons.Prior.Click;
   except on e :Exception do
      begin
        MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLang]+chr(13)+
               nMsgTryAgain[IndLang]+nMsgOr[IndLang]+nMsgToAdmin[IndLang]+chr(13)+
               e.Message),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONWARNING);
        StoredProcPrK.Transaction.Rollback;
      end;
   end;   
   Obnovit(id);
end;

procedure TFormPrK_Zach_Rules.DataSetPrKRulesAfterScroll(
  DataSet: TDataSet);
begin
   if DataSetPrKRules.FieldValues['ID_SP_ZACH_RULES']<>Null
    then cxMemoSQL_SQRIPT.Text := DataSetPrKRules.FieldValues['SQL_SCRIPT'];
end;

procedure TFormPrK_Zach_Rules.cxMemoSQL_SQRIPTFocusChanged(
  Sender: TObject);
begin
  if cxMemoSQL_SQRIPT.Focused=true
    then ActionDEL.ShortCut :=scNone
    else ActionDEL.ShortCut :=VK_DELETE;
end;

end.
