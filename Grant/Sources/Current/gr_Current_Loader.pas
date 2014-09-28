unit gr_Current_Loader;

interface

uses Classes, IBase,
     gr_uCommonLoader, gr_Current_MainForm, gr_Current_Filter, gr_uCommonProc,
     Variants, ZTypes, Controls;

function View_grCurrent(AParameter:TgrCtrlSimpleParam):Variant;stdcall;
 exports View_grCurrent;

implementation

function View_grCurrent(AParameter:TgrCtrlSimpleParam):Variant;stdcall;
var form:TFCurrent;
    pCurrentFilter:TgrCurrentFilter;
begin
 pCurrentFilter.Is_Smeta := False;
 pCurrentFilter.Is_Department := False;
 pCurrentFilter.Is_Man := False;
 pCurrentFilter.Is_VidOpl := False;
 pCurrentFilter.Is_OperationsFilter :=True;
 pCurrentFilter.Is_Prikaz := False;
 pCurrentFilter.Is_KodSetup := True;
 pCurrentFilter.Id_smeta := 0;
 pCurrentFilter.Id_department := 0;
 pCurrentFilter.Id_man := 0;
 pCurrentFilter.Id_VidOpl := 0;
 pCurrentFilter.Kod_Smeta := 0;
 pCurrentFilter.Kod_department := '';
 pCurrentFilter.Kod_VidOpl := 0;
 pCurrentFilter.Kod_Setup1 := grKodSetup(TgrSimpleParam(AParameter).DB_Handle);
 pCurrentFilter.Kod_Setup2 := pCurrentFilter.Kod_Setup1;
 pCurrentFilter.Name_Smeta := '';
 pCurrentFilter.Name_Department := '';
 pCurrentFilter.Name_VidOpl := '';
 pCurrentFilter.Tn := 0;
 pCurrentFilter.FIO := '';

 pCurrentFilter := ViewFilter(TgrSimpleParam(AParameter).Owner,TgrSimpleParam(AParameter).DB_Handle,pCurrentFilter);
 if pCurrentFilter.ModalResult=mrYes then
    Form:=TFCurrent.Create(TgrSimpleParam(AParameter).Owner,TgrSimpleParam(AParameter).DB_Handle,pCurrentFilter);
end;

end.
