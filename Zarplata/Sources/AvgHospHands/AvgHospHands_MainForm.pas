unit AvgHospHands_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxCurrencyEdit, cxLabel,
  cxGroupBox, StdCtrls, cxButtons, cxControls, cxContainer, cxEdit,
  cxRadioGroup, ZTypes, Unit_ZGlobal_Consts, ZProc, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, ZMessages, cxMaskEdit,
  ActnList;

type
  TFAvgHospHands = class(TForm)
    RadioGroupTypeCount: TcxRadioGroup;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    cxGroupBox1: TcxGroupBox;
    LabelAvgSum: TcxLabel;
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    EditAvgSumma: TcxMaskEdit;
    ActionList1: TActionList;
    YesBtnAction: TAction;
    procedure CancelBtnClick(Sender: TObject);
    procedure YesBtnActionExecute(Sender: TObject);
  private
    PParameter:TZAvgSumParameter;
    PLanguageIndex:byte;
    PIsOk:boolean;
  public
    constructor Create(Parameter:TZAvgSumParameter);reintroduce;
    property IsOk:Boolean read PIsOk;
  end;

implementation

{$R *.dfm}

constructor TFAvgHospHands.Create(Parameter:TZAvgSumParameter);
begin
 inherited Create(Parameter.Owner);
 PIsOk:=True;
//*****************************************************************************
 PLanguageIndex:=LanguageIndex;
 Caption:=LabelAvgSum_Caption[PLanguageIndex];
 YesBtn.Caption := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption := CancelBtn_Caption[PLanguageIndex];
 RadioGroupTypeCount.Properties.Items[0].Caption:= LabelByDays_Caption[PLanguageIndex];
 RadioGroupTypeCount.Properties.Items[1].Caption:=LabelByHours_Caption[PLanguageIndex];
 LabelAvgSum.Caption:= LabelAvgSum_Caption[PLanguageIndex];
 CancelBtn.Hint :=  CancelBtn.Caption+' (Esc)';
 YesBtn.Hint:=YesBtn.Caption;

//*****************************************************************************
 //    EditAvgSumma.Properties.EditMask := '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+ZSystemDecimalSeparator+']\d\d?)?';
//*****************************************************************************
 PParameter:=Parameter;
 DB.Handle:=PParameter.DB_Handle;
 try
  Transaction.StartTransaction;
  StProc.StoredProcName:='Z_HOSP_HANDS_AVG_S_BY_ID';
  StProc.Prepare;
  StProc.ParamByName('ID_HOSP').AsInteger := PParameter.Id_Hosp_List;
  StProc.ParamByName('RMOVING').AsInteger := PParameter.rmoving;
  StProc.ExecProc;
  if not VarIsNull(StProc.ParamByName('IS_SMENA').AsVariant) then
   begin
    EditAvgSumma.Text := FloatToStrF(StProc.ParamByName('AVG_SUM').Asfloat,ffFixed,16,2);
    if VarToStr(StProc.ParamByName('IS_SMENA').AsVariant)='T' then
     RadioGroupTypeCount.ItemIndex:=1
    else
     RadioGroupTypeCount.ItemIndex:=0;
   end;
  Transaction.Commit;
 except
  on E:exception do
   begin
    ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
    Transaction.Rollback;
    PIsOk:=False;
   end;
 end;
end;

procedure TFAvgHospHands.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFAvgHospHands.YesBtnActionExecute(Sender: TObject);
begin
 try
  Transaction.StartTransaction;
  StProc.StoredProcName:='Z_HOSP_HANDS_AVG_IUD';
  StProc.Prepare;
  StProc.ParamByName('ID_HOSP').AsInteger := PParameter.Id_Hosp_List;
  StProc.ParamByName('RMoVING').AsInteger := PParameter.rmoving;
  if Trim(EditAvgSumma.Text)='' then
   begin
    StProc.ParamByName('IS_SMENA').AsVariant := Null;
    StProc.ParamByName('AVG_SUM').AsVariant := Null;
   end
  else
   begin
    StProc.ParamByName('IS_SMENA').AsString := ifThen(RadioGroupTypeCount.ItemIndex=0,'F','T');
    StProc.ParamByName('AVG_SUM').AsDouble := StrToFloat(EditAvgSumma.Text);
   end;
  StProc.ExecProc;
  Transaction.Commit;
  ModalResult:=mrYes;
 except
  on E:exception do
   begin
    ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
    Transaction.Rollback;
    end;
 end;
end;

end.
