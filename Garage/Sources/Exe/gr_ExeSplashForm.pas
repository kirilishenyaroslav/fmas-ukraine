unit gr_ExeSplashForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, jpeg, cxControls, cxContainer,
  cxEdit, cxLabel, gr_uCommonConsts, gr_uCommonProc;

type
  Tsplash = class(TForm)
    Bevel1: TBevel;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    lbVersion: TLabel;
    PanellbSystem: TPanel;
    lbSystem: TLabel;
    lbRights: TLabel;
    Bevel2: TBevel;
    lbProcess: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  splash: Tsplash;

implementation

{$R *.dfm}

procedure Tsplash.FormCreate(Sender: TObject);
var CurrentLanguageIndex:byte;
begin
   CurrentLanguageIndex := IndexLanguage;
   lbSystem.Caption := SystemLabel_Caption[CurrentLanguageIndex];
   lbRights.Caption := RightsLabel_Caption[CurrentLanguageIndex];
   lbVersion.Caption:= VersionLabel_Caption[CurrentLanguageIndex];
   SetWindowlong(Handle,GWL_STYLE,GetWindowLong(Handle,GWL_STYLE) and WS_POPUP AND WS_BORDER);
end;

end.
