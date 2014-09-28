unit ReportsCountPlaces;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  frxClass, frxDBSet, frxDesgn,IBase,StudcityConst;

type
  TfrmPrintCountPlaces = class(TForm)
    Database: TpFIBDatabase;
    pFIBDataSetPrintCountPlaces: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    frxDBDataset: TfrxDBDataset;
    frxDesigner: TfrxDesigner;
    frxReport: TfrxReport;
  private
   constructor Create (AOwner : TComponent;DB:TISC_DB_HANDLE);overload;
    { Private declarations }
  public
    { Public declarations }
  end;
function ReportsCountPlacesDPK(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
exports ReportsCountPlacesDPK;
var
  frmPrintCountPlaces: TfrmPrintCountPlaces;

implementation

{$R *.dfm}

function ReportsCountPlacesDPK(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  Print:TfrmPrintCountPlaces;
begin
    Print:=TfrmPrintCountPlaces.Create(AOwner,DB);
end;


constructor TfrmPrintCountPlaces.Create (AOwner : TComponent;DB:TISC_DB_HANDLE);
begin
  Inherited Create (AOwner);
  Database.Handle:=DB;
  pFIBDataSetPrintCountPlaces.Active:=false;
  pFIBDataSetPrintCountPlaces.Transaction:=ReadTransaction;
  pFIBDataSetPrintCountPlaces.Database:=Database;
  pFIBDataSetPrintCountPlaces.Active:=true;

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\ReportCountPlaces.fr3');
  frxReport.Variables['BUILDS']:= ''''+StudcityConst.Studcity_PrintCountPlBuild+'''';
  frxReport.Variables['NAMEROOM']:= ''''+StudcityConst.Studcity_PrintCountPlNameRoom+'''';
  frxReport.Variables['COUNTINROOM']:= ''''+StudcityConst.Studcity_PrintCountPlBuildPlacesInRoom+'''';
  frxReport.Variables['COUNTROOM']:= ''''+StudcityConst.Studcity_PrintCountPlCountRoom+'''';
  frxReport.Variables['COUNTALLROOM']:= ''''+StudcityConst.Studcity_PrintCountPlAllRoom+'''';
  frxReport.Variables['COUNTPLACES']:= ''''+StudcityConst.Studcity_PrintCountPlCountPlaces+'''';
  frxReport.Variables['COUNTALLPLACES']:= ''''+StudcityConst.Studcity_PrintCountPlAllPlaces+'''';
  frxReport.Variables['NAMEREPORT']:= ''''+StudcityConst.Studcity_PrintNameRoport+'''';
  frxReport.Variables['SUMMARYREPORT']:= ''''+StudcityConst.Studcity_PrintCountPlAllPlacesReports+'''';
  frxReport.ShowReport;
  //frxReport.DesignReport;
end;

end.
