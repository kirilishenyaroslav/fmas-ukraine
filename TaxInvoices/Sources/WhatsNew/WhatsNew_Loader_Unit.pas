unit WhatsNew_Loader_Unit;

interface

uses Classes, variants;

function WhatsNewShow(AOwner: TComponent;FileName:string):variant;stdcall;
 exports WhatsNewShow;

implementation

uses WhatsNew_Form_Unit;

function WhatsNewShow(AOwner: TComponent;FileName:string):variant;stdcall;
var FormData:TWhatsNewForm;
begin
 Result := NULL;
 FormData := TWhatsNewForm.Create(AOwner,FileName);
 FormData.ShowModal;
 FormData.Free;
end;

end.
