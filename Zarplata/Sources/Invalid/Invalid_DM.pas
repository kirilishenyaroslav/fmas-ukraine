unit Invalid_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  IBase, RxMemDS, FIBQuery, pFIBQuery, pFIBStoredProc, frxClass, frxDBSet,
  frxDesgn, zProc, Forms, Dates;

type
  TDM = class(TDataModule)
    DSource2: TDataSource;
    DSet2: TpFIBDataSet;
    DSource1: TDataSource;
    DSet1: TpFIBDataSet;
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    frxDesigner1: TfrxDesigner;
    rDSet2: TfrxDBDataset;
    rDSet1: TfrxDBDataset;
    Report: TfrxReport;
    procedure DataModuleDestroy(Sender: TObject);
    procedure ReportGetValue(const VarName: String; var Value: Variant);
  private
   pKodSetupBeg:integer;
   pKodSetupEnd:integer;
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
    procedure DoPrint;
    procedure DataSetReOpen;

    property KodSetupEnd:Integer read pKodSetupEnd write pKodSetupEnd;
    property KodSetupBeg:Integer read pKodSetupBeg write pKodSetupBeg;
  end;

implementation

uses StrUtils, ZWait;

{$R *.dfm}

constructor TDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle:=AHandle;
 DefaultTransaction.StartTransaction;
//******************************************************************************
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
if DefaultTransaction.InTransaction then DefaultTransaction.Commit;
end;

procedure TDM.DoPrint;
const NameReport = '\Reports\Zarplata\Invalid.fr3';
begin
 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport,True);
 Report.Variables.Clear;
 DSet1.First;
 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;
end;

procedure TDM.DataSetReOpen;
var wf:TForm;
begin
  wf:=ShowWaitForm(Application.MainForm);
   if DSet2.Active then DSet2.Close;
   if DSet1.Active then DSet1.Close;
   DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_INVALID_SELECT_FIO('+IntToStr(PKodSetupBeg)+','+IntToStr(PKodSetupEnd)+') order by tn';
   DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_INVALID_SELECT_FOR_MAN(?ID_MAN)';
   DSet1.Open;
   DSet2.Open;
  CloseWaitForm(wf);
end;

procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin
if UpperCase(VarName)='PFILTER' then
 begin
  if pKodSetupBeg=pKodSetupEnd then
   Value:='за '+KodSetupToPeriod(pKodSetupBeg,1)
  else
   Value:='з '+KodSetupToPeriod(pKodSetupBeg,1)+' по '+KodSetupToPeriod(pKodSetupEnd,1);
 end;
end;

end.
