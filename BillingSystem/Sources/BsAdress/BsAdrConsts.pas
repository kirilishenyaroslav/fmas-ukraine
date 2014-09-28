unit BsAdrConsts;

interface
const
   WarningText='гтрур!';
   CountrySqlText='SELECT DISTINCT * FROM ADR_COUNTRY_SELECT';
   RegionSqlText='SELECT DISTINCT * FROM ADR_REGION_SELECT';
   DistrictSqlText='SELECT DISTINCT * FROM ADR_DISTRICT_SELECT';
   PlaceSqlText='SELECT DISTINCT * FROM ADR_PLACE_SELECT';
   StreetSqlText='SELECT DISTINCT * FROM BS_STREET_SEL';
   CityAreaSqlText='SELECT DISTINCT * FROM BS_CITY_AREA_SELECT';
   StreetAllSqlText='SELECT DISTINCT * FROM BS_STREET WHERE IS_OLD=0';
   CollateWin1251=' COLLATE WIN1251_UA';
   OrderBy=' ORDER BY ';

   frmCountrySqlText='SELECT DISTINCT * FROM ADR_COUNTRY_S';
   frmRegionSqlText='SELECT DISTINCT * FROM ADR_REGION_S';
   frmDistrictSqlText='SELECT * FROM ADR_DISTRICT_S';
   frmPlaceSqlText='SELECT DISTINCT * FROM ADR_PLACE_S';
   frmStreetSqlText='SELECT * FROM BS_STREET_SEL_BY_ID';
   frmCityAreaSqlText='SELECT DISTINCT * FROM Bs_City_Area_Sel_By_Id';

   ReqionTypeSqlText='SELECT DISTINCT * FROM INI_TYPE_REGION';
   DistrictTypeSqlText='SELECT DISTINCT * FROM INI_TYPE_DISTRICT';
   PlaceTypeSqlText='SELECT DISTINCT * FROM INI_TYPE_PLACE';
   StreetTypeSqlText='SELECT DISTINCT * FROM INI_TYPE_STREET';
   
implementation



end.
