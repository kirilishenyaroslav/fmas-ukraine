unit TITaxInvoicesEdit_AddInNakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxLookAndFeelPainters, cxButtons,
  cxTextEdit, cxButtonEdit, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Ibase,TiCommonProc,TICommonLoader,TiMessages,
  cxCurrencyEdit,Registry,TITaxinvoicesEdit_DM, Spin;

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
  TTaxInvoicesEditAddInNaklForm = class(TForm)
    Panel1: TPanel;
    SummaGroupBox: TGroupBox;
    ValueDeliveryExportLabel: TLabel;
    ValueDelivery20Label: TLabel;
    ValueDeliveryVATexemptionsLabel: TLabel;
    PostavkaGroupBox: TGroupBox;
    MeasuresLabel: TLabel;
    PriceLabel: TLabel;
    ValueDeliveryCustomsLabel: TLabel;
    KolVoLabel: TLabel;
    MeasuresButtonEdit: TcxButtonEdit;
    YesButton: TcxButton;
    CancelButton: TcxButton;
    PriceCurrencyEdit: TcxCurrencyEdit;
    ValueDelivery20CurrencyEdit: TcxCurrencyEdit;
    ValueDeliveryExportCurrencyEdit: TcxCurrencyEdit;
    ValueDeliveryCustomsCurrencyEdit: TcxCurrencyEdit;
    ValueDeliveryVATexemptionsCurrencyEdit: TcxCurrencyEdit;
    DataGroupBox: TGroupBox;
    DateShipmentEdit: TcxDateEdit;
    DateShipmentLabel: TLabel;
    RangeOfDeliveryButtonEdit: TcxButtonEdit;
    RangeOfDeliveryLabel: TLabel;
    KolVoTextEdit: TcxTextEdit;
    GroupBox1: TGroupBox;
    KodTovarCheckBox: TCheckBox;
    KodTovarButtonEdit: TcxButtonEdit;
    MonthList: TComboBox;
    YearSpinEdit: TSpinEdit;
    ZaCheckBox: TCheckBox;
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CancelButtonClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure YesButtonClick(Sender: TObject);
    procedure ValueDelivery20CurrencyEditExit(Sender: TObject);
    procedure DateShipmentEditKeyPress(Sender: TObject; var Key: Char);
    procedure RangeOfDeliveryButtonEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure MeasuresButtonEditKeyPress(Sender: TObject; var Key: Char);
    procedure KolVoTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure PriceCurrencyEditKeyPress(Sender: TObject; var Key: Char);
    procedure ValueDelivery20CurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure ValueDeliveryExportCurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure ValueDeliveryVATexemptionsCurrencyEditKeyPress(
      Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure ValueDeliveryCustomsCurrencyEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure KodTovarButtonEditClick(Sender: TObject);
    procedure KodTovarButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KodTovarCheckBoxClick(Sender: TObject);
    procedure ZaCheckBoxClick(Sender: TObject);
  private
    PRes              : Variant;
    PDb_Handle        : TISC_DB_HANDLE;
    PParameter        : TTITaxInvoicesAddVidNaklDelivery;
    TaxInvoicesEditDM : TTaxInvoicesEditDM;
  public
    Kod_Setup         : Integer;
    procedure ReadReg;
    procedure WriteReg;
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;AddParametr:TTITaxInvoicesAddVidNaklDelivery);reintroduce;
    property Parameter:TTITaxInvoicesAddVidNaklDelivery read PParameter;
    property Res:Variant read PRes;

  end;

var
  TaxInvoicesEditAddInNaklForm: TTaxInvoicesEditAddInNaklForm;

implementation



{$R *.dfm}
constructor TTaxInvoicesEditAddInNaklForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;AddParametr:TTITaxInvoicesAddVidNaklDelivery);
begin
  inherited Create(AOwner);
  PDb_Handle := Db_Handle;
  TaxInvoicesEditDM     := TTaxInvoicesEditDM.Create(AOwner,Db_Handle);
  PParameter := AddParametr;
end;

procedure TTaxInvoicesEditAddInNaklForm.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  measures:Variant;
begin
  Parameter := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesEditDM.DB.Handle;
  Parameter.Owner := self;
  measures := DoFunctionFromPackage(Parameter,Measures_Const);
  Parameter.Destroy;
  If VarArrayDimCount(measures)>0 then
  begin
    MeasuresButtonEdit.Text  := measures[1];
    PParameter.Id_Measures   := measures[0];
    PParameter.Name_Measures := measures[2];
    if ((MeasuresButtonEdit.Text = 'Грн') or (MeasuresButtonEdit.Text = 'Гривня') )then
    begin
      KolVoTextEdit.Text := 'послуги';
    end
    else
      KolVoTextEdit.Text := '';
  end;

end;

procedure TTaxInvoicesEditAddInNaklForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TTaxInvoicesEditAddInNaklForm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  RangeOfDelivery:Variant;
begin
  Parameter := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesEditDM.DB.Handle;
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

procedure TTaxInvoicesEditAddInNaklForm.ReadReg;
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

procedure TTaxInvoicesEditAddInNaklForm.WriteReg;
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

procedure TTaxInvoicesEditAddInNaklForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteReg;
end;

procedure TTaxInvoicesEditAddInNaklForm.YesButtonClick(Sender: TObject);
begin
  if (DateShipmentLabel.Visible = True) then
  begin
    if (DateShipmentEdit.Text='') then
    begin
      TiShowMessage('Увага!','Заповніть дату відвантаження!',mtWarning,[mbOK]);
      DateShipmentEdit.SetFocus;
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

  if (MeasuresButtonEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть одиницю виміру!',mtWarning,[mbOK]);
   MeasuresButtonEdit.SetFocus;
   Exit;
  end;
  if (KolVoTextEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть кількість!',mtWarning,[mbOK]);
   KolVoTextEdit.SetFocus;
   Exit;
  end;
  if (PriceCurrencyEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть ціну!',mtWarning,[mbOK]);
   PriceCurrencyEdit.SetFocus;
   Exit;
  end;
  if (ValueDelivery20CurrencyEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть суму 20%!',mtWarning,[mbOK]);
   ValueDelivery20CurrencyEdit.SetFocus;
   Exit;
  end;
  if (ValueDeliveryExportCurrencyEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть 0% експорт!',mtWarning,[mbOK]);
   ValueDeliveryExportCurrencyEdit.SetFocus;
   Exit;
  end;
  if (ValueDeliveryCustomsCurrencyEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть 0%(реалізація на митній території)!',mtWarning,[mbOK]);
   ValueDeliveryCustomsCurrencyEdit.SetFocus;
   Exit;
  end;
  if (ValueDeliveryVATexemptionsCurrencyEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть звільнення від ПДВ!',mtWarning,[mbOK]);
   ValueDeliveryVATexemptionsCurrencyEdit.SetFocus;
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

procedure TTaxInvoicesEditAddInNaklForm.ValueDelivery20CurrencyEditExit(
  Sender: TObject);
begin
  //summa := (StrToFloat(PriceCurrencyEdit.EditValue))*(StrToFloat(KolVoCurrencyEdit.EditValue));
  //ValueDelivery20CurrencyEdit.Text := FloatToStr(summa);
end;

procedure TTaxInvoicesEditAddInNaklForm.DateShipmentEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then RangeOfDeliveryButtonEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddInNaklForm.RangeOfDeliveryButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then MeasuresButtonEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddInNaklForm.MeasuresButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then KolVoTextEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddInNaklForm.KolVoTextEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then PriceCurrencyEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddInNaklForm.PriceCurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then ValueDelivery20CurrencyEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddInNaklForm.ValueDelivery20CurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then ValueDeliveryExportCurrencyEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddInNaklForm.ValueDeliveryExportCurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then ValueDeliveryCustomsCurrencyEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddInNaklForm.ValueDeliveryVATexemptionsCurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then YesButton.SetFocus;
end;

procedure TTaxInvoicesEditAddInNaklForm.FormActivate(Sender: TObject);
begin
  DateShipmentEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddInNaklForm.ValueDeliveryCustomsCurrencyEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then ValueDeliveryVATexemptionsCurrencyEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddInNaklForm.KodTovarButtonEditClick(
  Sender: TObject);
begin
  KodTovarCheckBox.Checked := KodTovarButtonEdit.Enabled;
end;


procedure TTaxInvoicesEditAddInNaklForm.KodTovarButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  KodTovar:Variant;
begin
  Parameter := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesEditDM.DB.Handle;
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

procedure TTaxInvoicesEditAddInNaklForm.KodTovarCheckBoxClick(
  Sender: TObject);
begin
  if KodTovarCheckBox.Checked = True then
    KodTovarButtonEdit.Enabled := True
  else
    KodTovarButtonEdit.Enabled := False;
end;

procedure TTaxInvoicesEditAddInNaklForm.ZaCheckBoxClick(Sender: TObject);
begin
  MonthList.Enabled := ZaCheckBox.Checked;
  YearSpinEdit.Enabled := ZaCheckBox.Checked;
end;

end.
