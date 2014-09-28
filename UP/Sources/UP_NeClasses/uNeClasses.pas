unit uNeClasses;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uNeClasses                                                                 *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Библиотека классов общего назначения.                                      *
*                                                                              *
* Copyright  ©  Дата создания: 04.05.07,  Автор: Найдёнов Е.А                  *
*                                                                              *
*******************************************************************************}

interface

uses Windows, Messages, SysUtils, RxMemDS, uCommonSp, uNeTypes;

type
  
  { *** Назначение: реализация абстрактных методов для универсальной работы с параметрами *** }
  TNeSprav = class(TSprav)
  private
      procedure SetFldDefs   ( const aSource: TRxMemoryData; aFieldDefs: TArr_FieldDefs );
      procedure SetFieldDefs ( const aTypeParam: TEnm_TypeParam; const aParams: TRec_Params );
  public
      constructor Create( const aTypeParam: TEnm_TypeParam; const aParams: TRec_Params ); reintroduce;
      procedure Show; reintroduce; virtual;
  end;

implementation

uses Variants;

{ TNeSprav }
constructor TNeSprav.Create( const aTypeParam: TEnm_TypeParam; const aParams: TRec_Params );
begin
    inherited Create;
    SetFieldDefs( aTypeParam, aParams );
    PrepareMemoryDataSets;
end;

procedure TNeSprav.SetFldDefs( const aSource: TRxMemoryData; aFieldDefs: TArr_FieldDefs );
var
    i, n : Integer;
begin
    if aFieldDefs <> nil
    then begin
        i := Low ( aFieldDefs );
        n := High( aFieldDefs );

        for i := i to n
        do 
           with aFieldDefs[i]
           do begin
               aSource.FieldDefs.Add( FName, FType );
           end;
    end 
    else begin
        raise Exception.Create( sEEmptyParamListUA + sEFldValIsNullUA );
    end;
end;

procedure TNeSprav.SetFieldDefs(const aTypeParam: TEnm_TypeParam;  const aParams: TRec_Params );
begin

    case aTypeParam of
                      
      tpInput       : begin
                        SetFldDefs( Input, aParams.FInParams );
                      end;

      tpOutput      : begin
                        SetFldDefs( Output, aParams.FOutParams );
                      end;

      tpInputOutput : begin
                        SetFldDefs( Input,  aParams.FInParams  );
                        SetFldDefs( Output, aParams.FOutParams );
                      end;

    end;
end;

procedure TNeSprav.Show;
begin
    inherited;
    
    //Проверяем корректность идентификатора соединения с БД
    if Input.FindField( sPN_IN_DBHandle ) <> nil
    then begin
        if not VarIsNull( Input[sPN_IN_DBHandle] )
        then begin
            if Input[sPN_IN_DBHandle] = 0
            then begin
                raise Exception.Create( sEDBHandleZeroUA );
            end;
        end
        else begin
            raise Exception.Create( sEFieldUA + sPN_IN_DBHandle + sEFldValIsNullUA );
        end;
    end
    else begin
        raise Exception.Create( sEFieldUA + sPN_IN_DBHandle + sENotFoundUA );
    end;
    
end;

end.
 