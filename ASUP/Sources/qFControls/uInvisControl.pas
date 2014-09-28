{*******************************************************************************
* uInvisControl                                                                *
*                                                                              *
* Библиотека компонентов для работы с формой редактирования (qFControls)       *
* Поле ввода, заполняемое в коде без участия пользователя (TInvisControl)      *
* Copyright ©  2005, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}

unit uInvisControl;

interface

uses
  SysUtils, Classes, Controls, uFControl, StdCtrls, Graphics, uLabeledFControl,
  Registry;

type
  TqFInvisControl = class(TqFControl)
  private
    FVal: Variant;
    FLabel: TLabel;

  protected
    procedure SetFieldName(FieldName: String); override;

  public
    constructor Create(AOwner: TComponent); override;
    function  ToString: String; override;
    procedure SetValue(Val: Variant);override;
    function  GetValue: Variant; override;

    procedure LoadFromRegistry(reg: TRegistry); override; // vallkor
    procedure SaveIntoRegistry(reg: TRegistry); override; // vallkor    
  end;

procedure Register;
{$R *.res}

implementation

uses qFTools, Dialogs;

procedure TqFInvisControl.SetValue(Val: Variant);
begin
    FVal := Val;
end;

function  TqFInvisControl.GetValue: Variant;
begin
    Result := FVal;
end;

function  TqFInvisControl.ToString: String;
begin
    Result := qFVariantToString(FVal);
end;

constructor TqFInvisControl.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);

    if csDesigning in ComponentState then
    begin
        FLabel := TLabel.Create(Self);
        FLabel.AutoSize := True;
        FLabel.Parent := Self;
        FLabel.Visible := True;
        FLabel.Caption := FieldName;
        FLabel.Font.Color := clBlue;
        FLabel.Color := clYellow;
    end
    else Visible := False;
end;

procedure Register;
begin
  RegisterComponents('qFControls', [TqFInvisControl]);
end;

procedure TqFInvisControl.LoadFromRegistry(reg: TRegistry);  // vallkor
begin
    inherited LoadFromRegistry(reg);
    // Для инвизибла непонятно как
end;

procedure TqFInvisControl.SaveIntoRegistry(reg: TRegistry);  // vallkor
begin
    inherited SaveIntoRegistry(reg);
    // Для инвизибла непонятно как    
end;

procedure TqFInvisControl.SetFieldName(FieldName: String);
begin
    inherited;
    FLabel.Caption := FieldName;
end;

end.
