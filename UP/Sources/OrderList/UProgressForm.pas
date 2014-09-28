unit UProgressForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmProcessPanel = class(TForm)
    ProcessPanel: TPanel;
    lbl1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcessPanel: TfrmProcessPanel;

implementation

{$R *.dfm}

end.
