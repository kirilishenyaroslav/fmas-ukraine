unit uFactShtatData;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  frxClass, frxDBSet;

type
  TdmFactShtatData = class(TDataModule)
    Database: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    ReportDS: TpFIBDataSet;
    FactShtatDataset: TfrxDBDataset;
    Report: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFactShtatData: TdmFactShtatData;

implementation

{$R *.dfm}

end.
