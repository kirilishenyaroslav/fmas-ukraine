unit SpWorkMode_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TDModule = class(TDataModule)
    DB: TpFIBDatabase;
    RTransaction: TpFIBTransaction;
    DSetMain: TpFIBDataSet;
    DSourceMain: TDataSource;
    StTransaction: TpFIBTransaction;
    DSource: TDataSource;
    StProc: TpFIBStoredProc;
    DSetCalendar: TpFIBDataSet;
    DSetWork: TpFIBDataSet;
    DSourceHoliday: TDataSource;
    DSetException: TpFIBDataSet;
    DSetHoliday: TpFIBDataSet;
    DSourceException: TDataSource;
    DSetCalendarById: TpFIBDataSet;
    DSourceTree1: TDataSource;
    DSetTree1: TpFIBDataSet;
    DSourceTree2: TDataSource;
    DSetTree2: TpFIBDataSet;
    DSourceTreeTrans: TDataSource;
    DSetTreeTrans: TpFIBDataSet;
    DSetMainTrans: TpFIBDataSet;
    DSourceMainTrans: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DModule: TDModule;

implementation

{$R *.dfm}

end.
