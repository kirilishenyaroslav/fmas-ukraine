unit uErrorSch;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uErrorSch                                                                  *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Организация интерфейса для просмотра ошибок по счетам при переводе(откате) *
*   системы в следующий(предыдущий) отчётный период.                           *
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
  cxLookAndFeelPainters, StdCtrls, cxButtons, RxMemDS, uneTypes;

type

  TfmErrorSch = class(TForm)

	btnExit      : TcxButton;
	grErrorSch   : TcxGrid;
	lvlErrorSch  : TcxGridLevel;
	tvwErrorSch  : TcxGridDBTableView;

	dstBuffer    : TRxMemoryData;
	dsrErrorSch  : TDataSource;

	cmnSchError  : TcxGridDBColumn;
	cmnSchTitle  : TcxGridDBColumn;
	cmnSchNumber : TcxGridDBColumn;

    procedure FormShortCut (var Msg: TWMKey; var Handled: Boolean);

  private
    { Private declarations }
  public
      constructor Create( aOwner: TComponent; aBuffer: TDataSet ); reintroduce;
  end;

implementation

uses uneLibrary, uneUtils, uDataModul;

{$R *.dfm}

{ TfmErrorViewer }

constructor TfmErrorSch.Create(aOwner: TComponent; aBuffer: TDataSet);
begin

  try
      try
          inherited Create( aOwner );
          dstBuffer.LoadFromDataSet( aBuffer, 0, lmCopy );
		  tvwErrorSch.DataController.GotoFirst;
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
procedure TfmErrorSch.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin

  case Msg.CharCode of

	VK_ESCAPE : begin
				  btnExit.Click;
				end;
  end;

end;

end.
