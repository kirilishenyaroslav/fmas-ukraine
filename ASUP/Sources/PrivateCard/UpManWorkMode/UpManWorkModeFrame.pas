unit UpManWorkModeFrame;

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
  cxMemo, AccMgmt, uWMFillGrid, DateUtils, cxSpinEdit, Grids;

type
  TfrmManWorkMode = class(TFrame)
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
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    Panel2: TPanel;
    ManWorkModeInfo: TpFIBDataSet;
    ManWorkModeInfoSource: TDataSource;
    stContentStrike: TcxStyle;
    ActFactDaysEdit: TAction;
    WMDateBeg: TcxDateEdit;
    WMDateEnd: TcxDateEdit;
    lblWMBeg: TcxLabel;
    lblWMEnd: TcxLabel;
    ManWorkModeSelect: TpFIBDataSet;
    ManWorkModeSource: TDataSource;
    Panel1: TPanel;
    Panel4: TPanel;
    WMGridDBTableView: TcxGridDBTableView;
    WMGridLevel1: TcxGridLevel;
    WMGrid: TcxGrid;
    WMGridDBTableViewDBColumn1: TcxGridDBColumn;
    WMGridDBTableViewDBColumn2: TcxGridDBColumn;
    WMGridDBTableViewDBColumn3: TcxGridDBColumn;
    WMGridDBTableViewDBColumn4: TcxGridDBColumn;
    WMGridDBTableViewDBColumn5: TcxGridDBColumn;
    WMGridDBTableViewDBColumn6: TcxGridDBColumn;
    WMGridDBTableViewDBColumn7: TcxGridDBColumn;
    WMDataSet: TpFIBDataSet;
    NoteGridDBTableView: TcxGridDBTableView;
    NoteGridLevel: TcxGridLevel;
    NoteGrid: TcxGrid;
    NoteGridDBTableViewDBColumn1: TcxGridDBColumn;
    Panel3: TPanel;
    cbMonth: TcxComboBox;
    YearEdit: TcxSpinEdit;
    lblYear: TcxLabel;
    lblMonth: TcxLabel;
    cxSplitter1: TcxSplitter;
    lblFilter: TcxLabel;
    lblGroupBox: TcxLabel;
    LocFilterCheck: TcxCheckBox;
    cxGroupBox: TcxCheckBox;
    NYearEdit: TcxSpinEdit;
    NMonthBox: TcxComboBox;
    lblNYear: TcxLabel;
    lblNMonth: TcxLabel;
    DSetNotes: TpFIBDataSet;
    NoteDSource: TDataSource;
    NoteGridDBTableViewDBColumn2: TcxGridDBColumn;
    NoteGridDBTableViewDBColumn3: TcxGridDBColumn;
    NoteGridDBTableViewDBColumn4: TcxGridDBColumn;
    CalendarGrid: TStringGrid;
    procedure ManWMGridTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure WMDateBegPropertiesChange(Sender: TObject);
    procedure WMDateEndPropertiesChange(Sender: TObject);
    procedure LocFilterCheckPropertiesChange(Sender: TObject);
    procedure WMGridDBTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure YearEditPropertiesChange(Sender: TObject);
    procedure cxGroupBoxPropertiesChange(Sender: TObject);
    procedure cbMonthPropertiesChange(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure NMonthBoxPropertiesChange(Sender: TObject);
    procedure NYearEditPropertiesChange(Sender: TObject);
    procedure CalendarGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure NoteGridDBTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ManWorkModeSelectEndScroll(DataSet: TDataSet);
  private
      Work_Mode_Shift, DayShift, IdWorkDogMoving, IdPostMoving:Integer;
      DateBeg, DateEnd:TDate;
      IsOpen:Boolean;
      Id_Pcard:Int64;
      procedure FillcbMonth;
      procedure DrawInfoOnGrid;
      procedure GridClear;
      function GetNumberDayInWeek(InParam:Integer):Integer;
      procedure UpdInfoMainGrid;
      procedure FillDSetManGraphic;
      procedure FillDSetManNotes;
      function GetNumDayWithShift(NumCol, NumRow, ShiftIn:Integer):Integer;
  public
    constructor Create(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;
                       Id_PCard: Integer;ActualDate: TDate;
                       Select_Type, IsModify: Integer); reintroduce;

  end;

implementation

{$R *.dfm}

uses uFormControl, Registry, Clipbrd, UpKernelUnit, BaseTypes;

constructor TfrmManWorkMode.Create(AOwner: TComponent;
                                   DBHandle:TISC_DB_HANDLE;
                                   Id_PCard:Integer;
                                   ActualDate:TDate;
                                   Select_Type, IsModify:Integer);
var D,M,Y,Hour, Min, Sec, MSec :Word;
    i:Integer;
begin
    inherited Create(AOwner);
    DecodeDate(Date,Y,M,D);
    DecodeTime(Time,Hour, Min, Sec, MSec);
    self.Name:=self.Name+IntToStr(Y)+IntToStr(M)+IntToStr(D)+IntToStr(Hour)+IntToStr(Min)+IntToStr(Sec);
   { WMDateBeg.Date:=EncodeDate(YearOf(Date), 1, 1);
    WMDateEnd.Date:=EncodeDate(YearOf(Date), 12, 31);}
    YearEdit.Value:=YearOf(Date);
    NYearEdit.Value:=YearEdit.Value;
    WMDateBeg.Date:=Date;
    WMDateEnd.Date:=Date;
    DB.Handle:=DBHandle;
    FillcbMonth;
    if MonthOf(Date)-1=0 then cbMonth.ItemIndex:=0
    else cbMonth.ItemIndex:=MonthOf(Date)-1;
    NMonthBox.ItemIndex:=cbMonth.ItemIndex;
    try
      ManWorkModeSelect.SelectSQL.clear;
      ManWorkModeSelect.SelectSQL.Text:=' SELECT * FROM UP_MAN_WORK_MODE_INFO(:id_pcard, :date_beg_in, :date_end_in)';
      ManWorkModeSelect.ParamByName('id_pcard').AsInteger:=Id_PCard;
      ManWorkModeSelect.ParamByName('date_beg_in').AsDate:=WMDateBeg.Date;
      ManWorkModeSelect.ParamByName('date_end_in').AsDate:=WMDateEnd.Date;
      ManWorkModeSelect.Open;
      Self.Id_Pcard:=Id_PCard;
      WMGridDBTableView.ViewData.Expand(True);
      for i:=0 to CalendarGrid.ColCount-1 do
          CalendarGrid.Cells[i, 0]:=GetNameDayByNumber(i+1);
      IsOpen:=True;
    except on E:Exception
          do ShowMessage(e.Message);
    end;
end;

function TfrmManWorkMode.GetNumDayWithShift(NumCol, NumRow, ShiftIn:Integer):Integer;
begin
   try
      Result:=7*(NumRow-1)+(NumCol+1)-ShiftIn;
   except
       Result:=0;
   end;
end;

procedure TfrmManWorkMode.FillcbMonth;
begin
   cbMonth.Properties.Items.Add('01 - Січень');
   cbMonth.Properties.Items.Add('02 - Лютий');
   cbMonth.Properties.Items.Add('03 - Березень');
   cbMonth.Properties.Items.Add('04 - Квітень');
   cbMonth.Properties.Items.Add('05 - Травень');
   cbMonth.Properties.Items.Add('06 - Червень');
   cbMonth.Properties.Items.Add('07 - Липень');
   cbMonth.Properties.Items.Add('08 - Серпень');
   cbMonth.Properties.Items.Add('09 - Вересень');
   cbMonth.Properties.Items.Add('10 - Жовтень');
   cbMonth.Properties.Items.Add('11 - Листопад');
   cbMonth.Properties.Items.Add('12 - Грудень');

   NMonthBox.Properties.Items.Add('01 - Січень');
   NMonthBox.Properties.Items.Add('02 - Лютий');
   NMonthBox.Properties.Items.Add('03 - Березень');
   NMonthBox.Properties.Items.Add('04 - Квітень');
   NMonthBox.Properties.Items.Add('05 - Травень');
   NMonthBox.Properties.Items.Add('06 - Червень');
   NMonthBox.Properties.Items.Add('07 - Липень');
   NMonthBox.Properties.Items.Add('08 - Серпень');
   NMonthBox.Properties.Items.Add('09 - Вересень');
   NMonthBox.Properties.Items.Add('10 - Жовтень');
   NMonthBox.Properties.Items.Add('11 - Листопад');
   NMonthBox.Properties.Items.Add('12 - Грудень');
end;

procedure TfrmManWorkMode.GridClear;
var i, j:Integer;
begin
   with CalendarGrid do
   begin
       for i:=0 to ColCount-1 do
           for j:=1 to RowCount-1 do
              Cells[i, j]:='';
   end;
end;

procedure TfrmManWorkMode.FillDSetManNotes;
begin
   DSetNotes.Close;
   DSetNotes.SQLs.SelectSQL.Clear;
   DSetNotes.SQLs.SelectSQL.Text:='select distinct * '+
                                  'from UP_MAN_WORK_MODE_NOTES(:month_in, :year_in, '+
                                  ':id_work_dog_moving, :id_post_moving, '+
                                  ':period_beg, :period_end)';
   DSetNotes.ParamByName('month_in').AsInteger:=NMonthBox.ItemIndex+1;
   DSetNotes.ParamByName('year_in').AsInteger:=NYearEdit.Value;
   DSetNotes.ParamByName('id_work_dog_moving').AsInteger:=IdWorkDogMoving;
   DSetNotes.ParamByName('id_post_moving').AsInteger:=IdPostMoving;
   DSetNotes.ParamByName('period_beg').AsDate:=DateBeg;
   DSetNotes.ParamByName('period_end').AsDate:=DateEnd;
   DSetNotes.Open;
end;

procedure TfrmManWorkMode.FillDSetManGraphic;
begin
   WMDataSet.Close;
   WMDataSet.SQLs.SelectSQL.Clear;
   WMDataSet.SQLs.SelectSQL.Text:='select distinct * '+
                                  'from up_man_work_mode_graphic(:month_in, :year_in, '+
                                  ':type_id, :id_work_dog_moving, :id_post_moving, '+
                                  'null, :shift_in, :period_beg, :period_end) '+
                                  'order by date_out asc';
   WMDataSet.ParamByName('month_in').AsInteger:=cbMonth.ItemIndex+1;
   WMDataSet.ParamByName('year_in').AsInteger:=YearEdit.Value;
   WMDataSet.ParamByName('type_id').AsInteger:=1;
   WMDataSet.ParamByName('id_work_dog_moving').AsInteger:=IdWorkDogMoving;
   WMDataSet.ParamByName('id_post_moving').AsInteger:=IdPostMoving;
   //WMDataSet.ParamByName('id_work_mode').AsInteger:=Id_Work_Mode;
   WMDataSet.ParamByName('shift_in').AsInteger:=Work_Mode_Shift;
   WMDataSet.ParamByName('period_beg').AsDate:=DateBeg;
   WMDataSet.ParamByName('period_end').AsDate:=DateEnd;
   WMDataSet.Open;
end;

procedure TfrmManWorkMode.DrawInfoOnGrid;
var DayFirst, FirstDayInMonth, i, j, NumCol, NumRow, Cnt:Integer;
begin
    WMDataSet.FetchAll;
    GridClear;
    if WMDataSet.IsEmpty then Exit;
    WMDataSet.First;
    FirstDayInMonth:=GetNumberDayInWeek(DayOfWeek(EncodeDate(YearEdit.Value, cbMonth.ItemIndex+1, 1)));
    DayFirst:=DayOf(WMDataSet['Date_Out']);
    DayShift:=FirstDayInMonth;
    if DayShift=1 then DayShift:=0
    else DayShift:=DayShift-1;
    NumRow:=DayFirst div 7;
    NumCol:=DayFirst mod 7;
    if NumCol>0 then
    begin
       NumRow:=NumRow+1;
       NumCol:=NumCol+DayShift-1;
    end;
    Cnt:=1;
    with CalendarGrid do
    begin
       for j:=NumRow to RowCount-1 do
       begin
          for i:=NumCol to ColCount-1 do
          begin
             if  Cnt<=WMDataSet.RecordCount then
             begin
                Cells[i, j]:=WMDataSet['Hours_Min'];
                WMDataSet.Next;
                Inc(Cnt);
             end;
          end;
          NumCol:=0;
       end;
    end;
end;

function TfrmManWorkMode.GetNumberDayInWeek(InParam:Integer):Integer;
begin
   if InParam=1 then Result:=7
   else Result:=InParam-1;
end;

procedure TfrmManWorkMode.UpdInfoMainGrid;
begin
    ManWorkModeSelect.Close;
    ManWorkModeSelect.SelectSQL.clear;
    ManWorkModeSelect.SelectSQL.Text:=' SELECT * FROM UP_MAN_WORK_MODE_INFO(:id_pcard, :date_beg_in, :date_end_in)';
    ManWorkModeSelect.ParamByName('id_pcard').AsInteger:=self.id_pcard;
    ManWorkModeSelect.ParamByName('date_beg_in').AsDate:=WMDateBeg.Date;
    ManWorkModeSelect.ParamByName('date_end_in').AsDate:=WMDateEnd.Date;
    ManWorkModeSelect.Open;
    WMGridDBTableView.ViewData.Expand(True);
end;

procedure TfrmManWorkMode.ManWMGridTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (( Key = VK_F12) and (ssShift in Shift))
    then begin
             ShowInfo(ManWorkModeSelect);
    end;
end;

procedure TfrmManWorkMode.WMDateBegPropertiesChange(Sender: TObject);
begin
   if Length(WMDateBeg.EditText)=10 then WMDateBeg.Date:=StrToDate(WMDateBeg.EditText);
   If IsOpen then UpdInfoMainGrid;
end;

procedure TfrmManWorkMode.WMDateEndPropertiesChange(Sender: TObject);
begin
   if Length(WMDateEnd.EditText)=10 then WMDateEnd.Date:=StrToDate(WMDateEnd.EditText);
   If IsOpen then UpdInfoMainGrid;
end;

procedure TfrmManWorkMode.LocFilterCheckPropertiesChange(Sender: TObject);
var I:Integer;
begin
     for i:=0 to WMGridDBTableView.ColumnCount-1 do
     begin
          WMGridDBTableView.Columns[i].Options.Filtering:=LocFilterCheck.Checked;
     end;
end;

procedure TfrmManWorkMode.WMGridDBTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if ((ManWorkModeSelect.RecordCount>0) And (Key = VK_F12) and (ssShift in Shift))
     then begin
               ShowInfo(ManWorkModeSelect);
     end;
end;

procedure TfrmManWorkMode.YearEditPropertiesChange(Sender: TObject);
begin
   if not ManWorkModeSelect.Active Then Exit;
   if Length(YearEdit.EditText)>4 then YearEdit.Properties.ReadOnly:=True
   else YearEdit.Properties.ReadOnly:=False;
   If (not ManWorkModeSelect.IsEmpty) then
   begin
      FillDSetManGraphic;
      DrawInfoOnGrid;
   end
   else GridClear;
end;

procedure TfrmManWorkMode.cxGroupBoxPropertiesChange(Sender: TObject);
begin
   WMGridDBTableView.OptionsView.GroupByBox:=cxGroupBox.Checked;
end;

procedure TfrmManWorkMode.cbMonthPropertiesChange(Sender: TObject);
begin
   if not ManWorkModeSelect.Active Then Exit;
   If (not ManWorkModeSelect.IsEmpty) then
   begin
      FillDSetManGraphic;
      DrawInfoOnGrid;
   end
   else GridClear;
end;

procedure TfrmManWorkMode.FrameResize(Sender: TObject);
begin
    lblNMonth.Left:=461;
    NMonthBox.Left:=511;
    lblNYear.Left:=639;
    NYearEdit.Left:=664;
end;

procedure TfrmManWorkMode.NMonthBoxPropertiesChange(Sender: TObject);
begin
   if not ManWorkModeSelect.Active Then Exit;
   if ((IdWorkDogMoving<>-1) and (IdWorkDogMoving<>0)) then
   FillDSetManNotes;
end;

procedure TfrmManWorkMode.NYearEditPropertiesChange(Sender: TObject);
begin
   if not ManWorkModeSelect.Active Then Exit;
   if ((IdWorkDogMoving<>-1) and (IdWorkDogMoving<>0)) then
   FillDSetManNotes;
end;

procedure TfrmManWorkMode.CalendarGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var str:String;
    ColH, ColW:Integer;
begin
  ColW:=CalendarGrid.ColWidths[ACol];
  ColH:=CalendarGrid.RowHeights[ARow];
  if ((ACol>=0) and (ARow=0)) then
  begin
     with CalendarGrid.Canvas do
     begin
         str:=CalendarGrid.Cells[ACol,ARow];
         FillRect(Rect); 
         Pen.Color:=clBlack;
         TextOut(Rect.Left+25, Rect.Top+5, str);
     end;
  end;
  if ((CalendarGrid.Cells[ACol,ARow]<>'') and (ARow>0)) then
  begin
     str:=CalendarGrid.Cells[ACol,ARow];
     if str='0:00' then str:='В';
     with CalendarGrid.Canvas do
     begin
        {if WMDataSet.RecordFieldValue(WMDataSet.Fields[3], 0)='T'
        then Brush.Color:=$00BDA0FA
        else Brush.Color:=$00D2FFFF;}
        FillRect(Rect);
        Pen.Color:=clGreen;
        MoveTo(Rect.Left, Rect.Top+ColH);
        LineTo(Rect.Left+ColW, Rect.Top);
        Font.Style:=[fsBold];
        if WMDataSet.RecordFieldValue(WMDataSet.Fields[3], GetNumDayWithShift(ACol, ARow, DayShift)-1)='T'
        then Font.Color:=clRed
        else Font.Color:=clBlack;
        TextOut(Rect.Left+10, Rect.Top+2, IntToStr(GetNumDayWithShift(ACol, ARow, DayShift)));
        TextOut(Rect.Left+Round((ColW/2))+5, Rect.Top+Round(ColH/2)-1, str);
     end;
  end;
end;

procedure TfrmManWorkMode.NoteGridDBTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if ((DSetNotes.RecordCount>0) And (Key = VK_F12) and (ssShift in Shift))
     then begin
               ShowInfo(DSetNotes);
     end;
end;

procedure TfrmManWorkMode.ManWorkModeSelectEndScroll(DataSet: TDataSet);
begin
   if not ManWorkModeSelect.IsEmpty then
   begin
      Work_Mode_Shift:=ManWorkModeSelect['Work_Mode_Shift'];
      DateBeg:=ManWorkModeSelect['Date_Beg'];
      DateEnd:=ManWorkModeSelect['Date_End'];
      IdWorkDogMoving:=ManWorkModeSelect['Id_Work_Dog_Moving'];
      IdPostMoving:=ManWorkModeSelect['Id_Post_Moving'];
      FillDSetManGraphic;
      DrawInfoOnGrid;
      FillDSetManNotes;
   end
   else GridClear;
end;

end.
