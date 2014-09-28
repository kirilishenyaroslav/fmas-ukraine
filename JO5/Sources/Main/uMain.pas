unit uMain;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uMain                                                                      *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Организация MDI - интерфейса приложения.                                   *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ActnMan, ActnCtrls, ActnMenus,
  XPStyleActnCtrls, ActnList, StdActns, CustomizeDlg, BandActn,
  StdStyleActnCtrls, ExtActns, ExtCtrls, StdCtrls,
  cxGraphics, cxControls, dxStatusBar, Menus, dxBar,
  dxBarExtItems, Fib, DB, FIBDataSet, pFIBDataSet, frxClass,
  frxDBSet, FIBQuery, pFIBQuery, pFIBStoredProc, cxContainer, cxEdit,
  cxTextEdit, RxMemDS, cxLookAndFeelPainters, cxButtons, DateUtils,
  cxDBProgressBar, Halcn6db, FIBDatabase, frxDesgn, uneTypes, uneLibrary;

type

  TfmMain = class(TForm, IneCallExpMethod)

	dstMain               : TpFIBDataSet;
	spcMain               : TpFIBStoredProc;

	aclMain               : TActionList;

	stbMain               : TdxStatusBar;

	brmMain               : TdxBarManager;

	mnuExit               : TdxBarButton;
	mnuWork               : TdxBarSubItem;
	mnuHelp               : TdxBarSubItem;
	mnuSprav              : TdxBarButton;
	mnuWindow             : TdxBarSubItem;
	mnuService            : TdxBarSubItem;
	mnuReports            : TdxBarSubItem;

	smnHelp               : TdxBarButton;
	smnAbout              : TdxBarButton;
	smnCascade            : TdxBarButton;
	smnTileHor            : TdxBarButton;
	smnTileVert           : TdxBarButton;
	smnCloseAll           : TdxBarButton;
	smnWatchJO5           : TdxBarButton;
	smnPrtJournal         : TdxBarButton;
	smnNextPeriod         : TdxBarButton;
	smnInputProvs         : TdxBarButton;
	smnImportProvs        : TdxBarButton;
	smnMinimizeAll        : TdxBarButton;
	smnCreateOstatki      : TdxBarButton;
	smnPreviousPeriod     : TdxBarButton;

	actWinMinAll          : TWindowMinimizeAll;
	actWinCascade         : TWindowCascade;
	actWinTileHor         : TWindowTileHorizontal;
	actWinTileVert        : TWindowTileVertical;
	actWinCloseAll        : TAction;

	dstBuffer             : TRxMemoryData;

    fldSCH_TITLE          : TStringField;
    fldSCH_ERROR          : TStringField;
    fldSCH_NUMBER         : TStringField;

	dstAllDocs            : TRxMemoryData;
	dstAllProvs           : TRxMemoryData;
	mnuCurrPeriod         : TdxBarStatic;

	procedure FormCreate             (Sender: TObject);

	procedure mnuExitClick           (Sender: TObject);
	procedure smnHelpClick           (Sender: TObject);
	procedure mnuSpravClick          (Sender: TObject);
	procedure smnAboutClick          (Sender: TObject);
	procedure mnuReportsClick        (Sender: TObject);
    procedure smnWatchJO5Click       (Sender: TObject);
    procedure smnNextPeriodClick     (Sender: TObject);
	procedure smnInputProvsClick     (Sender: TObject);
	procedure smnPrtJournalClick     (Sender: TObject);
	procedure smnImportProvsClick    (Sender: TObject);
	procedure actWinCloseAllUpdate   (Sender: TObject);
	procedure smnCreateOstatkiClick  (Sender: TObject);
	procedure actWinCloseAllExecute  (Sender: TObject);
	procedure smnPreviousPeriodClick (Sender: TObject);

	procedure frrMainGetValue        (const VarName: String; var Value: Variant);
	procedure frrMainManualBuild     (Page: TfrxPage);

  private
	FResultExpMethod : TneGetExpMethod;
  public
	property pResultExpMethod: TneGetExpMethod read FResultExpMethod implements IneCallExpMethod;
  end;

var
  fmMain  : TfmMain;
  PrtDate : TDate;

implementation

uses {uLogIn,} uDataModul, uneUtils, uErrorSch, Kernel, GlobalSpr;

resourcestring

	sMsgExitAppConfirm   = 'Вы действительно хотите выйти из программы?';

	sMsgOKImport         = 'Импорт успешно завершен!';
	sMsgErrImport        = 'Не удалось выполнить импорт без ошибок...'#13'показать расшифровку ошибок для документов?';
	sMsgErrImportTmp     = 'Импорт завершился с ошибками';

    sMsgOKOpenSystem     = 'Cистема успешно переведена в предыдущий период';
    sMsgOKCloseSystem    = 'Cистема успешно переведена в следующий период';
	sMsgErrOpenSystem    = 'Не удалось откатить систему в предыдущий период...'#13'Показать расшифровку ошибок для всех неоткатившихся счетов?';
	sMsgErrCloseSystem   = 'Не удалось перевести систему в следующий период...'#13'Показать расшифровку ошибок для всех непереведённых счетов?';
    sMsgNoneOpenSystem   = 'Не удалось откатить систему в предыдущий период,'#13'поскольку в текущем периоде отсутствуют закрытые счета';
    sMsgNoneCloseSystem  = 'Не удалось перевести систему в следующий период,'#13'поскольку в текущем периоде отсутствуют незакрытые счета';

const
    cDEF_STEP    = 1;
    cDEF_ID_PK   = -1;
	cDEF_ID_USER = -1;

{$R *.dfm}

procedure TfmMain.FormCreate(Sender: TObject);
var
	MonthNum : String;
begin
  try
	try
		if Assigned( dmdDataModul )
		then
			if dmdDataModul.pSysOptions.IsValid
			then begin
                //Исправляем ошибку при максимизации окна для стиля "Windows XP" 
				SendMessage( Handle, WM_SIZE, SIZE_MAXIMIZED, 0 );

				//Активируем пункты меню
				with brmMain.MainMenuBar
				do begin
				  ItemLinks.Items[0].Item.Enabled := True;
				  ItemLinks.Items[1].Item.Enabled := True;
				  ItemLinks.Items[2].Item.Enabled := True;
				  ItemLinks.Items[3].Item.Enabled := True;
				  ItemLinks.Items[4].Item.Enabled := True;
				end;

			   //Показываем текущий период и строку соединения
			   with dmdDataModul.pSysOptions
			   do begin
				   MonthNum := IntToStr( MonthOf( DateCurrPeriod ) );
				   SetFirstZero( MonthNum );
				   mnuCurrPeriod.Caption := sMMenuCurrPeriodUA + cBRAKET_OP + MonthNum + cBRAKET_CL + cSPACE + cMonthUA[ StrToInt( MonthNum ) - 1 ] + cSPACE + IntToStr( YearOf( DateCurrPeriod ) ) + cYEAR_UA_SHORT;
				   stbMain.Panels[0].Text := sStatusBarConnectionUA + ConnectionStr;
				   stbMain.Panels[1].Text := sStatusBarUserUA + UsrFIO;
			   end;

			end;
	except
		LogException( dmdDataModul.pSysOptions.LogFileName );
		Raise;
	end;
  except
	  on E: EConvertError
	  do
		  MessageBox( Handle, PChar( sErrorTextExt + sEConvertError + cCRLF + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );

	  on E: Exception
	  do
		  MessageBox( Handle, PChar( sErrorTextExt + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
  end;

end;

//Выходим из приложения
procedure TfmMain.mnuExitClick(Sender: TObject);
var
	ModRes : Byte;
begin
  ModRes := MessageBox( Handle, PChar( sMsgExitAppConfirm ), PChar( sMsgCaptionQst ), MB_YESNO or MB_ICONQUESTION  );

  if ModRes = ID_YES
  then
	  Application.Terminate;
end;

//Закрываем все дочерние окна
procedure TfmMain.actWinCloseAllExecute(Sender: TObject);
var
	i : Integer;
begin
	for i := 0 to MDIChildCount - 1 do
	begin
	  MDIChildren[i].Close;
	end;
end;

//Отслеживаем актуальность пункта меню "Закрыть всё"
procedure TfmMain.actWinCloseAllUpdate(Sender: TObject);
begin
	if MDIChildCount > 0
	then
		actWinCloseAll.Enabled := True
	else
		actWinCloseAll.Enabled := False;
end;

//Показываем окно "О программе"
procedure TfmMain.smnAboutClick(Sender: TObject);
var
    vMTDParams : TPtr_MTDParams;
    vBPLParams : TPtr_BPLParams;
begin
  try
    try
        New( vBPLParams );
        vBPLParams^.MethodName  := sMN_GetFmAbout;
        vBPLParams^.PackageName := ExtractFilePath( Application.ExeName ) + 'JO5\JO5_About7.bpl';

        New( vMTDParams );
        with vMTDParams^
        do begin
          FMParams.Owner := Self;
          FMParams.Style := fsModal;
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

procedure TfmMain.smnHelpClick(Sender: TObject);
begin
  MessageBox( Handle, 'Находиться на стадии разработки', 'Информация', MB_OK or MB_ICONINFORMATION );
end;

procedure TfmMain.smnInputProvsClick(Sender: TObject);
begin
	with dmdDataModul.pSysOptions
	do begin
		GlobalSpr.GetProvs( Self, dmdDataModul.dbJO5.Handle, DateCurrPeriod, 0, IdUser, UsrLogin, UsrPassword, 9  );
	end;
end;

//Импортируем данные из ДОСа
procedure TfmMain.smnImportProvsClick(Sender: TObject);
{var
	i, j, n, k       : Integer;
	ModRes           : Integer;
	KeySession       : Int64;
	ImportIsOK       : Boolean;
	fmImpParams      : TfmImpParams;
	KernelResult     : Boolean;
	fmErrDocsProvs   : TfmErrorDocsProvs;
    KernelModeStrRec : KERNEL_MODE_STRUCTURE;}
begin
{  try
      try
          try
              fmImpParams := TfmImpParams.Create( Self );

              with fmImpParams
              do begin

                  ShowModal;

                  //Стартуем процедуру импорта
                  if ModalResult = mrOK
                  then begin
                      //Очищаем временные таблицы для хранения документов и проводок из ДОСа
                      spcMain.StoredProcName := 'JO5_CLEAR_IMPORT_ALL_DOC';
                      dmdDataModul.trWrite.StartTransaction;
                      spcMain.Prepare;
                      spcMain.ExecProc;

                      spcMain.StoredProcName := 'JO5_CLEAR_IMPORT_ALL_PROV';
					  spcMain.Prepare;
					  spcMain.ExecProc;
					  dmdDataModul.trWrite.Commit;

					  n := dstAllDoc.RecordCount - 1;
					  dstAllDoc.First;
					  spcMain.StoredProcName := 'JO5_FILL_IMPORT_ALL_DOC';
					  dmdDataModul.trWrite.StartTransaction;

					  //Заполняем временные таблицы для хранения документов из ДОСа новой информацией
					  for i:= 0 to n
					  do begin
//						  ShowMessage( IntToStr( Int64( fmImpParams.dstAllDoc.FieldByName(cDOC_FN_ID_DOC     ).AsBCD ) ) );
						  spcMain.ParamByName('IN_ID_DOC'     ).AsInt64    := dstAllDoc.FieldByName(cDOC_FN_ID_DOC     ).AsVariant;
						  spcMain.ParamByName('IN_DATE_REG'   ).AsDate     := dstAllDoc.FieldByName(cDOC_FN_DATE_REG   ).AsDateTime;
						  spcMain.ParamByName('IN_DATE_DOC'   ).AsDate     := dstAllDoc.FieldByName(cDOC_FN_DATE_DOC   ).AsDateTime;
						  spcMain.ParamByName('IN_NUM_DOC'    ).AsString   := dstAllDoc.FieldByName(cDOC_FN_NUM_DOC    ).AsString;
						  spcMain.ParamByName('IN_ID_TYPE_DOC').AsInt64    := dstAllDoc.FieldByName(cDOC_FN_ID_TYPE_DOC).AsVariant;
						  spcMain.ParamByName('IN_DATE_PROV'  ).AsDate     := dstAllDoc.FieldByName(cDOC_FN_DATE_PROV  ).AsDateTime;
						  spcMain.ParamByName('IN_SUMMA'      ).AsCurrency := dstAllDoc.FieldByName(cDOC_FN_SUMMA      ).AsCurrency;
						  spcMain.ParamByName('IN_NOTE'       ).AsString   := dstAllDoc.FieldByName(cDOC_FN_NOTE       ).AsString;
						  spcMain.ParamByName('IN_FIO'        ).AsString   := dstAllDoc.FieldByName(cDOC_FN_FIO        ).AsString;

						  spcMain.Prepare;
						  spcMain.ExecProc;

						  dstAllDoc.Next;
					  end;
//					  Exit;
					  n := dstAllProv.RecordCount - 1;
                      dstAllProv.First;
                      spcMain.StoredProcName := 'JO5_FILL_IMPORT_ALL_PROV';

                      //Заполняем временные таблицы для хранения проводок из ДОСа новой информацией
                      for i:= 0 to n
                      do begin
                          spcMain.ParamByName('IN_ID_PROV'    ).AsInt64    := dstAllProv.FieldByName(cPROV_FN_ID_PROV    ).AsVariant;
                          spcMain.ParamByName('IN_DATE_REG'   ).AsDate     := dstAllProv.FieldByName(cPROV_FN_DATE_REG   ).AsDateTime;
                          spcMain.ParamByName('DB_ID_DOC'     ).AsInt64    := dstAllProv.FieldByName(cPROV_FN_DB_ID_DOC  ).AsVariant;
                          spcMain.ParamByName('KR_ID_DOC'     ).AsInt64    := dstAllProv.FieldByName(cPROV_FN_KR_ID_DOC  ).AsVariant;
                          spcMain.ParamByName('IN_SUMMA'      ).AsCurrency := dstAllProv.FieldByName(cPROV_FN_SUMMA      ).AsCurrency;
                          spcMain.ParamByName('IN_STORNO'     ).AsInteger  := Ord( dstAllProv.FieldByName(cPROV_FN_STORNO     ).AsBoolean );
                          spcMain.ParamByName('IN_CR_BY_DT'   ).AsInteger  := Ord( dstAllProv.FieldByName(cPROV_FN_CR_BY_DT   ).AsBoolean );
                          spcMain.ParamByName('IN_TABLE_NUM'  ).AsInt64    := dstAllProv.FieldByName(cPROV_FN_TABLE_NUM  ).AsVariant;
                          spcMain.ParamByName('IN_DB_BAL_ID'  ).AsInteger  := dstAllProv.FieldByName(cPROV_FN_DB_BAL_ID  ).AsInteger;
                          spcMain.ParamByName('IN_KR_BAL_ID'  ).AsInteger  := dstAllProv.FieldByName(cPROV_FN_KR_BAL_ID  ).AsInteger;
                          spcMain.ParamByName('IN_DB_SUB_ID'  ).AsInteger  := dstAllProv.FieldByName(cPROV_FN_DB_SUB_ID  ).AsInteger;
                          spcMain.ParamByName('IN_KR_SUB_ID'  ).AsInteger  := dstAllProv.FieldByName(cPROV_FN_KR_SUB_ID  ).AsInteger;
                          spcMain.ParamByName('IN_DB_DT_PROV' ).AsDate     := dstAllProv.FieldByName(cPROV_FN_DB_DT_PROV ).AsDateTime;
                          spcMain.ParamByName('IN_KR_DT_PROV' ).AsDate     := dstAllProv.FieldByName(cPROV_FN_KR_DT_PROV ).AsDateTime;
                          spcMain.ParamByName('IN_DB_KOD_SMET').AsInteger  := dstAllProv.FieldByName(cPROV_FN_DB_KOD_SMET).AsInteger;
                          spcMain.ParamByName('IN_KR_KOD_SMET').AsInteger  := dstAllProv.FieldByName(cPROV_FN_KR_KOD_SMET).AsInteger;
                          spcMain.ParamByName('IN_DB_KOD_RAZD').AsInteger  := dstAllProv.FieldByName(cPROV_FN_DB_KOD_RAZD).AsInteger;
                          spcMain.ParamByName('IN_KR_KOD_RAZD').AsInteger  := dstAllProv.FieldByName(cPROV_FN_KR_KOD_RAZD).AsInteger;
                          spcMain.ParamByName('IN_DB_KOD_STAT').AsInteger  := dstAllProv.FieldByName(cPROV_FN_DB_KOD_STAT).AsInteger;
                          spcMain.ParamByName('IN_KR_KOD_STAT').AsInteger  := dstAllProv.FieldByName(cPROV_FN_KR_KOD_STAT).AsInteger;

                          spcMain.Prepare;
                          spcMain.ExecProc;

                          dstAllProv.Next;
                      end;

                      dmdDataModul.trWrite.Commit;

                      n := dstAllDoc.RecordCount - 1;
                      ImportIsOK := True;

					  //Подготавливаем буфера для протоколирования возможных ошибок
					  if dstAllDoc.Active OR dstAllProv.Active
					  then begin
						  dstAllDoc.Close;
                          dstAllProv.Close;
                      end;

                      dstAllDoc.Open;
                      dstAllProv.Open;
                      dstAllDoc.First;
                      dmdDataModul.trWrite.StartTransaction;

                      //Заполняем буфера импортированными документами и проводками
                      for i:= 0 to n
                      do begin
                          //Получаем идентификатор сессии работы с ядром
                          spcMain.StoredProcName := 'JO5_GET_KEY_SESSION';

                          spcMain.ParamByName('IN_STEP').AsInteger := cDEF_STEP;
                          spcMain.Prepare;
                          spcMain.ExecProc;

                          KeySession := spcMain.FN('OUT_KEY_SESSION').AsInt64;

						  //Заполняем буфера
						  spcMain.StoredProcName := 'JO5_IMPORT_ALL_DOC_ALL_PROV_INS';

						  spcMain.ParamByName('IN_KEY_SESSION' ).AsInt64 := KeySession;
						  spcMain.ParamByName('IN_ID_DOC'      ).AsInt64 := dstAllDoc.FieldByName(cDOC_FN_ID_DOC     ).AsVariant;
						  spcMain.ParamByName('IN_DATE_REG_DOC').AsDate  := dstAllDoc.FieldByName(cDOC_FN_DATE_REG   ).AsDateTime;
						  spcMain.Prepare;
						  spcMain.ExecProc;

						  //Заполняем структуру для проведения документа через ядро
						  KernelModeStrRec.KERNEL_ACTION := Ord( kmAdd );
						  KernelModeStrRec.KEY_SESSION   := KeySession;
						  KernelModeStrRec.WORKDATE      := dstAllDoc.FieldByName(cDOC_FN_DATE_DOC).AsDateTime;
						  KernelModeStrRec.DBHANDLE      := dmdDataModul.dbJO5.Handle;
						  KernelModeStrRec.TRHANDLE      := dmdDataModul.trWrite.Handle;
						  KernelModeStrRec.PK_ID         := cDEF_ID_PK;
						  KernelModeStrRec.ID_USER       := cDEF_ID_USER;

						  //Пытаемся провести документ через ядро
						  try
							  KernelResult := KernelDo( @KernelModeStrRec );
						  except
							  on E: Exception
							  do begin
								  LogException( dmdDataModul.pSysOptions.LogFileName );
								  MessageBox( Handle, PChar( sMsgKernelError + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
							  end;
						  end;

						  //Анализируем результат проведения документа
						  if not KernelResult
						  then begin
//							  ShowMessage( IntToStr( KeySession ) );
							  ImportIsOK := False;

							  //Получаем расшифровку ошибок по документам
							  dstMain.Close;
							  dstMain.SQLs.SelectSQL.Text := 'SELECT * FROM JO5_GET_DOCS_ERRORS (' + IntToStr( KeySession ) + cBRAKET_CL;
							  dstMain.Open;

							  //Запоминаем информацию для непроимпортированного документа
							  dstAllDocs.LoadFromDataSet( dstMain, 0, lmAppend );

							  //Получаем расшифровку ошибок для проводок
							  dstMain.Close;
							  dstMain.SQLs.SelectSQL.Text := 'SELECT * FROM JO5_GET_PROVS_ERRORS (' + IntToStr( KeySession ) + cBRAKET_CL;
							  dstMain.Open;

							  //Запоминаем информацию для непроимпортированных проводок
							  dstAllProvs.LoadFromDataSet( dstMain, 0, lmAppend );

							  //Очищаем буфера и таблицы ошибок
							  spcMain.StoredProcName := 'KERNEL_CLEAR_TMP';

							  spcMain.ParamByName('KEY_SESSION').AsInt64 := KeySession;
							  spcMain.Prepare;
							  spcMain.ExecProc;
						  end;

						  dstAllDoc.Next;
					  end;

					  dmdDataModul.trWrite.Commit;


					  //Оповещаем пользователя о результатах завершения импорта
					  if not ImportIsOK
					  then begin
						  MessageBox( Handle, PChar( sMsgErrImportTmp ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
{						  ModRes := MessageBox( Handle, PChar( sMsgErrImport ), PChar( sMsgCaptionErr ), MB_YESNO or MB_ICONERROR );

						  //Показываем расшифровку ошибок по документам
						  if ModRes = ID_YES
						  then begin
							  try
								  fmErrDocsProvs := TfmErrorDocsProvs.Create( Self, dstAllDocs, dstAllProvs );
								  fmErrDocsProvs.ShowModal;
							  finally
								  FreeAndNil( fmErrDocsProvs );
							  end;
						  end;

                      end
                      else begin
                          MessageBox( Handle, PChar( sMsgOKImport ), PChar( sMsgCaptionInf ), MB_YESNO or MB_ICONERROR );
                      end;

                      dstAllDoc.Close;
                      dstAllProv.Close;

                  end;

              end;  //End of operator with

              FreeAndNil( fmImpParams );

          finally
              if Assigned( fmImpParams )
              then
                  FreeAndNil( fmImpParams );
          end;

      except
          //Завершаем транзанкцию
          if dmdDataModul.trWrite.InTransaction
          then
              dmdDataModul.trWrite.Rollback;

          //Освобождаем память для НД
          if dstAllDocs.Active OR dstAllProvs.Active
          then begin
              dstAllDocs.Close;
              dstAllProvs.Close;
          end;

          //Протоколируем ИС
		  LogException( dmdDataModul.pSysOptions.LogFileName );
		  Raise;
      end;
  except
	  on E: Exception
	  do
		  MessageBox( Handle, PChar( sErrorTextExt + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
  end;}
end;

procedure TfmMain.smnCreateOstatkiClick(Sender: TObject);
begin
  MessageBox( Handle, 'Находиться на стадии разработки', 'Информация', MB_OK or MB_ICONINFORMATION );
end;

procedure TfmMain.mnuSpravClick(Sender: TObject);
begin
  MessageBox( Handle, 'Находиться на стадии разработки', 'Информация', MB_OK or MB_ICONINFORMATION );
end;

procedure TfmMain.mnuReportsClick(Sender: TObject);
begin
  MessageBox( Handle, 'Находиться на стадии разработки', 'Информация', MB_OK or MB_ICONINFORMATION );
end;

//Печатаем журнал
procedure TfmMain.smnPrtJournalClick(Sender: TObject);
var
    vMTDParams : TPtr_MTDParams;
    vBPLParams : TPtr_BPLParams;
begin
  try
    try
        brmMain.MainMenuBar.Control.Update;

        New( vBPLParams );
        vBPLParams^.MethodName  := sMN_PrintJournal;
        vBPLParams^.PackageName := dmdDataModul.pSysOptions.AppExePath + 'JO5\JO5_SetPrtJrnlParams7.bpl';

        New( vMTDParams );
        with vMTDParams^
        do begin
          SysOptions          := dmdDataModul.pSysOptions;
          DBFMParams.Owner    := Self;
          DBFMParams.Style    := fsModal;
          DBFMParams.DBHandle := dmdDataModul.dbJO5.Handle;
        end;

        FResultExpMethod := TneGetExpMethod.Create( Self, vBPLParams, vMTDParams );
    finally
        if FResultExpMethod <> nil then FreeAndNil( FResultExpMethod );
        FreeAndNilPTR( Pointer( vBPLParams ) );
        FreeAndNilPTR( Pointer( vMTDParams ) );
    end;
  except
      on E: Exception
      do begin
          MessageBox( Handle, PChar( sErrorTextExt + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
      end;
  end;
end;

//Получаем значения динамически изменяющихся параметров печати
procedure TfmMain.frrMainGetValue(const VarName: String;
  var Value: Variant);
begin
 if VarName = 'Period'
 then
	 Value := GetMonthName( PrtDate ) + cSPACE + IntToStr( YearOf( PrtDate ) ) + cSPACE + 'г.'
end;

//Переводим систему в следующий период
procedure TfmMain.smnNextPeriodClick(Sender: TObject);
var
	i, n          : Integer;
	ModRes        : Byte;
	IsClose       : Boolean;
	MonthNum      : String;
	fmErrSch      : TfmErrorSch;
	ResultSchStr  : RESULT_STRUCTURE;
	PKernelSchStr : PKERNEL_SCH_MNGR_STRUCTURE;
begin

  try

	try
		//Получаем множество счетов, находящихся в текущем периоде для перевода системы в следующий период
		dstMain.Close;
		dstMain.SQLs.SelectSQL.Text := 'SELECT * FROM JO5_GET_INFO_TO_CLOSE_PERIOD';
		dstMain.Open;

		n := dstMain.RecordCount - 1;

		//Подготавливаем буфер для протоколирования возможных ошибок отката перевода системы
		if dstBuffer.Active	then dstBuffer.Close;
		dstBuffer.Open;

		IsClose := True;

		//Пытаемся перевести систему в следующий период по всем счетам
		for i := 0 to n
		do begin

			try
			    //Заполняем структуру для менеджера счетов
			    New( PKernelSchStr );
  			    dmdDataModul.trWrite.StartTransaction;

				PKernelSchStr^.MODE         := Ord( mmCloseSch );
				PKernelSchStr^.DBHANDLE     := dmdDataModul.dbJO5.Handle;
				PKernelSchStr^.TRHANDLE     := dmdDataModul.trWrite.Handle;

				PKernelSchStr^.ID_SCH       := dstMain.FBN('OUT_ID_SUB_SCH'     ).AsVariant;
				PKernelSchStr^.DB_OBOR      := dstMain.FBN('OUT_DB_OBOROT'      ).AsCurrency;
				PKernelSchStr^.KR_OBOR      := dstMain.FBN('OUT_KR_OBOROT'      ).AsCurrency;
				PKernelSchStr^.DB_SALDO_IN  := dstMain.FBN('OUT_DB_SALDO_INPUT' ).AsCurrency;
				PKernelSchStr^.KR_SALDO_IN  := dstMain.FBN('OUT_KR_SALDO_INPUT' ).AsCurrency;
				PKernelSchStr^.DB_SALDO_OUT := dstMain.FBN('OUT_DB_SALDO_OUTPUT').AsCurrency;
				PKernelSchStr^.KR_SALDO_OUT := dstMain.FBN('OUT_KR_SALDO_OUTPUT').AsCurrency;

				//Вызываем менеджер счетов
				ResultSchStr := SchManager( PKernelSchStr );
				dmdDataModul.trWrite.Commit;

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
			dmdDataModul.trWrite.StartTransaction;

			//Обновляем значения сальдо по всем счетам
			for i := 0 to n
			do begin
				//Удалям существующее вступительное сальдо для следующего периода
				spcMain.StoredProcName := 'JO5_DT_SALDO_DEL_EXT';

				spcMain.ParamByName('IN_CLOSE_PERIOD_BOOL').AsInteger := Ord( smClose );
				spcMain.ParamByName('IN_ID_SCH'           ).AsInt64   := dstMain.FBN('OUT_ID_SUB_SCH').AsVariant;
				spcMain.Prepare;
				spcMain.ExecProc;

				//Добавляем пресчитанное вступительное сальдо для следующего периода
				spcMain.StoredProcName := 'JO5_DT_SALDO_INS_EXT';

				spcMain.ParamByName('IN_CLOSE_PERIOD_BOOL').AsInteger := Ord( smClose );
				spcMain.ParamByName('IN_ID_SCH'           ).AsInt64   := dstMain.FBN('OUT_ID_SUB_SCH').AsVariant;
				spcMain.Prepare;
				spcMain.ExecProc;

				dstMain.Next;
			end;

			//Переводим систему в следующий период
			if n <> -1
			then begin
				spcMain.StoredProcName := 'JO5_INI_SETUP_UPDATE_KOD_PERIOD';
				spcMain.ParamByName('IN_CLOSE_PERIOD_BOOL').AsInteger := Ord( smClose );

				spcMain.Prepare;
				spcMain.ExecProc;

				//Получаем данные для текущего периода системы
				with dmdDataModul.pSysOptions
				do begin
					KodCurrPeriod  := spcMain.FN('OUT_KOD_CURR_PERIOD' ).AsInteger;
					DateCurrPeriod := spcMain.FN('OUT_DATE_CURR_PERIOD').AsDate;

					//Обновляем значение текущего периода
					MonthNum := IntToStr( MonthOf( DateCurrPeriod ) );
					SetFirstZero( MonthNum );
					mnuCurrPeriod.Caption := sMMenuCurrPeriodRUS + cBRAKET_OP + MonthNum + cBRAKET_CL + cSPACE + cMonthRUS[ StrToInt( MonthNum ) - 1 ] + cSPACE + IntToStr( YearOf( DateCurrPeriod ) ) + cYEAR_RUS_SHORT;
				end;

			end;

			dmdDataModul.trWrite.Commit;

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
		if dmdDataModul.trWrite.InTransaction
		then
			dmdDataModul.trWrite.Rollback;

		//Освобождаем память для НД
		if dstBuffer.Active
		then
			dstBuffer.Close;

		//Протоколируем ИС
		LogException( dmdDataModul.pSysOptions.LogFileName );
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
procedure TfmMain.smnPreviousPeriodClick(Sender: TObject);
var
	i, n          : Integer;
	ModRes        : Byte;
	IsOpen        : Boolean;
	MonthNum      : String;
	fmErrSch      : TfmErrorSch;
	ResultSchStr  : RESULT_STRUCTURE;
	PKernelSchStr : PKERNEL_SCH_MNGR_STRUCTURE;
begin

  try

	try
		//Получаем множество счетов, находящихся в текущем периоде для отката системы в предыдущий период
		dstMain.Close;
		dstMain.SQLs.SelectSQL.Text := 'SELECT * FROM JO5_GET_ALL_SCH_TO_OPEN_PERIOD';
		dstMain.Open;

		n := dstMain.RecordCount - 1;

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
				dmdDataModul.trWrite.StartTransaction;

				PKernelSchStr^.MODE     := Ord( mmOpenSch );
				PKernelSchStr^.DBHANDLE := dmdDataModul.dbJO5.Handle;
				PKernelSchStr^.TRHANDLE := dmdDataModul.trWrite.Handle;
				PKernelSchStr^.ID_SCH   := dstMain.FBN('OUT_ID_SUB_SCH').AsVariant;

				//Вызываем менеджер счетов
				ResultSchStr := SchManager( PKernelSchStr );
				dmdDataModul.trWrite.Commit;

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
				spcMain.ParamByName('IN_CLOSE_PERIOD_BOOL').AsInteger := Ord( smOpen );

				//Откатываем систему в предыдущий период
				dmdDataModul.trWrite.StartTransaction;
				spcMain.Prepare;
				spcMain.ExecProc;
				dmdDataModul.trWrite.Commit;

				//Получаем данные для текущего периода системы
				with dmdDataModul.pSysOptions
				do begin
					KodCurrPeriod  := spcMain.FN('OUT_KOD_CURR_PERIOD' ).AsInteger;
					DateCurrPeriod := spcMain.FN('OUT_DATE_CURR_PERIOD').AsDate;

					//Обновляем значение текущего периода
					MonthNum := IntToStr( MonthOf( DateCurrPeriod ) );
					SetFirstZero( MonthNum );
					mnuCurrPeriod.Caption := sMMenuCurrPeriodRUS + cBRAKET_OP + MonthNum + cBRAKET_CL + cSPACE + cMonthRUS[ StrToInt( MonthNum ) - 1 ] + cSPACE + IntToStr( YearOf( DateCurrPeriod ) ) + cYEAR_RUS_SHORT;
				end;

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
        if dmdDataModul.trWrite.InTransaction
        then
            dmdDataModul.trWrite.Rollback;

        //Освобождаем память для НД
        if dstBuffer.Active
        then
            dstBuffer.Close;

        //Протоколируем ИС
		LogException( dmdDataModul.pSysOptions.LogFileName );
		Raise;
	end;

  except
	     on E: Exception
	     do begin
             MessageBox( Handle, PChar( sErrorTextExt + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
         end;
  end;

end;

procedure TfmMain.frrMainManualBuild(Page: TfrxPage);
begin
//  Page.Report.
end;

procedure TfmMain.smnWatchJO5Click(Sender: TObject);
var
    vMTDParams : TPtr_MTDParams;
    vBPLParams : TPtr_BPLParams;
begin
  try
    try
        brmMain.MainMenuBar.Control.Update;

        New( vBPLParams );
        vBPLParams^.MethodName  := sMN_GetFmRegSCH;
        vBPLParams^.PackageName := ExtractFilePath( Application.ExeName ) + 'JO5\JO5_RegSCH7.bpl';

        New( vMTDParams );
        with vMTDParams^
        do begin
          SysOptions          := dmdDataModul.pSysOptions;
          DBFMParams.Owner    := Self;
          DBFMParams.Style    := fsMDIChild;
          DBFMParams.DBHandle := dmdDataModul.dbJO5.Handle;
        end;

        FResultExpMethod := TneGetExpMethod.Create( Self, vBPLParams, vMTDParams );
    finally
        if FResultExpMethod <> nil then FreeAndNil( FResultExpMethod );
        FreeAndNilPTR( Pointer( vBPLParams ) );
        FreeAndNilPTR( Pointer( vMTDParams ) );
    end;
  except
      on E: Exception
      do begin
          MessageBox( Handle, PChar( sErrorTextExt + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
      end;
  end;
end;

end.
