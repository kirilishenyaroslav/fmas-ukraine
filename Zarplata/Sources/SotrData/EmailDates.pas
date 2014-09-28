unit EmailDates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TfrmEmailDates = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxButton3: TcxButton;
    cxTextEdit1: TcxMaskEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
    function WeakPassword(len: integer): string;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);reintroduce;
  end;

implementation

{$R *.dfm}

uses DateUtils;

{ TfrmEmailDates }

constructor TfrmEmailDates.Create(AOwner: TComponent);
begin
     inherited Create(AOwner);
     cxDateEdit1.Date:=StartOfTheMonth(Date);
     cxDateEdit2.Date:=StrToDate('31.12.9999');
     cxButton3Click(Self);
end;

procedure TfrmEmailDates.cxButton1Click(Sender: TObject);
begin
     if (cxTextEdit1.Text<>'')
     then begin
               cxDateEdit1.Date:=StartOfTheMonth(cxDateEdit1.Date);
               cxDateEdit2.Date:=EndOfTheMonth(cxDateEdit2.Date);
               ModalResult:=mrYes;
     end
     else ShowMessage('Треба ввести пароль до архiву!');
end;

procedure TfrmEmailDates.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmEmailDates.cxButton3Click(Sender: TObject);
begin
     cxTextEdit1.Text:='';
     try
            cxTextEdit1.Text:=WeakPassword(8);
     except on E:Exception do begin end;
     end;
end;


function TfrmEmailDates.WeakPassword(len: integer): string;
var
  c: integer;
  ch: AnsiChar;
  key: array [0 .. 7] of longint;
  a, b: longint;
  x: int64;
 
  procedure morph();
  var
    r: longint;
  begin
 
    r := -1;
    repeat
      Inc(r);
      Inc(b, a + ((a shl 6) xor (a shr 8)) + (key[r mod 8] + r));
      Inc(r);
      Inc(a, b + ((b shl 6) xor (b shr 8)) + (key[r mod 8] + r));
    until r = 63;
 
  end;
 
  function RND(): byte;
  begin
    morph();
    Result := (a + b) mod $100;
  end;
 
  function RND32(idx: integer): longint;
  begin
    morph();
    case idx of
      0:
        Result := a;
      1:
        Result := b;
    end;
 
  end;
 
begin
 
  Result := '';
 
  for c := 0 to 7 do
    key[c] := random($FFFFFFFF);
 
  b := 0;
  a := GetTickCount;
  a := RND32(0);
  if QueryPerformanceCounter(x) then
    b := (x {shr 0}) and $FFFFFF
  else
    b := 0;
  b := RND32(1);
 
{for c := 0 to $FFFF do Morph();}
 
 
  c := 0;
 
  while c < len do
  begin
 
    ch := AnsiChar(RND());
 
    if ch in ['a' .. 'z', 'A' .. 'Z', '0' .. '9'] then
    begin
      Result := Result + ch;
      Inc(c);
    end; {else morph();}
 
  end;
 
end;

end.
