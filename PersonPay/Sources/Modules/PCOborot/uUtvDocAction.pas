unit uUtvDocAction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TUtvForm = class(TForm)
    cxWitoutChange: TcxButton;
    cxProv: TcxButton;
    cxClose: TcxButton;
    procedure cxWitoutChangeClick(Sender: TObject);
    procedure cxProvClick(Sender: TObject);
    procedure cxCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    podtv:Integer;
  end;

var
  UtvForm: TUtvForm;

implementation

{$R *.dfm}

procedure TUtvForm.cxWitoutChangeClick(Sender: TObject);
begin
 podtv:=0;
 ModalResult:=mrOk;
end;

procedure TUtvForm.cxProvClick(Sender: TObject);
begin
 podtv:=1;
 ModalResult:=mrOk;
end;

procedure TUtvForm.cxCloseClick(Sender: TObject);
begin
Close;
end;

end.
