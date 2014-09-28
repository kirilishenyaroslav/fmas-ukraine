
{ -$Id: Table2.pas,v 1.2 2005/09/20 12:44:12 valik Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                   Модуль "Ведение табелей сотрудников (3)"                   }
{                Формирование табелей учета рабочего времени                   }
{                                                  ответственный: Олег Волков  }

unit Table2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, Buttons, StdCtrls, Mask, CheckEditUnit,
  DepartmentsViewUnit, DB, IBCustomDataSet, IBQuery, PersonalCommon, Spin,
  DateUtils, Menus, Registry, SpCommon, Buffer, SpFormUnit, TablePrint,
  SpComboBox, ChangeTable, ProcessUnit, SpTimeUtils, NagScreenUnit,
  WorkModeCentral, TableCentral, uTableFrame;

type
  TMonthTable = record
	FIO: String;
	Id_Man_Moving: Integer;
	Id_Work_Mode: Integer;
    Work_Mode_Shift: Integer;
	Id_PCard: Integer;
	Written: Boolean;
	Modified: Boolean;
    Read: Boolean;
    DateBeg: TDate;
    DateEnd: TDate;
	Work_Beg: array[0..31] of Variant;
    Work_End: array[0..31] of Variant;
    Break_Beg: array[0..31] of Variant;
    Break_End: array[0..31] of Variant;
	Vihods: array[0..31] of Variant;
    Modes: array[0..31] of Variant;
    Hours: array[0..31] of Variant;
    NHours: array[0..31] of Variant;
    PHours: array[0..31] of Variant;
    GHours: array[0..31] of Variant;
    VHours: array[0..31] of Variant;
    ReadDay: array[0..31] of Boolean;
    Selected: array[0..31] of Boolean;
	DayBeg: Integer;
	DayEnd: Integer;

    WorkingHours: Double;
    WorkingDays: Integer;
    NightHours: Double;
    HolidayHours: Double;
    GraficHours: Double;
    SverhHours: Double;
    VihodnoiHours: Double;
    TableSHours: Variant;
    CalDays: Integer;

    Kol_Stavok: Double;
  end;

  TWorkMode = record
    Id_Work_Mode: Integer;
    Nomer: Integer;
    Name: String;
    Name_Short: String;
    Night_Beg: TTime;
    Night_End: TTime;
    Work_Beg: array of TTime;
    Work_End: array of TTime;
    Break_Beg: array of Variant;
    Break_End: array of Variant;
  end;

  TTableForm2 = class(TForm)
    ButtonsPanel: TPanel;
    TableGrid: TStringGrid;
    ReportButton: TSpeedButton;
    WriteOneButton: TSpeedButton;
    CancelButton: TSpeedButton;
    HeaderPanel: TPanel;
    DepartmentLabel: TLabel;
    YearLabel: TLabel;
    MonthLabel: TLabel;
    MonthBox: TComboBox;
    DepartmentButton: TBitBtn;
    DepartmentEdit: TEdit;
    SelectPeople: TIBQuery;
    AcceptButton: TBitBtn;
    YearEdit: TSpinEdit;
    VihodQuery: TIBQuery;
    HoursPanel: TPanel;
    HoursCaptionLabel: TLabel;
    HoursLabel: TLabel;
    HospitalsQuery: TIBQuery;
    HolidaysQuery: TIBQuery;
    BufferWorkModeChange: TIBQuery;
    ChangeButton: TSpeedButton;
    CalendarQuery: TIBQuery;
    VihodCaptionLabel: TLabel;
    VihodLabel: TLabel;
    WorkModeQuery: TIBQuery;
    WorkRegQuery: TIBQuery;
    TableQuery: TIBQuery;
    NHLabel: TLabel;
    NHoursLabel: TLabel;
    PHLabel: TLabel;
    PHoursLabel: TLabel;
    GHLabel: TLabel;
    GHoursLabel: TLabel;
    HoursBufferQuery: TIBQuery;
    VihodsBufferQuery: TIBQuery;
    InsertTable: TIBQuery;
    BufInsertNTable: TIBQuery;
    WorkModePanel: TPanel;
    ModeLabel: TLabel;
    WorkModeBox: TSpComboBox;
    NomerLabel: TLabel;
    NomerEdit: TCheckEdit;
    ShiftSpin: TSpinEdit;
    ShiftLabel: TLabel;
    AcceptModeButton: TBitBtn;
    StatusPanel: TPanel;
    StatusCaptionLabel: TLabel;
    StatusLabel: TLabel;
    WBegLabel: TLabel;
    WEndLabel: TLabel;
    WorkEndLabel: TLabel;
    WorkBegLabel: TLabel;
    RecalcTable: TCheckBox;
    ChangeMode: TIBQuery;
    BufNChangeMode: TIBQuery;
    ExcQuery: TIBQuery;
    NewButton: TSpeedButton;
    SearchLabel: TLabel;
    SearchEdit: TEdit;
    WriteAllButton: TSpeedButton;
    TablePopup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    HeadItem: TMenuItem;
    StatusItem: TMenuItem;
    WorkModeItem: TMenuItem;
    HoursItem: TMenuItem;
    AllItem: TMenuItem;
    AllPanel: TPanel;
    TotalHoursCaption: TLabel;
    TotalNHoursCaption: TLabel;
    TotalHoursLabel: TLabel;
    TotalNHoursLabel: TLabel;
    TotalPHoursCaption: TLabel;
    TotalPHoursLabel: TLabel;
    TotalDaysCaption: TLabel;
    TotalDaysLabel: TLabel;
    TotalLabel: TLabel;
    VihodnoiItem: TMenuItem;
    N4: TMenuItem;
    ManPanel: TPanel;
    AHLabel: TLabel;
    AllHoursLabel: TLabel;
    AllNHoursLabel: TLabel;
    AllPHoursLabel: TLabel;
    AGLabel: TLabel;
    AllGHoursLabel: TLabel;
    SverhLabel: TLabel;
    SverhEdit: TCheckEdit;
    DaysCaptionLabel: TLabel;
    DaysLabel: TLabel;
    AllManLabel: TLabel;
    AVihLabel: TLabel;
    AllVHoursLabel: TLabel;
    VihLabel: TLabel;
    VHoursLabel: TLabel;
    ManItem: TMenuItem;
    TotalVihHoursCaption: TLabel;
    TotalVHoursLabel: TLabel;
    ACLabel: TLabel;
    CalDaysLabel: TLabel;
    Work1Label: TLabel;
    Work2Label: TLabel;
    DateBegLabel: TLabel;
    DateEndLabel: TLabel;
    ChangePopupButton: TMenuItem;
    StavokLabel: TLabel;
    WorkersCaptionLabel: TLabel;
    PeopleLabel: TLabel;
    DecBox: TCheckBox;
    WeekDayLabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DepartmentButtonClick(Sender: TObject);
    procedure AcceptButtonClick(Sender: TObject);

    procedure ModeHours(mode_ind, shift, day: Integer; var Time_Beg, Time_End,
        Break_Beg, Break_End: Variant);
    function  FindMode(Id_Work_Mode: Integer): Integer;
    procedure ShowStatus(i, day: Integer);
    procedure CalcResults(man_ind: Integer);
    procedure SetMode(man_ind, mode_ind, day: Integer);
    procedure PrepareModes;
    function  FindMoving(Id_Man_Moving: Integer): Integer;
    procedure PrepareQueries;
    procedure FillPeople;
    procedure FillTable(i: Integer);
    procedure Render(i: Integer; day: Integer);
    function  WriteTable(i: Integer): Boolean;
    function  GetPeopleIndex(ARow: Integer): Integer;
    function  GetDay(ACol: Integer): Integer;
    procedure ChangeCell(ACol, ARow: Integer);

    procedure FormButtonClick(Sender: TObject);
    procedure ReportButtonClick(Sender: TObject);
    procedure TableGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TableGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure TableGridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure AcceptModeButtonClick(Sender: TObject);
    procedure WorkModeBoxChange(Sender: TObject);
    procedure TableGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChangeButtonClick(Sender: TObject);
    procedure NewButtonClick(Sender: TObject);
    procedure SverhEditChange(Sender: TObject);
    procedure SverhEditEnter(Sender: TObject);
    procedure SverhEditExit(Sender: TObject);
    procedure TableGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TableGridKeyPress(Sender: TObject; var Key: Char);
    procedure SearchEditChange(Sender: TObject);
    procedure SearchEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure WriteOneButtonClick(Sender: TObject);
    procedure SetTime(i, day: Integer; time: TTime);
	procedure SetVihod(i, day, vihod: Integer);
    procedure DecBoxClick(Sender: TObject);
    procedure DrawSelect(NewRow, NewCol: Integer);
    procedure HoursPanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure HeadItemClick(Sender: TObject);
    procedure StatusItemClick(Sender: TObject);
    procedure WorkModeItemClick(Sender: TObject);
    procedure HoursItemClick(Sender: TObject);
    procedure AllItemClick(Sender: TObject);
    procedure VihodnoiItemClick(Sender: TObject);
    procedure TablePopupPopup(Sender: TObject);
    procedure ManItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ChangePopupButtonClick(Sender: TObject);
  public
        	Id_Department: Integer;

  private
    DefaultTime: TTime;

	Year, Month: Word;
	Month_Beg, Month_End: TDate;
	Days: Integer;
	People: Integer;
	MRow, MCol: Integer;
	AllTables: array of TMonthTable;
    WorkModes: array of TWorkMode;
	XCalendar: array[1..31] of Boolean;
	Loaded: Boolean;

    SelectedRow: Integer;
    SelectedCol: Integer;

    React: Boolean;

    SelectI, SelectDay, oSelectI, oSelectDay: Integer;

    TotalDays: Integer;
    TotalHours, TotalNHours, TotalPHours, TotalVHours: Double;
    Real_People: Integer;
  end;

var
  TableForm2: TTableForm2;

implementation

{$R *.dfm}


procedure TTableForm2.FormClose(Sender: TObject; var Action: TCloseAction);
var
	reg: TRegistry;
    dec: Integer;
begin
	reg := TRegistry.Create;
	try
		reg.RootKey := HKEY_CURRENT_USER;

		if reg.OpenKey('\Software\ASUP\Table\', True) then
		begin
			reg.WriteInteger('Year', Year);
			reg.WriteInteger('Month', Month);
            reg.WriteInteger('Id_Department', Id_Department);
            reg.WriteString('Name_Department', DepartmentEdit.Text);
            if DecBox.Checked then dec := 1
            else dec := 0;
            reg.WriteInteger('Decimal', dec);
			reg.CloseKey;
		end
	finally
		reg.Free;
	end;
    WorkModeBox.SaveIntoRegistry;

	if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TTableForm2.FormCreate(Sender: TObject);
var
	i, dec: Integer;
	d: Word;
	reg: TRegistry;
begin
		// подготовить заголовки столбцов
	TableGrid.Cells[0, 0] := '№';
	TableGrid.Cells[1, 0] := 'ПІБ';
    TableGrid.Cells[2, 0] := 'Т/н';
	TableGrid.Cells[3, 0] := 'Посада';
  	TableGrid.ColWidths[0] := 25;
	TableGrid.ColWidths[1] := 120;
  	TableGrid.ColWidths[2] := 35;
	TableGrid.ColWidths[3] := 200;
	for i:=1 to 31 do
		TableGrid.Cells[TableGrid.FixedCols+i-1,0] := IntToStr(i);

			// считать из реестра последний год и месяц
	reg := TRegistry.Create;
	try
		reg.RootKey := HKEY_CURRENT_USER;

		if reg.OpenKey('\Software\ASUP\Table\', False) then
		begin
			Year := reg.ReadInteger('Year');
			Month := reg.ReadInteger('Month');
            try
                Id_Department := reg.ReadInteger('Id_Department');
                DepartmentEdit.Text := reg.ReadString('Name_Department');
            except
            end;
		end
		else	DecodeDate(Date, Year, Month, d);

        dec := 0;
        try
            dec := reg.ReadInteger('Decimal');
        except
        end;

        DecBox.Checked := (dec = 1);
        reg.CloseKey;
	finally
		reg.Free;
	end;

    if (Month < 1) or ( Month > 12 ) then Month := 1;
    if (Year < 1000) then Year := 2004;

	YearEdit.Value := Year;
	MonthBox.ItemIndex := Month-1;

    DefaultTime := StrToTime('8:00');

	CancelButton.Align := alRight;

		// подготовить запросы
	SelectPeople.Transaction := ReadTransaction;
	HospitalsQuery.Transaction := ReadTransaction;
	HolidaysQuery.Transaction := ReadTransaction;
	CalendarQuery.Transaction := ReadTransaction;
    TableQuery.Transaction := ReadTransaction;
    ExcQuery.Transaction := ReadTransaction;

    InsertTable.Transaction := WriteTransaction;
    ChangeMode.Transaction := WriteTransaction;

    PrepareModes;
    ExcQuery.Open;

	BufferWorkModeChange.Transaction := BufferTransaction;
    BufInsertNTable.Transaction := BufferTransaction;
    BufNChangeMode.Transaction := BufferTransaction;
    HoursBufferQuery.Transaction := BufferTransaction;
    VihodsBufferQuery.Transaction := BufferTransaction;

	Loaded := False;

	MRow := -1;
	MCol := -1;

    React := False;
end;

procedure TTableForm2.PrepareModes;
var
    i, j: Integer;
begin
    VihodQuery.Transaction := ReadTransaction;
    WorkModeQuery.Transaction := ReadTransaction;
    WorkRegQuery.Transaction := ReadTransaction;

    VihodQuery.Open;
    WorkModeQuery.Open;
    WorkRegQuery.Open;

    i :=0 ;
    with WorkModeQuery do
    begin
        FetchAll;
        SetLength(WorkModes, RecordCount);
        First;
        while not Eof do
        with WorkModes[i] do
        begin
            Id_Work_Mode := WorkModeQuery['Id_Work_Mode'];
            Nomer := WorkModeQuery['Nomer'];
            Name := WorkModeQuery['Name'];
            Name_Short := WorkModeQuery['Name_Short'];
            Night_Beg := WorkModeQuery['Night_Beg'];
            Night_End := WorkModeQuery['Night_End'];
            WorkRegQuery.Locate('Id_Work_Mode', Id_Work_Mode, []);
            j := 0;
            while not WorkRegQuery.Eof and
                ( WorkRegQuery['Id_Work_Mode'] = Id_Work_Mode ) do
            begin
                if j > High(Work_Beg) then
                begin
                    SetLength(Work_Beg, j+1);
                    SetLength(Work_End, j+1);
                    SetLength(Break_Beg, j+1);
                    SetLength(Break_End, j+1);
                end;
                Work_Beg[j] := WorkRegQuery['Work_Beg'];
                Work_End[j] := WorkRegQuery['Work_End'];
                Break_Beg[j] := WorkRegQuery['Break_Beg'];
                Break_End[j] := WorkRegQuery['Break_End'];

                WorkRegQuery.Next;
                inc(j);
            end;
            Next;
            inc(i);
        end;
    end;
end;

procedure TTableForm2.CancelButtonClick(Sender: TObject);
begin
	Close;
end;

procedure TTableForm2.DepartmentButtonClick(Sender: TObject);
var
	form: TDepartmentsViewForm;
begin
	form := TDepartmentsViewForm.Create(Self);
	form.Prepare(True);
	form.CanSelectRoot := True;
    form.Tree.SelectNode(Id_Department);
	if form.ShowModal = mrOk then
	with form do
	begin
		Id_Department := Selected_Id;

		if Id_Department = -1 then
			DepartmentEdit.Text := Consts_Query['Firm_Name']
		else	DepartmentEdit.Text := ResultQuery['Name_Full'];
	end;
	form.Free;
end;

procedure TTableForm2.AcceptButtonClick(Sender: TObject);
var
	i, day: Integer;
    NagScreen: TNagScreen;
begin
	if Id_Department = 0 then
	begin
		MessageDlg('Потрібно вибрати підрозділ!', mtError, [mbOk], 0);
		Exit;
	end;

    NagScreen := TNagScreen.Create(self);
    NagScreen.Show;
    NagScreen.SetStatusText('Формується табель...');


 try
	Month := MonthBox.ItemIndex + 1;
	Year := YearEdit.Value;

	TableGrid.Enabled := True;

	Days := DaysInAMonth(Year, Month);
	Month_Beg := EncodeDate(Year, Month, 1);
	Month_End := EncodeDate(Year, Month, Days);
	TableGrid.ColCount := TableGrid.FixedCols + Days;

	PrepareQueries;
    
	FillPeople;

	for day:=1 to 31 do XCalendar[day] := False;

	with CalendarQuery do
	begin
        Close;
		Open;
		First;
		while not Eof do
		begin
			day := CalendarQuery['Tbl_Day'];
			XCalendar[day] := (CalendarQuery['Holiday'] = 'T');
			Next;
		end;
	end;

    HospitalsQuery.Close;
    HospitalsQuery.Open;
    HolidaysQuery.Close;
    HolidaysQuery.Open;

    for i:=0 to People-1 do
    begin
        FillTable(i);
        for day:=1 to Days do
    			Render(i, day);
    end;

            // считать табель
    TableQuery.Close;
    TableQuery.Open;
    for i := 0 to People-1 do
    with AllTables[i] do
    begin
        if TableQuery.Locate('Id_Man_Moving', Id_Man_Moving, []) then
            Read := True;
        while not TableQuery.Eof and (TableQuery['Id_Man_Moving'] = Id_Man_Moving) do
        begin
            day := TableQuery['Tbl_Day'];
            Vihods[day] := TableQuery['Id_Vihod'];
            Work_Beg[day] := TableQuery['Work_Beg'];
            Work_End[day] := TableQuery['Work_End'];
            Break_Beg[day] := TableQuery['Break_Beg'];
            Break_End[day] := TableQuery['Break_End'];
            Modes[day] := TableQuery['Id_Work_Mode'];
            Hours[day] := TableQuery['Hours'];
            NHours[day] := TableQuery['NHours'];
            PHours[day] := TableQuery['PHours'];
            GHours[day] := TableQuery['GHours'];
            if VarIsNull(TableQuery['VHours']) then VHours[day] := 0
            else VHours[day] := TableQuery['VHours'];
            ReadDay[day] := True;
            SverhHours := TableQuery['SHours'];
            TableQuery.Next;
        end;
    end;

    for i:=0 to People-1 do
    begin
        CalcResults(i);
        for day:=1 to Days do
    			Render(i, day);
    end;

    oSelectI := 0;
    oSelectDay := 1;
    SelectI := -1;
    SelectDay := -1;

	Loaded := True;
	TableGrid.Repaint;
	PeopleLabel.Caption := IntToStr(Real_People);
	TableGrid.SetFocus;
    ShowStatus(0, 1);

    SearchEdit.Text := '';
 except on e: Exception do
 begin
    MessageDlg('При формуванні табеля виникла помилка: ' + e.Message, mtError, [mbOk], 0);
    NagScreen.Free;
 end;
 end;
    NagScreen.Free;
end;

procedure TTableForm2.PrepareQueries;
begin
	SelectPeople.Close;
	with SelectPeople.Params do
	begin
		ParamValues['Id_Department'] := Id_Department;
		ParamValues['Month_Beg'] := Month_Beg;
		ParamValues['Month_End'] := Month_End;
	end;
 	with HospitalsQuery.Params do
	begin
		ParamValues['Id_Department'] := Id_Department;
		ParamValues['Month_Beg'] := Month_Beg;
		ParamValues['Month_End'] := Month_End;
	end;
	with HolidaysQuery.Params do
	begin
		ParamValues['Id_Department'] := Id_Department;
		ParamValues['Month_Beg'] := Month_Beg;
		ParamValues['Month_End'] := Month_End;
	end;
	with CalendarQuery.Params do
	begin
		ParamValues['Year'] := Year;
		ParamValues['Month'] := Month;
	end;
  	with TableQuery.Params do
	begin
        ParamValues['Id_Department'] := Id_Department;
		ParamValues['Month_Beg'] := Month_Beg;
		ParamValues['Month_End'] := Month_End;
	end;
end;

procedure TTableForm2.CalcResults(man_ind: Integer);
var
    mode, day: Integer;
    max, min, Night_Beg, Night_End, yest_beg, yest_end, today_beg, today_end,
    br_beg, br_end: TTime;
    i: Integer;
begin
    if ( man_ind < 0 ) or ( man_ind > People-1 ) then Exit;
    with AllTables[man_ind] do
    begin
        HolidayHours := 0;
        NightHours := 0;
        WorkingHours := 0;
        WorkingDays := 0;
        GraficHours := 0;
        VihodnoiHours := 0;

        mode := FindMode(Id_Work_Mode);
        Night_Beg := WorkModes[mode].Night_Beg;
        Night_End := WorkModes[mode].Night_End;

        for day := 1 to Days do
        begin
            if not ReadDay[day] then
            begin
{              if Version = 2 then}
              begin
                      // разбить периоды в один день
                SplitHours(Work_Beg[day-1], Work_End[day-1], True, yest_beg, yest_end);

                SplitHours(Work_Beg[day], Work_End[day], False, today_beg, today_end);
                if not VarIsNull(Break_Beg[day]) then
                    SplitHours(Break_Beg[day], Break_End[day], False, br_beg, br_end)
                else
                begin
                    br_beg := 0;
                    br_end := 0;
                end;

                      // общее количество часов
                Hours[day] := (yest_end - yest_beg) + (today_end - today_beg);
                if Hours[day] > 0 then
                    Hours[day] := Hours[day] - (br_end-br_beg);

                      // праздничные
                if XCalendar[day] then PHours[day] := Hours[day]
                else PHours[day] := 0;

                      // ночные
                NHours[day] := CalcNightHours(yest_beg, yest_end, Night_Beg, Night_End)
                  + CalcNightHours(today_beg, today_end, Night_Beg, Night_End)
                  - CalcNightHours(br_beg, br_end, Night_Beg, Night_End);
              end{
              else
              if Version = 1 then
              begin
                  Hours[day] := TimeDiff(Work_Beg[day], Work_End[day]);

                      // праздничные
                  PHours[day] := 0;
                  if (Work_Beg[day] < Work_End[day]) and XCalendar[day] then
                      PHours[day] := Hours[day];
                  if XCalendar[day] and ( Work_Beg[day] > Work_End[day] ) then
                      PHours[day] := 1 - Work_Beg[day];
                  if ( day < Days ) and XCalendar[day+1] and
                      ( Work_Beg[day] > Work_End[day] ) then
                       PHours[day] := PHours[day] + Work_End[day];

                      // ночные
                  mode := FindMode(Id_Work_Mode);
                  Night_Beg := WorkModes[mode].Night_Beg;
                  Night_End := WorkModes[mode].Night_End;
                  NHours[day] := 0;
                  if ( Work_Beg[day] < Work_End[day] ) and ( Work_End[day] > Night_Beg )
                      then NHours[day] := Work_End[day] - Night_Beg;
                  if ( Work_Beg[day] < Work_End[day] ) and ( Work_Beg[day] < Night_End )
                      then NHours[day] := NHours[day] +  Night_End - Work_Beg[day];
                  if Work_Beg[day] > Work_End[day] then
                  begin
                      if Work_Beg[day] < Night_Beg then max := Night_Beg
                      else max := Work_Beg[day];
                      if Work_End[day] > Night_End then min := Night_End
                      else min := Work_End[day];
                      NHours[day] := TimeDiff(min, max);
                  end;
              end};

                // учесть количество ставок
              Hours[day] := Hours[day] * Kol_Stavok;
              PHours[day] := PHours[day] * Kol_Stavok;
              NHours[day] := NHours[day] * Kol_Stavok;
            end;

          HolidayHours := HolidayHours + 24*PHours[day];
          NightHours := NightHours + 24*NHours[day];
          WorkingHours := WorkingHours + 24*Hours[day];
          if Hours[day] > 0.001 then
            inc(WorkingDays);
          GraficHours := GraficHours + 24*GHours[day];
          VihodnoiHours := VihodnoiHours + 24*VHours[day];
          {if WorkingHours > GraficHours then
            SverhHours := WorkingHours - GraficHours
          else SverhHours := 0;}

{          if not VarIsNull(TableSHours) then
            SverhHours := TableSHours;}

        end;
    end;

        // общие результаты
    TotalDays := 0;
    TotalHours := 0;
    TotalNHours := 0;
    TotalPHours := 0;
    TotalVHours := 0;
    for i:=0 to People-1 do
    begin
        TotalDays := TotalDays + AllTables[i].WorkingDays;
        TotalHours := TotalHours + AllTables[i].WorkingHours;
        TotalNHours := TotalNHours + AllTables[i].NightHours;
        TotalPHours := TotalPHours + AllTables[i].HolidayHours;
        TotalVHours := TotalVHours + AllTables[i].VihodnoiHours;
    end;
end;

function  VarToInt(v: Variant): Integer;
begin
	if VarIsNull(v) then Result := -1
	else Result := v;
end;

procedure TTableForm2.FillPeople;
var
	i, k: Integer;
	dt: TDate;
	y, m, d: Word;
    c_PCard: Integer;
begin
	SelectPeople.Open;
	SelectPeople.FetchAll;

	i := 0;
    TableGrid.RowCount := 2;

    for k:=0 to TableGrid.ColCount-1 do
        TableGrid.Cells[k, 1] := '';

    People := SelectPeople.RecordCount;
    TableGrid.RowCount := TableGrid.FixedRows + People;

    c_PCard := -1;
    Real_People := 0;
	with SelectPeople do
	begin
		First;
		while not Eof do
		begin
            if SelectPeople['Id_PCard'] <> c_PCard then
            begin
                inc(Real_People);
                c_PCard := SelectPeople['Id_PCard'];
            end;
			inc(i);
			TableGrid.Cells[0, i] := IntToStr(i);
			TableGrid.Cells[1, i] := SelectPeople['FIO'];
            TableGrid.Cells[2, i] := SelectPeople['TN'];
			TableGrid.Cells[3, i] := SelectPeople['Name_Post'];
			Next;
		end;
	end;
	SetLength(AllTables, People);

	SelectPeople.First;
	for k:=0 to People-1 do
	begin
		AllTables[k].Id_Man_Moving := SelectPeople['Id_Man_Moving'];
		AllTables[k].Id_Work_Mode := VarToInt(SelectPeople['Id_Work_Mode']);
        if not VarIsNull(SelectPeople['Work_Mode_Shift']) then
            AllTables[k].Work_Mode_Shift := SelectPeople['Work_Mode_Shift']
        else    AllTables[k].Work_Mode_Shift := 0;
		AllTables[k].Id_PCard := SelectPeople['Id_PCard'];
		AllTables[k].FIO := SelectPeople['FIO'];
        AllTables[k].Kol_Stavok := SelectPeople['Kol_Stavok'];
        AllTables[k].DateBeg := SelectPeople['Date_Beg'];
        AllTables[k].DateEnd := SelectPeople['Date_End'];

		AllTables[k].Written := False;
		AllTables[k].Modified := False;
        AllTables[k].Read := False;
        AllTables[k].TableSHours := Null;

		dt := SelectPeople['Date_Beg'];
		if dt > Month_Beg then
		begin
			DecodeDate(dt, y, m, d);
			AllTables[k].DayBeg := d;
		end
		else	AllTables[k].DayBeg := 1;

		dt := SelectPeople['Date_End'];
		if dt < Month_End then
		begin
			DecodeDate(dt, y, m, d);
			AllTables[k].DayEnd := d;
		end
		else	AllTables[k].DayEnd := Days;

		SelectPeople.Next;
	end;
end;

function  TTableForm2.FindMode(Id_Work_Mode: Integer): Integer;
begin
    for Result:=0 to High(WorkModes) do
        if WorkModes[Result].Id_Work_Mode = Id_Work_Mode then
            Exit;
    Result := High(WorkModes);
end;

function TTableForm2.FindMoving(Id_Man_Moving: Integer): Integer;
begin
	SelectPeople.Locate('Id_Man_Moving', Id_Man_Moving, []);
	Result := SelectPeople.RecNo-1;
end;

procedure TTableForm2.ModeHours(mode_ind, shift, day: Integer;
                var Time_Beg, Time_End, Break_Beg, Break_End: Variant);
var
    i, m: Integer;
    curDate, begDate: TDate;
begin
    if day <> 0 then curDate := EncodeDate(Year, Month, day)
    else curDate := EncodeDate(Year, Month, 1);

    begDate := Consts_Query['Shift_Begin'];
    m := Length(WorkModes[mode_ind].Work_Beg);

    if m <> 0 then i := (DaysBetween(begDate, curDate) - shift) mod m
    else i := 0;
    if day = 0 then dec(i);
    if ( i < 0 ) then i := m + i;


    Time_Beg := WorkModes[mode_ind].Work_Beg[i];
    Time_End := WorkModes[mode_ind].Work_End[i];
    Break_Beg := WorkModes[mode_ind].Break_Beg[i];
    Break_End := WorkModes[mode_ind].Break_End[i];
end;

procedure TTableForm2.SetMode(man_ind, mode_ind, day: Integer);
begin
    with AllTables[man_ind] do
    if Length(WorkModes[mode_ind].Work_Beg) = 0 then
    begin
        Vihods[day] := 35;
        Modes[day] := WorkModes[mode_ind].Id_Work_Mode;
        Work_Beg[day] := DefaultTime;
        Work_End[day] := Work_Beg[day];
    end
    else
    begin
        ModeHours(mode_ind, Work_Mode_Shift, day, Work_Beg[day], Work_End[day],
            Break_Beg[day], Break_End[day]);
        Modes[day] := WorkModes[mode_ind].Id_Work_Mode;

        CalcResults(man_ind);

        if Hours[day] =0 then Vihods[day] := 35
        else
        if NHours[day] <> 0 then Vihods[day] := 2
        else Vihods[day] := 1;
    end
end;

procedure TTableForm2.FillTable(i: Integer);
var
	day, mode_ind: Integer;
   	d1, d2: Word;
	Date_Beg, Date_End: TDate;
    yest_beg, yest_end, today_beg, today_end, br_beg, br_end: TTime;
begin
        // сформировать часы по умолчанию
    with AllTables[i] do
    begin
        for day := 0 to Days do
        begin
            VHours[day] := 0;
            ReadDay[day] := False;

            mode_ind := FindMode(Id_Work_Mode);
            SetMode(i, mode_ind, day);

       //     if Version = 2 then
            begin
                    // разбить периоды в один день
                if day >  0 then
                    SplitHours(Work_Beg[day-1], Work_End[day-1], True, yest_beg, yest_end)
                else
                begin
                    yest_beg := 0;
                    yest_end := 0;
                end;

                SplitHours(Work_Beg[day], Work_End[day], False, today_beg, today_end);
                if not VarIsNull(Break_Beg[day]) then
                    SplitHours(Break_Beg[day], Break_End[day], False, br_beg, br_end)
                else
                begin
                    br_beg := 0;
                    br_end := 0;
                end;

                    // часы по графику
                GHours[day] := (yest_end - yest_beg) + (today_end - today_beg);
                if GHours[day] > 0 then
                    GHours[day] := GHours[day] - (br_end-br_beg);
                    // для учета количества ставок - раскомментировать участок
                { GHours[day] := GHours[day] * Kol_Stavok; }
            end;

         //   if Version = 1 then
         //     GHours[day] := TimeDiff(Work_Beg[day], Work_End[day]);
        end;

        CalDays := DayEnd - DayBeg + 1;
    end;


            // проверить исключения
    with ExcQuery do
    begin
        Locate('Id_Work_Mode', AllTables[i].Id_Work_Mode, []);
        while not Eof and (ExcQuery['Id_Work_Mode'] = AllTables[i].Id_Work_Mode) do
        begin
            if ( YearOf(ExcQuery['Exc_Date']) = Year) and
               ( MonthOf(ExcQuery['Exc_Date']) = Month) then
            begin
                day := DayOf(ExcQuery['Exc_Date']);
                with AllTables[i] do
                if ExcQuery['Type'] = -1 then
                begin
                    if Work_Beg[day] <> Work_End[day] then
                        Work_End[day] := Work_End[day] - ExcQuery['Hours'];
                    if GHours[day] > ExcQuery['Hours'] then
                        GHours[day] := GHours[day] - ExcQuery['Hours'];
                end
                else
                if ExcQuery['Type'] = +1 then
                begin
                    if Work_Beg[day] <> Work_End[day] then
                        Work_End[day] := Work_End[day] + ExcQuery['Hours'];
                    GHours[day] := GHours[day] + ExcQuery['Hours'];
                end
                else
                if ExcQuery['Type'] = 0 then
                begin
                    Work_End[day] := Work_Beg[day] + ExcQuery['Hours'];
                    if not VarIsNull(Break_Beg[day]) then
                        Work_End[day] := Work_End[day] + Break_End[day] - Break_Beg[day];
                    GHours[day] := ExcQuery['Hours'];
                    if Work_End[day] > 1 then Work_End[day] := Work_End[day]-1;
                    if ExcQuery['Hours'] < 0.001 then
                        Vihods[day] := 35;
                end;
            end;
            Next;
        end;
    end;

        			// проверить отпуска
	with AllTables[i], HolidaysQuery do
	begin
   		Locate('Id_Man_Moving', Id_Man_Moving, []);
		while not Eof and (HolidaysQuery['Id_Man_Moving'] = Id_Man_Moving) do
		begin
    		Date_Beg := HolidaysQuery['Date_Beg'];
			Date_End := HolidaysQuery['Date_End'];

			if Date_Beg < Month_Beg then Date_Beg := Month_Beg;
			if Date_End > Month_End then Date_End := Month_End;

			d1 := DayOf(Date_Beg);
			d2 := DayOf(Date_End);

			for day := d1 to d2 do
			begin
                if XCalendar[day] then Vihods[day] := 35
                else Vihods[day] := HolidaysQuery['Id_Vihod'];
                Work_Beg[day] := DefaultTime;
   				Work_End[day] := DefaultTime;
                if (day > 0) and (Work_End[day-1] < Work_Beg[day-1]) then
                begin
                    Work_End[day-1] := 1;
                end;
			end;
			Next;
		end;
	end;

        		// проверить больничные
    with AllTables[i], HospitalsQuery do
	begin
		Locate('Id_Man_Moving', Id_Man_Moving, []);
		while not Eof and (HospitalsQuery['Id_Man_Moving'] = Id_Man_Moving) do
		begin
			Date_Beg := HospitalsQuery['Date_Beg'];
			Date_End := HospitalsQuery['Date_End'];

			if Date_Beg < Month_Beg then Date_Beg := Month_Beg;
			if Date_End > Month_End then Date_End := Month_End;

			d1 := DayOf(Date_Beg);
			d2 := DayOf(Date_End);

            if HospitalsQuery['Ending'] = 2 then
                d2 := days;

			for day := d1 to d2 do
            begin
                if GHours[day] > 0 then
        		begin
   		    		Vihods[day] := 16;
			        Work_Beg[day] := DefaultTime;
        	    	Work_End[day] := DefaultTime;
	           	end
                else
                begin
    		    	Vihods[day] := 35;
	    	   		Work_Beg[day] := DefaultTime;
   	        		Work_End[day] := DefaultTime;
    		    end;

                if (day > 0) and (Work_End[day-1] < Work_Beg[day-1]) then
                begin
                    Work_End[day-1] := 1;
                end;
            end;

			Next;
		end;
	end;

    with AllTables[i] do
    begin
                    // проверить, чтобы в первый день работы не потерять время
        if ( DayBeg > 1 ) and ( Work_Beg[DayBeg-1] > Work_End[DayBeg-1] ) then
            Work_Beg[DayBeg] := 0;

                // чтобы не было часов в первый день, когда чел не работал
        if DayBeg > 1 then
        begin
            Work_Beg[0] := 1/3;
            Work_End[0] := 1/3;
            Vihods[0] := 35;
            Modes[0] := -1;
        end;
               // поставить ноль часов в те дни, когда человек не работал
        for day := 1 to Days do
            if  (day < DayBeg ) or ( day > DayEnd ) then
            begin
                Vihods[day] := 35;
                Modes[day] := -1;
                Work_Beg[day] := 1/3;
                Work_End[day] := 1/3;
            end;

            // избавиться от переходяших часов в уже нерабочий день
        if (DayEnd < Days) and ( Work_Beg[DayEnd] > Work_End[DayEnd]) then
            Work_End[DayEnd] := 0;
    end;


    for day := 1 to 31 do
        AllTables[i].Selected[day] := False;
end;

procedure TTableForm2.Render(i: Integer; day: Integer);
var
	s: String;
    workBeg, workEnd, vihod: Variant;
begin
    workBeg := AllTables[i].Work_Beg[day];
    workEnd := AllTables[i].Work_End[day];
    vihod := AllTables[i].Vihods[day];

	with TableGrid do
	begin
        if ( ( day < AllTables[i].DayBeg ) or ( day > AllTables[i].DayEnd) )
            and ( AllTables[i].Hours[day] < 0.001 )
            then s := ''
        else
        if VarIsNull(workBeg) then s := ''
        else
        if AllTables[i].Hours[day] > 0.001 then
            s := EncodeTimeString(AllTables[i].Hours[day], DecBox.Checked)
        else
        if AllTables[i].Modes[day] = -1 then s := ''
        else
   		if VihodQuery.Locate('Id_Vihod', vihod, [])
            then s := VihodQuery['Name_Short'];

        Cells[TableGrid.FixedCols + day - 1, 1 + i] := s;
	end;
end;

procedure TTableForm2.ShowStatus(i, day: Integer);
var
    modeInd, db, m, ind: Integer;
begin
    if ( i < 0 ) or ( i > People-1) or ( day < 1 ) or ( day > Days ) then Exit;
    with AllTables[i] do
    begin
        if Work_Beg[day] <> Work_End[day] then
        begin
            WorkBegLabel.Caption := EncodeTimeString(Work_Beg[day], False);
            WorkEndLabel.Caption := EncodeTimeString(Work_End[day], False);
        end
        else
        begin
            WorkBegLabel.Caption := '-';
            WorkEndLabel.Caption := '-';
        end;
        HoursLabel.Caption := EncodeTimeString(Hours[day], DecBox.Checked);
        NHoursLabel.Caption := EncodeTimeString(NHours[day], DecBox.Checked);
        PHoursLabel.Caption := EncodeTimeString(PHours[day], DecBox.Checked);
        GHoursLabel.Caption := EncodeTimeString(GHours[day], DecBox.Checked);
        VHoursLabel.Caption := EncodeTimeString(VHours[day], DecBox.Checked);

        AllHoursLabel.Caption := FormatFloat('##0.###', WorkingHours);
		DaysLabel.Caption := IntToStr(WorkingDays);
        CalDaysLabel.Caption := IntToStr(CalDays);

        AllNHoursLabel.Caption := FormatFloat('##0.###', NightHours);

        AllPHoursLabel.Caption := FormatFloat('##0.###', HolidayHours);

        AllGHoursLabel.Caption := FormatFloat('##0.###', GraficHours);

        AllVHoursLabel.Caption := FormatFloat('##0.###', VihodnoiHours);

        SverhEdit.Text := FormatFloat('##0.###', SverhHours);

        DateBegLabel.Caption := DateToStr(DateBeg);
        DateEndLabel.Caption := DateToStr(DateEnd) + ' (' + IntToStr(DayBeg) +
            '-' + IntToStr(DayEnd) + ')';
        StavokLabel.Caption := FormatFloat('0.##', Kol_Stavok) + ' ст.';

        TotalHoursLabel.Caption := FormatFloat('##0.###', TotalHours);
		TotalDaysLabel.Caption := IntToStr(TotalDays);
        TotalNHoursLabel.Caption := FormatFloat('##0.###', TotalNHours);
        TotalPHoursLabel.Caption := FormatFloat('##0.###', TotalPHours);
        TotalVHoursLabel.Caption := FormatFloat('##0.###', TotalVHours);

        if not VarIsNull(AllTables[i].Vihods[day]) then
   	        VihodQuery.Locate('Id_Vihod', Vihods[day], []);
        VihodLabel.Caption := VihodQuery['Name_Full'];

        WorkModeBox.Prepare(Id_Work_Mode);
        modeInd := FindMode(Id_Work_Mode);
        NomerEdit.Text := IntToStr(WorkModes[modeInd].Nomer);
        ShiftSpin.Value := 0;

        db := DaysBetween(Consts_Query['Shift_Begin'], EncodeDate(Year, Month, 1));
        m := Length(WorkModes[modeInd].Work_Beg);

        if not VarIsNull(Work_Mode_Shift) then
        begin
            if m <> 0 then ind := (Work_Mode_Shift - db) mod m
            else ind := 0;
            if ind < 0 then ind := m + ind;
            if ind < m div 2 then ShiftSpin.Value := ind
            else ShiftSpin.Value := ind - m;
        end;

       	if Written then StatusLabel.Caption := 'записано до бази'
    	else
	    if Modified then StatusLabel.Caption := 'змінено'
    	else
        if Read then StatusLabel.Caption := 'прочитано з бази'
	    else StatusLabel.Caption := 'новий';

        case DayOfTheWeek(EncodeDate(Year, Month, day)) of
            1: WeekDayLabel.Caption := 'понеділок';
            2: WeekDayLabel.Caption := 'вівторок';
            3: WeekDayLabel.Caption := 'середа';
            4: WeekDayLabel.Caption := 'четвер';
            5: WeekDayLabel.Caption := 'п''ятниця';
            6: WeekDayLabel.Caption := 'субота';
            7: WeekDayLabel.Caption := 'неділя';
        end;
    end;
end;



function  TTableForm2.GetPeopleIndex(ARow: Integer): Integer;
begin
	Result := ARow - 1;
end;

function  TTableForm2.GetDay(ACol: Integer): Integer;
begin
	Result := ACol - TableGrid.FixedCols+1;
end;

procedure TTableForm2.ChangeCell(ACol, ARow: Integer);
var
	i, day: Integer;
	s: String;
    time: TTime;
begin
	s := Trim(TableGrid.Cells[ACol, ARow]);

    time := StringToTime(s);

	i := GetPeopleIndex(ARow);
	day := GetDay(ACol);

    if time <> 0 then
        SetTime(i, day, time)
    else
   	begin
		s := Trim(TableGrid.Cells[ACol, ARow]);
		s := LowerCase(s);
		if (s <> '') and not VihodQuery.Locate('Name_Short', s, []) then
		begin
			MessageDlg('Невірний тип виходу!', mtError, [mbOk], 0);
			TableGrid.Col := ACol;
			TableGrid.Row := ARow;
			Exit;
		end;
		i := GetPeopleIndex(ARow);
		day := GetDay(ACol);

		SetVihod(i, day, VihodQuery['Id_Vihod']);
	end;

    MCol := -1;
	MRow := -1;

	if ( ACol = TableGrid.Col ) and ( ARow = TableGrid.Row) then
	if TableGrid.Col < TableGrid.ColCount-1 then
		TableGrid.Col := TableGrid.Col + 1
	else
	if TableGrid.Row < TableGrid.RowCount-1 then
	begin
		TableGrid.Col := TableGrid.FixedCols;
		TableGrid.Row := TableGrid.Row + 1;
	end;
end;

procedure TTableForm2.FormButtonClick(Sender: TObject);
var
	i, bad: Integer;
	s: String;
    form: TProcessForm;
begin
    form := TProcessForm.Create(Self);
    form.Show;
    form.Progress.Max := People;

	for i:=0 to People-1 do
	begin
		if (AllTables[i].Modified and not AllTables[i].Written)
            or not AllTables[i].Read then
		begin
			WriteTable(i);
			TableGrid.Repaint;
            if Stop then break;
            form.Step;
		end;
	end;
    form.Close;

	bad := 0;
	for i:=0 to People-1 do
		if AllTables[i].Modified and not AllTables[i].Written then
			inc(bad);

	s := '';
	if bad > 0 then s := 'Залишилось занести ' + IntToStr(bad) + ' табелів.';
	ShowMessage('Табеля було занесено!' + s);
end;

function  TTableForm2.WriteTable(i: Integer): Boolean;
var
	day, lday, Id_PBKey: Integer;
	monthString, dayStr: String;
	ds: Char;
    dbf: Boolean;
begin
    if not Test then
    begin
        MessageDlg('Табельный учет в процессе переработки. Будет в среду.', mtError, [mbOk], 0);
        Result := False;
        Exit;
    end;

	Result := True;

	BufTran.Start;
    with AllTables[i] do
	try
        with InsertTable.Params do
        begin
            ParamValues['Id_Man_Moving'] := Id_Man_Moving;
            ParamValues['Tbl_Year'] := Year;
            ParamValues['Tbl_Month'] := Month;
        end;

        for day := Days downto 1 do
            if Hours[day] > 0 then
            begin
                lday := day;
                break;
            end;

                // записать табель в Interbase
        for day := 1 to Days do
        begin
            with InsertTable.Params do
            begin
                ParamValues['Tbl_Day'] := day;
                ParamValues['Work_Beg'] := Work_Beg[day];
                ParamValues['Work_End'] := Work_End[day];
                ParamValues['Id_Vihod'] := Vihods[day];
                ParamValues['Id_Work_Mode'] := Id_Work_Mode;
                ParamValues['Break_Beg'] := Break_Beg[day];
                ParamValues['Break_End'] := Break_End[day];
                ParamValues['Hours'] := Hours[day];
                ParamValues['NHours'] := NHours[day];
                ParamValues['PHours'] := PHours[day];
                ParamValues['GHours'] := GHours[day];
                ParamValues['VHours'] := VHours[day];
                if day = lday then
                    ParamValues['SHours'] := SverhHours
                else ParamValues['SHours'] := 0;
            end;
            ExecQuery(InsertTable);

            if Version = 2 then
            begin
       	    	ID_PBKey := BufTran.AddRecord('NTable', 'Buff_NTable');
                with BufInsertNTable.Params do
                begin
                    ParamValues['Id_PBKey'] := Id_PBKey;
                    if Read then ParamValues['Action'] := 2
                    else ParamValues['Action'] := 1;
                    ParamValues['Id_Man_Moving'] := Id_Man_Moving;
                    ParamValues['Year'] := Year;
                    ParamValues['Month'] := Month;
                    ParamValues['Day'] := day;
                    ParamValues['Time_Beg'] := Work_Beg[day];
                    ParamValues['Time_End'] := Work_End[day];
                    ParamValues['Break_Beg'] := Break_Beg[day];
                    ParamValues['Break_End'] := Break_End[day];
                    ParamValues['Hours'] := Hours[day];
                    ParamValues['NHours'] := NHours[day];
                    ParamValues['PHours'] := PHours[day];
                    ParamValues['GHours'] := GHours[day];
                    ParamValues['VHours'] := VHours[day];
                    ParamValues['Id_Vihod'] := Vihods[day];
                    if day = lday then
                        ParamValues['SHours'] := SverhHours
                    else ParamValues['SHours'] := 0;
                end;
                ExecQuery(BufInsertNTable);
                
                if DontWriteTableToDbf then
                begin
                    dbf := DontWriteToDbf;
                    DontWriteToDbf := True;
                end;

       	    	WriteToDbf('NTable', 'Buff_NTable', Id_PBKey);

                if DontWriteTableToDbf then DontWriteToDbf := dbf;
            end;
        end;

        if Version = 1 then
        begin
    			// сформировать текстовое представление часов для буфера ЛТД
	    	monthString := '';
    		ds := DecimalSeparator;
	    	DecimalSeparator := '.';
    		for day:=1 to 31 do
	    	begin
		    	if XCalendar[day] then dayStr := 'PRAZ'
			    else
    			if ( day > Days) or ( Hours[day] = 0 ) then dayStr := 'VIHD'
	    		else
		    	dayStr := FormatFloat('00.0', HourSpan(0, Hours[day]));

			    if Length(dayStr) > 4 then dayStr := Copy(dayStr, 1, 4);
    			monthString := monthString + dayStr;
	    	end;
		    DecimalSeparator := ds;

    			// получаем Id_PBKey
	    	ID_PBKey := BufTran.AddRecord('Dt_Time', 'Buff_Dt_Time');

			    // пишем в буфер Interbase часы выходов
		    with HoursBufferQuery.Params do
    		begin
	    		ParamValues['Id_Work_Mode'] := Id_Work_Mode;
		    	{if CreatedRealMode then ParamValues['Id_Action'] := 1   TODO: fix action if table was created
			    else    }ParamValues['Id_Action'] := 1;
    			ParamValues['Day_Types'] := monthString;
	    		ParamValues['Id_PBKey'] := Id_PBKey;
		    end;
    		ExecQuery(HoursBufferQuery);

            if DontWriteTableToDbf then
            begin
                dbf := DontWriteToDbf;
                DontWriteToDbf := True;
            end;

	    	WriteToDbf('Dt_Time', 'Buff_Dt_Time', Id_PBKey);

            DontWriteToDbf := dbf;
          {
    			// записываем данные по выходам за месяц ЛТД
            for day:=1 to 31 do
            begin
                with WriteVihodsQuery do
		    	begin
			    	Params.ParamValues['Id_Man_Moving'] := Id_Man_Moving;
    				Params.ParamValues['Tbl_Day'] := day;
	    			Params.ParamValues['Id_Vihod'] := Vihods[day];
			    end;
			ExecQuery(WriteVihodsQuery);
           }
    			// формируем строку дней для записи в буфер табеля ЛТД
	    	monthString := '';
    		for day:=1 to 31 do
	    	begin
		    	dayStr := IntToStr(Vihods[day]);
    			if Length(dayStr) > 2 then dayStr  := Copy(dayStr, 1, 2);
		    	if Length(dayStr) = 1 then dayStr := '0' + dayStr;
	    		monthString := monthString + dayStr;
    		end;

    			// получаем Id_PBKey для табеля ЛТД
	    	ID_PBKey := BufTran.AddRecord('Table', 'Buff_Table');

    			// пишем в буфер Interbase выходы за месяц
	    	with VihodsBufferQuery.Params do
    		begin
	    		ParamValues['Id_Man_Moving'] := Id_Man_Moving;
{		    	if DefaultVihodsQuery.Locate('Id_Man_Moving', Id_Man_Moving, []) TODO: action??
    			then
	    			ParamValues['Id_Action'] := 2
		    	else   }	ParamValues['Id_Action'] := 1;
			    ParamValues['Day_Types'] := monthString;
    			ParamValues['Id_PBKey'] := Id_PBKey;
	    	end;
    		ExecQuery(VihodsBufferQuery);

		    	// пишем в dbf
            if DontWriteTableToDbf then
            begin
                dbf := DontWriteToDbf;
                DontWriteToDbf := True;
            end;

	    	WriteToDbf('Table', 'Buff_Table', Id_PBKey);

            DontWriteToDbf := dbf;
        end;

	except on e: Exception do
	begin
		Result := False;
		BufTran.Rollback;
		Exit;
	end;
	end;
	BufTran.Commit;
	AllTables[i].Written := True;
	AllTables[i].Modified := False;
end;

procedure TTableForm2.ReportButtonClick(Sender: TObject);
var
	form: TTablePrintForm;
begin
	form := TTablePrintForm.Create(Self);
	form.Id_Department := Id_Department;
	form.DepartmentEdit.Text := DepartmentEdit.Text;
	form.MonthBox.ItemIndex := Month-1;
	form.YearEdit.Text := IntToStr(Year);
	form.ShowModal;
	form.Free;
end;

procedure TTableForm2.TableGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
	i, dweek, day: Integer;
	color, oldColor: TColor;
	rect2: TRect;
    hours1, hours2, vhours2: TTime;
begin
   	i := GetPeopleIndex(ARow);
	day := GetDay(ACol);

	with TableGrid.Canvas do
    begin
            // выделение?
        if (i >= 0) and ( i <= People-1) and (day >= 1) and (day <= Days) and
                    AllTables[i].Selected[day] then
        begin
            Brush.Color := clSkyBlue;
            FillRect(Rect);
        end
        else
                    // часы в период, когда человек не работает
        if (i >= 0) and ( i <= People-1) and (day >= 1) and (day <= Days) and
            (AllTables[i].Hours[day] > 0.001)
            and ( (day < AllTables[i].DayBeg) or (day>AllTables[i].DayEnd)) then
        begin
            Brush.Color := RGB(255, 204, 237);
            FillRect(Rect);
        end
        else
			// покрасить фон чересполосицей
		if (ARow > 0) then
		begin
			if ( ACol > 3 ) then            // фон текущей строки/столбца дальше
                if ACol = SelectedCol then Brush.Color := RGB(220, 250, 255)
                else
                if ARow = SelectedRow then Brush.Color := RGB(220, 250, 255)
                else
                if ARow mod 2 = 0 then Brush.Color := clInfoBk
                else Brush.Color := clWhite
			else                          // фон текущей стр/стлб в начале
                if ARow = SelectedRow then Brush.Color := RGB(220, 250, 255)
                else
				if ARow mod 2 = 0 then Brush.Color := clMoneyGreen
				else	Brush.Color := clSkyBlue;


            FillRect(Rect);
		end;

			// подкрасить статус
		if (ACol = 0) and (ARow > 0) and Loaded then
		begin
			if (i > People-1) or ( i < 0 ) then Exit;

			if not AllTables[i].Written and AllTables[i].Modified then
				color := clRed
            else
			if AllTables[i].Written and not AllTables[i].Modified then
				color := clGreen
            else
			if AllTables[i].Read then color := clGray
            else    color := clYellow;

			oldColor := Brush.Color;
			Brush.Color := color;

            if ARow = SelectedRow then
            begin
    			rect2.Left := Rect.Left + 6;
	    		rect2.Top := Rect.Top + 6;
		    	rect2.Right := Rect.Left + 24;
			    rect2.Bottom := Rect.Top + 24;
            end
            else
            begin
    			rect2.Left := Rect.Left + 12;
	    		rect2.Top := Rect.Top + 12;
		    	rect2.Right := Rect.Left + 24;
			    rect2.Bottom := Rect.Top + 24;
            end;
			Ellipse(rect2);

			Brush.Color := oldColor;
		end;
			// подкрасить числа
		if (ARow = 0) and (ACol >= TableGrid.FixedCols) and (ACol <= Days+3) then
		begin
                    // выделение дня
            if ACol = SelectedCol then
            begin
                Brush.Color := clSkyBlue;
                FillRect(Rect);
                TextRect(Rect, Rect.Left,Rect.Top,TableGrid.Cells[ACol, ARow]);
            end;
					// праздники
			if XCalendar[ACol - TableGrid.FixedCols + 1] then
			begin
				Brush.Color := clRed;
				Rect.Left := Rect.Left + 15;
				Rect.Top := Rect.Top + 15;
				Rect.Right := Rect.Left + 8;
				Rect.Bottom := Rect.Top + 8;
				Ellipse(Rect);
			end
			else	  	// выходные
			begin
				dweek := DayOfTheWeek(EncodeDate(Year, Month, ACol-TableGrid.FixedCols+1));
				if (dweek = 6) or (dweek = 7) then
				begin
					Brush.Color := clYellow;
					Rect.Left := Rect.Left + 15;
					Rect.Top := Rect.Top + 15;
					Rect.Right := Rect.Left + 8;
					Rect.Bottom := Rect.Top + 8;
					Ellipse(Rect);
				end;
			end;
		end;

			// подкрасить типы выходов
        if ( ARow > 0 ) and ( i >= 0 ) and ( i< People ) and (day >= 1)
            and (day <= Days ) then
        if  AllTables[i].Hours[day] < 0.001  then
            Font.Color := clRed
        else
        if  AllTables[i].VHours[day] > 0.001 then
            Font.Color := clGreen
        else
        if  AllTables[i].NHours[day] > 0.001 then
            Font.Color := clBlue
        else    Font.Color := clBlack;

			// вывести текст
		if (ARow > 0) then
            if ACol > 0 then
			    TextRect(Rect, Rect.Left,Rect.Top,TableGrid.Cells[ACol, ARow])
            else TextOut(Rect.Left,Rect.Top,TableGrid.Cells[ACol, ARow]);

                                 // несоответствие с графиком
            if (i >= 0) and ( i <= People-1) then
            with AllTables[i] do
            if (day >= DayBeg) and (day <= DayEnd) then
            begin
                hours1 := GHours[day]*Kol_Stavok;
                hours2 := Hours[day];
                if VarIsNull(VHours[day]) then vhours2 := 0
                else vhours2 := VHours[day];

                if ( ( hours1 < eps ) and ( abs(hours2-vhours2) > eps ) ) or
                    ( (hours1 > eps ) and ( hours2 > eps ) and (abs(hours2-hours1) > eps))
                then
                begin
                    Brush.Color := clRed;
                    Rect2.Left := Rect.Left + 18;
                    Rect2.Top := Rect.Top + 18;
                    Rect2.Right := Rect2.Left + 5;
                    Rect2.Bottom := Rect2.Top + 5;
                    Ellipse(Rect2);
                end;
            end;

            if (i >= 0) and ( i <= People-1) and (day >= 1) and (day <= Days)
                and ( ARow = SelectedRow) and ( ACol = SelectedCol ) then
            begin
                Brush.Color := clRed;
                FrameRect(Rect);
            end;
	end;
end;

procedure TTableForm2.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
	i: Integer;
begin
	CanClose := True;
	for i := 0 to People-1 do
		if AllTables[i].Modified and not AllTables[i].Written
            then CanClose := False;

	if not CanClose then
	begin
		if MessageDlg('Не всі табелі були занесени у базу даних! Вийти?',
			mtConfirmation, [mbYes,mbNo], 0 ) = mrYes then
		CanClose := True;
		Exit;
	end;
end;

procedure TTableForm2.TableGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
	i, day: Integer;
begin
    SelectedRow := ARow;

	if ( MRow <> -1 ) and ( MCol <> -1 ) and
	       ( ( MRow <> ARow) or ( MCol <> ACol) )
		then ChangeCell(MCol, MRow);

	i := GetPeopleIndex(ARow);
	day := GetDay(ACol);

	if (i < 0) or ( i > People-1) or (day < 1) or (day > Days) then Exit;

    oSelectI := SelectI;
    oSelectDay := SelectDay;
    SelectI := i;
    SelectDay := day;

    ShowStatus(i, day);

    DrawSelect(ARow, ACol);
end;

procedure TTableForm2.TableGridMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
	ARow, ACol: Integer;
begin
	TableGrid.MouseToCell(X, Y, ACol, ARow);

	if ( ARow > 0 ) and  ( (ACol >= 1) or (ACol <= 3) ) then
	begin
		TableGrid.Hint := TableGrid.Cells[ACol, ARow]
	end
	else	TableGrid.Hint := '';
end;

procedure TTableForm2.AcceptModeButtonClick(Sender: TObject);
var
    i, day, newShift, newMode, newModeNomer, {ID_PBKey,} m, db: Integer;
begin
    MessageDlg('Потрібно ввести наказ на зміну графіка!', mtError, [mbOk], 0);
    Exit;

    i := GetPeopleIndex(TableGrid.Row);

    if ( i < 0 ) or ( i > People-1 ) then Exit;

    newShift := ShiftSpin.Value;
    try
        newModeNomer := StrToInt(NomerEdit.Text);
    except
        MessageDlg('Невірний номер режиму!', mtError, [mbOk], 0);
        Exit;
    end;

    for newMode := 0 to High(WorkModes) do
        if WorkModes[newMode].Nomer = newModeNomer then break;

    db := DaysBetween(Consts_Query['Shift_Begin'], EncodeDate(Year, Month, 1));
    m := Length(WorkModes[newMode].Work_Beg);

    if m <> 0 then newShift := (newShift + db) mod m
    else newShift := 0;

    if newShift < 0 then newShift := newShift + m;
    BufTran.Start;
    try
        with ChangeMode.Params do
        begin
            ParamValues['Id_Man_Moving'] := AllTables[i].Id_Man_Moving;
            ParamValues['Id_Work_Mode'] := WorkModes[newMode].Id_Work_Mode;
            ParamValues['Work_Mode_Shift'] := newShift;
            ParamValues['Cur_Date'] := EncodeDate(Year, Month, Days);
        end;
        ExecQuery(ChangeMode);

        {
        ID_PBKey := BufTran.AddRecord('NMoving', 'Buff_NMoving');

        if Version = 2 then
        with BufNChangeMode.Params do
        begin
            ParamValues['Id_PBKey'] := Id_PBKey;
            ParamValues['Id_Man_Moving'] := AllTables[i].Id_Man_Moving;
            ParamValues['Id_Work_Mode'] := WorkModes[newMode].Id_Work_Mode;
            ParamValues['Work_Mode_Shift'] := newShift;
        end;
        ExecQuery(BufNChangeMode);

        WriteToDbf('NMoving', 'Buff_NMoving', ID_PBKey);
        }
    except on e:Exception do
    begin
        ShowError(e);
        BufTran.Rollback;
        ModalResult := 0;
        Exit;
    end;
    end;
    BufTran.Commit;

    AllTables[i].Id_Work_Mode := WorkModes[newMode].Id_Work_Mode;
    AllTables[i].Work_Mode_Shift := newShift;
    AllTables[i].Modified := True;

    if RecalcTable.Checked then
    begin
        FillTable(i);
        CalcResults(i);
    end;
    for day:=1 to Days do Render(i, day);
    ShowStatus(i, 1);
end;

procedure TTableForm2.WorkModeBoxChange(Sender: TObject);
begin
    if People > 0 then
    begin
        NomerEdit.Text := IntToStr(WorkModes[FindMode(WorkModeBox.GetId)].Nomer);
        ShiftSpin.Value := 0;
    end;
end;

procedure TTableForm2.TableGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
    i, day, minI, maxI, minDay, maxDay: Integer;
begin
  	if (SelectI < 0) or ( SelectI > People-1) or
        (SelectDay < 1) or (SelectDay > Days) then Exit;

    if ssCtrl in Shift then
    begin
        AllTables[SelectI].Selected[SelectDay] :=
            not AllTables[SelectI].Selected[SelectDay];
        TableGrid.Repaint;
    end;

    if SelectI < oSelectI then
    begin
        minI := SelectI;
        maxI := oSelectI;
    end
    else
    begin
        minI := oSelectI;
        maxI := SelectI;
    end;

    if SelectDay < oSelectDay then
    begin
        minDay := SelectDay;
        maxDay := oSelectDay;
    end
    else
    begin
        minDay := oSelectDay;
        maxDay := SelectDay;
    end;

    if ssShift in Shift then
    begin
        for i := minI to maxI do
            for day := minDay to maxDay do

                AllTables[i].Selected[day] := not AllTables[i].Selected[day];
        TableGrid.Repaint;
    end;

    SearchEdit.Text := '';
end;

procedure TTableForm2.ChangeButtonClick(Sender: TObject);
var
    form: TChangeTableForm;
    i, day, newModeNomer, newMode, cI, cDay: Integer;
    empty: Boolean;
    db, m, newShift, ind: Integer;
begin
	cI := GetPeopleIndex(TableGrid.Row);
	cDay := GetDay(TableGrid.Col);

    form := TChangeTableForm.Create(Self);
    with form do
    begin
            // подставить значения
        with AllTables[cI] do
        begin
            if Work_Beg[cDay] <> Work_End[cDay] then
            begin
                WorkBegEdit.Text := EncodeTimeString(Work_Beg[cDay], DecBox.Checked);
                WorkEndEdit.Text := EncodeTimeString(Work_End[cDay], DecBox.Checked);

                if not VarIsNull(Break_Beg[cDay]) then
                begin
                    BreakBegEdit.Text := EncodeTimeString(Break_Beg[cDay], DecBox.Checked);
                    BreakEndEdit.Text := EncodeTimeString(Break_End[cDay], DecBox.Checked);
                end;
            end;

            if not VarIsNull(Vihods[cDay]) then
                VihodBox.Prepare(Vihods[cDay]);

            WorkModeBox.Prepare(Id_Work_Mode);

            ShiftSpin.Value := Work_Mode_Shift;

            db := DaysBetween(Consts_Query['Shift_Begin'], EncodeDate(Year, Month, 1));
            m := Length(WorkModes[FindMode(Id_Work_Mode)].Work_Beg);

            if not VarIsNull(Work_Mode_Shift) then
            begin
                if m <> 0 then ind := (Work_Mode_Shift - db) mod m
                else ind := 0;

                if ind < 0 then ind := m + ind;
                if ind < m div 2 then ShiftSpin.Value := ind
                else ShiftSpin.Value := ind - m;
            end;

        end;

    	if (cI >= 0) or ( cI <= People-1) or (cDay >= 1) or (cDay <= Days) then
        begin
            empty := True;
            for i := 0 to People-1 do
                for day := 1 to Days do
                    if AllTables[i].Selected[day] then
                    begin
                        empty := False;
                        break;
                    end;
            if empty then AllTables[cI].Selected[cDay] := True;
        end;

        if ShowModal = mrOk then
        begin
            for i := 0 to People-1 do
                for day := 1 to Days do
                with AllTables[i] do
                if Selected[day] then
                begin
                    if TimeRadio.Checked then
                    begin
                        Work_Beg[day] := StringToTime(WorkBegEdit.Text);
                        Work_End[day] := StringToTime(WorkEndEdit.Text);
                        if Trim(BreakBegEdit.Text) <> '' then
                        begin
                            Break_Beg[day] := StringToTime(BreakBegEdit.Text);
                            Break_End[day] := StringToTime(BreakEndEdit.Text);
                        end
                        else
                        begin
                            Break_Beg[day] := Null;
                            Break_End[day] := Null;
                        end;
                        if Work_Beg[day] > Work_End[day] then
                            Vihods[day] := 2
                        else Vihods[day] := 1;
                    end
                    else
                    if VihodRadio.Checked then
                    begin
                        VihodQuery.Locate('Id_Vihod', VihodBox.GetId, []);
                        Vihods[day] := VihodBox.GetId;
                        Work_Beg[day] := DefaultTime;
                        Work_End[day] := DefaultTime;
                    end
                    else
                    if  WorkModeRadio.Checked then
                    begin
                        try
                            newModeNomer := StrToInt(form.NomerEdit.Text);
                        except
                            newModeNomer := WorkModes[FindMode(WorkModeBox.GetId)].Nomer;
                        end;

                        for newMode := 0 to High(WorkModes) do
                            if WorkModes[newMode].Nomer = newModeNomer then
                                break;

                        db := DaysBetween(Consts_Query['Shift_Begin'],
                            EncodeDate(Year, Month, 1));
                        m := Length(WorkModes[newMode].Work_Beg);
                        if m <> 0 then
                        newShift := (form.ShiftSpin.Value + db) mod m
                        else newShift := 0;

                        if newShift < 0 then newShift := newShift + m;

                        ModeHours(newMode, newShift, day,
                            Work_Beg[day], Work_End[day], Break_Beg[day],
                            Break_End[day]);
                        Modes[day] := WorkModes[newMode].Id_Work_Mode;

                        CalcResults(i);
                        if Hours[day] =0 then Vihods[day] := 35
                        else
                        if NHours[day] > 0.001 then Vihods[day] := 2
                        else Vihods[day] := 1;
                    end;
                    Modified := True;
                    Written := False;
                    Selected[day] := False;
                    ReadDay[day] := False;
                    if day < Days then ReadDay[day+1] := False;
                    CalcResults(i);
                    Render(i, day);
                    if day < Days then
                    begin
                        if Hours[day+1] < 0.001 then Vihods[day+1] := 35
                        else
                        if NHours[day+1] > 0.001 then Vihods[day+1] := 2
                        else Vihods[day+1] := 1;
                        Render(i, day+1);
                    end;
                end;

                for i := 0 to People-1 do
                for day := 1 to Days do
                    AllTables[i].Selected[day] := False;
        end
        else
            for i := 0 to People-1 do
                for day := 1 to Days do
                    AllTables[i].Selected[day] := False;

        ShowStatus(cI, cDay);
        TableGrid.Repaint;
        Free;
    end;
end;

procedure TTableForm2.NewButtonClick(Sender: TObject);
var
    i, day: Integer;
begin
	i := GetPeopleIndex(TableGrid.Row);

  	if (i >= 0) or ( i <= People-1) then
    begin
        FillTable(i);
        CalcResults(i);
        for day := 1 to Days do
            Render(i, day);
        AllTables[i].Modified := False;
        AllTables[i].Written := False;
        AllTables[i].Read := False;
        TableGrid.Repaint;
        ShowStatus(i, 1);
    end;
end;

procedure TTableForm2.SverhEditChange(Sender: TObject);
var
    i: Integer;
    s: String;
begin
  	i := GetPeopleIndex(TableGrid.Row);
  	if ((i >= 0) or ( i <= People-1)) and React then
    try
        s := SverhEdit.Text;
        s := StringReplace(s, '.', DecimalSeparator,[]);
        s := StringReplace(s, ',', DecimalSeparator,[]);
        AllTables[i].SverhHours := StrToFloat(s);
    except
    end;
end;

procedure TTableForm2.SverhEditEnter(Sender: TObject);
begin
    React := True;
end;

procedure TTableForm2.SverhEditExit(Sender: TObject);
begin
    React := False;
end;

procedure TTableForm2.TableGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	i, day: Integer;
begin
	if Key = VK_DELETE then
	begin
		i := GetPeopleIndex(TableGrid.Row);
		day := GetDay(TableGrid.Col);
		SetTime(i, day, 0);
		Key := 0;
	end;
	if Key = VK_RETURN then
	begin
		ChangeCell(TableGrid.Col, TableGrid.Row);
		Key := 0;
	end;
end;

procedure TTableForm2.TableGridKeyPress(Sender: TObject; var Key: Char);
begin
	MRow := TableGrid.Row;
	MCol := TableGrid.Col;
end;

procedure TTableForm2.SearchEditChange(Sender: TObject);
var
    TN: Integer;
begin
    if SelectPeople.IsEmpty then Exit;
    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        SelectPeople.Locate('TN', SearchEdit.Text, [loPartialKey])
    else
        SelectPeople.Locate('FIO', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);

    TableGrid.Row := SelectPeople.RecNo + TableGrid.FixedRows - 1;
    TableGrid.Col := TableGrid.FixedCols;
    DrawSelect(TableGrid.Row, TableGrid.Col);
end;

procedure TTableForm2.SearchEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then TableGrid.SetFocus;
end;

procedure TTableForm2.WriteOneButtonClick(Sender: TObject);
var
    i: Integer;
    NagScreen: TNagScreen;
begin
	i := GetPeopleIndex(TableGrid.Row);
  	if (i >= 0) or ( i <= People-1) then
    begin
        NagScreen := TNagScreen.Create(self);
        NagScreen.Show;
        NagScreen.SetStatusText('Заноситься табель...');

        WriteTable(i);
        TableGrid.Repaint;

        NagScreen.Free;
    end;
end;

procedure TTableForm2.SetTime(i, day: Integer; time: TTime);
var
    yest_beg, yest_end, new_time: TTime;
begin
    with AllTables[i] do
    begin
        if Work_Beg[day] = Work_End[day] then
        begin
            Work_Beg[day] := 8/24;
            Vihods[day] := 1;
        end;

        SplitHours(Work_Beg[day-1], Work_End[day-1], True, yest_beg, yest_end);

        if time < yest_end-yest_beg then
        begin
            Work_Beg[day-1] := 8/24;
            Work_End[day-1] := Work_Beg[day-1];
            Work_Beg[day] := 8/24;
            Work_End[day] := Work_Beg[day] + time;
        end
        else
        begin
            new_time := Work_Beg[day] + time - (yest_end-yest_beg);
            if new_time < 1 then Work_End[day] := new_time
            else
            begin
                Work_End[day] := 1;
                Work_Beg[day] := 1 - time - (yest_end - yest_beg);
            end;
        end;

        if not VarIsNull(Break_Beg[day]) then
            Work_End[day] := Work_End[day] + Break_End[day] - Break_Beg[day];

        Modified := True;
        ReadDay[day] := False;
    end;
    CalcResults(i);
    if ( AllTables[i].Hours[day] < 0.001 ) and ( AllTables[i].Vihods[day] <= 2)
        then AllTables[i].Vihods[day] := 35; 
    Render(i, day);
end;

procedure TTableForm2.SetVihod(i, day, vihod: Integer);
var
    render_prev: Boolean;
begin
    with AllTables[i] do
    begin
        Work_Beg[day] := 8/24;
        Work_End[day] := 8/24;
        Break_Beg[day] := Null;
        Break_End[day] := Null;
        Vihods[day] := vihod;
        Modified := True;
        ReadDay[day] := False;

        if (day > 0) and ( Work_Beg[day-1] > Work_End[day-1] ) then
        begin
            Work_End[day-1] := 1;
            render_prev := true;
        end
        else render_prev := false;
    end;
    CalcResults(i);
    Render(i, day);
    if render_prev then Render(i, day-1);
end;

procedure TTableForm2.DecBoxClick(Sender: TObject);
var
    i, day: Integer;
begin
    for i:=0 to People-1 do
        for day := 1 to Days do
            Render(i, day);
    TableGrid.Repaint;
end;

procedure TTableForm2.DrawSelect(NewRow, NewCol: Integer);
begin
    SelectedRow := NewRow;
    SelectedCol := NewCol;
    TableGrid.Refresh;
end;

procedure TTableForm2.HoursPanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
    id_man_moving, s, i: Integer;
begin
    i := GetPeopleIndex(SelectedRow);
    id_man_moving := AllTables[i].Id_Man_Moving;
    s := AllTables[i].Work_Mode_Shift;

    if (ssCtrl in Shift) and (ssAlt  in Shift ) then
        ShowMessage('Id_Man_Moving: ' + IntToStr(id_man_moving) +
            ' Shift: ' + IntToStr(s));

end;

procedure TTableForm2.HeadItemClick(Sender: TObject);
begin
    HeadItem.Checked := not HeadItem.Checked;
    HeaderPanel.Visible := HeadItem.Checked;
end;

procedure TTableForm2.StatusItemClick(Sender: TObject);
begin
    StatusItem.Checked := not StatusItem.Checked;
    StatusPanel.Visible := StatusItem.Checked;
end;

procedure TTableForm2.WorkModeItemClick(Sender: TObject);
begin
    WorkModeItem.Checked := not WorkModeItem.Checked;
    WorkModePanel.Visible := WorkModeItem.Checked;
end;

procedure TTableForm2.HoursItemClick(Sender: TObject);
begin
    HoursItem.Checked := not HoursItem.Checked;
    HoursPanel.Visible := HoursItem.Checked;
end;

procedure TTableForm2.AllItemClick(Sender: TObject);
begin
    AllItem.Checked := not AllItem.Checked;
    AllPanel.Visible := AllItem.Checked;
end;

procedure TTableForm2.VihodnoiItemClick(Sender: TObject);
var
    i, day: Integer;
begin
    i := GetPeopleIndex(TableGrid.Row);
	day := GetDay(TableGrid.Col);

    if (i >= 0) and ( i <= People-1) and (day >= 1) and (day <= Days) then
    with AllTables[i] do
    begin
        VihodnoiItem.Checked := not VihodnoiItem.Checked;
        if VihodnoiItem.Checked then
            VHours[day] := Hours[day]
        else VHours[day] := 0;
        Modified := True;
        Written := False;
        ReadDay[day] := False;
        CalcResults(i);
        ShowStatus(i, day);
        TableGrid.Repaint;
    end
end;

procedure TTableForm2.TablePopupPopup(Sender: TObject);
var
    i, day: Integer;
begin
    i := GetPeopleIndex(TableGrid.Row);
	day := GetDay(TableGrid.Col);

    if (i >= 0) and ( i <= People-1) and (day >= 1) and (day <= Days)
        and ( AllTables[i].Hours[day] > 0.001 ) then
    begin
        VihodnoiItem.Visible := True;
        VihodnoiItem.Checked := AllTables[i].VHours[day] > 0.001;
    end
    else VihodnoiItem.Visible := False;
end;

procedure TTableForm2.ManItemClick(Sender: TObject);
begin
    ManItem.Checked := not ManItem.Checked;
    ManPanel.Visible := ManItem.Checked;
end;

procedure TTableForm2.FormShow(Sender: TObject);
begin
  if CheckAccess('/ROOT/Table','View',True)<>0 then
  begin
      Close;
      Exit;
  end;
if CheckAccess('/ROOT/Table','Edit')<>0 then
begin
     NewButton.Enabled:=False;
     ChangeButton.Enabled:=False;
     WriteOneButton.Enabled:=False;
     WriteAllButton.Enabled:=False;
     WorkModePanel.Enabled:=False;
     TableGrid.Options:=TableGrid.Options-[goEditing];
end;

end;

procedure TTableForm2.ChangePopupButtonClick(Sender: TObject);
begin
    ChangeButtonClick(Self);
end;
end.
