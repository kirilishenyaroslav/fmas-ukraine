unit CurrentCtrl_ByPrev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, ActnList, StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, ZProc,
  Unit_Zglobal_Consts;

Type TFPrev_Result=record
  Summa:double;
  Percent:double;
  ModalResult:TModalResult;
end;

type
  TFPrev = class(TForm)
    Bevel1: TBevel;
    LabelData: TcxLabel;
    EditData: TcxMaskEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    PLanguageIndex:Byte;
    CurrDecimalSeparator:string[1];
  public
    constructor Create(AOwner:TComponent);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TFPrev.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
//------------------------------------------------------------------------------
 PLanguageIndex:=LanguageIndex;
 YesBtn.Caption := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption :=  CancelBtn_Caption[PLanguageIndex];
 YesBtn.Hint := YesBtn.Caption;
 CancelBtn.Hint :=CancelBtn.Caption;
//------------------------------------------------------------------------------
 CurrDecimalSeparator:=ZSystemDecimalSeparator;
 EditData.Properties.EditMask:='100(['+CurrDecimalSeparator+']0(0?))? | \d\d? (['+CurrDecimalSeparator+',]\d\d?)?';
 LabelData.Caption := LabelPercent_Caption[PLanguageIndex];
end;

procedure TFPrev.ActionYesExecute(Sender: TObject);
begin
if EditData.Text='' then
 begin
  EditData.SetFocus;
  Exit;
 end;
ModalResult:=mrYes;
end;

procedure TFPrev.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

end.
