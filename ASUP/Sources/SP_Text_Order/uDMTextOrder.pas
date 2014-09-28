unit uDMTextOrder;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet;

type
  TDMTextOrder = class(TDataModule)
    StajDS: TpFIBDataSet;
    WorkDatabase: TpFIBDatabase;
    dsSiognersDSet: TDataSource;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTextOrder: TDMTextOrder;

implementation

{$R *.dfm}

end.
