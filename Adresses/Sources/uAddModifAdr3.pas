unit uAddModifAdr3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uAddModifForm, uInvisControl, uSpravControl, uFormControl,
  StdCtrls, Buttons, uFControl, uLabeledFControl, uCharControl, DB,
  FIBDataSet, pFIBDataSet, uAdr_DataModule;

type
  TAddModifAdrForm3 = class(TAddModifForm)
    qFCC_Korpus: TqFCharControl;
    qFCC_House: TqFCharControl;
    qFCC_Flat: TqFCharControl;
    qFCC_Zip: TqFCharControl;
    OkButton: TBitBtn;
    qFFC_Adress: TqFFormControl;
    CancelButton: TBitBtn;
    qFSC_CArea: TqFSpravControl;
    qFSC_Street: TqFSpravControl;
    qFIC_AdrPK: TqFInvisControl;
    qFSC_Country: TqFSpravControl;
    qFSC_Region: TqFSpravControl;
    qFSC_District: TqFSpravControl;
    qFSC_Place: TqFSpravControl;
    procedure qFSC_DistrictOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_CountryOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_RegionOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_PlaceOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_StreetOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_CAreaOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_PlaceChange(Sender: TObject);
    procedure qFSC_CountryChange(Sender: TObject);
    procedure qFSC_RegionChange(Sender: TObject);
    procedure qFSC_DistrictChange(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  private
    Mode: TFormMode;
    DM: TAdrDM;
    { Private declarations }
  public
    constructor Create(AOwner:TComponent; DMod: TAdrDM; Mode: TFormMode; Where: Variant; id_PK:Variant);
  end;

var
  AddModifAdrForm3: TAddModifAdrForm3;

implementation

{$R *.dfm}

uses RxMemDS, uUnivSprav;

constructor TAddModifAdrForm3.Create(AOwner:TComponent; DMod: TAdrDM; Mode: TFormMode; Where: Variant; id_PK:Variant);
begin
  inherited Create(AOwner);
	Self.Mode := Mode;
  Self.DM := TAdrDM.Create(Self);
  Self.DM := DMod;
  DBHandle:=Integer(DM.pFIBDB_Adr.Handle);
  qFIC_AdrPK.SetValue(id_PK);
  qFFC_Adress.Prepare(DM.pFIBDB_Adr,Mode,Where,Null);
  qFIC_AdrPK.SetValue(id_PK);
end;

procedure TAddModifAdrForm3.qFSC_CountryOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
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

  if GetUnivSprav(Params,OutPut)
   then
   begin
     value:=output['id_country'];
     DisplayText:=VarToStr(output['Name_country']);
   end;
end;

procedure TAddModifAdrForm3.qFSC_RegionOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  if VarIsNull(qFSC_Country.Value) then
   begin
     ShowMessage('Спочатку оберіть країну!');
     Exit;
   end;

  Params.FormCaption:='Довідник регіонів';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_Region_Form';
  Params.ModifFormClass:='TAdd_Region_Form';
  Params.TableName:='ADR_REGION_SELECT('+IntToStr(qFSC_Country.Value)+');';
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
//     ShowInfo(output);
     value:=output['id_region'];
     DisplayText:=VarToStr(output['Name_region']);
   end;
end;

procedure TAddModifAdrForm3.qFSC_DistrictOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  if VarIsNull(qFSC_Region.Value) then
   begin
     ShowMessage('Спочатку оберіть регіон!');
     Exit;
   end;

  Params.FormCaption:='Довідник районів';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_District_Form';
  Params.ModifFormClass:='TAdd_District_Form';
  Params.TableName:='adr_district_select('+IntToStr(qFSC_Region.Value)+');';
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
//     ShowInfo(output);
     value:=output['id_district'];
     DisplayText:=VarToStr(output['Name_district']);
   end;
end;

procedure TAddModifAdrForm3.qFSC_PlaceOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
  id_distr: string;
begin
  if VarIsNull(qFSC_Region.Value) then
   begin
     ShowMessage('Спочатку оберіть регіон!');
     Exit;
   end;

  if not VarIsNull(qFSC_District.Value) then
   id_distr:=IntToStr(qFSC_District.Value)
  else
   id_distr:='null';

  Params.FormCaption:='Довідник міст';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_Place_Form';
  Params.ModifFormClass:='TAdd_Place_Form';
  Params.TableName:='ADR_PLACE_SELECT('+IntToStr(qFSC_Region.Value)+','+id_distr+')';
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
     value:=output['id_place'];
     DisplayText:=VarToStr(output['Name_place']);
   end;
end;

procedure TAddModifAdrForm3.qFSC_StreetOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  if VarIsNull(qFSC_Place.Value) then
   begin
     ShowMessage('Спочатку оберіть місто!');
     Exit;
   end;

  Params.FormCaption:='Довідник вулиць';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_Street_Form';
  Params.ModifFormClass:='TAdd_Street_Form';
  Params.TableName:='ADR_STREET_SELECT('+IntToStr(qFSC_Place.Value)+');';
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
//     ShowInfo(output);
     value:=output['id_street'];
     DisplayText:=VarToStr(output['Name_street']);
   end;
end;

procedure TAddModifAdrForm3.qFSC_CAreaOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  if VarIsNull(qFSC_Place.Value) then
   begin
     ShowMessage('Спочатку оберіть місто!');
     Exit;
   end;

  Params.FormCaption:='Довідник міських районів';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbModif,fbDelete,fbExit];
  Params.AddFormClass:='TAddCityArea';
  Params.ModifFormClass:='TAddCityArea';
  Params.TableName:='adr_city_area_select('+IntToStr(qFSC_Place.Value)+')';
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
     value:=output['id_CITY_AREA'];
     DisplayText:=VarToStr(output['Name_CITY_AREA']);
   end;
end;

procedure TAddModifAdrForm3.qFSC_CountryChange(Sender: TObject);
begin
  if not Visible then Exit;
  qFSC_Region.Clear;
end;

procedure TAddModifAdrForm3.qFSC_RegionChange(Sender: TObject);
begin
  if not Visible then Exit;
  qFSC_District.Clear;
end;

procedure TAddModifAdrForm3.qFSC_DistrictChange(Sender: TObject);
begin
  if not Visible then Exit;
  qFSC_Place.Clear;
end;

procedure TAddModifAdrForm3.qFSC_PlaceChange(Sender: TObject);
begin
  if not Visible then Exit;
  qFSC_Street.Clear;
  qFSC_CArea.Clear;
end;

procedure TAddModifAdrForm3.OkButtonClick(Sender: TObject);
begin
  qFFC_Adress.Ok;
end;

initialization
    RegisterClass(TAddModifAdrForm3);

end.
