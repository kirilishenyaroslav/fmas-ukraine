unit uSumDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit;

type
  TSumDocForm = class(TForm)
    lbl1: TLabel;
    cxSumma: TcxCurrencyEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    actlst1: TActionList;
    act1: TAction;
    act2: TAction;
    procedure act1Execute(Sender: TObject);
    procedure act2Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SumDocForm: TSumDocForm;

implementation

{$R *.dfm}

procedure TSumDocForm.act1Execute(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TSumDocForm.act2Execute(Sender: TObject);
begin
 Close;
end;

end.
