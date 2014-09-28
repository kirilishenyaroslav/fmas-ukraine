unit uAddModifForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxMemDS;

type
  TAddModifForm = class(TForm)
  private
    { Private declarations }
  public
    DBHandle: integer;
    AddParametrs : TRxMemoryData;
  end;

var
  AddModifForm: TAddModifForm;

implementation

{$R *.dfm}

end.
