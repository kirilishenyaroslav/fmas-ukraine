unit gr_SvodDocsDataModul;

interface

uses
  Forms,
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  IBase, Variants, FIBQuery, pFIBQuery, pFIBStoredProc, gr_uMessage,
  Dialogs, gr_uWaitForm, gr_uCommonConsts, gr_uCommonProc;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    StProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
  private
    PLanguageIndex:byte;
  public
    function PrepareData(ADb_Handle:TISC_DB_HANDLE;Kod_setup:Integer):Integer;
    function CurrentKodSetup(ADb_Handle:TISC_DB_HANDLE):integer;
  end;

implementation

{$R *.dfm}
function TDM.CurrentKodSetup(ADb_Handle:TISC_DB_HANDLE):integer;
var PCurrentKodSetup:integer;
begin
 DB.Handle := ADb_Handle;
 ReadTransaction.StartTransaction;
 DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_KOD_SETUP_RETURN';
 DSet.Open;
 PCurrentKodSetup:=DSet['KOD_SETUP'];
 Dset.Close;
 ReadTransaction.Commit;
 CurrentKodSetup:=PCurrentKodSetup;
end;

function TDM.PrepareData(ADb_Handle:TISC_DB_HANDLE;Kod_setup:Integer):integer;
var Res:Integer;
    wf:tform;
begin
PLanguageIndex := IndexLanguage;
wf:=ShowWaitForm(TForm(Self.Owner),wfPrepareData);
DB.Handle:=ADb_Handle;
 try
  StProc.Transaction.StartTransaction;
  StProc.StoredProcName:='GR_SVOD_PREPARE_DATA';
  StProc.Prepare;
  StProc.ParamByName('KOD_SETUP').AsInteger:=Kod_setup;
  StProc.ExecProc;
  Res:=StProc.ParamByName('ID_SESSION').AsInteger;
  StProc.Transaction.Commit;
  CloseWaitForm(wf);
  PrepareData:=Res;
 except
  on E:Exception do
   begin
    StProc.Transaction.Rollback;
    grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOK]);
    PrepareData:=-1;
    CloseWaitForm(wf);
   end;
 end;
end;

end.
