unit TimeNormAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, cxClasses, cxStyles,
  cxGridTableView;

type
  TfrmTimeNormAdd = class(TForm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxBYES: TcxButton;
    cxBCancel: TcxButton;
    Styles: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxLabel3: TcxLabel;
    procedure cxBCancelClick(Sender: TObject);
    procedure cxTextEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxBYESClick(Sender: TObject);
  private
  public
  end;

var
  frmTimeNormAdd: TfrmTimeNormAdd;

implementation

{$R *.dfm}

procedure TfrmTimeNormAdd.cxTextEdit2KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0'..'9', #8, #46]) then
    begin
        Key := #0;
        Beep;
    end;
end;

procedure TfrmTimeNormAdd.cxBCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmTimeNormAdd.cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then
    begin
        Key := #0;
        Beep;
    end;
end;

procedure TfrmTimeNormAdd.cxBYESClick(Sender: TObject);
var
  t: Single;
begin
    if tryStrToFloat(cxTextEdit2.Text,t)
    then ModalResult:=mrYes
    else ModalResult:=mrNo;
end;

end.
