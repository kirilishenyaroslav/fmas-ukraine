unit uSumDocVal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, cxRadioGroup,
  cxMaskEdit, cxButtonEdit;

type
  TSumDocValForm = class(TForm)
    lbl1: TLabel;
    cxSumma: TcxCurrencyEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    actlst1: TActionList;
    act1: TAction;
    act2: TAction;
    cxRB_VAL: TcxRadioButton;
    cxRB_GRN: TcxRadioButton;
    lblVal: TLabel;
    lblKurs: TLabel;
    procedure act1Execute(Sender: TObject);
    procedure act2Execute(Sender: TObject);
    procedure cxRB_VALClick(Sender: TObject);
    procedure cxRB_GRNClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SumDocValForm: TSumDocValForm;

implementation

{$R *.dfm}
procedure TSumDocValForm.act1Execute(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TSumDocValForm.act2Execute(Sender: TObject);
begin
Close;
end;

procedure TSumDocValForm.cxRB_VALClick(Sender: TObject);
begin
  lblVal.Visible:=True;
  lblKurs.Visible:=True;
end;

procedure TSumDocValForm.cxRB_GRNClick(Sender: TObject);
begin
  lblVal.Visible:=False;
  lblKurs.Visible:=False;
end;

end.
