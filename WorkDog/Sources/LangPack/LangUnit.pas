unit LangUnit;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, comctrls, grids,
  FIBDatabase, pFIBDatabase;

type
  TLanguage = class(TComponent)
  private
    LangFile   : TStringList;
    LangHeader : array [32..255] of integer;
    function GetNewString(oldStr : string): string;
    function FindOffset(const symbol : Char) : Integer;
    procedure ParseComponent(Component: TPersistent); virtual;
    procedure ApplyLanguage(Component: TComponent);
  public
    constructor Create(AOwner : TComponent);override;
    destructor Destroy;override;
    procedure LoadLangFile(const FileName : string);
  end;

procedure LangPackApply(Component: TComponent);

var
 LANG_FILE_NAME : string;


implementation
uses TypInfo, designintf, IniFiles, Math;

type
 TLoadResStrFunction = function (ResStringRec: PResStringRec): string;

var
 LangObject : TLanguage;
 ini        : TMemIniFile;
 
procedure ChangeProc(OldProcedure, NewProcedure: pointer);
var
  x: pchar;
  y: integer;
  ov2, ov: cardinal;
begin
  x := PChar(OldProcedure);
  if not VirtualProtect(Pointer(x), 5, PAGE_EXECUTE_READWRITE, @ov) then
    RaiseLastOSError;

  x[0] := char($E9); 
  y := integer(NewProcedure) - integer(OldProcedure) - 5; 
  x[1] := char(y and 255); 
  x[2] := char((y shr 8) and 255); 
  x[3] := char((y shr 16) and 255);
  x[4] := char((y shr 24) and 255);

  if not VirtualProtect(Pointer(x), 5, ov, @ov2) then
    RaiseLastOSError;
end;

procedure LangPackApply(Component: TComponent);
begin
  LangObject.ApplyLanguage(Component);
end;

{ TLanguage }

procedure TLanguage.ApplyLanguage(Component : TComponent);
  procedure ParseComponents(Component : TComponent);
  var i : integer;
  begin
    ParseComponent(Component);
    for i := 0 to Component.ComponentCount-1 do ParseComponents(Component.Components[i]);
  end;
begin
  ParseComponents(Component);
end;

procedure TLanguage.ParseComponent(Component : TPersistent);
var
  AName, PropName, StringPropValue: string;
  TypeInf, PropTypeInf : PTypeInfo;
  PropInfo   : PPropInfo;
  TypeData   : PTypeData;
  i, j       : integer;
  PropList   : PPropList;
  NumProps   : word;
  PropObject : TObject;
begin
  if Component is TpFIBDatabase then exit;
  if Component is TpFIBTransaction then exit;
  TypeInf := Component.ClassInfo;
  AName := TypeInf^.Name;
  TypeData := GetTypeData(TypeInf);
  NumProps := TypeData^.PropCount;

  GetMem(PropList, NumProps*sizeof(pointer));

  try
    GetPropInfos(TypeInf, PropList);

    for i := 0 to NumProps-1 do begin
      PropName := PropList^[i]^.Name;
      PropTypeInf := PropList^[i]^.PropType^;
      PropInfo := PropList^[i];

      case PropTypeInf^.Kind of
        tkString, tkLString:
        if PropName <> 'Name' then begin
          StringPropValue := GetStrProp( Component, PropInfo );
          SetStrProp( Component, PropInfo, GetNewString(StringPropValue));
        end;
        tkClass:begin
          PropObject := GetObjectProp(Component, PropInfo{, TPersistent});

          if Assigned(PropObject)then begin
            if (PropObject is TPersistent) then ParseComponent(PropObject as TPersistent);

            if (PropObject is TStrings) then begin
              for j := 0 to (PropObject as TStrings).Count-1 do TStrings(PropObject)[j] := GetNewString(TStrings(PropObject)[j]);
            end;
            if (PropObject is TTreeNodes) then begin
              for j := 0 to (PropObject as TTreeNodes).Count-1 do TTreeNodes(PropObject).Item[j].Text := GetNewString(TTreeNodes(PropObject).Item[j].Text);
            end;
            if (PropObject is TListItems) then begin
              for j := 0 to (PropObject as TListItems).Count-1 do TListItems(PropObject).Item[j].Caption := GetNewString(TListItems(PropObject).Item[j].Caption);
            end;
          end;
        end;
      end;
    end;
  finally
    FreeMem(PropList, NumProps*sizeof(pointer));
  end;
end;

function TLanguage.GetNewString(oldStr : string): string;
var
 idx : Integer;
 ch  : char;
 i   : Integer;
 s   : string;
 srcStr : string;
begin
 Result := oldStr;
 if (LangFile.Count = 0) or (oldStr = '') then Exit;
 idx := FindOffset(oldStr[1]);
 if idx < 0 then Exit;
 ch := AnsiUpperCase(LangFile.Strings[idx])[1];
 while AnsiUpperCase(LangFile.Strings[idx])[1] = ch do begin
   srcStr := LangFile.Strings[idx];
   i := Pos('=', srcStr);
   if i <> 0 then begin
    s := Copy(srcStr, 1, i-1);
    if s = oldStr then begin
     Result := Copy(srcStr, i + 1, Length(srcStr) - i);
     Exit;
    end; 
   end;
   Inc(idx);
   if idx = LangFile.Count then break;
 end;
end;

function LoadReoldStrNew(ReoldStrRec: PResStringRec): string;
var
  Buffer: array [0..1024] of char;
begin
  if ReoldStrRec = nil then Exit;
  if ReoldStrRec.Identifier < 64*1024 then
    SetString(Result, Buffer,
      LoadString(FindResourceHInstance(ReoldStrRec.Module^),
        ReoldStrRec.Identifier, Buffer, SizeOf(Buffer)))
  else
    Result := PChar(ReoldStrRec.Identifier);

  Result := langobject.GetNewString(Result);
end;

constructor TLanguage.Create(AOwner: TComponent);
begin
 inherited;
 LangFile := TStringList.Create;
end;

destructor TLanguage.Destroy;
begin
  LangFile.Free;
  inherited;
end;

var
 i : Integer;

function TLanguage.FindOffset(const symbol: Char): Integer;
begin
 Result := LangHeader[Ord(AnsiUpperCase(symbol+'')[1])] - 223;
end;

procedure TLanguage.LoadLangFile(const FileName: string);
var
 i : Integer;
begin
 if not FileExists(FileName) then Exit;
 LangFile.LoadFromFile(FileName);
 for i := 32 to 255 do begin
  LangHeader[i] := StrToInt(LangFile.Strings[0]);
  LangFile.Delete(0);
 end; 
end;

initialization
begin
 LangObject := TLanguage.Create(Nil);
 ChangeProc(@loadResString, @LoadReoldStrNew);

 ini := TMemIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
 LANG_FILE_NAME := ExtractFilePath(Application.ExeName) + 'Lang\' + ini.ReadString('Lang', 'File', '');
 ini.Free;

 i := 1;
 while i < ParamCount do begin
   if UpperCase(ParamStr(i)) = '-LANG' then if i + 1 <= ParamCount then LANG_FILE_NAME := ExtractFilePath(Application.ExeName) + 'Lang\' + ParamStr(i + 1);
   Inc(i);
 end;

 LangObject.LoadLangFile(LANG_FILE_NAME);
end;

Finalization
begin
 LangObject.Free;
end;

end.
