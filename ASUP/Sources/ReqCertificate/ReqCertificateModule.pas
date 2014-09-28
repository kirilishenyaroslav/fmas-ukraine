unit ReqCertificateModule;

interface

uses
  SysUtils, Classes, frxClass, frxDBSet, frxDesgn;

type
  TDataModule1 = class(TDataModule)
    frxReqCertificate: TfrxReport;
    frxDesigner: TfrxDesigner;
    frxDBDataset: TfrxDBDataset;
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
