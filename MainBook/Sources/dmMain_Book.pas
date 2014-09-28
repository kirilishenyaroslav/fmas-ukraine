unit dmMain_Book;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, ImgList, Controls,
  IBDatabase,FmtBcd,Dialogs, cxStyles, cxTL, cxGridCardView,
  cxGridBandedTableView, cxClasses, cxGridTableView, Variants;

type
  TdmMain = class(TDataModule)
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        SmallImages: TImageList;
        MainDatabase: TpFIBDatabase;
    GlobalStyleRepository: TcxStyleRepository;
    DefaultTableViewSheet: TcxGridTableViewStyleSheet;
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
    DefaultBandedTableViewSheet: TcxGridBandedTableViewStyleSheet;
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
    DefaultCardViewSheet: TcxGridCardViewStyleSheet;
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
    DefaultTreeListSheet: TcxTreeListStyleSheet;
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
    procedure ReadTransactionAfterStart(Sender: TObject);
  private
    { Private declarations }
  public
    MAIN_BOOK_DATE:TDateTime;
    TEST_LARGE:int64;
    USE_MO:Boolean;
    id_user_dm:integer;
    { Public declarations }
  end;


var
  dmMain: TdmMain;

implementation

uses MainForm;

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
       if TempdataSet.FieldByName('USE_MO').Value<>null
       then USE_MO:=Boolean(TempdataSet.FieldByName('USE_MO').AsInteger)
       else USE_MO:=false;
       TempdataSet.Close;
       TempdataSet.Free;
end;

end.
