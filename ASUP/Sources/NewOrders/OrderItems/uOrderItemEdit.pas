unit uOrderItemEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uFormControl, uFControl, uLabeledFControl,
  uCharControl, uIntControl, uMemoControl, uInvisControl, ActnList;

type
  TfmOrderItemEdit = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    FormControl: TqFFormControl;
    NumItem: TqFIntControl;
    ItemText: TqFMemoControl;
    Id_Order: TqFInvisControl;
    ActionList1: TActionList;
    AcceptAction: TAction;
    procedure AcceptActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Prepare(Id_Order: Integer);
  end;

var
  fmOrderItemEdit: TfmOrderItemEdit;

implementation

{$R *.dfm}

procedure TfmOrderItemEdit.Prepare(Id_Order: Integer);
begin
    Self.Id_Order.Value := Id_Order;
end;

procedure TfmOrderItemEdit.AcceptActionExecute(Sender: TObject);
begin
    FormControl.Ok;
end;

initialization
    RegisterClass(TfmOrderItemEdit);

end.
