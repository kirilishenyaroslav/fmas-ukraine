unit Credit_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxContainer, cxEdit, cxTextEdit, cxControls,
  cxGroupBox, cxCurrencyEdit, ibase, cn_Common_Funcs, cxCheckBox, ActnList, cnConsts,
  cxButtonEdit, cn_Common_Messages, cn_Common_Types, cn_Common_Loader;

type
  TfrmCredit_AE = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Date_Create_Label: TLabel;
    Num_Doc_Label: TLabel;
    DateStartCalc_Label: TLabel;
    Date_Credit_Label: TLabel;
    lblNote_Label: TLabel;
    Num_Credit_Edit: TcxTextEdit;
    Date_Create_Edit: TcxDateEdit;
    DateStartCalc_Edit: TcxDateEdit;
    Date_Credit_Edit: TcxDateEdit;
    Note_Edit: TcxTextEdit;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    SummaLabel: TLabel;
    SummaEdit: TcxCurrencyEdit;
    Customer_Label: TLabel;
    Customer_Edit: TcxTextEdit;
    lblLimitSum: TLabel;
    LimitSum_Edit: TcxCurrencyEdit;
    lblLimitDog: TLabel;
    LimitDog_Edit: TcxCurrencyEdit;
    ckbxImagePriority: TcxCheckBox;
    ord_ae_Comments_Label: TLabel;
    ord_ae_Comments: TcxTextEdit;
    StatusEdit: TcxButtonEdit;
    lblStatus: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure act1Execute(Sender: TObject);
    procedure Num_Credit_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Date_Create_EditKeyPress(Sender: TObject; var Key: Char);
    procedure DateStartCalc_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Date_Credit_EditKeyPress(Sender: TObject; var Key: Char);
    procedure SummaEditKeyPress(Sender: TObject; var Key: Char);
    procedure Note_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Customer_EditKeyPress(Sender: TObject; var Key: Char);
    procedure LimitSum_EditKeyPress(Sender: TObject; var Key: Char);
    procedure LimitDog_EditKeyPress(Sender: TObject; var Key: Char);
    procedure ckbxImagePriorityKeyPress(Sender: TObject; var Key: Char);
    procedure ord_ae_CommentsKeyPress(Sender: TObject; var Key: Char);
    procedure TypeLg_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure StatusEditKeyPress(Sender: TObject; var Key: Char);
  private
   PLanguageIndex :byte;
   DB_Handle : TISC_DB_HANDLE;
   procedure FormIniLanguage();
  public
   Id_Status: Int64;
constructor Create(Owner: TComponent ; LangIndex : byte; DBHandle: TISC_DB_HANDLE); reintroduce;
  end;

implementation

{$R *.dfm}

constructor TfrmCredit_AE.Create(Owner: TComponent ; LangIndex : byte; DBHandle: TISC_DB_HANDLE);
begin
 inherited Create(Owner);
 PLanguageIndex := LangIndex;
 FormIniLanguage();
 DB_Handle:= DBHandle;
end;

procedure TfrmCredit_AE.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 Num_Doc_Label.Caption       :=   cn_FiltrByNum[PLanguageIndex];
 Date_Create_Label.Caption   :=   cn_Stamp[PLanguageIndex];
 DateStartCalc_Label.Caption :=   cn_grid_Date_Beg[PLanguageIndex];
 Date_Credit_Label.Caption   :=   cn_Date_Opl_Column[PLanguageIndex];
 SummaLabel.Caption          :=   cn_Summa_Column[PLanguageIndex];
 lblNote_Label.Caption       :=   cn_CreditNote[PLanguageIndex];
 Customer_Label.Caption      :=   cn_CreditBank[PLanguageIndex];
 lblLimitSum.Caption         :=   cn_LimitSum[PLanguageIndex];
 lblLimitDog.Caption         :=   cn_LimitDogs[PLanguageIndex];
 ckbxImagePriority.Properties.Caption   :=   cn_CreditImage[PLanguageIndex];
 ord_ae_Comments_Label.Caption  := cnConsts.cn_CommentDiss[PLanguageIndex];
 
 OKButton.Caption            :=   cn_Accept[PLanguageIndex];
 CancelButton.Caption        :=   cn_Cancel[PLanguageIndex];
end;

procedure TfrmCredit_AE.OKButtonClick(Sender: TObject);
begin
if CheckControls(self, PLanguageIndex) then exit;
ModalResult:= mrOk;
end;

procedure TfrmCredit_AE.CancelButtonClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCredit_AE.act1Execute(Sender: TObject);
{var i: Integer;
 TabStopper: Integer;
 IsFocusStop: Boolean;}
begin
{   TabStopper := -100;
   IsFocusStop := False;
   for i:=0 to ComponentCount-1 do
    if Components[i].ClassType <> TLabel then
    if Components[i].ClassType <> TAction then
    if Components[i].ClassType <> TActionList then
    if Components[i].ClassType <> TcxButton then
      if (Components[i] as TcxControl).IsFocused then
       begin
         TabStopper := (Components[i] as TcxControl).TabOrder;
         Break;
       end;

   if TabStopper <> -100 then
    for i:= 0 to ComponentCount-1 do
     begin
      if Components[i].ClassType <> TLabel then
      if Components[i].ClassType <> TAction then
      if Components[i].ClassType <> TActionList then
      if Components[i].ClassType <> TcxButton then
      if (Components[i] as TcxControl).TabOrder = TabStopper + 1 then
       begin
         (Components[i] as TcxControl).SetFocus;
         IsFocusStop:= True;
         Break;
       end;
    end;

   if not IsFocusStop then
    for i:= 0 to ComponentCount-1 do
     begin
      if Components[i].ClassType = TcxButton then
       begin
         (Components[i] as TcxButton).SetFocus;
         Break;
       end;
    end;}
end;

procedure TfrmCredit_AE.Num_Credit_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then Self.FindNextControl(Self.ActiveControl,True,true,False).SetFocus;
end;

procedure TfrmCredit_AE.Date_Create_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then Self.FindNextControl(Self.ActiveControl,True,true,False).SetFocus;
end;

procedure TfrmCredit_AE.DateStartCalc_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then Self.FindNextControl(Self.ActiveControl,True,true,False).SetFocus;
end;

procedure TfrmCredit_AE.Date_Credit_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then Self.FindNextControl(Self.ActiveControl,True,true,False).SetFocus;
end;

procedure TfrmCredit_AE.SummaEditKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then Self.FindNextControl(Self.ActiveControl,True,true,False).SetFocus;
end;

procedure TfrmCredit_AE.Note_EditKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then Self.FindNextControl(Self.ActiveControl,True,true,False).SetFocus;
end;

procedure TfrmCredit_AE.Customer_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then Self.FindNextControl(Self.ActiveControl,True,true,False).SetFocus;
end;

procedure TfrmCredit_AE.LimitSum_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then Self.FindNextControl(Self.ActiveControl,True,true,False).SetFocus;
end;

procedure TfrmCredit_AE.LimitDog_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then Self.FindNextControl(Self.ActiveControl,True,true,False).SetFocus;
end;

procedure TfrmCredit_AE.ckbxImagePriorityKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then Self.FindNextControl(Self.ActiveControl,True,true,False).SetFocus;
end;

procedure TfrmCredit_AE.ord_ae_CommentsKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then Self.FindNextControl(Self.ActiveControl,True,true,False).SetFocus;
end;

procedure TfrmCredit_AE.TypeLg_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  if Id_Status <> -1 then
  AParameter.ID_Locate := Id_Status;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_CreditStatus.bpl','ShowSPCreditStatus');
 if VarArrayDimCount(res)>0 then
  begin
   Id_Status := Res[0];
   StatusEdit.Text := Res[1];
  end;
  AParameter.Free;
end;

procedure TfrmCredit_AE.StatusEditKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then Self.FindNextControl(Self.ActiveControl,True,true,False).SetFocus;
end;

end.
