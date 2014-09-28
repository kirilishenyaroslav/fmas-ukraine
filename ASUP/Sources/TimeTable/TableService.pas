unit TableService;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Spin, ComCtrls, Registry, DB,
  IBCustomDataSet, IBQuery, PersonalCommon, TableCentral, DateUtils,
  ProcessUnit, Mask, CheckEditUnit, uMovingTable;

type
  TTableServiceForm = class(TForm)
    NormButton: TBitBtn;
    CancelButton: TBitBtn;
    Label4: TLabel;
    LogMemo: TMemo;
    YearLabel: TLabel;
    YearEdit: TSpinEdit;
    MonthLabel: TLabel;
    MonthBox: TComboBox;
    PeopleQuery: TIBQuery;
    Label1: TLabel;
    TNFromEdit: TCheckEdit;
    Label2: TLabel;
    TNToEdit: TCheckEdit;
    BitBtn1: TBitBtn;
    BegBox: TCheckBox;
    OnlyTN: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Prepare;
    procedure NormButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Year: Integer;
    Month: Integer;

    Month_Beg: TDate;
    Month_End: TDate;
  end;

var
  TableServiceForm: TTableServiceForm;

implementation

{$R *.dfm}

procedure TTableServiceForm.FormCreate(Sender: TObject);
var
    reg: TRegistry;
begin
			// считать из реестра последний год и месяц
	reg := TRegistry.Create;
	try
		reg.RootKey := HKEY_CURRENT_USER;

		if reg.OpenKey('\Software\ASUP\Table\', False) then
		begin
			Year := reg.ReadInteger('Year');
			Month := reg.ReadInteger('Month');
            
          	YearEdit.Value := Year;
	        MonthBox.ItemIndex := Month-1;
		end;
        reg.CloseKey;
	finally
		reg.Free;
	end;

    PeopleQuery.Transaction := ReadTransaction;
end;

procedure TTableServiceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
	reg: TRegistry;
begin
	reg := TRegistry.Create;
	try
		reg.RootKey := HKEY_CURRENT_USER;

		if reg.OpenKey('\Software\ASUP\Table\', True) then
		begin
			reg.WriteInteger('Year', Year);
			reg.WriteInteger('Month', Month);
			reg.CloseKey;
		end
	finally
		reg.Free;
	end;

	if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TTableServiceForm.Prepare;
begin
	Month := MonthBox.ItemIndex + 1;
	Year := YearEdit.Value;

	Month_Beg := EncodeDate(Year, Month, 1);
	Month_End := EncodeDate(Year, Month, DaysInAMonth(Year, Month));

    LogMemo.Lines.Clear;
end;

procedure TTableServiceForm.NormButtonClick(Sender: TObject);
var
    movTable: TMovingTable;
    res: String;
    form: TProcessForm;
    TNFrom, TnTo: Integer;
begin
    form := TProcessForm.Create(Self);
    form.Caption := 'Перерахування норм, зачекайте...';
    form.Show;

    Prepare;

    PeopleQuery.Close;
    PeopleQuery.SQL.Text := 'SELECT * FROM Get_Cur_Moving_Period(''' +
        DateToStr(Month_Beg) + ''',''' + DateToStr(Month_End) + ''')';
    try
        TNFrom := StrToInt(TNFromEdit.Text);
        TNTo := StrToInt(TNToEdit.Text);

        PeopleQuery.SQL.Text := PeopleQuery.SQL.Text + ' WHERE TN BETWEEN ' +
            TNFromEdit.Text + ' AND ' + TNToEdit.Text;
    except
    end;

    LogMemo.Lines.Clear;
    LogMemo.Lines.Add('Перерахування норм за період з ' + DateToStr(Month_Beg) +
        ' по ' + DateToStr(Month_End));
    PeopleQuery.Open;
    PeopleQuery.FetchAll;
    form.Progress.Max := PeopleQuery.RecordCount;

    movTable := TMovingTable.Create;
    PeopleQuery.First;
    while not PeopleQuery.Eof do
    begin
            // подготовить табель
        movTable.Prepare(ReadTransaction, PeopleQuery['Id_Man_Moving'],
            Month_Beg, Month_End, PeopleQuery['Kol_Stavok']);

            // сформировать только график
        movTable.FormTable(True);

            // обновить график
        res := movTable.UpdateGraphic(WriteTransaction);

            // записать результат
        LogMemo.Lines.Add( 'Таб. номер: ' + IntToStr(PeopleQuery['TN']) +
            ' Id_Man_Moving: ' + IntToStr(PeopleQuery['Id_Man_Moving']) +
            '     ' + res);

        LogMemo.Repaint;
        if Stop then break;
        form.Step;

        PeopleQuery.Next;
    end;

    form.Close;
    movTable.Free;

    if Stop then LogMemo.Lines.Add('Припинено')
    else LogMemo.Lines.Add('Усе!');
end;

procedure TTableServiceForm.BitBtn1Click(Sender: TObject);
var
    movTable, movTable2: TMovingTable;
    res: String;
    form: TProcessForm;
    TNFrom, TnTo: Integer;
    fromInd, toInd: Integer;
begin
    form := TProcessForm.Create(Self);
    form.Caption := 'Перевірка норм, зачекайте...';
    form.Show;

    Prepare;

    PeopleQuery.Close;
    PeopleQuery.SQL.Text := 'SELECT * FROM Get_Cur_Moving_Period(''' +
        DateToStr(Month_Beg) + ''',''' + DateToStr(Month_End) + ''')';
    try
        TNFrom := StrToInt(TNFromEdit.Text);
        TNTo := StrToInt(TNToEdit.Text);

        PeopleQuery.SQL.Text := PeopleQuery.SQL.Text + ' WHERE TN BETWEEN ' +
            TNFromEdit.Text + ' AND ' + TNToEdit.Text;
    except
    end;

    LogMemo.Lines.Clear;
    LogMemo.Lines.Add('Перевірка норм за період з ' + DateToStr(Month_Beg) +
        ' по ' + DateToStr(Month_End));
    PeopleQuery.Open;
    PeopleQuery.FetchAll;
    form.Progress.Max := PeopleQuery.RecordCount;

    movTable := TMovingTable.Create;
    movTable2 := TMovingTable.Create;
    PeopleQuery.First;
    while not PeopleQuery.Eof do
    begin
        try
                // подготовить табеля
            movTable.Prepare(ReadTransaction, PeopleQuery['Id_Man_Moving'],
                Month_Beg, Month_End, PeopleQuery['Kol_Stavok']);
            movTable2.Prepare(ReadTransaction, PeopleQuery['Id_Man_Moving'],
                Month_Beg, Month_End, PeopleQuery['Kol_Stavok']);

                // сформировать только график
            movTable.FormTable(True);
                // прочитать из базы табель
            movTable2.ReadFromBase;

                // подсчитать интервал проверки
            if PeopleQuery['Date_Beg'] < Month_Beg then fromInd := 1
            else fromInd := DaysBetween(Month_Beg, PeopleQuery['Date_Beg']) + 1;
            if PeopleQuery['Real_Date_End'] > Month_End then
                toInd := DaysBetween(Month_Beg, Month_End) + 1
            else toInd := DaysBetween(Month_Beg, PeopleQuery['Real_Date_End']) + 1;

            if BegBox.Checked then toInd := fromInd;

                // сравнить табеля
            res := CompareSpans(movTable.Span, movTable2.Span, fromInd,
                toInd, PeopleQuery['Kol_Stavok']);

               // записать результат
            if res <> '' then
            if OnlyTN.Checked then
                LogMemo.Lines.Add( 'Таб. номер: ' + IntToStr(PeopleQuery['TN']))
            else
                LogMemo.Lines.Add( 'Таб. номер: ' + IntToStr(PeopleQuery['TN'])+
                ' Id_Man_Moving: ' + IntToStr(PeopleQuery['Id_Man_Moving']) +
                res);

            LogMemo.Repaint;
            if Stop then break;
            form.Step;
        except on e:Exception do
            LogMemo.Lines.Add( 'Таб. номер: ' + IntToStr(PeopleQuery['TN'])+
                ' Id_Man_Moving: ' + IntToStr(PeopleQuery['Id_Man_Moving']) +
                ' ПОМИЛКА: ' + e.Message);
        end;

        PeopleQuery.Next;
    end;

    form.Close;
    movTable.Free;
    movTable2.Free;

    if Stop then LogMemo.Lines.Add('Припинено')
    else LogMemo.Lines.Add('Усе!');
end;

end.
