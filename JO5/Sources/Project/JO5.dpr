program JO5;

uses
  Forms,
  SysUtils,
  Windows,
  Controls,
  Fib,
  pFIBStoredProc,
  uneTypes,
  uneClasses,
  uneUtils,
  uMain in '..\Main\uMain.pas' {fmMain},
  uDataModul in '..\DataModul\uDataModul.pas' {dmdDataModul: TDataModule},
  uErrorSch in '..\fmErrorSch\uErrorSch.pas' {fmErrorSch},
  UnitZAccessForm in '..\fmLogIn\UnitZAccessForm.pas' {FZAccess},
  uLogIn in '..\fmLogIn\uLogIn.pas' {fmLogIn};

{$R *.res}
{$R Resources\XpManifest.res}

var
	FileName      : TFileName;
	SysOptions    : TRec_SysOptions;
	fmCheckUser   : TFZAccess;
	spSysOptions  : TpFIBStoredProc;
	ConnectParams : TneConnection;
begin

try
  try
	try
	  Application.Initialize;
	  Application.Title  := 'Система розрахунків заробітньої плати та стипендії [Ж/О 5]';
	  SysOptions.IsValid := False;

	  try
		  try
			  fmCheckUser := TFZAccess.Create( nil );
			  fmCheckUser.ShowModal;

			  with fmCheckUser.Result
			  do begin
				  if ( ID_User > 0 ) AND ( User_Id_Card > 0 )
				  then begin
					  SysOptions.IdUser      := ID_User;
					  SysOptions.UsrFIO      := User_Fio;
					  SysOptions.UsrLogin    := login;
					  SysOptions.UsrPassword := pswrd;
				  end
				  else begin
					  Application.Terminate;
				  end;
			  end;
		  finally
			  if fmCheckUser <> nil then FreeAndNil( fmCheckUser );
		  end;

		  //Получаем параметры соединения с БД
		  ConnectParams := TneConnection.Create( ExtractFilePath( Application.ExeName ) + sINI_FILE_NAME );

		  if ConnectParams.ParamsIsValid
		  then begin
			  FileName := ConnectParams.LogPath;

			  //Создаём дата модуль
			  Application.CreateForm(TdmdDataModul, dmdDataModul);
              SysOptions.AppHandle   := Application.Handle;
			  SysOptions.AppExePath  := ExtractFilePath( Application.ExeName );
			  SysOptions.LogFileName := FileName;

			  //Настраиваем парамтры подключения
			  dmdDataModul.dbJO5.DBName                 := ConnectParams.DBPath;
			  dmdDataModul.dbJO5.ConnectParams.UserName := ConnectParams.UserName;
			  dmdDataModul.dbJO5.ConnectParams.Password := ConnectParams.Password;
			  dmdDataModul.dbJO5.ConnectParams.CharSet  := ConnectParams.CharSet;
			  dmdDataModul.dbJO5.SQLDialect             := ConnectParams.SQLDialect;
			  dmdDataModul.dbJO5.Open;

			  dmdDataModul.trRead.StartTransaction;

			  //Получаем умалчиваемые системные настройки
			  try
				  spSysOptions             := TpFIBStoredProc.Create( nil );
				  spSysOptions.Database    := dmdDataModul.dbJO5;
				  spSysOptions.Transaction := dmdDataModul.trRead;

				  spSysOptions.StoredProcName := 'JO5_GET_SETUP_OPTIONS';
				  spSysOptions.Prepare;
				  spSysOptions.ExecProc;

				  SysOptions.KodSystem       := spSysOptions.FN('OUT_KOD_SYSTEM'            ).AsInteger;
				  SysOptions.DefRegUch       := spSysOptions.FN('OUT_DEF_ID_REG_UCH'        ).AsInt64;
				  SysOptions.DateSetUp       := spSysOptions.FN('OUT_DATE_SETUP'            ).AsDate;
                  SysOptions.LangugeId       := TEnm_LanguageId( spSysOptions.FN('OUT_LANGUAGE_ID').AsInteger );
				  SysOptions.DefCaseKey      := spSysOptions.FN('OUT_DEF_CASE_KEY_PRT_JRNL' ).AsInteger;
				  SysOptions.NameSystem      := spSysOptions.FN('OUT_NAME_SYSTEM'           ).AsString;
				  SysOptions.RootTypeObj     := spSysOptions.FN('OUT_ID_SCH_TYPE_OBJ'       ).AsInteger;
				  SysOptions.ConnectionStr   := ConnectParams.DBPath;
				  SysOptions.KodCurrPeriod   := spSysOptions.FN('OUT_KOD_CURR_PERIOD'       ).AsInteger;
				  SysOptions.DateCurrPeriod  := spSysOptions.FN('OUT_DATE_CURR_PERIOD'      ).AsDate;
				  SysOptions.DateFirstImport := spSysOptions.FN('OUT_DATE_FIRST_IMPORT'     ).AsDate;
			  finally
				  if spSysOptions <> nil then FreeAndNil( spSysOptions );
			  end;

			  SysOptions.IsValid := True;
		  end;

	  finally
		  if ConnectParams <> nil then FreeAndNil( ConnectParams );
	  end;

	except
		//Протоколируем ИС
		LogException( FileName );
		SysOptions.IsValid := False;

		if Assigned( dmdDataModul )
		then
			FreeAndNil( dmdDataModul );
		Raise;
	end;

  except
	  on E: EFIBInterBaseError
	  do begin
		MessageBox( Application.Handle, PChar( sErrorCode + IntToStr( E.IBErrorCode ) + cCRLF + sErrorText + E.IBMessage ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
	  end;

	  on E: Exception
	  do begin
		MessageBox( Application.Handle, PChar( sErrorText + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
	  end;
  end;

finally

	if Assigned( dmdDataModul )
	then
		dmdDataModul.pSysOptions := SysOptions;

	Application.CreateForm(TfmMain, fmMain);
	Application.Run;
end;

end.
