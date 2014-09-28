unit uFamilyDataModule;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, Dialogs;

type
  TdmFamily = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    FamilySelect: TpFIBDataSet;
    FamilySource: TDataSource;
  private
    { Private declarations }
  public
     procedure GetText(Sender: TField; var Text:String; DisplayText:Boolean);
    { Public declarations }
  end;

var
  dmFamily: TdmFamily;

procedure ShowInfo(DataSet: TDataSet);

implementation

{$R *.dfm}

procedure TdmFamily.GetText(Sender: TField; var Text:String; DisplayText:Boolean);
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
