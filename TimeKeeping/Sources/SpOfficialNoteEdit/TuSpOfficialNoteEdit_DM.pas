unit TuSpOfficialNoteEdit_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    RTransaction: TpFIBTransaction;
    StTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    DSet1: TpFIBDataSet;
    DSource1: TDataSource;
    DSetWorkMode: TpFIBDataSet;
    DSourceWorkMode: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
