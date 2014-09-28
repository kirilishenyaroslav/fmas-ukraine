unit DateCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  ComCtrls;

type
  TfrmDateCheck = class(TForm)
    cxDateEditCheckDate: TcxDateEdit;
    cxButtonOk: TcxButton;
    procedure cxButtonOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    function Check(InDate:TDateTime):TDateTime;
    { Public declarations }
  end;

var
  frmDateCheck: TfrmDateCheck;

implementation

{$R *.dfm}

function TfrmDateCheck.Check(InDate:TDateTime):TDateTime;
begin
cxDateEditCheckDate.Date:=InDate;
ShowModal;
Check:=cxDateEditCheckDate.Date;
end;

procedure TfrmDateCheck.cxButtonOkClick(Sender: TObject);
begin
  Close;
end;

end.
