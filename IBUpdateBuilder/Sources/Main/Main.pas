unit Main;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uMain                                                                      *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Формирование обновлений. Переименование скриптов, отображение результатов. *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxBar, dxBarExtItems, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxStatusBar, ImgList,
  cxContainer, RxMemDS, cxShellDlgs, cxShellBrowserDialog, cxTextEdit,
  cxMaskEdit, cxButtonEdit, Menus, cxCheckBox, StdCtrls, cxSplitter,
  cxMRUEdit, cxDropDownEdit, ExtCtrls, cxLookAndFeelPainters, cxButtons,
  FIBDatabase, pFIBDatabase, cxLabel, cxRadioGroup, cxCalc, ShellAPI, uLib, uTypes,
  BrowseFolderDlg;

type

  TfmMain = class(TForm)

	Splitter               : TcxSplitter;

	rgrFileType            : TcxRadioGroup;

	pnlDBParams            : TPanel;

	lblDescription         : TcxLabel;

	btnTestConnect         : TcxButton;

	grMain                 : TcxGrid;
	lvlMain                : TcxGridLevel;
	tvwMain                : TcxGridDBTableView;

	brmMain                : TdxBarManager;

	bmnuMain               : TdxBarPopupMenu;

	btnCopy                : TdxBarLargeButton;
	btnExit                : TdxBarLargeButton;
	btnBuild               : TdxBarLargeButton;
	btnFilter              : TdxBarLargeButton;
	btnSearch              : TdxBarLargeButton;
	btnInvert              : TdxBarLargeButton;
	btnRename              : TdxBarLargeButton;
	btnUnRename            : TdxBarLargeButton;
	btnSelectAll           : TdxBarLargeButton;
	btnUnselectAll         : TdxBarLargeButton;

	mnuBuild               : TdxBarButton;
	mnuOnlyTest            : TdxBarButton;
	mnuMergeScripts        : TdxBarButton;
	btnCalcMaxUpdateNum    : TdxBarButton;

	escMain                : TcxEditStyleController;

	srpMain                : TcxStyleRepository;

	cxsFooter              : TcxStyle;
	cxsHeader              : TcxStyle;
	cxsContent             : TcxStyle;
	cxHotTrack             : TcxStyle;
	cxsInactive            : TcxStyle;
	cxsIndicator           : TcxStyle;
	cxsSelection           : TcxStyle;
	cxBackground           : TcxStyle;
	cxsGroupByBox          : TcxStyle;
	cxsContentOdd          : TcxStyle;
	cxsContentEvent        : TcxStyle;
	cxsColumnHeader        : TcxStyle;
	cxsColumnHeaderClassic : TcxStyle;

	imlToolBar             : TImageList;
	imlPopupMenu           : TImageList;

	bdlgMain               : TcxShellBrowserDialog;

	dsrMain                : TDataSource;
	dstMain                : TRxMemoryData;

	cbxProjects            : TdxBarCombo;

	edtDateBeg             : TdxBarDateCombo;
	edtDateEnd             : TdxBarDateCombo;
	edtComment             : TdxBarEdit;
	edtDateCreate          : TdxBarDateCombo;
	edtScriptPath          : TcxButtonEdit;

    edtUpdNumberMajor      : TdxBarSpinEdit;
    edtFtrUpdNumMajor      : TdxBarSpinEdit;
    edtUpdNumberMinor      : TdxBarSpinEdit;
    edtFtrUpdNumMinor      : TdxBarSpinEdit;

	stbMain                : TdxStatusBar;
	stbMainContainer0      : TdxStatusBarContainerControl;

	pmnuExit               : TMenuItem;
	pmnuCopy               : TMenuItem;
	pmnuMain               : TPopupMenu;
	pmnuBuild              : TMenuItem;
	smnuBuild              : TMenuItem;
	pmnuInvert             : TMenuItem;
	pmnuRename             : TMenuItem;
	pmnuFilter             : TMenuItem;
    pmnuSearch             : TMenuItem;
	pmnuUnRename           : TMenuItem;
	smnuOnlyTest           : TMenuItem;
	pmnuSelectAll          : TMenuItem;
	pmnuUnSelectAll        : TMenuItem;
	smnuMergeScripts       : TMenuItem;

	cmnIsActive            : TcxGridDBColumn;
	cmnFileSize            : TcxGridDBColumn;
	cmnDateChange          : TcxGridDBColumn;
	cmnScriptNames         : TcxGridDBColumn;

	fnIS_ACTIVE            : TBooleanField;
	fnFILE_SIZE            : TFloatField;
	fnDATE_CHANGE          : TDateTimeField;
	fnSCRIPT_NAME          : TStringField;

	cciDateBeg             : TdxBarControlContainerItem;
	cciDateEnd             : TdxBarControlContainerItem;

	dbTestConnect          : TpFIBDatabase;

	lblPeriod              : TdxBarStatic;

	dlgDBPath              : TOpenDialog;

	cbxDateBeg             : TcxCheckBox;
	cbxDateEnd             : TcxCheckBox;

	stbDBPath              : TdxStatusBar;
	stbHotKeys             : TdxStatusBar;
	stbDBParams            : TdxStatusBar;
	stbDescription         : TdxStatusBar;

	stbDBContainer1        : TdxStatusBarContainerControl;
	stbDBContainer2        : TdxStatusBarContainerControl;
	stbDBContainer3        : TdxStatusBarContainerControl;
	stbMainContainer2      : TdxStatusBarContainerControl;
	stbDBPathContainer2    : TdxStatusBarContainerControl;
	dxStatusBar1Container0 : TdxStatusBarContainerControl;

	edtLogin               : TcxTextEdit;
	edtDBPath              : TcxButtonEdit;
	edtPassword            : TcxTextEdit;
	edtServerName          : TcxMRUEdit;
    stbDBParamsContainer3: TdxStatusBarContainerControl;
    edtActiveProjects: TcxTextEdit;
    BrowseFolderDlg1: TBrowseFolderDlg;

	procedure FormCreate                                             (Sender: TObject);
	procedure FormActivate                                           (Sender: TObject);
	procedure FormShortCut                                           (var Msg: TWMKey; var Handled: Boolean);

	procedure btnCopyClick                                           (Sender: TObject);
	procedure btnExitClick                                           (Sender: TObject);
	procedure btnBuildClick                                          (Sender: TObject);
	procedure btnRenameClick                                         (Sender: TObject);
	procedure btnFilterClick                                         (Sender: TObject);
	procedure btnInvertClick                                         (Sender: TObject);
	procedure btnSearchClick                                         (Sender: TObject);
	procedure btnUnRenameClick                                       (Sender: TObject);
	procedure btnSelectAllClick                                      (Sender: TObject);
	procedure btnUnselectAllClick                                    (Sender: TObject);
	procedure btnTestConnectClick                                    (Sender: TObject);
	procedure btnCalcMaxUpdateNumClick                               (Sender: TObject);

	procedure tvwMainKeyDown                                         (Sender: TObject; var Key: Word; Shift: TShiftState);

	procedure tvwMainCellClick                                       (Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);

	procedure cbxDateBegClick                                        (Sender: TObject);
	procedure cbxDateEndClick                                        (Sender: TObject);

	procedure edtUpdNumberMajorButtonClick                           (Sender: TdxBarSpinEdit; Button: TdxBarSpinEditButton);
	procedure edtFtrUpdNumMajorButtonClick                           (Sender: TdxBarSpinEdit; Button: TdxBarSpinEditButton);
	procedure edtScriptPathPropertiesButtonClick                     (Sender: TObject; AButtonIndex: Integer);

	procedure edtServerNamePropertiesChange                          (Sender: TObject);

	procedure tvwMainCustomDrawCell                                  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
	procedure tvwMainDataControllerSummaryFooterSummaryItemsSummary  (ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments; var OutArguments: TcxSummaryEventOutArguments);

	procedure edtLoginKeyDown                                        (Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure edtDBPathKeyDown                                       (Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure edtPasswordKeyDown                                     (Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure edtServerNameKeyDown                                   (Sender: TObject; var Key: Word; Shift: TShiftState);

	procedure SplitterAfterOpen                                      (Sender: TObject);
	procedure SplitterAfterClose                                     (Sender: TObject);

	procedure edtDBPathPropertiesButtonClick                         (Sender: TObject; AButtonIndex: Integer);

	procedure rgrFileTypeClick                                       (Sender: TObject);

	procedure cbxProjectsChange                                      (Sender: TObject);

	procedure mnuOnlyTestClick                                       (Sender: TObject);
	procedure mnuMergeScriptsClick                                   (Sender: TObject);

	procedure dstMainAfterOpen                                       (DataSet: TDataSet);
	procedure dstMainAfterClose                                      (DataSet: TDataSet);
    procedure grMainDblClick(Sender: TObject);

  private
	  FAppMode          : TEnm_AppMode;
	  FInitialize       : Boolean;
	  FUsrFileType      : TUsrFileType;
	  FUpdFilePath      : String;
	  FSearchParams     : TPtr_SearchParams;
	  FUpdFileExist     : Boolean;
	  FIBEscriptPath    : String;
	  FSelectedRecCount : Integer;

	  function  GetAppMode          : TEnm_AppMode;
	  function  GetInitialize       : Boolean;
	  function  GetUsrFileType      : TUsrFileType;
	  function  GetUpdFilePath      : String;
	  function  GetSearchParams     : TPtr_SearchParams;
	  function  GetUpdFileExist     : Boolean;
	  function  GetIBEscriptPath    : String;
	  function  GetSelectedRecCount : Integer;

	  procedure SetAppMode          ( aValue: TEnm_AppMode      );
	  procedure SetUsrFileType      ( aValue: TUsrFileType      );
	  procedure SetUpdFilePath      ( aValue: String            );
	  procedure SetSearchParams     ( aValue: TPtr_SearchParams );
	  procedure SetUpdFileExist     ( aValue: Boolean           );
	  procedure SetIBEscriptPath    ( aValue: String            );
	  procedure SetSelectedRecCount ( aValue: Integer           );
  public
	  property AppMode          : TEnm_AppMode      read GetAppMode          write SetAppMode;
	  property Initialize       : Boolean           read GetInitialize;
	  property UsrFileType      : TUsrFileType      read GetUsrFileType      write SetUsrFileType;
	  property UpdFilePath      : String            read GetUpdFilePath      write SetUpdFilePath;
	  property SearchParams     : TPtr_SearchParams read GetSearchParams     write SetSearchParams;
	  property UpdFileExist     : Boolean           read GetUpdFileExist     write SetUpdFileExist;
	  property IBEscriptPath    : String            read GetIBEscriptPath    write SetIBEscriptPath;
	  property SelectedRecCount : Integer           read GetSelectedRecCount write SetSelectedRecCount;
  end;

var
  fmMain: TfmMain;

implementation

uses uUtils, uSearch, StrUtils, FileUtil;

resourcestring

	//Сообщения, оповещающие пользователя о результатах проверки соединения
	sNotFound                = 'не найден';
	sConnectOK               = 'Соединение успешно установлено!';
	sConnectErr              = 'Не удалось установить соединение...'#13'Проверьте параметры соединения ';

	sErrorTestProcess        = 'Невозможно продолжить процесс тестирования, поскольку'#13'файл скрипта, подлежащий тестированю, не найден';

	sErrorUpdate             = 'Файл обновления ОТТЕСТИРОВАН С ОШИБКАМИ!'#13'Показать файл-отчёт ошибок?';
	sSuccessUpdate           = 'Файл обновления УСПЕШНО ОТТЕСТИРОВАН!';

	sModulesInvalid          = 'Файлы архивов модулей не найдены, либо'#13'критерии фильтрации указаны неверно';
	sErrorUpdateTest         = 'Невозможно выполнить тестирование файла обновления,'#13'поскольку ';
	sInvalidUserName         = 'имя пользователя не указано';
	sInvalidPassword         = 'пароль не указан';
	sInvalidServerName       = 'имя сервера не указано';
	sInvalidDataBasePath     = 'файл базы данных не найден';
	sInvalidIBEscriptPath    = 'программа применения скриптов не найдена';

	sServerTypeUnknown       = 'Сервер не определён'#13'Укажите тип сервера';
	sServerNameUnknown       = 'Сервер не определён'#13'Укажите имя сервера';

	sLoginNotFound           = 'Имя пользователя не определено'#13'Укажите имя пользователя';
	sDBFileNotFound          = 'Файл базы данных не найден'#13'Проверьте правильность указанного пути';
	sPasswordNotFound        = 'Пароль не определен'#13'Укажите пароль';
	sSearchStrNotFound       = 'Искомый текст ';

	sCopyAbort               = 'Процесс копирования прерван!';
	sFatalError              = 'Критическая ошибка!'#13'Обратитесь к разработчикам';
	sPathInvalid             = 'Указанный путь не существует!';
	//Delimiter
	sSearchInvalid           = 'выполнить поиск, поскольку'#13#10;
	sScr_SearchInvalid       = 'файлы скриптов отсутствуют';
	sMod_SearchInvalid       = 'файлы архивов модулей отсутствуют';
	//Delimiter
	sScr_CopyInvalid         = 'скопировать файлы скриптов,';
	sMod_CopyInvalid         = 'скопировать файлы архивов модулей,';
	//Delimiter
	sScr_CanNotRename        = 'Файлы скриптов, подлежащие переименованию, отсутствуют!';
	sMod_CanNotRename        = 'Файлы архивов модулей, подлежащие переименованию, отсутствуют!';
	sBuildInvalid            = 'собрать файл обновления,';
	//Delimiter
	sScr_FilterInvalid       = 'сформировать множество скриптов,';
	sMod_FilterInvalid       = 'сформировать множество архивов модулей,';
	//Delimiter
	sScr_RenameInvalid       = 'переименовать файлы скриптов,';
	sMod_RenameInvalid       = 'переименовать файлы архивов модулей,';
	sInvertInvalid           = 'инвертировать выделение,';
	//Delimiter
	sScr_ScrLoadFailed       = 'Не удалось загрузить скрипты'#13'Проверьте путь к скриптам';
	sMod_ScrLoadFailed       = 'Не удалось загрузить файлы архивов модулей'#13'Проверьте путь к архивам модулей';
	//Delimiter
	sScr_CanNotUnRename      = 'Файлы скриптов, подлежащие разименованию, отсутствуют!';
	sMod_CanNotUnRename      = 'Файлы архивов модулей, подлежащие разименованию, отсутствуют!';
	sScrSetIsEmpty1          = 'Невозможно ';
	//Delimiter
	sScr_ScrSetIsEmpty2      = #13'поскольку отсутствуют выбранные скрипты';
	sMod_ScrSetIsEmpty2      = #13'поскольку отсутствуют выбранные архивы модулей';
	//Delimiter
	sScr_ScrSetIsEmpty3      = #13'поскольку файлы скриптов отсутствуют';
	sMod_ScrSetIsEmpty3      = #13'поскольку файлы архивов модулей отсутствуют';
	//Delimiter
	sScr_ScrDirNotFound      = 'Путь к скриптам не найден'#13'Укажите путь к скриптам';
	sMod_ScrDirNotFound      = 'Путь к архивам модулей не найден'#13'Укажите путь к архивам модулей';
	//Delimiter
	sScr_UnRenameInvalid     = 'разименовать файлы скриптов,';
	sMod_UnRenameInvalid     = 'разименовать файлы архивов модулей,';
	sCopyFilesError1         = 'Копирование файлов было выполнено с ошибками!'#13;
	sCopyFilesError2         = ' файл ((a)ов) из ';
	sCopyFilesError3         = ' отобранных удалось скопировать';
	//Delimiter
	sScr_ScrFilterInvalid    = 'Для заданных критериев фильтрации cкрипты не найдены';
	sMod_ScrFilterInvalid    = 'Для заданных критериев фильтрации архивы модулей не найдены';
	sSelectAllInvalid        = 'выделить все,';
	sRenameFilesError1       = 'Переименование файлов было выполнено с ошибками!'#13;
	sRenameFilesError2       = ' файл ((a)ов) из ';
	sRenameFilesError3       = ' отобранных удалось переименовать';
	sFileAlreadyExists1      = 'Файл с именем ';
	sFileAlreadyExists2      = #13'Уже существует. Перезаписать? ';
	sUpdateCannotCreate      = 'Внимание! Невозможно продолжить формирование файла обновления, покольку в процессе'#13'его создания один из файлов скриптов был удалён(перемещен) или заблокирован для доступа';
	sUnSelectAllInvalid      = 'снять выделение для всех,';
	sUnRenameFilesError1     = 'Разименование файлов было выполнено с ошибками!'#13;
	sUnRenameFilesError2     = ' файл ((a)ов) из ';
	sUnRenameFilesError3     = ' отобранных удалось разименовать';
	sCopyFilesSuccessful     = ' Файл ((a)ов) успешно скопировано!';
	sFileCannotBeDeleted     = #13' удалить не удалось. Возможно файл не существует или временно недоступен';
	sUpdateNumberInvalid     = #13'поскольку порядковый номер обновления(или его часть) отсутствует';
	sScr_DescriptionPath     = 'Путь к скриптам :';
	sMod_DescriptionPath     = 'Путь к модулям :';
	sRenameFilesSuccessful   = ' Файл ((a)ов) успешно переименовано!';
	sUpdateCreateSuccessful  = 'Файл обновления успешно собран!';
	sUnRenameFilesSuccessful = ' Файл ((a)ов) успешно разименовано!';
	sUpdateDateCreateInvalid = #13'поскольку дата создания обновления отсутствует';

const

	cCopyInvalid      : array[0..1] of string = ( sScr_CopyInvalid,      sMod_CopyInvalid      );
	cCanNotRename     : array[0..1] of string = ( sScr_CanNotRename,     sMod_CanNotRename     );
	cSearchInvalid    : array[0..1] of string = ( sScr_SearchInvalid,    sMod_SearchInvalid    );
	cFilterInvalid    : array[0..1] of string = ( sScr_FilterInvalid,    sMod_FilterInvalid    );
	cRenameInvalid    : array[0..1] of string = ( sScr_RenameInvalid,    sMod_RenameInvalid    );
	cScrLoadFailed    : array[0..1] of string = ( sScr_ScrLoadFailed,    sMod_ScrLoadFailed    );
	cCanNotUnRename   : array[0..1] of string = ( sScr_CanNotUnRename,   sMod_CanNotUnRename   );
	cScrSetIsEmpty2   : array[0..1] of string = ( sScr_ScrSetIsEmpty2,   sMod_ScrSetIsEmpty2   );
	cScrSetIsEmpty3   : array[0..1] of string = ( sScr_ScrSetIsEmpty3,   sMod_ScrSetIsEmpty3   );
	cScrDirNotFound   : array[0..1] of string = ( sScr_ScrDirNotFound,   sScr_ScrDirNotFound   );
	cUnRenameInvalid  : array[0..1] of string = ( sScr_UnRenameInvalid,  sMod_UnRenameInvalid  );
	cDescriptionPath  : array[0..1] of string = ( sScr_DescriptionPath,  sMod_DescriptionPath  );
	cScrFilterInvalid : array[0..1] of string = ( sScr_ScrFilterInvalid, sMod_ScrFilterInvalid );

{$R *.dfm}

function TfmMain.GetAppMode: TEnm_AppMode;
begin
  Result := FAppMode;
end;

function TfmMain.GetIBEscriptPath: String;
begin
  Result := FIBEscriptPath;
end;

function TfmMain.GetInitialize: Boolean;
begin
  Result := FInitialize;
end;

function TfmMain.GetUsrFileType: TUsrFileType;
begin
  Result := FUsrFileType;
end;

function TfmMain.GetUpdFilePath: String;
begin
  Result := FUpdFilePath;
end;

function TfmMain.GetSearchParams: TPtr_SearchParams;
begin
  Result := FSearchParams;
end;

function TfmMain.GetUpdFileExist: Boolean;
begin
  Result := FUpdFileExist;
end;

function TfmMain.GetSelectedRecCount: Integer;
begin
  Result := FSelectedRecCount;
end;

procedure TfmMain.SetAppMode(aValue: TEnm_AppMode);
begin
  FAppMode := aValue;
end;

procedure TfmMain.SetIBEscriptPath(aValue: String);
begin
  FIBEscriptPath := aValue;
end;

procedure TfmMain.SetUsrFileType(aValue: TUsrFileType);
begin
  FUsrFileType := aValue;
end;

procedure TfmMain.SetUpdFilePath(aValue: String);
begin
  FUpdFilePath := aValue;
end;

procedure TfmMain.SetSearchParams(aValue: TPtr_SearchParams);
begin
  FSearchParams := aValue;
end;

procedure TfmMain.SetUpdFileExist(aValue: Boolean);
begin
  FUpdFileExist := aValue;
end;

procedure TfmMain.SetSelectedRecCount(aValue: Integer);
begin
  FSelectedRecCount := aValue;
end;

//Выходим из приложения
procedure TfmMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

//Инициализация переменных и значений обязательных полей ввода
procedure TfmMain.FormCreate(Sender: TObject);
var
    i, n         : Integer;
    IniFileName  : TFileName;
    DefIniParams : TStringList;
begin
	try
        try
			FAppMode             := amView;
			FInitialize          := True;
			FSelectedRecCount    := 0;
			edtDateBeg.Date      := StrToDate( sDEF_SCR_DATE_BEG );
			tvwMain.DataController.Summary.FooterSummaryValues[cmnIsActive.Index] := SelectedRecCount;
			tvwMain.DataController.Summary.FooterSummaryValues[cmnFileSize.Index] := cZERO;



            //Считываем умалчиваемые настройки из конфигурационного файла
            try
                IniFileName  := ExtractFilePath( Application.ExeName ) + sINI_FILE_NAME;
                DefIniParams := TStringList.Create;
                ReadIniFile( IniFileName, cDefIniParams, DefIniParams );

                edtLogin.Text      := DefIniParams.Values[sKN_USER_NAME  ];
                edtDBPath.Text     := DefIniParams.Values[sKN_DB_PATH    ];
                edtPassword.Text   := DefIniParams.Values[sKN_PASSWORD   ];
                edtScriptPath.Text := DefIniParams.Values[sKN_SCR_PATH   ];
                edtServerName.Text := DefIniParams.Values[sKN_SERVER_NAME];
                edtServerName.AddItem( DefIniParams.Values[sKN_SERVER_NAME] );
                SetIBEscriptPath( DefIniParams.Values[sKN_IBESCRIPT_PATH] );
                edtActiveProjects.Text := DefIniParams.Values[sKN_ACTIVE_PROJECTS];
            finally
                if DefIniParams <> nil then FreeAndNil( DefIniParams );
            end;

            //Заполняем выпадающий список названий активных проектов
            n := High( cProjectParams );

            try
                cbxProjects.Items.BeginUpdate;

                for i := Low( cProjectParams ) to n
                do begin
                    if pos(cProjectParams[i].KeyExpr,edtActiveProjects.Text)<>0 then
                    cbxProjects.Items.Add( '('+cProjectParams[i].KeyExpr+')'+cProjectParams[i].Name );
                end;

                cbxProjects.ItemIndex := 0;
            finally
                cbxProjects.Items.EndUpdate;
            end;

        except
            //Протоколируем ИС
            LogException( ExtractFilePath( Application.ExeName ) + sLOG_FILE_NAME );
            Raise;
        end;
    except
        on E: Exception
        do
            MessageBox( Handle, PChar( sErrorTextExt + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR )
    end;
end;

//Пытаемся загрузить скрипты для умалчиваемого пути
procedure TfmMain.FormActivate(Sender: TObject);
var
	Path         : String;
	KeyExpr      : String;
	LoadResult   : TLoadScrResult;
	ScriptNames  : TUsrStringList;
	FilterParams : TFilterParams;
	MaxUpdNumber : TUpdateNumInfo;
begin
  try
	try
		if Initialize
		then begin

			//Проверяем корректность умалчиваемого пути
			if not DirectoryExists( edtScriptPath.Text )
			then begin
				MessageBox( Handle, PChar( cScrDirNotFound[Ord( UsrFileType )] ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
				edtScriptPath.Properties.OnButtonClick( nil, -1 );
			end;

			//Формируем путь к скриптам с учётом завершающего слеша
			Path := Trim( edtScriptPath.Text );
			SetDirEndDelimiter( Path );
			FilterParams.ScriptPath := Path + sSCRIPTS_MASK;

			//Получаем составной номер обновления
			FilterParams.UpdateNumMajor := edtFtrUpdNumMajor.IntValue;
			FilterParams.UpdateNumMinor := edtFtrUpdNumMinor.IntValue;

			//Получаем ключевое выражение, соответствующее выбранному проекту
			KeyExpr := GetKeyExpr( cbxProjects.Text );

			if KeyExpr = sEMPTY_STR
			then begin
				MessageBox( Handle, PChar( sFatalError ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
				Exit;
			end
			else begin
				FilterParams.KeyExpr := KeyExpr;
			end;

			//Пытаемся загрузить скрипты
			try
				ScriptNames := TUsrStringList.Create;
				ScriptNames.Sorted := cDEF_CAN_SORT;
				ScriptNames.CaseSensitive := cDEF_CASE_SENSITIVE;
				with MaxUpdNumber
				do begin
					UpdateNumMajor := cZERO;
					UpdateNumMinor := cDEF_UPDATE_NUMBER;
				end;
				LoadResult  := LoadScripts( FilterParams, ScriptNames, MaxUpdNumber );

				//Анализируем результат загрузки скриптов
				case LoadResult of

				  lrLoadSuccess   : begin
									  edtUpdNumberMajor.Value := MaxUpdNumber.UpdateNumMajor;
									  edtUpdNumberMinor.Value := MaxUpdNumber.UpdateNumMinor + 1;
									  try
										  tvwMain.DataController.BeginUpdate;
                                          FillDataset( dstMain, ScriptNames, FSelectedRecCount );
                                      finally
                                          tvwMain.DataController.EndUpdate;
                                      end;
									  tvwMain.DataController.GotoFirst;
									end;

                  lrScrNotFound   : begin
									  MessageBox( Handle, PChar( cScrLoadFailed[Ord( UsrFileType )] ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
                                    end;

				  lrFilterInvalid : begin
									  MessageBox( Handle, PChar( cScrFilterInvalid[Ord( UsrFileType )] ), PChar( sMsgCaptionInf ), MB_OK or MB_ICONINFORMATION );
                                    end;
                end;

            finally
                if ScriptNames <> nil then FreeAndNil( ScriptNames );
            end;

        end;

        FInitialize := False;
    except
        FInitialize := False;
        LogException( ExtractFilePath( Application.ExeName ) + sLOG_FILE_NAME );
        Raise;
    end;
  except
      on E: Exception
      do begin
          MessageBox( Handle, PChar( sErrorTextExt + e.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
	  end;
  end;
end;

//Собираем файл обновления, склеивая его из множества выбранных файлов скриптов
procedure TfmMain.mnuMergeScriptsClick(Sender: TObject);
var
    i, n               : Integer;
    Mode               : Word;
    Buffer             : PChar;
    ErrMsg             : String;
    UpdPath            : String;
    Comment            : String;
    SpaceStr           : String;
    DlgResult          : Integer;
    UpdScript          : TFileStream;
    ScriptPath         : String;
    UpdComment         : String;
    StarsCount         : Integer;
    CurrScript         : TFileStream;
	UpdFileName        : String;
	FmtSettings        : TFormatSettings;
	SelectedRec        : String;
	CurrFileName       : String;
	CommProjName       : String;
	UpdateNumMajor     : String;
	UpdateNumMinor     : String;
	UpdDateCreateStr   : String;
	CommScriptsCount   : String;
	CommUpdDateCreate  : String;
	IsUpdCreateSuccess : Boolean;

begin
  try
	try
		SetUpdFileExist( False );

		//Проверяем наличие отобранных пользователем скриптов
		if not dstMain.IsEmpty AND ( SelectedRecCount > 0 )
		then begin

			UpdateNumMajor := Trim( edtUpdNumberMajor.Text );
			UpdateNumMinor := Trim( edtUpdNumberMinor.Text );

			//Проверяем главную часть порядкового номера обновления
			if UpdateNumMajor = sEMPTY_STR
			then begin
				MessageBox( Handle, PChar( sScrSetIsEmpty1 + sBuildInvalid + sUpdateNumberInvalid ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
				edtUpdNumberMajor.SetFocus;
				Exit;
			end;

			//Проверяем дополнительную часть порядкового номера обновления
			if UpdateNumMinor = sEMPTY_STR
			then begin
				MessageBox( Handle, PChar( sScrSetIsEmpty1 + sBuildInvalid + sUpdateNumberInvalid ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
				edtUpdNumberMinor.SetFocus;
				Exit;
			end;

			//Проверяем дату создания обновления
			if Trim( edtDateCreate.Text ) = sEMPTY_STR
			then begin
				MessageBox( Handle, PChar( sScrSetIsEmpty1 + sBuildInvalid + sUpdateDateCreateInvalid ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
				edtDateCreate.SetFocus;
				Exit;
			end;

			ScriptPath := Trim( edtScriptPath.Text );

			//Проверяем путь к хранилищу скриптов
			if not DirectoryExists( ScriptPath )
			then begin
				MessageBox( Handle, PChar( cScrDirNotFound[Ord( UsrFileType )] ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
				edtScriptPath.SetFocus;
				Exit;
			end;

			SetDirEndDelimiter( ScriptPath );

			//Формируем собственно имя файла обновления
			FmtSettings.DateSeparator   := cDATE_SEPARATOR;
			FmtSettings.ShortDateFormat := sFORMAT_DATE_TO_STR;
			UpdDateCreateStr := DateToStr( edtDateCreate.Date, FmtSettings );

			//Получаем главную часть порядкового номера обновления
			if Length( UpdateNumMajor ) < cUPDATE_MAJ_RESERVED_CHAR_COUNT
			then begin
				UpdateNumMajor := DupeString( sZERO, cUPDATE_MAJ_RESERVED_CHAR_COUNT - Length( UpdateNumMajor ) ) + UpdateNumMajor;
			end;

			//Получаем дополнительную часть порядкового номера обновления
			if Length( UpdateNumMinor ) < cUPDATE_MIN_RESERVED_CHAR_COUNT
			then begin
				UpdateNumMinor := DupeString( sZERO, cUPDATE_MIN_RESERVED_CHAR_COUNT - Length( UpdateNumMinor ) ) + UpdateNumMinor;
			end;

			edtComment.Text := Trim( edtComment.Text );

			if edtComment.Text <> sEMPTY_STR
			then
				edtComment.Text := sSPACE + edtComment.Text;

			UpdFileName := UpdDateCreateStr + sUPDATE_NUMBER + UpdateNumMajor + sMINUS + UpdateNumMinor + edtComment.Text + sSCRIPT_FILE_EXT;

			//Получаем путь для файла обновления
            if bdlgMain.Execute
            then begin
                UpdPath := bdlgMain.Path;
                bdlgMain.Path := '';

                //Проверяем корректность указанного пользователем пути
                if DirectoryExists( UpdPath )
                then begin
                    SetDirEndDelimiter( UpdPath );
                    UpdFileName := UpdPath + UpdFileName;
                end
                else begin
                    MessageBox( Handle, PChar( sPathInvalid ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
                    Exit;
                end;

            end
            else begin
                Exit;
            end;

            DlgResult := cDEF_DLG_RESULT;

            //Получаем режим формирования обновления
            if FileExists( UpdFileName )
            then begin
                DlgResult := MessageBox( Handle, PChar( sFileAlreadyExists1 + UpdFileName + sFileAlreadyExists2 ), PChar( sMsgCaptionQst ), MB_YESNOCANCEL or MB_ICONQUESTION );
            end;

            //Получаем режим работы с файлом
            case DlgResult of

              ID_YES          : begin
                                  //Удаляем существующий файл обновления
                                  if not DeleteFile( UpdFileName )
                                  then begin
                                      MessageBox( Handle, PChar( sFileAlreadyExists1 + UpdFileName + sFileCannotBeDeleted ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
                                      Exit;
                                  end;

                                  Mode := fmCreate;
                                end;

              ID_NO           : begin
                                  Mode := fmOpenWrite;
                                end;

              ID_CANCEL       : begin
                                  Exit;
                                end;

              cDEF_DLG_RESULT : begin
                                  Mode := fmCreate;
                                end;
            end;

            //Формируем начальный комментарий для файла обновления
            SpaceStr   := sSPACE;
            StarsCount := -1;

            StarsCount := Length( Trim( cbxProjects.Text ) );

            if StarsCount < Length( Trim( edtDateCreate.Text ) )
            then begin
                StarsCount := Length( Trim( edtDateCreate.Text ) );
            end;

            //Выравниваем по правому краю с помощью пробелов строки начального комментария
            CommProjName      := Trim( cbxProjects.Text );
            SpaceStr          := DupeString( sSPACE, StarsCount - Length( CommProjName ) );
            CommProjName      := sCommProjectName + CommProjName + SpaceStr;
            CommScriptsCount  := IntToStr( SelectedRecCount );
            SpaceStr          := DupeString( sSPACE, StarsCount - Length( CommScriptsCount ) );
            CommScriptsCount  := sCommScriptsCount + CommScriptsCount + SpaceStr;
            CommUpdDateCreate := Trim( edtDateCreate.Text );
            SpaceStr          := DupeString( sSPACE, StarsCount - Length( CommUpdDateCreate ) );
            CommUpdDateCreate := sCommUpdDateCreate + CommUpdDateCreate + SpaceStr;

            //Получаем количесто окаймляющих комментарий звёздочек
            CommProjName      := sBRAKET_COMMENT_OP + sCommentBevel + CommProjName      + sCommentBevel + sBRAKET_COMMENT_CL;
            CommScriptsCount  := sBRAKET_COMMENT_OP + sCommentBevel + CommScriptsCount  + sCommentBevel + sBRAKET_COMMENT_CL;
            CommUpdDateCreate := sBRAKET_COMMENT_OP + sCommentBevel + CommUpdDateCreate + sCommentBevel + sBRAKET_COMMENT_CL;

            StarsCount := Length( CommProjName ) - 2*Length( sBRAKET_COMMENT_OP );
            Comment := sSTAR;
            Comment := DupeString( Comment, StarsCount );

            //Формируем полный блок начального комментария
            Comment := sBRAKET_COMMENT_OP + Comment + sBRAKET_COMMENT_CL;
            UpdComment := sCRLF + Comment + sCRLF + CommProjName + sCRLF + CommUpdDateCreate + sCRLF + CommScriptsCount + sCRLF + Comment + sCRLF + sCRLF;

            try
                IsUpdCreateSuccess := True;
                SelectedRec := dstMain.FieldByName(sSCRIPT_NAME_FN).AsString;
                n := dstMain.RecordCount - 1;
                dstMain.DisableControls;
                dstMain.Last;

                //Записываем в файл обновления блок начального комментария
                UpdScript := TFileStream.Create( UpdFileName, Mode or fmShareDenyWrite );
                UpdScript.Seek( 0, soFromEnd );
                Buffer := StrNew( PChar( UpdComment ) );
                StrPCopy( Buffer, UpdComment );
                UpdScript.WriteBuffer( Buffer^, StrLen( Buffer ) );
                StrDispose( Buffer );

                //Копируем и вставляем содержимое каждого из отобранных файлов скриптов в результирующий файл обновления
                for i := 0 to n
                do begin

                    if dstMain.FieldByName(sIS_ACTIVE_FN).AsBoolean
                    then begin
                        CurrFileName := ScriptPath + dstMain.FieldByName(sSCRIPT_NAME_FN).AsString;

                        //Проверяем: не был ли удалён выбранный файл в процессе формирования результирующего файла обновления
                        if FileExists( CurrFileName )
                        then begin
                            try
                                //Добавляем комментарий, содержащий имя файла скрипта включаемого в обновление
                                UpdComment := sCommentFile + ExtractFileName( CurrFileName ) + sSPACE;
                                Comment := sBRAKET_COMMENT_OP + DupeString( sSTAR, Length( UpdComment ) ) + sBRAKET_COMMENT_CL;
                                UpdComment := sCRLF + sCRLF + sCRLF + Comment + sCRLF + sBRAKET_COMMENT_OP + UpdComment + sBRAKET_COMMENT_CL + sCRLF + Comment + sCRLF + sCRLF + sCRLF;
                                Buffer := StrNew( PChar( UpdComment ) );
                                StrPCopy( Buffer, UpdComment );
                                UpdScript.Seek( 0, soFromEnd );
                                UpdScript.WriteBuffer( Buffer^, StrLen( Buffer ) );

                                //Копируем содержимое текущего скрипта в результирующий файла обновления
                                CurrScript := TFileStream.Create( CurrFileName, fmOpenRead and fmShareDenyWrite );
                                UpdScript.Seek( 0, soFromEnd );
                                UpdScript.CopyFrom( CurrScript, CurrScript.Size );
                            finally
                                StrDispose( Buffer );
                                FreeAndNil( CurrScript );
                            end;
                        end
                        else begin
                            MessageBox( Handle, PChar( sUpdateCannotCreate ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
                            IsUpdCreateSuccess := False;
                            Exit;
                        end;

                    end;

                    dstMain.Prior;
                end;

            finally
                dstMain.Locate( sSCRIPT_NAME_FN, SelectedRec, [] );
                dstMain.EnableControls;
                FreeAndNil( UpdScript  );

                //Оповещаем пользователя о результатах формирования обновления
                if IsUpdCreateSuccess
                then begin
                    SetUpdFilePath( UpdFileName );
                    SetUpdFileExist( True );

                    if ( TComponent( Sender ).Name = mnuMergeScripts.Name ) OR ( TComponent( Sender ).Name = smnuMergeScripts.Name )
                    then
                        MessageBox( Handle, PChar( sUpdateCreateSuccessful ), PChar( sMsgCaptionInf ), MB_OK or MB_ICONINFORMATION )
                end
                else begin
                    DeleteFile( UpdFileName );
                end;

            end;

        end
        else begin
            if dstMain.IsEmpty
            then
				ErrMsg := cScrSetIsEmpty3[Ord( UsrFileType )]
			else
				ErrMsg := cScrSetIsEmpty2[Ord( UsrFileType )];

             ErrMsg := sScrSetIsEmpty1 + sBuildInvalid + ErrMsg;
             MessageBox( Handle, PChar( ErrMsg ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
        end;
    except
        LogException( ExtractFilePath( Application.ExeName ) + sLOG_FILE_NAME );
        Raise;
    end;
  except
      on E: Exception
      do begin
          MessageBox( Handle, PChar( sErrorTextExt + e.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
      end;
  end;
end;

//Собираем файл обновления и тестируем его
procedure TfmMain.btnBuildClick(Sender: TObject);
var
	DBPath        : String;
	ErrMsg        : String;
	UserMsg       : String;
	ErrCode       : Integer;
	UserName      : String;
	Password      : String;
    DlgResult     : Integer;
	TmpStrList    : TStringList;
	ErrFileName   : String;
	IBEscriptName : String;
begin
  try
    try
        //Получаем результирующий файл обновления
        mnuMergeScripts.OnClick(Sender);

        //Тестируем результирующий файл обновления
        if UpdFileExist
        then begin
            mnuOnlyTestClick( Sender );
        end;

    except
        LogException( ExtractFilePath( Application.ExeName ) + sLOG_FILE_NAME );
        Raise;
    end;
  except
      on E: Exception
      do begin
          MessageBox( Handle, PChar( sErrorTextExt + e.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
      end;
  end;
end;

//Переименовываем помеченные файлы скриптов
procedure TfmMain.btnRenameClick(Sender: TObject);
var
    i, n            : Integer;
    ErrMsg          : String;
    Scripts         : TStringList;
    CanRename       : Boolean;
    ScriptPath      : String;
    SelectedRec     : String;
    OldFileName     : String;
    NewFileName     : String;
    RenameParams    : TRenameParams;
    RenameFileCount : Integer;
    IsRenameSuccess : Boolean;
begin
  try
    try
        if not dstMain.IsEmpty AND ( SelectedRecCount > 0 )
        then begin
            //Получаем путь к хранилищу файлов скриптов
            ScriptPath := Trim( edtScriptPath.Text );

            if not DirectoryExists( ScriptPath )
            then begin
				MessageBox( Handle, PChar( cScrDirNotFound[Ord( UsrFileType )] ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
                edtScriptPath.SetFocus;
                Exit;
            end;

            SetDirEndDelimiter( ScriptPath );

            //Получаем ключевое выражение, соответствующее выбранному проекту
            RenameParams.KeyExpr := GetKeyExpr( cbxProjects.Text );

            if RenameParams.KeyExpr = sEMPTY_STR
            then begin
                MessageBox( Handle, PChar( sFatalError ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
                Exit;
            end;

            //Проверяем главную часть порядкового номера обновления
			if Trim( edtUpdNumberMajor.Text ) = sEMPTY_STR
            then begin
				MessageBox( Handle, PChar( sScrSetIsEmpty1 + cRenameInvalid[Ord( UsrFileType )] + sUpdateNumberInvalid ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
				edtUpdNumberMajor.SetFocus;
                Exit;
            end
            else begin
				RenameParams.UpdateNumMajor := edtUpdNumberMajor.IntValue;
            end;

            //Проверяем дополнительную часть порядкового номера обновления
			if Trim( edtUpdNumberMinor.Text ) = sEMPTY_STR
            then begin
				MessageBox( Handle, PChar( sScrSetIsEmpty1 + cRenameInvalid[Ord( UsrFileType )] + sUpdateNumberInvalid ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
				edtUpdNumberMinor.SetFocus;
                Exit;
            end
            else begin
				RenameParams.UpdateNumMinor := edtUpdNumberMinor.IntValue;
            end;

            //Проверяем дату создания обновления
            if Trim( edtDateCreate.Text ) = sEMPTY_STR
            then begin
				MessageBox( Handle, PChar( sScrSetIsEmpty1 + cRenameInvalid[Ord( UsrFileType )] + sUpdateDateCreateInvalid ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
                edtDateCreate.SetFocus;
                Exit;
            end
            else begin
                RenameParams.DateCreate := edtDateCreate.Date;
            end;

            //Выставляем режим переименования
            RenameParams.RenameMode := rmRename;

            try
                RenameFileCount := 0;
                IsRenameSuccess := True;
                SelectedRec := dstMain.FieldByName(sSCRIPT_NAME_FN).AsString;
                n := dstMain.RecordCount - 1;
                tvwMain.BeginUpdate;
                dstMain.DisableControls;
                dstMain.First;

                for i := 0 to n
                do begin

                    //Проверяем помечен ли текущий файл скрипта
                    if dstMain.FieldByName(sIS_ACTIVE_FN).AsBoolean
                    then begin
                        OldFileName := ScriptPath + dstMain.FieldByName(sSCRIPT_NAME_FN).AsString;

                        //Проверяем: не был ли удалён выбранный файл в процессе переименования файлов
                        if FileExists( OldFileName )
                        then begin
                            //Получаем новое имя скрипта
                            NewFileName := sEMPTY_STR;
                            CanRename   := RenameScript( ExtractFileName( OldFileName ), NewFileName, RenameParams );

                            if CanRename
                            then begin
                                NewFileName := ScriptPath + NewFileName;

                                //Переименовываем файл скрипта
                                if RenameFile( OldFileName, NewFileName )
                                then begin
                                    NewFileName := ExtractFileName( NewFileName );
                                    OldFileName := ExtractFileName( OldFileName );

                                    //Обновляем соответствующую запись в НД
                                    if dstMain.Locate( sSCRIPT_NAME_FN, OldFileName, [] )
                                    then begin
                                        dstMain.Edit;
                                        dstMain.FieldByName(sSCRIPT_NAME_FN).AsString := NewFileName;
                                        dstMain.Post;

                                        //Актуализируем информацию для позиционирования
                                        if OldFileName = SelectedRec
                                        then
                                            SelectedRec := NewFileName;
                                    end;

                                    Inc( RenameFileCount );
                                end
                                else begin
                                    IsRenameSuccess := False;
                                end;

                            end;

                        end
                        else begin
                            IsRenameSuccess := False;
                        end;

                    end;

                    dstMain.Next;
                end;

            finally
                dstMain.Locate( sSCRIPT_NAME_FN, SelectedRec, [] );
                dstMain.EnableControls;
                tvwMain.EndUpdate;

                //Оповещаем пользователя о результатах переименования
                if IsRenameSuccess
                then begin
                    if RenameFileCount = 0
                    then
						MessageBox( Handle, PChar( cCanNotRename[Ord( UsrFileType )] ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING )
                    else
                        MessageBox( Handle, PChar( IntToStr( RenameFileCount ) + sRenameFilesSuccessful  ), PChar( sMsgCaptionInf ), MB_OK or MB_ICONINFORMATION );
                end
                else
                    MessageBox( Handle, PChar( sRenameFilesError1 + IntToStr( RenameFileCount ) + sRenameFilesError2 + IntToStr( SelectedRecCount ) + sRenameFilesError3 ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
            end;

        end
        else begin
            if dstMain.IsEmpty
            then
				ErrMsg := cScrSetIsEmpty3[Ord( UsrFileType )]
			else
				ErrMsg := cScrSetIsEmpty2[Ord( UsrFileType )];

			 ErrMsg := sScrSetIsEmpty1 + cRenameInvalid[Ord( UsrFileType )] + ErrMsg;
             MessageBox( Handle, PChar( ErrMsg ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
        end;
    except
        LogException( ExtractFilePath( Application.ExeName ) + sLOG_FILE_NAME );
        Raise;
    end;
  except
      on E: Exception
      do begin
          MessageBox( Handle, PChar( sErrorTextExt + e.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
      end;
  end;

end;

//Формируем новое множество скриптов в соответствии с изменёнными критериями фильтрации
procedure TfmMain.btnFilterClick(Sender: TObject);
var
    i, n          : Integer;
	Path          : String;
	ErrMsg        : String;
	KeyExpr       : String;
	LoadResult    : TLoadScrResult;
	ScriptNames   : TUsrStringList;
	FilterParams  : TFilterParams;
	CurrFileName  : String;
	MaxUpdNumber  : TUpdateNumInfo;
	CurrMaxUpdNum : TUpdateNumInfo;
	TmpLoadResult : TLoadScrResult;
begin
  try
	try
		//Удаляем завершающий слеш для организации корректной проверки пути к скриптам
		Path := Trim( edtScriptPath.Text );
		DelDirEndDelimiter( Path );

		//Проверяем путь к скриптам
		if not DirectoryExists( Path )
		then begin
			MessageBox( Handle, PChar( cScrDirNotFound[Ord( UsrFileType )] ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
			edtScriptPath.Properties.OnButtonClick( nil, -1 );
		end;

		//Формируем путь к скриптам с учётом завершающего слеша
		Path := Trim( edtScriptPath.Text );
		SetDirEndDelimiter( Path );
		FilterParams.ScriptPath := Path;

		//Получаем ключевое выражение, соответствующее выбранному проекту
		KeyExpr := GetKeyExpr( cbxProjects.Text );

		if KeyExpr = sEMPTY_STR
		then begin
			MessageBox( Handle, PChar( sFatalError ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
			Exit;
		end
		else begin
			FilterParams.KeyExpr := KeyExpr;
		end;

		//Проверяем главную часть порядкового номера обновления
		if Trim( edtFtrUpdNumMajor.Text ) = sEMPTY_STR
		then begin
			MessageBox( Handle, PChar( sScrSetIsEmpty1 + cFilterInvalid[Ord( UsrFileType )] + sUpdateNumberInvalid ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
			edtFtrUpdNumMajor.SetFocus;
			Exit;
		end
		else begin
			FilterParams.UpdateNumMajor := edtFtrUpdNumMajor.IntValue;
		end;

		//Проверяем дополнительную часть порядкового номера обновления
		if Trim( edtFtrUpdNumMinor.Text ) = sEMPTY_STR
		then begin
			MessageBox( Handle, PChar( sScrSetIsEmpty1 + cFilterInvalid[Ord( UsrFileType )] + sUpdateNumberInvalid ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
			edtFtrUpdNumMinor.SetFocus;
			Exit;
		end
		else begin
			FilterParams.UpdateNumMinor := edtFtrUpdNumMinor.IntValue;
		end;

		//Получаем нижнюю границу периода создания скриптов
		if cbxDateBeg.Checked
		then begin
			FilterParams.DateBeg := edtDateBeg.Text;
		end
		else begin
			FilterParams.DateBeg := sEMPTY_STR;
		end;

		//Получаем верхнюю границу периода создания скриптов
		if cbxDateEnd.Checked
		then begin
			FilterParams.DateEnd := edtDateEnd.Text;
		end
		else begin
			FilterParams.DateEnd := sEMPTY_STR;
		end;

		//Пытаемся загрузить скрипты
		try
			ScriptNames := TUsrStringList.Create;
			ScriptNames.Sorted := cDEF_CAN_SORT;
			ScriptNames.CaseSensitive := cDEF_CASE_SENSITIVE;

			case UsrFileType of

			  ftScripts : begin
							FilterParams.ScriptPath := Path + sSCRIPTS_MASK;
							MaxUpdNumber.UpdateNumMajor := cZERO;
							MaxUpdNumber.UpdateNumMinor := cDEF_UPDATE_NUMBER;
							LoadResult:= LoadScripts( FilterParams, ScriptNames, MaxUpdNumber );
						  end;

			  ftModules : begin
							LoadResult                   := lrModulesInvalid;
							MaxUpdNumber.UpdateNumMajor  := cZERO;
							MaxUpdNumber.UpdateNumMinor  := cDEF_UPDATE_NUMBER;
							CurrMaxUpdNum.UpdateNumMajor := cZERO;
							CurrMaxUpdNum.UpdateNumMinor := cDEF_UPDATE_NUMBER;
							n := High( cArchiveExt );

							//Пытаемся загрузить любые архивы, содержащие модули
							for i := Low( cArchiveExt ) to n
							do begin

								FilterParams.ScriptPath := Path + cArchiveExt[i];
								TmpLoadResult := LoadScripts( FilterParams, ScriptNames, CurrMaxUpdNum );

								case TmpLoadResult of

								  lrLoadSuccess   : begin
													  LoadResult := lrLoadSuccess;

													  if MaxUpdNumber.UpdateNumMajor < CurrMaxUpdNum.UpdateNumMajor
													  then
														  MaxUpdNumber.UpdateNumMajor := CurrMaxUpdNum.UpdateNumMajor;

													  if MaxUpdNumber.UpdateNumMinor < CurrMaxUpdNum.UpdateNumMinor
													  then
														  MaxUpdNumber.UpdateNumMinor := CurrMaxUpdNum.UpdateNumMinor;
													end;
								end;

							end;

						  end;
			end;

			//Анализируем результат загрузки скриптов
			case LoadResult of

			  lrLoadSuccess    : begin
								   edtUpdNumberMajor.Value := MaxUpdNumber.UpdateNumMajor;
								   edtUpdNumberMinor.Value := MaxUpdNumber.UpdateNumMinor + 1;
								   CurrFileName := dstMain.FieldByName(sSCRIPT_NAME_FN).AsString;
                                   try
                                       tvwMain.DataController.BeginUpdate;
                                       FillDataset( dstMain, ScriptNames, FSelectedRecCount, fmAppend );
                                       tvwMain.DataController.UpdateData;
                                   finally
                                       tvwMain.DataController.EndUpdate;
                                   end;

								   //Позиционируемся на активной до инвертирования записи
								   tvwMain.DataController.BeginLocate;

								   if not dstMain.Locate( sSCRIPT_NAME_FN, CurrFileName, [] )
								   then
									   tvwMain.DataController.GotoFirst;
								   tvwMain.DataController.EndLocate;

								 end;

			  lrScrNotFound    : begin
								   MessageBox( Handle, PChar( cScrLoadFailed[Ord( UsrFileType )] ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
								 end;

			  lrFilterInvalid,
			  lrModulesInvalid : begin
								   if dstMain.Active
								   then
									   dstMain.Close;

								   SetSelectedRecCount( 0 );
								   tvwMain.DataController.Summary.FooterSummaryValues[cmnIsActive.Index] := SelectedRecCount;
								   tvwMain.DataController.Summary.FooterSummaryValues[cmnFileSize.Index] := cZERO;

								   if LoadResult = lrFilterInvalid
								   then begin
									   ErrMsg := cScrFilterInvalid[Ord( UsrFileType )];
								   end
								   else begin
									   ErrMsg := sModulesInvalid;
								   end;

								   MessageBox( Handle, PChar( ErrMsg ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
								 end;
			end;

		finally
			if ScriptNames <> nil then FreeAndNil( ScriptNames );
		end;

	except
		LogException( ExtractFilePath( Application.ExeName ) + sLOG_FILE_NAME );
		Raise;
	end;
  except
	  on E: Exception
	  do begin
		  MessageBox( Handle, PChar( sErrorTextExt + e.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
	  end;
  end;
end;

//Копируем помеченные файлы
procedure TfmMain.btnCopyClick(Sender: TObject);
var
    i, n          : Integer;
    ErrMsg        : String;
    CopyPath      : String;
    DlgResult     : Integer;
    ScriptPath    : String;
    SelectedRec   : String;
    CopyFileName  : String;
    CurrFileName  : String;
    CopyFileCount : Integer;
    IsCopySuccess : Boolean;
begin
  try
    try
        if not dstMain.IsEmpty AND ( SelectedRecCount > 0 )
        then begin
            //Получаем путь к хранилищу файлов скриптов
            ScriptPath := Trim( edtScriptPath.Text );

            if not DirectoryExists( ScriptPath )
            then begin
				MessageBox( Handle, PChar( cScrDirNotFound[Ord( UsrFileType )] ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
                edtScriptPath.SetFocus;
                Exit;
            end;

            SetDirEndDelimiter( ScriptPath );

            //Получаем путь для копирования файлов скриптов
{            if bdlgMain.Execute
            then
              }begin{
                CopyPath := bdlgMain.Path;

                if not DirectoryExists( CopyPath )
                then begin
                    MessageBox( Handle, PChar( sPathInvalid ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
                    Exit;
                end;
}
                BrowseFolderDlg1.BrowseDialog('Выберите каталог для копирования', CopyPath);
                SetDirEndDelimiter( CopyPath );
                bdlgMain.Path := '';

                try
                    CopyFileCount := 0;
                    IsCopySuccess := True;
                    SelectedRec := dstMain.FieldByName(sSCRIPT_NAME_FN).AsString;
                    n := dstMain.RecordCount - 1;
                    dstMain.DisableControls;
                    dstMain.First;

                    for i := 0 to n
                    do begin

                        //Проверяем помечен ли текущий файл скрипта
                        if dstMain.FieldByName(sIS_ACTIVE_FN).AsBoolean
                        then begin
                            CopyFileName := ScriptPath + dstMain.FieldByName(sSCRIPT_NAME_FN).AsString;

                            //Проверяем: не был ли удалён выбранный файл в процессе копирования файлов
                            if FileExists( CopyFileName )
                            then begin
                                CurrFileName := CopyPath + dstMain.FieldByName(sSCRIPT_NAME_FN).AsString;
                                DlgResult    := cDEF_DLG_RESULT;

                                //Проверяем: существует ли уже файл, чье имя совпадает с копируемым
                                if FileExists( CurrFileName )
                                then begin
                                    DlgResult := MessageBox( Handle, PChar( sFileAlreadyExists1 + CurrFileName + sFileAlreadyExists2 ), PChar( sMsgCaptionQst ), MB_YESNOCANCEL or MB_ICONQUESTION );
                                end;

                                //Получаем режим работы с файлом
                                case DlgResult of

                                  ID_YES          : begin
                                                      //Удаляем существующий файл скрипта
                                                      if not DeleteFile( CurrFileName )
                                                      then begin
                                                          MessageBox( Handle, PChar( sFileAlreadyExists1 + CurrFileName + sFileCannotBeDeleted ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
                                                          IsCopySuccess := False;
                                                          dstMain.Next;
                                                          Continue;
                                                      end;

                                                      CopyFile( CopyFileName, CurrFileName, nil );
                                                      Inc( CopyFileCount );
                                                    end;

                                  ID_CANCEL       : begin
                                                      Exit;
                                                    end;

                                  cDEF_DLG_RESULT : begin
                                                      CopyFile( CopyFileName, CurrFileName, nil );
                                                      Inc( CopyFileCount );
                                                    end;
                                end;

                            end
                            else begin
                                IsCopySuccess := False;
                            end;

                        end;

                        dstMain.Next;
                    end;

                finally
                    dstMain.Locate( sSCRIPT_NAME_FN, SelectedRec, [] );
                    dstMain.EnableControls;

                    //Оповещаем пользователя о результатах копирования
                    if IsCopySuccess
                    then begin
                        if DlgResult = ID_CANCEL
                        then
                            MessageBox( Handle, PChar( sCopyAbort ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING )
                        else
                            MessageBox( Handle, PChar( IntToStr( CopyFileCount ) + sCopyFilesSuccessful ), PChar( sMsgCaptionInf ), MB_OK or MB_ICONINFORMATION );
                    end
                    else
                        MessageBox( Handle, PChar( sCopyFilesError1 + IntToStr( CopyFileCount ) + sCopyFilesError2 + IntToStr( SelectedRecCount ) + sCopyFilesError3 ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
                end;

            end;

        end
        else begin
            if dstMain.IsEmpty
            then
				ErrMsg := cScrSetIsEmpty3[Ord( UsrFileType )]
			else
				ErrMsg := cScrSetIsEmpty2[Ord( UsrFileType )];

			 ErrMsg := sScrSetIsEmpty1 + cCopyInvalid[Ord( UsrFileType )] + ErrMsg;
             MessageBox( Handle, PChar( ErrMsg ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
        end;
    except
        LogException( ExtractFilePath( Application.ExeName ) + sLOG_FILE_NAME );
        Raise;
    end;
  except
      on E: Exception
      do begin
          MessageBox( Handle, PChar( sErrorTextExt + e.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
      end;
  end;
end;

//Выделяем все записи
procedure TfmMain.btnSelectAllClick(Sender: TObject);
var
    ScrName : String;
begin
  try
    try
        if not dstMain.IsEmpty
        then begin
            //Проверяем количество не помеченых записей
            if SelectedRecCount <> dstMain.RecordCount
            then begin
                ScrName := dstMain.FieldByName(sSCRIPT_NAME_FN).AsString;
                tvwMain.DataController.BeginUpdate;
                SelectedRecCount := SelectRecords( dstMain, smSelectAll );
                tvwMain.DataController.EndUpdate;

                //Позиционируемся на активной до инвертирования записи
                tvwMain.DataController.BeginLocate;
                dstMain.Locate( sSCRIPT_NAME_FN, ScrName, [] );
                tvwMain.DataController.EndLocate;
            end;
        end
        else begin
			 MessageBox( Handle, PChar( sScrSetIsEmpty1 + sSelectAllInvalid + cScrSetIsEmpty3[Ord( UsrFileType )] ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
        end;
    except
        LogException( ExtractFilePath( Application.ExeName ) + sLOG_FILE_NAME );
        Raise;
    end;
  except
      on E: Exception
      do begin
          MessageBox( Handle, PChar( sErrorTextExt + e.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
      end;
  end;
end;

//Снимаем выделение для всех записей
procedure TfmMain.btnUnselectAllClick(Sender: TObject);
var
    ScrName : String;
begin
  try
    try
        if not dstMain.IsEmpty
        then begin
            //Проверяем количество помеченых записей
            if SelectedRecCount <> 0
            then begin
                ScrName := dstMain.FieldByName(sSCRIPT_NAME_FN).AsString;
                tvwMain.DataController.BeginUpdate;
                SelectedRecCount := SelectRecords( dstMain, smUnSelectAll );
                tvwMain.DataController.EndUpdate;

                //Позиционируемся на активной до инвертирования записи
                tvwMain.DataController.BeginLocate;
                dstMain.Locate( sSCRIPT_NAME_FN, ScrName, [] );
                tvwMain.DataController.EndLocate;
            end;
        end
        else begin
			 MessageBox( Handle, PChar( sScrSetIsEmpty1 + sUnSelectAllInvalid + cScrSetIsEmpty3[Ord( UsrFileType )] ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
        end;
    except
        LogException( ExtractFilePath( Application.ExeName ) + sLOG_FILE_NAME );
        Raise;
    end;
  except
      on E: Exception
      do begin
          MessageBox( Handle, PChar( sErrorTextExt + e.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
      end;
  end;
end;

//Инвертируем выделение
procedure TfmMain.btnInvertClick(Sender: TObject);
var
    ScrName : String;
begin
  try
	try
		if not dstMain.IsEmpty
		then begin
			ScrName := dstMain.FieldByName(sSCRIPT_NAME_FN).AsString;
			tvwMain.DataController.BeginUpdate;
			SelectedRecCount := SelectRecords( dstMain, smInvert );
			tvwMain.DataController.EndUpdate;

			//Позиционируемся на активной до инвертирования записи
			tvwMain.DataController.BeginLocate;
			dstMain.Locate( sSCRIPT_NAME_FN, ScrName, [] );
			tvwMain.DataController.EndLocate;
		end
		else begin
			 MessageBox( Handle, PChar( sScrSetIsEmpty1 + sInvertInvalid + cScrSetIsEmpty3[Ord( UsrFileType )] ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
		end;
	except
		LogException( ExtractFilePath( Application.ExeName ) + sLOG_FILE_NAME );
		Raise;
	end

  except
	  on E: Exception
	  do begin
		  MessageBox( Handle, PChar( sErrorTextExt + e.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
	  end;
  end;
end;

//Получаем путь к хранилищу скриптов
procedure TfmMain.edtScriptPathPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var s: string;
begin
  if DirectoryExists( Trim( edtScriptPath.Text ) )
  then begin
	  bdlgMain.Path := Trim( edtScriptPath.Text );
  end;

{  if bdlgMain.Execute
  then begin
	  edtScriptPath.Text := bdlgMain.Path;
	  bdlgMain.Path := '';
  end;}
  if BrowseFolderDlg1.BrowseDialog('Выберите папку со скриптами', s)
    Then edtScriptPath.Text := s;


end;

//Помечаем(снимаем пометку) для выбранной пользователем записи
procedure TfmMain.tvwMainCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin

    //Помечаем(снимаем пометку) для выбранной пользователем записи
    if ( ACellViewInfo.Item.Name = cmnIsActive.Name ) and ( AButton = mbLeft )
    then begin
        aHandled := False;
        dstMain.Edit;

        if dstMain.FieldByName(sIS_ACTIVE_FN).AsBoolean
        then begin
            dstMain.FieldByName(sIS_ACTIVE_FN).AsBoolean := False;
            SelectedRecCount := SelectedRecCount - 1;
        end
        else begin
            dstMain.FieldByName(sIS_ACTIVE_FN).AsBoolean := True;
            SelectedRecCount := SelectedRecCount + 1;
        end;

        dstMain.Post;
        aHandled := True;
    end;

end;

//Показываем количество помеченных записей в "итоговой" строке
procedure TfmMain.tvwMainDataControllerSummaryFooterSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
var
	i, n         : Integer;
	TotalSize    : Extended;
	SelectedSize : Extended;
begin

   //Вычисляем кол-во отобранных файлов
   if Arguments.SummaryItem.Index = cmnIsActive.Index
   then begin
	   OutArguments.SummaryValue := SelectedRecCount;
   end;

   //Вычисляем размер всех и отобранных файлов
   if Arguments.SummaryItem.Index = cmnFileSize.Index
   then begin

	   TotalSize    := 0;
	   SelectedSize := 0;

	   with tvwMain.DataController
	   do begin
		   n := RecordCount - 1;

		   for i := 0 to n
		   do begin
			   TotalSize :=	 TotalSize + Values[ i, cmnFileSize.Index ];

			   if Values[ i, cmnIsActive.Index ]
			   then
				   SelectedSize := SelectedSize + Values[ i, cmnFileSize.Index ];
		   end;
	   end;

	   OutArguments.SummaryValue := FormatFloat( sFMT_SEL_FILES_SIZE, SelectedSize ) + sSPACE + sSEPARATOR_FOLDER_UNX + sSPACE + FormatFloat( sFMT_ALL_FILES_SIZE, TotalSize );
   end;

end;

//Активируем(деактивируем) поле ввода для задания нижней границы даты создания скриптов
procedure TfmMain.cbxDateBegClick(Sender: TObject);
begin
  if cbxDateBeg.Checked
  then begin
	  edtDateBeg.ReadOnly := False;
	  edtDateBeg.SetFocus;
	  SetFocusedControl( grMain.Controller.Control );
  end
  else begin
	  edtDateBeg.ReadOnly := True;
	  grMain.Controller.Control.SetFocus;
  end;
end;

//Активируем(деактивируем) поле ввода для задания верхней границы даты создания скриптов
procedure TfmMain.cbxDateEndClick(Sender: TObject);
begin
  if cbxDateEnd.Checked
  then begin
	  edtDateEnd.ReadOnly := False;
	  edtDateEnd.SetFocus;
	  SetFocusedControl( grMain.Controller.Control );
  end
  else begin
	  edtDateEnd.ReadOnly := True;
	  grMain.Controller.Control.SetFocus;
  end;
end;

//Помечаем(снимаем пометку) для выбранной пользователем записи
procedure TfmMain.tvwMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

    //Помечаем(снимаем пометку) для выбранной пользователем записи
    if not dstMain.IsEmpty AND ( Key = VK_SPACE )
    then begin
        dstMain.Edit;

        if dstMain.FieldByName(sIS_ACTIVE_FN).AsBoolean
        then begin
            dstMain.FieldByName(sIS_ACTIVE_FN).AsBoolean := False;
            SelectedRecCount := SelectedRecCount - 1;
        end
        else begin
            dstMain.FieldByName(sIS_ACTIVE_FN).AsBoolean := True;
            SelectedRecCount := SelectedRecCount + 1;
        end;

        dstMain.Post;
    end;


end;

//Разименовываем помеченные файлы скриптов
procedure TfmMain.btnUnRenameClick(Sender: TObject);
var
    i, n              : Integer;
    ErrMsg            : String;
    Scripts           : TStringList;
    ScriptPath        : String;
    CanUnRename       : Boolean;
    SelectedRec       : String;
    OldFileName       : String;
    NewFileName       : String;
    RenameParams      : TRenameParams;
    UnRenameFileCount : Integer;
    IsUnRenameSuccess : Boolean;
begin
  try
    try
        if not dstMain.IsEmpty AND ( SelectedRecCount > 0 )
        then begin
            //Получаем путь к хранилищу файлов скриптов
            ScriptPath := Trim( edtScriptPath.Text );

            if not DirectoryExists( ScriptPath )
            then begin
				MessageBox( Handle, PChar( cScrDirNotFound[Ord( UsrFileType )] ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
                edtScriptPath.SetFocus;
                Exit;
            end;

            SetDirEndDelimiter( ScriptPath );

            //Получаем ключевое выражение, соответствующее выбранному проекту
            RenameParams.KeyExpr := GetKeyExpr( cbxProjects.Text );

            if RenameParams.KeyExpr = sEMPTY_STR
            then begin
                MessageBox( Handle, PChar( sFatalError ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
                Exit;
            end;

            //Проверяем главную часть порядкового номера обновления
			if Trim( edtUpdNumberMajor.Text ) = sEMPTY_STR
			then begin
				MessageBox( Handle, PChar( sScrSetIsEmpty1 + cUnRenameInvalid[Ord( UsrFileType )] + sUpdateNumberInvalid ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
				edtUpdNumberMajor.SetFocus;
                Exit;
            end
            else begin
				RenameParams.UpdateNumMajor := edtUpdNumberMajor.IntValue;
            end;

            //Проверяем дополнительную часть порядкового номера обновления
			if Trim( edtUpdNumberMinor.Text ) = sEMPTY_STR
			then begin
				MessageBox( Handle, PChar( sScrSetIsEmpty1 + cUnRenameInvalid[Ord( UsrFileType )] + sUpdateNumberInvalid ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
				edtUpdNumberMinor.SetFocus;
                Exit;
            end
            else begin
				RenameParams.UpdateNumMinor := edtUpdNumberMinor.IntValue;
            end;

            //Проверяем дату создания обновления
            if Trim( edtDateCreate.Text ) = sEMPTY_STR
            then begin
				MessageBox( Handle, PChar( sScrSetIsEmpty1 + cUnRenameInvalid[Ord( UsrFileType )] + sUpdateDateCreateInvalid ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
                edtDateCreate.SetFocus;
                Exit;
            end
            else begin
                RenameParams.DateCreate := edtDateCreate.Date;
            end;

            //Выставляем режим разименования
            RenameParams.RenameMode := rmUnRename;

            try
                UnRenameFileCount := 0;
                IsUnRenameSuccess := True;
                SelectedRec := dstMain.FieldByName(sSCRIPT_NAME_FN).AsString;
                n := dstMain.RecordCount - 1;
                tvwMain.BeginUpdate;
                dstMain.DisableControls;
                dstMain.First;

                for i := 0 to n
                do begin

                    //Проверяем помечен ли текущий файл скрипта
                    if dstMain.FieldByName(sIS_ACTIVE_FN).AsBoolean
                    then begin
                        OldFileName := ScriptPath + dstMain.FieldByName(sSCRIPT_NAME_FN).AsString;

                        //Проверяем: не был ли удалён выбранный файл в процессе переименования файлов
                        if FileExists( OldFileName )
                        then begin
                            //Получаем новое имя скрипта
                            NewFileName := sEMPTY_STR;
                            CanUnRename := RenameScript( ExtractFileName( OldFileName ), NewFileName, RenameParams );

                            if CanUnRename
                            then begin
                                NewFileName := ScriptPath + NewFileName;

                                //Переименовываем файл скрипта
                                if RenameFile( OldFileName, NewFileName )
                                then begin
                                    NewFileName := ExtractFileName( NewFileName );
                                    OldFileName := ExtractFileName( OldFileName );

                                    //Обновляем соответствующую запись в НД
                                    if dstMain.Locate( sSCRIPT_NAME_FN, OldFileName, [] )
                                    then begin
                                        dstMain.Edit;
                                        dstMain.FieldByName(sSCRIPT_NAME_FN).AsString := NewFileName;
                                        dstMain.Post;

                                        //Актуализируем информацию для позиционирования
                                        if OldFileName = SelectedRec
                                        then
                                            SelectedRec := NewFileName;
                                    end;

                                    Inc( UnRenameFileCount );
                                end
                                else begin
                                    IsUnRenameSuccess := False;
                                end;

                            end;

                        end
                        else begin
                            IsUnRenameSuccess := False;
                        end;

                    end;

                    dstMain.Next;
                end;

            finally
                dstMain.Locate( sSCRIPT_NAME_FN, SelectedRec, [] );
                dstMain.EnableControls;
                tvwMain.EndUpdate;

                //Оповещаем пользователя о результатах переименования
                if IsUnRenameSuccess
                then begin
                    if UnRenameFileCount = 0
                    then
						MessageBox( Handle, PChar( cCanNotUnRename[Ord( UsrFileType )] ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING )
                    else
                        MessageBox( Handle, PChar( IntToStr( UnRenameFileCount ) + sUnRenameFilesSuccessful  ), PChar( sMsgCaptionInf ), MB_OK or MB_ICONINFORMATION );
                end
                else
                    MessageBox( Handle, PChar( sUnRenameFilesError1 + IntToStr( UnRenameFileCount ) + sUnRenameFilesError2 + IntToStr( SelectedRecCount ) + sUnRenameFilesError3 ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
            end;

        end
        else begin
            if dstMain.IsEmpty
            then
				ErrMsg := cScrSetIsEmpty3[Ord( UsrFileType )]
			else
				ErrMsg := cScrSetIsEmpty2[Ord( UsrFileType )];

			 ErrMsg := sScrSetIsEmpty1 + cUnRenameInvalid[Ord( UsrFileType )] + ErrMsg;
             MessageBox( Handle, PChar( ErrMsg ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
        end;
    except
        LogException( ExtractFilePath( Application.ExeName ) + sLOG_FILE_NAME );
        Raise;
    end;
  except
      on E: Exception
      do begin
          MessageBox( Handle, PChar( sErrorTextExt + e.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
      end;
  end;

end;

//Передаём фокус ввода следующему елементу управления
procedure TfmMain.edtServerNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN
  then begin
	  edtLogin.SetFocus;
  end;
end;

//Передаём фокус ввода следующему елементу управления
procedure TfmMain.edtLoginKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN
  then begin
	  edtPassword.SetFocus;
  end;
end;

//Передаём фокус ввода следующему елементу управления
procedure TfmMain.edtPasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN
  then begin
	  edtDBPath.SetFocus;
  end;
end;

//Передаём фокус ввода следующему елементу управления
procedure TfmMain.edtDBPathKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN
  then begin
	  btnTestConnect.SetFocus;
  end;
end;

//Запрещаем передачу фокуса ввода при нажатии клавиши "Tab"
procedure TfmMain.SplitterAfterClose(Sender: TObject);
begin
  edtServerName.TabStop  := False;
  edtLogin.TabStop       := False;
  edtPassword.TabStop    := False;
  edtDBPath.TabStop      := False;
  btnTestConnect.TabStop := False;
end;

//Разрешаем передачу фокуса ввода при нажатии клавиши "Tab"
procedure TfmMain.SplitterAfterOpen(Sender: TObject);
begin
  edtServerName.TabStop  := True;
  edtLogin.TabStop       := True;
  edtPassword.TabStop    := True;
  edtDBPath.TabStop      := True;
  btnTestConnect.TabStop := True;
end;

//Получаем путь к файлу БД для тестирования обновления
procedure TfmMain.edtDBPathPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  dlgDBPath.Filter     := sDEF_DB_FILTER;
  dlgDBPath.FileName   := sEMPTY_STR;
  dlgDBPath.DefaultExt := sDEF_DB_EXT;

  if dlgDBPath.Execute
  then begin
      edtDBPath.Text := Trim( dlgDBPath.FileName );
  end;
end;

//Проверяем параметры соединения
procedure TfmMain.btnTestConnectClick(Sender: TObject);
var
    DBPath    : String;
    ErrMsg    : String;
    UserMsg   : String;
    ErrCode   : Integer;
    UserName  : String;
    Password  : String;
begin
    try
        try
            //Получаем параметры соединения
            DBPath   := Trim( edtServerName.Text ) + sDBL_POINT;
            DBPath   := DBPath + Trim( edtDBPath.Text );
            UserName := Trim( edtLogin.Text    );
            Password := Trim( edtPassword.Text );

            //Проверяем параметры соединения
            TestConnection( dbTestConnect, DBPath, UserName, Password, ErrMsg, ErrCode );

            //Оповещаем пользователя о результатах проверки
            case ErrCode of

              -1        : begin
                            MessageBox( Handle, PChar( sConnectOK ), PChar( sMsgCaptionInf ), MB_OK or MB_ICONINFORMATION );
                          end;
              else begin
                  MessageBox( Handle, PChar( sConnectErr ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
              end;

            end;

        except
            //Протоколируем ИС
            LogException( ExtractFilePath( Application.ExeName ) + sLOG_FILE_NAME );
			Raise;
		end;
	except
		on E: Exception
		do
			MessageBox( Handle, PChar( sErrorTextExt + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR )
	end;
end;

//Очищаем набор данных при изменении критериев фильтрации
procedure TfmMain.cbxProjectsChange(Sender: TObject);
begin
    tvwMain.BeginUpdate;
    dstMain.Close;
    tvwMain.EndUpdate;
    edtUpdNumberMajor.Text := sZERO;
    edtUpdNumberMinor.Text := sZERO;
    SetSelectedRecCount( 0 );
    tvwMain.DataController.Summary.FooterSummaryValues[cmnIsActive.Index] := SelectedRecCount;
    tvwMain.DataController.Summary.FooterSummaryValues[cmnFileSize.Index] := cZERO;
end;

//Сохраняем имя сервера в списке недавно введенных значений
procedure TfmMain.edtServerNamePropertiesChange(Sender: TObject);
begin
	TcxMRUEdit( Sender ).ValidateEdit( False );
end;

//Запоминаем тип файлов, над которыми будут выполняться действия
procedure TfmMain.rgrFileTypeClick(Sender: TObject);
begin
  case rgrFileType.ItemIndex of

	0 : begin
		  SetUsrFileType( ftScripts );
		  btnBuild.Visible  := ivAlways;
		  pmnuBuild.Visible := True;
		end;

	1 : begin
		  SetUsrFileType( ftModules );
		  btnBuild.Visible  := ivNever;
		  pmnuBuild.Visible := False;
		end;
  end;

  stbMain.Panels.BeginUpdate;
  stbMain.Panels[0].Text := cDescriptionPath[Ord( UsrFileType )];
  stbMain.Panels.EndUpdate;
  SetFocusedControl( grMain.Controller.Control );

end;

//Выичсляем максимальный номер обновления
procedure TfmMain.btnCalcMaxUpdateNumClick(Sender: TObject);
var
	i, n             : Integer;
	KeyExpr          : String;
	FilePath         : String;
	ArrFileExt       : TStrArray;
	MaxUpdNumber     : TUpdateNumInfo;
	MaxUpdNumParams  : TMaxUpdNumParams;
	CurrMaxUpdNumber : TUpdateNumInfo;
begin
	try
		try
			FilePath := Trim( edtScriptPath.Text );
			SetDirEndDelimiter( FilePath );

			//Проверяем путь к скриптам
			if not DirectoryExists( FilePath )
			then begin
				MessageBox( Handle, PChar( cScrDirNotFound[Ord( UsrFileType )] ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
				Exit;
			end;

			//Получаем ключевое выражение, соответствующее выбранному проекту
			KeyExpr := GetKeyExpr( cbxProjects.Text );

			if KeyExpr = sEMPTY_STR
			then begin
				MessageBox( Handle, PChar( sFatalError ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
				Exit;
			end
			else begin
				MaxUpdNumParams.KeyExpr := KeyExpr;
			end;

			try
				//Получаем массив, содержащий маски файлов для поиска
				case UsrFileType of

				  ftScripts : begin
								n := High( cScriptExt );
								SetLength( ArrFileExt, n );
								ArrFileExt := @cScriptExt;
							  end;

				  ftModules : begin
								n := High( cArchiveExt );
								SetLength( ArrFileExt, n );
								ArrFileExt := @cArchiveExt;
							  end;
				end;

				//Инициализируем переменные
				with MaxUpdNumber
				do begin
					UpdateNumMajor := cZERO;
					UpdateNumMinor := cZERO;
				end;

				with CurrMaxUpdNumber
				do begin
					UpdateNumMajor := cZERO;
					UpdateNumMinor := cZERO;
				end;

				//Вычисляем максимальный номер обновления
				for i := 0 to n
				do begin
					MaxUpdNumParams.FilePath := FilePath + ArrFileExt[i];
					CurrMaxUpdNumber := GetMaxUpdNumber( MaxUpdNumParams );

					if MaxUpdNumber.UpdateNumMajor < CurrMaxUpdNumber.UpdateNumMajor
					then begin
						MaxUpdNumber.UpdateNumMajor := CurrMaxUpdNumber.UpdateNumMajor;
					end;

					if MaxUpdNumber.UpdateNumMinor < CurrMaxUpdNumber.UpdateNumMinor
					then begin
						MaxUpdNumber.UpdateNumMinor := CurrMaxUpdNumber.UpdateNumMinor;
					end;
				end;

				edtUpdNumberMajor.IntValue := MaxUpdNumber.UpdateNumMajor;
				edtUpdNumberMinor.IntValue := MaxUpdNumber.UpdateNumMinor + 1;

			finally
				if ArrFileExt <> nil
				then begin
					Finalize( ArrFileExt );
					ArrFileExt := nil;
				end;
			end;

		except
			//Протоколируем ИС
			LogException( ExtractFilePath( Application.ExeName ) + sLOG_FILE_NAME );
			Raise;
		end;
	except
		on E: Exception
		do
			MessageBox( Handle, PChar( sErrorTextExt + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR )
	end;
end;

//Запоминаем введённое пользователем значение
procedure TfmMain.edtUpdNumberMajorButtonClick(Sender: TdxBarSpinEdit;
  Button: TdxBarSpinEditButton);
begin
	Sender.Value := Sender.CurValue;
end;

//Запоминаем введённое пользователем значение
procedure TfmMain.edtFtrUpdNumMajorButtonClick(Sender: TdxBarSpinEdit;
  Button: TdxBarSpinEditButton);
begin
	Sender.Value := Sender.CurValue;
end;

//Показываем метку, указывающую пользователю как загрузить файлы
procedure TfmMain.dstMainAfterClose(DataSet: TDataSet);
begin
	lblDescription.Visible := True;
end;

//Скрываем метку, указывающую пользователю как загрузить файлы
procedure TfmMain.dstMainAfterOpen(DataSet: TDataSet);
begin
	lblDescription.Visible := False;
end;

//Выполняем только тестирование файла обновления
procedure TfmMain.mnuOnlyTestClick(Sender: TObject);
var
	DBPath         : String;
	ErrMsg         : String;
	UserMsg        : String;
	ErrCode        : Integer;
	UserName       : String;
	Password       : String;
	DlgResult      : Integer;
	TmpStrList     : TStringList;
	ErrFileName    : String;
	IBEscriptName  : String;
	UpdateFilePath : String;
begin
  try
	try
		//Проверяем путь к программе применения скриптов
		if not FileExists( IBEscriptPath )
		then begin
			dlgDBPath.Filter     := sDEF_EXE_FILTER;
			dlgDBPath.FileName   := sDEF_IBESCRIPT_PATH;
			dlgDBPath.DefaultExt := sDEF_EXE_EXT;

			//Предоставляем пользователю возможность самому указать путь к программе применения скриптов
			if not dlgDBPath.Execute OR ( ExtractFileName( dlgDBPath.FileName ) <> sSCRIPT_EXECUTER_NAME )
			then begin
				MessageBox( Handle, PChar( sErrorUpdateTest + sInvalidIBEscriptPath ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
				Exit;
			end
			else begin
				SetIBEscriptPath( Trim( dlgDBPath.FileName ) );
			end;

		end;

		//Получаем параметры соединения
		DBPath   := Trim( edtServerName.Text ) + sDBL_POINT;
		DBPath   := DBPath + Trim( edtDBPath.Text );
		UserName := Trim( edtLogin.Text    );
		Password := Trim( edtPassword.Text );

		//Проверяем параметры соединения
		TestConnection( dbTestConnect, DBPath, UserName, Password, ErrMsg, ErrCode );

		if ErrCode <> -1
		then begin
			MessageBox( Handle, PChar( sConnectErr ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
			Exit;
		end;

		//Получаем путь к файлу, который подлежит тестированию
		if ( TComponent( Sender ).Name = mnuOnlyTest.Name ) OR ( TComponent( Sender ).Name = smnuOnlyTest.Name )
		then begin
			dlgDBPath.Filter     := sDEF_SQL_FILTER;
			dlgDBPath.FileName   := sEMPTY_STR;
			dlgDBPath.DefaultExt := sSCRIPTS_MASK;

			//Предоставляем пользователю возможность самому указать путь к файлу скрипта
			if not dlgDBPath.Execute
			then begin
				MessageBox( Handle, PChar( sErrorTestProcess ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
				Exit;
			end
			else begin
				UpdateFilePath := Trim( dlgDBPath.FileName );
			end;
		end
		else begin
			UpdateFilePath := UpdFilePath;
		end;

		ErrFileName   := ExtractFilePath( Application.ExeName ) + sUPDATE_ERRORS_FILE_NAME;
		IBEscriptName := sSCRIPT_EXECUTER_NAME_NO_EXT + sSPACE;

		fmMain.Repaint;
		fmMain.Cursor := crHourGlass;

		//Применяем скрипт с помощью утилиты IBEScript.exe
		CreateMyProcess( PAnsiChar( IBEscriptPath ), PAnsiChar( IBEscriptName + sTICKS + UpdateFilePath + sTICKS  + sCOMMAND_LINE_SCRIPT_EXEC + sTICKS + ErrFileName + sTICKS + ' -D' + sTICKS + DBPath + sTICKS + ' -P' + Password + ' -U' + UserName ), SW_HIDE );

		try
			TmpStrList := TStringList.Create;
			TmpStrList.LoadFromFile( ErrFileName );

			//Анализируем результат применения скрипта
			if Pos( sEXECUTE_SCRIPT_STR, TmpStrList.Text ) = 0
			then begin
				DlgResult := MessageBox( Handle, PChar( sErrorUpdate ), PChar( sMsgCaptionErr ), MB_YESNO or MB_ICONERROR );

				//Выгружаем файл-отчет ошибок в блокнот
				if DlgResult = ID_YES
				then begin
					ShellExecute( Handle, PChar( sEXECUTE_OPERATION ), PChar( ErrFileName ), Nil, Nil, SW_NORMAL );
				end;
			end
			else begin
				//Удаляем лог-файл для успешно примененённого скрипта
				DeleteFile( ErrFileName );
				MessageBox( Handle, PChar( sSuccessUpdate ), PChar( sMsgCaptionInf ), MB_OK or MB_ICONINFORMATION );
			end;

		finally
			if TmpStrList <> nil then FreeAndNil( TmpStrList );
			fmMain.Cursor := crDefault;
		end;

	except
		LogException( ExtractFilePath( Application.ExeName ) + sLOG_FILE_NAME );
		Raise;
	end;
  except
	  on E: Exception
	  do begin
		  MessageBox( Handle, PChar( sErrorTextExt + e.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
	  end;
  end;
end;

//Расскрашиваем неотобранные строки цветом, соответствующим неактивой строке
procedure TfmMain.tvwMainCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
//
end;

//Организуем поиск текстовой строки
procedure TfmMain.btnSearchClick(Sender: TObject);
var
	fmSearch      : TfmSearch;
	SearchResult  : Boolean;
    CurrRecValue  : String;
	vSearchParams : TPtr_SearchParams;
begin
  try
	try
		if not dstMain.IsEmpty
		then begin
			try
				fmSearch := TfmSearch.Create( Self );
				fmSearch.ShowModal;

				if fmSearch.ModalResult = mrOK
				then begin
                    CurrRecValue := dstMain.FieldByName( sSCRIPT_NAME_FN ).AsString;

					//Освобождаем не используемые ресурсы
					if SearchParams <> nil then Dispose( SearchParams );
					SearchParams := nil;

					//Получаем параметры поиска
					try
						New( vSearchParams );
						with vSearchParams^
						do begin
							TextSearch     := Trim( fmSearch.edtSearch.Text );
                            Direction      := TEnm_Direction( fmSearch.rgrDirection.ItemIndex );
							CaseSensitive  := fmSearch.cbxCaseSensitive.Checked;
							WholeWordsOnly := fmSearch.cbxWholeWords.checked;
						end;

						//Выполняем поиск
						SearchResult := FindText( dstMain, sSCRIPT_NAME_FN, vSearchParams );

						if SearchResult
						then begin
							AppMode := amSearch;
							New( FSearchParams );
							SearchParams^ := vSearchParams^;
							SearchParams^.FirstFound := dstMain.FieldByName( sSCRIPT_NAME_FN ).AsString;
						end
						else begin
							AppMode := amView;
                            dstMain.Locate( sSCRIPT_NAME_FN, CurrRecValue, [] );
							MessageBox( Handle, PChar( sSearchStrNotFound + sTICK + vSearchParams^.TextSearch + sTICK + sSPACE + sNotFound ), PChar( sMsgCaptionInf ), MB_OK or MB_ICONINFORMATION );
						end;

					finally
						if vSearchParams <> nil then Dispose( vSearchParams );
						vSearchParams := nil;
					end;

				end;

			finally
				if fmSearch <> nil then FreeAndNil( fmSearch );
			end;
		end
		else begin
			 MessageBox( Handle, PChar( sScrSetIsEmpty1 + sSearchInvalid + cSearchInvalid[Ord( UsrFileType )] ), PChar( sMsgCaptionWrn ), MB_OK or MB_ICONWARNING );
		end;
	except
		LogException( ExtractFilePath( Application.ExeName ) + sLOG_FILE_NAME );
		Raise;
	end

  except
	  on E: Exception
	  do begin
		  MessageBox( Handle, PChar( sErrorTextExt + e.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
	  end;
  end;
end;

//Обрабатываем горячие клавиши
procedure TfmMain.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
var
    CurrRecValue : String;
	SearchResult : Boolean;
begin
  case Msg.CharCode of

	VK_F3     : begin
				  if AppMode = amSearch
				  then begin
                      CurrRecValue := dstMain.FieldByName( sSCRIPT_NAME_FN ).AsString;

					  //Выполняем поиск
					  SearchResult := FindText( dstMain, sSCRIPT_NAME_FN, SearchParams );

					  if not SearchResult
						 OR  ( dstMain.FieldByName( sSCRIPT_NAME_FN ).AsString = SearchParams^.FirstFound )
					  then begin
						AppMode := amView;
                        dstMain.Locate( sSCRIPT_NAME_FN, CurrRecValue, [] );
						MessageBox( Handle, PChar( sSearchStrNotFound + sTICK + SearchParams^.TextSearch + sTICK + sSPACE + sNotFound ), PChar( sMsgCaptionInf ), MB_OK or MB_ICONINFORMATION );

						//Освобождаем не используемые ресурсы
						if SearchParams <> nil then Dispose( SearchParams );
						SearchParams := nil;

						Exit;
					  end;

					  Handled := True;
				  end;
				end;

	VK_ESCAPE : begin
				  btnExit.Click;
				  Handled := True;
				end;
  end;
end;

procedure TfmMain.grMainDblClick(Sender: TObject);
begin
//   s := ScriptsPathEdit.Text + lbScripts.Items.Strings[lbScripts.ItemIndex];
//  ShellExecute(0, 'open', 'notepad.exe', PAnsiChar(s), nil, SW_SHOW);
end;

end.
