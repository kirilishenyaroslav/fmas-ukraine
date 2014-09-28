unit gr_Stud_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  IBase, RxMemDS, FIBQuery, pFIBQuery, pFIBStoredProc, frxClass, frxDBSet,
  Forms, gr_uCommonConsts, gr_uCommonProc, gr_uMessage, Dialogs, frxDesgn,
  frxExportXLS, frxExportRTF,gr_uCommonTypes,Dates,Variants, gr_FilterDate;

type
  TDM = class(TDataModule)
    DSource21: TDataSource;
    DSet21: TpFIBDataSet;
    DSource1: TDataSource;
    DSet1: TpFIBDataSet;
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    DSource31: TDataSource;
    DSet31: TpFIBDataSet;
    DSource32: TDataSource;
    DSet32: TpFIBDataSet;
    DSource33: TDataSource;
    DSet33: TpFIBDataSet;
    DSource22: TDataSource;
    DSet22: TpFIBDataSet;
    DSet4: TpFIBDataSet;
    DSource4: TDataSource;
    DSourceMain: TDataSource;
    DSetMain: TpFIBDataSet;
    StProcTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    DBDataset: TfrxDBDataset;
    Report: TfrxReport;
    DSetPrint: TpFIBDataSet;
    DSourcePrint: TDataSource;
    RTFExport: TfrxRTFExport;
    XLSExport: TfrxXLSExport;
    DSet34: TpFIBDataSet;
    DSource34: TDataSource;
    DSet5: TpFIBDataSet;
    DSource5: TDataSource;
    pFIBDataSet6: TpFIBDataSet;
    DataSource6: TDataSource;
    pFIBTransaction5: TpFIBTransaction;
    procedure DataModuleDestroy(Sender: TObject);
    procedure ReportGetValue(const VarName: String; var Value: Variant);
  private

  public
    CDate:string;
    form:TFFilterDate;
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE; Param:TParamFilter);reintroduce;
    procedure Print(TypePrint:integer);
  end;

implementation

uses StrUtils;

{$R *.dfm}

const NameReport1               = 'PeoplePrint.fr3';
const NameReport2               = 'PeoplePrintGrant.fr3';
const NameReport3               = 'PeoplePrintCat.fr3';
const NameReport4               = 'PeoplePrintKurs.fr3';

constructor TDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE; Param:TParamFilter);
begin
 inherited Create(AOwner);
 DB.Handle:=AHandle;
 DefaultTransaction.StartTransaction;
 //pFIBTransaction5.StartTransaction;
//******************************************************************************
 DSet1.SQLs.SelectSQL.Text:='SELECT * FROM GR_CN_DT_STUD_S_FIO('
                                                                  +varToStrDef(Param.KodSetup,'Null')+','''
                                                                  +Param.Contract+''','''
                                                                  +Param.Butget+''','
                                                                  +varToStrDef(Param.id_dep,'Null')+','
                                                                  +varToStrDef(Param.id_man,'Null')+','
                                                                  +varToStrDef(Param.id_prop,'Null')+','
                                                                  +varToStrDef(Param.id_cat,'Null')+','
                                                                  +IfThen(Param.Bal_B<>'', StringReplace(Param.Bal_B, ',' , '.' , [rfIgnoreCase]) , 'Null')+','
                                                                  +IfThen(Param.Bal_E<>'',StringReplace(Param.Bal_E, ',' , '.' , [rfIgnoreCase]),'Null')+','
                                                                  +varToStrDef(Param.id_vidopl,'Null')
                                                                  +') order by FIO';
 DSet21.SQLs.SelectSQL.Text:='SELECT * FROM GR_CN_DT_STUD_S(?ID_MAN,'''+Param.Contract+''') order by date_beg desc';
 DSet22.SQLs.SelectSQL.Text:='SELECT * FROM Z_ALIMONY_SELECT(:ID_MAN)';
 DSet31.SQLs.SelectSQL.Text:='SELECT * FROM GR_CN_DT_STUD_INF_S(?ID_STUD)';
 DSet32.SQLs.SelectSQL.Text:='SELECT * FROM GR_DT_GRANTS_S(?ID_STUD)order by date_beg desc';
 DSet33.SQLs.SelectSQL.Text:='SELECT * FROM GR_CURRENT_S(?ID_STUD)order by kod_setup desc';
 DSet34.SQLs.SelectSQL.Text:='SELECT * FROM GR_DT_VACATION_S(?ID_STUD)order by DATE_BEG desc';    //Art
 DSet4.SQLs.SelectSQL.Text:='SELECT * FROM Z_PEOPLE_PROP_SELECT_FORMAN(?ID_MAN,''T'')';
 pFIBDataSet6.SQLs.SelectSQL.Text:='SELECT * FROM GR_INDEX_BASE_KOD_SETUP(?ID_MAN,'+VarToStrDef(Param.KodSetup-1,'Null')+')';
 DSet5.SQLs.SelectSQL.Text:='SELECT * FROM GR_GET_INDEX_ACTS(?ID_MAN)order by kod_setup desc';
 DSetMain.SQLs.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_SCH_SELECT_EX(''NOW'',1,9)';
 //ShowMessage(DSet1.SQLs.SelectSQL.Text);
 DSet1.Open;
 DSet21.Open;
 DSet31.Open;
 DSet34.Open;
 DSet4.Open;
 //pFIBDataSet6.Open;      Осторожно! пишущая транзакция блокирует закинчення операции
 DSet5.Open;
 DSetMain.Open;
//******************************************************************************
end;

procedure TDM.Print(TypePrint:integer);

begin
try
  Report.Clear;
  case TypePrint of
    0: Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReports+NameReport1,True);
    1: Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReports+NameReport2,True);
    2: Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReports+NameReport3,True);
    3: Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReports+NameReport4,True);    
  end;

  if grDesignReport then Report.DesignReport
                    else Report.ShowReport;
except
  on E:Exception do
  begin
    grShowMessage(ECaption[Indexlanguage],e.Message,mtError,[mbOK]);
  end;

end;

end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if DefaultTransaction.InTransaction then DefaultTransaction.Commit;
Report.Free;
form.Free;
end;

procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin
  if UpperCase(VarName)='FIRM' then
    Value:=grNameFirm(DB.Handle);

  if UpperCase(VarName)='CDATE' then
    Value:=CDate;

  if UpperCase(VarName)='KOD_SETUP' then
    Value:=KodSetupToPeriod(DSetPrint['KOD_SETUP'],4);

  if UpperCase(VarName)='DATE_BEG' then
    Value:=DateToStr(form.EditDateBeg.date);

  if UpperCase(VarName)='DATE_END' then
    Value:=DateToStr(form.EditDateEnd.date);

end;

end.
