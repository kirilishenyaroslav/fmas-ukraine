unit dmStajBonusOrder;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DateUtils, Controls, DB,
  FIBDataSet, pFIBDataSet, RxMemDS, FIBQuery, pFIBQuery, Messages, Dialogs;

type
  TDMStaj = class(TDataModule)
    LocalWriteTransaction: TpFIBTransaction;
    LocalReadTransaction: TpFIBTransaction;
    LocalDatabase: TpFIBDatabase;
    WorkQuery: TpFIBDataSet;
    ReportDataDataSet: TpFIBDataSet;
  private
    { Private declarations }
  public
    IdOrder : Integer;
    DateOrder : TDate;
    Num_item : Integer;
  end;

var
  DMStaj: TDMStaj;


implementation

uses Variants;

{$R *.dfm}


end.
