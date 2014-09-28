unit UEditDefPer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc, cxButtons,
  ExtCtrls;

type
  TfrmEditDef = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxCalcEdit1: TcxCalcEdit;
    cxCalcEdit2: TcxCalcEdit;
    cxCalcEdit3: TcxCalcEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

procedure TfrmEditDef.cxButton1Click(Sender: TObject);
begin
     ModalResult:=MrYes;
end;

procedure TfrmEditDef.cxButton2Click(Sender: TObject);
begin
     ModalResult:=MrNo;
end;

end.
