unit ClassPrint;

interface

uses Classes, pFIBDatabase, pFIBStoredProc, pFIBDataSet, Forms, cn_Common_Types;

function PrintDogs(AParameter:TcnSimpleParamsEx):Variant;stdcall;
exports PrintDogs;

implementation

uses PrintDogsMain, Dialogs, SysUtils, Variants;

function PrintDogs(AParameter:TcnSimpleParamsEx):Variant;stdcall;
var
  T : TfmMainPrint;
begin
  T := TfmMainPrint.Create(AParameter);
  T.Show;
end;

end.
