unit VoplPropControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  Unit_VoplFilter_Consts;

type
  TFVoplPropControl = class(TForm)
    MaskEditFullName: TcxMaskEdit;
    LabelFullName: TcxLabel;
    Bevel1: TBevel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    procedure YesBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFVoplPropControl.YesBtnClick(Sender: TObject);
begin
if (Trim(MaskEditFullName.Text)<>'') or (MaskEditFullName.Enabled=False) then
   ModalResult:=mrYes
else
   MaskEditFullName.SetFocus;
end;


procedure TFVoplPropControl.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFVoplPropControl.FormCreate(Sender: TObject);
begin
YesBtn.Caption        := YesBtn_Caption;
CancelBtn.Caption     := CancelBtn_Caption;
LabelFullName.Caption := VoplFilterControl_LabelFullName_Caption;
end;

end.
