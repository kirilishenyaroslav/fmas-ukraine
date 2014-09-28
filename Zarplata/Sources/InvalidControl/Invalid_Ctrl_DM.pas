unit Invalid_Ctrl_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, IBase, ZTypes;

type
  TDM_Ctrl = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    DSetData: TpFIBDataSet;
    procedure DataModuleDestroy(Sender: TObject);
  private

  public
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Parameter:TZCtrlWithHistoryParam);reintroduce;
  end;

implementation

uses Variants;

{$R *.dfm}

constructor TDM_Ctrl.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Parameter:TZCtrlWithHistoryParam);
begin
 inherited Create(AOwner);
 case Parameter.ControlFormStyle of
  zcfsInsert:
   DSetData.SQLs.SelectSQL.Text     := 'SELECT * FROM Z_MAN_AND_TERMWORK_BY_ID('+IntToStr(Parameter.ID)+')';
  else
   DSetData.SQLs.SelectSQL.Text     := 'SELECT * FROM Z_INVALID_S('+IntToStr(Parameter.ID)+','''+DateTimeToStr(Parameter.Use_DateTime)+''')';
 end;
 DB.Handle                          := DB_Handle;
 DSetData.Open;
end;

procedure TDM_Ctrl.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
