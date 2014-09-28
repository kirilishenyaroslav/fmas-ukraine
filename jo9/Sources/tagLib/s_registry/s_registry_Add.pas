unit s_registry_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxCheckBox, cxGroupBox, cxControls, cxContainer,
  cxEdit, cxMemo, StdCtrls, cxButtons, ExtCtrls;

type
  Ts_Registry_Add_Form = class(TForm)
    FormShape: TShape;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    Label2: TLabel;
    NameEdit: TcxTextEdit;
    procedure ApplyButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  s_Registry_Add_Form: Ts_Registry_Add_Form;

implementation

{$R *.dfm}

procedure Ts_Registry_Add_Form.ApplyButtonClick(Sender: TObject);
begin
 if (Trim(NameEdit.Text) = '') then begin
   ShowMessage('Введите наименование ключа!');
   Exit;
 end;

 ModalResult := mrOk;
end;

procedure Ts_Registry_Add_Form.CancelButtonClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Ts_Registry_Add_Form.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key=#13 ) then
  begin
    Key:=#0;
    ApplyButton.SetFocus;
  end;
end;

end.
