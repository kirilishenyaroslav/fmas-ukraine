unit uNewOkladData;

interface

uses
    SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
    frxClass, frxDBSet;

type
    TNewOkladsData = class(TDataModule)
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
    NewOkladsData: TNewOkladsData;

implementation

{$R *.dfm}


end.

