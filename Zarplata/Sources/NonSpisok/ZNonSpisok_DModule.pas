unit ZNonSpisok_DModule;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, Ibase;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    DSourceMain: TDataSource;
    DSetMain: TpFIBDataSet;
    DSetChild: TpFIBDataSet;
    DSourceChild: TDataSource;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TDM.Create(AOwner: TComponent; DB_Handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);

 DSetMain.SQLs.SelectSQL.Text:='SELECT * FROM Z_NONSPISOK_S_FIO(NULL)';
 DSetChild.SQLs.SelectSQL.Text:='SELECT * FROM Z_NONSPISOK_S(?ID_MAN)';

 DB.Handle:=DB_Handle;

 DSetMain.Open;
 DSetChild.Open;
end;

end.
