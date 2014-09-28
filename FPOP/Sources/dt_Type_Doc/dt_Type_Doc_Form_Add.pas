unit dt_Type_Doc_Form_Add;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  Tdt_Type_Doc_Form_Add1 = class(TForm)
    Label1: TLabel;
    Name_Type_Doc: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dt_Type_Doc_Form_Add1    : Tdt_Type_Doc_Form_Add1;
implementation

{$R *.DFM}

procedure Tdt_Type_Doc_Form_Add1.Button1Click(Sender: TObject);
begin
 if Name_Type_Doc.Text = '' then begin
  ShowMessage('Ви не ввели назву групи продукції');
  Exit;
 end;
 ModalResult := mrOk;
end;

procedure Tdt_Type_Doc_Form_Add1.Button2Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

end.
