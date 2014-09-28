unit AdrSp_Types;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, pFIBDatabase;

type
  TAdrEditForm = class(TForm)
  private
    { Private declarations }
  public
    StartId:Integer;
    Additional:Variant;
    ResultId:Integer; // Возвращает -1, если ничего не выбрано
    procedure SetParams(ADB_Handle:TISC_DB_HANDLE;AId:Integer;AAdd:Variant);
  end;

implementation

procedure TAdrEditForm.SetParams(ADB_Handle:TISC_DB_HANDLE;AId:Integer;AAdd:Variant);
var i:Integer;
begin
  for i:=0 to ComponentCount-1 do
    if Components[i] is TpFIBDatabase then
      begin
        (Components[i] as TpFIBDatabase).Handle:=ADB_Handle;
        Break;
      end;
  StartId:=AId;
  Additional:=AAdd;
end;

end.
