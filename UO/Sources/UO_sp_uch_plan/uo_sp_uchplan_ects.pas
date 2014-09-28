unit uo_sp_uchplan_ects;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxLabel;

type
  Tfmuo_sp_uchplan_ects = class(TForm)
    cxTextEdit1: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel1: TcxLabel;
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function uo_show_ects(var ects : double) : boolean;

implementation

{$R *.dfm}

function uo_show_ects(var ects : double) : boolean;
var
    T : Tfmuo_sp_uchplan_ects;
begin
    T := Tfmuo_sp_uchplan_ects.Create(nil);


    T.cxTextEdit1.Text := FloatToStr(ects);

    if T.Showmodal = mrOK then
    begin
        ects        := StrToFloat(T.cxTextEdit1.Text);

        Result      := true;
    end else
        Result      := false;
    T.Free;
end;

procedure Tfmuo_sp_uchplan_ects.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin

    if Ord(Key) = VK_TAB then exit;
    if Ord(Key) <> VK_TAB then
    begin
        cxTextEdit1.ClearSelection;
    end;

    if (Key = '.') then Key := DecimalSeparator;

    if Length(cxTextEdit1.Text)>5 then
        if (Pos(DecimalSeparator, cxTextEdit1.Text) = 0) and (Key <> DecimalSeparator) then Key := Chr(0);
    //if (-1)*(Pos(DecimalSeparator, cxTextEdit1.Text) - Length(Key) ) > 5 then Key := Chr(0);

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
        and (Key <> '-')
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEdit1.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEdit1.Text) - Pos(DecimalSeparator, cxTextEdit1.Text) > 1) and (Pos(DecimalSeparator,cxTextEdit1.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
end;

procedure Tfmuo_sp_uchplan_ects.cxButton2Click(Sender: TObject);
begin
    Close;
end;

procedure Tfmuo_sp_uchplan_ects.cxButton1Click(Sender: TObject);
begin
    if cxTextEdit1.Text <> '' then
        if strToFloat(cxTextEdit1.Text) <> 0 then ModalResult := mrOk; 
end;

end.
