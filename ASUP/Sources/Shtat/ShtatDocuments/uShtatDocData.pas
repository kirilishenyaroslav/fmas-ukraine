unit uShtatDocData;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery;

type
  TdmShtatDoc = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    ShtatDocSelect: TpFIBDataSet;
    ShtatDocSelectID_SR: TFIBIntegerField;
    ShtatDocSelectNAME: TFIBStringField;
    ShtatDocSelectDATE_BEG: TFIBDateField;
    ShtatDocSelectDATE_END: TFIBDateField;
    ShtatDocSelectIS_PLAN: TFIBStringField;
    ShtatDocSelectIS_PROD: TFIBStringField;
    ShtatDocSelectID_TAR_PLAN: TFIBIntegerField;
    ShtatDocSelectNAME_TAR_PLAN: TFIBStringField;
    ShtatDocSelectNAME_DEPARTMENT: TFIBStringField;
    ShtatDocSource: TDataSource;
    SRFundType: TpFIBDataSet;
    SRFundTypeID_SR_FUND_TYPE: TFIBIntegerField;
    SRFundTypeNAME_SR_FUND_TYPE: TFIBStringField;
    SRFundTypeID_POST_PROP: TFIBIntegerField;
    CalcFund: TpFIBDataSet;
    MakeMFundTable: TpFIBDataSet;
    CleanMFundTable: TpFIBQuery;
    WriteTransaction: TpFIBTransaction;
    FundsSelect: TpFIBDataSet;
    FundsSelectID_SR_HOURS_PAY: TFIBIntegerField;
    FundsSelectID_SR_FUND_TYPE: TFIBIntegerField;
    FundsSelectID_SMETA: TFIBIntegerField;
    FundsSelectPERCENT: TFIBIntegerField;
    FundsSelectSUMMA: TFIBBCDField;
    FundsSelectNAME_FUND_TYPE: TFIBStringField;
    FundsSelectNAME_SMETA: TFIBStringField;
    FundsSource: TDataSource;
    DefaultSmeta: TpFIBDataSet;
    DefaultSmetaID_SMETA: TFIBIntegerField;
    DefaultSmetaPERCENT: TFIBFloatField;
    DefaultSmetaSMETA_NAME: TFIBStringField;
    DefaultSmetaSource: TDataSource;
    CategoriesSelect: TpFIBDataSet;
    CategoriesSelectID_CATEGORY: TFIBIntegerField;
    CategoriesSelectNAME_CATEGORY: TFIBStringField;
    CategoriesSelectVYSLUGA: TFIBStringField;
    CategoriesSelectOZDOROVLENIE: TFIBStringField;
    CategoriesSelectDISPLAY_ORDER: TFIBIntegerField;
    SplitSmeta: TpFIBQuery;
    SmetaFilter: TpFIBDataSet;
    SmetaFilterSource: TDataSource;
    SmetaFilterID_SMETA: TFIBBCDField;
    SmetaFilterSMETA_TITLE: TFIBStringField;
    AddSmetaFilterGroup: TpFIBQuery;
    AddSmeta: TpFIBQuery;
    DeleteSmetaFilter: TpFIBQuery;
    GroupFilter: TpFIBDataSet;
    GroupFilterSource: TDataSource;
    GroupFilterID_SMETA_GROUP: TFIBBCDField;
    GroupFilterGROUP_TITLE: TFIBStringField;
    DelSmetaGroup: TpFIBQuery;
    DSConsts: TpFIBDataSet;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Id_Session: Variant;

    constructor Create(AOwner: TComponent; Handle: Integer); reintroduce;
  end;

var
  dmShtatDoc: TdmShtatDoc;

implementation

uses IBase, Variants, UpKernelUnit;

{$R *.dfm}

constructor TdmShtatDoc.Create(AOwner: TComponent; Handle: Integer);
begin
    inherited Create(AOwner);
    DB.Handle := TISC_DB_Handle(Handle);
    Id_Session := Null;
end;

procedure TdmShtatDoc.DataModuleDestroy(Sender: TObject);
begin
    if not VarIsNull(Id_Session) then
    begin
        CleanMFundTable.Transaction.StartTransaction;
        CleanMFundTable.ParamByName('Id_Session').AsInteger := Id_Session;
        CleanMFundTable.ExecQuery;
        CleanMFundTable.Transaction.Commit;
    end;
end;

procedure TdmShtatDoc.DataModuleCreate(Sender: TObject);
begin
    StartHistory(WriteTransaction);
end;

end.
