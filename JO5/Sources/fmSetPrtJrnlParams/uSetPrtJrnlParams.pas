unit uSetPrtJrnlParams;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uSetPrtJrnlParams                                                          *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Диалог выбора параметров печати журнала.                                  *
*                                                                              *
* Copyright  ©  Год 2006,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, FIBQuery, pFIBQuery,
  pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  cxControls, cxContainer, cxEdit, cxCheckBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxMRUEdit, frxClass, frxDBSet, uneTypes, cxSpinEdit,
  frxExportPDF, frxExportImage, frxExportRTF, frxExportXML, frxExportXLS,
  frxExportHTML, frxExportTXT;

type

  //Перечисляемый тип для определения типа преобразований
  TEnm_TypeCoversion = ( ctIntToSet, ctSetToInt );

  TfmSetPrtJrnlParams = class(TForm)

    dbWork           : TpFIBDatabase;
    trRead           : TpFIBTransaction;
    trWrite          : TpFIBTransaction;
    dstWork          : TpFIBDataSet;
    spcWork          : TpFIBStoredProc;

    btnOK            : TcxButton;
    btnCancel        : TcxButton;

    gbxPeriod        : TGroupBox;
    gbxParamsPrtJrnl : TGroupBox;

    cbxSCH           : TcxCheckBox;
    cbxSmet          : TcxCheckBox;
    cbxRazd          : TcxCheckBox;
    cbxStat          : TcxCheckBox;
    cbxKekv          : TcxCheckBox;
    cbxGrSmet        : TcxCheckBox;
    cbxSubSCH        : TcxCheckBox;

    lblYear          : TLabel;
    lblMonth         : TLabel;

    edtYear          : TcxSpinEdit;
    edtMonth         : TcxMRUEdit;
    frdsWork         : TfrxDBDataset;
    frrWork: TfrxReport;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxPDFExport1: TfrxPDFExport;

    procedure FormShortCut              (var Msg: TWMKey; var Handled: Boolean);

    procedure cbxSCHClick               (Sender: TObject);

    procedure frrWorkGetValue           (const VarName: String; var Value: Variant);

    procedure edtYearPropertiesChange   (Sender: TObject);
    procedure edtYearPropertiesValidate (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);

  private
	  FDateBeg       : TDateTime;
      FDateEnd       : TDateTime;
      FParamCount    : Integer;
      FCurrPeriod    : TDateTime;
	  FSysOptions    : TRec_SysOptions;
      FPrtJrnlParams : TSet_PrtJrnlParams;

      function  GetDateBeg       : TDateTime;
      function  GetDateEnd       : TDateTime;
      function  GetParamCount    : Integer;
      function  GetCurrPeriod    : TDateTime;
	  function  GetSysOptions    : TRec_SysOptions;
      function  GetPrtJrnlParams : TSet_PrtJrnlParams;
      procedure SetDateBeg       ( aValue: TDateTime          );
      procedure SetDateEnd       ( aValue: TDateTime          );
      procedure SetParamCount    ( aValue: Integer            );
      procedure SetCurrPeriod    ( aValue: TDateTime          );
      procedure SetPrtJrnlParams ( aValue: TSet_PrtJrnlParams );
  public
      constructor Create( const aDBFMParams: TRec_DBFMParams; const aSysOptions: TRec_SysOptions ); reintroduce;

	  procedure SetYears;
	  procedure FillMonthList( var aMonthList: TStringList; const aFillMode: TFillMode );

	  property pDateBeg       : TDateTime          read GetDateBeg       write SetDateBeg;
	  property pDateEnd       : TDateTime          read GetDateEnd       write SetDateEnd;
	  property pParamCount    : Integer            read GetParamCount    write SetParamCount;
	  property pCurrPeriod    : TDateTime          read GetCurrPeriod    write SetCurrPeriod;
	  Property pSysOptions    : TRec_SysOptions    read GetSysOptions;
      Property pPrtJrnlParams : TSet_PrtJrnlParams read GetPrtJrnlParams write SetPrtJrnlParams;
  end;

  procedure PrintJournal         ( const aDBFMParams: TRec_DBFMParams; const aSysOptions: TRec_SysOptions ); stdcall;
  procedure ConvertPrtJrnlParams ( var aParamValue: Integer; var aParamSet: TSet_PrtJrnlParams; const aTypeCoversion: TEnm_TypeCoversion );

  exports
	  PrintJournal;

implementation

uses DateUtils, uneUtils;

resourcestring

	//Названия локальных переменных отчета
	sFRN_Year   = 'Year';
	sFRN_Month  = 'Month';
	sFRN_Period = 'Period';
    
const

    cMaxParamCount = 2;
        
{$R *.dfm}

procedure ConvertPrtJrnlParams( var aParamValue: Integer; var aParamSet: TSet_PrtJrnlParams; const aTypeCoversion: TEnm_TypeCoversion );

{*******************************************************************************
*                                                                              *
* Название процедуры :                                                         *
*                                                                              *
*	ConvertPrtJrnlParams                                                       *
*                                                                              *
* Назначение процедуры :                                                       *
*                                                                              *
*  Преобразование числового значения параметра печати журнала в соответствующее*
* значение перечислимого типа. Для коректной работы процедуры критично:        *
* значения свойств Tag компонентов TcxCheckBox; последовательность эл-ов       *
* перечислимого типа.                                                          *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aParamSet      - значение перечислимого типа параметра печати.          *
*      aParamValue    - числовое значение параметра печати.                    *
*      aTypeCoversion - тип преобразований вышеописанных значений.             *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*      aParamSet      - значение перечислимого типа параметра печати.          *
*      aParamValue    - числовое значение параметра печати.                    *
*                                                                              *
*******************************************************************************}
var
    i, vCount      : Integer;
    vParamValueStr : String;
begin
  try
        case aTypeCoversion of

          ctIntToSet : begin
                         vParamValueStr := IntToStr( aParamValue );

                         case Length( vParamValueStr ) of

                           1              : begin
                                              aParamSet := [ TEnm_PrtJrnlParams(0), TEnm_PrtJrnlParams( StrToInt( vParamValueStr[1] ) ) ];
                                            end;

                           cMaxParamCount : begin
                                              aParamSet := [ TEnm_PrtJrnlParams( StrToInt( vParamValueStr[1] ) ), TEnm_PrtJrnlParams( StrToInt( vParamValueStr[2] ) ) ];
                                            end;
                         end;
                         
                       end;

          ctSetToInt : begin
                         vParamValueStr := '';
                         vCount := Ord( High( TEnm_PrtJrnlParams ) );

                         for i := 0 to vCount
                         do begin
                             if TEnm_PrtJrnlParams(i) in aParamSet
                             then begin
                                 vParamValueStr := vParamValueStr + IntToStr(i);
                             end;
                         end;

                         aParamValue := StrToInt( vParamValueStr );
                       end;
        end;
  except
      on E: Exception
      do begin
          case aTypeCoversion of

            ctIntToSet : begin
                           aParamSet := [];
                         end;

            ctSetToInt : begin
                           aParamValue := -1;
                         end;
          end;

	     MessageBox( 0, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
      end;
  end;
end;  //End of procedure ConvertPrtJrnlParams

function TfmSetPrtJrnlParams.GetDateBeg: TDateTime;
begin
  Result := FDateBeg;
end;

function TfmSetPrtJrnlParams.GetDateEnd: TDateTime;
begin
  Result := FDateEnd;
end;

function TfmSetPrtJrnlParams.GetParamCount: Integer;
begin
  Result := FParamCount;
end;

function TfmSetPrtJrnlParams.GetCurrPeriod: TDateTime;
begin
  Result := FCurrPeriod;
end;

function TfmSetPrtJrnlParams.GetSysOptions: TRec_SysOptions;
begin
  Result := FSysOptions;
end;

function TfmSetPrtJrnlParams.GetPrtJrnlParams: TSet_PrtJrnlParams;
begin
  Result := FPrtJrnlParams;
end;

procedure TfmSetPrtJrnlParams.SetDateBeg(aValue: TDateTime);
begin
  FDateBeg := aValue;
end;

procedure TfmSetPrtJrnlParams.SetDateEnd(aValue: TDateTime);
begin
  FDateEnd := aValue;
end;

procedure TfmSetPrtJrnlParams.SetParamCount(aValue: Integer);
begin
  FParamCount := aValue;
end;

procedure TfmSetPrtJrnlParams.SetCurrPeriod(aValue: TDateTime);
begin
  FCurrPeriod := aValue;
end;

procedure TfmSetPrtJrnlParams.SetPrtJrnlParams(aValue: TSet_PrtJrnlParams);
begin
  FPrtJrnlParams := aValue;  
end;

//Печатаем журнал
procedure PrintJournal( const aDBFMParams: TRec_DBFMParams; const aSysOptions: TRec_SysOptions );
var
	i, n             : Integer;
	ModRes           : Integer;
    CaseKey          : Integer;
	fmParams         : TfmSetPrtJrnlParams;
    AppHandle        : THandle;
    LogFileName      : String;
	KS_SaldoOborot   : Int64;
	KS_Korrespondent : Int64;
begin
  try
      try
          try
              fmParams := TfmSetPrtJrnlParams.Create( aDBFMParams, aSysOptions );
              AppHandle := fmParams.pSysOptions.AppHandle;
              LogFileName := fmParams.pSysOptions.LogFileName;
              ModRes := fmParams.ShowModal;
              
              if ModRes = mrOK
              then begin
                  //Оператор не явл. лишним, поскольку в теле экпортируемой ф-ции не видны составляющие класса
                  with fmParams
                  do begin
                      Hide;

                      //Получаем дату, соответствующую выбранному пользователем периоду
                      n := High( cMonthUA );

                      for i := Low( cMonthUA ) to n
                      do begin
                          if edtMonth.Text = cMonthUA[i] then Break;
                      end;

                      pCurrPeriod := EncodeDate( StrToInt( edtYear.Text ), i + 1, cFIRST_DAY_OF_MONTH );

                      //Заполняем буфер данными для расчета сальдо и оборотов
                      spcWork.StoredProcName := 'JO5_PREPARE_BUFFER_SALDO_OBOROT';
                      spcWork.ParamByName('IN_CURR_PERIOD').AsDate := pCurrPeriod;

                      try
                          trWrite.StartTransaction;
                          spcWork.Prepare;
                          spcWork.ExecProc;

                          KS_SaldoOborot := spcWork.FN('OUT_KEY_SESSION').AsInt64;

                          //Заполняем буфер данными для расшифровки корреспонденции
                          spcWork.StoredProcName := 'JO5_PREPARE_BUFFER_KOR_PRT_JNRL';
                          spcWork.ParamByName('IN_CURR_PERIOD').AsDate := pCurrPeriod;

                          spcWork.Prepare;
                          spcWork.ExecProc;

                          KS_Korrespondent := spcWork.FN('OUT_KEY_SESSION').AsInt64;
                      finally
                          trWrite.Commit;
                          spcWork.Close;
                      end;

                      //Получаем текущее значение ключа выбора для данного контрагента
                      ConvertPrtJrnlParams( CaseKey, FPrtJrnlParams, ctSetToInt );

                      //Получаем информацию для печати
                      if dstWork.Active then dstWork.Close;
                      dstWork.SQLs.SelectSQL.Text := 'SELECT* FROM JO5_GET_DATA_FOR_PRT_JOURNAL(' + cTICK + DateToStr( pCurrPeriod ) + cTICK + cSEMICOLON + IntToStr( CaseKey ) + cSEMICOLON + IntToStr( KS_SaldoOborot ) + cSEMICOLON + IntToStr( KS_Korrespondent ) + cBRAKET_CL + ' ORDER BY OUT_LVL_0_NUMBER, OUT_LVL_1_NUMBER, OUT_KOR_SCH_NUMBER';
                      dstWork.Open;

                      //Загружаем шаблон файла отчёта
            		  if frrWork.LoadFromFile('Reports\JO5\JO5_PRT_JOURNAL.fr3')
                      then begin
                          //Показываем шаблон файла отчёта
                          frrWork.PrepareReport;
                          frrWork.ShowPreparedReport;
                      end
                      else begin
                          MessageBox( Handle, PChar( 'Файл отчета ' + 'Reports\JO5\JO5_PRT_JOURNAL.fr3' + ' не найден!' ), PChar( sMsgCaptionWrnUA ), MB_OK or MB_ICONWARNING );
                      end;

                      //Очищаем буфер
                      spcWork.StoredProcName := 'JO5_BUFFER_DEL';
                      spcWork.ParamByName('IN_KEY_SESSION').AsInt64 := KS_SaldoOborot;

                      try
                          trWrite.StartTransaction;
                          spcWork.Prepare;
                          spcWork.ExecProc;

                          spcWork.ParamByName('IN_KEY_SESSION').AsInt64 := KS_Korrespondent;
                          spcWork.ExecProc;
                      finally
                          trWrite.Commit;
                          spcWork.Close;
                      end;
                  end;

              end;

          finally
              if fmParams <> nil then FreeAndNil( fmParams );
          end;
      except
          //Протоколируем ИС
	      LogException( LogFileName );
          Raise;
      end;
  except
      on E: Exception
      do begin
	    MessageBox( AppHandle, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
      end;
  end;
end;

constructor TfmSetPrtJrnlParams.Create(const aDBFMParams: TRec_DBFMParams;
  const aSysOptions: TRec_SysOptions);
var
    i, j, n, k : Integer;
begin
    try
        try
            inherited Create( aDBFMParams.Owner );
            FSysOptions := aSysOptions;
            ConvertPrtJrnlParams( FSysOptions.DefCaseKey, FPrtJrnlParams, ctIntToSet );
            
            //Выставляем умалчиваемые значения переключателей
            n := Ord( High( TEnm_PrtJrnlParams ) );
            k := gbxParamsPrtJrnl.ControlCount - 1;

            for i := 0 to n
            do begin
                if TEnm_PrtJrnlParams(i) in pPrtJrnlParams
                then begin
                    for j := 0 to k
                    do begin
                        if     ( gbxParamsPrtJrnl.Controls[j] is TcxCheckBox )
                           AND ( gbxParamsPrtJrnl.Controls[j].Tag = i )
                        then begin
                            TcxCheckBox( gbxParamsPrtJrnl.Controls[j] ).Checked := True;
                            Break;
                        end;
                    end;  //End of Loop for controls
                end;
            end;  //End of Loop for Enumerated elements
            
            //Выставляем значения свойств
            with aSysOptions
            do begin
                SetDateBeg( DateFirstImport );
                SetDateEnd( DateCurrPeriod );
                SetCurrPeriod( DateCurrPeriod );
            end;

            dbWork.Handle := aDBFMParams.DBHandle;
            trRead.StartTransaction;
            SetYears;
        except
            //Протоколируем ИС
	        LogException( pSysOptions.LogFileName );
            Raise;
        end;
    except
        on E: Exception
        do begin
	      MessageBox( Handle, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

//Получаем допустимый набор лет
procedure TfmSetPrtJrnlParams.SetYears;
begin
    try
        try
            if pDateBeg <= pDateEnd
            then begin
                //Формируем допустимый диапазон для интервала лет
                edtYear.Properties.MinValue := YearOf ( pDateBeg );
                edtYear.Properties.MaxValue := YearOf ( pDateEnd );

                edtYear.Text := IntToStr( YearOf( pCurrPeriod ) );
            end;
        except
            //Протоколируем ИС
	        LogException( pSysOptions.LogFileName );
            Raise;
        end;
    except
        on E: Exception
        do begin
	      MessageBox( Handle, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

//Получаем допустимый набор месяцев
procedure TfmSetPrtJrnlParams.FillMonthList(var aMonthList: TStringList; const aFillMode: TFillMode );
var
	i, n : Integer;
begin
    try
        try
            case aFillMode of

              fmInc  : begin
                         n := High( cMonthUA );

                         for i := ( MonthOf(pDateBeg) - 1 ) to n
                         do begin
                             aMonthList.Add( cMonthUA[i] )
                         end;
                       end;

              fmDec  : begin
                         n := ( MonthOf(pDateEnd) - 1 );

                         for i := Low( cMonthUA ) to n
                         do begin
                             aMonthList.Add( cMonthUA[i] )
                         end;
                       end;

              fmFull : begin
                         n := High( cMonthUA );

                         for i := Low( cMonthUA ) to n
                         do begin
                             aMonthList.Add( cMonthUA[i] )
                         end;
                       end;
            end;
        except
            //Протоколируем ИС
	        LogException( pSysOptions.LogFileName );
            Raise;
        end;
    except
        on E: Exception
        do begin
	      MessageBox( Handle, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

//Обрабатываем горячие клавиши
procedure TfmSetPrtJrnlParams.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  case Msg.CharCode of

    VK_F10    : begin
				  ModalResult := mrOk;
				  Handled := True;
				end;

	VK_ESCAPE : begin
				  ModalResult := mrCancel;
				  Handled := True;
                end;
  end;
end;

//Получаем допустимый набор периодов печати журнала
procedure TfmSetPrtJrnlParams.edtYearPropertiesChange(Sender: TObject);
var
    FillMode    : TFillMode;
    YearBeg     : Word;
    YearEnd     : Word;
    CurrYear    : Word;
    MonthList   : TStringList;
    IndexSearch : Integer;
begin
  try
    try
        YearBeg  := YearOf ( pDateBeg );
        YearEnd  := YearOf ( pDateEnd );
        CurrYear := StrToInt( edtYear.Text );
        edtMonth.Properties.LookupItems.Clear;

        try
            MonthList := TStringList.Create;

            if ( YearBeg < CurrYear ) AND ( CurrYear < YearEnd )
            then begin
                FillMode := fmFull;
                FillMonthList( MonthList, FillMode );
                edtMonth.Properties.LookupItems.AddStrings( MonthList );
                IndexSearch := edtMonth.Properties.LookupItems.IndexOf( cMonthUA[MonthOf( pCurrPeriod ) - 1] );

                if IndexSearch = -1
                then begin
                    edtMonth.Text := edtMonth.Properties.LookupItems.Strings[0];
                end
                else begin
                    edtMonth.Text := cMonthUA[MonthOf( pCurrPeriod ) - 1]
                end;
            end
            else begin
                    if YearBeg = CurrYear
                    then begin
                        FillMode := fmInc;
                        FillMonthList( MonthList, FillMode );
                        edtMonth.Properties.LookupItems.AddStrings( MonthList );
                        IndexSearch := edtMonth.Properties.LookupItems.IndexOf( cMonthUA[MonthOf( pCurrPeriod ) - 1] );

                        if IndexSearch = -1
                        then begin
                            edtMonth.Text := edtMonth.Properties.LookupItems.Strings[0];
                        end
                        else begin
                            edtMonth.Text := cMonthUA[MonthOf( pCurrPeriod ) - 1]
                        end;
                    end
                    else
                        if CurrYear = YearEnd
                        then begin
                            FillMode := fmDec;
                            FillMonthList( MonthList, FillMode );
                            edtMonth.Properties.LookupItems.AddStrings( MonthList );
                            IndexSearch := edtMonth.Properties.LookupItems.IndexOf( cMonthUA[MonthOf( pCurrPeriod ) - 1] );

                            if IndexSearch = -1
                            then begin
                                edtMonth.Text := edtMonth.Properties.LookupItems.Strings[edtMonth.Properties.LookupItems.Count - 1];
                            end
                            else begin
                                edtMonth.Text := cMonthUA[MonthOf( pCurrPeriod ) - 1]
                            end;
                        end
            end;

        finally
            if MonthList <> nil then FreeAndNil( MonthList );
        end;
      except
          //Протоколируем ИС
	      LogException( pSysOptions.LogFileName );
          Raise;
      end;
    except
        on E: Exception
        do begin
		  MessageBox( Handle, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

//Активируем(деактивируем) элементы выбора параметров печатной формы
procedure TfmSetPrtJrnlParams.cbxSCHClick(Sender: TObject);
var
    i, vCount : Integer;
begin

    //Изменяем значение счетчика выбранных параметров
    if ( Sender is TcxCheckBox )
    then begin
        if TcxCheckBox( Sender ).Checked
        then begin
            Inc( FParamCount );

            if not( TEnm_PrtJrnlParams( TcxCheckBox( Sender ).Tag ) in pPrtJrnlParams )
            then begin
                Include( FPrtJrnlParams, TEnm_PrtJrnlParams( TcxCheckBox( Sender ).Tag ) );
            end;    
        end
        else begin
            Dec( FParamCount );    

            if TEnm_PrtJrnlParams( TcxCheckBox( Sender ).Tag ) in pPrtJrnlParams
            then begin
                Exclude( FPrtJrnlParams, TEnm_PrtJrnlParams( TcxCheckBox( Sender ).Tag ) );
            end;    
        end;

        //Активируем(деактивируем) элементы выбора
        vCount := gbxParamsPrtJrnl.ControlCount - 1 ;

        if pParamCount >= cMaxParamCount
        then begin
            //Деактивируем элементы выбора
            for i := 0 to vCount
            do begin
                if ( gbxParamsPrtJrnl.Controls[i] is TcxCheckBox )
                then
                    if not TcxCheckBox( gbxParamsPrtJrnl.Controls[i] ).Checked
                       AND TcxCheckBox( gbxParamsPrtJrnl.Controls[i] ).Enabled
                    then begin
                        TcxCheckBox( gbxParamsPrtJrnl.Controls[i] ).Enabled := False;
                    end;
            end;
        end
        else begin
            //Активируем элементы выбора
            for i := 0 to vCount
            do begin
                if ( gbxParamsPrtJrnl.Controls[i] is TcxCheckBox )
                then
                    if     not TcxCheckBox( gbxParamsPrtJrnl.Controls[i] ).Checked
                       AND not TcxCheckBox( gbxParamsPrtJrnl.Controls[i] ).Enabled
                    then begin
                        TcxCheckBox( gbxParamsPrtJrnl.Controls[i] ).Enabled := True;
                    end;
            end;
        end;
        
    end;

end;

//Обрабатываем ввод недопустимого значения года
procedure TfmSetPrtJrnlParams.edtYearPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TcxSpinEdit( Sender ).Properties.MinValue > DisplayValue
  then begin
      DisplayValue := TcxSpinEdit( Sender ).Properties.MinValue;
      Error := False;
  end;

  if TcxSpinEdit( Sender ).Properties.MaxValue < DisplayValue
  then begin
      DisplayValue := TcxSpinEdit( Sender ).Properties.MaxValue;
      Error := False;
  end;
end;

//Получаем значения для динамических переменных отчета
procedure TfmSetPrtJrnlParams.frrWorkGetValue(const VarName: String;
  var Value: Variant);
var
	CurrMonth : String;
begin
 //Получаем название месяца для заголовка отчет
 if CompareText( VarName, sFRN_Period ) = 0
 then begin
	 CurrMonth := cMonthUA[ MonthOf( pCurrPeriod ) - 1 ];
	 Value := CurrMonth + ' ' + IntToStr( YearOf( pCurrPeriod ) ) + ' ' + 'г.'
 end;

 //Получаем название месяца для заголовка страницы отчет
 if CompareText( VarName, sFRN_Month ) = 0
 then begin
	 CurrMonth := cMonthUA[ MonthOf( pCurrPeriod ) - 1 ];
	 Value := CurrMonth;
 end;

 //Получаем год для заголовка страницы отчет
 if CompareText( VarName, sFRN_Year ) = 0
 then begin
	 Value := YearOf( pCurrPeriod );
 end;
end;

end.




