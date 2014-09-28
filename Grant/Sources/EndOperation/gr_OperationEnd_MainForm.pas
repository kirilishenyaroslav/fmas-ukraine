unit gr_OperationEnd_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxTextEdit, cxMaskEdit,
  cxSpinEdit, ExtCtrls, cxControls, cxContainer, cxEdit, cxProgressBar,
  StdCtrls, cxButtons, ActnList, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, iBase,
  zProc, zMessages, Unit_zGlobal_Consts, dxBar, dxBarExtItems, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxGridBandedTableView, PackageLoad,
  Dates, gr_uWaitForm, gr_uMessage, gr_uCommonConsts, gr_uCommonProc,
  cxGroupBox;

type
  TFgrOperationEnd = class(TForm)
    DB: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    GroupBox: TcxGroupBox;
    SaveBtn: TcxButton;
    DelBtn: TcxButton;
    CancelBtn: TcxButton;
    cxLabel1: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SaveBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    POwner:TComponent;
    PDB_handle:TISC_DB_HANDLE;
    PLanguageIndex:Byte;
    PIsRollback:boolean;
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;IsRollback:boolean);reintroduce;
  end;

implementation

uses DateUtils;

{$R *.dfm}

constructor TFgrOperationEnd.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;IsRollback:boolean);
var kod_action:variant;
begin
 inherited Create(AOwner);
 PDB_handle     := ADB_Handle;
 PLanguageIndex := IndexLanguage;
 DB.Handle:=ADB_Handle;
 POwner:=AOwner;
//------------------------------------------------------------------------------
 self.Caption:=OperationEnd_Text[PLanguageIndex];
 SaveBtn.Caption:=SaveBtn_Caption[PLanguageIndex];
 CancelBtn.Caption:=CancelBtn_Caption[PLanguageIndex];
 DelBtn.Caption:=DeleteBtn_Caption[PLanguageIndex];
 PIsRollback:=IsRollback;
 if PIsRollback
 then
   cxLabel1.Caption:='Увага! ви хочете відкотити систему у попередній період?'
 else
 begin
   kod_action:=ValueFieldZSetup(DB.Handle,'GR_KOD_ACTION');
   if kod_action<>null then
   begin
     if kod_action=11 then
     begin
       cxLabel1.Style.Font.Size:=8;
       cxLabel1.Caption:='Увага! Ви хочете зберехти розрахунок стипендії та перевести систему у наступниій період?'
     end
     else
     begin
       if kod_action=14 then
         cxLabel1.Caption:='Увага! Ви хочете зберехти перерахунок?'
       else
         cxLabel1.Caption:='Увага! Ви хочете зберехти розрахунок?';
     end
   end
   else cxLabel1.Caption:='Увага! Ви хочете зберехти розрахунок?';
 end;

 if pIsRollback then
 begin
   DelBtn.Caption:='Відкотити';
   DelBtn.Left:=SaveBtn.Left;
   SaveBtn.Visible:=False;
 end;
end;

procedure TFgrOperationEnd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if WriteTransaction.InTransaction then WriteTransaction.Commit;
end;

procedure TFgrOperationEnd.SaveBtnClick(Sender: TObject);
var
  wf:TForm;
begin
 try
   wf:=ShowWaitForm(TForm(POwner),wfPrepareData);
   StProc.Transaction.StartTransaction;
   StProc.StoredProcName:='GR_PAYMENT_COUNT_OPERATION_END';
   StProc.Prepare;
   StProc.ParamByName('IS_DELETE').AsString :='F';
   StProc.ExecProc;
   StProc.Transaction.Commit;
 except
   on E:Exception do
   begin
     CloseWaitForm(wf);
     grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOK]);
     StProc.Transaction.Rollback;
   end;
 end;

 CloseWaitForm(wf);
 grSetBeginAction(DB.Handle,0);
 grShowMessage('Вдале завершення', 'Розрахунок збережений!', mtInformation,[mbOk]);
 ModalResult:=mrYes
end;

procedure TFgrOperationEnd.DelBtnClick(Sender: TObject);
var
  wf:TForm;
begin
 try
   wf:=ShowWaitForm(TForm(POwner),wfPrepareData);
   StProc.Transaction.StartTransaction;
   StProc.StoredProcName:='GR_PAYMENT_COUNT_OPERATION_END';
   StProc.Prepare;
   if PIsRollback then
     StProc.ParamByName('IS_DELETE').AsString :='O'
   else
     StProc.ParamByName('IS_DELETE').AsString :='T';
   StProc.ExecProc;
   StProc.Transaction.Commit;
 except
   on E:Exception do
   begin
     CloseWaitForm(wf);
     grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOK]);
     StProc.Transaction.Rollback;
   end;
 end;
 CloseWaitForm(wf);
 grSetBeginAction(DB.Handle,0);
 if PIsRollback then
   grShowMessage('Вдале завершення','Відкат системи завершено!',mtInformation,[mbOk])
 else
   grShowMessage('Вдале завершення','Розрахунок вилучено!',mtInformation,[mbOk]);
 ModalResult:=mrNo;
end;

procedure TFgrOperationEnd.CancelBtnClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
