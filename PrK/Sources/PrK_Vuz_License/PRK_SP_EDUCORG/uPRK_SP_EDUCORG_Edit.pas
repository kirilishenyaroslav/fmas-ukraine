unit uPRK_SP_EDUCORG_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlass_VL_Edit, cxLookAndFeelPainters, ActnList, cxControls,
  cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, ExtCtrls, cxMaskEdit,
  cxButtonEdit, cxTextEdit;

type
  TFormPRK_SP_EDUCORG_Edit = class(TFormPrKKlass_VL_Edit)
    cxLabelName: TcxLabel;
    cxTextEditName: TcxTextEdit;
    cxLabelShortName: TcxLabel;
    cxTextEditShortName: TcxTextEdit;
    cxLabelTYPE: TcxLabel;
    cxButtonEditTYPE: TcxButtonEdit;
    cxLabelPLACE: TcxLabel;
    cxButtonEditPLACE: TcxButtonEdit;
    procedure FormCreate(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditTYPEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditPLACEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditTYPEKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditPLACEKeyPress(Sender: TObject; var Key: Char);
  private
    procedure inicCaption;override;
  public
    { Public declarations }
  end;

var
  FormPRK_SP_EDUCORG_Edit: TFormPRK_SP_EDUCORG_Edit;

implementation
uses uConstants,uPrK_Resources,uPrK_Loader,uPRK_SP_EDUCORG,
     uCommonSp;
{$R *.dfm}

procedure TFormPRK_SP_EDUCORG_Edit.FormCreate(Sender: TObject);
begin
  inherited;
  cxTextEditName.Text       :=DataVL['NAME_FULL'].AsString;
  cxTextEditShortName.Text  :=DataVL['NAME_SHORT'].AsString;
  cxButtonEditTYPE.Text     :=DataVL['SHORT_NAME_TYPE'].asString;
  cxButtonEditPLACE.Text    :=DataVL['NAME_PLACE'].AsString;
end;

procedure TFormPRK_SP_EDUCORG_Edit.inicCaption;
begin
  inherited;
  cxLabelName.Caption      := nLabelName[VLLangEdit];
  cxLabelShortName.Caption := nLabelShortName[VLLangEdit];
  cxLabelTYPE.Caption      := nLabelTypeUchz[VLLangEdit];
  cxLabelPLACE.Caption     := nLabelAdressUchz[VLLangEdit];
end;

procedure TFormPRK_SP_EDUCORG_Edit.ActionOKExecute(Sender: TObject);
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

   if trim(cxButtonEditTYPE.Text)='' then
   begin
     ShowMessage(nMsgEmptyTypeUchz[VLLangEdit]);
     cxButtonEditTYPE.SetFocus;
     exit;
   end;

   if trim(cxButtonEditPLACE.Text)='' then
   begin
     ShowMessage(nMsgEmptyAdressUchz[VLLangEdit]);
     cxButtonEditPLACE.SetFocus;
     exit;
   end;

   DataVL['NAME_FULL'].AsString  :=cxTextEditName.Text;
   DataVL['NAME_SHORT'].AsString :=cxTextEditShortName.Text;

   ModalResult:=mrOk;
end;

procedure TFormPRK_SP_EDUCORG_Edit.cxButtonEditTYPEPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_SP_EDUCORG(self.Owner).DataBasePrKVuzLicense.Handle,
                                    PrK_SP_TYPE_UCHZ,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataVL['ID_TYPE'].AsInt64          := Res[0];
              DataVL['SHORT_NAME_TYPE'].AsString := Res[2];
              cxButtonEditTYPE.Text              := DataVL['SHORT_NAME_TYPE'].AsString;
              cxButtonEditPLACE.SetFocus;
          end;
    end;
end;

procedure TFormPRK_SP_EDUCORG_Edit.cxButtonEditPLACEPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    AdressesSp:TSprav;
begin

    AdressesSp:=GetSprav('Adresses');
    if (AdressesSp<>nil) then
    begin
        with AdressesSp.Input do
        begin
            Edit;
            FieldValues['Id_Adress']:=DataVL['ID_PLACE'].AsInt64;
            FieldValues['DbHandle'] :=Integer(TFormPRK_SP_EDUCORG(self.Owner).DataBasePrKVuzLicense.Handle);
            FieldValues['Select']   :=1;
            FieldValues['ShowStyle']:=5;
            Post;
        end;

        AdressesSp.Show;

        if (not VarIsNull(AdressesSp.Output['Id_Adress']))
        then begin
                    DataVL['NAME_PLACE'].AsString:=AdressesSp.Output['Name_Adr'];
                    cxButtonEditPLACE.Text       :=DataVL['NAME_PLACE'].AsString;
                    DataVL['ID_PLACE'].AsInt64   :=AdressesSp.Output['Id_Adress'];
        end;
   end;
end;

procedure TFormPRK_SP_EDUCORG_Edit.cxButtonEditTYPEKeyPress(
  Sender: TObject; var Key: Char);
begin
   Key := Chr(0);
end;

procedure TFormPRK_SP_EDUCORG_Edit.cxButtonEditPLACEKeyPress(
  Sender: TObject; var Key: Char);
begin
   Key := Chr(0);
end;

end.
