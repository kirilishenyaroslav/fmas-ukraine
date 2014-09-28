unit uAdr_DataModule;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TAdrDM = class(TDataModule)
    pFIBDB_Adr: TpFIBDatabase;
    pFIBDS_SelectAdr: TpFIBDataSet;
    pFIBT_ReadAdr: TpFIBTransaction;
    pFIBT_WriteAdr: TpFIBTransaction;
    pFIBDS_SelectStreet: TpFIBDataSet;
    pFIBDS_SelectPlace: TpFIBDataSet;
    pFIBDS_SelectPlaceID_PLACE: TFIBIntegerField;
    pFIBDS_SelectPlaceNAME_PLACE: TFIBStringField;
    pFIBDS_SelectPlaceIS_DISTRICT_CENTRE: TFIBStringField;
    pFIBDS_SelectPlaceIS_REGIONAL_CENTRE: TFIBStringField;
    pFIBDS_SelectPlaceIS_CAPITAL: TFIBStringField;
    pFIBDS_SelectStreetID_STREET: TFIBIntegerField;
    pFIBDS_SelectStreetNAME_STREET: TFIBStringField;
    pFIBDS_SelectAdrID_ADRESS: TFIBIntegerField;
    pFIBDS_SelectAdrZIPCODE: TFIBStringField;
    pFIBDS_SelectAdrID_CITY_AREA: TFIBIntegerField;
    pFIBDS_SelectAdrID_STREET: TFIBIntegerField;
    pFIBDS_SelectAdrKORPUS: TFIBStringField;
    pFIBDS_SelectAdrHOUSE: TFIBStringField;
    pFIBDS_SelectAdrFLAT: TFIBStringField;
    pFIBDS_SelectAdrDATE_BEG: TFIBDateField;
    pFIBDS_SelectAdrDATE_END: TFIBDateField;
    pFIBDS_SelectAdrSTREET_NAME: TFIBStringField;
    pFIBDS_SelectAdrPLACE_NAME: TFIBStringField;
    pFIBDS_SelectAdrCOUNTRY_NAME: TFIBStringField;
    pFIBDS_SelectAdrDISTRICT_NAME: TFIBStringField;
    pFIBDS_SelectAdrREGION_NAME: TFIBStringField;
    pFIBDS_SelectAdrID_ADR_PK: TFIBIntegerField;
    pFIBQ_Delete: TpFIBQuery;
    pFIBDS_SelectAdrCAREA_NAME: TFIBStringField;
    pFIBDS_SelectAdrFULL_NAME: TFIBStringField;
    pFIBDS_Id: TpFIBDataSet;
    pFIBDS_IdZIPCODE: TFIBStringField;
    pFIBDS_IdID_CITY_AREA: TFIBIntegerField;
    pFIBDS_IdID_STREET: TFIBIntegerField;
    pFIBDS_IdKORPUS: TFIBStringField;
    pFIBDS_IdHOUSE: TFIBStringField;
    pFIBDS_IdFLAT: TFIBStringField;
    pFIBDS_IdDATE_BEG: TFIBDateField;
    pFIBDS_IdDATE_END: TFIBDateField;
    pFIBDS_IdADRESS_NAME: TFIBStringField;
    pFIBDS_IdID_ADR_PK: TFIBIntegerField;
    pFIBDS_IdNAME_CITY_AREA: TFIBStringField;
    pFIBDS_Idfull_name: TStringField;
    pFIBDS_SelectCountry: TpFIBDataSet;
    pFIBDS_SelectCountryID_COUNTRY: TFIBIntegerField;
    pFIBDS_SelectCountryNAME_COUNTRY: TFIBStringField;
    DSourceStreet: TDataSource;
    DSourceRegion: TDataSource;
    DSourcePlace: TDataSource;
    DSourceDistrict: TDataSource;
    DSourceCountry: TDataSource;
    pFIBDS_SelectRegion: TpFIBDataSet;
    pFIBDS_SelectRegionID_REGION: TFIBIntegerField;
    pFIBDS_SelectRegionNAME_REGION: TFIBStringField;
    pFIBDS_SelectDistrict: TpFIBDataSet;
    pFIBDS_SelectDistrictID_DISTRICT: TFIBIntegerField;
    pFIBDS_SelectDistrictNAME_DISTRICT: TFIBStringField;
    pFIBDS_SelectArea: TpFIBDataSet;
    DSourceArea: TDataSource;
    pFIBDS_SelectAreaID_CITY_AREA: TFIBIntegerField;
    pFIBDS_SelectAreaNAME_CITY_AREA: TFIBStringField;
    DSetSearch: TpFIBDataSet;
    StProcAddress: TpFIBStoredProc;
    pFIBDS_IdID_COUNTRY: TFIBIntegerField;
    pFIBDS_IdID_REGION: TFIBIntegerField;
    pFIBDS_IdID_DISTRICT: TFIBIntegerField;
    pFIBDS_IdID_PLACE: TFIBIntegerField;
    DSetPlace: TpFIBDataSet;
    procedure pFIBDS_SelectRegionAfterScroll(DataSet: TDataSet);
    procedure pFIBDS_SelectDistrictAfterScroll(DataSet: TDataSet);
    procedure pFIBDS_SelectPlaceAfterScroll(DataSet: TDataSet);
    procedure pFIBDS_SelectCountryAfterScroll(DataSet: TDataSet);
    procedure pFIBDS_SelectCountryBeforeClose(DataSet: TDataSet);
    procedure pFIBDS_SelectRegionBeforeClose(DataSet: TDataSet);
    procedure pFIBDS_SelectPlaceBeforeClose(DataSet: TDataSet);
    procedure pFIBDS_SelectCountryAfterOpen(DataSet: TDataSet);
    procedure pFIBDS_SelectRegionAfterOpen(DataSet: TDataSet);
    procedure pFIBDS_SelectPlaceAfterOpen(DataSet: TDataSet);
    procedure pFIBDS_SelectStreetFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure pFIBDS_SelectRegionFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure pFIBDS_SelectDistrictFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure pFIBDS_SelectPlaceFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure pFIBDS_SelectCountryFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  C_Del_SQL='execute procedure ADR_COUNTRY_D(:where);';
  D_Del_SQL='execute procedure ADR_DISTRICT_D(:where);';
  R_Del_SQL='execute procedure ADR_REGION_D(:where);';
  P_Del_SQL='execute procedure ADR_PLACE_D(:where);';
  S_Del_SQL='execute procedure ADR_STREET_D(:where);';
  A_Del_SQL='execute procedure ADR_ADRESS_MAIN_D(:where);';
  Adr_Sel_SQL='select * from ADR_ADRESS_MAIN_S(:ActDate);';

procedure ShowInfo(DataSet: TDataSet);

implementation

uses Dialogs;

{$R *.dfm}
procedure ShowInfo(DataSet: TDataSet);
var text: string;
    i:integer;
begin
  text:='';
  for i:=1 to DataSet.Fields.Count do
   text:=text+DataSet.Fields[i-1].FieldName+' : '+DataSet.Fields[i-1].DisplayText+#13;
  ShowMessage(text);
end;

procedure TAdrDM.pFIBDS_SelectRegionAfterScroll(DataSet: TDataSet);
begin
{  pFIBDS_SelectDistrict.Close;
  pFIBDS_SelectDistrict.ParamByName('id_region').AsVariant:=pFIBDS_SelectRegion['id_region'];
  pFIBDS_SelectDistrict.Open;}
end;

procedure TAdrDM.pFIBDS_SelectDistrictAfterScroll(DataSet: TDataSet);
begin
{  pFIBDS_SelectPlace.Close;
  pFIBDS_SelectPlace.ParamByName('id_region').AsVariant:=pFIBDS_SelectRegion['id_region'];
  pFIBDS_SelectPlace.ParamByName('id_district').AsVariant:=pFIBDS_SelectDistrict['id_district'];
  pFIBDS_SelectPlace.Open;}
end;

procedure TAdrDM.pFIBDS_SelectPlaceAfterScroll(DataSet: TDataSet);
begin
{  pFIBDS_SelectStreet.Close;
  pFIBDS_SelectStreet.ParamByName('id_place').AsVariant:=pFIBDS_SelectPlace['id_place'];
  pFIBDS_SelectStreet.Open;}
end;

procedure TAdrDM.pFIBDS_SelectCountryAfterScroll(DataSet: TDataSet);
begin
{  pFIBDS_SelectRegion.Close;
  pFIBDS_SelectRegion.ParamByName('id_country').AsVariant:=pFIBDS_SelectCountry['id_country'];
  pFIBDS_SelectRegion.Open; }
end;

procedure TAdrDM.pFIBDS_SelectCountryBeforeClose(DataSet: TDataSet);
begin
  pFIBDS_SelectRegion.Close;
end;

procedure TAdrDM.pFIBDS_SelectRegionBeforeClose(DataSet: TDataSet);
begin
  pFIBDS_SelectDistrict.Close;
  pFIBDS_SelectPlace.Close;
end;

procedure TAdrDM.pFIBDS_SelectPlaceBeforeClose(DataSet: TDataSet);
begin
  pFIBDS_SelectStreet.Close;
  pFIBDS_SelectArea.Close;
end;

procedure TAdrDM.pFIBDS_SelectCountryAfterOpen(DataSet: TDataSet);
begin
  pFIBDS_SelectRegion.Open;
end;

procedure TAdrDM.pFIBDS_SelectRegionAfterOpen(DataSet: TDataSet);
begin
  pFIBDS_SelectDistrict.Open;
  pFIBDS_SelectPlace.Open;
end;

procedure TAdrDM.pFIBDS_SelectPlaceAfterOpen(DataSet: TDataSet);
begin
  pFIBDS_SelectStreet.Open;
  pFIBDS_SelectArea.Open;
end;

procedure TAdrDM.pFIBDS_SelectStreetFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
 if DSetSearch.Active then
  Accept:=DSetSearch.Locate('ID_STREET',DataSet['ID_STREET'],[]);
end;

procedure TAdrDM.pFIBDS_SelectRegionFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if DSetSearch.Active then
    Accept:=DSetSearch.Locate('ID_REGION',DataSet['ID_REGION'],[]);
end;

procedure TAdrDM.pFIBDS_SelectDistrictFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if DSetSearch.Active then
    Accept:=DSetSearch.Locate('ID_DISTRICT',DataSet['ID_DISTRICT'],[]);
end;

procedure TAdrDM.pFIBDS_SelectPlaceFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if DSetSearch.Active then
    Accept:=DSetSearch.Locate('ID_PLACE',DataSet['ID_PLACE'],[]);
end;

procedure TAdrDM.pFIBDS_SelectCountryFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if DSetSearch.Active then
    Accept:=DSetSearch.Locate('ID_COUNTRY',DataSet['ID_COUNTRY'],[]);
end;

end.
