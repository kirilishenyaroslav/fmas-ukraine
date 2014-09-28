unit DateChooseUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxButtons,
  ActnList;

type
  TDateChooseForm = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label2: TLabel;
    NumEdit: TcxTextEdit;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DateChooseForm: TDateChooseForm;

implementation

{$R *.dfm}


procedure TDateChooseForm.Action1Execute(Sender: TObject);
begin
ModalResult:= mrOk;
end;

procedure TDateChooseForm.Action2Execute(Sender: TObject);
begin
ModalResult:= mrCancel;
end;

end.
