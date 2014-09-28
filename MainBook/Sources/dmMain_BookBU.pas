unit dmMain_BookBU;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, ImgList, Controls,
  IBDatabase,FmtBcd,Dialogs;

type
  TdmMainBU = class(TDataModule)
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        SmallImages: TImageList;
        MainDatabase: TpFIBDatabase;
    IBDatabase1: TIBDatabase;
    procedure ReadTransactionAfterStart(Sender: TObject);
  private
    { Private declarations }
  public
    MAIN_BOOK_DATE:TDateTime;
    TEST_LARGE:int64;
    { Public declarations }
  end;


var
  dmMainBU: TdmMainBU;

implementation

uses MainFormBU;

{$R *.dfm}


procedure TdmMainBU.ReadTransactionAfterStart(Sender: TObject);
var TempdataSet:TpFibDataSet;
begin
       TempdataSet:=TpFibDataSet.Create(self);
       TempdataSet.Database:=dmMainBU.MainDatabase;
       TempdataSet.Transaction:=dmMainBU.ReadTransaction;
       TempdataSet.SQLs.SelectSQL.Text:='SELECT * FROM PUB_SYS_DATA';
       TempdataSet.Open;
       MAIN_BOOK_DATE:=TempdataSet.FieldByName('MAIN_BOOK_DATE').AsDateTime;
       TempdataSet.Close;
       TempdataSet.Free;
end;

end.
