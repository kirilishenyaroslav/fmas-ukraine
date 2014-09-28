program PrintOrder;

uses
  Forms,
  SysUtils,
  Order in 'Order.pas' {fmPrintOrder};

{$R *.res}

var
  T : TUP_PrintOrder;
begin
  Application.Initialize;
  id_ord        := StrToInt64(ParamStr(1));
  shrift        := StrToInt64(ParamStr(2));
  T             := TUP_PrintOrder.Create;
  T.Show;
  Application.Title := 'Друк наказу';
  Application.Run;
end.

