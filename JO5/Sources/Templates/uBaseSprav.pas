unit uBaseSprav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxBar, dxBarExtItems, dxStatusBar,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TfmBaseSprav = class(TForm)
    tvwBaseSprav: TcxGridDBTableView;
    lvlBaseSprav: TcxGridLevel;
    gdBaseSprav: TcxGrid;
    bmrBaseSprav: TdxBarManager;
    dsrBaseSprav: TDataSource;
    dstBaseSprav: TpFIBDataSet;
    trBaseSprav: TpFIBTransaction;
    spcBaseSprav: TpFIBStoredProc;
    stbBaseSprav: TdxStatusBar;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDelete: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    btnRefresh: TdxBarLargeButton;
    btnFilter: TdxBarLargeButton;
    btnPrint: TdxBarLargeButton;
    btnExit: TdxBarLargeButton;
    btnSelect: TdxBarLargeButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
 