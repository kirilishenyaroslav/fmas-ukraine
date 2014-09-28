unit gar_LoadPackageGarage;

interface

uses Forms, Windows, Dialogs, SysUtils,Variants,Classes,
     Controls, pFIBDataBase,IBase, gr_uCommonLoader, gar_Types, gr_uWaitForm, ZDPKConsts;

resourcestring
     LoadErrorG=           'Ошибка при работе с библиотекой';
     ErrorCaptionG=        'Внимание ошибка!';




{PATH}
const Path_Garage ='Garage\';
const PathReports ='Reports\Garage\';
{Name_BPL}

const Name_Gar_Sp_Marka_Avto              :array [0..1] of string = ('Gar_Sp_Marka_Avto.bpl','View_MainMarkaAvto');
const Name_Gar_Sp_Model                   :array [0..1] of string = ('GAR_SP_MODEL.bpl','View_MainModel');
const Name_Gar_Sp_Marka_Topl              :array [0..1] of string = ('GAR_SP_MARKA_TOPL.bpl','View_Marka_Topl');
const Name_Gar_Sp_Avto                    :array [0..1] of string = ('Gar_Avto.bpl','View_MainAvto');
const Name_Gar_Sp_People                  :array [0..1] of string = ('Gar_Sp_People.bpl','View_MainPeople');
const Name_Gar_Sp_WayBill                 :array [0..1] of string = ('Gar_WayBill.bpl','View_WayBill_MainForm');
const Name_Gar_Comulative_List_By_Avto    :array [0..1] of string = ('gar_Print_ComulativeList_By_Avto.bpl','View_ComulativeList_By_Avto');
const Name_Gar_Comulative_List_By_Period  :array [0..1] of string = ('gar_Print_ComulativeList_ByPeriod.bpl','View_ComulativeList_by_Period');
const Name_Gar_Ved                        :array [0..1] of string = ('Gar_Ved.bpl','View_Ved_MainForm');
const Name_Gar_Sp_Factor                  :array [0..1] of string = ('Gar_Factor.bpl','View_FACTOR_MainForm');
const Name_GarAccess                      :array [0..1] of string = ('GarAccess.bpl','View_AccessGar');
const Name_Gar_Comulative_HelpList        :array [0..1] of string = ('gar_Print_Comulative_HelpList.bpl','View_Comulative_HelpList');
const Name_Gar_FilterWaybill              :array [0..1] of string = ('Gar_FilterWaybill.bpl','View_FilterWaybill');




function LoadPackageGarage(Param:TgarSimpleParamMode; const Bpl:array of string):variant;
function LoadGarAccess(AOwner: TComponent; const Bpl:array of string):TISC_DB_HANDLE;

implementation


function LoadGarAccess(AOwner: TComponent; const Bpl:array of string):TISC_DB_HANDLE;
var
  HandlePack: HModule;
  MDIFUNC   :function(AOwner: TComponent):TISC_DB_HANDLE;stdcall;
begin
  Result:=nil;
  HandlePack:=GetModuleHandle(PChar(Bpl[0]));
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_Garage+Bpl[0]);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Bpl[1]));
            if @MDIFUNC<>nil then Result:=MDIFUNC(AOwner);
  end
  else
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl[0]),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
end;

function LoadPackageGarage(Param:TgarSimpleParamMode; const Bpl:array of string):variant;
var
  HandlePack: HModule;
  MDIFUNC   :function(Param:TgarSimpleParamMode):Variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(PChar(Bpl[0]));
  if HandlePack<32
  then
    try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Path_Garage+Bpl[0]);
    finally
      Screen.Cursor:=crDefault;
      //CloseWaitForm(wf);
    end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,PChar(Bpl[1]));
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(Param)

  end
  else begin
            MessageBox(TForm(Param.Owner).Handle,PChar(LoadErrorG+Bpl[0]),PChar(ErrorCaptionG),MB_OK and MB_ICONWARNING);
            Res:=NULL;
  end;
  LoadPackageGarage:=Res;
end;



end.
