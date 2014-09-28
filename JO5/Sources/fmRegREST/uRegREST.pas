unit uRegREST;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uRegREST                                                                   *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Ведение реестра остатков по заработной плате и стипендии.                  *
*                                                                              *
* Copyright  ©  Год 2006,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, dxBar, dxBarExtItems, ImgList,
  cxStyles, Menus, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxStatusBar, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxContainer, cxRadioGroup, cxSplitter, ExtCtrls,
  cxGridBandedTableView, cxGridDBBandedTableView, uneTypes, uneLibrary;

type

  TfmRegREST = class(TForm, IneCallExpMethod)

    dbWork                 : TpFIBDatabase;
    spcWork                : TpFIBStoredProc;

    trRead                 : TpFIBTransaction;
    trWrite                : TpFIBTransaction;

    dstDoc                 : TpFIBDataSet;
    dstRest                : TpFIBDataSet;

    dsrDoc                 : TDataSource;
    dsrRest                : TDataSource;

    srpWork                : TcxStyleRepository;

    pnlRest                : TPanel;
    pnlRestDesc            : TPanel;

    splRest                : TcxSplitter;
    splRestDesc            : TcxSplitter;

    cxsHeader              : TcxStyle;
    cxsFooter              : TcxStyle;
    cxsContent             : TcxStyle;
    cxHotTrack             : TcxStyle;
    cxsInactive            : TcxStyle;
    cxsIndicator           : TcxStyle;
    cxsSelection           : TcxStyle;
    cxBackground           : TcxStyle;
    cxsGroupByBox          : TcxStyle;
    cxsContentOdd          : TcxStyle;
    cxsColumnHeader        : TcxStyle;
    cxsContentEvent        : TcxStyle;
    cxsColumnHeaderClassic : TcxStyle;

    imlToolBar             : TImageList;

    brmWork                : TdxBarManager;

    btnAdd                 : TdxBarLargeButton;
    btnEdit                : TdxBarLargeButton;
    btnExit                : TdxBarLargeButton;
    btnWatch               : TdxBarLargeButton;
    btnDelete              : TdxBarLargeButton;
    btnRefresh             : TdxBarLargeButton;

    edtYear                : TdxBarSpinEdit;
    edtMonth               : TdxBarCombo;
    edtRegUch              : TdxBarCombo;

    pmnuWork               : TPopupMenu;
    bpmnWork               : TdxBarPopupMenu;
    gpmnWork               : TcxGridPopupMenu;

    sbrWork                : TdxStatusBar;

    bccTypeDoc             : TdxBarControlContainerItem;
    gbxTypeDoc             : TcxRadioGroup;

    gdDoc                  : TcxGrid;
    gdRest                 : TcxGrid;

    lvlDoc                 : TcxGridLevel;
    lvlRest                : TcxGridLevel;

    tvwDoc                 : TcxGridDBBandedTableView;
    tvwRest                : TcxGridDBBandedTableView;

    tvwDocDBBandedColumn1  : TcxGridDBBandedColumn;
    tvwDocDBBandedColumn2  : TcxGridDBBandedColumn;
    tvwDocDBBandedColumn3  : TcxGridDBBandedColumn;
    tvwDocDBBandedColumn4  : TcxGridDBBandedColumn;
    tvwRestDBBandedColumn1 : TcxGridDBBandedColumn;
    tvwRestDBBandedColumn2 : TcxGridDBBandedColumn;
    tvwRestDBBandedColumn3 : TcxGridDBBandedColumn;
    tvwRestDBBandedColumn4 : TcxGridDBBandedColumn;
    tvwRestDBBandedColumn5 : TcxGridDBBandedColumn;
    tvwRestDBBandedColumn6 : TcxGridDBBandedColumn;

  private
      { Private declarations }
	  FResultExpMethod : TneGetExpMethod;
  public
      { Public declarations }
	  property pResultExpMethod : TneGetExpMethod read FResultExpMethod implements IneCallExpMethod;
  end;

implementation

{$R *.dfm}

end.
 