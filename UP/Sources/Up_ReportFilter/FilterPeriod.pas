unit FilterPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ComCtrls,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls,
  cxContainer, cxEdit, cxLabel;

type
  TfrmPeriod = class(TForm)
    StatusBar1: TStatusBar;
    cxButtonEnter: TcxButton;
    cxButtonCancel: TcxButton;
    GroupBox1: TGroupBox;
    cxLabel1: TcxLabel;
    cxDateEditbegin: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxDateEditEnd: TcxDateEdit;
    procedure cxButtonCancelClick(Sender: TObject);
    procedure cxButtonEnterClick(Sender: TObject);
  private
    { Private declarations }
  public
    function GetPeriod():Variant; 
    { Public declarations }
  end;

var
  frmPeriod: TfrmPeriod;
  Result:Variant;
implementation

{$R *.dfm}

procedure TfrmPeriod.cxButtonCancelClick(Sender: TObject);
begin
  result:=null;
  Close;
end;

function TfrmPeriod.GetPeriod():Variant;
begin
   cxDateEditbegin.Date:=Date;
   cxDateEditEnd.Date:=date;
   ShowModal;
   GetPeriod:=Result;
end;

procedure TfrmPeriod.cxButtonEnterClick(Sender: TObject);
begin
  Result:=VarArrayCreate([0,1],varVariant);
  Result[0]:=VarArrayOf([cxDateEditbegin.Date]);
  Result[1]:=VarArrayOf([cxDateEditEnd.Date]);
  close;
end;

end.
