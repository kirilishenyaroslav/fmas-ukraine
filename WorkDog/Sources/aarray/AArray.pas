unit AArray;

interface
uses Windows, Classes, Variants, DB, Forms;

const
 AARRAY_NULL_STRING = 'null';
type
 TAArray = class;
 TAArray = class
 private
   fValue  : Variant;
   fObject : TObject;
   fNames  : array of Variant;
   fArrays : array of TAArray;
   function GetValue(Index : Variant) : TAArray;
   function GetCount: Integer;
   function GetAsString: string;
   procedure SetAsString(const Value: string);
   function GetAsInt64: Int64;
   function GetASInteger: Integer;
   procedure SetAsInt64(const Value: Int64);
   procedure SetAsInteger(const Value: Integer);
   function GetName(Index: Integer): Variant;
   procedure ExportArray(sl : TStringList; aName : Variant; a : TAArray;  iter : Integer; const space_count : Integer = 4);
   function ExportArray2(sl : TStringList; const aName : Variant; const a : TAArray; s : string) : string;
   function ObjectAsString : string;
   function GetAsCurrency: Currency;
   procedure SetAsCurrency(const Value: Currency);
 public
   constructor Create;
   destructor Destroy; override;
   procedure SaveToFile(const FileName : string; const space_count : Integer = 4);
   procedure SaveToFile2(const FileName : string);
   procedure LoadFromFile(const FileName, Section : string);
   procedure View(Owner : TForm);
   procedure CopyTo(var a : TAArray);
   property Values[Index : Variant] : TAArray read GetValue; default;
   property AsVariant : Variant read fValue write fValue;
   property AsString : string read GetAsString write SetAsString;
   property AsInteger : Integer read GetASInteger write SetAsInteger;
   property AsInt64 : Int64 read GetAsInt64 write SetAsInt64;
   property AsCurrency : Currency read GetAsCurrency write SetAsCurrency;
   property AsObject : TObject read fObject write fObject;
   property Names[Index : Integer] : Variant read GetName;
   property Count : Integer read GetCount;
 end;

 procedure FillArrayFromDataSet(a : TAArray; ds : TDataSet);
 procedure ViewArray(Owner : TForm; a : TAArray);

implementation
uses SysUtils, frmArrayUnit, inifiles;

procedure ViewArray(Owner : TForm; a : TAArray);
var
 frm : TfrmArray;
begin
 frm := TfrmArray.Create(Owner);
 frm.BuildTree(a);
 frm.ShowModal;
 frm.Free;
end;

procedure FillArrayFromDataSet(a : TAArray; ds : TDataSet);
var
  i : Integer;
begin
  if not ds.Active then Exit;
  for i := 0 to ds.FieldCount - 1 do
  begin
    a[ds.Fields[i].FullName].AsVariant := ds.FieldByName(ds.Fields[i].FullName).Value;
  end;
end;

{ TAArray }
procedure TAArray.CopyTo(var a: TAArray);
var
  i : integer;
begin
 for i := 0 to GetCount - 1 do
 begin
   a[fNames[i]].AsVariant := Values[fNames[i]].AsVariant;
   a[fNames[i]].AsObject := Values[fNames[i]].AsObject;
 end;
end;

constructor TAArray.Create;
begin
  inherited;
  fValue := null;
  fObject := nil;
end;

destructor TAArray.Destroy;
var
  i : Integer;
begin
  for i := 0 to Count - 1 do
  begin
    fArrays[i].Destroy;
    fArrays[i] := nil;
  end;
  fArrays := nil;
  fNames := nil;
  inherited;
end;

procedure TAArray.ExportArray(sl: TStringList; aName : Variant; a: TAArray; iter: Integer;
  const space_count: Integer);
var
 s : string;
 i : Integer;
begin
 s := '';
 for i := 0 to iter do s := s + ' ';
 s := s + VarToStr(aName);
 if VarType(a.AsVariant) = varString then s := s + ' = ''' + a.AsString + '''' else s := s + ' = ' + a.AsString;
 sl.Add(s);
 for i := 0 to a.Count - 1 do ExportArray(sl, a.Names[i], a[a.Names[i]], iter + space_count);
end;

function TAArray.ExportArray2(sl : TStringList; const aName: Variant; const a: TAArray;
  s: string) : string;
var
 sName  : string;
 sValue : string;
 i      : integer;
begin
  if VarIsNull(aName) then sName := 'null' else if VarType(aName) = varString then sName := '''' + aName + '''' else sName := aName;
  if VarType(a.AsVariant) = varString then sValue := '''' + a.AsVariant + '''' else sValue := a.AsString;
  Result := s + '[' + sName + ']';
  if not VarIsNull(a.AsVariant) then sl.Add(Result + '.AsVariant := ' + sValue + ';')
   else
   begin
     if a.fObject <> nil then sl.Add(Result + ' := ' + a.ObjectAsString + ';');
   end;
  for i := 0 to a.Count - 1 do
  begin
    ExportArray2(sl, a.fNames[i], a[a.fNames[i]], Result);
  end;
end;

function TAArray.GetAsCurrency: Currency;
begin
 Result := fValue;
end;

function TAArray.GetAsInt64: Int64;
begin
 if not VarIsNull(fValue) then Result := fValue else Result := -1;
end;

function TAArray.GetASInteger: Integer;
begin
 if not VarIsNull(fValue) then Result := fValue else Result := -1;
end;

function TAArray.GetAsString: string;
begin
  if VarIsNull(fValue) then
  begin
    if fObject = nil then Result := AARRAY_NULL_STRING else Result := ObjectAsString;
  end else Result := fValue;
end;

function TAArray.GetCount: Integer;
begin
 Result := Length(fArrays);
end;

function TAArray.GetName(Index: Integer): Variant;
begin
 Result := fNames[Index];
end;

function TAArray.GetValue(Index: Variant): TAArray;
var
  i : Integer;
begin
  Result := nil;
  if fNames <> nil then
  begin
    for i := 0 to Length(fNames) - 1 do
    begin
      // check if string
      if VarIsStr(Index) then
      begin
        if VarIsStr(fNames[i]) then
        begin
          if AnsiUpperCase(VarToStr(Index)) = AnsiUpperCase(VarToStr(fNames[i])) then
          begin
            Result := fArrays[i];
            break;
          end;
        end;
      end
      else//else check equal
      begin
        if VarType(Index) = VarType(fNames[i]) then begin
          if VarCompareValue(Index, fNames[i]) = vrEqual then
          begin
            Result := fArrays[i];
            break;
          end;
        end;
      end;
    end;
  end;
  if Result = nil then
  begin
    SetLength(fArrays, Count + 1);
    SetLength(fNames, Count);
    fNames[Count - 1] := Index;
    fArrays[Count - 1] := TAArray.Create;
    Result := fArrays[Count - 1];
  end;
end;

procedure TAArray.LoadFromFile(const FileName, Section: string);
var
  f : TMemIniFile;
  s : TStringList;
  i : integer;
begin
  f := TMemIniFile.Create(FileName);
  s := TStringList.Create;
  f.ReadSection(Section, s);
  for i := 0 to s.Count - 1 do Values[s.Strings[i]].AsString := f.ReadString(Section, s.Strings[i], '');
  s.Free;
  f.Free;
end;

function TAArray.ObjectAsString: string;
begin
 if fObject = nil then Result := AARRAY_NULL_STRING else Result := fObject.ClassType.ClassName + '($' + IntToHex(Integer(Addr(fObject)), 2) + ')'
end;

procedure TAArray.SaveToFile(const FileName: string;
  const space_count: Integer);
var
 sl : TStringList;
 i : Integer;
 ch : Char;
begin
 ch := DecimalSeparator;
 DecimalSeparator := '.';
 sl := TStringList.Create;
 for i := 0 to Count - 1 do ExportArray(sl, Names[i], fArrays[i], 0, space_count);
 sl.SaveToFile(FileName);
 sl.Free;
 DecimalSeparator := ch;
end;

procedure TAArray.SaveToFile2(const FileName: string);
var
  sl : TStringList;
  s  : string;
  i  : Integer;
  ch : char;
begin
  ch := DecimalSeparator;
  DecimalSeparator := '.';
  sl := TStringList.Create;
  for i := 0 to Count - 1 do
  begin
    s := '';
    ExportArray2(sl, fNames[i], fArrays[i], s);
  end;
  sl.SaveToFile(FileName);
  sl.Free;
  DecimalSeparator := ch;
end;

procedure TAArray.SetAsCurrency(const Value: Currency);
begin
 fValue := Value; 
end;

procedure TAArray.SetAsInt64(const Value: Int64);
begin
 fValue := Value;
end;

procedure TAArray.SetAsInteger(const Value: Integer);
begin
 fValue := Value;
end;

procedure TAArray.SetAsString(const Value: string);
begin
 fValue := Value;
end;

procedure TAArray.View(Owner: TForm);
begin
  ViewArray(Owner, Self);
end;

end.
