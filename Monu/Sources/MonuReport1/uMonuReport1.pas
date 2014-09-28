unit uMonuReport1;

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
  cxDBExtLookupComboBox, cxSpinEdit, cxGroupBox, frxExportXLS;

type
  TfrmMonuReport1 = class(TForm)
    Panel1: TPanel;
    cxLabel2: TcxLabel;
    beProg: TcxButtonEdit;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    frxDesigner1: TfrxDesigner;
    pFIBDataSet: TpFIBDataSet;
    frxDBDataset: TfrxDBDataset;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    ActionList1: TActionList;
    ActionDesReport: TAction;
    StoredProc: TpFIBStoredProc;
    LargeImages: TImageList;
    pFIBDataSetData: TpFIBDataSet;
    pFIBDataSetINFO: TpFIBDataSet;
    pFIBDataSetDefDate: TpFIBDataSet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
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
    eKekv: TcxTextEdit;
    cxLabel1: TcxLabel;
    dsForms: TpFIBDataSet;
    dsrcForms: TDataSource;
    dsKekv: TpFIBDataSet;
    frxDBDatasetKekv: TfrxDBDataset;
    rbMonth: TcxRadioButton;
    rbKvartal: TcxRadioButton;
    seYear: TcxSpinEdit;
    cxLabel3: TcxLabel;
    lbMonth: TcxLabel;
    cbMonth: TcxComboBox;
    cbKvartal: TcxComboBox;
    lbKvartal: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    rbForm2: TcxRadioButton;
    rbForm41: TcxRadioButton;
    rbForm7: TcxRadioButton;
    SpeedButton4: TSpeedButton;
    frxXLSExport1: TfrxXLSExport;
    cxLookupComboBox1: TcxLookupComboBox;
    frxReport: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridDBTableView1DblClick(Sender: TObject);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure beProgPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure frxReportGetValue(const VarName: String; var Value: Variant);
    procedure rbForm2Click(Sender: TObject);
    procedure rbMonthClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure eKekvKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    input            : TAArray;
    output           : TAArray;
    id_form          : int64;
    id_dep           : int64;
    id_program       : int64;
    prg_code         : string;
  end;

  function Load(input, res : TAArray) : boolean;

  exports
   Load;

var
  frmMonuReport1: TfrmMonuReport1;
  Header   : TfrxHeader;
  Memo     : TfrxMemoView;
  CntCol   : Integer;
  CntMemo  : Integer;

implementation

uses DateUtils;

{$R *.dfm}
function Load(input, res : TAArray) : boolean;
var
 frm : TfrmMonuReport1;
begin
  Result              := true;
  frm                 := TfrmMonuReport1.Create(TComponent(input['Owner'].asObject));
  frm.input           := TAArray.Create;
  input.CopyTo(frm.input);
  frm.output          := res;
  frm.FormStyle       := frm.input['FormStyle'].AsVariant;
  frm.Database.Handle := pvoid(frm.input['DBHandle'].asInteger);
  frm.rbForm2Click(frm.rbForm2);

  if frm.FormStyle = fsNormal then
  begin
    frm.output['MoadResult'].AsVariant := frm.ShowModal;
    frm.Free;
  end
  else
  begin

  end;
end;

procedure TfrmMonuReport1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmMonuReport1.GridDBTableView1DblClick(Sender: TObject);
begin
  if pFIBDataSet.RecordCount>0 then
  begin
    id_form := pFIBDataSet.FieldByName('ID_FORM').AsVariant;
  end;
end;

procedure TfrmMonuReport1.cxButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMonuReport1.cxButtonPrintClick(Sender: TObject);
begin
  if eKekv.Text = '' then
  begin
    showMessage('”вед≥ть  ≈ ¬');
    exit;
  end;  
  pFIBDataSetData.Close;
  pFIBDataSetData.SelectSQL.Text := 'select * from MON_REPORT1(:IN_YEAR, :IN_MONTH, :id_form, :KEKV_CODE, :IS_KV, :KV_NUM)';
 // pFIBDataSetData.SelectSQL.Text := 'select * from MON_REPORT1(''01.01.2006'', ''31.12.2007'',10477,''210'')';

  pFIBDataSetData.Prepare;
  pFIBDataSetData.ParamByName('IN_MONTH').AsInteger := cbMonth.ItemIndex + 1;
  pFIBDataSetData.ParamByName('IN_YEAR').AsInteger := seYear.Value;
  pFIBDataSetData.ParamByName('ID_FORM').AsInt64 := TFIBBCDField(dsForms.fieldByName('ID_FORM')).AsInt64;
  pFIBDataSetData.ParamByName('KEKV_CODE').AsString := eKekv.Text;
  if rbKvartal.Checked then pFIBDataSetData.ParamByName('IS_KV').AsInteger := 1
                       else pFIBDataSetData.ParamByName('IS_KV').AsInteger := 0;
  pFIBDataSetData.ParamByName('KV_NUM').AsInteger := cbKvartal.ItemIndex + 1;                       
  pFIBDataSetData.Active := True;
  pFIBDataSetData.FetchAll;

  dsKekv.Close;
  dsKekv.Prepare;
  dsKekv.ParamByName('DATE_END').AsDate := EncodeDate(seYear.Value, cbMonth.ItemIndex + 1, 1); /// TODO for kvartal
  dsKekv.ParamByName('ID_FORM').AsInt64 := TFIBBCDField(dsForms.fieldByName('ID_FORM')).AsInt64;;
  dsKekv.ParamByName('code_kekv').AsString := eKekv.Text;
  dsKekv.Open;

  if pFIBDataSetData.RecordCount = 0 then
    begin
      ShowMessage(mon_strings['MsgNotData'].asString);
      exit;
    end;

  if rbForm2.Checked then  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Monu\report_2.fr3');
  if rbForm41.Checked then  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Monu\report_41.fr3');
  if rbForm7.Checked then  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Monu\report_7.fr3');
  frxReport.ShowReport;

end;

procedure TfrmMonuReport1.FormCreate(Sender: TObject);
var
 d : TDate;
 i : integer;
begin
  for i := 1 to 12 do cbMonth.Properties.Items.Add(FormatDateTime('mmmm', EncodeDate(2007, i, 1)));

  frxPreview1.Zoom := 1.5;
  id_program := 2377;
  prg_code := '1160';

  rbMonthClick(Self);
end;

procedure TfrmMonuReport1.SpeedButton3Click(Sender: TObject);
begin
  frxReport.Print;
end;

procedure TfrmMonuReport1.beProgPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i.LoadFromFile(ExtractFilePath(Application.ExeName) + 'monu\sprav\mon_sp_program.spr', 'Main');
  i['FormStyle'].AsVariant := fsNormal;
  LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivTree.bpl', i, o);
  if o['ModalResult'].AsVariant = mrOk then
  begin
    id_program := o['id_program'].AsInt64;
    beProg.Text := o['name_program'].AsString;
    prg_code := o['code'].AsString;
    if rbForm2.Checked then rbForm2Click(rbForm2);
    if rbForm41.Checked then rbForm2Click(rbForm41);
    if rbForm7.Checked then rbForm2Click(rbForm7);

  end;
  i.Free;
  o.Free;
end;


procedure TfrmMonuReport1.frxReportGetValue(const VarName: String;
  var Value: Variant);
begin
 if VarName = 'prg' then Value := '220' + prg_code + ' ' + beProg.Text;
 if VarName = 'code_line' then Value := eKekv.Text;
 if VarName = 'period' then
 begin
   if rbMonth.Checked then Value := cbMonth.Text + ' м≥с€ць ' + IntToStr(seYear.Value) + ' року.'
                      else Value := cbKvartal.Text + ' квартал ' + IntToStr(seYear.Value) + ' року.';
 end;
end;

procedure TfrmMonuReport1.rbForm2Click(Sender: TObject);
begin
  dsForms.Close;
  dsForms.Prepare;
  dsForms.ParamByName('CODE').AsString := TcxRadioButton(Sender).Caption;
  dsForms.ParamByName('id_program').AsInt64 := id_program;
  dsForms.Open;
  if dsForms.RecordCount <> 0  then  cxLookupComboBox1.Text :=  dsForms['Name_form'];
end;

function GetKvartal(const date_in: TDate): integer;
begin
  Result := -1;
  if (date_in >= EncodeDate(YearOf(date_in), 1, 1)) and (date_in <= EncodeDate(YearOf(date_in), 3, 31)) then Result := 1;
  if (date_in >= EncodeDate(YearOf(date_in), 4, 1)) and (date_in <= EncodeDate(YearOf(date_in), 6, 30)) then Result := 2;
  if (date_in >= EncodeDate(YearOf(date_in), 7, 1)) and (date_in <= EncodeDate(YearOf(date_in), 9, 30)) then Result := 3;
  if (date_in >= EncodeDate(YearOf(date_in), 10, 1)) and (date_in <= EncodeDate(YearOf(date_in), 12, 31)) then Result := 4;
end;


procedure TfrmMonuReport1.rbMonthClick(Sender: TObject);
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

procedure TfrmMonuReport1.SpeedButton4Click(Sender: TObject);
begin
 frxReport.Export(frxXLSExport1);
end;

procedure TfrmMonuReport1.eKekvKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', #8, #46]) then key := #0;
end;

end.

