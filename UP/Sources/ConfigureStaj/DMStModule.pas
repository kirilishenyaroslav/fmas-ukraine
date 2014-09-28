unit DMStModule;

interface

uses
    SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
    FIBQuery, pFIBQuery, Dialogs, pFIBStoredProc;

type
    TDModule = class(TDataModule)
        ReadTransaction: TpFIBTransaction;
        DB: TpFIBDatabase;
        WriteTransaction: TpFIBTransaction;
        SelectStaj: TpFIBDataSet;
        SelectStajSource: TDataSource;
        StajTypePostSet: TpFIBDataSet;
        DSStajTypePost: TDataSource;
        CatSet: TpFIBDataSet;
        CatDs: TDataSource;
        StorProc: TpFIBStoredProc;
        PeopleCalcDS: TDataSource;
        PeopleCalcSet: TpFIBDataSet;
        PeopleNCalcSet: TpFIBDataSet;
        PeopleNCalcDS: TDataSource;
        PeopleTempDS: TDataSource;
        PeopleTempSet: TpFIBDataSet;
        TempClear: TpFIBDataSet;
        TypePost: TpFIBDataSet;
        TypePostDS: TDataSource;
        FilterDataSet: TpFIBDataSet;
    private
    { Private declarations }
    public
    { Public declarations }
        procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
    end;

implementation

{$R *.dfm}
//*************************************************//

procedure TDModule.GetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
     {DataSource1.DataSet:=DM.SelectRaise;
     Dm.SelectRaise.Open;

     DataSource2.DataSet:=Dm.SelectCatRaise;
     Dm.SelectCatRaise.Open;

     Dm.StajDataSet.Open;
     Dm.CatDataSet.Open;}

end;

//*************************************************//
end.
