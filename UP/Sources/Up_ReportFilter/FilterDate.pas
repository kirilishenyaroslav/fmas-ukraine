unit FilterDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxControls, cxContainer, cxEdit, cxLabel, StdCtrls,
  cxButtons, ComCtrls;

type
  TfrmFilterDate = class(TForm)
    StatusBar1: TStatusBar;
    cxButtonEnter: TcxButton;
    cxButtonCancel: TcxButton;
    GroupBox1: TGroupBox;
    cxLabel1: TcxLabel;
    cxDateEditbegin: TcxDateEdit;
    procedure cxButtonCancelClick(Sender: TObject);
    procedure cxButtonEnterClick(Sender: TObject);
  private
    { Private declarations }
  public
    function GetPeriod():Variant;   
    { Public declarations }
  end;

var
  frmFilterDate: TfrmFilterDate;
  Result:Variant;
implementation

{$R *.dfm}

procedure TfrmFilterDate.cxButtonCancelClick(Sender: TObject);
begin
  result:=null;
  Close;
end;


function TfrmFilterDate.GetPeriod():Variant;
begin
   cxDateEditbegin.Date:=Date;
   ShowModal;
   GetPeriod:=Result;
end;

procedure TfrmFilterDate.cxButtonEnterClick(Sender: TObject);
begin
  Result:=VarArrayCreate([0,1],varVariant);
  Result[0]:=VarArrayOf([cxDateEditbegin.Date]);
  close;
end;

end.
