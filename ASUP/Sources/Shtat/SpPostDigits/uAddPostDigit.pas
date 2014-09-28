unit uAddPostDigit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uDateControl, uFloatControl, uFControl, uLabeledFControl,
    uCharControl, uIntControl, StdCtrls, Buttons, uFormControl, uLogicCheck,
    uSimpleCheck, ActnList, uPostDigitsDataModule, uInvisControl;

type
    TfmAddPostDigit = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Num_Digit: TqFIntControl;
        Koeff: TqFFloatControl;
        Date_Beg: TqFDateControl;
        DateCheck: TqFSimpleCheck;
        FormControl: TqFFormControl;
        ActionList1: TActionList;
        OkAction: TAction;
        Date_End: TqFDateControl;
        qFLogicCheck1: TqFLogicCheck;
        CutPrev: TqFInvisControl;
        CBInfinity: TCheckBox;
        procedure OkActionExecute(Sender: TObject);
        procedure FormControlNewRecordAfterPrepare(Sender: TObject);
        procedure qFLogicCheck1Check(Sender: TObject; var Error: string);
        procedure CBInfinityClick(Sender: TObject);
    private
    { Private declarations }
    public
        DM: TdmPostDigits;
    end;

var
    fmAddPostDigit: TfmAddPostDigit;

implementation

{$R *.dfm}

uses DateUtils, qFTools;

procedure TfmAddPostDigit.OkActionExecute(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmAddPostDigit.FormControlNewRecordAfterPrepare(
    Sender: TObject);
begin
    Date_Beg.Value := EncodeDate(YearOf(Date), 1, 1);
    Date_End.Value := EncodeDate(9999, 12, 31);
end;

procedure TfmAddPostDigit.qFLogicCheck1Check(Sender: TObject;
    var Error: string);
var
    sql: string;
begin
    CutPrev.Value := 0;
    if FormControl.Mode = fmAdd then
        with DM.CheckPost do
        begin
            Close;
            sql := SelectSQL.Text;

            try
                SelectSQL.Text := qFSubsParams(sql, FormControl.ControlsOwner,
                    FormControl.ControlsParent);
                Open;

                if IsEmpty or (FieldByName('Check_Failed').AsInteger = 1) then
                begin
                    if qFConfirm('Цей розряд вже занесений! Бажаєте закрити старий запис?') then
                    begin
                        CutPrev.Value := 1;
                        Error := '';
                    end
                    else Error := 'Неможливо додати розряд через перетин періодів!';
                end
                else Error := '';
            finally
                Close;
                SelectSQL.Text := sql;
            end;
        end;
end;

procedure TfmAddPostDigit.CBInfinityClick(Sender: TObject);
begin
    if CBInfinity.Checked then
    begin
        Date_End.Value := EncodeDate(9999, 12, 31);
        Date_End.Blocked := True;
    end
    else Date_End.Blocked := False;
end;

initialization
    RegisterClass(TfmAddPostDigit);

end.

