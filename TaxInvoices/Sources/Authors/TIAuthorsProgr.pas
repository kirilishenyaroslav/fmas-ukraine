unit TIAuthorsProgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, cxControls, cxContainer, cxEdit,
  cxLabel,Ibase;

type
  TTIAuthorsForm = class(TForm)
    LabelProgrammer: TcxLabel;
    LabelPostanov: TcxLabel;
    LabelPeriod: TcxLabel;
    LabelFirm: TcxLabel;
    Bevel1: TBevel;
    AuthorsImage: TImage;
    OkButton: TButton;
    Authorstimer: TTimer;
    procedure OkButtonClick(Sender: TObject);
    procedure AuthorsTimerTimer(Sender: TObject);
  private
    PRes               :Variant;
    PDb_Handle         :TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
    property Res:Variant read PRes;
  end;

var
  TIAuthorsForm: TTIAuthorsForm;

implementation

{$R *.dfm}
constructor TTIAuthorsForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  PDb_Handle           := Db_Handle;
end;

procedure TTIAuthorsForm.OkButtonClick(Sender: TObject);
begin
  AuthorsTimer.Enabled := True;
end;

procedure TTIAuthorsForm.AuthorsTimerTimer(Sender: TObject);
begin
  AlphaBlendValue:=AlphaBlendValue-20;
  if AlphaBlendValue<20 then Close;
end;

end.
