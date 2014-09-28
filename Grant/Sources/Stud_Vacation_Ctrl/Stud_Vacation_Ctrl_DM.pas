unit Stud_Vacation_Ctrl_DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    StProcTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if DefaultTransaction.InTransaction then DefaultTransaction.Commit;
end;

end.
