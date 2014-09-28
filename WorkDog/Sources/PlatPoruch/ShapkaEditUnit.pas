unit ShapkaEditUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMemo;

type
  TShapkaEditForm = class(TForm)
    cxMemo1: TcxMemo;
    cxButton3: TcxButton;
    OKButton: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ShapkaEditForm: TShapkaEditForm;

implementation

{$R *.dfm}

end.
