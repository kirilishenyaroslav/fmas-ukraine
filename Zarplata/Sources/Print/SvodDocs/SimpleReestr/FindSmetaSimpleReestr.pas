unit FindSmetaSimpleReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxMaskEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxRadioGroup,
  ActnList;

type
  TfrmGetPosForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    CheckCode: TcxRadioButton;
    CheckTitle: TcxRadioButton;
    EdTitle: TcxTextEdit;
    EdCode: TcxMaskEdit;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure CheckTitleClick(Sender: TObject);
    procedure CheckCodeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdCodeEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TfrmGetPosForm.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmGetPosForm.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmGetPosForm.CheckTitleClick(Sender: TObject);
begin
     if CheckTitle.Checked
     then begin
               EdTitle.Enabled:=true;
               EdTitle.SetFocus;
               EdCode.Enabled:=false;

     end
     else begin
               EdTitle.Enabled:=false;
               EdCode.Enabled:=true;
               EdCode.SetFocus;
     end;
end;

procedure TfrmGetPosForm.CheckCodeClick(Sender: TObject);
begin
     if CheckCode.Checked
     then begin
               EdTitle.Enabled:=false;
               EdCode.Enabled:=true;
               EdCode.SetFocus;
     end
     else begin
               EdTitle.Enabled:=true;
               EdCode.Enabled:=false;
               EdTitle.SetFocus;
     end;

end;

procedure TfrmGetPosForm.FormCreate(Sender: TObject);
begin
try
     EdCode.SelStart:=0;
     EdCode.SetFocus;
except on exception do begin end     
end;
end;

procedure TfrmGetPosForm.EdCodeEnter(Sender: TObject);
begin
     EdCode.SelStart:=0;
end;

end.
