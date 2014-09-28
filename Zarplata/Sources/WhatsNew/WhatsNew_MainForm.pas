unit WhatsNew_MainForm;

interface

uses
  Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, cxButtons, ComCtrls,
  cxLookAndFeelPainters, zProc, Unit_zGlobal_Consts;

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
 PLanguageIndex := LanguageIndex;

 btnOK.Caption := ExitBtn_Caption[PLanguageIndex];
 Caption := WhatsNew_Caption[PLanguageIndex];
 lbCompanyName.Caption := DonNU_Name_Full[PLanguageIndex];
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
