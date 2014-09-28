unit SpecialNotes_DM;

interface

uses
  SysUtils, Classes, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,IBase;

type
  TSpecialNotesDM = class(TDataModule)
    DB: TpFIBDatabase;
    SpecialNotesDSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    SpecialNotesDSource: TDataSource;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  SpecialNotesDM: TSpecialNotesDM;


implementation

{$R *.dfm}
constructor TSpecialNotesDM.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB.Handle := AHandle;
 ReadTransaction.StartTransaction;
end;

end.
