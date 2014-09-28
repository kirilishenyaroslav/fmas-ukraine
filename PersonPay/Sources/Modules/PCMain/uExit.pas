unit uExit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, cxLookAndFeelPainters, cxButtons;

type
  TExitForm = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    btn1: TcxButton;
    btn2: TcxButton;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
   cls:Boolean;
  end;

var
  ExitForm: TExitForm;

implementation

{$R *.dfm}

procedure TExitForm.btn1Click(Sender: TObject);
begin
 cls:=True;
end;

procedure TExitForm.FormCreate(Sender: TObject);
begin
 cls:=False;
end;

end.
