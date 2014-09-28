unit uPRK_SP_VUZ_LICENCE_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlass_VL_Edit, cxLookAndFeelPainters, ActnList, cxControls,
  cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, ExtCtrls, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxDropDownEdit, cxCalendar;

type
  TFormPRK_SP_VUZ_LICENCE_Edit = class(TFormPrKKlass_VL_Edit)
    cxLabelShifr: TcxLabel;
    cxButtonEditShifr: TcxButtonEdit;
    cxLabelNameObuchKat: TcxLabel;
    cxButtonEditNameObuchKateg: TcxButtonEdit;
    cxLabelLicenseDateEnd: TcxLabel;
    cxDateEditLicenseDateEnd: TcxDateEdit;
    cxTextEditLicenseValue: TcxTextEdit;
    cxLabelLicenseValue: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure cxButtonEditShifrKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditNameObuchKategKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxTextEditLicenseValueKeyPress(Sender: TObject;
      var Key: Char);
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditShifrPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditNameObuchKategPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
  private
     procedure inicCaption;override;
  public
    { Public declarations }
  end;

var
  FormPRK_SP_VUZ_LICENCE_Edit: TFormPRK_SP_VUZ_LICENCE_Edit;

implementation

uses uConstants,uPrK_Resources,uPrK_Loader,
     uPRK_SP_VUZ_LICENCE, AArray;

{$R *.dfm}

procedure TFormPRK_SP_VUZ_LICENCE_Edit.FormCreate(Sender: TObject);
begin
  inherited;
  cxButtonEditShifr.Text          :=DataVL['SHIFR'].asString;
  cxButtonEditNameObuchKateg.Text :=DataVL['SHORT_NAME_KATEGORY'].AsString;
  cxTextEditLicenseValue.Text     :=DataVL['LICENCE_VALUE'].AsString;
  cxDateEditLicenseDateEnd.Date   :=DataVL['LICENCE_DATE_END'].AsVariant;
end;

procedure TFormPRK_SP_VUZ_LICENCE_Edit.inicCaption;
begin
  inherited;
  cxLabelShifr.Caption           :=nLabelSHIFR[VLLangEdit];
  cxLabelNameObuchKat.Caption    :=nLabelNameObuchKat[VLLangEdit];
  cxLabelLicenseValue.Caption    :=nLabelLicenseValue[VLLangEdit];
  cxLabelLicenseDateEnd.Caption  :=nLabelLicenseDateEnd[VLLangEdit];
end;

procedure TFormPRK_SP_VUZ_LICENCE_Edit.cxButtonEditShifrKeyPress(
  Sender: TObject; var Key: Char);
begin
   Key := Chr(0);
end;

procedure TFormPRK_SP_VUZ_LICENCE_Edit.cxButtonEditNameObuchKategKeyPress(
  Sender: TObject; var Key: Char);
begin
   Key := Chr(0);
end;

procedure TFormPRK_SP_VUZ_LICENCE_Edit.cxTextEditLicenseValueKeyPress(
  Sender: TObject; var Key: Char);
begin
  if (Key = '.') or (Key=',') then Key := Chr(0);
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then     Key := Chr(0);
end;

procedure TFormPRK_SP_VUZ_LICENCE_Edit.ActionOKExecute(Sender: TObject);
begin
  if trim(cxButtonEditShifr.Text)='' then
   begin
     ShowMessage(nMsgEmptyShifr[VLLangEdit]);
     cxButtonEditShifr.SetFocus;
     exit;
   end;

   if trim(cxButtonEditNameObuchKateg.Text)='' then
   begin
     ShowMessage(nMsgEmptyNameObuchKateg[VLLangEdit]);
     cxButtonEditNameObuchKateg.SetFocus;
     exit;
   end;


  if trim(cxTextEditLicenseValue.Text)='' then
   begin
     ShowMessage(nMsgEmptyLicenseValue[VLLangEdit]);
     cxTextEditLicenseValue.SetFocus;
     exit;
   end;

    if trim(cxDateEditLicenseDateEnd.Text)='' then
     begin
       ShowMessage(nMsgEmptyLicenseDateEnd[VLLangEdit]);
       cxDateEditLicenseDateEnd.SetFocus;
       exit;
     end;

   DataVL['LICENCE_VALUE'].AsInteger    :=StrToInt(cxTextEditLicenseValue.Text);
   DataVL['LICENCE_DATE_END'].AsVariant :=cxDateEditLicenseDateEnd.Date; 

   ModalResult:=mrOk;
end;

procedure TFormPRK_SP_VUZ_LICENCE_Edit.cxButtonEditShifrPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  InOutParam :TAArray;
begin
  InOutParam :=TAArray.Create;
    InOutParam['Input']['aDBHANDLE'].AsInteger          := Integer(TFormPRK_SP_VUZ_LICENCE(self.Owner).DataBasePrKVuzLicense.Handle);
    InOutParam['Input']['aNamePrKVuzLicense'].AsVariant := PrK_SP_MIN_PERELIK_SHIFR;
    InOutParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
  uPrK_Loader.ShowVuzLicense(self,InOutParam);
  if  InOutParam['OutPut']['ID_SP_MIN_PERELIK_SHIFR'].AsVariant<>Null then
  begin
      DataVL['ID_SP_MIN_PERELIK_SHIFR'].AsInt64 :=InOutParam['OutPut']['ID_SP_MIN_PERELIK_SHIFR'].AsInt64;
      DataVL['SHIFR'].AsString                  :=InOutParam['OutPut']['SHIFR'].AsString;
      cxButtonEditShifr.Text                    := DataVL['SHIFR'].AsString;
      cxButtonEditNameObuchKateg.SetFocus;
  end;
  InOutParam.Free;
  InOutParam:=nil;
end;

procedure TFormPRK_SP_VUZ_LICENCE_Edit.cxButtonEditNameObuchKategPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_SP_VUZ_LICENCE(self.owner).DataBasePrKVuzLicense.Handle,
                                    PrK_SP_FORM_OBUCH_KATEGORY,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataVL['ID_SP_FORM_OBUCH_KATEGORY'].AsInt64  :=StrToInt64(res[0]);
              DataVL['SHORT_NAME_KATEGORY'].AsString       :=res[2];
              cxButtonEditNameObuchKateg.Text              := DataVL['SHORT_NAME_KATEGORY'].AsString;
              cxTextEditLicenseValue.SetFocus;
          end;
    end;
end;

end.
