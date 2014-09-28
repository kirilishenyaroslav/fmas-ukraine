unit DiscSpec_DistribForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, cxInplaceContainer, cxDBTL,
  cxTLData, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, cxSplitter, ImgList, ActnList, dxBar,
  dxBarExtItems, IBase, DiscSpec_dmCommonStyles, DiscSpec_SpecDiscEdit,
  DiscSpec_DistribEdit, uUO_Resources, frxClass, frxDBSet;

type
  TfDiscSpecDistrib = class(TForm)
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DSourceDistrib: TDataSource;
    DSetDistrib: TpFIBDataSet;
    StoredProcDistrib: TpFIBStoredProc;
    TreeListDistrib: TcxDBTreeList;
    cmnID: TcxDBTreeListColumn;
    cmnID_PARENT: TcxDBTreeListColumn;
    cmnTEXT: TcxDBTreeListColumn;
    cmnPERCENT: TcxDBTreeListColumn;
    PanelDistrib: TPanel;
    PanelMain: TPanel;
    GridSpecDiscDBTableView1: TcxGridDBTableView;
    GridSpecDiscLevel1: TcxGridLevel;
    GridSpecDisc: TcxGrid;
    DSetMain: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    DSourceMain: TDataSource;
    cxSplitter1: TcxSplitter;
    BarManager1: TdxBarManager;
    RefresBtn: TdxBarLargeButton;
    SaveBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    ActionList: TActionList;
    RefreshA: TAction;
    SaveA: TAction;
    ExitA: TAction;
    ImageList: TImageList;
    AddSDBtn: TdxBarLargeButton;
    EditSDBtn: TdxBarLargeButton;
    DelSDBtn: TdxBarLargeButton;
    AddSDA: TAction;
    EditSDA: TAction;
    DelSDA: TAction;
    cmnID_SP_DISC_SPEC: TcxGridDBColumn;
    cmnNAME_SPEC: TcxGridDBColumn;
    cmnNAME_DISC: TcxGridDBColumn;
    dxBarDockControl1: TdxBarDockControl;
    AddKafBtn: TdxBarLargeButton;
    EditBtn: TdxBarLargeButton;
    DelBtn: TdxBarLargeButton;
    AddGroupA: TAction;
    EditA: TAction;
    DelA: TAction;
    AddA: TAction;
    AddBtn: TdxBarLargeButton;
    PrintBtn: TdxBarLargeButton;
    PrintA: TAction;
    ReportDSet1: TfrxDBDataset;
    DSetReport: TpFIBDataSet;
    Report1: TfrxReport;
    procedure RefreshAExecute(Sender: TObject);
    procedure ExitAExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddSDAExecute(Sender: TObject);
    procedure EditSDAExecute(Sender: TObject);
    procedure DelSDAExecute(Sender: TObject);
    procedure AddGroupAExecute(Sender: TObject);
    procedure AddAExecute(Sender: TObject);
    procedure EditAExecute(Sender: TObject);
    procedure DelAExecute(Sender: TObject);
    procedure DSetMainAfterScroll(DataSet: TDataSet);
    procedure PrintAExecute(Sender: TObject);
  private
    { Private declarations }
    pStylesDM:TStylesDM;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE);reintroduce;
  end;

  function View_UO_KafDiscSpec(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
   exports View_UO_KafDiscSpec;

implementation

{$R *.dfm}

const ReportPath='\Reports\UO\RDiscSpec.fr3';

function View_UO_KafDiscSpec(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm:TfDiscSpecDistrib;
begin
  ViewForm:=TfDiscSpecDistrib.Create(AOwner,DB);
  ViewForm.Show;
end;


constructor TfDiscSpecDistrib.Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);

  DB.Handle:=ADB_HANDLE;
  Transaction.Active:=True;

  pStylesDM:=TStylesDM.Create(Self);
  GridSpecDiscDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
  TreeListDistrib.Styles.StyleSheet:=pStylesDM.TreeListStyleSheetDevExpress;

  RefreshAExecute(Self);
end;

procedure TfDiscSpecDistrib.RefreshAExecute(Sender: TObject);
var pIdMain, pIdDistrib:Int64;
begin
  pIdMain:=-1;
  pIdDistrib:=-1;
  DSetDistrib.DisableControls;
  DSetMain.DisableControls;
  if DSetDistrib.Active then
    begin
      if not DSetDistrib.IsEmpty then
        pIdDistrib:=DSetDistrib['ID_SP_DISC_SPEC_DISTRIB'];
      DSetDistrib.Close;
    end;
  if DSetMain.Active then
    begin
      if not DSetMain.IsEmpty then
        pIdMain:=DSetMain['ID_SP_DISC_SPEC'];
      DSetMain.Close;
    end;
  DSetDistrib.SQLs.SelectSQL.Text:='SELECT * FROM UO_SP_DISC_SPEC_DISTRIB_S(?ID_SP_DISC_SPEC)';
  DSetMain.SQLs.SelectSQL.Text:='SELECT * FROM UO_SP_DISC_SPEC_S';
  DSetMain.Open;
  DSetDistrib.Open;
  DSetMain.Locate('ID_SP_DISC_SPEC',pIdMain,[]);
  DSetDistrib.Locate('ID_SP_DISC_SPEC_DISTRIB',pIdDistrib,[]);
  DSetMain.EnableControls;
  DSetDistrib.EnableControls;
  TreeListDistrib.FullExpand;
end;

procedure TfDiscSpecDistrib.ExitAExecute(Sender: TObject);
begin
  Close;
end;

procedure TfDiscSpecDistrib.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Transaction.Active:=False;
  Action:=caFree;
end;

procedure TfDiscSpecDistrib.AddSDAExecute(Sender: TObject);
var pId:Int64;
begin
  pId:=AddSpecDisc(Self,DB.Handle);
  if pId=-1 then
    Exit;
  RefreshAExecute(Self);
  DSetMain.Locate('ID_SP_DISC_SPEC',pId,[]);
end;

procedure TfDiscSpecDistrib.EditSDAExecute(Sender: TObject);
begin
  if DSetMain.IsEmpty then Exit;
  EditSpecDisc(Self,DB.Handle,DSetMain['ID_SP_DISC_SPEC']);
  RefreshAExecute(Self);
end;

procedure TfDiscSpecDistrib.DelSDAExecute(Sender: TObject);
begin
  if DSetMain.IsEmpty then Exit;
  DeleteSpecDisc(Self,DB.Handle,DSetMain['ID_SP_DISC_SPEC']);
  RefreshAExecute(Self);
end;

procedure TfDiscSpecDistrib.AddGroupAExecute(Sender: TObject);
begin
  if DSetMain.IsEmpty then Exit;
  ViewDistribEdit(Self,DSetDistrib,uoAdd,True);
  RefreshAExecute(Self);
end;

procedure TfDiscSpecDistrib.AddAExecute(Sender: TObject);
begin
  if DSetDistrib.IsEmpty then Exit;
  if DSetDistrib['ID_SP_TYPE_KAF_DISTRIB']<0 then Exit;
  ViewDistribEdit(Self,DSetDistrib,uoAdd,False);
  RefreshAExecute(Self);
end;

procedure TfDiscSpecDistrib.EditAExecute(Sender: TObject);
var pIsKaf:Boolean;
begin
  if DSetDistrib.IsEmpty then Exit;
  pIsKaf:=(DSetDistrib['ID_SP_TYPE_KAF_DISTRIB']<0);
  ViewDistribEdit(Self,DSetDistrib,uoEdit,pIsKaf);
  RefreshAExecute(Self);
end;

procedure TfDiscSpecDistrib.DelAExecute(Sender: TObject);
var pIsKaf:Boolean;
pId:Int64;
begin
  if DSetDistrib.IsEmpty then Exit;
  pId:=DSetDistrib['ID_PARENT'];
  pIsKaf:=(DSetDistrib['ID_SP_TYPE_KAF_DISTRIB']<0);
  ViewDistribEdit(Self,DSetDistrib,uoDelete,pIsKaf);
  RefreshAExecute(Self);
  DSetDistrib.Locate('ID_SP_DISC_SPEC_DISTRIB',pId,[]);
end;

procedure TfDiscSpecDistrib.DSetMainAfterScroll(DataSet: TDataSet);
begin
  TreeListDistrib.FullExpand;
end;

procedure TfDiscSpecDistrib.PrintAExecute(Sender: TObject);
begin
  Report1.LoadFromFile(ExtractFilePath(Application.ExeName)+ReportPath);
  Report1.ShowReport;
end;

end.
