unit CsTypeOrderPremia_loader;



interface

uses uCS_Types, CsTypeOrderPremiaDM, CsTypeOrderPremiaMainForm,  Forms, dialogs;

function View_CSTypeOrderPremia(Param:TcsTypeOrderParam): variant; stdcall;
function GetFrame_CSTypeOrderPremia(Param:TcsTypeOrderParam): TFrame; stdcall;
exports View_CSTypeOrderPremia;
exports GetFrame_CSTypeOrderPremia;

implementation

function View_CSTypeOrderPremia(Param:TcsTypeOrderParam):variant;
begin
  DMFCsTypeOrderPremiaMain:=TDMFCsTypeOrderPremiaMain.create(Param);
  FCsTypeOrderPremiaMain:=  TFCsTypeOrderPremiaMain.create(Param);
  FCsTypeOrderPremiaMain.Show;


end;

function GetFrame_CSTypeOrderPremia(Param:TcsTypeOrderParam): TFrame;
begin


  DMFCsTypeOrderPremiaMain:=TDMFCsTypeOrderPremiaMain.create(Param);
  Result:=  TFrame(TFCsTypeOrderPremiaMain.create(Param));
end;

end.
