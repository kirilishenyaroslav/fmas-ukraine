unit JO5_PackageConst;

interface

const Bpl_ZAccess_Name           = 'JO5\JO5_Access.bpl';
const Bpl_Jo5_RegSch_Name        = 'JO5\JO5_RegSch.bpl';
const Bpl_Jo5_KorToSch_Name      = 'JO5\JO5_KorToSch.bpl';
const Bpl_Jo5_DopKorToSch_Name   = 'JO5\JO5_DopKorToSch.bpl';
const Bpl_Jo5_Print_Name         = 'JO5\JO5_Print.bpl';
const Bpl_GetJo5SchSaldo_Name    = 'JO5\SaldoBySmRzSt.bpl';
const Bpl_PrintJournal_Name      = 'JO5\JO5_SetPrtJrnlParams7.bpl';

const Func_ZAccess_Name          = 'AccessZarplata';
const Func_Jo5_RegSch_Name       = 'View_Jo5_RegSch';
const Func_Jo5_KorToSch_Name     = 'View_Jo5_KorToSch';
const Func_Jo5_DopKorToSch_Name  = 'View_Jo5_DopKorToSch';
const Func_Jo5_Print_Name        = 'View_Jo5_Print';
const Func_GetJo5SchSaldo_Name   = 'GetJO5SchSaldo';
const Func_PrintJournal_Name     = 'PrintJournal';

const Bpl_Jo5_WorkRemnants  :array [1..2] of string=('JO5\JO5_WorkRemnants.bpl','Viev_Jo5_WorkRemnants');
const Bpl_Jo5_Saldo         :array [1..2] of string=('JO5\Jo5_Saldo.bpl','Viev_Jo5_Saldo');
const Bpl_Jo5_SaldoEdit     :array [1..2] of string=('JO5\Jo5_SaldoEdit.bpl','Viev_Jo5_SaldoEdit');

const Error_Caption             = 'Помилка';
const Load_Error                = 'Файл пакета не найдено!!!';

implementation

end.
