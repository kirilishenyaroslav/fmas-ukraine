unit Address_EditForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uAddModifForm, uInvisControl, uSpravControl, uFormControl,
  StdCtrls, Buttons, uFControl, uLabeledFControl, uCharControl, DB,
  FIBDataSet, pFIBDataSet, uAdr_DataModule, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, IBase, cxLookAndFeelPainters,
  cxButtons, ActnList;

type
  TfAdrEditForm = class(TAddModifForm)
    CBCountry: TcxLookupComboBox;
    CountryBtn: TcxButton;
    CountryLbl: TLabel;
    CBRegion: TcxLookupComboBox;
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
    TEZip: TcxTextEdit;
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
    procedure DistrictOpenSprav(Sender: TObject);
    procedure CountryOpenSprav(Sender: TObject);
    procedure RegionOpenSprav(Sender: TObject);
    procedure PlaceOpenSprav(Sender: TObject);
    procedure StreetOpenSprav(Sender: TObject);
    procedure AreaOpenSprav(Sender: TObject);
    procedure CBCountryPropertiesEditValueChanged(Sender: TObject);
    procedure CBRegionPropertiesEditValueChanged(Sender: TObject);
    procedure CBDistrictPropertiesEditValueChanged(Sender: TObject);
    procedure CBTownPropertiesEditValueChanged(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
  private
    { Private declarations }
    FMode: TFormMode;
    DM: TAdrDM;

    procedure EnableRegion(AID_Country:Variant);// Если параметр NULL, то объект становится недотупным
    procedure EnableDistrict(AID_Region:Variant);
    procedure EnableTown(AID_Region, AID_District:Variant);
    procedure EnableStreet(AID_Town:Variant);
    procedure EnableArea(AID_Town:Variant);

  public
    constructor Create(AOwner:TComponent; ADB_Handle:TISC_DB_HANDLE; AIdAddress:Integer); reintroduce;
    //DMod: TAdrDM; Where: Variant; id_PK:Variant); reintroduce;   Mode: TFormMode
  end;

implementation

{$R *.dfm}

uses RxMemDS, uUnivSprav, StdConvs, FIBDatabase;

procedure TfAdrEditForm.EnableRegion(AID_Country:Variant);
var MakeEnabled:Boolean;
begin
  Refresh;
  MakeEnabled:= not VarIsNull(AID_Country);
  if DM.pFIBDS_SelectRegion.Active then DM.pFIBDS_SelectRegion.Close;
  if MakeEnabled then
    begin
      DM.pFIBDS_SelectRegion.ParamByName('ID_COUNTRY').AsVariant:=AID_COUNTRY;
      DM.pFIBDS_SelectRegion.Open;
    end;
  CBRegion.Enabled:=MakeEnabled;
  RegionBtn.Enabled:=MakeEnabled;
// В случае изм. значения обнуляется значение поля ОБЛАСТЬ и закрываются дочерние поля
  CBRegion.EditValue:=Null;
  EnableDistrict(Null);
end;

procedure TfAdrEditForm.EnableDistrict(AID_Region:Variant);
var MakeEnabled:Boolean;
begin
  Refresh;
  MakeEnabled:= not VarIsNull(AID_Region);
  if DM.pFIBDS_SelectDistrict.Active then DM.pFIBDS_SelectDistrict.Close;
  if MakeEnabled then
    begin
      DM.pFIBDS_SelectDistrict.ParamByName('ID_REGION').AsVariant:=AID_REGION;
      DM.pFIBDS_SelectDistrict.Open;
    end;
  CBDistrict.Enabled:=MakeEnabled;
  DistrictBtn.Enabled:=MakeEnabled;
  CBDistrict.EditValue:=Null;
  EnableTown(AID_Region,Null);
end;

procedure TfAdrEditForm.EnableTown(AID_Region, AID_District:Variant);
var MakeEnabled:Boolean;
begin
  Refresh;
  MakeEnabled:= not VarIsNull(AID_Region);
  if DM.pFIBDS_SelectPlace.Active then DM.pFIBDS_SelectPlace.Close;
  if MakeEnabled then
    begin
      DM.pFIBDS_SelectPlace.ParamByName('ID_REGION').AsVariant  :=AID_Region;
      DM.pFIBDS_SelectPlace.ParamByName('ID_DISTRICT').AsVariant:=AID_District;
      DM.pFIBDS_SelectPlace.Open;
    end;
  CBTown.Enabled:=MakeEnabled;
  TownBtn.Enabled:=MakeEnabled;
  CBTown.EditValue:=Null;
  EnableStreet(Null);
  EnableArea(Null);
end;

procedure TfAdrEditForm.EnableStreet(AID_Town:Variant);
var MakeEnabled:Boolean;
begin
  Refresh;
  MakeEnabled:= not VarIsNull(AID_Town);
  if DM.pFIBDS_SelectStreet.Active then DM.pFIBDS_SelectStreet.Close;
  if MakeEnabled then
    begin
      DM.pFIBDS_SelectStreet.ParamByName('ID_PLACE').AsVariant:=AID_Town;
      DM.pFIBDS_SelectStreet.Open;
    end;
  CBStreet.Enabled:=MakeEnabled;
  StreetBtn.Enabled:=MakeEnabled;
  CBStreet.EditValue:=Null;
end;

procedure TfAdrEditForm.EnableArea(AID_Town:Variant);
var MakeEnabled:Boolean;
begin
  Refresh;
  MakeEnabled:= not VarIsNull(AID_Town);
  if DM.pFIBDS_SelectArea.Active then DM.pFIBDS_SelectArea.Close;
  if MakeEnabled then
    begin
      DM.pFIBDS_SelectArea.ParamByName('ID_PLACE').AsVariant:=AID_Town;
      DM.pFIBDS_SelectArea.Open;
    end;
  CBArea.Enabled:=MakeEnabled;
  AreaBtn.Enabled:=MakeEnabled;
  CBArea.EditValue:=Null;
END;

constructor TfAdrEditForm.Create(AOwner:TComponent; ADB_Handle:TISC_DB_HANDLE;AIdAddress:Integer);
{Mode: TFormMode);}
//DMod: TAdrDM; Where: Variant; id_PK:Variant);
begin
  inherited Create(AOwner);
//	FMode := Mode;
  DM := TAdrDM.Create(Self);
  DM.pFIBDB_Adr.Handle := ADB_Handle;
  DM.pFIBDB_Adr.DefaultTransaction.Active:=True;
  DBHandle:=Integer(DM.pFIBDB_Adr.Handle);
//******************************************************************************
// Настраиваем поля ввода
  // Страна
  DM.pFIBDS_SelectCountry.Open;
  CBCountry.Properties.ListSource:=DM.DSourceCountry;
  CBCountry.EditValue:=DM.DSourceCountry.DataSet['ID_COUNTRY'];
  CBCountry.Clear;
  // Область
  CBRegion.Properties.ListSource:=DM.DSourceRegion;
  CBRegion.EditValue:=DM.DSourceRegion.DataSet['ID_REGION'];
  CBRegion.Enabled:=False;
  RegionBtn.Enabled:=False;
  // Район области
  CBDistrict.Properties.ListSource:=DM.DSourceDistrict;
  CBDistrict.EditValue:=DM.DSourceDistrict.DataSet['ID_DISTRICT'];
  DM.pFIBDS_SelectDistrict.Active;
  CBDistrict.Enabled:=False;
  DistrictBtn.Enabled:=False;
  // Город
  CBTown.Properties.ListSource:=DM.DSourcePlace;
  CBTown.EditValue:=DM.DSourcePlace.DataSet['ID_PLACE'];
  CBTown.Enabled:=False;
  TownBtn.Enabled:=False;
  // Улица
  CBStreet.Properties.ListSource:=DM.DSourceStreet;
  CBStreet.EditValue:=DM.DSourceStreet.DataSet['ID_STREET'];
  CBStreet.Enabled:=False;
  StreetBtn.Enabled:=False;
  // Район городской
  CBArea.Properties.ListSource:=DM.DSourceArea;
  CBArea.EditValue:=DM.DSourceArea.DataSet['ID_CITY_AREA'];
  CBArea.Enabled:=False;
  StreetBtn.Enabled:=False;
end;

procedure TfAdrEditForm.CountryOpenSprav(Sender: TObject);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Довідник країн';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_Country_Form';
  Params.ModifFormClass:='TAdd_Country_Form';
  Params.TableName:='adr_country';
  Params.Fields:='Name_country,id_country';
  Params.FieldsName:='Назва';
  Params.KeyField:='id_country';
  Params.ReturnFields:='Name_country,id_country';
  Params.DeleteSQL:='execute procedure adr_country_d(:id_country);';
  Params.DBHandle:=DBHandle;

  OutPut:=TRxMemoryData.Create(self);

  if GetUnivSprav(Params,OutPut) then
   begin
     if DM.pFIBDS_SelectCountry.Active then DM.pFIBDS_SelectCountry.Close;
     DM.pFIBDS_SelectCountry.Open;
     CBCountry.EditValue:=output['id_country'];
   end;
end;

procedure TfAdrEditForm.RegionOpenSprav(Sender: TObject);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Довідник регіонів';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_Region_Form';
  Params.ModifFormClass:='TAdd_Region_Form';
  Params.TableName:='ADR_REGION_SELECT('+IntToStr(CBCountry.EditValue)+');';
  Params.Fields:='Name_region,id_region';
  Params.FieldsName:='Назва';
  Params.KeyField:='id_region';
  Params.ReturnFields:='Name_region,id_region';
  Params.DeleteSQL:='execute procedure adr_region_d(:id_region);';
  Params.DBHandle:=DBHandle;

  OutPut:=TRxMemoryData.Create(self);

  if GetUnivSprav(Params,OutPut)
   then
   begin
     EnableRegion(CBCountry.EditValue);
     CBRegion.EditValue:=output['id_region'];
   end;
end;

procedure TfAdrEditForm.DistrictOpenSprav(Sender: TObject);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Довідник районів';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_District_Form';
  Params.ModifFormClass:='TAdd_District_Form';
  Params.TableName:='adr_district_select('+IntToStr(CBRegion.EditValue)+');';
  Params.Fields:='Name_district,id_district';
  Params.FieldsName:='Район';
  Params.KeyField:='id_district';
  Params.ReturnFields:='Name_district,id_district';
  Params.DeleteSQL:='execute procedure adr_district_d(:id_district);';
  Params.DBHandle:=DBHandle;

  OutPut:=TRxMemoryData.Create(self);

  if GetUnivSprav(Params,OutPut)
   then
   begin
     EnableDistrict(CBRegion.EditValue);
     CBDistrict.EditValue:=output['id_district'];
   end;
end;

procedure TfAdrEditForm.PlaceOpenSprav(Sender: TObject);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
  id_distr: string;
begin
  if not VarIsNull(CBDistrict.EditValue) then
   id_distr:=IntToStr(CBDistrict.EditValue)
  else
   id_distr:='null';

  Params.FormCaption:='Довідник міст';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_Place_Form';
  Params.ModifFormClass:='TAdd_Place_Form';
  Params.TableName:='ADR_PLACE_SELECT('+IntToStr(CBRegion.EditValue)+','+id_distr+')';
  Params.Fields:='Name_place,id_place';
  Params.FieldsName:='Назва';
  Params.KeyField:='id_place';
  Params.ReturnFields:='Name_place,id_place';
  Params.DeleteSQL:='execute procedure adr_place_d(:id_place);';
  Params.DBHandle:=DBHandle;

  OutPut:=TRxMemoryData.Create(self);

  if GetUnivSprav(Params,OutPut)
   then
   begin
     EnableTown(CBRegion.EditValue,CBDistrict.EditValue);
     CBTown.EditValue:=output['id_place'];
   end;
end;

procedure TfAdrEditForm.StreetOpenSprav(Sender: TObject);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Довідник вулиць';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_Street_Form';
  Params.ModifFormClass:='TAdd_Street_Form';
  Params.TableName:='ADR_STREET_SELECT('+IntToStr(CBTown.EditValue)+');';
  Params.Fields:='Name_street,id_street';
  Params.FieldsName:='Вулиця';
  Params.KeyField:='id_street';
  Params.ReturnFields:='Name_street,id_street';
  Params.DeleteSQL:='execute procedure adr_street_d(:id_street);';
  Params.DBHandle:=DBHandle;

  OutPut:=TRxMemoryData.Create(self);

  if GetUnivSprav(Params,OutPut)
   then
   begin
     EnableStreet(CBTown.EditValue);
     CBStreet.EditValue:=output['id_street'];
   end;
end;

procedure TfAdrEditForm.AreaOpenSprav(Sender: TObject);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Довідник міських районів';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbModif,fbDelete,fbExit];
  Params.AddFormClass:='TAddCityArea';
  Params.ModifFormClass:='TAddCityArea';
  Params.TableName:='adr_city_area_select('+IntToStr(CBTown.EditValue)+')';
  Params.Fields:='Name_CITY_AREA,id_CITY_AREA';
  Params.FieldsName:='Назва';
  Params.KeyField:='id_CITY_AREA';
  Params.ReturnFields:='Name_CITY_AREA,id_CITY_AREA';
  Params.DeleteSQL:='execute procedure adr_CITY_AREA_d(:id_CITY_AREA);';
  Params.DBHandle:=DBHandle;

  OutPut:=TRxMemoryData.Create(self);

  if GetUnivSprav(Params,OutPut)
   then
   begin
     EnableArea(CBTown.EditValue);
     CBArea.EditValue:=output['id_CITY_AREA'];
   end;
end;

procedure TfAdrEditForm.CBCountryPropertiesEditValueChanged(
  Sender: TObject);
begin
  EnableRegion(CBCountry.EditValue);
end;

procedure TfAdrEditForm.CBRegionPropertiesEditValueChanged(
  Sender: TObject);
begin
  EnableDistrict(CBRegion.EditValue);
end;

procedure TfAdrEditForm.CBDistrictPropertiesEditValueChanged(
  Sender: TObject);
begin
  EnableTown(CBRegion.EditValue,CBDistrict.EditValue);
end;

procedure TfAdrEditForm.CBTownPropertiesEditValueChanged(
  Sender: TObject);
begin
  EnableStreet(CBTown.EditValue);
  EnableArea(CBTown.EditValue);
end;

procedure TfAdrEditForm.CancelActionExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

initialization
    RegisterClass(TfAdrEditForm);

end.
