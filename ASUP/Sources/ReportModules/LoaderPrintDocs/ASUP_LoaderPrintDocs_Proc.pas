unit ASUP_LoaderPrintDocs_Proc;

interface

uses  Forms,Windows, Registry, IBase, Variants, SysUtils, Dialogs, Controls,
      ASUP_LoaderPrintDocs_Messages, ASUP_LoaderPrintDocs_StProc_DM,
      ASUP_LoaderPrintDocs_Consts, ASUP_LoaderPrintDocs_Types;

function IfThen(AValue: Boolean; const ATrue: Variant; const AFalse: Variant): Variant; overload;
function DesignReport:boolean;//Проверяет нужно ли открыть отчет для редактирования или печати
function DepartmentByKod(Kod:string;DB_Handle:TISC_DB_HANDLE):variant;//Поиск подразделения по коду

procedure SaveSelectedItem(Path:string;Text:string);stdcall;//Сохраняет в реестр, дааные о выборе
function LoadSelectedItems(APath:string):TSavedItems;stdcall;//Выбирает из реестра дааные о выбраных ранее пунктах
function DateToString(ADate:TDate):string;

function NormalFullFio(AText:string):string;//Переводит строку в формат: все слова пишутся с большой буквы, а остальные маленькие
function DateBegSemestrByDate(ADate:TDate):TDate;
function DateEndSemestrByDate(ADate:TDate):TDate;

implementation

function DateToString(ADate:TDate):string;
var pDay,pMonth,pYear:word;
begin
 DecodeDate(ADate,pYear,pMonth,pDay);
 Result:=IntToStr(pDay);
 case pMonth of
   1: Result:=Result+' січня '+IntToStr(pYear)+' р.';
   2: Result:=Result+' лютого '+IntToStr(pYear)+' р.';
   3: Result:=Result+' березня '+IntToStr(pYear)+' р.';
   4: Result:=Result+' квітня '+IntToStr(pYear)+' р.';
   5: Result:=Result+' травня '+IntToStr(pYear)+' р.';
   6: Result:=Result+' червня '+IntToStr(pYear)+' р.';
   7: Result:=Result+' липня '+IntToStr(pYear)+' р.';
   8: Result:=Result+' серпня '+IntToStr(pYear)+' р.';
   9: Result:=Result+' вересня '+IntToStr(pYear)+' р.';
  10: Result:=Result+' жовтня '+IntToStr(pYear)+' р.';
  11: Result:=Result+' листопада '+IntToStr(pYear)+' р.';
  12: Result:=Result+' грудня '+IntToStr(pYear)+' р.';
 end;
end;


function LoadSelectedItemsForSave(APath:string):TSavedItemsForSave;stdcall;
var Registry:TRegistry;
    Section,NameItem:string;
    ItemsText:string;
begin
 NameItem:=APath;
 Section:=copy(APath,1,pos('/',APath)-1);
 delete(NameItem,1,pos('/',NameItem));

 Result:=TSavedItemsForSave.Create;
 Registry:=TRegistry.Create;
 try
  Registry.RootKey:=HKEY_CURRENT_USER;
  Registry.OpenKey('\Software\Asup\'+Section,True);
  ItemsText:=Registry.ReadString(NameItem)+'@@@';
  if Trim(ItemsText)='@@@' then Exit;
  while ItemsText<>'' do
   begin
    Result.AddSavedItem(copy(ItemsText,1,pos('@@@',ItemsText)-1));
    delete(ItemsText,1,pos('@@@',ItemsText)+2);
   end;
 finally
  Registry.Free;
 end;
end;

function LoadSelectedItems(APath:string):TSavedItems;stdcall;
begin
 Result := LoadSelectedItemsForSave(APath);
end;

procedure SaveSelectedItem(Path:string;Text:string);stdcall;
var SavedItems:TSavedItemsForSave;
    Registry:TRegistry;
    Section,NameItem:string;
begin
 NameItem:=Path;
 Section:=copy(Path,1,pos('/',Path)-1);
 delete(NameItem,1,pos('/',NameItem));

 SavedItems := TSavedItemsForSave.Create;
 SavedItems := LoadSelectedItemsForSave(Path);
 SavedItems.AddSavedItem(Text);

 Registry:=TRegistry.Create;
 try
  Registry.RootKey:=HKEY_CURRENT_USER;
  Registry.OpenKey('\Software\Asup\'+Section,True);
  Registry.WriteString(NameItem,SavedItems.StringForSave);
 finally
  Registry.Free;
 end;
 SavedItems.Destroy;
end;

function DesignReport:boolean;
var Registry:TRegistry;
begin
 Result:=False;
 Registry:=TRegistry.Create;
 try
  Registry.RootKey:=HKEY_CURRENT_USER;
  Result:=Registry.OpenKey('\Software\Asup\DesignReport\',False);
 finally
  Registry.Free;
 end;
end;

function IfThen(AValue: Boolean; const ATrue: Variant; const AFalse: Variant): Variant; overload;
begin
 if AValue then
  IfThen:=ATrue
 else
  IfThen:=AFalse;
end;

function DepartmentByKod(Kod:string;DB_Handle:TISC_DB_HANDLE):variant;
var DM:TStProcDM;
    res:variant;
begin
 Res:=Null;
 DM := TStProcDM.Create(Application.MainForm);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'Z_DEPARTMENT_BY_KOD';
   Prepare;
   ParamByName('KOD').AsString := KOD;
   ExecProc;
   res:=VarArrayCreate([0,2],varVariant);
   Res[0] := ParamByName('ID_DEPARTMENT').AsVariant;
   Res[1] := ParamByName('KOD_DEPARTMENT').AsVariant;
   Res[2] := ParamByName('NAME_DEPARTMENT').AsVariant;
   Transaction.Commit;
  except
   on E:exception do
    begin
     AsupShowMessage(Error_Caption,e.Message,mtError,[mbOK]);
     Transaction.Rollback;
    end;
  end;
 Result:=res;
end;

function NormalFullFio(AText:string):string;
var TText:string;
    TWord:string;
begin
 TText:=Trim(AText)+' ';
 TWord:=copy(TText,1,pos(' ',TText)-1);
 delete(TText,1,pos(' ',TText));
 Result:=Trim(AnsiUpperCase(TWord));
 while TText<>'' do
  begin
   TWord:=copy(TText,1,pos(' ',TText)-1);
   delete(TText,1,pos(' ',TText));
   Result:=Result+' '+Trim(AnsiUpperCase(TWord[1])+AnsiLowerCase(copy(TWord,2,length(TWord))));
  end;
 Result:=Trim(Result); 
end;


function DateBegSemestrByDate(ADate:TDate):TDate;
var PYear,PMonth,PDay:Word;
begin
 DecodeDate(ADate,PYear,PMonth,PDay);
 case PMonth of
  9,10,11,12: Result:=EncodeDate(PYear,9,1);
  1: Result:=EncodeDate(PYear-1,9,1);
  else Result:=EncodeDate(PYear,2,1);
 end;
end;

function DateEndSemestrByDate(ADate:TDate):TDate;
var PYear,PMonth,PDay:Word;
begin
 DecodeDate(ADate,PYear,PMonth,PDay);
 case PMonth of
  9,10,11,12: Result:=EncodeDate(PYear+1,1,31);
  1: Result:=EncodeDate(PYear,1,1);
  else Result:=EncodeDate(PYear,30,6);
 end;
end;

end.
