unit AppStruClasses;

interface

uses Classes, RxMemDS, Variants, SysUtils, Contnrs, Controls, Windows, Forms, AssociationList,
     Ibase;

const
    FMAS_MESS_CHANGE_LANG       = CN_BASE	+ 1000;
    FMAS_MESS_CHANGE_GSTYLE     = CN_BASE + 1001;
    FMAS_MESS_UPDATE_DATA       = CN_BASE + 1002;
    FMAS_MESS_CLOSE_FRAME       = CN_BASE + 1003;
    FMAS_MESS_SAVE_ITEM_OK      = CN_BASE + 1004;
    FMAS_MESS_SAVE_ITEM_ERR     = CN_BASE + 1005;
    FMAS_MESS_GET_BUTTON_OK     = CN_BASE + 1006;
    FMAS_MESS_GET_BUTTON_CANCEL = CN_BASE + 1007;
    FMAS_MESS_ITEM_INFO_CHANGED = CN_BASE + 1008;

type
    TEDBOCallBackFunction = function (Step:Integer; CountRows:Integer):Integer;

    TParamsContainer      =TStringAssociationList;
    PFormStyle            =^TFormStyle;
    TClassInfo            =packed record
         AClass           :TClass;
         ExistInfo        :Boolean;
    end;

    IFMASModule=interface(IInterface)
    ['{B544CD77-DDE1-440A-8668-8BC3D1DF9B65}']
        procedure Run;
    end;

    IFMASTemporaryDataStorage=interface(IInterface)
    ['{D336906B-9D52-4FF5-8B7A-69BA0A8D9651}']
        procedure ClearTmpData;
    end;

    IFMASFilterControl=interface(IInterface)
    ['{3F08F0AE-32EF-4A53-8118-F41C67BA1DFA}']
        procedure SetFilterParams(FilterParams:TParamsContainer);
        function GetFilterParams:TParamsContainer;
    end;

    IEDBOTools=interface(IInterface)
    ['{DB61F531-0827-4F1E-B334-92ADED7DED03}']
        function InitEDBOConnection(ServiseName:String; DB_HANDLE:TISC_DB_HANDLE):Boolean;
        procedure GetXMLDataFromService(MethodName:string; var Result:TRxMemoryData;  CFunc:TEDBOCallBackFunction=nil; isFirstCalling:Integer=0);
        function GetValueFromService(MethodName:string):Variant;
    end;

    TCreator = class
    function CreateFMASModule(ModuleID:String):IFMASModule;virtual;abstract;
    end;

    TFMASAppModule=class(TWinControl)
    public
          InParams:TParamsContainer;
          OutParams:TParamsContainer;
          function GetOtherObjInstance(ClassName:TFormClass):HWND;
          {$WARNINGS OFF}
          constructor Create(AOwner: TComponent);  virtual;
          destructor  Destroy; virtual;
          {$WARNINGS ON}
    end;

    TFMASAppModuleClass=class of TFMASAppModule;

    TFMASAppModuleCreator=class(TCreator)
    private
          function GetClassByName(ClassName:String):TClassInfo;
    public
          function CreateFMASModule(ModulePath,ModuleName:String):TFMASAppModule;reintroduce;
    end;

    procedure RegisterAppModule(AClass:TClass; ClassName:String; ClassIndex:Integer=0);

var FMASAppModuleClasses:TClassList;
    FMASAppModuleClassesNames:TStringList;
    FMASAppModuleList:array of HWND;
    LocalMainForm:TForm;
    Language:Integer;
implementation

function TFMASAppModuleCreator.GetClassByName(ClassName:String):TClassInfo;
  var AClassIndex:Integer;
      Loc:TClassInfo;
begin
      AClassIndex:=FMASAppModuleClassesNames.IndexOf(ClassName);
      if AClassIndex=-1
      then begin
                Loc.ExistInfo:=false
      end
      else begin
                Loc.ExistInfo:=true;
                Loc.AClass:=FMASAppModuleClasses.Items[AClassIndex];
      end;
      Result:=Loc;
end;

procedure RegisterAppModule(AClass:TClass; ClassName:String;ClassIndex:Integer=0);
begin
     if (FMASAppModuleClasses.IndexOf(AClass)<0)
     then begin
               FMASAppModuleClasses.Add(AClass);
               FMASAppModuleClassesNames.Add(ClassName);
     end;
end;

{ TFMASAppModule }
constructor TFMASAppModule.Create;
begin
     if Application.MainForm<>nil
     then begin
               inherited Create(Application.MainForm);
               self.Parent:=Application.MainForm;
     end
     else begin
               inherited Create(LocalMainForm);
               self.Parent:=LocalMainForm;
     end;

     SetLength(FMASAppModuleList,Length(FMASAppModuleList)+1);
     FMASAppModuleList[Length(FMASAppModuleList)-1]:=self.Handle;

     InParams :=TParamsContainer.Create(true);
     OutParams:=TParamsContainer.Create(true);
end;


destructor TFMASAppModule.Destroy;
begin
     //Освобожедение ресурсов класса
     if Assigned(InParams)  then InParams.Free;
     if Assigned(OutParams) then OutParams.Free;

     inherited Destroy;
end;

{ TConcreateCreator }
function TFMASAppModuleCreator.CreateFMASModule(ModulePath,ModuleName:String): TFMASAppModule;
var  ResultInfo:TClassInfo;
     HandlePack:HModule;
     Res:TFMASAppModule;
begin
     HandlePack:=GetModuleHandle(PAnsiChar(ModuleName));
     if (HandlePack<32)
     then begin
               if FileExists(ModulePath+ModuleName+'.bpl')
               then HandlePack:=LoadPackage(ModulePath+ModuleName+'.bpl');

               if (HandlePack<32)
               then begin
                         Res:=nil;
               end
               else begin
                         ResultInfo :=GetClassByName(ModuleName);
                         if ResultInfo.ExistInfo
                         then Res:=TFMASAppModuleClass(ResultInfo.AClass).Create(nil)
                         else Res:=nil;
               end;
     end
     else begin
               ResultInfo :=GetClassByName(ModuleName);
               if ResultInfo.ExistInfo
               then Res:=TFMASAppModuleClass(ResultInfo.AClass).Create(nil)
               else Res:=nil;
     end;

     Result:=Res;
end;

function TFMASAppModule.GetOtherObjInstance(ClassName:TFormClass):HWND;
var i:Integer;
    Res:HWND;
begin
    Res:=0;
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
           if (Application.MainForm.MDIChildren[i] is ClassName)
           then Res:=Application.MainForm.MDIChildren[i].Handle;
           Break;
    end;
    Result:=Res;
end;

initialization
    FMASAppModuleClasses     :=TClassList.Create;
    FMASAppModuleClassesNames:=TStringList.Create;
    LocalMainForm:=TForm.Create(nil);
    Language:=0;

finalization
    FMASAppModuleClasses.Free;
    FMASAppModuleClassesNames.Free;
    LocalMainForm.Free;
end.
