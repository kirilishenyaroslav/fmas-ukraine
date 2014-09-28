unit gar_Load_Filter_ComulativeList;

interface

uses classes, ibase, gar_Filter_ComulativeList, Controls,
     variants, gar_Types;

function View_FilterComulativeList(Param:TGarTypePrintUniversal):boolean;stdcall;
  exports View_FilterComulativeList;

implementation

function View_FilterComulativeList(Param:TGarTypePrintUniversal):boolean;
var
  Form:TFFilterComulativeList;
begin
  Form:=TFFilterComulativeList.Create(TgatFilter_ComulativeList(Param));
  if Form.ShowModal=mrYes then
    Result:=True
  else
    Result:=False;
  Form.Free;
end;

end.
