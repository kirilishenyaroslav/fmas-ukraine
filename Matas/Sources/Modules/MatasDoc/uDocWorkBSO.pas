unit uDocWorkBSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, ActnList, cxButtons;

type
  TBSOForm = class(TForm)
    lbl1: TLabel;
    lblName: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    cxSeriya: TcxTextEdit;
    cxNumBeg: TcxTextEdit;
    cxNumEnd: TcxTextEdit;
    cxKolDoc: TcxTextEdit;
    cxKolNum: TcxTextEdit;
    cxButton1: TcxButton;
    actlst1: TActionList;
    actSave: TAction;
    procedure actSaveExecute(Sender: TObject);
    procedure cxNumBegKeyPress(Sender: TObject; var Key: Char);
    procedure cxNumEndKeyPress(Sender: TObject; var Key: Char);
    procedure cxNumBegExit(Sender: TObject);
  private
    { Private declarations }
  public
    kol_mat:Integer;
    num_beg, num_end:Double;
  end;

var
  BSOForm: TBSOForm;

implementation

{$R *.dfm}

procedure TBSOForm.actSaveExecute(Sender: TObject);
begin
  if cxNumBeg.Text = '' then begin ShowMessage('Заповніть початковий номер!'); Exit; end;
  ModalResult:=mrOk;
end;

procedure TBSOForm.cxNumBegKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9', #8]) then
begin
 key:=#0;
 beep;
end;
end;

procedure TBSOForm.cxNumEndKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9', #8]) then
begin
 key:=#0;
 beep;
end;
end;

procedure TBSOForm.cxNumBegExit(Sender: TObject);
begin
 num_beg:=StrToFLoat(cxNumBeg.Text);
 num_end:=num_beg+kol_mat-1;
 cxNumEnd.Text:=FloatToStr(num_end);
end;

end.
