unit UGetPeriodM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  ExtCtrls;

type
  TfrmGetPeriod = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxDateEdit1: TcxDateEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

procedure TfrmGetPeriod.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mryes;
end;

procedure TfrmGetPeriod.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
begin
     cxDateEdit1.Date:=Date;
end;

end.
