unit JO5_dmService;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, Jo5_Consts, IBase,
  pFIBDatabase, RxMemDS, Jo5_Types, FIBQuery, pFIBQuery, pFIBStoredProc, Windows;

const
  sMsgOKOpenSystem     = 'Cистема успешно переведена в предыдущий период';
  sMsgOKCloseSystem    = 'Cистема успешно переведена в следующий период';
	sMsgErrOpenSystem    = 'Не удалось откатить систему в предыдущий период...'#13'Показать расшифровку ошибок для всех неоткатившихся счетов?';
	sMsgErrCloseSystem   = 'Не удалось перевести систему в следующий период...'#13'Показать расшифровку ошибок для всех непереведённых счетов?';
  sMsgNoneOpenSystem   = 'Не удалось откатить систему в предыдущий период,'#13'поскольку в текущем периоде отсутствуют закрытые счета';
  sMsgNoneCloseSystem  = 'Не удалось перевести систему в следующий период,'#13'поскольку в текущем периоде отсутствуют незакрытые счета';
	sErrorText    = '       Ошибка: ';
	sErrorCode    = 'Код ошибки: ';
	sErrorAddr    = 'Адрес ошибки: ';
	sErrorSearch  = ' не найден';
	sErrorTextExt = 'Ошибка: ';

	sMsgCaptionErr = 'Ошибка';
	sMsgCaptionWrn = 'Предупреждение';
	sMsgCaptionInf = 'Информация';
	sMsgCaptionQst = 'Подтверждение';
type
  TJO5_ServiceDM = class(TDataModule)
    dbJO5: TpFIBDatabase;
    dstMain: TpFIBDataSet;
    trWrite: TpFIBTransaction;
    spcMain: TpFIBStoredProc;
    trRead: TpFIBTransaction;
    dstBuffer: TRxMemoryData;
    fldSCH_NUMBER: TStringField;
    fldSCH_TITLE: TStringField;
    fldSCH_ERROR: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    Handle:HWND;
    function NextPeriod(id_system:Integer):Integer;
    function PrevPeriod(id_system:Integer):Integer;
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE); reintroduce;
  end;

implementation

{$R *.dfm}
uses Jo5_ErrorSch, Kernel, ComObj;

constructor TJO5_ServiceDM.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
//******************************************************************************
  dbJO5.Handle:=DB_Handle;
  trRead.Active:=True;
  trWrite.Active:=True;
end;
//Переводим систему в следующий период
function TJO5_ServiceDM.NextPeriod(id_system:Integer):Integer;
var
	i, n          : Integer;
	ModRes        : Byte;
	IsClose       : Boolean;
//	MonthNum      : String;
	fmErrSch      : TfmErrorSch;
	ResultSchStr  : RESULT_STRUCTURE;
	PKernelSchStr : PKERNEL_SCH_MNGR_STRUCTURE;
begin
  IsClose := True;
  Result:=-1;
  try

	try
		//Получаем множество счетов, находящихся в текущем периоде для перевода системы в следующий период
		dstMain.Close;
		dstMain.SQLs.SelectSQL.Text := 'SELECT * FROM JO5_GET_INFO_TO_CLOSE_PERIOD('+IntToStr(id_system)+')';
		dstMain.Open;

//    dstMain.Last;
		n := dstMain.RecordCount - 1;
//    dstMain.First;

		//Подготавливаем буфер для протоколирования возможных ошибок отката перевода системы
		if dstBuffer.Active	then dstBuffer.Close;
		dstBuffer.Open;



		//Пытаемся перевести систему в следующий период по всем счетам
		for i := 0 to n
		do begin

			try
			    //Заполняем структуру для менеджера счетов
			    New( PKernelSchStr );
  			  trWrite.StartTransaction;

				PKernelSchStr^.MODE         := Ord( mmCloseSch );
				PKernelSchStr^.DBHANDLE     := dbJO5.Handle;
				PKernelSchStr^.TRHANDLE     := trWrite.Handle;

				PKernelSchStr^.ID_SCH       := dstMain.FBN('OUT_ID_SUB_SCH'     ).AsVariant;
				PKernelSchStr^.DB_OBOR      := dstMain.FBN('OUT_DB_OBOROT'      ).AsCurrency;
				PKernelSchStr^.KR_OBOR      := dstMain.FBN('OUT_KR_OBOROT'      ).AsCurrency;
				PKernelSchStr^.DB_SALDO_IN  := dstMain.FBN('OUT_DB_SALDO_INPUT' ).AsCurrency;
				PKernelSchStr^.KR_SALDO_IN  := dstMain.FBN('OUT_KR_SALDO_INPUT' ).AsCurrency;
				PKernelSchStr^.DB_SALDO_OUT := dstMain.FBN('OUT_DB_SALDO_OUTPUT').AsCurrency;
				PKernelSchStr^.KR_SALDO_OUT := dstMain.FBN('OUT_KR_SALDO_OUTPUT').AsCurrency;

				  //Вызываем менеджер счетов
				  ResultSchStr := SchManager( PKernelSchStr );
				  trWrite.Commit;

				//Анализируем результат перевода текущего счёта
				if ResultSchStr.RESULT_CODE = Ord( msrError )
				then begin
					//Запоминаем информацию для непереведённого счёта
					dstBuffer.Insert;
					dstBuffer.FieldByName('SCH_NUMBER').Value := dstMain.FBN('OUT_SUB_SCH_NUMBER').AsString;
					dstBuffer.FieldByName('SCH_TITLE' ).Value := dstMain.FBN('OUT_SUB_SCH_TITLE' ).AsString;
					dstBuffer.FieldByName('SCH_ERROR' ).Value := ResultSchStr.RESULT_MESSAGE;
					dstBuffer.Post;

					IsClose := False;
          Break;
				end;

			finally
				//Освобождаем динамически выделенную память
				if PKernelSchStr <> nil
				then begin
					Dispose( PKernelSchStr );
					PKernelSchStr := nil;
				end;
			end;

			dstMain.Next;

		end;

		//Переводим систему в следующий период + изменяем значения сальдо по всем счетам
		if IsClose
		then begin

			dstMain.First;
			trWrite.StartTransaction;

			//Обновляем значения сальдо по всем счетам
			for i := 0 to n
			do begin
				//Удалям существующее вступительное сальдо для следующего периода
				spcMain.StoredProcName := 'JO5_DT_SALDO_DEL_EXT';
        spcMain.Prepare;

				spcMain.ParamByName('IN_CLOSE_PERIOD_BOOL').AsInteger := Ord( smClose );
				spcMain.ParamByName('IN_ID_SCH'           ).AsInt64   := dstMain.FBN('OUT_ID_SUB_SCH').AsVariant;
        spcMain.ParamByName('ID_SYSTEM').asInteger            := id_system;
				spcMain.ExecProc;

				//Добавляем пресчитанное вступительное сальдо для следующего периода
				spcMain.StoredProcName := 'JO5_DT_SALDO_INS_EXT';
				spcMain.Prepare;
				spcMain.ParamByName('IN_CLOSE_PERIOD_BOOL').AsInteger := Ord( smClose );
				spcMain.ParamByName('IN_ID_SCH'           ).AsInt64   := dstMain.FBN('OUT_ID_SUB_SCH').AsVariant;
        spcMain.ParamByName('ID_SYSTEM').Value                := id_system;

				spcMain.ExecProc;

				dstMain.Next;
			end;

			//Переводим систему в следующий период
			if n <> -1
			then begin
				spcMain.StoredProcName := 'JO5_INI_SETUP_UPDATE_KOD_PERIOD';
        spcMain.Prepare;
        spcMain.ParamByName('IN_ID_SYSTEM').Value:=id_system;
				spcMain.ParamByName('IN_CLOSE_PERIOD_BOOL').AsInteger := Ord( smClose );

				spcMain.Prepare;
				spcMain.ExecProc;

				//Получаем данные для текущего периода системы
        Result := spcMain.FN('OUT_KOD_CURR_PERIOD').AsInteger;
			end;

			trWrite.Commit;

			//Оповещаем пользователя о результатах перевода системы в следующий период
			if n <> -1
			then
				MessageBox( Handle, PChar( sMsgOKCloseSystem ), PChar( sMsgCaptionInf ), MB_OK or MB_ICONINFORMATION )
			else
				MessageBox( Handle, PChar( sMsgNoneCloseSystem ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );

		end
		else begin
			ModRes := MessageBox( Handle, PChar( sMsgErrCloseSystem ), PChar( sMsgCaptionErr ), MB_YESNO or MB_ICONERROR );

			//Показываем расшифровку ошибок по счетам
			if ModRes = ID_YES
			then begin
				try
					fmErrSch := TfmErrorSch.Create( Self, dstBuffer );
					fmErrSch.ShowModal;
				finally
					FreeAndNil( fmErrSch );
				end;
			end;

		end;

		dstBuffer.Close;

	except
		//Завершаем транзанкцию
		if trWrite.InTransaction
		then
			trWrite.Rollback;

		//Освобождаем память для НД
		if dstBuffer.Active
		then
			dstBuffer.Close;

		//Протоколируем ИС
//		LogException( dmdDataModul.pSysOptions.LogFileName );
		Raise;
	end;

  except
		on E: Exception
		do begin
			MessageBox( Handle, PChar( sErrorTextExt + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
		end;
  end;

end;

//Откатываем систему в предыдущий период
function TJO5_ServiceDM.PrevPeriod(id_system:Integer):Integer;
var
	i, n          : Integer;
	ModRes        : Byte;
	IsOpen        : Boolean;
//	MonthNum      : String;
	fmErrSch      : TfmErrorSch;
	ResultSchStr  : RESULT_STRUCTURE;
	PKernelSchStr : PKERNEL_SCH_MNGR_STRUCTURE;
begin
  Result:=-1;
  try

	try
		//Получаем множество счетов, находящихся в текущем периоде для отката системы в предыдущий период
		dstMain.Close;
		dstMain.SQLs.SelectSQL.Text := 'SELECT * FROM JO5_GET_ALL_SCH_TO_OPEN_PERIOD('+IntToStr(id_system)+')';
		dstMain.Open;

//    dstMain.Last;
		n := dstMain.RecordCount - 1;
//    dstMain.First;

		//Подготавливаем буфер для протоколирования возможных ошибок отката системы
		if dstBuffer.Active	then dstBuffer.Close;
		dstBuffer.Open;

		IsOpen := True;

		//Пытаемся откатить систему в предыдущий период по всем счетам
		for i := 0 to n
		do begin

			try
				//Заполняем структуру для менеджера счетов
				New( PKernelSchStr );
				trWrite.StartTransaction;

				PKernelSchStr^.MODE     := Ord( mmOpenSch );
				PKernelSchStr^.DBHANDLE := dbJO5.Handle;
				PKernelSchStr^.TRHANDLE := trWrite.Handle;
				PKernelSchStr^.ID_SCH   := dstMain.FBN('OUT_ID_SUB_SCH').AsVariant;

				//Вызываем менеджер счетов
				ResultSchStr := SchManager( PKernelSchStr );
				trWrite.Commit;

				//Анализируем результат отката текущего счёта
				if ResultSchStr.RESULT_CODE = Ord( msrError )
				then begin
					//Запоминаем информацию для неоткатившегося счёта
					dstBuffer.Insert;
					dstBuffer.FieldByName('SCH_NUMBER').Value := dstMain.FBN('OUT_SUB_SCH_NUMBER').AsString;
					dstBuffer.FieldByName('SCH_TITLE' ).Value := dstMain.FBN('OUT_SUB_SCH_TITLE' ).AsString;
					dstBuffer.FieldByName('SCH_ERROR' ).Value := ResultSchStr.RESULT_MESSAGE;
					dstBuffer.Post;

					IsOpen := False;
				end;

			finally
				//Освобождаем динамически выделенную память
				if PKernelSchStr <> nil
				then begin
					Dispose( PKernelSchStr );
					PKernelSchStr := nil;
				end;
			end;

			dstMain.Next;

		end;

		//Оповещаем пользователя о результатах отката системы
		if IsOpen
		then begin

			//Выполняем откат системы в предыдущий период
			if n <> -1
			then begin
				//Подготавливаем к выполнению процедуру для отката системы в предыдущий период
				spcMain.StoredProcName := 'JO5_INI_SETUP_UPDATE_KOD_PERIOD';
        spcMain.ParamByName('IN_ID_SYSTEM').AsInteger := id_system;
				spcMain.ParamByName('IN_CLOSE_PERIOD_BOOL').AsInteger := Ord( smOpen );

				//Откатываем систему в предыдущий период
				trWrite.StartTransaction;
				spcMain.Prepare;
				spcMain.ExecProc;
				trWrite.Commit;

				//Получаем данные для текущего периода системы
        Result := spcMain.FN('OUT_KOD_CURR_PERIOD').AsInteger;
			 {	with dmdDataModul.pSysOptions
				do begin
					KodCurrPeriod  := spcMain.FN('OUT_KOD_CURR_PERIOD' ).AsInteger;
					DateCurrPeriod := spcMain.FN('OUT_DATE_CURR_PERIOD').AsDate;

					//Обновляем значение текущего периода
					MonthNum := IntToStr( MonthOf( DateCurrPeriod ) );
					SetFirstZero( MonthNum );
					mnuCurrPeriod.Caption := sMMenuCurrPeriodRUS + cBRAKET_OP + MonthNum + cBRAKET_CL + cSPACE + cMonthRUS[ StrToInt( MonthNum ) - 1 ] + cSPACE + IntToStr( YearOf( DateCurrPeriod ) ) + cYEAR_RUS_SHORT;
				end; }

				MessageBox( Handle, PChar( sMsgOKOpenSystem ), PChar( sMsgCaptionInf ), MB_OK or MB_ICONINFORMATION );
			end
			else begin
				MessageBox( Handle, PChar( sMsgNoneOpenSystem ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
			end;

		end
		else begin
            ModRes := MessageBox( Handle, PChar( sMsgErrOpenSystem ), PChar( sMsgCaptionErr ), MB_YESNO or MB_ICONERROR );

            //Показываем расшифровку ошибок по счетам
            if ModRes = ID_YES
            then begin
				try
					fmErrSch := TfmErrorSch.Create( Self, dstBuffer );
					fmErrSch.ShowModal;
				finally
					FreeAndNil( fmErrSch );
				end;
			end;

        end;

		dstBuffer.Close;

	except

        //Завершаем транзанкцию
        if trWrite.InTransaction
        then
            trWrite.Rollback;

        //Освобождаем память для НД
        if dstBuffer.Active
        then
            dstBuffer.Close;

        //Протоколируем ИС
//		LogException( dmdDataModul.pSysOptions.LogFileName );
		Raise;
	end;

  except
	     on E: Exception
	     do begin
             MessageBox( Handle, PChar( sErrorTextExt + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
         end;
  end;

end;

end.
