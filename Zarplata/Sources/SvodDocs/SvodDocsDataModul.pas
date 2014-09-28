unit SvodDocsDataModul;

interface

uses
  Forms,
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  IBase, Variants, ZSvodTypesUnit, FIBQuery, pFIBQuery, pFIBStoredProc, ZMessages,
  Unit_SvodDocs_Consts,Dialogs, ZWait;

type
  TDModule = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    StProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
  private
  public
    function PrepareData(ADb_Handle:TISC_DB_HANDLE;Kod_setup:Integer;TypeData:TTypeData):Integer;
    function PrepareDataFonds(ADb_Handle:TISC_DB_HANDLE;Kod_setup:Integer;TypeData:TTypeData):Integer;
    function CurrentKodSetup(ADb_Handle:TISC_DB_HANDLE):integer;
  end;

implementation

{$R *.dfm}
function TDModule.CurrentKodSetup(ADb_Handle:TISC_DB_HANDLE):integer;
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

function TDModule.PrepareData(ADb_Handle:TISC_DB_HANDLE;Kod_setup:Integer;TypeData:TTypeData):integer;
var Res:Integer;
    wf:tform;
begin
wf:=ShowWaitForm(TForm(Self.Owner));
DB.Handle:=ADb_Handle;
 try
  StProc.Transaction.StartTransaction;
  StProc.StoredProcName:='Z_SVOD_PREPARE_DATA';
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
    ZShowMessage(Error_Caption,E.Message,mtError,[mbOk]);
    PrepareData:=-1;
    CloseWaitForm(wf);
   end;
 end;
end;

function TDModule.PrepareDataFondS(ADb_Handle:TISC_DB_HANDLE;Kod_setup:Integer;TypeData:TTypeData):integer;
var Res:Integer;
    wf:tform;
begin
wf:=ShowWaitForm(TForm(Self.Owner));
DB.Handle:=ADb_Handle;
 try
  StProc.Transaction.StartTransaction;
  StProc.StoredProcName:='Z_REESTR_FOND_SMETA';
  StProc.Prepare;
  StProc.ParamByName('KOD_SETUP').AsInteger:=Kod_setup;
  StProc.ParamByName('IS_BY_FIO').AsString:='T';
  StProc.ExecProc;
  Res:=StProc.ParamByName('ID_SESSION').AsInteger;
  StProc.Transaction.Commit;
  CloseWaitForm(wf);
  PrepareDataFonds:=Res;
 except
  on E:Exception do
   begin
    StProc.Transaction.Rollback;
    ZShowMessage(Error_Caption,E.Message,mtError,[mbOk]);
    PrepareDataFonds:=-1;
    CloseWaitForm(wf);
   end;
 end;
end;

end.
