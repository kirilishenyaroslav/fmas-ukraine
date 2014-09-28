unit RaiseStajData;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, Dialogs;

type
  TDM = class(TDataModule)
    ReadTransaction: TpFIBTransaction;
    DefaultTransaction: TpFIBTransaction;
    DB: TpFIBDatabase;
    SelectRaise: TpFIBDataSet;
    DelStajRaise: TpFIBQuery;
    SelectCatRaise: TpFIBDataSet;
    StajDataSet: TpFIBDataSet;
    StajDataSource: TDataSource;
    WriteTransaction: TpFIBTransaction;
    CatDataSet: TpFIBDataSet;
    CatDataSource: TDataSource;
    PostDataSet: TpFIBDataSet;
    sp_post: TpFIBDataSet;
    PostsDataSource: TDataSource;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    posts_data_source: TDataSource;
    CatRegSource: TDataSource;
    PostRegSource: TDataSource;
    CatRegSet: TpFIBDataSet;
    PostRegSet: TpFIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetText(Sender: TField; var Text:String; DisplayText:Boolean);
  end;

var
  DM: TDM;
  procedure ShowInfo(DataSet: TDataSet);
implementation

{$R *.dfm}
//*************************************************//
 procedure TDM.GetText(Sender: TField; var Text:String; DisplayText:Boolean);
begin
     {DataSource1.DataSet:=DM.SelectRaise;
     Dm.SelectRaise.Open;

     DataSource2.DataSet:=Dm.SelectCatRaise;
     Dm.SelectCatRaise.Open;

     Dm.StajDataSet.Open;
     Dm.CatDataSet.Open;}

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
//*************************************************//
end.

