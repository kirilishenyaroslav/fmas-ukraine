unit uTableDump;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, Mask, CheckEditUnit, Spin, Registry, DB,
    IBCustomDataSet, IBQuery, PersonalCommon, Buffer, ComCtrls;

type
    TfmTableDump = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        TNEdit: TCheckEdit;
        TNRadio: TRadioButton;
        YearCaptionLabel: TLabel;
        YearEdit: TSpinEdit;
        MonthCaptionLabel: TLabel;
        MonthBox: TComboBox;
        InfoQuery: TIBQuery;
        ChangesRadio: TRadioButton;
        DateRadio: TRadioButton;
        DateFrom: TDateTimePicker;
        procedure CancelButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormActivate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure TNRadioClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    fmTableDump: TfmTableDump;

implementation

{$R *.dfm}

procedure TfmTableDump.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmTableDump.FormClose(Sender: TObject;
    var Action: TCloseAction);
var
    reg: TRegistry;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;

        if reg.OpenKey('\Software\ASUP\Table\', True) then
        begin
            reg.WriteInteger('Year', YearEdit.Value);
            reg.WriteInteger('Month', MonthBox.ItemIndex + 1);
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;
end;

procedure TfmTableDump.FormActivate(Sender: TObject);
var
    reg: TRegistry;
    Year, Month, d: Word;
begin
   // считать из реестра последний год и месяц
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;

        if reg.OpenKey('\Software\ASUP\Table\', False) then
        begin
            Year := reg.ReadInteger('Year');
            Month := reg.ReadInteger('Month');
        end
        else DecodeDate(Date, Year, Month, d);

        reg.CloseKey;
    finally
        reg.Free;
    end;

    if (Month < 1) or (Month > 12) then Month := 1;
    if (Year < 1000) then Year := 2004;

    YearEdit.Value := Year;
    MonthBox.ItemIndex := Month - 1;
end;

procedure TfmTableDump.OkButtonClick(Sender: TObject);
var
    First_PBKey, Last_PBKey: Integer;
    sql: string;
begin
    if version = 1 then exit;

    InfoQuery.Transaction := ReadTransaction;

    if TNRadio.Checked then
    begin
        if Trim(TNEdit.Text) = '' then
        begin
            MessageDlg('Треба набрати табельний номер!', mtError, [mbOk], 0);
            Exit;
        end;

        InfoQuery.SQL.Text := 'SELECT * FROM Mass_Table_Export_By_TN(' +
            IntToStr(MonthBox.ItemIndex + 1) + ',' + YearEdit.Text +
            ',' + TNEdit.Text + ')';
    end
    else
        if ChangesRadio.Checked then
            InfoQuery.SQL.Text := 'SELECT * FROM Mass_Table_Export_Changes(' +
                IntToStr(MonthBox.ItemIndex + 1) + ',' + YearEdit.Text + ')'
        else
            if DateRadio.Checked then
                InfoQuery.SQL.Text := 'SELECT * FROM Mass_Table_Export_Date(' +
                    IntToStr(MonthBox.ItemIndex + 1) + ',' + YearEdit.Text +
                    ',''' + DateToStr(DateFrom.Date) + ''')';

    try
        WriteTransaction.StartTransaction;
        InfoQuery.Open;
        First_PBKey := InfoQuery['First_PBKey'];
        Last_PBKey := InfoQuery['Last_PBKey'];

        BufferTable.Close;
        BufferTable.TableName := 'ntable';
        BufferTable.Open;
        BufferTable.IndexFiles.Clear;
        BufferTable.IndexFileInclude('ntable.cdx');

  // запись в dbf
        sql := 'SELECT * FROM Buff_NTable WHERE Id_PBKey BETWEEN ' +
            IntToStr(First_PBKey) + ' AND ' + IntToStr(Last_PBKey);
        MassWriteToDbf('NTable', 'Buff_NTable', sql);
        Log_Action('TABLE_DUMP', YearEdit.Text + '-' +
            IntToStr(MonthBox.ItemIndex + 1));

    except on e: Exception do
        begin
            ShowError(e);
            ModalResult := 0;
            BufferTable.Close;
            WriteTransaction.Rollback;

            if not Consts_Query.Active then
                Consts_Query.Open;

            Exit;
        end
    end;
    BufferTable.Close;
    WriteTransaction.Commit;

    if not Consts_Query.Active then
        Consts_Query.Open;

    if not DepNameQuery.Active then
        DepNameQuery.Open;

    if not CurrSRQuery.Active then
        CurrSRQuery.Open;
end;

procedure TfmTableDump.TNRadioClick(Sender: TObject);
begin
    TNEdit.Visible := TNRadio.Checked;
end;

end.
