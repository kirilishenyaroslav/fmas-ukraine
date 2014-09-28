unit ReeFnzbFlt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, ExtCtrls,
  cxCheckBox;

type
  TFnzbFormFlt = class(TForm)
    grp1: TGroupBox;
    pnl1: TPanel;
    btn1: TButton;
    btn2: TButton;
    RegNumEdit: TcxTextEdit;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    NumEdit: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxCheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FnzbFormFlt: TFnzbFormFlt;

implementation

{$R *.dfm}


procedure TFnzbFormFlt.FormCreate(Sender: TObject);
begin
  RegNumEdit.Enabled:=False;
  RegNumEdit.Text:='';
  NumEdit.Enabled:=False;
  NumEdit.Text:='';
end;

procedure TFnzbFormFlt.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFnzbFormFlt.btn2Click(Sender: TObject);
begin
  RegNumEdit.Text:='';
  NumEdit.Text:='';
  ModalResult := mrCancel;
end;

procedure TFnzbFormFlt.cxCheckBox1Click(Sender: TObject);
begin
   RegNumEdit.Enabled:=cxCheckBox1.Checked;
   if Visible then if RegNumEdit.Enabled then RegNumEdit.SetFocus;
end;

procedure TFnzbFormFlt.cxCheckBox2Click(Sender: TObject);
begin
  NumEdit.Enabled:=cxCheckBox2.Checked;
   if Visible then if NumEdit.Enabled then NumEdit.SetFocus;
end;

end.
