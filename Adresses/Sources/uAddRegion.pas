unit uAddRegion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCharControl, uFControl, uLabeledFControl, uSpravControl,
  StdCtrls, Buttons, uFormControl, uAdr_DataModule, uAddModifForm;

type
  TAdd_Region_Form = class(TAddModifForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    qFSC_Type: TqFSpravControl;
    qFCC_Name: TqFCharControl;
    qFSC_Country: TqFSpravControl;
    qFFC_Region: TqFFormControl;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure qFSC_TypeOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_CountryOpenSprav(Sender: TObject; var Value: Variant;
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
  Add_Region_Form: TAdd_Region_Form;

implementation

{$R *.dfm}

uses RxMemDS, uUnivSprav;

constructor TAdd_Region_Form.Create(AOwner: TComponent ; DMod: TAdrDM; Mode: TFormMode; Where: Variant);
begin
  inherited Create(AOwner);
  DBHandle:=Integer(DMod.pFIBDB_Adr.Handle);
	Self.Mode := Mode;
  qFFC_Region.Prepare(DMod.pFIBDB_Adr,Mode,Where,Null);
end;

procedure TAdd_Region_Form.OkButtonClick(Sender: TObject);
begin
  qFFC_Region.Ok;
end;

procedure TAdd_Region_Form.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TAdd_Region_Form.qFSC_TypeOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Довідник типів регіонів';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbExit];
  Params.AddFormClass:='TAdd_Region_Form';
  Params.ModifFormClass:='TAdd_Region_Form';
  Params.TableName:='ini_type_region';
  Params.Fields:='Name_full,id_region_type';
  Params.FieldsName:='Назва';
  Params.KeyField:='id_region_type';
  Params.ReturnFields:='Name_full,id_region_type';
  Params.DeleteSQL:='execute procedure adr_region_d(:id_region);';
  Params.DBHandle:=DBHandle;

  OutPut:=TRxMemoryData.Create(self);
  if GetUnivSprav(Params,OutPut)
   then
   begin
     value:=output['id_region_type'];
     DisplayText:=VarToStr(output['Name_full']);
   end;
end;

procedure TAdd_Region_Form.qFSC_CountryOpenSprav(Sender: TObject;
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

initialization
    RegisterClass(TAdd_Region_Form);

end.
