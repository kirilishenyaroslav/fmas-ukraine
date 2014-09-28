unit sp_place_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxLookAndFeelPainters, cxButtons, cxCheckBox;

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
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TypeEditButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure FullNameEditKeyPress(Sender: TObject; var Key: Char);
  public
    id_type_place : integer;
  end;

var
  Fsp_place_form_add: TFsp_place_form_add;

implementation
uses AGBaseTypes, AGCommon, ini_type_place_FORM;
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
    Sprav : Tfini_type_place;
begin
    try
        Sprav := Tfini_type_place.Create(Self);
    except
    end;
    
    Sprav.Initialize(Nil, Nil, Nil, AGCommon_SP_OPTIONS_ALL);

    if Sprav.ShowModal = mrOK then begin
        TypeEdit.Text := Sprav.DataSet['NAME_FULL'];
        id_type_place := Sprav.DataSet['ID_TYPE_PLACE'];
    end;

    Sprav.Free;
end;

procedure TFsp_place_form_add.FullNameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then OKButton.SetFocus;
end;

end.
