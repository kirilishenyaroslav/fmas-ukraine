unit uDataModul;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uDataModul                                                                 *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Централизованное хранилище объектов общего назначения. Упрощение логики    *
* всего приложения.                                                            *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
  SysUtils, Classes, cxContainer, cxEdit, cxStyles, ImgList, Controls,
  FIBDatabase, pFIBDatabase, XPStyleActnCtrls, ActnList, ActnMan, StdActns, uneTypes;

type

  TdmdDataModul = class(TDataModule)

	dbJO5                   : TpFIBDatabase;

	trRead                  : TpFIBTransaction;
	trWrite                 : TpFIBTransaction;

	imlToolBar              : TImageList;
	imlMainMenu             : TImageList;
	imlPopupMenu            : TImageList;

	escForSpr               : TcxEditStyleController;
	escAddEdit              : TcxEditStyleController;

	srpMain                 : TcxStyleRepository;

	cxsHeader               : TcxStyle;
    cxsFooter               : TcxStyle;
	cxsContent              : TcxStyle;
	cxHotTrack              : TcxStyle;
	cxsInactive             : TcxStyle;
	cxsIndicator            : TcxStyle;
	cxsSelection            : TcxStyle;
	cxBackground            : TcxStyle;
	cxsGroupByBox           : TcxStyle;
	cxsContentOdd           : TcxStyle;
	cxsContentEvent         : TcxStyle;
    cxsColumnHeader         : TcxStyle;
    cxsColumnHeaderClassic  : TcxStyle;

  private
	  FSysOptions : TRec_SysOptions;

	  function  GetSysOptions: TRec_SysOptions;
	  procedure SetSysOptions( aValue: TRec_SysOptions );
  public

	  property pSysOptions: TRec_SysOptions read FSysOptions write FSysOptions;
  end;

var
  dmdDataModul: TdmdDataModul;

implementation

{$R *.dfm}

function TdmdDataModul.GetSysOptions: TRec_SysOptions;
begin
  Result := FSysOptions;
end;

procedure TdmdDataModul.SetSysOptions(aValue: TRec_SysOptions);
begin
  FSysOptions := aValue;
end;

end.
