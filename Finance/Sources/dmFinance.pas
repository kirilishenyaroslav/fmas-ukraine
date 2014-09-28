unit dmFinance;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, ImgList, Controls,
  IBDatabase,FmtBcd,Dialogs, cxTL, cxGridCardView, cxGridBandedTableView,
  cxClasses, cxStyles, cxGridTableView;

type
  TdmMain = class(TDataModule)
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        SmallImages: TImageList;
        MainDatabase: TpFIBDatabase;
    GlobalStyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    DefaultTableViewSheet: TcxGridTableViewStyleSheet;
    DefaultBandedTableViewSheet: TcxGridBandedTableViewStyleSheet;
    DefaultCardViewSheet: TcxGridCardViewStyleSheet;
    DefaultTreeListSheet: TcxTreeListStyleSheet;
    procedure ReadTransactionAfterStart(Sender: TObject);
  private
    { Private declarations }
  public
    MAIN_BOOK_DATE:TDateTime;
    TEST_LARGE:int64;
    { Public declarations }
  end;


var
  dmMain: TdmMain;

implementation

uses MainFormFinance;

{$R *.dfm}


procedure TdmMain.ReadTransactionAfterStart(Sender: TObject);
var TempdataSet:TpFibDataSet;
begin
       TempdataSet:=TpFibDataSet.Create(self);
       TempdataSet.Database:=dmMain.MainDatabase;
       TempdataSet.Transaction:=dmMain.ReadTransaction;
       TempdataSet.SQLs.SelectSQL.Text:='SELECT * FROM PUB_SYS_DATA';
       TempdataSet.Open;
       MAIN_BOOK_DATE:=TempdataSet.FieldByName('MAIN_BOOK_DATE').AsDateTime;
       TempdataSet.Close;
       TempdataSet.Free;
end;

end.
