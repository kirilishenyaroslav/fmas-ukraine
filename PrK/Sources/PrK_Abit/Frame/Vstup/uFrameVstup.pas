unit uFrameVstup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, FIBDataSet, pFIBDataSet, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxDBEdit, cxContainer, cxEdit, cxLabel, cxControls,
  cxGroupBox, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, StdCtrls,
  DBCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxListBox,uPrK_Resources, cxButtonEdit;

type
  TFrameVstup = class(TFrame)
    cxGroupBoxVstup: TcxGroupBox;
    cxLabelTypeDepart: TcxLabel;
    cxLabelFacul: TcxLabel;
    cxLabelSpec: TcxLabel;
    cxLabelFormStudy: TcxLabel;
    cxLabelKatStud: TcxLabel;
    cxLabelDergZakaz: TcxLabel;
    cxLabelKurs: TcxLabel;
    cxLabelSrokOb: TcxLabel;
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
    DataSetKurs: TpFIBDataSet;
    DataSourceKurs: TDataSource;
    DataSetSrokOb: TpFIBDataSet;
    DataSourceSrokOb: TDataSource;
    cxLookupComboBoxDergZakaz: TcxLookupComboBox;
    cxLookupComboBoxKurs: TcxLookupComboBox;
    cxLookupComboBoxSrokOb: TcxLookupComboBox;
    cxLookupComboBoxTypeDepart: TcxLookupComboBox;
    cxLookupComboBoxKatStud: TcxLookupComboBox;
    cxLookupComboBoxFacul: TcxLookupComboBox;
    cxLookupComboBoxSpec: TcxLookupComboBox;
    cxLookupComboBoxFormStudy: TcxLookupComboBox;
    cxLabelNpk: TcxLabel;
    cxLabelVid_Dii: TcxLabel;
    cxLookupComboBoxVid_Dii: TcxLookupComboBox;
    cxLookupComboBoxNpk: TcxLookupComboBox;
    DataSetVid_Dii: TpFIBDataSet;
    DataSourceVid_Dii: TDataSource;
    DataSetNpk: TpFIBDataSet;
    DataSourceNpk: TDataSource;
    cxLabelPotok: TcxLabel;
    cxButtonEditPotok: TcxButtonEdit;
    cxLabelNomerDela: TcxLabel;
    cxTextEditNomerDela: TcxTextEdit;
    DataSetNomerDela: TpFIBDataSet;
    cxLabelNomerDela_Pristavka: TcxLabel;
    procedure cxButtonEditPotokKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditPotokPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxLookupComboBoxSpecPropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxTypeDepartPropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxKatStudPropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxFaculPropertiesChange(Sender: TObject);
    procedure cxLookupComboBoxFormStudyPropertiesChange(Sender: TObject);
    procedure cxTextEditNomerDelaKeyPress(Sender: TObject; var Key: Char);
  private
    Rejim_Global  :RejimPrK;
    FSelectSQLTextFacul: string;
    FSelectSQLTextTypeDepart: string;
    FSelectSQLTextKatStud: string;
    FSelectSQLTextSpec: string;
    FSelectSQLTextFormStudy: string;
    FSelectSQLTextSrokOb: AnsiString;
    FSelectSQLTextDergZakaz: AnsiString;
    FSelectSQLTextKurs: AnsiString;
    FSelectTextFrameVstup: boolean;
    FSelectSQLTextVid_Dii: AnsiString;
    FSelectSQLTextNpk: AnsiString;
    procedure SetSelectSQLTextDergZakaz(const Value: AnsiString);
    procedure SetSelectSQLTextFacul(const Value: string);
    procedure SetSelectSQLTextFormStudy(const Value: string);
    procedure SetSelectSQLTextKatStud(const Value: string);
    procedure SetSelectSQLTextKurs(const Value: AnsiString);
    procedure SetSelectSQLTextSpec(const Value: string);
    procedure SetSelectSQLTextSrokOb(const Value: AnsiString);
    procedure SetSelectSQLTextTypeDepart(const Value: string);
    procedure SetSelectTextFrameVstup(const Value: boolean);
    procedure SetSelectSQLTextNpk(const Value: AnsiString);
    procedure SetSelectSQLTextVid_Dii(const Value: AnsiString);
  public
    procedure InicCaptionFrame;
    procedure InicDataFrame(rejim :RejimPrK);
    procedure ShowIdValues;
    function  ProverkaOnExists: integer;
    Function  GetNomerDela :integer;
    property SelectTextFrameVstup    :boolean read FSelectTextFrameVstup write SetSelectTextFrameVstup;
    property SelectSQLTextTypeDepart :string read FSelectSQLTextTypeDepart write SetSelectSQLTextTypeDepart;
    property SelectSQLTextKatStud    :string read FSelectSQLTextKatStud write SetSelectSQLTextKatStud;
    property SelectSQLTextFacul      :string read FSelectSQLTextFacul write SetSelectSQLTextFacul;
    property SelectSQLTextSpec       :string read FSelectSQLTextSpec write SetSelectSQLTextSpec;
    property SelectSQLTextFormStudy  :string read FSelectSQLTextFormStudy write SetSelectSQLTextFormStudy;

    property SelectSQLTextDergZakaz  :AnsiString read FSelectSQLTextDergZakaz write SetSelectSQLTextDergZakaz;
    property SelectSQLTextKurs       :AnsiString read FSelectSQLTextKurs write SetSelectSQLTextKurs;
    property SelectSQLTextSrokOb     :AnsiString read FSelectSQLTextSrokOb write SetSelectSQLTextSrokOb;
    property SelectSQLTextVid_Dii    :AnsiString read FSelectSQLTextVid_Dii write SetSelectSQLTextVid_Dii;
    property SelectSQLTextNpk        :AnsiString read FSelectSQLTextNpk write SetSelectSQLTextNpk;
  end;

implementation
uses
    uPRK_DT_ABIT,uConstants,uPrK_Loader;
{$R *.dfm}

{ TFrameVstup }

procedure TFrameVstup.InicCaptionFrame;
var
   i: integer;
begin
 i:=TFormPRK_DT_ABIT(self.Owner).IndLangAbit;
 cxLabelTypeDepart.Caption :=nLabelTypeDepart[i];
 cxLabelKatStud.Caption    :=nLabelCnKatStud[i];
 cxLabelFacul.Caption      :=nLabelNameCnFak[i];
 cxLabelSpec.Caption       :=nLabelNameSpec[i];
 cxLabelFormStudy.Caption  :=nLabelCnFormStud[i];
 cxLabelDergZakaz.Caption  :=nLabelDergZakaz[i];
 cxLabelKurs.Caption       :=nLabelKurs[i];
 cxLabelSrokOb.Caption     :=nLabelSrokOb[i];

 cxLabelVid_Dii.Caption    :=nLabelVid_Dii[i];
 cxLabelNpk.Caption        :=nLabelNpk[i];
 cxLabelPotok.Caption      :=nLabelPotok[i];

 cxLabelNomerDela.Caption  :=nLabelNomerDela[i];
 cxLabelNomerDela_Pristavka.Caption:='';

 cxButtonEditPotok.Text      := '';
 cxTextEditNomerDela.Text    := '0';
end;

procedure TFrameVstup.SetSelectTextFrameVstup(const Value: boolean);
var
   i: int64;
begin
  FSelectTextFrameVstup := Value;
  i:=TFormPRK_DT_ABIT(self.Owner).ID_GOD_NABORA_GLOBAL;
  if FSelectTextFrameVstup=true then
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

    SelectSQLTextKurs       :='Select * from PRK_ABIT_PL_KURS ('+IntToStr(i)+') where'
                             +' ?Mas_ID_CN_SP_FORM_STUD=ID_CN_SP_FORM_STUD and ?Mas_ID_CN_JN_FACUL_SPEC=ID_CN_JN_FACUL_SPEC and'
                             +' ?Mas_ID_CN_SP_FAK=ID_CN_SP_FAK and ?Mas_ID_CN_SP_KAT_STUD=ID_CN_SP_KAT_STUD and'
                             +' ?Mas_ID_FAK_CENTER=ID_FAK_CENTER';

    SelectSQLTextSrokOb     :='Select * from PRK_ABIT_PL_SROK_OB('+IntToStr(i)+') where'
                             +' ?Mas_ID_CN_SP_FORM_STUD=ID_CN_SP_FORM_STUD and ?Mas_ID_CN_JN_FACUL_SPEC=ID_CN_JN_FACUL_SPEC and'
                             +' ?Mas_ID_CN_SP_FAK=ID_CN_SP_FAK and ?Mas_ID_CN_SP_KAT_STUD=ID_CN_SP_KAT_STUD and'
                             +' ?Mas_ID_FAK_CENTER=ID_FAK_CENTER';

    SelectSQLTextVid_Dii    :='Select * from PRK_ABIT_PL_VID_DII('+IntToStr(i)+') where'
                             +' ?Mas_ID_CN_SP_FORM_STUD=ID_CN_SP_FORM_STUD and ?Mas_ID_CN_JN_FACUL_SPEC=ID_CN_JN_FACUL_SPEC and'
                             +' ?Mas_ID_CN_SP_FAK=ID_CN_SP_FAK and ?Mas_ID_CN_SP_KAT_STUD=ID_CN_SP_KAT_STUD and'
                             +' ?Mas_ID_FAK_CENTER=ID_FAK_CENTER';

    SelectSQLTextNpk        :='Select * from PRK_ABIT_PL_NPK('+IntToStr(i)+') where'
                             +' ?Mas_ID_CN_SP_FORM_STUD=ID_CN_SP_FORM_STUD and ?Mas_ID_CN_JN_FACUL_SPEC=ID_CN_JN_FACUL_SPEC and'
                             +' ?Mas_ID_CN_SP_FAK=ID_CN_SP_FAK and ?Mas_ID_CN_SP_KAT_STUD=ID_CN_SP_KAT_STUD and'
                             +' ?Mas_ID_FAK_CENTER=ID_FAK_CENTER';
  end;
end;

procedure TFrameVstup.SetSelectSQLTextDergZakaz(const Value: AnsiString);
begin
  FSelectSQLTextDergZakaz := Value;
    DataSetDergZakaz.Active                         :=false;
    DataSetDergZakaz.Database                       := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DataSetDergZakaz.Transaction                    := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DataSetDergZakaz.SelectSQL.Clear;
    DataSetDergZakaz.SQLs.SelectSQL.Text            := FSelectSQLTextDergZakaz;
    DataSetDergZakaz.CloseOpen(false);
end;

procedure TFrameVstup.SetSelectSQLTextFacul(const Value: string);
begin
  FSelectSQLTextFacul := Value;
    DataSetFacul.Active                         :=false;
    DataSetFacul.Database                       := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DataSetFacul.Transaction                    := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DataSetFacul.SelectSQL.Clear;
    DataSetFacul.SQLs.SelectSQL.Text            := FSelectSQLTextFacul;
    DataSetFacul.CloseOpen(false);
end;

procedure TFrameVstup.SetSelectSQLTextFormStudy(const Value: string);
begin
  FSelectSQLTextFormStudy := Value;
    DataSetFormStudy.Active                         :=false;
    DataSetFormStudy.Database                       := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DataSetFormStudy.Transaction                    := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DataSetFormStudy.SelectSQL.Clear;
    DataSetFormStudy.SQLs.SelectSQL.Text            := FSelectSQLTextFormStudy;
    DataSetFormStudy.CloseOpen(false);
end;

procedure TFrameVstup.SetSelectSQLTextKatStud(const Value: string);
begin
  FSelectSQLTextKatStud := Value;
    DataSetKatStud.Active                         :=false;
    DataSetKatStud.Database                       := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DataSetKatStud.Transaction                    := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DataSetKatStud.SelectSQL.Clear;
    DataSetKatStud.SQLs.SelectSQL.Text            := FSelectSQLTextKatStud;
    DataSetKatStud.CloseOpen(false);
end;

procedure TFrameVstup.SetSelectSQLTextKurs(const Value: string);
begin
  FSelectSQLTextKurs := Value;
    DataSetKurs.Active                         :=false;
    DataSetKurs.Database                       := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DataSetKurs.Transaction                    := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DataSetKurs.SelectSQL.Clear;
    DataSetKurs.SQLs.SelectSQL.Text            := FSelectSQLTextKurs;
    DataSetKurs.CloseOpen(false);
end;

procedure TFrameVstup.SetSelectSQLTextSpec(const Value: string);
begin
  FSelectSQLTextSpec := Value;
    DataSetSpec.Active                         :=false;
    DataSetSpec.Database                       := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DataSetSpec.Transaction                    := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DataSetSpec.SelectSQL.Clear;
    DataSetSpec.SQLs.SelectSQL.Text            := FSelectSQLTextSpec;
    DataSetSpec.CloseOpen(false);
end;

procedure TFrameVstup.SetSelectSQLTextSrokOb(const Value: string);
begin
  FSelectSQLTextSrokOb := Value;
    DataSetSrokOb.Active                         :=false;
    DataSetSrokOb.Database                       := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DataSetSrokOb.Transaction                    := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DataSetSrokOb.SelectSQL.Clear;
    DataSetSrokOb.SQLs.SelectSQL.Text            := FSelectSQLTextSrokOb;
    DataSetSrokOb.CloseOpen(false);
end;

procedure TFrameVstup.SetSelectSQLTextTypeDepart(const Value: string);
begin
  FSelectSQLTextTypeDepart := Value;
    DataSetTypeDepart.Active                         :=false;
    DataSetTypeDepart.Database                       := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DataSetTypeDepart.Transaction                    := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DataSetTypeDepart.SelectSQL.Clear;
    DataSetTypeDepart.SQLs.SelectSQL.Text            := FSelectSQLTextTypeDepart;
    DataSetTypeDepart.CloseOpen(false);
end;

procedure TFrameVstup.SetSelectSQLTextVid_Dii(const Value: AnsiString);
begin
  FSelectSQLTextVid_Dii := Value;
    DataSetVid_Dii.Active                         :=false;
    DataSetVid_Dii.Database                       := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DataSetVid_Dii.Transaction                    := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DataSetVid_Dii.SelectSQL.Clear;
    DataSetVid_Dii.SQLs.SelectSQL.Text            := FSelectSQLTextVid_Dii;
    DataSetVid_Dii.CloseOpen(false);
end;

procedure TFrameVstup.SetSelectSQLTextNpk(const Value: AnsiString);
begin
  FSelectSQLTextNpk := Value;
    DataSetNpk.Active                         :=false;
    DataSetNpk.Database                       := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DataSetNpk.Transaction                    := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DataSetNpk.SelectSQL.Clear;
    DataSetNpk.SQLs.SelectSQL.Text            := FSelectSQLTextNpk;
    DataSetNpk.CloseOpen(false);
end;

procedure TFrameVstup.InicDataFrame(rejim: RejimPrK);
begin
  Rejim_Global :=rejim;

  DataSetTypeDepart.Locate('ID_FAK_CENTER',    TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_FAK_CENTER'],       []);
  DataSetKatStud.Locate('ID_CN_SP_KAT_STUD',   TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_CN_SP_KAT_STUD'],   []);
  DataSetFacul.Locate('ID_CN_SP_FAK',          TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_CN_SP_FAK'],[]);
  DataSetSpec.Locate('ID_CN_JN_FACUL_SPEC',    TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_CN_JN_FACUL_SPEC'], []);
  DataSetFormStudy.Locate('ID_CN_SP_FORM_STUD',TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_CN_SP_FORM_STUD'],  []);
  DataSetDergZakaz.Locate('ID_SP_DERG_ZAKAZ',  TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_SP_DERG_ZAKAZ'],    []);
  DataSetKurs.Locate('ID_SP_KURS',             TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_SP_KURS'],          []);
  DataSetSrokOb.Locate('ID_SP_SROK_OB',        TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_SP_SROK_OB'],       []);
  DataSetVid_Dii.Locate('ID_SP_VID_DII',       TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_SP_VID_DII'],       []);
  DataSetNpk.Locate('ID_SP_NPK',               TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_SP_NPK'],           []);

  cxLookupComboBoxTypeDepart.Text   :=DataSetTypeDepart.FieldValues['SHORT_NAME'];
  cxLookupComboBoxKatStud.Text      :=DataSetKatStud.FieldValues['SHORT_NAME'];
  cxLookupComboBoxFacul.Text        :=DataSetFacul.FieldValues['SHORT_NAME'];
  cxLookupComboBoxSpec.Text         :=DataSetSpec.FieldValues['SHORT_NAME'];
  if TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_CN_SP_FORM_STUD']=DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD']
   then cxLookupComboBoxFormStudy.Text    :=DataSetFormStudy.FieldValues['SHORT_NAME'];
  cxLookupComboBoxDergZakaz.Text    :=DataSetDergZakaz.FieldValues['SHORT_NAME'];
  cxLookupComboBoxKurs.Text         :=DataSetKurs.FieldValues['SHORT_NAME'];
  if TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_SP_SROK_OB']=DataSetSrokOb.FieldValues['ID_SP_SROK_OB']
   then cxLookupComboBoxSrokOb.Text       :=DataSetSrokOb.FieldValues['SHORT_NAME'];
  cxLookupComboBoxVid_Dii.Text      :=DataSetVid_Dii.FieldValues['SHORT_NAME'];
  cxLookupComboBoxNpk.Text          :=DataSetNpk.FieldValues['SHORT_NAME'];

  if TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_SP_POTOK']<>null then
  begin
   TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_SP_POTOK'].AsInt64          :=
                TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['ID_SP_POTOK'];
   TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['Name_SP_POTOK'].AsString       :=
                TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['SHORT_NAME_POTOK'];
   cxButtonEditPotok.Text      :=TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['Name_SP_POTOK'].AsString;
  end;

  cxTextEditNomerDela.Text := TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['NOMER_DELA'];



 // ShowMessage(VarToStr(TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['SHORT_NAME_KURS']));

  if rejim=ViewPrK then
   begin
      { cxLookupComboBoxTypeDepart.Properties.ReadOnly    :=true;
       cxLookupComboBoxKatStud.Properties.ReadOnly       :=true;
       cxLookupComboBoxFacul.Properties.ReadOnly         :=true;
       cxLookupComboBoxSpec.Properties.ReadOnly          :=true;
       cxLookupComboBoxFormStudy.Properties.ReadOnly     :=true;
       cxLookupComboBoxDergZakaz.Properties.ReadOnly     :=true;
       cxLookupComboBoxKurs.Properties.ReadOnly          :=true;
       cxLookupComboBoxSrokOb.Properties.ReadOnly        :=true;
       cxLookupComboBoxVid_Dii.Properties.ReadOnly       :=true;
       cxLookupComboBoxNpk.Properties.ReadOnly           :=true;}

       cxLookupComboBoxTypeDepart.Enabled    :=false;
       cxLookupComboBoxFacul.Enabled         :=false;
       cxLookupComboBoxKatStud.Enabled       :=false;
       cxLookupComboBoxSpec.Enabled          :=false;
       cxLookupComboBoxFormStudy.Enabled     :=false;
       cxLookupComboBoxDergZakaz.Enabled     :=false;
       cxLookupComboBoxKurs.Enabled          :=false;
       cxLookupComboBoxSrokOb.Enabled        :=false;
       cxLookupComboBoxVid_Dii.Enabled       :=false;
       cxLookupComboBoxNpk.Enabled           :=false;

       cxButtonEditPotok.Enabled             :=false;
       cxTextEditNomerDela.Enabled           :=false;
   end;

end;

function TFrameVstup.ProverkaOnExists: integer;
var
   i: integer;
begin
   i:=TFormPRK_DT_ABIT(self.Owner).IndLangAbit;

   if trim(cxLookupComboBoxTypeDepart.Text)='' then
   begin
     ShowMessage(nMsgEmptyTypeDepart[i]);
     TFormPRK_DT_ABIT(self.Owner).TabSheetVstup.Show;
     cxLookupComboBoxTypeDepart.SetFocus;
     result:=1;
     exit;
   end;

   if trim(cxLookupComboBoxKatStud.Text)='' then
   begin
     ShowMessage(nMsgEmptyNameCnKatStud[i]);
     TFormPRK_DT_ABIT(self.Owner).TabSheetVstup.Show;
     cxLookupComboBoxKatStud.SetFocus;
     result:=1;
     exit;
   end;

   if trim(cxLookupComboBoxFacul.Text)=''  then
   begin
     ShowMessage(nMsgEmptyFacul[i]);
     TFormPRK_DT_ABIT(self.Owner).TabSheetVstup.Show;
     cxLookupComboBoxFacul.SetFocus;
     result:=1;
     exit;
   end;

   if trim(cxLookupComboBoxSpec.Text)=''  then
   begin
     ShowMessage(nMsgEmptyNameSpec[i]);
     TFormPRK_DT_ABIT(self.Owner).TabSheetVstup.Show;
     cxLookupComboBoxSpec.SetFocus;
     result:=1;
     exit;
   end;

   if trim(cxLookupComboBoxFormStudy.Text)=''  then
   begin
     ShowMessage(nMsgEmptyCnFormStud[i]);
     TFormPRK_DT_ABIT(self.Owner).TabSheetVstup.Show;
     cxLookupComboBoxFormStudy.SetFocus;
     result:=1;
     exit;
   end;

   if trim(cxLookupComboBoxDergZakaz.Text)='' then
   begin
     ShowMessage(nMsgEmptyDergZakaz[i]);
     TFormPRK_DT_ABIT(self.Owner).TabSheetVstup.Show;
     cxLookupComboBoxDergZakaz.SetFocus;
     result:=1;
     exit;
   end;

   if trim(cxLookupComboBoxKurs.Text)=''  then
   begin
     ShowMessage(nMsgEmptyKurs[i]);
     TFormPRK_DT_ABIT(self.Owner).TabSheetVstup.Show;
     cxLookupComboBoxKurs.SetFocus;
     result:=1;
     exit;
   end;

   if trim(cxLookupComboBoxSrokOb.Text)='' then
   begin
     ShowMessage(nMsgEmptySrokOb[i]);
     TFormPRK_DT_ABIT(self.Owner).TabSheetVstup.Show;
     cxLookupComboBoxSrokOb.SetFocus;
     result:=1;
     exit;
   end;

  if trim(cxLookupComboBoxVid_Dii.Text)='' then
   begin
     ShowMessage(nMsgEmptyVid_Dii[i]);
     TFormPRK_DT_ABIT(self.Owner).TabSheetVstup.Show;
     cxLookupComboBoxVid_Dii.SetFocus;
     result:=1;
     exit;
   end;

  if trim(cxLookupComboBoxNpk.Text)='' then
   begin
     ShowMessage(nMsgEmptyNpk[i]);
     TFormPRK_DT_ABIT(self.Owner).TabSheetVstup.Show;
     cxLookupComboBoxNpk.SetFocus;
     result:=1;
     exit;
   end;

   if (trim(cxButtonEditPotok.Text)='') or
      (TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_SP_POTOK'].AsInt64=-1) then
   begin
     ShowMessage(nMsgEmptyPotok[i]);
     TFormPRK_DT_ABIT(self.Owner).TabSheetVstup.Show;
     cxButtonEditPotok.SetFocus;
     result:=1;
     exit;
   end;

   result:=0;

end;

procedure TFrameVstup.cxButtonEditPotokKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:=CHR(0);
end;

procedure TFrameVstup.cxButtonEditPotokPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  res: Variant;
begin
  res :=  uPrK_Loader.ShowPrkSprav(self,TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT.Handle,PrK_SP_POTOK,fsNormal);
  if VarArrayDimCount(res) > 0 then
  begin
    if res[0]<>NULL THEN
    begin
        TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_SP_POTOK'].AsInt64      := Res[0];
        TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['Name_SP_POTOK'].AsString   := Res[2];
        cxButtonEditPotok.Text      :=TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['Name_SP_POTOK'].AsString;
    end;
  end;
end;

function TFrameVstup.GetNomerDela: integer;
begin
    DataSetNomerDela.Active                         :=false;
    DataSetNomerDela.Database                       := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DataSetNomerDela.Transaction                    := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DataSetNomerDela.SelectSQL.Clear;
    DataSetNomerDela.SQLs.SelectSQL.Text            := 'Select * from PRK_DT_ABIT_NEW_NOMER_DELA_SEL(:ID_SP_GOD_NABORA,'
                                                     + ':ID_CN_SP_FAK,     :ID_CN_JN_FACUL_SPEC,     :ID_CN_SP_FORM_STUD,'
                                                     + ':ID_SP_DERG_ZAKAZ, :ID_CN_SP_KAT_STUD,       :ID_SP_VID_DII)';

    DataSetNomerDela.ParamByName('ID_SP_GOD_NABORA').AsInt64      :=TFormPRK_DT_ABIT(self.Owner).ID_GOD_NABORA_GLOBAL;
    DataSetNomerDela.ParamByName('ID_CN_SP_FAK').AsInt64          :=TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetFacul.FieldValues['ID_CN_SP_FAK'];
    DataSetNomerDela.ParamByName('ID_CN_JN_FACUL_SPEC').AsInt64   :=TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC'];
    DataSetNomerDela.ParamByName('ID_CN_SP_FORM_STUD').AsInt64    :=TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
    DataSetNomerDela.ParamByName('ID_SP_DERG_ZAKAZ').AsInt64      :=TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetDergZakaz.FieldValues['ID_SP_DERG_ZAKAZ'];
    DataSetNomerDela.ParamByName('ID_CN_SP_KAT_STUD').AsInt64     :=TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
    DataSetNomerDela.ParamByName('ID_SP_VID_DII').AsInt64         :=TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetVid_Dii.FieldValues['ID_SP_VID_DII'];
    DataSetNomerDela.CloseOpen(false);
    result := DataSetNomerDela.FieldValues['NEW_NOMER_DELA'];
end;

procedure TFrameVstup.ShowIdValues;
var
 IdTypeDepLocal,IdKatStudLocal,IdFaculLocal : string;
 IdSpecLocal,IdFormStudLocal,IdGodNabLocal  : string;
begin
   IdGodNabLocal   :=IntToStr(TFormPRK_DT_ABIT(self.Owner).ID_GOD_NABORA_GLOBAL);
   IdTypeDepLocal  :=VarToStr(DataSetTypeDepart.FieldValues['ID_FAK_CENTER']);
   IdKatStudLocal  :=VarToStr(DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD']);
   IdFaculLocal    :=VarToStr(DataSetFacul.FieldValues['ID_CN_SP_FAK']);
   IdSpecLocal     :=VarToStr(DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC']);
   IdFormStudLocal :=VarToStr(DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD']);

   ShowMessage('Информация  для программистов'         +chr(13)+
               'ID_GOD_NABORA        ='+IdGodNabLocal  +chr(13)+
               'ID_FAK_CENTER        ='+IdTypeDepLocal +chr(13)+
               'ID_CN_SP_KAT_STUD    ='+IdKatStudLocal +chr(13)+
               'ID_CN_SP_FAK         ='+IdFaculLocal   +chr(13)+
               'ID_CN_JN_FACUL_SPEC  ='+IdSpecLocal    +chr(13)+
               'ID_CN_SP_FORM_STUD   ='+IdFormStudLocal+chr(13) );
end;

procedure TFrameVstup.cxLookupComboBoxTypeDepartPropertiesChange(
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

procedure TFrameVstup.cxLookupComboBoxKatStudPropertiesChange(
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

procedure TFrameVstup.cxLookupComboBoxFaculPropertiesChange(
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

procedure TFrameVstup.cxLookupComboBoxSpecPropertiesChange(
  Sender: TObject);
begin
  if cxLookupComboBoxSpec.Text =''
    then begin
     cxLookupComboBoxFormStudy.Text    :='';
     cxLookupComboBoxFormStudy.Enabled :=false;
    end
    else begin
     cxLookupComboBoxFormStudy.Enabled :=true;
     if ((DataSetFormStudy.RecordCount=1) and(Rejim_Global=AddPrK))
       then cxLookupComboBoxFormStudy.Text := DataSetFormStudy.FieldValues['SHORT_NAME']
       else begin
        {1 строка сделана для того чтобы вторая несла в себе изменения}
        cxLookupComboBoxFormStudy.Text := DataSetFormStudy.FieldValues['SHORT_NAME'];
        cxLookupComboBoxFormStudy.Text :='';
       end;
    end;

   cxLabelNomerDela_Pristavka.Caption:= DataSetSpec.FieldValues['SMALL_NAME']+'-';
end;

procedure TFrameVstup.cxLookupComboBoxFormStudyPropertiesChange(
  Sender: TObject);
begin
  if cxLookupComboBoxFormStudy.Text ='' then
    begin
      cxLookupComboBoxDergZakaz.Text    :='';
      cxLookupComboBoxKurs.Text         :='';
      cxLookupComboBoxSrokOb.Text       :='';
      cxLookupComboBoxVid_Dii.Text      :='';
      cxLookupComboBoxNpk.Text          :='';

      cxLookupComboBoxDergZakaz.Enabled :=false;
      cxLookupComboBoxKurs.Enabled      :=false;
      cxLookupComboBoxSrokOb.Enabled    :=false;
      cxLookupComboBoxVid_Dii.Enabled   :=false;
      cxLookupComboBoxNpk.Enabled       :=false;
    end
    else begin
      cxLookupComboBoxDergZakaz.Enabled :=true;
      cxLookupComboBoxKurs.Enabled      :=true;
      cxLookupComboBoxSrokOb.Enabled    :=true;
      cxLookupComboBoxVid_Dii.Enabled   :=true;
      cxLookupComboBoxNpk.Enabled       :=true;

      if DataSetDergZakaz.RecordCount =1
       then cxLookupComboBoxDergZakaz.Text := DataSetDergZakaz.FieldValues['SHORT_NAME'];
      if DataSetKurs.RecordCount      =1
       then cxLookupComboBoxKurs.Text      := DataSetKurs.FieldValues['SHORT_NAME'];
      if ((DataSetSrokOb.RecordCount =1) and (Rejim_Global=AddPrK))
       then cxLookupComboBoxSrokOb.Text    := DataSetSrokOb.FieldValues['SHORT_NAME']
       else cxLookupComboBoxSrokOb.Text    := '';
      if DataSetVid_Dii.RecordCount   =1
       then cxLookupComboBoxVid_Dii.Text   := DataSetVid_Dii.FieldValues['SHORT_NAME'];
      if DataSetNpk.RecordCount       =1
       then cxLookupComboBoxNpk.Text       := DataSetNpk.FieldValues['SHORT_NAME'];
    end;
end;

procedure TFrameVstup.cxTextEditNomerDelaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (Key = '.') or (Key=',') then Key := Chr(0);
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then     Key := Chr(0);
end;

end.
