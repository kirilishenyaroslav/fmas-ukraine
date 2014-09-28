{*******************************************************************************
* uDateControl                                                                 *
*                                                                              *
* Библиотека компонентов для работы с формой редактирования (qFControls)       *
* Работа с полем ввода даты (TqFDateControl)                                   *
* Copyright ©  2005-2007, Олег Г. Волков, Донецкий Национальный Университет    *
*******************************************************************************}

unit uDateControl;

interface

uses
    SysUtils, Classes, Controls, uFControl, StdCtrls, Graphics, uLabeledFControl,
    ComCtrls, ToolEdit, Registry;

type
    TqFDateControl = class(TqFLabeledControl)
    private
        FOldOnEnterEvent: TNotifyEvent;
        FDateControl: TDateEdit;
        FCheckDateIsEmpty: Boolean;

        function GetKeyDown: TKeyEvent;
        procedure SetKeyDown(e: TKeyEvent);
        function GetKeyUp: TKeyEvent;
        procedure SetKeyUp(e: TKeyEvent);

    protected
        procedure PrepareRest; override;

        procedure SetValue(Val: Variant); override;
        function GetValue: Variant; override;

        procedure Loaded; override;

    public
        constructor Create(AOwner: TComponent); override;

        procedure Highlight(HighlightOn: Boolean); override;
        procedure ShowFocus; override;

        function ToString: string; override;

        procedure Block(Flag: Boolean); override;

        procedure LoadFromRegistry(reg: TRegistry); override; // vallkor
        procedure SaveIntoRegistry(reg: TRegistry); override; // vallkor

        function Check: string; override;

    published
        property OnKeyDown: TKeyEvent read GetKeyDown write SetKeyDown;
        property OnKeyUp: TKeyEvent read GetKeyUp write SetKeyUp;
        property CheckDateIsEmpty: Boolean read FCheckDateIsEmpty write FCheckDateIsEmpty default True;

    end;

procedure Register;
{$R *.res}

implementation

uses qFStrings, Variants, qFTools;

function TqFDateControl.GetKeyDown: TKeyEvent;
begin
    Result := FDateControl.OnKeyDown;
end;

procedure TqFDateControl.SetKeyDown(e: TKeyEvent);
begin
    FDateControl.OnKeyDown := e;
end;

function TqFDateControl.GetKeyUp: TKeyEvent;
begin
    Result := FDateControl.OnKeyUp;
end;

procedure TqFDateControl.SetKeyUp(e: TKeyEvent);
begin
    FDateControl.OnKeyUp := e;
end;

procedure TqFDateControl.Block(Flag: Boolean);
begin
    inherited Block(Flag);
    if Flag then
    begin
        FOldOnEnterEvent := FDateControl.OnEnter;
        FDateControl.Enabled := False;
    end
    else
    begin
        FDateControl.Enabled := True;
    end;
end;

procedure TqFDateControl.Loaded;
begin
    FDateControl.OnChange := FOnChange;
    inherited Loaded;
end;

procedure TqFDateControl.Highlight(HighlightOn: Boolean);
begin
    inherited Highlight(HighlightOn);
    if HighlightOn then
        FDateControl.Color := qFHighlightColor
    else
        if FOldColor <> 0 then
            FDateControl.Color := FOldColor;
    Repaint;
end;

procedure TqFDateControl.ShowFocus;
begin
    inherited ShowFocus;
    qFSafeFocusControL(FDateControl);
end;

function TqFDateControl.ToString: string;
begin
    if VarIsNull(Value) then
        Result := 'Null'
    else
        if Value <= 0 then
            Result := 'Null'
        else
            Result := QuotedStr(DateToStr(Value));
end;

procedure TqFDateControl.SetValue(Val: Variant);
begin
    inherited SetValue(Val);

    if VarIsNull(Val) or (Val = 0) then
    begin
        FDateControl.Date := StrToDate('01.01.1900');
        FDateControl.Text := '';
    end
    else
        FDateControl.Date := Val;
end;

function TqFDateControl.GetValue: Variant;
begin
    if Trim(FDateControl.Text) = '' then
        Result := Null
    else
    begin
        Result := Trunc(FDateControl.Date);
        //if Result <= 0 then Result := Null;
    end;
end;

constructor TqFDateControl.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);

    FDateControl := TDateEdit.Create(Self);
    FDateControl.Parent := Self;
    FDateControl.OnChange := FOnChange;
    FDateControl.Text := '';
    Asterisk := False;
    FCheckDateIsEmpty := False;
    PrepareRest;

    FOldColor := FDateControl.Color;
end;

procedure TqFDateControl.PrepareRest;
begin
    FDateControl.Width := Width - Interval - 3;
    FDateControl.Height := qFDefaultHeight;
    FDateControl.Left := Interval;
    FDateControl.Top := (Height - FDateControl.Height) div 2;
end;

procedure Register;
begin
    RegisterComponents('qFControls', [TqFDateControl]);
end;

procedure TqFDateControl.LoadFromRegistry(reg: TRegistry); // vallkor
begin
    inherited LoadFromRegistry(reg);
    try
        Value := Reg.ReadDate('Value');
    except
    end;
end;

procedure TqFDateControl.SaveIntoRegistry(reg: TRegistry); // vallkor
begin
    inherited SaveIntoRegistry(reg);

    if not VarIsNull(Value) then
        Reg.WriteDate('Value', VarToDateTime(Value));
end;

function TqFDateControl.Check: string;
begin
    if Required and FCheckDateIsEmpty then
        if VarIsNull(Value) or VarIsEmpty(Value) or (Value <= 0) then
            Result := qFDateFieldIsEmpty + '"' + DisplayName + '"!'
        else Result := ''
    else Result := '';
end;

end.

