unit PeopleProp_Ctrl_DM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, IBase, ZTypes, ZProc;

type
  TDM_Ctrl = class(TDataModule)
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
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Parameter:TZPeoplePropParameters;Is_Grant: TZChildSystems);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TDM_Ctrl.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Parameter:TZPeoplePropParameters;Is_Grant: TZChildSystems);
begin
 inherited Create(AOwner);
 case Is_grant of
  tsZarplata:
   DSetProp.SQLs.SelectSQL.Text       := 'SELECT * FROM Z_SP_PEOPLE_PROP_SEL(''F'')';
  tsGrant:
   DSetProp.SQLs.SelectSQL.Text       := 'SELECT * FROM Z_SP_PEOPLE_PROP_SEL(''T'')';
 end;
 case Parameter.TypeId of
  zppptIdMan:
    case Is_grant of
     tsZarplata:
      DSetData.SQLs.SelectSQL.Text     := 'SELECT * FROM Z_MAN_AND_TERMWORK_BY_ID('+IntToStr(Parameter.ID)+')';
     tsGrant:
      DSetData.SQLs.SelectSQL.Text     :='SELECT * FROM GR_MAN_AND_TERMSTUD_BY_ID('+IntToStr(Parameter.ID)+')';
    end;
  zppptIdPeopleProp:
    case Is_grant of
     tsZarplata:
      DSetData.SQLs.SelectSQL.Text     := 'SELECT * FROM Z_PEOPLE_PROP_S_DATA_BY_ID('+IntToStr(Parameter.ID)+',''F'')';
     tsGrant:
      DSetData.SQLs.SelectSQL.Text     := 'SELECT * FROM Z_PEOPLE_PROP_S_DATA_BY_ID('+IntToStr(Parameter.ID)+',''T'')';
    end;


 end;

 DB.Handle                          := DB_Handle;
 DSetProp.Open;
 DSetData.Open;
end;

procedure TDM_Ctrl.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
