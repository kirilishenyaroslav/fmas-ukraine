unit AvgCompensPrintDM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, ZSvodTypesUnit, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, ZSvodProcUnit,
  Unit_ZGlobal_Consts;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSetGlobal: TpFIBDataSet;
    ReportDSetGlobal: TfrxDBDataset;
    DSet1: TpFIBDataSet;
    ReportDset1: TfrxDBDataset;
    DSetSetup: TpFIBDataSet;
    ReportDSetSetup: TfrxDBDataset;
    DSourceGlobal: TDataSource;
    frxDesigner1: TfrxDesigner;
    DSet2: TpFIBDataSet;
    ReportDSet2: TfrxDBDataset;
    DSet3: TpFIBDataSet;
    ReportDSet3: TfrxDBDataset;
    Report: TfrxReport;
    procedure DataModuleDestroy(Sender: TObject);
    procedure ReportGetValue(const VarName: String; var Value: Variant);
  private
  public
    function PrintSpr(AParameter:TAvgHolParam):variant;
  end;


implementation

{$R *.dfm}

const NameReport            = 'Reports\Zarplata\AvgHol.fr3';

function TDM.PrintSpr(AParameter:TAvgHolParam):variant;
begin
 Screen.Cursor:=crHourGlass;

 try
  DSetGlobal.SQLs.SelectSQL.Text:='SELECT * FROM Z_CURRENT_SELECTONE('+
                                       IntToStr(AParameter.Id)+')';
  DSet1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_HOLIDAY_PRINT(?ID_MAN_HOLIDAY)';
  DSet3.SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_HOLIDAY_PRINT_2(?ID_MAN_HOLIDAY)';

  DB.Handle:=AParameter.DB_Handle;
  ReadTransaction.StartTransaction;

  DSetGlobal.Open;
  DSet1.Open;
  DSet2.SQLs.SelectSQL.Text := 'SELECT * FROM Z_COUNT_AVARAGE_PAYMENT('+
    VarToStr(DSet1['KOD_SETUP'])+',12,'+VarToStr(DSet1['RMOVING'])+')';
  DSet3.Open;
 except
   on E:Exception do
    begin
     ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
     Exit;
    end;
 end;

 Report.Clear;

 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport,True);

{ Report.Variables.Clear;
 Report.Variables[' '+'User Category']:=NULL;
 Report.Variables.AddVariable('User Category',
                              'PPeriod',
                              ''''+KodSetupToPeriod(PKodSetup,0)+'''');}

 Screen.Cursor:=crDefault;
 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;
 Report.Free;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin
if UpperCase(VarName)='P_KOD_SETUP' then
   Value := KodSetupToPeriod(DSet2['KS'],0);
end;

end.

