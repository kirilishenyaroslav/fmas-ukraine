unit DogFormRepDataUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfrmRepDate = class(TForm)
    DateBegEdit: TcxDateEdit;
    DateEndEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRepDate: TfrmRepDate;

implementation

{$R *.dfm}

procedure TfrmRepDate.cxButton2Click(Sender: TObject);
begin
 close;
end;

procedure TfrmRepDate.cxButton1Click(Sender: TObject);
begin
 ModalResult := mrOk;
end;

end.
