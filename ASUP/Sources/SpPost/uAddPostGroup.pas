unit uAddPostGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uCharControl, ActnList, StdCtrls,
  Buttons, uFormControl;

type
  TfmAddPostGroup = class(TForm)
    SbOk: TBitBtn;
    SbCancel: TBitBtn;
    ActionList1: TActionList;
    AcceptButton: TAction;
    PostGroupName: TqFCharControl;
    FormControl: TqFFormControl;
    procedure AcceptButtonExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAddPostGroup: TfmAddPostGroup;

implementation

{$R *.dfm}

procedure TfmAddPostGroup.AcceptButtonExecute(Sender: TObject);
begin
    FormControl.Ok;
end;

initialization
    RegisterClass(TfmAddPostGroup);

end.
