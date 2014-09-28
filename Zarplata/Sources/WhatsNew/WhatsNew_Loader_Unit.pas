unit WhatsNew_Loader_Unit;

interface

uses Classes, variants;

function WhatsNewShow(AOwner: TComponent;FileName:string):variant;stdcall;
 exports WhatsNewShow;

implementation

uses WhatsNew_MainForm;

function WhatsNewShow(AOwner: TComponent;FileName:string):variant;stdcall;
var FormData:TFWhatsNew;
begin
 Result := NULL;
 FormData := TFWhatsNew.Create(AOwner,FileName);
 FormData.ShowModal;
 FormData.Free;
end;

end.
