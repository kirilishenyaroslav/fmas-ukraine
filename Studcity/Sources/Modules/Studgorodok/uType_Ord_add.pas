unit uType_Ord_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit;

type
  TfrmType_Ord_add = class(TForm)
    TextEdit_name: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel2: TcxLabel;
    TextEdit_ShortName: TcxTextEdit;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmType_Ord_add: TfrmType_Ord_add;

implementation

{$R *.dfm}

procedure TfrmType_Ord_add.cxButton2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmType_Ord_add.cxButton1Click(Sender: TObject);
begin
  if TextEdit_name.Text = '' then
   begin
    ShowMessage('Необхідно заповнити найменування!');
    Exit;
   end;

  if TextEdit_ShortName.Text = '' then
   begin
    ShowMessage('Необхідно заповнити скорочене найменування!');
    Exit;
   end;

  ModalResult := mrOk; 
end;

end.
