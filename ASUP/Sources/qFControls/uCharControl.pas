{*******************************************************************************
* uCharControl                                                                 *
*                                                                              *
* Библиотека компонентов для работы с формой редактирования (qFControls)       *
* Работа со строковым полем ввода (TqFCharControl)                             *
* Copyright ©  2005-2007, Олег Г. Волков, Донецкий Национальный Университет    *
*******************************************************************************}

unit uCharControl;

interface

uses
    SysUtils, Classes, Controls, uFControl, StdCtrls, Graphics, uLabeledFControl,
    Registry, Variants;

type
    TqFCharControl = class(TqFLabeledControl)
    protected
        FEdit: TEdit;

        procedure SetValue(Val: Variant); override;
        function GetValue: Variant; override;

        procedure SetMaxLength(Len: Integer);
        function GetMaxLength: Integer;

        procedure PrepareRest; override;

        procedure Change(Sender: TObject); virtual;
        procedure Loaded; override;

        function GetKeyDown: TKeyEvent;
        procedure SetKeyDown(e: TKeyEvent);
        function GetKeyUp: TKeyEvent;
        procedure SetKeyUp(e: TKeyEvent);

    public
        constructor Create(AOwner: TComponent); override;
        function Check: string; override;

        procedure Block(Flag: Boolean); override;

        procedure Highlight(HighlightOn: Boolean); override;
        procedure ShowFocus; override;

        function ToString: string; override;
        procedure LoadFromRegistry(reg: TRegistry); override; // vallkor
        procedure SaveIntoRegistry(reg: TRegistry); override; // vallkor

    published
        property MaxLength: Integer read GetMaxLength write SetMaxLength;

        property OnKeyDown: TKeyEvent read GetKeyDown write SetKeyDown;
        property OnKeyUp: TKeyEvent read GetKeyUp write SetKeyUp;
    end;

procedure Register;
{$R *.res}

implementation

uses qFStrings, qFTools;

function TqFCharControl.GetKeyDown: TKeyEvent;
begin
    Result := FEdit.OnKeyDown;
end;

procedure TqFCharControl.SetKeyDown(e: TKeyEvent);
begin
    FEdit.OnKeyDown := e;
end;

function TqFCharControl.GetKeyUp: TKeyEvent;
begin
    Result := FEdit.OnKeyUp;
end;

procedure TqFCharControl.SetKeyUp(e: TKeyEvent);
begin
    FEdit.OnKeyUp := e;
end;

procedure TqFCharControl.Block(Flag: Boolean);
begin
    inherited Block(Flag);
    FEdit.ReadOnly := Flag;
    if Flag then
        FEdit.Color := qFBlockedColor
    else
        FEdit.Color := FOldColor;
end;

procedure TqFCharControl.Change(Sender: TObject);
begin
    if (Trim(FEdit.Text) <> '') and Asterisk then
        Asterisk := False;
    if Assigned(FOnChange) then
        FOnChange(Sender);
end;

procedure TqFCharControl.Loaded;
begin
    FEdit.OnChange := Change;

    inherited Loaded;
end;

procedure TqFCharControl.Highlight(HighlightOn: Boolean);
begin
    inherited Highlight(HighlightOn);
    if HighlightOn then
        FEdit.Color := qFHighlightColor
    else
        if FOldColor <> 0 then
            FEdit.Color := FOldColor;
    Repaint;
end;

procedure TqFCharControl.ShowFocus;
begin
    inherited ShowFocus;
    qFSafeFocusControl(FEdit);
end;

procedure TqFCharControl.SetMaxLength(Len: Integer);
begin
    FEdit.MaxLength := Len;
end;

function TqFCharControl.GetMaxLength: Integer;
begin
    Result := FEdit.MaxLength;
end;

function TqFCharControl.ToString: string;
begin
    Result := QuotedStr(FEdit.Text);
end;

function TqFCharControl.Check: string;
begin
    if Required then
        if Trim(Value) = '' then
            Check := qFFieldIsEmpty + '"' + DisplayName + '"!'
        else
            Check := ''
    else
        Check := '';
end;

procedure TqFCharControl.SetValue(Val: Variant);
begin
    inherited SetValue(Val);

    FEdit.Text := Coalesce(Val, '');
end;

function TqFCharControl.GetValue: Variant;
begin
    Result := FEdit.Text;
end;

constructor TqFCharControl.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);

    FEdit := TEdit.Create(Self);
    FEdit.Parent := Self;
    PrepareRest;

    FOldColor := FEdit.Color;
end;

procedure TqFCharControl.PrepareRest;
begin
    inherited;

    if FEdit <> nil then
    begin
        FEdit.Width := Width - Interval - 3;
        FEdit.Left := Interval;
        FEdit.Top := (Height - FEdit.Height) div 2;
    end;
end;

procedure Register;
begin
    RegisterComponents('qFControls', [TqFCharControl]);
end;

procedure TqFCharControl.LoadFromRegistry(reg: TRegistry); // vallkor
begin
    inherited LoadFromRegistry(reg);
    Value := Reg.ReadString('Value');
end;

procedure TqFCharControl.SaveIntoRegistry(reg: TRegistry); // vallkor
begin
    inherited SaveIntoRegistry(reg);

    Reg.WriteString('Value', VarToStr(Value));
end;

end.

