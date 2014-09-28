unit uPRK_SP_PLAN_CEL_NABOR_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlass_VL_Edit, cxLookAndFeelPainters, ActnList, cxControls,
  cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, ExtCtrls, cxTextEdit,
  cxMaskEdit, cxButtonEdit;

type
  TFormPRK_SP_PLAN_CEL_NABOR_Edit = class(TFormPrKKlass_VL_Edit)
    cxLabelCel_Zamovnik: TcxLabel;
    cxButtonEditCel_Zamovnik: TcxButtonEdit;
    cxLabelPlanValue: TcxLabel;
    cxTextEditPlanValue: TcxTextEdit;
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditCel_ZamovnikKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxTextEditPlanValueKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonEditCel_ZamovnikPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
  private
    procedure inicCaption;override;
  public
    { Public declarations }
  end;

var
  FormPRK_SP_PLAN_CEL_NABOR_Edit: TFormPRK_SP_PLAN_CEL_NABOR_Edit;

implementation
uses
   uConstants,uPrK_Loader,uPrK_Resources,
   AArray,uPRK_SP_PLAN_CEL_NABOR;
{$R *.dfm}

procedure TFormPRK_SP_PLAN_CEL_NABOR_Edit.FormCreate(Sender: TObject);
begin
  inherited;
  cxButtonEditCel_Zamovnik.Text       :=DataVL['SHORT_NAME_ZAMOVNIK'].AsString;
  cxTextEditPlanValue.Text            :=DataVL['PLAN_VALUE'].AsString;
end;

procedure TFormPRK_SP_PLAN_CEL_NABOR_Edit.inicCaption;
begin
  inherited;
  cxLabelCel_Zamovnik.Caption  :=nLabelCel_Zamovnik[VLLangEdit];
  cxLabelPlanValue.Caption     :=nLabelPlanValue[VLLangEdit];
end;

procedure TFormPRK_SP_PLAN_CEL_NABOR_Edit.ActionOKExecute(Sender: TObject);
begin
   if trim(cxButtonEditCel_Zamovnik.Text)='' then
   begin
     ShowMessage(nMsgEmptyCel_Zamovnik[VLLangEdit]);
     cxButtonEditCel_Zamovnik.SetFocus;
     exit;
   end;

   if trim(cxTextEditPlanValue.Text)='' then
   begin
     ShowMessage(nMsgEmptyPlanValue[VLLangEdit]);
     cxTextEditPlanValue.SetFocus;
     exit;
   end;

   DataVL['PLAN_VALUE'].AsString :=cxTextEditPlanValue.Text;

   ModalResult:=mrOk;
end;

procedure TFormPRK_SP_PLAN_CEL_NABOR_Edit.cxButtonEditCel_ZamovnikKeyPress(
  Sender: TObject; var Key: Char);
begin
   Key:=CHR(0);
end;

procedure TFormPRK_SP_PLAN_CEL_NABOR_Edit.cxTextEditPlanValueKeyPress(
  Sender: TObject; var Key: Char);
begin
  if (Key = '.') or (Key=',') then Key := Chr(0);
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then     Key := Chr(0);
end;

procedure TFormPRK_SP_PLAN_CEL_NABOR_Edit.cxButtonEditCel_ZamovnikPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  InOutParam :TAArray;
begin
  InOutParam :=TAArray.Create;
    InOutParam['Input']['aDBHANDLE'].AsInteger          := Integer(TFormPRK_SP_PLAN_CEL_NABOR(self.Owner).DataBasePrKVuzLicense.Handle);
    InOutParam['Input']['aNamePrKVuzLicense'].AsVariant := PrK_SP_CEL_ZAMOVNIK;
    InOutParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
    InOutParam['Input']['ID_SP_GOD_NABORA'].AsInt64     := -1;
    InOutParam['Input']['ID_CN_SP_FORM_STUD'].AsInt64   := -1;
    InOutParam['Input']['ID_CN_SP_KAT_STUD'].AsInt64    := -1;
    InOutParam['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64  := -1;
    InOutParam['Input']['ID_CN_SP_FAK'].AsInt64         := -1;
    InOutParam['Input']['ID_FAK_CENTER'].AsInt64        := -1;
  uPrK_Loader.ShowVuzLicense(self,InOutParam);
  if  InOutParam['OutPut']['ID_SP_CEL_ZAMOVNIK'].AsVariant<>Null then
  begin
      DataVL['ID_SP_CEL_ZAMOVNIK'].AsInt64    :=InOutParam['OutPut']['ID_SP_CEL_ZAMOVNIK'].AsInt64;
      DataVL['SHORT_NAME_ZAMOVNIK'].AsString  :=InOutParam['OutPut']['SHORT_NAME'].AsString;
      cxButtonEditCel_Zamovnik.Text           := DataVL['SHORT_NAME_ZAMOVNIK'].AsString;
      cxTextEditPlanValue.SetFocus;
  end;
  InOutParam.Free;
  InOutParam:=nil;
end;

end.
