unit CurrentCtrl_ByHours;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxMaskEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookAndFeelPainters, ActnList, ExtCtrls, StdCtrls, cxButtons, IBase,
  Unit_ZGlobal_Consts, ZProc, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet;

type TFByHours_Result = record
  Clock:string;
  Sum_Clock:double;
  Percent:double;
  Summa:double;
  ModalResult:TModalResult;
end;

type
  TFCurrCtrl_ByHours = class(TForm)
    LabelHours: TcxLabel;
    LabelSumma: TcxLabel;
    LabelPercent: TcxLabel;
    EditHours: TcxMaskEdit;
    EditSumma: TcxMaskEdit;
    EditPercent: TcxMaskEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    Bevel1: TBevel;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
    procedure EditHoursKeyPress(Sender: TObject; var Key: Char);
  private
    P_ID_Man_Moving:Integer;
    PDB_Handle:TISC_DB_HANDLE;
    PLanguageIndex:Byte;
    CurrDecimalSeparator:string[1];
  public
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Id_Man_Moving:Integer);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TFCurrCtrl_ByHours.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Id_Man_Moving:Integer);
begin
 inherited Create(AOwner);
 PDB_Handle:=DB_Handle;
 P_ID_Man_Moving:=Id_Man_Moving;
//------------------------------------------------------------------------------
 PLanguageIndex:=LanguageIndex;
 YesBtn.Caption := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption :=  CancelBtn_Caption[PLanguageIndex];
 YesBtn.Hint := YesBtn.Caption;
 CancelBtn.Hint :=CancelBtn.Caption;
 LabelHours.Caption := LabelHours_Caption[PLanguageIndex];
 LabelSumma.Caption := LabelSumma_Caption[PLanguageIndex];
 LabelPercent.Caption := LabelPercent_Caption[PLanguageIndex];
//------------------------------------------------------------------------------
 CurrDecimalSeparator:=ZSystemDecimalSeparator;
 EditHours.Properties.EditMask:='\d\d?\d? (['+CurrDecimalSeparator+']\d\d?\d?)?';
 EditSumma.Properties.EditMask:='\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+CurrDecimalSeparator+']\d\d?)?';
 EditPercent.Properties.EditMask:='100(['+CurrDecimalSeparator+']0(0?))? | \d\d? (['+CurrDecimalSeparator+',]\d\d?)?';
//------------------------------------------------------------------------------
 DSet.SQLs.SelectSQL.Text := 'SELECT REAL_OKLAD FROM MAN_MOVING WHERE ID_MAN_MOVING='+IntToStr(Id_Man_Moving);
 Db.Handle:=DB_Handle;
 ReadTransaction.StartTransaction;
 DSet.Open;
 if not VarIsNull(DSet['REAL_OKLAD']) then
    EditSumma.Text:=FloatToStrF(DSet['REAL_OKLAD'],ffFixed,16,2);
 DSet.Close;
 ReadTransaction.Commit;
 DB.Close;
end;

procedure TFCurrCtrl_ByHours.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFCurrCtrl_ByHours.ActionYesExecute(Sender: TObject);
begin
if EditSumma.Text='' then
 begin
  EditSumma.SetFocus;
  Exit;
 end;
if EditPercent.Text='' then
 begin
  EditPercent.SetFocus;
  Exit;
 end;
ModalResult:=mrYes;
end;

procedure TFCurrCtrl_ByHours.EditHoursKeyPress(Sender: TObject;
  var Key: Char);
begin
if (Key='.') or (Key=',') then Key:=CurrDecimalSeparator[1];
end;

end.
