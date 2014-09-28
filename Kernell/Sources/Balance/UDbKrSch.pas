unit UDbKrSch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxRadioGroup, cxButtons,
  ExtCtrls, ActnList;

type
  TfrmDbKr = class(TForm)
    Panel1: TPanel;
    Button_OK: TcxButton;
    Button_Cancel: TcxButton;
    RadioButton_Db: TcxRadioButton;
    RadioButton_Kr: TcxRadioButton;
    ActionList1: TActionList;
    act_OK: TAction;
    act_Cancel: TAction;
    procedure act_OKExecute(Sender: TObject);
    procedure act_CancelExecute(Sender: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TfrmDbKr.act_OKExecute(Sender: TObject);
begin
    ModalResult:=mrOk;
end;

procedure TfrmDbKr.act_CancelExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;  
end;

end.
