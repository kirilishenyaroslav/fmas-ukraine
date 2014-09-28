unit ProgressFormKassa; //

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxControls, cxContainer, cxEdit, cxLabel;

type
  TFormCreatStyle = (find_, delete_, wait_, copy_);


  TfmProgressFormKassa = class(TForm)
    Animate1: TAnimate;
    cxLabel1: TcxLabel;
  private
  public
    constructor Create(AOwner: TComponent; style_zapusc : TFormCreatStyle; text : string); reintroduce; overload;
  end;

implementation

{$R *.dfm}

{ TfmProgressFormKassa }

constructor TfmProgressFormKassa.Create(AOwner: TComponent;
  style_zapusc: TFormCreatStyle; text : string);
begin
    inherited Create (AOwner);

    cxLabel1.Caption := text;

    if style_zapusc = find_ then
    begin
        Animate1.CommonAVI := aviFindFile;
        Animate1.Active    := true;
    end;

    if style_zapusc = delete_ then
    begin
        Animate1.CommonAVI := aviDeleteFile;
        Animate1.Active    := true;
    end;

    if style_zapusc = wait_ then
    begin
        Animate1.CommonAVI := aviFindFolder;
        Animate1.Active    := true;
    end;

    if style_zapusc = copy_ then
    begin
        Animate1.CommonAVI := aviCopyFiles;
        Animate1.Active    := true;
    end;
end;

end.
