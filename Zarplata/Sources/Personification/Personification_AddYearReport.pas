unit Personification_AddYearReport;

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
  Dates, ZcxLocateBar, AccMGMT, cxCheckBox;

type
  TFAddYearReport = class(TForm)
    Panel1: TPanel;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    StProcReport: TpFIBStoredProc;
    TransactionStProcReport: TpFIBTransaction;
    Panel3: TPanel;
    BarManager: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    PlusBtn: TdxBarLargeButton;
    MinusBtn: TdxBarLargeButton;
    PlusAllBtn: TdxBarLargeButton;
    GridDBTableView1: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    GridClTin: TcxGridDBColumn;
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
    DeleteAllBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    DSource: TDataSource;
    StProcDSet: TpFIBStoredProc;
    GridClMonthBeg: TcxGridDBColumn;
    GridClMonthEnd: TcxGridDBColumn;
    GridClYearSet: TcxGridDBColumn;
    DSetUpdateTransaction: TpFIBTransaction;
    YearSpinEdit: TdxBarSpinEdit;
    ProgressBar: TdxBarProgressItem;
    ExitBtn: TdxBarLargeButton;
    BarDockLocate: TdxBarDockControl;
    FormBtn: TdxBarLargeButton;
    StProcAll: TpFIBStoredProc;
    StProcAllTransaction: TpFIBTransaction;
    is_science_mark: TcxCheckBox;
    procedure ActionCancelExecute(Sender: TObject);
    procedure PlusBtnClick(Sender: TObject);
    procedure GridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridClYearSetPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure GridClMonthEndPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure GridClMonthBegPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure MinusBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure ProgressBarClick(Sender: TObject);
    procedure YearSpinEditCurChange(Sender: TObject);
    procedure PlusAllBtnClick(Sender: TObject);
    procedure DeleteAllBtnClick(Sender: TObject);
    procedure FormBtnClick(Sender: TObject);
  private
    PDB_handle:TISC_DB_HANDLE;
    PLanguageIndex:Byte;
    PId_Report:Integer;
    PIdUser:String;
    PBarLocate:TZBarLocate;
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);reintroduce;
    property Id_report:integer read PId_Report write PId_Report;
  end;

implementation

uses DateUtils;

{$R *.dfm}

constructor TFAddYearReport.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 PDB_handle     := ADB_Handle;
 PLanguageIndex := LanguageIndex;
//------------------------------------------------------------------------------
 PlusBtn.Caption := InsertBtn_Caption[PLanguageIndex];
 MinusBtn.Caption := DeleteBtn_Caption[PLanguageIndex];
 RefreshBtn.Caption := RefreshBtn_Caption[PLanguageIndex];
 ExitBtn.Caption := ExitBtn_Caption[PLanguageIndex];
 DeleteAllBtn.Caption := DelAllBtn_Caption[PLanguageIndex];
 PlusAllBtn.Caption := AddAllBtn_Caption[PLanguageIndex];
 FormBtn.Caption := FormBtn_Caption[PLanguageIndex];
 ProgressBar.Caption := ProgressBar_Caption[PLanguageIndex];
 Caption := CreateReport_Caption[PLanguageIndex];
 GridClTin.Caption := GridClTin_Caption[PLanguageIndex];
 GridClFio.Caption := GridClFIO_Caption[PLanguageIndex];
 GridClYearSet.Caption := GridClYear_Caption[PLanguageIndex];
 GridClMonthBeg.Caption := GridClBegPeriod_Caption[PLanguageIndex];
 GridClMonthEnd.Caption := GridClEndPeriod_Caption[PLanguageIndex];
 GridClBirthDate.Caption := GridClBirthDate_Caption[PLanguageIndex];
 YearSpinEdit.Caption := GridClYear_Caption[PLanguageIndex];
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
 PIdUser:=IntToStr(GetUserId);
 YearSpinEdit.Value := YearOf(Date)-1;
 DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_PERSONIFICATION_REESTR_S('+PIdUser+')';
 DSet.SQLs.UpdateSQL.Text := 'execute procedure Z_PERSONIFICATION_REESTR_U('+PIdUser+',?TIN,?FIO,?BIRTH_DATE,?MONTH_BEG,?MONTH_END,?YEAR_SET)';
 DSet.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_PERSONIFICATION_REESTR_S_BY_K('+pIdUser+',?TIN)';
 DSet.Open;
end;

procedure TFAddYearReport.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFAddYearReport.PlusBtnClick(Sender: TObject);
var Man:Variant;
begin
Man:=LoadPeopleModal(Self,PDB_handle);
if VarArrayDimCount(Man)>0 then
 begin
  if not DSet.Locate('TIN',Man[5],[loCaseInsensitive]) then
   try
     StProcDSet.StoredProcName := 'Z_PERSONIFICATION_REESTR_I';
     StProcDSet.Transaction.StartTransaction;
     StProcDSet.Prepare;
     StProcDSet.ParamByName('ID_USER').AsInteger := StrToInt(pIdUser);
     StProcDSet.ParamByName('TIN').AsString      := Man[5];
     StProcDSet.ParamByName('BIRTH_DATE').AsDate := man[6];
     StProcDSet.ParamByName('FIO').asString      := VarToStrDef(Man[1],'')+' '+VarToStrDef(Man[2],'')+' '+VarToStrDef(Man[3],'');
     StProcDSet.ExecProc;
     StProcDSet.Transaction.Commit;
     DSet.SQLs.InsertSQL.Text := 'execute procedure Z_EMPTY_PROC';
     DSet.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_PERSONIFICATION_REESTR_S_BY_K('+pIdUser+','+Man[5]+')';
     DSet.Insert;
     DSet.Post;
     DSet.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_PERSONIFICATION_REESTR_S_BY_K('+pIdUser+',?TIN)';
     DSet.SQLs.InsertSQL.Text := '';
   except
    on e:Exception do
     begin
      ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
      StProcDSet.Transaction.Rollback;
     end;
   end;
 end;
end;

procedure TFAddYearReport.GridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if DSetUpdateTransaction.InTransaction then DSetUpdateTransaction.Commit;
end;

procedure TFAddYearReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

procedure TFAddYearReport.GridClYearSetPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
if DSetUpdateTransaction.InTransaction then
 begin
  DSet['YEAR_SET']:=DisplayValue;
  DSet.Edit;
  DSet.Post;
 end;
end;

procedure TFAddYearReport.GridClMonthEndPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
if DSetUpdateTransaction.InTransaction then
 begin
  DSet['MONTH_END']:=DisplayValue;
  DSet.Edit;
  DSet.Post;
 end;
end;

procedure TFAddYearReport.GridClMonthBegPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
if DSetUpdateTransaction.InTransaction then
 begin
   DSet['MONTH_BEG']:=DisplayValue;
   DSet.Edit;
   DSet.Post;
 end;
end;

procedure TFAddYearReport.MinusBtnClick(Sender: TObject);
begin
if ZShowMessage(Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes
   then
       try
          StProcDSet.StoredProcName := 'Z_PERSONIFICATION_REESTR_D';
          StProcDSet.Transaction.StartTransaction;
          StProcDSet.Prepare;
          StProcDSet.ParamByName('ID_USER').AsInteger := StrToInt(pIdUser);
          StProcDSet.ParamByName('TIN').AsString      := DSet['TIN'];
          StProcDSet.ExecProc;
          StProcDSet.Transaction.Commit;
          DSet.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
          DSet.Delete;
          DSet.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_PERSONIFICATION_REESTR_S_BY_K('+pIdUser+',?TIN)';
       except
        on e:Exception do
          begin
           ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
           StProcDSet.Transaction.Rollback;
          end;
       end;
end;

procedure TFAddYearReport.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFAddYearReport.ProgressBarClick(Sender: TObject);
begin
ShowMessage('1');
end;

procedure TFAddYearReport.YearSpinEditCurChange(Sender: TObject);
begin
YearSpinEdit.Text:=YearSpinEdit.CurText;
end;

procedure TFAddYearReport.PlusAllBtnClick(Sender: TObject);
begin
   try
     StProcAll.StoredProcName := 'Z_PERSONIFICATION_GET_SPISOK';
     StProcAll.Transaction.StartTransaction;
     StProcAll.Prepare;
     StProcAll.ParamByName('ID_USER').AsInteger  := StrToInt(pIdUser);
     StProcAll.ParamByName('NUM_YEAR').AsInteger := StrToInt(YearSpinEdit.text);
     StProcAll.ExecProc;
     StProcAll.Transaction.Commit;
     DSet.CloseOpen(True);
   except
    on e:Exception do
     begin
      ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
      StProcAll.Transaction.Rollback;
     end;
   end;
end;

procedure TFAddYearReport.DeleteAllBtnClick(Sender: TObject);
begin
   try
     StProcAll.StoredProcName := 'Z_PERSONIFICATION_CLEAR_SPISOK';
     StProcAll.Transaction.StartTransaction;
     StProcAll.Prepare;
     StProcAll.ParamByName('ID_USER').AsInteger  := StrToInt(pIdUser);
     StProcAll.ExecProc;
     StProcAll.Transaction.Commit;
     DSet.CloseOpen(True);
   except
    on e:Exception do
     begin
      ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
      StProcAll.Transaction.Rollback;
     end;
   end;
end;

procedure TFAddYearReport.FormBtnClick(Sender: TObject);
var MR:TModalResult;
begin
 MR:=mrNone;
try
 self.Enabled:=False;
 GridDBTableView1.OptionsCustomize.ColumnSorting := False;
 GridDBTableView1.OptionsCustomize.ColumnSorting := False;
 GridDBTableView1.DataController.DataSource := nil;
 BarManager.BarByName('BarProgress').Visible := True;
 try
  StProcReport.StoredProcName := 'Z_PERSONIFICATION_REPORT_I';
  StProcReport.Transaction.StartTransaction;
  StProcReport.Prepare;
  StProcReport.ExecProc;
  Id_Report := StProcReport.ParamByName('ID').AsInteger;
  StProcReport.Transaction.Commit;

  ProgressBar.Max := DSet.RecordCount;

  DSet.First;
  StProc.StoredProcName := 'Z_PERSONIFACATION';

  while not DSet.Eof do
   begin
    ProgressBar.Position := ProgressBar.Position+1;
    Self.Update;

    StProc.Transaction.StartTransaction;
    StProc.Prepare;
    StProc.ParamByName('KOD_SETUP_B').AsInteger := PeriodToKodSetup(DSet['YEAR_SET'],DSET['MONTH_BEG']);
    StProc.ParamByName('KOD_SETUP_E').AsInteger := PeriodToKodSetup(DSet['YEAR_SET'],DSET['MONTH_END']);
    StProc.ParamByName('ID_REPORT').AsInteger   := Id_Report;
    StProc.ParamByName('TIN').AsString          := DSet['TIN'];
    StProc.ParamByName('mark_science').AsInteger:= Integer(is_science_mark.Checked);
    StProc.ExecProc;
    StProc.Transaction.Commit;
    DSet.Next;
   end;
  ReadTransaction.Commit;
  MR:=mrYes;
 except
 on E:Exception do
  begin
   ZShowMessage(Error_Caption[PLanguageIndex],varToStrDef(DSet['TIN'],'')+#13+
                                              varToStrDef(Dset['FIO'],'')+#13+
                                              e.Message,mtError,[mbOk]);
   if WriteTransaction.InTransaction then WriteTransaction.Rollback;
   If TransactionStProcReport.InTransaction then TransactionStProcReport.Rollback;
   if ReadTransaction.InTransaction then ReadTransaction.Rollback;
  end;
 end;
finally
 self.Enabled:=True;
 GridDBTableView1.OptionsCustomize.ColumnSorting := True;
 GridDBTableView1.OptionsCustomize.ColumnSorting := True;
 ModalResult:=MR;
 GridDBTableView1.DataController.DataSource := DSource;
end;
end;

end.
