unit gr_PeoplePrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxRadioGroup, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxCheckBox;

type
  TFPeoplePrint = class(TForm)
    FioRadioBtn: TcxRadioButton;
    TinRadioBtn: TcxRadioButton;
    OkBtn: TcxButton;
    CancelBtn: TcxButton;
    TypePaymentRadioBtn: TcxRadioButton;
    procedure OkBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPeoplePrint: TFPeoplePrint;

implementation

{$R *.dfm}

procedure TFPeoplePrint.OkBtnClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFPeoplePrint.CancelBtnClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
