unit uUpAddSetka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, StdCtrls, cxButtons, ActnList;

type
  TdmAddSetka = class(TForm)
    cxButtonParam: TcxButton;
    cxButtonDraft: TcxButton;
    LblFrom: TcxLabel;
    LblEnd: TcxLabel;
    ActionList1: TActionList;
    OKAction: TAction;
    CancelAction: TAction;
    cxDNEdit: TcxTextEdit;
    cxUPEdit: TcxTextEdit;
    procedure OKActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure cxDNEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxDNEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxUPEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxUPEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure ParserKeyDown(var Key: Word;Shift: TShiftState);
  end;

var
  dmAddSetka: TdmAddSetka;

implementation

{$R *.dfm}
uses BaseTypes;
procedure TdmAddSetka.OKActionExecute(Sender: TObject);
begin
   If Trim(cxDNEdit.Text) = '' Then
        Begin
            agMessageDlg('Увага!', 'Введіть дату почаку!', mtError, [mbOk]);
            cxDNEdit.SetFocus;
            cxDNEdit.Style.Color := clRed;
            Exit;
        End;

    // проверка на заполнение
    If Trim(cxUPEdit.Text) = '' Then
        Begin
            agMessageDlg('Увага!', 'Введіть дату кінця!', mtError, [mbOk]);
            cxUPEdit.SetFocus;
            cxUPEdit.Style.Color := clRed;
            Exit;
        End;

    // проверка на корректность
    If StrToFloat(cxDNEdit.Text) > StrToFloat(cxUPEdit.Text) Then
        Begin
            agMessageDlg('Увага!', 'Сума "До" повинна бути більше суми "Від"!', mtError, [mbOk]);
            cxDNEdit.SetFocus;
            cxDNEdit.Style.Color := clRed;
            cxUPEdit.Style.Color := clRed;
            Exit;
        End;
      
    ModalResult := mrOk;
end;

procedure TdmAddSetka.CancelActionExecute(Sender: TObject);
begin
    ModalResult:=mrNo;
end;

procedure TdmAddSetka.cxDNEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    ParserKeyDown(Key,Shift);
end;

procedure TdmAddSetka.cxDNEdit1KeyPress(Sender: TObject; var Key: Char);
var p,FPrecision, FBase:integer;
    FText:string;
begin
    FPrecision:=2;  FBase:=9;
    FText:='';
    Case key of
      '0'..'9': Begin
                   //длина текста не более Основания+Точности+1 символа разделителя(,.)
                   p := Pos('.', cxDNEdit.Text);
                   If p = 0 Then p := Pos(',', cxDNEdit.Text);

                   If ( p = 0 ) and (Length(cxDNEdit.Text)>=FBase) Then Key := #0;

                   If ( p <> 0 ) and ((Length(cxDNEdit.Text)-p)>=FPrecision) and (cxDNEdit.SelStart >=p)
                   Then Key := #0;

                   If ( p <> 0 ) and (p-1>=FBase) and (cxDNEdit.SelStart < p)
                   Then Key := #0;
               End;

      #8:  Begin // забой
              If Length(cxDNEdit.Text)-Length(cxDNEdit.SelText)=0 Then
              Begin
                  cxDNEdit.Text:=FText;
                  cxDNEdit.SelStart:=0;
              End
              Else
                 Begin
                     p := Pos('.', cxDNEdit.Text);
                     If p = 0 Then p := Pos(',', cxDNEdit.Text);

                     //после удаления точки, не окажется ли  FBase больше, чем задано
                     //проверяем:1)разделитель в тексте есть; 2) пытаются удалить именно разделитель (или
                     //текст с разделителем); 3)число символов без удаляемого теста
                     //с разделителем не превышает FBase
                     If (p<>0) and ((Pos(',', cxDNEdit.SelText)<>0) or (Pos('.', cxDNEdit.SelText)<>0) or
                        ((cxDNEdit.Text[p]=',') or (cxDNEdit.Text[p]='.')))
                        and ((Length(cxDNEdit.Text)-Length(cxDNEdit.SelText))>FBase)
                     Then  Key := #0;
                 End;
             End;
      '.', ',': Begin
                    Key:=DecimalSeparator;
                   //находим первое вхождение ./, в тексте
                   p := Pos('.', cxDNEdit.Text);
                   If p = 0 Then p := Pos(',', cxDNEdit.Text);

                   //если ./, уже есть в тексте, то больше не надо ее вводить!
                   If ( p <> 0 ) and ( Key in ['.', ','] ) Then Key := #0;

                   //если ./, в тексте нет, и  Key=./,, но запятую хотят поставить в таком месте,
                   //где точность больше  FPrecision, то не надо ./, ставить
                   If ( p = 0 ) and ( Key in ['.', ','] ) and
                      ( Length(cxDNEdit.Text) - cxDNEdit.SelStart > FPrecision )
                      Then Key := #0;
                End
                Else key:=#0;
    End;
end;

procedure TdmAddSetka.ParserKeyDown(var Key: Word; Shift: TShiftState);
begin
    If ((Key = ord('V')) and (ssCtrl in Shift))   Then Key:=0;
    If ((Key = VK_INSERT) and (ssShift in Shift)) Then Key:=0;
    If ((Key = VK_DELETE) and (ssShift in Shift)) Then Key:=0;
    If (Key = VK_DELETE) Then Key:=0;
end;

procedure TdmAddSetka.cxUPEdit1KeyPress(Sender: TObject; var Key: Char);
var p,FPrecision, FBase:integer;
    FText:string;
begin
    FPrecision:=2;  FBase:=9;
    FText:='';
    Case key of
      '0'..'9': Begin
                   //длина текста не более Основания+Точности+1 символа разделителя(,.)
                   p := Pos('.', cxUPEdit.Text);
                   If p = 0 Then p := Pos(',', cxUPEdit.Text);

                   If ( p = 0 ) and (Length(cxUPEdit.Text)>=FBase) Then Key := #0;

                   If ( p <> 0 ) and ((Length(cxUPEdit.Text)-p)>=FPrecision) and (cxUPEdit.SelStart >=p)
                   Then Key := #0;

                   If ( p <> 0 ) and (p-1>=FBase) and (cxUPEdit.SelStart < p)
                   Then Key := #0;
               End;

      #8:  Begin // забой
              If Length(cxUPEdit.Text)-Length(cxUPEdit.SelText)=0 Then
              Begin
                  cxUPEdit.Text:=FText;
                  cxUPEdit.SelStart:=0;
              End
              Else
                 Begin
                     p := Pos('.', cxUPEdit.Text);
                     If p = 0 Then p := Pos(',', cxUPEdit.Text);

                     //после удаления точки, не окажется ли  FBase больше, чем задано
                     //проверяем:1)разделитель в тексте есть; 2) пытаются удалить именно разделитель (или
                     //текст с разделителем); 3)число символов без удаляемого теста
                     //с разделителем не превышает FBase
                     If (p<>0) and ((Pos(',', cxUPEdit.SelText)<>0) or (Pos('.', cxUPEdit.SelText)<>0) or
                        ((cxUPEdit.Text[p]=',') or (cxUPEdit.Text[p]='.')))
                        and ((Length(cxUPEdit.Text)-Length(cxUPEdit.SelText))>FBase)
                     Then  Key := #0;
                 End;
             End;
      '.', ',': Begin
                    Key:=DecimalSeparator;
                   //находим первое вхождение ./, в тексте
                   p := Pos('.', cxUPEdit.Text);
                   If p = 0 Then p := Pos(',', cxUPEdit.Text);

                   //если ./, уже есть в тексте, то больше не надо ее вводить!
                   If ( p <> 0 ) and ( Key in ['.', ','] ) Then Key := #0;

                   //если ./, в тексте нет, и  Key=./,, но запятую хотят поставить в таком месте,
                   //где точность больше  FPrecision, то не надо ./, ставить
                   If ( p = 0 ) and ( Key in ['.', ','] ) and
                      ( Length(cxUPEdit.Text) - cxUPEdit.SelStart > FPrecision )
                      Then Key := #0;
                End
                Else key:=#0;
    End;
end;

procedure TdmAddSetka.cxUPEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    ParserKeyDown(Key,Shift);
end;

end.
