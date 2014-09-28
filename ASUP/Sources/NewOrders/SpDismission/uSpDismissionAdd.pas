unit uSpDismissionAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uCharControl, ActnList, StdCtrls,
  Buttons, uFormControl;

type
  TfmSpDismissionAdd = class(TForm)
    NameDismission: TqFCharControl;
    KzotSt: TqFCharControl;
    FormControl: TqFFormControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSpDismissionAdd: TfmSpDismissionAdd;

implementation

{$R *.dfm}

procedure TfmSpDismissionAdd.OkActionExecute(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmSpDismissionAdd.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

Initialization
    RegisterClass(TfmSpDismissionAdd);

end.
