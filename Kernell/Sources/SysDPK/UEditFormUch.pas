unit UEditFormUch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxRadioGroup, StdCtrls, cxButtons, ExtCtrls;

type
  TfrmEditFormUch = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    WorkGroup: TcxRadioGroup;
    CheckDogGroup: TcxRadioGroup;
    CheckMenGroup: TcxRadioGroup;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

procedure TfrmEditFormUch.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmEditFormUch.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.

