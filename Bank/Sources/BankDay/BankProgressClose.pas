unit BankProgressClose;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxControls, cxContainer, cxEdit, cxLabel;

type
  TfmBankProgressClose = class(TForm)
    Animate1: TAnimate;
    cxLabel1: TcxLabel;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; text : string); reintroduce; overload;
  end;


implementation

{$R *.dfm}

{ TfmBankProgressClose }

constructor TfmBankProgressClose.Create(AOwner: TComponent; text: string);
begin
    inherited Create (AOwner);

    cxLabel1.Caption := text;
    Animate1.CommonAVI := aviFindFile;
    Animate1.Active    := true;
end;

end.
