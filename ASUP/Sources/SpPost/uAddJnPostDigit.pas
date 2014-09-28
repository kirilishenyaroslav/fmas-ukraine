unit uAddJnPostDigit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uDateControl, uFControl, uLabeledFControl,
  uCharControl, uFloatControl, uIntControl, uLogicCheck, uSimpleCheck,
  ActnList, RxMemDS, uFormControl, DB;

type
  TfmAddJnPostDigit = class(TForm)
    Date_Beg: TqFDateControl;
    Date_End: TqFDateControl;
    SbOk: TBitBtn;
    SbCancel: TBitBtn;
    Num_Digit: TqFIntControl;
    qFSimpleCheck1: TqFSimpleCheck;
    ActionList1: TActionList;
    OkAction: TAction;
    DigitsDS: TRxMemoryData;
    procedure OkActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    Id_BS: Integer;
    Id_Jn_Post_Digits: Integer;
  end;

var
  fmAddJnPostDigit: TfmAddJnPostDigit;

implementation

{$R *.dfm}

uses qFTools;

procedure TfmAddJnPostDigit.OkActionExecute(Sender: TObject);
begin
    if not qFCheckAll(Self) then
    begin
        ModalResult := 0;
        Exit;
    end;

    DigitsDS.Open;
    DigitsDS.Append;
    DigitsDS['Num_Digit'] := Num_Digit.Value;
    DigitsDS['Date_Beg'] := Date_Beg.Value;
    DigitsDS['Date_End'] := Date_End.Value;
    DigitsDS['Id_Jn_Post_Digits'] := Id_Jn_Post_Digits;
    DigitsDS['Id_Post_Base_Salary'] := Id_BS;
    DigitsDS.Post;
    ModalResult := mrOk;
end;

end.
