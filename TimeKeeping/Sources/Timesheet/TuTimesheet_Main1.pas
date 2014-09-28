unit TuTimesheet_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,iBase, dxBar, dxBarExtItems, cxGraphics, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit,
  cxCheckBox, cxButtonEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ComCtrls, cxLabel,
  cxSpinEdit, cxContainer, cxMaskEdit, cxDropDownEdit, cxCalendar,
  ExtCtrls, dxStatusBar, cxGroupBox,TuCommonProc,Dates,TuCommonLoader,
  cxGridDBTableView,TuCommonStyles, TuTimesheet_Edit,TuCommonTypes,
  TUCommonConsts,ZcxLocateBar,TuMessages;

type
  TFormTimesheet_Main = class(TForm)
    BarManager: TdxBarManager;
    ButtonRefresh: TdxBarLargeButton;
    ButtonExit: TdxBarLargeButton;
    ButtonInsert: TdxBarLargeButton;
    ButtonDelete: TdxBarLargeButton;
    ButtonUpdate: TdxBarLargeButton;
    Panel1: TPanel;
    Panel2: TPanel;
    GridTempletOrPeriod: TcxGrid;
    GridTempletOrPeriodDBTableView1: TcxGridDBTableView;
    GridTempletOrPeriodDBTableView1DBColumn1: TcxGridDBColumn;
    GridTempletOrPeriodLevel1: TcxGridLevel;
    GridPeriodType: TcxGrid;
    GridPeriodTypeDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    StatusBar2: TdxStatusBar;
    StatusBar3: TdxStatusBar;
    StatusBar5: TdxStatusBar;
    StatusBar4: TdxStatusBar;
    GridPeriodTypeDBTableView1DBColumn2: TcxGridDBColumn;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    ButtonSigned: TdxBarLargeButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    GridHeader: TcxGrid;
    GridHeaderBandedTableView1: TcxGridBandedTableView;
    GridColTN: TcxGridBandedColumn;
    GridColFio: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn3: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn5: TcxGridBandedColumn;
    Col1: TcxGridBandedColumn;
    Col2: TcxGridBandedColumn;
    Col30: TcxGridBandedColumn;
    Col3: TcxGridBandedColumn;
    Col4: TcxGridBandedColumn;
    Col5: TcxGridBandedColumn;
    Col6: TcxGridBandedColumn;
    Col7: TcxGridBandedColumn;
    Col8: TcxGridBandedColumn;
    Col9: TcxGridBandedColumn;
    Col10: TcxGridBandedColumn;
    Col11: TcxGridBandedColumn;
    Col12: TcxGridBandedColumn;
    Col15: TcxGridBandedColumn;
    ColX: TcxGridBandedColumn;
    Col17: TcxGridBandedColumn;
    Col20: TcxGridBandedColumn;
    Col21: TcxGridBandedColumn;
    Col19: TcxGridBandedColumn;
    Col18: TcxGridBandedColumn;
    Col31: TcxGridBandedColumn;
    Col29: TcxGridBandedColumn;
    Col16: TcxGridBandedColumn;
    Col14: TcxGridBandedColumn;
    Col13: TcxGridBandedColumn;
    Col23: TcxGridBandedColumn;
    Col24: TcxGridBandedColumn;
    Col26: TcxGridBandedColumn;
    Col27: TcxGridBandedColumn;
    Col25: TcxGridBandedColumn;
    Col22: TcxGridBandedColumn;
    Col28: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn38: TcxGridBandedColumn;
    ColSexH: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn39: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn40: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn41: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn42: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn43: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn44: TcxGridBandedColumn;
    GridHeaderBandedTableView1BandedColumn45: TcxGridBandedColumn;
    GridThDBBandedTableView1: TcxGridDBBandedTableView;
    ColNum: TcxGridDBBandedColumn;
    GridHeaderLevel1: TcxGridLevel;
    GridTh: TcxGrid;
    GridThLevel1: TcxGridLevel;
    ButtonRedeFined: TdxBarLargeButton;
    Styles: TcxStyleRepository;
    cxStyle31: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    StatusBar1: TdxStatusBar;
    StatusBar6: TdxStatusBar;
    StatusBar7: TdxStatusBar;
    StyleOutPut: TcxStyle;
    StyleHoliday: TcxStyle;
    StyleSimple: TcxStyle;
    StyleSimple1: TcxStyle;
    ButtonPrint: TdxBarLargeButton;
    BarDockLocate: TdxBarDockControl;
    cxGrid1: TcxGrid;
    cxGridLevel2: TcxGridLevel;
    GridThDBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    GridThDBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    GridThDBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    GridThDBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    GridThDBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    GridThDBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    GridThDBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    GridThDBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn;
    GridThDBBandedTableView1DBBandedColumn9: TcxGridDBBandedColumn;
    GridThDBBandedTableView1DBBandedColumn10: TcxGridDBBandedColumn;
    GridThDBBandedTableView1DBBandedColumn11: TcxGridDBBandedColumn;
    GridThDBBandedTableView1DBBandedColumn12: TcxGridDBBandedColumn;
    GridThDBBandedTableView1DBBandedColumn13: TcxGridDBBandedColumn;
    GridThDBBandedTableView1DBBandedColumn14: TcxGridDBBandedColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditTempletPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonInsertClick(Sender: TObject);
    procedure ButtonRefreshClick(Sender: TObject);
    procedure ButtonSignedClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ButtonRedeFinedClick(Sender: TObject);
    procedure GridThDBBandedTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure GridPeriodTypeDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ColDXGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure GridThDBBandedTableView1FocusedItemChanged(
      Sender: TcxCustomGridTableView; APrevFocusedItem,
      AFocusedItem: TcxCustomGridTableItem);
    procedure GridThDBBandedTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridHeaderBandedTableView1StylesGetHeaderStyle(
      Sender: TcxGridTableView; AColumn: TcxGridColumn;
      out AStyle: TcxStyle);
    procedure ButtonPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    FKodSetup:integer;
    FCanvasCircl:TRect;
    FFormStyle:TtuFormStyleTh;
    FID:variant;
    FIdPostMoving:variant;
    FTypeId: integer;
    pStylesDM:TStyleDM;
    FNameFull:string;

    PBarLocate:TZBarLocate;
    constructor Create(Aowner:TComponent;PKodSetup:integer; tuFormStyleTh: TtuFormStyleTh;PID:variant; PTypeId:integer; PIdPostMoving:variant; PNameFull:string);reintroduce;
    procedure IsActiveButton;
    procedure IsTimesheetInfo(NumCol:integer);
 end;

 var     Month:word;
         Year:word;

implementation

uses TuTimesheet_DM, FIBQuery, pFIBStoredProc, pFIBQuery,
  cxDBLookupComboBox;

constructor TFormTimesheet_Main.Create(Aowner:TComponent;PKodSetup:integer; tuFormStyleTh: TtuFormStyleTh;PID:variant;PTypeId:integer; PIdPostMoving:variant;PNameFull:string);
var DateLoc:TDate ;
    day:word;

begin
  DateLoc:=strtodate(KodSetupToPeriod(PKodSetup,6));
  DecodeDate(DateLoc, Year, Month,day );
  DM.DSetCalendar.SelectSQL.Text:='SELECT * FROM GET_CALENDAR('+IntToStr(Year)+','+IntToStr(Month)+') where HOLIDAY=''T''';
  DM.DSetCalendar.open;


  inherited Create(Aowner);
  FkodSetup:=PKodSetup;
  FFormStyle:=tuFormStyleTh;
  FID:=PID;
  FIdPostMoving:=PIdPostMoving;
  FTypeId:=PTypeId;
  FNameFull:=PNameFull;
  ButtonRefreshClick(self);
//******************************************************************************
  pStylesDM:=TStyleDM.Create(Self);
  GridThDBBandedTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
  GridPeriodTypeDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
  GridTempletOrPeriodDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
  GridHeaderBandedTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  GridTempletOrPeriodDBTableView1.DataController.DataSource:=Dm.DSourceTempletOrPeriod;
  GridPeriodTypeDBTableView1.DataController.DataSource:=Dm.DSourcePeriodType;
  GridThDBBandedTableView1.DataController.DataSource:=Dm.DSourceTimeSheet;
//******************************************************************************
 PBarLocate:=TZBarLocate.Create(BarManager);
 PBarLocate.DataSet := DM.DSetTimeSheet;
 PBarLocate.BorderStyle := bbsNone;
 PBarLocate.AddLocateItem('FIO',GridColFio.Caption,[loCaseInsensitive,loPartialKey]);
 PBarLocate.AddLocateItem('TN',GridColTN.Caption,[loCaseInsensitive,loPartialKey]);
 PBarLocate.DigitalField := 'TN';
 PBarLocate.FieldSelectVisible := False;
 PBarLocate.DockControl := BarDockLocate;
//******************************************************************************

end;
{$R *.dfm}

procedure TFormTimesheet_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if dm.TransactionR.Active then  Dm.TransactionR.Commit;
 if dm.TransactionW.Active then  Dm.TransactionW.Commit;
 Action:=caFree;
end;

procedure TFormTimesheet_Main.EditTempletPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var PKodSetup, M, Y,D:word;
begin

end;

procedure TFormTimesheet_Main.ButtonInsertClick(Sender: TObject);
var Form : TFormEditTsh;
    dateBeg, DateEnd:Tdate;
begin
  Form:=TFormEditTsh.create(self, FKodSetup);
  if FFormStyle=tfsWork then
  begin
    Form.EditMonth.Enabled:=false;
    Form.EditYear.Enabled:=false;
  end;
  if dm.DSetTempletOrPeriod.RecordCount=0 then
  begin
    Form.FID:=Fid;
    Form.FTypeID:=FTypeId;
    Form.FIdPostMoving:=FIdPostMoving;
  end
  else
  begin
    Form.FID:=dm.DSetTempletOrPeriod['ID'];
    Form.FTypeID:=dm.DSetTempletOrPeriod['TYPE_ID'];
    Form.FIdPostMoving:=dm.DSetTempletOrPeriod['ID_POST_MOVING'];
  end;
  case FTypeId of
    1:Form.RadioButtonTemplet.Checked:=true;
    2:Form.RadioButtonDog.Checked:=true;
  end;
  if FTypeId<>3 then
  begin
    Form.EditTemOrDog.Enabled:=false;
    Form.RadioButtonTemplet.Enabled:=false;
    Form.RadioButtonDog.Enabled:=false;
    Form.EditTemOrDog.Text:=FNameFull;
  end;
  if Form.ShowModal= mrYes then
  begin
    DateBeg:=EncodeDate(Form.EditYear.Value, Form.EditMonth.ItemIndex+1, Form.Editfrom.value);
    DateEnd:=EncodeDate(Form.EditYear.Value, Form.EditMonth.ItemIndex+1, Form.EditTo.value);
    with DM.StProc do
    begin
      Transaction.StartTransaction;
      StoredProcName:='TU_TIMESHEET_IS_FORM';
      Prepare;
      ParamByName('ID').AsInteger:=Form.FID;
      ParamByName('ID_POST_MOVING_IN').Asvariant:=Form.FIdPostMoving;
      ParamByName('DATE_BEG_IN').asdate:=DateBeg;
      ParamByName('DATE_END_IN').asdate:=DateEnd;
      ParamByName('ID_TIMESHEET_TYPE').asinteger:=Form.EditTypeTsh.EditValue;
      ParamByName('TYPE_ID').AsInteger:=Form.FTypeID;
      ExecProc;
      Transaction.commit;
      ButtonRefreshClick(Sender);
    end;
  end;
  Form.Free;
end;

procedure TFormTimesheet_Main.ButtonRefreshClick(Sender: TObject);
begin
with DM do
 begin
  DSetTempletOrPeriod.close;
  DSetPeriodType.Close;
  DSetTimeSheet.close;
  DSetTempletOrPeriod.SelectSQL.Text:='select * from TU_TIMESHEET_TEMPLETE_S('+inttostr(FKodSetup)+','
                                                                              +inttostr(FTypeId)+','
                                                                              +VarToStrDef(FID, 'Null')+','
                                                                              +VarToStrDef(FIdPostMoving, 'Null')+')';
  DSetPeriodType.SelectSQL.Text:='select * from  TU_TIMESHEET_TYPE_S(?ID,?TYPE_ID,'+inttostr(FKodSetup)+',?ID_POST_MOVING)';
  DSetTimeSheet.SelectSQL.Text:='select * from  TU_TIMESHEET_S(?ID_TSH_GROUP)';

  DSetTempletOrPeriod.open;
  DSetPeriodType.open;
  DSetTimeSheet.open;
  IsActiveButton;
 end;
end;

procedure TFormTimesheet_Main.ButtonSignedClick(Sender: TObject);
begin
    with DM.StProc do
    begin
      Transaction.StartTransaction;
      StoredProcName:='TU_TIMESHEET_SIGN';
      Prepare;
      ParamByName('ID_TSH_GROUP').AsInteger:=DM.DSetPeriodType['ID_TSH_GROUP'];
      ExecProc;
      Transaction.commit;
      ButtonRefreshClick(Sender);
    end;
end;

procedure TFormTimesheet_Main.ButtonExitClick(Sender: TObject);
begin
Close
end;

procedure TFormTimesheet_Main.ButtonDeleteClick(Sender: TObject);
begin
 if TuShowMessage('Увага', 'Ви дійсно бажаєте видалити?', mtInformation, mbOKCancel)=mrOk then
  with DM.StProc do
  begin
    Transaction.StartTransaction;
    StoredProcName:='TU_TIMESHEET_D';
    Prepare;
    ParamByName('ID_TSH_GROUP').AsInteger:=DM.DSetPeriodType['ID_TSH_GROUP'];
    ExecProc;
    Transaction.commit;
    ButtonRefreshClick(Sender);
  end;

end;

procedure TFormTimesheet_Main.ButtonRedeFinedClick(Sender: TObject);
begin
  with DM.StProc do
  begin
    Transaction.StartTransaction;
    StoredProcName:='TU_TIMESHEET_D';
    Prepare;
    ParamByName('ID_TSH_GROUP').AsInteger:=DM.DSetPeriodType['ID_TSH_GROUP'];
    ExecProc;
    Transaction.commit;
  end;
  with DM.StProc do
  begin
    Transaction.StartTransaction;
    StoredProcName:='TU_TIMESHEET_IS_FORM';
    Prepare;
    ParamByName('ID').AsInteger:=DM.DSetTempletOrPeriod['ID'] ;
    ParamByName('ID_POST_MOVING_IN').AsVariant:=DM.DSetTempletOrPeriod['ID_POST_MOVING'] ;
    ParamByName('DATE_BEG_IN').asdate:=DM.DSetPeriodType['DATE_BEG'];
    ParamByName('DATE_END_IN').asdate:=DM.DSetPeriodType['DATE_END'];
    ParamByName('ID_TIMESHEET_TYPE').asinteger:=DM.DSetPeriodType['ID_TIMESHEET_TYPE'];
    ParamByName('TYPE_ID').AsInteger:=DM.DSetTempletOrPeriod['TYPE_ID'] ;
    ExecProc;
    Transaction.commit;
  end;
  DM.DSetPeriodType.CloseOpen(true);
  DM.DSetTimeSheet.CloseOpen(true);
end;

procedure TFormTimesheet_Main.GridThDBBandedTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
if FTypeId=2 then
if( strtoint(ARecord.DisplayTexts[74])=FId) and( strtoint(ARecord.DisplayTexts[75])=FIdPostMoving) then
 AStyle:=cxStyle31
else  AStyle:=pStylesDM.cxStyle2;
end;

procedure TFormTimesheet_Main.IsActiveButton;
begin
if (FFormStyle=tfsPast) then
 ButtonInsert.Enabled:=false
else
 ButtonInsert.Enabled:=true;
end;

procedure TFormTimesheet_Main.GridPeriodTypeDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (dm.DSetPeriodType.RecordCount>0) and
   (FFormStyle<>tfsPast) and
   (dm.DSetPeriodType['SIGNED']=0) then
begin
  ButtonSigned.Enabled:=true;
  ButtonRedeFined.Enabled:=true;
  ButtonDelete.Enabled:=true;
end
else
begin
  ButtonSigned.Enabled:=false;
  ButtonRedeFined.Enabled:=false;
  ButtonDelete.Enabled:=false;
end;

end;

procedure TFormTimesheet_Main.ColDXGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
AText:='X';
end;

procedure TFormTimesheet_Main.GridThDBBandedTableView1FocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);

begin
if strtoint(AFocusedItem.caption)=0 then
 IsTimesheetInfo(strtoint(AFocusedItem.caption))
else
begin
 IsTimesheetInfo(strtoint(AFocusedItem.caption)-1);
//  GridHeaderBandedTableView1.Columns[1].
end;
 GridHeaderBandedTableView1.Columns[4].Styles.Content:=cxStyle31;


end;

procedure TFormTimesheet_Main.GridThDBBandedTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 IsTimesheetInfo(0);
end;

procedure TFormTimesheet_Main.IsTimesheetInfo(NumCol: integer);
begin
    with DM.StProc do
    begin
      Transaction.StartTransaction;
      StoredProcName:='TU_TIMESHEET_INFO';
      Prepare;
      ParamByName('ID_timesheet').AsInteger:=DM.DSetTimeSheet['ID_timesheet'];
      ParamByName('DATE_ACT').AsDate:= DM.DSetTimeSheet['DATE_BEG']+NumCol;
      ExecProc;
      StatusBar1.Panels[0].Text:='Подразделение: '+ ParamByName('DEP_NAME').asstring;
      StatusBar2.Panels[0].Text:='Должность: '+ ParamByName('POST_NAME').asstring;
      StatusBar3.Panels[0].Text:='Ставка: '+ ParamByName('STAVKA').asstring;
      StatusBar4.Panels[0].Text:='Дата рождения: '+ ParamByName('BIRTH_DAY').asstring;
      StatusBar5.Panels[0].Text:='Тип выхода: '+ ParamByName('Type_work').asstring;
      StatusBar6.Panels[0].Text:='Режим работи: '+ ParamByName('wm_name').asstring;

      StatusBar1.Panels[5].Text:=DM.DSetTimeSheet['DATE_BEG']+NumCol;
      StatusBar3.Panels[8].Text:=ParamByName('wm_work_beg').asstring;
      StatusBar3.Panels[9].Text:=ParamByName('work_beg').asstring;
      StatusBar4.Panels[8].Text:=ParamByName('wm_work_end').asstring;
      StatusBar4.Panels[9].Text:=ParamByName('work_end').asstring;
      StatusBar5.Panels[8].Text:=ParamByName('wm_work_hour').asstring;
      StatusBar5.Panels[9].Text:=ParamByName('work_hour').asstring;
      StatusBar6.Panels[8].Text:=ParamByName('wm_night_hour').asstring;
      StatusBar6.Panels[9].Text:=ParamByName('night_hour').asstring;

      StatusBar3.Panels[3].Text:=ParamByName('wm_all_day').asstring;
      StatusBar3.Panels[4].Text:=ParamByName('all_day').asstring;
      StatusBar3.Panels[5].Text:=ParamByName('wm_all_hour').asstring;
      StatusBar3.Panels[6].Text:=ParamByName('all_hour').asstring;
      StatusBar4.Panels[3].Text:=ParamByName('wm_all_hol_day').asstring;
      StatusBar4.Panels[4].Text:=ParamByName('all_hol_day').asstring;
      StatusBar4.Panels[5].Text:=ParamByName('wm_all_hol_hour').asstring;
      StatusBar4.Panels[6].Text:=ParamByName('all_hol_hour').asstring;
      StatusBar5.Panels[3].Text:=ParamByName('wm_all_night_day').asstring;
      StatusBar5.Panels[4].Text:=ParamByName('all_night_day').asstring;
      StatusBar5.Panels[5].Text:=ParamByName('wm_all_night_hour').asstring;
      StatusBar5.Panels[6].Text:=ParamByName('all_night_hour').asstring;
      StatusBar6.Panels[3].Text:=ParamByName('wm_all_Night_hol_day').asstring;
      StatusBar6.Panels[4].Text:=ParamByName('all_Night_hol_day').asstring;
      StatusBar6.Panels[5].Text:=ParamByName('wm_all_Night_hol_hour').asstring;
      StatusBar6.Panels[6].Text:=ParamByName('all_Night_hol_hour').asstring;
    //  StatusBar7.Panels[3].Text:=ParamByName('').asstring;
    //  StatusBar7.Panels[4].Text:=ParamByName('').asstring;
    //  StatusBar7.Panels[5].Text:=ParamByName('').asstring;
    //  StatusBar7.Panels[6].Text:=ParamByName('').asstring;

      Transaction.commit;
    end;
end;

procedure TFormTimesheet_Main.GridHeaderBandedTableView1StylesGetHeaderStyle(
  Sender: TcxGridTableView; AColumn: TcxGridColumn; out AStyle: TcxStyle);
  var j:integer;
begin
  if  (AColumn<>nil) and (strtointdef(AColumn.Caption, 0)>0)then
  begin
   if dm.DsetCalendar.Locate('TBL_DAY',AColumn.Caption,[]) then
      AStyle:=StyleHoliday
   else
     AStyle:= StyleSimple ;
   j := DayOfWeek(EncodeDate(Year, Month,strtoint(AColumn.Caption)));
   dec(j);
   if j = 0 then j := 7;
   case j of
     6: begin  AStyle:=StyleOutPut  end;
     7: begin  AStyle:=StyleOutPut end;
   end;

  end;
  if (AColumn<>nil) and( AColumn.Caption='X')then  AStyle:= StyleSimple ;
end;

procedure TFormTimesheet_Main.ButtonPrintClick(Sender: TObject);
begin
  Dm.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReports+'PrintTimeSheet.fr3',True);
 // if TuDesignReport then
   DM.Report.DesignReport
 // else DM.Report.ShowReport;
end;

end.
  j := DayOfWeek(EncodeDate(FYear, FMonth, ));

  if j = 0 then j := 7;

 DaysGrid.Cells[0, 0] := 'пн';
  DaysGrid.Cells[1, 0] := 'вт';
  DaysGrid.Cells[2, 0] := 'ср';
  DaysGrid.Cells[3, 0] := 'чт';
  DaysGrid.Cells[4, 0] := 'пт';
  DaysGrid.Cells[5, 0] := 'сб';
  DaysGrid.Cells[6, 0] := 'нд';
