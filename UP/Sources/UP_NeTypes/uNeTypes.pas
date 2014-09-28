unit uNeTypes;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uNeTypes                                                                   *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Централизованное хранение пользовательских типов, констант и пр.           *
*                                                                              *
* Copyright  ©  Дата создания: 04.05.07,  Автор: Найдёнов Е.А                  *
*                                                                              *
*******************************************************************************}

interface

uses DB;

type

  //Перечислимый тип для хранения типа параметров модуля
  TEnm_TypeParam   = ( tpInput, tpOutput, tpInputOutput );
   
  //Запись для хранения атрибутов полей
  TRec_FieldDefs = record
      FName : String;
      FType : TFieldType;
  end; 

  //Массив записей, содержащих атрибуты полей
  TArr_FieldDefs = array of TRec_FieldDefs;
   
  //Запись для хранения значений входящих(исходящих) параметров
  TRec_Params = record
      FInParams  : TArr_FieldDefs;
      FOutParams : TArr_FieldDefs;
  end; 

const

	{*****************************************}
    {   *** Константы общего назначения ***   }
    {*****************************************}

    cZERO             = 0;
    cTICK             = '''';
    cCOMMA            = ',';
    cCOLON            = ':';
    cSPACE            = ' ';
    cUNKNOWN_ID       = -1; 
    cBRACKET_OPEN     = '(';
    cBRACKET_CLOSE    = ')';
    cDEF_ADMIN_MODE   = 0;
    cDEF_SHOW_STYLE   = 0;
    cDEF_SELECT_MODE  = 1;
    cDEF_NEW_VERSHION = 1;

resourcestring

    {***************************************}
    {   *** Ресурсы общего назначения ***   }
    {***************************************}

	//Составляющие сообщения об ошибке
	sErrorTextUA    = '       Помилка: ';
	sErrorCodeUA    = 'Код помилки: ';
	sErrorAddrUA    = 'Адреса помилки: ';
	sContinueQstUA  = ' Продовжити?';
	sErrorTextExtUA = 'Помилка: ';

	sMsgCaptionErrUA = 'Помилка';
	sMsgCaptionWrnUA = 'Попередження';
	sMsgCaptionInfUA = 'Інформація';
	sMsgCaptionQstUA = 'Підтвердження';

    //Имена входящих параметров модуля
    sPN_IN_Mode     = 'Mode';
    sPN_IN_DBHandle = 'DBHandle';

    //Сообщения исключительных ситуаций
    sEFieldUA          = 'Поле ';
    sENotFoundUA       = ' не знайдено!';
    sEDBHandleZeroUA   = ' Ідентифікатор з''єднання відсутній!';
    sEFldValIsNullUA   = ' не заповнено!';
    sEEmptyParamListUA = 'Список параметрів';

implementation

end.
 