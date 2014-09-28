unit gr_AcctCard_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel,
  cxControls, cxGroupBox, StdCtrls, cxButtons,
  PackageLoad, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GlobalSpr,
  cxSpinEdit, FIBQuery, pFIBQuery, pFIBStoredProc, gr_uCommonConsts, zTypes,
  ActnList, zProc, gr_uMessage, gr_AcctCard_DM, cxCheckBox, gr_uCommonLoader,
  cxGraphics, dxStatusBar, Registry, cxDBEdit;

type
  TFTnAccessControl = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    BoxMan: TcxGroupBox;
    EditMan: TcxButtonEdit;
    LabelMan: TcxLabel;
    BoxPriv: TcxGroupBox;
    LabelTypeViplata: TcxLabel;
    Actions: TActionList;
    Action1: TAction;
    LabelAcctCard: TcxLabel;
    MaskEditCard: TcxMaskEdit;
    ClearBtn: TcxButton;
    BpxShifr: TcxGroupBox;
    LabelShifr: TcxLabel;
    MaskEditShifr: TcxMaskEdit;
    CheckBoxShifrIsEdit: TcxCheckBox;
    Action2: TAction;
    dxStatusBar1: TdxStatusBar;
    Action3: TAction;
    LookupCBoxTypePayment: TcxLookupComboBox;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure MaskEditCardKeyPress(Sender: TObject; var Key: Char);
    procedure Action1Execute(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
    procedure MaskEditShifrKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBoxShifrIsEditPropertiesChange(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure RestoreFromBuffer(Sender:TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure LookupCBoxTypePaymentPropertiesChange(Sender: TObject);
  private
    Pcfs:TZControlFormStyle;
    PId_man:Integer;
    PId_Viplata:Integer;
    PResault:Variant;
    PLanguageIndex:Byte;
    DM:TDM_Ctrl;
  public
    constructor Create(AParameter:TgrCtrlSimpleParam);reintroduce;
    property Resault:Variant read PResault;
  end;

implementation

uses VarConv;

{$R *.dfm}

constructor TFTnAccessControl.Create(AParameter:TgrCtrlSimpleParam);
begin
 inherited Create(AParameter.Owner);
 PLanguageIndex:=LanguageIndex;
 PId_man:= AParameter.Id;
//******************************************************************************
 Caption                      := LabelAcctCard_Caption[PLanguageIndex];
 YesBtn.Caption               := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption            := CancelBtn_Caption[PLanguageIndex];
 ClearBtn.Caption             := ClearBtn_Caption[PLanguageIndex];
 LabelMan.Caption             := LabelStudent_Caption[PLanguageIndex];
 LabelTypeViplata.Caption     := LabelTypePayment_Caption[PLanguageIndex];
 LabelAcctCard.Caption        := LabelAcctCard_Caption[PLanguageIndex];
 CheckBoxShifrIsEdit.Properties.Caption := UpdateBtn_Caption[PLanguageIndex];
 LabelShifr.Caption           := LabelShifr_Caption[PLanguageIndex];
//******************************************************************************
 DM:=TDM_Ctrl.Create(self);
 with Dm do
  begin
  DataBase.Handle := AParameter.DB_Handle;
  DSet.SQLs.SelectSQL.Text := 'SELECT * FROM GR_ACCTCARD_S_BY_ID_MAN('+IntToStr(PID_man)+')';
  DSet.Open;
  DSetTypePayment.SelectSQL.Text := 'SELECT * FROM Z_SP_TYPE_PAYMENT_SELECT';
  DSetTypePayment.Open;
  LookupCBoxTypePayment.Properties.DataController.DataSource := DM.DSourceTypePayment;
  EditMan.Text := VarToStrDef(DSet['FIO'],'');
  if VarIsNULL(DSet['ID_PAYMENT']) then
   begin
    PId_Viplata:=-99;
    MaskEditCard.Text := '';
   end
  else
   begin
    PId_Viplata:=DSet['ID_PAYMENT'];
    MaskEditCard.Text := VarToStrDef(DSet['ACCT_CARD'],'');
    LookupCBoxTypePayment.EditValue  := DSet['ID_PAYMENT'];
   end;
   MaskEditShifr.Text:=VarToStrDef(DSet['SHIFR'],'');
  end;
//******************************************************************************
end;

procedure TFTnAccessControl.CancelBtnClick(Sender: TObject);
begin
ModalResult  := mrCancel;
end;

procedure TFTnAccessControl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if DM.DefaultTransaction.Active then DM.DefaultTransaction.Commit;
end;

procedure TFTnAccessControl.FormDestroy(Sender: TObject);
begin
if DM<>nil then DM.Destroy;
end;

procedure TFTnAccessControl.MaskEditCardKeyPress(Sender: TObject;
  var Key: Char);
begin
if not((Key in ['0'..'9']) and (Length(MaskEditCard.Text)<16)) then Key:=#0;
end;

procedure TFTnAccessControl.Action1Execute(Sender: TObject);
begin
  with DM do
  try
   StoredProc.Database := DataBase;
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName := 'GR_ACCTCARD_IUD';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_MAN').AsInteger := PId_man;
   if PId_Viplata=-99 then
      StoredProc.ParamByName('ID_PAYMENT').AsVariant := NULL
   else
      StoredProc.ParamByName('ID_PAYMENT').AsInteger := PId_Viplata;
   if MaskEditCard.Text='' then
      StoredProc.ParamByName('ACCT_CARD').AsVariant := NULL
   else StoredProc.ParamByName('ACCT_CARD').AsString := MaskEditCard.Text;
   if MaskEditShifr.Text='' then
     StoredProc.ParamByName('SHIFR').AsVariant:=NULL
   else StoredProc.ParamByName('SHIFR').AsInteger:=StrToInt(MaskEditShifr.Text);
   StoredProc.ExecProc;
   StoredProc.Transaction.Commit;
   ModalResult:=mrYes;
  except
   on e:exception do
    begin
     grShowMessage(ECaption[PLanguageIndex],E.Message,mtError,[mbOK]);
     StoredProc.Transaction.Rollback;
    end;
  end
end;

procedure TFTnAccessControl.ClearBtnClick(Sender: TObject);
begin
PId_Viplata := -99;
MaskEditCard.Text := '';
end;

procedure TFTnAccessControl.MaskEditShifrKeyPress(Sender: TObject;
  var Key: Char);
begin
if not((Key in ['0'..'9']) and (Length(MaskEditShifr.Text)<16)) then Key:=#0;
end;

procedure TFTnAccessControl.CheckBoxShifrIsEditPropertiesChange(
  Sender: TObject);
begin
  if TcxCheckBox(Sender).Checked=true then MaskEditShifr.Enabled:=true
  else MaskEditShifr.Enabled:=false;
end;

procedure TFTnAccessControl.Action2Execute(Sender: TObject);
var reg: TRegistry;
    Key:string;
begin
 CancelBtn.SetFocus;
 Key := '\Software\Grant\TnAccessControl';
 reg:=TRegistry.Create;
 try   
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey(Key,True);
  reg.WriteString('IsBuffer','1');
  reg.WriteString('MaskEditCard',MaskEditCard.EditValue); 
  if(MaskEditShifr.Enabled=true) then begin
  reg.WriteString('MaskEditShifr',MaskEditShifr.EditValue);
  reg.WriteString('MaskEditShifrEnabled','True');
  end;
  //buttonEdit
  reg.WriteString('EditViplata',LookupCBoxTypePayment.EditValue);
  reg.WriteInteger('PId_Viplata',PId_Viplata);
 finally
  reg.Free;
 end;
end;



procedure TFTnAccessControl.RestoreFromBuffer(Sender:TObject);
var reg:TRegistry;
    Kod:integer;
    Key:string;
begin
  Key := '\Software\Grant\TnAccessControl';
  reg := TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER;
  if not reg.OpenKey(Key,False) then
   begin
    reg.free;
    Exit;
   end;
  
 if reg.ReadString('IsBuffer')<>'1' then
  begin
   reg.Free;
   exit;
  end;
  MaskEditCard.EditValue:=reg.ReadString('MaskEditCard'); 
  if(reg.ReadString('MaskEditShifrEnabled')='True') then begin 
  MaskEditShifr.Enabled:=True;
  MaskEditShifr.EditValue:=reg.ReadString('MaskEditShifr');
  CheckBoxShifrIsEdit.Checked:=True;
  end;
  //buttonEdit
  LookupCBoxTypePayment.EditValue:=  reg.ReadString('EditViplata');
  PId_Viplata:=reg.ReadInteger('PId_Viplata');
  
  Reg.Free;
end;


procedure TFTnAccessControl.FormShow(Sender: TObject);
begin
if Pcfs=zcfsInsert then  RestoreFromBuffer(self);
LookupCBoxTypePayment.SetFocus;
end;

procedure TFTnAccessControl.FormCreate(Sender: TObject);
begin
 dxStatusBar1.Panels[0].Text := 'F9 - '+ToBuffer_Caption[PLanguageIndex];
 dxStatusBar1.Panels[1].Text := 'F10 - '+YesBtn.Caption;
 dxStatusBar1.Panels[2].Text := 'Esc - '+CancelBtn.Caption;
end;

procedure TFTnAccessControl.Action3Execute(Sender: TObject);
begin
if CancelBtn.focused=true then close();
if YesBtn.Focused then Action1.Execute;
if MaskEditShifr.IsFocused and MaskEditShifr.Enabled and MaskEditShifr.Visible   then YesBtn.setFocus;
if CheckBoxShifrIsEdit.IsFocused   then
  if MaskEditShifr.enabled=true and MaskEditShifr.visible then
  MaskEditShifr.SetFocus
  else YesBtn.setFocus;
if MaskEditCard.IsFocused and CheckBoxShifrIsEdit.visible and CheckBoxShifrIsEdit.Enabled then CheckBoxShifrIsEdit.setFocus;
if LookupCBoxTypePayment.IsFocused and MaskEditCard.visible and MaskEditCard.Enabled
then CheckBoxShifrIsEdit.setFocus
else if LookupCBoxTypePayment.IsFocused=true then CheckBoxShifrIsEdit.SetFocus;



end;

procedure TFTnAccessControl.LookupCBoxTypePaymentPropertiesChange(
  Sender: TObject);
begin
  if(LookupCBoxTypePayment.EditValue<> null)then
    PId_Viplata:=LookupCBoxTypePayment.EditValue;
end;

end.
