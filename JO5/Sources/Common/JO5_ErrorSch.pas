unit JO5_ErrorSch;

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
  cxLookAndFeelPainters, StdCtrls, cxButtons, RxMemDS, Jo5_Consts,Jo5_Proc,
  dxBar{, uneTypes};

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
    dxBarManager1: TdxBarManager;

//    procedure FormShortCut (var Msg: TWMKey; var Handled: Boolean);

  private
    { Private declarations }
    pLanguageIndex:Byte;
  public
      constructor Create( aOwner: TComponent; aBuffer: TDataSet ); reintroduce;
  end;

implementation

//uses uneLibrary, uneUtils, uDataModul;
uses ZMessages;

{$R *.dfm}

{ TfmErrorViewer }

constructor TfmErrorSch.Create(aOwner: TComponent; aBuffer: TDataSet);
begin

  try
      try
          inherited Create( aOwner );
          pLanguageIndex:=IndexLanguage;
          dstBuffer.LoadFromDataSet( aBuffer, 0, lmCopy );
		  tvwErrorSch.DataController.GotoFirst;
	  except
//		  LogException( dmdDataModul.pSysOptions.LogFileName );
		  Raise;
	  end;
  except
	  on E: Exception
	  do
		  ZShowMessage( '1',ECaption[PLanguageIndex]+E.Message, mtError, [mbOk]);
  end;

end;

{//Закрываем окно
procedure TfmErrorSch.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin

  case Msg.CharCode of

	VK_ESCAPE : begin
				  btnExit.Click;
				end;
  end;

end;}

end.
