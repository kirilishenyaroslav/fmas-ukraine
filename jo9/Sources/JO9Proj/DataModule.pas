unit DataModule;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, cxContainer, cxEdit,
  cxGridTableView, cxClasses, cxStyles, cxTL, FIBQuery, pFIBQuery,
  pFIBStoredProc,Accmgmt;

type
  TDM = class(TDataModule)
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGridTableViewStyleSheet2: TcxGridTableViewStyleSheet;
    cxEditStyleController1: TcxEditStyleController;
    StoredProc: TpFIBStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.

