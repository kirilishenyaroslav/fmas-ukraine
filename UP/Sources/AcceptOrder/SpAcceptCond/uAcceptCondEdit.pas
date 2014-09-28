unit uAcceptCondEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uCharControl, StdCtrls, Buttons,
  uFormControl, ActnList;

type
  TfmAcceptCondEdit = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    qFCharControl1: TqFCharControl;
    qFCharControl2: TqFCharControl;
    FormControl: TqFFormControl;
    ActionList1: TActionList;
    AcceptAction: TAction;
    procedure AcceptActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAcceptCondEdit: TfmAcceptCondEdit;

implementation

{$R *.dfm}

procedure TfmAcceptCondEdit.AcceptActionExecute(Sender: TObject);
begin
    FormControl.Ok;
end;

initialization
        RegisterClass(TfmAcceptCondEdit);

end.
