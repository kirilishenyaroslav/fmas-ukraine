unit uAddHolidayLong;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uCharControl, uIntControl,
  uSpravControl, StdCtrls, Buttons, uFormControl, uCommonSp,
  U_SPPost_DataModule, ActnList;

type
  TfmAddHolidayLong = class(TForm)
    HolidayLong: TqFIntControl;
    TypeHoliday: TqFSpravControl;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FormControl: TqFFormControl;
    ActionList1: TActionList;
    AcceptButton: TAction;
    procedure TypeHolidayOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure AcceptButtonExecute(Sender: TObject);
    public
        DM: TDMSPPost;
  end;

var
  fmAddHolidayLong: TfmAddHolidayLong;

implementation

uses IBDatabase, SpCommon, uSelectForm;

{$R *.dfm}

procedure TfmAddHolidayLong.TypeHolidayOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    if qSelect(DM.HolidayType) then
    begin
        Value := DM.HolidayType['Id_Type_Holiday'];
        DisplayText := DM.HolidayType['Full_Name'];
    end;
end;

procedure TfmAddHolidayLong.AcceptButtonExecute(Sender: TObject);
begin
    FormControl.Ok;
end;

initialization
    RegisterClass(TfmAddHolidayLong);

end.
