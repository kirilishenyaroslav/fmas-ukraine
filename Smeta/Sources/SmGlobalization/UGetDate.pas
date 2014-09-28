unit UGetDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TfrmGetDate = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxDateEdit1: TcxDateEdit;
    Label1: TLabel;
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

procedure TfrmGetDate.cxButton1Click(Sender: TObject);
begin
      ModalResult:=mrYes;
end;

procedure TfrmGetDate.cxButton2Click(Sender: TObject);
begin
      ModalResult:=mrNo;
end;

procedure TfrmGetDate.FormCreate(Sender: TObject);
begin
      cxDateEdit1.Date:=Date;
end;

end.
