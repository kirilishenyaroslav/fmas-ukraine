unit uneTypes;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uneTypes                                                                   *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Централизованное хранение пользовательских типов, констант и пр.           *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses Classes, Controls, DB, IBase;

resourcestring

	//Сообщения пользовательских исключительных ситуаций
	sELoadMethod             = 'Не удалось получить адрес метода ';
	sELoadPackage            = 'Не удалось загрузить пакет ';
	sEFileNotFound           = 'Файл не найден';
	sEConvertError           = 'Некорректное преобразование типов';
	sEFileNotFound1          = 'Файл ';
	sEFileNotFound2          = ' не найден';
	sEIniFileNotFound        = 'Конфигурационный файл не найден';
	sEInvalidConnectParams   = 'Параметры соединения отсутствуют или заданы некорректно';
	sEInvalidExpMethodParams = 'Входящие параметры для экспортируемого метода не найдены';

	//Составляющие сообщения об ошибке
	sErrorText    = '       Ошибка: ';
	sErrorCode    = 'Код ошибки: ';
	sErrorAddr    = 'Адрес ошибки: ';
	sErrorSearch  = ' не найден';
	sErrorTextExt = 'Ошибка: ';

	sMsgCaptionErr = 'Ошибка';
	sMsgCaptionWrn = 'Предупреждение';
	sMsgCaptionInf = 'Информация';
	sMsgCaptionQst = 'Подтверждение';

	sErrorTextRUS    = '       Ошибка: ';
	sErrorCodeRUS    = 'Код ошибки: ';
	sErrorAddrRUS    = 'Адрес ошибки: ';
	sErrorSearchRUS  = ' не найден';
	sErrorTextExtRUS = 'Ошибка: ';

	sErrorTextUA    = '       Помилка: ';
	sErrorCodeUA    = 'Код помилки: ';
	sErrorAddrUA    = 'Адреса помилки: ';
	sErrorSearchUA  = ' не знайдено';
	sErrorTextExtUA = 'Помилка: ';

	sMsgCaptionErrRUS = 'Ошибка';
	sMsgCaptionWrnRUS = 'Предупреждение';
	sMsgCaptionInfRUS = 'Информация';
	sMsgCaptionQstRUS = 'Подтверждение';

	sMsgCaptionErrUA = 'Помилка';
	sMsgCaptionWrnUA = 'Попередження';
	sMsgCaptionInfUA = 'Інформація';
	sMsgCaptionQstUA = 'Підтвердження';

	//Имя конфигурационного файла
	sLOG_FILE_NAME  = 'JO5Errors.log';
	sINI_FILE_NAME  = 'Config.ini';

	//Название ключей в главной секции конфигурационного INI - файла
	sPATH           = 'Path';
	sSERVER         = 'Server';
	sPASSWORD       = 'Password';
	sUSER_NAME      = 'User';
	sCHAR_SET       = 'CharSet';
	sSQL_DIALECT    = 'SQLDialect';
	sLOG_FILE_PATH  = 'PathLog';

    //Сообщения для ИС сторонних разработчиков
    sMsgKernelError = 'Ошибка ядра: ';

	//Названия месяцев на русском языке
	sMAY_RUS       = 'Май';
	sJUNE_RUS      = 'Июнь';
	sJULY_RUS      = 'Июль';
	sMARCH_RUS     = 'Март';
	sAPRIL_RUS     = 'Апрель';
	sAUGEST_RUS    = 'Август';
	sOCTOBER_RUS   = 'Октябрь';
	sJANUARY_RUS   = 'Январь';
	sFEBRUARY_RUS  = 'Февраль';
	sNOVEMBER_RUS  = 'Ноябрь';
	sDECEMBER_RUS  = 'Декабрь';
	sSEPTEMBER_RUS = 'Сентябрь';

	//Названия месяцев на украинском языке
	sMAY_UA       = 'Травень';
	sJUNE_UA      = 'Червень';
	sJULY_UA      = 'Липень';
	sMARCH_UA     = 'Березень';
	sAPRIL_UA     = 'Квітень';
	sAUGEST_UA    = 'Серпень';
	sOCTOBER_UA   = 'Жовтень';
	sJANUARY_UA   = 'Січень';
	sNOVEMBER_UA  = 'Листопад';
	sDECEMBER_UA  = 'Грудень';
	sFEBRUARY_UA  = 'Лютий';
	sSEPTEMBER_UA = 'Вересень';

	//Текст для секции "соединение" строки состояния
	sStatusBarConnectionUA  = 'База даних: ';
	sStatusBarConnectionRUS = 'База данных: ';

	//Текст для секции "пользователь" строки состояния
	sStatusBarUserUA        = 'Користувач: ';
	sStatusBarUserRUS       = 'Пользователь: ';

	//Текст для секции "текущий период" строки состояния
	sMMenuCurrPeriodUA     = 'Поточний період: ';
	sMMenuCurrPeriodRUS    = 'Текущий период: ';

type

	//Перечисляемый тип для определения типа параметров печати журнала
    //НЕ ИЗМЕНЯТЬ ПОСЛЕДОВАТЕЛЬНОСТЬ ЭЛ-ОВ!!!
	TEnm_PrtJrnlParams     = ( jpSch, jpSubSch, jpGrSmet, jpSmet, jpRazd, jpStat, jpKekv );

	//Перечисляемый тип для определения типа загружаемой из пакета формы
	TEnm_LanguageId        = ( liUa, liRus, liEng );

    //Перечисляемый тип для установки различных режимов заполнения списка допустимых месяцев
    TFillMode              = ( fmNone, fmInc, fmDec, fmFull );

	//Перечисляемый тип для определения типа отображения параметров корреспонденции
	TEnm_KorParamsTypeInfo = ( kpNumber, kpTitle );

	//Перечисляемый тип для определения типа загружаемой из пакета формы
	TEnm_FormType          = ( ftNone, ftForm, ftDBForm );

	//Перечисляемый тип для определения стиля формы
    TEnm_FormStyle         = ( fsDefault, fsModal, fsMDIChild );

	//Перечисляемый тип для установки различных режимов проведения документов через ядро
	TKernelMode            = ( kmNone, kmAdd, kmDelete, kmEdit );

	//Перечисляемый тип для установки различных режимов запуска менеджера счетов
	TManegerSchMode        = ( mmNone, mmCloseSch, mmOpenSch, mmBlockSch );

	//Перечисляемый тип для расшифровки возвращаемых менеджером счетов результатов
	TManegerSchResult      = ( msrError, msrOK );

	//Перечисляемый тип для установки различных режимов закрытия (отката) системы
	TSystemMode            = ( smOpen, smClose );

	//Перечисляемый тип для расшифровки ошибок проверки при подготовке к импорту
	TImportCheckError      = ( ectNone, ectParamsNotFound, ectFNUnknown, ectFTIcompatible );

	//Перечисляемый тип для определения параметров формы редактирования
	TActionType            = ( actAdd, actEdit, actDelete, actWatch, actNone, actDetAdd, actDetEdit, actDetDelete, actDetWatch, actDetNone );

	//Перечисляемый тип для установки различных режимов запуска справочников
	TSelectionMode         = ( smNone, smSingleSelect, smMultiSelect );

	//Перечисляемый тип для организации ф-ций мультивыбора
	TSelectionType         = ( stpSelectAll, stpUnSelectAll, stpInvert );

	//Перечисляемый тип для определения кол-ва помеченных записей
	TCheckedRecCount       = ( crcNone, crcSome, crcAll );

	//Перечисляемый тип для определения кол-ва используемых для фильтрации CheckBox - ов
	TCheckedBoxes          = ( cbNone, cbFrom, cbTill, cbBoth );

	//Перечисляемый тип для хранения названий системных процедур (возвращающие настройки системы)
	TIniStProcName         = ( NDS_INI_SETUP_SEL, NDS_INI_PERCENT_RATE_SEL, NDS_INI_PERCENT_RATE_SEL_ACT );

	//Множество параметров печати журнала
    TSet_PrtJrnlParams = set of TEnm_PrtJrnlParams;
    
	//Динамический массив для хранения целых чисел
	TIntArray = array of Integer;

	//Динамический массив для хранения денежных единиц
	TCurrArray = array of Currency;

	//Запись для хранения параметров соединения
	TParams = packed record
		Name  : String;
		Value : String;
	end;

    TPtr_SysOptions = ^TRec_SysOptions;

	//Запись для хранения умалчиваемых системных настроек
	TRec_SysOptions = packed record
		IdUser          : Int64;
		UsrFIO          : String;
		IsValid         : Boolean;
		UsrLogin        : String;
		UsrPassword     : String;
		KodSystem       : Integer;
		DefRegUch       : Int64;
		DateSetUp       : TDate;
		LangugeId       : TEnm_LanguageId;
		DefCaseKey      : Integer;
		NameSystem      : String;
		RootTypeObj     : Integer;
        AppHandle       : THandle;
		AppExePath      : String;
		LogFileName     : String;
		ConnectionStr   : String;
		KodCurrPeriod   : Integer;
		DateCurrPeriod  : TDate;
		DateFirstImport : TDate;
	end;

    TPtr_SchParams = ^TRec_SchParams;
    
	//Запись для хранения параметров для получения оборотов по счетам
	TRec_SchParams = packed record
		KodSystem      : Integer;
		DefRegUch      : Int64;
		RootTypeObj    : Integer;
		KodSysPeriod   : Integer;
		KodCurrPeriod  : Integer;
		DateSysPeriod  : TDate;
		DateCurrPeriod : TDate;
	end;

    TPtr_KorParams = ^TRec_KorParams;

	//Запись для хранения параметров для получения корреспонденции
	TRec_KorParams = packed record
		IdSch           : Int64;
		SchName         : String;
		IdKorSch        : Int64;
		IdRegUch        : Int64;
		CurrPeriod      : TDate;
		HasChildren     : Boolean;
		IsKorrespondKR  : Boolean;
	end;

	//Запись для хранения параметров полей импорта
	TFieldRec = packed record
		FieldName : String;
		FieldType : TFieldType;
	end;

	//Запись для хранения параметров загрузки модуля Ярика
	TRec_SmRzSt = packed record
	  IdUser     : Int64;
	  ActualDate : TDate;
	end;

	//Запись для хранения значений границ периода
	TRec_PeriodBorders = packed record
	  DateBeg : TDate;
	  DateEnd : TDate;
	end;

	TPtr_FMParams = ^TRec_FMParams;

	//Запись для хранения параметров загрузки формы
	TRec_FMParams = packed record
	  Owner : TComponent;
	  Style : TEnm_FormStyle;
    end;

	TPtr_DBFMParams = ^TRec_DBFMParams;

	//Запись для хранения параметров загрузки справочника
	TRec_DBFMParams = packed record
	  Owner     : TComponent;
	  Style     : TEnm_FormStyle;
	  DBHandle  : TISC_DB_HANDLE;
	  TRRHandle : TISC_TR_HANDLE;
	end;

	//Запись для хранения значений параметров визуализации корреспонденции
	TRec_KorParamsTypeInfo = packed record
	  Checked  : Boolean;
	  TypeInfo : TEnm_KorParamsTypeInfo;
	end;

	TPtr_KorParamsInfo = ^TRec_KorParamsInfo;

	//Запись для хранения параметров визуализации корреспонденции
	TRec_KorParamsInfo = packed record
      ModRes : TModalResult;
	  GrSmet : TRec_KorParamsTypeInfo;
	  Smet   : TRec_KorParamsTypeInfo;
	  Razd   : TRec_KorParamsTypeInfo;
	  Stat   : TRec_KorParamsTypeInfo;
	  Kekv   : TRec_KorParamsTypeInfo;
	end;

    TPtr_MTDParams = ^TRec_MTDParams;

	//Запись для хранения параметров экспортируемых из пакета методов
	TRec_MTDParams = packed record
      SmRzSt        : TRec_SmRzSt;
      KorParams     : TRec_KorParams;
      SysOptions    : TRec_SysOptions;
      KorParamsInfo : TRec_KorParamsInfo;

      case TEnm_FormType of
        ftForm   : ( FMParams   : TRec_FMParams   );
        ftDBForm : ( DBFMParams : TRec_DBFMParams );
    end;

	TPtr_BPLParams = ^TRec_BPLParams;

	//Запись для хранения параметров загрузки пакета
	TRec_BPLParams = packed record
	  MethodName  : String;
	  PackageName : String;
	end;

const

	cCRLF                = #13#10;      //Символы окончания строки и перехода на следующую
	cTICK                = '''';        //Символ кавычка
	cLINE                = '-';         //Символ дефис
	cEQUAL               = '=';         //Символ равно
	cSPACE               = ' ';         //Символ пробел
	cDEF_DAY             = 15;          //Дата по умолчанию для текущего периода
	cDEF_MODE            = smNone;      //Режим запуска справочника по умолчанию
	cSEMICOLON           = ',';         //Символ запятая
	cBRAKET_OP           = '(';         //Символ открывающая скобка
	cBRAKET_CL           = ')';         //Символ закрывающая скобка
	cDEF_CHAR_SET        = 'win1251';   //Кодировка БД по умолчанию
	cDEF_EDIT_MODE       = actAdd;      //Режим редактирования по умолчанию
	cYEAR_UA_SHORT       = ' р.';       //Год (сокр.) по-украински
	cYEAR_RUS_SHORT      = ' г.';       //Год (сокр.) по-русски
	cDEF_SQL_DIALECT     = '3';         //Диалект БД по умолчанию
	cFIRST_DAY_OF_MONTH  = 1;           //Первый день месяца
	cDEF_IS_CLOSE_PERIOD = 0;           //Логическое значение по умолчанию для закрытия журнала в текущем периоде
	cDEF_LANGUGE_ID      = liRus;       //Умалчиваемый идентификатор языка


	//Названия полей DBF-таблицы документов, подлежащих проверке при импорте
	cDOC_FN_FIO          = 'FIO';
	cDOC_FN_NOTE         = 'NOTE';
	cDOC_FN_SUMMA        = 'SUMMA';
	cDOC_FN_ID_DOC       = 'ID_DOC';
	cDOC_FN_NUM_DOC      = 'NUM_DOC';
	cDOC_FN_DATE_DOC     = 'DATE_DOC';
	cDOC_FN_DATE_REG     = 'DATE_REG';
	cDOC_FN_DATE_PROV    = 'DATE_PROV';
	cDOC_FN_ID_TYPE_DOC  = 'TYPE_DOC';

	//Типы полей DBF-таблицы документов, подлежащих проверке при импорте
	cDOC_FT_FIO          = ftString;
	cDOC_FT_NOTE         = ftString;
	cDOC_FT_SUMMA        = ftFloat;
	cDOC_FT_ID_DOC       = ftInteger;
	cDOC_FT_NUM_DOC      = ftString;
	cDOC_FT_DATE_DOC     = ftDate;
	cDOC_FT_DATE_REG     = ftDate;
	cDOC_FT_DATE_PROV    = ftDate;
	cDOC_FT_ID_TYPE_DOC  = ftInteger;

	//Названия полей DBF-таблицы проводок, подлежащих проверке при импорте
	cPROV_FN_SUMMA       = 'SUMMA';
	cPROV_FN_STORNO      = 'STORNO';
	cPROV_FN_ID_PROV     = 'ID_PROV';
	cPROV_FN_DATE_REG    = 'DATE_REG';
	cPROV_FN_CR_BY_DT    = 'CR_BY_DT';
	cPROV_FN_TABLE_NUM   = 'TN';
	cPROV_FN_DB_ID_DOC   = 'DB_ID_DOC';
	cPROV_FN_KR_ID_DOC   = 'KR_ID_DOC';
	cPROV_FN_DB_BAL_ID   = 'DB_BAL_ID';
	cPROV_FN_DB_SUB_ID   = 'DB_SUB_ID';
	cPROV_FN_KR_BAL_ID   = 'KR_BAL_ID';
	cPROV_FN_KR_SUB_ID   = 'KR_SUB_ID';
	cPROV_FN_DB_DT_PROV  = 'DB_DT_PROV';
	cPROV_FN_KR_DT_PROV  = 'KR_DT_PROV';
	cPROV_FN_DB_KOD_SMET = 'DB_KOD_SM';
	cPROV_FN_KR_KOD_SMET = 'KR_KOD_SM';
	cPROV_FN_DB_KOD_RAZD = 'DB_KOD_RAZ';
	cPROV_FN_KR_KOD_RAZD = 'KR_KOD_RAZ';
	cPROV_FN_DB_KOD_STAT = 'DB_KOD_ST';
	cPROV_FN_KR_KOD_STAT = 'KR_KOD_ST';

	//Типы полей DBF-таблицы проводок, подлежащих проверке при импорте
	cPROV_FT_SUMMA       = ftFloat;
	cPROV_FT_STORNO      = ftBoolean;
	cPROV_FT_ID_PROV     = ftInteger;
	cPROV_FT_DATE_REG    = ftDate;
	cPROV_FT_CR_BY_DT    = ftBoolean;
	cPROV_FT_TABLE_NUM   = ftInteger;
	cPROV_FT_DB_ID_DOC   = ftInteger;
	cPROV_FT_KR_ID_DOC   = ftInteger;
	cPROV_FT_DB_BAL_ID   = ftInteger;
	cPROV_FT_DB_SUB_ID   = ftSmallInt;
	cPROV_FT_KR_BAL_ID   = ftInteger;
	cPROV_FT_KR_SUB_ID   = ftSmallInt;
	cPROV_FT_DB_DT_PROV  = ftDate;
	cPROV_FT_KR_DT_PROV  = ftDate;
	cPROV_FT_DB_KOD_SMET = ftSmallInt;
	cPROV_FT_KR_KOD_SMET = ftSmallInt;
	cPROV_FT_DB_KOD_RAZD = ftSmallInt;
	cPROV_FT_KR_KOD_RAZD = ftSmallInt;
	cPROV_FT_DB_KOD_STAT = ftSmallInt;
	cPROV_FT_KR_KOD_STAT = ftSmallInt;

	//Массив названий месяцев на украинском языке
	cMonthUA           : array[0..11] of String = (
        sJANUARY_UA, sFEBRUARY_UA, sMARCH_UA,
        sAPRIL_UA,   sMAY_UA,      sJUNE_UA,
        sJULY_UA,    sAUGEST_UA,   sSEPTEMBER_UA,
        sOCTOBER_UA, sNOVEMBER_UA, sDECEMBER_UA   );

	//Массив названий месяцев на русском языке
	cMonthRUS          : array[0..11] of String = (
        sJANUARY_RUS, sFEBRUARY_RUS, sMARCH_RUS,
        sAPRIL_RUS,   sMAY_RUS,      sJUNE_RUS,
        sJULY_RUS,    sAUGEST_RUS,   sSEPTEMBER_RUS,
        sOCTOBER_RUS, sNOVEMBER_RUS, sDECEMBER_RUS   );

	//Вспомогательный массив основных параметров соединения
	cMainParams        : array[0..3] of String =  ( sSERVER, sPATH, sUSER_NAME, sPASSWORD );

	//Вспомогательный массив дополнительных параметров соединения
	cAdditionalParams  : array[0..2] of TParams = (
        ( Name: sCHAR_SET;      Value: cDEF_CHAR_SET    ),
        ( Name: sSQL_DIALECT;   Value: cDEF_SQL_DIALECT ),
        ( Name: sLOG_FILE_PATH; Value: sLOG_FILE_NAME   ) );

	//Массив параметров полей DBF-таблицы документов
	cProcImpDocFields  : array[0..8] of TFieldRec = (
        ( FieldName: cDOC_FN_ID_DOC;      FieldType: cDOC_FT_ID_DOC      ),
        ( FieldName: cDOC_FN_DATE_DOC;    FieldType: cDOC_FT_DATE_DOC    ),
        ( FieldName: cDOC_FN_NUM_DOC;     FieldType: cDOC_FT_NUM_DOC     ),
        ( FieldName: cDOC_FN_DATE_PROV;   FieldType: cDOC_FT_DATE_PROV   ),
        ( FieldName: cDOC_FN_SUMMA;       FieldType: cDOC_FT_SUMMA       ),
        ( FieldName: cDOC_FN_NOTE;        FieldType: cDOC_FT_NOTE        ),
        ( FieldName: cDOC_FN_FIO;         FieldType: cDOC_FT_FIO         ),
        ( FieldName: cDOC_FN_DATE_REG;    FieldType: cDOC_FT_DATE_REG    ),
        ( FieldName: cDOC_FN_ID_TYPE_DOC; FieldType: cDOC_FT_ID_TYPE_DOC ) );

	//Массив параметров полей DBF-таблицы проводок
	cProcImpProvFields : array[0..19] of TFieldRec = (
        ( FieldName: cPROV_FN_ID_PROV;     FieldType: cPROV_FT_ID_PROV     ),
        ( FieldName: cPROV_FN_CR_BY_DT;    FieldType: cPROV_FT_CR_BY_DT    ),
        ( FieldName: cPROV_FN_STORNO;      FieldType: cPROV_FT_STORNO      ),
        ( FieldName: cPROV_FN_SUMMA;       FieldType: cPROV_FT_SUMMA       ),
        ( FieldName: cPROV_FN_TABLE_NUM;   FieldType: cPROV_FT_TABLE_NUM   ),
        ( FieldName: cPROV_FN_DB_BAL_ID;   FieldType: cPROV_FT_DB_BAL_ID   ),
        ( FieldName: cPROV_FN_DB_SUB_ID;   FieldType: cPROV_FT_DB_SUB_ID   ),
        ( FieldName: cPROV_FN_KR_BAL_ID;   FieldType: cPROV_FT_KR_BAL_ID   ),
        ( FieldName: cPROV_FN_KR_SUB_ID;   FieldType: cPROV_FT_KR_SUB_ID   ),
        ( FieldName: cPROV_FN_DB_DT_PROV;  FieldType: cPROV_FT_DB_DT_PROV  ),
        ( FieldName: cPROV_FN_KR_DT_PROV;  FieldType: cPROV_FT_KR_DT_PROV  ),
        ( FieldName: cPROV_FN_DB_KOD_SMET; FieldType: cPROV_FT_DB_KOD_SMET ),
        ( FieldName: cPROV_FN_KR_KOD_SMET; FieldType: cPROV_FT_KR_KOD_SMET ),
        ( FieldName: cPROV_FN_DB_KOD_RAZD; FieldType: cPROV_FT_DB_KOD_RAZD ),
        ( FieldName: cPROV_FN_KR_KOD_RAZD; FieldType: cPROV_FT_KR_KOD_RAZD ),
        ( FieldName: cPROV_FN_DB_KOD_STAT; FieldType: cPROV_FT_DB_KOD_STAT ),
        ( FieldName: cPROV_FN_KR_KOD_STAT; FieldType: cPROV_FT_KR_KOD_STAT ),
        ( FieldName: cPROV_FN_DATE_REG;    FieldType: cPROV_FT_DATE_REG    ),
        ( FieldName: cPROV_FN_DB_ID_DOC;   FieldType: cPROV_FT_DB_ID_DOC   ),
        ( FieldName: cPROV_FN_KR_ID_DOC;   FieldType: cPROV_FT_KR_ID_DOC   ) );

implementation
    

end.


