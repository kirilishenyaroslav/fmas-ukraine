unit AvanceInputSumma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, cxLabel, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, Un_R_file_Alex;

type
  TfmAvanceInputSumma = class(TForm)
    cxTextEditSumma: TcxTextEdit;
    cxButtonClose: TcxButton;
    cxButtonTake: TcxButton;
    ActionList1: TActionList;
    cxLabel1: TcxLabel;
    ActionTake: TAction;
    ActionClose: TAction;
    cxLabel2: TcxLabel;
    procedure cxTextEditSummaKeyPress(Sender: TObject; var Key: Char);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionTakeExecute(Sender: TObject);
    procedure LoadCaption;
    procedure cxTextEditSummaExit(Sender: TObject);
  private

  public
  end;
function Show_Summa_Avance(var summa : double; TEXT : STRING):boolean;


implementation
uses Un_func_file_Alex;

{$R *.dfm}

function Show_Summa_Avance(var summa : double; TEXT : STRING):boolean;
var
    T : TfmAvanceInputSumma;
    pr : integer;
begin
    DecimalSeparator := ',';
    T := TfmAvanceInputSumma.Create(nil);
//    T.cxLabel3.Caption  := Text;
    pr := 0;
    T.cxTextEditSumma.Text  := Un_func_file_Alex.AddNol(FloatToStr(summa), pr);
    T.LoadCaption;
    if T.ShowModal=mrOk then
    begin
        Summa := StrToFloat(T.cxTextEditSumma.Text);
        Result := true;
    end else
    begin
        Result := false;
    end;
    T.Free;
end;


{ TfmAvanceInputSumma }

procedure TfmAvanceInputSumma.cxTextEditSummaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if cxTextEditSumma.Text = '0,00' then cxTextEditSumma.Text := '';

    if Key = '.' then Key := DecimalSeparator;

    if (Key = '-') and (Length(cxTextEditSumma.Text)>0)
    then Key := Chr(0);

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
        and (Key <> '-')
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEditSumma.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditSumma.Text) - Pos(DecimalSeparator, cxTextEditSumma.Text) > 1) and (Pos(DecimalSeparator,cxTextEditSumma.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
end;

procedure TfmAvanceInputSumma.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmAvanceInputSumma.ActionTakeExecute(Sender: TObject);
var
    pr : integer;
begin
{    if StrToFloat(cxTextEditSumma.Text) = 0 then
    begin
        ShowMessage(Un_R_file_Alex.KASSA_ORDER_ADD_PROV_SUMMA_ERROR);
        exit;
    end;}
    pr := 1;
    cxTextEditSumma.Text  := Un_func_file_Alex.AddNol(cxTextEditSumma.Text, pr);
    if pr = -1 then
    begin
        ShowMessage(Un_R_file_Alex.MY_ERROR_SUMMA_LENGTH);
        exit;
    end;

    ModalResult := mrOk;
end;

procedure TfmAvanceInputSumma.LoadCaption;
begin
    Caption               := Un_R_file_Alex.KASSA_SHABLON_SUMMA_CAPTION;
    cxLabel1.caption      := Un_R_file_Alex.BANK_SELECT_DOG_S_1;
    cxLabel2.caption      := Un_R_file_Alex.KASSA_SHABLON_SUMMA_LAB_1;

    ActionClose.Caption   := Un_R_file_Alex.MY_BUTTON_CANCEL_CONST;
    ActionTake.Caption    := Un_R_file_Alex.MY_BUTTON_OK_CONST;
end;

procedure TfmAvanceInputSumma.cxTextEditSummaExit(Sender: TObject);
var
    pr : integer;
begin
    pr := 1;
    cxTextEditSumma.Text  := Un_func_file_Alex.AddNol(cxTextEditSumma.Text, pr);
    if pr = -1 then
    begin
        ShowMessage(Un_R_file_Alex.MY_ERROR_SUMMA_LENGTH);
        exit;
    end;
end;

end.

