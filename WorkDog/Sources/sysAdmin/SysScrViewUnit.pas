unit SysScrViewUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, JPEG;

type
  TfrmScrView = class(TForm)
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    cxButton1: TcxButton;
    Image1: TImage;
    cxButton2: TcxButton;
    SaveDialog1: TSaveDialog;
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmScrView: TfrmScrView;

implementation

{$R *.dfm}

procedure TfrmScrView.cxButton1Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmScrView.FormCreate(Sender: TObject);
begin
{ Width  := Screen.Width - 20;
 Height := Screen.Height - 40;
 Left   := Screen.Width div 2 - Width div 2;
 Top    := Screen.Height div 2 - Height div 2;}
end;

procedure TfrmScrView.cxButton2Click(Sender: TObject);
var
 jpg : TJPEGImage;
begin
 if not SaveDialog1.Execute then Exit;
 jpg := TJPEGImage.Create;
 jpg.Assign(Image1.Picture.Bitmap);
 jpg.CompressionQuality := 90;
 jpg.SaveToFile(SaveDialog1.FileName);
 jpg.Free;
end;

end.
