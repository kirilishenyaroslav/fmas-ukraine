unit UO_WhatsNew_MainForm;

interface

uses
  Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, cxButtons, ComCtrls,
  cxLookAndFeelPainters, uUO_Resources, uUO_Constants;

//const FileName='UO_Whats_New.txt';

type
  TFWhatsNew = class(TForm)
    btnOK: TcxButton;
    bvBottom: TBevel;
    MemoInfo: TRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
  private
    PLanguageIndex:byte;
  public
    constructor Create(AOwner:TComponent;FileName:string);reintroduce;
  end;

implementation

uses SysUtils;

{$R *.dfm}

constructor TFWhatsNew.Create(AOwner:TComponent;FileName:string);
begin
 inherited Create(AOwner);
 PLanguageIndex:=SelectLanguage;
 MemoInfo.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+FileName);

 btnOK.Caption := nActionExit[PLanguageIndex];
 Caption := nFormWhatsNew_Caption[PLanguageIndex];
end;

procedure TFWhatsNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFWhatsNew.btnOKClick(Sender: TObject);
begin
  Close;
end;

end.
