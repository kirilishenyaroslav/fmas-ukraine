unit DMPaymentTypeMain;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, uCs_types,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TDMMainPaymentType = class(TDataModule)
    MainDataSet: TpFIBDataSet;
    MainDataSource: TDataSource;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    WorkDatabase: TpFIBDatabase;
    StoredProc: TpFIBStoredProc;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    constructor create(Parameter:TcsPaymentTypeParam); reintroduce;
  end;

var
  DMMainPaymentType: TDMMainPaymentType;

implementation

{$R *.dfm}

{ TDMPaymentType }

constructor TDMMainPaymentType.create(Parameter: TcsPaymentTypeParam);
begin
  inherited Create(Parameter.Owner);
  WorkDatabase.Handle:=Parameter.DB_Handle;
  MainDataSet.Transaction:=ReadTransaction;
end;

procedure TDMMainPaymentType.DataModuleDestroy(Sender: TObject);
begin
  if ReadTransaction.Active then ReadTransaction.Rollback;
  if WriteTransaction.Active then WriteTransaction.Rollback;
end;

end.
