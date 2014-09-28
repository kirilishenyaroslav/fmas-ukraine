unit Un_Progress_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  Animate, GIFCtrl;

type
  TFormCreatStyle = (find_, delete_, wait_, copy_);


  TfmUn_Progress_form = class(TForm)
    Panel1: TPanel;
    Animate1: TAnimate;
    cxLabel1: TcxLabel;
    RxGIFAnimator1: TRxGIFAnimator;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
  public
    constructor Create(AOwner: TComponent; style_zapusc : TFormCreatStyle; text : string); reintroduce; overload;
  end;

implementation

{$R *.dfm}

{ TfmProgressFormBank }

constructor TfmUn_Progress_form.Create(AOwner: TComponent;
  style_zapusc: TFormCreatStyle; text : string);
begin
    inherited Create (AOwner);

    cxLabel1.Caption := text;

    if style_zapusc = find_ then
    begin
        RxGIFAnimator1.Visible := true;
        RxGIFAnimator1.Animate := true;
        Animate1.Visible       := false;
//        Animate1.CommonAVI := aviFindFile;
//        Animate1.Active    := true;
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

procedure TfmUn_Progress_form.Timer1Timer(Sender: TObject);
begin
    Update;
    Refresh;
    Application.ProcessMessages;
end;

end.
