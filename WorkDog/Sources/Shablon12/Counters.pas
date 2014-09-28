unit Counters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit, StdCtrls, cxLookAndFeelPainters, cxButtons;

type
  TCountersAdd = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CurEdit: TcxCurrencyEdit;
    OldEdit: TcxCurrencyEdit;
    Label4: TLabel;
    CountEdit: TcxCurrencyEdit;
    Shape1: TShape;
    SumEdit: TcxCurrencyEdit;
    Label6: TLabel;
    Bevel1: TBevel;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CountersAdd: TCountersAdd;

implementation

{$R *.dfm}

end.
