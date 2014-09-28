{*******************************************************************************
* uLogicCheck                                                                  *
*                                                                              *
* Библиотека компонентов для работы с формой редактирования (qFControls)       *
* Компонент для проверки (TqFLogicCheck)                                       *
* Copyright ©  2005, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}

unit uLogicCheck;

interface

uses
    SysUtils, Classes, Controls, uFControl;

type
    TCheckEvent = procedure(Sender: TObject; var Error: string) of object;

    TqFLogicCheck = class(TGraphicControl)
    protected
        FCheckEnabled: Boolean;
        FOnCheck: TCheckEvent;
        FError: string;
        FLightControl: TqFControl;
    public
        function Check: Boolean; virtual;
        procedure Highlight(HighlightOn: Boolean); virtual;

        procedure Paint; override;
        constructor Create(AOwner: TComponent); override;

        procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    published
        property OnCheck: TCheckEvent read FOnCheck write FOnCheck;
        property Error: string read FError;
        property LightControl: TqFControl read FLightControl write FLightControl;
        property CheckEnabled: Boolean read FCheckEnabled write FCheckEnabled default True;
    end;

procedure Register;
{$R *.res}

implementation

function TqFLogicCheck.Check: Boolean;
begin
    FError := '';
    if FCheckEnabled then
        if Assigned(FOnCheck) then FOnCheck(Self, FError);
    Result := FError = '';
end;

procedure TqFLogicCheck.Highlight(HighlightOn: Boolean);
begin
    if LightControl <> nil then LightControl.Highlight(HighlightOn);
end;

constructor TqFLogicCheck.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);

    FError := '';
    Height := 21;
    Width := 36;
    Visible := False;
    FCheckEnabled := True;
end;


procedure TqFLogicCheck.Paint;
begin
    inherited;
    with Canvas do
    begin
        Rectangle(0, 0, Width, Height);
        Font.Color := $FF;
        TextOut(1, 3, 'Check!');
    end;
end;

procedure Register;
begin
    RegisterComponents('qFControls', [TqFLogicCheck]);
end;

procedure TqFLogicCheck.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
    if ( AComponent = LightControl ) and ( Operation = opRemove ) then
        FLightControl := nil;
end;

end.

