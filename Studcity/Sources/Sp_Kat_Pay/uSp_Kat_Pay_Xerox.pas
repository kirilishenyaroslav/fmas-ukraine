unit uSp_Kat_Pay_Xerox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxCurrencyEdit,
  cxLabel, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxControls, cxGroupBox, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView,
  cxGridDBTableView, cxGrid, st_ConstUnit, st_common_funcs;

type
  Tfrm_Xerox = class(TForm)
    cxGroupBox1: TcxGroupBox;
    xrx_DateBegEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    xrx_SubsSummaEdit: TcxCurrencyEdit;
    xrx_SubsMaxEdit: TcxCurrencyEdit;
    xrx_SummaEdit: TcxCurrencyEdit;
    SummaLabel: TcxLabel;
    cxLabel3: TcxLabel;
    SubsSummaLabel: TcxLabel;
    xrx_OKButton: TcxButton;
    xrx_CancelButton: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1TableView1SubsSumma: TcxGridColumn;
    cxGrid1TableView1PersentSubs: TcxGridColumn;
    cxGrid1TableView1SUMMA: TcxGridColumn;
    cxGrid1TableView1PERCENT: TcxGridColumn;
    cxGrid1TableView1_id_smeta: TcxGridColumn;
    cxGrid1TableView1_id_razdel: TcxGridColumn;
    cxGrid1TableView1_id_stat: TcxGridColumn;
    cxGrid1TableView1_id_kekv: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure xrx_CancelButtonClick(Sender: TObject);
    procedure xrx_OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure xrx_DateBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure xrx_SummaEditKeyPress(Sender: TObject; var Key: Char);
    procedure xrx_SubsMaxEditKeyPress(Sender: TObject; var Key: Char);
    procedure xrx_SubsSummaEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
    { Public declarations }
  end;

var
  frm_Xerox: Tfrm_Xerox;

implementation

{$R *.dfm}

procedure Tfrm_Xerox.FormIniLanguage();
begin
  // индекс языка (1-укр, 2 - рус)
  PLanguageIndex:=              stLanguageIndex;
  Caption:=                    st_ConstUnit.st_CopyCellsFullName[PLanguageIndex];

  //названия кнопок
  xrx_OKButton.Caption :=       st_ConstUnit.st_Accept[PLanguageIndex];
  xrx_CancelButton.Caption :=   st_ConstUnit.st_Cancel[PLanguageIndex];

  cxLabel1.Caption         :=   st_ConstUnit.st_grid_Date_Beg[PLanguageIndex];
  SummaLabel.Caption       :=   st_ConstUnit.st_PaySum_Cat[PLanguageIndex];
  cxLabel3.Caption         :=   st_ConstUnit.st_SubsMax_Cat[PLanguageIndex];
  SubsSummaLabel.Caption   :=   st_ConstUnit.st_SubsSum_Cat[PLanguageIndex];
end;

procedure Tfrm_Xerox.xrx_CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Xerox.xrx_OKButtonClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure Tfrm_Xerox.FormShow(Sender: TObject);
begin
  xrx_DateBegEdit.SetFocus;
end;

procedure Tfrm_Xerox.xrx_DateBegEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then xrx_SummaEdit.SetFocus;
end;

procedure Tfrm_Xerox.xrx_SummaEditKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then xrx_SubsMaxEdit.SetFocus;
end;

procedure Tfrm_Xerox.xrx_SubsMaxEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then xrx_SubsSummaEdit.SetFocus;
end;

procedure Tfrm_Xerox.xrx_SubsSummaEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then xrx_OKButton.SetFocus;
end;

procedure Tfrm_Xerox.FormCreate(Sender: TObject);
begin
  cxGrid1TableView1.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
  cxGrid1TableView1.Items[1].DataBinding.ValueTypeClass := TcxFloatValueType;
  cxGrid1TableView1.Items[2].DataBinding.ValueTypeClass := TcxFloatValueType;
  cxGrid1TableView1.Items[3].DataBinding.ValueTypeClass := TcxFloatValueType;
  cxGrid1TableView1.Items[4].DataBinding.ValueTypeClass := TcxFloatValueType;
  cxGrid1TableView1.Items[5].DataBinding.ValueTypeClass := TcxIntegerValueType;
  cxGrid1TableView1.Items[6].DataBinding.ValueTypeClass := TcxIntegerValueType;
  cxGrid1TableView1.Items[7].DataBinding.ValueTypeClass := TcxIntegerValueType;
  cxGrid1TableView1.Items[8].DataBinding.ValueTypeClass := TcxIntegerValueType;

  FormIniLanguage();
end;

end.
