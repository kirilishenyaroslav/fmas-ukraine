unit Calendar_DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, DB, FIBDataSet, pFIBDataSet;

type
  TDModule = class(TDataModule)
    DB: TpFIBDatabase;
    StProc: TpFIBStoredProc;
    StTransaction: TpFIBTransaction;
    DSetCalendar: TpFIBDataSet;
    DSetWork: TpFIBDataSet;
    DSource: TDataSource;
    ReadTransaction: TpFIBTransaction;
    DSetHoliday: TpFIBDataSet;
    DSourceHoliday: TDataSource;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);reintroduce;
  end;

var
  DModule: TDModule;

implementation

{$R *.dfm}

constructor TDModule.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
end;

end.
