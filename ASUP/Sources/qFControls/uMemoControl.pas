{*******************************************************************************
* uMemoControl                                                                 *
*                                                                              *
* Библиотека компонентов для работы с формой редактирования (qFControls)       *
* Работа со мемо-полем ввода (TqFMemoControl)                                  *
* Copyright ©  2005-2007, Олег Г. Волков, Донецкий Национальный Университет    *
*******************************************************************************}

unit uMemoControl;

interface

uses
    SysUtils, Classes, Controls, uFControl, StdCtrls, Graphics, uLabeledFControl,
    Registry;

type
    TqFMemoControl = class(TqFLabeledControl)
    protected
        FMemo: TMemo;

        procedure SetValue(Val: Variant); override;
        function GetValue: Variant; override;

        procedure SetMaxLength(Len: Integer);
        function GetMaxLength: Integer;

        procedure PrepareRest; override;

        procedure SetLabelPosition; override;

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
        property Memo: TMemo read FMemo;
        property MaxLength: Integer read GetMaxLength write SetMaxLength;
        
        property OnKeyDown: TKeyEvent read GetKeyDown write SetKeyDown;
        property OnKeyUp: TKeyEvent read GetKeyUp write SetKeyUp;
    end;

procedure Register;
{$R *.res}

implementation

uses qFStrings, Variants, qFTools;

function TqFMemoControl.GetKeyDown: TKeyEvent;
begin
    Result := FMemo.OnKeyDown;
end;

procedure TqFMemoControl.SetKeyDown(e: TKeyEvent);
begin
    FMemo.OnKeyDown := e;
end;

function TqFMemoControl.GetKeyUp: TKeyEvent;
begin
    Result := FMemo.OnKeyUp;
end;

procedure TqFMemoControl.SetKeyUp(e: TKeyEvent);
begin
    FMemo.OnKeyUp := e;
end;

procedure TqFMemoControl.SetLabelPosition;
begin
    FLabel.Top := 0;
end;

procedure TqFMemoControl.Block(Flag: Boolean);
begin
    inherited Block(Flag);
    FMemo.ReadOnly := Flag;

    if Flag then
        FMemo.Color := qFBlockedColor
    else
        FMemo.Color := FOldColor;
end;

procedure TqFMemoControl.Loaded;
begin
    FMemo.OnChange := FOnChange;

    inherited Loaded;
end;

procedure TqFMemoControl.Highlight(HighlightOn: Boolean);
begin
    inherited Highlight(HighlightOn);
    if HighlightOn then
        FMemo.Color := qFHighlightColor
    else
        if FOldColor <> 0 then
            FMemo.Color := FOldColor;
    Repaint;
end;

procedure TqFMemoControl.ShowFocus;
begin
    inherited ShowFocus;
    qFSafeFocusControl(FMemo);
end;

procedure TqFMemoControl.SetMaxLength(Len: Integer);
begin
    FMemo.MaxLength := Len;
end;

function TqFMemoControl.GetMaxLength: Integer;
begin
    Result := FMemo.MaxLength;
end;

function TqFMemoControl.ToString: string;
begin
    Result := QuotedStr(FMemo.Text);
end;

function TqFMemoControl.Check: string;
begin
    if Required then
        if Trim(Value) = '' then
            Check := qFFieldIsEmpty + '"' + DisplayName + '"!'
        else
            Check := ''
    else
        Check := '';
end;

procedure TqFMemoControl.SetValue(Val: Variant);
begin
    inherited SetValue(Val);

    if VarIsNull(Val) then
        FMemo.Text := ''
    else
        FMemo.Text := Val;
end;

function TqFMemoControl.GetValue: Variant;
begin
    Result := FMemo.Text;
end;

constructor TqFMemoControl.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);

    FMemo := TMemo.Create(Self);
    FMemo.Parent := Self;
    FMemo.OnChange := FOnChange;
    FMemo.Font.Name := 'Verdana';
    FMemo.Font.Style := Self.Font.Style;
    FMemo.Font.Size := Self.Font.Size;

    PrepareRest;

    Width := 400;
    Height := 200;

    FOldColor := FMemo.Color;
end;

procedure TqFMemoControl.PrepareRest;
begin
    FMemo.Width := Width - Interval - 3;
    FMemo.Left := 0;
    FMemo.Width := Width;
    FMemo.Top := qFDefaultHeight;
    FMemo.Height := Height - qFDefaultHeight;
end;

procedure Register;
begin
    RegisterComponents('qFControls', [TqFMemoControl]);
end;

procedure TqFMemoControl.LoadFromRegistry(reg: TRegistry); // vallkor
begin
    inherited LoadFromRegistry(reg);
    Value := Reg.ReadString('Value');
end;

procedure TqFMemoControl.SaveIntoRegistry(reg: TRegistry); // vallkor
begin
    inherited SaveIntoRegistry(reg);

    Reg.WriteString('Value', VarToStr(Value));
end;

end.

