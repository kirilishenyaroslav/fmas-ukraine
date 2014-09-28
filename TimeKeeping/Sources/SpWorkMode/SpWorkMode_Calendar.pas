
{ -$Id: SpWorkMode_Calendar.pas,v 1.1 2010/02/12 09:00:56 dimonl Exp $}
{******************************************************************************}
{               Автоматизированная система табельного учета                    }

{               (c) Донецкий национальный университет, 2002-2009               }
{******************************************************************************}

{                             Модуль "Календарь"                               }
{                     Ведение списка праздничных дней                          }
{                                            ответственный: Литовченко Дмитрий Николаевич  }

unit SpWorkMode_Calendar;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Grids, Db, IBCustomDataSet, IBQuery, StdCtrls, Buttons,
    ExtCtrls, Mask, Menus,
    DBGrids, cxDropDownEdit, cxControls,
    cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
    ibase, TuCommonProc, SpWorkMode_DM, TuMessages, cxLabel, cxDBEdit,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, TuDates, dxBar,
  dxBarExtItems;

type
    TSpWorkModeCalendar = class(TForm)
        DaysGrid: TStringGrid;
        Panel2: TPanel;
        Label2: TLabel;
        Label3: TLabel;
        FIOLabel: TLabel;
        DepartmentLabel: TLabel;
        PostLabel: TLabel;
        StatusPanel: TPanel;
        YearEdit: TcxSpinEdit;
        MonthBox: TcxComboBox;
    Panel3: TPanel;
    DBTextEditDay: TcxDBTextEdit;
    DBTextEditHoliday: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    pnl1: TPanel;
    Grid2DBTableView: TcxGridDBTableView;
    Grid2Level: TcxGridLevel;
    Grid2: TcxGrid;
    Grid2DBTableViewDBColumnEXC_DATE: TcxGridDBColumn;
    EditInc: TcxSpinEdit;
    Grid2DBTableViewDBColumnHOURS: TcxGridDBColumn;
    PanelHoliday: TPanel;
    Grid1: TcxGrid;
    Grid1DBTableView: TcxGridDBTableView;
    Grid1DBTableViewDBColumnExcDate: TcxGridDBColumn;
    Grid1DBTableViewDBColumnHours: TcxGridDBColumn;
    Grid1Level: TcxGridLevel;
    dxBarManager1: TdxBarManager;
    BtnRefresh: TdxBarLargeButton;
    BtnUpdate: TdxBarLargeButton;
    BtnExit: TdxBarLargeButton;
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
    procedure Grid2DBTableViewDBColumnEXC_DATEGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure EditIncPropertiesChange(Sender: TObject);
    private
        procedure MakeCalendar(SelectToday: Boolean = False);
        procedure ReRead;
        procedure MakeCalendarByID(id:integer);
    public
        Cur_Date: TDate;
        Month_Beg: TDate;
        Month_End: TDate;
        MCalendar: array[1..31] of Bool;
        Days: Integer;
        Year, Month: Word;
        ID:Integer;
        constructor Create(AOwner:TComponent;IdWorkMode:Integer);reintroduce;
    end;

implementation

{$R *.DFM}

constructor TSpWorkModeCalendar.Create(AOwner:TComponent; IdWorkMode:Integer);
var i: Integer;
    y, m, d: Word;
begin
  ID:=IdWorkMode;
  inherited Create(AOwner);
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
  //GridDBTableViewDBColumnDate.Caption   := GetConst('Holidays','GridColumn');
  BtnUpdate.Caption                  := GetConst('Update','Button');
  BtnRefresh.Caption                 := GetConst('Refresh','Button');
  BtnExit.Caption                  := GetConst('Exit','Button');

  Label2.Caption                  := GetConst('Year','Label');
  Label3.Caption                  := GetConst('Moon','Label');
  cxLabel1.Caption                := GetConst('CountDay','Label');
  cxLabel2.Caption                := GetConst('CountHolidayDay','Label');
  Label2.Caption                  := GetConst('Year','Label');
  Label2.Caption                  := GetConst('Year','Label');

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
  MakeCalendar(True);
  MakeCalendarByID(IdWorkMode);
  DBTextEditDay.DataBinding.DataSource:=DModule.DSource;
  DBTextEditDay.DataBinding.DataField:='DAY_COUNT';
  DBTextEditHoliday.DataBinding.DataSource:=DModule.DSource;
  DBTextEditHoliday.DataBinding.DataField:='HOLIDAY_COUNT';
  Grid1DBTableView.DataController.DataSource:=DModule.DSourceHoliday;

end;

procedure TSpWorkModeCalendar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TSpWorkModeCalendar.ReRead;
var i: Integer;
begin
  Month := MonthBox.ItemIndex + 1;
  Year := StrToInt(YearEdit.Text);
  with(DModule)do
  try
    DSetCalendar.Close;
    DSetWork.Close;
    DSetHoliday.Close;
    DSetCalendar.SelectSQL.Text:='SELECT * FROM GET_CALENDAR('+IntToStr(Year)+','+IntToStr(Month)+')';
    DSetWork.SelectSQL.Text:='SELECT * FROM TU_CALENDAR_INFO('+IntToStr(Year)+')';
    DSetHoliday.SelectSQL.Text:='SELECT * FROM HOLIDAYS_BETWEEN_2_DATES_EX2('''+DateToStr(EncodeDate(Year,1,1))+''','''+DateToStr(EncodeDate(Year,12,31))+''') order by HDATE';
    DSetException.SelectSQL.Text:='SELECT * FROM TU_WORK_EXC_S_BY_YEAR_AND_ID('+intToStr(ID)+','+inttostr(Year)+')';
    DSetCalendar.Open;
    DSetWork.Open;
    DSetHoliday.Open;
  except
    on e:Exception do
      TuShowMessage(GetConst('Caption','Error'),e.Message,mtError,[mbOK]);
  end;

  for i := 1 to 31 do
  begin
    if DModule.DSetCalendar.Locate('Tbl_Day', i, []) then
      MCalendar[i] := (DModule.DSetCalendar['Holiday'] = 'T')
    else

      MCalendar[i] := False;
  end;
end;

procedure TSpWorkModeCalendar.MakeCalendar(SelectToday: Boolean = False);
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
    DSetHoliday.Close;
    DSetCalendar.SelectSQL.Text:='SELECT * FROM GET_CALENDAR('+IntToStr(Year)+','+IntToStr(Month)+')';
    DSetWork.SelectSQL.Text:='SELECT * FROM TU_CALENDAR_INFO('+IntToStr(Year)+')';
    DSetHoliday.SelectSQL.Text:='SELECT * FROM TU_WORK_EXC_S_BY_YEAR_AND_ID('+intToStr(ID)+','+inttostr(Year)+')';
    DSetCalendar.Open;
    DSetWork.Open;
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

procedure TSpWorkModeCalendar.RefreshButtonClick(Sender: TObject);
begin
  ReRead;
  MakeCalendar;
end;

procedure TSpWorkModeCalendar.DaysGridDrawCell(Sender: TObject; ACol, ARow: Integer;
    Rect: TRect; State: TGridDrawState);
var d, w, h,i,OfWeek: Integer;
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
    d := StrToInt(DaysGrid.Cells[ACol, ARow])-strtoint(EditInc.text);
    if d<1 then Exit;
    if MCalendar[d] then
    begin
      s := 'св';
      sz := TextExtent(s);
      Font.Color := clBlue;

      TextOut(ACol * w + w - 5 - sz.cx, ARow * h + h - 5 - sz.cy, s);
      s := IntToStr(d+strtoint(EditInc.text));
      sz := TextExtent(s);
      Font.Color := clRed;
      TextOut(ACol * w + 2, ARow * h + 2, s);


      if MCalendar[d] then
        Brush.Color := clRed
      else
        Brush.Color := clBlack;

      r.Left := ACol * w;
      r.Right := ACol * w + w - 1;
      r.Top := ARow * h;
      r.Bottom := ARow * h + h - 1;
      FrameRect(r);
    end ;

    OfWeek:= DayOfWeek(EncodeDate(Year, Month, d))-1;
    if  OfWeek=0 then OfWeek:=7;

    excep:=DModule.DSetHoliday.locate('EXC_DATE',EncodeDate(Year, Month, d) , []);
    if excep  then
    begin
      if not MCalendar[d] then
      IF (DModule.DSetHoliday['TODAY_HOURS']=0 ) then
      begin
        Brush.Color := clGreen ;
        r.Left := ACol * w;
        r.Right := ACol * w + w - 1;
        r.Top := ARow * h;
        r.Bottom := ARow * h + h - 1;
        FrameRect(r);
      end
      else
      begin
        s := FloatToStr( DModule.DSetHoliday['TODAY_HOURS']);
        sz := TextExtent(s);
        Font.Color := clBlue;
        TextOut(ACol * w + w - 5 - sz.cx, ARow * h + h - 5 - sz.cy, s);
        s := IntToStr(d+strtoint(EditInc.text));
        sz := TextExtent(s);
        Font.Color := clBlack;
        TextOut(ACol * w + 2, ARow * h + 2, s);
      end;
      Exit;
    end;

    if  DModule.DSetCalendarById.locate('ID_DAY_WEEK',OfWeek , [])and  not (MCalendar[d]) then
    begin
      if  (DModule.DSetCalendarById['TODAY_HOURS']=0)  then
      begin
        Brush.Color := clGreen ;
        r.Left := ACol * w;
        r.Right := ACol * w + w - 1;
        r.Top := ARow * h;
        r.Bottom := ARow * h + h - 1;
        FrameRect(r);
      end
      else
      begin
        s := FloatToStr( DModule.DSetCalendarById['TODAY_HOURS']);
        sz := TextExtent(s);
        Font.Color := clBlue;
        TextOut(ACol * w + w - 5 - sz.cx, ARow * h + h - 5 - sz.cy, s);
        s := IntToStr(d+strtoint(EditInc.text));
        sz := TextExtent(s);
        Font.Color := clBlack;
        TextOut(ACol * w + 2, ARow * h + 2, s);
      end

    end;

    if  DModule.DSetCalendarById.locate('ID_DAY_WEEK',OfWeek , [])and  (MCalendar[d]) then
    if  (DModule.DSetCalendarById['TODAY_HOURS']<>0) or
        (DModule.DSetHoliday['TODAY_HOURS']<>0)  then
    begin
        if DModule.DSetHoliday['TODAY_HOURS']<>0  then
            s := FloatToStr( DModule.DSetHoliday['TODAY_HOURS'])
        else
            s := FloatToStr( DModule.DSetCalendarById['TODAY_HOURS']);
        sz := TextExtent(s);
        Brush.Color := clwhite;
        Font.Color := clBlue;
        TextOut(ACol * w + w - 5 - sz.cx, ARow * h +h-21 - sz.cy, s);
    end
  end
end;


procedure TSpWorkModeCalendar.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TSpWorkModeCalendar.YearEditExit(Sender: TObject);
begin
  if(Month<>0)then
  begin
    ReRead;
    MakeCalendar;
  end;
end;

procedure TSpWorkModeCalendar.ModifyButtonClick(Sender: TObject);
var d: Integer;
    CanSelect:boolean;
begin
 
end;

procedure TSpWorkModeCalendar.DaysGridDblClick(Sender: TObject);
begin
  BtnUpdate.Click;
end;

procedure TSpWorkModeCalendar.DaysGridSelectCell(Sender: TObject; ACol,
    ARow: Integer; var CanSelect: Boolean);
var Day: Integer;
begin
  if DaysGrid.Cells[ACol, ARow] = '' then
    StatusPanel.Caption := ''
  else
  try
    Day := StrToInt(DaysGrid.Cells[ACol, ARow]);
    if MCalendar[Day] then
      StatusPanel.Caption := GetConst('HolidaysDay','OtherConsts')
    else
      StatusPanel.Caption := GetConst('WorkDay','OtherConsts')
  except
    StatusPanel.Caption := '';
  end;
end;

procedure TSpWorkModeCalendar.DaysGridMouseUp(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then BtnUpdate.Click;
end;

procedure TSpWorkModeCalendar.Grid2DBTableViewDBColumnEXC_DATEGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  Atext:=DateNumToName(StrToDate(AText),1);
end;




procedure TSpWorkModeCalendar.MakeCalendarByID(id:integer);
var i:Integer;
    s: string;
    sz: TSize;
begin
  DModule.DSetCalendarById.Close;
DModule.DSetCalendarById.SelectSQL.Text:= 'select * from DT_WORKREG_SELECT('+inttostr(id)+')';
DModule.DSetCalendarById.Active:=true;

end;

procedure TSpWorkModeCalendar.EditIncPropertiesChange(Sender: TObject);
begin
  ReRead;
  MakeCalendar;
end;

end.
