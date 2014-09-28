unit ReBufferUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ComCtrls, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery,
    ProcessUnit;

type
    TReBufferForm = class(TForm)
        BufferNameEdit: TEdit;
        Label1: TLabel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        DatePicker: TDateTimePicker;
        TimePicker: TDateTimePicker;
        Label2: TLabel;
        Label3: TLabel;
        All: TCheckBox;
        TablesQuery: TIBQuery;
        TablesQueryBUFF_NAME: TIBStringField;
        TablesQueryIB_BUFF_NAME: TIBStringField;
        LogMemo: TMemo;
        Label4: TLabel;
        Progress: TProgressBar;
        LogBox: TCheckBox;
        procedure FormCreate(Sender: TObject);
        procedure AllClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure BufferNameEditEnter(Sender: TObject);
        procedure BufferNameEditExit(Sender: TObject);
    private
    public
    { Public declarations }
    end;

var
    ReBufferForm: TReBufferForm;

implementation
uses Buffer, PersonalCommon;
{$R *.dfm}

procedure TReBufferForm.FormCreate(Sender: TObject);
begin
    TablesQuery.Transaction := PersonalCommon.ReadTransaction;

    DatePicker.Date := Date;
    DatePicker.Time := 0;

    TimePicker.Date := 0;
    TimePicker.Time := Time;
end;

procedure TReBufferForm.AllClick(Sender: TObject);
begin
    if (All.Checked)
        then begin
        Label1.Enabled := False;
        BufferNameEdit.Enabled := False;
    end
    else begin
        Label1.Enabled := True;
        BufferNameEdit.Enabled := True;
    end;
end;

procedure TReBufferForm.OkButtonClick(Sender: TObject);
var
    t, h, m, s: Longint;
    str, sql: string;
    StartTime: Longint;
begin
    BufferNameEdit.Text := UpperCase(BufferNameEdit.Text);

    if (not All.Checked) and (BufferNameEdit.Text = '')
        then begin
        MessageDlg('Потрібно ввести назву буфера!', mtError, [mbOk], 0);
        exit;
    end;

    TablesQuery.Close;

    if (not All.Checked)
        then TablesQuery.SQL.Text := 'SELECT BUFF_NAME, IB_BUFF_NAME FROM BUFF_NAMES WHERE BUFF_NAME = ' + QuotedStr(BufferNameEdit.Text) + ';'
    else TablesQuery.SQL.Text := 'SELECT BUFF_NAME, IB_BUFF_NAME FROM BUFF_NAMES;';

    Stop := False;
    TablesQuery.Open;
    TablesQuery.FetchAll;
    if (TablesQuery.IsEmpty)
        then begin
        MessageDlg('Не знайдено жодного буфера у таблиці BUFF_NAMES! Або ви невірно ввели назву буфера!', mtError, [mbOk], 0);
        exit;
    end;

    TablesQuery.First;

    LogMemo.Clear;
    LogMemo.Lines.Add('Початок повтору...');

    while not TablesQuery.Eof
        do begin
        if Version = 1 then
            sql := 'SELECT * FROM ' + TablesQueryIB_BUFF_NAME.Value + ' WHERE DATEREC_CREATE + TIMEREC_CREATE >= ''' + DateToStr(DatePicker.Date) + ' ' + TimeToStr(TimePicker.Time) + ''' ORDER BY Id_PBKey'
        else
            sql := 'SELECT * FROM ' + TablesQueryIB_BUFF_NAME.Value + ' WHERE DATE_IN + TIME_IN >= ''' + DateToStr(DatePicker.Date) + ' ' + TimeToStr(TimePicker.Time) + ''' ORDER BY Id_PBKey';

        MassWriteToDbf(TablesQuery['Buff_Name'], TablesQuery['IB_Buff_Name'], sql);

        TablesQuery.Next;
    end;

    Screen.Cursor := crDefault;
    LogMemo.Lines.Add('...кінець повтору.');
end;

procedure TReBufferForm.BufferNameEditEnter(Sender: TObject);
begin
    LoadKeyboardLayout('00000409', KLF_ACTIVATE or KLF_SUBSTITUTE_OK)
end;

procedure TReBufferForm.BufferNameEditExit(Sender: TObject);
begin
    LoadKeyboardLayout('00000422', KLF_ACTIVATE or KLF_SUBSTITUTE_OK)
end;

end.
