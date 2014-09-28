unit cn_PayersInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxTextEdit, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxControls, cxGridCustomView,
  cxGrid, cxClasses, cxLookAndFeelPainters, StdCtrls, cxButtons, cnConsts;

type
  TfrmPayeres_Info = class(TForm)
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
    footer: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    SuperStyling_Header: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DexExpress_Style_AE: TcxGridTableViewStyleSheet;
    Grid_payers: TcxGrid;
    TableView: TcxGridTableView;
    payer: TcxGridColumn;
    period: TcxGridColumn;
    persent: TcxGridColumn;
    type_payer: TcxGridColumn;
    id_type_stage: TcxGridColumn;
    isPercent: TcxGridColumn;
    id_payer: TcxGridColumn;
    id_rate_account: TcxGridColumn;
    mfo: TcxGridColumn;
    rate: TcxGridColumn;
    Grid_payersLevel: TcxGridLevel;
    CancelButton: TcxButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TableViewDblClick(Sender: TObject);
  private
    procedure FormIniLanguage;
  public
    PLanguageIndex:byte;
  end;

var
  frmPayeres_Info: TfrmPayeres_Info;

implementation

{$R *.dfm}

procedure TfrmPayeres_Info.FormIniLanguage;
begin
caption := cnConsts.cn_Payers_GroupBox[PLanguageIndex];

CancelButton.Caption:=  cnConsts.cn_Cancel[PLanguageIndex];
payer.Caption:=  cnConsts.cn_Payer_Column[PLanguageIndex];
period.Caption:=  cnConsts.cn_Period_Column[PLanguageIndex];
end;

procedure TfrmPayeres_Info.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmPayeres_Info.FormShow(Sender: TObject);
begin
 FormIniLanguage;

if (TableView.DataController.Values[TableView.DataController.RecordCount - 1, 5] =1)
then
 begin
  TableView.Columns[2].Caption:=  cnConsts.cn_Persent_Column[PLanguageIndex];
 (Persent.Properties as TcxCurrencyEditProperties).DisplayFormat:= '0.0000 %';
 end
else
 begin
   TableView.Columns[2].Caption:=  cnConsts.cn_Summa_Column[PLanguageIndex];
  (Persent.Properties as TcxCurrencyEditProperties).DisplayFormat:= '0.00 грн.';
 end;

 Grid_payers.SetFocus;
 if TableView.DataController.RecordCount > 0 then
    TableView.DataController.FocusedRecordIndex := 0;

end;

procedure TfrmPayeres_Info.FormCreate(Sender: TObject);
begin
 TableView.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 TableView.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 TableView.Items[2].DataBinding.ValueTypeClass := TcxFloatValueType;
 TableView.Items[3].DataBinding.ValueTypeClass := TcxFloatValueType;
 TableView.Items[4].DataBinding.ValueTypeClass := TcxLargeIntValueType;
 TableView.Items[5].DataBinding.ValueTypeClass := TcxIntegerValueType;
 TableView.Items[6].DataBinding.ValueTypeClass := TcxLargeIntValueType;
 TableView.Items[7].DataBinding.ValueTypeClass := TcxLargeIntValueType;
 TableView.Items[8].DataBinding.ValueTypeClass := TcxStringValueType;
 TableView.Items[9].DataBinding.ValueTypeClass := TcxStringValueType;
end;

procedure TfrmPayeres_Info.TableViewDblClick(Sender: TObject);
begin
 TableView.OptionsSelection.CellSelect := True;
end;

end.
