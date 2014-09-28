unit uOrdersCancModify;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, ActnList, uDateControl, uFControl,
    uLabeledFControl, uCharControl, uFormControl;

type
    TfmOrdersCancModify = class(TForm)
        NumOrder: TqFCharControl;
        DateOrder: TqFDateControl;
        ActionList1: TActionList;
        Cancel: TAction;
        Ok: TAction;
        CancelButton: TBitBtn;
        OkButton: TBitBtn;
        FormControl: TqFFormControl;
        procedure OkExecute(Sender: TObject);
        procedure CancelExecute(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    fmOrdersCancModify: TfmOrdersCancModify;

implementation

{$R *.dfm}

procedure TfmOrdersCancModify.OkExecute(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmOrdersCancModify.CancelExecute(Sender: TObject);
begin
    Close;
end;

initialization
    RegisterClass(TfmOrdersCancModify);

end.
