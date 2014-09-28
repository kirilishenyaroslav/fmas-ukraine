unit UP_CertificateDateEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, Buttons, ExtCtrls, cxLabel, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfrmDateChange = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ActionList1: TActionList;
    ok_date: TAction;
    cancel_date: TAction;
    DateBeg: TcxDateEdit;
    DateEnd: TcxDateEdit;
    Date_Beg: TcxLabel;
    Date_End: TcxLabel;
    DateVidachi: TcxDateEdit;
    Date_Vidachi: TcxLabel;
    procedure ok_dateExecute(Sender: TObject);
    procedure cancel_dateExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDateChange: TfrmDateChange;

implementation
 uses UP_uCertificateFrame;
{$R *.dfm}

procedure TfrmDateChange.ok_dateExecute(Sender: TObject);
begin
    MoDalResult:=mrOk;
end;

procedure TfrmDateChange.cancel_dateExecute(Sender: TObject);
begin
    MoDalResult:=mrCancel;
end;

end.
