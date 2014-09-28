unit uFrameParents;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxTextEdit, cxContainer, cxEdit, cxLabel, cxControls, cxGroupBox,
  cxMaskEdit,uPrK_Resources;

type
  TFrameParents = class(TFrame)
    cxGroupBoxOtec: TcxGroupBox;
    cxLabelOtecMestoRaboti: TcxLabel;
    cxTextEditOtecMestoRaboti: TcxTextEdit;
    cxLabelOtecDoljnost: TcxLabel;
    cxTextEditOtecDoljnost: TcxTextEdit;
    cxGroupBoxMother: TcxGroupBox;
    cxLabelOtecFam: TcxLabel;
    cxTextEditOtecFam: TcxTextEdit;
    cxLabelOtecName: TcxLabel;
    cxTextEditOtecName: TcxTextEdit;
    cxLabelOtecOtch: TcxLabel;
    cxTextEditOtecOtch: TcxTextEdit;
    cxMaskEditOtecTel: TcxMaskEdit;
    cxLabelOtecTel: TcxLabel;
    cxLabelMotherFam: TcxLabel;
    cxTextEditMotherFam: TcxTextEdit;
    cxLabelMotherName: TcxLabel;
    cxTextEditMotherName: TcxTextEdit;
    cxLabelMotherOtch: TcxLabel;
    cxTextEditMotherOtch: TcxTextEdit;
    cxLabelMotherMestoRaboti: TcxLabel;
    cxTextEditMotherMestoRaboti: TcxTextEdit;
    cxLabelMotherDoljnost: TcxLabel;
    cxTextEditMotherDoljnost: TcxTextEdit;
    cxLabelMotherTel: TcxLabel;
    cxMaskEditMotherTel: TcxMaskEdit;
  private

  public
     procedure InicCaptionFrame;
     procedure InicDataFrame(rejim :RejimPrK);
  end;

implementation
uses
    uPRK_DT_ABIT,uConstants;
{$R *.dfm}

{ TFrameParents }

procedure TFrameParents.InicCaptionFrame;
var
   i: integer;
begin
    i:=TFormPRK_DT_ABIT(self.Owner).IndLangAbit;

    cxGroupBoxOtec.Caption           :=ncxGroupBoxOtec[i];
    cxLabelOtecFam.Caption           :=nLabelParentFam[i];
    cxLabelOtecName.Caption          :=nLabelParentName[i];
    cxLabelOtecOtch.Caption          :=nLabelParentOtch[i];
    cxLabelOtecMestoRaboti.Caption   :=nLabelParentMestoRaboti[i];
    cxLabelOtecDoljnost.Caption      :=nLabelParentDoljnost[i];
    cxLabelOtecTel.Caption           :=nLabelParentTel[i];

    cxGroupBoxMother.Caption         :=ncxGroupBoxMother[i];
    cxLabelMotherFam.Caption         :=nLabelParentFam[i];
    cxLabelMotherName.Caption        :=nLabelParentName[i];
    cxLabelMotherOtch.Caption        :=nLabelParentOtch[i];
    cxLabelMotherMestoRaboti.Caption :=nLabelParentMestoRaboti[i];
    cxLabelMotherDoljnost.Caption    :=nLabelParentDoljnost[i];
    cxLabelMotherTel.Caption         :=nLabelParentTel[i];


    cxTextEditOtecFam.Text           :='';
    cxTextEditOtecName.Text          :='';
    cxTextEditOtecOtch.Text          :='';
    cxTextEditOtecMestoRaboti.Text   :='';
    cxTextEditOtecDoljnost.Text      :='';

    cxTextEditMotherFam.Text         :='';
    cxTextEditMotherName.Text        :='';
    cxTextEditMotherOtch.Text        :='';
    cxTextEditMotherMestoRaboti.Text :='';
    cxTextEditMotherDoljnost.Text    :='';
end;

procedure TFrameParents.InicDataFrame(rejim: RejimPrK);
begin
   if TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['O_FAMILIA']<>Null
    then   cxTextEditOtecFam.Text           :=TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['O_FAMILIA'];
   if TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['O_IMYA']<>Null
    then   cxTextEditOtecName.Text          :=TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['O_IMYA'];
   if TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['O_OTCHESTVO']<>Null
    then   cxTextEditOtecOtch.Text          :=TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['O_OTCHESTVO'];
   if TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['O_MEST_RAB']<>Null
    then   cxTextEditOtecMestoRaboti.Text   :=TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['O_MEST_RAB'];
   if TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['O_DOLGN_RAB']<>Null
    then   cxTextEditOtecDoljnost.Text      :=TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['O_DOLGN_RAB'];
   if TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['O_PHONE']<>Null
    then   cxMaskEditOtecTel.Text           :=TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['O_PHONE'];

   if TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['M_FAMILIA']<>Null
    then   cxTextEditMotherFam.Text         :=TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['M_FAMILIA'];
   if TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['M_IMYA']<>Null
    then   cxTextEditMotherName.Text        :=TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['M_IMYA'];
   if TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['M_OTCHESTVO']<>Null
    then   cxTextEditMotherOtch.Text        :=TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['M_OTCHESTVO'];
   if TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['M_MEST_RAB']<>Null
    then   cxTextEditMotherMestoRaboti.Text :=TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['M_MEST_RAB'];
   if TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['M_DOLGN_RAB']<>Null
    then   cxTextEditMotherDoljnost.Text    :=TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['M_DOLGN_RAB'];
   if TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['M_PHONE']<>Null
    then   cxMaskEditMotherTel.Text         :=TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['M_PHONE'];

   if rejim=ViewPrK then
   begin
    cxTextEditOtecFam.Properties.ReadOnly           :=true;
    cxTextEditOtecName.Properties.ReadOnly          :=true;
    cxTextEditOtecOtch.Properties.ReadOnly          :=true;
    cxTextEditOtecMestoRaboti.Properties.ReadOnly   :=true;
    cxTextEditOtecDoljnost.Properties.ReadOnly      :=true;
    cxMaskEditOtecTel.Properties.ReadOnly           :=true;

    cxTextEditMotherFam.Properties.ReadOnly         :=true;
    cxTextEditMotherName.Properties.ReadOnly        :=true;
    cxTextEditMotherOtch.Properties.ReadOnly        :=true;
    cxTextEditMotherMestoRaboti.Properties.ReadOnly :=true;
    cxTextEditMotherDoljnost.Properties.ReadOnly    :=true;
    cxMaskEditMotherTel.Properties.ReadOnly         :=true;

    cxTextEditOtecFam.Style.Color           :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
    cxTextEditOtecName.Style.Color          :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
    cxTextEditOtecOtch.Style.Color          :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
    cxTextEditOtecMestoRaboti.Style.Color   :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
    cxTextEditOtecDoljnost.Style.Color      :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
    cxMaskEditOtecTel.Style.Color           :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
    cxTextEditMotherFam.Style.Color         :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
    cxTextEditMotherName.Style.Color        :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
    cxTextEditMotherOtch.Style.Color        :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
    cxTextEditMotherMestoRaboti.Style.Color :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
    cxTextEditMotherDoljnost.Style.Color    :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
    cxMaskEditMotherTel.Style.Color         :=TFormPRK_DT_ABIT(self.Owner).TextViewColor; 
   end;
end;

end.
