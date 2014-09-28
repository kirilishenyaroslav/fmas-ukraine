unit uPochasDataModule;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, Dialogs;

type
  TdmPochas = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    PochasSelect: TpFIBDataSet;
    PochasSelectID: TFIBIntegerField;
    PochasSelectID_PARENT: TFIBIntegerField;
    PochasSelectDATE_BEG: TFIBDateField;
    PochasSelectDATE_END: TFIBDateField;
    PochasSelectKOL_HOURS: TFIBBCDField;
    PochasSelectNAME: TFIBStringField;
    PochasSelectREASON: TFIBStringField;
    PochasSelectSMETA_NAME: TFIBStringField;
    PochasSelectDATE_AKT: TFIBDateField;
    PochasSelectNUM_AKT: TFIBStringField;
    PochasSelectNUM_ORDER: TFIBStringField;
    PochasSelectDATE_ORDER: TFIBDateField;
    PochasSelectTARIF_TYPE_NAME: TFIBStringField;
  private
    { Private declarations }
  public
     procedure GetText(Sender: TField; var Text:String; DisplayText:Boolean);
    { Public declarations }
  end;

var
  dmPochas: TdmPochas;

procedure ShowInfo(DataSet: TDataSet);

implementation

{$R *.dfm}

procedure TdmPochas.GetText(Sender: TField; var Text:String; DisplayText:Boolean);
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
