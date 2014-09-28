unit AddExc;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, Mask,
    CheckEditUnit, ComCtrls, SpTimeUtils, SpCommon, PersonalCommon, WorkModeCentral;

type
    TAddExcForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Label1: TLabel;
        Label2: TLabel;
        ExcDate: TDateTimePicker;
        ExcType: TComboBox;
        Label3: TLabel;
        HoursEdit: TCheckEdit;
        WriteQuery: TIBQuery;
        procedure OkButtonClick(Sender: TObject);
        procedure FormActivate(Sender: TObject);
    private
    { Private declarations }
    public
        Id_Work_Mode: Integer;
        Mode: TEditMode;
    end;

var
    AddExcForm: TAddExcForm;

implementation

{$R *.dfm}

procedure TAddExcForm.OkButtonClick(Sender: TObject);
var
    hours: TTime;
begin
    hours := StringToTime(Trim(HoursEdit.Text));

{    if hours = 0 then
    begin
        MessageDlg('Невірно введена кількість годин!!!', mtError, [mbOk], 0);
        Exit;
        ModalResult := 0;
    end;}

    if Mode = emModify then
        WriteQuery.SQL.Text := StringReplace(WriteQuery.SQL.Text,
            'Work_Exc_Insert', 'Work_Exc_Update', []);

    WriteQuery.Transaction := WriteTransaction;
    with WriteQuery.Params do
    begin
        ParamValues['Id_Work_Mode'] := Id_Work_Mode;
        ParamValues['Exc_Date'] := ExcDate.Date;
        ParamValues['Exc_Type'] := ExcType.ItemIndex - 1;
        ParamValues['Hours'] := hours;
    end;
    ExecQuery(WriteQuery);
    WorkModeCenter.ReLoad;
end;

procedure TAddExcForm.FormActivate(Sender: TObject);
begin
    if Mode <> emModify then
        ExcDate.Date := Date;
end;

end.
