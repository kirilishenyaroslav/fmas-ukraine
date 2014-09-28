unit TITaxInvoicesKorig_AddInNakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxLookAndFeelPainters, cxButtons,
  cxTextEdit, cxButtonEdit, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Ibase,TiCommonProc,TICommonLoader,TiMessages,
  cxCurrencyEdit,Registry,Spin,TITaxinvoicesKorig_DM;

type TTITaxInvoicesAddVidNaklDelivery=record
  id_range_of_delivery   : Integer;
  Name_range_of_delivery : string;
  Id_Measures            : Integer;
  Name_Measures          : string;
  id_kod_tovar           : Integer;
  Name_Kod_tovar         : string;
  Num_Kod_tovar          : string;
end;

type
  TTaxInvoicesKorigAddInNaklForm = class(TForm)
    Panel1: TPanel;
    SummaGroupBox: TGroupBox;
    ValueDeliveryExportLabel: TLabel;
    ValueDelivery20Label: TLabel;
    PostavkaGroupBox: TGroupBox;
    PriceLabel: TLabel;
    ValueDeliveryCustomsLabel: TLabel;
    KolVoLabel: TLabel;
    YesButton: TcxButton;
    CancelButton: TcxButton;
    edit_priceCurrencyEdit: TcxCurrencyEdit;
    main_stavkaCurrencyEdit: TcxCurrencyEdit;
    null_stavkaCurrencyEdit: TcxCurrencyEdit;
    summa_not_pdvCurrencyEdit: TcxCurrencyEdit;
    DataGroupBox: TGroupBox;
    DateKorrectEdit: TcxDateEdit;
    DateKorrectLabel: TLabel;
    RangeOfDeliveryButtonEdit: TcxButtonEdit;
    RangeOfDeliveryLabel: TLabel;
    GroupBox1: TGroupBox;
    KodTovarCheckBox: TCheckBox;
    KodTovarButtonEdit: TcxButtonEdit;
    MonthList: TComboBox;
    YearSpinEdit: TSpinEdit;
    ZaCheckBox: TCheckBox;
    ReasonLabel: TLabel;
    ReasonTextEdit: TcxTextEdit;
    MeasuresLabel: TLabel;
    MeasuresButtonEdit: TcxButtonEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edit_kolvoCurrencyEdit: TcxCurrencyEdit;
    edit_price_costCurrencyEdit: TcxCurrencyEdit;
    edit_kolvo_costTextEdit: TcxTextEdit;
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CancelButtonClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure YesButtonClick(Sender: TObject);
    procedure main_stavkaCurrencyEditExit(Sender: TObject);
    procedure DateKorrectEditKeyPress(Sender: TObject; var Key: Char);
    procedure RangeOfDeliveryButtonEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure MeasuresButtonEditKeyPress(Sender: TObject; var Key: Char);
    procedure edit_kolvoTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure edit_priceCurrencyEditKeyPress(Sender: TObject; var Key: Char);
    procedure main_stavkaCurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure null_stavkaCurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure ValueDeliveryVATexemptionsCurrencyEditKeyPress(
      Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure summa_not_pdvCurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure KodTovarButtonEditClick(Sender: TObject);
    procedure KodTovarButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KodTovarCheckBoxClick(Sender: TObject);
    procedure ZaCheckBoxClick(Sender: TObject);
    procedure ReasonTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure edit_kolvoCurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure edit_price_costCurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure edit_kolvo_costCurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
  private
    PRes              : Variant;
    PDb_Handle        : TISC_DB_HANDLE;
    PParameter        : TTITaxInvoicesAddVidNaklDelivery;
    TaxInvoicesKorigDM : TTaxInvoicesKorigDM;
  public
    Kod_Setup         : Integer;
    procedure ReadReg;
    procedure WriteReg;
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;AddParametr:TTITaxInvoicesAddVidNaklDelivery);reintroduce;
    property Parameter:TTITaxInvoicesAddVidNaklDelivery read PParameter;
    property Res:Variant read PRes;

  end;

var
  TaxInvoicesKorigAddInNaklForm: TTaxInvoicesKorigAddInNaklForm;

implementation



{$R *.dfm}
constructor TTaxInvoicesKorigAddInNaklForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;AddParametr:TTITaxInvoicesAddVidNaklDelivery);
begin
  inherited Create(AOwner);
  PDb_Handle := Db_Handle;
  TaxInvoicesKorigDM     := TTaxInvoicesKorigDM.Create(AOwner,Db_Handle);
  PParameter := AddParametr;
end;

procedure TTaxInvoicesKorigAddInNaklForm.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  measures:Variant;
begin
  Parameter := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesKorigDM.DB.Handle;
  Parameter.Owner := self;
  measures := DoFunctionFromPackage(Parameter,Measures_Const);
  Parameter.Destroy;
  If VarArrayDimCount(measures)>0 then
  begin
    MeasuresButtonEdit.Text  := measures[1];
    PParameter.Id_Measures   := measures[0];
    PParameter.Name_Measures := measures[2];
    {if ((MeasuresButtonEdit.Text = 'Грн') or (MeasuresButtonEdit.Text = 'Гривня') )then
    begin
      KolVoTextEdit.Text := 'послуги';
    end
    else
      KolVoTextEdit.Text := '';  }
  end;

end;

procedure TTaxInvoicesKorigAddInNaklForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TTaxInvoicesKorigAddInNaklForm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  RangeOfDelivery:Variant;
begin
  Parameter := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesKorigDM.DB.Handle;
  Parameter.Owner := self;
  RangeOfDelivery := DoFunctionFromPackage(Parameter,RangeOfDelivery_Const);
  Parameter.Destroy;

  If VarArrayDimCount(RangeOfDelivery)>0 then
  begin
    RangeOfDeliveryButtonEdit.Text    := RangeOfDelivery[1];
    PParameter.id_range_of_delivery   := RangeOfDelivery[0];
    PParameter.Name_range_of_delivery := RangeOfDelivery[1];
  end;
end;

procedure TTaxInvoicesKorigAddInNaklForm.ReadReg;
var
  reg : TRegistry;
begin
  try
   begin
     reg := TRegistry.Create;
     reg.RootKey := HKEY_CURRENT_USER;
     if reg.OpenKey('\Software\TaxInvoices\VidNaklDeliveryIns\',False) then
     begin
       RangeOfDeliveryButtonEdit.Text    := reg.ReadString('NAME_RANGE_OF_DELIVERY');
       PParameter.id_range_of_delivery   := StrToInt(reg.ReadString('id_range_of_delivery'));
       PParameter.Name_range_of_delivery := reg.ReadString('Name_range_of_delivery');
       MeasuresButtonEdit.Text           := reg.ReadString('Name_Measures');
       PParameter.Id_Measures            := StrToInt(reg.ReadString('Id_Measures'));
       PParameter.Name_Measures          := reg.ReadString('Name_Measures');
     end
     else
     begin
       RangeOfDeliveryButtonEdit.Text := '';
       MeasuresButtonEdit.Text        := '';
     end;
   end
  finally
    reg.Free;
  end;
end;

procedure TTaxInvoicesKorigAddInNaklForm.WriteReg;
var
  reg : TRegistry;
begin
  reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if (reg.OpenKey('\Software\TaxInvoices\VidNaklDeliveryIns\',True)) then
   begin
     reg.WriteString('id_range_of_delivery',IntToStr(PParameter.id_range_of_delivery));
     reg.WriteString('Name_range_of_delivery',PParameter.Name_range_of_delivery);
     reg.WriteString('Id_Measures',IntToStr(PParameter.Id_Measures));
     reg.WriteString('Name_Measures',PParameter.Name_Measures);
   end;
  finally
   reg.Free;
  end;
end;

procedure TTaxInvoicesKorigAddInNaklForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteReg;
end;

procedure TTaxInvoicesKorigAddInNaklForm.YesButtonClick(Sender: TObject);
begin
  if (DateKorrectEdit.Visible = True) then
  begin
    if (DateKorrectEdit.Text='') then
    begin
      TiShowMessage('Увага!','Заповніть дату корегування!',mtWarning,[mbOK]);
      DateKorrectEdit.SetFocus;
      Exit;
    end;
  end;

  if (RangeOfDeliveryLabel.Visible = True) then
  begin
    if (RangeOfDeliveryButtonEdit.Text='') then
    begin
      TiShowMessage('Увага!','Заповніть номенклатуру поставки!',mtWarning,[mbOK]);
      RangeOfDeliveryButtonEdit.SetFocus;
      Exit;
    end;
  end;

  if (ReasonTextEdit.Text='') then
  begin
    TiShowMessage('Увага!','Заповніть причину корегування!',mtWarning,[mbOK]);
    ReasonTextEdit.SetFocus;
    Exit;
  end;

  if (MeasuresButtonEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть одиницю виміру!',mtWarning,[mbOK]);
   MeasuresButtonEdit.SetFocus;
   Exit;
  end;

  if (edit_kolvoCurrencyEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть зміну кількості, об`єму, обсягу!!',mtWarning,[mbOK]);
   edit_kolvoCurrencyEdit.SetFocus;
   Exit;
  end;

  if (edit_priceCurrencyEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть ціну постачання товарів/послуг!',mtWarning,[mbOK]);
   edit_priceCurrencyEdit.SetFocus;
   Exit;
  end;

  if (edit_price_costCurrencyEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть зміну ціни!',mtWarning,[mbOK]);
   edit_price_costCurrencyEdit.SetFocus;
   Exit;
  end;

  if (edit_kolvo_costTextEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть кіль-ть постачання товарів/послуг!',mtWarning,[mbOK]);
   edit_kolvo_costTextEdit.SetFocus;
   Exit;
  end;

  if (main_stavkaCurrencyEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть оподатков. за основною ставкою!',mtWarning,[mbOK]);
   main_stavkaCurrencyEdit.SetFocus;
   Exit;
  end;

  if (null_stavkaCurrencyEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть оподатков. за нульовою ставкою!',mtWarning,[mbOK]);
   null_stavkaCurrencyEdit.SetFocus;
   Exit;
  end;

  if (summa_not_pdvCurrencyEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть звільнені від ПДВ!',mtWarning,[mbOK]);
   summa_not_pdvCurrencyEdit.SetFocus;
   Exit;
  end;

  if (KodTovarCheckBox.Checked = True) then
  begin
    if (KodTovarButtonEdit.Text='') then
    begin
      TiShowMessage('Увага!','Заповніть код товару або зніміть галочку!',mtWarning,[mbOK]);
      KodTovarButtonEdit.SetFocus;
      Exit;
    end;
  end;
  ModalResult := mrOk;
end;

procedure TTaxInvoicesKorigAddInNaklForm.main_stavkaCurrencyEditExit(
  Sender: TObject);
begin
  //summa := (StrToFloat(PriceCurrencyEdit.EditValue))*(StrToFloat(KolVoCurrencyEdit.EditValue));
  //ValueDelivery20CurrencyEdit.Text := FloatToStr(summa);
end;

procedure TTaxInvoicesKorigAddInNaklForm.DateKorrectEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then ReasonTextEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddInNaklForm.RangeOfDeliveryButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then MeasuresButtonEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddInNaklForm.MeasuresButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then edit_kolvoCurrencyEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddInNaklForm.edit_kolvoTextEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  //if key = #13 then PriceCurrencyEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddInNaklForm.edit_priceCurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then edit_price_costCurrencyEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddInNaklForm.main_stavkaCurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then null_stavkaCurrencyEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddInNaklForm.null_stavkaCurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then summa_not_pdvCurrencyEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddInNaklForm.ValueDeliveryVATexemptionsCurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then YesButton.SetFocus;
end;

procedure TTaxInvoicesKorigAddInNaklForm.FormActivate(Sender: TObject);
begin
  DateKorrectEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddInNaklForm.summa_not_pdvCurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then YesButton.SetFocus;
end;

procedure TTaxInvoicesKorigAddInNaklForm.KodTovarButtonEditClick(
  Sender: TObject);
begin
  KodTovarCheckBox.Checked := KodTovarButtonEdit.Enabled;
end;


procedure TTaxInvoicesKorigAddInNaklForm.KodTovarButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  KodTovar:Variant;
begin
  Parameter := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesKorigDM.DB.Handle;
  Parameter.Owner := self;
  KodTovar := DoFunctionFromPackage(Parameter,KodTovar_Const);
  Parameter.Destroy;

  If VarArrayDimCount(KodTovar)>0 then
  begin
    KodTovarButtonEdit.Text   := KodTovar[1];
    PParameter.id_kod_tovar   := KodTovar[0];
    PParameter.Name_Kod_tovar := KodTovar[1];
    KodTovarButtonEdit.SetFocus;
  end;
end;

procedure TTaxInvoicesKorigAddInNaklForm.KodTovarCheckBoxClick(
  Sender: TObject);
begin
  if KodTovarCheckBox.Checked = True then
    KodTovarButtonEdit.Enabled := True
  else
    KodTovarButtonEdit.Enabled := False;
end;

procedure TTaxInvoicesKorigAddInNaklForm.ZaCheckBoxClick(Sender: TObject);
begin
  MonthList.Enabled := ZaCheckBox.Checked;
  YearSpinEdit.Enabled := ZaCheckBox.Checked;
end;

procedure TTaxInvoicesKorigAddInNaklForm.ReasonTextEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then RangeOfDeliveryButtonEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddInNaklForm.edit_kolvoCurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then edit_priceCurrencyEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddInNaklForm.edit_price_costCurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then edit_kolvo_costTextEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddInNaklForm.edit_kolvo_costCurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then main_stavkaCurrencyEdit.SetFocus;
end;

end.
