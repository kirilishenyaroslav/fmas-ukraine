unit DopNach_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  IBase, RxMemDS, FIBQuery, pFIBQuery, pFIBStoredProc, Dates, frxClass,
  frxDBSet, Forms, frxDesgn, zProc;

type
  TDM = class(TDataModule)
    DSource2: TDataSource;
    DSet2: TpFIBDataSet;
    DSource1: TDataSource;
    DSet1: TpFIBDataSet;
    DSource3: TDataSource;
    DSet3: TpFIBDataSet;
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    IndexChildHelpProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    DSet4: TpFIBDataSet;
    fDSet4: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    Report: TfrxReport;
    procedure DataModuleDestroy(Sender: TObject);
    procedure ReportGetValue(const VarName: String; var Value: Variant);
  private
    pKodSetupBeg:integer;
    pKodSetupEnd:integer;
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
    procedure DataSetsReOpen;
    procedure DoPrint;

    property KodSetupBeg:Integer read pKodSetupBeg write pKodSetupBeg;
    property KodSetupEnd:Integer read pKodSetupEnd write pKodSetupEnd;
  end;

implementation

uses StrUtils, ZWait;

{$R *.dfm}
constructor TDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
//******************************************************************************
 DB.Handle:=AHandle;
 DefaultTransaction.StartTransaction;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
 if DefaultTransaction.InTransaction then DefaultTransaction.Commit;
end;

procedure TDM.DataSetsReOpen;
var wf:TForm;
begin
  wf:=ShowWaitForm(Application.MainForm);
   if DSet3.Active then DSet3.Close;
   if DSet2.Active then DSet2.Close;
   if DSet1.Active then DSet1.Close;
   DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_DOP_NACH_LISTPEOPLE('+IntToStr(pKodSetupBeg)+','+IntToStr(pKodSetupEnd)+') order by tn';
   DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_ASUP_RMOVING(?ID_MAN)';
   DSet3.SQLs.SelectSQL.Text:='SELECT * FROM Z_DOP_NACH_SELECT(?ID_MAN,'+IntToStr(pKodSetupBeg)+','+IntToStr(pKodSetupEnd)+') order By DATE_BEG';
   DSet1.Open;
   DSet2.Open;
   DSet3.Open;
  CloseWaitForm(wf);
end;

procedure TDM.DoPrint;
const NameReport = '\Reports\Zarplata\DopNach.fr3';
var wf:TForm;
begin
 wf:=ShowWaitForm(Self.Owner as TForm);
 if DSet4.Active then DSet4.Close;
 DSet4.SQLs.SelectSQL.Text:='SELECT * FROM Z_DOP_NACH_SELECT_FOR_REPORT('+IntToStr(pKodSetupBeg)+','+IntToStr(pKodSetupEnd)+') order by kod_vidopl, tn';
 DSet4.Open;
 Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport,True);
 Report.Variables.Clear;
 DSet4.First;
 CloseWaitForm(wf);
 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;
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
