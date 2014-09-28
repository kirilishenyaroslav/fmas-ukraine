unit uOrganizationsAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxLabel, cxMaskEdit, cxButtonEdit, AArray, LoaderUnit, dogloaderUnit;

type
  TfrmAdd = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    eName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    eShortName: TcxTextEdit;
    cxLabel3: TcxLabel;
    eEDRPOU: TcxTextEdit;
    cxLabel4: TcxLabel;
    eKOATUU: TcxTextEdit;
    cxLabel5: TcxLabel;
    eZKGNG: TcxTextEdit;
    cxLabel6: TcxLabel;
    eKVED: TcxTextEdit;
    cxLabel7: TcxLabel;
    eKFV: TcxTextEdit;
    cxLabel8: TcxLabel;
    eKOPFG: TcxTextEdit;
    cxLabel9: TcxLabel;
    eSPODU: TcxTextEdit;
    beCustomer: TcxButtonEdit;
    beTypeOrg: TcxButtonEdit;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    eCode: TcxTextEdit;
    eDir: TcxTextEdit;
    cxLabel13: TcxLabel;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure beTypeOrgPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure beCustomerPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure eCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eShortNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eEDRPOUKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eKOATUUKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eZKGNGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eKVEDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eKFVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eKOPFGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eSPODUKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eDirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  public
    id_customer, id_type_org : int64;
  end;

var
  frmAdd: TfrmAdd;

implementation
uses uOrganizations;
{$R *.dfm}

procedure TfrmAdd.cxButton2Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmAdd.cxButton1Click(Sender: TObject);
begin
 ModalResult := mrOk;
end;

procedure TfrmAdd.FormShow(Sender: TObject);
begin
 eCode.SetFocus;
end;

procedure TfrmAdd.beTypeOrgPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(TfrmOrganizations(owner).pFIBDatabase1.Handle);
  i['Owner'].AsObject := Self;
  i.LoadFromFile(ExtractFilePath(Application.ExeName) + 'monu\sprav\mon_sp_type_org.spr', 'Main');
  i['FormStyle'].AsInteger := 0;
  LoaderUnit.LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivLinear.bpl', i, o);
  if o['ModalResult'].AsInteger = mrOk then
  begin
    id_type_org := o['ID_TYPE_ORG'].AsInt64;
    beTypeOrg.Text := o['name_type_org'].AsString;
  end;
  i.Free;
  o.Free;
end;


procedure TfrmAdd.FormCreate(Sender: TObject);
begin
  id_type_org := -1;
  id_customer := -1;
end;

procedure TfrmAdd.beCustomerPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
i, o : TSpravParams;
begin
    i := TSpravParams.Create;
    o := TSpravParams.Create;
    i['DataBase']     := Integer(TfrmOrganizations(Owner).pFIBDatabase1.Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := selCustomer;
    LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
      begin
        id_customer := o['ID_CUSTOMER'];
        beCustomer.Text := +o['NAME_CUSTOMER'];
      end;
    i.Free;
    o.Free;
end;

procedure TfrmAdd.eCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    eName.SetFocus;
  end;
end;

procedure TfrmAdd.eNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    eShortName.SetFocus;
  end;
end;

procedure TfrmAdd.eShortNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    eDir.SetFocus;
  end;
end;

procedure TfrmAdd.eEDRPOUKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    eKOATUU.SetFocus;
  end;
end;

procedure TfrmAdd.eKOATUUKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    eZKGNG.SetFocus;
  end;
end;

procedure TfrmAdd.eZKGNGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    eKVED.SetFocus;
  end;
end;

procedure TfrmAdd.eKVEDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    eKFV.SetFocus;
  end;
end;

procedure TfrmAdd.eKFVKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    eKOPFG.SetFocus;
  end;
end;

procedure TfrmAdd.eKOPFGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    eSPODU.SetFocus;
  end;
end;

procedure TfrmAdd.eSPODUKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    beCustomer.SetFocus;
  end;
end;

procedure TfrmAdd.eDirKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    eEDRPOU.SetFocus;
  end;
end;

end.
