unit uEKZ_VEDOM_ADD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, DB, FIBDataSet, pFIBDataSet,
  cxContainer, cxEdit, cxLabel, cxControls, cxGroupBox, cxButtonEdit,AArray,
  dxBar, dxBarExtItems, ActnList, ImgList, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxCalendar, RxMemDS;

type
  TFormEKZ_VEDOM_ADD = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxGroupBoxVstup: TcxGroupBox;
    cxLabelTypeDepart: TcxLabel;
    cxLabelFacul: TcxLabel;
    cxLabelSpec: TcxLabel;
    cxLabelFormStudy: TcxLabel;
    cxLabelKatStud: TcxLabel;
    DataSetTypeDepart: TpFIBDataSet;
    DataSourceTypeDepart: TDataSource;
    DataSetKatStud: TpFIBDataSet;
    DataSourceKatStud: TDataSource;
    DataSetFacul: TpFIBDataSet;
    DataSourceFacul: TDataSource;
    DataSetSpec: TpFIBDataSet;
    DataSourceSpec: TDataSource;
    DataSetFormStudy: TpFIBDataSet;
    DataSourceFormStudy: TDataSource;
    cxLookupComboBoxTypeDepart: TcxLookupComboBox;
    cxLookupComboBoxKatStud: TcxLookupComboBox;
    cxLookupComboBoxFacul: TcxLookupComboBox;
    cxLookupComboBoxSpec: TcxLookupComboBox;
    cxLookupComboBoxFormStudy: TcxLookupComboBox;
    cxLabelPredmet: TcxLabel;
    cxLookupComboBoxPredmet: TcxLookupComboBox;
    DataSetPredmet: TpFIBDataSet;
    DataSourcePredmet: TDataSource;
    cxLabelTip_ISPIT: TcxLabel;
    cxLookupComboBoxTip_ISPIT: TcxLookupComboBox;
    DataSetTip_ISPIT: TpFIBDataSet;
    DataSourceTip_ISPIT: TDataSource;
    cxLabelPotok: TcxLabel;
    cxButtonEditPotok: TcxButtonEdit;
    ImageListEkzVedom: TImageList;
    ActionListEkzVedom: TActionList;
    ActionObnov: TAction;
    ActionSaveVedom: TAction;
    ActionOtmena: TAction;
    dxBarManagerEkzVedom: TdxBarManager;
    dxBarLargeButtonSave: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    cxGridPrKNewVedom: TcxGrid;
    cxGridPrKNewVedomDBTableView1: TcxGridDBTableView;
    colNAME: TcxGridDBColumn;
    colVSEGO: TcxGridDBColumn;
    colMEDALISTI: TcxGridDBColumn;
    colINSHI: TcxGridDBColumn;
    colKOLVO_VEDOM: TcxGridDBColumn;
    colKOLVO_IN_VEDOM: TcxGridDBColumn;
    colNPP: TcxGridDBColumn;
    cxGridPrKNewVedomLevel1: TcxGridLevel;
    DataSourceNewVedom: TDataSource;
    DataSetNewVedom: TpFIBDataSet;
    cxLabelDergZakaz: TcxLabel;
    cxLookupComboBoxDergZakaz: TcxLookupComboBox;
    DataSetDergZakaz: TpFIBDataSet;
    DataSourceDergZakaz: TDataSource;
    cxLabelZAREESTROVANI_DO: TcxLabel;
    cxDateEditZAREESTROVANI_DO: TcxDateEdit;
    cxLabelDate_Prov: TcxLabel;
    RxMemoryNewVedom: TRxMemoryData;
    cxLookupComboBoxDate_Prov: TcxLookupComboBox;
    DataSetDate_Prov: TpFIBDataSet;
    DataSourceDate_Prov: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure cxButtonEditPotokPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxLookupComboBoxTypeDepartPropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxKatStudPropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxFaculPropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxSpecPropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxFormStudyPropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxPredmetPropertiesChange(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure cxLookupComboBoxDergZakazPropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxTip_ISPITPropertiesChange(Sender: TObject);
    procedure ActionSaveVedomExecute(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure cxDateEditZAREESTROVANI_DOPropertiesChange(Sender: TObject);
    procedure cxDateEditDate_ProvPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxLookupComboBoxDate_ProvPropertiesChange(Sender: TObject);
  private
    Layout: array[0.. KL_NAMELENGTH] of char;
    Id_Lang: integer;
    DataVedomAdd :TAArray;
    FSelectSQLTextFacul: string;
    FSelectSQLTextTypeDepart: string;
    FSelectSQLTextSpec: string;
    FSelectSQLTextKatStud: string;
    FSelectSQLTextFormStudy: string;
    FSelectSQLTextTip_Ispit: AnsiString;
    FSelectSQLTextPredmet: AnsiString;
    FSelectSQLTextNewVedom: string;
    FSelectSQLTextDergZakaz: AnsiString;
    FSelectSQLTextEkz_Date: AnsiString;
    procedure InicCaption;
    procedure SetSelectSQLTextFacul(const Value: string);
    procedure SetSelectSQLTextFormStudy(const Value: string);
    procedure SetSelectSQLTextKatStud(const Value: string);
    procedure SetSelectSQLTextSpec(const Value: string);
    procedure SetSelectSQLTextTypeDepart(const Value: string);
    procedure SetSelectSQLTextPredmet(const Value: AnsiString);
    procedure SetSelectSQLTextTip_Ispit(const Value: AnsiString);
    procedure SetSelectSQLTextNewVedom(const Value: string);
    procedure SetSelectSQLTextDergZakaz(const Value: AnsiString);
    procedure SetSelectSQLTextEkz_Date(const Value: AnsiString);
  public
    ID_DT_ISPIT_VEDOM_OUT :Int64;
    property SelectSQLTextNewVedom   :string read FSelectSQLTextNewVedom write SetSelectSQLTextNewVedom;
    property SelectSQLTextTypeDepart :string read FSelectSQLTextTypeDepart write SetSelectSQLTextTypeDepart;
    property SelectSQLTextKatStud    :string read FSelectSQLTextKatStud write SetSelectSQLTextKatStud;
    property SelectSQLTextFacul      :string read FSelectSQLTextFacul write SetSelectSQLTextFacul;
    property SelectSQLTextSpec       :string read FSelectSQLTextSpec write SetSelectSQLTextSpec;
    property SelectSQLTextFormStudy  :string read FSelectSQLTextFormStudy write SetSelectSQLTextFormStudy;
    property SelectSQLTextDergZakaz  :AnsiString read FSelectSQLTextDergZakaz write SetSelectSQLTextDergZakaz;
    property SelectSQLTextPredmet    :AnsiString read FSelectSQLTextPredmet write SetSelectSQLTextPredmet;
    property SelectSQLTextTip_Ispit  :AnsiString read FSelectSQLTextTip_Ispit write SetSelectSQLTextTip_Ispit;
    property SelectSQLTextEkz_Date   :AnsiString read FSelectSQLTextEkz_Date write SetSelectSQLTextEkz_Date;
  end;

var
  FormEKZ_VEDOM_ADD: TFormEKZ_VEDOM_ADD;

implementation
Uses
  uPrK_Resources,uConstants,uPrK_Ekz_Vedom,uPrK_Loader;
{$R *.dfm}

{ TFormEKZ_VEDOM_ADD }

procedure TFormEKZ_VEDOM_ADD.FormCreate(Sender: TObject);
var
   i:Int64;
begin
    Id_Lang  :=SelectLanguage;
    InicCaption;
    DataVedomAdd:=TAArray.Create;

    i:=TFormPrK_Ekz_Vedom(self.Owner).ID_GOD_NABORA_GLOBAL;



    SelectSQLTextTypeDepart :='Select * from PRK_ABIT_PL_FAK_CENTER('+IntToStr(i)+')';

    SelectSQLTextKatStud    :='Select * from PRK_ABIT_PL_KAT_STUD('+IntToStr(i)+') where ?Mas_ID_FAK_CENTER=ID_FAK_CENTER';

    SelectSQLTextFacul      :='Select * from PRK_ABIT_PL_FAK('+IntToStr(i)+') where'
                             +' ?Mas_ID_CN_SP_KAT_STUD=ID_CN_SP_KAT_STUD and ?Mas_ID_FAK_CENTER=ID_FAK_CENTER';

    SelectSQLTextSpec       :='Select * from PRK_ABIT_PL_SPEC('+IntToStr(i)+') where ?Mas_ID_CN_SP_FAK=ID_CN_SP_FAK and'
                             +' ?Mas_ID_CN_SP_KAT_STUD=ID_CN_SP_KAT_STUD and ?Mas_ID_FAK_CENTER=ID_FAK_CENTER';

    SelectSQLTextFormStudy  :='Select * from PRK_ABIT_PL_FORM_STUD('+IntToStr(i)+') where'
                             +' ?Mas_ID_CN_JN_FACUL_SPEC=ID_CN_JN_FACUL_SPEC and ?Mas_ID_CN_SP_FAK=ID_CN_SP_FAK and'
                             +' ?Mas_ID_CN_SP_KAT_STUD=ID_CN_SP_KAT_STUD and ?Mas_ID_FAK_CENTER=ID_FAK_CENTER';

    SelectSQLTextPredmet    :='Select * from PRK_ABIT_PL_PREDM('+IntToStr(i)+') where'
                             +' ?Mas_ID_CN_SP_FORM_STUD=ID_CN_SP_FORM_STUD and ?Mas_ID_CN_JN_FACUL_SPEC=ID_CN_JN_FACUL_SPEC and'
                             +' ?Mas_ID_CN_SP_FAK=ID_CN_SP_FAK and ?Mas_ID_CN_SP_KAT_STUD=ID_CN_SP_KAT_STUD and'
                             +' ?Mas_ID_FAK_CENTER=ID_FAK_CENTER';

    SelectSQLTextDergZakaz  :='Select * from PRK_ABIT_PL_DERG_ZAKAZ('+IntToStr(i)+') where'
                             +' ?Mas_ID_CN_SP_FORM_STUD=ID_CN_SP_FORM_STUD and ?Mas_ID_CN_JN_FACUL_SPEC=ID_CN_JN_FACUL_SPEC and'
                             +' ?Mas_ID_CN_SP_FAK=ID_CN_SP_FAK and ?Mas_ID_CN_SP_KAT_STUD=ID_CN_SP_KAT_STUD and'
                             +' ?Mas_ID_FAK_CENTER=ID_FAK_CENTER';

    SelectSQLTextTip_Ispit  :='Select * from PRK_ABIT_PL_TYPE_ISPIT('+IntToStr(i)+') where'
                             +' ?Mas_ID_CN_SP_FORM_STUD=ID_CN_SP_FORM_STUD and ?Mas_ID_CN_JN_FACUL_SPEC=ID_CN_JN_FACUL_SPEC and'
                             +' ?Mas_ID_CN_SP_FAK=ID_CN_SP_FAK and ?Mas_ID_CN_SP_KAT_STUD=ID_CN_SP_KAT_STUD and'
                             +' ?Mas_ID_FAK_CENTER=ID_FAK_CENTER and ?Mas_ID_SP_PREDM=ID_SP_PREDM and'
                             +' :Par_ID_SP_DERG_ZAKAZ=ID_SP_DERG_ZAKAZ';

    SelectSQLTextEkz_Date   :='Select * from PRK_ABIT_PL_EKZ_DATE('+IntToStr(i)+') where'
                             +' ?Mas_ID_CN_SP_FORM_STUD=ID_CN_SP_FORM_STUD and ?Mas_ID_CN_JN_FACUL_SPEC=ID_CN_JN_FACUL_SPEC and'
                             +' ?Mas_ID_CN_SP_FAK=ID_CN_SP_FAK and ?Mas_ID_CN_SP_KAT_STUD=ID_CN_SP_KAT_STUD and'
                             +' ?Mas_ID_FAK_CENTER=ID_FAK_CENTER and ?Mas_ID_SP_PREDM=ID_SP_PREDM and'
                             +' :Par_ID_SP_DERG_ZAKAZ=ID_SP_DERG_ZAKAZ and :Par_ID_SP_POTOK=ID_SP_POTOK';

   cxLookupComboBoxFacul.Enabled         :=false;
   cxLookupComboBoxKatStud.Enabled       :=false;
   cxLookupComboBoxSpec.Enabled          :=false;
   cxLookupComboBoxFormStudy.Enabled     :=false;
   cxLookupComboBoxDergZakaz.Enabled     :=false;
   cxLookupComboBoxPredmet.Enabled       :=false;
   cxLookupComboBoxTip_ISPIT.Enabled     :=false;

   cxDateEditZAREESTROVANI_DO.Enabled    :=false;
   cxLookupComboBoxDate_Prov.Enabled     :=false;

   ActionObnov.Enabled                   :=false;
   ActionSaveVedom.Enabled               :=false;


   if DataSetTypeDepart.RecordCount =1
               then cxLookupComboBoxTypeDepart.Text:=DataSetTypeDepart.FieldValues['SHORT_NAME'];


    cxButtonEditPotok.Text :='';
end;

procedure TFormEKZ_VEDOM_ADD.InicCaption;
var
   i: integer;
begin
   i:=Id_Lang;

    cxLookupComboBoxTypeDepart.Style := TFormPrK_Ekz_Vedom(self.Owner).cxEditStyleControllerEkzVedom.Style;
    cxLookupComboBoxKatStud.Style    := TFormPrK_Ekz_Vedom(self.Owner).cxEditStyleControllerEkzVedom.Style;
    cxLookupComboBoxFacul.Style      := TFormPrK_Ekz_Vedom(self.Owner).cxEditStyleControllerEkzVedom.Style;
    cxLookupComboBoxSpec.Style       := TFormPrK_Ekz_Vedom(self.Owner).cxEditStyleControllerEkzVedom.Style;
    cxLookupComboBoxFormStudy.Style  := TFormPrK_Ekz_Vedom(self.Owner).cxEditStyleControllerEkzVedom.Style;
    cxLookupComboBoxDergZakaz.Style  := TFormPrK_Ekz_Vedom(self.Owner).cxEditStyleControllerEkzVedom.Style;
    cxLookupComboBoxPredmet.Style    := TFormPrK_Ekz_Vedom(self.Owner).cxEditStyleControllerEkzVedom.Style;
    cxLookupComboBoxTip_ISPIT.Style  := TFormPrK_Ekz_Vedom(self.Owner).cxEditStyleControllerEkzVedom.Style;
    cxLookupComboBoxDate_Prov.Style  := TFormPrK_Ekz_Vedom(self.Owner).cxEditStyleControllerEkzVedom.Style;
    cxButtonEditPotok.Style          := TFormPrK_Ekz_Vedom(self.Owner).cxEditStyleControllerEkzVedom.Style;

    cxGridPrKNewVedomDBTableView1.Styles.Header     :=TFormPrK_Ekz_Vedom(Self.owner).cxStyleHeader;
    cxGridPrKNewVedomDBTableView1.Styles.Background :=TFormPrK_Ekz_Vedom(Self.owner).cxStyleBackGround_Content;
    cxGridPrKNewVedomDBTableView1.Styles.Content    :=TFormPrK_Ekz_Vedom(Self.owner).cxStyleBackGround_Content;
    cxGridPrKNewVedomDBTableView1.Styles.Selection  :=TFormPrK_Ekz_Vedom(Self.owner).cxStyleSelection;
    cxGridPrKNewVedomDBTableView1.Styles.Inactive   :=TFormPrK_Ekz_Vedom(Self.owner).cxStyleInactive;


    TFormEKZ_VEDOM_ADD(self).Caption                :=nFormEKZ_VEDOM_ADD_Caption[i];
    cxLabelTypeDepart.Caption :=nLabelTypeDepart[i];
    cxLabelKatStud.Caption    :=nLabelCnKatStud[i];
    cxLabelFacul.Caption      :=nLabelNameCnFak[i];
    cxLabelSpec.Caption       :=nLabelNameSpec[i];
    cxLabelFormStudy.Caption  :=nLabelCnFormStud[i];
    cxLabelDergZakaz.Caption  :=nLabelDergZakaz[i];
    cxLabelPredmet.Caption    :=nLabelPredm[i];
    cxLabelTip_ISPIT.Caption  :=nLabelTip_ISPIT[i];

    cxLabelZAREESTROVANI_DO.Caption  :=nLabelZAREESTROVANI_DO[i];
    cxLabelDate_Prov.Caption         :=nLabelDate_Prov[i];

    cxLabelPotok.Caption      :=nLabelPotok[i];

    ActionObnov.Caption       :=nAction_Sklasti[i];
    ActionSaveVedom.Caption   :=nActionSave[i];
    ActionOtmena.Caption      :=nAction_Exit[i];
    ActionObnov.Hint          :=nHintAction_SklastiVedom[i];
    ActionSaveVedom.Hint      :=nHintActionSaveVedom[i];
    ActionOtmena.Hint         :=nHintAction_Exit[i];

    colNPP.Caption            :=ncolNPP[i];
    colNAME.Caption           :=ncolNAME[i];
    colVSEGO.Caption          :=ncolVSEGO[i];
    colMEDALISTI.Caption      :=ncolMEDALISTI[i];
    colINSHI.Caption          :=ncolINSHI[i];
    colKOLVO_VEDOM.Caption    :=ncolKOLVO_VEDOM[i];
    colKOLVO_IN_VEDOM.Caption :=ncolKOLVO_IN_VEDOM[i];
end;

procedure TFormEKZ_VEDOM_ADD.SetSelectSQLTextTypeDepart(
  const Value: string);
begin
  FSelectSQLTextTypeDepart := Value;
    DataSetTypeDepart.Active                         :=false;
    DataSetTypeDepart.Database                       := TFormPrK_Ekz_Vedom(self.Owner).DataBasePrKEkzVedom;
    DataSetTypeDepart.Transaction                    := TFormPrK_Ekz_Vedom(self.Owner).TransactionReadPrKEkzVedom;
    DataSetTypeDepart.SelectSQL.Clear;
    DataSetTypeDepart.SQLs.SelectSQL.Text            := FSelectSQLTextTypeDepart;
    DataSetTypeDepart.CloseOpen(false);

end;

procedure TFormEKZ_VEDOM_ADD.SetSelectSQLTextKatStud(const Value: string);
begin
  FSelectSQLTextKatStud := Value;
    DataSetKatStud.Active                         :=false;
    DataSetKatStud.Database                       := TFormPrK_Ekz_Vedom(self.Owner).DataBasePrKEkzVedom;
    DataSetKatStud.Transaction                    := TFormPrK_Ekz_Vedom(self.Owner).TransactionReadPrKEkzVedom;
    DataSetKatStud.SelectSQL.Clear;
    DataSetKatStud.SQLs.SelectSQL.Text            := FSelectSQLTextKatStud;
    DataSetKatStud.CloseOpen(false);
end;

procedure TFormEKZ_VEDOM_ADD.SetSelectSQLTextFacul(const Value: string);
begin
  FSelectSQLTextFacul := Value;
    DataSetFacul.Active                         :=false;
    DataSetFacul.Database                       := TFormPrK_Ekz_Vedom(self.Owner).DataBasePrKEkzVedom;
    DataSetFacul.Transaction                    := TFormPrK_Ekz_Vedom(self.Owner).TransactionReadPrKEkzVedom;
    DataSetFacul.SelectSQL.Clear;
    DataSetFacul.SQLs.SelectSQL.Text            := FSelectSQLTextFacul;
    DataSetFacul.CloseOpen(false);
end;

procedure TFormEKZ_VEDOM_ADD.SetSelectSQLTextSpec(const Value: string);
begin
  FSelectSQLTextSpec := Value;
    DataSetSpec.Active                         :=false;
    DataSetSpec.Database                       := TFormPrK_Ekz_Vedom(self.Owner).DataBasePrKEkzVedom;
    DataSetSpec.Transaction                    := TFormPrK_Ekz_Vedom(self.Owner).TransactionReadPrKEkzVedom;
    DataSetSpec.SelectSQL.Clear;
    DataSetSpec.SQLs.SelectSQL.Text            := FSelectSQLTextSpec;
    DataSetSpec.CloseOpen(false);
end;

procedure TFormEKZ_VEDOM_ADD.SetSelectSQLTextFormStudy(
  const Value: string);
begin
  FSelectSQLTextFormStudy := Value;
    DataSetFormStudy.Active                         :=false;
    DataSetFormStudy.Database                       := TFormPrK_Ekz_Vedom(self.Owner).DataBasePrKEkzVedom;
    DataSetFormStudy.Transaction                    := TFormPrK_Ekz_Vedom(self.Owner).TransactionReadPrKEkzVedom;
    DataSetFormStudy.SelectSQL.Clear;
    DataSetFormStudy.SQLs.SelectSQL.Text            := FSelectSQLTextFormStudy;
    DataSetFormStudy.CloseOpen(false);
end;

procedure TFormEKZ_VEDOM_ADD.SetSelectSQLTextDergZakaz(
  const Value: AnsiString);
begin
  FSelectSQLTextDergZakaz := Value;
    DataSetDergZakaz.Active                         :=false;
    DataSetDergZakaz.Database                       := TFormPrK_Ekz_Vedom(self.Owner).DataBasePrKEkzVedom;
    DataSetDergZakaz.Transaction                    := TFormPrK_Ekz_Vedom(self.Owner).TransactionReadPrKEkzVedom;
    DataSetDergZakaz.SelectSQL.Clear;
    DataSetDergZakaz.SQLs.SelectSQL.Text            := FSelectSQLTextDergZakaz;
    DataSetDergZakaz.CloseOpen(false);
end;

procedure TFormEKZ_VEDOM_ADD.SetSelectSQLTextPredmet(
  const Value: AnsiString);
begin
  FSelectSQLTextPredmet := Value;
    DataSetPredmet.Active                         :=false;
    DataSetPredmet.Database                       := TFormPrK_Ekz_Vedom(self.Owner).DataBasePrKEkzVedom;
    DataSetPredmet.Transaction                    := TFormPrK_Ekz_Vedom(self.Owner).TransactionReadPrKEkzVedom;
    DataSetPredmet.SelectSQL.Clear;
    DataSetPredmet.SQLs.SelectSQL.Text            := FSelectSQLTextPredmet;
    DataSetPredmet.CloseOpen(false);
end;

procedure TFormEKZ_VEDOM_ADD.SetSelectSQLTextTip_Ispit(
  const Value: AnsiString);
begin
  FSelectSQLTextTip_Ispit := Value;
    DataSetTIP_ISPIT.Active                         :=false;
    DataSetTIP_ISPIT.Database                       := TFormPrK_Ekz_Vedom(self.Owner).DataBasePrKEkzVedom;
    DataSetTIP_ISPIT.Transaction                    := TFormPrK_Ekz_Vedom(self.Owner).TransactionReadPrKEkzVedom;
    DataSetTIP_ISPIT.SelectSQL.Clear;
    DataSetTIP_ISPIT.SQLs.SelectSQL.Text            := FSelectSQLTextTip_Ispit;
    {12.03.07 Т.к. невозможно сделать МастерДеталь сразу на два Dataset'a, то добавляем один параметр :Par_ID_SP_DERG_ZAKAZ}
    DataSetTip_ISPIT.ParamByName('Par_ID_SP_DERG_ZAKAZ').AsInt64:= DataSetDergZakaz.FieldValues['ID_SP_DERG_ZAKAZ'];
    DataSetTIP_ISPIT.CloseOpen(false);
end;

procedure TFormEKZ_VEDOM_ADD.SetSelectSQLTextEkz_Date(
  const Value: AnsiString);
begin
  FSelectSQLTextEkz_Date := Value;
  DataSetDate_Prov.Active                         :=false;
    DataSetDate_Prov.Database                       := TFormPrK_Ekz_Vedom(self.Owner).DataBasePrKEkzVedom;
    DataSetDate_Prov.Transaction                    := TFormPrK_Ekz_Vedom(self.Owner).TransactionReadPrKEkzVedom;
    DataSetDate_Prov.SelectSQL.Clear;
    DataSetDate_Prov.SQLs.SelectSQL.Text            := FSelectSQLTextEkz_Date;
    DataSetDate_Prov.ParamByName('Par_ID_SP_DERG_ZAKAZ').AsInt64:= DataSetDergZakaz.FieldValues['ID_SP_DERG_ZAKAZ'];
    if DataVedomAdd['ID_SP_POTOK'].AsInt64=Null
    then DataSetDate_Prov.ParamByName('Par_ID_SP_POTOK').AsInt64     := -1
    else DataSetDate_Prov.ParamByName('Par_ID_SP_POTOK').AsInt64     := DataVedomAdd['ID_SP_POTOK'].AsInt64;
    DataSetDate_Prov.CloseOpen(false);
end;


procedure TFormEKZ_VEDOM_ADD.cxButtonEditPotokPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  res: Variant;
begin
  res :=  uPrK_Loader.ShowPrkSprav(self,TFormPrK_Ekz_Vedom(self.Owner).DataBasePrKEkzVedom.Handle,PrK_SP_POTOK,fsNormal);
  if VarArrayDimCount(res) > 0 then
  begin
    if res[0]<>NULL THEN
    begin
        DataVedomAdd['ID_SP_POTOK'].AsInt64      := Res[0];
        DataVedomAdd['Name_SP_POTOK'].AsString   := Res[2];
        cxButtonEditPotok.Text      :=DataVedomAdd['Name_SP_POTOK'].AsString;

        if ((Trim(cxLookupComboBoxPredmet.Text)   ='') or
            (Trim(cxLookupComboBoxDergZakaz.Text) ='')   )then
          begin
            cxLookupComboBoxDate_Prov.Text    :='';
            cxLookupComboBoxDate_Prov.Enabled :=false;
          end
          else begin
            DataSetDate_Prov.Active :=false;
            DataSetDate_Prov.ParamByName('Par_ID_SP_DERG_ZAKAZ').AsInt64:= DataSetDergZakaz.FieldValues['ID_SP_DERG_ZAKAZ'];
            DataSetDate_Prov.ParamByName('Par_ID_SP_POTOK').AsInt64     := DataVedomAdd['ID_SP_POTOK'].AsInt64;
            DataSetDate_Prov.CloseOpen(false);
            if DataSetDate_Prov.RecordCount =1
             then cxLookupComboBoxDate_Prov.Text := DataSetDate_Prov.FieldValues['EKZ_DATE'];
            cxLookupComboBoxDate_Prov.Enabled:=true;
          end;

        if cxLookupComboBoxTip_ISPIT.Text =''
        then ActionObnov.Enabled             :=false
        else ActionObnov.Enabled             :=true;

        ActionSaveVedom.Enabled         :=false;
    end;
  end;
end;

procedure TFormEKZ_VEDOM_ADD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  DataVedomAdd.free;
  DataVedomAdd:=Nil;
end;

procedure TFormEKZ_VEDOM_ADD.cxLookupComboBoxTypeDepartPropertiesChange(
  Sender: TObject);
begin
  if cxLookupComboBoxTypeDepart.Text =''
    then begin
      cxLookupComboBoxKatStud.Text       :='';
      cxLookupComboBoxKatStud.Enabled    :=false;
    end
    else begin
      cxLookupComboBoxKatStud.Enabled :=true;
      if DataSetKatStud.RecordCount=1
       then cxLookupComboBoxKatStud.Text:= DataSetKatStud.FieldValues['SHORT_NAME'];
    end;
end;

procedure TFormEKZ_VEDOM_ADD.cxLookupComboBoxKatStudPropertiesChange(
  Sender: TObject);
begin
  if cxLookupComboBoxKatStud.Text =''
    then begin
     cxLookupComboBoxFacul.Text    :='';
     cxLookupComboBoxFacul.Enabled :=false;
    end
    else begin
     cxLookupComboBoxFacul.Enabled :=true;
     if DataSetFacul.RecordCount=1
       then cxLookupComboBoxFacul.Text:= DataSetFacul.FieldValues['SHORT_NAME'];
    end;
end;

procedure TFormEKZ_VEDOM_ADD.cxLookupComboBoxFaculPropertiesChange(
  Sender: TObject);
begin
  if cxLookupComboBoxFacul.Text =''
    then begin
     cxLookupComboBoxSpec.Text    :='';
     cxLookupComboBoxSpec.Enabled :=false;
    end
    else begin
     cxLookupComboBoxSpec.Enabled :=true;
     if DataSetSpec.RecordCount=1
       then cxLookupComboBoxSpec.Text:= DataSetSpec.FieldValues['SHORT_NAME'];
    end;
end;

procedure TFormEKZ_VEDOM_ADD.cxLookupComboBoxSpecPropertiesChange(
  Sender: TObject);
begin
  if cxLookupComboBoxSpec.Text =''
    then begin
     cxLookupComboBoxFormStudy.Text    :='';
     cxLookupComboBoxFormStudy.Enabled :=false;
    end
    else begin
     cxLookupComboBoxFormStudy.Enabled :=true;
     if DataSetFormStudy.RecordCount=1
       then cxLookupComboBoxFormStudy.Text:= DataSetFormStudy.FieldValues['SHORT_NAME'];
    end;
end;

procedure TFormEKZ_VEDOM_ADD.cxLookupComboBoxFormStudyPropertiesChange(
  Sender: TObject);
begin
  if cxLookupComboBoxFormStudy.Text ='' then
    begin
      cxLookupComboBoxDergZakaz.Text    :='';
      cxLookupComboBoxPredmet.Text      :='';

      cxLookupComboBoxDergZakaz.Enabled   :=false;
      cxLookupComboBoxPredmet.Enabled     :=false;
    end
    else begin
      cxLookupComboBoxDergZakaz.Enabled :=true;
      cxLookupComboBoxPredmet.Enabled   :=true;

      if DataSetDergZakaz.RecordCount =1
       then cxLookupComboBoxDergZakaz.Text := DataSetDergZakaz.FieldValues['SHORT_NAME'];
      if DataSetPredmet.RecordCount   =1
       then cxLookupComboBoxPredmet.Text   := DataSetPredmet.FieldValues['SHORT_NAME'];
    end;
end;

procedure TFormEKZ_VEDOM_ADD.cxLookupComboBoxDergZakazPropertiesChange(
  Sender: TObject);
begin
   if ((cxLookupComboBoxDergZakaz.Text ='') or
       (cxLookupComboBoxPredmet.Text   ='')   )then
    begin
      cxLookupComboBoxTip_ISPIT.Text    :='';
      cxLookupComboBoxTip_ISPIT.Enabled :=false;

      cxLookupComboBoxDate_Prov.Text    :='';
      cxLookupComboBoxDate_Prov.Enabled :=false;
    end
    else begin
      cxLookupComboBoxTip_ISPIT.Enabled :=true;
      {12.03.07 Т.к. невозможно сделать МастерДеталь сразу на два Dataset'a, то добавляем один параметр :Par_ID_SP_DERG_ZAKAZ}
      DataSetTip_ISPIT.Active:=false;
      DataSetTip_ISPIT.ParamByName('Par_ID_SP_DERG_ZAKAZ').AsInt64:= DataSetDergZakaz.FieldValues['ID_SP_DERG_ZAKAZ'];
      DataSetTip_ISPIT.CloseOpen(true);
      if DataSetTip_ISPIT.RecordCount =1
       then cxLookupComboBoxTip_ISPIT.Text := DataSetTip_ISPIT.FieldValues['SHORT_NAME'];

      {14.03.07}
      if Trim(cxButtonEditPotok.Text)='' then
       begin
          cxLookupComboBoxDate_Prov.Text    :='';
          cxLookupComboBoxDate_Prov.Enabled :=false;
       end
       else begin
        DataSetDate_Prov.Active:=false;
        DataSetDate_Prov.ParamByName('Par_ID_SP_DERG_ZAKAZ').AsInt64:= DataSetDergZakaz.FieldValues['ID_SP_DERG_ZAKAZ'];
        if DataVedomAdd['ID_SP_POTOK'].AsInt64=Null
         then DataSetDate_Prov.ParamByName('Par_ID_SP_POTOK').AsInt64     := -1
         else DataSetDate_Prov.ParamByName('Par_ID_SP_POTOK').AsInt64     := DataVedomAdd['ID_SP_POTOK'].AsInt64;
        DataSetDate_Prov.CloseOpen(false);
        if DataSetDate_Prov.RecordCount =1
         then cxLookupComboBoxDate_Prov.Text := DataSetDate_Prov.FieldValues['EKZ_DATE'];
        cxLookupComboBoxDate_Prov.Enabled :=true;
       end;
    end;
end;

procedure TFormEKZ_VEDOM_ADD.cxLookupComboBoxPredmetPropertiesChange(
  Sender: TObject);
begin
   if ((Trim(cxLookupComboBoxPredmet.Text)   ='') or
       (Trim(cxLookupComboBoxDergZakaz.Text) ='')   )then
    begin
      cxLookupComboBoxTip_ISPIT.Text    :='';
      cxLookupComboBoxTip_ISPIT.Enabled :=false;

      cxLookupComboBoxDate_Prov.Text    :='';
      cxLookupComboBoxDate_Prov.Enabled :=false;
    end
    else begin
      cxLookupComboBoxTip_ISPIT.Enabled :=true;
      if DataSetTip_ISPIT.RecordCount =1
       then cxLookupComboBoxTip_ISPIT.Text := DataSetTip_ISPIT.FieldValues['SHORT_NAME'];

     {14.03.07}
      if Trim(cxButtonEditPotok.Text)='' then
       begin
          cxLookupComboBoxDate_Prov.Text    :='';
          cxLookupComboBoxDate_Prov.Enabled :=false;
       end
       else begin
        DataSetDate_Prov.Active:=false;
        DataSetDate_Prov.ParamByName('Par_ID_SP_DERG_ZAKAZ').AsInt64:= DataSetDergZakaz.FieldValues['ID_SP_DERG_ZAKAZ'];
        if DataVedomAdd['ID_SP_POTOK'].AsInt64=Null
         then DataSetDate_Prov.ParamByName('Par_ID_SP_POTOK').AsInt64     := -1
         else DataSetDate_Prov.ParamByName('Par_ID_SP_POTOK').AsInt64     := DataVedomAdd['ID_SP_POTOK'].AsInt64;
        DataSetDate_Prov.CloseOpen(false);
        if DataSetDate_Prov.RecordCount =1
         then cxLookupComboBoxDate_Prov.Text := DataSetDate_Prov.FieldValues['EKZ_DATE'];
        cxLookupComboBoxDate_Prov.Enabled :=true;
       end;
    end;
end;

procedure TFormEKZ_VEDOM_ADD.cxLookupComboBoxTip_ISPITPropertiesChange(
  Sender: TObject);
begin
   ActionSaveVedom.Enabled         :=false;

   if cxLookupComboBoxTip_ISPIT.Text =''then
    begin
       cxDateEditZAREESTROVANI_DO.Text   :='';
       ActionObnov.Enabled             :=false;
    end
    else begin   
       if Trim(cxButtonEditPotok.Text)=''
        then begin
          ActionObnov.Enabled             :=false;
          ActionSaveVedom.Enabled         :=false;
        end
        else ActionObnov.Enabled             :=true;

       if DataSetTip_ISPIT.FieldValues['IS_SPIVBESIDA']<>0 then
        begin
            cxDateEditZAREESTROVANI_DO.Date :=Date;

            cxDateEditZAREESTROVANI_DO.Enabled   :=true;
        end
        else begin
            cxDateEditZAREESTROVANI_DO.Date :=date;

            cxDateEditZAREESTROVANI_DO.Enabled :=false;
        end;
    end;
end;

procedure TFormEKZ_VEDOM_ADD.ActionObnovExecute(Sender: TObject);
begin
    if cxDateEditZAREESTROVANI_DO.Text='' then
     begin
       ShowMessage(nMsgEmtyDateReestracii[Id_Lang]);
       cxDateEditZAREESTROVANI_DO.SetFocus;
       exit;
     end;

    if cxLookupComboBoxDate_Prov.Text='' then
     begin
       ShowMessage(nMsgEmptyEKZ_DATE[Id_Lang]);
       cxLookupComboBoxDate_Prov.SetFocus;
       exit;
     end;

    SelectSQLTextNewVedom :='Select * from PRK_DT_ISPIT_VEDOM_SOSTAV(:ID_CN_SP_FORM_STUD,:ID_CN_SP_KAT_STUD,'
                           +':ID_CN_JN_FACUL_SPEC,:ID_CN_SP_FAK,:ID_SP_PREDM,:ID_SP_DERG_ZAKAZ,:ID_SP_POTOK,'
                           +':IS_SPIVBESIDA,:ID_SP_GOD_NABORA,:ZAREESTROVANI_DO) order by NPP';
end;

procedure TFormEKZ_VEDOM_ADD.SetSelectSQLTextNewVedom(const Value: string);
begin
  FSelectSQLTextNewVedom := Value;
    DataSetNewVedom.Active                         :=false;
    DataSetNewVedom.Database                       := TFormPrK_Ekz_Vedom(self.Owner).DataBasePrKEkzVedom;
    DataSetNewVedom.Transaction                    := TFormPrK_Ekz_Vedom(self.Owner).TransactionReadPrKEkzVedom;
    DataSetNewVedom.SelectSQL.Clear;
    DataSetNewVedom.SQLs.SelectSQL.Text            := FSelectSQLTextNewVedom;
    DataSetNewVedom.ParamByName('ID_CN_SP_FORM_STUD').AsInt64       :=DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
    DataSetNewVedom.ParamByName('ID_CN_SP_KAT_STUD').AsInt64        :=DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
    DataSetNewVedom.ParamByName('ID_CN_JN_FACUL_SPEC').AsInt64      :=DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC'];
    DataSetNewVedom.ParamByName('ID_CN_SP_FAK').AsInt64             :=DataSetFacul.FieldValues['ID_CN_SP_FAK'];
    DataSetNewVedom.ParamByName('ID_SP_PREDM').AsInt64              :=DataSetPredmet.FieldValues['ID_SP_PREDM'];
    DataSetNewVedom.ParamByName('ID_SP_DERG_ZAKAZ').AsInt64         :=DataSetDergZakaz.FieldValues['ID_SP_DERG_ZAKAZ'];
    DataSetNewVedom.ParamByName('ID_SP_POTOK').AsInt64              :=DataVedomAdd['ID_SP_POTOK'].AsInt64;
    DataSetNewVedom.ParamByName('IS_SPIVBESIDA').AsInteger          :=DataSetTip_ISPIT.FieldValues['IS_SPIVBESIDA'];
    DataSetNewVedom.ParamByName('ID_SP_GOD_NABORA').AsInt64         :=TFormPrK_Ekz_Vedom(self.Owner).ID_GOD_NABORA_GLOBAL;
    DataSetNewVedom.ParamByName('ZAREESTROVANI_DO').AsDate          :=cxDateEditZAREESTROVANI_DO.Date;
    DataSetNewVedom.CloseOpen(false);
    DataSetNewVedom.FetchAll;

    RxMemoryNewVedom.LoadFromDataSet(DataSetNewVedom,DataSetNewVedom.RecordCount,lmCopy);
    DataSetNewVedom.Active :=false;

    RxMemoryNewVedom.Locate('NPP',1,[]);
    if RxMemoryNewVedom.FieldByName('VSEGO').AsInteger=0
     then ActionSaveVedom.Enabled :=false
     else ActionSaveVedom.Enabled :=true; 
end;

procedure TFormEKZ_VEDOM_ADD.ActionSaveVedomExecute(Sender: TObject);
begin
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.Transaction.StartTransaction;
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.StoredProcName:='PRK_DT_ISPIT_VEDOM_FORM';
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.Prepare;
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_CN_SP_FORM_STUD').AsInt64   :=DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_CN_SP_KAT_STUD').AsInt64    :=DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_CN_JN_FACUL_SPEC').AsInt64  :=DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC'];
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_CN_SP_FAK').AsInt64         :=DataSetFacul.FieldValues['ID_CN_SP_FAK'];
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_SP_PREDM').AsInt64          :=DataSetPredmet.FieldValues['ID_SP_PREDM'];
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_SP_DERG_ZAKAZ').AsInt64     :=DataSetDergZakaz.FieldValues['ID_SP_DERG_ZAKAZ'];
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_SP_POTOK').AsInt64          :=DataVedomAdd['ID_SP_POTOK'].AsInt64;
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('IS_SPIVBESIDA').AsInteger      :=DataSetTip_ISPIT.FieldValues['IS_SPIVBESIDA'];
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_SP_GOD_NABORA').AsInt64     :=TFormPrK_Ekz_Vedom(self.Owner).ID_GOD_NABORA_GLOBAL;
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('EKZ_DATE').AsDate              :=DataSetDate_Prov.FieldValues['EKZ_DATE'];
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ZAREESTROVANI_DO').AsDate      :=cxDateEditZAREESTROVANI_DO.Date;
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_USER').AsInt64              :=TFormPrK_Ekz_Vedom(self.Owner).ID_USER_GLOBAL;
       try
          TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ExecProc;
          TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.Transaction.Commit;
          ID_DT_ISPIT_VEDOM_OUT:=TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.FieldByName('ID_DT_ISPIT_VEDOM').AsInt64;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[Id_Lang]+chr(13)+
                        nMsgTryAgain[Id_Lang]+nMsgOr[Id_Lang]+nMsgToAdmin[Id_Lang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[Id_Lang]),MB_OK or MB_ICONWARNING);
             TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.Transaction.Rollback;
             Exit;
          end;
       end;

      ModalResult:=mrOk;
end;

procedure TFormEKZ_VEDOM_ADD.ActionOtmenaExecute(Sender: TObject);
begin
  close;
end;

procedure TFormEKZ_VEDOM_ADD.cxDateEditZAREESTROVANI_DOPropertiesChange(
  Sender: TObject);
begin
   ActionSaveVedom.Enabled:=false;
end;

procedure TFormEKZ_VEDOM_ADD.cxDateEditDate_ProvPropertiesChange(
  Sender: TObject);
begin
   ActionSaveVedom.Enabled:=false;
end;

procedure TFormEKZ_VEDOM_ADD.FormShow(Sender: TObject);
begin
                                     {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[Id_Lang]),KLF_ACTIVATE);
end;

procedure TFormEKZ_VEDOM_ADD.cxLookupComboBoxDate_ProvPropertiesChange(
  Sender: TObject);
begin
    if Trim(cxLookupComboBoxDate_Prov.Text)=''
     then ActionSaveVedom.Enabled:=false;
end;

end.
