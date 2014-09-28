{*******************************************************************************
* uBoolFControl                                                                *
*                                                                              *
* Библиотека компонентов для работы с формой редактирования (qFControls)       *
* Компонент для ввода булевского значения (TqFBoolControl)                     *
* Copyright ©  2005-2007, Олег Г. Волков, Донецкий Национальный Университет    *
*******************************************************************************}

unit uBoolControl;

interface

uses
    SysUtils, Classes, Controls, uFControl, StdCtrls, Graphics, Registry;

type
    TStoreBool = (StoreAs01, StoreAsTF);

    TqFBoolControl = class(TqFControl)
    private
        FOldOnEnterEvent: TNotifyEvent;
        FCheckBox: TCheckBox;
        FStoreAs: TStoreBool;

        FUseBlock: Boolean;

    protected
        procedure SetValue(Val: Variant); override;
        function GetValue: Variant; override;

        procedure Loaded; override;

        procedure Prepare;

        procedure SetDisplayName(Name: string); override;
        procedure SetLabelColor(Color: TColor); override;
        procedure SetSemicolon(Val: Boolean); override;
        procedure SetAsterisk(Val: Boolean); override;
        procedure SetRequired(Val: Boolean); override;

        procedure Resize; override;

        procedure BlockCheck(Sender: TObject);

        function GetKeyDown: TKeyEvent;
        procedure SetKeyDown(e: TKeyEvent);
        function GetKeyUp: TKeyEvent;
        procedure SetKeyUp(e: TKeyEvent);

    public
        constructor Create(AOwner: TComponent); override;
        procedure Block(Flag: Boolean); override;

        procedure Highlight(HighlightOn: Boolean); override;
        procedure ShowFocus; override;

        function ToString: string; override;

        procedure LoadFromRegistry(reg: TRegistry); override; // vallkor
        procedure SaveIntoRegistry(reg: TRegistry); override; // vallkor

    published
        property StoreAs: TStoreBool read FStoreAs write FStoreAs;

        property OnKeyDown: TKeyEvent read GetKeyDown write SetKeyDown;
        property OnKeyUp: TKeyEvent read GetKeyUp write SetKeyUp;
    end;

procedure Register;
{$R *.res}

implementation

uses qFTools, qFStrings, Variants;

function TqFBoolControl.GetKeyDown: TKeyEvent;
begin
    Result := FCheckBox.OnKeyDown;
end;

procedure TqFBoolControl.SetKeyDown(e: TKeyEvent);
begin
    FCheckBox.OnKeyDown := e;
end;

function TqFBoolControl.GetKeyUp: TKeyEvent;
begin
    Result := FCheckBox.OnKeyUp;
end;

procedure TqFBoolControl.SetKeyUp(e: TKeyEvent);
begin
    FCheckBox.OnKeyUp := e;
end;

function TqFBoolControl.ToString: string;
begin
    if (FStoreAs = StoreAs01) and FCheckBox.Checked then
        Result := '1'
    else
        if (FStoreAs = StoreAs01) and not FCheckBox.Checked then
            Result := '0'
        else
            if (FStoreAs = StoreAsTF) and FCheckBox.Checked then
                Result := '''T'''
            else
                if (FStoreAs = StoreAsTF) and not FCheckBox.Checked then
                    Result := '''F''';
end;

procedure TqFBoolControl.ShowFocus;
begin
    inherited ShowFocus;
    qFSafeFocusControl(FCheckBox);
end;

procedure TqFBoolControl.Highlight(HighlightOn: Boolean);
begin
    inherited Highlight(HighlightOn);

    if HighlightOn then
    begin
        FOldColor := FCheckBox.Color;
        FCheckBox.Color := qFHighlightColor;
    end
    else
        if FOldColor <> 0 then
            FCheckBox.Color := FOldColor;
    Repaint;
end;

procedure TqFBoolControl.BlockCheck(Sender: TObject);
var
    ctrl: TControl;
begin
//    qFErrorDialog(qFControlBlocked);
    if (Sender is TControl) then
    begin
        ctrl := Sender as TControl;
        if (ctrl.Parent <> nil) then
            qFSafeFocusControl(ctrl.Parent);
    end;
end;

procedure TqFBoolControl.Block(Flag: Boolean);
begin
    inherited Block(Flag);

    if Flag then
    begin
        if not FUseBlock then
        begin
            FOldOnEnterEvent := FCheckBox.OnEnter;
            FUseBlock := True;
        end;
        FCheckBox.OnEnter := BlockCheck;
    end
    else
        FCheckBox.OnEnter := FOldOnEnterEvent;
end;

procedure TqFBoolControl.Loaded;
begin
    FCheckBox.OnClick := FOnChange;

    inherited Loaded;
end;

procedure TqFBoolControl.SetValue(Val: Variant);
begin
    inherited SetValue(Val);

    if VarIsNull(Val) then
        FCheckBox.Checked := False
    else
        if (VarType(Val) = varString) and (FStoreAs = StoreAsTF) then
        begin
            if Val = 'T' then
                FCheckBox.Checked := True;
            if Val = 'F' then
                FCheckBox.Checked := False;
        end
        else
            if (VarType(Val) = varInteger) and (FStoreAs = StoreAs01) then
            begin
                if Val = 1 then
                    FCheckBox.Checked := True;
                if Val = 0 then
                    FCheckBox.Checked := False;
            end
            else
                FCheckBox.Checked := Val;
end;

function TqFBoolControl.GetValue: Variant;
begin
    Result := FCheckBox.Checked;
end;

constructor TqFBoolControl.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);

    FCheckBox := TCheckBox.Create(Self);
    FCheckBox.Parent := Self;
    Asterisk := False;
    Semicolon := False;
    Prepare;
end;

procedure TqFBoolControl.Resize;
begin
    inherited Resize;
    Prepare;
end;

procedure TqFBoolControl.Prepare;
begin
    FCheckBox.Font := Font;
    FCheckBox.Font.Color := LabelColor;
    FCheckBox.Top := (Height - FCheckBox.Height) div 2;
    FCheckBox.Width := Width;
    FCheckBox.Caption := DisplayName;
    if Semicolon then
        FCheckBox.Caption := FCheckBox.Caption + ':';
    if Asterisk then
        if Required then
            FCheckBox.Caption := '* ' + FCheckBox.Caption
        else
            FCheckBox.Caption := '  ' + FCheckBox.Caption;
end;

procedure TqFBoolControl.SetDisplayName(Name: string);
begin
    inherited SetDisplayName(Name);
    Prepare;
end;

procedure TqFBoolControl.SetRequired(Val: Boolean);
begin
    inherited SetRequired(Val);
    Prepare;
end;

procedure TqFBoolControl.SetSemicolon(Val: Boolean);
begin
    inherited SetSemicolon(Val);
    Prepare;
end;

procedure TqFBoolControl.SetAsterisk(Val: Boolean);
begin
    inherited SetAsterisk(Val);
    Prepare;
end;

procedure TqFBoolControl.SetLabelColor(Color: TColor);
begin
    inherited SetLabelColor(Color);
    Prepare;
end;

procedure Register;
begin
    RegisterComponents('qFControls', [TqFBoolControl]);
end;

procedure TqFBoolControl.LoadFromRegistry(reg: TRegistry); // vallkor
begin
    inherited LoadFromRegistry(reg);
    Value := (Reg.ReadString('Value') = 'T');
end;

procedure TqFBoolControl.SaveIntoRegistry(reg: TRegistry); // vallkor
var
    C: Char;
begin
    inherited SaveIntoRegistry(reg);

    if Value then
        c := 'T'
    else
        c := 'F';

    Reg.WriteString('Value', C);
end;

end.

