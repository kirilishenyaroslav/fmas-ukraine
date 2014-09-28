unit gar_GarageProc;

interface
uses IBase, pFIBStoredProc, pFIBDatabase, Windows, Messages, SysUtils, Variants,
      Classes, Graphics, Controls, Forms,  Dialogs, gr_uMessage, gr_uCommonConsts,
      Registry, StdCtrls, gar_Consts;

function Gar_Avto_By_NOM_GOS(Shifr:String;DB_Handle:TISC_DB_HANDLE):variant;
function Global_Kod_Setup(DB_Handle:TISC_DB_HANDLE):variant;
function Period_By_Kod_Setop(DB_Handle:TISC_DB_HANDLE;KOD_SETUP:integer):variant;
function LanguageIndex:byte;
function Gar_ManByTn(Shifr:integer;DB_Handle:TISC_DB_HANDLE):variant;
function garDesignReport:boolean;
function garShowMessage(Title:String;Msg:String;DlgType:TMsgDlgType;Buttons:TMsgDlgButtons):Integer;
function IndexLanguage:byte;
implementation

function IndexLanguage:byte;
begin
 Result:=1;
end;

function garShowMessage(Title:String;Msg:String;DlgType:TMsgDlgType;Buttons:TMsgDlgButtons):Integer;
var ViewMessageForm:TForm;
    i:integer;
    CurrentIndexLanguage:Byte;
begin
Result:=mrNone;
CurrentIndexLanguage := IndexLanguage;
if Pos(#13,Msg)=0 then Msg:=#13+Msg;
ViewMessageForm:=CreateMessageDialog(Msg,DlgType,Buttons);
with ViewMessageForm do
 begin
 for i:=0 to ComponentCount-1 do
  if (Components[i].ClassType=TButton) then
   begin
    if UpperCase((Components[i] as TButton).Caption)='OK' then
       (Components[i] as TButton).Caption := OkBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption)='CANCEL' then
       (Components[i] as TButton).Caption := CancelBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption)='&YES' then
       (Components[i] as TButton).Caption := YesBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption)='&NO' then
       (Components[i] as TButton).Caption := NoBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption)='&ABORT' then
       (Components[i] as TButton).Caption := AbortBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption)='&RETRY' then
       (Components[i] as TButton).Caption := RetryBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption)='&IGNORE' then
       (Components[i] as TButton).Caption := IgnoreBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption) = '&ALL' then
       (Components[i] as TButton).Caption := AllBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption) = '&HELP' then
       (Components[i] as TButton).Caption := HelpBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption) = 'N&O TO ALL' then
       (Components[i] as TButton).Caption := NoToAllBtnCaption[CurrentIndexLanguage];
    if UpperCase((Components[i] as TButton).Caption) = 'YES TO &ALL' then
       (Components[i] as TButton).Caption := YesToAllBtnCaption[CurrentIndexLanguage];
   end;
 Caption:=Title;
 Result:=ShowModal;
 Free;
end;
end;

function garDesignReport:boolean;
var Registry:TRegistry;
begin
 Result:=False;
 Registry:=TRegistry.Create;
 try
  Registry.RootKey:=HKEY_CURRENT_USER;
  Result:=Registry.OpenKey('\Software\Garage\DesignReport\',False);
 finally
  Registry.Free;
 end;
end;

function Gar_Avto_By_NOM_GOS(Shifr:String;DB_Handle:TISC_DB_HANDLE):variant;
var pStProc:TpFIBStoredProc;
    pTransaction:TpFIBTransaction;
    pDataBase:TpFIBDatabase;
    res:variant;
begin
 Res:=Null;
 pDataBase := TpFIBDatabase.Create(Application.MainForm);
 pTransaction := TpFIBTransaction.Create(Application.MainForm);
 pStProc := TpFIBStoredProc.Create(Application.MainForm);

 try
  try
   pDataBase.SQLDialect := 3;
   pDataBase.DefaultTransaction := pTransaction;
   pTransaction.DefaultDatabase := pDataBase;
   pStProc.Database := pDataBase;
   pStProc.Transaction := pTransaction;

   pDataBase.Handle := DB_Handle;
   pStProc.Transaction.StartTransaction;
   pStProc.StoredProcName := 'GAR_AVTO_BY_GOSNOMER';
   pStProc.ParamByName('NOM_GOS').AsString:=Shifr;
   pStProc.ExecProc;
   res:=VarArrayCreate([0,2],varVariant);
   Res[0] := pStProc.ParamByName('ID_AVTO').AsVariant;
   Res[1] := pStProc.ParamByName('NOM_GOS_OUT').AsVariant;
   Res[2] := pStProc.ParamByName('NAME').AsVariant;
   pStProc.Transaction.Commit;
  except
   on e:exception do
   begin
    pStProc.Transaction.Rollback;
    grShowMessage(ECaption[LanguageIndex],e.Message,mtError,[mbOK]);
    Result := 0;
   end;
  end;
 finally
  pStProc.Destroy;

  pTransaction.Destroy;
  pDataBase.Destroy;
 end;

 Result:=res;
end;


function LanguageIndex:byte;
begin
 Result:=1;
end;

function Period_By_Kod_Setop(DB_Handle:TISC_DB_HANDLE;KOD_SETUP:integer):variant;
begin
//
end;


function Global_Kod_Setup(DB_Handle:TISC_DB_HANDLE):variant;
var pStProc:TpFIBStoredProc;
    pTransaction:TpFIBTransaction;
    pDataBase:TpFIBDatabase;
    res:variant;
begin
Res:=Null;
pDataBase := TpFIBDatabase.Create(Application.Owner);
pTransaction := TpFIBTransaction.Create(Application.Owner);
pStProc := TpFIBStoredProc.Create(Application.Owner);
try
  try
   pDataBase.SQLDialect := 3;
   pDataBase.DefaultTransaction := pTransaction;
   pTransaction.DefaultDatabase := pDataBase;
   pStProc.Database := pDataBase;
   pStProc.Transaction := pTransaction;

   pDataBase.Handle := DB_Handle;
   pStProc.Transaction.StartTransaction;
   pStProc.StoredProcName := 'GAR_RETURN_GLOBAL_KOD_SETUP';
   pStProc.ExecProc;
   Global_Kod_Setup := pStProc.ParamByName('KOD_SETUP').AsVariant;
   pStProc.Transaction.Commit;
  except
   on e:exception do
   begin
    pStProc.Transaction.Rollback;
    grShowMessage(ECaption[LanguageIndex],e.Message,mtError,[mbOK]);
    Result := 0;
   end;
  end;
finally
  pStProc.Destroy;
  pTransaction.Destroy;
  pDataBase.Destroy;
end;
end;

function Gar_ManByTn(Shifr:integer;DB_Handle:TISC_DB_HANDLE):variant;
var pStProc:TpFIBStoredProc;
    pTransaction:TpFIBTransaction;
    pDataBase:TpFIBDatabase;
    res:variant;
begin
 Res:=Null;
 pDataBase := TpFIBDatabase.Create(Application.MainForm);
 pTransaction := TpFIBTransaction.Create(Application.MainForm);
 pStProc := TpFIBStoredProc.Create(Application.MainForm);

 try
  try
   pDataBase.SQLDialect := 3;
   pDataBase.DefaultTransaction := pTransaction;
   pTransaction.DefaultDatabase := pDataBase;
   pStProc.Database := pDataBase;
   pStProc.Transaction := pTransaction;

   pDataBase.Handle := DB_Handle;
   pStProc.Transaction.StartTransaction;
   pStProc.StoredProcName := 'GAR_MAN_BY_SHIFR';
   pStProc.ParamByName('KOD').AsInteger:=Shifr;
   pStProc.ExecProc;
   res:=VarArrayCreate([0,2],varVariant);
   Res[0] := pStProc.ParamByName('ID_MAN').AsVariant;
   Res[1] := pStProc.ParamByName('TN').AsVariant;
   Res[2] := pStProc.ParamByName('FIO').AsVariant;
   pStProc.Transaction.Commit;
  except
   on e:exception do
   begin
    pStProc.Transaction.Rollback;
    grShowMessage(ECaption[LanguageIndex],e.Message,mtError,[mbOK]);
    Result := 0;
   end;
  end;
 finally
  pStProc.Destroy;
  pTransaction.Destroy;
  pDataBase.Destroy;
 end;

 Result:=res;
end;


end.
