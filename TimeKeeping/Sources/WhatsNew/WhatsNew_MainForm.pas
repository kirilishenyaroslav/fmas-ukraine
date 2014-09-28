unit WhatsNew_MainForm;

interface

uses
  Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, cxButtons, ComCtrls,
  cxLookAndFeelPainters,TuCommonProc;

type
  TFWhatsNew = class(TForm)
    btnOK: TcxButton;
    bvBottom: TBevel;
    lbCompanyName: TLabel;
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
 MemoInfo.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+FileName);

 btnOK.Caption := GetConst('Exit','Button');
 Caption := GetConst('WhatsNew','Form');
 lbCompanyName.Caption := GetConst('DonNU_Name_Full','Label');
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
