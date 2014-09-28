unit ReportConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,IBase, FIBDatabase, pFIBDatabase,
  cn_Common_Loader,cnConsts,cn_Common_Funcs,cn_Common_Types,Cn_uReportsConst,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxCheckBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  cxClasses, FIBDataSet, pFIBDataSet, ImgList, dxBar, dxBarExtItems;

type
  TfrmReportConfig = class(TForm)
    StatusBar1: TStatusBar;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    SelectField: TcxGridDBColumn;
    NameField: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    pFIBDataSetSetup: TpFIBDataSet;
    DataSourcePrintSetup: TDataSource;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    DisabledLargeImages: TImageList;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    procedure ExitButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
    { Public declarations }
  end;

function ShowConfigReport(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowConfigReport;
var
  frmReportConfig: TfrmReportConfig;
  res:Variant;
implementation

constructor TfrmReportConfig.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
DB.Handle:=DB_Handle;
Screen.Cursor:=crDefault;

pFIBDataSetSetup.Active:=False;
pFIBDataSetSetup.SQLs.SelectSQL.Text:='select * from CN_INI_REPORT_DEF_SP';
pFIBDataSetSetup.Active:=True;
end;


function ShowConfigReport(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmReportConfig;
begin
 if AParameter.Formstyle = fsMDIChild then
 if IsMDIChildFormShow(TfrmReportConfig) then exit;
 ViewForm := TfrmReportConfig.Create(AParameter.Owner, AParameter.Db_Handle);
 ViewForm.FormStyle:= AParameter.Formstyle;

   case ViewForm.FormStyle of
    fsNormal, fsStayOnTop : ViewForm.ShowModal;
    fsMDIChild	          : ViewForm.Show;
   else begin
    ViewForm.ShowModal;
    ViewForm.free;
   end;
  end;
Result:=res;
end;

{$R *.dfm}

procedure TfrmReportConfig.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmReportConfig.RefreshButtonClick(Sender: TObject);
begin
pFIBDataSetSetup.Active:=False;
pFIBDataSetSetup.Active:=True;
end;

end.
