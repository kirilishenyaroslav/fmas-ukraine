unit uGetPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit,
  cxLabel, ExtCtrls;

type
  TfrmGetPeriod = class(TForm)
    Panel1: TPanel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxDateEditBeg: TcxDateEdit;
    cxDateEditEnd: TcxDateEdit;
    cxButtonClose: TcxButton;
    cxButtonPrint: TcxButton;
    procedure cxButtonPrintClick(Sender: TObject);
    procedure cxButtonCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

procedure TfrmGetPeriod.cxButtonPrintClick(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmGetPeriod.cxButtonCloseClick(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
