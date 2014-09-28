unit uAddHalfTime;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uCharControl, uFloatControl, uFControl, uLabeledFControl,
    uDateControl, StdCtrls, Buttons, uFormControl, uInvisControl,
    uLogicCheck, uSimpleCheck, uEnumControl;

type
    TfmAddHalfTime = class(TForm)
        Date_Beg: TqFDateControl;
        Date_End: TqFDateControl;
        Hours_F: TqFFloatControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        FormControl: TqFFormControl;
        Id_Man_Moving: TqFInvisControl;
        qFSimpleCheck1: TqFSimpleCheck;
    From_Where: TqFEnumControl;
        procedure OkButtonClick(Sender: TObject);
    procedure Date_BegChange(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    fmAddHalfTime: TfmAddHalfTime;

implementation

{$R *.dfm}

procedure TfmAddHalfTime.OkButtonClick(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmAddHalfTime.Date_BegChange(Sender: TObject);
begin
    if FormControl.Mode = fmAdd then
        Date_End.Value := Date_Beg.Value;
end;

initialization
    RegisterClass(TfmAddHalfTime);

end.
