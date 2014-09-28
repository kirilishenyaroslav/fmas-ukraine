unit cn_Periods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxCalendar, cxCurrencyEdit, cxTextEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxControls,
  cxGridCustomView, cxGrid, cxClasses;

type
  TfrmPeriods = class(TForm)
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
    Grid_pay: TcxGrid;
    Grid_payTableView: TcxGridTableView;
    date_beg: TcxGridColumn;
    date_end: TcxGridColumn;
    date_pay: TcxGridColumn;
    summa: TcxGridColumn;
    id_payer_stage_opl: TcxGridColumn;
    id_man_stage_opl: TcxGridColumn;
    num_year: TcxGridColumn;
    Grid_payLevel: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPeriods: TfrmPeriods;

implementation

{$R *.dfm}

procedure TfrmPeriods.FormCreate(Sender: TObject);
begin
 Grid_payTableView.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 Grid_payTableView.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 Grid_payTableView.Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
 Grid_payTableView.Items[3].DataBinding.ValueTypeClass := TcxFloatValueType;
 Grid_payTableView.Items[4].DataBinding.ValueTypeClass := TcxLargeIntValueType;
 Grid_payTableView.Items[5].DataBinding.ValueTypeClass := TcxLargeIntValueType;
 Grid_payTableView.Items[6].DataBinding.ValueTypeClass := TcxStringValueType;
end;

procedure TfrmPeriods.FormShow(Sender: TObject);
begin
if Grid_payTableView.DataController.RecordCount = 0 then exit;
Grid_payTableView.ViewData.Expand(True);
end;

end.
