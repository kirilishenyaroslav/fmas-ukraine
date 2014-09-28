//******************************************************************************
// Проект "ГорВодоКанал" (bs)
// Файл дата модуля
// Перчак А.Л.
// создан 18/01/2010
// последние изменения Перчак А.Л. 18/01/2010
//******************************************************************************

unit uMain_DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet;

type
  TfrmMainDM = class(TDataModule)
    Main_DB: TpFIBDatabase;
    ReadTimestampDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    ReadDataSet: TpFIBDataSet;
    ReadDataSource: TDataSource;
  private
    { Private declarations }
  public
    //is_admin:boolean;
    CURRENT_TIMESTAMP:  TDatetime;
  end;

var
  frmMainDM: TfrmMainDM;

implementation

{$R *.dfm}

end.
