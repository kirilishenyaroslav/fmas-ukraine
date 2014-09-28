unit uPrK_Show_Reports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,AArray,ibase,ib_externals, cxContainer, cxEdit, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxControls, cxLabel, StdCtrls, cxRadioGroup, cxGroupBox,
  cxLookAndFeelPainters, cxButtons, ActnList;

type
  TFormPrK_Show_Reports = class(TForm)
    cxEditStyleControllerPrK: TcxEditStyleController;
    DataBasePrK: TpFIBDatabase;
    TransactionReadPrK: TpFIBTransaction;
    TransactionWritePrK: TpFIBTransaction;
    DataSetPrKStat_Reports: TpFIBDataSet;
    cxLabelTypeDepart: TcxLabel;
    cxLookupComboBoxTypeDepart: TcxLookupComboBox;
    DataSetTypeDepart: TpFIBDataSet;
    DataSourceTypeDepart: TDataSource;
    cxLabelKatStud: TcxLabel;
    cxLookupComboBoxKatStud: TcxLookupComboBox;
    DataSetKatStud: TpFIBDataSet;
    DataSourceKatStud: TDataSource;
    cxLabelFormStudy: TcxLabel;
    cxLookupComboBoxFormStudy: TcxLookupComboBox;
    DataSetFormStudy: TpFIBDataSet;
    DataSourceFormStudy: TDataSource;
    cxLabelDergZakaz: TcxLabel;
    DataSetDergZakaz: TpFIBDataSet;
    DataSourceDergZakaz: TDataSource;
    cxLookupComboBoxDergZakaz: TcxLookupComboBox;
    cxLabelPotok: TcxLabel;
    DataSourcePotok: TDataSource;
    DataSetPotok: TpFIBDataSet;
    cxLookupComboBoxPotok: TcxLookupComboBox;
    cxLabelTYP_KT_STD: TcxLabel;
    cxLookupComboBoxTYP_KT_STD: TcxLookupComboBox;
    DataSetTYP_KT_STD: TpFIBDataSet;
    DataSourceTYP_KT_STD: TDataSource;
    cxLabelFRM_OB_KAT: TcxLabel;
    cxLookupComboBoxFRM_OB_KAT: TcxLookupComboBox;
    DataSetFRM_OB_KAT: TpFIBDataSet;
    DataSourceFRM_OB_KAT: TDataSource;
    cxGroupBoxGodNAb: TcxGroupBox;
    cxRadioButtonThisGodNab: TcxRadioButton;
    cxRadioButtonNotThisGodNab: TcxRadioButton;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxRadioButtonThisGodNabClick(Sender: TObject);
    procedure cxRadioButtonNotThisGodNabClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionCanselExecute(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
  private
    Layout: array[0.. KL_NAMELENGTH] of char;
    DBHANDLE             :TISC_DB_HANDLE;
    ResultArray          :TAArray;
    IndLang              :integer;
    TextViewColor        :TColor;
    ID_USER_GLOBAL       :int64;
    ID_GOD_NABORA_GLOBAL :int64;
    FSelectSQLTextPrKStat_Reports: String;
    FSelectSQLTextFormStudy: String;
    FSelectSQLTextKatStud: String;
    FSelectSQLTextTypeDep: String;
    FSelectSQLTextFRM_OB_KAT: String;
    FSelectSQLTextTYP_KT_STD: String;
    FSelectSQLTextDergZakaz: String;
    FSelectSQLTextPotok: String;
    procedure SetSelectSQLTextPrKStat_Reports(const Value: String);
    procedure InicCaption;
    procedure SetSQLToComboBox;
    procedure SetSelectSQLTextDergZakaz(const Value: String);
    procedure SetSelectSQLTextFormStudy(const Value: String);
    procedure SetSelectSQLTextFRM_OB_KAT(const Value: String);
    procedure SetSelectSQLTextKatStud(const Value: String);
    procedure SetSelectSQLTextPotok(const Value: String);
    procedure SetSelectSQLTextTYP_KT_STD(const Value: String);
    procedure SetSelectSQLTextTypeDep(const Value: String);
  public
    constructor Create(aOwner: TComponent;aParam :TAArray);overload;
    Property SelectSQLTextPrKStat_Reports :String read FSelectSQLTextPrKStat_Reports write SetSelectSQLTextPrKStat_Reports;
    Property SelectSQLTextTypeDep    :String read FSelectSQLTextTypeDep write SetSelectSQLTextTypeDep;
    Property SelectSQLTextTYP_KT_STD :String read FSelectSQLTextTYP_KT_STD write SetSelectSQLTextTYP_KT_STD;
    Property SelectSQLTextKatStud    :String read FSelectSQLTextKatStud write SetSelectSQLTextKatStud;
    Property SelectSQLTextFormStudy  :String read FSelectSQLTextFormStudy write SetSelectSQLTextFormStudy;
    Property SelectSQLTextDergZakaz  :String read FSelectSQLTextDergZakaz write SetSelectSQLTextDergZakaz;
    Property SelectSQLTextFRM_OB_KAT :String read FSelectSQLTextFRM_OB_KAT write SetSelectSQLTextFRM_OB_KAT;
    Property SelectSQLTextPotok      :String read FSelectSQLTextPotok write SetSelectSQLTextPotok;
  end;

  procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);stdcall;
  exports   ShowAllPrkBpl;

var
  FormPrK_Show_Reports: TFormPrK_Show_Reports;

implementation
uses
   uPrK_Resources,uConstants,AccMgmt,
   uPrK_Loader;
{$R *.dfm}

procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
var
 T :TFormPrK_Show_Reports;
begin
   T:=TFormPrK_Show_Reports.Create(aOwner,aParam);

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

procedure TFormPrK_Show_Reports.FormShow(Sender: TObject);
begin
   {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[IndLang]),KLF_ACTIVATE);
end;

constructor TFormPrK_Show_Reports.Create(aOwner: TComponent;
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
           //cxStyleBackGround_Content.Color               := $00EBC4A4;
           // cxStyleInactive.Color                         := $00F7EAD9;
          cxEditStyleControllerPrK.Style.Color := $00EBC4A4;
       end;
   end
   else ShowMessage('Ошибка HANDLE`a Базы');
end;

procedure TFormPrK_Show_Reports.FormCreate(Sender: TObject);
begin
   SelectSQLTextPrKStat_Reports   := 'Select * from PRK_SP_STAT_REPORTS_SELECT where id_sp_stat_reports=:id_sp_stat_reports';
   InicCaption;
   cxRadioButtonThisGodNab.Checked:=true;
end;

procedure TFormPrK_Show_Reports.SetSelectSQLTextPrKStat_Reports(
  const Value: String);
begin
  FSelectSQLTextPrKStat_Reports := Value;
    DataBasePrK.close;
    DataSetPrKStat_Reports.Active                        :=false;
    DataBasePrK.Handle                                   :=DBHANDLE;
    DataBasePrK.DefaultTransaction                       := TransactionReadPrK;
    DataSetPrKStat_Reports.Database                      := DataBasePrK;
    DataSetPrKStat_Reports.Transaction                   := TransactionReadPrK;
    DataSetPrKStat_Reports.SelectSQL.Clear;
    DataSetPrKStat_Reports.SQLs.SelectSQL.Text           := FSelectSQLTextPrKStat_Reports;
    DataSetPrKStat_Reports.ParamByName('id_sp_stat_reports').AsInt64 :=ResultArray['Input']['id_sp_stat_reports'].AsInt64;
    DataSetPrKStat_Reports.CloseOpen(false);
end;

procedure TFormPrK_Show_Reports.InicCaption;
begin
 TFormPrK_Show_Reports(self).Caption:=nFormPrK_Show_Reports_Caption[IndLang]+' "'+DataSetPrKStat_Reports.FBN('short_name').asString+'"';

 cxLabelTYP_KT_STD.Caption :=nLabelTYP_KT_STD[IndLang];
 cxLabelFRM_OB_KAT.Caption :=nLabelNameObuchKat[IndLang];
 cxLabelPotok.Caption      :=nLabelPotok[IndLang];
 cxLabelTypeDepart.Caption :=nLabelTypeDepart[IndLang];
 cxLabelKatStud.Caption    :=nLabelCnKatStud[IndLang];
 cxLabelFormStudy.Caption  :=nLabelCnFormStud[IndLang];
 cxLabelDergZakaz.Caption  :=nLabelDergZakaz[IndLang];

 cxRadioButtonThisGodNab.Caption    :=nRadioButtonThisGodNab[IndLang];
 cxRadioButtonNotThisGodNab.Caption :=nRadioButtonNotThisGodNab[IndLang];

 ActionOK.Caption         :=nActiont_OK[IndLang];
 ActionCansel.Caption     :=nActiont_Cansel[IndLang];
 ActionOK.Hint            :=nHintActiont_OK[IndLang];
 ActionCansel.Hint        :=nHintActiont_Cansel[IndLang];
end;

procedure TFormPrK_Show_Reports.SetSelectSQLTextDergZakaz(
  const Value: String);
begin
  FSelectSQLTextDergZakaz := Value;
    DataSetDergZakaz.Active                         :=false;
    DataSetDergZakaz.Database                       := DataBasePrK;
    DataSetDergZakaz.Transaction                    := TransactionReadPrK;
    DataSetDergZakaz.SelectSQL.Clear;
    DataSetDergZakaz.SQLs.SelectSQL.Text            := FSelectSQLTextDergZakaz;
    DataSetDergZakaz.ParamByName('is_sp_derg_zakaz').AsInteger :=DataSetPrKStat_Reports.FBN('is_sp_derg_zakaz').AsInteger;
    DataSetDergZakaz.ParamByName('id_sp_god_nabora').AsInt64   :=ResultArray['Input']['GodNabora'].AsInt64;
    if cxRadioButtonThisGodNab.Checked=true
     then DataSetDergZakaz.ParamByName('is_equal_god_nabora').AsInteger := 1
     else DataSetDergZakaz.ParamByName('is_equal_god_nabora').AsInteger := 0;
    DataSetDergZakaz.CloseOpen(false);

    DataSetDergZakaz.First;
    cxLookupComboBoxDergZakaz.Text    :=DataSetDergZakaz.FieldValues['SHORT_NAME'];
    if DataSetPrKStat_Reports.FBN('is_sp_derg_zakaz').AsInteger=0
     then cxLookupComboBoxDergZakaz.Enabled:=false;
end;

procedure TFormPrK_Show_Reports.SetSelectSQLTextFormStudy(
  const Value: String);
begin
  FSelectSQLTextFormStudy := Value;
    DataSetFormStudy.Active                         :=false;
    DataSetFormStudy.Database                       := DataBasePrK;
    DataSetFormStudy.Transaction                    := TransactionReadPrK;
    DataSetFormStudy.SelectSQL.Clear;
    DataSetFormStudy.SQLs.SelectSQL.Text            := FSelectSQLTextFormStudy;
    DataSetFormStudy.ParamByName('is_cn_sp_form_stud').AsInteger :=DataSetPrKStat_Reports.FBN('is_cn_sp_form_stud').AsInteger;
    DataSetFormStudy.ParamByName('id_sp_god_nabora').AsInt64     :=ResultArray['Input']['GodNabora'].AsInt64;
    if cxRadioButtonThisGodNab.Checked=true
     then DataSetFormStudy.ParamByName('is_equal_god_nabora').AsInteger := 1
     else DataSetFormStudy.ParamByName('is_equal_god_nabora').AsInteger := 0;
    DataSetFormStudy.CloseOpen(false);

    DataSetFormStudy.First;
    cxLookupComboBoxFormStudy.Text    :=DataSetFormStudy.FieldValues['SHORT_NAME'];
    if DataSetPrKStat_Reports.FBN('is_cn_sp_form_stud').AsInteger=0
     then cxLookupComboBoxFormStudy.Enabled:=false;
end;

procedure TFormPrK_Show_Reports.SetSelectSQLTextFRM_OB_KAT(
  const Value: String);
begin
  FSelectSQLTextFRM_OB_KAT := Value;
    DataSetFRM_OB_KAT.Active                         :=false;
    DataSetFRM_OB_KAT.Database                       := DataBasePrK;
    DataSetFRM_OB_KAT.Transaction                    := TransactionReadPrK;
    DataSetFRM_OB_KAT.SelectSQL.Clear;
    DataSetFRM_OB_KAT.SQLs.SelectSQL.Text            := FSelectSQLTextFRM_OB_KAT;
    DataSetFRM_OB_KAT.ParamByName('is_sp_form_obuch_kategory').AsInteger :=DataSetPrKStat_Reports.FBN('is_sp_form_obuch_kategory').AsInteger;
    DataSetFRM_OB_KAT.ParamByName('id_sp_god_nabora').AsInt64            :=ResultArray['Input']['GodNabora'].AsInt64;
    if cxRadioButtonThisGodNab.Checked=true
     then DataSetFRM_OB_KAT.ParamByName('is_equal_god_nabora').AsInteger := 1
     else DataSetFRM_OB_KAT.ParamByName('is_equal_god_nabora').AsInteger := 0;
    DataSetFRM_OB_KAT.CloseOpen(false);

    DataSetFRM_OB_KAT.First;
    cxLookupComboBoxFRM_OB_KAT.Text    :=DataSetFRM_OB_KAT.FieldValues['SHORT_NAME'];
    if DataSetPrKStat_Reports.FBN('is_sp_form_obuch_kategory').AsInteger=0
     then cxLookupComboBoxFRM_OB_KAT.Enabled:=false;
end;


procedure TFormPrK_Show_Reports.SetSelectSQLTextKatStud(
  const Value: String);
begin
  FSelectSQLTextKatStud := Value;
    DataSetKatStud.Active                         :=false;
    DataSetKatStud.Database                       := DataBasePrK;
    DataSetKatStud.Transaction                    := TransactionReadPrK;
    DataSetKatStud.SelectSQL.Clear;
    DataSetKatStud.SQLs.SelectSQL.Text            := FSelectSQLTextKatStud;
    DataSetKatStud.ParamByName('is_cn_sp_kat_stud').AsInteger :=DataSetPrKStat_Reports.FBN('is_cn_sp_kat_stud').AsInteger;
    DataSetKatStud.ParamByName('id_sp_god_nabora').AsInt64     :=ResultArray['Input']['GodNabora'].AsInt64;
    if cxRadioButtonThisGodNab.Checked=true
     then DataSetKatStud.ParamByName('is_equal_god_nabora').AsInteger := 1
     else DataSetKatStud.ParamByName('is_equal_god_nabora').AsInteger := 0;
    DataSetKatStud.CloseOpen(false);

    DataSetKatStud.First;
    cxLookupComboBoxKatStud.Text    :=DataSetKatStud.FieldValues['SHORT_NAME'];
    if DataSetPrKStat_Reports.FBN('is_cn_sp_kat_stud').AsInteger=0
     then cxLookupComboBoxKatStud.Enabled:=false;
end;

procedure TFormPrK_Show_Reports.SetSelectSQLTextPotok(const Value: String);
begin
  FSelectSQLTextPotok := Value;
    DataSetPotok.Active                         :=false;
    DataSetPotok.Database                       := DataBasePrK;
    DataSetPotok.Transaction                    := TransactionReadPrK;
    DataSetPotok.SelectSQL.Clear;
    DataSetPotok.SQLs.SelectSQL.Text            := FSelectSQLTextPotok;
    DataSetPotok.ParamByName('is_sp_potok').AsInteger       :=DataSetPrKStat_Reports.FBN('is_sp_potok').AsInteger;
    DataSetPotok.ParamByName('id_sp_god_nabora').AsInt64    :=ResultArray['Input']['GodNabora'].AsInt64;
    if cxRadioButtonThisGodNab.Checked=true
     then DataSetPotok.ParamByName('is_equal_god_nabora').AsInteger := 1
     else DataSetPotok.ParamByName('is_equal_god_nabora').AsInteger := 0;
    DataSetPotok.CloseOpen(false);

    DataSetPotok.First;
    cxLookupComboBoxPotok.Text    :=DataSetPotok.FieldValues['SHORT_NAME'];
    if DataSetPrKStat_Reports.FBN('is_sp_potok').AsInteger=0
     then cxLookupComboBoxPotok.Enabled:=false;
end;

procedure TFormPrK_Show_Reports.SetSelectSQLTextTYP_KT_STD(
  const Value: String);
begin
  FSelectSQLTextTYP_KT_STD := Value;
    DataSetTYP_KT_STD.Active                         :=false;
    DataSetTYP_KT_STD.Database                       := DataBasePrK;
    DataSetTYP_KT_STD.Transaction                    := TransactionReadPrK;
    DataSetTYP_KT_STD.SelectSQL.Clear;
    DataSetTYP_KT_STD.SQLs.SelectSQL.Text            := FSelectSQLTextTYP_KT_STD;
    DataSetTYP_KT_STD.ParamByName('is_sp_type_kat_stud').AsInteger :=DataSetPrKStat_Reports.FBN('is_sp_type_kat_stud').AsInteger;
    DataSetTYP_KT_STD.ParamByName('id_sp_god_nabora').AsInt64      :=ResultArray['Input']['GodNabora'].AsInt64;
    if cxRadioButtonThisGodNab.Checked=true
     then DataSetTYP_KT_STD.ParamByName('is_equal_god_nabora').AsInteger := 1
     else DataSetTYP_KT_STD.ParamByName('is_equal_god_nabora').AsInteger := 0;
    DataSetTYP_KT_STD.CloseOpen(false);

    DataSetTYP_KT_STD.First;
    cxLookupComboBoxTYP_KT_STD.Text    :=DataSetTYP_KT_STD.FieldValues['SHORT_NAME'];
    if DataSetPrKStat_Reports.FBN('is_sp_type_kat_stud').AsInteger=0
     then cxLookupComboBoxTYP_KT_STD.Enabled:=false;
end;

procedure TFormPrK_Show_Reports.SetSelectSQLTextTypeDep(
  const Value: String);
begin
  FSelectSQLTextTypeDep := Value;
    DataSetTypeDepart.Active                         :=false;
    DataSetTypeDepart.Database                       := DataBasePrK;
    DataSetTypeDepart.Transaction                    := TransactionReadPrK;
    DataSetTypeDepart.SelectSQL.Clear;
    DataSetTypeDepart.SQLs.SelectSQL.Text            := FSelectSQLTextTypeDep;
    DataSetTypeDepart.ParamByName('is_fak_center').AsInteger :=DataSetPrKStat_Reports.FBN('is_fak_center').AsInteger;
    DataSetTypeDepart.ParamByName('id_sp_god_nabora').AsInt64      :=ResultArray['Input']['GodNabora'].AsInt64;
    if cxRadioButtonThisGodNab.Checked=true
     then DataSetTypeDepart.ParamByName('is_equal_god_nabora').AsInteger := 1
     else DataSetTypeDepart.ParamByName('is_equal_god_nabora').AsInteger := 0;
    DataSetTypeDepart.CloseOpen(false);

    DataSetTypeDepart.First;
    cxLookupComboBoxTypeDepart.Text    :=DataSetTypeDepart.FieldValues['SHORT_NAME'];
    if DataSetPrKStat_Reports.FBN('is_fak_center').AsInteger=0
     then cxLookupComboBoxTypeDepart.Enabled:=false;
end;

procedure TFormPrK_Show_Reports.cxRadioButtonThisGodNabClick(
  Sender: TObject);
begin
   SetSQLToComboBox;
end;

procedure TFormPrK_Show_Reports.cxRadioButtonNotThisGodNabClick(
  Sender: TObject);
begin
  SetSQLToComboBox;
end;

procedure TFormPrK_Show_Reports.SetSQLToComboBox;
begin
  SelectSQLTextTypeDep    :='select * from PRK_SP_ST_RPT_FAK_CENTER_SELECT(:id_sp_god_nabora,:is_equal_god_nabora,:is_fak_center)';
  SelectSQLTextTYP_KT_STD :='select * from PRK_SP_ST_RPT_TYP_KT_STD_SELECT(:id_sp_god_nabora,:is_equal_god_nabora,:is_sp_type_kat_stud)';
  SelectSQLTextKatStud    :='select * from PRK_SP_ST_RPT_KAT_STUD_SELECT  (:id_sp_god_nabora,:is_equal_god_nabora,:is_cn_sp_kat_stud)';
  SelectSQLTextFormStudy  :='select * from PRK_SP_ST_RPT_FORM_STUD_SELECT (:id_sp_god_nabora,:is_equal_god_nabora,:is_cn_sp_form_stud)';
  SelectSQLTextDergZakaz  :='select * from PRK_SP_ST_RPT_DERG_ZAKAZ_SELECT(:id_sp_god_nabora,:is_equal_god_nabora,:is_sp_derg_zakaz)';
  SelectSQLTextFRM_OB_KAT :='select * from PRK_SP_ST_RPT_FRM_OB_KAT_SELECT(:id_sp_god_nabora,:is_equal_god_nabora,:is_sp_form_obuch_kategory)';
  SelectSQLTextPotok      :='select * from PRK_SP_ST_RPT_POTOK_SELECT     (:id_sp_god_nabora,:is_equal_god_nabora,:is_sp_potok)';

  // ShowMessage(DataSetPrKStat_Reports.FBN('is_sp_type_kat_stud').AsString);
end;

procedure TFormPrK_Show_Reports.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then begin
     Action:=caFree;
    end;
end;

procedure TFormPrK_Show_Reports.ActionCanselExecute(Sender: TObject);
begin
    close;
end;

procedure TFormPrK_Show_Reports.ActionOKExecute(Sender: TObject);
var
  InputParam :TAArray;
  i: integer;
begin
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_rptLoader.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DataBasePrK.Handle);
    InputParam['Input']['aNameReport'].AsString         := DataSetPrKStat_Reports.FBN('MODULE_NAME').AsString;


    i:=1;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_GOD_NABORA';
    InputParam['Input']['ParamValues'][i].AsVariant     := ID_GOD_NABORA_GLOBAL;
    i:=2;
    InputParam['Input']['ParamNames'][i].AsString       := 'id_fak_center';
    InputParam['Input']['ParamValues'][i].AsVariant     :=DataSetTypeDepart.FieldValues['id_fak_center'];
    i:=3;
    InputParam['Input']['ParamNames'][i].AsString       := 'id_sp_form_obuch_kategory';
    InputParam['Input']['ParamValues'][i].AsVariant     :=DataSetFRM_OB_KAT.FieldValues['id_sp_form_obuch_kategory'];
    i:=4;
    InputParam['Input']['ParamNames'][i].AsString       := 'id_cn_sp_form_stud';
    InputParam['Input']['ParamValues'][i].AsVariant     :=DataSetFormStudy.FieldValues['id_cn_sp_form_stud'];
    i:=5;
    InputParam['Input']['ParamNames'][i].AsString       := 'id_cn_sp_kat_stud';
    InputParam['Input']['ParamValues'][i].AsVariant     :=DataSetKatStud.FieldValues['id_cn_sp_kat_stud'];
    i:=6;
    InputParam['Input']['ParamNames'][i].AsString       := 'id_sp_type_kat_stud';
    InputParam['Input']['ParamValues'][i].AsVariant     :=DataSetTYP_KT_STD.FieldValues['id_sp_type_kat_stud'];
    i:=7;
    InputParam['Input']['ParamNames'][i].AsString       := 'id_sp_derg_zakaz';
    InputParam['Input']['ParamValues'][i].AsVariant     := DataSetDergZakaz.FieldValues['id_sp_derg_zakaz'];
    i:=8;
    InputParam['Input']['ParamNames'][i].AsString       := 'id_sp_potok';
    InputParam['Input']['ParamValues'][i].AsVariant     :=DataSetPotok.FieldValues['id_sp_potok'];

    i:=9;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_GOD_NABORA';
    InputParam['Input']['ParamValues'][i].AsVariant     :=ID_GOD_NABORA_GLOBAL;
    i:=10;
    InputParam['Input']['ParamNames'][i].AsString       := 'id_fak_center';
    InputParam['Input']['ParamValues'][i].AsVariant     :=DataSetTypeDepart.FieldValues['id_fak_center'];
    i:=11;
    InputParam['Input']['ParamNames'][i].AsString       := 'id_sp_form_obuch_kategory';
    InputParam['Input']['ParamValues'][i].AsVariant     :=DataSetFRM_OB_KAT.FieldValues['id_sp_form_obuch_kategory'];
    i:=12;
    InputParam['Input']['ParamNames'][i].AsString       := 'id_cn_sp_form_stud';
    InputParam['Input']['ParamValues'][i].AsVariant     :=DataSetFormStudy.FieldValues['id_cn_sp_form_stud'];
    i:=13;
    InputParam['Input']['ParamNames'][i].AsString       := 'id_cn_sp_kat_stud';
    InputParam['Input']['ParamValues'][i].AsVariant     :=DataSetKatStud.FieldValues['id_cn_sp_kat_stud'];
    i:=14;
    InputParam['Input']['ParamNames'][i].AsString       := 'id_sp_type_kat_stud';
    InputParam['Input']['ParamValues'][i].AsVariant     :=DataSetTYP_KT_STD.FieldValues['id_sp_type_kat_stud'];
    i:=15;
    InputParam['Input']['ParamNames'][i].AsString       := 'id_sp_derg_zakaz';
    InputParam['Input']['ParamValues'][i].AsVariant     := DataSetDergZakaz.FieldValues['id_sp_derg_zakaz'];
    i:=16;
    InputParam['Input']['ParamNames'][i].AsString       := 'id_sp_potok';
    InputParam['Input']['ParamValues'][i].AsVariant     :=DataSetPotok.FieldValues['id_sp_potok'];

    InputParam['Input']['Count_Param'].AsInteger        := 16;

    //for i:=1 to 8 do showmessage(InputParam['Input']['ParamValues'][i].AsString);

  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

end.
