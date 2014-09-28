unit uPrintSpPostData;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase;

type
  TdmPrintSpPost = class(TDataModule)
    Database: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    ReportDS: TpFIBDataSet;
    PostSource: TDataSource;
    ReadTransaction: TpFIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrintSpPost: TdmPrintSpPost;

implementation

{$R *.dfm}

end.
