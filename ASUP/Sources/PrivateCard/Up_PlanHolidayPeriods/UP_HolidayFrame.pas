unit UP_HolidayFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid,  cxContainer, cxLabel,
  cxDBLabel, ExtCtrls, Buttons, cxCalendar, cxTL, pFibStoredProc,
  cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit, cxCurrencyEdit,
  cxCheckBox, ActnList, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  Ibase, cxTextEdit, cxDropDownEdit, uFControl, uLabeledFControl,
  uDateControl, cxDBEdit, cxSplitter, cxLookAndFeelPainters, cxButtons,
  cxMemo, AccMgmt;

type
  TfrPCardHolidaysPage = class(TFrame)
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    ActionList1: TActionList;
    BonusesAct: TAction;
    DB: TpFIBDatabase;
    HolidaysSelect: TpFIBDataSet;
    PlanTreeSource: TDataSource;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    HolidaysGrid: TcxGrid;
    PlanHolidayDataView: TcxGridDBTableView;
    Col0: TcxGridDBColumn;
    Col4: TcxGridDBColumn;
    Col5: TcxGridDBColumn;
    Col6: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    Col1: TcxGridDBColumn;
    Panel2: TPanel;
    cxCB_ShowOld: TcxCheckBox;
    OrderDataSet: TpFIBDataSet;
    OrdersDataSource: TDataSource;
    cxCheckBox2: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    Col7: TcxGridDBColumn;
    Col2: TcxGridDBColumn;
    Col3: TcxGridDBColumn;
    cxGrid1: TcxGrid;
    OView: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    day_count: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    Col8: TcxGridDBColumn;
    Col9: TcxGridDBColumn;
    OViewDBColumn1: TcxGridDBColumn;
    OViewDBColumn2: TcxGridDBColumn;
    stContentStrike: TcxStyle;
    PlanHolidayDataViewDBColumn1: TcxGridDBColumn;
    OViewDBColumn3: TcxGridDBColumn;
    Panel3: TPanel;
    cxDBMemo1: TcxDBMemo;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    OViewDBColumn4: TcxGridDBColumn;
    OViewDBColumn5: TcxGridDBColumn;
    OViewDBColumn6: TcxGridDBColumn;
    ActFactDaysEdit: TAction;
    Label2: TLabel;
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
    procedure cxCheckBox3PropertiesChange(Sender: TObject);
    procedure cxCB_ShowOldPropertiesChange(Sender: TObject);
    procedure PlanHolidayDataViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton1Click(Sender: TObject);
    procedure ActFactDaysEditExecute(Sender: TObject);
    procedure Label2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
  public
    id_pcard:int64;
    procedure MovingsSelectAfterOpen(DataSet: TDataSet);
    constructor Create(AOwner: TComponent;DBHandle:TISC_DB_HANDLE;Id_PCard: Integer; ActualDate: TDate; Select_Type: Integer;Is_modify:Integer); reintroduce;
  end;

implementation

{$R *.dfm}

uses uFormControl, Registry, Clipbrd, UpKernelUnit,  UEditPlan, BaseTypes;

constructor TfrPCardHolidaysPage.Create(AOwner: TComponent;
                                       DBHandle:TISC_DB_HANDLE;
                                       Id_PCard:Integer;
                                       ActualDate:TDate;
                                       Select_Type: Integer;
                                       Is_modify:Integer);
var D,M,Y,Hour, Min, Sec, MSec :Word;
begin
    inherited Create(AOwner);
    DecodeDate(Date,Y,M,D);
    DecodeTime(Time,Hour, Min, Sec, MSec);
    self.Name:=self.Name+IntToStr(Y)+IntToStr(M)+IntToStr(D)+IntToStr(Hour)+IntToStr(Min)+IntToStr(Sec);


    DB.Handle:=DBHandle;

    ReadTransaction.StartTransaction;

    HolidaysSelect.SelectSQL.Text:=' SELECT * FROM UP_KER_GET_HOLIDAYS_BY_PCARD('+IntToStr(id_pcard)+','+IntToStr(Integer(not cxCB_ShowOld.Checked))+')';

    self.id_pcard:=Id_PCard;

    OrderDataSet.SelectSQL.Text:='SELECT * FROM UP_KER_GET_HOLIDAY_ORDER(?ID_WORK_DOG_MOVING, ?ID_HOLIDAY_PERIOD, ?ID_TYPE_HOLIDAY)';

    HolidaysSelect.Open;

    //if Is_modify=0
    //then begin
    //          Panel1.Visible:=false;
    //end;


    PlanHolidayDataView.ViewData.Expand(true);
end;



procedure TfrPCardHolidaysPage.MovingsSelectAfterOpen(DataSet: TDataSet);
begin
end;

procedure TfrPCardHolidaysPage.cxCheckBox2PropertiesChange(Sender: TObject);
var I:Integer;
begin
     for i:=0 to PlanHolidayDataView.ColumnCount-1 do
     begin
          PlanHolidayDataView.Columns[i].Options.Filtering:=cxCheckBox2.Checked;
     end;
end;

procedure TfrPCardHolidaysPage.cxCheckBox3PropertiesChange(Sender: TObject);
begin
     PlanHolidayDataView.OptionsView.GroupByBox:=cxCheckBox3.Checked;
end;

procedure TfrPCardHolidaysPage.cxCB_ShowOldPropertiesChange(
  Sender: TObject);
begin
     if HolidaysSelect.Active
     then HolidaysSelect.Close;

     HolidaysSelect.SelectSQL.Text:=' SELECT * FROM UP_KER_GET_HOLIDAYS_BY_PCARD('+IntToStr(id_pcard)+','+IntToStr(Integer(not cxCB_ShowOld.Checked))+')';

     HolidaysSelect.Open;

     PlanHolidayDataView.ViewData.Expand(true);
end;

procedure TfrPCardHolidaysPage.PlanHolidayDataViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (( Key = VK_F12) and (ssShift in Shift))
     then begin
               ShowInfo(HolidaysSelect);
     end;

     if ((Key = VK_F11) and (ssShift in Shift)) then
     begin

     end;

end;

procedure TfrPCardHolidaysPage.OViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if ((Key = VK_F12) and (ssShift in Shift))
     then begin
               ShowInfo(OrderDataSet);
     end;
end;

procedure TfrPCardHolidaysPage.cxButton1Click(Sender: TObject);
var T:TfrmEditPlan;
    InsertSP:TpFibStoredProc;
    new_id:int64;
begin
     T:=TfrmEditPlan.Create(self);
     if T.ShowModal=mrYes
     then begin
               InsertSP:=TpFibStoredProc.Create(self);
               InsertSP.Database:=DB;
               InsertSP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               InsertSP.StoredProcName:='HL_DT_MAN_HOLIDAY_PLAN_INS';
               InsertSP.Prepare;
               InsertSP.ParamByName('ID_TYPE_HOLIDAY').Value     :=T.HolidayType.Value;
               InsertSP.ParamByName('ID_HOLIDAY_PERIOD').asInt64 :=T.id_holiday_period;
               InsertSP.ParamByName('ID_WORK_DOG_MOVING').asInt64:=T.id_work_dog;
               InsertSP.ParamByName('PERIOD_BEG').Value          :=T.period_beg;
               InsertSP.ParamByName('PERIOD_END').Value          :=T.period_end;
               InsertSP.ParamByName('DAYS_COUNT').Value          :=T.DAYS_COUNT.Value;
               InsertSP.ParamByName('USED_DAYS_COUNT').Value     :=T.USED_DAYS_COUNT.Value;
               InsertSP.ParamByName('CAN_DELETE').Value          :=1;
               InsertSP.ParamByName('NOTE').Value                :=T.Note.Value;
               InsertSP.ExecProc;
               new_id:=InsertSP.ParamByName('ID_MAN_HOLIDAY_PLAN_OUT').AsInt64;
               WriteTransaction.Commit;
               InsertSP.Free;
               HolidaysSelect.CloseOpen(true);
               HolidaysSelect.Locate('ID_MAN_HOLIDAY_PLAN',new_id,[]);
               PlanHolidayDataView.ViewData.Expand(true);
     end;
     T.Free;
end;

procedure TfrPCardHolidaysPage.ActFactDaysEditExecute(Sender: TObject);
var UpdateSP:TpFibStoredProc;
    id:Int64;
begin
   if HolidaysSelect.RecordCount>0 then
   begin
      if agMessageDlg('Увага!','Ви хочете змінити показник фактичного виконання?',mtConfirmation,[mbYes,mbNo])=mrYes
      then begin
              UpdateSP:=TpFibStoredProc.Create(self);
              UpdateSP.Database:=DB;
              UpdateSP.Transaction:=WriteTransaction;
              WriteTransaction.StartTransaction;
              UpdateSP.StoredProcName:='UP_KER_HP_CHANGE';
              UpdateSP.Prepare;
              UpdateSP.ParamByName('USED_DAY_COUNT').Value       :=InputBox('Увага!','Введіть нове значення фактичного виконання:','0');
              id:=StrToInt64(HolidaysSelect.FieldByName('ID_MAN_HOLIDAY_PLAN').asString);
              UpdateSP.ParamByName('ID_MAN_HOLIDAY_PLAN').asInt64:=id;
              UpdateSP.ExecProc;
              WriteTransaction.Commit;
              UpdateSP.Close;
              UpdateSP.Free;
              HolidaysSelect.Close;
              HolidaysSelect.Open;
              HolidaysSelect.Locate('ID_MAN_HOLIDAY_PLAN',id,[]);
              PlanHolidayDataView.ViewData.Expand(true);
      end;
   end;
end;

procedure TfrPCardHolidaysPage.Label2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    if (ssCtrl in Shift) and (ssAlt in Shift) and (ssShift in Shift)
        and (ssRight in Shift) and (ssLeft in Shift) then
    begin
        ActFactDaysEditExecute(Self);
    end;
end;

end.
