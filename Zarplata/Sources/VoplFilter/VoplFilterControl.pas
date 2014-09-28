unit VoplFilterControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  Unit_Sp_VidOpl_Consts, ActnList;

type
  TFVoplFilterControl = class(TForm)
    MaskEditFullName: TcxMaskEdit;
    LabelFullName: TcxLabel;
    Bevel1: TBevel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList1: TActionList;
    Action1: TAction;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFVoplFilterControl.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFVoplFilterControl.FormCreate(Sender: TObject);
begin
YesBtn.Caption        := YesBtn_Caption;
CancelBtn.Caption     := CancelBtn_Caption;
LabelFullName.Caption := VoplFilterControl_LabelFullName_Caption;
end;

procedure TFVoplFilterControl.Action1Execute(Sender: TObject);
begin
if (Trim(MaskEditFullName.Text)<>'') or (MaskEditFullName.Enabled=False) then
   ModalResult:=mrYes
else
   MaskEditFullName.SetFocus;
end;

end.
