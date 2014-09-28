{*******************************************************************************
* uSpravControl                                                                *
*                                                                              *
* Библиотека компонентов для работы с формой редактирования (qFControls)       *
* Работа со справочником (TqFSpravControl)                                     *
* Copyright ©  2005-2007, Олег Г. Волков, Донецкий Национальный Университет    *
*******************************************************************************}

unit uSpravControl;

interface

uses
  SysUtils, Classes, Controls, uFControl, StdCtrls, Graphics, uLabeledFControl,
    DB, Registry;

type
  TCallSpravEvent = procedure (Sender: TObject; var Value: Variant;
        var DisplayText: String) of object;

  TqFSpravControl = class(TqFLabeledControl)
  private
    FEdit: TEdit;
    FButton: TButton;
    FValue: Variant;
    FDisplayTextField: String;

    FOnOpenSprav: TCallSpravEvent;

    procedure OnKey(Sender: TObject; var Key: Word; Shift: TShiftState);

  protected
    function GetValue: Variant; override;
    procedure SetValue(Val: Variant); override;

    procedure ButtonClick(Sender: TObject);

    procedure PrepareRest; override;

    procedure SetDisplayText(text: Variant);
    function GetDisplayText: Variant;

    procedure Change(Sender: TObject);

    function GetKeyDown: TKeyEvent;
    procedure SetKeyDown(e: TKeyEvent);
    function GetKeyUp: TKeyEvent;
    procedure SetKeyUp(e: TKeyEvent);

  public
    constructor Create(AOwner: TComponent); override;
    function Check: String; override;

    procedure Highlight(HighlightOn: Boolean); override;
    procedure ShowFocus; override;

    function  ToString: String; override;

    procedure Block(Flag: Boolean); override;

    procedure Clear; override;

    procedure Load(DataSet: TDataSet); override;

    procedure OpenSprav;

    procedure LoadFromRegistry(reg: TRegistry); override; // vallkor
    procedure SaveIntoRegistry(reg: TRegistry); override; // vallkor

  published
    property OnOpenSprav: TCallSpravEvent read FOnOpenSprav write FOnOpenSprav;
    property DisplayText: Variant read GetDisplayText write SetDisplayText;
    property DisplayTextField: String read FDisplayTextField write FDisplayTextField;

    property OnKeyDown: TKeyEvent read GetKeyDown write SetKeyDown;
    property OnKeyUp: TKeyEvent read GetKeyUp write SetKeyUp;
  end;

procedure Register;
{$R *.res}

implementation

uses qFStrings, Variants, Windows, qFTools, Dialogs;

function TqFSpravControl.GetKeyDown: TKeyEvent;
begin
    Result := FEdit.OnKeyDown;
end;

procedure TqFSpravControl.SetKeyDown(e: TKeyEvent);
begin
    FEdit.OnKeyDown := e;
end;

function TqFSpravControl.GetKeyUp: TKeyEvent;
begin
    Result := FEdit.OnKeyUp;
end;

procedure TqFSpravControl.SetKeyUp(e: TKeyEvent);
begin
    FEdit.OnKeyUp := e;
end;


procedure TqFSpravControl.Load(DataSet: TDataSet);
var
    field: TField;
begin
    inherited Load(DataSet);

    if not Enabled then Exit;
    if ( DataSet = nil ) or DataSet.IsEmpty then Exit;

    field := DataSet.FindField(UpperCase(FDisplayTextField));

    if ( field <> nil ) and ( not VarIsNull(field.Value)) then
        DisplayText := field.Value;
end;

procedure TqFSpravControl.OnKey(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if ( ssCtrl in Shift) and ( Key = VK_RETURN ) then OpenSprav;
    if ( Key = VK_BACK ) then Clear;
    if ( ssCtrl in Shift ) and ( ssAlt in Shift ) and ( ssShift in Shift ) and
        (Key = ord('Z')) then ShowMessage(Coalesce(FieldName,'') + ': ' +
            Coalesce(ToString, 'Null'));
end;

procedure TqFSpravControl.Change(Sender: TObject);
begin
    if not ( VarIsNull(Value) or VarIsEmpty(Value) ) then
        Asterisk := False;
    if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TqFSpravControl.SetValue(Val: Variant);
begin
    inherited SetValue(Val);

    FValue := Val;
    Change(Self);
end;

procedure TqFSpravControl.Clear;
begin
    if not Blocked then
    begin
        inherited Clear;
        DisplayText := '';
    end;
end;

procedure TqFSpravControl.SetDisplayText(text: Variant);
begin
    if not VarIsNull(text) then FEdit.Text := text
    else FEdit.Text := '';
end;

function TqFSpravControl.GetDisplayText: Variant;
begin
    Result := FEdit.Text;
end;

procedure TqFSpravControl.Block(Flag: Boolean);
begin
    inherited Block(Flag);
    FButton.Enabled := not Flag;
    if Flag then
        FEdit.Color := qFBlockedColor
    else FEdit.Color := FOldColor;
    FEdit.Repaint;
    Repaint;
end;

procedure TqFSpravControl.Highlight(HighlightOn: Boolean);
begin
    inherited Highlight(HighlightOn);
    if HighlightOn then
        FEdit.Color := qFHighlightColor
    else
    if FOldColor <> 0 then FEdit.Color := FOldColor;
    Repaint;
end;

procedure TqFSpravControl.ShowFocus;
begin
    inherited ShowFocus;
    qFSafeFocusControl(FEdit);
end;

function  TqFSpravControl.ToString: String;
begin
    if VarIsNull(FValue) then Result := 'Null'
    else
    begin
        Result := FValue;
        if ( VarType(FValue) = varString ) or ( VarType(FValue) = varDate ) then
            Result := QuotedStr(Result);
    end;
end;

function TqFSpravControl.Check: String;
begin
    if Required then
        if VarIsNull(Value) then
            Check := qFFieldIsEmpty + '"' + DisplayName + '"!'
        else Check := ''
    else Check := '';
end;

function TqFSpravControl.GetValue: Variant;
begin
    Result := FValue;
end;

constructor TqFSpravControl.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);

    FValue := Null;

    FEdit := TEdit.Create(Self);
    FEdit.Parent := Self;
    FEdit.ReadOnly := True;
    FEdit.OnKeyDown := OnKey;
    FEdit.ShowHint := True;
    FEdit.Hint := qFSpravHint;

    FEdit.Color := qFSpravColor;
    FOldColor := FEdit.Color;

    FButton := TButton.Create(Self);
    FButton.Parent := Self;
    FButton.OnClick := ButtonClick;
    FButton.TabStop := False;

    PrepareRest;
end;

procedure TqFSpravControl.OpenSprav;
var
    DisplayText: String;
begin
    if not FButton.Enabled then Exit;

    if Assigned(FOnOpenSprav) and Enabled then
    begin
        DisplayText := FEdit.Text;
        FOnOpenSprav(Self, FValue, DisplayText);
        FEdit.Text := DisplayText;
        Change(Self);
    end;
end;

procedure TqFSpravControl.ButtonClick(Sender: TObject);
begin
    OpenSprav;
end;

procedure TqFSpravControl.PrepareRest;
begin
    inherited;

    FEdit.Width := Width - Interval - 3 - qFDButtonSize;
    FEdit.Left := Interval;
    FEdit.Top := (Height - FEdit.Height) div 2;

    FButton.Width := qFDButtonSize;
    FButton.Height := qFDButtonSize;
    FButton.Left := Interval + FEdit.Width;
    FButton.Caption := '...';
    FButton.Top := (Height - FEdit.Height) div 2;
end;

procedure Register;
begin
  RegisterComponents('qFControls', [TqFSpravControl]);
end;

procedure TqFSpravControl.LoadFromRegistry(reg: TRegistry);  // vallkor
begin
    inherited LoadFromRegistry(reg);
    Value := Reg.ReadInteger('Value');
    DisplayText := Reg.ReadString('DisplayText');
end;

procedure TqFSpravControl.SaveIntoRegistry(reg: TRegistry);  // vallkor
begin
    inherited SaveIntoRegistry(reg);

    if not VarIsNull(Value) then
    begin
        Reg.WriteInteger('Value', Value);
        Reg.WriteString('DisplayText', DisplayText);
    end;
end;

end.
