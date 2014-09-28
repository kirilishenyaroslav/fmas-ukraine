unit TarifNameAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, BaseTypes;

type
  TfrmTarifName = class(TForm)
    ActionList1: TActionList;
    TarifName: TcxTextEdit;
    lblTarifName: TcxLabel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    ActOk: TAction;
    ActCancel: TAction;
    procedure ActOkExecute(Sender: TObject);
    procedure ActCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTarifName: TfrmTarifName;

implementation

{$R *.dfm}

procedure TfrmTarifName.ActOkExecute(Sender: TObject);
begin
   if TarifName.Text='' then
   begin
      TarifName.Style.Color:=clRed;
      agMessageDlg('Увага', 'Ви не заповнили поле "Назва тарифа"', mtInformation, [mbOK]);
      Exit;
   end;
   ModalResult:=mrOk;
end;

procedure TfrmTarifName.ActCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

end.
