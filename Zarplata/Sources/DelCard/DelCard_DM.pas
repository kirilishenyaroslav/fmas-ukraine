unit DelCard_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  IBase, frxClass, frxDBSet, frxDesgn, Forms, zProc, PackageLoad, Variants, zTypes;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    DSet1: TpFIBDataSet;
    rDSet1: TfrxDBDataset;
    rDSet2: TfrxDBDataset;
    DSet2: TpFIBDataSet;
    frxDesigner1: TfrxDesigner;
    Report: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
    procedure DataSetsReOpen(Bank_ID:integer);
    procedure DoPrint(Bank_ID:Integer; Bank_Name:string='');
  end;

var
  DM: TDM;

implementation

{$R *.dfm}
constructor TDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
//******************************************************************************
 DB.Handle:=AHandle;
 Transaction.StartTransaction;
end;

procedure TDM.DataSetsReOpen(Bank_ID:integer);
begin
  if DSet1.Active then DSet1.Close;
  if DSet2.Active then DSet2.Close;
  DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_MAN_SELECT_FOR_CARD('+IntToStr(Bank_ID)+')';
  DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_SETUP';
  DSet1.Open;
  DSet2.Open;
end;

procedure TDM.DoPrint(Bank_ID:Integer; Bank_Name:string='');
const ReportName='Reports\Zarplata\ReportAcceptedPBank';
var FileName:string;
viplata:variant;
begin
 DataSetsReOpen(Bank_ID);
 DSet1.First;
 DSet2.First;

 FileName:=ExtractFilePath(Application.ExeName)+ReportName+
              IntToStr(Bank_ID)+'_'+DSet2.FieldByName('NUM_PREDPR').AsString+'.fr3';
 If FileExists(FileName) then
   begin
     Report.LoadFromFile(FileName,True);
     Report.Variables.Clear;
     if zDesignReport then Report.DesignReport
                      else Report.ShowReport;
   end
 else
   begin
     FileName:=ExtractFilePath(Application.ExeName)+ReportName+'_Common.fr3';
     if FileExists(FileName) then
       begin
         Report.LoadFromFile(FileName,True);
         Report.Variables.Clear;
         Report.Variables['FULL_NAME']:=''''+AnsiUpperCase(Bank_Name)+'''';
         if zDesignReport then Report.DesignReport
                          else Report.ShowReport;
       end
     else
        begin
          viplata:=LoadViplata(Application,  DB.Handle,zfsModal);
          if VarType(viplata) and varTypeMask <> VarNull then DoPrint(viplata[0],viplata[1]);
        end;
   end;
end;

end.
