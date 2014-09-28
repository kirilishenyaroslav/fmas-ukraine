unit UCustomEditSaldo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalc;

type
  TfrmCustomEditSaldo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    EditDBSaldo: TcxCalcEdit;
    EditKrSaldo: TcxCalcEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCustomEditSaldo: TfrmCustomEditSaldo;

implementation

{$R *.dfm}

procedure TfrmCustomEditSaldo.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmCustomEditSaldo.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
