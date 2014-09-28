unit UPricesStep;

interface

uses Ibase, pFibDatabase, Forms, Dialogs;

type PRICE_INFO=packed record
     {Идентификаторы}
     ID_FACULTY    : Int64;
     ID_SPECIALITY : Int64;
     ID_GRAGDAN    : Int64;
     ID_FORM_TEATCH: Int64;
     ID_CATE_TEATCH: Int64;
     ID_CURS       : Int64;
     {Данные}
     C_FACULTY     : Integer;
     C_SPECIALITY  : Integer;
     C_GRAGDAN     : Integer;
     C_FORM_TEATCH : Integer;
     C_CATE_TEATCH : Integer;
     C_CURS        : Integer;
     T_FACULTY     : String;
     T_SPECIALITY  : String;
     T_GRAGDAN     : String;
     T_FORM_TEATCH : String;
     T_CATE_TEATCH : String;
     T_CURS        : String;
     {DB_Conf}
     DB            : TpFibDatabase;
     RTransaction  : TpFibTransaction;
     WTransaction  : TpFibTransaction;
     end;

     PPRICE_INFO=^PRICE_INFO;

     function Step3_GetFaculty(VPRICE_INFO:PPRICE_INFO):Integer;
     function Step4_GetSpeciality(VPRICE_INFO:PPRICE_INFO):Integer;
     function Step5_GetGragdanstvo(VPRICE_INFO:PPRICE_INFO):Integer;
     function Step6_GetFormTeatch(VPRICE_INFO:PPRICE_INFO):Integer;
     function Step7_GetKatTeach(VPRICE_INFO:PPRICE_INFO):Integer;
     function Step8_GetCurs(VPRICE_INFO:PPRICE_INFO):Integer;

implementation
uses UparamsReestr;

function Step3_GetFaculty(VPRICE_INFO:PPRICE_INFO):Integer;
begin
     //Работа с академическим годами
     ShowMessage('GetFaculty');
     Result:=1;
end;

function Step4_GetSpeciality(VPRICE_INFO:PPRICE_INFO):Integer;
begin
     //Работа с академическим годами
     ShowMessage('GetSpeciality');
     Result:=1;
end;

function Step5_GetGragdanstvo(VPRICE_INFO:PPRICE_INFO):Integer;
begin
     //Работа с академическим годами
     ShowMessage('GetGragdanstvo');
     Result:=1;
end;

function Step6_GetFormTeatch(VPRICE_INFO:PPRICE_INFO):Integer;
begin
     //Работа с академическим годами
     ShowMessage('GetFormTeatch');
     Result:=1;
end;

function Step7_GetKatTeach(VPRICE_INFO:PPRICE_INFO):Integer;
begin
     //Работа с академическим годами
     ShowMessage('GetKatTeach');
     Result:=1;
end;

function Step8_GetCurs(VPRICE_INFO:PPRICE_INFO):Integer;
begin
     //Работа с академическим годами
     Result:=1;
end;




end.
