
{ -$Id: Calendar_Form.pas,v 1.11 2010/11/05 07:40:21 salimov Exp $}
{******************************************************************************}
{               Автоматизированная система табельного учета                    }

{               (c) Донецкий национальный университет, 2002-2009               }
{******************************************************************************}

{                             Модуль "Календарь"                               }
{                     Ведение списка праздничных дней                          }
{                                            ответственный: Литовченко Дмитрий Николаевич  }

unit Calendar_Form;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Grids, Db, IBCustomDataSet, IBQuery, StdCtrls, Buttons,
    ExtCtrls, Mask, Menus,
    DBGrids, cxDropDownEdit, cxControls,
    cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
    ibase, TuCommonProc, SpWorkModeTranscript_DM, TuMessages, cxLabel, cxDBEdit,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, TuDates, dxBar,
  dxBarExtItems,Calendar_EditForm,math, dxStatusBar,FormPrintWorkMode,
  TuCommonConsts,TuCommonLoader,AccMGMT;

type
    TFormCalendarWork = class(TForm)
        DaysGrid: TStringGrid;
        Panel2: TPanel;
        Label2: TLabel;
        Label3: TLabel;
        FIOLabel: TLabel;
        DepartmentLabel: TLabel;
        PostLabel: TLabel;
        YearEdit: TcxSpinEdit;
        MonthBox: TcxComboBox;
    pnl1: TPanel;
    GridDBTableView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    Grid: TcxGrid;
    GridDBTableViewDBColumnEXC_DATE: TcxGridDBColumn;
    EditInc: TcxSpinEdit;
    GridDBTableViewDBColumnHOURS: TcxGridDBColumn;
    PanelHoliday: TPanel;
    cxGrid1: TcxGrid;
    GridDBTableViewHoliday: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dxBarManager1: TdxBarManager;
    BtnRefresh: TdxBarLargeButton;
    BtnUpdate: TdxBarLargeButton;
    BtnExit: TdxBarLargeButton;
    BtnDel: TdxBarLargeButton;
    LabelHoliday: TLabel;
    LabelException: TLabel;
    Panel1: TPanel;
    StatusBar1: TdxStatusBar;
    StatusBar2: TdxStatusBar;
    StatusBarWork: TdxStatusBar;
    StatusBarMain: TdxStatusBar;
    StatusBarWorkHoliday: TdxStatusBar;
    StatusBarNowork: TdxStatusBar;
    StatusBarNoWorkHoliday: TdxStatusBar;
    StatusBarWorkNight: TdxStatusBar;
    StatusBarWorkNightHoliday: TdxStatusBar;
    ButtonPrint: TdxBarLargeButton;
    StatusBarOutput: TdxStatusBar;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure RefreshButtonClick(Sender: TObject);
        procedure DaysGridDrawCell(Sender: TObject; ACol, ARow: Integer;
            Rect: TRect; State: TGridDrawState);
        procedure CancelButtonClick(Sender: TObject);
        procedure YearEditExit(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DaysGridDblClick(Sender: TObject);
        procedure DaysGridSelectCell(Sender: TObject; ACol, ARow: Integer;
            var CanSelect: Boolean);
        procedure DaysGridMouseUp(Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Integer);
    procedure GridDBTableViewDBColumnEXC_DATEGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure EditIncPropertiesChange(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure ButtonPrintClick(Sender: TObject);
    private
        procedure MakeCalendar(SelectToday: Boolean = False);
        procedure ReRead;
        procedure MakeCalendarByID(id:integer);
        procedure MakeStatusBar;
        function RtnNumDayRegim( ShiftBeginDateIn:TDate;DateIn:TDate):Integer;

    public
        Cur_Date: TDate;
        Month_Beg: TDate;
        Month_End: TDate;
        MCalendar: array[1..31] of Bool;
        Days: Integer;
        Year, Month: Word;
        ID:Integer;

        ShiftBeginDate:TDate;
        CountDaysRegim:Integer;
        constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;IdWorkMode:Integer);reintroduce;
    end;

implementation

uses FIBQuery, pFIBQuery, pFIBStoredProc, Variants;

{$R *.DFM}

constructor TFormCalendarWork.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE; IdWorkMode:Integer);
var i: Integer;
    y, m, d: Word;
begin
  ID:=IdWorkMode;

  inherited Create(AOwner);
  DModule:=TDModule.Create(AOwner);
  DModule.DB.Handle:=ADB_Handle;
  DaysGrid.Cells[0, 0] := 'пн';
  DaysGrid.Cells[1, 0] := 'вт';
  DaysGrid.Cells[2, 0] := 'ср';
  DaysGrid.Cells[3, 0] := 'чт';
  DaysGrid.Cells[4, 0] := 'пт';
  DaysGrid.Cells[5, 0] := 'сб';
  DaysGrid.Cells[6, 0] := 'нд';


  if Cur_Date = 0 then Cur_Date := Date;
  DecodeDate(Cur_Date, y, m, d);
  YearEdit.Text                         := IntToStr(y);
  Caption                               := GetConst('Calendar','Form');
  BtnUpdate.Caption                     := GetConst('Update','Button');
  BtnRefresh.Caption                    := GetConst('Refresh','Button');
  BtnExit.Caption                       := GetConst('Exit','Button');
  BtnDel.Caption                        :=GetConst('Delete','Button');
  GridDBTableViewDBColumnHOURS.Caption  :=GetConst('WorkHour','GridColumn');
  Label2.Caption                  := GetConst('Year','Label');
  Label3.Caption                  := GetConst('Moon','Label');
  LabelException.Caption          := GetConst('Exception','Label');
  LabelHoliday.Caption            := GetConst('Holiday','Label');
  ButtonPrint.Caption             := GetConst('Print','Button');

  MonthBox.Properties.Items.Text:=GetConst('MonthJanuary','OtherConsts')+#13+
                                  GetConst('MonthFebruary','OtherConsts')+#13+
                                  GetConst('MonthMarch','OtherConsts')+#13+
                                  GetConst('MonthApril','OtherConsts')+#13+
                                  GetConst('MonthMay','OtherConsts')+#13+
                                  GetConst('MonthJune','OtherConsts')+#13+
                                  GetConst('MonthJuly','OtherConsts')+#13+
                                  GetConst('MonthAutumn','OtherConsts')+#13+
                                  GetConst('MonthSeptember','OtherConsts')+#13+
                                  GetConst('MonthOctober','OtherConsts')+#13+
                                  GetConst('MonthNovember','OtherConsts')+#13+
                                  GetConst('MonthDecember','OtherConsts');
  MonthBox.ItemIndex := m - 1;
  ReRead;
     MakeCalendar(TRUE);
  MakeCalendarByID(IdWorkMode);

  GridDBTableView.DataController.DataSource:=DModule.DSourceWeekend;
  GridDBTableViewHoliday.DataController.DataSource:=DModule.DSourceHoliday;
  ReRead;
  MakeCalendar;

end;

procedure TFormCalendarWork.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TFormCalendarWork.ReRead;
var i: Integer;
begin
  Month := MonthBox.ItemIndex + 1;
  Year := StrToInt(YearEdit.Text);
  with(DModule)do
  try
    DSetCalendar.Close;
    DSetWork.Close;
    DSetWeekend.Close;
    DSetHoliday.Close;
    DSetCalendar.SelectSQL.Text:='SELECT * FROM GET_CALENDAR('+IntToStr(Year)+','+IntToStr(Month)+')';
    DSetWork.SelectSQL.Text:='SELECT * FROM TU_CALENDAR_INFO('+IntToStr(Year)+')';
    DSetWeekend.SelectSQL.Text:='SELECT * FROM TU_WORK_EXC_S_BY_YEAR_AND_ID('+intToStr(ID)+','+inttostr(Year)+',null,1)';
    DSetHoliday.SelectSQL.Text:= 'SELECT * FROM GET_CALENDAR('+IntToStr(Year)+',null) order by HOLIDAY_DATA Asc';
    DSetCalendar.Open;
    DSetWork.Open;
    DSetWeekend.Open;
    DSetHoliday.Open;
    CountDaysRegim:=DSetCalendarById.RecordCountFromSrv;
  except
    on e:Exception do
      TuShowMessage(GetConst('Caption','Error'),e.Message,mtError,[mbOK]);
  end;
  with DModule.StProc do
  begin
      Transaction.StartTransaction;
      StoredProcName:='INI_ASUP_CONSTS_S_SHIFT_BEG';
      Prepare;
      ExecProc;
      ShiftBeginDate:=ParamByName('SHIFT_BEGIN').AsDate;
      Transaction.Commit;
  end;

  for i := 1 to 31 do
  begin
    if DModule.DSetCalendar.Locate('Tbl_Day', i, []) then
      MCalendar[i] := (DModule.DSetCalendar['Holiday'] = 'T')
    else
      MCalendar[i] := False;
  end;
  EditInc.Properties.MaxValue:=CountDaysRegim-1;
  MakeStatusBar;
end;

procedure TFormCalendarWork.MakeCalendar(SelectToday: Boolean = False);
var i, j, k: Integer;
    d: Word;
begin
 
  for i := 0 to 6 do
    for j := 1 to 6 do
      DaysGrid.Cells[i, j] := '';
  Month_Beg := EncodeDate(Year, Month, 1);
  Days := 28;
  case Month of
    1, 3, 5, 7, 8, 10, 12: Days := 31;
    4, 6, 9, 11: Days := 30;
    2: if IsLeapYear(Year) then
         Days := 29
       else
         Days := 28;
  end;
  Month_End := EncodeDate(Year, Month, Days);

  j := DayOfWeek(EncodeDate(Year, Month, 1));
  dec(j);
  if j = 0 then j := 7;

  with(DModule)do
  try
    DSetCalendar.Close;
    DSetWork.Close;
    DSetWeekend.Close;
    DSetHoliday.Close;
    DSetHoliday.SelectSQL.Text:= 'SELECT * FROM GET_CALENDAR('+IntToStr(Year)+',null) order by HOLIDAY_DATA Asc';
    DSetCalendar.SelectSQL.Text:='SELECT * FROM GET_CALENDAR('+IntToStr(Year)+','+IntToStr(Month)+')';
    DSetWork.SelectSQL.Text:='SELECT * FROM TU_CALENDAR_INFO('+IntToStr(Year)+')';
    DSetWeekend.SelectSQL.Text:='SELECT * FROM TU_WORK_EXC_S_BY_YEAR_AND_ID('+intToStr(ID)+','+inttostr(Year)+',null,1)';
    DSetCalendar.Open;
    DSetWork.Open;
    DSetWeekend.Open;
    DSetHoliday.Open;
  except
    on e:Exception do
      TuShowMessage(GetConst('Caption','Error'),e.Message,mtError,[mbOK]);
  end;

  k := 1;
  for i := 1 to Days do
    with DaysGrid do
    begin
      EncodeDate(Year, Month, i);
      Cells[j - 1, k] := IntToStr(i);

      if SelectToday then
      begin
        DecodeDate(Cur_Date, Year, Month, d);
        if d = i then
        begin
          Row := k;
          Col := j - 1;
        end;
      end;

      if j = 7 then
      begin
        j := 1;
        inc(k);
      end
      else
        inc(j);
    end;
end;

procedure TFormCalendarWork.RefreshButtonClick(Sender: TObject);
begin
  ReRead;
  MakeCalendar;
end;

procedure TFormCalendarWork.DaysGridDrawCell(Sender: TObject; ACol, ARow: Integer;
    Rect: TRect; State: TGridDrawState);
var d, w, h,i,T,DayRegim,Color,l: Integer;
    s: string;
    sz: TSize;
    r: TRect;
    excep:Boolean;
begin
  w := DaysGrid.DefaultColWidth + DaysGrid.GridLineWidth;
  h := DaysGrid.DefaultRowHeight + DaysGrid.GridLineWidth;
  with DaysGrid.Canvas do
  if (ARow > 0) and (DaysGrid.Cells[ACol, ARow] <> '') then
  begin
    MoveTo(ACol * w - 1, ARow * h + h - 1);
    LineTo(ACol * w + w - 1, ARow * h - 1);
    Color:=Brush.Color ;
    l:=Pen.Color;
    Pen.Width := 2;
    Brush.Style := bsClear;
    Pen.Color :=  clBlack ;
    r.Left := ACol * w;
    r.Right := ACol * w + w - 1;
    r.Top := ARow * h;
    r.Bottom := ARow * h + h - 1;
    Rectangle(r);
    Pen.Width := 1;
    Pen.Color:=l;
    Brush.Color:=Color;
    d := StrToInt(DaysGrid.Cells[ACol, ARow]);
    if d<1 then Exit;
    if MCalendar[d] then
    begin
      s := IntToStr(d{+strtoint(EditInc.text)});
      sz := TextExtent(s);
      TextOut(ACol * w + 2, ARow * h + 2, s);
      Color:=Brush.Color;
      l:=Pen.Color;
      Pen.Width := 2;
      Brush.Style := bsClear;
      Pen.Color := clRed ;
      r.Left := ACol * w;
      r.Right := ACol * w + w - 1;
      r.Top := ARow * h;
      r.Bottom := ARow * h + h - 1;
      Rectangle(r);
      Pen.Width := 1;
      Pen.Color:=l;
      Brush.Color:=Color;
    end ;
    if EncodeDate(Year, Month, d)<ShiftBeginDate then Exit;
    DayRegim:= RtnNumDayRegim(ShiftBeginDate,EncodeDate(Year, Month, d));

    excep:=DModule.DSetWeekend.locate('EXC_DATE',EncodeDate(Year, Month, d) , []);
    if excep  then
    begin
      if not MCalendar[d] then
      IF (DModule.DSetWeekend['COUNT_HOURS_H']=0 ) then
      begin
        l:=Pen.Color;
        Pen.Width := 2;
        Brush.Style := bsClear;
        Pen.Color := $0020FE0E;
        r.Left := ACol * w;
        r.Right := ACol * w + w - 1;
        r.Top := ARow * h;
        r.Bottom := ARow * h + h - 1;
        Rectangle(r);
        Pen.Width := 1;
        Pen.Color:=l;

      end
      else
      begin
        s := FloatToStr( DModule.DSetWeekend['COUNT_HOURS_H']);
        sz := TextExtent(s);
        Font.Color := $00C7B534;
        TextOut(ACol * w + w - 5 - sz.cx, ARow * h + h - 5 - sz.cy, s);
      end;
      if   (MCalendar[d]) and (DModule.DSetWeekend['COUNT_HOURS_H']<>0) then
      begin
        s := FloatToStr( DModule.DSetWeekend['COUNT_HOURS_H']);
        sz := TextExtent(s);
        Font.Color := $00C7B534;
        TextOut(ACol * w + w - 5 - sz.cx, ARow * h + h - 5 - sz.cy, s);
        Exit;
      end ;
       Exit;
    end;

    if  MCalendar[d] then
      begin
        if DModule.DSetCalendarById.locate('ID_DAY_WEEK',DayRegim , []) then
        begin
         s :=  DModule.DSetCalendarById['COUNT_HOURS_H'];
         IF DModule.DSetCalendarById['COUNT_HOURS_H']= '0:00' THEN Exit ;
         sz := TextExtent(s);
         Font.Color := $00C7B534;
         TextOut(ACol * w + w - 5 - sz.cx, ARow * h + h - 5 - sz.cy, s);
         Exit;
        end
      end;

    if  DModule.DSetCalendarById.locate('ID_DAY_WEEK', DayRegim, [])then
    begin


      if  (DModule.DSetCalendarById['COUNT_HOURS_H']='0:00')  then
      begin
        l:=Pen.Color;
        Pen.Width := 2;
        Brush.Style := bsClear;
        Pen.Color := $0020FE0E;
        r.Left := ACol * w;
        r.Right := ACol * w + w - 1;
        r.Top := ARow * h;
        r.Bottom := ARow * h + h - 1;
        Rectangle(r);
        Pen.Width := 1;
        Pen.Color:=l;


      end
      else
      begin
        s :=  DModule.DSetCalendarById['COUNT_HOURS_H'];
        sz := TextExtent(s);
        Font.Color := $00C7B534;
        TextOut(ACol * w + w - 5 - sz.cx, ARow * h + h - 5 - sz.cy, s);
        Font.Color := clBlack;
      end
    end;
  end
end;


procedure TFormCalendarWork.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCalendarWork.YearEditExit(Sender: TObject);
begin
  if(Month<>0)then
  begin
    ReRead;
    MakeCalendar;
  end;
end;

procedure TFormCalendarWork.ModifyButtonClick(Sender: TObject);
var   OfWeek,i,Day:Integer;
      Hour,Min,Sek:Word;
      Date:TDateTime;
      Form:TFormEditCalendar;
begin

  if (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work/TU_WorkModeCor','Edit')=0)
     or (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work','Edit')=0 )
  then
  else
  begin
     MessageBox(self.Handle, 'Ви не маєте доступу до цієї дії!','Увага!', MB_OK or MB_ICONWARNING);
     exit;
  end;
  Form:=TFormEditCalendar.Create(Self);
  Day:=StrToInt(DaysGrid.Cells[DaysGrid.Col, DaysGrid.Row]);
  Date:=EncodeDate(Year, Month,  Day);
  OfWeek:= RtnNumDayRegim(ShiftBeginDate,EncodeDate(Year, Month, Day));
  if DModule.DSetWeekend.locate( 'EXC_DATE',  Date, []) then
  begin
    //если есть исключение
    if  DModule.DSetWeekend['WORK_BEG']=DModule.DSetWeekend['WORK_END'] then
    begin
      Form.EditWorkBeg.Enabled:=false;
      Form.EditWorkEnd.Enabled:=false;
      Form.EditBreakBeg.Enabled:=false;
      Form.EditBreakEnd.Enabled:=false;
      Form.CheckBoxHoliday.Checked:=true;
//      Form.CheckBoxNotSt1.Checked:=;
    end
    else
    begin
      Form.EditWorkBeg.Time:=StrToTime(DModule.DSetWeekend['WORK_BEG']);
      Form.EditWorkEnd.Time:=StrToTime(DModule.DSetWeekend['WORK_END']);
      if  DModule.DSetWeekend['BREAK_BEG'] <>null then
       Form.EditBreakBeg.Time:=StrToTime(DModule.DSetWeekend['BREAK_BEG']);
      if  DModule.DSetWeekend['BREAK_END'] <>null then
       Form.EditBreakEnd.Time:=StrToTime(DModule.DSetWeekend['BREAK_END']);
    end
  end
  else // тогда по режиму
    if  DModule.DSetCalendarById.locate('ID_DAY_WEEK',OfWeek , []) then
      if  DModule.DSetCalendarById['WORK_BEG']=DModule.DSetCalendarById['WORK_END'] then
      begin
         Form.EditWorkBeg.Enabled:=false;
         Form.EditWorkEnd.Enabled:=false;
         Form.EditBreakBeg.Enabled:=false;
         Form.EditBreakEnd.Enabled:=false;
         Form.CheckBoxHoliday.Checked:=true;
      end
      else
      begin
        Form.EditWorkBeg.Time:=StrToTime(DModule.DSetCalendarById['WORK_BEG']);
        Form.EditWorkEnd.Time:=StrToTime(DModule.DSetCalendarById['WORK_END']);
        if  DModule.DSetCalendarById['BREAK_BEG'] <>null then
          Form.EditBreakBeg.Time:=StrToTime(DModule.DSetCalendarById['BREAK_BEG']);
        if  DModule.DSetCalendarById['BREAK_END'] <>null then
          Form.EditBreakEnd.Time:=StrToTime(DModule.DSetCalendarById['BREAK_END']);
      end;
   Form.NumMode:=inttostr(OfWeek);
   Form.ExcDate:=Datetostr(Date);
  if Form.ShowModal=mrYes  then  with  DModule.StProc do
  begin
    Transaction.Active:=true;
    StoredProcName:='TU_EXC_I_OR_U';
    Prepare;
    ParamByName('ID_WORK_MODE').AsInteger  :=Id;
    ParamByName('WORK_BEG').AsTime         :=Form.EditWorkBeg.Time;
    ParamByName('WORK_END').AsTime         :=Form.EditWorkEnd.Time;
    ParamByName('BREAK_BEG').AsTime        :=Form.EditBreakBeg.Time;
    ParamByName('BREAK_END').AsTime        :=Form.EditBreakEnd.Time;
    ParamByName('EXC_DATE').AsDate         := Date;
    ParamByName('ID_DAY_WEEK').AsInteger   :=OfWeek;
    ParamByName('SHIFT').AsInteger         :=EditInc.Value;
    ParamByName('IS_ALL_STAVKA').AsSingle  :=EditInc.Value;
    ExecProc;
    Transaction.Commit;
  end;
  RefreshButtonClick(sender);
end;


procedure TFormCalendarWork.DaysGridDblClick(Sender: TObject);
begin
  BtnUpdate.Click;
end;

procedure TFormCalendarWork.DaysGridSelectCell(Sender: TObject; ACol,
    ARow: Integer; var CanSelect: Boolean);
var Day: Integer;
begin

end;

procedure TFormCalendarWork.DaysGridMouseUp(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then BtnUpdate.Click;
end;

procedure TFormCalendarWork.GridDBTableViewDBColumnEXC_DATEGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  Atext:=DateNumToName(StrToDate(AText),1);
end;




procedure TFormCalendarWork.MakeCalendarByID(id:integer);
var i:Integer;
    s: string;
    sz: TSize;
begin
  DModule.DSetCalendarById.Close;
DModule.DSetCalendarById.SelectSQL.Text:= 'select * from TU_WORKREG_SELECT('+inttostr(id)+ ')';
DModule.DSetCalendarById.Active:=true;

end;

procedure TFormCalendarWork.EditIncPropertiesChange(Sender: TObject);
begin
  ReRead;
  MakeCalendar;
end;

procedure TFormCalendarWork.BtnDelClick(Sender: TObject);
var   OfWeek,i,Day:Integer;
      Hour,Min,Sek:Word;
      Date:TDateTime;
      Form:TFormEditCalendar;
begin

  if (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work/TU_WorkModeCor','Del')=0)
     or (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work','Del')=0 )
  then
  else
  begin
     MessageBox(self.Handle, 'Ви не маєте доступу до цієї дії!','Увага!', MB_OK or MB_ICONWARNING);
     exit;
  end;
  Day:=StrToInt(DaysGrid.Cells[DaysGrid.Col, DaysGrid.Row]);
  Date:=EncodeDate(Year, Month,  Day);
 OfWeek:= RtnNumDayRegim(ShiftBeginDate,EncodeDate(Year, Month, Day));
  if not DModule.DSetWeekend.locate( 'EXC_DATE',  Date, []) then  Exit;
  if TuShowMessage(GetConst('Deletetext','Error'),GetConst('Delete','Error'),mtWarning,mbOKCancel)=mrOk then
  begin
    Day:=StrToInt(DaysGrid.Cells[DaysGrid.Col, DaysGrid.Row]);
    Date:=EncodeDate(Year, Month,  Day);
    with DModule.StProc do
    begin
    Transaction.Active:=true;
    StoredProcName:='WORK_EXC_DELETE';
    Prepare;
    ParamByName('ID_WORK_MODE').AsInteger   :=Id;
    ParamByName('EXC_DATE').AsDate          := Date;
    ParamByName('SHIFT').Asinteger          := EditInc.Value;
    ExecProc;
    Transaction.Commit;
    end;
    RefreshButtonClick(sender);
  end;
end;

procedure TFormCalendarWork.MakeStatusBar;
begin

  with DModule.StProc do
  begin
    Transaction.Active:=true;
    StoredProcName:='TU_WORK_MODE_INFO';
    Prepare;
    ParamByName('ID_WORK_MODE').AsInteger :=Id;
    ParamByName('IN_YEAR').AsInteger      := Year;
    ParamByName('IN_MONTH').AsInteger     := Month;
    ParamByName('SHIFT').AsInteger        := EditInc.Value;
    ExecProc;
    StatusBar1.Panels[0].Text:='';
    StatusBar1.Panels[1].Text:=GetConst('DayWorkYear','Label');
    StatusBar1.Panels[2].Text:=GetConst('DayCountsMonth','Label');
    StatusBar2.Panels[0].Text:='';
    StatusBar2.Panels[1].Text:=GetConst('Hours','Label');
    StatusBar2.Panels[2].Text:=GetConst('Days','Label');
    StatusBar2.Panels[3].Text:=GetConst('Hours','Label');
    StatusBar2.Panels[4].Text:=GetConst('Days','Label');
    StatusBarMain.Panels[0].Text:=GetConst('Kalendar','Label');
    StatusBarMain.Panels[1].Text:=FloatToStr(24*ParamByName('DAY_COUNT_YEAR').Asinteger);
    StatusBarMain.Panels[2].Text:=ParamByName('DAY_COUNT_YEAR').Asstring;
    StatusBarMain.Panels[3].Text:=FloatToStr(24*ParamByName('DAY_COUNT_MONTH').Asinteger);
    StatusBarMain.Panels[4].Text:=ParamByName('DAY_COUNT_MONTH').Asstring;
    StatusBarWork.Panels[0].Text:=GetConst('Works','Label');
    StatusBarWork.Panels[1].Text:=ParamByName('HOURS_YEAR').Asstring;
    StatusBarWork.Panels[2].Text:=ParamByName('DAY_WORK_YEAR').Asstring;
    StatusBarWork.Panels[3].Text:=ParamByName('HOURS_MONTH').Asstring;
    StatusBarWork.Panels[4].Text:=ParamByName('DAY_WORK_MONTH').Asstring;
    StatusBarWorkHoliday.Panels[1].Text:=GetConst('Holidays','Label');
    StatusBarWorkHoliday.Panels[2].Text:=ParamByName('HOURS_HOLIDAY_YEAR').Asstring;
    StatusBarWorkHoliday.Panels[3].Text:=ParamByName('DAY_WORK_HOLIDAY_YEAR').Asstring;
    StatusBarWorkHoliday.Panels[4].Text:=ParamByName('HOURS_HOLIDAY_MONTH').Asstring;
    StatusBarWorkHoliday.Panels[5].Text:=ParamByName('DAY_WORK_HOLIDAY_MONTH').Asstring;
    StatusBarWorkNight.Panels[1].Text:=GetConst('Nights','Label');
    StatusBarWorkNight.Panels[2].Text:=ParamByName('HOURS_NIGHT_YEAR').AsString;
    StatusBarWorkNight.Panels[3].Text:=ParamByName('DAY_WORK_NIGHT_YEAR').Asstring;
    StatusBarWorkNight.Panels[4].Text:=ParamByName('HOURS_NIGHT_MONTH').AsString;
    StatusBarWorkNight.Panels[5].Text:=ParamByName('DAY_WORK_NIGHT_MONTH').Asstring;
    StatusBarWorkNightHoliday.Panels[1].Text:=GetConst('NightHoliday','Label');
    StatusBarWorkNightHoliday.Panels[2].Text:=ParamByName('HOURS_HOLIDAY_NIGHT_YEAR').AsString;
    StatusBarWorkNightHoliday.Panels[3].Text:=ParamByName('DAY_WORK_HOLIDAY_NIGHT_YEAR').Asstring;
    StatusBarWorkNightHoliday.Panels[4].Text:=ParamByName('HOURS_HOLIDAY_NIGHT_MONTH').AsString;
    StatusBarWorkNightHoliday.Panels[5].Text:=ParamByName('DAY_WORK_HOLIDAY_NIGHT_MONTH').Asstring;

    StatusBarNowork.Panels[0].Text:=GetConst('NoWorks','Label');
    StatusBarNowork.Panels[1].Text:=ParamByName('HOURS_NOWORK_YEAR').Asstring;
    StatusBarNowork.Panels[2].Text:=ParamByName('DAY_NOWORK_YEAR').Asstring;
    StatusBarNowork.Panels[3].Text:=ParamByName('HOURS_NOWORK_MONTH').Asstring;
    StatusBarNowork.Panels[4].Text:=ParamByName('DAY_NOWORK_MONTH').Asstring;

    StatusBarOutput.Panels[1].Text:=GetConst('Output','Label');
    StatusBarOutput.Panels[2].Text:=ParamByName('HOURS_NOWORK_WEEKEND_YEAR').Asstring;
    StatusBarOutput.Panels[3].Text:=ParamByName('DAY_NOWORK_WEEKEND_YEAR').Asstring;
    StatusBarOutput.Panels[4].Text:=ParamByName('HOURS_NOWORK_WEEKEND_MONTH').Asstring;
    StatusBarOutput.Panels[5].Text:=ParamByName('DAY_NOWORK_WEEKEND_MONTH').Asstring;

    StatusBarNoWorkHoliday.Panels[1].Text:=GetConst('Holidays','Label');
    StatusBarNoWorkHoliday.Panels[2].Text:=ParamByName('HOURS_NOWORK_HOLIDAY_YEAR').Asstring;
    StatusBarNoWorkHoliday.Panels[3].Text:=ParamByName('DAY_NOWORK_HOLIDAY_YEAR').Asstring;
    StatusBarNoWorkHoliday.Panels[4].Text:=ParamByName('HOURS_NOWORK_HOLIDAY_MONTH').Asstring;
    StatusBarNoWorkHoliday.Panels[5].Text:=ParamByName('DAY_NOWORK_HOLIDAY_MONTH').Asstring;
    Transaction.Commit;
  end;


end;
function TFormCalendarWork.RtnNumDayRegim(ShiftBeginDateIn:TDate; DateIn:TDate):Integer;
var NumDay,T:Integer;
begin
  NumDay:=1;
  while(true)do
  begin
    if ShiftBeginDateIn=DateIn then
    begin
      T:=NumDay-EditInc.Value ;
      if T<=0 then
       result:= CountDaysRegim+T
      else
       Result:=t;
        Exit;
    end ;
      ShiftBeginDateIn:=ShiftBeginDateIn+1;
    if NumDay=CountDaysRegim then
      NumDay:=1
    else
      NumDay:=NumDay+1;
  end
end;

procedure TFormCalendarWork.ButtonPrintClick(Sender: TObject);
var Form: TFormPrt;
begin
  if (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work/TU_WorkModeCor','Print')=0)
     or (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work','Print')=0 )
  then
  else
  begin
     MessageBox(self.Handle, 'Ви не маєте доступу до цієї дії!','Увага!', MB_OK or MB_ICONWARNING);
     exit;
  end;
 Form:=TFormPrt.Create(self);
 Form.id:=ID;
 Form.Shift:=StrToInt(EditInc.text);
 Form.year:=Year;
 Form.ShowModal;
 Form.Destroy;
end;

end.
