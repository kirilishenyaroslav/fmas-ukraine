unit uMoneReportAccepted;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,AArray, FIBDatabase, pFIBDatabase,IB_Externals, frxClass,
  frxDesgn, frxExportRTF, frxExportXML, frxExportHTML, frxExportPDF,
  frxExportImage, DB, FIBDataSet, pFIBDataSet,uMonuLoader, frxDBSet,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, ImgList, FIBQuery, pFIBQuery, pFIBStoredProc, ActnList,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxDBEdit, cxButtonEdit,LoaderUnit, cxLabel,
  cxCalendar, ComCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ExtCtrls, Menus, frxPreview, dxBar, dxBarExtItems, cxRadioGroup, Buttons,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Grids, DBGrids,
  cxDBExtLookupComboBox, cxSpinEdit, frxChBox, frxExportXLS;

type
  TfrmMonuReportAccepted = class(TForm)
    Panel1: TPanel;
    cxLabel3: TcxLabel;
    cxButtonPrint: TcxButton;
    cxButtonClose: TcxButton;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    frxDesigner1: TfrxDesigner;
    frxDBDataset: TfrxDBDataset;
    ActionList1: TActionList;
    ActionDesReport: TAction;
    StoredProc: TpFIBStoredProc;
    LargeImages: TImageList;
    pFIBDataSetData: TpFIBDataSet;
    frxPreview1: TfrxPreview;
    dxBarManager1: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarDateCombo1: TdxBarDateCombo;
    dxBarDateCombo2: TdxBarDateCombo;
    dxBarEdit1: TdxBarEdit;
    dxBarContainerItem1: TdxBarContainerItem;
    dxBarButton3: TdxBarButton;
    dxBarEdit2: TdxBarEdit;
    dxBarButton4: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    dxBarStatic2: TdxBarStatic;
    dxBarStatic3: TdxBarStatic;
    dxBarStatic4: TdxBarStatic;
    dxBarEdit3: TdxBarEdit;
    dxBarButton5: TdxBarButton;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    cbMonth: TcxComboBox;
    seYear: TcxSpinEdit;
    lbMonth: TcxLabel;
    rbMonth: TcxRadioButton;
    rbKvartal: TcxRadioButton;
    cbKvartal: TcxComboBox;
    lbKvartal: TcxLabel;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    SpeedButton4: TSpeedButton;
    frxXLSExport1: TfrxXLSExport;
    dxBarLargeButton1: TdxBarLargeButton;
    frxReport: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonPrintClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbMonthClick(Sender: TObject);
    procedure frxReportGetValue(const VarName: String; var Value: Variant);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    input            : TAArray;
    output           : TAArray;

  end;

  function Load(input, res : TAArray) : boolean;

  exports
   Load;

var
  frmMonuReportAccepted: TfrmMonuReportAccepted;

implementation

uses DateUtils;

{$R *.dfm}
function Load(input, res : TAArray) : boolean;
var
 frm : TfrmMonuReportAccepted;
begin
  Result              := true;
  frm                 := TfrmMonuReportAccepted.Create(TComponent(input['Owner'].asObject));
  frm.input           := TAArray.Create;
  input.CopyTo(frm.input);
  frm.output          := res;
  frm.FormStyle       := frm.input['FormStyle'].AsVariant;
  frm.Database.Handle := pvoid(frm.input['DBHandle'].asInteger);

  if frm.FormStyle = fsNormal then
  begin
    frm.output['MoadResult'].AsVariant := frm.ShowModal;
    frm.Free;
  end
  else
  begin

  end;
end;

function GetKvartal(const date_in: TDate): integer;
begin
  Result := -1;
  if (date_in >= EncodeDate(YearOf(date_in), 1, 1)) and (date_in <= EncodeDate(YearOf(date_in), 3, 31)) then Result := 1;
  if (date_in >= EncodeDate(YearOf(date_in), 4, 1)) and (date_in <= EncodeDate(YearOf(date_in), 6, 30)) then Result := 2;
  if (date_in >= EncodeDate(YearOf(date_in), 7, 1)) and (date_in <= EncodeDate(YearOf(date_in), 9, 30)) then Result := 3;
  if (date_in >= EncodeDate(YearOf(date_in), 10, 1)) and (date_in <= EncodeDate(YearOf(date_in), 12, 31)) then Result := 4;
end;

procedure TfrmMonuReportAccepted.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmMonuReportAccepted.cxButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMonuReportAccepted.cxButtonPrintClick(Sender: TObject);
begin
  pFIBDataSetData.Close;

  pFIBDataSetData.Prepare;
  if rbKvartal.Checked then pFIBDataSetData.ParamByName('IS_KV').AsInteger := 1
                       else pFIBDataSetData.ParamByName('IS_KV').AsInteger := 0;
  pFIBDataSetData.ParamByName('IN_MONTH').AsInteger := cbMonth.ItemIndex + 1;
  pFIBDataSetData.ParamByName('IN_YEAR').AsInteger := seYear.Value;
  pFIBDataSetData.ParamByName('KV_NUM').AsInteger := cbKvartal.ItemIndex + 1;

  pFIBDataSetData.Active := True;
  pFIBDataSetData.FetchAll;

  if pFIBDataSetData.RecordCount = 0 then
  begin
    pFIBDataSetData.Close;
    ShowMessage(mon_strings['MsgNotData'].asString);
    exit;
  end;

  frxReport.ShowReport;
end;

procedure TfrmMonuReportAccepted.SpeedButton3Click(Sender: TObject);
begin
  frxReport.Print;
end;

procedure TfrmMonuReportAccepted.FormCreate(Sender: TObject);
var
  i : integer;
  d : TDate;
  k : integer;
begin
  for i := 1 to 12 do cbMonth.Properties.Items.Add(FormatDateTime('mmmm', EncodeDate(2007, i, 1)));
 { d := now;
  d := IncMonth(d, -1);
  cbMonth.ItemIndex := MonthOf(d) - 1;
  seYear.Properties.MaxValue := YearOf(date);
  seYear.Value := YearOf(d);

  k := GetKvartal(date);
  k := k - 1;
  if k = 0 then k := 4;
  cbKvartal.ItemIndex := k - 1;    }
  rbMonthClick(Self);
end;

procedure TfrmMonuReportAccepted.rbMonthClick(Sender: TObject);
var
  d : TDate;
  k : integer;
begin
  if rbMonth.Checked then
  begin
    d := now;
    d := IncMonth(d, -1);
    cbMonth.ItemIndex := MonthOf(d) - 1;
    seYear.Properties.MaxValue := YearOf(date);
    seYear.Value := YearOf(d);
    cbKvartal.Visible := false;
    lbKvartal.Visible := false;
    cbMonth.Visible   := true;
    lbMonth.Visible   := true;
  end;
  if rbKvartal.Checked then
  begin
    seYear.Value := YearOf(date);
    k := GetKvartal(date);
    k := k - 1;
    if k = 0 then
    begin
      k := 4;
      seYear.Value := seYear.Value - 1;
    end;
    cbKvartal.ItemIndex := k - 1;

    cbKvartal.Left    := cbMonth.Left;
    lbKvartal.Left    := lbMonth.Left;
    cbMonth.Visible   := false;
    lbMonth.Visible   := false;
    cbKvartal.Visible := true;
    lbKvartal.Visible := true;
  end;
end;

procedure TfrmMonuReportAccepted.frxReportGetValue(const VarName: String;
  var Value: Variant);
begin
  if VarName = 'PERIOD' then
  begin
    if rbKvartal.Checked then Value := cbKvartal.Text + ' квартал ' + IntToStr(seYear.Value) + 'р.'
                         else Value := cbMonth.Text + ' м≥с€ць ' + IntToStr(seYear.Value) + 'р.';
  end;
  if VarName = 'FORMAT' then
  begin
    if rbKvartal.Checked then Value := 'dbf'
                         else Value := 'xls';
  end;
end;

procedure TfrmMonuReportAccepted.SpeedButton4Click(Sender: TObject);
begin
 frxReport.Export(frxXLSExport1);
end;

end.

