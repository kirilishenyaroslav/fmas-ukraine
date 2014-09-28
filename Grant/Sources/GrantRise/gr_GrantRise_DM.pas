unit gr_GrantRise_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  ibase, FIBQuery, pFIBQuery, pFIBStoredProc, frxClass, frxDBSet, frxDesgn, gr_uCommonProc,
  UpKernelUnit, ZProc;

//form
const GrantRiseByDate_Text              :array[1..2] of string = ('Данні підвищення','Данные повышения');
const GrantRiseProblem_Text             :array[1..2] of string = ('Проблемні записи','Проблемные записи');
//grid
const GridClSummaNew_Caption            :array[1..2] of string = ('Нова сума','Новая сумма');
const GridClTotal_Caption               :array[1..2] of string = ('Кількість','Количество');
const GridClTotalSum_Caption            :array[1..2] of string = ('Сума разом','Сумма всего');
const GridClTotalSumNew_Caption         :array[1..2] of string = ('Нова сума разом','Новая сумма всего');
const GridClDateRise_Caption            :array[1..2] of string = ('Дата підвищення','Дата повышения');
//btn
const RollbackBtn_Caption               :array[1..2] of string = ('Відмінити без проблемних','Отменить без проблемных');
const RollbackAllBtn_Caption            :array[1..2] of string = ('Відмінити з проблемними','Отменить с проблемными');
//message
const RiseCommit_Text                   :array[1..2] of string = ('Зміни прийняті','Изменения приняты');
const RiseRollback_Text                 :array[1..2] of string = ('Зміни відмінені','Изменения отменены');

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSet1: TpFIBDataSet;
    DSet2: TpFIBDataSet;
    UpdateTransaction: TpFIBTransaction;
    DSource1: TDataSource;
    DSource2: TDataSource;
    StoredProc: TpFIBStoredProc;
    DSet3: TpFIBDataSet;
    DSource3: TDataSource;
    DBDataset: TfrxDBDataset;
    Designer: TfrxDesigner;
    Report: TfrxReport;
    procedure DataModuleDestroy(Sender: TObject);
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure UpdateTransactionAfterStart(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  if ReadTransaction.InTransaction then ReadTransaction.Commit;
  Report.Free;
end;

procedure TDM.ReportGetValue(const VarName: String; var Value: Variant);
begin
  if UpperCase(VarName)='FIRM' then
    Value:=grNameFirm(DB.Handle);
end;

procedure TDM.UpdateTransactionAfterStart(Sender: TObject);
begin
  UpKernelUnit.StartHistory(UpdateTransaction,ValueFieldZSetup(DB.Handle,'GR_ID_SYSTEM'));
end;

end.
