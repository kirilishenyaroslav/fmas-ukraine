{*******************************************************************************
* uLabeledFControl                                                             *
*                                                                              *
* Библиотека компонентов для работы с формой редактирования (qFControls)       *
* Базовый класс для компонента с надписью слева (TqFLabeledControl)            *
* Copyright ©  2005, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}

unit uLabeledFControl;

interface

uses
  SysUtils, Classes, Controls, uFControl, StdCtrls, Graphics;

type
  TqFLabeledControl = class(TqFControl)
  protected
    IsCreated: Boolean;
    FLabel: TLabel;

    procedure PrepareLabel;

    procedure SetLabelPosition; virtual;

    procedure SetDisplayName(Name: String); override;
    procedure SetLabelColor(Color: TColor); override;
    procedure SetSemicolon(Val: Boolean); override;
    procedure SetAsterisk(Val: Boolean); override;
    procedure SetRequired(Val: Boolean); override;

    procedure SetInterval(Int: Integer); override;
    procedure Resize; override;
    procedure PrepareRest; virtual;

  public
    constructor Create(AOwner: TComponent); override;
    procedure ShowFocus; override;

    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
  end;

implementation

uses Types, qFStrings;

constructor TqFLabeledControl.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);

    FLabel := TLabel.Create(Self);
    FLabel.Parent := Self;
    PrepareLabel;

    IsCreated := True;
end;

procedure TqFLabeledControl.ShowFocus;
var
    p: TPoint;
begin
    inherited ShowFocus;
    
    p.X := qFMouseX + Interval;
    p.Y := qFMouseY;
    Mouse.CursorPos := FLabel.ClientToScreen(p);
end;


procedure TqFLabeledControl.Resize;
begin
    inherited Resize;
    PrepareRest;
    Repaint;
end;

procedure TqFLabeledControl.SetInterval(Int: Integer);
begin
    inherited SetInterval(Int);
    PrepareRest;
end;

procedure TqFLabeledControl.SetLabelPosition;
begin
    FLabel.Top := (Height - FLabel.Height) div 2;
end;

procedure TqFLabeledControl.PrepareLabel;
begin
    FLabel.Font := Font;
    FLabel.Font.Color := LabelColor;
    SetLabelPosition;
    FLabel.Caption := DisplayName;
    if Semicolon then FLabel.Caption := FLabel.Caption + ':';
    if Asterisk then
        if Required then FLabel.Caption := '* ' + FLabel.Caption
        else FLabel.Caption := '  ' + FLabel.Caption
    else FLabel.Caption := '  ' + FLabel.Caption;
end;

procedure TqFLabeledControl.SetDisplayName(Name: String);
begin
    inherited SetDisplayName(Name);
    PrepareLabel;
end;

procedure TqFLabeledControl.SetRequired(Val: Boolean);
begin
    inherited SetRequired(Val);
    PrepareLabel;
end;

procedure TqFLabeledControl.SetSemicolon(Val: Boolean);
begin
    inherited SetSemicolon(Val);
    PrepareLabel;
end;

procedure TqFLabeledControl.SetAsterisk(Val: Boolean);
begin
    inherited SetAsterisk(Val);
    PrepareLabel;
end;

procedure TqFLabeledControl.SetLabelColor(Color: TColor);
begin
    inherited SetLabelColor(Color);
    PrepareLabel;
end;

procedure TqFLabeledControl.PrepareRest;
begin
end;

procedure TqFLabeledControl.SetBounds(ALeft, ATop, AWidth,
  AHeight: Integer);
begin
  inherited;

  if IsCreated then PrepareRest;
end;

end.
