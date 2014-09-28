unit uRegSCH;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uRegSCH                                                                    *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Ведение реестра счетов по заработной плате и стипендии.                    *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, DB, FIBDataSet,
  pFIBDataSet, cxInplaceContainer, cxTLData, cxDBTL, cxControls,
  cxSplitter, ExtCtrls, dxBar, cxMaskEdit, dxBarExtItems,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer, cxEdit,
  cxTextEdit, cxDropDownEdit, dxBarExtDBItems, ActnList, cxCheckBox,
  cxDBEdit, FIBQuery, pFIBQuery, pFIBStoredProc, cxCurrencyEdit, frxClass,
  frxDBSet, RxMemDS, FIBDatabase, pFIBDatabase, uneClasses,
  ImgList, uneTypes, uneLibrary;

type
  TfmRegSCH = class(TForm, IneCallExpMethod)

	brmSchet                : TdxBarManager;

	Splitter1               : TcxSplitter;
	pnlDescription          : TPanel;

	trlSchet                : TcxDBTreeList;

	dsrSchet                : TDataSource;
	dstSchet                : TpFIBDataSet;
	dstRegUch               : TpFIBDataSet;

	btnAdd                  : TdxBarLargeButton;
	btnExit                 : TdxBarLargeButton;
	btnEdit                 : TdxBarLargeButton;
	btnWatch                : TdxBarLargeButton;
	btnSelect               : TdxBarLargeButton;
	btnFilter               : TdxBarLargeButton;
	btnDelete               : TdxBarLargeButton;
	btnRefresh              : TdxBarLargeButton;
	btnOpenSch              : TdxBarLargeButton;
	btnCloseSch             : TdxBarLargeButton;

	cmnID_SCH               : TcxDBTreeListColumn;
	cmnKR_SUMMA             : TcxDBTreeListColumn;
	cmnDB_SUMMA             : TcxDBTreeListColumn;
	cmnSCH_TITLE            : TcxDBTreeListColumn;
	cmnSCH_NUMBER           : TcxDBTreeListColumn;
	cmnHAS_CHILDREN         : TcxDBTreeListColumn;
	cmnDB_SALDO_CUR         : TcxDBTreeListColumn;
	cmn_KR_SALDO_CUR        : TcxDBTreeListColumn;
	cmnID_PARENT_SCH        : TcxDBTreeListColumn;
	cmnDB_SALDO_INPUT       : TcxDBTreeListColumn;
	cmnKR_SALDO_INPUT       : TcxDBTreeListColumn;

	edtYear                 : TdxBarCombo;
	edtMonth                : TdxBarCombo;
	edtRegUch               : TdxBarCombo;

	cbxIsSchClosed          : TcxDBCheckBox;
	cbxIsSchLocked          : TcxDBCheckBox;

	spcSchet                : TpFIBStoredProc;
	btnPrint                : TdxBarLargeButton;
	DBDataset               : TfrxDBDataset;

	dstBuffer               : TRxMemoryData;

	fldSCH_TITLE            : TStringField;
	fldSCH_ERROR            : TStringField;
	fldSCH_NUMBER           : TStringField;

	Report                  : TfrxReport;

    imlToolBar              : TImageList;

	dbSchet                 : TpFIBDatabase;
    trRead                  : TpFIBTransaction;
    trWrite                 : TpFIBTransaction;

    srpMain                 : TcxStyleRepository;

    cxsHeader               : TcxStyle;
    cxsFooter               : TcxStyle;
    cxsContent              : TcxStyle;
    cxHotTrack              : TcxStyle;
    cxsInactive             : TcxStyle;
    cxsIndicator            : TcxStyle;
    cxsSelection            : TcxStyle;
    cxBackground            : TcxStyle;
    cxsContentOdd           : TcxStyle;
    cxsGroupByBox           : TcxStyle;
    cxsColumnHeader         : TcxStyle;
	cxsContentEvent         : TcxStyle;
    cxsColumnHeaderClassic  : TcxStyle;
    trTmp: TpFIBTransaction;

	procedure FormClose             (Sender: TObject; var Action: TCloseAction);

	procedure btnExitClick          (Sender: TObject);
	procedure btnPrintClick         (Sender: TObject);
	procedure btnWatchClick         (Sender: TObject);
	procedure btnFilterClick        (Sender: TObject);
	procedure btnSelectClick        (Sender: TObject);
	procedure btnRefreshClick       (Sender: TObject);
	procedure btnOpenSchClick       (Sender: TObject);
	procedure btnCloseSchClick      (Sender: TObject);

	procedure trlSchetKeyDown       (Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure trlSchetDblClick      (Sender: TObject);

	procedure ReportGetValue        (const VarName: String; var Value: Variant);
	procedure edtYearCurChange      (Sender: TObject);
	procedure edtMonthCurChange     (Sender: TObject);

  private
	  FKeyField        : String;           //Поле хранит пазвание поля, содерж. знач. PK
	  FSchParams       : TRec_SchParams;   //Поле хранит параметры для получения оборотов по счетам
	  FSysOptions      : TRec_SysOptions;  //Поле хранит параметры для получения оборотов по счетам
	  FResultExpMethod : TneGetExpMethod;

	  //Методы для работы с вышеописаными полями
	  function  GetKeyField   : String;
	  function  GetSchParams  : TRec_SchParams;
	  function  GetSysOptions : TRec_SysOptions;
	  procedure SetSchParams  ( aValue: TRec_SchParams );
  public
      constructor Create( const aDBFMParams: TRec_DBFMParams; const aSysOptions: TRec_SysOptions ); reintroduce;
	  //Св-ва, соответствующие вышеописанным полям
	  Property pKeyField        : String          read GetKeyField;
	  Property pSchParams       : TRec_SchParams  read GetSchParams  write SetSchParams;
	  Property pSysOptions      : TRec_SysOptions read GetSysOptions;
	  property pResultExpMethod : TneGetExpMethod read FResultExpMethod implements IneCallExpMethod;
  end;

  function GetFmRegSCH( const aDBFMParams: TRec_DBFMParams; const aSysOptions: TRec_SysOptions ): TRec_SysOptions; stdcall;

  exports
    GetFmRegSCH;

implementation

uses DateUtils, uneUtils, {uErrorSch,} Kernel;

resourcestring

	//Ресурсы, сообщения для отчётов + идентификаторы динамических переменных
	sReportsPath        = 'Reports\JO5\';
	sRepNameAllSCH      = 'JO5_ALL_SCH_INFO.fr3';

	sValNameVisa        = 'Visa';
	sValNamePeriod      = 'Period';

	sValVisaText        = 'ДонНУ'#13;
	sValPeriodText      = ' г.';

	sMsgReportNotFound1 = 'Файл отчета ';
	sMsgReportNotFound2 = ' не найден!';

	//Сообщения закрытия(отката) текущего счёта
	sMsgSchIsAbsent     = 'Текущий счёт не найден';
	sMsgSchIsOpened     = 'Невозможно открыть текущий счёт,'#13'поскольку он был открыт ранее';
	sMsgSchIsClosed     = 'Невозможно закрыть текущий счёт,'#13'поскольку он был закрыт ранее';
	sMsgSchIsParentOp   = 'Невозможно открыть текущий счёт,'#13'поскольку он не является субсчётом';
	sMsgSchIsParentCl   = 'Невозможно закрыть текущий счёт,'#13'поскольку он не является субсчётом';
	sMsgDataSetIsEmpty  = 'Невозможно распечатать информацию по'#13'счетам, поскольку реестр счетов пуст';

	sMsgOKOpenSCH       = 'Cчёт успешно переведён в предыдущий период';
	sMsgOKCloseSCH      = 'Cчёт успешно переведён в следующий период';
	sMsgErrOpenSCH      = 'Не удалось откатить счёт в предыдущий период...'#13'Показать расшифровку ошибки для неоткатившегося счёта?';
	sMsgErrCloseSCH     = 'Не удалось перевести счёт в следующий период...'#13'Показать расшифровку ошибки для непереведённого счёта?';

	//Сообщения получения корреспонденции
	sMSG_SelectSubSCH_UA    = 'Для того, щоб переглянути кореспонденцію по рахунку,'#13'оберіть, будь ласка, рахунок нижчого рівня';
	sMSG_SelectSubSCH_RUS   = 'Для того, чтобы просмотреть корреспонденцию по счету,'#13'выберите, пожалуйста, счет нижнего уровня';
	sMSG_KorrIsNotFound_UA  = 'Неможливо отримати кореспонденцію,'#13'тому що відсутній обраний рахунок';
	sMSG_KorrIsNotFound_RUS = 'Невозможно получить корреспонденцию,'#13'поскольку отсутствует выбранный счёт';

{$R *.dfm}

function TfmRegSCH.GetKeyField: String;
begin
  Result := FKeyField;
end;

function TfmRegSCH.GetSchParams: TRec_SchParams;
begin
  Result := FSchParams;
end;

function TfmRegSCH.GetSysOptions: TRec_SysOptions;
begin
  Result := FSysOptions;
end;

procedure TfmRegSCH.SetSchParams(aValue: TRec_SchParams);
begin
  FSchParams := aValue;
end;

procedure TfmRegSCH.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmRegSCH.btnExitClick(Sender: TObject);
begin
  Close;
end;

function GetFmRegSCH( const aDBFMParams: TRec_DBFMParams; const aSysOptions: TRec_SysOptions ): TRec_SysOptions;
begin
  TfmRegSCH.Create( aDBFMParams, aSysOptions );
end;

//Получаем информацию по счетам для текущего периода
constructor TfmRegSCH.Create(const aDBFMParams: TRec_DBFMParams;
  const aSysOptions: TRec_SysOptions);
begin
  try
	inherited Create( aDBFMParams.Owner );
	FKeyField   := 'OUT_ID_SCH';
	FSysOptions := aSysOptions;

	try
	dbSchet.Handle := aDBFMParams.DBHandle;
	trTmp.StartTransaction;
	//trRead.StartTransaction;
	except
		on E: Exception
		do begin
			ShowMessage( E.Message + ' System Error!!!' );
		end;
	end;

	//Запоминаем параметы для получения оборотов по счетам
{	with FSchParams
	do begin
		KodSystem      := pSysOptions.KodSystem;
		DefRegUch      := pSysOptions.DefRegUch;
		RootTypeObj    := pSysOptions.RootTypeObj;
		KodSysPeriod   := pSysOptions.KodCurrPeriod;
		KodCurrPeriod  := pSysOptions.KodCurrPeriod;
		DateSysPeriod  := pSysOptions.DateCurrPeriod;
		DateCurrPeriod := pSysOptions.DateCurrPeriod;
	end;

	with pSchParams
	do begin
		//Получаем информацию по счетам для текущего периода
		if dstSchet.Active then dstSchet.Close;
		trWrite.StartTransaction;
		dstSchet.SQLs.SelectSQL.Text := 'SELECT * FROM JO5_GET_ALL_SCH_OBORT(' + IntToStr( DefRegUch ) + cSEMICOLON + cTICK + DateToStr( DateCurrPeriod ) + cTICK + cSEMICOLON + IntToStr( RootTypeObj ) + cBRAKET_CL;
		dstSchet.Open;

		//Получаем множество регистров учёта
		dstRegUch.Close;
		dstRegUch.SQLs.SelectSQL.Text := 'SELECT * FROM JO5_GET_ALL_REG_UCH(' + IntToStr( KodSystem ) + cBRAKET_CL;
		dstRegUch.Open;

		edtYear.CurText       := IntToStr( YearOf( DateCurrPeriod ) );
		edtMonth.CurItemIndex := MonthOf( DateCurrPeriod ) - 1;
	end;

	dstRegUch.First;

	//Заполняем список регистров учёта
	while not dstRegUch.Eof
	do begin
		edtRegUch.Items.Add( dstRegUch.FBN('OUT_REG_UCH_FULL_NAME').AsString );
		dstRegUch.Next;
	end;

   dstRegUch.Locate( 'OUT_ID_REG_UCH', pSchParams.DefRegUch, [] );
   edtRegUch.CurText := dstRegUch.FBN('OUT_REG_UCH_FULL_NAME').AsString;}

  except
	  on E: Exception
	  do begin
		  MessageBox( Handle, PChar( E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
		  LogException( pSysOptions.LogFileName );
	  end;
  end;

end;

//Получаем корреспонденцию для выбранного счёта
procedure TfmRegSCH.btnWatchClick(Sender: TObject);
var
	vMTDParams : TPtr_MTDParams;
	vBPLParams : TPtr_BPLParams;
begin
  try

	if not dstSchet.IsEmpty
	then begin
		try
			New( vBPLParams );
			vBPLParams^.MethodName  := sMN_GetKorToSCH;
			vBPLParams^.PackageName := pSysOptions.AppExePath + 'JO5\JO5_GetKorToSCH7.bpl';

			New( vMTDParams );
			with vMTDParams^
			do begin
			  KorParams.IdSch       := dstSchet.FBN(pKeyField).AsVariant;
			  KorParams.SchName     := dstSchet.FBN(cmnSCH_TITLE.DataBinding.FieldName).AsString;
			  KorParams.IdRegUch    := dstRegUch.FBN('OUT_ID_REG_UCH').AsVariant;
			  KorParams.CurrPeriod  := pSchParams.DateCurrPeriod;
			  KorParams.HasChildren := dstSchet.FBN('OUT_HAS_CHILDREN_BOOLEAN').AsBoolean;
			  DBFMParams.Owner      := Self;
			  DBFMParams.Style      := fsModal;
			  DBFMParams.DBHandle   := dbSchet.Handle;
			end;

			FResultExpMethod := TneGetExpMethod.Create( Self, vBPLParams, vMTDParams );
		finally
			FreeAndNil( FResultExpMethod );

			if vBPLParams <> nil
			then begin
				Dispose( vBPLParams );
				vBPLParams := nil;
			end;

			if vMTDParams <> nil
			then begin
				Dispose( vMTDParams );
				vMTDParams := nil;
			end;
		end;
	end
	else begin
		  MessageBox( Handle, PChar( sMSG_KorrIsNotFound_UA ), PChar( sMsgCaptionInfUA ), MB_OK or MB_ICONINFORMATION );
	end;

  except
	  on E: Exception
	  do begin
		  ShowMessage('System message');
		  MessageBox( Handle, PChar( sErrorTextExt + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
	  end;
  end;
end;

//Получаем информацию по счетам для изменившихся критериев фильтрации
procedure TfmRegSCH.btnFilterClick(Sender: TObject);
var
	ID : Int64;
begin
  try
	  with pSchParams
	  do begin
		  dstRegUch.Locate('OUT_REG_UCH_FULL_NAME', edtRegUch.CurText, [] );
		  DefRegUch := dstRegUch.FBN('OUT_ID_REG_UCH').AsVariant;

		  ID := dstSchet.FBN(pKeyField).AsVariant;

		  //Получаем информацию по счетам для текущего периода
		  trlSchet.BeginUpdate;

		  if dstSchet.Active then dstSchet.Close;
		  trWrite.StartTransaction;
		  dstSchet.SQLs.SelectSQL.Text := 'SELECT * FROM JO5_GET_ALL_SCH_OBORT(' + IntToStr( DefRegUch ) + cSEMICOLON + cTICK + DateToStr( DateCurrPeriod ) + cTICK + cSEMICOLON + IntToStr( RootTypeObj ) + cBRAKET_CL;
		  dstSchet.Open;

		  trlSchet.DataController.BeginLocate;
          dstSchet.Locate( pKeyField, ID, [] );
          trlSchet.DataController.EndLocate;

          trlSchet.EndUpdate;
	  end;
  except
	  LogException( pSysOptions.LogFileName );
  end;
end;

//Закрываем текущий счёт
procedure TfmRegSCH.btnCloseSchClick(Sender: TObject);
var
    ModRes        : Byte;
    IdSCH         : Int64;
	IsOpen        : Boolean;
	IsClose       : Boolean;
	IsChild       : Boolean;
    NewSaldo      : Currency;
	MonthNum      : String;
//	fmErrorSch    : TfmErrorSch;
	IsSchSingle   : Boolean;
	ResultSchStr  : RESULT_STRUCTURE;
	PKernelSchStr : PKERNEL_SCH_MNGR_STRUCTURE;
begin

  try

	try

        if not dstSchet.IsEmpty
        then begin
			//Подготавливаем буфер для протоколирования возможных ошибок закрытия счёта
			if dstBuffer.Active then dstBuffer.Close;
			dstBuffer.Open;

			IsOpen  := dstSchet.FBN('OUT_IS_OPEN_BOOLEAN').AsBoolean;
			IsChild := not dstSchet.FBN('OUT_HAS_CHILDREN_BOOLEAN').AsBoolean;
			IsClose := True;

			//Проверяем: возможно ли корректное закрытие текущего счёта?
			if ( IsOpen and IsChild )
			then begin

				try
					IdSCH := dstSchet.FBN('OUT_ID_SCH').AsVariant;

					//Заполняем структуру для менеджера счетов
					New( PKernelSchStr );
					trWrite.StartTransaction;

					PKernelSchStr^.MODE         := Ord( mmCloseSch );
					PKernelSchStr^.DBHANDLE     := dstSchet.Database.Handle;
					PKernelSchStr^.TRHANDLE     := trWrite.Handle;

					PKernelSchStr^.ID_SCH       := IdSCH;
					PKernelSchStr^.DB_OBOR      := dstSchet.FBN('OUT_DB_SUMMA'       ).AsCurrency;
					PKernelSchStr^.KR_OBOR      := dstSchet.FBN('OUT_KR_SUMMA'       ).AsCurrency;
					PKernelSchStr^.DB_SALDO_IN  := dstSchet.FBN('OUT_DB_SALDO_INPUT' ).AsCurrency;
					PKernelSchStr^.KR_SALDO_IN  := dstSchet.FBN('OUT_KR_SALDO_INPUT' ).AsCurrency;
					PKernelSchStr^.DB_SALDO_OUT := dstSchet.FBN('OUT_DB_SALDO_CUR'   ).AsCurrency;
					PKernelSchStr^.KR_SALDO_OUT := dstSchet.FBN('OUT_KR_SALDO_CUR'   ).AsCurrency;

					//Вызываем менеджер счетов
					ResultSchStr := SchManager( PKernelSchStr );
					trWrite.Commit;

					//Анализируем результат перевода текущего счёта
					if ResultSchStr.RESULT_CODE = Ord( msrError )
					then begin
						//Запоминаем информацию для непереведённого счёта
						dstBuffer.Insert;
						dstBuffer.FieldByName('SCH_NUMBER').Value := dstSchet.FBN('OUT_SCH_NUMBER').AsString;
						dstBuffer.FieldByName('SCH_TITLE' ).Value := dstSchet.FBN('OUT_SCH_TITLE' ).AsString;
						dstBuffer.FieldByName('SCH_ERROR' ).Value := ResultSchStr.RESULT_MESSAGE;
						dstBuffer.Post;

						IsClose := False;
					end;

				finally
					//Освобождаем динамически выделенную память
					if PKernelSchStr <> nil
					then begin
						Dispose( PKernelSchStr );
						PKernelSchStr := nil;
					end;
				end;

				//Оповещаем пользователя о результатах перевода текущего счёта в следующий период
				if IsClose
				then begin
					//Проверяем: является ли данный счёт единственным незакрытым в текущем периоде?
					spcSchet.StoredProcName := 'JO5_IS_SCH_SINGLE_IN_CUR_PERIOD';
					spcSchet.ParamByName('IN_ID_SCH'  ).AsInt64   := IdSCH;
					spcSchet.ParamByName('IN_IS_CLOSE').AsInteger := Ord( smClose );

					trWrite.StartTransaction;
					spcSchet.Prepare;
					spcSchet.ExecProc;
					trWrite.Commit;

					//Получаем результат проверки
					IsSchSingle := Boolean( spcSchet.FN('OUT_SCH_IS_SINGLE_BOOLEAN').AsInteger );

					//Удалям существующее вступительное сальдо для следующего периода
					spcSchet.StoredProcName := 'JO5_DT_SALDO_DEL_EXT';

					spcSchet.ParamByName('IN_CLOSE_PERIOD_BOOL').AsInteger := Ord( smClose );
					spcSchet.ParamByName('IN_ID_SCH'           ).AsInt64 := IdSCH;

					trWrite.StartTransaction;
					spcSchet.Prepare;
					spcSchet.ExecProc;

					//Добавляем пресчитанное вступительное сальдо для следующего периода
					spcSchet.StoredProcName := 'JO5_DT_SALDO_INS_EXT';

					spcSchet.ParamByName('IN_CLOSE_PERIOD_BOOL').AsInteger := Ord( smClose );
					spcSchet.ParamByName('IN_ID_SCH'           ).AsInt64   := IdSCH;
					spcSchet.Prepare;
					spcSchet.ExecProc;

                    //Анализируем необходимость переведения всей системы в следующий период
                    if IsSchSingle
                    then begin
                        //Переводим систему в следующий период
						spcSchet.StoredProcName := 'JO5_INI_SETUP_UPDATE_KOD_PERIOD';
						spcSchet.ParamByName('IN_CLOSE_PERIOD_BOOL').AsInteger := Ord( smClose );

                        spcSchet.Prepare;
						spcSchet.ExecProc;

						//Получаем данные для текущего периода системы
						with pSysOptions
						do begin
							KodCurrPeriod  := spcSchet.FN('OUT_KOD_CURR_PERIOD' ).AsInteger;
							DateCurrPeriod := spcSchet.FN('OUT_DATE_CURR_PERIOD').AsDate;

							//Обновляем значение текущего периода
							MonthNum := IntToStr( MonthOf( DateCurrPeriod ) );
							SetFirstZero( MonthNum );
							//fmMain.mnuCurrPeriod.Caption := sMMenuCurrPeriodRUS + cBRAKET_OP + MonthNum + cBRAKET_CL + cSPACE + cMonthRUS[ StrToInt( MonthNum ) - 1 ] + cSPACE + IntToStr( YearOf( DateCurrPeriod ) ) + cYEAR_RUS_SHORT;
						end;

					end;

                    trWrite.Commit;

                    MessageBox( Handle, PChar( sMsgOKCloseSCH ), PChar( sMsgCaptionInf ), MB_OK or MB_ICONINFORMATION );
                end
                else begin
                    ModRes := MessageBox( Handle, PChar( sMsgErrCloseSCH ), PChar( sMsgCaptionErr ), MB_YESNO or MB_ICONERROR );

                    //Показываем расшифровку ошибок для текущего счёта
                    if ModRes = ID_YES
                    then begin
{						try
							fmErrorSch := TfmErrorSch.Create( Self, dstBuffer );
							fmErrorSch.ShowModal;
						finally
							FreeAndNil( fmErrorSch );
                        end;}
                    end;

                end;

                dstBuffer.Close;

            end
            else begin

                //Извещаем пользователя о причинах отказа в закрытии текущего счёта
                if not IsChild
                then
                    MessageBox( Handle, PChar( sMsgSchIsParentCl ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING )
                else
                    if not IsOpen
                    then
                        MessageBox( Handle, PChar( sMsgSchIsClosed ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
            end;

        end
        else begin
            MessageBox( Handle, PChar( sMsgSchIsAbsent ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
        end;

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
		LogException( pSysOptions.LogFileName );
		Raise;
	end;

  except
	    on E: Exception
	    do begin
            MessageBox( Handle, PChar( sErrorTextExt + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
        end;
  end;

end;

//Открываем текущий счёт
procedure TfmRegSCH.btnOpenSchClick(Sender: TObject);
var
    ModRes        : Byte;
    IdSCH         : Int64;
	IsOpen        : Boolean;
	IsClose       : Boolean;
	IsChild       : Boolean;
	MonthNum      : String;
//	fmErrSch      : TfmErrorSch;
	IsSchSingle   : Boolean;
	ResultSchStr  : RESULT_STRUCTURE;
	PKernelSchStr : PKERNEL_SCH_MNGR_STRUCTURE;
begin

  try

	try

        if not dstSchet.IsEmpty
        then begin
			//Подготавливаем буфер для протоколирования возможных ошибок открытия счёта
			if dstBuffer.Active	then dstBuffer.Close;
			dstBuffer.Open;

			IsOpen  := True;
            IsClose := not dstSchet.FBN('OUT_IS_OPEN_BOOLEAN').AsBoolean;
            IsChild := not dstSchet.FBN('OUT_HAS_CHILDREN_BOOLEAN').AsBoolean;

            //Проверяем: возможно ли корректное открытие текущего счёта?
            if ( IsClose and IsChild )
            then begin

                try
					IdSCH := dstSchet.FBN('OUT_ID_SCH').AsVariant;

                    //Заполняем структуру для менеджера счетов
                    New( PKernelSchStr );
                    trWrite.StartTransaction;

                    PKernelSchStr^.MODE     := Ord( mmOpenSch );
                    PKernelSchStr^.DBHANDLE := dstSchet.Database.Handle;
                    PKernelSchStr^.TRHANDLE := trWrite.Handle;

                    PKernelSchStr^.ID_SCH   := IdSCH;

                    //Вызываем менеджер счетов
                    ResultSchStr := SchManager( PKernelSchStr );
                    trWrite.Commit;

                    //Анализируем результат перевода текущего счёта
                    if ResultSchStr.RESULT_CODE = Ord( msrError )
                    then begin
                        //Запоминаем информацию для непереведённого счёта
                        dstBuffer.Insert;
                        dstBuffer.FieldByName('SCH_NUMBER').Value := dstSchet.FBN('OUT_SCH_NUMBER').AsString;
                        dstBuffer.FieldByName('SCH_TITLE' ).Value := dstSchet.FBN('OUT_SCH_TITLE' ).AsString;
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

                //Оповещаем пользователя о результатах перевода текущего счёта в предыдущий период
                if IsOpen
                then begin
					//Проверяем: является ли данный счёт единственным закрытым в текущем периоде?
					spcSchet.StoredProcName := 'JO5_IS_SCH_SINGLE_IN_CUR_PERIOD';
					spcSchet.ParamByName('IN_ID_SCH'  ).AsInt64   := IdSCH;
					spcSchet.ParamByName('IN_IS_CLOSE').AsInteger := Ord( smOpen );

					trWrite.StartTransaction;
					spcSchet.Prepare;
					spcSchet.ExecProc;
					trWrite.Commit;

					//Получаем результат проверки
					IsSchSingle := Boolean( spcSchet.FN('OUT_SCH_IS_SINGLE_BOOLEAN').AsInteger );

					//Анализируем необходимость переведения всей системы в предыдущий период
					if IsSchSingle
					then begin
						//Переводим систему в предыдущий период
						spcSchet.StoredProcName := 'JO5_INI_SETUP_UPDATE_KOD_PERIOD';
						spcSchet.ParamByName('IN_CLOSE_PERIOD_BOOL').AsInteger := Ord( smOpen );

						trWrite.StartTransaction;
						spcSchet.Prepare;
						spcSchet.ExecProc;
						trWrite.Commit;

						//Получаем данные для текущего периода системы
						with pSysOptions
						do begin
							KodCurrPeriod  := spcSchet.FN('OUT_KOD_CURR_PERIOD' ).AsInteger;
							DateCurrPeriod := spcSchet.FN('OUT_DATE_CURR_PERIOD').AsDate;

							//Обновляем значение текущего периода
							MonthNum := IntToStr( MonthOf( DateCurrPeriod ) );
							SetFirstZero( MonthNum );
							//fmMain.mnuCurrPeriod.Caption := sMMenuCurrPeriodRUS + cBRAKET_OP + MonthNum + cBRAKET_CL + cSPACE + cMonthRUS[ StrToInt( MonthNum ) - 1 ] + cSPACE + IntToStr( YearOf( DateCurrPeriod ) ) + cYEAR_RUS_SHORT;
						end;

					end;

                    MessageBox( Handle, PChar( sMsgOKOpenSCH ), PChar( sMsgCaptionInf ), MB_OK or MB_ICONINFORMATION );
                end
                else begin
                    ModRes := MessageBox( Handle, PChar( sMsgErrOpenSCH ), PChar( sMsgCaptionErr ), MB_YESNO or MB_ICONERROR );

                    //Показываем расшифровку ошибок для текущего счёта
                    if ModRes = ID_YES
                    then begin
{						try
							fmErrSch := TfmErrorSch.Create( Self, dstBuffer );
							fmErrSch.ShowModal;
						finally
							FreeAndNil( fmErrSch );
                        end;}
                    end;

                end;

                dstBuffer.Close;

            end
            else begin

                //Извещаем пользователя о причинах отказа в открытии текущего счёта
                if not IsChild
                then
                    MessageBox( Handle, PChar( sMsgSchIsParentOp ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING )
                else
                    if not IsClose
                    then
                        MessageBox( Handle, PChar( sMsgSchIsOpened ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
            end;

        end
        else begin
            MessageBox( Handle, PChar( sMsgSchIsAbsent ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
        end;

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
		LogException( pSysOptions.LogFileName );
		Raise;
	end;

  except
	    on E: Exception
	    do begin
            MessageBox( Handle, PChar( sErrorTextExt + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
        end;
  end;

end;

//Обновляем информацию по всем счётам
procedure TfmRegSCH.btnRefreshClick(Sender: TObject);
var
   ID       : Int64;
   IdRec    : Integer;
   CurrDate : TDate;
   RowIndex : Integer;
begin

  with pSchParams
  do begin
	dstRegUch.Locate('OUT_REG_UCH_FULL_NAME', edtRegUch.CurText, [] );
	DefRegUch := dstRegUch.FBN('OUT_ID_REG_UCH').AsVariant;

	if not dstSchet.IsEmpty
	then begin
		ID       := dstSchet.FBN( pKeyField ).AsVariant;
		RowIndex := trlSchet.DataController.FocusedRowIndex;

		trlSchet.BeginUpdate;
		dstSchet.Close;
		dstSchet.SQLs.SelectSQL.Text := 'SELECT * FROM JO5_GET_ALL_SCH_OBORT(' + IntToStr( DefRegUch ) + cSEMICOLON + cTICK + DateToStr( DateCurrPeriod ) + cTICK + cSEMICOLON + IntToStr( RootTypeObj ) + cBRAKET_CL;
		dstSchet.Open;
		trlSchet.EndUpdate;

		trlSchet.DataController.BeginLocate;
		//Позиционируемся на записи, на которой "стояли" до переоткрытия набора данных
		if not( dstSchet.IsEmpty OR dstSchet.Locate( pKeyField, ID, [] ) )
		then begin
			//Позиционируемся на близлежащей записи по отношению к
			//ранее выделенной, если она была удалена с другого клиента
			trlSchet.DataController.FocusedRowIndex := RowIndex;
			IdRec := trlSchet.DataController.GetRecordId( trlSchet.DataController.GetFocusedRecordIndex );
			dstSchet.Locate( pKeyField, IdRec, [] );
		end;
		trlSchet.DataController.EndLocate;

	end
	else begin
		trlSchet.BeginUpdate;
		dstSchet.Close;
		dstSchet.SQLs.SelectSQL.Text := 'SELECT * FROM JO5_GET_ALL_SCH_OBORT(' + IntToStr( DefRegUch ) + cSEMICOLON + cTICK + DateToStr( DateCurrPeriod ) + cTICK + cSEMICOLON + IntToStr( RootTypeObj ) + cBRAKET_CL;
		dstSchet.Open;
		trlSchet.EndUpdate;
	end;

  end;

end;

procedure TfmRegSCH.btnSelectClick(Sender: TObject);
var
	vMTDParams : TPtr_MTDParams;
	vBPLParams : TPtr_BPLParams;
begin
  try
    try
        New( vBPLParams );
        vBPLParams^.MethodName  := sMN_GetJO5SchSaldo;
        vBPLParams^.PackageName := pSysOptions.AppExePath + 'JO5\SaldoBySmRzSt.bpl';

        New( vMTDParams );
        with vMTDParams^
        do begin
          SmRzSt.IdUser       := dstSchet.FBN(pKeyField).AsVariant;
          SmRzSt.ActualDate   := pSchParams.DateCurrPeriod;
          DBFMParams.Owner    := Self;
          DBFMParams.Style    := fsModal;
          DBFMParams.DBHandle := dbSchet.Handle;
        end;

		FResultExpMethod := TneGetExpMethod.Create( Self, vBPLParams, vMTDParams );
	finally
        FreeAndNil( FResultExpMethod );
        Dispose( vBPLParams );
        Dispose( vMTDParams );
        vBPLParams := nil;
        vMTDParams := nil;
    end;
  except
      on E: Exception
      do begin
          MessageBox( Handle, PChar( sErrorTextExt + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
      end;
  end;
end;

procedure TfmRegSCH.trlSchetDblClick(Sender: TObject);
begin
  btnSelect.Click;
end;

//Организуем перемещение по дереву с помощью клавиатуры
procedure TfmRegSCH.trlSchetKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case Key of

	VK_RETURN : begin
				  btnSelect.Click;
				end;

	VK_LEFT   : begin

				  if trlSchet.FocusedNode.CanCollapse
				  then
					  trlSchet.FocusedNode.Collapse( False );
				end;

	VK_RIGHT  : begin

				  if trlSchet.FocusedNode.CanExpand
				  then
					  trlSchet.FocusedNode.Expand( False );
				end;
  end;

end;

//Печать информации по всем счета для текущего периода
procedure TfmRegSCH.btnPrintClick(Sender: TObject);
var
   ID       : Int64;
   IdRec    : Integer;
   RowIndex : Integer;
begin
	try
		if not dstSchet.IsEmpty
		then begin
			//Выводим отчет на экран
			if Report.LoadFromFile( sReportsPath + sRepNameAllSCH )
			then begin
				ID       := dstSchet.FBN( pKeyField ).AsVariant;
				RowIndex := trlSchet.DataController.FocusedRowIndex;
				dstSchet.DisableControls;
				Report.ShowReport;
				trlSchet.DataController.BeginLocate;

				//Позиционируемся на записи, на которой "стояли" до переоткрытия набора данных
				if not dstSchet.Locate( pKeyField, ID, [] )
				then begin
					//Позиционируемся на близлежащей записи по отношению к
					//ранее выделенной, если она была удалена с другого клиента
					trlSchet.DataController.FocusedRowIndex := RowIndex;
					IdRec := trlSchet.DataController.GetRecordId( trlSchet.DataController.GetFocusedRecordIndex );
					dstSchet.Locate( pKeyField, IdRec, [] );
				end;
				trlSchet.DataController.EndLocate;

			end
			else begin
				MessageBox( Handle, PChar( sMsgReportNotFound1 + sReportsPath + sRepNameAllSCH + sMsgReportNotFound2 ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR )
			end;

		end
		else begin
			MessageBox( Handle, PChar( sMsgDataSetIsEmpty ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR )
		end;

	finally
		if dstSchet.ControlsDisabled
		then
			dstSchet.EnableControls;
	end;
end;

//Получаем динамические параметры для печати отчёта
procedure TfmRegSCH.ReportGetValue(const VarName: String;
  var Value: Variant);
begin
   if VarName = sValNamePeriod
   then
	   Value := GetMonthName( pSchParams.DateCurrPeriod ) + cSPACE + IntToStr( YearOf ( pSchParams.DateCurrPeriod ) ) + cSPACE + sValPeriodText
   else
	   if VarName = sValNameVisa
	   then
		   Value := sValVisaText + DateToStr( Date );
end;

//Получаем актуальное значение для текущего периода при изменениии месяца
procedure TfmRegSCH.edtMonthCurChange(Sender: TObject);
begin
	FSchParams.DateCurrPeriod := EncodeDate( StrToInt( edtYear.CurText ), edtMonth.CurItemIndex + 1, cFIRST_DAY_OF_MONTH );
end;

//Получаем актуальное значение для текущего периода при изменениии года
procedure TfmRegSCH.edtYearCurChange(Sender: TObject);
begin
	FSchParams.DateCurrPeriod := EncodeDate( StrToInt( edtYear.CurText ), edtMonth.CurItemIndex + 1, cFIRST_DAY_OF_MONTH );
end;

end.
