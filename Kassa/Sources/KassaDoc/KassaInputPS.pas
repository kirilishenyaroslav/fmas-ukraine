unit KassaInputPS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, Un_R_file_Alex;

type
  TfmKassaInputPS = class(TForm)
    cxLabel2: TcxLabel;
    cxTextEditSumma: TcxTextEdit;
    ActionList1: TActionList;
    ActionTake: TAction;
    ActionClose: TAction;
    cxButtonTake: TcxButton;
    cxButtonClose: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    procedure ActionTakeExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure LoadCaption;
    procedure cxTextEditSummaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
function Show_Summa_K(var summa : double; TEXT : STRING):boolean;

implementation
uses Un_func_file_Alex;
{$R *.dfm}

function Show_Summa_K(var summa : double; TEXT : STRING):boolean;
var
    T : TfmKassaInputPS;
    i : integer;
begin
    T := TfmKassaInputPS.Create(nil);
    T.cxLabel3.Caption     := Text;
    i := 0;
    T.cxTextEditSumma.Text := AddNol(FloatToStr(summa), i);
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

procedure TfmKassaInputPS.ActionTakeExecute(Sender: TObject);
begin
    if StrToFloat(cxTextEditSumma.Text) = 0 then
    begin
        ShowMessage(Un_R_file_Alex.KASSA_ORDER_ADD_PROV_SUMMA_ERROR);
        exit;
    end;
    ModalResult := mrOk;
end;

procedure TfmKassaInputPS.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmKassaInputPS.LoadCaption;
begin
    Caption               := Un_R_file_Alex.KASSA_SHABLON_SUMMA_CAPTION;
    cxLabel1.caption      := Un_R_file_Alex.KASSA_SHABLON_SUMMA_LAB;
    cxLabel2.caption      := Un_R_file_Alex.KASSA_INPUT_SUMMA_ALL;

    ActionClose.Caption := Un_R_file_Alex.MY_BUTTON_CANCEL_CONST;
    ActionTake.Caption  := Un_R_file_Alex.MY_BUTTON_OK_CONST;
end;

procedure TfmKassaInputPS.cxTextEditSummaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if cxTextEditSumma.Text = '0,00' then cxTextEditSumma.Text := '';  

    if Key = '.' then Key := DecimalSeparator;

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
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

end.
