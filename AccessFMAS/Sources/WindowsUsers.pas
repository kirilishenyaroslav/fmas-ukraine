unit WindowsUsers;

interface
uses classes;

const
NERR_Success  = 0; 
NERR_BASE   = 2100;
NERR_DCNotFound = NERR_BASE + 353; 
ERROR_INVALID_NAME = 123; 
ERROR_MORE_DATA = 234;   
ERROR_ACCESS_DENIED = 5; 

type
{$EXTERNALSYM DWORD}
DWORD = LongWord;
LPDWORD = ^LongWord;
{$EXTERNALSYM NET_API_STATUS}
NET_API_STATUS = LongWord;
{$EXTERNALSYM LPBYTE}
LPBYTE = ^Byte;
PLPBYTE = ^LPBYTE;
{$EXTERNALSYM LPWSTR}
LPWSTR = PWideChar;

{$EXTERNALSYM _NET_DISPLAY_USER}
_NET_DISPLAY_USER = record
  usri1_name : LPWSTR;
  usri1_comment : LPWSTR;
  usri1_flags : DWORD;
  usri1_full_name : LPWSTR;
  usri1_user_id : DWORD;
  usri1_next_index : DWORD;
end;

TNetDisplayUser = _NET_DISPLAY_USER;
PNetDisplayUser =^TNetDisplayUser;

{$EXTERNALSYM NetGetDCName}
function NetGetDCName(
servername : LPWSTR;
domainname : LPWSTR;
bufptr : PLPBYTE) : NET_API_STATUS ;stdcall;
{$EXTERNALSYM NetGetAnyDCName}
function NetGetAnyDCName(servername : LPWSTR; domainname : LPWSTR; bufptr : PLPBYTE) : NET_API_STATUS;stdcall;
{$EXTERNALSYM NetQueryDisplayInformation}
function NetQueryDisplayInformation(
ServerName : LPWSTR;         
Level : DWORD;             
Index : DWORD;             
EntriesRequested : DWORD;       
PreferredMaximumLength : DWORD;    
ReturnedEntryCount : LPDWORD;     
SortedBuffer : Pointer) : NET_API_STATUS;stdcall;
{$EXTERNALSYM NetApiBufferFree}
procedure NetApiBufferFree(Buffer : Pointer);stdcall;

function Get_domain_users_names : TList;

const
netapi32 = 'netapi32.dll';

implementation
uses windows;

{ Externals from netapi32.dll }
{$EXTERNALSYM NetGetDCName}
function NetGetDCName; external netapi32 name 'NetGetDCName';
{$EXTERNALSYM NetGetAnyDCName}
function NetGetAnyDCName; external netapi32 name 'NetGetAnyDCName';
{$EXTERNALSYM NetQueryDisplayInformation}
function NetQueryDisplayInformation; external netapi32 name 'NetQueryDisplayInformation';
{$EXTERNALSYM NetApiBufferFree}
procedure NetApiBufferFree; external netapi32 name 'NetApiBufferFree';

function Get_domain_users_names : TList;
var
Error : NET_API_STATUS;
DC : LPBYTE;
i : integer;
next, entries : DWORD;
pBuff, pInfo : ^TNetDisplayUser;
pTemp : ^TNetDisplayUser;
begin
Result := TList.Create;
DC := nil;
next := 0;
Error := NetGetDCName(nil, nil, @DC);
if (Error <> NERR_Success) then
  Error := NetGetAnyDCName(nil, nil, @DC);
if (Error <> NERR_Success) then Exit;
repeat
begin
  Error := NetQueryDisplayInformation(LPWSTR(DC), 1, next, $FFFF, $FFFF, @entries, Addr(pBuff));
  if(Error = ERROR_ACCESS_DENIED) then Exit;
  for i := 0 to entries-1 do
  begin
   New(pInfo);
   pTemp := Ptr(integer(Addr(pBuff^)) + i*SizeOf(TNetDisplayUser));
   CopyMemory(pInfo,pTemp,SizeOf(TNetDisplayUser));
   next := pInfo^.usri1_next_index;
   Result.Add(pInfo);
  end;
end;
until (Error <> ERROR_MORE_DATA);
NetApiBufferFree(DC);
// NetApiBufferFree(pBuff);
end;


end.
