unit sp_region_FORM_ADD;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
    cxLookAndFeelPainters, cxButtons;

type
    TFsp_region_form_add = class(TForm)
        Label1: TLabel;
        Label2: TLabel;
        TypeEdit: TcxButtonEdit;
        OKButton: TcxButton;
        CancelButton: TcxButton;
        FullNameEdit: TcxTextEdit;
        procedure CancelButtonClick(Sender: TObject);
        procedure OKButtonClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure FullNameEditKeyPress(Sender: TObject; var Key: Char);
        procedure TypeEditButtonClick(Sender: TObject; AbsoluteIndex: Integer);
        procedure TypeEditKeyPress(Sender: TObject; var Key: Char);
    public
        id_type_region: integer;
    end;

var
    Fsp_region_form_add: TFsp_region_form_add;

implementation
uses AGCommon, ini_type_region_FORM, AGBaseTypes;
{$R *.DFM}

procedure TFsp_region_form_add.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TFsp_region_form_add.OKButtonClick(Sender: TObject);
begin
    if FullNameEdit.Text = '' then
    begin
        agShowMessage('Необхідно ввести назву.');
        exit;
    end;
    ModalResult := mrOK;
end;

procedure TFsp_region_form_add.FormShow(Sender: TObject);
begin
    FullNameEdit.SetFocus;
end;

procedure TFsp_region_form_add.FullNameEditKeyPress(Sender: TObject;
    var Key: Char);
begin
    if Key = #13 then OKButton.SetFocus;
end;

procedure TFsp_region_form_add.TypeEditButtonClick(Sender: TObject;
    AbsoluteIndex: Integer);
var
    Sprav: Tfini_type_region;
begin
    try
        Sprav := Tfini_type_region.Create(Self);
    except
    end;

    Sprav.Initialize(nil, nil, nil, AGCommon_SP_OPTIONS_ALL);
    if Sprav.ShowModal = mrOK then
    begin
        TypeEdit.Text := Sprav.DataSet['NAME_FULL'];
        id_type_region := Sprav.DataSet['ID_TYPE_REGION'];
    end;
    Sprav.Free;
end;

procedure TFsp_region_form_add.TypeEditKeyPress(Sender: TObject;
    var Key: Char);
begin
    if Key = #13 then
    begin
        Key := #0;
        OKButton.SetFocus;
    end;
end;

end.

