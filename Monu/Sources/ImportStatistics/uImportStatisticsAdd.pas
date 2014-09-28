unit uImportStatisticsAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit;

type
  TfrmAdd = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxTextEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    Edits : array of TcxTextEdit;
  end;

var
  frmAdd: TfrmAdd;

implementation

{$R *.dfm}

procedure TfrmAdd.cxButton2Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmAdd.cxButton1Click(Sender: TObject);
begin
 ModalResult := mrOk;
end;

procedure TfrmAdd.FormShow(Sender: TObject);
begin
  edits[0].SetFocus;
// TcxTextEdit(Components[1]).SetFocus;
end;

procedure TfrmAdd.cxTextEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
 i : integer;
begin
 if Key = VK_RETURN then
 begin
   i := TcxTextEdit(Sender).Tag + 1;
   if i < Length(Edits) then Edits[i].SetFocus else cxButton1.SetFocus;
   Key := 0;
 end;
end;

end.
