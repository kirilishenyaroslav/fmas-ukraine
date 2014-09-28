unit uReportFactShtat2ReturnData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, iBase, ActnList, ImgList, dxBar,
  FIBDataSet, pFIBDataSet, dxBarExtItems, cxContainer, cxCheckBox,
  cxCurrencyEdit;

type
  TfrmReportFactShtat2ReturnData = class(TForm)
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    ColumnTypePost: TcxGridDBColumn;
    ColumnCategory: TcxGridDBColumn;
    ColumnGroup: TcxGridDBColumn;
    ColumnPostName: TcxGridDBColumn;
    ColumnAddName: TcxGridDBColumn;
    ColumnDigit: TcxGridDBColumn;
    ColumnPercent: TcxGridDBColumn;
    ColumnRateCount: TcxGridDBColumn;
    ColumnKodSmet: TcxGridDBColumn;
    ColumnNameSmet: TcxGridDBColumn;
    ColumnKodProgram: TcxGridDBColumn;
    ColumnNameProgram: TcxGridDBColumn;
    ColumnKodTypeFinance: TcxGridDBColumn;
    ColumnNameTypeFinance: TcxGridDBColumn;
    ColumnSumOklad: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    ColumnSumNadb: TcxGridDBColumn;
    ColumnSumDopl: TcxGridDBColumn;
    dxBarManager1: TdxBarManager;
    dxLargeButtonExport: TdxBarLargeButton;
    ActionList: TActionList;
    Images: TImageList;
    ActionExport: TAction;
    ActionExit: TAction;
    dxBarLargeButtonExit: TdxBarLargeButton;
    Panel1: TPanel;
    cxCheckBoxGroup: TcxCheckBox;
    cxCheckBoxFiltr: TcxCheckBox;
    ColumnRateCountFact: TcxGridDBColumn;
    ColumnRateCountFactQ: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionExportExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure cxCheckBoxFiltrPropertiesChange(Sender: TObject);
    procedure cxCheckBoxGroupPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    FDataSet: TpFIBDataSet;
    constructor Create(AOwner:TComponent;aDataset:TpFIBDataSet);reintroduce;
  end;

var
  frmReportFactShtat2ReturnData: TfrmReportFactShtat2ReturnData;

implementation

{$R *.dfm}
uses uFactShtatReport2Param, UpKernelUnit, uReportExport;

constructor TfrmReportFactShtat2ReturnData.Create(AOwner:TComponent; aDataset:TpFIBDataSet);
begin
    inherited Create(AOwner);
    self.Caption:='Аналіз ШР у розрізі розрядів';
    self.Update;
    FDataSet := aDataset;
//    cxGridDBTableView1.DataController.Summary.FooterSummaryItems.Items[1]. :=
end;

procedure TfrmReportFactShtat2ReturnData.FormCreate(Sender: TObject);
begin
    self.Caption:='Аналіз ШР у розрізі розрядів';
    self.Update;
end;

procedure TfrmReportFactShtat2ReturnData.cxGridDBTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift))
    then begin
        ShowInfo(cxGridDBTableView1.DataController.DataSource.DataSet);
    end;
end;

procedure TfrmReportFactShtat2ReturnData.ActionExportExecute(
  Sender: TObject);
var
    frmExport: TfmExport;

begin
    frmExport := TfmExport.Create(Self, FDataSet);
    frmExport.ShowModal;
    frmExport.Free;
end;

procedure TfrmReportFactShtat2ReturnData.ActionExitExecute(
  Sender: TObject);
begin
    Close;
end;

procedure TfrmReportFactShtat2ReturnData.cxCheckBoxFiltrPropertiesChange(
  Sender: TObject);
var i: Integer;
begin
    for i := 0 to cxGridDBTableView1.ColumnCount - 1 do
    begin
        cxGridDBTableView1.OptionsCustomize.ColumnFiltering := cxCheckBoxFiltr.Checked;
    end;
end;

procedure TfrmReportFactShtat2ReturnData.cxCheckBoxGroupPropertiesChange(
  Sender: TObject);
var i:Integer;
begin
    cxGridDBTableView1.OptionsView.GroupByBox := cxCheckBoxGroup.Checked;
    if not cxCheckBoxGroup.Checked then
    begin
        //снимаем группировку и возвращаем колонки на свои места
        for i:=0 to cxGridDBTableView1.ColumnCount-1 do
        begin
            cxGridDBTableView1.Columns[i].GroupIndex := -1;
            cxGridDBTableView1.Columns[i].Visible := true;
        end;
    end;
    cxGridDBTableView1.ViewData.Expand(true);
end;

end.
