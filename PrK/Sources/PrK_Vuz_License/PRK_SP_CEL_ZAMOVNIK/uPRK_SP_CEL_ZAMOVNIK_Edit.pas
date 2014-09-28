unit uPRK_SP_CEL_ZAMOVNIK_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlass_VL_Edit, cxLookAndFeelPainters, ActnList, cxControls,
  cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, ExtCtrls, cxTextEdit,
  cxMaskEdit, cxButtonEdit;

type
  TFormPRK_SP_CEL_ZAMOVNIK_Edit = class(TFormPrKKlass_VL_Edit)
    cxLabelName: TcxLabel;
    cxTextEditName: TcxTextEdit;
    cxLabelShortName: TcxLabel;
    cxTextEditShortName: TcxTextEdit;
    cxLabelCustomers: TcxLabel;
    cxButtonEditCustomers: TcxButtonEdit;
    procedure FormCreate(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditCustomersPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditCustomersKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButtonEditCustomersKeyPress(Sender: TObject;
      var Key: Char);
  private
     procedure inicCaption;override;
  public
    { Public declarations }
  end;

var
  FormPRK_SP_CEL_ZAMOVNIK_Edit: TFormPRK_SP_CEL_ZAMOVNIK_Edit;

implementation
uses uConstants,DogLoaderUnit,uPRK_SP_CEL_ZAMOVNIK;
{$R *.dfm}

procedure TFormPRK_SP_CEL_ZAMOVNIK_Edit.FormCreate(Sender: TObject);
begin
  inherited;
  cxTextEditName.Text        :=DataVL['NAME'].AsString;
  cxTextEditShortName.Text   :=DataVL['SHORT_NAME'].AsString;
  cxButtonEditCustomers.Text :=DataVL['NAME_CUSTOMER'].AsString;
end;

procedure TFormPRK_SP_CEL_ZAMOVNIK_Edit.inicCaption;
begin
  inherited;
  cxLabelName.Caption      := nLabelName[VLLangEdit];
  cxLabelShortName.Caption := nLabelShortName[VLLangEdit];
  cxLabelCustomers.Caption := nLabelCustomers[VLLangEdit];
end;

procedure TFormPRK_SP_CEL_ZAMOVNIK_Edit.ActionOKExecute(Sender: TObject);
begin
  if trim(cxTextEditName.Text)='' then
   begin
     ShowMessage(nMsgEmptyName[VLLangEdit]);
     cxTextEditName.SetFocus;
     exit;
   end;

   if trim(cxTextEditShortName.Text)='' then
   begin
     ShowMessage(nMsgEmptyShortName[VLLangEdit]);
     cxTextEditShortName.SetFocus;
     exit;
   end;

   if Trim(cxButtonEditCustomers.Text)='' then
    begin
       DataVL['ID_CUSTOMER'].AsInt64     :=-1;
       DataVL['NAME_CUSTOMER'].AsString  :='';
    end;

   DataVL['NAME'].AsString       :=cxTextEditName.Text;
   DataVL['SHORT_NAME'].AsString :=cxTextEditShortName.Text;

   ModalResult:=mrOk;
end;

procedure TFormPRK_SP_CEL_ZAMOVNIK_Edit.cxButtonEditCustomersPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
   i, o : TSpravParams;
begin
    i := TSpravParams.Create;
    o := TSpravParams.Create;
    i['DataBase']     := Integer(TFormPRK_SP_CEL_ZAMOVNIK(self.Owner).DataBasePrKVuzLicense.Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := SelCustomer;
    i['id_customer']  := DataVL['ID_CUSTOMER'].AsInt64;
    LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
     begin
       DataVL['ID_CUSTOMER'].AsInt64     :=o['ID_CUSTOMER'];
       DataVL['NAME_CUSTOMER'].AsString  :=o['NAME_CUSTOMER'];
       cxButtonEditCustomers.Text        :=DataVL['NAME_CUSTOMER'].AsString;
     end;
    i.Free;
    o.Free;
    i:=NIl;
    o:=NIl;
end;

procedure TFormPRK_SP_CEL_ZAMOVNIK_Edit.cxButtonEditCustomersKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=Vk_Delete
   then cxButtonEditCustomers.Text:='';
end;

procedure TFormPRK_SP_CEL_ZAMOVNIK_Edit.cxButtonEditCustomersKeyPress(
  Sender: TObject; var Key: Char);
begin
  Key:=Chr(0);
end;

end.
