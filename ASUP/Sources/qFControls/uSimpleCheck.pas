{*******************************************************************************
* uSimpleCheck                                                                 *
*                                                                              *
* Библиотека компонентов для работы с формой редактирования (qFControls)       *
* Компонент для простой проверки (TqFSimpleCheck)                              *
* Copyright ©  2005, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}

unit uSimpleCheck;

interface

uses
    SysUtils, Classes, Controls, uFControl, uLogicCheck;

type
    TCheckEvent = procedure(Sender: TObject; var Error: string) of object;

    TqFSimpleCheck = class(TqFLogicCheck)
    private
        FLeft: TqFControl;
        FRight: TqFControl;
        FErrorMessage: string;

    public
        procedure Notification(AComponent: TComponent; Operation: TOperation); override;

        function Check: Boolean; override;
        procedure Highlight(HighlightOn: Boolean); override;

        procedure Paint; override;

    published
        property Left: TqFControl read FLeft write FLeft;
        property Right: TqFControl read FRight write FRight;
        property ErrorMessage: string read FErrorMessage write FErrorMessage;
    end;

procedure Register;
{$R *.res}

implementation

uses qFStrings;

function TqFSimpleCheck.Check: Boolean;
begin
    FError := '';
    if CheckEnabled then
        if Assigned(FOnCheck) then FOnCheck(Self, FError)
        else
            if (FLeft <> nil) and (FRight <> nil) then
                if FLeft.Value > FRight.Value then
                begin
                    if FErrorMessage <> '' then FError := FErrorMessage
                    else FError := qFPeriodError + qFMustBe + ' "' + FLeft.DisplayName + '" не більш за "' +
                        FRight.DisplayName + '"!';
                    if FLeft <> nil then FLeft.ShowFocus
                    else
                    if FRight <> nil then FLeft.ShowFocus
                end;
    Result := FError = '';
end;

procedure TqFSimpleCheck.Highlight(HighlightOn: Boolean);
begin
    inherited Highlight(HighlightOn);
    if FLeft <> nil then FLeft.Highlight(HighlightOn);
    if FRight <> nil then FRight.Highlight(HighlightOn);
end;

procedure TqFSimpleCheck.Notification(AComponent: TComponent;
    Operation: TOperation);
begin
    inherited;
    if (Left = AComponent) and (Operation = opRemove) then
        Left := nil;

    if (Right = AComponent) and (Operation = opRemove) then
        Right := nil;
end;

procedure TqFSimpleCheck.Paint;
begin
    inherited;
    with Canvas do
    begin
        Rectangle(0, 0, Width, Height);
        Font.Color := $FF;
        TextOut(1, 3, '<=?');
    end;
end;

procedure Register;
begin
    RegisterComponents('qFControls', [TqFSimpleCheck]);
end;


end.

