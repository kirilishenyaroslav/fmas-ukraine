unit uCheckMain;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, uCheckHospital,
    ComCtrls, Registry, DateUtils, PersonalCommon, Spin,
    uAsupDataCheckMain, uTableCheck;

type
    TfmCheck = class(TForm)
        LogMemo: TMemo;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Label1: TLabel;
        CheckWhatBox: TComboBox;
        FixBox: TCheckBox;
        Label2: TLabel;
        DateBegPicker: TDateTimePicker;
        Label3: TLabel;
        DateEndPicker: TDateTimePicker;
        YearCaptionLabel: TLabel;
        YearEdit: TSpinEdit;
        MonthCaptionLabel: TLabel;
        MonthBox: TComboBox;
        procedure CancelButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormCreate(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    fmCheck: TfmCheck;

implementation

{$R *.dfm}

//uses uTableCheck;

procedure TfmCheck.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmCheck.OkButtonClick(Sender: TObject);
begin
    LogMemo.Lines.Clear;
    if CheckWhatBox.ItemIndex = 0 then
        CheckAllHospitals(LogMemo, DateBegPicker.Date, DateEndPicker.Date, FixBox.Checked)
    else
        if CheckWhatBox.ItemIndex = 1 then
            CheckTables(LogMemo, YearEdit.Value, MonthBox.ItemIndex + 1);
    LogMemo.Lines.Add('Процесс закінчено!');
end;

procedure TfmCheck.FormClose(Sender: TObject; var Action: TCloseAction);
var
    reg: TRegistry;
begin
    AsupDataCheckDone;
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;

        if reg.OpenKey('\Software\ASUP\Check', True) then
        begin
            reg.WriteDate('Date_Beg', DateBegPicker.Date);
            reg.WriteDate('Date_End', DateEndPicker.Date);
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;
end;

procedure TfmCheck.FormCreate(Sender: TObject);
var
    reg: TRegistry;
begin
    AsupDataCheckInit(PersonalCommon.FIBDatabase.Handle);
   // считать из реестра последний год и месяц
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;

        if reg.OpenKey('\Software\ASUP\Check\', False) then
        begin
            DateBegPicker.Date := reg.ReadDate('Date_Beg');
            DateEndPicker.Date := reg.ReadDate('Date_End');
        end
        else
        begin
            DateBegPicker.Date := EncodeDate(YearOf(Date), MonthOf(Date), 1);
            DateEndPicker.Date := EncodeDate(YearOf(Date), MonthOf(Date),
                DaysInAMonth(YearOf(Date), MonthOf(Date)));
        end;

        reg.CloseKey;
    finally
        reg.Free;
    end;

    FixBox.Enabled := AdminMode;
    YearEdit.Value := YearOf(Date);
    MonthBox.ItemIndex := MonthOf(Date)-1;
end;

end.
