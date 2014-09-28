unit uGetKorDetails;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uGetKorDetails                                                             *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Расшифровка корреспонденции по счету в разрезе смет, разделов статей и т.д.*
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxLookAndFeelPainters, cxGraphics,
  cxCustomData, cxStyles, cxTL, DB, FIBDataSet, pFIBDataSet, cxControls,
  cxInplaceContainer, cxTLData, cxDBTL, cxButtons, cxMaskEdit,
  FIBDatabase, pFIBDatabase, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxGridBandedTableView, cxGridDBBandedTableView, uneLibrary, uneTypes;

type

  TfmGetKorDetails = class(TForm, IneCallExpMethod)

    btnExit                : TcxButton;
    pnlForButtons          : TPanel;

    dbWork                 : TpFIBDatabase;
    trRead                 : TpFIBTransaction;
    trWrite                : TpFIBTransaction;
    dsrWork                : TDataSource;
    dstWork                : TpFIBDataSet;

    gdWork                 : TcxGrid;
    lvlWork                : TcxGridLevel;
    tvwWork                : TcxGridDBBandedTableView;

    srpWork                : TcxStyleRepository;

    cxsHeader              : TcxStyle;
    cxsFooter              : TcxStyle;
    cxsContent             : TcxStyle;
    cxHotTrack             : TcxStyle;
    cxsInactive            : TcxStyle;
    cxsSelection           : TcxStyle;
    cxsIndicator           : TcxStyle;
    cxBackground           : TcxStyle;
    cxsContentOdd          : TcxStyle;
    cxsGroupByBox          : TcxStyle;
    cxsContentEvent        : TcxStyle;
    cxsColumnHeader        : TcxStyle;
    cxsColumnHeaderClassic : TcxStyle;

    cmnSUMMA               : TcxGridDBBandedColumn;
    cmnSMET_NUM            : TcxGridDBBandedColumn;
    cmnRAZD_NUM            : TcxGridDBBandedColumn;
    cmnSTAT_NUM            : TcxGridDBBandedColumn;
    cmnKEKV_NUM            : TcxGridDBBandedColumn;
    cmnSMET_NAME           : TcxGridDBBandedColumn;
    cmnRAZD_NAME           : TcxGridDBBandedColumn;
    cmnSTAT_NAME           : TcxGridDBBandedColumn;
    cmnKEKV_NAME           : TcxGridDBBandedColumn;
    cmnGR_SMET_NUM         : TcxGridDBBandedColumn;
    cmnGR_SMET_NAME        : TcxGridDBBandedColumn;
    pnlToolBar: TPanel;
    rgrTypeKor: TRadioGroup;
    btnDetails: TcxButton;

    procedure FormShortCut        (var Msg: TWMKey; var Handled: Boolean);
	procedure rgrTypeKorClick     (Sender: TObject);

	procedure btnDetailsClick     (Sender: TObject);
  private
	FKorParams       : TRec_KorParams;
	FKorParamsInfo   : TRec_KorParamsInfo;
	FResultExpMethod : TneGetExpMethod;
	function  GetKorParams    : TRec_KorParams;
	function  GetKorParamsInfo: TRec_KorParamsInfo;
	procedure SetKorParams( aValue: TRec_KorParams );
	procedure SetKorParamsInfo( aValue: TRec_KorParamsInfo);
  public
	constructor Create( const aDBFMParams: TRec_DBFMParams; const aKorParams: TRec_KorParams ); reintroduce;
	property pKorParams       : TRec_KorParams     read GetKorParams     write SetKorParams;
	property pKorParamsInfo   : TRec_KorParamsInfo read GetKorParamsInfo write SetKorParamsInfo;
	property pResultExpMethod : TneGetExpMethod    read FResultExpMethod implements IneCallExpMethod;
  end;

  procedure GetKorDetails( const aDBFMParams: TRec_DBFMParams; const aKorParams: TRec_KorParams ); stdcall;

  exports
	GetKorDetails;

implementation

resourcestring

	sFN_ID_SCH = 'OUT_ID_SCH';

{$R *.dfm}

function TfmGetKorDetails.GetKorParams: TRec_KorParams;
begin
  Result := FKorParams;
end;

function TfmGetKorDetails.GetKorParamsInfo: TRec_KorParamsInfo;
begin
  Result := FKorParamsInfo
end;

procedure TfmGetKorDetails.SetKorParams(aValue: TRec_KorParams);
begin
  FKorParams := aValue;
end;

procedure TfmGetKorDetails.SetKorParamsInfo(aValue: TRec_KorParamsInfo);
begin
  FKorParamsInfo := aValue;
end;

procedure GetKorDetails( const aDBFMParams: TRec_DBFMParams; const aKorParams: TRec_KorParams );
var
	fmGetKorDetails : TfmGetKorDetails;
begin
  try
	fmGetKorDetails := TfmGetKorDetails.Create( aDBFMParams, aKorParams );
	fmGetKorDetails.ShowModal;
  finally
	FreeAndNil( fmGetKorDetails );
  end;
end;

{ TfmKorrespondent }
constructor TfmGetKorDetails.Create(const aDBFMParams: TRec_DBFMParams; const aKorParams: TRec_KorParams);
begin
	try
		inherited Create( aDBFMParams.Owner );
		dbWork.Handle := aDBFMParams.DBHandle;
		trRead.StartTransaction;

		FKorParams := aKorParams;
		rgrTypeKor.OnClick := nil;
		rgrTypeKor.ItemIndex := Integer( pKorParams.IsKorrespondKR );
		rgrTypeKor.OnClick := rgrTypeKorClick;
		Caption := Caption + FKorParams.SchName;

		//Инициализируем параметры корреспонденции значениями по умолчанию
		with FKorParamsInfo
		do begin
			ModRes          := mrNone;
			GrSmet.Checked  := True;
			GrSmet.TypeInfo := kpNumber;
			Smet.Checked    := True;
			Smet.TypeInfo   := kpNumber;
			Razd.Checked    := True;
			Razd.TypeInfo   := kpNumber;
			Stat.Checked    := True;
			Stat.TypeInfo   := kpNumber;
			Kekv.Checked    := True;
			Kekv.TypeInfo   := kpNumber;
		end;

		if dstWork.Active then dstWork.Close;
		dstWork.SQLs.SelectSQL.Text := 'SELECT * ' +
									   'FROM   JO5_GET_KORRESPOND_BY_SCH (' + IntToStr( rgrTypeKor.ItemIndex ) + cSEMICOLON + IntToStr( pKorParams.IdSch ) + cSEMICOLON + cTICK + DateToStr( pKorParams.CurrPeriod ) + cTICK + cBRAKET_CL + cSPACE +
									   'WHERE ' + sFN_ID_SCH + cSPACE + cEQUAL + cSPACE + IntToStr( pKorParams.IdKorSch );

		dstWork.Open;
	except
		on E: Exception
		do begin
		  MessageBox( Handle, PChar( sErrorTextExt + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
		end;
	end;
end;

//Закрываем окно при нажатии "Escape"
procedure TfmGetKorDetails.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
	case Msg.CharCode of

	  VK_ESCAPE : begin
					btnExit.Click;
				  end;
	end;
end;

//Получаем корреспонденцию по счету
procedure TfmGetKorDetails.rgrTypeKorClick(Sender: TObject);
begin
	with pKorParams
	do begin
		if dstWork.Active then dstWork.Close;
		dstWork.SQLs.SelectSQL.Text := 'SELECT * ' +
									   'FROM JO5_GET_KORRESPOND_BY_SCH (' + IntToStr( rgrTypeKor.ItemIndex ) + cSEMICOLON + IntToStr( IdSch ) + cSEMICOLON + cTICK + DateToStr( CurrPeriod ) + cTICK + cBRAKET_CL + cSPACE +
									   'WHERE ' + sFN_ID_SCH + cSPACE + cEQUAL + cSPACE + IntToStr( pKorParams.IdKorSch );
		gdWork.BeginUpdate;
		dstWork.Open;
		gdWork.EndUpdate;
		gdWork.SetFocus;
	end;
end;

//Получаем корреспонденцию в разрезе смет разделов, статей и т.д.
procedure TfmGetKorDetails.btnDetailsClick(Sender: TObject);
var
	i, n        : Integer;
	vModRes     : TModalResult;
	vMTDParams  : TPtr_MTDParams;
	vBPLParams  : TPtr_BPLParams;
	PartSQLText : String;
begin
  try
	try
		New( vBPLParams );
		vBPLParams^.MethodName  := sMN_SetKorParams;
		vBPLParams^.PackageName := ExtractFilePath( Application.ExeName ) + 'JO5\JO5_SetKorParams7.bpl';

		New( vMTDParams );
		with vMTDParams^
		do begin
		  FMParams.Owner := Self;
		  FMParams.Style := fsModal;
		  KorParamsInfo  := pKorParamsInfo;
		end;

		FResultExpMethod := TneGetExpMethod.Create( Self, vBPLParams, vMTDParams );
		vModRes := TRec_KorParamsInfo( pResultExpMethod.pResult^ ).ModRes;

		if vModRes = mrOK
		then begin
			//Очищаем панель группировки
			tvwWork.DataController.Groups.ClearGrouping;

			pKorParamsInfo := TRec_KorParamsInfo( pResultExpMethod.pResult^ );
			PartSQLText := '';

			with pKorParamsInfo
			do begin
				//Получаем информацию для групп смет
				if grSmet.Checked
				then begin
					if Boolean( Ord( grSmet.TypeInfo ) )
					then begin
						PartSQLText := ', OUT_GR_SMET_NAME';
						cmnGR_SMET_NUM.Visible  := False;
						cmnGR_SMET_NAME.Visible := True;
					end
					else begin
						PartSQLText := ', OUT_GR_SMET_NUM';
						cmnGR_SMET_NUM.Visible  := True;
						cmnGR_SMET_NAME.Visible := False;
					end;
				end
				else begin
					cmnGR_SMET_NUM.Visible  := False;
					cmnGR_SMET_NAME.Visible := False;
				end;

				//Получаем информацию для смет
				if Smet.Checked
				then begin
					if Boolean( Ord( Smet.TypeInfo ) )
					then begin
						PartSQLText := PartSQLText + ', OUT_SMET_NAME';
						cmnSMET_NUM.Visible  := False;
						cmnSMET_NAME.Visible := True;
					end
					else begin
						PartSQLText := PartSQLText + ', OUT_SMET_NUM';
						cmnSMET_NUM.Visible  := True;
						cmnSMET_NAME.Visible := False;
					end;
				end
				else begin
					cmnSMET_NUM.Visible  := False;
					cmnSMET_NAME.Visible := False;
				end;

				//Получаем информацию для разделов
				if Razd.Checked
				then begin
					if Boolean( Ord( Razd.TypeInfo ) )
					then begin
						PartSQLText := PartSQLText + ', OUT_RAZD_NAME';
						cmnRAZD_NUM.Visible  := False;
						cmnRAZD_NAME.Visible := True;
					end
					else begin
						PartSQLText := PartSQLText + ', OUT_RAZD_NUM';
						cmnRAZD_NUM.Visible  := True;
						cmnRAZD_NAME.Visible := False;
					end;
				end
				else begin
					cmnRAZD_NUM.Visible  := False;
					cmnRAZD_NAME.Visible := False;
				end;

				//Получаем информацию для статей
				if Stat.Checked
				then begin
					if Boolean( Ord( Stat.TypeInfo ) )
					then begin
						PartSQLText := PartSQLText + ', OUT_STAT_NAME';
						cmnSTAT_NUM.Visible  := False;
						cmnSTAT_NAME.Visible := True;
					end
					else begin
						PartSQLText := PartSQLText + ', OUT_STAT_NUM';
						cmnSTAT_NUM.Visible  := True;
						cmnSTAT_NAME.Visible := False;
					end;
				end
				else begin
					cmnSTAT_NUM.Visible  := False;
					cmnSTAT_NAME.Visible := False;
				end;

				//Получаем информацию для КЕКВов
				if Kekv.Checked
				then begin
					if Boolean( Ord( Kekv.TypeInfo ) )
					then begin
						PartSQLText := PartSQLText + ', OUT_KEKV_NAME';
						cmnKEKV_NUM.Visible  := False;
						cmnKEKV_NAME.Visible := True;
					end
					else begin
						PartSQLText := PartSQLText + ', OUT_KEKV_NUM';
						cmnKEKV_NUM.Visible  := True;
						cmnKEKV_NAME.Visible := False;
					end;
				end
				else begin
					cmnKEKV_NUM.Visible  := False;
					cmnKEKV_NAME.Visible := False;
				end;

			end;

			//Формируем результирующий SQL-запрос
			if dstWork.Active then dstWork.Close;
			Delete( PartSQLText, 1, 1 );
			dstWork.SQLs.SelectSQL.Text := 'SELECT    SUM(OUT_SUMMA) AS OUT_SUMMA,' + PartSQLText + cSPACE +
										   'FROM      JO5_GET_KORRESPOND_BY_SCH(' + IntToStr( rgrTypeKor.ItemIndex ) + cSEMICOLON + IntToStr( pKorParams.IdSch ) + cSEMICOLON + cTICK + DateToStr( pKorParams.CurrPeriod ) + cTICK + cBRAKET_CL + cSPACE +
										   'WHERE '   + sFN_ID_SCH + cSPACE + cEQUAL + cSPACE + IntToStr( pKorParams.IdKorSch ) + cSPACE +
										   'GROUP BY' + PartSQLText;
			dstWork.Open;

		end;

		gdWork.SetFocus;

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
  except
      on E: Exception
      do begin
          MessageBox( Handle, PChar( sErrorTextExt + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
      end;
  end;
end;

end.
