unit gr_uThread;

interface

uses Classes, SysUtils, Dialogs, Forms, Gauges, Windows, ExtCtrls,
     FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
     pFIBDataSet, gr_uCommonProc, gr_uMessage, gr_uCommonConsts,
     cxProgressBar, dxBarExtItems, iBase, pFIBProps, StdCtrls, cxMemo,
     Variants, gr_uWaitForm, fib;

type TgrProgressParameter = record
  NameParameterStProc: string;
  NameParameterDSet: string;
end;

type TgrProgressStProcParameter = record
  NameParameterStProc: string;
  ValueStProcParameter: variant;
end;

type TgrProgressParameters = class
   protected
     pParameters: array of TgrProgressParameter;
     pCount: integer;
   private
     function GetParameter(i:integer):TgrProgressParameter;
   public
     constructor Create;reintroduce;
     property Count:integer read pCount;
     procedure Add(ProgressParameter:TgrProgressParameter);overload;stdcall;
     procedure Add(NameParameterDSet:string;NameParameterStProc:string);overload;stdcall;
     property Parameter[Index:integer]:TgrProgressParameter read GetParameter;
end;

type TgrProgressStProcParameters = class
   protected
     pParameters: array of TgrProgressStProcParameter;
     pCount: integer;
   private
     function GetParameter(i:integer):TgrProgressStProcParameter;
   public
     constructor Create;reintroduce;
     property Count:integer read pCount;
     procedure Add(ProgressParameter:TgrProgressStProcParameter);overload;stdcall;
     procedure Add(NameParameterStProc:string;ValueParameterStProc:variant);overload;stdcall;
     property Parameter[Index:integer]:TgrProgressStProcParameter read GetParameter;
end;

type TgrSyngronizeFunction = procedure(Sender:TObject) of Object;
type TgrEndThreadFunction  = procedure(Sender:TObject) of Object;

type TgrThreadTimer = class(TThread)
 protected
  pGauge:TGauge;
  pdxProgressBar:TdxBarProgressItem;
  pTimer:Ttimer;
  pEndThreadFunction:TgrEndThreadFunction;
  procedure FOnTimer(Sender:TObject);
  procedure DoEndThreadFunction;
 public
  constructor Create;reintroduce;
  procedure Execute;override;
  destructor Destroy;override;

  property Gauge:TGauge read pGauge write pGauge;
  property dxProgressBar:TdxBarProgressItem read pdxProgressBar write pdxProgressBar;
  property EndThreadFunction:TgrEndThreadFunction write pEndThreadFunction;
end;

type TgrThreadStProc = class(TThread)
 protected
  pDB_handle         : TISC_DB_HANDLE;
  pStProcName        : string;
  pStProcParameter   : TgrProgressStProcParameters;
  pEndThreadFunction : TgrEndThreadFunction;
  pFatalFinish       : boolean;
 private
    procedure DoEndThreadFunction;
 public
  constructor Create;reintroduce;
  destructor  Destroy;override;
  procedure   Execute;override;

  property DB_Handle:TISC_DB_HANDLE read pDB_Handle write pDB_handle;
  property StProcName:string read pStProcName write pStProcName;
  property StProcParameter:TgrProgressStProcParameters read pStProcParameter write pStProcParameter;
  property EndThreadFunction:TgrEndThreadFunction write pEndThreadFunction;
  property FatalFinish:boolean read pFatalFinish;
end;

type TgrThread = class(TThread)
 protected
  pStProcDSetParameters:TgrProgressParameters;
  pStProcParameter:TgrProgressStProcParameters;
  pWriteTransaction:TpFIBTransaction;
  pReadTransaction:TpFIBTransaction;
  pDSet: TpFIBDataSet;
  pDB: TpFIBDatabase;
  pStProc: TpFIBStoredProc;
  pStProcName:string;
  pcxProgressBar:TcxProgressBar;
  pExecuteFinished:boolean;
  pIteration:integer;
  pGauge:TGauge;
  pdxProgressBar:TdxBarProgressItem;
  pSynhronizeFunction:TgrSyngronizeFunction;
  pEndThreadFunction:TgrEndThreadFunction;
  pDopInfoFunction:TgrSyngronizeFunction;
  pMemo:TMemo;
  pcxMemo:TcxMemo;
  piSShowMessage:boolean;
  pIsNeededTerminate:boolean;
  pFatalFinished:boolean;
  pDSetRecordCount:integer;
  procedure ToNext;
  procedure ToNextE(eMessage:String);
 private
  procedure SetDBHandle(DB_Handle:TISC_DB_HANDLE);
  procedure DoSynhronizeFunction;
  procedure DoEndThreadFunction;
  procedure DoDopInfoFunction;
 public
  constructor Create;reintroduce;
  destructor Destroy;override;
  procedure Execute;override;

  property StProcDSetParameters:TgrProgressParameters read pStProcDSetParameters write pStProcDSetParameters;
  property StProcParameter:TgrProgressStProcParameters read pStProcParameter write pStProcParameter;
  property DSet:TpFIBDataSet read pDSet;
  property StProcName:string read pStProcName write pStProcName;
  property cxProgressBar:TcxProgressBar read pcxProgressBar write pcxProgressBar;
  property Gauge:TGauge read pGauge write pGauge;
  property dxProgressBar:TdxBarProgressItem read pdxProgressBar write pdxProgressBar;
  property ExecuteFinished:boolean read pExecuteFinished;
  property Iteration:integer read pIteration;
  property SynhronizeFunction:TgrSyngronizeFunction write pSynhronizeFunction;
  property EndThreadFunction:TgrEndThreadFunction write pEndThreadFunction;
  property DopInfoFunction:TgrSyngronizeFunction write pDopInfoFunction;
  property DB_Handle:TISC_DB_HANDLE write SetDBHandle;
  property db:TpFIBDatabase read pDB;
  property Memo:TMemo read pMemo write pMemo;
  property cxMemo:TcxMemo read pcxMemo write pcxMemo;
  property IsShowMessage:Boolean read piSShowMessage write piSShowMessage;
  property IsNeededTerminate:boolean read pIsNeededTerminate write pIsNeededTerminate;
  property FatalFinished:boolean read pFatalFinished;
  property DSetRecordCount:integer read pDSetRecordCount;
end;

implementation

constructor TgrThread.Create;
begin
 inherited Create(True);
 pDB := TpFIBDatabase.Create(nil);
 pDB.SQLDialect := 3;
 piSShowMessage:=False;
 pDSet := TpFIBDataSet.Create(nil);
 pDSet.PrepareOptions := [psUseBooleanField,psGetOrderInfo,psSQLINT64ToBCD,psAskRecordCount];
 pStProc := TpFIBStoredProc.Create(nil);
 pReadTransaction := TpFIBTransaction.Create(nil);
 pWriteTransaction := TpFIBTransaction.Create(nil);

 pDB.DefaultTransaction := pReadTransaction;
 pDSet.Database := pDB;
 pDSet.Transaction := pReadTransaction;
 pDSet.UpdateTransaction := pReadTransaction;

 pStProcDSetParameters := TgrProgressParameters.Create;
 pStProcParameter := TgrProgressStProcParameters.Create;
 pExecuteFinished := True;
end;

procedure TgrThread.Execute;
var i:integer;
    wf:TForm;
begin
 try
   pFatalFinished := False;
   pExecuteFinished := False;
   pWriteTransaction.DefaultDatabase := pDSet.Database;
   pStProc.StoredProcName := StProcName;
   pStProc.Database := DSet.Database;
   pStProc.Transaction := pWriteTransaction;

   wf:=ShowWaitForm(Application.MainForm,wfPrepareData);
   try
     DSet.Open;
     pDSetRecordCount:=DSet.RecordCount;
     DSet.First;
   finally
     CloseWaitForm(wf);
   end;

   pIteration := 0;
   pExecuteFinished:=False;
   if pGauge<>nil then
    begin
     pGauge.MaxValue:=DSet.RecordCount;
     pGauge.MinValue:=0;
     pGauge.Progress:=0;
     Synchronize(pGauge.Update);
    end;
   if pcxProgressBar<>nil then
    begin
     pcxProgressBar.Properties.Max := pDSet.RecordCount;
     pcxProgressBar.Properties.Max := 0;
     pcxProgressBar.Position := 0;
     Synchronize(pcxProgressBar.Update);
    end;
   if pdxProgressBar<>nil then
    begin
     pdxProgressBar.Max := pDSet.RecordCount;
     pdxProgressBar.Min := 0;
     pdxProgressBar.Position := 0;
     pdxProgressBar.Step := 0;
     Synchronize(pdxProgressBar.StepIt);
     pdxProgressBar.Step := 1;
    end;

   if assigned(pMemo) then
    begin
     pMemo.Text := '';
     Synchronize(pMemo.Update);
    end;
   if assigned(pcxMemo) then
    begin
     pcxMemo.Text := '';
     Synchronize(pcxMemo.Update);
    end;

   pDSet.First;


     while not pDSet.Eof do
      try
       if Terminated then
        begin
         pExecuteFinished := True;
         Exit;
        end;

       if Assigned(pDopInfoFunction) then
          Synchronize(DoDopInfoFunction);

       pStProc.Transaction.StartTransaction;

       pStProc.Prepare;

       for i:=0 to pStProcParameter.Count-1 do
        pStProc.ParamByName(pStProcParameter.Parameter[i].NameParameterStProc).AsVariant :=
                pStProcParameter.Parameter[i].ValueStProcParameter;

       for i:=0 to pStProcDSetParameters.Count-1 do
           pStProc.ParamByName(pStProcDSetParameters.Parameter[i].NameParameterStProc).AsVariant :=
           pDSet[pStProcDSetParameters.Parameter[i].NameParameterDSet];

       pStProc.ExecProc;
       pStProc.Transaction.Commit;

       ToNext;
     except
       on e:exception do
        begin
         if pWriteTransaction.InTransaction then pWriteTransaction.Rollback;
         ToNextE(e.Message);
        end;
     end;

       pExecuteFinished:=true;
       ReturnValue:=1;
  except
   on e:exception do
    begin
     pExecuteFinished := True;
     pFatalFinished := True;
     if (pStProc.Transaction<>nil) and (pStProc.Transaction.InTransaction) then pStProc.Transaction.Rollback;
     if piSShowMessage then
        grShowMessage(ECaption[Indexlanguage],e.Message,mtError,[mbOK]);
     pExecuteFinished:=True;
     if pReadTransaction.InTransaction then pReadTransaction.Rollback;
     if pMemo<>nil then
      begin
       pMemo.Lines.Add(pStProc.StoredProcName);
       for i:=0 to pStProc.ParamCount-1 do
         pMemo.Lines.Add(pStProc.Params[i].Name+' = '+varToStrDef(pStProc.Params[i].Value,'NULL'));
       pMemo.Lines.Add(e.Message);
       pMemo.Lines.Add('--------------------------------------------------------');
       Synchronize(pMemo.Update);
      end;
     if pcxMemo<>nil then
      begin
       pcxMemo.Lines.Add(pStProc.StoredProcName);
       for i:=0 to pStProc.ParamCount-1 do
         pcxMemo.Lines.Add(pStProc.Params[i].Name+' = '+varToStrDef(pStProc.Params[i].Value,'NULL'));
       pcxMemo.Lines.Add(e.Message);
       pcxMemo.Lines.Add('--------------------------------------------------------');
       Synchronize(pcxMemo.Update);
      end;
    end;
  end;
end;

procedure TgrThread.DoSynhronizeFunction;
begin
 pSynhronizeFunction(self);
end;

destructor TgrThread.Destroy;
begin
 if pWriteTransaction<>nil then
  begin
   if pWriteTransaction.InTransaction then pWriteTransaction.Rollback;
   pWriteTransaction.Destroy;
  end;
 if pReadTransaction<>nil then
  begin
   if pReadTransaction.InTransaction then pReadTransaction.Commit;
   pReadTransaction.Destroy;
  end;
 pExecuteFinished := True;
 pStProcDSetParameters.Destroy;
 pStProcParameter.Destroy;
 if pDSet<>nil then pDSet.Destroy;
 if pStProc<>nil then pStProc.Destroy;
 pDB.Handle:=nil;
 if pDB<>nil then pDB.Destroy;
 if (not pFatalFinished) and (Assigned(pEndThreadFunction)) then Synchronize(DoEndThreadFunction);
 if not (pFatalFinished) then MessageBox(Application.MainForm.Handle,PChar(OperationEnd_Text[IndexLanguage]),'Sya',MB_ICONINFORMATION+MB_OK);
 inherited Destroy;
end;

procedure TgrThread.SetDBHandle(DB_Handle:TISC_DB_HANDLE);
begin
 pDB.Handle:=DB_Handle;
 pReadTransaction.StartTransaction;
end;


constructor TgrProgressParameters.Create;
begin
 inherited Create;
 pCount:=0;
end;

function TgrProgressParameters.GetParameter(i:integer):TgrProgressParameter;
begin
 Result := pParameters[i];
end;

procedure TgrProgressParameters.Add(ProgressParameter:TgrProgressParameter);
begin
 inc(pCount);
 SetLength(pParameters,pCount);
 pParameters[pCount-1]:=ProgressParameter;
end;

procedure TgrProgressParameters.Add(NameParameterDSet:string;NameParameterStProc:string);
var tmpParmeter:TgrProgressParameter;
begin
 tmpParmeter.NameParameterStProc := NameParameterStProc;
 tmpParmeter.NameParameterDSet := NameParameterDSet;
 Add(tmpParmeter);
end;

constructor TgrProgressStProcParameters.Create;
begin
 inherited Create;
 pCount := 0;
end;

procedure TgrProgressStProcParameters.Add(ProgressParameter:TgrProgressStProcParameter);
begin
 inc(pCount);
 SetLength(pParameters,pCount);
 pParameters[pCount-1]:=ProgressParameter;
end;

procedure TgrProgressStProcParameters.Add(NameParameterStProc:string;ValueParameterStProc:variant);
var tmpParameter:TgrProgressStProcParameter;
begin
 tmpParameter.NameParameterStProc := NameParameterStProc;
 tmpParameter.ValueStProcParameter := ValueParameterStProc;
 Add(tmpParameter);
end;

function TgrProgressStProcParameters.GetParameter(i:integer):TgrProgressStProcParameter;
begin
 Result := pParameters[i];
end;

procedure TgrThread.ToNext;
begin
       if pcxProgressBar<>nil then
        begin
         pcxProgressBar.Position := pcxProgressBar.Position + 1;
         Synchronize(pcxProgressBar.Update);
        end;

       if pdxProgressBar<>nil then Synchronize(pdxProgressBar.StepIt);

       if pGauge<>nil then
        begin
         pGauge.Progress := pGauge.Progress + 1;
         Synchronize(pGauge.Update);
        end;

       if Assigned(pSynhronizeFunction) then
          Synchronize(DoSynhronizeFunction);

       inc(pIteration);
       pDSet.Next;
end;


procedure TgrThread.ToNextE(eMessage:String);
var i:integer;
begin
      if piSShowMessage then
         MessageBox(Application.MainForm.Handle,PChar(eMessage),pChar(mtError),MB_ICONINFORMATION+MB_OK);
      if pMemo<>nil then
         begin
           for i:=0 to DSet.Fields.Count-1 do
             pMemo.Lines.Add(DSet.Fields[i].Name+' = '+VarToStrDef(DSet.Fields[i].Value,'NULL'));
           pMemo.Lines.Add('');
           pMemo.Lines.Add(pStProc.StoredProcName);
           for i:=0 to pStProc.ParamCount-1 do
             pMemo.Lines.Add(pStProc.Params[i].Name+' = '+varToStrDef(pStProc.Params[i].Value,'NULL'));
           pMemo.Lines.Add(eMessage);
           pMemo.Lines.Add('--------------------------------------------------------');
           Synchronize(pMemo.Update);
         end;
      if pcxMemo<>nil then
         begin
           for i:=0 to DSet.Fields.Count-1 do
             pcxMemo.Lines.Add(DSet.Fields[i].Name+' = '+VarToStrDef(DSet.Fields[i].Value,'NULL'));
           pcxMemo.Lines.Add('');
           pcxMemo.Lines.Add(pStProc.StoredProcName);
           for i:=0 to pStProc.ParamCount-1 do
             pcxMemo.Lines.Add(pStProc.Params[i].Name+' = '+varToStrDef(pStProc.Params[i].Value,'NULL'));
           pcxMemo.Lines.Add(eMessage);
           pcxMemo.Lines.Add('--------------------------------------------------------');
           Synchronize(pcxMemo.Update);
         end;
      ToNext;
end;

procedure TgrThread.DoEndThreadFunction;
begin
 pEndThreadFunction(self);
end;

procedure TgrThread.DoDopInfoFunction;
begin
 pDopInfoFunction(self);
end;

constructor TgrThreadTimer.create;
begin
  inherited Create(True);
  pTimer := TTimer.Create(Application.MainForm);
  pTimer.OnTimer := FOnTimer;
  pTimer.Interval := 100;
end;

procedure TgrThreadTimer.Execute;
begin
 if assigned(pdxProgressBar) then
  begin
   pdxProgressBar.Step:=1;
   pdxProgressBar.Max:=60;
   pdxProgressBar.Min:=0;
   pdxProgressBar.Position:=0;
  end;
 while not Terminated do pTimer.Enabled:=True;
 pTimer.Enabled := False;
end;

procedure TgrThreadTimer.FOnTimer(Sender:TObject);
begin
 if assigned(pGauge) then
   begin
    if   pGauge.MaxValue  = pGauge.Progress then pGauge.Progress := 1
    else pGauge.Progress := pGauge.Progress + 1;
    Synchronize(pGauge.Update);
   end;
 if assigned(pdxProgressBar) then Synchronize(pdxProgressBar.StepIt);
end;

procedure TgrThreadTimer.DoEndThreadFunction;
begin
 pEndThreadFunction(self);
end;

destructor TgrThreadTimer.Destroy;
begin
 pTimer.Destroy;
 if Assigned(pEndThreadFunction) then Synchronize(DoEndThreadFunction);
 inherited Destroy;
end;

constructor TgrThreadStProc.Create;
begin
 inherited Create(True);
 pStProcParameter := TgrProgressStProcParameters.Create;
end;

procedure TgrThreadStProc.Execute;
var DB:TpFIBDatabase;
    StProc:TpFIBStoredProc;
    Transaction:TpFIBTransaction;
    i:integer;
begin
 sleep(30);
 DB := TpFIBDatabase.Create(nil);
 StProc := TpFIBStoredProc.Create(nil);
 Transaction := TpFIBTransaction.Create(nil);
 pFatalFinish := False;
 try
  DB.SQLDialect := 3;
  DB.DefaultTransaction := Transaction;
  DB.DefaultUpdateTransaction := Transaction;
  StProc.Transaction := Transaction;
  StProc.Database := DB;
  Db.Handle := pDB_handle;
  Transaction.DefaultDatabase := DB;
  StProc.Transaction.StartTransaction;
  try
   StProc.StoredProcName := pStProcName;
   StProc.Prepare;

   for i:=0 to pStProcParameter.Count-1 do
       StProc.ParamByName(pStProcParameter.Parameter[i].NameParameterStProc).AsVariant :=
               pStProcParameter.Parameter[i].ValueStProcParameter;

   StProc.ExecProc;
   StProc.Transaction.Commit;
  except
   on e:exception do
    begin
     MessageBox(Application.MainForm.Handle,PChar(e.Message),pChar(mtError),
                MB_OK+MB_ICONERROR);
     StProc.Transaction.Rollback;
     pFatalFinish:=True;
    end;
  end;
 finally
  StProc.Free;
  Transaction.Free;
  DB.Free;
 end;
end;

destructor TgrThreadStProc.Destroy;
begin
 pStProcParameter.Destroy;
 if Assigned(pEndThreadFunction) then Synchronize(DoEndThreadFunction);
 inherited Destroy;
end;

procedure TgrThreadStProc.DoEndThreadFunction;
begin
 pEndThreadFunction(self);
end;

end.
