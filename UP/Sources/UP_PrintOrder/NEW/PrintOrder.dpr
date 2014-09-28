program PrintOrder;

uses
  Forms,
  SysUtils,
  fmUP_AcceptForm in 'fmUP_AcceptForm.pas' {UP_AcceptForm};

{$R *.res}
var
  order : TUP_PrintOrder;
begin
  Application.Initialize;
//  GLOBAL_HANDLE := StrToInt(ParamStr(1));
  id_ord        := StrToInt64(ParamStr(1));
  order := TUP_PrintOrder.Create;
  order.show;
  Application.Run;
end.
