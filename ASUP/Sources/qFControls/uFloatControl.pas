{*******************************************************************************
* uFloatControl                                                                *
*                                                                              *
* Библиотека компонентов для работы с формой редактирования (qFControls)       *
* Работа с вводом дробных чисел (TqFFloatControl)                              *
* Copyright ©  2005, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}

unit uFloatControl;

interface

uses
  SysUtils, Classes, Controls, uFControl, StdCtrls, Graphics, uLabeledFControl,
  uCharControl, Registry;

type
  TqFFloatControl = class(TqFCharControl)
  private
    FNegativeAllowed: Boolean;
    FPrecision: Integer;
    FFormat: String;

  protected
    procedure SetValue(Val: Variant); override;
    function GetValue: Variant; override;

    procedure BlockKeys(Sender: TObject; var Key: Char);

    procedure SetPrecision(Prec: Integer);

  public
    constructor Create(AOwner: TComponent); override;

    function Check: String; override;

    function  ToString: String; override;

    procedure LoadFromRegistry(reg: TRegistry); override; // vallkor
    procedure SaveIntoRegistry(reg: TRegistry); override; // vallkor

  published
    property NegativeAllowed: Boolean read FNegativeAllowed write FNegativeAllowed;
    property Precision: Integer read FPrecision write SetPrecision;
    property Format: String read FFormat write FFormat;
  end;

procedure Register;
{$R *.res}

implementation

uses qFStrings, Variants;


procedure TqFFloatControl.SetPrecision(Prec: Integer);
var
    i: Integer;
begin
    FPrecision := Prec;

    FFormat := '#########0';
    if Prec > 0 then
    begin
        FFormat := FFormat + '.';
        for i:=1 to Prec do
            FFormat := FFormat + '0';
    end;
end;

constructor TqFFloatControl.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    FEdit.OnKeyPress := BlockKeys;
    Precision := 2;
end;

procedure TqFFloatControl.BlockKeys(Sender: TObject; var Key: Char);
var
    p: Integer;
begin
    if not ( Key in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '-', #8,
        '.', ','] )
        then Key := #0;
    p := Pos('.', FEdit.Text);
    if p = 0 then p := Pos(',', FEdit.Text);

    if ( p <> 0 ) and ( Key in ['.', ','] ) then Key := #0;
{    if ( p <> 0 ) and ( Key <> #8 ) and ( FEdit.SelStart >= p ) and
        ( Length(FEdit.Text) - p >= FPrecision ) then Key := #0;}
    if ( p = 0 ) and ( Key in ['.', ','] ) and
        ( Length(FEdit.Text) - FEdit.SelStart > FPrecision )  then Key := #0;
end;

function  TqFFloatControl.ToString: String;
var
    ds: Char;
begin
    if Trim(FEdit.Text) = '' then
        if Required then Result := '0'
        else Result := 'Null'
    else
    begin
        ds := DecimalSeparator;
        DecimalSeparator := '.';
        Result := FloatToStr(Value);
        DecimalSeparator := ds;
    end;
end;

function TqFFloatControl.Check: String;
var
    val: Variant;
begin
    val := Value;

    Check := '';

    if ( Trim(FEdit.Text) = '' ) and Required then
        Check := qFFieldIsEmpty + '"' + DisplayName + '"!'
    else
    if VarIsNull(val) and ( Trim(FEdit.Text) <> '' ) then
        Check := DisplayName + qFNotFloat
    else
    if Required then
        if ( not NegativeAllowed ) and ( val < 0 ) then
            Check := DisplayName + qFNegative;
end;

procedure TqFFloatControl.SetValue(Val: Variant);
begin
    if VarIsNull(Val) or VarIsEmpty(Val) then FEdit.Text := ''
    else
    begin
        FEdit.Text := FormatFloat(FFormat, Val);
        if Asterisk then Asterisk := False;
    end;
end;

function TqFFloatControl.GetValue: Variant;
var
    str: String;
    f: Extended;
begin
    str := FEdit.Text;
    str := StringReplace(str, '.', DecimalSeparator, []);
    str := StringReplace(str, ',', DecimalSeparator, []);

    if TryStrToFloat(str, f) then Result := f
    else Result := Null;
end;

procedure Register;
begin
  RegisterComponents('qFControls', [TqFFloatControl]);
end;

procedure TqFFloatControl.LoadFromRegistry(reg: TRegistry);  // vallkor
begin
    inherited LoadFromRegistry(reg);
    Value := Reg.ReadFloat('Value');
end;

procedure TqFFloatControl.SaveIntoRegistry(reg: TRegistry);  // vallkor
begin
    inherited SaveIntoRegistry(reg);

    Reg.WriteFloat('Value', Value);
end;


end.
