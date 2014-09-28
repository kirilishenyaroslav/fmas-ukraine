unit uErrorDocsProvs;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uErrorDocsProvs                                                            *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Организация интерфейса для просмотра ошибок по документам и соответствующих*
*   им проводок.                                                               *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, pFIBDataSet,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxLookAndFeelPainters, StdCtrls, cxButtons, RxMemDS, cxGridDBBandedTableView,
  cxGridBandedTableView, uneTypes;

type

  TfmErrorDocsProvs = class(TForm)

	btnExit          : TcxButton;

	dsrDocs          : TDataSource;
	dsrProvs         : TDataSource;

	dstDocs          : TRxMemoryData;
	dstProvs         : TRxMemoryData;

	lvlDocs          : TcxGridLevel;
	lvlProvs         : TcxGridLevel;
	tvwDocs          : TcxGridDBBandedTableView;
	tvwProvs         : TcxGridDBBandedTableView;
	grErrorDocsProvs : TcxGrid;

	cmnNOTE           : TcxGridDBBandedColumn;
	cmnID_PROV        : TcxGridDBBandedColumn;
	cmnNUM_DOC        : TcxGridDBBandedColumn;
	cmnDATE_DOC       : TcxGridDBBandedColumn;
	cmnSUMMA_DOC      : TcxGridDBBandedColumn;
	cmnSUMMA_PROV     : TcxGridDBBandedColumn;
	cmnDB_SCH_NUM     : TcxGridDBBandedColumn;
	cmnKR_SCH_NUM     : TcxGridDBBandedColumn;
	cmnDB_SMET_NUM    : TcxGridDBBandedColumn;
	cmnKR_SMET_NUM    : TcxGridDBBandedColumn;
	cmnDB_RAZD_NUM    : TcxGridDBBandedColumn;
	cmnKR_RAZD_NUM    : TcxGridDBBandedColumn;
	cmnDB_STAT_NUM    : TcxGridDBBandedColumn;
	cmnKR_STAT_NUM    : TcxGridDBBandedColumn;
	cmnDB_SCH_TITLE   : TcxGridDBBandedColumn;
	cmnKR_SCH_TITLE   : TcxGridDBBandedColumn;
	cmnDB_SMET_TITLE  : TcxGridDBBandedColumn;
	cmnKR_SMET_TITLE  : TcxGridDBBandedColumn;
	cmnDB_RAZD_TITLE  : TcxGridDBBandedColumn;
	cmnKR_RAZD_TITLE  : TcxGridDBBandedColumn;
	cmnDB_STAT_TITLE  : TcxGridDBBandedColumn;
	cmnKR_STAT_TITLE  : TcxGridDBBandedColumn;
	cmnERROR_MSG_DOC  : TcxGridDBBandedColumn;
	cmnERROR_MSG_PROV : TcxGridDBBandedColumn;

	procedure FormShortCut (var Msg: TWMKey; var Handled: Boolean);

  private
	{ Private declarations }
  public
	  constructor Create( aOwner: TComponent; aDocs, aProvs: TDataSet ); reintroduce;
  end;

implementation

uses uneLibrary, uneUtils, uDataModul;

{$R *.dfm}

{ TfmErrorViewer }

constructor TfmErrorDocsProvs.Create(aOwner: TComponent; aDocs, aProvs: TDataSet);
begin

  try
	  try
		  inherited Create( aOwner );
		  dstDocs.LoadFromDataSet ( aDocs,  0, lmCopy );
		  dstProvs.LoadFromDataSet( aProvs, 0, lmCopy );
		  tvwDocs.DataController.GotoFirst;
	  except
		  LogException( dmdDataModul.pSysOptions.LogFileName );
		  Raise;
	  end;
  except
	  on E: Exception
	  do
		  MessageBox( Handle, PChar( sErrorTextExt + E.Message ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
  end;

end;

//Закрываем окно
procedure TfmErrorDocsProvs.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin

  case Msg.CharCode of

	VK_ESCAPE : begin
				  btnExit.Click;
				end;
  end;

end;

end.
