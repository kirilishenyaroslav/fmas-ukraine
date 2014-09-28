{*******************************************************************************
* uIntControl                                                                  *
*                                                                              *
* Библиотека компонентов для работы с формой редактирования (qFControls)       *
* Работа с вводом целых чисел (TqFIntControl)                                  *
* Copyright ©  2005-2007, Олег Г. Волков, Донецкий Национальный Университет    *
*******************************************************************************}

unit uIntControl;

interface

uses
    SysUtils, Classes, Controls, uFControl, StdCtrls, Graphics, uLabeledFControl,
    uCharControl, Registry;

type
    TqFIntControl = class(TqFCharControl)
    private
        FNegativeAllowed: Boolean;
        FZeroAllowed: Boolean;

    protected
        procedure SetValue(Val: Variant); override;
        function GetValue: Variant; override;

        procedure BlockKeys(Sender: TObject; var Key: Char);
        
    public
        constructor Create(AOwner: TComponent); override;

        function Check: string; override;

        function ToString: string; override;

        procedure LoadFromRegistry(reg: TRegistry); override; // vallkor
        procedure SaveIntoRegistry(reg: TRegistry); override; // vallkor

    published
        property NegativeAllowed: Boolean read FNegativeAllowed write FNegativeAllowed;
        property ZeroAllowed: Boolean read FZeroAllowed write FZeroAllowed;
    end;

procedure Register;
{$R *.res}

implementation

uses qFStrings, Variants;

constructor TqFIntControl.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    FEdit.OnKeyPress := BlockKeys;
    MaxLength := 10;
end;

procedure TqFIntControl.BlockKeys(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '-'])
        and (Key <> #8) then Key := #0;
end;

function TqFIntControl.ToString: string;
begin
    if Trim(FEdit.Text) = '' then Result := 'Null'
    else Result := FEdit.Text;
end;

function TqFIntControl.Check: string;
var
    val: Variant;
begin
    val := Value;

    Check := '';

    if (Trim(FEdit.Text) = '') and Required then
        Check := qFFieldIsEmpty + '"' + DisplayName + '"!'
    else
        if (VarIsNull(val) or VarIsEmpty(val)) and (Trim(FEdit.Text) <> '') then
            Check := DisplayName + qFNotInteger
        else
            if Required then
            begin
                if (not NegativeAllowed) and (val < 0) then
                    Check := DisplayName + qFNegative;

                if (not ZeroAllowed) and (val = 0) then
                    Check := DisplayName + qFZero;
            end;
end;

procedure TqFIntControl.SetValue(Val: Variant);
begin
    if VarIsNull(Val) or VarIsEmpty(Val) then FEdit.Text := ''
    else
    begin
        FEdit.Text := IntToStr(Val);
        if Asterisk then Asterisk := False;
    end;
end;

function TqFIntControl.GetValue: Variant;
var
    str: string;
    i: Integer;
begin
    str := FEdit.Text;
    if TryStrToInt(str, i) then Result := i
    else Result := Null;
end;

procedure Register;
begin
    RegisterComponents('qFControls', [TqFIntControl]);
end;

procedure TqFIntControl.LoadFromRegistry(reg: TRegistry); // vallkor
begin
    //inherited LoadFromRegistry(reg);

    Value := Reg.ReadInteger('Value');
end;

procedure TqFIntControl.SaveIntoRegistry(reg: TRegistry); // vallkor
begin
    inherited SaveIntoRegistry(reg);

    Reg.WriteInteger('Value', Value);
end;


end.

