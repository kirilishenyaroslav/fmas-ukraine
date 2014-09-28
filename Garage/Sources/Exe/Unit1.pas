unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, cxControls, cxContainer, cxEdit, cxTextEdit, Buttons,
  ExtCtrls;

type
  TForm1 = class(TForm)
    Image5: TImage;
    Image4: TImage;
    SpeedButton1: TSpeedButton;
    CloseSpeedButton: TSpeedButton;
    CancelBtn: TSpeedButton;
    YesBtn: TSpeedButton;
    UserEdit: TcxTextEdit;
    LoginEdit: TcxTextEdit;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    procedure ActionYesExecute(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ActionYesExecute(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TForm1.CancelBtnClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TForm1.ActionCancelExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
