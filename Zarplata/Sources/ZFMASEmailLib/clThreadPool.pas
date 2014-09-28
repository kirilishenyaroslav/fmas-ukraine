{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clThreadPool;

interface

{$I clVer.inc}

uses
  Windows, Classes, contnrs, SyncObjs;

type
  TclWorkItem = class
  protected
    procedure Execute; virtual; abstract;
  end;

  TclThreadPool = class;

  TclWorkerThread = class(TThread)
  private
    FOwner: TclThreadPool;
    FIsBusy: Boolean;
    FItem: TclWorkItem;
    FStartEvent: THandle;
    FStopEvent: THandle;
  protected
    procedure Execute; override;
  public
    constructor Create(AOwner: TclThreadPool);
    destructor Destroy; override;
    procedure Perform(AItem: TclWorkItem);
    procedure Stop;
    property IsBusy: Boolean read FIsBusy;
  end;

  TclThreadPool = class
  private
    FThreads: TObjectList;
    FItems: TQueue;
    FMinThreadCount: Integer;
    FMaxThreadCount: Integer;
    FAccessor: TCriticalSection;
    procedure SetMaxThreadCount(const Value: Integer);
    procedure SetMinThreadCount(const Value: Integer);
    function GetNonBusyThread: TclWorkerThread;
    procedure CreateMinWorkerThreads;
    function CreateWorkerThread: TclWorkerThread;
    procedure ProcessQueuedItem;
    procedure FreeUnneededThreads;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Stop;
    procedure QueueWorkItem(AItem: TclWorkItem);
    property MinThreadCount: Integer read FMinThreadCount write SetMinThreadCount;
    property MaxThreadCount: Integer read FMaxThreadCount write SetMaxThreadCount;
  end;

implementation

{ TclThreadPool }

constructor TclThreadPool.Create;
begin
  inherited Create();
  FAccessor := TCriticalSection.Create();
  FThreads := TObjectList.Create();
  FItems := TQueue.Create();
  FMaxThreadCount := 5;
  FMinThreadCount := 1;
end;

destructor TclThreadPool.Destroy;
begin
  Stop();
  FItems.Free();
  FThreads.Free();
  FAccessor.Free();
  inherited Destroy();
end;

function TclThreadPool.GetNonBusyThread: TclWorkerThread;
var
  i: Integer;
begin
  for i := 0 to FThreads.Count - 1 do
  begin
    Result := TclWorkerThread(FThreads[i]);
    if (not Result.IsBusy) then Exit;
  end;
  Result := nil;
end;

function TclThreadPool.CreateWorkerThread: TclWorkerThread;
begin
  Result := TclWorkerThread.Create(Self);
  FThreads.Add(Result);
end;

procedure TclThreadPool.CreateMinWorkerThreads;
begin
  while (FThreads.Count < MinThreadCount) do
  begin
    CreateWorkerThread();
  end;
end;

procedure TclThreadPool.QueueWorkItem(AItem: TclWorkItem);
var
  thread: TclWorkerThread;
begin
  FAccessor.Enter();
  try
    thread := GetNonBusyThread();
    if (thread = nil) and (FThreads.Count < MaxThreadCount) then
    begin
      thread := CreateWorkerThread();
    end;
    if (thread <> nil) then
    begin
      thread.Perform(AItem);
    end else
    begin
      FItems.Push(AItem);
    end;
    CreateMinWorkerThreads();
    FreeUnneededThreads();
  finally
    FAccessor.Leave();
  end;
end;

procedure TclThreadPool.SetMaxThreadCount(const Value: Integer);
begin
  if (Value > 1) and (Value <= MAXIMUM_WAIT_OBJECTS) then
  begin
    FMaxThreadCount := Value;
  end;
end;

procedure TclThreadPool.SetMinThreadCount(const Value: Integer);
begin
  if (Value > 1) and (Value <= MAXIMUM_WAIT_OBJECTS) then
  begin
    FMinThreadCount := Value;
  end;
end;

procedure TclThreadPool.Stop;
var
  i: Integer;
begin
  FAccessor.Enter();
  try
    for i := 0 to FThreads.Count - 1 do
    begin
      TclWorkerThread(FThreads[i]).Stop();
    end;
    FThreads.Clear();
    while FItems.AtLeast(1) do
    begin
      TObject(FItems.Pop()).Free();
    end;
  finally
    FAccessor.Leave();
  end;
end;

procedure TclThreadPool.FreeUnneededThreads;
var
  i: Integer;
begin
  for i := FThreads.Count downto MinThreadCount do
  begin
    if (not TclWorkerThread(FThreads[i - 1]).IsBusy) then
    begin
      FThreads.Delete(i - 1);
    end;
  end;
end;

procedure TclThreadPool.ProcessQueuedItem;
var
  thread: TclWorkerThread;
begin
  FAccessor.Enter();
  try
    if FItems.AtLeast(1) then
    begin
      thread := GetNonBusyThread();
      if (thread = nil) and (FThreads.Count < MaxThreadCount) then
      begin
        thread := CreateWorkerThread();
      end;
      if (thread <> nil) then
      begin
        thread.Perform(FItems.Pop());
      end;
    end;
  finally
    FAccessor.Leave();
  end;
end;

{ TclWorkerThread }

constructor TclWorkerThread.Create(AOwner: TclThreadPool);
begin
  inherited Create(True);
  FStartEvent := CreateEvent(nil, False, False, nil);
  FStopEvent := CreateEvent(nil, False, False, nil);
  FOwner := AOwner;
  Resume();
end;

destructor TclWorkerThread.Destroy;
begin
  Stop();
  WaitForSingleObject(Handle, INFINITE);
  FItem.Free();
  FItem := nil;
  CloseHandle(FStopEvent);
  CloseHandle(FStartEvent);
  inherited Destroy();
end;

procedure TclWorkerThread.Execute;
var
  dwResult: DWORD;
  arr: array[0..1] of THandle;
begin
  try
    arr[0] := FStopEvent;
    arr[1] := FStartEvent;
    repeat
      dwResult := WaitForMultipleObjects(2, @arr, FALSE, INFINITE);
      if (dwResult = WAIT_OBJECT_0 + 1) then
      begin
        try
          FItem.Execute();
        except
          Assert(False);
        end;
        FItem.Free();
        FItem := nil;
        if not Terminated then
        begin
          FOwner.ProcessQueuedItem();
        end;
        FIsBusy := False;
      end;
    until Terminated or (dwResult = WAIT_OBJECT_0);
  except
    Assert(False);
  end;
end;

procedure TclWorkerThread.Perform(AItem: TclWorkItem);
begin
  Assert(not FIsBusy);
  FItem := AItem;
  FIsBusy := True;
  SetEvent(FStartEvent);
end;

procedure TclWorkerThread.Stop;
begin
  Terminate();
  SetEvent(FStopEvent);
end;

end.
