{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clCookies;

interface

{$I clVer.inc}

uses
  Classes;

type
  TclCookieItem = class(TCollectionItem)
  private
    FSecure: Boolean;
    FValue: string;
    FExpires: string;
    FName: string;
    FDomain: string;
    FPath: string;
    FCookieData: string;
  public
    procedure Assign(Source: TPersistent); override;
  published
    property Name: string read FName write FName;
    property Value: string read FValue write FValue;
    property Expires: string read FExpires write FExpires;
    property Domain: string read FDomain write FDomain;
    property Path: string read FPath write FPath;
    property Secure: Boolean read FSecure write FSecure;
    property CookieData: string read FCookieData write FCookieData;
  end;

  TclCookieList = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TclCookieItem;
    procedure SetItem(Index: Integer; const Value: TclCookieItem);
    procedure RemoveCookies(ARequestHeader: TStrings);
  protected
    function BuildRequestCookie(ACookieItem: TclCookieItem): string; virtual;
    procedure ParseResponseCookie(const ACookieData: string); virtual;
  public
    procedure SetRequestCookies(ARequestHeader: TStrings); virtual;
    procedure GetResponseCookies(AResponseHeader: TStrings); virtual;
    function Add: TclCookieItem;
    function AddCookie(const AName, AValue: string): TclCookieItem;
    function CookieByName(const AName: string): TclCookieItem;
    property Items[Index: Integer]: TclCookieItem read GetItem write SetItem; default;
  end;

implementation

uses
  SysUtils, clUtils;

{ TclCookieList }

function TclCookieList.Add: TclCookieItem;
begin
  Result := TclCookieItem(inherited Add());
end;

function TclCookieList.AddCookie(const AName, AValue: string): TclCookieItem;
begin
  Result := Add();
  Result.Name := AName;
  Result.Value := AValue;
end;

function TclCookieList.CookieByName(const AName: string): TclCookieItem;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    Result := Items[i];
    if SameText(Result.Name, AName) then Exit;
  end;
  Result := nil;
end;

function TclCookieList.GetItem(Index: Integer): TclCookieItem;
begin
  Result := TclCookieItem(inherited GetItem(Index));
end;

procedure TclCookieList.GetResponseCookies(AResponseHeader: TStrings);
  procedure ProcessCookies(AResponseHeader, AFieldList: TStrings; const AFieldName: string);
  var
    i: Integer;
  begin
    for i := 0 to AFieldList.Count - 1 do
    begin
      if SameText(AFieldName, AFieldList[i]) then
      begin
        ParseResponseCookie(GetHeaderFieldValue(AResponseHeader, AFieldList, i));
      end;
    end;
  end;

var
  fieldList: TStrings;
begin
  Clear();

  fieldList := TStringList.Create();
  try
    GetHeaderFieldList(0, AResponseHeader, fieldList);
    if GetHeaderFieldValue(AResponseHeader, fieldList, 'set-cookie2') <> '' then
    begin
      ProcessCookies(AResponseHeader, fieldList, 'set-cookie2');
    end else
    begin
      ProcessCookies(AResponseHeader, fieldList, 'set-cookie');
    end;
  finally
    fieldList.Free();
  end;
end;

procedure TclCookieList.SetItem(Index: Integer; const Value: TclCookieItem);
begin
  inherited SetItem(Index, Value);
end;

procedure TclCookieList.RemoveCookies(ARequestHeader: TStrings);
var
  i: Integer;
  fieldList: TStrings;
begin
  fieldList := TStringList.Create();
  try
    GetHeaderFieldList(0, ARequestHeader, fieldList);
    for i := fieldList.Count - 1 downto 0 do
    begin
      if SameText('cookie', fieldList[i]) then
      begin
        RemoveHeaderField(ARequestHeader, fieldList, i);
      end;
    end;
  finally
    fieldList.Free();
  end;
end;

procedure TclCookieList.SetRequestCookies(ARequestHeader: TStrings);
const
  cookieDelimiter = '; ';
var
  i: Integer;
  s: string;
begin
  RemoveCookies(ARequestHeader);
  //check URL path

  s := '';
  for i := 0 to Count - 1 do
  begin
    s := s + BuildRequestCookie(Items[i]) + cookieDelimiter;
  end;
  if (s <> '') then
  begin
    SetLength(s, Length(s) - Length(cookieDelimiter));
  end;
  AddHeaderField(ARequestHeader, 'Cookie', s);
end;

function TclCookieList.BuildRequestCookie(ACookieItem: TclCookieItem): string;
begin
  Result := ACookieItem.Name + '=' + ACookieItem.Value;
end;

procedure TclCookieList.ParseResponseCookie(const ACookieData: string);
  function GetExpires(const ACookieData: string): string;
  const
    lexem = 'expires=';
  var
    ind: Integer;
  begin
    ind := system.Pos(lexem, LowerCase(ACookieData));
    if (ind > 0) then
    begin
      Result := system.Copy(ACookieData, ind + Length(lexem), Length(ACookieData));
      Result := StringReplace(Result, ',', '==', [rfReplaceAll]);
      Result := GetHeaderFieldValueItem(Result, '');
      Result := StringReplace(Result, '==', ',', [rfReplaceAll]);
    end else
    begin
      Result := '';
    end;
  end;
  
var
  ind: Integer;
  item: TclCookieItem;
  name, value: string;
begin
  if (ACookieData = '') then Exit;
  
  ind := system.Pos('=', ACookieData);
  if (ind > 0) then
  begin
    name := system.Copy(ACookieData, 1, ind - 1);
    value := GetHeaderFieldValueItem(ACookieData, LowerCase(name) + '=');
  end else
  begin
    name := ACookieData;
    value := '';
  end;

  if (CookieByName(name) = nil) then
  begin
    item := Add();
    item.Name := name;
    item.Value := value;
    item.Expires := GetExpires(ACookieData);
    item.Domain := GetHeaderFieldValueItem(ACookieData, 'domain=');
    item.Path := GetHeaderFieldValueItem(ACookieData, 'path=');
    item.Secure := (system.Pos('secure', LowerCase(ACookieData)) > 0);
    item.CookieData := ACookieData;
  end;
end;

{ TclCookieItem }

procedure TclCookieItem.Assign(Source: TPersistent);
var
  item: TclCookieItem;
begin
  if (Source is TclCookieItem) then
  begin
    item := (Source as TclCookieItem);
    Name := item.Name;
    Value := item.Value;
    Expires := item.Expires;
    Domain := item.Domain;
    Path := item.Path;
    Secure := item.Secure;
    CookieData := item.CookieData;
  end else
  begin
    inherited Assign(Source);
  end;
end;

end.
