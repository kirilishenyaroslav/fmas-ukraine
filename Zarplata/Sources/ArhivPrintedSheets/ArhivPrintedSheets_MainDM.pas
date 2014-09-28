unit ArhivPrintedSheets_MainDM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  Unit_SprSubs_Consts, ZProc, ZSvodTypesUnit, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, ZSvodProcUnit, Unit_ZGlobal_Consts;


type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    DSource: TDataSource;
  private
    PKodSetup:Integer;
    procedure SetKodSetup(AKodSetup:Integer);
  public
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
    property KodSetup:Integer read PKodSetup write SetKodSetup;
  end;


implementation

{$R *.dfm}

constructor TDM.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
 Inherited Create(Aowner);
 PKodSetup := CurrentKodSetup(DB_Handle);
//******************************************************************************
 DB.Handle := DB_Handle;
 DSet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINTED_TO_BANK_S('+IntToStr(PKodSetup)+')';
 DSet.Open;
end;

procedure TDM.SetKodSetup(AKodSetup:integer);
begin
 PKodSetup:=AKodSetup;
 DSet.Close;
 DSet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINTED_TO_BANK_S('+IntToStr(PKodSetup)+')';
 DSet.Open;
end;

end.

