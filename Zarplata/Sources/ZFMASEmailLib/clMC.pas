{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clMC;

interface

{$I clVer.inc}

uses
  Classes, clMailMessage, clTcpClient;
 
type
  TclCustomMail = class(TclTcpCommandClient)
  private
    FMailMessage: TclMailMessage;
    FUseSPA: Boolean;
    procedure SetUseSPA(const Value: Boolean);
    procedure SetMailMessage(const Value: TclMailMessage);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    property UseSPA: Boolean read FUseSPA write SetUseSPA default False;
    property MailMessage: TclMailMessage read FMailMessage write SetMailMessage;
  end;

implementation

{ TclCustomMail }

constructor TclCustomMail.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FUseSPA := False;
end;

procedure TclCustomMail.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if  (AComponent = FMailMessage) and (Operation = opRemove) then
  begin
    FMailMessage := nil;
  end;
end;

procedure TclCustomMail.SetMailMessage(const Value: TclMailMessage);
begin
  if (FMailMessage <> Value) then
  begin
{$IFDEF DELPHI5}
    if (FMailMessage <> nil) then
    begin
      FMailMessage.RemoveFreeNotification(Self);
    end;
{$ENDIF}
    FMailMessage := Value;
    if (FMailMessage <> nil) then
    begin
      FMailMessage.FreeNotification(Self);
    end;
  end;
end;

procedure TclCustomMail.SetUseSPA(const Value: Boolean);
begin
  if (FUseSPA <> Value) then
  begin
    FUseSPA := Value;
    Changed();
  end;
end;

end.


