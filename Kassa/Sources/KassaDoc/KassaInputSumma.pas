unit KassaInputSumma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, cxLabel, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, Un_R_file_Alex;

type
  TfmKassaInputSumma = class(TForm)
    cxTextEditSumma: TcxTextEdit;
    cxButtonClose: TcxButton;
    cxButtonTake: TcxButton;
    ActionList1: TActionList;
    cxLabel1: TcxLabel;
    ActionTake: TAction;
    ActionClose: TAction;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    procedure cxTextEditSummaKeyPress(Sender: TObject; var Key: Char);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionTakeExecute(Sender: TObject);
    procedure LoadCaption;
    procedure cxTextEditSummaExit(Sender: TObject);
    procedure cxTextEditSummaPropertiesChange(Sender: TObject);
  private

  public
      nds : smallint;
  end;
function Show_Summa_Kassa(nds_ask : smallint; var summa : double; TEXT : STRING):boolean;


implementation
uses Un_func_file_Alex, Math;

{$R *.dfm}

function Show_Summa_Kassa(nds_ask : smallint;var summa : double; TEXT : STRING):boolean;
var
    T : TfmKassaInputSumma;
    i : integer;
begin
    T := TfmKassaInputSumma.Create(nil);
    T.cxLabel3.Caption     := Text;

    T.nds := nds_ask;
    if summa = 0
        then T.cxTextEditSumma.Text := '0,00'
        else T.cxTextEditSumma.Text := FloatToStr(summa);
    i := 0;
    T.cxTextEditSumma.Text := AddNol(T.cxTextEditSumma.Text, i);
    T.LoadCaption;
    if (T.nds=1) then
    begin
        T.cxLabel4.Visible := true;
        T.cxLabel5.Visible := true;
    end;
    if T.ShowModal=mrOk then
    begin
//        DecimalSeparator := '.';
        Summa := StrToFloat(T.cxTextEditSumma.Text);
        Result := true;
    end else
    begin
        Result := false;
    end;
    T.Free;
end;


{ TfmKassaInputSumma }

procedure TfmKassaInputSumma.cxTextEditSummaKeyPress(Sender: TObject;
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

procedure TfmKassaInputSumma.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmKassaInputSumma.ActionTakeExecute(Sender: TObject);
begin
    if StrToFloat(cxTextEditSumma.Text) = 0 then
    begin
        ShowMessage(Un_R_file_Alex.KASSA_ORDER_ADD_PROV_SUMMA_ERROR);
        exit;
    end;
    ModalResult := mrOk;
end;

procedure TfmKassaInputSumma.LoadCaption;
begin
    Caption               := Un_R_file_Alex.KASSA_SHABLON_SUMMA_CAPTION;
    cxLabel1.caption      := Un_R_file_Alex.KASSA_SHABLON_SUMMA_LAB;
    if (nds =1) then cxLabel2.caption      := Un_R_file_Alex.KASSA_SHABLON_SUMMA_LAB_2
    else   cxLabel2.caption      := Un_R_file_Alex.KASSA_SHABLON_SUMMA_LAB_1;

    ActionClose.Caption := Un_R_file_Alex.MY_BUTTON_CANCEL_CONST;
    ActionTake.Caption  := Un_R_file_Alex.MY_BUTTON_OK_CONST;
end;

procedure TfmKassaInputSumma.cxTextEditSummaExit(Sender: TObject);
var
  i : integer;
begin
    i := 0;
    cxTextEditSumma.Text := AddNol(cxTextEditSumma.Text, i);
end;



procedure TfmKassaInputSumma.cxTextEditSummaPropertiesChange(
  Sender: TObject);
var
     s : double;
begin
   if (cxTextEditSumma.Text ='')
   then cxLabel5.caption := '' else
   begin
       s := RoundTo(((strtofloat(cxTextEditSumma.text))*20/(100+20)), -2);
       cxLabel5.caption := floattostr(s);
   end;
end;

end.
