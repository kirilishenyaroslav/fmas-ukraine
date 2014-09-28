unit Fun;


interface

uses
  Registry,Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

implementation

procedure SaveParam(Left,Top,Width,Height:integer);
  var
    Reg:TRegistry;
begin
  Reg:=TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\LenaSoft\Dogovor', True) then
    begin
      Reg.WriteInteger('Left',Left);
      Reg.WriteInteger('Top',Top);
      Reg.WriteInteger('Width',Width);
      Reg.WriteInteger('Height',Height);
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;


end;
///////////////////////////////////////////////////////////////////////////
procedure LoadParam(var Left,Top,Width,Height:integer);
  var
    Reg:TRegistry;
    a:integer;
begin
  Reg:=TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\LenaSoft\Dogovor', True) then
    begin

      a:=Reg.ReadInteger('Left');
      if(a>0)then Left:=a;
      a:=Reg.ReadInteger('Top');
      if(a>0)then Top:=a;
      a:=Reg.ReadInteger('Width');
      if(a>0)then Width:=a;
      a:=Reg.ReadInteger('Height');
      if(a>0)then Height:=a;
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;


end;
end.
