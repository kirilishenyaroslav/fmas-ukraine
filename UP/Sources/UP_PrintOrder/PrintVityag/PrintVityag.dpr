program PrintVityag;

uses
  Forms,
  SysUtils,
  OrderV in 'OrderV.pas' {fmPrintOrder};

{$R *.res}

var
  T : TUP_PrintOrder;
begin
  Application.Initialize;
  id_ord        := StrToInt64(ParamStr(1));
  shrift        := StrToInt64(ParamStr(2));
  id_session    := StrToInt64(ParamStr(3));
  T             := TUP_PrintOrder.Create;
  T.Show;
  Application.Title := 'Друк виписки наказів';
  Application.Run;
end.

