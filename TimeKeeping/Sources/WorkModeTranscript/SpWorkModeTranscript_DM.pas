unit SpWorkModeTranscript_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, pFIBStoredProc, frxClass, frxDBSet, frxDesgn;

type
  TDModule = class(TDataModule)
    DB: TpFIBDatabase;
    RTransaction: TpFIBTransaction;
    StTransaction: TpFIBTransaction;
    DSource: TDataSource;
    StProc: TpFIBStoredProc;
    DSetCalendar: TpFIBDataSet;
    DSourceException: TDataSource;
    DSetCalendarById: TpFIBDataSet;
    DSourceWeekend: TDataSource;
    DSetWork: TpFIBDataSet;
    DSetWeekend: TpFIBDataSet;
    DSetHoliday: TpFIBDataSet;
    DSourceHoliday: TDataSource;
    frxDesigner1: TfrxDesigner;
    DataSet: TpFIBDataSet;
    DBDataset: TfrxDBDataset;
    DataSet1: TpFIBDataSet;
    DBDataset1: TfrxDBDataset;
    Report: TfrxReport;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
  private
    { Private declarations }
  public
    year_:string;
    NameWorkMode:string;
  end;

var
  DModule: TDModule;

implementation

{$R *.dfm}
 uses FormPrintWorkMode;
procedure TDModule.ReportGetValue(const VarName: String;
  var Value: Variant);
begin
    if VarName='Year' then
      Value:=year_;
    if VarName='NameWorkMode' then
      Value:=NameWorkMode;
end;



end.
