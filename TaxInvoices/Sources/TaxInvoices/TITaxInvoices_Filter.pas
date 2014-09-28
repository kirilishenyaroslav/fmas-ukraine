unit TITaxInvoices_Filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxSpinEdit, cxDropDownEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxControls, cxContainer, cxEdit, cxCheckBox,
  StdCtrls, cxButtons, ExtCtrls,TiCommonProc,ibase,TICommonDates,
  cxCurrencyEdit;

type TaxInvocesFilter = record
 is_period:Boolean;
 is_type:Boolean;
 Kod_Setup:Integer;
end;

type
  TTaxInvoicesFilterForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    PeriodReestrCheckBox: TcxCheckBox;
    TypeReestrCheckBox: TcxCheckBox;
    TypeReestrButtonEdit: TcxButtonEdit;
    MonthList: TcxComboBox;
    YearSpinEdit: TcxSpinEdit;
    procedure CancelButtonClick(Sender: TObject);
  private
    PParameter:TaxInvocesFilter;
    PDb_Handle:TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;FParameter:TaxInvocesFilter);reintroduce;
    property Parameter:TaxInvocesFilter read PParameter;
  end;

var
  TaxInvoicesFilterForm: TTaxInvoicesFilterForm;

implementation

{$R *.dfm}
constructor TTaxInvoicesFilterForm.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;FParameter:TaxInvocesFilter);
begin
 inherited Create(AOwner);
 PParameter := FParameter;
 PDb_Handle :=  DB_Handle;
 PeriodReestrCheckBox.Checked    := PParameter.is_period;
 TypeReestrCheckBox.Checked      := PParameter.is_type;
 MonthList.Properties.Items.Text := GetMonthList;
 PParameter.Kod_Setup            := CurrentKodSetup(PDb_Handle);
 YearSpinEdit.Value              := YearMonthFromKodSetup(PParameter.Kod_Setup);
 MonthList.ItemIndex             := YearMonthFromKodSetup(PParameter.Kod_Setup-1,False);
//******************************************************************************
 TaxInvoicesFilterForm.Caption           := GetConst('Filter',tcButton);
 PeriodReestrCheckBox.Properties.Caption := GetConst('PeriodReestr',tcCheckBox);
 TypeReestrCheckBox.Properties.Caption   := GetConst('TipReestr',tcCheckBox);
 TypeReestrButtonEdit.Text               := '';
end;

procedure TTaxInvoicesFilterForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

end.
