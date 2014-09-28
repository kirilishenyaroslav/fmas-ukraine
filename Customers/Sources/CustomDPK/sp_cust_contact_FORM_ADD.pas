unit sp_cust_contact_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters,
  cxButtons,GlobalSPR, Variants;

type
  TFsp_cust_contact_form_add = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupContactEdit: TcxButtonEdit;
    TypeContactEdit: TcxButtonEdit;
    ContactEdit: TcxTextEdit;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GroupContactEditButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure TypeContactEditButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ContactEditKeyPress(Sender: TObject; var Key: Char);
  public
    id_group_contact : integer;
    id_type_contact : integer;
  end;



implementation
uses BaseTypes, sp_customer_FORM, dogLoaderUnit, LangUnit;
{$R *.DFM}

procedure TFsp_cust_contact_form_add.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TFsp_cust_contact_form_add.OKButtonClick(Sender: TObject);
begin
 if ContactEdit.Text = '' then begin
  agShowMessage('Необхідно ввести контакт.');
  exit;
 end;
 if TypeContactEdit.Text = '' then begin
  agShowMessage('Необхідно ввести тип контакту.');
  exit;
 end;
 ModalResult := mrOK;
end;

procedure TFsp_cust_contact_form_add.FormShow(Sender: TObject);
begin
 ContactEdit.SetFocus;
end;

procedure TFsp_cust_contact_form_add.FormCreate(Sender: TObject);
begin
 LangPackApply(Self);
 id_group_contact := -1;
 id_type_contact  := -1;
end;

procedure TFsp_cust_contact_form_add.GroupContactEditButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetGroupContact(self.Owner,TFsp_customer(self.Owner.Owner).WorkDatabase.Handle,fsnormal,TFsp_customer(self.Owner.Owner).ActualDate);
    if VarArrayDimCount(id)>0
    then begin
     if id[0]<>NULL
     then begin
          id_group_contact := id[0];
          GroupContactEdit.Text := id[1];
     end;
   end;
end;

procedure TFsp_cust_contact_form_add.TypeContactEditButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetTypeContact(self.Owner,TFsp_customer(self.Owner.Owner).WorkDatabase.Handle,fsnormal,TFsp_customer(self.Owner.Owner).ActualDate);
    if VarArrayDimCount(id)>0
    then begin
     if id[0]<>NULL
     then begin
          id_type_contact := id[0];
          typeContactEdit.Text :=id[1];
     end;
   end;


end;

procedure TFsp_cust_contact_form_add.ContactEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then OkButton.SetFocus;
end;

end.
