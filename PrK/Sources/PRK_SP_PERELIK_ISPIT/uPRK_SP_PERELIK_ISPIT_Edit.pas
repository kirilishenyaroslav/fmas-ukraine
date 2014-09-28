unit uPRK_SP_PERELIK_ISPIT_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxMaskEdit, cxButtonEdit,
  ActnList, cxControls, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons,
  ExtCtrls, cxCheckBox,AArray, DB, FIBDataSet, pFIBDataSet, cxDropDownEdit,
  cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TFormPRK_SP_PERELIK_ISPIT_Edit = class(TForm)
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    cxLabelFormCaption: TcxLabel;
    cxButtonCloseForm: TcxButton;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxButtonEditNamePredm: TcxButtonEdit;
    cxButtonEditEKZ_FORM: TcxButtonEdit;
    cxLabelNamePredm: TcxLabel;
    cxLabelEKZ_FORM: TcxLabel;
    cxLabelEKZ_FORM_ORDER: TcxLabel;
    cxTextEditEKZ_FORM_ORDER: TcxTextEdit;
    cxCheckBoxIsSpivbesida: TcxCheckBox;
    cxLabelIsSpivbesida: TcxLabel;
    cxCheckBoxIsZalik: TcxCheckBox;
    cxLabelIsZalik: TcxLabel;
    cxCheckBoxIS_KOLVO_BALLOV: TcxCheckBox;
    cxLabelIS_KOLVO_BALLOV: TcxLabel;
    cxLabelIS_PROF_PREDMET: TcxLabel;
    cxLabellEKZFORM_PRB: TcxLabel;
    cxButtonEditlEKZFORM_PRB: TcxButtonEdit;
    ImageSpravEdit: TImage;
    cxCheckBoxIS_PROF_PREDMET: TcxCheckBox;
    cxLabelNAME_PREDM_DOP_TO: TcxLabel;
    DSetPREDM_DOP_TO: TpFIBDataSet;
    DSourcePREDM_DOP_TO: TDataSource;
    cxLookupComboBoxPREDM_DOP_TO: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxLabelFormCaptionMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ActionCanselExecute(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditNamePredmPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditEKZ_FORMPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditlEKZFORM_PRBPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxTextEditEKZ_FORM_ORDERKeyPress(Sender: TObject;
      var Key: Char);
  private
    Layout: array[0.. KL_NAMELENGTH] of char;
    LangEdit    :integer;
    DataPI: TAArray;
    procedure inicCaption;virtual;
  public
    constructor Create(aOwner: TComponent;aDataVL :TAArray);overload;
  end;

var
  FormPRK_SP_PERELIK_ISPIT_Edit: TFormPRK_SP_PERELIK_ISPIT_Edit;

implementation
uses
    uPrK_Resources,uConstants,uPrK_Loader,
    uPRK_SP_PERELIK_ISPIT;
{$R *.dfm}

{ TFormPRK_SP_PERELIK_ISPIT_Edit }

constructor TFormPRK_SP_PERELIK_ISPIT_Edit.Create(aOwner: TComponent;
  aDataVL: TAArray);
begin
  DataPI    :=aDataVL;
  LangEdit  :=SelectLanguage;
  inherited Create(aOwner);

  cxLabelFormCaption.Top   :=0;
  inicCaption;
  DSetPREDM_DOP_TO.SQLs.SelectSQL.Text:='SELECT * FROM PRK_SP_PERELIK_ISPIT_OSN_PR_SEL(:ID_SP_SPEC,:ID_CN_SP_FORM_STUD,:ID_CN_SP_KAT_STUD,:ID_SP_GOD_NABORA)';
  DSetPREDM_DOP_TO.ParamByName('ID_SP_SPEC').AsInt64         :=TFormPRK_SP_PERELIK_ISPIT(AOwner).DataSetPiLeft['ID_CN_SP_SPEC'];
  DSetPREDM_DOP_TO.ParamByName('ID_CN_SP_FORM_STUD').AsInt64 :=TFormPRK_SP_PERELIK_ISPIT(AOwner).DataSetPiLeft['ID_CN_SP_FORM_STUD'];
  DSetPREDM_DOP_TO.ParamByName('ID_CN_SP_KAT_STUD').AsInt64  :=TFormPRK_SP_PERELIK_ISPIT(AOwner).DataSetPiLeft['ID_CN_SP_KAT_STUD'];
  DSetPREDM_DOP_TO.ParamByName('ID_SP_GOD_NABORA').AsInt64   :=aDataVL['ID_SP_GOD_NABORA'].AsInt64;
  DSetPREDM_DOP_TO.Open;

end;

procedure TFormPRK_SP_PERELIK_ISPIT_Edit.FormCreate(Sender: TObject);
begin
  cxCheckBoxIsSpivbesida.EditValue   :=DataPI['IS_SPIVBESIDA'].AsInteger;
  cxCheckBoxIsZalik.EditValue        :=DataPI['IS_ZALIK'].AsInteger;
  cxCheckBoxIS_KOLVO_BALLOV.EditValue:=DataPI['IS_KOLVO_BALLOV'].AsInteger;
  cxCheckBoxIS_PROF_PREDMET.EditValue:=DataPI['IS_PROF_PREDMET'].AsInteger;
  if DataPI['IS_PROF_PREDMET'].AsInteger=1
   then cxCheckBoxIS_PROF_PREDMET.Enabled:=false;

  cxButtonEditNamePredm.Text      :=DataPI['SHORT_NAME_PREDM'].AsString;
  cxButtonEditEKZ_FORM.Text       :=DataPI['SHORT_NAME_EKZFORM'].AsString;
  cxTextEditEKZ_FORM_ORDER.Text   :=IntToStr(DataPI['EKZ_ORDER'].AsInteger);
  cxButtonEditlEKZFORM_PRB.Text   :=DataPI['SHORT_NAME_EKZFORM_PRB'].AsString;

  if DSetPREDM_DOP_TO.Locate('ID_SP_PREDM',DataPI['ID_PREDM_DOP_TO'].AsInt64,[]) then
    cxLookupComboBoxPREDM_DOP_TO.Text:=DSetPREDM_DOP_TO['NAME'];
end;

procedure TFormPRK_SP_PERELIK_ISPIT_Edit.FormShow(Sender: TObject);
begin
                                       {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[LangEdit]),KLF_ACTIVATE);
end;

procedure TFormPRK_SP_PERELIK_ISPIT_Edit.cxLabelFormCaptionMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
const  SC_DragMove = $F012;
begin
  ReleaseCapture;
  perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TFormPRK_SP_PERELIK_ISPIT_Edit.inicCaption;
begin
   ActionOK.Caption         :=nActiont_OK[LangEdit];
   ActionCansel.Caption     :=nActiont_Cansel[LangEdit];
   ActionOK.Hint            :=nHintActiont_OK[LangEdit];
   ActionCansel.Hint        :=nHintActiont_Cansel[LangEdit];

   cxLabelNamePredm.Caption         :=nLabelPredm[LangEdit];
   cxLabelEKZ_FORM.Caption          :=nLabelEKZ_FORM[LangEdit];
   cxLabelEKZ_FORM_ORDER.Caption    :=nLabelNpp[LangEdit];
   cxLabellEKZFORM_PRB.Caption      :=nLabelEKZFORM_PRB[LangEdit];
   cxLabelIsSpivbesida.Caption      :=nLabelIsSpivbesida[LangEdit];
   cxLabelIsZalik.Caption           :=nLabelIsZalik[LangEdit];
   cxLabelIS_KOLVO_BALLOV.Caption   :=nLabelIS_KOLVO_BALLOV[LangEdit];
   cxLabelIS_PROF_PREDMET.Caption   :=nLabelIS_PROF_PREDMET[LangEdit];
   cxLabelNAME_PREDM_DOP_TO.Caption :=nLabelNAME_PREDM_DOP_TO[LangEdit];
end;


procedure TFormPRK_SP_PERELIK_ISPIT_Edit.ActionCanselExecute(
  Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TFormPRK_SP_PERELIK_ISPIT_Edit.ActionOKExecute(Sender: TObject);
var
    i: integer;
begin

  if trim(cxButtonEditNamePredm.Text)='' then
   begin
     ShowMessage(nMsgEmptyPredm[LangEdit]);
     cxButtonEditNamePredm.SetFocus;
     exit;
   end;

   if trim(cxButtonEditEKZ_FORM.Text)='' then
   begin
     ShowMessage(nMsgEmptyEKZ_FORM[LangEdit]);
     cxButtonEditEKZ_FORM.SetFocus;
     exit;
   end;

   if trim(cxTextEditEKZ_FORM_ORDER.Text)='' then
    begin
      ShowMessage(nMsgEmptyNPP[LangEdit]);
      cxTextEditEKZ_FORM_ORDER.SetFocus;
      exit;
    end;

    for i:=0 to DataPI['All_EKZ_ORDER'].AsInteger do
    begin
      if (DataPI['EKZ_ORDER'].AsInteger<>StrToInt(cxTextEditEKZ_FORM_ORDER.Text))
       then  if (DataPI['All_EKZ_ORDER'][i].AsInteger=StrToInt(cxTextEditEKZ_FORM_ORDER.Text)) then
             begin
                ShowMessage(nMsgThisNppExist[LangEdit]+chr(13)+nMsgFreeNomer[LangEdit]+DataPI['EKZ_ORDER'].AsString);
                cxTextEditEKZ_FORM_ORDER.SetFocus;
                exit;
             end;
    end;

   if trim(cxButtonEditlEKZFORM_PRB.Text)='' then
   begin
     ShowMessage(nMsgEmptyEKZFORM_PRB[LangEdit]);
     cxButtonEditlEKZFORM_PRB.SetFocus;
     exit;
   end;
  DataPI['EKZ_ORDER'].AsInteger        :=StrToInt(cxTextEditEKZ_FORM_ORDER.Text);
  DataPI['IS_SPIVBESIDA'].AsInteger    :=cxCheckBoxIsSpivbesida.EditValue;
  DataPI['IS_ZALIK'].AsInteger         :=cxCheckBoxIsZalik.EditValue;
  DataPI['IS_KOLVO_BALLOV'].AsInteger  :=cxCheckBoxIS_KOLVO_BALLOV.EditValue;
  DataPI['IS_PROF_PREDMET'].AsInteger  :=cxCheckBoxIS_PROF_PREDMET.EditValue;

  DataPI['ID_PREDM_DOP_TO'].AsInt64    :=cxLookupComboBoxPREDM_DOP_TO.EditValue;

  ModalResult:=mrOk;
end;

procedure TFormPRK_SP_PERELIK_ISPIT_Edit.cxButtonEditNamePredmPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_SP_PERELIK_ISPIT(Self.Owner).DataBasePrk.Handle,
                                    PrK_SP_PREDM_u,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataPI['ID_SP_PREDM'].AsInt64        := Res[0];
              DataPI['SHORT_NAME_PREDM'].AsString  := Res[2];
              cxButtonEditNamePredm.Text                := DataPI['SHORT_NAME_PREDM'].AsString;
              cxButtonEditEKZ_FORM.SetFocus;
          end;
    end;
end;

procedure TFormPRK_SP_PERELIK_ISPIT_Edit.cxButtonEditEKZ_FORMPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_SP_PERELIK_ISPIT(Self.Owner).DataBasePrk.Handle,
                                    PrK_SP_EXZFORM,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataPI['ID_SP_EKZ_FORM'].AsInt64        := Res[0];
              DataPI['SHORT_NAME_EKZFORM'].AsString   := Res[2];
              cxButtonEditEKZ_FORM.Text               := DataPI['SHORT_NAME_EKZFORM'].AsString;
              if trim(cxButtonEditlEKZFORM_PRB.Text)='' then
               begin
                 DataPI['ID_SP_EKZFORM_PRB'].AsInt64       := Res[0];
                 DataPI['SHORT_NAME_EKZFORM_PRB'].AsString := Res[2];
                 cxButtonEditlEKZFORM_PRB.Text             := DataPI['SHORT_NAME_EKZFORM_PRB'].AsString;
               end;
              cxTextEditEKZ_FORM_ORDER.SetFocus;
          end;
    end;
end;

procedure TFormPRK_SP_PERELIK_ISPIT_Edit.cxButtonEditlEKZFORM_PRBPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_SP_PERELIK_ISPIT(Self.Owner).DataBasePrk.Handle,
                                    PrK_SP_EXZFORM,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
               DataPI['ID_SP_EKZFORM_PRB'].AsInt64       := Res[0];
               DataPI['SHORT_NAME_EKZFORM_PRB'].AsString := Res[2];
               cxButtonEditlEKZFORM_PRB.Text             := DataPI['SHORT_NAME_EKZFORM_PRB'].AsString;
               cxCheckBoxIsSpivbesida.SetFocus;
          end;
    end;
end;

procedure TFormPRK_SP_PERELIK_ISPIT_Edit.cxTextEditEKZ_FORM_ORDERKeyPress(
  Sender: TObject; var Key: Char);
begin
    if (Key = '.') or (Key=',') then Key := Chr(0);
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then     Key := Chr(0);
end;

end.
