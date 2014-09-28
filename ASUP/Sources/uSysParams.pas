unit uSysParams;

interface

var
    DBLogin, DBPassword: string;

implementation

initialization
    DBLogin := 'SYSDBA';
    DBPassword := 'masterkey';

end.
