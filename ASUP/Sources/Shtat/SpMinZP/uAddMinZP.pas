unit uAddMinZP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uLogicCheck, ActnList, uInvisControl, uFControl,
  uLabeledFControl, uDateControl, StdCtrls, Buttons, uFormControl,
  uCharControl, uFloatControl, uSimpleCheck, uMinZPData;

type
  TfmAddMinZP = class(TForm)
    FormControl: TqFFormControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Date_Beg: TqFDateControl;
    Date_End: TqFDateControl;
    CutPrev: TqFInvisControl;
    ActionList1: TActionList;
    OkAction: TAction;
    qFLogicCheck1: TqFLogicCheck;
    Value_Min_ZP: TqFFloatControl;
    DateCheck: TqFSimpleCheck;
    procedure OkActionExecute(Sender: TObject);
    procedure FormControlNewRecordAfterPrepare(Sender: TObject);
    procedure qFLogicCheck1Check(Sender: TObject; var Error: String);
  private
    { Private declarations }
  public
    DM: TdmMinZP;
  end;

var
  fmAddMinZP: TfmAddMinZP;

implementation

{$R *.dfm}

uses DateUtils, qFTools;

procedure TfmAddMinZP.OkActionExecute(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmAddMinZP.FormControlNewRecordAfterPrepare(Sender: TObject);
begin
    Date_Beg.Value := EncodeDate(YearOf(Date), 1, 1);
    Date_End.Value := EncodeDate(9999, 12, 31);
end;

procedure TfmAddMinZP.qFLogicCheck1Check(Sender: TObject;
  var Error: String);
begin
    CutPrev.Value := 0;
    if FormControl.Mode = fmAdd then
    begin
        DM.CheckZP.Close;
        DM.CheckZP.ParamByName('Date_Beg').AsDate := Date_Beg.Value;
        DM.CheckZP.ParamByName('Date_End').AsDate := Date_End.Value;
        DM.CheckZP.Open;

        if not DM.CheckZP.IsEmpty then
        begin
            if qFConfirm('Вже є запис на цей період! Бажаєте закрити старий запис?') then
            begin
                CutPrev.Value := 1;
                Error := '';
            end
            else Error := 'Неможливо додати запис через перетин періодів!';
        end
        else Error := '';
    end;
end;

initialization
    RegisterClass(TfmAddMinZP);


end.
