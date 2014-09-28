unit UP_uMovingsDataModule;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  Dialogs, Controls;

type
  TdmMovings = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMovings: TdmMovings;
  ActualDate: TDate;
 
procedure ShowInfo(DataSet: TDataSet);

implementation

procedure ShowInfo(DataSet: TDataSet);
var text: string;
    i:integer;
begin
  text:='';
  for i:=1 to DataSet.Fields.Count do
   text:=text+DataSet.Fields[i-1].FieldName+' : '+DataSet.Fields[i-1].DisplayText+#13;
  ShowMessage(text);
end;
{$R *.dfm}


end.
