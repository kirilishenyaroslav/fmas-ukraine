unit Gar_Loder_MarkaAvto;

interface

uses gr_uCommonLoader, Gar_MainMarkaAvto, ZProc, Forms;

function View_MainMarkaAvto(Param:TgrSimpleParam):Variant;stdcall;
exports View_MainMarkaAvto;

implementation

function View_MainMarkaAvto(Param:TgrSimpleParam):Variant;
begin
  if IsMDIChildFormShow(TFMainMarkaAvto) then Exit;
  FMainMarkaAvto:=TFMainMarkaAvto.create(Param);
  //FMainMarkaAvto.ShowModal;
  //FMainMarkaAvto.Free;
end;



end.
