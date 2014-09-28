unit BankInputSumma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, cxLabel, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, Un_R_file_Alex;

type
  TfmBankInputSumma = class(TForm)
    cxTextEditSumma: TcxTextEdit;
    cxButtonClose: TcxButton;
    cxButtonTake: TcxButton;
    ActionList1: TActionList;
    cxLabel1: TcxLabel;
    ActionTake: TAction;
    ActionClose: TAction;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxTextEditSummaValuta: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabelValuta: TcxLabel;
    procedure cxTextEditSummaKeyPress(Sender: TObject; var Key: Char);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionTakeExecute(Sender: TObject);
    procedure LoadCaption;
    procedure cxTextEditSummaExit(Sender: TObject);
    procedure cxTextEditSummaValutaKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxTextEditSummaValutaExit(Sender: TObject);
  private

  public
  end;
function Show_Summa_Bank(var summa : double; TEXT : STRING;var summa_valuta : double; id_valuta : Integer; name_valuta : string):boolean;


implementation
uses Un_func_file_Alex;
{$R *.dfm}

function Show_Summa_Bank(var summa : double; TEXT : STRING;var summa_valuta : double; id_valuta : Integer; name_valuta : string):boolean;
var
    T : TfmBankInputSumma;
    pr : integer;
begin
    T := TfmBankInputSumma.Create(nil);
//    T.cxLabel3.Caption  := Text;
    if summa = 0
        then T.cxTextEditSumma.Text  := '0,00'
        else T.cxTextEditSumma.Text  := FloatToStr(summa);

    if summa_valuta = 0
        then T.cxTextEditSummaValuta.Text  := '0,00'
        else T.cxTextEditSummaValuta.Text  := FloatToStr(summa_valuta);



    pr := 0;
    T.cxTextEditSumma.Text := AddNol(T.cxTextEditSumma.Text, pr);
    T.cxTextEditSummaValuta.Text := AddNol(T.cxTextEditSummaValuta.Text, pr);
    if ((id_valuta = 0) or (id_valuta = null)) then
    begin
      t.cxLabel3.Visible              := False;
      t.cxLabel4.Visible              := False;
      t.cxLabelValuta.Visible         := False;
      t.cxTextEditSummaValuta.Visible := False;
    end
    else
    begin
      t.cxLabel3.Visible              := True;
      t.cxLabel4.Visible              := True;
      t.cxLabelValuta.Visible         := True;
      t.cxTextEditSummaValuta.Visible := True;
      t.cxLabelValuta.Caption         := name_valuta;
    end;

    T.LoadCaption;
    if T.ShowModal=mrOk then
    begin
        Summa        := StrToFloat(T.cxTextEditSumma.Text);
        summa_valuta := StrToFloat(T.cxTextEditSummaValuta.Text);
        Result       := true;
    end else
    begin
        Result := false;
    end;
    T.Free;
end;


{ TfmKassaInputSumma }

procedure TfmBankInputSumma.cxTextEditSummaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Ord(Key) = VK_TAB then exit;
    if Ord(Key) <> VK_TAB then
    begin
        cxTextEditSumma.ClearSelection;
    end;

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

procedure TfmBankInputSumma.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmBankInputSumma.ActionTakeExecute(Sender: TObject);
begin

    if StrToFloat(cxTextEditSumma.Text) = 0 then
    begin
        ShowMessage(Un_R_file_Alex.KASSA_ORDER_ADD_PROV_SUMMA_ERROR);
        exit;
    end;

   if (cxTextEditSummaValuta.Visible = true) then
   begin
     if (cxTextEditSummaValuta.Text = '') then
      begin
        ShowMessage('Заповніть суму валюти хоча б нулем.');
        exit;
      end;
   end;

    ModalResult := mrOk;
end;

procedure TfmBankInputSumma.LoadCaption;
begin
    Caption               := Un_R_file_Alex.KASSA_SHABLON_SUMMA_CAPTION;
    cxLabel1.caption      := Un_R_file_Alex.BANK_SELECT_DOG_S_1;
    //cxLabel2.caption      := Un_R_file_Alex.KASSA_SHABLON_SUMMA_LAB_1;
    ActionClose.Caption := Un_R_file_Alex.MY_BUTTON_CANCEL_CONST;
    ActionTake.Caption  := Un_R_file_Alex.MY_BUTTON_OK_CONST;
end;

procedure TfmBankInputSumma.cxTextEditSummaExit(Sender: TObject);
var
    pr : integer;
begin
    pr := 1;
    cxTextEditSumma.Text := AddNol(cxTextEditSumma.Text, pr);
    if pr = -1 then
    begin
        ShowMessage(Un_R_file_Alex.MY_ERROR_SUMMA_LENGTH);
    end;
end;

procedure TfmBankInputSumma.cxTextEditSummaValutaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Ord(Key) = VK_TAB then exit;
    if Ord(Key) <> VK_TAB then
    begin
        cxTextEditSummaValuta.ClearSelection;
    end;

    if Key = '.' then Key := DecimalSeparator;

    if (Key = '-') and (Length(cxTextEditSummaValuta.Text)>0)
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
        (Pos(DecimalSeparator, cxTextEditSummaValuta.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditSummaValuta.Text) - Pos(DecimalSeparator, cxTextEditSummaValuta.Text) > 1) and (Pos(DecimalSeparator,cxTextEditSummaValuta.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
end;


procedure TfmBankInputSumma.cxTextEditSummaValutaExit(Sender: TObject);
var
    pr : integer;
begin
    pr := 1;
    cxTextEditSummaValuta.Text := AddNol(cxTextEditSummaValuta.Text, pr);
    if pr = -1 then
    begin
        ShowMessage(Un_R_file_Alex.MY_ERROR_SUMMA_LENGTH);
    end;
end;

end.
