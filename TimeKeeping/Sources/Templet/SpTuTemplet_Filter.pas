 unit SpTuTemplet_Filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, cxControls, cxGroupBox,
  StdCtrls, cxButtons, ActnList;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    ButtonYes: TcxButton;
    ButtonCancel: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
  private

  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

end.
