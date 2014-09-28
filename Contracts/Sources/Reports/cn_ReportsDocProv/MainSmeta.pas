unit MainSmeta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase,cn_Common_Types,cn_Common_Funcs, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxCheckBox, cxLookAndFeelPainters, cxGridTableView, RxMemDS, ExtCtrls,
  frxClass, frxDesgn, frxDBSet, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, StdCtrls,
  cxButtons, ComCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  Cn_uReportsConst, cxContainer;
type
  TfrmMainViewReportsSmeta = class(TForm)
    cxGridDB: TcxGrid;
    cxGridDBDBTableView1: TcxGridDBTableView;
    CxSelectField: TcxGridDBColumn;
    CxNameField: TcxGridDBColumn;
    RxNameVariantDB: TcxGridDBColumn;
    cxGridDBLevel1: TcxGridLevel;
    cxGridCR: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    RxNameVariantKD: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridSM: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    RxNameVariantSmRzSt: TcxGridDBColumn;
    RxNameVariantSmeta: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    StatusBar1: TStatusBar;
    cxButtonOK: TcxButton;
    cxButtonCancel: TcxButton;
    Database: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    Transaction: TpFIBTransaction;
    pFIBStoredProcSaveRX: TpFIBStoredProc;
    DataSourceMaster: TDataSource;
    pFIBDataSetPrintMaster: TpFIBDataSet;
    frxDBDatasetMaster: TfrxDBDataset;
    pFIBDataSetPrintDetail: TpFIBDataSet;
    frxDBDatasetDetails: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    TimerReports: TTimer;
    RxMemoryData: TRxMemoryData;
    frxDBDatasetMasterRX: TfrxDBDataset;
    pFIBDataSetPrintMasterRX: TpFIBDataSet;
    pFIBDataSetSchDB: TpFIBDataSet;
    pFIBDataSetSchCR: TpFIBDataSet;
    pFIBDataSetSM: TpFIBDataSet;
    RxMemoryDataDB: TRxMemoryData;
    DataSourceDB: TDataSource;
    RxMemoryDataCR: TRxMemoryData;
    DataSourceCR: TDataSource;
    DataSourceSM: TDataSource;
    RxMemoryDataSM: TRxMemoryData;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    frxReport: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonCancelClick(Sender: TObject);
    procedure cxButtonOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    Constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE;ID_SES:Int64);overload;
    function SelectBU():string;
    { Public declarations }
  end;

var
  frmMainViewReportsSmeta: TfrmMainViewReportsSmeta;
  Sql_Master_l,sql_master_add_l,Sql_Detail_l,select_res:String;
  res:Variant;
  ID_SESSION:int64;
  PLanguageIndex:Integer;
implementation

{$R *.dfm}

function TfrmMainViewReportsSmeta.SelectBU():string;
begin
  ShowModal;
  SelectBU:=select_res;
  free;
end;

Constructor TfrmMainViewReportsSmeta.Create(AOwner : TComponent;DB:TISC_DB_HANDLE;ID_SES:Int64);
var
  i,j:Integer;
  FieldCount:Integer;
  MFR:TfrxMemoView;
  CountVisible:Integer;
begin
  Inherited Create(AOwner);

  PLanguageIndex:=                      cn_Common_Funcs.cnLanguageIndex();

  Database.Handle:=DB;

  ID_SESSION := ID_SES;

  pFIBDataSetSchDB.Database:=Database;
  pFIBDataSetSchDB.Transaction:=Transaction;

  pFIBDataSetSchDB.Active:=false;
  pFIBDataSetSchDB.ParamByName('ID_SESSION').Asint64:= ID_SESSION;
  pFIBDataSetSchDB.Active:=true;
  pFIBDataSetSchDB.FetchAll;

  RxMemoryDataDB.EmptyTable;
  for i:=0 to pFIBDataSetSchDB.RecordCount-1 do
    begin
      RxMemoryDataDB.Open;
      RxMemoryDataDB.Insert;
      RxMemoryDataDB.FieldByName('RxSelectField').Value:=1;
      RxMemoryDataDB.FieldByName('RxNameField').Value:=pFIBDataSetSchDB.FieldByName('sch_number_db').AsString;
      RxMemoryDataDB.FieldByName('RxNameVariant').Value:=pFIBDataSetSchDB.FieldByName('sch_title_db').AsString;
      RxMemoryDataDB.Post;
      pFIBDataSetSchDB.Next;
    end;



  pFIBDataSetSchCR.Database:=Database;
  pFIBDataSetSchCR.Transaction:=Transaction;

  pFIBDataSetSchCR.Active:=false;
  pFIBDataSetSchCR.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
  pFIBDataSetSchCR.Active:=true;
  pFIBDataSetSchCR.FetchAll;

  RxMemoryDataCR.EmptyTable;
  for i:=0 to pFIBDataSetSchCR.RecordCount-1 do
    begin
      RxMemoryDataCR.Open;
      RxMemoryDataCR.Insert;
      RxMemoryDataCR.FieldByName('RxSelectField').Value:=1;
      RxMemoryDataCR.FieldByName('RxNameField').Value:=pFIBDataSetSchCR.FieldByName('sch_number_kd').AsString;
      RxMemoryDataCR.FieldByName('RxNameVariant').Value:=pFIBDataSetSchCR.FieldByName('sch_title_kd').AsString;
      RxMemoryDataCR.Post;
      pFIBDataSetSchCR.Next;
    end;

  pFIBDataSetSM.Database:=Database;
  pFIBDataSetSM.Transaction:=Transaction;

  pFIBDataSetSM.Active:=false;
  pFIBDataSetSM.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
  pFIBDataSetSM.Active:=true;

  pFIBDataSetSM.FetchAll;

  RxMemoryDataSM.EmptyTable;
  for i:=0 to pFIBDataSetSM.RecordCount-1 do
    begin
      RxMemoryDataSM.Open;
      RxMemoryDataSM.Insert;
      RxMemoryDataSM.FieldByName('RxSelectField').Value:=1;
      RxMemoryDataSM.FieldByName('RxNameField').Value:=pFIBDataSetSM.FieldByName('SMETA_KOD').AsString+'.'+pFIBDataSetSM.FieldByName('RAZD_KOD').AsString+'.'+pFIBDataSetSM.FieldByName('ST_KOD').AsString+'.'+pFIBDataSetSM.FieldByName('KEKV_KOD').AsString;
      RxMemoryDataSM.FieldByName('RxNameVariant').Value:=pFIBDataSetSM.FieldByName('SMETA_TITLE').AsString;

      RxMemoryDataSM.FieldByName('RxMemoryDataSM').Value:=pFIBDataSetSM.FieldByName('SMETA_KOD').AsVariant;
      RxMemoryDataSM.FieldByName('RxMemoryDataRAZD').Value:=pFIBDataSetSM.FieldByName('RAZD_KOD').AsVariant;
      RxMemoryDataSM.FieldByName('RxMemoryDataST').Value:=pFIBDataSetSM.FieldByName('ST_KOD').AsVariant;
      RxMemoryDataSM.FieldByName('RxMemoryDataKEKV').Value:=pFIBDataSetSM.FieldByName('KEKV_KOD').AsVariant;

      RxMemoryDataSM.Post;
      pFIBDataSetSM.Next;
    end;
  cxButtonOK.Caption := Cn_uReportsConst.cn_ButtonView[PLanguageIndex];
  cxButtonCancel.Caption := Cn_uReportsConst.cn_ButtonCancel[PLanguageIndex];

  Caption := Cn_uReportsConst.cn_RepFormFilter[PLanguageIndex];

  RxNameVariantDB.Caption:= Cn_uReportsConst.cn_RepSchDB[PLanguageIndex];
  RxNameVariantKD.Caption:= Cn_uReportsConst.cn_RepSchKD[PLanguageIndex];
  RxNameVariantSmRzSt.Caption:= Cn_uReportsConst.cn_RepSmeta[PLanguageIndex];
  RxNameVariantSmeta.Caption:= Cn_uReportsConst.cn_RepSmetaName[PLanguageIndex];
end;

procedure TfrmMainViewReportsSmeta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMainViewReportsSmeta.cxButtonCancelClick(Sender: TObject);
begin
  select_res:='';
  Close;
end;

procedure TfrmMainViewReportsSmeta.cxButtonOKClick(Sender: TObject);
var
  sql_where_db,sql_where_cr,sql_where_sm,sql_master_result,sql_detail_result:String;
  i:Integer;
  MFR:TfrxMemoView;
begin
      sql_where_db:='';
      RxMemoryDataDB.First;

      for i:=0 to RxMemoryDataDB.RecordCount-1 do
        begin
          if RxMemoryDataDB.FieldByName('RxSelectField').Value=1 then
            begin
              if sql_where_db<>'' then
                begin
                  sql_where_db:=sql_where_db+' or ';
                end;
             sql_where_db:=sql_where_db+ ' P.SCH_NUMBER_DB='+''''+RxMemoryDataDB.FieldByName('RxNameField').AsString+'''';
            end;
          RxMemoryDataDB.next;
        end;

      sql_where_db:='('+sql_where_db+')';

      sql_where_cr:='';
      RxMemoryDataCR.First;

      for i:=0 to RxMemoryDataCR.RecordCount-1 do
        begin
          if RxMemoryDataCR.FieldByName('RxSelectField').Value=1 then
            begin
              if sql_where_cr<>'' then
                begin
                  sql_where_cr:=sql_where_cr+' or ';
                end;
              sql_where_cr:=sql_where_cr+ ' P.SCH_NUMBER_KD='+''''+RxMemoryDataCR.FieldByName('RxNameField').AsString+'''';
            end;
          RxMemoryDataCR.next;
        end;

      sql_where_cr:='('+sql_where_cr+')';

      sql_where_sm:='';
      RxMemoryDataSM.First;

      for i:=0 to RxMemoryDataSM.RecordCount-1 do
        begin
          if RxMemoryDataSM.FieldByName('RxSelectField').Value=1 then
            begin
              if sql_where_sm<>'' then
                begin
                  sql_where_sm:=sql_where_sm+' or ';
                end;
              sql_where_sm:=sql_where_sm+ '(P.SMETA_KOD='+''''+RxMemoryDataSM.FieldByName('RxMemoryDataSM').asString+'''';
              sql_where_sm:=sql_where_sm+ ' and  P.RAZD_KOD='+''''+RxMemoryDataSM.FieldByName('RxMemoryDataRAZD').asString+'''';
              sql_where_sm:=sql_where_sm+ ' and  P.ST_KOD='+''''+RxMemoryDataSM.FieldByName('RxMemoryDataST').asString+'''';
              sql_where_sm:=sql_where_sm+ ' and  P.KEKV_KOD='+''''+RxMemoryDataSM.FieldByName('RxMemoryDataKEKV').asString+''''+')';
            end;
          RxMemoryDataSM.next;
        end;
        sql_where_sm:='('+sql_where_sm+')';

      if (sql_where_db='()') then
        begin
          messageBox(Handle,PChar(Cn_uReportsConst.Studcity_MESSAGE_SCH_DB[PLanguageIndex]),
               PChar(Cn_uReportsConst.Studcity_MESSAGE_WARNING_CONST[PLanguageIndex]),MB_ICONWARNING or MB_OK);
          exit;
        end;

      if (sql_where_cr='()') then
        begin
          messageBox(Handle,PChar(Cn_uReportsConst.Studcity_MESSAGE_SCH_KD[PLanguageIndex]),
               PChar(Cn_uReportsConst.Studcity_MESSAGE_WARNING_CONST[PLanguageIndex]),MB_ICONWARNING or MB_OK);
          exit;
        end;

      if (sql_where_sm='()') then
        begin
          messageBox(Handle,PChar(Cn_uReportsConst.Studcity_MESSAGE_SMETA[PLanguageIndex]),
               PChar(Cn_uReportsConst.Studcity_MESSAGE_WARNING_CONST[PLanguageIndex]),MB_ICONWARNING or MB_OK);
          exit;
        end;
      select_res:=' and '+sql_where_db+' and '+sql_where_cr+' and '+sql_where_sm;
      close;
end;

end.
