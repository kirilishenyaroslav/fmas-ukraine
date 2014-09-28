unit gr_Stud_Loader;

interface

uses Classes, IBase, gr_Stud_MainForm, ZProc,
     Controls, gr_uCommonLoader,gr_uCommonTypes,gr_uCommonProc,Dates,variants,
     gr_Stud_Filter;

function View_Stud(AParameter:TObject):Variant;stdcall;
exports View_Stud;

implementation

function View_Stud(AParameter:TObject):Variant;
var ViewForm: TFStud;
PParamFilter:TParamFilter;
KodSetup:Integer;
begin
if ((IsMDIChildFormShow(TFStud)) or (AParameter.ClassType<>TgrSimpleParam)) then Exit;
//******************************************************************************
 KodSetup := grKodSetup(TgrSimpleParam(AParameter).DB_Handle);
 PParamFilter:=TParamFilter.Create;
 PParamFilter.AOwner:=TgrSimpleParam(AParameter).Owner;
 PParamFilter.Db_Handle:=TgrSimpleParam(AParameter).DB_Handle;
 PParamFilter.Year:=YearMonthFromKodSetup(KodSetup);
 PParamFilter.Month:=YearMonthFromKodSetup(KodSetup,False);
 PParamFilter.Contract    :='F';
 PParamFilter.Butget      :='T';
 PParamFilter.ManCaption  :='';
 PParamFilter.DepCaption  :='';
 PParamFilter.CatCaption  :='';
 PParamFilter.KodVidOpl   :='';
 PParamFilter.CaptionVidOpl   :='';
 PParamFilter.id_dep      :=null;
 PParamFilter.id_man      :=null;
 PParamFilter.id_prop     :=null;
 PParamFilter.id_cat      :=null;
 PParamFilter.id_vidopl   :=null;

 if not View_FormFilter(PParamFilter) then  Exit;
 ViewForm  :=  TFStud.Create(TgrSimpleParam(AParameter).Owner,TgrSimpleParam(AParameter).DB_Handle, PParamFilter);
end;

end.

