unit uAsupParams;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFControl, uLabeledFControl, uCharControl, StdCtrls, Buttons,
    uFormControl, ActnList, uIntControl, uDateControl, PersonalCommon;

type
    TfmAsupParams = class(TForm)
        OrdersHeader: TqFCharControl;
        FIRM_EDRPOU: TqFCharControl;
        FIRM_UKUD: TqFCharControl;
        CITY: TqFCharControl;
        FormControl: TqFFormControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        ActionList: TActionList;
        Accept: TAction;
        Cancel: TAction;
        Current_Year_Ltd: TqFIntControl;
        DumpCurrentMovings: TqFIntControl;
        Old_Date: TqFDateControl;
        procedure CancelExecute(Sender: TObject);
        procedure AcceptExecute(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    fmAsupParams: TfmAsupParams;

implementation

{$R *.dfm}

procedure TfmAsupParams.CancelExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmAsupParams.AcceptExecute(Sender: TObject);
begin
    FormControl.Ok;
    Consts_Query.Close;
    Consts_Query.Open;
end;

initialization
    RegisterClass(TfmAsupParams);

end.
