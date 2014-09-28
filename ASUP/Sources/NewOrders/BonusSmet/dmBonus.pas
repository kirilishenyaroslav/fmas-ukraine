unit dmBonus;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase;

type
  TDataModule2 = class(TDataModule)
    FIBDatabase: TpFIBDatabase;
    FIBDataSet: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    pFIBTransaction2: TpFIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{$R *.dfm}

end.
