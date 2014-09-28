unit gr_Account_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxTextEdit, cxMaskEdit,
  cxSpinEdit, ExtCtrls, cxControls, cxContainer, cxEdit, cxProgressBar,
  StdCtrls, cxButtons, ActnList, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, iBase,
  zProc, dxBar, dxBarExtItems, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxGridBandedTableView, PackageLoad,
  Dates, ZcxLocateBar, zThread, Gauges,  zWait,
  gr_uMessage, gr_uCommonProc, gr_uCommonConsts, cxSplitter, cxMemo, Menus,
  cxGridCustomPopupMenu, cxGridPopupMenu, uCommonSp,
  gr_uCommonLoader;

type
  TFSpisokCount = class(TForm)
    Panel1: TPanel;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    Panel3: TPanel;
    BarManager: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    InsertBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    GridDBTableView1: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    GridClFio: TcxGridDBColumn;
    GridClBirthDate: TcxGridDBColumn;
    Styles: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    DelAllBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    DSource: TDataSource;
    StProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    ExitBtn: TdxBarLargeButton;
    BarDockLocate: TdxBarDockControl;
    DoCountBtn: TdxBarLargeButton;
    GridClTin: TcxGridDBColumn;
    Panel2: TPanel;
    MemoErrors: TcxMemo;
    cxSplitter1: TcxSplitter;
    cxGridPopupMenu: TcxGridPopupMenu;
    GridPopupMenu: TPopupMenu;
    InsertPopupBtn: TMenuItem;
    DeletePopupBtn: TMenuItem;
    DelAllPopupBtn: TMenuItem;
    RefreshPopupBtn: TMenuItem;
    DoCountPopupBtn: TMenuItem;
    N1: TMenuItem;
    ExitPopupBtn: TMenuItem;
    BarProgressItem: TdxBarProgressItem;
    dxBarDockControl2: TdxBarDockControl;
    dxBarPopupMenu1: TdxBarPopupMenu;
    InsertAllBtn: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    SmetaBtn: TdxBarLargeButton;
    ButtonInsertAll: TdxBarLargeButton;
    procedure ActionCancelExecute(Sender: TObject);
    procedure InsertBtnClick(Sender: TObject);
    procedure GridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure DeleteBtnClick(Sender: TObject);
    procedure DelAllBtnClick(Sender: TObject);
    procedure DoCountBtnClick(Sender: TObject);
    procedure GridPopupMenuPopup(Sender: TObject);
    procedure InsertPopupBtnClick(Sender: TObject);
    procedure DeletePopupBtnClick(Sender: TObject);
    procedure DelAllPopupBtnClick(Sender: TObject);
    procedure RefreshPopupBtnClick(Sender: TObject);
    procedure DoCountPopupBtnClick(Sender: TObject);
    procedure ExitPopupBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InsertAllBtnClick(Sender: TObject);
    procedure SmetaBtnClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    PDB_handle:TISC_DB_HANDLE;
    PLanguageIndex:Byte;
    PId_Report:Integer;
    PBarLocate:TZBarLocate;
    PIdSmeta:Variant;
    IdSession:Integer;
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);reintroduce;
    property Id_report:integer read PId_Report write PId_Report;
  end;

implementation


uses DateUtils;

{$R *.dfm}


constructor TFSpisokCount.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 PDB_handle     := ADB_Handle;
 PLanguageIndex := IndexLanguage;
//------------------------------------------------------------------------------
 Caption                 := QuickCount_Text[PLanguageIndex];
 InsertBtn.Caption       := InsertBtn_Caption[PLanguageIndex];
 DeleteBtn.Caption       := DeleteBtn_Caption[PLanguageIndex];
 RefreshBtn.Caption      := RefreshBtn_Caption[PLanguageIndex];
 SmetaBtn.Caption        := LabelSmeta_Caption[PLanguageIndex];
 ExitBtn.Caption         := ExitBtn_Caption[PLanguageIndex];
 DelAllBtn.Caption       := ClearBtn_Caption[PLanguageIndex];
 DoCountBtn.Caption      := DoCountBtn_Caption[PLanguageIndex];
 InsertPopupBtn.Caption  := InsertBtn_Caption[PLanguageIndex];
 DeletePopupBtn.Caption  := DeleteBtn_Caption[PLanguageIndex];
 RefreshPopupBtn.Caption := RefreshBtn_Caption[PLanguageIndex];
 ExitPopupBtn.Caption    := ExitBtn_Caption[PLanguageIndex];
 DelAllPopupBtn.Caption  := ClearBtn_Caption[PLanguageIndex];
 DoCountPopupBtn.Caption := DoCountBtn_Caption[PLanguageIndex];
 GridClTin.Caption       := GridClTin_Caption[PLanguageIndex];
 GridClFio.Caption       := GridClFIO_Caption[PLanguageIndex];
 GridClBirthDate.Caption := GridClBirthDate_Caption[PLanguageIndex];
 ButtonInsertAll.Caption := InsertAll_Caption[PLanguageIndex];
//------------------------------------------------------------------------------
 PBarLocate:=TZBarLocate.Create(BarManager);

 PBarLocate.DataSet := DSet;
 PBarLocate.BorderStyle := bbsNone;
 PBarLocate.AddLocateItem('TIN',
                           GridClTin.Caption,
                           [loCaseInsensitive,loPartialKey]);
 PBarLocate.AddLocateItem('FIO',
                           GridClFIO.Caption,
                           [loCaseInsensitive,loPartialKey]);
 PBarLocate.DigitalField := 'TIN';
 PBarLocate.DockControl  := BarDockLocate;
//------------------------------------------------------------------------------
 DB.Handle := PDB_handle;
 DSet.SQLs.SelectSQL.Text := 'SELECT * FROM GR_REE_FOR_ACC_S ORDER BY FIO';
 DSet.Open;
//------------------------------------------------------------------------------
 WindowState := wsMaximized;
 MemoErrors.Text := '';
 cxSplitter1.CloseSplitter;
 BarProgressItem.Caption := '';
//------------------------------------------------------------------------------
 SetOptionsBarManager(BarManager);
 SetOptionsGridView(GridDBTableView1);
 GridDBTableView1.OptionsView.Footer := True;
end;

procedure TFSpisokCount.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFSpisokCount.InsertBtnClick(Sender: TObject);
var Man:Variant;
begin
Man:=LoadPeopleModal(Self,PDB_handle);
if VarArrayDimCount(Man)>0 then
 begin
  if not DSet.Locate('ID_MAN',Man[0],[loCaseInsensitive]) then
   try
     StProc.StoredProcName := 'GR_REE_FOR_ACC_I';
     StProc.Transaction.StartTransaction;
     StProc.Prepare;
     StProc.ParamByName('ID_MAN').AsInteger := Man[0];
     StProc.ExecProc;
     StProc.Transaction.Commit;
     DSet.SQLs.InsertSQL.Text := 'execute procedure Z_EMPTY_PROC';
     DSet.SQLs.RefreshSQL.Text := 'SELECT * FROM GR_REE_FOR_ACC_S_BY_KEY('+VarToStr(Man[0])+')';
     DSet.Insert;
     DSet.Post;
     DSet.SQLs.InsertSQL.Text := '';
   except
    on e:Exception do
     begin
      grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
      StProc.Transaction.Rollback;
     end;
   end;
 end;
end;

procedure TFSpisokCount.GridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
 begin
  DelAllBtn.Enabled := False;
  DeleteBtn.Enabled := False;
  DoCountBtn.Enabled := False;
 end
else
 begin
  DelAllBtn.Enabled := True;
  DeleteBtn.Enabled := True;
  DoCountBtn.Enabled := True;
 end;
end;

procedure TFSpisokCount.DeleteBtnClick(Sender: TObject);
begin
if grShowMessage(Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes
   then
       try
          StProc.StoredProcName := 'GR_REE_FOR_ACC_D';
          StProc.Transaction.StartTransaction;
          StProc.Prepare;
          StProc.ParamByName('ID_MAN').AsInteger := DSet['ID_MAN'];
          StProc.ExecProc;
          StProc.Transaction.Commit;
          DSet.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
          DSet.Delete;
          DSet.SQLs.DeleteSQL.Text := '';
       except
        on e:Exception do
          begin
           grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
           StProc.Transaction.Rollback;
          end;
       end;
end;

procedure TFSpisokCount.DelAllBtnClick(Sender: TObject);
begin
   try
     StProc.StoredProcName := 'GR_REE_FOR_ACC_CLEAR';
     StProc.Transaction.StartTransaction;
     StProc.Prepare;
     StProc.ExecProc;
     StProc.Transaction.Commit;
     DSet.CloseOpen(True);
   except
    on e:Exception do
     begin
      grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
      StProc.Transaction.Rollback;
     end;
   end;
end;

procedure TFSpisokCount.DoCountBtnClick(Sender: TObject);
 var //FormProgress:TzFProgress;
    tmpYear,tmpMonth:Word;
    tmpDateBeg,tmpDateEnd:TDate;
    tmpKodSetup:integer;
    wf:TForm;
    pIdGroupAccount:integer;
    i:Integer;
begin
  pIdGroupAccount := grGetIdGroupAccount(DB.Handle);
  if pIdGroupAccount<>0 then
   begin
    tmpKodSetup := ValueFieldZSetup(db.Handle,'GR_KOD_SETUP');
    tmpYear := YearMonthFromKodSetup(tmpKodSetup);
    tmpMonth := YearMonthFromKodSetup(tmpKodSetup,False);

    tmpDateBeg:=EncodeDate(tmpYear,tmpMonth,1);
    if tmpMonth=12 then
     begin
      tmpMonth := 1;
      inc(tmpYear);
     end
    else inc(tmpMonth);
    tmpDateEnd:=EncodeDate(tmpYear,tmpMonth,1);
    tmpDateEnd:=tmpDateEnd-1;
    cxSplitter1.OpenSplitter;
    BarProgressItem.Caption := CountContinue_Text[PLanguageIndex];


    wf:=ShowWaitForm(Self);
    try
       DSet.CloseOpen(True);
    finally
       CloseWaitForm(wf);
    end;

    BarProgressItem.Max  := DSet.RecordCount;
    BarProgressItem.Min  := 0;
    BarProgressItem.Step := 1;
    DSet.First;

    grSetBeginAction(DB.Handle,12);

    StProc.StoredProcName := 'GR_COUNT';
    while not DSet.Eof do
    begin
      try
        BarProgressItem.StepIt;

        StProc.Transaction.StartTransaction;
        StProc.Prepare;
        StProc.ParamByName('DATE_BEG').AsDate             := tmpDateBeg;
        StProc.ParamByName('DATE_END').AsDate             := tmpDateEnd;
        StProc.ParamByName('ID_GROUP_ACCOUNT').AsInteger  := pIdGroupAccount;
        StProc.ParamByName('ID_MAN').AsVariant            := DSet['ID_MAN'];
        StProc.ExecProc;
        StProc.Transaction.Commit;
      except
        on E:Exception do
         begin
          MemoErrors.Lines.Add(VarToStrDef(DSet['ID_MAN'],'NULL')+'-('+
                               VarToStrDef(DSet['TIN'],'NULL')+') '+
                               VarToStrDef(DSet['FIO'],'NULL')+': '+e.Message);
          StProc.Transaction.Rollback;
         end;
      end;
        DSet.Next;
        Application.ProcessMessages;
    end;

    uvFormSheet(self,db.Handle,12,null);

    if(SmetaBtn.Down=True)then
    begin
      begin
        for i:=0 to (VarArrayHighBound(PIdSmeta,1)-1) do
        begin
          try
            StProc.StoredProcName := 'GR_T_ACCOUNT_SET_SMETA';
            StProc.Transaction.StartTransaction;
            StProc.Prepare;
            StProc.ParamByName('ID_SMETA').AsInteger := PIdSmeta[i];
            StProc.ExecProc;
            StProc.Transaction.Commit;
          except
          on e:Exception do
          begin
            grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
            StProc.Transaction.Rollback;
          end;
          end;
        end;
      end;

      try
        StProc.StoredProcName:='GR_T_ACCOUNT_REMOVE_BY_SMET';
        StProc.Transaction.StartTransaction;
        StProc.Prepare;
        StProc.ExecProc;
        StProc.Transaction.Commit;
        except
        on E:Exception do
        begin
          grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
          StProc.Transaction.Rollback;
        end;
      end;
    end;
    grSetEndAction(DB.Handle,'T')
    //ThreadAccountEnd(sender);
   end;
end;

procedure TFSpisokCount.GridPopupMenuPopup(Sender: TObject);
begin
 InsertPopupBtn.Enabled  := (InsertBtn.Enabled) and (InsertBtn.Visible=ivAlways);
 DeletePopupBtn.Enabled  := (DeleteBtn.Enabled) and (DeleteBtn.Visible=ivAlways);
 DelAllPopupBtn.Enabled  := (DelAllBtn.Enabled) and (DelAllBtn.Visible=ivAlways);
 RefreshPopupBtn.Enabled := (RefreshBtn.Enabled) and (RefreshBtn.Visible=ivAlways);
 DoCountPopupBtn.Enabled := (DoCountBtn.Enabled) and (DoCountBtn.Visible=ivAlways);
 ExitPopupBtn.Enabled    := (ExitBtn.Enabled) and (ExitBtn.Visible=ivAlways);
end;

procedure TFSpisokCount.InsertPopupBtnClick(Sender: TObject);
begin
InsertBtnClick(Sender);
end;

procedure TFSpisokCount.DeletePopupBtnClick(Sender: TObject);
begin
DeleteBtnClick(Sender);
end;

procedure TFSpisokCount.DelAllPopupBtnClick(Sender: TObject);
begin
DelAllBtnClick(Sender);
end;

procedure TFSpisokCount.RefreshPopupBtnClick(Sender: TObject);
begin
RefreshBtnClick(Sender);
end;

procedure TFSpisokCount.DoCountPopupBtnClick(Sender: TObject);
begin
DoCountBtnClick(Sender);
end;

procedure TFSpisokCount.ExitPopupBtnClick(Sender: TObject);
begin
ExitBtnClick(Sender);
end;

procedure TFSpisokCount.RefreshBtnClick(Sender: TObject);
begin
DSet.CloseOpen(True);
end;

procedure TFSpisokCount.ExitBtnClick(Sender: TObject);
begin
CLose;
end;

procedure TFSpisokCount.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TFSpisokCount.InsertAllBtnClick(Sender: TObject);
var Dep: Variant;
     sp: TSprav;
begin
  sp := GetSprav('SpDepartment');
  if sp <> nil then
  begin
          // заполнить входные параметры
    with sp.Input do
    begin
      Append;
      FieldValues['DBHandle'] := Integer(DB.Handle);
      FieldValues['ShowStyle'] := 0;
      FieldValues['Select'] := 1;
      FieldValues['Actual_Date'] := Date;
      FieldValues['Id_Property']:=4;
      Post;
    end;
  end;
  sp.Show;
  if sp.Output = nil then
    ShowMessage('BUG: Output is NIL!!!')
  else
    if not sp.Output.IsEmpty then
    begin
      Dep:=sp.Output['ID_DEPARTMENT'];
    end;
  sp.Free;

  if(Dep<>null)then
  try
      StProc.StoredProcName := 'GR_REE_FOR_ACC_I_BY_DEP';
      StProc.Transaction.StartTransaction;
      StProc.Prepare;
      StProc.ParamByName('ID_DEP').AsInteger := Dep;
      StProc.ExecProc;
      StProc.Transaction.Commit;

      DSet.CloseOpen(true);
    except
    on e:Exception do
    begin
      grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
      StProc.Transaction.Rollback;
    end;
  end;
end;

procedure TFSpisokCount.SmetaBtnClick(Sender: TObject);
var Parameter:TgrSimpleParam;
i:Integer;
begin
  if(SmetaBtn.Down=True)then
  begin
    Parameter := TgrSimpleParam.Create;
    Parameter.DB_Handle := DB.Handle;
    Parameter.Owner := self;
    PIdSmeta:=DoFunctionFromPackage(Parameter,Stud_SpSmet);
    if not(VarArrayDimCount(PIdSmeta)>0)then SmetaBtn.Down:=false;
    Parameter.Free;
  end
end;

procedure TFSpisokCount.btn1Click(Sender: TObject);
var i:Integer;
  wf:TForm;
begin
wf:=ShowWaitForm(Application.MainForm);
//если смета включена
if SmetaBtn.Down=True then
  for i:=0 to VarArrayDimCount(PIdSmeta) do //перебор всех выбраных смет
  begin
    StProc.StoredProcName := 'GR_REE_FOR_ACC_I_BY_DEP';
    StProc.Transaction.StartTransaction;
    StProc.Prepare;
    StProc.ParamByName('ID_SMETA').AsInteger := PIdSmeta[i];
    StProc.ExecProc;
    StProc.Transaction.Commit;
    DSet.CloseOpen(true);
  end
else //иначе
begin
  StProc.StoredProcName := 'GR_REE_FOR_ACC_I_BY_DEP';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;
  StProc.ExecProc;
  StProc.Transaction.Commit;
  DSet.CloseOpen(true);
end;
CloseWaitForm(wf);
end;


end.
