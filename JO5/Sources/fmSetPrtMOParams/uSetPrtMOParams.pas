unit uSetPrtMOParams;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uSetPrtMOParams                                                            *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Диалог выбора параметров печати мемориального ордера.                      *
*                                                                              *
* Copyright  ©  Год 2006,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  DB, RxMemDS, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ImgList, dxBar,
  dxBarExtItems, cxContainer, cxLabel, Menus, FIBDataSet, pFIBDataSet,
  cxGridBandedTableView, cxGridDBBandedTableView, cxCheckBox, IBase,
  frxClass, cxTextEdit, frxDBSet, cxLookAndFeelPainters, StdCtrls,
  cxButtons, frxExportPDF, frxExportImage, frxExportRTF, frxExportXML,
  frxExportXLS, frxExportHTML, frxExportTXT;

type

  //Перечисляемый тип для организации функции мультивыбора
  TSelectionMode = (  smSelectAll, smUnSelectAll, smInvert );

  //Запись для хранения параметров загрузки модуля
  TRec_InputParams = record
      Owner         : TComponent;
	  DBHandle      : TISC_DB_HANDLE;
      ReportPath    : String;
      PeriodDateBeg : TDate;
      PeriodDateEnd : TDate;
  end;
  
  TfmSetPrtMOParams = class( TForm )
  
    imlToolBar              : TImageList;
    imlPopupMenu            : TImageList;

    btnOK                   : TcxButton;
    btnCancel               : TcxButton;

    dsrWork                 : TDataSource;
    dstWork                 : TRxMemoryData;

    dbWork                  : TpFIBDatabase;
    dstBuffer               : TpFIBDataSet;
    trRead                  : TpFIBTransaction;
    trWrite                 : TpFIBTransaction;
    spcWork                 : TpFIBStoredProc;

    pnlForButtons           : TPanel;

    lblDescription          : TcxLabel;

    brmWork                 : TdxBarManager;

    srpWork                 : TcxStyleRepository;

    cxsHeader               : TcxStyle;
    cxsFooter               : TcxStyle;
    cxHotTrack              : TcxStyle;
    cxsContent              : TcxStyle;
    cxsInactive             : TcxStyle;
    cxsIndicator            : TcxStyle;
    cxsSelection            : TcxStyle;
    cxBackground            : TcxStyle;
    cxsGroupByBox           : TcxStyle;
    cxsContentOdd           : TcxStyle;
    cxsContentEven          : TcxStyle;
    cxsColumnHeader         : TcxStyle;
    cxsColumnHeaderClassic  : TcxStyle;

    btnInvert               : TdxBarLargeButton;
    btnRefresh              : TdxBarLargeButton;
    btnSelectAll            : TdxBarLargeButton;
    btnUnSelectAll          : TdxBarLargeButton;

    edtYearBeg              : TdxBarSpinEdit;
    edtYearEnd              : TdxBarSpinEdit;
    edtMonthBeg             : TdxBarCombo;
    edtMonthEnd             : TdxBarCombo;

    pmnuWork                : TPopupMenu;
    pmnuInvert              : TMenuItem;
    pmnuRefresh             : TMenuItem;
    pmnuDelimiter           : TMenuItem;
    pmnuSelectAll           : TMenuItem;
    pmnuUnSelectAll         : TMenuItem;

    fnID_PKV                : TLargeintField;
    fnCHECKED               : TBooleanField;
    fnMO_CHAR               : TStringField;
    fnPKV_CODE              : TStringField;
    fnPKV_NAME              : TStringField;
    fnID_TYPE_FINANCE       : TLargeintField;
    fnTYPE_FINANCE_CODE     : TIntegerField;
    fnTYPE_FINANCE_NAME     : TStringField;

    gdWork                  : TcxGrid;
    lvlWork                 : TcxGridLevel;
    tvwWork                 : TcxGridDBBandedTableView;

    cmnID_PKV               : TcxGridDBBandedColumn;
    cmnCHECKED              : TcxGridDBBandedColumn;
    cmnMO_CHAR              : TcxGridDBBandedColumn;
    cmnPKV_CODE             : TcxGridDBBandedColumn;
    cmnPKV_NAME             : TcxGridDBBandedColumn;
    cmnID_TYPE_FINANCE      : TcxGridDBBandedColumn;
    cmnTYPE_FINANCE_CODE    : TcxGridDBBandedColumn;
    cmnTYPE_FINANCE_NAME    : TcxGridDBBandedColumn;
    frdsWork                : TfrxDBDataset;
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

    procedure FormShortCut                                          (var Msg: TWMKey; var Handled: Boolean);

    procedure edtMonthBegChange                                     (Sender: TObject);
    procedure edtYearBegButtonClick                                 (Sender: TdxBarSpinEdit;Button: TdxBarSpinEditButton);
    
    procedure btnInvertClick                                        (Sender: TObject);
    procedure btnRefreshClick                                       (Sender: TObject);
    procedure btnSelectAllClick                                     (Sender: TObject);
    procedure btnUnSelectAllClick                                   (Sender: TObject);

    procedure dstWorkAfterOpen                                      (DataSet: TDataSet);
    procedure dstWorkAfterClose                                     (DataSet: TDataSet);

    procedure tvwWorkKeyDown                                        (Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure tvwWorkCellClick                                      (Sender: TcxCustomGridTableView;ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;AShift: TShiftState; var AHandled: Boolean);
    procedure tvwWorkDataControllerSummaryFooterSummaryItemsSummary (ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;var OutArguments: TcxSummaryEventOutArguments);

    procedure btnOKClick                                            (Sender: TObject);
    procedure frrWorkGetValue                                       (const VarName: String; var Value: Variant);

  private
	  FReportPath       : String;
	  FSelectedRecCount : Integer;

      function  GetReportPath       : String;
	  function  GetSelectedRecCount : Integer;
	  procedure SetSelectedRecCount ( aValue: Integer );

      function  LoadFromBuffer : Boolean;
      procedure SelectRecords( const aSelectionMode: TSelectionMode );
  public
      constructor Create( aInputParams: TRec_InputParams ); reintroduce;

      property pReportPath       : String  read GetReportPath;
	  property pSelectedRecCount : Integer read GetSelectedRecCount write SetSelectedRecCount;
  end;

    procedure SetPrtMOParamsExt( aInputParams: TRec_InputParams ); stdcall;

    exports
        SetPrtMOParamsExt;
    
implementation

uses DateUtils;

const

	{*****************************************}
    {   *** Константы общего назначения ***   }
    {*****************************************}

    cZERO                = 0;
    cTICK                = '''';
    cSEMICOLON           = ',';
    cBRACKET_OPEN        = '(';
    cBRACKET_CLOSE       = ')'; 
    cDEF_REPORT_PATH     = 'Reports\JO5\JO5_PRT_MO.fr3';
    cDEF_KEY_FIELD_NAMES = 'OUT_ID_PKV;OUT_ID_TYPE_FINANCE';

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

    //Названия полей НД
    sID_PKV_FN              = 'OUT_ID_PKV';
	sCHECKED_FN             = 'CHECKED';
	sMO_CHAR_FN             = 'OUT_MO_CHAR';
    sPKV_CODE_FN            = 'OUT_PKV_CODE';
    sPKV_NAME_FN            = 'OUT_PKV_NAME';
    sKEY_SESSION_FN         = 'OUT_KEY_SESSION';
    sID_TYPE_FINANCE_FN     = 'OUT_ID_TYPE_FINANCE';
    sTYPE_FINANCE_CODE_FN   = 'OUT_TYPE_FINANCE_CODE';
    sTYPE_FINANCE_NAME_FN   = 'OUT_TYPE_FINANCE_NAME';

    //Составляющие SQL-запросов          
    sSQL_SEL_MOData     = 'SELECT * FROM JO5_GET_DATA_FOR_PRT_MO(';
    sSQL_SEL_MOParams   = 'SELECT * FROM JO5_GET_MO_PARAMS(';
    sSQL_SEL_KeySession = 'SELECT * FROM JO5_GET_KEY_SESSION(1)';

    //Сообщения об ошибках
    sERR_InvertUA               = ' інвертувати вибір,';
    sERR_EmptyDSUA              = 'оскільки записи взагалі відсутні';
    sERR_SelectAllUA            = ' вибрати всі записи,';
    sERR_NoAbilityUA            = 'Неможливо';
    sERR_UnSelectAllUA          = ' зняти вибір для всіх записів,';
	sERR_ReportCreateUA         = 'Помилка формування звітньої форми: ';
	sERR_LoadToBufferUA         = 'Помилка завантаження даних до буфера: ';
	sERR_InvalidPeriodUA        = 'Для вказаного періоду параметри меморіального ордеру відсутні.'#13'Спробуйте вказати інший період та натисніть "Оновити".';
    sERR_NoSelectedRecUA        = 'Неможливо сформувати звіт, оскільки'#13'не обрано жодного параметру!';
	sERR_ReportNotFoundUA       = 'Неможливо сформувати звіт, оскільки'#13'не вдалось знайти файл звітної форми!';
	sERR_LoadFromBufferUA       = 'Помилка завантаження даних із буфера: ';
	sERR_InvalidBordersPeriodUA = 'Не вірно вказано границі періоду!';

    //Названия локальных переменных отчета
    sFRN_DateBeg = 'DateBeg';
    sFRN_DateEnd = 'DateEnd';
 
{$R *.dfm}

function TfmSetPrtMOParams.GetSelectedRecCount: Integer;
begin
  Result := FSelectedRecCount;
end;

function TfmSetPrtMOParams.GetReportPath: String;
begin
  Result := FReportPath;
end;

procedure TfmSetPrtMOParams.SetSelectedRecCount(aValue: Integer);
begin
  FSelectedRecCount := aValue;
end;

function TfmSetPrtMOParams.LoadFromBuffer: Boolean;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	LoadFromBuffer                                                             *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
* Перекачивает записи из одного НД в другой.                                   *
*                                                                              *
* RESULT: Boolean                                                              *
*                                                                              *
*        Если загрузка ВСЕХ записей прошла успешно, тогда True. Иначе - False. *
*                                                                              *
*******************************************************************************}
var
    i, n : Integer;
begin
    try
        n := dstBuffer.RecordCount - 1;
        
        try
            dstBuffer.DisableControls;
            dstBuffer.First;

            if dstWork.Active then dstWork.Close;
            dstWork.DisableControls;
            dstWork.Open;

            for i := 0 to n
            do begin
                dstWork.Append;                                           
                dstWork.FieldByName( sMO_CHAR_FN           ).AsString  := dstBuffer.FBN( sMO_CHAR_FN           ).AsString;
                dstWork.FieldByName( sID_PKV_FN            ).AsBCD     := dstBuffer.FBN( sID_PKV_FN            ).AsBCD;
                dstWork.FieldByName( sPKV_CODE_FN          ).AsString  := dstBuffer.FBN( sPKV_CODE_FN          ).AsString;
                dstWork.FieldByName( sPKV_NAME_FN          ).AsString  := dstBuffer.FBN( sPKV_NAME_FN          ).AsString;
                dstWork.FieldByName( sID_TYPE_FINANCE_FN   ).AsBCD     := dstBuffer.FBN( sID_TYPE_FINANCE_FN   ).AsBCD;
                dstWork.FieldByName( sTYPE_FINANCE_CODE_FN ).AsInteger := dstBuffer.FBN( sTYPE_FINANCE_CODE_FN ).AsInteger;
                dstWork.FieldByName( sTYPE_FINANCE_NAME_FN ).AsString  := dstBuffer.FBN( sTYPE_FINANCE_NAME_FN ).AsString;
                dstWork.Post;
                dstBuffer.Next;
            end;
            
            dstWork.First;
            Result := True;
            
        finally
            dstWork.EnableControls;
            dstBuffer.EnableControls;
        end;
    except
        on E: Exception
        do begin
            Result := False;
            if dstWork.Active then dstWork.Close;
            MessageBox( Handle, PChar( sERR_LoadFromBufferUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

procedure TfmSetPrtMOParams.SelectRecords(const aSelectionMode: TSelectionMode);

{*******************************************************************************
*                                                                              *
* Название процедуры :                                                         *
*                                                                              *
*	SelectRecords                                                              *
*                                                                              *
* Назначение процедуры :                                                       *
*                                                                              *
* Помечает множество записей из набора данных в зависимости от типа режима.    *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aSelectionMode - режим выбора множества записей.                        *
*                                                                              *
*******************************************************************************}
var
    i, n  : Integer;
begin
    n := dstWork.RecordCount - 1;
    SetSelectedRecCount(cZERO);

    try
        dstWork.DisableControls;
        dstWork.First;

        case aSelectionMode of

          smInvert      : begin
                              for i := 0 to n
                              do begin
                                  dstWork.Edit;
                                  if dstWork.FieldByName(sCHECKED_FN).AsBoolean
                                  then begin
                                      dstWork.FieldByName(sCHECKED_FN).AsBoolean := False;
                                  end
                                  else begin
                                      dstWork.FieldByName(sCHECKED_FN).AsBoolean := True;
                                      Inc( FSelectedRecCount );
                                  end;
                                  dstWork.Post;
                                  dstWork.Next;
                              end;
                          end;


          smSelectAll   : begin
                              SetSelectedRecCount( n + 1 );

                              for i := 0 to n
                              do begin
                                  dstWork.Edit;
                                  dstWork.FieldByName(sCHECKED_FN).AsBoolean := True;
                                  dstWork.Post;
                                  dstWork.Next;
                              end;
                          end;

          smUnSelectAll : begin
                              for i := 0 to n
                              do begin
                                  dstWork.Edit;
                                  dstWork.FieldByName(sCHECKED_FN).AsBoolean := False;
                                  dstWork.Post;
                                  dstWork.Next;
                              end;
                          end;
        end;
        
    finally
        dstWork.EnableControls;
    end;
    
end;

//Внешний интерфейс для вызова модуля печати МО
procedure SetPrtMOParamsExt( aInputParams: TRec_InputParams );
var
    fmSetPrtMOParams : TfmSetPrtMOParams;
begin
    try
        try
            fmSetPrtMOParams := TfmSetPrtMOParams.Create( aInputParams );
            fmSetPrtMOParams.ShowModal;
        finally
            if TfmSetPrtMOParams <> nil then FreeAndNil( fmSetPrtMOParams );
        end;
    except
        on E: Exception
        do begin
            MessageBox( 0, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

//Инициализируем поля класса и глобальные переменные
constructor TfmSetPrtMOParams.Create( aInputParams: TRec_InputParams );
begin
    //Инициализируем поля класса и глобальные переменные
    inherited Create( aInputParams.Owner );

    FSelectedRecCount := cZERO;

    if FileExists( aInputParams.ReportPath )
    then begin
        FReportPath := aInputParams.ReportPath;
    end
    else begin
        FReportPath := cDEF_REPORT_PATH;
    end;
    
    dbWork.Handle := aInputParams.DBHandle;
    trRead.StartTransaction;

    //Заполняем редакторы значениями по умолчанию
    edtYearBeg.CurValue      := YearOf ( aInputParams.PeriodDateBeg );
    edtYearEnd.CurValue      := YearOf ( aInputParams.PeriodDateEnd );
    edtMonthBeg.CurItemIndex := MonthOf( aInputParams.PeriodDateBeg ) - 1;
    edtMonthEnd.CurItemIndex := MonthOf( aInputParams.PeriodDateEnd ) - 1;

    //Получаем допустимое множество параметров для формирования мемориальной отчетности
    try
        if dstBuffer.Active then dstBuffer.Close;
        dstBuffer.SQLs.SelectSQL.Text := sSQL_SEL_MOParams + cTICK + DateToStr( aInputParams.PeriodDateBeg ) + cTICK + cSEMICOLON +
                                                             cTICK + DateToStr( aInputParams.PeriodDateEnd ) + cTICK + cBRACKET_CLOSE;
        try
            dstBuffer.Open;

            if not dstBuffer.IsEmpty
            then begin
                LoadFromBuffer;
            end
            else begin
                MessageBox( Handle, PChar( sERR_InvalidPeriodUA ), PChar( sMsgCaptionWrnUA ), MB_OK or MB_ICONWARNING );
                if tvwWork.Visible then tvwWork.Control.SetFocus;
            end
        finally
            dstBuffer.Close;
        end;
        
    except
        on E: Exception
        do begin
            MessageBox( Handle, PChar( sERR_LoadToBufferUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

//Обрабатываем горячие клавиши
procedure TfmSetPrtMOParams.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  case Msg.CharCode of

    VK_F10    : begin
				  btnOK.Click;
				  Handled := True;
				end;

	VK_ESCAPE : begin
				  btnCancel.Click;
				  Handled := True;
                end;
  end;
end;

//Запоминаем введённое пользователем значение
procedure TfmSetPrtMOParams.edtYearBegButtonClick(Sender: TdxBarSpinEdit;
  Button: TdxBarSpinEditButton);
begin
	Sender.Value := Sender.CurValue;
end;

//Очищаем набор данных при изменении критериев фильтрации
procedure TfmSetPrtMOParams.edtMonthBegChange(Sender: TObject);
begin
    dstWork.Close;
end;

//Выделяем все записи
procedure TfmSetPrtMOParams.btnSelectAllClick(Sender: TObject);
var
    IdPKV         : int64;
    IdTypeFinance : int64;
begin
    try
        if not dstWork.IsEmpty
        then begin
            //Проверяем количество не помеченых записей
            if pSelectedRecCount <> dstWork.RecordCount
            then begin
                try
                    tvwWork.DataController.BeginUpdate;
                    //Получаем значения для корректного позиционирования
                    IdPKV         := dstWork.FieldByName(sID_PKV_FN         ).Value;
                    IdTypeFinance := dstWork.FieldByName(sID_TYPE_FINANCE_FN).Value;
                    SelectRecords( smSelectAll );

                    //Позиционируемся на активной до инвертирования записи
                    tvwWork.DataController.BeginLocate;
                    dstWork.Locate( cDEF_KEY_FIELD_NAMES, VarArrayOf( [IdPKV, IdTypeFinance] ), [] );
                finally
                    tvwWork.DataController.EndLocate;
                    tvwWork.DataController.EndUpdate;
                end;
            end;
        end
        else begin
			MessageBox( Handle, PChar( sERR_NoAbilityUA + sERR_SelectAllUA + #13 + sERR_EmptyDSUA ), PChar( sMsgCaptionWrnUA ), MB_OK or MB_ICONWARNING );
            if tvwWork.Visible then tvwWork.Control.SetFocus;
        end;
    except
        on E: Exception
        do begin
            MessageBox( Handle, PChar( sErrorTextExtUA + e.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

//Снимаем выделение для всех записей
procedure TfmSetPrtMOParams.btnUnSelectAllClick(Sender: TObject);
var
    IdPKV         : int64;
    IdTypeFinance : int64;
begin
    try
        if not dstWork.IsEmpty
        then begin
            //Проверяем количество помеченых записей
            if pSelectedRecCount <> 0
            then begin
                try
                    tvwWork.DataController.BeginUpdate;
                    //Получаем значения для корректного позиционирования
                    IdPKV         := dstWork.FieldByName(sID_PKV_FN         ).Value;
                    IdTypeFinance := dstWork.FieldByName(sID_TYPE_FINANCE_FN).Value;
                    SelectRecords( smUnSelectAll );

                    //Позиционируемся на активной до инвертирования записи
                    tvwWork.DataController.BeginLocate;
                    dstWork.Locate( cDEF_KEY_FIELD_NAMES, VarArrayOf( [IdPKV, IdTypeFinance] ), [] );
                finally
                    tvwWork.DataController.EndUpdate;
                    tvwWork.DataController.EndLocate;
                end;
            end;
        end
        else begin
			MessageBox( Handle, PChar( sERR_NoAbilityUA + sERR_UnSelectAllUA + #13 + sERR_EmptyDSUA ), PChar( sMsgCaptionWrnUA ), MB_OK or MB_ICONWARNING );
            if tvwWork.Visible then tvwWork.Control.SetFocus;
        end;
    except
        on E: Exception
        do begin
            MessageBox( Handle, PChar( sErrorTextExtUA + e.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

//Инвертируем выделение
procedure TfmSetPrtMOParams.btnInvertClick(Sender: TObject);
var
    IdPKV         : int64;
    IdTypeFinance : int64;
begin
	try
		if not dstWork.IsEmpty
		then begin
            try
                tvwWork.DataController.BeginUpdate;
                //Получаем значения для корректного позиционирования
                IdPKV         := dstWork.FieldByName(sID_PKV_FN         ).Value;
                IdTypeFinance := dstWork.FieldByName(sID_TYPE_FINANCE_FN).Value;
                SelectRecords( smInvert );

                //Позиционируемся на активной до инвертирования записи
                tvwWork.DataController.BeginLocate;
                dstWork.Locate( cDEF_KEY_FIELD_NAMES, VarArrayOf( [IdPKV, IdTypeFinance] ), [] );
            finally
                tvwWork.DataController.EndUpdate;
                tvwWork.DataController.EndLocate;
            end;
		end
		else begin
			MessageBox( Handle, PChar( sERR_NoAbilityUA + sERR_InvertUA + #13 + sERR_EmptyDSUA ), PChar( sMsgCaptionWrnUA ), MB_OK or MB_ICONWARNING );
            if tvwWork.Visible then tvwWork.Control.SetFocus;
		end;
	except
        on E: Exception
        do begin
            MessageBox( Handle, PChar( sErrorTextExtUA + e.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
	end
end;

//Формируем новое множество параметров печати в соответствии с изменёнными критериями фильтрации
procedure TfmSetPrtMOParams.btnRefreshClick(Sender: TObject);
var
    DateBeg  : TDate;
    DateEnd  : TDate;
    YearBeg  : Integer;
    YearEnd  : Integer;
    MonthBeg : Integer;
    MonthEnd : Integer;
begin
    try
        //Получаем дату начала и окончания периода
        YearBeg  := edtYearBeg.IntCurValue;
        YearEnd  := edtYearEnd.IntCurValue;
        MonthBeg := edtMonthBeg.CurItemIndex + 1;
        MonthEnd := edtMonthEnd.CurItemIndex + 1;

        DateBeg  := StartOfAMonth( YearBeg, MonthBeg );
        DateEnd  := EndOfAMonth  ( YearEnd, MonthEnd );

        //Получаем допустимое множество параметров для формирования мемориальной отчетности
        if dstBuffer.Active then dstBuffer.Close;
        dstBuffer.SQLs.SelectSQL.Text := sSQL_SEL_MOParams + cTICK + DateToStr( DateBeg ) + cTICK + cSEMICOLON +
                                                             cTICK + DateToStr( DateEnd ) + cTICK + cBRACKET_CLOSE;
        try
            dstBuffer.Open;

            if not dstBuffer.IsEmpty
            then begin
                //Обновляем множество параметров для формирования МО
                LoadFromBuffer;
            end
            else begin
                MessageBox( Handle, PChar( sERR_InvalidPeriodUA ), PChar( sMsgCaptionInfUA ), MB_OK or MB_ICONINFORMATION );
                if tvwWork.Visible then tvwWork.Control.SetFocus;
            end
        finally
            dstBuffer.Close;
        end;
        
    except
        on E: Exception
        do begin
            MessageBox( Handle, PChar( sERR_LoadToBufferUA  + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

//Скрываем метку, указывающую пользователю как загрузить файлы
procedure TfmSetPrtMOParams.dstWorkAfterOpen(DataSet: TDataSet);
begin
    lblDescription.Visible := False;
end;

//Показываем метку, указывающую пользователю как загрузить файлы
procedure TfmSetPrtMOParams.dstWorkAfterClose(DataSet: TDataSet);
begin
	lblDescription.Visible := True;
    SetSelectedRecCount( cZERO );
    tvwWork.DataController.Summary.FooterSummaryValues[cmnCHECKED.Index] := cZERO;
    tvwWork.DataController.Summary.FooterSummaryValues[cmnMO_CHAR.Index] := cZERO;
end;

//Помечаем(снимаем пометку) для выбранной пользователем записи
procedure TfmSetPrtMOParams.tvwWorkCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
    //Помечаем(снимаем пометку) для выбранной пользователем записи
    if ( ACellViewInfo.Item.Name = cmnCHECKED.Name ) and ( AButton = mbLeft )
    then begin
        try
            aHandled := False;
            dstWork.Edit;

            if dstWork.FieldByName(sCHECKED_FN).AsBoolean
            then begin
                dstWork.FieldByName(sCHECKED_FN).AsBoolean := False;
                pSelectedRecCount := pSelectedRecCount - 1;
            end
            else begin
                dstWork.FieldByName(sCHECKED_FN).AsBoolean := True;
                pSelectedRecCount := pSelectedRecCount + 1;
            end;

            dstWork.Post;
        finally
            aHandled := True;
        end;
    end;
end;

//Помечаем(снимаем пометку) для выбранной пользователем записи
procedure TfmSetPrtMOParams.tvwWorkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    //Помечаем(снимаем пометку) для выбранной пользователем записи
    if not dstWork.IsEmpty AND ( Key = VK_SPACE )
    then begin
        dstWork.Edit;

        if dstWork.FieldByName(sCHECKED_FN).AsBoolean
        then begin
            dstWork.FieldByName(sCHECKED_FN).AsBoolean := False;
            pSelectedRecCount := pSelectedRecCount - 1;
        end
        else begin
            dstWork.FieldByName(sCHECKED_FN).AsBoolean := True;
            pSelectedRecCount := pSelectedRecCount + 1;
        end;

        dstWork.Post;
    end;
end;

//Показываем количество помеченных записей в "итоговой" строке
procedure TfmSetPrtMOParams.tvwWorkDataControllerSummaryFooterSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
begin
   //Вычисляем кол-во отобранных файлов
   if Arguments.SummaryItem.Index = cmnCHECKED.Index
   then begin
	   OutArguments.SummaryValue := pSelectedRecCount;
   end;
end;

//Формируем печатную форму мемориального ордера
procedure TfmSetPrtMOParams.btnOKClick(Sender: TObject);
var
    i, n          : Integer;
    IdPKV         : Int64;
    DateBeg       : TDate;
    DateEnd       : TDate;
    YearBeg       : Integer;
    YearEnd       : Integer;
    MonthBeg      : Integer;
    MonthEnd      : Integer;
    KeySession    : Int64;
    IdTypeFinance : Int64;
begin
    try
        //Проверяем: выбрал ли пользователь хотя бы один параметр для ормирования МО?
        if pSelectedRecCount < 1
        then begin
            ModalResult := mrNone;
            MessageBox( Handle, PChar( sERR_NoSelectedRecUA ), PChar( sMsgCaptionWrnUA ), MB_OK or MB_ICONWARNING );
            if tvwWork.Visible then tvwWork.Control.SetFocus;
            Exit;
        end;

        //Получаем дату начала и окончания периода
        YearBeg  := edtYearBeg.IntCurValue;
        YearEnd  := edtYearEnd.IntCurValue;
        MonthBeg := edtMonthBeg.CurItemIndex + 1;
        MonthEnd := edtMonthEnd.CurItemIndex + 1;

        DateBeg  := StartOfAMonth( YearBeg, MonthBeg );
        DateEnd  := EndOfAMonth  ( YearEnd, MonthEnd );

        //Проверяем: корректность границ периода?
        if DateBeg > DateEnd
        then begin
            ModalResult := mrNone;
            MessageBox( Handle, PChar( sERR_InvalidBordersPeriodUA ), PChar( sMsgCaptionWrnUA ), MB_OK or MB_ICONWARNING );
            if tvwWork.Visible then tvwWork.Control.SetFocus;
            Exit;
        end;

        //Получаем идентификатор сеанса
        try
            if dstBuffer.Active then dstBuffer.Close;
            dstBuffer.SQLs.SelectSQL.Text := sSQL_SEL_KeySession;
            dstBuffer.Open;
            
            KeySession := dstBuffer.FBN('OUT_KEY_SESSION').Value;
        finally
            dstBuffer.Close;
        end;
        
        //Заполняем буфер множеством выбранных пользователем параметров
        n             := dstWork.RecordCount - 1;
        IdPKV         := dstWork.FieldByName(sID_PKV_FN         ).Value;
        IdTypeFinance := dstWork.FieldByName(sID_TYPE_FINANCE_FN).Value;
        
        spcWork.StoredProcName := 'JO5_BUFFER_MO_INS';
        
        try
            dstWork.DisableControls;
            dstWork.First;
            trWrite.StartTransaction;
            
            for i := 0 to n
            do begin

                if dstWork.FieldByName(sCHECKED_FN).AsBoolean
                then begin
                    spcWork.ParamByName('IN_KEY_SESSION'    ).AsInt64 := KeySession;
                    spcWork.ParamByName('IN_ID_PKV'         ).AsInt64 := dstWork.FieldByName(sID_PKV_FN         ).Value;
                    spcWork.ParamByName('IN_ID_TYPE_FINANCE').AsInt64 := dstWork.FieldByName(sID_TYPE_FINANCE_FN).Value;
                    spcWork.ParamByName('IN_DATE_BEG'       ).AsDate  := DateBeg;
                    spcWork.ParamByName('IN_DATE_END'       ).AsDate  := DateEnd;
                
                    //Вставляем запись в буфер
                    spcWork.Prepare;
                    spcWork.ExecProc;
                end;
                
                dstWork.Next;
            end;
            
        finally
            trWrite.Commit;
            if spcWork.Open then spcWork.Close;
            
            dstWork.Locate( cDEF_KEY_FIELD_NAMES, VarArrayOf( [ IdPKV, IdTypeFinance ] ), [] );
            dstWork.EnableControls;
        end;

        //Получаем данные для формирования печатной формы
        try 
            if dstBuffer.Active then dstBuffer.Close;
            dstBuffer.SQLs.SelectSQL.Text := sSQL_SEL_MOData + IntToStr( KeySession ) + cBRACKET_CLOSE;

            if trRead.InTransaction 
            then begin
                trRead.Commit;
                trRead.StartTransaction;
            end;

            dstBuffer.Open;

            //Загружаем файл отчета
            if frrWork.LoadFromFile(pReportPath)
            then begin
                //Показываем шаблон файла отчёта
                frrWork.PrepareReport;
                frrWork.ShowPreparedReport;
            end
            else begin
                ModalResult := mrNone;
                MessageBox( Handle, PChar( sERR_ReportNotFoundUA ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
                if tvwWork.Visible then tvwWork.Control.SetFocus;
            end;
            
        finally
            dstBuffer.Close;
        end;

        //Очищаем буфер
        spcWork.StoredProcName := 'JO5_BUFFER_MO_DEL';
        spcWork.ParamByName('IN_KEY_SESSION').AsInt64 := KeySession;
        
        try
            trWrite.StartTransaction;
            spcWork.Prepare;
            spcWork.ExecProc;
        finally
            trWrite.Commit;
            spcWork.Close;
        end;
        
    except
        on E: Exception
        do begin
            if trWrite.InTransaction then trWrite.Commit;
            ModalResult:= mrNone;
            MessageBox( Handle, PChar( sERR_ReportCreateUA  + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

//Получаем значения для динамических переменных отчета
procedure TfmSetPrtMOParams.frrWorkGetValue(const VarName: String;
  var Value: Variant);
var
    YearBeg       : Integer;
    YearEnd       : Integer;
    MonthBeg      : Integer;
    MonthEnd      : Integer;
begin

    //Получаем дату начала периода
    if VarName = sFRN_DateBeg
    then begin
        YearBeg  := edtYearBeg.IntCurValue;
        MonthBeg := edtMonthBeg.CurItemIndex + 1;
        Value    := StartOfAMonth( YearBeg, MonthBeg );
    end;

    //Получаем дату окончания периода
    if VarName = sFRN_DateEnd
    then begin
        YearEnd  := edtYearEnd.IntCurValue;
        MonthEnd := edtMonthEnd.CurItemIndex + 1;
        Value    := DateToStr( EndOfAMonth( YearEnd, MonthEnd ) );
    end;

end;

end.

