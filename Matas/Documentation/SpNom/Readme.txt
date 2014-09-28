Номенклатор, версия от 22.03.2005

Bpl - пакет самого справочника
Example - пример использования

Входные параметры:
function GetNomnEx(aOwner:TComponent; {объект-создатель}
                   DBHANDLE : TISC_DB_HANDLE; {Handle}
                   aFS: TFormStyle;   {стиль формы: fsModal или fsMDIChild}
                     aID_USER : INT64; {ид.пользователя}
                     aID_NOMN: int64;  {ид.номенклатуры, если >0, то пытаемся позицироваться}
                     aID_PROP: int64;  {ид. свойства, если >0, то фильтруем записи по свойству}
                     aNType: integer;  {фильтр на тип записей: 0 - все, 1 -  ТМЦ, 2 - услуги}
                     aMView: integer;  {=0, пока не используется }
                     aMSelect:integer; {тип выбора записей: 
                                          0 - выбор одной записи, 
					  1 - мультивыбор записей, 
					  2 - выбор группы }
                     aLang: integer =0 {язык интерфейса: 0 - русский (по умолчанию), 1 - украинский}
  ):Variant;stdcall;

Выходные параметры:
 Res[0] - ID_NOMN (идентификатор)
 Res[1] - NAME (название)
 Res[2] - ID_UNIT (ид.ед.измерения)
 Res[3] - UNIT (ед.измерения)
 Res[4] - Price (цена)
 Res[5] - ID_SCH (ид. счета)
 Res[6] - SCH_NAME (название счета с номером)
 Res[7] - SCH_NUMBER (номер счета)
 Res[8] - LINKTO (ссылка на группу)
 Res[9] - TIP (тип: 0 - группа, 1 - номенклатура)
 Res[10]- NTYPE (тип номенклатуры: 1 - ТМЦ, 2 - услуги)

Данные берутся из 
MAT_SP_NOM_BASE (
    ID_NOMN  TKEY,
    LINKTO   TKEY,
    NOMN     TVARCHAR20,
    NAME     TVARCHAR50,
    ID_UNIT  TKEY_MAYNULL,
    PRICE    TCURRENCY,
    TIP      TBOOLEAN_EX,
    NTYPE    TSMALLINT NOT NULL,
    ID_SCH   TKEY_MAYNULL
);

Единицы измерения храняться в таблице 
PUB_SP_UNIT_MEAS (
    ID_UNIT_MEAS    TKEY,
    ID_GROUP_UNIT   TKEY,
    NAME_UNIT_MEAS  TVARCHAR100,
    SHORT_NAME      TVARCHAR100,
    COEFF           TCURRENCY,
    ID_SERVER       TINTEGER,
    USE_BEG         TTIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);