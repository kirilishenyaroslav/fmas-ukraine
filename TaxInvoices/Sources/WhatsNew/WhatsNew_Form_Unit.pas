unit WhatsNew_Form_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls;

type
  TWhatsNewForm = class(TForm)
    Bevel1: TBevel;
    MemoInfo: TMemo;
    Bevel2: TBevel;
    Label1: TLabel;
    cxButton1: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;FileName:string);reintroduce;
  end;

var
  WhatsNewForm: TWhatsNewForm;

implementation

{$R *.dfm}
constructor TWhatsNewForm.Create(AOwner:TComponent;FileName:string);
begin
 inherited Create(AOwner);
 MemoInfo.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+FileName);
end;

procedure TWhatsNewForm.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TWhatsNewForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
