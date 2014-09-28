unit gr_AccList_Loader;

interface

uses gr_AccList_PrintDM, gr_uCommonLoader, Classes, IBase;

function PrintgrAccList(AParameter: TObject):variant;stdcall;
 exports PrintgrAccList;

implementation

function PrintgrAccList(AParameter:TObject):Variant;
     var PrintDM: TPrintDM;
 begin
   PrintDM  :=  TPrintDM.Create(TgrSimpleParam(AParameter).Owner);
   PrintDM.ReportCreate(TgrAccListParam(AParameter));
   PrintDM.Destroy;
 end;

end.
