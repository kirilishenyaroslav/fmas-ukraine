unit NeosnovniePerSum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc,
  cxLabel;

type
  TfmNeosnovniePerSum = class(TForm)
    cxCalcEdit1: TcxCalcEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel1: TcxLabel;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxCalcEdit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Sel_Sum_Neosn(var s : Currency) : boolean;

implementation
uses Un_R_file_Alex;
{$R *.dfm}

function Sel_Sum_Neosn(var s : Currency) : boolean;
var
    T : TfmNeosnovniePerSum;
begin
    T := TfmNeosnovniePerSum.Create(nil);
    T.Caption           := Un_R_file_Alex.J4_PERSENT_CAPTION;
    T.cxButton1.Caption := Un_R_file_Alex.MY_BUTTON_OK_CONST;
    T.cxButton2.Caption := Un_R_file_Alex.MY_ACTION_CLOSE_VIH;
    T.cxLabel1.Caption  := Un_R_file_Alex.J4_NEOSNOV_PERSEND;
    T.cxCalcEdit1.Value := s;
    if T.Showmodal = mrOk then
    begin
        s := T.cxCalcEdit1.Value;
        Result := true;
    end else
        Result := false;
    T.Free;
end;

procedure TfmNeosnovniePerSum.cxButton2Click(Sender: TObject);
begin
    Close;
end;

procedure TfmNeosnovniePerSum.cxButton1Click(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfmNeosnovniePerSum.cxCalcEdit1Click(Sender: TObject);
begin
    cxCalcEdit1.Value := StrToCurr(cxCalcEdit1.Text);
end;

end.
