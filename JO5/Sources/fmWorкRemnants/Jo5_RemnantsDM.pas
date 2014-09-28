unit Jo5_RemnantsDM;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, frxClass, frxDBSet, frxDesgn, Forms;

type
  TDM = class(TDataModule)
    DefaultTransaction: TpFIBTransaction;
    DSetMain: TpFIBDataSet;
    DSourceMain: TDataSource;
    TransactionWrite: TpFIBTransaction;
    DSource2: TDataSource;
      frxDBDataset1: TfrxDBDataset;
      frxDBDataset2: TfrxDBDataset;
    pFIBDataSet2: TpFIBDataSet;
    DB: TpFIBDatabase;
    StProc: TpFIBStoredProc;
    Designer: TfrxDesigner;
    DSet2: TpFIBDataSet;
    frxReport1: TfrxReport;
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
if VarName = 'Period' then
begin
  StProc.Transaction.active:=true;
  StProc.StoredProcName:='JO5_GET_SETUP_OPTIONS';
  StProc.Prepare;
  StProc.ParamByName('IN_ID_SYSTEM').asinteger:=9;
  StProc.ExecProc;
  Value:=StProc.ParamByName('OUT_NAME_SYSTEM').asstring;
  StProc.Transaction.commit;
end;
   if VarName = 'Visa' then
        Value :={ VisaText + }DateToStr( Date );


end;




end.
