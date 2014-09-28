{*******************************************************************************
* uFControl                                                                    *
*                                                                              *
* Библиотека компонентов для работы с формой редактирования (qFControls)       *
* Базовый класс (TqFControl)                                                   *
* Copyright ©  2005, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}

unit uFControl;

interface

uses Controls, Graphics, Classes, DB, Registry;

type
    TqFControl = class(TWinControl)
    private
        FFieldName: String;
        FDisplayName: String;
        FInterval: Integer;
        FLabelColor: TColor;
        FRequired: Boolean;
        FSemicolon: Boolean;
        FAsterisk: Boolean;
        FEnabled: Boolean;
        FDefault: Variant;
        FBlocked: Boolean;
        FAutoSaveToRegistry : Boolean;  // vallkor

    protected
        FOnChange: TNotifyEvent;
        FOldColor: TColor;

        procedure SetDisplayName(Name: String); virtual;
        procedure SetInterval(Int: Integer); virtual;
        procedure SetLabelColor(Color: TColor); virtual;
        procedure SetSemicolon(Val: Boolean); virtual;
        procedure SetAsterisk(Val: Boolean); virtual;
        procedure SetRequired(Val: Boolean); virtual;

        procedure SetValue(Val: Variant); virtual;
        function  GetValue: Variant; virtual;

        procedure Loaded; override;

        procedure SetFieldName(FieldName: String); virtual;

    public
        constructor Create(AOwner: TComponent); override;
        function Check: String; virtual;
        procedure Highlight(HighlightOn: Boolean); virtual;
        procedure ShowFocus; virtual;
        function  ToString: String; virtual;
        procedure Block(Flag: Boolean); virtual;
        procedure Clear; virtual;
        procedure Load(DataSet: TDataSet); virtual;
        procedure LoadFromRegistry(reg: TRegistry); virtual;
        procedure SaveIntoRegistry(reg: TRegistry); virtual;


    published
        property FieldName: String read FFieldName write SetFieldName;
        property DisplayName: String read FDisplayName write SetDisplayName;
        property Interval: Integer read FInterval write SetInterval;
        property Value: Variant read GetValue write SetValue;
        property LabelColor: TColor read FLabelColor write SetLabelColor;
        property Required: Boolean read FRequired write SetRequired;
        property Semicolon: Boolean read FSemicolon write SetSemicolon;
        property Asterisk: Boolean read FAsterisk write SetAsterisk;
        property Enabled: Boolean read FEnabled write FEnabled;

        property OnChange: TNotifyEvent read FOnChange write FOnChange;
        property Default: Variant read FDefault write FDefault;

        property Blocked: Boolean read FBlocked write Block;

        property TabOrder;

        property AutoSaveToRegistry : Boolean read FAutoSaveToRegistry write FAutoSaveToRegistry; // vallkor
    end;

implementation

uses qFStrings, Variants, SysUtils, ComCtrls;

constructor TqFControl.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    FLabelColor := qFDefaultLabelColor;
    FInterval := qFDefaultInterval;
    Width := qFDefaultWidth;
    Height := qFDefaultHeight;
    FDisplayName := qFDefaultDisplayName;
    FRequired := True;
    FSemicolon := True;
    FAsterisk := True;
    FEnabled := True;

    ParentBackground := True;
end;

procedure TqFControl.Load(DataSet: TDataSet);
var
    field: TField;
begin
    if not Enabled then Exit;
    if DataSet.IsEmpty then Exit;

    field := DataSet.FindField(UpperCase(FFieldName));

    if field <> nil then Value := field.Value;
end;

procedure TqFControl.Loaded;
begin
    if ( not VarIsNull(Default) ) and ( not VarIsEmpty(Default) ) then
        Value := Default;
end;

procedure TqFControl.Clear;
begin
    if not Blocked then Value := Null;
end;


procedure TqFControl.Block(Flag: Boolean);
begin
    FBlocked := Flag;
end;

function TqFControl.Check: String;
begin
    Result := '';
end;

procedure TqFControl.Highlight(HighlightOn: Boolean);
var
    tab: TTabSheet;
begin
    if Parent is TTabSheet then
    begin
        tab := Parent as TTabSheet;
        if tab.Parent is TPageControl then
           (tab.Parent as TPageControl).ActivePage := tab;
    end;
end;

procedure TqFControl.SetRequired(Val: Boolean);
begin
    FRequired := Val;
end;

function  TqFControl.ToString: String;
begin
    Result := Null;
end;

procedure TqFControl.SetSemicolon(Val: Boolean);
begin
    FSemicolon := Val;
end;

procedure TqFControl.SetAsterisk(Val: Boolean);
begin
    FAsterisk := Val;
end;

procedure TqFControl.ShowFocus;
var
    tab: TTabSheet;
begin
    if Parent is TTabSheet then
    begin
        tab := Parent as TTabSheet;
        if tab.Parent is TPageControl then
           (tab.Parent as TPageControl).ActivePage := tab;
    end;
end;

procedure TqFControl.SetValue(Val: Variant);
begin
end;

function TqFControl.GetValue: Variant;
begin
    Result := Null;
end;

procedure TqFControl.SetDisplayName(Name: String);
begin
    FDisplayName := Name;
end;

procedure TqFControl.SetInterval(Int: Integer);
begin
    FInterval := Int;
end;

procedure TqFControl.SetLabelColor(Color: TColor);
begin
    FLabelColor := Color;
end;

procedure TqFControl.LoadFromRegistry(reg: TRegistry);
begin
end;

procedure TqFControl.SaveIntoRegistry(reg: TRegistry);
begin
end;

procedure TqFControl.SetFieldName(FieldName: String);
begin
    FFieldName := FieldName;
end;

end.
