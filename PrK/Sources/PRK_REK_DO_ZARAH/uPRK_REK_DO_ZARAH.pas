unit uPRK_REK_DO_ZARAH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, Placemnt, cxContainer, cxEdit, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, dxBar, dxBarExtItems,
  ActnList, ImgList, DB, FIBDataSet, pFIBDataSet, cxButtonEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxLabel, cxControls, cxGroupBox,AArray,ibase,ib_externals,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  RxMemDS, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxCheckComboBox,
  cxCheckBox, uPrK_Resources;

type
  TFormPRK_REK_DO_ZARAH = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxGroupBoxVstup: TcxGroupBox;
    cxLabelTypeDepart: TcxLabel;
    cxLabelFacul: TcxLabel;
    cxLabelSpec: TcxLabel;
    cxLabelFormStudy: TcxLabel;
    cxLabelKatStud: TcxLabel;
    cxLookupComboBoxTypeDepart: TcxLookupComboBox;
    cxLookupComboBoxKatStud: TcxLookupComboBox;
    cxLookupComboBoxFacul: TcxLookupComboBox;
    cxLookupComboBoxSpec: TcxLookupComboBox;
    cxLookupComboBoxFormStudy: TcxLookupComboBox;
    cxLabelPotok: TcxLabel;
    cxButtonEditPotok: TcxButtonEdit;
    cxLabelDergZakaz: TcxLabel;
    cxLookupComboBoxDergZakaz: TcxLookupComboBox;
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
    DataSetDergZakaz: TpFIBDataSet;
    DataSourceDergZakaz: TDataSource;
    ImageListREK_DO_ZARAH: TImageList;
    ActionListREK_DO_ZARAH: TActionList;
    ActionObnov: TAction;
    ActionSaveRecDoZarah: TAction;
    ActionOtmena: TAction;
    dxBarManagerREK_DO_ZARAH: TdxBarManager;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonSave: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    DataBasePrKREK_DO_ZARAH: TpFIBDatabase;
    TransactionReadPrKREK_DO_ZARAH: TpFIBTransaction;
    TransactionWritePrKREK_DO_ZARAH: TpFIBTransaction;
    DataSourcePrKREK_DO_ZARAH: TDataSource;
    DataSetPrKREK_DO_ZARAH: TpFIBDataSet;
    StoredProcPrKREK_DO_ZARAH: TpFIBStoredProc;
    cxEditStyleControllerREK_DO_ZARAH: TcxEditStyleController;
    FormStorageREK_DO_ZARAH: TFormStorage;
    StyleRepositoryREK_DO_ZARAH: TcxStyleRepository;
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
    cxStyleSkyBlue: TcxStyle;
    cxStyleBackGround_Content: TcxStyle;
    cxStyleSelection: TcxStyle;
    cxGridPrK_REK_DO_ZARAH: TcxGrid;
    cxGridPrK_REK_DO_ZARAHDBTableView1: TcxGridDBTableView;
    colNPP: TcxGridDBColumn;
    colFIO: TcxGridDBColumn;
    colNOMER_DELA: TcxGridDBColumn;
    colIS_REK_ZACHISL: TcxGridDBColumn;
    colIS_CEL_NABOR: TcxGridDBColumn;
    cxGridPrK_REK_DO_ZARAHLevel1: TcxGridLevel;
    RxMemoryDataREK_DO_ZARAH: TRxMemoryData;
    dxBarLargeButton1: TdxBarLargeButton;
    ActionPrintRecDoZarah: TAction;
    dxBarPopupMenuRDZ: TdxBarPopupMenu;
    dxBarButton1: TdxBarButton;
    ActionPrintPovidomProZarah: TAction;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    ActionPrintBoss: TAction;
    ActionPrintStend: TAction;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InicCaption;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxLookupComboBoxTypeDepartPropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxKatStudPropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxFaculPropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxSpecPropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxFormStudyPropertiesChange(Sender: TObject);
    procedure cxButtonEditPotokPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxLookupComboBoxDergZakazPropertiesChange(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionSaveRecDoZarahExecute(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionPrintPovidomProZarahExecute(Sender: TObject);
    procedure ActionPrintRecDoZarahExecute(Sender: TObject);
    procedure ActionPrintBossExecute(Sender: TObject);
    procedure ActionPrintStendExecute(Sender: TObject);
  private
    Layout: array[0.. KL_NAMELENGTH] of char;
    DBHANDLE       :TISC_DB_HANDLE;
    ResultArray    :TAArray;
    IndLangRDR     :integer;
    TextViewColor  :TColor;
    pMode:RejimPrK;
    Instance: Integer;
    FSelectSQLTextDergZakaz: AnsiString;
    FSelectSQLTextSpec: string;
    FSelectSQLTextKatStud: string;
    FSelectSQLTextFacul: string;
    FSelectSQLTextFormStudy: string;
    FSelectSQLTextTypeDepart: string;
    FSelectSQLRec_Do_Zarah: string;
    procedure SetSelectSQLTextDergZakaz(const Value: AnsiString);
    procedure SetSelectSQLTextFacul(const Value: string);
    procedure SetSelectSQLTextFormStudy(const Value: string);
    procedure SetSelectSQLTextKatStud(const Value: string);
    procedure SetSelectSQLTextSpec(const Value: string);
    procedure SetSelectSQLTextTypeDepart(const Value: string);
    procedure SetSelectSQLRec_Do_Zarah(const Value: string);
    procedure SetFormReadyTo(AMode:RejimPrK);
  public
    ID_USER_GLOBAL       :int64;
    ID_GOD_NABORA_GLOBAL :int64;
    constructor Create(aOwner: TComponent;aParam :TAArray);overload;
    property SelectSQLTextTypeDepart :string read FSelectSQLTextTypeDepart write SetSelectSQLTextTypeDepart;
    property SelectSQLTextKatStud    :string read FSelectSQLTextKatStud write SetSelectSQLTextKatStud;
    property SelectSQLTextFacul      :string read FSelectSQLTextFacul write SetSelectSQLTextFacul;
    property SelectSQLTextSpec       :string read FSelectSQLTextSpec write SetSelectSQLTextSpec;
    property SelectSQLTextFormStudy  :string read FSelectSQLTextFormStudy write SetSelectSQLTextFormStudy;
    property SelectSQLTextDergZakaz  :AnsiString read FSelectSQLTextDergZakaz write SetSelectSQLTextDergZakaz;
    property SelectSQLRec_Do_Zarah   :string read FSelectSQLRec_Do_Zarah write SetSelectSQLRec_Do_Zarah;
  end;

  procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);stdcall;
//  exports   ShowAllPrkBpl;

var
  FormPRK_REK_DO_ZARAH: TFormPRK_REK_DO_ZARAH;

implementation
uses
   uConstants,AccMgmt,
   uPrK_Loader;
{$R *.dfm}

procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
var
 T :TFormPRK_REK_DO_ZARAH;
begin
   T:=TFormPRK_REK_DO_ZARAH.Create(aOwner,aParam);

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

procedure TFormPRK_REK_DO_ZARAH.SetFormReadyTo(AMode:RejimPrK);
var IsVisible:Boolean;
begin
  IsVisible:=Visible;
  Visible:=False;

   ActionObnov.Enabled                   :=false;
   ActionSaveRecDoZarah.Enabled          :=false;
   ActionPrintRecDoZarah.Enabled         :=false;
   ActionPrintPovidomProZarah.Enabled    :=false;

//  pMode:=AMode;
  if AMode=AddPrK then
    begin
      FormStorageREK_DO_ZARAH.Active:=False;
      BorderStyle:=bsSizeable;
      cxGroupBox1.Visible            := True;
      cxGridPrK_REK_DO_ZARAH.Visible := False;
      Height:=100+cxGroupBox1.Height;
    end
  else
    begin
      BorderStyle:=bsSizeable;
      cxGroupBox1.Visible            := False;
      cxGridPrK_REK_DO_ZARAH.Visible := True;
      ActionObnov.Visible:=False;
      ActionObnovExecute(Self);
      Height:=50+cxGridPrK_REK_DO_ZARAH.Height;

      if pMode=ViewPrK then
        begin
          ActionSaveRecDoZarah.Enabled          :=false;
          ActionPrintRecDoZarah.Enabled         :=false;
          ActionPrintPovidomProZarah.Enabled    :=false;
        end;
    end;
  Visible:=IsVisible;
end;


constructor TFormPRK_REK_DO_ZARAH.Create(aOwner: TComponent;
  aParam: TAArray);
begin
   if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
   begin
      DBHANDLE      :=PVoid(aParam['Input']['aDBHANDLE'].asInteger);
      ResultArray   :=aParam;
      IndLangRDR    :=SelectLanguage;
      TextViewColor :=cl3DLight;
      FormStyle:=fsNormal;
      ID_USER_GLOBAL         :=ResultArray['Input']['ID_USER_GLOBAL'].AsInt64;
      ID_GOD_NABORA_GLOBAL   :=ResultArray['Input']['GodNabora'].AsInt64;
      pMode                  :=RejimPrK(ResultArray['Input']['AMode'].AsVariant);
      Instance := 0;
      inherited Create(aOwner);
      if SelectShemaColor=1 then
       begin
          cxStyleBackGround_Content.Color               := $00EBC4A4;
          cxStyleInactive.Color                         := $00F7EAD9;
          cxEditStyleControllerREK_DO_ZARAH.Style.Color := $00EBC4A4;
       end;
   end
   else ShowMessage('Ошибка HANDLE`a Базы');
end;

procedure TFormPRK_REK_DO_ZARAH.FormShow(Sender: TObject);
begin
                                 {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[IndLangRDR]),KLF_ACTIVATE);
end;

procedure TFormPRK_REK_DO_ZARAH.FormCreate(Sender: TObject);
var
 i:int64;
begin
   InicCaption ;
   i:=ID_GOD_NABORA_GLOBAL;

    DataBasePrKREK_DO_ZARAH.close;
    DataBasePrKREK_DO_ZARAH.Handle                        :=DBHANDLE;
    DataBasePrKREK_DO_ZARAH.DefaultTransaction            := TransactionReadPrKREK_DO_ZARAH;

      SetFormReadyTo(pMode);

 if pMode=AddPrK then
  begin
    SelectSQLTextTypeDepart :='Select * from PRK_ABIT_PL_FAK_CENTER('+IntToStr(i)+')';

    SelectSQLTextKatStud    :='Select * from PRK_ABIT_PL_KAT_STUD('+IntToStr(i)+') where ?Mas_ID_FAK_CENTER=ID_FAK_CENTER';

    SelectSQLTextFacul      :='Select * from PRK_ABIT_PL_FAK('+IntToStr(i)+') where'
                             +' ?Mas_ID_CN_SP_KAT_STUD=ID_CN_SP_KAT_STUD and ?Mas_ID_FAK_CENTER=ID_FAK_CENTER';

    SelectSQLTextSpec       :='Select * from PRK_ABIT_PL_SPEC('+IntToStr(i)+') where ?Mas_ID_CN_SP_FAK=ID_CN_SP_FAK and'
                             +' ?Mas_ID_CN_SP_KAT_STUD=ID_CN_SP_KAT_STUD and ?Mas_ID_FAK_CENTER=ID_FAK_CENTER';

    SelectSQLTextFormStudy  :='Select * from PRK_ABIT_PL_FORM_STUD('+IntToStr(i)+') where'
                             +' ?Mas_ID_CN_JN_FACUL_SPEC=ID_CN_JN_FACUL_SPEC and ?Mas_ID_CN_SP_FAK=ID_CN_SP_FAK and'
                             +' ?Mas_ID_CN_SP_KAT_STUD=ID_CN_SP_KAT_STUD and ?Mas_ID_FAK_CENTER=ID_FAK_CENTER';

    SelectSQLTextDergZakaz  :='Select * from PRK_ABIT_PL_DERG_ZAKAZ('+IntToStr(i)+') where'
                             +' ?Mas_ID_CN_SP_FORM_STUD=ID_CN_SP_FORM_STUD and ?Mas_ID_CN_JN_FACUL_SPEC=ID_CN_JN_FACUL_SPEC and'
                             +' ?Mas_ID_CN_SP_FAK=ID_CN_SP_FAK and ?Mas_ID_CN_SP_KAT_STUD=ID_CN_SP_KAT_STUD and'
                             +' ?Mas_ID_FAK_CENTER=ID_FAK_CENTER';

   cxLookupComboBoxFacul.Enabled         :=false;
   cxLookupComboBoxKatStud.Enabled       :=false;
   cxLookupComboBoxSpec.Enabled          :=false;
   cxLookupComboBoxFormStudy.Enabled     :=false;
   cxLookupComboBoxDergZakaz.Enabled     :=false;

   if DataSetTypeDepart.RecordCount =1
               then cxLookupComboBoxTypeDepart.Text:=DataSetTypeDepart.FieldValues['SHORT_NAME'];

   cxButtonEditPotok.Text :='';
  end;
end;

procedure TFormPRK_REK_DO_ZARAH.InicCaption;
var
   i: integer;
begin
   i:=IndLangRDR;

    cxLookupComboBoxTypeDepart.Style := cxEditStyleControllerREK_DO_ZARAH.Style;
    cxLookupComboBoxKatStud.Style    := cxEditStyleControllerREK_DO_ZARAH.Style;
    cxLookupComboBoxFacul.Style      := cxEditStyleControllerREK_DO_ZARAH.Style;
    cxLookupComboBoxSpec.Style       := cxEditStyleControllerREK_DO_ZARAH.Style;
    cxLookupComboBoxFormStudy.Style  := cxEditStyleControllerREK_DO_ZARAH.Style;
    cxLookupComboBoxDergZakaz.Style  := cxEditStyleControllerREK_DO_ZARAH.Style;
    cxButtonEditPotok.Style          := cxEditStyleControllerREK_DO_ZARAH.Style;

    cxGridPrK_REK_DO_ZARAHDBTableView1.Styles.Header     :=cxStyleHeader;
    cxGridPrK_REK_DO_ZARAHDBTableView1.Styles.Background :=cxStyleSkyBlue;
    cxGridPrK_REK_DO_ZARAHDBTableView1.Styles.Content    :=cxStyleSkyBlue;
    cxGridPrK_REK_DO_ZARAHDBTableView1.Styles.Selection  :=cxStyleSelection;
    cxGridPrK_REK_DO_ZARAHDBTableView1.Styles.Inactive   :=cxStyleInactive;


    TFormPRK_REK_DO_ZARAH(self).Caption               :=nFormPRK_REK_DO_ZARAH_Caption[i];
    cxLabelTypeDepart.Caption :=nLabelTypeDepart[i];
    cxLabelKatStud.Caption    :=nLabelCnKatStud[i];
    cxLabelFacul.Caption      :=nLabelNameCnFak[i];
    cxLabelSpec.Caption       :=nLabelNameSpec[i];
    cxLabelFormStudy.Caption  :=nLabelCnFormStud[i];
    cxLabelDergZakaz.Caption  :=nLabelDergZakaz[i];

    cxLabelPotok.Caption      :=nLabelPotok[i];

    ActionObnov.Caption                :=nAction_Sklasti[i];
    ActionSaveRecDoZarah.Caption       :=nActionSave[i];
    ActionOtmena.Caption               :=nAction_Exit[i];
    ActionPrintRecDoZarah.Caption      :=nActionPrintRecDoZarah[i];
    ActionPrintPovidomProZarah.Caption :=nActionPrintPovidProZarah[i];
    ActionPrintBoss.Caption            :=nActionPrintBoss[i];
    ActionPrintStend.Caption           :=nActionPrintStend[i];
    ActionObnov.Hint                 :=nHintAction_SklastiRecDoZarah[i];
    ActionSaveRecDoZarah.Hint        :=nHintActionSaveRecDoZarah[i];
    ActionOtmena.Hint                :=nHintAction_Exit[i];
    ActionPrintRecDoZarah.Hint       :=nHintActionPrintRecDoZarah[i];
    ActionPrintPovidomProZarah.Hint  :=nHintActionPrintPovidProZarah[i];
    ActionPrintBoss.Hint                :=nHintActionPrintBoss[i];
    ActionPrintStend.Hint           :=nHintActionPrintStend[i];

    colNPP.Caption                         :=ncolNPP[i];
    colFIO.Caption                         :=ncolFIO[i];
    colNOMER_DELA.Caption                  :=ncolNOMER_DELA[i];
    colIS_REK_ZACHISL.Caption              :=ncolIS_REK_ZACHISL[i];
    colIS_CEL_NABOR.Caption                :=ncolIS_CEL_NABOR[i];
end;

procedure TFormPRK_REK_DO_ZARAH.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then begin
     ResultArray.Free;
     ResultArray:=nil;
     Action:=caFree;
    end;
end;

procedure TFormPRK_REK_DO_ZARAH.SetSelectSQLTextTypeDepart(
  const Value: string);
begin
  FSelectSQLTextTypeDepart := Value;
    DataSetTypeDepart.Active                         :=false;
    DataSetTypeDepart.Database                       := DataBasePrKREK_DO_ZARAH;
    DataSetTypeDepart.Transaction                    := TransactionReadPrKREK_DO_ZARAH;
    DataSetTypeDepart.SelectSQL.Clear;
    DataSetTypeDepart.SQLs.SelectSQL.Text            := FSelectSQLTextTypeDepart;
    DataSetTypeDepart.CloseOpen(false);

end;

procedure TFormPRK_REK_DO_ZARAH.SetSelectSQLTextKatStud(const Value: string);
begin
  FSelectSQLTextKatStud := Value;
    DataSetKatStud.Active                         :=false;
    DataSetKatStud.Database                       := DataBasePrKREK_DO_ZARAH;
    DataSetKatStud.Transaction                    := TransactionReadPrKREK_DO_ZARAH;
    DataSetKatStud.SelectSQL.Clear;
    DataSetKatStud.SQLs.SelectSQL.Text            := FSelectSQLTextKatStud;
    DataSetKatStud.CloseOpen(false);
end;

procedure TFormPRK_REK_DO_ZARAH.SetSelectSQLTextFacul(const Value: string);
begin
  FSelectSQLTextFacul := Value;
    DataSetFacul.Active                         :=false;
    DataSetFacul.Database                       := DataBasePrKREK_DO_ZARAH;
    DataSetFacul.Transaction                    := TransactionReadPrKREK_DO_ZARAH;
    DataSetFacul.SelectSQL.Clear;
    DataSetFacul.SQLs.SelectSQL.Text            := FSelectSQLTextFacul;
    DataSetFacul.CloseOpen(false);
end;

procedure TFormPRK_REK_DO_ZARAH.SetSelectSQLTextSpec(const Value: string);
begin
  FSelectSQLTextSpec := Value;
    DataSetSpec.Active                         :=false;
    DataSetSpec.Database                       := DataBasePrKREK_DO_ZARAH;
    DataSetSpec.Transaction                    := TransactionReadPrKREK_DO_ZARAH;
    DataSetSpec.SelectSQL.Clear;
    DataSetSpec.SQLs.SelectSQL.Text            := FSelectSQLTextSpec;
    DataSetSpec.CloseOpen(false);
end;

procedure TFormPRK_REK_DO_ZARAH.SetSelectSQLTextFormStudy(
  const Value: string);
begin
  FSelectSQLTextFormStudy := Value;
    DataSetFormStudy.Active                         :=false;
    DataSetFormStudy.Database                       := DataBasePrKREK_DO_ZARAH;
    DataSetFormStudy.Transaction                    := TransactionReadPrKREK_DO_ZARAH;
    DataSetFormStudy.SelectSQL.Clear;
    DataSetFormStudy.SQLs.SelectSQL.Text            := FSelectSQLTextFormStudy;
    DataSetFormStudy.CloseOpen(false);
end;

procedure TFormPRK_REK_DO_ZARAH.SetSelectSQLTextDergZakaz(
  const Value: AnsiString);
begin
  FSelectSQLTextDergZakaz := Value;
    DataSetDergZakaz.Active                         :=false;
    DataSetDergZakaz.Database                       := DataBasePrKREK_DO_ZARAH;
    DataSetDergZakaz.Transaction                    := TransactionReadPrKREK_DO_ZARAH;
    DataSetDergZakaz.SelectSQL.Clear;
    DataSetDergZakaz.SQLs.SelectSQL.Text            := FSelectSQLTextDergZakaz;
    DataSetDergZakaz.CloseOpen(false);
end;

procedure TFormPRK_REK_DO_ZARAH.cxLookupComboBoxTypeDepartPropertiesChange(
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

procedure TFormPRK_REK_DO_ZARAH.cxLookupComboBoxKatStudPropertiesChange(
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

procedure TFormPRK_REK_DO_ZARAH.cxLookupComboBoxFaculPropertiesChange(
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

procedure TFormPRK_REK_DO_ZARAH.cxLookupComboBoxSpecPropertiesChange(
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

procedure TFormPRK_REK_DO_ZARAH.cxLookupComboBoxFormStudyPropertiesChange(
  Sender: TObject);
begin
  if cxLookupComboBoxFormStudy.Text ='' then
    begin
      cxLookupComboBoxDergZakaz.Text     :='';
      cxLookupComboBoxDergZakaz.Enabled  :=false;
    end
    else begin
      cxLookupComboBoxDergZakaz.Enabled :=true;

      if DataSetDergZakaz.RecordCount =1
       then cxLookupComboBoxDergZakaz.Text := DataSetDergZakaz.FieldValues['SHORT_NAME'];
    end;
end;

procedure TFormPRK_REK_DO_ZARAH.cxLookupComboBoxDergZakazPropertiesChange(
  Sender: TObject);
begin
   ActionSaveRecDoZarah.Enabled         :=false;
   ActionPrintRecDoZarah.Enabled        :=false;
   ActionPrintPovidomProZarah.Enabled   :=false;
    if cxLookupComboBoxDergZakaz.Text ='' then
    begin
       ActionObnov.Enabled             :=false;
    end
    else begin   
       if Trim(cxButtonEditPotok.Text)=''
        then begin
          ActionObnov.Enabled                :=false;
          ActionSaveRecDoZarah.Enabled       :=false;
          ActionPrintRecDoZarah.Enabled      :=false;
        end
        else ActionObnov.Enabled           :=true;
    end;
end;

procedure TFormPRK_REK_DO_ZARAH.cxButtonEditPotokPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  res: Variant;
begin
  res :=  uPrK_Loader.ShowPrkSprav(self,DataBasePrKREK_DO_ZARAH.Handle,PrK_SP_POTOK,fsNormal);
  if VarArrayDimCount(res) > 0 then
  begin
    if res[0]<>NULL THEN
    begin
        ResultArray['Data_RDR']['ID_SP_POTOK'].AsInt64      := Res[0];
        ResultArray['Data_RDR']['Name_SP_POTOK'].AsString   := Res[2];
        cxButtonEditPotok.Text      :=ResultArray['Data_RDR']['Name_SP_POTOK'].AsString;

        if cxLookupComboBoxDergZakaz.Text =''
        then ActionObnov.Enabled             :=false
        else ActionObnov.Enabled             :=true;

        ActionSaveRecDoZarah.Enabled         :=false;
        ActionPrintRecDoZarah.Enabled        :=false;
        ActionPrintPovidomProZarah.Enabled   :=false;
    end;
  end;
end;

procedure TFormPRK_REK_DO_ZARAH.ActionObnovExecute(Sender: TObject);
begin
{   SelectSQLRec_Do_Zarah :='Select * from PRK_REK_DO_ZARAH_SELECT(:ID_SP_GOD_NABORA,:ID_CN_SP_FAK,'
                           +':ID_CN_JN_FACUL_SPEC,:ID_CN_SP_FORM_STUD,'
                           +':ID_CN_SP_KAT_STUD,:ID_SP_DERG_ZAKAZ,:ID_SP_POTOK) order by NPP';
}
 Instance := Instance +1;
 if pMode=AddPrK then
  begin
   SelectSQLRec_Do_Zarah :='Select * from PRK_REK_DO_ZARAH_FORM(:ID_SP_GOD_NABORA,:ID_CN_SP_FAK,'
                           +':ID_CN_JN_FACUL_SPEC,:ID_CN_SP_FORM_STUD,'
                           +':ID_CN_SP_KAT_STUD,:ID_SP_DERG_ZAKAZ,:ID_SP_POTOK) order by NPP';

    ResultArray['Input']['ID_CN_SP_FAK'].AsInt64        := DataSetPrKREK_DO_ZARAH.ParamByName('ID_CN_SP_FAK').AsInt64;
    ResultArray['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64 := DataSetPrKREK_DO_ZARAH.ParamByName('ID_CN_JN_FACUL_SPEC').AsInt64;
    ResultArray['Input']['ID_CN_SP_FORM_STUD'].AsInt64  := DataSetPrKREK_DO_ZARAH.ParamByName('ID_CN_SP_FORM_STUD').AsInt64;
    ResultArray['Input']['ID_CN_SP_KAT_STUD'].AsInt64   := DataSetPrKREK_DO_ZARAH.ParamByName('ID_CN_SP_KAT_STUD').AsInt64;
    ResultArray['Input']['ID_SP_DERG_ZAKAZ'].AsInt64    := DataSetPrKREK_DO_ZARAH.ParamByName('ID_SP_DERG_ZAKAZ').AsInt64;
    ResultArray['Input']['ID_SP_POTOK'].AsInt64         := DataSetPrKREK_DO_ZARAH.ParamByName('ID_SP_POTOK').AsInt64;

    if Instance = 1 then SetFormReadyTo(ChangePrk);
  end
 else
  begin
   SelectSQLRec_Do_Zarah :='Select * from PRK_REK_DO_ZARAH_SELECT(:ID_SP_GOD_NABORA,:ID_CN_SP_FAK,'
                           +':ID_CN_JN_FACUL_SPEC,:ID_CN_SP_FORM_STUD,'
                           +':ID_CN_SP_KAT_STUD,:ID_SP_DERG_ZAKAZ,:ID_SP_POTOK) order by NPP';
  end;
end;

procedure TFormPRK_REK_DO_ZARAH.SetSelectSQLRec_Do_Zarah(
  const Value: string);
begin
  FSelectSQLRec_Do_Zarah := Value;
    DataSetPrKREK_DO_ZARAH.Active                         :=false;
    DataSetPrKREK_DO_ZARAH.Database                       := DataBasePrKREK_DO_ZARAH;
    DataSetPrKREK_DO_ZARAH.Transaction                    := TransactionReadPrKREK_DO_ZARAH;
    DataSetPrKREK_DO_ZARAH.SelectSQL.Clear;
    DataSetPrKREK_DO_ZARAH.SQLs.SelectSQL.Text            := FSelectSQLRec_Do_Zarah;

  if pMode=AddPrK then
   begin
    DataSetPrKREK_DO_ZARAH.ParamByName('ID_SP_GOD_NABORA').AsInt64       :=ID_GOD_NABORA_GLOBAL;
    DataSetPrKREK_DO_ZARAH.ParamByName('ID_CN_SP_FAK').AsInt64           :=DataSetFacul.FieldValues['ID_CN_SP_FAK'];
    DataSetPrKREK_DO_ZARAH.ParamByName('ID_CN_JN_FACUL_SPEC').AsInt64    :=DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC'];
    DataSetPrKREK_DO_ZARAH.ParamByName('ID_CN_SP_FORM_STUD').AsInt64     :=DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
    DataSetPrKREK_DO_ZARAH.ParamByName('ID_CN_SP_KAT_STUD').AsInt64      :=DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
    DataSetPrKREK_DO_ZARAH.ParamByName('ID_SP_DERG_ZAKAZ').AsInt64       :=DataSetDergZakaz.FieldValues['ID_SP_DERG_ZAKAZ'];
    DataSetPrKREK_DO_ZARAH.ParamByName('ID_SP_POTOK').AsInt64            :=ResultArray['Data_RDR']['ID_SP_POTOK'].AsInt64;
   end
  else
   begin
    DataSetPrKREK_DO_ZARAH.ParamByName('ID_SP_GOD_NABORA').AsInt64       :=ID_GOD_NABORA_GLOBAL;
    DataSetPrKREK_DO_ZARAH.ParamByName('ID_CN_SP_FAK').AsInt64           :=ResultArray['Input']['ID_CN_SP_FAK'].AsInt64;
    DataSetPrKREK_DO_ZARAH.ParamByName('ID_CN_JN_FACUL_SPEC').AsInt64    :=ResultArray['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64;
    DataSetPrKREK_DO_ZARAH.ParamByName('ID_CN_SP_FORM_STUD').AsInt64     :=ResultArray['Input']['ID_CN_SP_FORM_STUD'].AsInt64;
    DataSetPrKREK_DO_ZARAH.ParamByName('ID_CN_SP_KAT_STUD').AsInt64      :=ResultArray['Input']['ID_CN_SP_KAT_STUD'].AsInt64;
    DataSetPrKREK_DO_ZARAH.ParamByName('ID_SP_DERG_ZAKAZ').AsInt64       :=ResultArray['Input']['ID_SP_DERG_ZAKAZ'].AsInt64;
    DataSetPrKREK_DO_ZARAH.ParamByName('ID_SP_POTOK').AsInt64            :=ResultArray['Input']['ID_SP_POTOK'].AsInt64;
   end;

    DataSetPrKREK_DO_ZARAH.CloseOpen(false);
    DataSetPrKREK_DO_ZARAH.FetchAll;

    RxMemoryDataREK_DO_ZARAH.LoadFromDataSet(DataSetPrKREK_DO_ZARAH,DataSetPrKREK_DO_ZARAH.RecordCount,lmCopy);
    DataSetPrKREK_DO_ZARAH.Active :=false;

    ActionPrintPovidomProZarah.Enabled  :=false;
    if RxMemoryDataREK_DO_ZARAH.RecordCount>0
     then begin
         ActionSaveRecDoZarah.Enabled   :=true;
         ActionPrintRecDoZarah.Enabled  :=true;
         ActionPrintPovidomProZarah.Enabled :=True;
     end
     else begin
         ActionSaveRecDoZarah.Enabled   :=false;
         ActionPrintRecDoZarah.Enabled  :=false;
         ActionPrintPovidomProZarah.Enabled :=False;
     end;
end;

procedure TFormPRK_REK_DO_ZARAH.ActionSaveRecDoZarahExecute(
  Sender: TObject);
var
 id_locate:int64;
begin
    RxMemoryDataREK_DO_ZARAH.edit;
    RxMemoryDataREK_DO_ZARAH.Post;
    id_locate:= RxMemoryDataREK_DO_ZARAH.FieldValues['ID_DT_ABIT'];
    RxMemoryDataREK_DO_ZARAH.First;
    StoredProcPrKREK_DO_ZARAH.Transaction.StartTransaction;
    while not RxMemoryDataREK_DO_ZARAH.Eof do
    begin
      StoredProcPrKREK_DO_ZARAH.StoredProcName:='PRK_REK_DO_ZARAH_CHANGE';
      StoredProcPrKREK_DO_ZARAH.Prepare;
      StoredProcPrKREK_DO_ZARAH.ParamByName('ID_DT_ABIT').AsInt64        :=RxMemoryDataREK_DO_ZARAH.FieldValues['ID_DT_ABIT'];
      StoredProcPrKREK_DO_ZARAH.ParamByName('IS_REK_ZACHISL').AsInteger  :=RxMemoryDataREK_DO_ZARAH.FieldValues['IS_REK_ZACHISL'];
      StoredProcPrKREK_DO_ZARAH.ParamByName('IS_CEL_NABOR').AsInteger    :=RxMemoryDataREK_DO_ZARAH.FieldValues['IS_CEL_NABOR'];
      StoredProcPrKREK_DO_ZARAH.ParamByName('ID_USER').AsInt64           :=ID_USER_GLOBAL;
     // ShowMessage(VarToStr(RxMemoryDataREK_DO_ZARAH.FieldValues['ID_DT_ABIT']));
      {ShowMessage(VarToStr(RxMemoryDataREK_DO_ZARAH.FieldValues['IS_REK_ZACHISL']));
      ShowMessage(VarToStr(RxMemoryDataREK_DO_ZARAH.FieldValues['IS_CEL_NABOR']));}
       try
          StoredProcPrKREK_DO_ZARAH.ExecProc;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangRDR]+chr(13)+
                        nMsgTryAgain[IndLangRDR]+nMsgOr[IndLangRDR]+nMsgToAdmin[IndLangRDR]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangRDR]),MB_OK or MB_ICONWARNING);
             StoredProcPrKREK_DO_ZARAH.Transaction.Rollback;
             Exit;
          end;
       end;
       RxMemoryDataREK_DO_ZARAH.Next;
    end;

    try
      StoredProcPrKREK_DO_ZARAH.Transaction.Commit;
   except on e: Exception do
      begin
         MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangRDR]+chr(13)+
                    nMsgTryAgain[IndLangRDR]+nMsgOr[IndLangRDR]+nMsgToAdmin[IndLangRDR]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[IndLangRDR]),MB_OK or MB_ICONWARNING);
         StoredProcPrKREK_DO_ZARAH.Transaction.Rollback;
         Exit;
      end;
   end;

   ShowMessage(nMsgSaveRecDoZarah[IndLangRDR]);
   RxMemoryDataREK_DO_ZARAH.Locate('ID_DT_ABIT',id_locate,[]);
//   ActionPrintPovidomProZarah.Enabled :=true;
end;

procedure TFormPRK_REK_DO_ZARAH.ActionOtmenaExecute(Sender: TObject);
begin
   close;
end;

procedure TFormPRK_REK_DO_ZARAH.ActionPrintPovidomProZarahExecute(
  Sender: TObject);
var
  InputParam :TAArray;
  i: integer;
begin
  // Начинать с 1 , на 0 - плохая реакция...
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_rptLoader.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DataBasePrKREK_DO_ZARAH.Handle);
    InputParam['Input']['aNameReport'].AsString         := 'POVIDOMLEN_REK_DO_ZARAH';
    i:=1;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_GOD_NABORA';
    InputParam['Input']['ParamValues'][i].AsVariant     :=  ID_GOD_NABORA_GLOBAL;
    i:=2;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_FAK';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_FAK'].AsInt64;//DataSetFacul.FieldValues['ID_CN_SP_FAK'];
    i:=3;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_JN_FACUL_SPEC';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64;//DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC'];
    i:=4;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_FORM_STUD';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_FORM_STUD'].AsInt64;//DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
    i:=5;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_KAT_STUD';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_KAT_STUD'].AsInt64;//DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
    i:=6;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_DERG_ZAKAZ';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_SP_DERG_ZAKAZ'].AsInt64;//DataSetDergZakaz.FieldValues['ID_SP_DERG_ZAKAZ'];
    i:=7;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_POTOK';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_SP_POTOK'].AsInt64;//ResultArray['Data_RDR']['ID_SP_POTOK'].AsVariant;

    InputParam['Input']['Count_Param'].AsInteger        := 7;
  {  i:=8;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_GOD_NABORA';
    InputParam['Input']['ParamValues'][i].AsVariant     :=  ID_GOD_NABORA_GLOBAL;
    i:=9;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_FAK';
    InputParam['Input']['ParamValues'][i].AsVariant     := DataSetFacul.FieldValues['ID_CN_SP_FAK'];
    i:=10;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_JN_FACUL_SPEC';
    InputParam['Input']['ParamValues'][i].AsVariant     := DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC'];
    i:=11;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_FORM_STUD';
    InputParam['Input']['ParamValues'][i].AsVariant     := DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
    i:=12;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_KAT_STUD';
    InputParam['Input']['ParamValues'][i].AsVariant     := DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
    i:=13;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_DERG_ZAKAZ';
    InputParam['Input']['ParamValues'][i].AsVariant     := DataSetDergZakaz.FieldValues['ID_SP_DERG_ZAKAZ'];
    i:=14;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_POTOK';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Data_RDR']['ID_SP_POTOK'].AsVariant;

    InputParam['Input']['Count_Param'].AsInteger        := 14;}


  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

procedure TFormPRK_REK_DO_ZARAH.ActionPrintRecDoZarahExecute(
  Sender: TObject);
var
  InputParam :TAArray;
  i: integer;
begin
  // Начинать с 1 , на 0 - плохая реакция...
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_rptLoader.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DataBasePrKREK_DO_ZARAH.Handle);
    InputParam['Input']['aNameReport'].AsString         := 'REK_DO_ZARAH';
    i:=1;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_GOD_NABORA';
    InputParam['Input']['ParamValues'][i].AsVariant     :=  ID_GOD_NABORA_GLOBAL;
    i:=2;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_FAK';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_FAK'].AsInt64;//DataSetFacul.FieldValues['ID_CN_SP_FAK'];
    i:=3;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_JN_FACUL_SPEC';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64;//DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC'];
    i:=4;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_FORM_STUD';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_FORM_STUD'].AsInt64;//DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
    i:=5;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_KAT_STUD';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_KAT_STUD'].AsInt64;//DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
    i:=6;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_DERG_ZAKAZ';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_SP_DERG_ZAKAZ'].AsInt64;//DataSetDergZakaz.FieldValues['ID_SP_DERG_ZAKAZ'];
    i:=7;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_POTOK';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_SP_POTOK'].AsInt64;//ResultArray['Data_RDR']['ID_SP_POTOK'].AsVariant;

    i:=8;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_GOD_NABORA';
    InputParam['Input']['ParamValues'][i].AsVariant     :=  ID_GOD_NABORA_GLOBAL;
    i:=9;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_FAK';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_FAK'].AsInt64;//DataSetFacul.FieldValues['ID_CN_SP_FAK'];
    i:=10;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_JN_FACUL_SPEC';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64;//DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC'];
    i:=11;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_FORM_STUD';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_FORM_STUD'].AsInt64;//DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
    i:=12;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_KAT_STUD';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_KAT_STUD'].AsInt64;//DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
    i:=13;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_DERG_ZAKAZ';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_SP_DERG_ZAKAZ'].AsInt64;//DataSetDergZakaz.FieldValues['ID_SP_DERG_ZAKAZ'];
    i:=14;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_POTOK';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_SP_POTOK'].AsInt64;//ResultArray['Data_RDR']['ID_SP_POTOK'].AsVariant;

    InputParam['Input']['Count_Param'].AsInteger        := 14;


  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

procedure TFormPRK_REK_DO_ZARAH.ActionPrintBossExecute(Sender: TObject);
var
  InputParam :TAArray;
  i: integer;
begin
  // Начинать с 1 , на 0 - плохая реакция...
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_rptLoader.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DataBasePrKREK_DO_ZARAH.Handle);
    InputParam['Input']['aNameReport'].AsString         := 'PRK_REK_DO_ZARAH_BOSS';
    i:=1;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_GOD_NABORA';
    InputParam['Input']['ParamValues'][i].AsVariant     :=  ID_GOD_NABORA_GLOBAL;
    i:=2;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_FAK';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_FAK'].AsInt64;//DataSetFacul.FieldValues['ID_CN_SP_FAK'];
    i:=3;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_JN_FACUL_SPEC';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64;//DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC'];
    i:=4;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_FORM_STUD';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_FORM_STUD'].AsInt64;//DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
    i:=5;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_KAT_STUD';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_KAT_STUD'].AsInt64;//DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
    i:=6;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_DERG_ZAKAZ';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_SP_DERG_ZAKAZ'].AsInt64;//DataSetDergZakaz.FieldValues['ID_SP_DERG_ZAKAZ'];
    i:=7;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_POTOK';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_SP_POTOK'].AsInt64;//ResultArray['Data_RDR']['ID_SP_POTOK'].AsVariant;

    i:=8;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_GOD_NABORA';
    InputParam['Input']['ParamValues'][i].AsVariant     :=  ID_GOD_NABORA_GLOBAL;
    i:=9;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_FAK';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_FAK'].AsInt64;//DataSetFacul.FieldValues['ID_CN_SP_FAK'];
    i:=10;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_JN_FACUL_SPEC';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64;//DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC'];
    i:=11;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_FORM_STUD';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_FORM_STUD'].AsInt64;//DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
    i:=12;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_KAT_STUD';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_KAT_STUD'].AsInt64;//DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
    i:=13;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_DERG_ZAKAZ';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_SP_DERG_ZAKAZ'].AsInt64;//DataSetDergZakaz.FieldValues['ID_SP_DERG_ZAKAZ'];
    i:=14;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_POTOK';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_SP_POTOK'].AsInt64;//ResultArray['Data_RDR']['ID_SP_POTOK'].AsVariant;

    InputParam['Input']['Count_Param'].AsInteger        := 14;


  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

procedure TFormPRK_REK_DO_ZARAH.ActionPrintStendExecute(Sender: TObject);
var
  InputParam :TAArray;
  i: integer;
begin
  // Начинать с 1 , на 0 - плохая реакция...
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_rptLoader.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DataBasePrKREK_DO_ZARAH.Handle);
    InputParam['Input']['aNameReport'].AsString         := 'PRK_REK_DO_ZARAH_STEND';
    i:=1;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_GOD_NABORA';
    InputParam['Input']['ParamValues'][i].AsVariant     :=  ID_GOD_NABORA_GLOBAL;
    i:=2;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_FAK';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_FAK'].AsInt64;//DataSetFacul.FieldValues['ID_CN_SP_FAK'];
    i:=3;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_JN_FACUL_SPEC';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64;//DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC'];
    i:=4;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_FORM_STUD';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_FORM_STUD'].AsInt64;//DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
    i:=5;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_KAT_STUD';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_KAT_STUD'].AsInt64;//DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
    i:=6;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_DERG_ZAKAZ';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_SP_DERG_ZAKAZ'].AsInt64;//DataSetDergZakaz.FieldValues['ID_SP_DERG_ZAKAZ'];
    i:=7;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_POTOK';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_SP_POTOK'].AsInt64;//ResultArray['Data_RDR']['ID_SP_POTOK'].AsVariant;

    i:=8;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_GOD_NABORA';
    InputParam['Input']['ParamValues'][i].AsVariant     :=  ID_GOD_NABORA_GLOBAL;
    i:=9;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_FAK';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_FAK'].AsInt64;//DataSetFacul.FieldValues['ID_CN_SP_FAK'];
    i:=10;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_JN_FACUL_SPEC';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64;//DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC'];
    i:=11;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_FORM_STUD';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_FORM_STUD'].AsInt64;//DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
    i:=12;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_CN_SP_KAT_STUD';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_CN_SP_KAT_STUD'].AsInt64;//DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
    i:=13;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_DERG_ZAKAZ';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_SP_DERG_ZAKAZ'].AsInt64;//DataSetDergZakaz.FieldValues['ID_SP_DERG_ZAKAZ'];
    i:=14;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_POTOK';
    InputParam['Input']['ParamValues'][i].AsVariant     := ResultArray['Input']['ID_SP_POTOK'].AsInt64;//ResultArray['Data_RDR']['ID_SP_POTOK'].AsVariant;

    InputParam['Input']['Count_Param'].AsInteger        := 14;


  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

end.
