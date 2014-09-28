unit cn_Contracts_FilterEx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxLookAndFeelPainters, cxButtons, cxContainer, cxEdit,
  cxTextEdit, cxRadioGroup, cxControls, cxGroupBox, cn_Common_Funcs, cnConsts,
  cxCurrencyEdit, Buttons, DogLoaderUnit, ibase, DM, cn_Common_Types, cn_Common_Loader,
  cxLabel, cxMaskEdit, cxDropDownEdit, cxCalendar, cxCheckBox, FIBQuery,
  pFIBQuery, cxButtonEdit;

type
  TfrmFilterEx = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    GroupBox: TcxGroupBox;
    TIN_Radio: TcxRadioButton;
    Payer_Radio: TcxRadioButton;
    Edit: TcxTextEdit;
    TypePayer_GroupBox: TcxGroupBox;
    FizLizo_RadioButton: TcxRadioButton;
    YurLizo_RadioButton: TcxRadioButton;
    Label_yur: TLabel;
    cxGroupBox1: TcxGroupBox;
    Params_Button: TcxButton;
    Date_beg_z: TcxDateEdit;
    Date_End_Po: TcxDateEdit;
    Date_Beg_po: TcxDateEdit;
    Date_End_Z: TcxDateEdit;
    Z_beg: TcxLabel;
    Po_beg: TcxLabel;
    Z_end: TcxLabel;
    Po_End: TcxLabel;
    Date_Beg_Check: TcxCheckBox;
    Date_End_Check: TcxCheckBox;
    filterParams_check: TcxCheckBox;
    Schet_Edit: TcxButtonEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TIN_RadioClick(Sender: TObject);
    procedure Payer_RadioClick(Sender: TObject);
    procedure FizLizo_RadioButtonClick(Sender: TObject);
    procedure YurLizo_RadioButtonClick(Sender: TObject);
    procedure Schet_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Params_ButtonClick(Sender: TObject);
    procedure Date_Beg_CheckPropertiesChange(Sender: TObject);
    procedure Date_End_CheckPropertiesChange(Sender: TObject);
    procedure filterParams_checkPropertiesChange(Sender: TObject);
    procedure Schet_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    PLanguageIndex : byte;
    DM:TDM_Contracts;
    DB_sp_Handle:TISC_DB_HANDLE;
    procedure FormIniLanguage();
  public
    res:Variant;
    ID_SESSION_params_study : int64;
    constructor Create(AOwner:TComponent; LanguageIndex : byte; DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;



implementation

{$R *.dfm}

constructor TfrmFilterEx.Create(AOwner:TComponent; LanguageIndex : byte; DB_Handle:TISC_DB_HANDLE);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  PLanguageIndex:= LanguageIndex;
  DB_sp_Handle:= DB_Handle;
  FormIniLanguage();
  Screen.Cursor:=crDefault;
  Date_Beg_Check.Properties.Caption:=cnConsts.cn_grid_Date_Beg[PLanguageIndex];
  Date_End_Check.Properties.Caption:=cnConsts.cn_grid_Date_End[PLanguageIndex];
  Z_beg.Caption := cnConsts.cn_Z[PLanguageIndex];
  Z_end.Caption := cnConsts.cn_Z[PLanguageIndex];
  Po_Beg.Caption := cnConsts.cn_PO[PLanguageIndex];
  Po_End.Caption := cnConsts.cn_PO[PLanguageIndex];
  Dm := TDM_Contracts.Create(self);
  Dm.DB.Handle := DB_sp_Handle;

  ID_SESSION_params_study := -1;
  // генерирую сессию параметров отбора
  DM.WriteTransaction.StartTransaction;
  DM.StProc.StoredProcName:='CN_DT_REPORTS_SESSION';
  DM.StProc.Prepare;
  DM.StProc.ExecProc;
  ID_SESSION_params_study := DM.StProc.ParamByName('ID_SESSION').AsInt64;
  try
   DM.WriteTransaction.Commit;
   DM.StProc.Close;
   except
    on E:Exception do
     begin
      DM.WriteTransaction.Rollback;
      Showmessage('Error in procedure CN_DT_REPORTS_SESSION');
      Screen.Cursor := crDefault;
      raise;
     end;
  end;
  DM.free;
  Params_Button.Enabled:=false;
  Date_Beg_Check.Enabled:=false;
  Date_End_Check.Enabled:=False;
end;

procedure TfrmFilterEx.FormIniLanguage;
begin
  caption:=       cnConsts.cn_SearchCaption_Ex[PLanguageIndex];
  GroupBox.Caption:=       cnConsts.cn_Search_Ex[PLanguageIndex];
  TIN_Radio.Caption:=      cnConsts.cn_TIN_Ex[PLanguageIndex];
  Payer_Radio.Caption:=    cnConsts.cn_Payer_Ex[PLanguageIndex];
  FizLizo_RadioButton.Caption:=    cnConsts.cn_FizOsoba[PLanguageIndex];
  YurLizo_RadioButton.Caption:=    cnConsts.cn_YurOsoba[PLanguageIndex];
  Label_yur.Caption:=          cnConsts.cn_RasSchet_Caption[PLanguageIndex];
  Params_Button.Caption    :=  cn_ParamsOtbor[PLanguageIndex];
  OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
  CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];
end;

procedure TfrmFilterEx.OkButtonClick(Sender: TObject);
Var
  CheckParams:Boolean;
begin
  if filterParams_check.Checked then
   Begin
    CheckParams:=True;
    //поиск по параметрам
    If VarArrayDimCount(res)>0 then
      begin
       If res[0][0]=1 then ModalResult := 1000
        else CheckParams:=false;
      End
     Else CheckParams:=false;

    if not CheckParams then
     If (Date_Beg_Check.Checked or Date_End_Check.Checked) then
      Begin
       ID_SESSION_params_study:=-2;
       ModalResult := 1000;
      End
     Else ShowMessage(cnConsts.cn_FilterParams_Need[PLanguageIndex]);

   End
  Else
   Begin
    //поиск по номеру
    if (TIN_Radio.Checked) then
     Begin
      if Edit.Text='' then
                        Begin
                         showmessage(cnConsts.cn_Need_TIN[PLanguageIndex]);
                         Edit.SetFocus;
                         exit;
                        End;
      If length(Edit.text)>10 then Edit.Text:=copy(Edit.Text,1,10);
      ModalResult := 10;
     End;

    //поиск плательщика физическое лицо
    if (Payer_Radio.Checked) then
     Begin
      if FizLizo_RadioButton.Checked then
       Begin
        If Edit.Text='' then
                         begin
                          ShowMessage(cnConsts.cn_Payer_Need[PLanguageIndex]);
                          Edit.SetFocus;
                          exit;
                         End
                        else ModalResult := 11
       End
      else
       begin
        if Schet_Edit.Text = '' then ModalResult := 1; //поиск плательщика юридическое лицо по счету
        if Edit.Text = '' then ModalResult := 2;       //поиск плательщика юридическое лицо по названию
        if ((Schet_Edit.Text <> '') and (Edit.Text <> '')) then ModalResult := 3; //поиск плательщика юридическое лицо
       end;
     End;
   End;
end;

procedure TfrmFilterEx.EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then OkButton.SetFocus;

if ((key <> #8) and (key <> '/') and (key <> #13)) then
if IntegerCheck(Key) then
  TIN_Radio.Checked:=true
else
  Payer_Radio.Checked:=true;
end;

procedure TfrmFilterEx.CancelButtonClick(Sender: TObject);
begin
  close;
  ModalResult:= -1;
end;

procedure TfrmFilterEx.FormShow(Sender: TObject);
begin
  Edit.setfocus;
end;

procedure TfrmFilterEx.TIN_RadioClick(Sender: TObject);
begin
  Edit.Text:='';
  Edit.setfocus;
  TypePayer_GroupBox.Visible := False;
end;

procedure TfrmFilterEx.Payer_RadioClick(Sender: TObject);
begin
  Edit.Text:='';
  TypePayer_GroupBox.Visible := True;
  FizLizo_RadioButton.Checked:=true;
  FizLizo_RadioButtonClick(Sender);
  Edit.setfocus;
end;

procedure TfrmFilterEx.FizLizo_RadioButtonClick(Sender: TObject);
begin
  Schet_Edit.Visible := False;
  Label_yur.Visible := False;
  Schet_Edit.Properties.Buttons[0].Visible:=false;
  Edit.setfocus;
end;

procedure TfrmFilterEx.YurLizo_RadioButtonClick(Sender: TObject);
begin
  Schet_Edit.Text:='';
  Schet_Edit.Visible := True;
  Label_yur.Visible := True;
  Schet_Edit.Properties.Buttons[0].Visible:= True;
  Schet_Edit.setfocus;
end;

procedure TfrmFilterEx.Schet_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then Edit.SetFocus;
end;

procedure TfrmFilterEx.Params_ButtonClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  //запускаю справочник отбора параметров обучения
  AParameter := TcnSimpleParams.Create;
  AParameter.Owner := self;
  AParameter.Db_Handle := DB_sp_Handle;
  AParameter.Formstyle := fsNormal;
  AParameter.WaitPakageOwner := self;
  AParameter.ID_SESSION := ID_SESSION_params_study;
  Res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportsFilter.bpl','ShowReportFilter');
  AParameter.Free;
end;

procedure TfrmFilterEx.Date_Beg_CheckPropertiesChange(Sender: TObject);
begin
  If Date_Beg_Check.Checked then
   Begin
    Date_beg_z.Enabled:=true;
    Date_beg_po.Enabled:=true;
   End
  Else
   Begin
    Date_beg_z.Enabled:=False;
    Date_beg_po.Enabled:=False;
   End;
end;

procedure TfrmFilterEx.Date_End_CheckPropertiesChange(Sender: TObject);
begin
  If Date_End_Check.Checked then
   Begin
    Date_End_z.Enabled:=true;
    Date_End_po.Enabled:=true;
   End
  Else
   Begin
    Date_End_z.Enabled:=False;
    Date_End_po.Enabled:=False;
   End;
end;

procedure TfrmFilterEx.filterParams_checkPropertiesChange(Sender: TObject);
begin
  if filterParams_check.Checked
   then
    Begin
     Params_Button.Enabled :=True;
     Date_Beg_Check.Enabled:=True;
     Date_End_Check.Enabled:=True;
    End
   else
    Begin
     Params_Button.Enabled :=False;
     Date_Beg_Check.Enabled:=False;
     if Date_Beg_Check.Checked then Date_Beg_Check.Checked:=false;
     Date_End_Check.Enabled:=False;
     if Date_End_Check.Checked then Date_End_Check.Checked:=false;
    End; 
end;

procedure TfrmFilterEx.Schet_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
      i, o : TSpravParams;
begin
    i := TSpravParams.Create;
    o := TSpravParams.Create;
    i['DataBase']     := Integer(DB_sp_Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := SelCustomer;
    LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
    begin

     Edit.text := o['NAME_CUSTOMER'];
     //MFO_Edit.text := o['MFO'];
     Schet_Edit.text := o['RATE_ACCOUNT'];
    end;
    i.Free;
    o.Free;
end;

end.
