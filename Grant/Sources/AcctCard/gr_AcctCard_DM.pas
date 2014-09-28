unit gr_AcctCard_DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TDM_Ctrl = class(TDataModule)
    StoredProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    DSource: TDataSource;
    DSet: TpFIBDataSet;
    DefaultTransaction: TpFIBTransaction;
    DataBase: TpFIBDatabase;
    DSourceTypePayment: TDataSource;
    DSetTypePayment: TpFIBDataSet;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_Ctrl: TDM_Ctrl;

implementation

{$R *.dfm}

procedure TDM_Ctrl.DataModuleDestroy(Sender: TObject);
begin
if DefaultTransaction.InTransaction then DefaultTransaction.Commit;
end;

end.
