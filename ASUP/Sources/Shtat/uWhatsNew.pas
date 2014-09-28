unit uWhatsNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfmWhatsNewForm = class(TForm)
    NewMemo: TMemo;
    Panel1: TPanel;
    CancelButton: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmWhatsNewForm: TfmWhatsNewForm;

implementation

{$R *.dfm}

procedure TfmWhatsNewForm.FormCreate(Sender: TObject);
begin
    NewMemo.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + '\ASUP_Whats_New_VUZ.txt');
end;

procedure TfmWhatsNewForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfmWhatsNewForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

end.
