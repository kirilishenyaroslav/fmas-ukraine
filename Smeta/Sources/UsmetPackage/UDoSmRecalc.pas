unit UDoSmRecalc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, cxLookAndFeelPainters, StdCtrls, cxButtons, ComCtrls,
  ExtCtrls,pFibDataSet, FIBDatabase, pFIBDatabase, UDoRecalcThread,
  UDoOtchThread, Placemnt, PFibStoredProc;

type
  TfrmBURecalc = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    cbMonthDateTo: TComboBox;
    cbMonthDateFrom: TComboBox;
    cbYearDateFrom: TComboBox;
    cbYearDateTo: TComboBox;
    Label6: TLabel;
    CalcProgressBar: TProgressBar;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    WorkDatabase: TpFIBDatabase;
    CalcTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    FormStorage1: TFormStorage;
    procedure cxButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DateFrom:TDateTime;
    DateTo:TDateTime;
    MBook_Date:TDateTime;
    IT:TCalcThread;
    IT_DB:TSmRecalcThread;
    SP:TPFibStoredProc;
    Constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;id_user:Int64);reintroduce;
    destructor Destroy; override;
    procedure OnTerminateCalcThread(Sender: TObject);
    procedure OnTerminateCalcThread_DB(Sender: TObject);    
  end;

implementation

uses GlobalSpr, Resources_Unitb, DateUtils;
{$R *.dfm}

constructor TfrmBURecalc.Create(AOwner: TComponent; DB_Handle: TISC_DB_HANDLE;id_user: Int64);
var SysDS:TpFibDataSet;
    i:Integer;
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DB_HANDLE;
     CalcTransaction.StartTransaction;

     SysDS:=TpFibDataSet.Create(self);
     SysDS.Database:=WorkDatabase;
     SysDS.Transaction:=CalcTransaction;
     SysDS.SelectSQL.Text:='SELECT * FROM PUB_SYS_DATA';
     SysDS.Open;
     DateFrom:=SysDS.FieldByName('MAIN_BOOK_DATE').AsDateTime;
     MBook_Date:=SysDS.FieldByName('MAIN_BOOK_DATE').Value;
     DateTo:=Date;
     SysDS.Close;
     SysDS.Free;

     cbMonthDateFrom.Items.Add(TRIM(BU_Month_01));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_02));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_03));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_04));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_05));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_06));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_07));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_08));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_09));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_10));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_11));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_12));

     for i:=0 to YEARS_COUNT do
     begin
        cbYearDateFrom.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
     end;

     cbMonthDateFrom.ItemIndex:=MonthOf(DateFrom)-1;
     for i:=0 to cbYearDateFrom.Items.Count-1 do
     begin
         if pos(cbYearDateFrom.Items[i],IntToStr(YearOf(DateFrom)))>0
         then begin
            cbYearDateFrom.ItemIndex:=i;
            break;
         end;
     end;

     cbMonthDateTo.Items.Add(TRIM(BU_Month_01));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_02));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_03));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_04));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_05));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_06));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_07));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_08));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_09));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_10));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_11));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_12));

     SP:=TPFibStoredProc.Create(self);
     SP.Database:=WorkDatabase;
     sp.Transaction:=WriteTransaction;

     WriteTransaction.StartTransaction;
     sp.StoredProcName:='MBOOK_BLOCK';
     sp.Prepare;
     sp.ExecProc;
     WriteTransaction.Commit;


     for i:=0 to YEARS_COUNT do
     begin
        cbYearDateTo.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
     end;

     cbMonthDateTo.ItemIndex:=MonthOf(DateTo)-1;
     for i:=0 to cbYearDateTo.Items.Count-1 do
     begin
         if pos(cbYearDateTo.Items[i],IntToStr(YearOf(DateTo)))>0
         then begin
            cbYearDateTo.ItemIndex:=i;
            break;
         end;
     end;
end;

procedure TfrmBURecalc.cxButton2Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmBURecalc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=CaFree;
end;


procedure TfrmBURecalc.OnTerminateCalcThread(Sender: TObject);
begin
     ShowMessage('Процес завершено');
     cxButton1.Caption:='Почати процес';
end;

procedure TfrmBURecalc.OnTerminateCalcThread_DB(Sender: TObject);
begin
     if Assigned(IT)
     then IT.Terminate;
end;



procedure TfrmBURecalc.cxButton1Click(Sender: TObject);
begin
    if (cxButton1.Caption='Завершити')
    then begin
         cxButton1.Caption:='Почати процес';
         if Assigned(IT_DB)
         then begin
                 IT_DB.Terminate;
         end;
    end
    else begin
         cxButton1.Caption:='Завершити';
         IT:=TCalcThread.Create(true,self,2);
         IT.FreeOnTerminate:=true;
         IT.Priority:=tpNormal;
         IT.OnTerminate:=OnTerminateCalcThread;
         IT.Resume;

         IT_DB:=TSmRecalcThread.Create(true,self);
         IT_DB.FreeOnTerminate:=true;
         IT_DB.Priority:=tpNormal;
         IT_DB.OnTerminate:=OnTerminateCalcThread_DB;
         IT_DB.Resume;
    end;
end;

destructor TfrmBURecalc.Destroy;
begin
     WriteTransaction.StartTransaction;
     sp.StoredProcName:='MBOOK_UNBLOCK';
     sp.Prepare;
     sp.ExecProc;
     WriteTransaction.Commit;

     if Assigned(sp) then sp.Free;

     inherited Destroy;
end;

end.
