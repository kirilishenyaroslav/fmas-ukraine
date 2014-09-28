unit uSchInv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, Buttons;

type
  TInvMna = class(TForm)
    OK: TBitBtn;
    CANCEL: TBitBtn;
    ActionList1: TActionList;
    acOk: TAction;
    acCansel: TAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InvMna: TInvMna;

implementation

{$R *.dfm}

end.
