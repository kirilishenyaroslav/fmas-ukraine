unit UO_WhatsNew_Loader;

interface

uses Classes, Variants, AArray;

procedure ShowAllUoBpl (aOwner: TComponent; aParam : TAArray); stdcall;
  exports   ShowAllUoBpl;

implementation

uses UO_WhatsNew_MainForm;

procedure ShowAllUoBpl(aOwner: TComponent; aParam : TAArray);
var FormData:TFWhatsNew;
begin
 FormData := TFWhatsNew.Create(AOwner,aParam['Input']['FileName'].AsString);
 FormData.ShowModal;
 FormData.Free;
end;

end.
