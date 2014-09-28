unit uAddModifAdr3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uAddModifForm, uInvisControl, uSpravControl, uFormControl,
  StdCtrls, Buttons, uFControl, uLabeledFControl, uCharControl, DB,
  FIBDataSet, pFIBDataSet, uAdr_DataModule, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, IBase, cxLookAndFeelPainters,
  cxButtons, ActnList, uAdressForm, cxCalendar, cxLabel, AdrSp_MainForm, Address_ZMessages;

type
  TAddModifAdrForm3 = class(TForm)
    CBCountry: TcxLookupComboBox;
    CountryBtn: TcxButton;
    CountryLbl: TLabel;
    RegionBtn: TcxButton;
    RegionLbl: TLabel;
    CBDistrict: TcxLookupComboBox;
    DistrictBtn: TcxButton;
    DistrictLbl: TLabel;
    CBTown: TcxLookupComboBox;
    TownBtn: TcxButton;
    TownLbl: TLabel;
    CBStreet: TcxLookupComboBox;
    StreetBtn: TcxButton;
    StreetLbl: TLabel;
    CBArea: TcxLookupComboBox;
    AreaBtn: TcxButton;
    AreaLbl: TLabel;
    TEFlat: TcxTextEdit;
    TEHouse: TcxTextEdit;
    TEKorpus: TcxTextEdit;
    KorpusLbl: TLabel;
    HouseLbl: TLabel;
    FlatLbl: TLabel;
    ZipLbl: TLabel;
    AcceptBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList1: TActionList;
    AcceptAction: TAction;
    CancelAction: TAction;
    CBRegion: TcxLookupComboBox;
    MEZip: TcxMaskEdit;
    SearchBtn: TcxButton;
    DEBeg: TcxDateEdit;
    DEEnd: TcxDateEdit;
    DateLbl: TcxLabel;
    DateLbl2: TcxLabel;
    SearchPlaceBtn: TcxButton;
    procedure DistrictOpenSprav(Sender: TObject);
    procedure CountryOpenSprav(Sender: TObject);
    procedure RegionOpenSprav(Sender: TObject);
    procedure PlaceOpenSprav(Sender: TObject);
    procedure StreetOpenSprav(Sender: TObject);
    procedure AreaOpenSprav(Sender: TObject);
    procedure CBCountryPropertiesChange(Sender: TObject);
    procedure CBRegionPropertiesChange(Sender: TObject);
    procedure CBDistrictPropertiesChange(Sender: TObject);
    procedure CBTownPropertiesChange(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure CBStreetPropertiesChange(Sender: TObject);
    procedure CBAreaPropertiesChange(Sender: TObject);
    procedure SearchBtnClick(Sender: TObject);
    procedure MEZipPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure MEZipRefresh;
    procedure MEZipExit(Sender: TObject);
    procedure MEZipKeyPress(Sender: TObject; var Key: Char);
    procedure CBStreetPropertiesCloseUp(Sender: TObject);
    procedure CBDistrictPropertiesCloseUp(Sender: TObject);
    procedure CBTownPropertiesCloseUp(Sender: TObject);
    procedure CBRegionPropertiesCloseUp(Sender: TObject);
    procedure AcceptActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBRegionPropertiesEditValueChanged(Sender: TObject);
    procedure CBCountryPropertiesEditValueChanged(Sender: TObject);
    procedure CBCountryPropertiesCloseUp(Sender: TObject);
    procedure CBDistrictPropertiesEditValueChanged(Sender: TObject);
    procedure CBTownPropertiesEditValueChanged(Sender: TObject);
    procedure CBStreetPropertiesEditValueChanged(Sender: TObject);
    procedure CBAreaPropertiesEditValueChanged(Sender: TObject);
    procedure CBAreaPropertiesCloseUp(Sender: TObject);
    procedure SearchPlaceBtnClick(Sender: TObject);
  private
    { Private declarations }
    DM: TAdrDM;
    pForTownSelect:Boolean;
    pIsLocked:Boolean;
    function ModeIfLocked:FormMode;
  public
    pIdPlace:Integer;
    pFullName:String;
    pIdAddress:Integer;
    pIdPk:Integer;
    DBHandle:Integer;
    constructor Create(AOwner:TComponent; ADB_Handle:TISC_DB_HANDLE; ForTownSelect:Boolean=False; ShowDates:Boolean=False; AIdAddress:Integer=-1); reintroduce;
  end;

implementation

{$R *.dfm}

uses RxMemDS, uUnivSprav, StdConvs, FIBDatabase, FIBQuery;

function TAddModifAdrForm3.ModeIfLocked:FormMode;
begin
  if pIsLocked then
    Result:=AdrSp_MainForm.fsmShow
  else
    Result:=AdrSp_MainForm.fsmSelect;
end;

constructor TAddModifAdrForm3.Create(AOwner:TComponent; ADB_Handle:TISC_DB_HANDLE; ForTownSelect:Boolean=False; ShowDates:Boolean=False; AIdAddress:Integer=-1);
begin
  inherited Create(AOwner);
  DM := TAdrDM.Create(Self);
  DM.pFIBDB_Adr.Handle := ADB_Handle;
  DM.pFIBDB_Adr.DefaultTransaction.Active:=True;
  DBHandle:=Integer(DM.pFIBDB_Adr.Handle);
  pIsLocked:=False;
//******************************************************************************
// Настраиваем поля ввода
  // Страна
  DM.pFIBDS_SelectCountry.Open;

  CBCountry.Properties.ListSource:=DM.DSourceCountry;
  CBCountry.Clear;
  // Область
  CBRegion.Properties.ListSource:=DM.DSourceRegion;
  CBRegion.Enabled:=False;
  RegionBtn.Enabled:=False;
  // Район области
  CBDistrict.Properties.ListSource:=DM.DSourceDistrict;
  DM.pFIBDS_SelectDistrict.Active;
  CBDistrict.Enabled:=False;
  DistrictBtn.Enabled:=False;
  // Город
  CBTown.Properties.ListSource:=DM.DSourcePlace;
  CBTown.Enabled:=False;
  TownBtn.Enabled:=False;
  // Улица
  CBStreet.Properties.ListSource:=DM.DSourceStreet;
  CBStreet.Enabled:=False;
  StreetBtn.Enabled:=False;
  // Район городской
  CBArea.Properties.ListSource:=DM.DSourceArea;
  CBArea.Enabled:=False;
  AreaBtn.Enabled:=False;
//******************************************************************************
  MEZipRefresh;
//******************************************************************************
  pForTownSelect:=ForTownSelect;
//******************************************************************************
  if ForTownSelect then
    begin
      pIdPlace:=AIdAddress;
      CBStreet.Hide;
      StreetLbl.Hide;
      StreetBtn.Hide;
      CBArea.Hide;
      AreaLbl.Hide;
      AreaBtn.Hide;
      MEZip.Hide;
      ZipLbl.Hide;
      TEHouse.Hide;
      HouseLbl.Hide;
      TEKorpus.Hide;
      KorpusLbl.Hide;
      TEFlat.Hide;
      FlatLbl.Hide;
      SearchBtn.Hide;

      AcceptBtn.Top:=CBTown.Top+CBTown.Height+10;
      CancelBtn.Top:=AcceptBtn.Top;
      Height:=AcceptBtn.Top+AcceptBtn.Height+40;

      if DM.DSetPlace.Active then DM.DSetPlace.Close;
      DM.DSetPlace.SQLs.SelectSQL.Text:='SELECT * FROM ADR_GET_BY_ID_PLACE('+IntToStr(pIdPlace)+')';
      DM.DSetPlace.Open;
      CBCountry.EditValue:=DM.DSetPlace['ID_COUNTRY'];
      CBRegion.EditValue:=DM.DSetPlace['ID_REGION'];
      CBDistrict.EditValue:=DM.DSetPlace['ID_DISTRICT'];
      CBTown.EditValue:=DM.DSetPlace['ID_PLACE'];
      pFullName:=VarToStr(DM.DSetPlace['FULL_NAME']);
    end
  else
   begin
    pIdAddress:=AIdAddress;
    if ShowDates then
      begin
        DEBeg.Show;
        DEEnd.Show;
        DateLbl.Show;
        DateLbl2.Show;
      end
    else
      begin
        Height:=Height-30;
        AcceptBtn.Top:=AcceptBtn.Top-30;
        CancelBtn.Top:=AcceptBtn.Top;
      end;
    if pIdAddress>0 then
     begin
      if DM.pFIBDS_Id.Active then DM.pFIBDS_Id.Close;
      DM.pFIBDS_Id.SQLs.SelectSQL.Text:='SELECT * FROM ADR_ADRESS_SEL('+IntToStr(pIdAddress)+')';
      DM.pFIBDS_Id.Open;
      CBCountry.EditValue:=DM.pFIBDS_Id['ID_COUNTRY'];
      CBRegion.EditValue:=DM.pFIBDS_Id['ID_REGION'];
      CBDistrict.EditValue:=DM.pFIBDS_Id['ID_DISTRICT'];
      CBTown.EditValue:=DM.pFIBDS_Id['ID_PLACE'];
      CBStreet.EditValue:=DM.pFIBDS_Id['ID_STREET'];
      CBArea.EditValue:=DM.pFIBDS_Id['ID_CITY_AREA'];
      pIdPk:=DM.pFIBDS_Id['ID_ADR_PK'];
      MEZip.Text:=VarToStr(DM.pFIBDS_Id['ZIPCODE']);
      TEKorpus.Text:=VarToStr(DM.pFIBDS_Id['KORPUS']);
      TEHouse.Text:=VarToStr(DM.pFIBDS_Id['HOUSE']);
      TEFlat.Text:=VarToStr(DM.pFIBDS_Id['FLAT']);
      DEBeg.Date:=VarToDateTime(DM.pFIBDS_Id['DATE_BEG']);
      DEEnd.Date:=VarToDateTime(DM.pFIBDS_Id['DATE_END']);
      pFullName:=VarToStr(DM.pFIBDS_Id['FULL_NAME']);

      if MEZip.Text='' then MEZipRefresh;
     end;
   end;
end;

procedure TAddModifAdrForm3.CountryOpenSprav(Sender: TObject);
var
  Params:TSpParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Довідник країн';
  Params.ShowMode:=ModeIfLocked;
  Params.ShowButtons:=[AdrSp_MainForm.fbAdd,AdrSp_MainForm.fbDelete,AdrSp_MainForm.fbModif,AdrSp_MainForm.fbExit];
  Params.AddFormClass:='TAdd_Country_Form';
  Params.ModifFormClass:='TAdd_Country_Form';
  Params.TableName:='adr_country_select';
  Params.Fields:='Name_country,id_country';
  Params.FieldsName:='Назва';
  Params.KeyField:='id_country';
  Params.ReturnFields:='Name_country,id_country';
  Params.DeleteSQL:='execute procedure adr_country_d(:id_country);';
  Params.DBHandle:=DBHandle;
  Params.NameForSearch:=CBCountry.EditText;

  OutPut:=TRxMemoryData.Create(self);

  if GetAdressesSp(Params,OutPut) then
   begin
     Refresh;
     if DM.pFIBDS_SelectCountry.Active then DM.pFIBDS_SelectCountry.Close;
     DM.pFIBDS_SelectCountry.Open;
     CBCountry.EditValue:=output['id_country'];
   end
  else
   begin
     Refresh;
     if OutPut.Filtered then
       begin
         if DM.pFIBDS_SelectCountry.Active then DM.pFIBDS_SelectCountry.Close;
         DM.pFIBDS_SelectCountry.Open;
       end;
   end;
  OutPut.Free;
end;

procedure TAddModifAdrForm3.RegionOpenSprav(Sender: TObject);
var
  Params:TSpParams;
  OutPut:TRxMemoryData;
begin
  Params.FormCaption:='Довідник регіонів';
  Params.ShowMode:=ModeIfLocked;
  Params.ShowButtons:=[AdrSp_MainForm.fbAdd,AdrSp_MainForm.fbDelete,AdrSp_MainForm.fbModif,AdrSp_MainForm.fbExit];
  Params.AddFormClass:='TAdd_Region_Form';
  Params.ModifFormClass:='TAdd_Region_Form';
  Params.TableName:='ADR_REGION_SELECT_SP('+IntToStr(CBCountry.EditValue)+');';
  Params.Fields:='Name_region,NAME_TYPE,ZIP,id_region';
  Params.FieldsName:='Назва регіона, Тип регіона, Індекси';
  Params.KeyField:='id_region';
  Params.ReturnFields:='Name_region,id_region';
  Params.DeleteSQL:='execute procedure adr_region_d(:id_region);';
  Params.DBHandle:=DBHandle;

  Params.NameForSearch:=CBRegion.EditText;
  Params.Additional:=VarArrayCreate([0,1],varVariant);
  Params.Additional[0]:=CBCountry.EditValue;
  Params.Additional[1]:=CBCountry.EditText;

  OutPut:=TRxMemoryData.Create(self);

  if GetAdressesSp(Params,OutPut)
   then
   begin
     Refresh;
     if DM.pFIBDS_SelectRegion.Active then DM.pFIBDS_SelectRegion.Close;
     DM.pFIBDS_SelectRegion.Open;
     CBRegion.EditValue:=output['id_region'];
   end
  else
   begin
     Refresh;
     if OutPut.Filtered then
       begin
         if DM.pFIBDS_SelectRegion.Active then DM.pFIBDS_SelectRegion.Close;
         DM.pFIBDS_SelectRegion.Open;
       end;
   end;
  OutPut.Free;
end;

procedure TAddModifAdrForm3.DistrictOpenSprav(Sender: TObject);
var
  Params:TSpParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Довідник районів';
  Params.ShowMode:=ModeIfLocked;
  Params.ShowButtons:=[AdrSp_MainForm.fbAdd,AdrSp_MainForm.fbDelete,AdrSp_MainForm.fbModif,AdrSp_MainForm.fbExit];
  Params.AddFormClass:='TAdd_District_Form';
  Params.ModifFormClass:='TAdd_District_Form';
  Params.TableName:='adr_district_select_SP('+IntToStr(CBRegion.EditValue)+');';
  Params.Fields:='Name_district,NAME_TYPE,NAME_REGION,NAME_COUNTRY,ZIP,id_district';
  Params.FieldsName:='Район, Тип района, Регіон, Країна, Індекси';
  Params.KeyField:='id_district';
  Params.ReturnFields:='Name_district,id_district';
  Params.DeleteSQL:='execute procedure adr_district_d(:id_district);';
  Params.DBHandle:=DBHandle;

  Params.NameForSearch:=CBDistrict.EditText;
  Params.Additional:=VarArrayCreate([0,1],varVariant);
  Params.Additional[0]:=CBRegion.EditValue;
  Params.Additional[1]:=CBRegion.EditText;

  OutPut:=TRxMemoryData.Create(self);

  if GetAdressesSp(Params,OutPut)
   then
   begin
     Refresh;
     if DM.pFIBDS_SelectDistrict.Active then DM.pFIBDS_SelectDistrict.Close;
     DM.pFIBDS_SelectDistrict.Open;
     CBDistrict.EditValue:=output['id_district'];
   end
  else
   begin
     Refresh;
     if OutPut.Filtered then
       begin
         if DM.pFIBDS_SelectDistrict.Active then DM.pFIBDS_SelectDistrict.Close;
         DM.pFIBDS_SelectDistrict.Open;
       end;
   end;
  OutPut.Free;
end;

procedure TAddModifAdrForm3.PlaceOpenSprav(Sender: TObject);
var
  Params:TSpParams;
  OutPut : TRxMemoryData;
  id_distr: string;
begin
  if not VarIsNull(CBDistrict.EditValue) then
   id_distr:=IntToStr(CBDistrict.EditValue)
  else
   id_distr:='null';

  Params.FormCaption:='Довідник населених пунктів';
  Params.ShowMode:=ModeIfLocked;
  Params.ShowButtons:=[AdrSp_MainForm.fbAdd,AdrSp_MainForm.fbDelete,AdrSp_MainForm.fbModif,AdrSp_MainForm.fbExit];
  Params.AddFormClass:='TAdd_Place_Form';
  Params.ModifFormClass:='TAdd_Place_Form';
  Params.TableName:='ADR_PLACE_SELECT_SP('+IntToStr(CBRegion.EditValue)+','+id_distr+')';
  Params.Fields:='Name_place_SP,NAME_TYPE,NAME_DISTRICT,NAME_REGION,NAME_COUNTRY,ZIP,id_place';
  Params.FieldsName:='Населений пункт, Тип ,Район, Регіон, Країна, Індекси';
  Params.KeyField:='id_place';
  Params.ReturnFields:='Name_place,id_place';
  Params.DeleteSQL:='execute procedure adr_place_d(:id_place);';
  Params.DBHandle:=DBHandle;

  Params.NameForSearch:=CBTown.EditText;
  Params.Additional:=VarArrayCreate([0,3],varVariant);
  Params.Additional[0]:=CBRegion.EditValue;
  Params.Additional[1]:=CBRegion.EditText;
  Params.Additional[2]:=CBDistrict.EditValue;
  Params.Additional[3]:=CBDistrict.EditText;

  OutPut:=TRxMemoryData.Create(self);

  if GetAdressesSp(Params,OutPut)
   then
   begin
     Refresh;
     if DM.pFIBDS_SelectPlace.Active then DM.pFIBDS_SelectPlace.Close;
     DM.pFIBDS_SelectPlace.Open;
     CBTown.EditValue:=output['id_place'];
   end
  else
   begin
     Refresh;
     if OutPut.Filtered then
       begin
         if DM.pFIBDS_SelectPlace.Active then DM.pFIBDS_SelectPlace.Close;
         DM.pFIBDS_SelectPlace.Open;
       end;
   end;
  OutPut.Free;
end;

procedure TAddModifAdrForm3.StreetOpenSprav(Sender: TObject);
var
  Params:TSpParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Довідник вулиць';
  Params.ShowMode:=AdrSp_MainForm.fsmSelect;
  Params.ShowButtons:=[AdrSp_MainForm.fbAdd,AdrSp_MainForm.fbDelete,AdrSp_MainForm.fbModif,AdrSp_MainForm.fbExit];
  Params.AddFormClass:='TAdd_Street_Form';
  Params.ModifFormClass:='TAdd_Street_Form';
  Params.TableName:='ADR_STREET_SELECT_SP('+IntToStr(CBTown.EditValue)+');';
  Params.Fields:='Name_street_SP,NAME_TYPE,NAME_PLACE,NAME_DISTRICT,NAME_REGION,NAME_COUNTRY,id_street';
  Params.FieldsName:='Вулиця, Тип, Населений пункт, Район, Регіон, Країна';
  Params.KeyField:='id_street';
  Params.ReturnFields:='Name_street,id_street';
  Params.DeleteSQL:='execute procedure adr_street_d(:id_street);';
  Params.DBHandle:=DBHandle;

  Params.NameForSearch:=CBStreet.EditText;
  Params.Additional:=VarArrayCreate([0,1],varVariant);
  Params.Additional[0]:=CBTown.EditValue;
  Params.Additional[1]:=CBTown.EditText;

  OutPut:=TRxMemoryData.Create(self);

  if GetAdressesSp(Params,OutPut)
   then
   begin
     Refresh;
     if DM.pFIBDS_SelectStreet.Active then DM.pFIBDS_SelectStreet.Close;
     DM.pFIBDS_SelectStreet.Open;
     CBStreet.EditValue:=output['id_street'];
   end
  else
   begin
     Refresh;
     if OutPut.Filtered then
       begin
         if DM.pFIBDS_SelectStreet.Active then DM.pFIBDS_SelectStreet.Close;
         DM.pFIBDS_SelectStreet.Open;
       end;
   end;
  OutPut.Free;
end;

procedure TAddModifAdrForm3.AreaOpenSprav(Sender: TObject);
var
  Params:TSpParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Довідник міських районів';
  Params.ShowMode:=AdrSp_MainForm.fsmSelect;
  Params.ShowButtons:=[AdrSp_MainForm.fbAdd,AdrSp_MainForm.fbDelete,AdrSp_MainForm.fbModif,AdrSp_MainForm.fbExit];
  Params.AddFormClass:='TAddCityArea';
  Params.ModifFormClass:='TAddCityArea';
  Params.TableName:='ADR_CITY_AREA_SELECT_SP('+IntToStr(CBTown.EditValue)+');';
  Params.Fields:='Name_city_area,NAME_PLACE,NAME_DISTRICT,NAME_REGION,NAME_COUNTRY,id_city_area';
  Params.FieldsName:='Район, Населений пункт, Район, Регіон, Країна';
  Params.KeyField:='id_city_area';
  Params.ReturnFields:='Name_city_area,id_city_area';
  Params.DeleteSQL:='execute procedure adr_city_area_d(:id_city_area);';
  Params.DBHandle:=DBHandle;

  Params.NameForSearch:=CBArea.EditText;
  Params.Additional:=VarArrayCreate([0,1],varVariant);
  Params.Additional[0]:=CBTown.EditValue;
  Params.Additional[1]:=CBTown.EditText;

  OutPut:=TRxMemoryData.Create(self);

  if GetAdressesSp(Params,OutPut)
   then
   begin
     Refresh;
     if DM.pFIBDS_SelectArea.Active then DM.pFIBDS_SelectArea.Close;
     DM.pFIBDS_SelectArea.Open;
     CBArea.EditValue:=output['id_city_area'];
   end
  else
   begin
     Refresh;
     if OutPut.Filtered then
       begin
         if DM.pFIBDS_SelectArea.Active then DM.pFIBDS_SelectArea.Close;
         DM.pFIBDS_SelectArea.Open;
       end;
   end;
  OutPut.Free;
end;

procedure TAddModifAdrForm3.CBCountryPropertiesChange(
  Sender: TObject);
begin
  if CBCountry.Text='' then
    CBCountryPropertiesEditValueChanged(Self);
end;

procedure TAddModifAdrForm3.CBRegionPropertiesChange(
  Sender: TObject);
begin
  if CBRegion.Text='' then
    CBRegionPropertiesEditValueChanged(Self);
end;

procedure TAddModifAdrForm3.CBDistrictPropertiesChange(
  Sender: TObject);
begin
  if CBDistrict.Text='' then
    CBDistrictPropertiesEditValueChanged(Self);
end;

procedure TAddModifAdrForm3.CBTownPropertiesChange(
  Sender: TObject);
begin
  if CBTown.Text='' then
    CBTownPropertiesEditValueChanged(Self);
end;

procedure TAddModifAdrForm3.CancelActionExecute(Sender: TObject);
begin
    DM.pFIBDB_Adr.DefaultTransaction.Active:=False;
  ModalResult:=mrCancel;
end;

procedure TAddModifAdrForm3.CBStreetPropertiesChange(Sender: TObject);
begin
  if CBStreet.Text='' then
    CBStreetPropertiesEditValueChanged(Self);
end;

procedure TAddModifAdrForm3.CBAreaPropertiesChange(Sender: TObject);
begin
  if CBArea.Text='' then
    CBTownPropertiesEditValueChanged(Self);
end;

procedure TAddModifAdrForm3.SearchBtnClick(Sender: TObject);
var StrZip:String;
begin
  StrZip:=MEZip.Text;
  if StrZip='*****' then Exit;

  pIsLocked:=not pIsLocked;
  MEZip.Properties.ReadOnly:=pIsLocked;

if pIsLocked then
 begin
  SearchBtn.Caption:='Відмінити результати пошуку';

  Delete(StrZip,Pos('*',StrZip),Length(StrZip)-Pos('*',StrZip)+1);
  if DM.DSetSearch.Active then DM.DSetSearch.Close;
  DM.DSetSearch.SQLs.SelectSQL.Text:='SELECT * FROM ADR_GET_BY_ZIP('''+StrZip+''')';
  DM.DSetSearch.Open;
//******************************************************************************
  CBCountry.EditValue  := DM.DSetSearch['ID_COUNTRY'];
  DM.pFIBDS_SelectCountry.Filtered:=True;
  if not VarIsNull(DM.DSetSearch['ID_STREET']) then
    begin
// Блокируем данные, чтобы выбирать можно было только среди рез-тов поиска
      DM.pFIBDS_SelectRegion.Filtered:=True;
      DM.pFIBDS_SelectDistrict.Filtered:=True;
      DM.pFIBDS_SelectPlace.Filtered:=True;

      CBRegion.EditValue   := DM.DSetSearch['ID_REGION'];
      CBDistrict.EditValue := DM.DSetSearch['ID_DISTRICT'];
      CBTown.EditValue     := DM.DSetSearch['ID_PLACE'];
//      CBStreet.EditValue   := DM.DSetSearch['ID_STREET'];

      DM.pFIBDS_SelectStreet.Filtered:=True;
      CBStreet.DroppedDown:=True;
//      DM.DSetSearch.Close;
    end
  else
    begin
      if not VarIsNull(DM.DSetSearch['ID_PLACE']) then
        begin
          CBRegion.EditValue := DM.DSetSearch['ID_REGION'];

          DM.pFIBDS_SelectRegion.Filtered:=True;

          DM.pFIBDS_SelectDistrict.Filtered:=True;
          if DM.pFIBDS_SelectDistrict.VisibleRecordCount>1 then
            CBDistrict.DroppedDown:=True
          else
            begin
              CBDistrict.EditValue := DM.DSetSearch['ID_DISTRICT'];
              CBDistrictPropertiesCloseUp(Self);
            end;
        end
      else
        begin
          if not VarIsNull(DM.DSetSearch['ID_REGION']) then
            begin
              DM.pFIBDS_SelectRegion.Filtered:=True;
              CBRegion.DroppedDown:=True;
            end;
        end;
    end;
{  CountryBtn.Enabled:=False;
  RegionBtn.Enabled:=False;
  DistrictBtn.Enabled:=False;
  TownBtn.Enabled:=False;
  StreetBtn.Enabled:=False;
  AreaBtn.Enabled:=False; }
 end
else
 begin
  SearchBtn.Caption:='Пошук за індексом';

{  CountryBtn.Enabled:=True;
  RegionBtn.Enabled:=True;
  DistrictBtn.Enabled:=True;
  TownBtn.Enabled:=True;
  StreetBtn.Enabled:=True;
  AreaBtn.Enabled:=True;}

  DM.pFIBDS_SelectCountry.Filtered:=False;
  DM.pFIBDS_SelectRegion.Filtered:=False;
  DM.pFIBDS_SelectDistrict.Filtered:=False;
  DM.pFIBDS_SelectPlace.Filtered:=False;
  DM.pFIBDS_SelectStreet.Filtered:=False;
  DM.DSetSearch.Close;
 end;
end;

procedure TAddModifAdrForm3.MEZipPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  MEZipRefresh;
  Error:=False;
end;

procedure TAddModifAdrForm3.MEZipRefresh;
var Str:String;
    i:Integer;
begin
  Str:=MEZip.EditText;
  Delete(Str,Pos('*',Str),Length(Str)-Pos('*',Str)+1);
  for i:=5 downto Length(Str)+1 do
    Str:=Str+'*';
  MEZip.Text:=Str;
end;

procedure TAddModifAdrForm3.MEZipExit(Sender: TObject);
begin
  MEZipRefresh;
end;

procedure TAddModifAdrForm3.MEZipKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then MEZipRefresh;
end;

procedure TAddModifAdrForm3.CBStreetPropertiesCloseUp(Sender: TObject);
begin
  DM.pFIBDS_SelectStreet.Filtered:=False;
  CBStreetPropertiesEditValueChanged(Self);
end;

procedure TAddModifAdrForm3.CBDistrictPropertiesCloseUp(Sender: TObject);
begin
  CBDistrictPropertiesEditValueChanged(Self);
  if DM.DSetSearch.Active then
    begin
      DM.pFIBDS_SelectPlace.Filtered:=True;
      if DM.pFIBDS_SelectPlace.VisibleRecordCount>1 then
        CBTown.DroppedDown:=True
      else
        begin
          CBTown.EditValue := DM.DSetSearch['ID_PLACE'];
          CBTownPropertiesCloseUp(Self);
        end;
    end;
end;

procedure TAddModifAdrForm3.CBTownPropertiesCloseUp(Sender: TObject);
begin
  CBTownPropertiesEditValueChanged(Self);
end;

procedure TAddModifAdrForm3.CBRegionPropertiesCloseUp(Sender: TObject);
begin
  CBRegionPropertiesEditValueChanged(Self);
end;

procedure TAddModifAdrForm3.AcceptActionExecute(Sender: TObject);
begin
 if  {VarIsNull(CBCountry.EditValue)} CBCountry.EditText='' then
   begin
     MessageDlg('Не всі необхідні поля заповнено!',mtError,[mbOk],-1);
     CBCountry.SetFocus;
     Exit;
   end;
 if  {VarIsNull(CBRegion.EditValue)} CBRegion.EditText='' then
   begin
     MessageDlg('Не всі необхідні поля заповнено!',mtError,[mbOk],-1);
     CBRegion.SetFocus;
     Exit;
   end;
 if  {VarIsNull(CBTown.EditValue)} CBTown.EditText='' then
   begin
     MessageDlg('Не всі необхідні поля заповнено!',mtError,[mbOk],-1);
     CBTown.SetFocus;
     Exit;
   end;
 if  {VarIsNull(CBStreet.EditValue)} (CBStreet.EditText='') and not pForTownSelect then
   begin
     MessageDlg('Не всі необхідні поля заповнено!',mtError,[mbOk],-1);
     CBStreet.SetFocus;
     Exit;
   end;

 if not pForTownSelect then
 try

 if not pIsLocked then
 begin
  DM.StProcAddress.StoredProcName:='ADR_ZIP_STREET_IN_PLACE';
  DM.StProcAddress.Transaction.StartTransaction;
  DM.StProcAddress.Prepare;
  DM.StProcAddress.ParamByName('ID_STREET').AsInteger:=CBStreet.EditValue;
  if Pos('*',MEZip.Text)=0 then
    DM.StProcAddress.ParamByName('ZIP_CODE').AsInteger:=StrToInt(MEZip.EditText);
  DM.StProcAddress.ExecProc;
  if DM.StProcAddress.ParamByName('ZIP_IN_RANGE').AsInteger=0 then
    if ZShowMessage('Увага','Вказаний індекс не належить діапазону індексів обраного населеного пункта. Його не буде збережено. Продовжити?',mtWarning,[mbOK,mbNo])=mrOk then
      MEZip.Text:='******'
    else
      Exit;
  end;

  DM.StProcAddress.StoredProcName:='ADR_ADRESS_MAIN_IUM';
  DM.StProcAddress.Transaction.StartTransaction;
  DM.StProcAddress.Prepare;
  DM.StProcAddress.ParamByName('ID_ADR').AsInteger:=pIdAddress;
  if Pos('*',MEZip.Text)=0 then
    DM.StProcAddress.ParamByName('ZIPCODE').AsString:=MEZip.EditText;

  if CBArea.EditText<>'' then
    DM.StProcAddress.ParamByName('ID_CITY_AREA').AsInteger:=CBArea.EditValue;
  if CBStreet.EditText<>'' then
    DM.StProcAddress.ParamByName('ID_STREET').AsInteger:=CBStreet.EditValue;
  DM.StProcAddress.ParamByName('KORPUS').AsString:=TEKorpus.Text;
  DM.StProcAddress.ParamByName('HOUSE').AsString:=TEHouse.Text;
  DM.StProcAddress.ParamByName('FLAT').AsString:=TEFlat.Text;
  if DEBeg.Visible and DEEnd.Visible then
    begin
      DM.StProcAddress.ParamByName('DATE_BEG').AsDate:=DEBeg.Date;
      DM.StProcAddress.ParamByName('DATE_END').AsDate:=DEEnd.Date;
    end;
  DM.StProcAddress.ParamByName('ID_ADR_PK').AsInteger:=pIdPk;
  DM.StProcAddress.ParamByName('IS_MODIF').AsInteger:=0;

  DM.StProcAddress.ExecProc;

  pIdAddress:=DM.StProcAddress.ParamByName('ID_ADRESS').AsInteger;

  DM.StProcAddress.Transaction.Commit;

  DM.StProcAddress.StoredProcName:='ADR_ADRESS_SEL';
  DM.StProcAddress.Transaction.StartTransaction;
  DM.StProcAddress.Prepare;
  DM.StProcAddress.ParamByName('ID_ADRESS').AsInteger:=pIdAddress;
  DM.StProcAddress.ExecProc;
  pFullName:=DM.StProcAddress.ParamByName('FULL_NAME').AsString;
  DM.StProcAddress.Transaction.Rollback;

  ModalResult:=mrOk;
 except
  on e:Exception do
   begin
     DM.StProcAddress.Transaction.Rollback;
     MessageDlg(E.Message,mtError,[mbOk],-1);
   end;
 end
 else
   begin
     pIdPlace:=CBTown.EditValue;
     if DM.DSetPlace.Active then DM.DSetPlace.Close;
     DM.DSetPlace.SQLs.SelectSQL.Text:='SELECT * FROM ADR_GET_BY_ID_PLACE('+IntToStr(pIdPlace)+')';
     DM.DSetPlace.Open;
     pFullName:=VarToStr(DM.DSetPlace['FULL_NAME']);
     ModalResult:=mrOk;
   end;
end;

procedure TAddModifAdrForm3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DM.pFIBDB_Adr.DefaultTransaction.Active:=False;
    DM.Free;
end;

procedure TAddModifAdrForm3.CBRegionPropertiesEditValueChanged(
  Sender: TObject);
begin
   CBDistrict.Enabled:=not(CBRegion.Text='');
   DistrictBtn.Enabled:=not(CBRegion.Text='');
   CBTown.Enabled:=not(CBRegion.Text='');
   TownBtn.Enabled:=not(CBRegion.Text='');
   if (DM.pFIBDS_SelectRegion.Active) and (CBRegion.EditText<>'') then
    begin
     DM.pFIBDS_SelectRegion.Locate('NAME_REGION',CBRegion.EditText,[]);
     CBRegion.EditValue:=DM.pFIBDS_SelectRegion['ID_REGION'];
    end
   else
    begin
     CBRegion.EditValue:=Null;
     CBDistrict.EditText:='';
     CBTown.EditText:='';
    end;
end;

procedure TAddModifAdrForm3.CBCountryPropertiesEditValueChanged(
  Sender: TObject);
begin
   CBRegion.Enabled:=not(CBCountry.Text='');
   RegionBtn.Enabled:=not(CBCountry.Text='');
{Меняем не по ID, а по названию, т.к. оно уникально на каждом уровне
   и пользователь не может вводить своё в поле поиска, при поиске по идентификатору
   и при вводе названия с клавиатуры EditValue не изменяется}
   if (DM.pFIBDS_SelectCountry.Active) and (CBCountry.EditText<>'') then
    begin
     DM.pFIBDS_SelectCountry.Locate('NAME_COUNTRY',CBCountry.EditText,[]);
     CBCountry.EditValue:=DM.pFIBDS_SelectCountry['ID_COUNTRY'];
    end
   else
    begin
     CBCountry.EditValue:=Null;
     CBRegion.EditText:='';
    end;
end;

procedure TAddModifAdrForm3.CBCountryPropertiesCloseUp(Sender: TObject);
begin
  CBCountryPropertiesEditValueChanged(Self);
end;

procedure TAddModifAdrForm3.CBDistrictPropertiesEditValueChanged(
  Sender: TObject);
begin
  if (DM.pFIBDS_SelectDistrict.Active) and (CBDistrict.EditText<>'') then
   begin
    DM.pFIBDS_SelectDistrict.Locate('NAME_DISTRICT',CBDistrict.EditText,[]);
    CBDistrict.EditValue:=DM.pFIBDS_SelectDistrict['ID_DISTRICT'];
   end
  else
    CBDistrict.EditValue:=Null;

  if DM.pFIBDS_SelectPlace.Active then DM.pFIBDS_SelectPlace.Close;
  DM.pFIBDS_SelectPlace.ParamByName('ID_DISTRICT').AsVariant:=CBDistrict.EditValue;
  DM.pFIBDS_SelectPlace.Open;
end;

procedure TAddModifAdrForm3.CBTownPropertiesEditValueChanged(
  Sender: TObject);
begin
  CBStreet.Enabled:=not(CBTown.Text='');
  StreetBtn.Enabled:=not(CBTown.Text='');
  CBArea.Enabled:=not(CBTown.Text='');
  AreaBtn.Enabled:=not(CBTown.Text='');
  if (not DM.pFIBDS_SelectPlace.Active) or (CBTown.EditText='') then
   begin
    CBTown.EditValue:=Null;
    CBStreet.EditText:='';
    CBArea.EditText:='';
   end
  else
   begin
    DM.pFIBDS_SelectPlace.Locate('NAME_PLACE',CBTown.EditText,[]);
    CBTown.EditValue:=DM.pFIBDS_SelectPlace['ID_PLACE'];
   end;
end;

procedure TAddModifAdrForm3.CBStreetPropertiesEditValueChanged(
  Sender: TObject);
begin
  if (not DM.pFIBDS_SelectStreet.Active) or (CBStreet.EditText='') then
    CBStreet.EditValue:=Null
  else
   begin
    DM.pFIBDS_SelectStreet.Locate('NAME_STREET',CBStreet.EditText,[]);
    CBStreet.EditValue:=DM.pFIBDS_SelectStreet['ID_STREET'];
   end;
end;

procedure TAddModifAdrForm3.CBAreaPropertiesEditValueChanged(
  Sender: TObject);
begin
  if (not DM.pFIBDS_SelectArea.Active) or (CBArea.EditText='') then
    CBArea.EditValue:=Null
  else
   begin
    DM.pFIBDS_SelectArea.Locate('NAME_CITY_AREA',CBArea.EditText,[]);
    CBArea.EditValue:=DM.pFIBDS_SelectArea['ID_CITY_AREA'];
   end;
end;

procedure TAddModifAdrForm3.CBAreaPropertiesCloseUp(Sender: TObject);
begin
  CBAreaPropertiesEditValueChanged(Self);
end;
//************************************************************************
//              изменить процедуру - изменить Params и т.д.             //
//************************************************************************
procedure TAddModifAdrForm3.SearchPlaceBtnClick(Sender: TObject);
var
  Params:TSpParams;
  OutPut : TRxMemoryData;
  SearchString: string;
begin
  SearchString:='NULL';

  Params.FormCaption:='Довідник населених пунктів';
  Params.ShowMode:=AdrSp_MainForm.fsmSearchPlaceMode;
  Params.ShowButtons:=[AdrSp_MainForm.fbAdd,AdrSp_MainForm.fbDelete,AdrSp_MainForm.fbModif,AdrSp_MainForm.fbExit];
  Params.AddFormClass:='TAdd_Place_Form';
  Params.ModifFormClass:='TAdd_Place_Form';
  Params.TableName:='ADR_PLACE_SELECT_SP_BY_NAME('+SearchString+')';
  Params.Fields:='Name_place_SP,NAME_TYPE,NAME_DISTRICT,NAME_REGION,NAME_COUNTRY,ZIP,id_place';
  Params.FieldsName:='Населений пункт, Тип ,Район, Регіон, Країна, Індекси';
  Params.KeyField:='id_place';
  Params.ReturnFields:='Name_place,id_country,id_region,id_district,id_place';
  Params.DeleteSQL:='execute procedure adr_place_d(:id_place);';
  Params.DBHandle:=DBHandle;

  Params.NameForSearch := CBCountry.EditText;
{  Params.NameForSearch:=CBTown.EditText;
  Params.Additional:=VarArrayCreate([0,3],varVariant);
  Params.Additional[0]:=CBRegion.EditValue;
  Params.Additional[1]:=CBRegion.EditText;
  Params.Additional[2]:=CBDistrict.EditValue;
  Params.Additional[3]:=CBDistrict.EditText;
  *}
  OutPut:=TRxMemoryData.Create(self);

  if GetAdressesSp(Params,OutPut)
   then
   begin
      // Область
     CBRegion.Properties.ListSource:=DM.DSourceRegion;
     CBRegion.Enabled:=True;
     RegionBtn.Enabled:=True;
     // Район области
     CBDistrict.Properties.ListSource:=DM.DSourceDistrict;
     DM.pFIBDS_SelectDistrict.Active;
     CBDistrict.Enabled:=True;
     DistrictBtn.Enabled:=True;
     // Город
     CBTown.Properties.ListSource:=DM.DSourcePlace;
     CBTown.Enabled:=True;
     TownBtn.Enabled:=True;
     // Улица
     CBStreet.Properties.ListSource:=DM.DSourceStreet;
     CBStreet.Enabled:=True;
     StreetBtn.Enabled:=True;
     // Район городской
     CBArea.Properties.ListSource:=DM.DSourceArea;
     CBArea.Enabled:=True;
     AreaBtn.Enabled:=True;
      //  Refresh;
     if DM.pFIBDS_SelectCountry.Active then DM.pFIBDS_SelectCountry.Close;
     DM.pFIBDS_SelectCountry.Open;
     CBCountry.EditValue:=output['id_country'];
     //  Refresh;
     if DM.pFIBDS_SelectRegion.Active then DM.pFIBDS_SelectRegion.Close;
     DM.pFIBDS_SelectRegion.Open;
     CBRegion.EditValue:=output['id_region'];
     //  Refresh;
     if DM.pFIBDS_SelectDistrict.Active then DM.pFIBDS_SelectDistrict.Close;
     DM.pFIBDS_SelectDistrict.Open;
     CBDistrict.EditValue:=output['id_district'];

     //Refresh;
     if DM.pFIBDS_SelectPlace.Active then DM.pFIBDS_SelectPlace.Close;
     DM.pFIBDS_SelectPlace.Open;
     CBTown.EditValue     := output['id_place'];


   end
  else
   begin
     Refresh;
     if OutPut.Filtered then
       begin
         if DM.pFIBDS_SelectPlace.Active then DM.pFIBDS_SelectPlace.Close;
         DM.pFIBDS_SelectPlace.Open;
       end;
   end;
  OutPut.Free;

end;
//************************************************************************


initialization
    RegisterClass(TAddModifAdrForm3);

end.
