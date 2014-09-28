unit gr_uCommonProc;

interface

uses  Forms,Windows, Registry, IBase, Variants, SysUtils, Dialogs,
      dxBar, cxClasses, dxStatusBar, Controls,
      cxGridDBTableView, cxGridTableView, cxGridCustomView,
      cxGridCustomTableView, cxGridDBBandedTableView, Dates,
      pfibStoredProc, pfibDataSet, pfibDataBase, gr_ucommonConsts,
      cxButtons, dxBarExtItems, cxLabel, dxDockPanel, dxDockControl,
      zProc, gr_uWaitForm, gr_uStProcDM;

function grDesignReport:boolean;//Проверяет нужно ли открыть отчет для редактирования или печати
function IndexLanguage:byte;

function  grIfThen(AValue: Boolean; const ATrue: Variant; const AFalse: Variant): Variant;
procedure SetOptionsBarManager(BarManager:TdxBarManager);
procedure SetOptionsGridView(GridView:TcxGridDBTableView);overload;
procedure SetOptionsGridView(GridView:TcxGridDBBandedTableView);overload;
procedure SetOptionsStatusBar(StatusBar:TdxStatusBar);
procedure ResizeStatusBar(StatusBar:TdxStatusBar);
function  grSystemDecimalSeparator:string;
function  grKodSetup(DB_Handle:TISC_DB_HANDLE):integer;
function  grGetFDateKS(KodSetup:integer):TDate;
function  grValueFieldFromZSetup(DB_Handle:TISC_DB_HANDLE;FieldName:string):variant;
function  grSmetaByKod(Kod:integer;DB_Handle:TISC_DB_HANDLE):variant;
function  grDepartmentByKod(Kod:string;DB_Handle:TISC_DB_HANDLE):variant;
function  grManByTn(Tn:integer;DB_Handle:TISC_DB_HANDLE):variant;
procedure grShowStProcParametersData(StProc:TpFIBStoredProc);
function  grVoByKod(Kod:integer;ActualDate:Tdate;DB_Handle:TISC_DB_HANDLE;Prop:integer=0):variant;
function  grStringPrepareToQueryText(atext:string):string;
function  grNameFirm(DB_Handle:TISC_DB_HANDLE;NameField:string='NAME_FULL'):string;
function  grGetIdGroupAccount(DB_Handle:TISC_DB_HANDLE):integer;
function  grFormSheet(DB_Handle:TISC_DB_HANDLE;aTypeSheet:integer):boolean;
function  grManByShifr(Shifr:integer;DB_Handle:TISC_DB_HANDLE):variant;

function grCurrentAction(DB_Handle:TISC_DB_HANDLE;var AKod_Action:integer;var AIs_Finished:boolean):string;
function grSetBeginAction(DB_Handle:TISC_DB_HANDLE;AKod_Action:integer):boolean;
function grSetEndAction(DB_Handle:TISC_DB_HANDLE;AIs_Finished:string):boolean;

type TConvertKodSetupToStrPeriodTypeResult = (kspMonthNumYearFull,kspMonthNumYearShort,
                                              kspMonthStrYearFullAddStrFull,kspMonthStrYearFull,
                                              kspMonthStrYearFullAddStrShort,kspMonthStrAddTextYearFullAddStrShort);
function grConvertKodSetupToStrPeriod(aKodSetup:integer;TypeResult:TConvertKodSetupToStrPeriodTypeResult=kspMonthNumYearShort):string;

implementation

uses Classes, cxControls, gr_uMessage, FIBQuery;

function grDesignReport:boolean;
var Registry:TRegistry;
begin
 Result:=False;
 Registry:=TRegistry.Create;
 try
  Registry.RootKey:=HKEY_CURRENT_USER;
  Result:=Registry.OpenKey('\Software\Grant\DesignReport\',False);
 finally
  Registry.Free;
 end;
end;

function IndexLanguage:byte;
begin
 Result:=1;
end;

procedure SetOptionsBarManager(BarManager:TdxBarManager);
var i:Byte;
begin
 with BarManager do
  begin
   CanCustomize := False;
   Style := bmsOffice11;
   SunkenBorder := True;
   for i:=0 to Bars.Count-1 do
    begin
     Bars[i].AllowClose := False;
     Bars[i].AllowCustomizing := False;
     Bars[i].AllowQuickCustomizing := False;
     Bars[i].AllowReset := False;
     Bars[i].BorderStyle := bbsNone;
     Bars[i].NotDocking := [dsNone, dsLeft, dsTop, dsRight, dsBottom];
     if Bars[i].DockControl <> nil then Bars[i].DockControl.SunkenBorder := False;
    end;
  end;
end;

procedure SetOptionsGridView(GridView:TcxGridDBTableView);
var i:byte;
begin
with GridView do
 begin
  OptionsCustomize.ColumnFiltering := False;
  OptionsView.Footer := False;
  OptionsView.GroupByBox := False;
  OptionsView.ColumnAutoWidth := True;
  OptionsView.HeaderAutoHeight := True;
  OptionsView.CellAutoHeight := True;
  for i:=0 to GridView.ColumnCount-1 do
   begin
    Columns[i].HeaderAlignmentHorz := taCenter;
    Columns[i].HeaderAlignmentVert := vaCenter;
   end;
  OptionsSelection.CellSelect := False;
 end;
end;

procedure SetOptionsGridView(GridView:TcxGridDBBandedTableView);
var i:byte;
begin
with GridView do
 begin
  OptionsCustomize.ColumnFiltering := False;
  OptionsView.Footer := False;
  OptionsView.GroupByBox := False;
  OptionsView.ColumnAutoWidth := True;
  OptionsView.HeaderAutoHeight := True;
  OptionsView.CellAutoHeight := True;
  for i:=0 to GridView.ColumnCount-1 do
   begin
    Columns[i].HeaderAlignmentHorz := taCenter;
    Columns[i].HeaderAlignmentVert := vaCenter;
   end;
  OptionsSelection.CellSelect := False;
 end;
end;

procedure SetOptionsStatusBar(StatusBar:TdxStatusBar);
begin
  StatusBar.PaintStyle := stpsOffice11;
end;

procedure ResizeStatusBar(StatusBar:TdxStatusBar);
var i:byte;
begin
for i:=0 to StatusBar.Panels.Count-1 do
 StatusBar.Panels[i].Width := StatusBar.Width div StatusBar.Panels.Count;
end;

function grSystemDecimalSeparator:string;
var reg: TRegistry;
begin
 Result:='';
 reg:=TRegistry.Create;
  try
   Reg.RootKey := HKEY_CURRENT_USER;
   if Reg.OpenKey('\Control Panel\International\', False) then
   begin
     Result:=Reg.ReadString('SDecimal');
     Reg.CloseKey;
   end
   else
    Result:=',';
  finally
   Reg.Free;
  end;
end;

function grKodSetup(DB_Handle:TISC_DB_HANDLE):integer;
var pStProc:TpFIBStoredProc;
    pTransaction:TpFIBTransaction;
    pDataBase:TpFIBDatabase;
begin
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
   pStProc.SQL.Text := 'SELECT GR_KOD_SETUP FROM Z_SETUP';
   pStProc.ExecQuery;
   Result := pStProc.FieldByName('GR_KOD_SETUP').AsInteger;
  except
   on e:exception do
   begin
    pStProc.Transaction.Rollback;
    grShowMessage(ECaption[IndexLanguage],e.Message,mtError,[mbOK]);
    Result := 0;
   end;
  end;
 finally
  pStProc.Destroy;
  pTransaction.Destroy;
  pDataBase.Destroy;
 end;
end;

function grGetIdGroupAccount(DB_Handle:TISC_DB_HANDLE):integer;
var pStProc:TpFIBStoredProc;
    pTransaction:TpFIBTransaction;
    pDataBase:TpFIBDatabase;
begin
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
   pStProc.SQL.Text := 'SELECT ID_GROUP_ACCOUNT FROM GR_GET_NEW_ID_GROUP_ACCOUNT';
   pStProc.ExecQuery;
   Result := pStProc.FieldByName('ID_GROUP_ACCOUNT').AsInteger;
   pStProc.Transaction.Commit;
  except
   on e:exception do
   begin
    pStProc.Transaction.Rollback;
    grShowMessage(ECaption[IndexLanguage],e.Message,mtError,[mbOK]);
    Result := 0;
   end;
  end;
 finally
  pStProc.Destroy;
  pTransaction.Destroy;
  pDataBase.Destroy;
 end;
end;

function grFormSheet(DB_Handle:TISC_DB_HANDLE;aTypeSheet:integer):boolean;
var pStProc:TpFIBStoredProc;
    pTransaction:TpFIBTransaction;
    pDataBase:TpFIBDatabase;
    wf:TForm;
begin
  wf:=ShowWaitForm(Application.MainForm,wfPrepareData);
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
       pStProc.StoredProcName := 'Z_ACCOUNT_TO_TMPSHPRO';
       pStProc.Prepare;
       pStProc.ParamByName('ATYPE_SHEET').AsInteger := aTypeSheet;
       pStProc.ExecProc;

       pStProc.StoredProcName := 'UV_FORMSHEET';
       pStProc.Prepare;
       pStProc.ParamByName('LIMIT_SUM').AsVariant := null;
       pStProc.ParamByName('ID_TYPE_SHEET').AsInteger := aTypeSheet;
       pStProc.ExecProc;

       pStProc.Transaction.Commit;
       grShowMessage('Завершення','Формування відомостей було вдало завершено!',mtInformation,[mbOk]);
       Result := True;
    except
      on e:exception do
       begin
        pStProc.Transaction.Rollback;
        grShowMessage(ECaption[IndexLanguage],e.Message,mtError,[mbOK]);
        Result := False;
       end;
    end;
  finally
     pStProc.Destroy;
     pTransaction.Destroy;
     pDataBase.Destroy;
     CloseWaitForm(wf);
  end;
end;

function  grValueFieldFromZSetup(DB_Handle:TISC_DB_HANDLE;FieldName:string):variant;
var pStProc:TpFIBStoredProc;
    pTransaction:TpFIBTransaction;
    pDataBase:TpFIBDatabase;
begin
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
   pStProc.SQL.Text := 'SELECT '+FieldName+' FROM Z_SETUP';
   pStProc.ExecQuery;
   Result := pStProc.FieldByName(FieldName).AsInteger;
  except
   on e:exception do
   begin
    pStProc.Transaction.Rollback;
    grShowMessage(ECaption[IndexLanguage],e.Message,mtError,[mbOK]);
    Result := 0;
   end;
  end;
 finally
  pStProc.Destroy;
  pTransaction.Destroy;
  pDataBase.Destroy;
 end;
end;

function grConvertKodSetupToStrPeriod(aKodSetup:integer;TypeResult:TConvertKodSetupToStrPeriodTypeResult=kspMonthNumYearShort):string;
begin
 Result:= KodSetupToPeriod(aKodSetup,ord(TypeResult));
end;

function  grSmetaByKod(Kod:integer;DB_Handle:TISC_DB_HANDLE):variant;
begin
 Result:=SmetaByKod(Kod,DB_Handle);
end;

function  grDepartmentByKod(Kod:string;DB_Handle:TISC_DB_HANDLE):variant;
begin
 Result := DepartmentByKod(Kod,DB_Handle);
end;

function  grManByTn(Tn:integer;DB_Handle:TISC_DB_HANDLE):variant;
begin
 Result := ManByTn(Tn,DB_Handle);
end;

function  grGetFDateKS(KodSetup:integer):TDate;
var TYear,TMonth:integer;
    const MonthBeg=1;
    const YearBeg=1995;
begin
 TYear  := (KodSetup - MonthBeg + 1) div 12;
 TMonth := MonthBeg + KodSetup - TYear * 12 - 1;
 if (TMonth mod 12 = 0) then
  begin
   TYear  := TYear + YearBeg + TMonth div 12 - 1;
   TMonth := 12;
  end
 else
  begin
   TYear  := TYear + YearBeg + TMonth div 12;
   TMonth := TMonth mod 12;
  end;
 Result := EncodeDate(TYear,TMonth,1);
end;

procedure grShowStProcParametersData(StProc:TpFIBStoredProc);
  function pIsShowMessage:boolean;
  var Registry:TRegistry;
  begin
   Result:=False;
   Registry:=TRegistry.Create;
   try
    Registry.RootKey:=HKEY_CURRENT_USER;
    Result:=Registry.OpenKey('\Software\Grant\ShowStProcMessage\',False);
   finally
    Registry.Free;
   end;
  end;
var TextMessage:string;
    i:integer;
begin
 if not pIsShowMessage then exit;
 TextMessage := StProc.Params[1].Name+' = '+varToStrDef(StProc.Params[1].Value,'NULL');
 for i:=1 to StProc.ParamCount-1 do
  TextMessage := TextMessage+#13+
                 StProc.Params[i].Name+' = '+varToStrDef(StProc.Params[i].Value,'NULL');
 ShowMessage(TextMessage);
end;

function grIfThen(AValue: Boolean; const ATrue: Variant; const AFalse: Variant): Variant;
begin
 if AValue then
  result:=ATrue
 else
  result:=AFalse;
end;

function  grVoByKod(Kod:integer;ActualDate:Tdate;DB_Handle:TISC_DB_HANDLE;Prop:integer=0):variant;
begin
 Result:=VoByKod(Kod,ActualDate,DB_Handle,ValueFieldZSetup(DB_Handle,'GR_ID_SYSTEM'),Prop);
end;

function  grStringPrepareToQueryText(atext:string):string;
begin
 result := StringPrepareToQueryText(atext); 
end;

function  grNameFirm(DB_Handle:TISC_DB_HANDLE;NameField:string='NAME_FULL'):string;
begin
 Result := GetNameFirm(DB_Handle,NameField);
end;

function grManByShifr(Shifr:integer;DB_Handle:TISC_DB_HANDLE):variant;
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
   pStProc.StoredProcName := 'GR_MAN_BY_SHIFR';
   pStProc.ParamByName('KOD').AsInteger:=Shifr;
   pStProc.ExecProc;
   res:=VarArrayCreate([0,2],varVariant);
   Res[0] := pStProc.ParamByName('ID_MAN').AsVariant;
   Res[1] := pStProc.ParamByName('SHIFR').AsVariant;
   Res[2] := pStProc.ParamByName('FIO').AsVariant;
   pStProc.Transaction.Commit;
  except
   on e:exception do
   begin
    pStProc.Transaction.Rollback;
    grShowMessage(ECaption[IndexLanguage],e.Message,mtError,[mbOK]);
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

function grCurrentAction(DB_Handle:TISC_DB_HANDLE;var AKod_Action:integer;var AIs_Finished:boolean):string;
var DM:TStProcDM;
begin
 DM := TStProcDM.Create(Application);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'GR_ACTION_DATA';
   Prepare;
   ExecProc;
   AKod_Action:=ParamByName('KOD_ACTION').AsInteger;
   if AKod_Action=0 then AIs_Finished:=True
   else AIs_Finished:=(ParamByName('ACTION_FINISHED').AsString='T');
   Result := ParamByName('NAME_ACTION').AsString;
   Transaction.Commit;
  except
   on E:exception do
    begin
     grShowMessage(ECaption[LanguageIndex],e.Message,mtError,[mbOK]);
     Transaction.Rollback;
    end;
  end;
end;

function grSetBeginAction(DB_Handle:TISC_DB_HANDLE;AKod_Action:integer):boolean;
var DM:TStProcDM;
begin
 Result:=True;
 DM := TStProcDM.Create(Application);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'GR_SETUP_ACTION_U';
   Prepare;
   ParamByName('KOD_ACTION').AsInteger := AKod_Action;
   ExecProc;
   Transaction.Commit;
  except
   on E:exception do
    begin
     Result:=False;
     Transaction.Rollback;
    end;
  end;
  DM.Free;
end;

function grSetEndAction(DB_Handle:TISC_DB_HANDLE;AIs_Finished:string):boolean;
var DM:TStProcDM;
begin
 Result:=True;
 DM := TStProcDM.Create(Application);
 DM.DB.Handle := DB_Handle;
 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'GR_SETUP_FINISHED_U';
   Prepare;
   if AIs_Finished='' then
     ParamByName('IS_FINISHED').AsVariant := NULL
   else
     ParamByName('IS_FINISHED').AsString := AIs_Finished;
   ExecProc;
   Transaction.Commit;
  except
   on E:exception do
    begin
     Result:=False;
     Transaction.Rollback;
    end;
  end;
end;

end.
