unit DM;

interface

uses
  SysUtils, Classes, DB, RxMemDS;

type
  TDataModule1 = class(TDataModule)
    RxMemoryData1: TRxMemoryData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.
