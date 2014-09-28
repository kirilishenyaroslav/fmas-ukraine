unit uUserRasch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxRadioGroup;

type
  TUserRashForm = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    cxRBUser: TcxRadioButton;
    cxRBSys: TcxRadioButton;
    cxOk: TcxButton;
    cxButton1: TcxButton;
    procedure cxOkClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UserRashForm: TUserRashForm;

implementation

{$R *.dfm}

procedure TUserRashForm.cxOkClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TUserRashForm.cxButton1Click(Sender: TObject);
begin
Close;
end;

end.
