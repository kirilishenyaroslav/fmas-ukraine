unit uProjects;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uProjects                                                                  *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Организация диалога для настройки списка проектов.                         *
*                                                                              *
* Copyright  ©  Год 2006,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxContainer, ImgList, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxBar, dxBarExtItems, RxMemDS;

type

  TfmProjects = class(TForm)

    brmProjects             : TdxBarManager;

    imlToolBar              : TImageList;
    imlPopupMenu            : TImageList;

    srpProjects             : TcxStyleRepository;

    cxsFooter               : TcxStyle;
    cxsHeader               : TcxStyle;
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

    gdProjects              : TcxGrid;
    lvlProjects             : TcxGridLevel;
    tvwProjects             : TcxGridDBTableView;

    btnAdd                  : TdxBarLargeButton;
    btnEdit                 : TdxBarLargeButton;
    btnExit                 : TdxBarLargeButton;
    btnDelete               : TdxBarLargeButton;

    dsrProjects             : TDataSource;
    dstProjects             : TRxMemoryData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
