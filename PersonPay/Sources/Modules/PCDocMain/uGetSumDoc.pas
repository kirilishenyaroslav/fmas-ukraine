unit uGetSumDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, ActnList, Menus;

type
  TGetSumForm = class(TForm)
    lbl1: TLabel;
    cxSumma: TcxCurrencyEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    actlst1: TActionList;
    act1: TAction;
    procedure act1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GetSumForm: TGetSumForm;

implementation

{$R *.dfm}

procedure TGetSumForm.act1Execute(Sender: TObject);
begin
ModalResult:=mrOk;
end;

end.
