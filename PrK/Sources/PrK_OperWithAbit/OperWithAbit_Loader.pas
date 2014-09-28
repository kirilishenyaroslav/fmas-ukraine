unit OperWithAbit_Loader;

interface

uses Classes,AArray,OperWithAbit_Perekl,Controls;

function ViewPereklForm(AOwner:TComponent;AParam:TAArray):Variant;stdcall;

exports ViewPereklForm;

implementation

uses Variants;

function ViewPereklForm(AOwner:TComponent;AParam:TAArray):Variant;stdcall;
var ViewForm:TFPrKPereklad;
begin
  Result:=Null;
  ViewForm:=TFPrKPereklad.Create(AOwner,AParam);
  if ViewForm.ShowModal = mrYes then // Сохранение удалось
    Result:=ViewForm.New_ID_DT_ABIT;
  ViewForm.Release;
end;

end.
