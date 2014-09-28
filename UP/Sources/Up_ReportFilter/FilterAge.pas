unit FilterAge;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxControls, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, ComCtrls;

type
  TfrmFilterAge = class(TForm)
    StatusBar1: TStatusBar;
    cxButtonEnter: TcxButton;
    cxButtonCancel: TcxButton;
    GroupBox1: TGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxSpinEditBegin: TcxSpinEdit;
    cxSpinEditEnd: TcxSpinEdit;
    procedure cxButtonCancelClick(Sender: TObject);
    procedure cxButtonEnterClick(Sender: TObject);
  private
    { Private declarations }
  public
    function GetAge():Variant; 
    { Public declarations }
  end;

var
  frmFilterAge: TfrmFilterAge;
  Result:Variant;
implementation

{$R *.dfm}

procedure TfrmFilterAge.cxButtonCancelClick(Sender: TObject);
begin
  result:=null;
  Close;
end;

function TfrmFilterAge.GetAge():Variant;
begin
   ShowModal;
   GetAge:=Result;
end;

procedure TfrmFilterAge.cxButtonEnterClick(Sender: TObject);
begin
  Result:=VarArrayCreate([0,1],varVariant);
  Result[0]:=VarArrayOf([cxSpinEditBegin.Value]);
  Result[1]:=VarArrayOf([cxSpinEditEnd.Value]);
  close;
end;

end.
