unit ZSvodProcUnit;

interface

uses ZSvodTypesUnit;

Function IdVidOplPropFromTypeSimpleReestr(TypeSimpleReestr:TTypeSimpleReestr):integer;

implementation

Function IdVidOplPropFromTypeSimpleReestr(TypeSimpleReestr:TTypeSimpleReestr):integer;
begin
 case TypeSimpleReestr of
  tsrHospList: Result:=60;
  tsrDuty: Result:=61;
  tsrDopPlat: Result:=62;
  tsrStrah: Result:=63;
  tsrAlimony: Result:=64;
  tsrOtherUd: Result:=65;
  tsrPF: Result:=66;
  tsrPFU: Result:=67;
  tsrSumMoreVidrah: Result:=68;
  tsrInvalid: Result:=69;
  tsrPererah: Result:=70;
  tsrCredit: Result:=71;
  tsrInvalid2: Result:=72;
  tsrAlimony_budget: Result:=64;
  tsrNarLimit: Result:=73;
  else Result:=0;
 END;
end;

end.
