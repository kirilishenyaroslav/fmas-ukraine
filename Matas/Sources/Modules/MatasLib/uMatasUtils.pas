{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMatasUtils;

interface

uses
  Windows, Messages, SysUtils, Variants, Dialogs, Controls,
  DateUtils, Forms, StdCtrls, AccMGMT, uResources, Classes, uWaitWindow,
  uMatasVars, cxDropDownEdit, uZProc, FIBDatabase, ibase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, Registry, uMatasExport;

type
  TFMode = (DocMode, OstMode);

  TPosMode = (PosMode, ProvMode, PPMode);

var
  Layout: array[0.. KL_NAMELENGTH] of char;

procedure InitCommonVars;
function GetMonthName(const nm: integer) : string;
function GetVersionStrInfo:string;

function agMessageDlg(const Caption : string; const Msg : string; const DlgType: TMsgDlgType; const Buttons: TMsgDlgButtons) : word;
function MessageDlgU(const Caption : string; const Msg : string; const DlgType: TMsgDlgType; const Buttons: TMsgDlgButtons) : word;
procedure ShowMessage(const Msg : string);
function MatasCheckAccess(Path:string;Action:String;DisplayMessage:Boolean=False):Integer;

function GetSumma(aOwner:TComponent; summa: Extended; var is_cancel: boolean): Extended;
function GetDateDoc:TDateTime;

function IntToBool(v: integer): boolean;
function BoolToInt(v: boolean): integer;

function ShowWaitWindow(aOwner:TComponent):TForm;
procedure CloseWaitWindow(w: TForm);

procedure LoadMonthTocxComboBox(cb: TcxComboBox);

procedure LoadReportsTocxComboBox(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aOBJECT: string; aComboBox: TcxComboBox; var aReports: Variant);

function SummaToString(ASumma:extended):string;
function KolMatToString(AKol:extended):string;

procedure RefreshDataSet(DataSet : TFIBDataSet; ID_Field : String);
function  AskForDelete : Boolean;

procedure WriteRegistryValue(aKeyName: string; aValueName: string; aValue: string);
function ReadRegistryValue(aKeyName: string; aValueName: string):string;

procedure ShowDataSetFields(aOwner:TComponent; aDataSet: TpFIBDataSet);
procedure ExportDataSet(aOwner:TComponent; aDataSet: TpFIBDataSet);

function ShowFilterParam(aOwner:TComponent; aDBHANDLE:TISC_DB_HANDLE; aID_SESSION:Integer; aID_OBJECT:Integer; aDATE_SESSION:TDateTime; aNameForm:string):string;

implementation

uses uMatasGetSumma, uShowFields, uMatasFilterParam, uMatasFilterGroupNomn;

function SummaToString(ASumma:extended):string;
begin
 Result:=SumToString(ASumma, 1);
end;

function KolMatToString(AKol:extended):string;
begin
 Result:=SumToString(AKol, 3);
end;

procedure LoadMonthTocxComboBox(cb: TcxComboBox);
begin
 with cb.Properties.Items do
 begin
  Clear;
  Add(MAT_STR_MONTH01);
  Add(MAT_STR_MONTH02);
  Add(MAT_STR_MONTH03);
  Add(MAT_STR_MONTH04);
  Add(MAT_STR_MONTH05);
  Add(MAT_STR_MONTH06);
  Add(MAT_STR_MONTH07);
  Add(MAT_STR_MONTH08);
  Add(MAT_STR_MONTH09);
  Add(MAT_STR_MONTH10);
  Add(MAT_STR_MONTH11);
  Add(MAT_STR_MONTH12);
 end;
end;

function GetDateDoc:TDateTime;
var
 dd, dm, dy: Word;
 Res: TDateTime;
begin
 DecodeDate(Date, dy, dm, dd);
 case _SET_DATE_DOC of
   1: Res:=EncodeDate(dy, dm, 25);
   2: Res:=StartOfAMonth(dy, dm);
   3: Res:=EndOfAMonth(dy, dm);
   4: Res:=EncodeDate(_MATAS_YEAR, _MATAS_MONTH, 25);
   5: Res:=StartOfAMonth(_MATAS_YEAR, _MATAS_MONTH);
   6: Res:=EndOfAMonth(_MATAS_YEAR, _MATAS_MONTH);
   7: begin
    Res:=Date;
    if Res>EndOfAMonth(_MATAS_YEAR, _MATAS_MONTH) then
     Res:=EndOfAMonth(_MATAS_YEAR, _MATAS_MONTH);
   end;
   8: begin
    Res:=Date;
    if Res>EndOfAMonth(_MATAS_YEAR, _MATAS_MONTH) then
     Res:=EndOfAMonth(_MATAS_YEAR, _MATAS_MONTH);
    if DayOfTheWeek(Res) = 6 then Res:=IncDay(Res,-1);
    if DayOfTheWeek(Res) = 7 then Res:=IncDay(Res,-2);
   end
  else
   Res:=Date;
  end;
 GetDateDoc:=Res;
end;

function ShowWaitWindow(aOwner:TComponent):TForm;
begin
 Result:=TWaitForm.Create(aOwner);
 Result.Show;
 Result.Update;
end;

procedure CloseWaitWindow(w: TForm);
begin
 w.Free;
end;

function GetSumma(aOwner:TComponent; summa: Extended; var is_cancel: boolean): Extended;
var
 f: TMatasGetSummaForm;
begin
 is_cancel:=false;
 GetSumma:=0;
 f:=TMatasGetSummaForm.Create(aOwner);
 f.cxSumma.EditValue:=summa;
 if f.ShowModal=mrOk then
  GetSumma:=f.cxSumma.EditValue
 else
  is_cancel:=true;
 f.Free;
end;


function IntToBool(v: integer): boolean;
begin
 if v<1 then
  IntToBool:=false
 else
  IntToBool:=true;
end;

function BoolToInt(v: boolean): integer;
begin
 if v=false then
  BoolToInt:=0
 else
  BoolToInt:=1;
end;

function MatasCheckAccess(Path:string;Action:String;DisplayMessage:Boolean=False):Integer;
var
 i:Integer;
begin
 i:=fibCheckPermission(Path, Action);
// i:=CheckPermission(Path, Action);
 if i<>0 then
 begin
  if DisplayMessage then MessageDlg(AcMgmtErrMsg(i),mtError,[mbOk],0);
 end;
 MatasCheckAccess:=i;
end;

function GetMonthName(const nm: integer) : string;
begin
 Result := '';
 case nm of
   1 : Result := MAT_STR_MONTH01;
   2 : Result := MAT_STR_MONTH02;
   3 : Result := MAT_STR_MONTH03;
   4 : Result := MAT_STR_MONTH04;
   5 : Result := MAT_STR_MONTH05;
   6 : Result := MAT_STR_MONTH06;
   7 : Result := MAT_STR_MONTH07;
   8 : Result := MAT_STR_MONTH08;
   9 : Result := MAT_STR_MONTH09;
   10 : Result := MAT_STR_MONTH10;
   11 : Result := MAT_STR_MONTH11;
   12 : Result := MAT_STR_MONTH12;
 end;
end;

function GetVersionStrInfo: string;
var
 VerInfoSize: DWORD;
 VerInfo: Pointer;
 VerValueSize: DWORD;
 VerValue: PVSFixedFileInfo;
 Dummy: DWORD;
 V1,V2,V3,V4:DWORD;
begin
 VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
 if VerInfoSize = 0 then begin
  //  Dummy := GetLastError;
  //  ShowMessage(IntToStr(Dummy));
  GetVersionStrInfo:='';
 end
 else begin
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do begin
   V1 := dwFileVersionMS shr 16;
   V2 := dwFileVersionMS and $FFFF;
   V3 := dwFileVersionLS shr 16;
   V4 := dwFileVersionLS and $FFFF;
  end;
  FreeMem(VerInfo, VerInfoSize);
  GetVersionStrInfo:=' '+IntToStr(V1)+'.'+IntToStr(V2)+'.'+IntToStr(V3)+'.'+IntToStr(V4)+' ';
 end;
end;

function agMessageDlg(const Caption : string; const Msg : string; const DlgType: TMsgDlgType; const Buttons: TMsgDlgButtons) : word;
var
 form : TForm;
 i    : integer;
begin
 if Buttons = [] then begin
  Result := 0;
  exit;
 end;
 form := CreateMessageDialog(Msg, DlgType, Buttons);
 form.Caption := Caption;
 for i := 0 to form.ComponentCount - 1 do if form.Components[i] is TButton then begin
  if UpperCase(TButton(form.Components[i]).Caption) = 'OK' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_OK_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = 'CANCEL' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_CANCEL_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = '&YES' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_YES_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = '&NO' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_NO_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = '&ABORT' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_ABORT_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = '&RETRY' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_RETRY_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = '&IGNORE' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_IGNORE_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = '&ALL' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_ALL_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = '&HELP' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_HELP_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = 'N&O TO ALL' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_NO_ALL_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = 'YES TO &ALL' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_YES_ALL_CONST+' ';
 end;
 Result := form.ShowModal;
end;

function MessageDlgU(const Caption : string; const Msg : string; const DlgType: TMsgDlgType; const Buttons: TMsgDlgButtons) : word;
var
 form : TForm;
 i    : integer;
begin
 if Buttons = [] then begin
  Result := 0;
  exit;
 end;
 form := CreateMessageDialog(Msg, DlgType, Buttons);
 form.Caption := Caption;
 for i := 0 to form.ComponentCount - 1 do if form.Components[i] is TButton then begin
  if UpperCase(TButton(form.Components[i]).Caption) = 'OK' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_OK_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = 'CANCEL' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_CANCEL_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = '&YES' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_YES_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = '&NO' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_NO_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = '&ABORT' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_ABORT_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = '&RETRY' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_RETRY_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = '&IGNORE' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_IGNORE_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = '&ALL' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_ALL_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = '&HELP' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_HELP_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = 'N&O TO ALL' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_NO_ALL_CONST+' ';
  if UpperCase(TButton(form.Components[i]).Caption) = 'YES TO &ALL' then TButton(form.Components[i]).Caption := ' '+MAT_BUTTON_YES_ALL_CONST+' ';
 end;
 Result := form.ShowModal;
end;

procedure ShowMessage(const Msg : string);
begin
 MessageDlgU(MAT_STR_WARNING, Msg, mtWarning, [mbOk]);
end;

procedure InitCommonVars;
begin
 ShortDateFormat  := 'dd.mm.yyyy';
 LongDateFormat   := 'dd.mm.yyyy';
 DecimalSeparator := ',';
 // '00000419' - Russian
 LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);
 // '00000409' - English
 //  LoadKeyboardLayout( StrCopy(Layout,'00000409'),KLF_ACTIVATE);
 // '00000422' - Ukraine
 //  LoadKeyboardLayout( StrCopy(Layout,'00000422'),KLF_ACTIVATE);
end;

function  AskForDelete : Boolean;
begin
 if agMessageDlg(MAT_STR_WARNING, MAT_STR_ASK_DELETE, mtConfirmation,[mbYes, mbNo]) = ID_YES
 then AskForDelete := True
 else AskForDelete := False;
end;

procedure RefreshDataSet(DataSet : TFIBDataSet; ID_Field : String);
var
 old_position : Int64;
begin
 if DataSet.SQLs.SelectSQL.Text = '' then exit;
 if (not DataSet.IsEmpty) and (Id_Field <> '')
 then Old_Position := DataSet.FieldByName(Id_Field).Value
 else Old_Position := -1;
 DataSet.CloseOpen(True);
 if Old_Position <> -1
 then DataSet.Locate(Id_Field,old_position,[]);
end;

procedure LoadReportsTocxComboBox(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aOBJECT: string; aComboBox: TcxComboBox; var aReports: Variant);
var
 work_db: TpFIBDatabase;
 work_tr: TpFIBTransaction;
 work_ds: TpFIBDataSet;
 rID, rKOD, rNAME, rTEMPLATE: string;
 i: integer;
begin
 work_db:=TpFIBDatabase.Create(aOwner);
 work_tr:=TpFIBTransaction.Create(aOwner);
 work_ds:=TpFIBDataSet.Create(aOwner);
 work_db.DefaultTransaction:=work_tr;
 work_db.SQLDialect:=3;
 work_db.ConnectParams.CharSet:='WIN1251';
 work_db.Handle:=aDBHANDLE;
 work_ds.Database:=work_db;
 work_ds.SelectSQL.Add('SELECT * FROM MAT_INI_REPORTS WHERE OBJECT=:OBJECT ORDER BY KOD');
 work_ds.ParamByName('OBJECT').Value:=aOBJECT;
 work_ds.Open;
 work_ds.FetchAll;
 aReports := VarArrayCreate([0, work_ds.RecordCount-1], varVariant);
 aComboBox.Properties.Items.Clear;
 i:=0;
 while not work_ds.Eof do
 begin
  aComboBox.Properties.Items.Add(work_ds.FieldByName('NAME').AsString);
  rID:=work_ds.FieldByName('ID_REPORTS').AsString;       //0
  rKOD:=work_ds.FieldByName('KOD').AsString;             //1
  rNAME:=work_ds.FieldByName('NAME').AsString;           //2
  rTEMPLATE:=work_ds.FieldByName('TEMPLATE').AsString;   //3
  aReports[i]:=VarArrayOf([rID, rKOD, rNAME, rTEMPLATE]);
  work_ds.Next;
  Inc(i);
 end;
 work_ds.Close;
 work_ds.Free;
 work_db.Free;
 work_tr.Free;
end;

function ReadRegistryValue(aKeyName: string; aValueName: string):string;
var
 reg: TRegistry;
begin
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  if  reg.OpenKey(aKeyName,False) then
  begin
   Result:=reg.ReadString(aValueName);
  end
 finally
  reg.Free;
 end;
end;

procedure WriteRegistryValue(aKeyName: string; aValueName: string; aValue: string);
var
 reg: TRegistry;
begin
   reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if  reg.OpenKey(aKeyName,True) then
   begin
    reg.WriteString(aValueName,aValue);
   end
  finally
   reg.Free;
 end;
end;

procedure ShowDataSetFields(aOwner:TComponent; aDataSet: TpFIBDataSet);
var
 T: TfmShowFields;
 i: integer;
 s: string;
begin
 T:=TfmShowFields.Create(aOwner);
 T.Caption:=aDataSet.Name;
 T.MemoValues.Lines.Add('');
 for i:=0 to aDataSet.Fields.Count-1 do
 begin
  s:=aDataSet.Fields[i].FieldName+' = '+aDataSet.Fields[i].AsString;
  T.MemoValues.Lines.Add(s);
 end;
 T.MemoValues.Lines.Add('');
 T.MemoValues.Lines.Add('SelectSQL:');
 for i:=0 to aDataSet.SelectSQL.Count-1 do
  T.MemoValues.Lines.Add(aDataSet.SelectSQL.Strings[i]);

 T.MemoValues.Lines.Add('');
 T.MemoValues.Lines.Add('Params:');
 for i:=0 to aDataSet.ParamCount-1 do
  T.MemoValues.Lines.Add(aDataSet.Params[i].Name+' = '+aDataSet.Params[i].AsString);
 T.Show;
// T.Free;
end;

procedure ExportDataSet(aOwner:TComponent; aDataSet: TpFIBDataSet);
var
 T: TfmExport;
begin
 T:=TfmExport.Create(aOwner, aDataSet);
 T.ShowModal;
 T.Free;
end;

function ShowFilterParam(aOwner:TComponent; aDBHANDLE:TISC_DB_HANDLE; aID_SESSION:Integer; aID_OBJECT:Integer; aDATE_SESSION:TDateTime; aNameForm:string):string;
var
  T: TForm;
begin
  if aID_OBJECT<>5 then
  begin
    T:=TFilterParamForm.Create(aOwner, aDBHANDLE, aID_SESSION, aID_OBJECT, aDATE_SESSION, aNameForm);
    T.ShowModal;
    Result:=(T as TFilterParamForm).Result;
    T.Free;
  end
  else
  begin
    T:=TFilterGroupNomnForm.Create(aOwner, aDBHANDLE, aID_SESSION, aID_OBJECT, aDATE_SESSION, aNameForm);
    T.ShowModal;
    Result:=(T as TFilterGroupNomnForm).Result;
    T.Free;
  end;
end;

end.

