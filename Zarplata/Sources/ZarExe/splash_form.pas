unit splash_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, jpeg, cxControls, cxContainer,
  cxEdit, cxLabel, UnitZarplataConsts;

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
begin
   lbSystem.Caption := TZSplash_Form_Label_System_Caption;
   lbRights.Caption := TZSplash_Form_Label_Rights_Caption;
   lbVersion.Caption:= TZSplash_Form_Label_Version_Caption;
   SetWindowlong(Handle,GWL_STYLE,GetWindowLong(Handle,GWL_STYLE) and WS_POPUP AND WS_BORDER);
end;

end.
