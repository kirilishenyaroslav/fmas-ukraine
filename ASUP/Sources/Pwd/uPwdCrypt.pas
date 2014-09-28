{*******************************************************************************
* uPwdCrypt                                                                    *
*                                                                              *
* Простейшее шифрование пароля                                                 *
* Copyright ©  2005, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}


unit uPwdCrypt;

interface

function PwdCrypt(const s: String): String;

implementation

uses TypInfo, uCrUtils;

function PwdCrypt(const s: String): String;
begin
     PwdCrypt:='';
end;


end.
