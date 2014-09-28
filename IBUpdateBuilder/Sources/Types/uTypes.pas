unit uTypes;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uTypes                                                                     *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Централизованное хранение пользовательских типов, констант и пр.           *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses Controls;

const

	{*****************************************}
    {   *** Константы общего назначения ***   }
    {*****************************************}

    cZERO                            = 0;
	cDIGITS                          = ['0'..'9'];  //Множество натуральных чисел
	cLETTERS                         = ['A'..'Z'];  //Множество букв
	cDEF_CAN_SORT                    = True;        //Умалчиваемое значение для активации сортировки списка строк
	cDEF_IS_ACTIVE                   = True;        //Значение по умолчанию для поля выбора файла скрипта
	cDEF_BUTTON_TAG                  = -1;          //Умалчиваемое значение для порядкового номера кнопки панели задач
	cDEF_DLG_RESULT                  = -1;          //Значение по умолчанию для результата диалога с пользователем
	cDATE_SEPARATOR                  = '-';         //Символ-разделитель для даты
	cMIN_PATH_LENGTH                 = 3;           //Минимальное количество символов, составляющих операционный путь
	cDEF_UPDATE_NUMBER               = -1;          //Умалчиваемый номер обновления, собранного не в ДонНУ
	cDATE_DIGITS_COUNT               = 10;          //Количество цифр, используемых для представления даты
	cMIN_SECTIONS_COUNT              = 6;           //Минимальное количество значащих секций, содержащихся в имени файла скрипта
	cDEF_CASE_SENSITIVE              = False;       //Умалчиваемое значение для регистра символов
	cUPDATE_NUMBER_SEPARATOR         = '-';         //Символ-разделитель для составного номера обновления
	cSECTIONS_SEPARATOR_COUNT        = 2;           //Количество символов-разделителей, отделяющих друг от друга секции в имени файла скрипта
	cUPDATE_MAJ_RESERVED_CHAR_COUNT  = 3;           //Количество позиций зарезервированных для главной части порядкового номера обновления
	cUPDATE_MIN_RESERVED_CHAR_COUNT  = 2;           //Количество позиций зарезервированных для дополнительной части порядкового номера обновления
	cDAYSBETWEEN_RESERVED_CHAR_COUNT = 2;           //Количество позиций зарезервированных для разницы в днях между датой создания скрипта и датой его применения

resourcestring

    {***************************************}
    {   *** Ресурсы общего назначения ***   }
    {***************************************}

	//Сообщения пользовательских исключительных ситуаций
	sEFileNotFound         = 'Файл не найден';
	sEConvertError         = 'Некорректное преобразование типов';

	//Составляющие сообщения об ошибке
	sErrorText    = '       Ошибка: ';
	sErrorCode    = 'Код ошибки: ';
	sErrorAddr    = 'Адрес ошибки: ';
	sContinueQst  = ' Продолжить?';
	sErrorTextExt = 'Ошибка: ';

	sMsgCaptionErr = 'Ошибка';
	sMsgCaptionWrn = 'Предупреждение';
	sMsgCaptionInf = 'Информация';
	sMsgCaptionQst = 'Подтверждение';

    sCommentFile       = ' Файл: ';
    sCommentBevel      = '   ***************   ';
    sCommProjectName   = '            Название проекта: ';
    sCommScriptsCount  = '         Количество скриптов: ';
    sCommUpdDateCreate = 'Дата формирования обновления: ';

	//Имя файла-отчёта ошибок приложения
	sLOG_FILE_NAME     = 'AppErrors.log';

	//Имя файла-отчёта ошибок тестирования файла обновления
	sUPDATE_ERRORS_FILE_NAME = 'Update_Errors.log';

	//Имя файла умалчиваемых настроек
	sINI_FILE_NAME     = 'DefConfig.ini';

	//Названия секций для файла умалчиваемых настроек
    sSN_DEFAULT_VALUES = 'Default Values';
    sSN_PROJECTS = 'Projects';

	//Названия ключей для файла умалчиваемых настроек
    sKN_DB_PATH        = 'DbPath';
    sKN_SCR_PATH       = 'ScriptPath';
    sKN_PASSWORD       = 'Password';
    sKN_USER_NAME      = 'User';
    sKN_SERVER_NAME    = 'Server';
    sKN_IBESCRIPT_PATH = 'IBEscriptPath';
    sKN_ACTIVE_PROJECTS= 'ActiveProjects';

	sFILE_SIZE_FN      = 'FILE_SIZE';    //Название поля для НД, содержащего размер файла скрипта
	sIS_ACTIVE_FN      = 'IS_ACTIVE';    //Название поля выбора для НД
	sDATE_CHANGE_FN    = 'DATE_CHANGE';  //Название поля для НД, содержащего дату последнего изменения файла скрипта
	sSCRIPT_NAME_FN    = 'SCRIPT_NAME';  //Название поля для НД, содержащего имя файла скрипта

    //Расширения архивных файлов
    sARCH_EXT_GZ  = '*.gz';
    sARCH_EXT_RAR = '*.rar';
    sARCH_EXT_ZIP = '*.zip';
    sARCH_EXT_EXE = '*.exe';
	sARCH_EXT_TAR = '*.tar';
	sARCH_EXT_RPM = '*.rpm';
	sARCH_EXT_ARJ = '*.arj';

	sCR                          = #13;               //Символ окончания строки
	sZERO                        = '0';               //Символ ноль
	sCRLF                        = #13#10;            //Символы окончания строки и перехода на следующую
	sSTAR                        = '*';               //Символ звёздочка
	sTICK                        = '''';              //Символ кавычка
	sTICKS                       = '"';               //Символ кавычка
	sSPACE                       = ' ';               //Символ пробел
	sMINUS                       = '-';               //Символ минус
	sDEF_DB_EXT                  = '*.ib';            //Умалчиваемое расширения для файла базы данных
	sEMPTY_STR                   = '';                //Пустая строка
	sSEMICOLON                   = ',';               //Символ запятая
	sDBL_POINT                   = ':';               //Символ двоеточие
	sBRAKET_OP                   = '(';               //Символ открывающая скобка
	sBRAKET_CL                   = ')';               //Символ закрывающая скобка
	sDEF_EXE_EXT                 = '*.exe';           //Умалчиваемое расширения для исполняемого файла
	sUPDATE_EXPR                 = 'U';               //Ключевое выражение, показывающее вошел ли скрипт в какое-либо обновление или нет
	sSCRIPTS_MASK                = '*.sql';           //Маска для файлов скриптов
	sANY_FILE_MASK               = '*.*';             //Маска для любых файлов
	sUPDATE_NUMBER               = ' Update No ';     //Подстрока - составляющая имени файла обновления
	sSCRIPT_FILE_EXT             = '.sql';            //Расширение  файлов скриптов
	sBRAKET_COMMENT_OP           = '/*';              //Символ, открывающий комментарий
	sBRAKET_COMMENT_CL           = '*/';              //Символ, закрывающий комментарий
	sFMT_ALL_FILES_SIZE          = '#0.00';           //Шаблон для форматирования размера всех файлов
	sFMT_SEL_FILES_SIZE          = '#0.0000';         //Шаблон для форматирования размера выбранных файлов
	sFORMAT_DATE_TO_STR          = 'yyyy-mm-dd';      //Формат даты для конвертации в строку
	sSEPARATOR_FOLDER_WIN        = '\';               //Символ-разделитель для Win32-путей
	sSEPARATOR_FOLDER_UNX        = '/';               //Символ-разделитель для UNIX-путей
	sSCRIPT_EXECUTER_NAME        = 'ibescript.exe';   //Имя exe-файла для применения скриптов
	sCOMMAND_LINE_SCRIPT_EXEC    = ' -S -N -V';       //Параметры командной строки для утилиты выполнения скриптов
	sSCRIPT_EXECUTER_NAME_NO_EXT = 'ibescript';       //Имя exe-файла без расширения для применения скриптов

	sEXECUTE_OPERATION     = 'Open';                                                      //Параметр для запуска блокнота для просмотра файла-отчета ошибок применения скрипта
	sEXECUTE_SCRIPT_STR    = 'Script executed successfully';                              //Строка, сигнализирующая о успешном применении скрипта

	sDEF_DB_FILTER         = 'Data Base Files (*.ib; *.gdb)|*.ib;*.gdb';                  //Умалчиваемое значение фильтра для файлов базы данных
	sDEF_EXE_FILTER        = 'Executable Files (*.exe)|*.exe';                            //Умалчиваемое значение фильтра для исполняемых файлов
	sDEF_SQL_FILTER        = 'Script Files (*.sql)|*.sql';                                //Умалчиваемое значение фильтра для файлов скриптов

	sTEMP_DIR              = 'C:\WINDOWS\TEMP';                                           //Куда копировать архив
	sEMPTY_CHAR            = '_';                                                         //Символ, указывающий на пропущенный значащий символ в имени файла скрипта
	sDEF_SCR_PATH          = '\\It-server\projects\FMAS-WIN\DONNU\TEST\Scripts';          //Путь к хранилищу скриптов
	sSCR_SEPARATOR         = '=';                                                         //Символ-разделитель секций в имени скрипта
	sSCR_ERROR_CHAR        = '#';                                                         //Символ-маркер для пометки скриптов с ошибками
	sDEF_SCR_DATE_BEG      = '01.09.2005';                                                //Нижняя граница даты создания скриптов
	sDEF_UPDATE_NUMBER     = '-1';                                                        //Умалчиваемый номер обновления, собранного не в ДонНУ
  sDEF_ACTIVE_PROJECTS   = 'ABGHKMPS';                                                  //Активные проекты по умолчанию


	sDEF_DB_PATH           = '\\It-server\projects\FMAS-WIN\DNEPR\TEST\FULL_DB.IB';       //Путь к хранилищу скриптов
	sDEF_PASSWORD          = 'masterkey';                                                 //Умалчиваемый пароль для подключения к БД
	sDEF_USER_NAME         = 'SYSDBA';                                                    //Умалчиваемое имя пользователя для подключения к БД
	sDEF_SERVER_NAME       = 'localhost';                                                 //Умалчиваемое имя сервера для подключения к БД
  sDEF_IBESCRIPT_PATH    = 'C:\Program Files\HK Software\IB Expert 2.0\ibescript.exe';  //Путь к программе применения скриптов

    {***********************************************************************}
    {   *** Названяи проeктов и соответствующие им ключевые выражения ***   }
    {***********************************************************************}

    //Название проэктов
	sMONU_NAME         = 'МОНУ';
  sKIEV_NAME         = 'КИЕВ';
  //	sLVOV_NAME         = 'Львов';
	sDNEPR_NAME        = 'Днепродзержинск';
	sDONUEP_NAME       = 'ДонУЭП';
	sKHARKOV_NAME      = 'Харьков';
	sPOLTAVA_NAME      = 'Полтава';
	sDONGUET_NAME      = 'ДонГУЭТ';
	sCHERMET_NAME      = 'УкрПромВодЧерМет';
	sALCHEVSK_NAME     = 'Алчевск';
	sSTUDCITY_NAME     = 'Студгородок';
	sGORLOVKA_NAME     = 'Горловский Техникум ДонНУ';
	sSPORT_UNIVER_NAME = 'Институт Физкультуры';

	//Значения ключевых выражений, соответствующие проэктам
  sMONU_KEY_EXPR         = 'M';
  sKIEV_KEY_EXPR         = 'K';
//	sLVOV_KEY_EXPR         = 'L';
	sDNEPR_KEY_EXPR        = 'D';
	sDONUEP_KEY_EXPR       = 'E';
	sKHARKOV_KEY_EXPR      = 'H';
	sPOLTAVA_KEY_EXPR      = 'P';
	sDONGUET_KEY_EXPR      = 'G';
	sCHERMET_KEY_EXPR      = 'C';
	sALCHEVSK_KEY_EXPR     = 'A';
	sSTUDCITY_KEY_EXPR     = 'S';
	sGORLOVKA_KEY_EXPR     = 'O';
	sSPORT_UNIVER_KEY_EXPR = 'F';

type

    {************************************}
    {   *** Типы общего назначения ***   }
    {************************************}

	//Множество чисел
	TDigits = Set of '0'..'9';

	//Динамический массив для хранения целых чисел
	TIntArray = array of Integer;

	//Динамический массив для хранения строк
	TStrArray = array of String;

	//Перечисляемый тип, определяющий режим работы модуля со скриптами
	TEnm_AppMode       = ( amView, amSearch );

	//Перечисляемый тип, определяющий направление поиска
	TEnm_Direction     = ( dtDown, dtUp );

	//Перечисляемый тип, определяющий тип файлов, над которыми будут выполняться действия
	TUsrFileType       = ( ftScripts, ftModules );

	//Перечисляемый тип, определяющий режим заполнения набора данных
	TPeriodBound       = ( pbNone, pbLeft, pbRight, pbBoth );

	//Перечисляемый тип, определяющий режим заполнения набора данных
	TFillMode          = ( fmInsert, fmAppend );

	//Перечисляемый тип, определяющий режим переименования скриптов
	TRenameMode        = ( rmRename, rmUnRename );

	//Перечисляемый тип, определяющий режим сортировки файлов скриптов
	TSortMode          = ( smAlphabetically, smDate, smOrder );

	//Перечисляемый тип, определяющий результат, возвращаемый функцией загрузки скриптов
	TLoadScrResult     = ( lrNone, lrScrNotFound, lrFilterInvalid, lrLoadSuccess, lrModulesInvalid );

	//Перечисляемый тип для организации функции мультивыбора
	TSelectionMode     = (  smSelectAll, smUnSelectAll, smInvert );

	//Перечисляемый тип для определения кол-ва помеченных записей
	TCheckedRecCount   = ( crcNone, crcSome, crcAll );

	//Запись, предназначенная для хранения параметров проэкта
	TProjectParams = packed record
		Name    : String;
		KeyExpr : String;
	end;

	//Запись, предназначенная для хранения параметров переименования
	TRenameParams = packed record
		KeyExpr        : String;
		RenameMode     : TRenameMode;
		DateCreate     : TDate;
		UpdateNumMajor : Integer;
		UpdateNumMinor : Integer;
	end;

	//Запись, предназначенная для хранения параметров скрипта
	TScriptInfo = packed record
		CanExecute     : Boolean;
		Execute        : Boolean;
		IsInUpdate     : Boolean;
		DateCreate     : TDate;
		DateExecute    : TDate;
		UpdateNumMajor : String;
		UpdateNumMinor : String;
	end;

	//Запись, предназначенная для хранения максимального номера обновления
	TUpdateNumInfo = packed record
		UpdateNumMajor : Integer;
		UpdateNumMinor : Integer;
	end;

	//Запись, предназначенная для хранения параметров поиска максимального номера обновления
	TMaxUpdNumParams = packed record
		KeyExpr  : String;
		FilePath : String;
	end;

	//Запись, предназначенная для хранения параметров фильтрации
	TFilterParams = packed record
		KeyExpr        : String;
		DateBeg        : String;
		DateEnd        : String;
		ScriptPath     : String;
		UpdateNumMajor : Integer;
		UpdateNumMinor : Integer;
	end;

	//Запись, предназначенная для хранения названий параметров конфигурационного файла
	TDefIniParams = packed record
		Section  : String;
		Key      : String;
		DefValue : String;
	end;

	//Запись, предназначенная для хранения значений параметров конфигурационного файла
	TIniParams = packed record
		User       : String;
		Server     : String;
		DBPath     : String;
		Password   : String;
		ScriptPath : String;
	end;

	TPtr_SearchParams = ^TRec_SearchParams;

	//Запись предназначенна для хранения параметров поиска
	TRec_SearchParams = packed record
		Direction      : TEnm_Direction;
		TextSearch     : String;
		FirstFound     : String;
		CaseSensitive  : Boolean;
		WholeWordsOnly : Boolean;
	end;

	//Массив умалчиваемых параметров
	TArrDefIniParams = array of TDefIniParams;

const

	//Массив расширений файлов скриптов
	cScriptExt : array[0..0] of String = (
		sSCRIPTS_MASK );

	//Массив расширений архивных файлов
	cArchiveExt : array[0..6] of String = (
		sARCH_EXT_RAR,
		sARCH_EXT_ZIP,
		sARCH_EXT_EXE,
		sARCH_EXT_ARJ,
		sARCH_EXT_TAR,
		sARCH_EXT_RPM,
		sARCH_EXT_GZ);

	//Массив умалчиваемых параметров
	cDefIniParams : array[0..6] of TDefIniParams = (
		( Section: sSN_DEFAULT_VALUES; Key: sKN_SERVER_NAME   ; DefValue: sDEF_SERVER_NAME    ),
		( Section: sSN_DEFAULT_VALUES; Key: sKN_DB_PATH       ; DefValue: sDEF_DB_PATH        ),
		( Section: sSN_DEFAULT_VALUES; Key: sKN_USER_NAME     ; DefValue: sDEF_USER_NAME      ),
		( Section: sSN_DEFAULT_VALUES; Key: sKN_PASSWORD      ; DefValue: sDEF_PASSWORD       ),
		( Section: sSN_DEFAULT_VALUES; Key: sKN_SCR_PATH      ; DefValue: sDEF_SCR_PATH       ),
		( Section: sSN_DEFAULT_VALUES; Key: sKN_IBESCRIPT_PATH; DefValue: sDEF_IBESCRIPT_PATH ),
    ( Section: sSN_DEFAULT_VALUES; Key: sKN_ACTIVE_PROJECTS; DefValue: sDEF_ACTIVE_PROJECTS));

	//Массив параметров проeктов
	cProjectParams : array [0..11] of TProjectParams = (
		( Name: sMONU_NAME    ;     KeyExpr: sMONU_KEY_EXPR         ),
 		( Name: sKIEV_NAME    ;     KeyExpr: sKIEV_KEY_EXPR         ),
//		( Name: sLVOV_NAME    ;     KeyExpr: sLVOV_KEY_EXPR         ),
		( Name: sDNEPR_NAME   ;     KeyExpr: sDNEPR_KEY_EXPR        ),
		( Name: sDONUEP_NAME  ;     KeyExpr: sDONUEP_KEY_EXPR       ),
		( Name: sKHARKOV_NAME ;     KeyExpr: sKHARKOV_KEY_EXPR      ),
		( Name: sPOLTAVA_NAME ;     KeyExpr: sPOLTAVA_KEY_EXPR      ),
		( Name: sDONGUET_NAME ;     KeyExpr: sDONGUET_KEY_EXPR      ),
		( Name: sCHERMET_NAME ;     KeyExpr: sCHERMET_KEY_EXPR      ),
		( Name: sALCHEVSK_NAME;     KeyExpr: sALCHEVSK_KEY_EXPR     ),
		( Name: sSTUDCITY_NAME;     KeyExpr: sSTUDCITY_KEY_EXPR     ),
		( Name: sGORLOVKA_NAME;     KeyExpr: sGORLOVKA_KEY_EXPR     ),
		( Name: sSPORT_UNIVER_NAME; KeyExpr: sSPORT_UNIVER_KEY_EXPR ) );

implementation

end.
