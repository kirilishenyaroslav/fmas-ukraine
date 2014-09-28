unit DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet;

type
  TData = class(TDataModule)
    DB: TpFIBDatabase;
    SelectOrder: TpFIBDataSet;
    DefaultTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Data: TData;

implementation

{$R *.dfm}

end.
