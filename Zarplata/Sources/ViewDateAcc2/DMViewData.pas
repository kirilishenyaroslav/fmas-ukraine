unit DMViewData;

interface

uses
  SysUtils, Classes, FIBDataSet, DB, pFIBDataSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery,Controls, pFIBStoredProc, pFIBErrorHandler, IBASE, Dates,
  variants, dialogs;

type
  TDatesAcc2Dm = class(TDataModule)
    MainDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    DSet1: TpFIBDataSet;
    DSource1: TDataSource;
    ReadTransaction: TpFIBTransaction;
    FillSpisokForCountQuery: TpFIBStoredProc;
    QClean: TpFIBQuery;
    SProcRaschet: TpFIBStoredProc;
    DSet2: TpFIBDataSet;
    DSource2: TDataSource;
    DSet3: TpFIBDataSet;
    DSource3: TDataSource;
    DSet5: TpFIBDataSet;
    DSource5: TDataSource;
    SProcDelete: TpFIBStoredProc;
    QGen: TpFIBQuery;
  private
    
    { Private declarations }
  public
    PSes_man:int64;
    PSES_ACC:int64;
    Year:     Integer;
    Month:    Integer;
    KodSetup2:Integer;
    DateBeg:  TDate;
    DateEnd:  TDate;
    KodSetup1:  Integer;
    constructor create(AOwner : TComponent; DB:TISC_DB_HANDLE; KodSetupBeg:integer; KodSetupEnd:integer; id_man: variant);

  end;

var
  DatesAcc2Dm: TDatesAcc2Dm;

implementation

constructor TDatesAcc2Dm.create(AOwner : TComponent; DB:TISC_DB_HANDLE; KodSetupBeg:integer; KodSetupEnd:integer; id_man: variant);
begin
  inherited create(AOwner);
  MainDatabase.Handle:= DB;
  ReadTransaction.StartTransaction;

  WriteTransaction.StartTransaction;                    //сесссия для менов(для каждого юзера отдельно)
  QGen.SQL.Text :='select id_ses from GET_GEN_Z_SPISOK_FOR_COUNT_VIEW';
  QGen.ExecQuery;
  PSes_man:=QGen['id_ses'].value;
  WriteTransaction.Commit;

  WriteTransaction.StartTransaction;
  FillSpisokForCountQuery.StoredProcName:='Z_GET_SPISOK_FOR_COUNT_NEW_VIEW';
  FillSpisokForCountQuery.ParamByName('KIND_OF_CHOOSE').Value:='F';

  FillSpisokForCountQuery.ParamByName('HOL_DATE_BEG').Value   :=ConvertKodToDate(KodSetupBeg);
  FillSpisokForCountQuery.ParamByName('HOL_DATE_END').Value   :=ConvertKodToDate(KodSetupEnd);


  FillSpisokForCountQuery.ParamByName('DATE_BEG').Value   :=ConvertKodToDate(KodSetupBeg);
  FillSpisokForCountQuery.ParamByName('DATE_END').Value   :=ConvertKodToDate(KodSetupEnd);

  FillSpisokForCountQuery.ParamByName('IN_ID_MAN').Value:=id_man;

  FillSpisokForCountQuery.ParamByName('ID_VID_OPL_PROP').Value:=NUll;

  FillSpisokForCountQuery.ParamByName('ID_DEPARTMENT').Value:=null;
  FillSpisokForCountQuery.ParamByName('ID_SESSION').asint64:=PSes_man;


  try
    FillSpisokForCountQuery.ExecProc;
    WriteTransaction.Commit;
  except on E:Exception
    do
      begin
        ShowMessage(E.Message);
        WriteTransaction.Rollback;
      end;
  end;

  WriteTransaction.StartTransaction;
  SProcRaschet.StoredProcName:='Z_PAYMENT_COUNT_VIEW';
  SProcRaschet.ParamByName('id_man').AsInt64:=id_man;
  SProcRaschet.ParamByName('DATE_BEG').AsDate:=ConvertKodToDate(KodSetupBeg);
  SProcRaschet.ParamByName('DATE_END').AsDate:=ConvertKodToDate(KodSetupEnd);

  try
    SProcRaschet.ExecProc;
    PSES_ACC:=SProcRaschet.ParamByName('id_session').AsInt64;
    WriteTransaction.Commit;
  except on E:Exception
    do
      begin
        ShowMessage(E.Message);
        WriteTransaction.Rollback;
      end;
  end;

  DSet1.Close;
  DSet2.Close;
  DSet3.Close;
  DSet5.Close;

  DSet1.SelectSQL.text:='Select V.id_man, P.FIO_UPPER as FIO, P.TIN as TIN, PC.TN as TN, V.p1 as P1 '+
    'from z_spisok_for_count_VIEW V inner join People P on P.id_man = V.id_man left join PRIVATE_CARDS PC on V.id_man=PC.id_man '+
    'Where V.id_session='+intToStr(PSes_man);
  DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACC_PEOPLE_LIST_ACCS_VIEW(?ID_MAN,'
                                                             +IntToStr(KodSetupBeg)+','
                                                             +IntToStr(KodSetupEND)+','
                                                             +IntToStr(0)+','
                                                             +IntToStr(3)+','
                                                             +IntToStr(PSES_ACC)+') order by KOD_SETUP_2,DATE_ACC descending';
  DSet3.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_S_VIEW(?ID_GROUP_ACCOUNT,?ID_MAN,?KOD_SETUP_2) order by Kod_vidopl';

  DSet5.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_S_SHEET_VIEW(?ID_MAN,?ID_GROUP_ACCOUNT) ORDER BY KOD_SHEET';


  DSet1.Open;
  DSet2.Open;
  DSet3.Open;

  DSet5.Open;
 
  DSet1.FetchAll;
  DSet2.FetchAll;
  DSet3.FetchAll;
  DSet5.FetchAll;
end;



{$R *.dfm}

end.
