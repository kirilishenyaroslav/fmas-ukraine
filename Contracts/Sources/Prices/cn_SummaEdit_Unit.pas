unit cn_SummaEdit_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxCurrencyEdit, StdCtrls, cxButtons, ActnList, CnConsts;

type
  TfrmSummaEdit = class(TForm)
    btnOk: TcxButton;
    btnClose: TcxButton;
    curEdit: TcxCurrencyEdit;
    ActionList1: TActionList;
    ButtonYes: TAction;
    ButtonNo: TAction;
    procedure FormShow(Sender: TObject);
    procedure curEditKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonYesExecute(Sender: TObject);
    procedure ButtonNoExecute(Sender: TObject);
  private
    { Private declarations }
  public
   PLanguageIndex:integer;
    { Public declarations }
  end;

var
  frmSummaEdit: TfrmSummaEdit;

implementation

{$R *.dfm}

procedure TfrmSummaEdit.FormShow(Sender: TObject);
begin
curEdit.SetFocus;
end;

procedure TfrmSummaEdit.curEditKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then btnOk.SetFocus;
end;

procedure TfrmSummaEdit.ButtonYesExecute(Sender: TObject);
begin
  if ((curEdit.Text = '') or (curEdit.Value = 0)) then
  begin
    ShowMessage(cn_summ_prices_Need[PLanguageIndex]);
    curEdit.SetFocus;
    Exit;
  end;
 ModalResult := mrOk;
end;

procedure TfrmSummaEdit.ButtonNoExecute(Sender: TObject);
begin
  Close;
end;

end.
