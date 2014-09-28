unit UPCPackMan;

interface
uses Forms, Windows, IBase, Dialogs, SysUtils, Variants, Classes, Controls,
     pFIBDataBase, IB_EXTERNALS;

// Вызов формы кредитовых или дебетовых документов
procedure ShowDocForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; is_debet_kredit:Integer);
// Вызов формы кредитовых или дебетовых документов (валюта)
procedure ShowDocValForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; state:Integer);
// Вызов формы основного отчета по проводкам
procedure ShowOborotForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);
// Вызов формы основного отчета (валюта) по проводкам
procedure ShowOborotValuteForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);
// Вызов формы оборотов по счетам
procedure ShowSchOborotForm(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);
// Вызов формы сальдо
procedure ShowSaldoForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);
// Вызов формы сальдо (валюта)
procedure ShowSaldoValForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);
// Вызов формы по выравниванию счетов
procedure ShowProvForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);
// Вызов формы по кассовому отчету
procedure ShowKassDayForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);
// Вызов формы по налоговым накладным
procedure ShowNaklForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE;  PERS_PAY_PERIOD:TDateTime; ID_REG:Integer; ID_USER:Integer);

implementation

procedure ShowDocForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; is_debet_kredit:Integer);
var
 hPack     : HModule;
 SpravProc : procedure (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; is_debet_kredit:Integer);stdcall;
begin
 hPack := GetModuleHandle('PCDocMain.bpl');
 if hPack < 32 then hPack := LoadPackage('PersonPay\PCDocMain.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowDocForm'));
  if @SpravProc <> nil then
  begin
   SpravProc(aOwner, aDBHANDLE, is_debet_kredit);
  end
 end else begin
  ShowMessage('Неможливо завантажити модуль PCDocMain.bpl');
 end;
end;

procedure ShowDocValForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; state:Integer);
var
 hPack     : HModule;
 SpravProc : procedure (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; state:Integer);stdcall;
begin
 hPack := GetModuleHandle('PCOboroti.bpl');
 if hPack < 32 then hPack := LoadPackage('PersonPay\PCOboroti.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowDocValForm'));
  if @SpravProc <> nil then
  begin
   SpravProc(aOwner, aDBHANDLE, state);
  end
 end else begin
  ShowMessage('Неможливо завантажити модуль PCOboroti.bpl');
 end;
end;

procedure ShowOborotForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);
var
 hPack     : HModule;
 SpravProc : procedure (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
begin
 hPack := GetModuleHandle('PCOboroti.bpl');
 if hPack < 32 then hPack := LoadPackage('PersonPay\PCOboroti.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowOborotForm'));
  if @SpravProc <> nil then
  begin
   SpravProc(aOwner, aDBHANDLE);
  end
 end else begin
  ShowMessage('Неможливо завантажити модуль PCOboroti.bpl');
 end;
end;

procedure ShowOborotValuteForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);
var
 hPack     : HModule;
 SpravProc : procedure (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
begin
 hPack := GetModuleHandle('PCOboroti.bpl');
 if hPack < 32 then hPack := LoadPackage('PersonPay\PCOboroti.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowOborotValuteForm'));
  if @SpravProc <> nil then
  begin
   SpravProc(aOwner, aDBHANDLE);
  end
 end else begin
  ShowMessage('Неможливо завантажити модуль PCOboroti.bpl');
 end;
end;

procedure ShowSchOborotForm(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);
var
 hPack     : HModule;
 SpravProc : procedure (aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);stdcall;
begin
 hPack := GetModuleHandle('PCSchOborot.bpl');
 if hPack < 32 then hPack := LoadPackage('PersonPay\PCSchOborot.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowSchOborotForm'));
  if @SpravProc <> nil then
  begin
   SpravProc(aOwner, DBHANDLE);
  end
 end else begin
  ShowMessage('Неможливо завантажити модуль PCSchOboroti.bpl');
 end;
end;

procedure ShowSaldoForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);
var
 hPack     : HModule;
 SpravProc : procedure (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
begin
 hPack := GetModuleHandle('PCSaldo.bpl');
 if hPack < 32 then hPack := LoadPackage('PersonPay\PCSaldo.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowSaldoForm'));
  if @SpravProc <> nil then
  begin
   SpravProc(aOwner, aDBHANDLE);
  end
 end else begin
  ShowMessage('Неможливо завантажити модуль PCSaldo.bpl');
 end;
end;

procedure ShowSaldoValForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);
var
 hPack     : HModule;
 SpravProc : procedure (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
begin
 hPack := GetModuleHandle('PCSaldo.bpl');
 if hPack < 32 then hPack := LoadPackage('PersonPay\PCSaldo.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowSaldoValForm'));
  if @SpravProc <> nil then
  begin
   SpravProc(aOwner, aDBHANDLE);
  end
 end else begin
  ShowMessage('Неможливо завантажити модуль PCSaldo.bpl');
 end;
end;

procedure ShowProvForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);
var
 hPack     : HModule;
 SpravProc : procedure (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
begin
 hPack := GetModuleHandle('PCSvodSch.bpl');
 if hPack < 32 then hPack := LoadPackage('PersonPay\PCSvodSch.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowProvForm'));
  if @SpravProc <> nil then
  begin
   SpravProc(aOwner, aDBHANDLE);
  end
 end else begin
  ShowMessage('Неможливо завантажити модуль PCSvodSch.bpl');
 end;
end;

procedure ShowKassDayForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);
var
 hPack     : HModule;
 SpravProc : procedure (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
begin
 hPack := GetModuleHandle('PCKasOtchet.bpl');
 if hPack < 32 then hPack := LoadPackage('PersonPay\PCKasOtchet.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowKassDayForm'));
  if @SpravProc <> nil then
  begin
   SpravProc(aOwner, aDBHANDLE);
  end
 end else begin
  ShowMessage('Неможливо завантажити модуль PCKasOtchet.bpl');
 end;
end;

procedure ShowNaklForm(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE;  PERS_PAY_PERIOD:TDateTime; ID_REG:Integer; ID_USER:Integer);
var
 hPack     : HModule;
 SpravProc : procedure (aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE;  PERS_PAY_PERIOD:TDateTime; ID_REG:Integer; ID_USER:Integer);stdcall;
begin
 hPack := GetModuleHandle('PC_NalogNakl.bpl');
 if hPack < 32 then hPack := LoadPackage('PersonPay\PC_NalogNakl.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('ShowNaklForm'));
  if @SpravProc <> nil then
  begin
   SpravProc(aOwner, aDBHANDLE, PERS_PAY_PERIOD, ID_REG, ID_USER);
  end
 end else begin
  ShowMessage('Неможливо завантажити модуль PC_NalogNakl.bpl');
 end;
end;
end.
