unit csAcademicYearsDM;

interface

uses
  SysUtils, Classes, RxMemDS, DB, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, iBase;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    DSetYears: TpFIBDataSet;
    TransRead: TpFIBTransaction;
    TransWrite: TpFIBTransaction;
    StorProc: TpFIBStoredProc;
    DSourceYears: TDataSource;
    RxMemDataYearsEDBO: TRxMemoryData;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AHandle: TISC_DB_HANDLE); reintroduce;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}


constructor TDM.Create(AOwner: TComponent; AHandle: TISC_DB_HANDLE);
begin
    inherited Create(AOwner);
    DB.Handle := AHandle;
    TransRead.StartTransaction;
    DSetYears.Close;
    DSetYears.SQLs.SelectSQL.Text := 'SELECT * FROM CS_DT_ACADEMIC_YEARS'; // ” ¿«¿“‹ œ–Œ÷≈ƒ”–”
    DSetYears.Open;
end;
end.
