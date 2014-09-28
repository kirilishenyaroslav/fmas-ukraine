unit sp_place_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxLookAndFeelPainters, cxButtons, cxCheckBox,GlobalSPR, Variants,
  ExtCtrls;

type
  TFsp_place_form_add = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    TypeEdit: TcxButtonEdit;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    FullNameEdit: TcxTextEdit;
    CapitalCheck: TcxCheckBox;
    RegionCheck: TcxCheckBox;
    DistrictCheck: TcxCheckBox;
    Bevel1: TBevel;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TypeEditButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure FullNameEditKeyPress(Sender: TObject; var Key: Char);
  public
    id_type_place : integer;
  end;


implementation
uses BaseTypes,sp_place_FORM;
{$R *.DFM}

procedure TFsp_place_form_add.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TFsp_place_form_add.OKButtonClick(Sender: TObject);
begin
 if FullNameEdit.Text = '' then begin
  agShowMessage('Необхідно ввести назву.');
  exit;
 end;
 if TypeEdit.Text = '' then begin
  agShowMessage('Необхідно ввести тип.');
  exit;
 end;
 ModalResult := mrOK;
end;

procedure TFsp_place_form_add.FormShow(Sender: TObject);
begin
 FullNameEdit.SetFocus;
end;

procedure TFsp_place_form_add.TypeEditButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetIniTypePlace(self.Owner, TFsp_place(self.Owner).WorkDatabase.Handle,fsnormal, TFsp_place(self.Owner).ActualDate);
    if VarArrayDimCount(id)>0
    then begin
     if id[0]<>NULL
     then begin
            id_type_place := id[0];
            TypeEdit.Text  := id[1];
     end;
   end;
end;

procedure TFsp_place_form_add.FullNameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then OKButton.SetFocus;
end;

end.
