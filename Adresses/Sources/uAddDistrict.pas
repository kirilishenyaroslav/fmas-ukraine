unit uAddDistrict;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSpravControl, uFControl, uLabeledFControl, uCharControl,
  uFormControl, StdCtrls, Buttons, uAdr_DataModule, uAddModifForm;

type
  TAdd_District_Form = class(TAddModifForm)
    qFFC_District: TqFFormControl;
    qFCC_Name: TqFCharControl;
    qFSC_Region: TqFSpravControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure qFSC_RegionOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
  private
    { Private declarations }
  public
    { Public declarations }
//    DBHandle: integer;
    Mode:TFormMode;
    constructor Create(AOwner: TComponent ; DMod: TAdrDM; Mode: TFormMode; Where: Variant);
  end;

var
  Add_District_Form: TAdd_District_Form;

implementation

{$R *.dfm}

uses RxMemDS, uUnivSprav;

constructor TAdd_District_Form.Create(AOwner: TComponent ; DMod: TAdrDM; Mode: TFormMode; Where: Variant);
begin
  inherited Create(AOwner);
  DBHandle:=Integer(DMod.pFIBDB_Adr.Handle);
	Self.Mode := Mode;
  qFFC_District.Prepare(DMod.pFIBDB_Adr,Mode,Where,Null);
end;

procedure TAdd_District_Form.OkButtonClick(Sender: TObject);
begin
  qFFC_District.Ok;
end;

procedure TAdd_District_Form.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TAdd_District_Form.qFSC_RegionOpenSprav(Sender: TObject;
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

initialization
    RegisterClass(TAdd_District_Form);

end.
