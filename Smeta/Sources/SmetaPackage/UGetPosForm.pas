unit UGetPosForm;

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
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    code: string;
    title: string;
  end;


implementation

{$R *.dfm}

procedure TfrmGetPosForm.cxButton1Click(Sender: TObject);
var
  i: integer;
begin
    title:=trim(EdTitle.text);
    if Length(EdTitle.Text)>0 then
    begin
        if title[1] in ['I','i','²','³'] then title[1]:='%'            // English and Ukraine characters
        else title:='%'+title;
        if title[Length(title)] in ['I','i','²','³'] then title[Length(title)]:='%'
        else title:=title+'%';
    end;
    ModalResult:=mrYes;
end;

procedure TfrmGetPosForm.cxButton2Click(Sender: TObject);
begin
    ModalResult:=mrNo;
end;

procedure TfrmGetPosForm.CheckTitleClick(Sender: TObject);
begin
    if CheckTitle.Checked then
    begin
        EdTitle.Enabled:=true;
        EdTitle.SetFocus;
        EdCode.Enabled:=false;
    end else begin
        EdTitle.Enabled:=false;
        EdCode.Enabled:=true;
        EdCode.SetFocus;
    end;
end;

procedure TfrmGetPosForm.CheckCodeClick(Sender: TObject);
begin
    if CheckCode.Checked then
    begin
        EdTitle.Enabled:=false;
        EdCode.Enabled:=true;
        EdCode.SetFocus;
    end else begin
        EdTitle.Enabled:=true;
        EdCode.Enabled:=false;
        EdTitle.SetFocus;
    end;
end;

procedure TfrmGetPosForm.FormShow(Sender: TObject);
begin
    if CheckCode.Checked=true then EdCode.SetFocus
    else EdTitle.SetFocus;
end;

end.
