unit uMinZPData;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase;

type
  TdmMinZP = class(TDataModule)
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DefaultTransaction: TpFIBTransaction;
    MinZPSelect: TpFIBDataSet;
    MinZPSource: TDataSource;
    MinZPSelectID_MIN_ZP: TFIBIntegerField;
    MinZPSelectVALUE_MIN_ZP: TFIBFloatField;
    MinZPSelectDATE_BEG: TFIBDateField;
    MinZPSelectDATE_END: TFIBDateField;
    CheckZP: TpFIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMinZP: TdmMinZP;

implementation

{$R *.dfm}

end.
