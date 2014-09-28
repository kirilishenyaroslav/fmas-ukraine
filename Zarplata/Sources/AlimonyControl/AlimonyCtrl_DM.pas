unit AlimonyCtrl_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, IBase, ZTypes;

type
  TDM_Ctrl = class(TDataModule)
    Db: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DSetData: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AParameter:TZAlimonyParameters);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TDM_Ctrl.Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AParameter:TZAlimonyParameters);
begin
inherited Create(AOwner);
 if AParameter.ControlFormStyle=zcfsInsert then
  DSetData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_FIO_AND_TERM_BY_ID_MAN('+IntToStr(AParameter.ID)+')'
 else
  DSetData.SQLs.SelectSQL.Text := 'SELECT * FROM Z_ALIMONY_SELECT_BY_ID('+IntToStr(AParameter.ID)+')';
 Db.Handle := ADB_HANDLE;
 ReadTransaction.StartTransaction;
 DSetData.Open; 
end;

procedure TDM_Ctrl.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
