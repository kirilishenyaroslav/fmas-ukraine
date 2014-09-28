unit gr_CountCurrent_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxSplitter, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMemo, cxMaskEdit, cxDBEdit, Gauges, ExtCtrls,
  gr_uCommonProc, gr_uCommonConsts, gr_uMessage,
  iBase, gr_uThread, dxBar, dxBarExtItems, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, cxCheckBox, ZProc,
  PackageLoad;

type
  TFCountCurrent = class(TForm)
    cxMemo1: TcxMemo;
    BarManager: TdxBarManager;
    BarProgressItem: TdxBarProgressItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitBtnClick(Sender: TObject);
    procedure ThreadCountEnd(Sender:TObject);
    procedure FormShow(Sender: TObject);
  private
    pLanguageIndex:Byte;
    pDBHandle:TISC_DB_HANDLE;
    pThreadCount:TgrThreadStProc;
    pThreadTimer:TgrThreadTimer;
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TFCountCurrent.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 pDBHandle:=ADB_Handle;
 pLanguageIndex := IndexLanguage;
//------------------------------------------------------------------------------
 Caption := AllCount_Text[PLanguageIndex];
 BarProgressItem.Caption:=LabelProgress_Caption[pLanguageIndex];
 BarProgressItem.Hint:=LabelProgress_Caption[pLanguageIndex];
//------------------------------------------------------------------------------
 cxMemo1.Text := '';
 SetOptionsBarManager(BarManager);
end;

procedure TFCountCurrent.FormClose(Sender: TObject;var Action: TCloseAction);
begin
if (pThreadTimer<>nil)
   then Action:=caNone
   else Action:=caFree;
end;

procedure TFCountCurrent.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFCountCurrent.ThreadCountEnd(Sender:TObject);
begin
  pThreadCount := nil;
  pThreadTimer.Terminate;
  pThreadTimer.Destroy;
  pThreadTimer:=nil;

  if grShowMessage('Фором. відомостей','Сформувати відомості?',mtConfirmation,[mbOk,mbCancel])=mrOk then
    uvFormSheet(self,pDBHandle,13,null);

  Close;
end;

procedure TFCountCurrent.FormShow(Sender: TObject);
begin
    grSetBeginAction(pDBHandle,13);

    pThreadTimer := TgrThreadTimer.Create;
    pThreadTimer.dxProgressBar := BarProgressItem;
    BarProgressItem.Caption := PrepareDataContinue_Text[PLanguageIndex];
    pThreadTimer.Resume;

    pThreadCount := TgrThreadStProc.Create;
    pThreadCount.DB_Handle := pDBHandle;
    pThreadCount.StProcName := 'GR_COUNT_CURRENT';
    pThreadCount.FreeOnTerminate:=True;
    pThreadCount.EndThreadFunction := ThreadCountEnd;
    pThreadCount.Resume;

    grSetEndAction(pDBHandle,'T');
end;

end.
