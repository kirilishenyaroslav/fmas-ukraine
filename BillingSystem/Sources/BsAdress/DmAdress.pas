unit DmAdress;

interface

uses
  SysUtils, Classes, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, cxGridDBTableView, BaseTypes,
  Messages, Dialogs;


type
  TDmAdr = class(TDataModule)
    AdrTransWrite: TpFIBTransaction;
    StreetSet: TpFIBDataSet;
    AdrDB: TpFIBDatabase;
    AdrTransRead: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    StreetSorce: TDataSource;
    PlaceSet: TpFIBDataSet;
    DistrictSet: TpFIBDataSet;
    RegionSet: TpFIBDataSet;
    CountrySet: TpFIBDataSet;
    PlaceSource: TDataSource;
    DistrictSource: TDataSource;
    RegionSource: TDataSource;
    CountrySource: TDataSource;
    DSetConst: TpFIBDataSet;
    CityAreaSet: TpFIBDataSet;
    CityAreaSource: TDataSource;
    AdresSet: TpFIBDataSet;
    procedure DataModuleDestroy(Sender: TObject);
    procedure CountrySetAfterOpen(DataSet: TDataSet);
    procedure CountrySetBeforeClose(DataSet: TDataSet);
    procedure RegionSetAfterOpen(DataSet: TDataSet);
    procedure RegionSetBeforeClose(DataSet: TDataSet);
    procedure PlaceSetBeforeClose(DataSet: TDataSet);
    procedure PlaceSetAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure StreetDSetOpen;
    procedure CountryDSetOpen;
    procedure RegionDSetOpen;
    procedure DistrictDSetOpen;
    procedure PlaceDSetOpen;
  end;

var
  DmAdr: TDmAdr;

implementation

uses Variants;

{$R *.dfm}

procedure TDmAdr.StreetDSetOpen;
begin
   StreetSet.Close;
   StreetSet.Open;
end;

procedure TDmAdr.CountryDSetOpen;
begin
  CountrySet.Close;
  CountrySet.Open;
end;

procedure TDmAdr.RegionDSetOpen;
begin
   RegionSet.Close;
   RegionSet.Open;
end;

procedure TDmAdr.DistrictDSetOpen;
begin
   DistrictSet.Close;
   DistrictSet.Open;
end;

procedure TDmAdr.PlaceDSetOpen;
begin
   PlaceSet.Close;
   PlaceSet.Open;
end;

procedure TDmAdr.DataModuleDestroy(Sender: TObject);
var i:Integer;
begin
   for i:=0 to AdrDB.TransactionCount-1 do
   begin
      if AdrDB.Transactions[i].Active then AdrDB.Transactions[i].Rollback;
   end;
   AdrDB.Close;
end;




procedure TDmAdr.CountrySetAfterOpen(DataSet: TDataSet);
begin
   RegionSet.Open;
end;

procedure TDmAdr.CountrySetBeforeClose(DataSet: TDataSet);
begin
   RegionSet.Close;
end;

procedure TDmAdr.RegionSetAfterOpen(DataSet: TDataSet);
begin
   DistrictSet.Open;
   PlaceSet.Open;
end;

procedure TDmAdr.RegionSetBeforeClose(DataSet: TDataSet);
begin
   DistrictSet.Close;
   PlaceSet.Close;
end;

procedure TDmAdr.PlaceSetBeforeClose(DataSet: TDataSet);
begin
   StreetSet.Close;
   CityAreaSet.Close;
end;

procedure TDmAdr.PlaceSetAfterOpen(DataSet: TDataSet);
begin
   StreetSet.Open;
   CityAreaSet.Open;
end;

end.
