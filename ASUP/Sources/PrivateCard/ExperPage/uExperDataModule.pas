unit uExperDataModule;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, Dialogs, pFIBStoredProc;

type
  TdmExper = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    ExperSelect: TpFIBDataSet;
    ExperSource: TDataSource;
    InsertUpdate: TpFIBQuery;
    DeleteQ: TpFIBQuery;
    OrderDataSet: TpFIBDataSet;
    HistExperSelect: TpFIBDataSet;
    ManCalcStajDSet: TpFIBDataSet;
    StorProc: TpFIBStoredProc;
  private
    { Private declarations }
  public
     procedure GetText(Sender: TField; var Text:String; DisplayText:Boolean);
    { Public declarations }
  end;

var
  dmExper: TdmExper;

procedure ShowInfo(DataSet: TDataSet);

implementation

{$R *.dfm}

procedure TdmExper.GetText(Sender: TField; var Text:String; DisplayText:Boolean);
begin
end;

procedure ShowInfo(DataSet: TDataSet);
var text: string;
    i:integer;
begin
  text:='';
  for i:=1 to DataSet.Fields.Count do
   text:=text+DataSet.Fields[i-1].FieldName+' : '+DataSet.Fields[i-1].DisplayText+#13;
  ShowMessage(text);
end;
end.
