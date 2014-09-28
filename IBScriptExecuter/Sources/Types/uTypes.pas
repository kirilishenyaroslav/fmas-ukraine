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

type

	//Множество чисел
	TDigits = Set of '0'..'9';

	//Перечисляемый тип, определяющий результат выполнения скриптов
	TScriptStatus = ( scsTestErr, scsTestSucc, scsExecErr, scsExecSucc );

const

	//System constants
	cSCR_STATUS : array [0..Int64( High( TScriptStatus ) )] of ShortString = ( 'Tested with Errors', 'Tested Successfully', 'Executed with Errors', 'Executed Successfully' );

	cCLRTF                         = #13#10;
	cPOINT                         = '.';
	cDIGITS                        = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];      //Множество натуральных чисел
	cCHAR_SET                      = 'win1251';                                               //Набор символов, используемый в БД по умолчанию
	cANY_FILE                      = '*.*';                                                   //Маска, для выбора всех файлов
	cEMPTY_CHAR                    = '_';                                                     //Символ, указывающий на пропущенный значащий символ в имени файла скрипта
	cDIGITS_EXT                    = ['-', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']; //Множество натуральных чисел + знак "-"
	cSQL_DIALECT                   = 3;                                                       //SQL диалект, используемый в БД по умолчанию
	cDB_FILE_EXT                   = '.IB';                                                   //Расширение файла БД
	cUPDATE_EXPR                   = 'U';                                                     //Ключевое выражение, показывающее вошел ли скрипт в какое-либо обновление или нет
	cSCRIPTS_MASK                  = '*.sql';                                                 //Маска для файлов скриптов
	cINI_FILE_NAME                 = 'Script.ini';                                            //Имя конфигурационного файла
	cDATE_SEPARATOR                = '-';                                                     //Символ-разделитель для даты
	cERROR_FILE_NAME               = 'AppError.log';                                          //Имя файла-отчёта об ошибках при выполнении скриптов
	cSCRIPT_FILE_EXT               = '.sql';                                                  //Расширение  файлов скриптов
	cDATE_DIGITS_COUNT             = 10;                                                      //Количество цифр, используемых для представления даты
	cFORMAT_DATE_TO_STR            = 'yyyy-mm-dd';                                            //Формат даты для конвертации в строку
	cFORMAT_STR_TO_DATE            = 'dd.mm.yyyy';                                            //Формат даты для конвертации из строки в дату
	cSCRIPT_EXECUTER_NAME          = 'ibescript ';                                            //Имя exe-файла для применения скриптов
	cSEPARATOR_FOLDER_WIN          = '\';                                                     //Символ-разделитель для Win32-путей
	cSEPARATOR_FOLDER_UNX          = '/';                                                     //Символ-разделитель для UNIX-путей
	cCOMMAND_LINE_ARCHIVATOR       = 'winrar e -ac -ad -cgf- -inul -o+ ';                     //Параметры командной строки для архиватора
	cCOMMAND_LINE_SCRIPT_EXEC      = ' -S -N -V';                                             //Параметры командной строки для утилиты выполнения скриптов
	cSYSTEM_SCRIPT_ERROR_FILE_NAME = 'SystemScriptErrors.txt';                                //Имя файла-отчёта об ошибках при выполнении скриптов

resourcestring

	//Captions for dialogs
	cMsgErr                        = 'Error';
	cMsgWarn                       = 'Warning';
	cMsgInfo                       = 'Information';
	cMsgConf                       = 'Confirmation';

	cTEST_EXPR                     = 'TEST';
	cEXECUTE_EXPR                  = 'EXEC';
	cDESCRIPTION_STR               = 'Testing scripts for '' ';
	cSCRIPT_STATUS_ERROR           = 'Error';
	cSCRIPT_STATUS_SUCCESS         = 'Success';

	//Section Names
	cTEST_PARAMS                   = 'Test Params';            //Название секции конфигурационного INI - файла
	cUSELESS_SECTION               = 'Useless Sections';       //Название секции конфигурационного INI - файла

	//Key Names

	//Basic
	cUSER                          = 'User';                   //Название ключа в секции конфигурационного INI - файла
	cSERVER                        = 'Server';                 //Название ключа в секции конфигурационного INI - файла
	cPASSWORD                      = 'Password';               //Название ключа в секции конфигурационного INI - файла
	//Regular
	cPATH                          = 'Path';                   //Название ключа в секции конфигурационного INI - файла
	cKEY_EXPR                      = 'KeyExpr';                //Название ключа в секции конфигурационного INI - файла
	//Config
	cRENAME                        = 'Rename';                 //Название ключа в секции конфигурационного INI - файла
	cEXECUTE                       = 'Execute';                //Название ключа в секции конфигурационного INI - файла
	cDATE_BEG                      = 'DateBeg';                //Название ключа в секции конфигурационного INI - файла
	cDATE_END                      = 'DateEnd';                //Название ключа в секции конфигурационного INI - файла
	cFULL_RENAME                   = 'FullRename';             //Название ключа в секции конфигурационного INI - файла
	cSYSTEM_SCRIPT                 = 'SystemScript';           //Название ключа в секции конфигурационного INI - файла
	cERROR_LOG_DIR                 = 'ErrorLogDir';            //Название ключа в секции конфигурационного INI - файла
	cIBESCRIPT_PATH                = 'IBEScriptPath';          //Название ключа в секции конфигурационного INI - файла
	cDB_PATH_BACKUP                = 'DBPathBackUp';           //Название ключа в секции конфигурационного INI - файла
	cSEPARATOR_CHAR                = 'SeparatorChar';          //Название ключа в секции конфигурационного INI - файла
	cARCHIVATOR_PATH               = 'ArchivatorPath';         //Название ключа в секции конфигурационного INI - файла
	cDB_PATH_COPY_TO               = 'DBPathCopyTo';           //Название ключа в секции конфигурационного INI - файла
	cBACKUP_DAYS_COUNT             = 'BackUpDaysCount';        //Название ключа в секции конфигурационного INI - файла
	cERROR_SCRIPT_CHAR             = 'ErrorScriptChar';        //Название ключа в секции конфигурационного INI - файла
	cPREFIX_CHAR_COUNT             = 'PrefixCharCount';        //Название ключа в секции конфигурационного INI - файла
	cDEFAULT_DB_FILE_NAME          = 'DefaultDBFileName';      //Название ключа в секции конфигурационного INI - файла
	cSCRIPTS_PATH_COPY_FROM        = 'ScriptPathCopyFrom';     //Название ключа в секции конфигурационного INI - файла
	cDB_ARCHIVE_FILE_NAME_PART     = 'DBArchiveFileNamePart';  //Название ключа в секции конфигурационного INI - файла

	//Default section key values
	cDEF_USER                      = 'sysdba';
	cDEF_SERVER                    = 'localhost';
	cDEF_RENAME                    = '0';
	cDEF_EXECUTE                   = '0';
	cDEF_PASSWORD                  = 'masterkey';
	cDEF_FULL_RENAME               = '0';
	cDEF_ERROR_LOG_DIR             = 'Errors';
	cDEF_SEPARATOR_CHAR            = '=';
	cDEF_IBESCRIPT_PATH            = 'C:\Program Files\IB Expert 2.0\ibescript.exe';
	cDEF_DB_PATH_COPY_TO           = 'D:\TestDB';
	cDEF_ARCHIVATOR_PATH           = 'C:\Program Files\WinRaR\winrar.exe';
	cDEF_BACKUP_DAYS_COUNT         = '1';
	cDEF_ERROR_SCRIPT_CHAR         = '#';
	cDEF_PREFIX_CHAR_COUNT         = '13';
	cDEF_DEFAULT_DB_FILE_NAME      = 'FULL_DB.IB';
	cDEF_SCRIPTS_PATH_COPY_FROM    = 'D:\FMAS-WIN\DataBase';
	cDEF_DB_ARCHIVE_FILE_NAME_PART = 'RESTORE.IB';

	//Status bar's messages
	cSPACE                         = '';
	cCOPYING_FILES                 = 'Copying files...';
	cEXTRACTING_FILES              = 'Extracting files...';
	cEXECUTING_SCRIPTS             = 'Executing scripts...';

	//Messages
	cAPP_EXIT                        = 'File ''' + cINI_FILE_NAME + ''' is not found' + cCLRTF + 'Application finished and closing';
	cCONVERT_ERROR                   = 'Invalid type convertion: ';
	cQUIT_QUESTION                   = 'Are you shure you wish to quit IBScript Executer?';
	cTEST_SCRIPT_STR                 = 'Script TESTED SUCCESSFULLY!';
	cCONVERT_DATE_ERR                = 'can''t convert string to date' + cCLRTF + 'Check format of config parameters ''DateBeg'' and ''DateEnd''';
	cSCRIPTS_NOT_FOUND               = 'There are NO SCRIPTS for testing!';
	cAPP_RESULT_OK_MSG               = 'ALL Scripts tested and executed SUCCESSFULLY!';
	cAPP_RESULT_ERR_MSG              = 'SOME Scripts have ERRORS!';
	cEXECUTE_SCRIPT_STR              = 'Scripts TESTED and EXECUTED SUCCESSFULLY!';
	cDB_FILE_NOT_FOUND1              = 'Testing scripts finished abnormally!';
	cDB_FILE_NOT_FOUND2              = 'Check files for testing or pathes for them.';
	cINI_FILE_NOT_FOUND              = 'Can''t find ''' + cINI_FILE_NAME + ''' file' + cCLRTF + 'Do you want to find it?';
	cPREPARE_SCRIPT_ERR              = 'During Preparing Data Base file for testing one of scripts have been executed with ERRORS!';
	cSUCCESS_EXEC_RESULT             = 'Script executed successfully';
	cINI_FILE_WAS_REMOVED            = 'File ''' + cINI_FILE_NAME + ''' was removed or deleted' + cCLRTF + 'Try to use ''Create Test List'' menu item';
	cTEST_SCRIPT_STR_ERR             = 'Scripts TESTED with ERRORS!';
	cEXECUTE_SCRIPT_STR_ERR          = 'Scripts EXECUTED with ERRORS!';
	cEXEC_SYS_SCRIPT_STR_ERR         = 'SYSTEM SCRIPT EXECUTED with ERRORS!';
	cEXEC_SYS_SCRIPT_STR_SUCC        = 'SYSTEM SCRIPT EXECUTED SUCCESSFULLY!';
	cDONT_EXEC_SYS_SCRIPT_STR        = 'SYSTEM SCRIPT DON''T EXECUTE,'#13'because ALL scripts are only TESTED!';
type

	//Перечисляемый тип, определяющий режим запуска программы
	TAppMode   = ( amNone, amWin, amCmd );

	//Перечисляемый тип, определяющий режим запуска программы
	TAppResult = ( arNone, arBackUpFileNotFound, arScrNotFound, arPrepareError, arPrepareSuccess, arTestSuccess, arExecSuccess, arTestError, arExecError );

	//Перечисляемый тип, определяющий режим сортировки файлов скриптов
	TSortMode  = ( smAlphabetically, smDate, smOrder );

	//Структура, содержащая параметры для тестирования скриптов
	TScriptParams = packed record
		KeyExpr         : String;
		ScriptDir       : String;
		SeparatorChar   : String;
		PrefixCharCount : Integer;
		ExtModeEnabled  : Boolean;
		DateBeg         : TDate;
		DateEnd         : TDate;
	end;

implementation

end.
