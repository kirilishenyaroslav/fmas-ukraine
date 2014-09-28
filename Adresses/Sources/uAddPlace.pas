unit uAddPlace;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uCharControl, uBoolControl,
  uSpravControl, uFormControl, StdCtrls, Buttons, uAdr_DataModule,
  uAddModifForm;

type
  TAdd_Place_Form = class(TAddModifForm)
    qFCC_Name: TqFCharControl;
    qFSC_Type: TqFSpravControl;
    qFSC_Region: TqFSpravControl;
    qFSC_District: TqFSpravControl;
    qFCC_Zip: TqFCharControl;
    qFBC_IsCap: TqFBoolControl;
    qFBC_IsRC: TqFBoolControl;
    qFBC_IsDC: TqFBoolControl;
    qFFC_Place: TqFFormControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure qFSC_TypeOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_RegionOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_DistrictOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
  private
    { Private declarations }
  public
    Mode:TFormMode;
//    DBHandle: integer;
    constructor Create(AOwner: TComponent ; DMod: TAdrDM; Mode: TFormMode; Where: Variant);
    { Public declarations }
  end;

var
  Add_Place_Form: TAdd_Place_Form;

implementation

{$R *.dfm}

uses RxMemDS, uUnivSprav;

constructor TAdd_Place_Form.Create(AOwner: TComponent ; DMod: TAdrDM; Mode: TFormMode; Where: Variant);
begin
  inherited Create(AOwner);
	Self.Mode := Mode;
  DBHandle:=Integer(DMod.pFIBDB_Adr.Handle);
  qFFC_Place.Prepare(DMod.pFIBDB_Adr,Mode,Where,Null);
end;

procedure TAdd_Place_Form.OkButtonClick(Sender: TObject);
begin
  qFFC_Place.Ok;
end;

procedure TAdd_Place_Form.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TAdd_Place_Form.qFSC_TypeOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Довідник типів міст';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbExit];
  Params.AddFormClass:='TAdd_Region_Form';
  Params.ModifFormClass:='TAdd_Region_Form';
  Params.TableName:='ini_type_place';
  Params.Fields:='Name_full,id_type_place';
  Params.FieldsName:='Назва';
  Params.KeyField:='id_type_place';
  Params.ReturnFields:='Name_full,id_type_place';
  Params.DeleteSQL:='execute procedure adr_region_d(:id_region);';
  Params.DBHandle:=DBHandle;

  OutPut:=TRxMemoryData.Create(self);
  if GetUnivSprav(Params,OutPut)
   then
   begin
     value:=output['id_type_place'];
     DisplayText:=VarToStr(output['Name_full']);
   end;
end;

procedure TAdd_Place_Form.qFSC_RegionOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Довідник регіонів';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_Region_Form';
  Params.ModifFormClass:='TAdd_Region_Form';
  Params.TableName:='adr_region';
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

procedure TAdd_Place_Form.qFSC_DistrictOpenSprav(Sender: TObject;
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

initialization
    RegisterClass(TAdd_Place_Form);

end.
