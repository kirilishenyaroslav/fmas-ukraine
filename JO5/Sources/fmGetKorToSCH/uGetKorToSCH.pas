unit uGetKorToSCH;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uGetKorToSCH                                                               *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Отображение корреспонденции по счетам.                                     *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxLookAndFeelPainters, cxGraphics,
  cxCustomData, cxStyles, cxTL, DB, FIBDataSet, pFIBDataSet, cxControls,
  cxInplaceContainer, cxTLData, cxDBTL, cxButtons, cxMaskEdit, uneLibrary, uneTypes,
  FIBDatabase, pFIBDatabase;

type

  TfmGetKorToSCH = class(TForm, IneCallExpMethod)

	pnlToolBar             : TPanel;
	pnlForButtons          : TPanel;

	rgrTypeKorresp         : TRadioGroup;

	btnExit                : TcxButton;
    btnDetails             : TcxButton;

    trlKorresp             : TcxDBTreeList;
	dsrWork                : TDataSource;
	dstWork                : TpFIBDataSet;

	cmnOUT_SUMMA           : TcxDBTreeListColumn;
	cmnOUT_ID_SCH          : TcxDBTreeListColumn;
	cmnOUT_SCH_TITLE       : TcxDBTreeListColumn;
	cmnOUT_SCH_NUMBER      : TcxDBTreeListColumn;
	cmnOUT_ID_PARENT_SCH   : TcxDBTreeListColumn;

	dbWork                 : TpFIBDatabase;
	trRead                 : TpFIBTransaction;
	trWrite                : TpFIBTransaction;

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

	procedure FormClose           (Sender: TObject; var Action: TCloseAction);
	procedure FormShortCut        (var Msg: TWMKey; var Handled: Boolean);

	procedure trlKorrespKeyDown   (Sender: TObject; var Key: Word; Shift: TShiftState);

	procedure rgrTypeKorrespClick (Sender: TObject);

	procedure btnDetailsClick     (Sender: TObject);

  private
	FKorParams : TRec_KorParams;
	FResultExpMethod : TneGetExpMethod;
	function  GetKorParams : TRec_KorParams;
	procedure SetKorParams( aValue: TRec_KorParams );
  public
	constructor Create( const aDBFMParams: TRec_DBFMParams; const aKorParams: TRec_KorParams ); reintroduce;
	property pKorParams       : TRec_KorParams  read GetKorParams write SetKorParams;
	property pResultExpMethod : TneGetExpMethod read FResultExpMethod implements IneCallExpMethod;
  end;

  procedure GetKorToSCH( const aDBFMParams: TRec_DBFMParams; const aKorParams: TRec_KorParams ); stdcall;

  exports
	GetKorToSCH;

implementation

resourcestring

	sKEY_FN = 'OUT_ID_SCH';

	//Сообщения получения корреспонденции
	sMSG_SelectSubSCH_UA  = 'Для того, щоб переглянути кореспонденцію по рахунку,'#13'оберіть, будь ласка, рахунок нижчого рівня';
	sMSG_SelectSubSCH_RUS = 'Для того, чтобы просмотреть корреспонденцию по счету,'#13'выберите, пожалуйста, счет нижнего уровня';

{$R *.dfm}

procedure GetKorToSCH( const aDBFMParams: TRec_DBFMParams; const aKorParams: TRec_KorParams );
var
	fmGetKorToSCH : TfmGetKorToSCH;
begin
  try
	fmGetKorToSCH := TfmGetKorToSCH.Create( aDBFMParams, aKorParams );
	fmGetKorToSCH.ShowModal;
  finally
	FreeAndNil( fmGetKorToSCH );
  end;
end;

{ TfmKorrespondent }
constructor TfmGetKorToSCH.Create( const aDBFMParams: TRec_DBFMParams;
const aKorParams: TRec_KorParams );
begin
    inherited Create( aDBFMParams.Owner );
    dbWork.Handle := aDBFMParams.DBHandle;
    trRead.StartTransaction;

    FKorParams := aKorParams;
    Caption := Caption + FKorParams.SchName;

    if dstWork.Active then dstWork.Close;
    dstWork.SQLs.SelectSQL.Text := 'SELECT * FROM JO5_GET_ALL_GROUP_KORRESPONDENT (' + IntToStr( pKorParams.IdRegUch ) + cSEMICOLON + IntToStr( pKorParams.IdSch ) + cSEMICOLON + cTICK + DateToStr( pKorParams.CurrPeriod ) + cTICK + cSEMICOLON + IntToStr( Ord( pKorParams.HasChildren ) ) + cSEMICOLON + IntToStr( rgrTypeKorresp.ItemIndex ) + cBRAKET_CL + 'ORDER BY OUT_SCH_NUMBER ASC';
    dstWork.Open;
end;

function TfmGetKorToSCH.GetKorParams: TRec_KorParams;
begin
  Result := FKorParams;
end;

procedure TfmGetKorToSCH.SetKorParams(aValue: TRec_KorParams);
begin
  FKorParams := aValue;
end;

procedure TfmGetKorToSCH.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

//Закрываем окно при нажатии "Escape"
procedure TfmGetKorToSCH.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  case Msg.CharCode of

    VK_ESCAPE : begin
                  btnExit.Click;
                end;
  end;
end;

//Разворачиваем(сворачиваем) дочерние узлы при нажатии стрелок перемещения курсора
procedure TfmGetKorToSCH.trlKorrespKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of

    VK_LEFT   : begin
                  if trlKorresp.FocusedNode.CanCollapse
                  then
                      trlKorresp.FocusedNode.Collapse( False );
				end;

    VK_RIGHT  : begin
                  if trlKorresp.FocusedNode.CanExpand
                  then
                      trlKorresp.FocusedNode.Expand( False );
                end;
  end;
end;

//Получаем корреспонденцию только по счетам
procedure TfmGetKorToSCH.rgrTypeKorrespClick(Sender: TObject);
begin
  with pKorParams
  do begin
      if dstWork.Active then dstWork.Close;
      dstWork.SQLs.SelectSQL.Text := 'SELECT * FROM JO5_GET_ALL_GROUP_KORRESPONDENT (' + IntToStr( IdRegUch ) + cSEMICOLON + IntToStr( IdSch ) + cSEMICOLON + cTICK + DateToStr( CurrPeriod ) + cTICK + cSEMICOLON + IntToStr( Ord( HasChildren ) ) + cSEMICOLON + IntToStr( rgrTypeKorresp.ItemIndex ) + cBRAKET_CL + 'ORDER BY OUT_SCH_NUMBER ASC';
      trlKorresp.BeginUpdate;
      dstWork.Open;
      trlKorresp.EndUpdate;
      trlKorresp.SetFocus;
  end;
end;

//Получаем корреспонденцию в разрезе смет разделов, статей и т.д.
procedure TfmGetKorToSCH.btnDetailsClick(Sender: TObject);
var
	vModRes    : TModalResult;
	vMTDParams : TPtr_MTDParams;
	vBPLParams : TPtr_BPLParams;
begin
  try

	if trlKorresp.FocusedNode.HasChildren
	then begin
		try
			New( vBPLParams );
			vBPLParams^.MethodName  := sMN_GetKorDetails;
			vBPLParams^.PackageName := ExtractFilePath( Application.ExeName ) + 'JO5\JO5_GetKorDetails7.bpl';

			New( vMTDParams );
			with vMTDParams^
			do begin
			  KorParams.IdSch          := pKorParams.IdSch;
			  KorParams.IdKorSch       := dstWork.FBN(sKEY_FN).AsVariant;
			  KorParams.SchName        := pKorParams.SchName;
			  KorParams.CurrPeriod     := pKorParams.CurrPeriod;
			  KorParams.IsKorrespondKR := Boolean( rgrTypeKorresp.ItemIndex );
			  DBFMParams.Owner         := Self;
			  DBFMParams.Style         := fsModal;
			  DBFMParams.DBHandle      := dbWork.Handle;
			end;

			FResultExpMethod := TneGetExpMethod.Create( Self, vBPLParams, vMTDParams );
		finally
			FreeAndNil( FResultExpMethod );
			trlKorresp.SetFocus;
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
		  MessageBox( Handle, PChar( sMSG_SelectSubSCH_UA ), PChar( sMsgCaptionInfUA ), MB_OK or MB_ICONINFORMATION );
	end;

  except
	  on E: Exception
	  do begin
		  MessageBox( Handle, PChar( sErrorTextExt + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
	  end;
  end;
end;

end.
