unit uAddBirthPlace;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uAddModifForm, StdCtrls, Buttons, uFormControl, uFControl,
  uLabeledFControl, uSpravControl, uAdr_DataModule, uInvisControl;

type
  TAddBirthPlace = class(TAddModifForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    qFFC_Adress: TqFFormControl;
    qFSC_Coutry: TqFSpravControl;
    qFSC_Region: TqFSpravControl;
    qFSC_City: TqFSpravControl;
    procedure OkButtonClick(Sender: TObject);
    procedure qFSC_CoutryOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_RegionOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_CityOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_CoutryChange(Sender: TObject);
    procedure qFSC_RegionChange(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent; DMod: TAdrDM; Mode: TFormMode; Where: Variant);
  end;

var
  AddBirthPlace: TAddBirthPlace;

implementation

uses uAdressForm, RXMemDS, uUnivSprav;

{$R *.dfm}

constructor TAddBirthPlace.Create(AOwner:TComponent; DMod: TAdrDM; Mode: TFormMode; Where: Variant);
begin
  inherited Create(AOwner);
  DBHandle:=Integer(DMod.pFIBDB_Adr.Handle);
  if (Mode=fmAdd) then
   begin
   end;
  qFFC_Adress.Prepare(DMod.pFIBDB_Adr,Mode,Where,Null);
end;

procedure TAddBirthPlace.OkButtonClick(Sender: TObject);
begin
  qFFC_Adress.Ok;
end;

procedure TAddBirthPlace.qFSC_CoutryOpenSprav(Sender: TObject;
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

procedure TAddBirthPlace.qFSC_RegionOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  if VarIsNull(qFSC_Coutry.Value) then
   begin
     MessageDlg('Спочатку оберіть країну!',mtError,[mbOk],-1);
     Exit;
   end;
  Params.FormCaption:='Довідник регіонів';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_Region_Form';
  Params.ModifFormClass:='TAdd_Region_Form';
  Params.TableName:='adr_region_select('+IntToStr(qFSC_Coutry.Value)+')';
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

procedure TAddBirthPlace.qFSC_CityOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  if VarIsNull(qFSC_Region.Value) then
   begin
     MessageDlg('Спочатку оберіть регіон!',mtError,[mbOk],-1);
     Exit;
   end;
  Params.FormCaption:='Довідник міст';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_Place_Form';
  Params.ModifFormClass:='TAdd_Place_Form';
  Params.TableName:='adr_place_select('+IntToStr(qFSC_Region.Value)+',null)';
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

procedure TAddBirthPlace.qFSC_CoutryChange(Sender: TObject);
begin
  if Visible then
   qFSC_Region.Clear;
end;

procedure TAddBirthPlace.qFSC_RegionChange(Sender: TObject);
begin
  if Visible then
   qFSC_City.Clear;
end;

initialization
    RegisterClass(TAddBirthPlace);

end.
