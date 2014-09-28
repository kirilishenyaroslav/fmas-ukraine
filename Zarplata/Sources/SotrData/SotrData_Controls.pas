unit SotrData_Controls;

interface
uses Windows, Messages, SysUtils, Variants, Classes, IBase, ZTypes, PackageLoad,
     Controls;
type TIDsArray = array[0..9] of String;
const IDsIns : TIDsArray =('OUT_ID_MAN','OUT_ID_MAN','OUT_ID_MAN','RMOVING'    ,'RMOVING'    ,'OUT_ID_MAN','OUT_ID_MAN','OUT_ID_MAN'    ,'','RMOVING');
const    IDs : TIDsArray =('ID',     'ID_CURRENT',        'ID','ID_DOP_NACH','ID_DEDCONST','ID'        ,'ID_ALIMONY','ID_PEOPLE_PRIV','','ID');
const DopPrm : TIDsArray =(''          ,''       ,''          ,''           ,''           ,'USE_END'   ,''          ,''              ,'',''       );


function ControlBtnClick(AOwner:TComponent; ADB_Handle:TISC_DB_HANDLE;
                ID,APage:integer; Azcfs:TZControlFormStyle; ADopPrm:Variant):Variant;

implementation

function ControlBtnClick(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;
                ID,APage:integer; Azcfs:TZControlFormStyle; ADopPrm:Variant):Variant;
var ParameterPeopleProp:TZPeoplePropParameters;
    ParameterCurrent:TZCurrentParameters;
    ParameterNonSpisok:TNonSpisokControlParameter;
    ParameterDopNach:TDopNachControlParameter;
    ParameterDedConst:TDedConstControlParameter;
    ParameterInvalid:TZCtrlWithHistoryParam;
    ParameterAlimony:TZAlimonyParameters;
    ParameterPeoplePriv:TZPeoplePrivParameters;
    ResLoad:variant;
begin
case APage of
 0:begin
     ParameterPeopleProp.ID := ID;
     if Azcfs=zcfsInsert then
       ParameterPeopleProp.TypeId := zppptIdMan
     else
       ParameterPeopleProp.TypeId := zppptIdPeopleProp;
     ParameterPeopleProp.ControlFormStyle := Azcfs;
     ResLoad:=LoadPeoplePropControl(AOwner,ADB_Handle,ParameterPeopleProp);
     if VarArrayDimCount(ResLoad)>0 then
       if ResLoad[0]=mrYes then
       begin
       end;
   end;
 1:begin
     ParameterCurrent.ID:=ID;
     if (Azcfs=zcfsInsert) or (Azcfs=zcfsUpdate) then
       ParameterCurrent.TypeID:=zcptRMoving
     else
       ParameterCurrent.TypeID:=zcptIdCurrent;
     ParameterCurrent.Owner:=AOwner;
     ParameterCurrent.ControlFormStyle:=Azcfs;
     ParameterCurrent.Db_Handle:=ADB_Handle;
     ResLoad:=LoadCurrentControl(ParameterCurrent);
     if VarArrayDimCount(ResLoad)>0 then
     if ResLoad[0]=mrYes then
       begin
       end;
   end;
 2:begin
     ParameterNonSpisok.Owner:=AOwner;
     ParameterNonSpisok.Db_Handle:=ADB_Handle;
     ParameterNonSpisok.ControlFormStyle:=Azcfs;
     ParameterNonSpisok.Id:=ID;
     ResLoad:=LoadNonSpisokControl(ParameterNonSpisok);
     If not VarIsNull(ResLoad) then
       begin
       end;
   end;
 3:begin
     ParameterDopNach.AOwner:=AOwner;
     ParameterDopNach.ADb_Handle:=ADB_Handle;
     ParameterDopNach.AControlFormStyle:=Azcfs;
     ParameterDopNach.AId:=ID;
     ResLoad:=LoadDopNachControl(ParameterDopNach);
     If ResLoad<>NULL then
   end;
 4:begin
     ParameterDedConst.AOwner:=AOwner;
     ParameterDedConst.ADb_Handle:=ADB_Handle;
     ParameterDedConst.AControlFormStyle:=Azcfs;
     ParameterDedConst.AId:=ID;
     ResLoad:=LoadDedConstControl(ParameterDedConst);
     If ResLoad<>NULL then
       begin
       end;
   end;
 5:begin
     ParameterInvalid.ID := ID;
     if ADopPrm<>Null then
       ParameterInvalid.Use_DateTime := ADopPrm.AsDateTime;
     ParameterInvalid.ControlFormStyle := Azcfs;
     ResLoad:=LoadInvalidControl(AOwner,ADB_Handle,ParameterInvalid);
     if ResLoad[0]=mrYes then
       begin
       end
   end;
 6:begin
     ParameterAlimony.ID := ID;
     ParameterAlimony.ControlFormStyle := Azcfs;
     ResLoad:=LoadAlimonyControl(AOwner,ADB_Handle,ParameterAlimony);
     if ResLoad[0]=mrYes then
       begin
       end;
   end;
 7:begin
     ParameterPeoplePriv.ID := ID;
     if Azcfs=zcfsInsert then
       ParameterPeoplePriv.TypeId := zppctIdPeople
     else
       ParameterPeoplePriv.TypeId := zppctIdPeoplePriv;
     ParameterPeoplePriv.ControlFormStyle := Azcfs;
     ResLoad:=LoadPeoplePrivControl(AOwner,ADB_Handle,ParameterPeoplePriv);
     if VarArrayDimCount(ResLoad)>0 then
       if ResLoad[0]=mrYes then
         begin
         end;
   end;
 8://Ремонтные
 begin

 end;
 9: //Исключения
 begin
    ResLoad := LoadRMovingExcCtrl(AOwner,ADB_Handle,azcfs,ID);
 end;
end;
end;

end.
