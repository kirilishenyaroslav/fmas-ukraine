unit DMSprWorkHours;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, ibase, DB, FIBDataSet,
  pFIBDataSet, frxClass, frxDBSet, ZTypes;

type
  TFDMSprWorkHours = class(TDataModule)
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    DSetWorkHours: TpFIBDataSet;
    ReportDSETWorkHours: TfrxDBDataset;
    Report: TfrxReport;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
  private
    ParamLoc :TZSimpleParamDate;
  public
    constructor Create(Param :TZSimpleParamDate);reintroduce;
  end;



implementation

{$R *.dfm}

{ TFDMSprWorkHours }

constructor TFDMSprWorkHours.Create(Param :TZSimpleParamDate);
begin
  inherited Create(Param.Owner);
  ParamLoc:=Param;
  pFIBDatabase1.Handle:=Param.Db_Handle;
end;

procedure TFDMSprWorkHours.ReportGetValue(const VarName: String;
  var Value: Variant);
begin
if UpperCase(VarName)='DATEBEG' then
    Value:=ParamLoc.DATEBEG;
if UpperCase(VarName)='DATEEND' then
    Value:=ParamLoc.DATEEND;
end;

end.
