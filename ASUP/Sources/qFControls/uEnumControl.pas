{*******************************************************************************
* uEnumControl                                                                 *
*                                                                              *
* Библиотека компонентов для работы с формой редактирования (qFControls)       *
* Работа со списоком (TqFEnumControl)                                          *
* Copyright ©  2005, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}

unit uEnumControl;

interface

uses
    SysUtils, Classes, Controls, uFControl, StdCtrls, Graphics, uLabeledFControl, Registry;

type
    TqFEnumControl = class(TqFLabeledControl)
    private
        FOldOnEnterEvent: TNotifyEvent;

        FCombo: TComboBox;
        FValues: array of Integer;

        procedure CloseCombo(Sender: TObject);

    protected
        procedure PrepareRest; override;

        procedure SetValue(Val: Variant); override;
        function GetValue: Variant; override;

        procedure Loaded; override;

        function GetItems: TStrings;
        procedure SetItems(const ValItems: TStrings);

        procedure SetValuesString(ValStr: string);
        function GetValuesString: string;

        
        function GetKeyDown: TKeyEvent;
        procedure SetKeyDown(e: TKeyEvent);
        function GetKeyUp: TKeyEvent;
        procedure SetKeyUp(e: TKeyEvent);
        
    public
        constructor Create(AOwner: TComponent); override;

        function Check: string; override;

        procedure Highlight(HighlightOn: Boolean); override;
        procedure ShowFocus; override;

        function ToString: string; override;

        procedure Block(Flag: Boolean); override;

        procedure LoadFromRegistry(reg: TRegistry); override; // vallkor
        procedure SaveIntoRegistry(reg: TRegistry); override; // vallkor
    published
        property Items: TStrings read GetItems write SetItems;
        property ValuesString: string read GetValuesString write SetValuesString;

        property OnKeyDown: TKeyEvent read GetKeyDown write SetKeyDown;
        property OnKeyUp: TKeyEvent read GetKeyUp write SetKeyUp;
    end;

procedure Register;
{$R *.res}

implementation

uses qFStrings, Variants, qFTools;

function TqFEnumControl.GetKeyDown: TKeyEvent;
begin
    Result := FCombo.OnKeyDown;
end;

procedure TqFEnumControl.SetKeyDown(e: TKeyEvent);
begin
    FCombo.OnKeyDown := e;
end;

function TqFEnumControl.GetKeyUp: TKeyEvent;
begin
    Result := FCombo.OnKeyUp;
end;

procedure TqFEnumControl.SetKeyUp(e: TKeyEvent);
begin
    FCombo.OnKeyUp := e;
end;

function TqFEnumControl.Check: string;
begin
    if Required then
        if VarIsNull(Value) then
            Check := qFFieldIsEmpty + '"' + DisplayName + '"!'
        else
            Check := ''
    else
        Check := '';
end;

procedure TqFEnumControl.CloseCombo(Sender: TObject);
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

procedure TqFEnumControl.Block(Flag: Boolean);
begin
    inherited Block(Flag);
    if Flag then
    begin
        FOldOnEnterEvent := FCombo.OnEnter;
        FCombo.OnEnter := CloseCombo;
        FCombo.Color := qFBlockedColor;
    end
    else
    begin
        FCombo.OnEnter := FOldOnEnterEvent;
        FCombo.Color := FOldColor;
    end;
end;

function TqFEnumControl.GetItems: TStrings;
begin
    Result := FCombo.Items;
end;

procedure TqFEnumControl.SetItems(const ValItems: TStrings);
var
    cnt, val, i: Integer;
begin
    FCombo.Items := ValItems;

    cnt := Length(FValues);
    SetLength(FValues, ValItems.Count);

    if Length(FValues) > cnt then
    begin
        if cnt = 0 then
            val := 0
        else
            val := FValues[cnt - 1];

        for i := cnt to High(FValues) do
            FValues[i] := val + i - cnt + 1;
    end;
end;

procedure TqFEnumControl.Highlight(HighlightOn: Boolean);
begin
    inherited Highlight(HighlightOn);
    if HighlightOn then
        FCombo.Color := qFHighlightColor
    else
        if FOldColor <> 0 then
            FCombo.Color := FOldColor;
    Repaint;
end;

procedure TqFEnumControl.ShowFocus;
begin
    inherited ShowFocus;
    qFSafeFocusControl(FCombo);
end;


procedure TqFEnumControl.SetValuesString(ValStr: string);
var
    i, val, p: Integer;
    s, numstr: string;
begin
    i := 0;
    val := 0;
    s := ValStr;
    while s <> '' do
    begin
        p := Pos(',', s);

        if p = 0 then
        begin
            numStr := s;
            s := '';
        end
        else
        begin
            numstr := Copy(s, 1, p - 1);
            s := Copy(s, p + 1, Length(s) - p);
        end;

        val := StrToIntDef(Trim(numStr), val + 1);

        if i > High(FValues) then
            SetLength(FValues, i + 1);

        FValues[i] := val;
        inc(i);
    end;
end;

function TqFEnumControl.GetValuesString: string;
var
    i: Integer;
begin
    Result := '';
    for i := 0 to High(FValues) do
        if Result = '' then
            Result := Result + IntToStr(FValues[i])
        else
            Result := Result + ',' + IntToStr(FValues[i]);
end;

function TqFEnumControl.ToString: string;
begin
    if VarIsNull(Value) then
        Result := 'Null'
    else
        Result := IntToStr(Value);
end;

procedure TqFEnumControl.SetValue(Val: Variant);
var
    i: Integer;
begin
    inherited SetValue(Val);

    if VarIsNull(Val) then
        FCombo.ItemIndex := -1
    else
    begin
        for i := 0 to High(FValues) do
            if FValues[i] = Val then
                FCombo.ItemIndex := i;
    end;
end;

function TqFEnumControl.GetValue: Variant;
begin
    if (FCombo.ItemIndex < 0) or (FCombo.ItemIndex > High(FValues)) then
        Result := Null
    else
        Result := FValues[FCombo.ItemIndex];
end;

constructor TqFEnumControl.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);

    FCombo := TComboBox.Create(Self);
    FCombo.Parent := Self;
    FCombo.Style := csDropDownList;
    SetLength(FValues, 0);
    PrepareRest;

    FOldColor := FCombo.Color;
end;

procedure TqFEnumControl.Loaded;
begin
    FCombo.OnChange := FOnChange;

    inherited Loaded;
end;

procedure TqFEnumControl.PrepareRest;
begin
    FCombo.Width := Width - Interval - 3;
    FCombo.Height := qFDefaultHeight;
    FCombo.Left := Interval;
    FCombo.Top := (Height - FCombo.Height) div 2;
    FCombo.Repaint;
end;

procedure Register;
begin
    RegisterComponents('qFControls', [TqFEnumControl]);
end;

procedure TqFEnumControl.LoadFromRegistry(reg: TRegistry); // vallkor
begin
    inherited LoadFromRegistry(reg);
    Value := Reg.ReadInteger('Value');
end;

procedure TqFEnumControl.SaveIntoRegistry(reg: TRegistry); // vallkor
begin
    inherited SaveIntoRegistry(reg);

    Reg.WriteInteger('Value', Value);
end;

end.

