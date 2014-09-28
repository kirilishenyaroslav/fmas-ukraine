unit gar_DM_ComulativeList_By_Avto;

interface

uses
  SysUtils, Classes, gar_Types, DB, frxClass, frxDBSet, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, dialogs, Forms, gar_LoadPackageGarage,
  gar_GarageProc, frxDesgn;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    pFIBDataSet1: TpFIBDataSet;
    Report: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    DataSource1: TDataSource;
    pFIBDataSet2: TpFIBDataSet;
    frxDBDataset2: TfrxDBDataset;
    DataSource2: TDataSource;
    pFIBDataSet3: TpFIBDataSet;
    frxDBDataset3: TfrxDBDataset;
    DataSource3: TDataSource;
    pFIBDataSet4: TpFIBDataSet;
    frxDBDataset4: TfrxDBDataset;
    DataSource4: TDataSource;
    pFIBDataSet5: TpFIBDataSet;
    frxDBDataset5: TfrxDBDataset;
    DataSource5: TDataSource;
    pFIBDataSet6: TpFIBDataSet;
    frxDBDataset6: TfrxDBDataset;
    DataSource6: TDataSource;
    frxAvtoDBDset: TfrxDBDataset;
    frxUchastokDSet: TfrxDBDataset;
    AvtoDSet: TpFIBDataSet;
    UchastokDSet: TpFIBDataSet;
    AvtoDSource: TDataSource;
    UchastokDSource: TDataSource;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleDestroy(Sender: TObject);
  private
    AParam :Tgar_ComulativeList_By_Avto;
  public
    { Public declarations }
    constructor Create(Param:Tgar_ComulativeList_By_Avto);reintroduce;
  end;

var
  DM: TDM;

const Report_ComulativeList           = 'gar_ComulativeList.fr3';     //za mesyac po mashine
const Report_ComulativeList_FIO       = 'gar_ComulativeList_FIO.fr3'; // za mesyac po familiyam i ostalnom


implementation

{$R *.dfm}


constructor TDM.Create(Param:Tgar_ComulativeList_By_Avto);
var FullNameReport:string;
k:Integer;
begin
  inherited  Create(Param.Owner);
  DB.Handle:=Param.DB_handle;
  DataSource1.DataSet:= pFIBDataSet1;
  frxDBDataset1.DataSource:=DataSource1;
  AParam:=Param;

  {AvtoDSet.Close;
  UchastokDSet.Close;
  AvtoDSet.SelectSQL.Text := 'select * from GAR_VEDOMOST_MONTH_AVTO(:d1,:d2)';
  AvtoDSet.ParamByName('d1').AsDate := Param.DateBeg;
  AvtoDSet.ParamByName('d2').AsDate := Param.DateEnd;
  UchastokDSet.SelectSQL.Text := 'select * from GAR_VEDOMOST_UCH_SUM_AVTO(:d1,:d2) where id_avto = :id_avto';
  UchastokDSet.ParamByName('d1').AsDate := Param.DateBeg;
  UchastokDSet.ParamByName('d2').AsDate := Param.DateEnd;
  AvtoDSet.Open;
  UchastokDSet.Open;

  if AvtoDSet.IsEmpty then
  begin
    ShowMessage('Записей не обнаружено');
    exit;
  end;

  Report.Clear;
  FullNameReport:=Report_ComulativeList;
  Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReports+FullNameReport,True);

 { if garDesignReport  then
    Report.DesignReport
  else
    Report.ShowReport;}
 { Report.DesignReport;      }

  pFIBDataSet1.Close;
  pFIBDataSet2.Close;
  pFIBDataSet3.Close;
  pFIBDataSet4.Close;
  pFIBDataSet5.Close;
  pFIBDataSet6.Close;

  pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM GAR_COMULATIVELIST_BY_AVTO('''
  +DateToStr(Param.DateBeg)+''','''+DateToStr(Param.DateEnd)+''','+IntToStr(Param.ParamAvto.id)+')';

  pFIBDataSet2.SQLs.SelectSQL.Text:='SELECT * FROM GAR_COMULATIVELIST_BY_AVTO_SEC('''
  +DateToStr(Param.DateBeg)+''','''+DateToStr(Param.DateEnd)+''','+IntToStr(Param.ParamAvto.id)+')';

  pFIBDataSet3.SQLs.SelectSQL.Text:='SELECT * FROM GAR_GET_PEOPLE_BY_OTCHET('''+
  'gar_ComulativeList'+''','+'3'+')';

  pFIBDataSet4.SQLs.SelectSQL.Text:='SELECT * FROM GAR_GET_PEOPLE_BY_OTCHET('''+
  'gar_ComulativeList'+''','+'2'+')';

  pFIBDataSet5.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_PART_S(:ID_WAYBILL)';

  pFIBDataSet6.SQLs.SelectSQL.Text:='SELECT * FROM GAR_COMULATIVELIST_BY_AVTO_SUM('''
  +DateToStr(Param.DateBeg)+''','''+DateToStr(Param.DateEnd)+''','+IntToStr(Param.ParamAvto.id)+')';

   pFIBDataSet1.Open;
   pFIBDataSet2.Open;
   pFIBDataSet3.Open;
   pFIBDataSet4.Open;
   pFIBDataSet6.Open;

   if pFIBDataSet1.IsEmpty then
    begin
      ShowMessage('Записей не обнаружено');
      exit;
    end
    else pFIBDataSet5.Open;

  Report.Clear;
  FullNameReport:=Report_ComulativeList;
  Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReports+FullNameReport,True);

  if garDesignReport then Report.DesignReport
                     else Report.ShowReport;
  //Report.DesignReport;
end;


procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin

  if UpperCase(VarName)='FIO_BUHG' then
    begin
      Value:=pFIBDataSet3['FIO'];
    end;

  if UpperCase(VarName)='NAZV_DOLGN_BUHG' then
    begin
      Value:=pFIBDataSet3['NAME_DOLGNOST'];
    end;

  if UpperCase(VarName)='FIO_ST_MEH' then
    begin
      Value:=pFIBDataSet4['FIO'];
    end;

  if UpperCase(VarName)='NAZV_DOLGN_ST_MEH' then
    begin
      Value:=pFIBDataSet4['NAME_DOLGNOST'];
    end;

  if UpperCase(VarName)='DATE_BEG' then
    begin
      Value:=APAram.DateBeg;
    end;

  if UpperCase(VarName)='DATE_END' then
    begin
      Value:=APAram.DateEnd;
    end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  if Transaction.InTransaction then Transaction.Commit;
end;

end.
