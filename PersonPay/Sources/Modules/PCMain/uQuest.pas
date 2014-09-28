unit uQuest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxGIF, ExtCtrls, StdCtrls, cxLookAndFeelPainters, cxButtons;

type
  TQuestForm = class(TForm)
    lbl1: TLabel;
    img1: TImage;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    lbl2: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QuestForm: TQuestForm;

implementation

{$R *.dfm}

procedure TQuestForm.cxButton1Click(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TQuestForm.cxButton2Click(Sender: TObject);
begin
Close;
end;

end.
