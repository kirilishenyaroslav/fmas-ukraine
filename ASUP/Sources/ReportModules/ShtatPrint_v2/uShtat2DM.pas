unit uShtat2DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, FR_Class, FR_DSet,
  FR_DBSet, DB, IBCustomDataSet, IBQuery, IBDatabase,IBase, Forms, frxClass,
  frxDBSet;

type
  TdmShtat2Report = class(TDataModule)
    Get_SR_Date: TIBQuery;
    ShtatDataset: TfrDBDataSet;
    DeptQuery: TIBQuery;
    ReportQuery: TIBQuery;
    ShtatReport: TfrReport;
    Database: TIBDatabase;
    DefaultTransaction: TIBTransaction;
    ReadTransaction: TIBTransaction;
    Consts_Query: TIBQuery;
    WorkTimeQuery: TIBQuery;
    ReportDS: TDataSource;
    ConstsDS: TDataSource;
    frxConstsData: TfrxDBDataset;
    frxShtatData: TfrxDBDataset;
    frxReport: TfrxReport;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; Handle: TISC_DB_HANDLE); reintroduce;
  end;

var
  dmShtat2Report: TdmShtat2Report;
  Version: Integer;
  ProgramPath: String;

implementation

{$R *.dfm}

constructor TdmShtat2Report.Create(AOwner: TComponent; Handle: TISC_DB_HANDLE);
begin
    inherited Create(AOwner);

    Database.SetHandle(Pointer(Handle));

    Consts_Query.Open;

    Version := 2;

    ProgramPath := ExtractFilePath(Application.ExeName);
end;

end.
