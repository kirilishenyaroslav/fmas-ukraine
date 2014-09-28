unit UpReportKSWMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,uCommonSp,DB, FIBDatabase, pFIBDatabase,IBase, ComCtrls,
  cxLookAndFeelPainters, StdCtrls, cxButtons,Gauges,pFIBStoredProc,
  FIBQuery, pFIBQuery, frxDesgn, frxClass, frxDBSet, frxExportXLS,
  FIBDataSet, pFIBDataSet, frxExportHTML, frxExportRTF, ActnList,
  ASUP_LoaderPrintDocs_Messages,ASUP_LoaderPrintDocs_Consts, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxCheckBox, ImgList, cxGridTableView, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxBar, dxBarExtItems;

    type
    TUP_PrintLongAge = class(TSprav)
    public
        constructor Create;
        procedure Show; override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

type
  TfrmUpReportKSWMain = class(TForm)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StatusBar1: TStatusBar;
    StoredProc: TpFIBStoredProc;
    ActionList1: TActionList;
    FilterGrid: TcxGrid;
    View: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
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
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    IL_Orders: TImageList;
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    ViewButton: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarLargeButtonADD: TdxBarLargeButton;
    dxBarLargeButtonEdit: TdxBarLargeButton;
    dxBarLargeButtonDelete: TdxBarLargeButton;
    dxBarLargeButtonRefresh: TdxBarLargeButton;
    dxBarLargeButtonExit: TdxBarLargeButton;
    pFIBDataSetCreate: TpFIBDataSet;
    DataSourceCreate: TDataSource;
    ViewDBColumnDateBeg: TcxGridDBColumn;
    ViewDBColumnDateEnd: TcxGridDBColumn;
    ViewDBColumnConvert: TcxGridDBColumn;
    ActionEdit: TAction;
    ActionRefresh: TAction;
  Constructor Create(aOwner : TComponent;HandleDb:Integer);
    procedure dxBarLargeButtonExitClick(Sender: TObject);
    procedure ActionEditExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmUpReportKSWMain: TfrmUpReportKSWMain;
  id_sp_report,id_session:Int64;
  IsDesign:Boolean;
  PFontNames:string;
  PFontSizes:integer;
  PFontColors:TColor;
  PFontStyles:TFontStyles;


implementation
uses
  UpReportKSWEdit;
{$R *.dfm}


function CreateSprav: TSprav;stdcall;
begin
    Result := TUP_PrintLongAge.Create;
end;

constructor TUP_PrintLongAge.Create;
begin
  inherited Create;
  Input.FieldDefs.Add('id_session', ftVariant);
  Input.FieldDefs.Add('id_sp_report', ftVariant);
  Input.FieldDefs.Add('DesignReport', ftBoolean);
  PrepareMemoryDatasets;

  PFontNames:='Times New Roman';
  PFontSizes:=-255;
  PFontColors:=clDefault;
end;

procedure TUP_PrintLongAge.Show;
var
    hnd: Integer;
    Print: TfrmUpReportKSWMain;
begin
  hnd := Input['DBHandle'];
  id_sp_report := Input['id_sp_report'];
  IsDesign := Input['DesignReport'];
  Print:=TfrmUpReportKSWMain.Create(Application.MainForm,hnd);
  Print.ShowModal;
  Print.Free;
end;

constructor TfrmUpReportKSWMain.Create(aOwner : TComponent;HandleDb:Integer);
begin
  inherited Create(aOwner);
  DB.Handle := TISC_DB_Handle(HandleDb);

  pFIBDataSetCreate.Active:=false;
  pFIBDataSetCreate.Active:=true;

  //получаем идентификатор транзакции
{  WriteTransaction.StartTransaction;
  StoredProc.StoredProcName:='UP_DT_REPORT_SESSION';
  StoredProc.Prepare;
  try
    StoredProc.ExecProc;
  except
    begin
      WriteTransaction.Rollback;
      Exit;
    end;
   end;
 ID_SESSION:= StoredProc.FieldByName('OUT_ID_REPORT_SESSION').AsVariant;
 WriteTransaction.Commit;    }

end;

procedure TfrmUpReportKSWMain.dxBarLargeButtonExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmUpReportKSWMain.ActionEditExecute(Sender: TObject);
var
  Edit:TfrmReportKSWEdit;
begin
  Edit:=TfrmReportKSWEdit.Create(self);
  Edit.ShowModal;
  Edit.free;
  pFIBDataSetCreate.Active:=false;
  pFIBDataSetCreate.Active:=true;
end;

procedure TfrmUpReportKSWMain.ActionRefreshExecute(Sender: TObject);
begin
  pFIBDataSetCreate.Active:=false;
  pFIBDataSetCreate.Active:=true;
end;

end.
