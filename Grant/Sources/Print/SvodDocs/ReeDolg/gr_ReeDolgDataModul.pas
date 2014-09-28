unit gr_ReeDolgDataModul;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, Unit_SvodDocs_Consts,
  TypInfo, gr_uCommonConsts, gr_uCommonProc, gr_uWaitForm,
  gr_uCommonLoader, gr_uMessage, RxMemDS, frxExportXLS;

Type TReeParam = record
  DB_Handle:TISC_DB_HANDLE;
  AOwner:TComponent;
  Kod_setup:integer;
end;

Type TReeDolgParam = record
  FoundationParam : TReeParam;
  Id_Sch : Variant;
end;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    Designer: TfrxDesigner;
    DSetDolgData: TpFIBDataSet;
    ReportDBDSetDolgData: TfrxDBDataset;
    Report: TfrxReport;
    DSetSchs: TpFIBDataSet;
    ReportDBDSetSchsData: TfrxDBDataset;
    DataSource: TDataSource;
    frxXLSExport1: TfrxXLSExport;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleDestroy(Sender: TObject);
  private
    PKod_Setup:Integer;
    PLanguageIndex:byte;
  public
    function PrintSpr(AParameter:TReeDolgParam):variant;
  end;


implementation

{$R *.dfm}

const NameReport               ='\grReeDolg.fr3';

function TDM.PrintSpr(AParameter:TReeDolgParam):variant;
var DateForm:tdate;
    i: byte;
    wf:TForm;
begin
 DateForm:=ConvertKodToDate(AParameter.FoundationParam.Kod_setup);
 PKod_Setup:=AParameter.FoundationParam.Kod_setup;
 PLanguageIndex := IndexLanguage;

 DSetSchs.SQLs.SelectSQL.Text        := 'SELECT * FROM GR_SVOD_SCHES('+VarToStrDef(AParameter.Id_Sch[0],'NULL')+','''+DateToStr(DateForm)+''' )';
 DSetDolgData.SQLs.SelectSQL.Text := 'SELECT * FROM GR_REEDOLG_BYSCH(?ID_SCH,'+VarToStr(AParameter.FoundationParam.Kod_setup)+')';

 try
  wf:=ShowWaitForm(TForm(AParameter.FoundationParam.AOwner),wfPrepareData);
  DB.Handle:=AParameter.FoundationParam.DB_Handle;
  DSetSchs.Open;
  for i:=1 to (VarArrayHighBound(AParameter.Id_Sch,1)-1) do
  begin
    DSetSchs.SQLs.InsertSQL.Text := 'SELECT * FROM GR_SVOD_SCHES('+VarToStrDef(AParameter.Id_Sch[i],'NULL')+','''+DateToStr(DateForm)+''' )';
    DSetSchs.Insert;
    DSetSchs.Post;
  end;
  DSetDolgData.Open;
 except
   on E:Exception do
    begin
      CloseWaitForm(wf);
      ZShowMessage(Error_Caption,e.Message,mtError,[mbOK]);
      Exit;
    end;
 end;
 CloseWaitForm(wf);

 Report.Clear;
 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReports+NameReport,True);
 if grDesignReport then Report.DesignReport
                    else Report.ShowReport;

 Report.Free;
end;

procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin
if UpperCase(VarName)='PKOD_SETUP' then
  Value:=KodSetupToPeriod(PKod_Setup,5);

if UpperCase(VarName)='FIRM' then
  Value:=grNameFirm(DB.Handle);
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
