unit gar_Dm_Comulative_HelpList;

interface

uses
  SysUtils, Classes, ibase, Forms, DB, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, frxClass, frxDBSet, frxDesgn,
  gr_uMessage, Dialogs, gr_uWaitForm,gar_LoadPackageGarage,
  Variants, Dates, frxExportXLS, gar_Types, gar_GarageProc;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    pFIBDataSet1: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    Report: TfrxReport;
    DataSource1: TDataSource;
    pFIBDataSet2: TpFIBDataSet;
    DataSource2: TDataSource;
    pFIBDataSet3: TpFIBDataSet;
    DataSource3: TDataSource;
    pFIBDataSet4: TpFIBDataSet;
    frxDBDataset4: TfrxDBDataset;
    DataSource4: TDataSource;
    frxAvtoDBDset: TfrxDBDataset;
    frxUchastokDSet: TfrxDBDataset;
    AvtoDSet: TpFIBDataSet;
    UchastokDSet: TpFIBDataSet;
    AvtoDSource: TDataSource;
    UchastokDSource: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
    procedure ReportGetValue(const VarName: String; var Value: Variant);
  private
    AParam:Tgar_ComulativeList_Period;
  public
    { Public declarations }

    constructor Create(Param:Tgar_ComulativeList_Period);reintroduce;
  end;


var DM:TDM;

implementation

{$R *.dfm}
const Report_ComulativeList           = 'gar_ComulativeList.fr3';     //za mesyac po mashine
const Report_ComulativeList_Help      = 'gar_ComulativeList_Help.fr3'; // za mesyac po familiyam i ostalnom
const Report_Vedomost_AVTO            = 'Gar_Vedomost_AVTO.fr3'; //



constructor TDM.Create(Param:Tgar_ComulativeList_Period);
var FullNameReport:string;
k:Integer;
begin
  inherited  Create(Param.Owner);
  DB.Handle:=Param.DB_handle;
  DataSource1.DataSet:= pFIBDataSet1;
  frxDBDataset1.DataSource:=DataSource1;
  pFIBDataSet4.DataSource:=DataSource1;
  AParam:=Param;

  AvtoDSet.Close;
  UchastokDSet.Close;
  AvtoDSet.SelectSQL.Text := 'select * from GAR_VEDOMOST_MONTH_AVTO(:d1,:d2)';
  AvtoDSet.ParamByName('d1').AsDate := Param.DATE_BEG;
  AvtoDSet.ParamByName('d2').AsDate := Param.DATE_END;
  UchastokDSet.SelectSQL.Text := 'select * from GAR_VEDOMOST_UCH_SUM_AVTO(:d1,:d2) where id_avto = :id_avto';
  UchastokDSet.ParamByName('d1').AsDate := Param.DATE_BEG;
  UchastokDSet.ParamByName('d2').AsDate := Param.DATE_END;
  AvtoDSet.Open;
  UchastokDSet.Open;

  if AvtoDSet.IsEmpty then
  begin
    ShowMessage('Записей не обнаружено');
    exit;
  end;


  FullNameReport := Report_Vedomost_AVTO;
  Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReports+FullNameReport,True);
  Report.Variables.Clear;
  Report.Variables['datebeg'] := ''''+DateToStr(Param.DATE_BEG)+'''';
  Report.Variables['dateend'] := ''''+DateToStr(Param.DATE_END)+'''';

  if garDesignReport  then
    Report.DesignReport
  else
    Report.ShowReport;
 // Report.DesignReport;


  {pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM GAR_COMULATIVELIST_BY_AVTO('
  +IntToStr(TgatFilter_ComulativeList(Param).Kod_Setup)+','+IntToStr(TgatFilter_ComulativeList(Param).ParamAvto.id)+')';}
  { pFIBDataSet1.Close;
   pFIBDataSet2.Close;
   pFIBDataSet3.Close;
   pFIBDataSet4.Close;

  pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM GAR_COMULATIVELIST_HELP('''
  +DateToStr(Param.DATE_BEG)+''','''+DateToStr(Param.DATE_END)+''')';

  pFIBDataSet2.SQLs.SelectSQL.Text:='SELECT * FROM GAR_GET_PEOPLE_BY_OTCHET('''+
  'gar_ComulativeList_FIO'+''','+'1'+')';

  pFIBDataSet3.SQLs.SelectSQL.Text:='SELECT * FROM GAR_GET_PEOPLE_BY_OTCHET('''+
  'gar_ComulativeList_FIO'+''','+'2'+')';

  pFIBDataSet4.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_PART_S(:ID_WAYBILL)';

   pFIBDataSet1.Open;
   pFIBDataSet2.Open;
   pFIBDataSet3.Open;
   if not pFIBDataSet1.IsEmpty then
    pFIBDataSet4.Open;

   if pFIBDataSet1.IsEmpty then
    begin
      ShowMessage('Записей не обнаружено');
      exit;
    end;

  
  Report.Clear;
  FullNameReport:=Report_ComulativeList_HELP;
  Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReports+FullNameReport,True);

  if garDesignReport then Report.DesignReport
                     else Report.ShowReport;
  Report.Free; }
end;



procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  if Transaction.InTransaction then Transaction.Commit;
end;



procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin

  if UpperCase(VarName)='KOD_SETUP' then
    begin
      Value:=KodSetupToPeriod(AParam.Kod_Setup,2);
    end;

  if UpperCase(VarName)='FIO_VED_BUHG' then
    begin
      Value:=pFIBDataSet2['FIO'];
    end;

  if UpperCase(VarName)='NAZV_DOLGN_VED_BUHG' then
    begin
      Value:=pFIBDataSet2['NAME_DOLGNOST'];
    end;

  if UpperCase(VarName)='FIO_ST_MEH' then
    begin
      Value:=pFIBDataSet3['FIO'];
    end;

  if UpperCase(VarName)='NAZV_DOLGN_ST_MEH' then
    begin
      Value:=pFIBDataSet3['NAME_DOLGNOST'];
    end;
end;

end.
