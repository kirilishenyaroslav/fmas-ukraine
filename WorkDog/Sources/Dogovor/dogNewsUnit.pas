unit dogNewsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, OleCtrls, SHDocVw;

type
  TdogNewsForm = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxMemo1: TcxMemo;
    WebBrowser1: TWebBrowser;
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel1Resize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dogNewsForm: TdogNewsForm;

implementation

{$R *.dfm}

procedure TdogNewsForm.cxButton1Click(Sender: TObject);
begin
 Close;
end;

procedure TdogNewsForm.FormCreate(Sender: TObject);
var
 file_path:string;
begin

 if FileExists(ExtractFilePath(Application.ExeName) + 'DOG_Whats_New.txt') then cxMemo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'DOG_Whats_New.txt');

 file_path:=ExtractFilePath(Application.ExeName)+'whatsnew.htm';

 if FileExists(file_path) then
 begin
  WebBrowser1.Navigate(file_path);
 end;


end;

procedure TdogNewsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// Action := caFree;
end;

procedure TdogNewsForm.Panel1Resize(Sender: TObject);
begin
 cxButton1.Left := Panel1.Width - cxButton1.Width - 8;
end;

end.
