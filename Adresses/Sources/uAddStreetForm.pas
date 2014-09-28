unit uAddStreetForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormControl, uSpravControl, uFControl, uLabeledFControl,
  uCharControl, StdCtrls, Buttons, uAdr_DataModule, uAddModifForm;

type
  TAdd_Street_Form = class(TAddModifForm)
    qFFC_Street: TqFFormControl;
    qFCC_Name: TqFCharControl;
    qFSC_Type: TqFSpravControl;
    qFSC_Place: TqFSpravControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    procedure qFSC_TypeOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_PlaceOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Mode:TFormMode;
    constructor Create(AOwner: TComponent ; DMod: TAdrDM; Mode: TFormMode; Where: Variant);
  end;

var
  Add_Street_Form: TAdd_Street_Form;

implementation

{$R *.dfm}

uses RxMemDS, uUnivSprav;

constructor TAdd_Street_Form.Create(AOwner: TComponent ; DMod: TAdrDM; Mode: TFormMode; Where: Variant);
begin
  inherited Create(AOwner);
  DBHandle:=Integer(DMod.pFIBDB_Adr.Handle);
	Self.Mode := Mode;
  qFFC_Street.Prepare(DMod.pFIBDB_Adr,Mode,Where,Null);
end;

procedure TAdd_Street_Form.qFSC_TypeOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Довідник типів вулиць';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbExit];
  Params.AddFormClass:='TAdd_Region_Form';
  Params.ModifFormClass:='TAdd_Region_Form';
  Params.TableName:='ini_type_street';
  Params.Fields:='Name_full,id_type_street';
  Params.FieldsName:='Назва';
  Params.KeyField:='id_type_street';
  Params.ReturnFields:='Name_full,id_type_street';
  Params.DeleteSQL:='execute procedure adr_region_d(:id_region);';
  Params.DBHandle:=DBHandle;

  OutPut:=TRxMemoryData.Create(self);
  if GetUnivSprav(Params,OutPut)
   then
   begin
     value:=output['id_type_street'];
     DisplayText:=VarToStr(output['Name_full']);
   end;
end;

procedure TAdd_Street_Form.qFSC_PlaceOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:='Довідник міст';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TAdd_Place_Form';
  Params.ModifFormClass:='TAdd_Place_Form';
  Params.TableName:='adr_place';
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

procedure TAdd_Street_Form.OkButtonClick(Sender: TObject);
begin
  qFFC_Street.Ok;
end;

procedure TAdd_Street_Form.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

initialization
    RegisterClass(TAdd_Street_Form);

end.
