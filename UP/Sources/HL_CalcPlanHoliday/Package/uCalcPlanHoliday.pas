unit uCalcPlanHoliday;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uCalcPlanHoliday                                                           *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Рассчет количества дней отпуска, предоставляемых по плану.                 *
*                                                                              *
* Copyright  ©  Дата создания: 05.03.07,  Автор: Найдёнов Е.А                  *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, SysUtils, Classes, Forms, Controls, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, IBase, uCommonSp, Dialogs;

type

  //Перечислимый тип для хранения типа параметров модуля
  TEnm_TypeParam        = ( tpInput, tpOutput );
   
  //Перечислимый тип для хранения вида отпуска
  TEnm_TypeHolyday      = ( thMain, thBadCond, thSpecCond );

  //Перечислимый тип для хранения вида критерия, влияющего на продолжительность планового отпуска
  TEnm_TypeHolidayParam = ( thpProportional, thpInvalid_1_2, thpInvalid_3, thpAgeLess18 );
  
  //Запись для хранения атрибутов полей
  TRec_FieldDefs = record
      FName : String;
      FType : TFieldType;
  end; 
  
  //Запись для хранения значений исходящих параметров
  TRec_OutputParams = record
    FPeriodBeg : TDate;
    FPeriodEnd : TDate;
    FDaysCount : Integer;
  end; 

  //Запись для хранения значений параметров для анализа
  TRec_AnalyzeParams = record
    FAge              : Integer;
    FNote             : String;
    FTypeParam        : TEnm_TypeHolidayParam; 
    FPeriodBeg        : TDate;
    FPeriodEnd        : TDate;
    FTypeHoliday      : Integer;
    FInvalidGroup     : Integer;
    FIdTypeHoliday    : Int64;
    FWorkedDaysCount  : Integer;
    FHolidayDaysCount : Real;
    FIsPps            : String;
  end;
   
  //Запись для хранения значений входящих параметров
  TRec_InputParams = record
    FPeriodBeg       : TDate;
    FPeriodEnd       : TDate;
    FIdWorkDogMoving : Int64;
  end; 

  { *** Назначение: реализация расчета количества дней отпуска, предоставляемых по плану *** }
  TdmCalcPlanHoliday = class(TDataModule)
   // dbWork  : TpFIBDatabase;
  //  dstWork : TpFIBDataSet;

 //   trRead  : TpFIBTransaction;
  //  trWrite : TpFIBTransaction;

 //   spcWork : TpFIBStoredProc;
    dbWork: TpFIBDatabase;
    dstWork: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    spcWork: TpFIBStoredProc;
  private
      FInputParams : TRec_InputParams;
      procedure GenNote( var aAnalyzeParams: TRec_AnalyzeParams );
      procedure CalcPlanHoliday;
      procedure SetHolidayParams( aDataSet: TpFIBDataSet );
  public
    { Public declarations }
  end;
  
  { *** Назначение: реализация абстрактных методов для универсальной работы с параметрами  *** }
  TCalcPlanHoliday = class(TSprav)
  private
      FDM : TdmCalcPlanHoliday;
      procedure SetFieldDefs( const aTypeParam: TEnm_TypeParam; aFieldDefs: array of TRec_FieldDefs );
  public
      constructor Create; reintroduce;
      destructor Destroy; reintroduce;
      procedure Show; override;
  end;

  function CreateSprav: TSprav; stdcall;

  exports
      CreateSprav;

implementation

uses Math;

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

	sErr_DBConnectionFailed = 'З''єднання з базою даних неможливе!'#13'перевірте, будь ласка, вхідні параметри';

    //Имена входящих параметров модуля
    sPN_IN_Mode               = 'Mode';
    sPN_IN_DBHandle           = 'DBHandle';
    sPN_IN_Period_Beg         = 'Period_Beg';
    sPN_IN_Period_End         = 'Period_End';
    sPN_IN_Id_Work_Dog_Moving = 'Id_Work_Dog_Moving';

    //Имена исходящих параметров модуля
    sPN_OUT_Note            = 'Note';
    sPN_OUT_Period_Beg      = 'Period_Beg';
    sPN_OUT_Period_End      = 'Period_End';
    sPN_OUT_Days_Count      = 'Days_Count';
    sPN_OUT_Id_Type_Holiday = 'Id_Type_Holiday';

    //Названия входящих параметров ХП
    sPPN_IN_PERIOD_BEG         = 'IN_PERIOD_BEG';
    sPPN_IN_PERIOD_END         = 'IN_PERIOD_END';
    sPPN_IN_ID_WORK_DOG_MOVING = 'IN_ID_WORK_DOG_MOVING';

    //Названия исходящих параметров ХП
    sPPN_OUT_AGE                = 'OUT_AGE';
    sPPN_OUT_NOTE               = 'OUT_NOTE';
    sPPN_OUT_PERIOD_BEG         = 'OUT_PERIOD_BEG';
    sPPN_OUT_PERIOD_END         = 'OUT_PERIOD_END';
    sPPN_OUT_TYPE_HOLIDAY       = 'OUT_TYPE_HOLIDAY';
    sPPN_OUT_INVALID_GROUP      = 'OUT_INVALID_GROUP';
    sPPN_OUT_ID_TYPE_HOLIDAY    = 'OUT_ID_TYPE_HOLIDAY';
    sPPN_OUT_WORKED_DAYS_COUNT  = 'OUT_WORKED_DAYS_COUNT';
    sPPN_OUT_HOLIDAY_DAYS_COUNT = 'OUT_HOLIDAY_DAYS_COUNT';
    sPPN_OUT_IS_PPS             = 'OUT_IS_PPS';

    //SQL-запросы
    sSQL_SEL_HL_GET_DATA_FOR_CALC_HOLIDAY = 'SELECT * FROM HL_GET_DATA_FOR_CALC_HOLIDAY(';

	//Составляющие сообщений, поясняющих происхождение результирующего кол-ва дней отпуска по плану
    sUsr_HL_Type         = 'Вид відпустки                       : ';
    sUsr_HL_DCount       = 'Розрахункова кількість діб : ';
    sUsr_HL_Reason       = 'Підстава                               : ';
    sUsr_HL_Main         = 'щорічна основна відпуска;'#13#10;
    sUsr_HL_BadCond      = 'щорічна додаткова відпуска за роботу із шкідливими і важкими умовами праці;'#13#10;
    sUsr_HL_SpecCond     = 'щорічна додаткова відпуска за особливий характер праці;'#13#10;
    sUsr_NoteAgeLess18   = 'неповнолітн(ій)я;'#13#10;
    sUsr_NoteInvalid_3   = 'інвалід 3 групи;'#13#10;
    sUsr_NoteInvalid_1_2 = 'інвалід 1 або 2 групи;'#13#10;
    sUsr_NoteProporshion = 'пропорційно до відпрацьованого часу;'#13#10;
    
const

	{*****************************************}
    {   *** Константы общего назначения ***   }
    {*****************************************}

    cCRL           = #13#10;
    cZERO          = 0;
    cTICK          = '''';
    cCOMMA         = ',';
    cSEMICOLON     = ';';
    cBRACKET_OPEN  = '(';
    cBRACKET_CLOSE = ')'; 

    //Кол-во дней плановых отпусков(зависящее от разных характеристик человека)
    cDCount_InYear      = 365;
    cDCount_InYear_PPS  = 302;
    cDCount_Holiday_PPS = 56;
    cDCount_HalfYear    = 181;
    cDCount_AgeLess18   = 31;
    cDCount_Invalid_3   = 26;
    cDCount_Invalid_1_2 = 30;

    cInFieldDefs: array[0..2] of TRec_FieldDefs = (
      ( FName: sPN_IN_Id_Work_Dog_Moving; FType: ftVariant  ), 
      ( FName: sPN_IN_Period_Beg;         FType: ftDate     ),
      ( FName: sPN_IN_Period_End;         FType: ftDate     ) );

    cOutFieldDefs: array[0..4] of TRec_FieldDefs = (
      ( FName: sPN_OUT_Id_Type_Holiday; FType: ftVariant  ),
      ( FName: sPN_OUT_Note;            FType: ftFmtMemo  ),
      ( FName: sPN_OUT_Days_Count;      FType: ftInteger  ),
      ( FName: sPN_OUT_Period_Beg;      FType: ftDate     ),
      ( FName: sPN_OUT_Period_End;      FType: ftDate     ) );

{$R *.dfm}

function CreateSprav: TSprav; stdcall;
begin
  Result := TCalcPlanHoliday.Create;
end;

{ TCalcPlanHoliday }
procedure TCalcPlanHoliday.SetFieldDefs( const aTypeParam: TEnm_TypeParam; aFieldDefs: array of TRec_FieldDefs );
var
    i, n : Integer;
begin
    i := Low( aFieldDefs  );
    n := High( aFieldDefs );

    case aTypeParam of

      tpInput  : begin
                   for i := i to n
                   do 
                       with aFieldDefs[i]
                       do begin
                           Input.FieldDefs.Add( FName, FType );
                       end;
                 end;

      tpOutput : begin
                   for i := i to n
                   do 
                       with aFieldDefs[i]
                       do begin
                           Output.FieldDefs.Add( FName, FType );
                       end;
                 end;
    end;
end;

//Создаем экземпляр каркасного класса
constructor TCalcPlanHoliday.Create;
begin
    try
        inherited Create;
        SetFieldDefs( tpInput,  cInFieldDefs  );
        SetFieldDefs( tpOutput, cOutFieldDefs );
        PrepareMemoryDataSets;
    except
        on E: Exception
        do begin
            MessageBox( 0, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

//Освобождаем ресурсы
destructor TCalcPlanHoliday.Destroy;
begin
    if FDM <> nil
    then begin
        FreeAndNil( FDM );
    end;
    
    inherited;
end;

//Создаем экземпляр специального класса
procedure TCalcPlanHoliday.Show;
var
    i, n : Integer;
begin
    try
        if Input[sPN_IN_DBHandle] <> 0
        then begin
            inherited;
            FDM := TdmCalcPlanHoliday.Create( Application.MainForm );
            FDM.dbWork.Handle := TISC_DB_HANDLE( Integer( Input[sPN_IN_DBHandle] ) );
            FDM.trRead.StartTransaction;

            //Запоминаем входящие параметры
            with FDM.FInputParams
            do begin
                FPeriodBeg       := Input[sPN_IN_Period_Beg        ];
                FPeriodEnd       := Input[sPN_IN_Period_End        ];
                FIdWorkDogMoving := Input[sPN_IN_Id_Work_Dog_Moving];
            end;

            //Рассчитываем кол-во плановых дней отпуска
            FDM.CalcPlanHoliday;

            n := FDM.dstWork.RecordCount - 1;
            //Возвращаем рассчитанные значения внешнему модулю
            try
                FDM.dstWork.DisableControls;
                Output.DisableControls;
                FDM.dstWork.First;

                for i := 0 to n
                do begin
                    Output.Append;
                    Output[sPN_OUT_Id_Type_Holiday] := FDM.dstWork.FBN(sPPN_OUT_ID_TYPE_HOLIDAY   ).Value;
                    Output[sPN_OUT_Days_Count     ] := FDM.dstWork.FBN(sPPN_OUT_HOLIDAY_DAYS_COUNT).AsInteger;
                    Output[sPN_OUT_Note           ] := FDM.dstWork.FBN(sPPN_OUT_Note              ).AsString;
                    Output[sPN_OUT_Period_Beg     ] := FDM.dstWork.FBN(sPPN_OUT_PERIOD_BEG        ).AsDateTime;
                    Output[sPN_OUT_Period_End     ] := FDM.dstWork.FBN(sPPN_OUT_PERIOD_End        ).AsDateTime;
                    Output.Post;
                    
                    FDM.dstWork.Next;
                end;
            finally
                Output.EnableControls;
                FDM.dstWork.EnableControls;
            end;
            
        end
        else begin
            MessageBox( 0, PChar( sErr_DBConnectionFailed ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    except
        on E: Exception
        do begin
            MessageBox( 0, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

//Формируем тело примечания
procedure TdmCalcPlanHoliday.GenNote(var aAnalyzeParams: TRec_AnalyzeParams);
begin
    try
        with aAnalyzeParams
        do begin
            //Учитываем вид отпуска
            case TEnm_TypeHolyday( FTypeHoliday ) of

              thMain     : begin
                             FNote := sUsr_HL_Type + sUsr_HL_Main;
                           end; 

              thBadCond  : begin
                             FNote := sUsr_HL_Type + sUsr_HL_BadCond;
                           end; 

              thSpecCond : begin
                             FNote := sUsr_HL_Type + sUsr_HL_SpecCond;
                           end; 
            end;

            //Учитываем кол-во дней отпуска
            FNote := FNote + sUsr_HL_DCount + FloatToStr( FHolidayDaysCount ) + cSEMICOLON + cCRL;

            //Учитываем дополнительные критерии расчета
            FNote := FNote + sUsr_HL_Reason;

            case FTypeParam of

              thpProportional : begin
                                  FNote := FNote + sUsr_NoteProporshion;
                                end;

              thpInvalid_1_2  : begin
                                  FNote := FNote + sUsr_NoteInvalid_1_2;
                                end;

              thpInvalid_3    : begin
                                  FNote := FNote + sUsr_NoteInvalid_3;
                                end;

              thpAgeLess18    : begin
                                  FNote := FNote + sUsr_NoteAgeLess18;
                                end;
            end;
            
        end;
    except
        on E: Exception
        do begin
            MessageBox( 0, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

{ TdmCalcPlanHoliday }
procedure TdmCalcPlanHoliday.SetHolidayParams(aDataSet: TpFIBDataSet);
var
    AnalyzeParams : TRec_AnalyzeParams;
    Holidays_Days_Count: Real;
begin
    try
        with AnalyzeParams
        do begin
            //Инициализируем параметры для анализа
            with aDataSet
            do begin
                FAge              := FBN(sPPN_OUT_AGE               ).AsInteger;
                FNote             := FBN(sPPN_OUT_NOTE              ).AsString;
                FPeriodBeg        := FBN(sPPN_OUT_PERIOD_BEG        ).Value;
                FPeriodEnd        := FBN(sPPN_OUT_PERIOD_END        ).Value;
                FTypeHoliday      := FBN(sPPN_OUT_TYPE_HOLIDAY      ).AsInteger;
                FInvalidGroup     := FBN(sPPN_OUT_INVALID_GROUP     ).AsInteger;
                FIdTypeHoliday    := FBN(sPPN_OUT_ID_TYPE_HOLIDAY   ).Value;
                FWorkedDaysCount  := FBN(sPPN_OUT_WORKED_DAYS_COUNT ).AsInteger;
                FHolidayDaysCount := FBN(sPPN_OUT_HOLIDAY_DAYS_COUNT).AsInteger;
                FIsPps            := FBN(sPPN_OUT_IS_PPS            ).AsString;
            end;

                Holidays_Days_Count :=  FHolidayDaysCount;

            //Проверка количества полных отработанных человеком дней на данной должности
            if ( FWorkedDaysCount < cDCount_HalfYear )
            then begin
                FHolidayDaysCount := FHolidayDaysCount*FWorkedDaysCount/cDCount_InYear;
                FHolidayDaysCount := SimpleRoundTo( FHolidayDaysCount, -2 );
                if (FHolidayDaysCount > Holidays_Days_Count)
                then FHolidayDaysCount := Holidays_Days_Count;
                FTypeParam        := thpProportional;
                //Формируем текст примечания
                GenNote( AnalyzeParams );
            end;

             //Проверка количества полных отработанных человеком дней на данной должности
            if ( FIsPps = 'T')
            then begin
                FHolidayDaysCount := FHolidayDaysCount*FWorkedDaysCount/cDCount_InYear_PPS;
                FHolidayDaysCount := SimpleRoundTo( FHolidayDaysCount, -2 );
                if (FHolidayDaysCount > Holidays_Days_Count)
                then FHolidayDaysCount := Holidays_Days_Count;
                FTypeParam        := thpProportional;
                //Формируем текст примечания
                GenNote( AnalyzeParams );
            end;

            //Проверка инвалидности (3-я группа)
            if ( FInvalidGroup = 3 ) AND ( FHolidayDaysCount < cDCount_Invalid_3 )
            then begin
                FHolidayDaysCount := cDCount_Invalid_3;
                FTypeParam        := thpInvalid_3;
                //Формируем текст примечания
                GenNote( AnalyzeParams );
            end;

            //Проверка инвалидности (1-ая, 2-ая группа)
            if ( FInvalidGroup in [1,2] ) AND ( FHolidayDaysCount < cDCount_Invalid_1_2 )
            then begin
                FHolidayDaysCount := cDCount_Invalid_1_2;
                FTypeParam        := thpInvalid_1_2;
                //Формируем текст примечания
                GenNote( AnalyzeParams );
            end;

            //Проверка на совершеннолетие
            if ( FAge < 18 ) AND ( FHolidayDaysCount < cDCount_AgeLess18 )
            then begin
                FHolidayDaysCount := cDCount_AgeLess18;
                FTypeParam        := thpAgeLess18;
                //Формируем текст примечания
                GenNote( AnalyzeParams );
            end;

            //Запоминаем полученные в ходе расчета значения
            aDataSet.CacheEdit( [aDataSet.FBN(sPPN_OUT_HOLIDAY_DAYS_COUNT).Index,
                                 aDataSet.FBN(sPPN_OUT_NOTE).Index],
                                [Round( FHolidayDaysCount ),
                                 FNote] );
        end;
    except
        on E: Exception
        do begin
            MessageBox( 0, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

procedure TdmCalcPlanHoliday.CalcPlanHoliday;
var
    i, n         : Integer;
    OutputParams : TRec_OutputParams;
begin
    try
        //Получаем НД(параметры, влияющие на продолжительность плановых отпусков) для анализа
        if dstWork.Active then dstWork.Close;
        with dstWork, FInputParams
        do begin
            ParamByName(sPPN_IN_PERIOD_BEG        ).AsDate  := FPeriodBeg;
            ParamByName(sPPN_IN_PERIOD_END        ).AsDate  := FPeriodEnd;
            ParamByName(sPPN_IN_ID_WORK_DOG_MOVING).AsInt64 := FIdWorkDogMoving;
        end;
        dstWork.Open;

        n := dstWork.RecordCount - 1;

        try
            dstWork.DisableControls;
            dstWork.First;

            //Вычисляем значения параметров, влияющих на продолжительность плановых отпусков
            for i := 0 to n
            do begin
                SetHolidayParams( dstWork );
                dstWork.Next;
            end;
        finally
            dstWork.EnableControls;
        end;

    except
        on E: Exception
        do begin
            MessageBox( 0, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

end.


