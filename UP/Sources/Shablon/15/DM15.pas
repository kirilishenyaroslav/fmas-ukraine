unit DM15;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase;

type
  TdmTemplateRceipte = class(TDataModule)
    fdbTemplateReceipt: TpFIBDatabase;
    ftrTemplateReceipt: TpFIBTransaction;
    fdsTemplateReceipt: TpFIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
