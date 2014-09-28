unit AvgSocInsurance_DM;

interface

uses
  SysUtils, Classes, frxClass, frxDBSet, DB, FIBDataSet, pFIBDataSet,
  frxDesgn, FIBDatabase, pFIBDatabase, Forms,ZWait,ZSvodTypesUnit,ZMessages,
  ZDPKConsts,ZProc, Dialogs, Controls, frxExportXLS, FR_Class, frRtfExp,
  
    dates, frxExportRTF;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    frxDesigner1: TfrxDesigner;
    DSet: TpFIBDataSet;
    ReportDSet: TfrxDBDataset;
    DSetTrans: TpFIBDataSet;
    ReportDSetTrans: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    Report: TfrxReport;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
  private
    Fparam: TAvgSocInsurance;
  public
      function PrintSpr(AParameter:TAvgSocInsurance):variant;
  end;

var
  DM: TDM;

implementation
  {$R *.dfm}


const NameReportAvgSocInsuranceTVP  = 'Reports\Zarplata\AvgSocInsurance.fr3';
const NameReportAvgSocInsuranceUnFortunate  = 'Reports\Zarplata\AvgSocInsuranceUnfortunate.fr3';
const NameReportAvgSocInsuranceUnFortunate1  = 'Reports\Zarplata\AvgSocInsuranceUnfortunate1.fr3';
function TDM.PrintSpr(AParameter:TAvgSocInsurance):variant;
var Is_Univer:string[1];
    wf:TForm;
begin
 try
    Fparam:=AParameter;
    wf := ShowWaitForm(Application.MainForm);




    Screen.Cursor:=crHourGlass;

    try
      DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_AVG_SOC_INSURANCE('+intToStr(AParameter.Id_reestr)+')';
      DSetTrans.SQLs.SelectSQL.Text:='SELECT * FROM Z_AVG_SOC_INSURANCE_TRANS('+intToStr(AParameter.Id_reestr)+') order by FIO,  id_man, DATE_BEG';






      DB.Handle:=AParameter.DB_Handle;
      ReadTransaction.StartTransaction;

      DSet.Open;
      DSetTrans.Open;
    except
    on E:Exception do
      begin
       ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
       Exit;
      end;
    end;

    Report.Clear;
    case AParameter.TypeHospFSS of
      thfTVP: Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportAvgSocInsuranceTVP,True);
      thfUnfortunate:  Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportAvgSocInsuranceUnFortunate,True);
      thfUnfortunate1:  Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportAvgSocInsuranceUnFortunate1,True);
    end


 finally
    CloseWaitForm(wf);
    Screen.Cursor:=crDefault;
 end;

 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;

 Report.Free;
end;


procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin
  if UpperCase(VarName)='MONTH' then
  Value:=   MonthNumToName(YearMonthFromKodSetup(FParam.kodSetup,false));
  if UpperCase(VarName)='YEAR' then
  Value:=   YearMonthFromKodSetup(FParam.kodSetup,True);
end;

end.
