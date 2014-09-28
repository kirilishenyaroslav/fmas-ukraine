unit uAddCityArea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uFormControl, uCharControl, uFControl,
  uLabeledFControl, uSpravControl, uAddModifForm, uAdr_DataModule;

type
  TAddCityArea = class(TAddModifForm)
    qFSC_Place: TqFSpravControl;
    qFCC_Name: TqFCharControl;
    qFFC_CArea: TqFFormControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
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
  AddCityArea: TAddCityArea;

implementation

{$R *.dfm}

uses RxMemDS, uUnivSprav;

constructor TAddCityArea.Create(AOwner: TComponent ; DMod: TAdrDM; Mode: TFormMode; Where: Variant);
begin
  inherited Create(AOwner);
  DBHandle:=Integer(DMod.pFIBDB_Adr.Handle);
	Self.Mode := Mode;
  qFFC_CArea.Prepare(DMod.pFIBDB_Adr,Mode,Where,Null);
end;

procedure TAddCityArea.qFSC_PlaceOpenSprav(Sender: TObject;
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

procedure TAddCityArea.OkButtonClick(Sender: TObject);
begin
  qFFC_CArea.Ok;
end;

procedure TAddCityArea.CancelButtonClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

initialization
    RegisterClass(TAddCityArea);

end.
