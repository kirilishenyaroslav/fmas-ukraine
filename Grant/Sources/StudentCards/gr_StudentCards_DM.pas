unit gr_StudentCards_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  ibase, Forms, gr_uWaitForm;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    DSource1: TDataSource;
    DSet1: TpFIBDataSet;
    procedure DataModuleDestroy(Sender: TObject);
  private

  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
var wf: TForm;
begin
 inherited Create(AOwner);
 DB.Handle:=AHandle;
 DefaultTransaction.StartTransaction;
//******************************************************************************
// wf:=ShowWaitForm(TForm(AOwner),wfSelectData);
// DSet1.SQLs.SelectSQL.Text:='SELECT * FROM GR_STUDENT_CARDS_S(null,null,null,''F'') order by FIO';
// DSet1.Open;
// CloseWaitForm(wf);
//******************************************************************************
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if DefaultTransaction.InTransaction then DefaultTransaction.Commit;
end;

end.
