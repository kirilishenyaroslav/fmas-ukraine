
{ -$Id: TablePrint.pas,v 1.2 2005/09/20 12:44:12 valik Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                  Модуль "Печать отчета по табельному учету"                  }
{                    Печать отчета по табельному учету                         }
{                                                  ответственный: Олег Волков  }

unit TablePrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, FR_Desgn, FR_DSet, FR_DBSet, FR_Class, SpCommon,
  PersonalCommon, DB, IBCustomDataSet, IBQuery, Mask, CheckEditUnit,
  DepartmentsViewUnit, Spin, DateUtils, SpTimeUtils, Registry, Grids,
  DBGrids;

type
  TTablePrintForm = class(TReportForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    TableReport: TfrReport;
    Label1: TLabel;
    Label3: TLabel;
    MonthBox: TComboBox;
    DepartmentEdit: TEdit;
    Label4: TLabel;
    DepartmentButton: TBitBtn;
    ExportButton: TBitBtn;
    SelectPeople: TIBQuery;
    YearEdit: TSpinEdit;
    TableQuery: TIBQuery;
    PeopleDataset: TfrDBDataSet;
    TableDataset: TfrDBDataSet;
    TableQueryHOURS: TTimeField;
    TableQueryNAME_VIHOD: TIBStringField;
    TableQueryCell: TStringField;
    DecBox: TCheckBox;
    TableQueryTBL_DAY: TIntegerField;
    SelectPeopleID_MAN_MOVING: TIntegerField;
    SelectPeopleFIO: TIBStringField;
    SelectPeopleTN: TIntegerField;
    SelectPeopleNAME_POST: TIBStringField;
    SelectPeopleNUM_DIGIT: TIntegerField;
    SelectPeopleOKLAD: TIBBCDField;
    SelectPeopleRAZR: TStringField;
    TableQueryWHOURS: TFloatField;
    TableQueryID_VIHOD: TIntegerField;
    TableQueryNHOURS: TTimeField;
    TableQueryNHOURS_F: TFloatField;
    TableQueryPHOURS: TTimeField;
    TableQuerySHOURS: TIBBCDField;
    TableQueryPHOURS_F: TFloatField;
    TableQueryWDAY: TIntegerField;
    TableQueryPROST: TIntegerField;
    TableQueryOTPUSK: TIntegerField;
    TableQueryBEREM: TIntegerField;
    TableQueryBOLEZN: TIntegerField;
    TableQueryOTHER: TIntegerField;
    TableQueryPROGUL: TIntegerField;
    TableQueryPROST2: TIntegerField;
    TableQueryOPOZD: TIntegerField;
    TableQueryVHOURS_F: TFloatField;
    TableQueryVHOURS: TTimeField;
    TableQueryADMINO: TIntegerField;
    SelectPeopleDAY1: TIntegerField;
    SelectPeopleDATE_BEG: TDateField;
    SelectPeopleDATE_END: TDateField;
    TableQueryVIHODSVYAT: TIntegerField;
    TableQueryCALDAY: TIntegerField;
    SelectPeopleDAY2: TIntegerField;
    TableQueryCOMAND: TIntegerField;
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DepartmentButtonClick(Sender: TObject);
    procedure ExportButtonClick(Sender: TObject);
    procedure TableQueryCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TableQueryAfterScroll(DataSet: TDataSet);
    procedure SelectPeopleCalcFields(DataSet: TDataSet);
    procedure SelectPeopleAfterScroll(DataSet: TDataSet);
  private
    procedure PrepareReport;
  public
        Id_Department: Integer;
        month_beg, month_end: TDate;
	procedure Prepare(TheDate, Date_Beg, Date_End: TDate);override;
  end;

var
  TablePrintForm: TTablePrintForm;

implementation

{$R *.DFM}

procedure TTablePrintForm.Prepare(TheDate, Date_Beg, Date_End: TDate);
var
	d, m, y: Word;
begin
	DecodeDate(Date,y,m,d);
	YearEdit.Value := y;
	MonthBox.ItemIndex := m - 1;

    SelectPeople.Transaction := ReadTransaction;
    TableQuery.Transaction := ReadTransaction;
end;

procedure TTablePrintForm.FormCreate(Sender: TObject);
var
    reg: TRegistry;
    dec: Integer;
    Year, Month, d: Word;
begin
	Prepare(Date, Date, Date);

    			// считать из реестра последний год и месяц
	reg := TRegistry.Create;
	try
		reg.RootKey := HKEY_CURRENT_USER;

		if reg.OpenKey('\Software\ASUP\TableReport\', False) then
		begin
			Year := reg.ReadInteger('Year');
			Month := reg.ReadInteger('Month');
            Id_Department := reg.ReadInteger('Id_Department');
            DepartmentEdit.Text := reg.ReadString('Name_Department');
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
    MonthBox.ItemIndex := Month - 1;
end;

procedure TTablePrintForm.DepartmentButtonClick(Sender: TObject);
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

    		if not Consts_Query.Active then
        		Consts_Query.Open;

		if Id_Department = -1 then
			DepartmentEdit.Text := Consts_Query['Firm_Name']
		else	DepartmentEdit.Text := ResultQuery['Name_Full'];
	end;
	form.Free;
end;

procedure TTablePrintForm.PrepareReport;
var
    y, m: Word;
begin
    y := YearEdit.Value;
    m := MonthBox.ItemIndex + 1;
    month_beg := EncodeDate(y, m, 1);
    month_end := EncodeDate(y, m, DaysInAMonth(y, m));

    SelectPeople.Close;
    with SelectPeople.Params do
    begin
        ParamValues['Id_Department'] := Id_Department;
        ParamValues['Month_Beg'] := month_beg;
        ParamValues['Month_End'] := month_end;
    end;

    TableQuery.Close;
    TableQuery.Params.ParamValues['Tbl_Year'] := y;
    TableQuery.Params.ParamValues['Tbl_Month'] := m;

    SelectPeople.Open;
    TableQuery.Open;

	TableReport.LoadFromFile(ProgramPath + 'Reports\NTableReport.frf');

    frVariables['Org'] := UpperCase(Consts_Query['Firm_Name']);

    if Version = 1 then frVariables['Chief'] := 'А.О. Орлов'
    else frVariables['Chief'] := 'О.М. Плахотнік';
    frVariables['Department'] := DepartmentEdit.Text;
	frVariables['Month'] := MonthBox.Text;
	frVariables['Year'] := YearEdit.Value;
end;

procedure TTablePrintForm.OkButtonClick(Sender: TObject);
begin
	PrepareReport;
	if sDesignReport then TableReport.DesignReport
	else	TableReport.ShowReport;
end;

procedure TTablePrintForm.ExportButtonClick(Sender: TObject);
begin
	PrepareReport;
    ExportReportTo(TableReport);
end;

procedure TTablePrintForm.TableQueryCalcFields(DataSet: TDataSet);
begin
    if TableQuery.IsEmpty then Exit;

    if ( ( TableQuery['Tbl_Day'] < TableQuery.Params.ParamValues['Day1'] )
         or (TableQuery['Tbl_Day'] > TableQuery.Params.ParamValues['Day2'] ) )
       and ( TableQuery['Hours'] < 0.001 ) then TableQuery['Cell'] := ''
    else
    if TableQuery['Hours'] < 0.001 then
        TableQuery['Cell'] := TableQuery['Name_Vihod']
    else TableQuery['Cell'] := EncodeTimeString(TableQuery['Hours'],DecBox.Checked);

    TableQuery['WHours'] := TableQuery['Hours']*24;
    TableQuery['NHours_F'] := TableQuery['NHours']*24;
    TableQuery['PHours_F'] := TableQuery['PHours']*24;
    TableQuery['VHours_F'] := TableQuery['VHours']*24;
end;

procedure TTablePrintForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
	reg: TRegistry;
    dec: Integer;
begin
	reg := TRegistry.Create;
	try
		reg.RootKey := HKEY_CURRENT_USER;

		if reg.OpenKey('\Software\ASUP\TableReport\', True) then
		begin
			reg.WriteInteger('Year', YearEdit.Value);
			reg.WriteInteger('Month', MonthBox.ItemIndex + 1);
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
end;

procedure TTablePrintForm.TableQueryAfterScroll(DataSet: TDataSet);
begin
    if TableQuery.Bof then
        TableQueryCalcFields(TableQuery);
end;

procedure TTablePrintForm.SelectPeopleCalcFields(DataSet: TDataSet);
var
    First_Date, Second_Date: TDate;
begin
    if not SelectPeople.IsEmpty then
    begin
        if SelectPeople['Num_Digit'] = -1 then
            SelectPeople['Razr'] := FloatToStr(SelectPeople['Oklad'])
        else SelectPeople['Razr'] := IntToStr(SelectPeople['Num_Digit']);

        if SelectPeople['Date_Beg'] < month_beg then
            First_Date := month_beg
        else First_Date := SelectPeople['Date_Beg'];

        if SelectPeople['Date_End'] > month_end then
            Second_Date := month_end
        else Second_Date := SelectPeople['Date_End'];

        SelectPeople['Day1'] := DayOf(First_Date);
        SelectPeople['Day2'] := DayOf(Second_Date);
    end;
end;

procedure TTablePrintForm.SelectPeopleAfterScroll(DataSet: TDataSet);
begin
    if SelectPeople.Bof then
        SelectPeopleCalcFields(SelectPeople);
    with TableQuery do
    begin
        Close;
        Params.ParamValues['Id_Man_Moving'] := SelectPeople['Id_Man_Moving'];
        Params.ParamValues['Day1'] := SelectPeople['Day1'];
        Params.ParamValues['Day2'] := SelectPeople['Day2'];
        Open;
    end;
end;

end.
