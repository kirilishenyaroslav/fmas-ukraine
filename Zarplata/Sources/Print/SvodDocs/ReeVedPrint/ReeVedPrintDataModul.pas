unit ReeVedPrintDataModul;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, ZSvodTypesUnit, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, ZSvodProcUnit, Unit_ZGlobal_Consts,
  ZWait, frxExportXLS;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    Designer: TfrxDesigner;
    DSetData: TpFIBDataSet;
    ReportDsetData: TfrxDBDataset;
    DSetGlobalData: TpFIBDataSet;
    ReportDSetGlobalData: TfrxDBDataset;
    Report: TfrxReport;
    frxXLSExport1: TfrxXLSExport;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
  private
  public
    function PrintSpr(DB_Handle:TISC_DB_HANDLE;IDReestr:integer):variant;
  end;


implementation

{$R *.dfm}

const NameReport               = 'Reports\Zarplata\ReeVed.fr3';

function TDM.PrintSpr(DB_Handle:TISC_DB_HANDLE;IDReestr:integer):variant;
var wf:TForm;
begin
 wf:=ShowWaitForm(TForm(Self.Owner));

 try
   DB.Handle := DB_Handle;
   DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT * FROM UV_REE_VED_S_FOR_PRINT('+IntToStr(IDReestr)+')';
   DSetData.SQLs.SelectSQL.Text := 'SELECT * FROM UV_GRSHEET_SELECT_REE('+IntToStr(IDReestr)+')';

   try

    DSetGlobalData.Open;
    DSetData.Open;

    except
     on E:Exception do
      begin
       ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
       Exit;
      end;
    end;

   Report.Clear;

   Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport,True);

   Report.Variables.Clear;
   Report.Variables[' '+'User Category']:=NULL;
   Report.Variables.AddVariable('User Category','PPeriod',''''+KodSetupToPeriod(DSetGlobalData['KOD_SETUP'],4)+'''');


   Screen.Cursor:=crDefault;
   if zDesignReport then Report.DesignReport
                    else Report.ShowReport;
   Report.Free;

 finally
   CloseWaitForm(wf);
 end;
end;

procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin
if UpperCase(VarName)='PSUMMASTR' then
   Value:= SumToString(DSetGlobalData['SUMMA']);
end;

end.

