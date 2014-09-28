unit TITaxInvoices_SetPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxGroupBox, ExtCtrls,
  cxLookAndFeelPainters, cxButtons, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxContainer, cxEdit, cxLabel, cxDBLabel,Ibase,
  TICommonLoader,
  TiCommonTypes;

type
  TTITaxInvoicesSetPrintForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label6: TLabel;
    cxGroupBox2: TcxGroupBox;
    Label7: TLabel;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    GroupBox6: TGroupBox;
    Label9: TLabel;
    GroupBox7: TGroupBox;
    Label11: TLabel;
    GroupBox8: TGroupBox;
    Label12: TLabel;
    GroupBox9: TGroupBox;
    IS_ISSUED_BUYER_CheckBox: TCheckBox;
    GroupBox10: TGroupBox;
    Is_copy_CheckBox: TCheckBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    IS_ERPN_CheckBox: TCheckBox;
    IS_REMAINS_SELLER_CheckBox: TCheckBox;
    Panel3: TPanel;
    Label13: TLabel;
    PeriodReestrDBLabel: TcxDBLabel;
    Label14: TLabel;
    NumVidNaklDBLabel: TcxDBLabel;
    Label15: TLabel;
    Label16: TLabel;
    SpecialNotes1ButtonEdit: TcxButtonEdit;
    GroupBox13: TGroupBox;
    is_copy_two_ekz_CheckBox: TCheckBox;
    GroupBox14: TGroupBox;
    is_remains_seller_two_ekz_CheckBox: TCheckBox;
    SpecialNotes2ButtonEdit: TcxButtonEdit;
    GroupBox15: TGroupBox;
    is_erpn_two_ekz_CheckBox: TCheckBox;
    GroupBox16: TGroupBox;
    is_issued_buyer_two_ekz_CheckBox: TCheckBox;
    YesButton: TcxButton;
    CancelButton: TcxButton;
    Label4: TLabel;
    Label10: TLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure SpecialNotes1ButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SpecialNotes2ButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure YesButtonClick(Sender: TObject);
    procedure IS_REMAINS_SELLER_CheckBoxClick(Sender: TObject);
    procedure is_remains_seller_two_ekz_CheckBoxClick(Sender: TObject);
  private
    PDb_Handle : TISC_DB_HANDLE;
    PParameter : TTITaxInvoicesInfo;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;id_vid_nakl_doc:Integer);reintroduce;
    property Parameter:TTITaxInvoicesInfo read PParameter;
  end;

var
  TITaxInvoicesSetPrintForm: TTITaxInvoicesSetPrintForm;

implementation

uses TITaxInvoicesDM;
{$R *.dfm}
constructor TTITaxInvoicesSetPrintForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;id_vid_nakl_doc:Integer);
begin
  inherited Create(AOwner);
  PDb_Handle := Db_Handle;
  TaxInvoicesDM.SetPrintDSet.Close;
  TaxInvoicesDM.SetPrintDSet.SelectSQL.Text := 'select * from TI_SP_VID_NAKL_DOC_SEL(:id)';
  TaxInvoicesDM.SetPrintDSet.ParamByName('id').Value := id_vid_nakl_doc;
  TaxInvoicesDM.SetPrintDSet.Open;
  //*******************первый екземпл€р***********************************//
  if (TaxInvoicesDM.SetPrintDSet['IS_ISSUED_BUYER'] = 1) then
    begin
      IS_ISSUED_BUYER_CheckBox.Checked := True;
      PParameter.IS_ISSUED_BUYER := 1;
    end
  else
    begin
      IS_ISSUED_BUYER_CheckBox.Checked := False;
      PParameter.IS_ISSUED_BUYER := 0;
    end;

  if (TaxInvoicesDM.SetPrintDSet['IS_ERPN'] = 1) then
    begin
      IS_ERPN_CheckBox.Checked := True;
      PParameter.IS_ERPN := 1;
    end
  else
    begin
      IS_ERPN_CheckBox.Checked := False;
      PParameter.IS_ERPN := 0;
    end;

  if (TaxInvoicesDM.SetPrintDSet['IS_REMAINS_SELLER'] = 1) then
    begin
      IS_REMAINS_SELLER_CheckBox.Checked := True;
      SpecialNotes1ButtonEdit.Enabled    := True;
      PParameter.IS_REMAINS_SELLER       := 1;
    end
  else
    begin
      IS_REMAINS_SELLER_CheckBox.Checked := False;
      SpecialNotes1ButtonEdit.Enabled    := False;
      SpecialNotes1ButtonEdit.Text       := '';
      PParameter.IS_REMAINS_SELLER       := 0;
    end;

  if (TaxInvoicesDM.SetPrintDSet['IS_COPY'] = 1) then
    begin
      IS_COPY_CheckBox.Checked := True;
      PParameter.IS_COPY := 1;
    end
  else
    begin
      IS_COPY_CheckBox.Checked := False;
      PParameter.IS_COPY := 0;
    end;

  if (TaxInvoicesDM.SetPrintDSet['ID_SPECIALNOTES'] = 0) then
    begin
      SpecialNotes1ButtonEdit.Text := '';
      PParameter.id_SpecialNotes   := 0;
      PParameter.Name_SpecialNotes := '';
      PParameter.Num_SpecialNotes  := '';
    end
  else
    begin
      SpecialNotes1ButtonEdit.Text := TaxInvoicesDM.SetPrintDSet['NUM_SPECIALNOTES'];
      PParameter.id_SpecialNotes   := TaxInvoicesDM.SetPrintDSet['ID_SPECIALNOTES'];
      PParameter.Name_SpecialNotes := TaxInvoicesDM.SetPrintDSet['NAME_SPECIALNOTES'];
      PParameter.Num_SpecialNotes  := TaxInvoicesDM.SetPrintDSet['NUM_SPECIALNOTES'];
    end;
//*******************второй екземпл€р***********************************//
  if (TaxInvoicesDM.SetPrintDSet['is_issued_buyer_two_ekz'] = 1) then
    begin
      is_issued_buyer_two_ekz_CheckBox.Checked := True;
      PParameter.is_issued_buyer_two_ekz := 1;
    end
  else
    begin
      is_issued_buyer_two_ekz_CheckBox.Checked := False;
      PParameter.is_issued_buyer_two_ekz := 0;
    end;

  if (TaxInvoicesDM.SetPrintDSet['is_erpn_two_ekz'] = 1) then
    begin
      is_erpn_two_ekz_CheckBox.Checked := True;
      PParameter.is_erpn_two_ekz := 1;
    end
  else
    begin
      is_erpn_two_ekz_CheckBox.Checked := False;
      PParameter.is_erpn_two_ekz := 0;
    end;

  if (TaxInvoicesDM.SetPrintDSet['is_remains_seller_two_ekz'] = 1) then
    begin
      is_remains_seller_two_ekz_CheckBox.Checked := True;
      PParameter.is_remains_seller_two_ekz       := 1;
      SpecialNotes2ButtonEdit.Enabled            := True;
    end
  else
    begin
      is_remains_seller_two_ekz_CheckBox.Checked := False;
      PParameter.is_remains_seller_two_ekz       := 0;
      SpecialNotes2ButtonEdit.Enabled            := False;
      SpecialNotes2ButtonEdit.Text               := '';
    end;

  if (TaxInvoicesDM.SetPrintDSet['is_copy_two_ekz'] = 1) then
    begin
      is_copy_two_ekz_CheckBox.Checked := True;
      PParameter.is_copy_two_ekz := 1;
    end
  else
    begin
      is_copy_two_ekz_CheckBox.Checked := False;
      PParameter.is_copy_two_ekz := 0;
    end;

  if (TaxInvoicesDM.SetPrintDSet['id_specialnotes_two_ekz'] = 0) then
    begin
      SpecialNotes2ButtonEdit.Text := '';
      PParameter.id_SpecialNotes_two_ekz   := 0;
      PParameter.Name_SpecialNotes_two_ekz := '';
      PParameter.Num_SpecialNotes_two_ekz  := '';
    end
  else
    begin
      SpecialNotes2ButtonEdit.Text := TaxInvoicesDM.SetPrintDSet['num_specialnotes_two_ekz'];
      PParameter.id_SpecialNotes_two_ekz   := TaxInvoicesDM.SetPrintDSet['id_specialnotes_two_ekz'];
      PParameter.Name_SpecialNotes_two_ekz := TaxInvoicesDM.SetPrintDSet['name_specialnotes_two_ekz'];
      PParameter.Num_SpecialNotes_two_ekz  := TaxInvoicesDM.SetPrintDSet['num_specialnotes_two_ekz'];
    end;
end;
procedure TTITaxInvoicesSetPrintForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TTITaxInvoicesSetPrintForm.SpecialNotes1ButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  notes:Variant;
begin
  Parameter           := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesDM.DB.Handle;
  Parameter.Owner     := self;
  notes               := DoFunctionFromPackage(Parameter,SpecialNotes_Const);
  Parameter.Destroy;
  If VarArrayDimCount(notes)>0 then
  begin
    PParameter.id_SpecialNotes   := notes[0];
    SpecialNotes1ButtonEdit.Text := notes[2];
    PParameter.Name_SpecialNotes := notes[1];
    PParameter.Num_SpecialNotes_two_ekz := notes[2];
  end;
end;

procedure TTITaxInvoicesSetPrintForm.SpecialNotes2ButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  notes:Variant;
begin
  Parameter           := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesDM.DB.Handle;
  Parameter.Owner     := self;
  notes               := DoFunctionFromPackage(Parameter,SpecialNotes_Const);
  Parameter.Destroy;
  If VarArrayDimCount(notes)>0 then
  begin
    PParameter.id_SpecialNotes_two_ekz   := notes[0];
    SpecialNotes2ButtonEdit.Text         := notes[2];
    PParameter.Name_SpecialNotes_two_ekz := notes[1];
    PParameter.Num_SpecialNotes_two_ekz  := notes[2];
  end;
end;

procedure TTITaxInvoicesSetPrintForm.YesButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TTITaxInvoicesSetPrintForm.IS_REMAINS_SELLER_CheckBoxClick(
  Sender: TObject);
begin
  SpecialNotes1ButtonEdit.Enabled := IS_REMAINS_SELLER_CheckBox.Checked;
end;

procedure TTITaxInvoicesSetPrintForm.is_remains_seller_two_ekz_CheckBoxClick(
  Sender: TObject);
begin
  SpecialNotes2ButtonEdit.Enabled := is_remains_seller_two_ekz_CheckBox.Checked;
end;

end.
