unit uPrK_MIN_PER_SHIFR_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlass_VL_Edit, cxLookAndFeelPainters, ActnList, cxControls,
  cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, ExtCtrls, cxTextEdit,
  cxMaskEdit, cxButtonEdit;

type
  TFormPrK_MIN_PER_SHIFR_Edit = class(TFormPrKKlass_VL_Edit)
    cxButtonEditNameSpec: TcxButtonEdit;
    cxButtonEditNameStud: TcxButtonEdit;
    cxLabelNameSpec: TcxLabel;
    cxLabelNameStud: TcxLabel;
    cxLabelSHIFR: TcxLabel;
    cxTextEditSHIFR: TcxTextEdit;
    procedure cxButtonEditNameSpecKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditNameStudKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditNameSpecPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditNameStudPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    procedure inicCaption;override;
  public
    { Public declarations }
  end;

var
  FormPrK_MIN_PER_SHIFR_Edit: TFormPrK_MIN_PER_SHIFR_Edit;

implementation
uses uConstants,uPrK_Resources,uPrK_Loader,uPRK_SP_MIN_PERELIK_SHIFR;
{$R *.dfm}

procedure TFormPrK_MIN_PER_SHIFR_Edit.FormCreate(Sender: TObject);
begin
  inherited;
  cxButtonEditNameSpec.Text :=DataVL['SHORT_NAME_SPEC'].asString;
  cxButtonEditNameStud.Text :=DataVL['SHORT_NAME_STUD'].AsString;
  cxTextEditSHIFR.Text      :=DataVL['SHIFR'].AsString;
end;

procedure TFormPrK_MIN_PER_SHIFR_Edit.inicCaption;
begin
  inherited;
  cxLabelNameSpec.Caption :=nLabelNameSpec[VLLangEdit];
  cxLabelNameStud.Caption :=nLabelNameStud[VLLangEdit];
  cxLabelSHIFR.Caption    :=nLabelSHIFR[VLLangEdit];
end;

procedure TFormPrK_MIN_PER_SHIFR_Edit.cxButtonEditNameSpecKeyPress(
  Sender: TObject; var Key: Char);
begin
    Key := Chr(0);
end;

procedure TFormPrK_MIN_PER_SHIFR_Edit.cxButtonEditNameStudKeyPress(
  Sender: TObject; var Key: Char);
begin
    Key := Chr(0);
end;

procedure TFormPrK_MIN_PER_SHIFR_Edit.ActionOKExecute(Sender: TObject);
begin
   if trim(cxButtonEditNameSpec.Text)='' then
   begin
     ShowMessage(nMsgEmptyNameSpec[VLLangEdit]);
     cxButtonEditNameSpec.SetFocus;
     exit;
   end;

   if trim(cxButtonEditNameStud.Text)='' then
   begin
     ShowMessage(nMsgEmptyNameStud[VLLangEdit]);
     cxButtonEditNameStud.SetFocus;
     exit;
   end;


  if trim(cxTextEditSHIFR.Text)='' then
   begin
     ShowMessage(nMsgEmptyShifr[VLLangEdit]);
     cxTextEditSHIFR.SetFocus;
     exit;
   end;
   DataVL['SHIFR'].AsString :=cxTextEditSHIFR.Text;


   ModalResult:=mrOk;
end;

procedure TFormPrK_MIN_PER_SHIFR_Edit.cxButtonEditNameSpecPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_SP_MIN_PERELIK_SHIFR(self.owner).DataBasePrKVuzLicense.Handle,
                                    PrK_SP_MIN_PERELIK_SPEC,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataVL['ID_SP_MIN_PERELIK_SPEC'].AsInt64 :=StrToInt64(res[0]);
              DataVL['SHORT_NAME_SPEC'].AsString       :=res[2];
              cxButtonEditNameSpec.Text                :=DataVL['SHORT_NAME_SPEC'].AsString;
              cxButtonEditNameStud.SetFocus;
          end;
    end;
end;

procedure TFormPrK_MIN_PER_SHIFR_Edit.cxButtonEditNameStudPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_SP_MIN_PERELIK_SHIFR(self.owner).DataBasePrKVuzLicense.Handle,
                                    PrK_SP_TYPE_KAT_STUD,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataVL['ID_SP_TYPE_KAT_STUD'].AsInt64 :=StrToInt64(res[0]);
              DataVL['SHORT_NAME_STUD'].AsString    :=res[2];
              cxButtonEditNameStud.Text             :=DataVL['SHORT_NAME_STUD'].AsString;
              cxTextEditSHIFR.SetFocus;
          end;
    end;
end;

end.
