unit BankNichAddSmt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDatabase, pFIBDatabase,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, FIBDataSet, pFIBDataSet;

type

  TBankNichAddSm = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    pFIBDataSet1: TpFIBDataSet;
  private
    { Private declarations }
  public
    //procedure InitConnection(DBhandle : TISC_DB_HANDLE; RTransaction : TISC_TR_HANDLE);
    { Public declarations }
  end;



var
  BankNichAddSm: TBankNichAddSm;

implementation
uses
     Un_lo_file_Alex,
     Un_func_file_Alex;
{$R *.dfm}







end.
