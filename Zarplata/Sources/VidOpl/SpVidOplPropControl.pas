unit SpVidOplPropControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls, cxGroupBox, StdCtrls,
  cxButtons, ibase, Unit_Sp_VidOpl_Consts;

type
  TZFVidOplPropControl = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    PeriodBox: TcxGroupBox;
    DateEnd: TcxDateEdit;
    DateBeg: TcxDateEdit;
    DateBegLabel: TcxLabel;
    DateEndLabel: TcxLabel;
    procedure YesBtnClick(Sender: TObject);
  private

  public
    Ins_Result: Variant;
    constructor Create(AOwner: TComponent;ComeDB:TISC_DB_HANDLE);reintroduce;
  end;

implementation

{$R *.dfm}
constructor TZFVidOplPropControl.Create(AOwner: TComponent;ComeDB:TISC_DB_HANDLE);
begin
inherited Create(Aowner);
self.PeriodBox.Caption                    := ZFVidOplControl_PeriodBox_Caption;
self.DateEndLabel.Caption                 := 'Закінчення:'; //ZFVidOplControl_DateEndLabel_Caption;
self.DateBegLabel.Caption                 := ZFVidOplControl_DateBegLabel_Caption;
self.DateEnd.Date                         := Date;
self.DateBeg.Date                         := Date;
self.YesBtn.Caption                       := YesBtn_Caption;
self.CancelBtn.Caption                    := CancelBtn_Caption;
end;

procedure TZFVidOplPropControl.YesBtnClick(Sender: TObject);
begin
  Ins_Result:=VarArrayCreate([0,1],varVariant);
  Ins_Result[0]:=DateBeg.Date;
  Ins_Result[1]:=DateEnd.Date;
end;

end.
