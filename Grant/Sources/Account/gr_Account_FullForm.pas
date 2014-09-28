unit gr_Account_FullForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxSplitter, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMemo, cxMaskEdit, cxDBEdit, Gauges, ExtCtrls,
  gr_uCommonProc, gr_uCommonConsts, gr_uMessage,
  iBase, zThread, dxBar, dxBarExtItems, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, cxCheckBox, DB,
  FIBDataSet, pFIBDataSet, zWait, zProc, PackageLoad;

type
  TFSpisokCountFull = class(TForm)
    cxMemo1: TcxMemo;
    BarManager: TdxBarManager;
    BegDateEdit: TdxBarDateCombo;
    BegStatic: TdxBarStatic;
    EndStatic: TdxBarStatic;
    EndDateEdit: TdxBarDateCombo;
    dxBarStatic3: TdxBarStatic;
    FormBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    WriteTransaction: TpFIBTransaction;
    DB: TpFIBDatabase;
    StProc: TpFIBStoredProc;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    CheckBoxFormSheets: TcxCheckBox;
    BarStaticStudent: TdxBarStatic;
    BarEditTin: TdxBarEdit;
    BarEditFio: TdxBarEdit;
    BarProgressItem: TdxBarProgressItem;
    DSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    dxBarStatic1: TdxBarStatic;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    pLanguageIndex:Byte;
    pDBHandle:TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TFSpisokCountFull.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);
var CurrKS:Integer;
begin
 inherited Create(AOwner);
 pDBHandle:=ADB_Handle;
 pLanguageIndex := IndexLanguage;
//------------------------------------------------------------------------------
 Caption := AllCount_Text[PLanguageIndex];
 ExitBtn.Caption := ExitBtn_Caption[pLanguageIndex];
 FormBtn.Caption := DoCountBtn_Caption[pLanguageIndex];
 BegStatic.Caption := LabelDateBeg_Caption[pLanguageIndex];
 BegStatic.Hint := BegStatic.Caption;
 BegDateEdit.Caption := BegStatic.Caption;
 BegDateEdit.Hint := BegDateEdit.Caption;
 EndStatic.Caption := LabelDateEnd_Caption[pLanguageIndex];
 EndStatic.Hint := EndStatic.Caption;
 EndDateEdit.Caption := EndStatic.Caption;
 EndDateEdit.Hint := EndDateEdit.Caption;
 BarStaticStudent.Caption := LabelStudent_Caption[pLanguageIndex];
 BarEditTin.Caption := LabelTin_Caption[pLanguageIndex];
 BarEditTin.Hint := BarEditTin.Caption;
 BarEditFio.Caption := LabelFIO_Caption[pLanguageIndex];
 BarEditFio.Hint := BarEditFio.Caption;
 BarProgressItem.Caption:=LabelProgress_Caption[pLanguageIndex];
 BarProgressItem.Hint:=LabelProgress_Caption[pLanguageIndex];
 CheckBoxFormSheets.Properties.Caption := LabelFormSheet_Caption[pLanguageIndex];
 CheckBoxFormSheets.Hint := LabelFormSheet_Caption[pLanguageIndex];
//------------------------------------------------------------------------------
 CurrKS := grKodSetup(pDBHandle);
 BegDateEdit.Date := grGetFDateKS(CurrKS);
 EndDateEdit.Date := grGetFDateKS(CurrKS+1)-1;
//------------------------------------------------------------------------------
 cxMemo1.Text := '';
 SetOptionsBarManager(BarManager);
 WindowState := wsMaximized;
end;

procedure TFSpisokCountFull.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFSpisokCountFull.FormBtnClick(Sender: TObject);
var wf:TForm;
    pIdGroupAccount:integer;
begin
  pIdGroupAccount := grGetIdGroupAccount(pDBHandle);
  if pIdGroupAccount<>0 then
   begin
    wf:=ShowWaitForm(Self);
    try
       DB.Handle := pDBHandle;
       DSet.SQLs.SelectSQL.Text := 'SELECT * FROM GR_COUNT_PEOPLE('''+DateToStr(BegDateEdit.Date)+''','''+DateToStr(EndDateEdit.Date)+''')';
       DSet.Open;
    finally
       CloseWaitForm(wf);
    end;

    BarProgressItem.Max  := DSet.RecordCount;
    BarProgressItem.Min  := 0;
    BarProgressItem.Step := 1;
    DSet.First;

    grSetBeginAction(DB.Handle,11);

    StProc.StoredProcName := 'GR_COUNT';
    while not DSet.Eof do
    begin
      try
        BarEditTin.Text := VarToStrDef(DSet['TIN'],'NULL');
        BarEditFIO.Text := VarToStrDef(DSet['FIO'],'NULL');
        BarProgressItem.StepIt;

        StProc.Transaction.StartTransaction;
        StProc.Prepare;
        StProc.ParamByName('DATE_BEG').AsDate             := BegDateEdit.Date;
        StProc.ParamByName('DATE_END').AsDate             := EndDateEdit.Date;
        StProc.ParamByName('ID_GROUP_ACCOUNT').AsInteger  := pIdGroupAccount;
        StProc.ParamByName('ID_MAN').AsVariant            := DSet['ID_MAN'];
        StProc.ExecProc;
        StProc.Transaction.Commit;
      except
        on E:Exception do
         begin
          cxMemo1.Lines.Add(VarToStrDef(DSet['ID_MAN'],'NULL')+'-('+BarEditTin.Text+') '+BarEditFio.Text+': '+e.Message);
          StProc.Transaction.Rollback;
         end;
      end;
        DSet.Next;
        Application.ProcessMessages;
    end;

    if CheckBoxFormSheets.Checked then uvFormSheet(self,db.Handle,11,null);
    grSetEndAction(DB.Handle,'T')
   end;
end;

procedure TFSpisokCountFull.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
end;

end.
