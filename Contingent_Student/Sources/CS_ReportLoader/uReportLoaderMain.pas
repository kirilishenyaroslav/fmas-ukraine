unit uReportLoaderMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, ImgList, dxBar, dxBarExtItems,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, uCs_Types,
  ibase,AccMgmt, uCs_loader;

type
  TfmReportLoaderMain = class(TForm)
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    ShowrReport: TdxBarLargeButton;
    DisabledLargeImages: TImageList;
    PopupImageList: TImageList;
    LargeImages: TImageList;
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
    GridDBViewDBColumn1: TcxGridDBColumn;
    GridDBViewDBColumn2: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure ShowrReportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure ShowReport();
  public
       constructor  Create(AParameter:TcsParamPacks);reintroduce;
  end;

{var
  fmReportLoaderMain: TfmReportLoaderMain;  }

implementation

uses DM_ReportLoader;

{$R *.dfm}

constructor  TfmReportLoaderMain.Create(AParameter:TcsParamPacks);
begin
  Screen.Cursor := crHourGlass;

  inherited Create(AParameter.Owner);

  DM := TDM.Create(Self);
  DM.DB.Handle:=AParameter.DB_Handle;
  DM.DB.Connected := True;

  DM.LoaderDataSet.Close;
  DM.LoaderDataSet.SQLs.SelectSQL.Clear;
  DM.LoaderDataSet.SQLs.SelectSQL.Text:='select distinct * from CS_DT_REPORT_SP_REPORT order by name_group,name_report ';
  DM.LoaderDataSet.Open;

  GridDBView.DataController.DataSource := DM.DataSource;

  Screen.Cursor:=crDefault;
end;

procedure TfmReportLoaderMain.ShowReport();
var
    Check:Integer;
    Path:string;
    AParameter: TcsParamPacks;
begin
  { Path:='/ROOT/UP_MAIN_MENU/UP_REPORTS/GROUP_'+IntToStr(DataModule.LoaderDataSet.FieldByName('GROUP_NUMBER').AsInteger)+'/UP_REP_'+IntToStr(DataModule.LoaderDataSet.FieldByName('ID_SP_REPORT').AsInteger);
   Check := fibCheckPermission(path, 'View');
   if check<>0 then
   begin
      MessageDlg('Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk], 0);
      exit;
   end; }

   if not VarIsNull(DM.LoaderDataSet['NAME_BPL']) then
   begin
    AParameter                 := TcsParamPacks.Create;
    AParameter.Owner           := self;
    AParameter.Db_Handle       := DM.DB.Handle;
    AParameter.Formstyle       := fsNormal;
    AParameter.ID_Locate       :=  DM.LoaderDataSet.FieldByName('ID_SP_REPORT').AsVariant;
    DoFunctionFromPackage(AParameter, ['Contingent_Student\'+DM.LoaderDataSet['NAME_BPL']+'.bpl', 'CreateSprav']);
    AParameter.Free;
   end;
end;

procedure TfmReportLoaderMain.ExitButtonClick(Sender: TObject);
begin
   close;
end;

procedure TfmReportLoaderMain.ShowrReportClick(Sender: TObject);
begin
    ShowReport;
end;

procedure TfmReportLoaderMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then action:=caFree
end;

end.
