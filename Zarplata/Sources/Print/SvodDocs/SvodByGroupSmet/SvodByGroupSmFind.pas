
unit SvodByGroupSmFind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxMaskEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxRadioGroup,
  ActnList;

type
  TFSvodByGroupSmFind = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    cxMaskEdit1: TcxMaskEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure CheckTitleClick(Sender: TObject);
    procedure CheckCodeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFSvodByGroupSmFind.cxButton1Click(Sender: TObject);
begin
  modalResult:=mrOk;
end;

procedure TFSvodByGroupSmFind.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TFSvodByGroupSmFind.CheckTitleClick(Sender: TObject);
begin
     {if CheckTitle.Checked
     then begin
               cxMaskEdit1.Enabled:=true;
               cxMaskEdit1.SetFocus;
               EdCode.Enabled:=false;

     end
     else begin
               cxMaskEdit1.Enabled:=false;
               EdCode.Enabled:=true;
               EdCode.SetFocus;
     end;   }
end;

procedure TFSvodByGroupSmFind.CheckCodeClick(Sender: TObject);
begin
   {  if CheckCode.Checked
     then begin
               cxMaskEdit1.Enabled:=false;
               EdCode.Enabled:=true;
               EdCode.SetFocus;
     end
     else begin
               cxMaskEdit1.Enabled:=true;
               EdCode.Enabled:=false;
               cxMaskEdit1.SetFocus;
     end;  }

end;

procedure TFSvodByGroupSmFind.FormShow(Sender: TObject);
begin
  cxMaskEdit1.setFocus;
end;

procedure TFSvodByGroupSmFind.Action1Execute(Sender: TObject);
begin
  if cxButton1.Focused then
    begin
      cxButton1Click(Sender);
      exit;
    end;
  keybd_event(VK_TAB,0,0,0);
end;

end.
