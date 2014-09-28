unit TITaxinvoices_AddReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxTextEdit, StdCtrls, cxButtons,
  cxButtonEdit, cxDropDownEdit, cxCalendar, cxSpinEdit, cxContainer,
  cxEdit, cxMaskEdit, cxControls, cxGroupBox, Ibase,TICommonLoader,Registry,
  cxCheckBox,TiMessages,TiCommonProc,TICommonDates, Spin;

type
  TTaxInvoicesAddReestrForm = class(TForm)
    DataReestrGroupBox: TcxGroupBox;
    TipReestrGroupBox: TcxGroupBox;
    DateBegEdit: TcxDateEdit;
    DateEndEdit: TcxDateEdit;
    TypeReestrButtonEdit: TcxButtonEdit;
    OtherInfoReestrGroupBox: TcxGroupBox;
    YesButton: TcxButton;
    CancelButton: TcxButton;
    SaveTextEdit: TcxTextEdit;
    SpecModeTextEdit: TcxTextEdit;
    PeriodLabel: TcxLabel;
    DataBegLabel: TcxLabel;
    DataEndLabel: TcxLabel;
    SaveLabel: TcxLabel;
    SpecModeLabel: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    NumReestrLabel: TcxLabel;
    NumReestrTextEdit: TcxTextEdit;
    MonthList: TComboBox;
    YearSpinEdit: TSpinEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure TipReestrButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure YesButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MonthList1Editing(Sender: TObject; var CanEdit: Boolean);
    procedure YearSpinEdit1Editing(Sender: TObject; var CanEdit: Boolean);
    procedure MonthList1Exit(Sender: TObject);
    procedure MonthListChange(Sender: TObject);
    procedure YearSpinEditChange(Sender: TObject);
    procedure NumReestrTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure MonthListKeyPress(Sender: TObject; var Key: Char);
    procedure DateBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateEndEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure TypeReestrButtonEditKeyPress(Sender: TObject; var Key: Char);
    procedure SaveTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure SpecModeTextEditKeyPress(Sender: TObject; var Key: Char);
  private
    PRes           : Variant;
    PDb_Handle     : TISC_DB_HANDLE;
  public
    Kod_Setup:Integer;
    id_type_Reestr:Integer;
    name_type_reestr : string;
    procedure ReadReg;
    procedure WriteReg;
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
    property Res:Variant read PRes;
  end;

var
  TaxInvoicesAddReestrForm: TTaxInvoicesAddReestrForm;

implementation

uses TITaxInvoicesDM;

{$R *.dfm}

constructor TTaxInvoicesAddReestrForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  PDb_Handle        := Db_Handle;  
end;

procedure TTaxInvoicesAddReestrForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TTaxInvoicesAddReestrForm.TipReestrButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  TypeReestr:Variant;
begin
  Parameter           := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesDM.DB.Handle;
  Parameter.Owner     := self;
  TypeReestr          := DoFunctionFromPackage(Parameter,TypeReestr_Const);
  Parameter.Destroy;
  If VarArrayDimCount(TypeReestr)>0 then
  begin
    id_type_Reestr := TypeReestr[0];
    TypeReestrButtonEdit.Text := TypeReestr[1];
    name_type_reestr := TypeReestr[1];
  end;
end;

procedure TTaxInvoicesAddReestrForm.YesButtonClick(Sender: TObject);
begin
  if (NumReestrTextEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть номер реєстру!',mtWarning,[mbOK]);
   NumReestrTextEdit.SetFocus;
   Exit;
  end;

  if (MonthList.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть період!',mtWarning,[mbOK]);
   MonthList.SetFocus;
   Exit;
  end;

  if (TypeReestrButtonEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть тип реєстру!',mtWarning,[mbOK]);
   TypeReestrButtonEdit.SetFocus;
   Exit;
  end;

  if (DateBegEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть дату реєстра!',mtWarning,[mbOK]);
   DateBegEdit.SetFocus;
   Exit;
  end;

  if (DateEndEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть дату реєстра!',mtWarning,[mbOK]);
   DateEndEdit.SetFocus;
   Exit;
  end;
  ModalResult:=mrOk;
end;

procedure TTaxInvoicesAddReestrForm.ReadReg;
var
  reg : TRegistry;
begin
  try
   begin
     reg := TRegistry.Create;
     reg.RootKey := HKEY_CURRENT_USER;
     if reg.OpenKey('\Software\TaxInvoices\ReestrInvocesIns\',False) then
     begin
       TypeReestrButtonEdit.Text := reg.ReadString('name_type_reestr');
       id_type_reestr            := StrToInt(reg.ReadString('id_type_reestr'));
       name_type_reestr          := reg.ReadString('name_type_reestr');
     end
     else
     begin
       TypeReestrButtonEdit.Text     := '';
     end;
   end
  finally
    reg.Free;
  end;
end;

procedure TTaxInvoicesAddReestrForm.WriteReg;
var
  reg : TRegistry;
begin
  reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if (reg.OpenKey('\Software\TaxInvoices\ReestrInvocesIns\',True)) then
   begin
     reg.WriteString('id_type_reestr',IntToStr(id_type_reestr));
     reg.WriteString('name_type_reestr',name_type_reestr);
   end;
  finally
   reg.Free;
  end;
end;

procedure TTaxInvoicesAddReestrForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteReg;
end;

procedure TTaxInvoicesAddReestrForm.MonthList1Editing(Sender: TObject;
  var CanEdit: Boolean);
var
  kod_setup : Integer;
begin
  kod_setup := PeriodToKodSetup(YearSpinEdit.Value,MonthList.ItemIndex+1);
  TaxInvoicesDM.WriteTransaction.StartTransaction;
  TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'Z_CONVERT_KOD_TO_PERIOD';
  TaxInvoicesDM.pFIBStoredProc.ParamByName('kod_setup').Value := kod_setup;
  TaxInvoicesDM.pFIBStoredProc.ExecProc;
  TaxInvoicesDM.WriteTransaction.Commit;
  DateBegEdit.Date := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_BEG').AsDate;
  DateEndEdit.Date := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_END').AsDate;
end;

procedure TTaxInvoicesAddReestrForm.YearSpinEdit1Editing(Sender: TObject;
  var CanEdit: Boolean);
var
  kod_setup : Integer;
begin
  kod_setup := PeriodToKodSetup(YearSpinEdit.Value,MonthList.ItemIndex+1);
  TaxInvoicesDM.WriteTransaction.StartTransaction;
  TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'Z_CONVERT_KOD_TO_PERIOD';
  TaxInvoicesDM.pFIBStoredProc.ParamByName('kod_setup').Value := kod_setup;
  TaxInvoicesDM.pFIBStoredProc.ExecProc;
  TaxInvoicesDM.WriteTransaction.Commit;
  DateBegEdit.Date := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_BEG').AsDate;
  DateEndEdit.Date := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_END').AsDate;
end;

procedure TTaxInvoicesAddReestrForm.MonthList1Exit(Sender: TObject);
var
  kod_setup : Integer;
begin
  kod_setup := PeriodToKodSetup(YearSpinEdit.Value,MonthList.ItemIndex+1);
  TaxInvoicesDM.WriteTransaction.StartTransaction;
  TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'Z_CONVERT_KOD_TO_PERIOD';
  TaxInvoicesDM.pFIBStoredProc.ParamByName('kod_setup').Value := kod_setup;
  TaxInvoicesDM.pFIBStoredProc.ExecProc;
  TaxInvoicesDM.WriteTransaction.Commit;
  DateBegEdit.Date := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_BEG').AsDate;
  DateEndEdit.Date := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_END').AsDate;
end;

procedure TTaxInvoicesAddReestrForm.MonthListChange(Sender: TObject);
var
  kod_setup : Integer;
begin
  kod_setup := PeriodToKodSetup(YearSpinEdit.Value,MonthList.ItemIndex+1);
  TaxInvoicesDM.WriteTransaction.StartTransaction;
  TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'Z_CONVERT_KOD_TO_PERIOD';
  TaxInvoicesDM.pFIBStoredProc.ParamByName('kod_setup').Value := kod_setup;
  TaxInvoicesDM.pFIBStoredProc.ExecProc;
  TaxInvoicesDM.WriteTransaction.Commit;
  DateBegEdit.Date := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_BEG').AsDate;
  DateEndEdit.Date := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_END').AsDate;
end;

procedure TTaxInvoicesAddReestrForm.YearSpinEditChange(Sender: TObject);
var
  kod_setup : Integer;
begin
  kod_setup := PeriodToKodSetup(YearSpinEdit.Value,MonthList.ItemIndex+1);
  TaxInvoicesDM.WriteTransaction.StartTransaction;
  TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'Z_CONVERT_KOD_TO_PERIOD';
  TaxInvoicesDM.pFIBStoredProc.ParamByName('kod_setup').Value := kod_setup;
  TaxInvoicesDM.pFIBStoredProc.ExecProc;
  TaxInvoicesDM.WriteTransaction.Commit;
  DateBegEdit.Date := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_BEG').AsDate;
  DateEndEdit.Date := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_END').AsDate;
end;

procedure TTaxInvoicesAddReestrForm.NumReestrTextEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then MonthList.SetFocus;
end;

procedure TTaxInvoicesAddReestrForm.MonthListKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then DateBegEdit.SetFocus;
end;

procedure TTaxInvoicesAddReestrForm.DateBegEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then DateEndEdit.SetFocus;
end;

procedure TTaxInvoicesAddReestrForm.DateEndEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then YesButton.SetFocus;
end;

procedure TTaxInvoicesAddReestrForm.FormActivate(Sender: TObject);
begin
  NumReestrTextEdit.SetFocus;
end;

procedure TTaxInvoicesAddReestrForm.TypeReestrButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then YesButton.SetFocus;
end;

procedure TTaxInvoicesAddReestrForm.SaveTextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then SpecModeTextEdit.SetFocus;
end;

procedure TTaxInvoicesAddReestrForm.SpecModeTextEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then YesButton.SetFocus;
end;

end.
