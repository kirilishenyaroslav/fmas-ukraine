unit dmLoaderMain;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery;

type
  TMainDM = class(TDataModule)
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    LoaderDataSet: TpFIBDataSet;
    DataSource: TDataSource;
    LoaderDataSetID_REPORT: TFIBIntegerField;
    LoaderDataSetPACKAGE_NAME: TFIBStringField;
    LoaderDataSetREPORT_TITLE: TFIBStringField;
    WriteTransaction: TpFIBTransaction;
    UpdateGroupQuery: TpFIBQuery;
    GroupsDataSet: TpFIBDataSet;
    GroupsDataSetREPORT_GROUP: TFIBStringField;
    GroupsDataSource: TDataSource;
    LoaderDataSetREPORT_GROUP: TFIBStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainDM: TMainDM;

implementation

{$R *.dfm}

procedure TMainDM.DataModuleCreate(Sender: TObject);
begin
    Database.Connected:=False;
end;

end.
