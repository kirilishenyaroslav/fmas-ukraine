unit PeopleWorkMode_Ctrl_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, IBase, ZTypes, ZProc;

type
  TDMWorkMode_Ctrl = class(TDataModule)
    DB: TpFIBDatabase;
    DSetProp: TpFIBDataSet;
    DSourceProp: TDataSource;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    DSetData: TpFIBDataSet;
    procedure DataModuleDestroy(Sender: TObject);
  private

  public
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Parameter:TZPeopleWorkModeParameters;Is_Grant: TZChildSystems);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TDMWorkMode_Ctrl.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Parameter:TZPeopleWorkModeParameters;Is_Grant: TZChildSystems);
begin
     inherited Create(AOwner);

     DSetProp.SQLs.SelectSQL.Text       := 'SELECT * FROM DT_WORK_MODE';
     DSetData.SQLs.SelectSQL.Text       := 'SELECT * FROM Z_MANSDATA_BY_RMOVING_EX('+IntToStr(Parameter.rmoving)+')';

     DB.Handle                          := DB_Handle;
     DSetProp.Open;
     DSetData.Open;
end;

procedure TDMWorkMode_Ctrl.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
