unit uFLangDataModule;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, Dialogs;

type
  TdmFLang = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    FLangSelect: TpFIBDataSet;
    FLangSource: TDataSource;
    DeleteQuery: TpFIBQuery;
    InsertUpdate: TpFIBQuery;
    pFIBDS_IsShow: TpFIBDataSet;
    pFIBDS_OldLang: TpFIBDataSet;
    pFIBDS_OldLangLANG: TFIBStringField;
    procedure FLangSelectAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
     procedure GetText(Sender: TField; var Text:String; DisplayText:Boolean);
    { Public declarations }
  end;

var
  dmFLang: TdmFLang;

procedure ShowInfo(DataSet: TDataSet);

implementation

{$R *.dfm}

procedure TdmFLang.FLangSelectAfterOpen(DataSet: TDataSet);
begin
//  DataSet.FieldByName('Date_beg').OnGetText:=GetText;
//  DataSet.FieldByName('Date_end').OnGetText:=GetText;
end;

procedure TdmFLang.GetText(Sender: TField; var Text:String; DisplayText:Boolean);
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
