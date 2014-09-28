unit DM;

interface

uses
    SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
    FIBQuery, pFIBQuery, pFIBStoredProc, frxClass, frxDBSet;

type
    TDataMod = class(TDataModule)
        pFIBD_Reestr: TpFIBDatabase;
        pFIBT_Read: TpFIBTransaction;
        pFIBT_Write: TpFIBTransaction;
        pFIB_MainDS: TpFIBDataSet;
        pFIBDSHesh: TpFIBDataSet;
        StoredProc: TpFIBStoredProc;
    Report: TfrxReport;
    ReportDsetData: TfrxDBDataset;
    ReportDataSet: TpFIBDataSet;
    ReportDsetData1: TfrxDBDataset;
    ReportDocDataSet: TpFIBDataSet;
    ReportDoc: TfrxReport;
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    DataMod: TDataMod;

implementation

{$R *.dfm}

end.

