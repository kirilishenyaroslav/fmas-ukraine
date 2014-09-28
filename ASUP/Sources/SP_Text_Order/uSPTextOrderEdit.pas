unit uSPTextOrderEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxButtons, ExtCtrls, ActnList;

type
  TfmSP_Text_OrderEdit = class(TForm)
    lbl1: TLabel;
    pnl1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxTextEdit1: TcxTextEdit;
    KeyList: TActionList;
    AddAction: TAction;
    CancelAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    EnterAction: TAction;
    OkAction: TAction;
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSP_Text_OrderEdit: TfmSP_Text_OrderEdit;

implementation

{$R *.dfm}

procedure TfmSP_Text_OrderEdit.OkActionExecute(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfmSP_Text_OrderEdit.CancelActionExecute(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

end.
