unit MainLiStROVD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,IBase, FIBDatabase, pFIBDatabase, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, FIBDataSet, pFIBDataSet, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxTextEdit, cxCheckBox, dxBar, ImgList,
  StudcityConst, dxBarExtItems, frxClass, frxDesgn, frxDBSet, ActnList,
  LoadPackegeStudCity, FIBQuery, pFIBQuery, pFIBStoredProc,
  St_ser_function;

type
  TfrmMAinListROVD = class(TForm)
    StatusBar1: TStatusBar;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    cxGridListSubs: TcxGrid;
    cxGridListSubsDBTableView1: TcxGridDBTableView;
    cxGridListSubsLevel1: TcxGridLevel;
    StyleRepository: TcxStyleRepository;
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
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    cxStyleSilver: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    DATE_LIST_ROVD: TcxGridDBColumn;
    NUM_LIST_ROVD: TcxGridDBColumn;
    DATE_PRINT_LIST_ROVD: TcxGridDBColumn;
    pFIBDataSetAllDoc: TpFIBDataSet;
    DataSourceAllDoc: TDataSource;
    IS_PRINT_N35: TcxGridDBColumn;
    dxBarManager1: TdxBarManager;
    LargeImages: TImageList;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButtonRefresh: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    frxDesigner: TfrxDesigner;
    frxReport: TfrxReport;
    pFIBDataSetPrintList: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    ActionList1: TActionList;
    ActionDesigned: TAction;
    pFIBStoredProc: TpFIBStoredProc;
    ID_BUILDS: TcxGridDBColumn;
    name_build: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarButton7Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButtonRefreshClick(Sender: TObject);
    procedure dxBarLargeButton7Click(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure ActionDesignedExecute(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure cxGridListSubsDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure frxReportAfterPrintReport(Sender: TObject);
  private
    constructor Create (Aowner:TComponent;DB:TISC_DB_HANDLE);overload;
    { Private declarations }
  public
    { Public declarations }
  end;
function ListROVD(AOwner:TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
exports ListROVD;
var
  frmMAinListROVD: TfrmMAinListROVD;
  DesignedRep:Integer;
  Lang:Integer;
implementation
uses
  EditList;
{$R *.dfm}
function ListROVD(AOwner:TComponent;DB:TISC_DB_HANDLE):Integer;
var
  List:TfrmMAinListROVD;
begin
    List:=TfrmMAinListROVD.Create(AOwner,DB);
end;


constructor TfrmMAinListROVD.Create (Aowner:TComponent;DB:TISC_DB_HANDLE);
begin
  inherited Create(Aowner);
  Database.Handle:=DB;

  lang:=ST_serLanguageIndex(DB);

  pFIBDataSetAllDoc.Active:=false;
  pFIBDataSetAllDoc.Active:=true;

  DesignedRep:=0;

end;

procedure TfrmMAinListROVD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmMAinListROVD.dxBarButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMAinListROVD.dxBarButton4Click(Sender: TObject);
begin
  pFIBDataSetAllDoc.Active:=false;
  pFIBDataSetAllDoc.Active:=true;
end;

procedure TfrmMAinListROVD.dxBarButton1Click(Sender: TObject);
var
  New:TfrmEditList;
begin
  New:=TfrmEditList.create(Self,0);
  New.ShowModal;
  New.free;
end;

procedure TfrmMAinListROVD.dxBarButton2Click(Sender: TObject);
var
  Edit:TfrmEditList;
begin
if pFIBDataSetAllDoc.FieldByName('ID_BUILDS').AsVariant=0 then
  begin
    showmessage(StudcityConst.st_listROVD_OLD_LIST);
  end
  else
  begin
    Edit:=TfrmEditList.create(Self,pFIBDataSetAllDoc.FieldByName('id_list_rovd').Asvariant);
    Edit.ShowModal;
    Edit.free;
  end;  
end;

procedure TfrmMAinListROVD.dxBarLargeButton1Click(Sender: TObject);
var
  New:TfrmEditList;
begin
  New:=TfrmEditList.create(Self,0);
  New.ShowModal;
  New.free;
  dxBarLargeButtonRefreshClick(self);
end;

procedure TfrmMAinListROVD.dxBarLargeButton2Click(Sender: TObject);
var
  Edit:TfrmEditList;
begin
if pFIBDataSetAllDoc.FieldByName('ID_BUILDS').AsVariant=0 then
  begin
    showmessage(StudcityConst.st_listROVD_OLD_LIST);
  end
  else
  begin
    Edit:=TfrmEditList.create(Self,pFIBDataSetAllDoc.FieldByName('id_list_rovd').Asvariant);
    Edit.ShowModal;
    Edit.free;
    dxBarLargeButtonRefreshClick(self);
  end;
end;

procedure TfrmMAinListROVD.dxBarLargeButtonRefreshClick(Sender: TObject);
begin
  pFIBDataSetAllDoc.Active:=false;
  pFIBDataSetAllDoc.Active:=true;
end;

procedure TfrmMAinListROVD.dxBarLargeButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMAinListROVD.dxBarLargeButton5Click(Sender: TObject);
begin
if pFIBDataSetAllDoc.FieldByName('ID_BUILDS').AsVariant=0 then
  begin
    showmessage(StudcityConst.st_listROVD_OLD_LIST);
  end
  else
  begin
    pFIBDataSetPrintList.Active:=false;
    pFIBDataSetPrintList.ParamByName('param_id_list').AsVariant:=pFIBDataSetAllDoc.FieldByName('ID_LIST_ROVD').AsVariant;
    pFIBDataSetPrintList.Active:=true;
    frxReport.Clear;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PrintListROVD.fr3');
    frxReport.Variables.Clear;
    if DesignedRep=1 then
      begin
        frxReport.DesignReport;
      end;
    frxReport.PrepareReport(true);
    frxReport.ShowReport(true);
  end;  
end;

procedure TfrmMAinListROVD.ActionDesignedExecute(Sender: TObject);
begin
  if DesignedRep=0 then
    begin
      DesignedRep:=1;
    end
    else
    begin
      DesignedRep:=1;
    end;
end;

procedure TfrmMAinListROVD.dxBarLargeButton6Click(Sender: TObject);
begin
if pFIBDataSetAllDoc.FieldByName('ID_BUILDS').AsVariant=0 then
  begin
    showmessage(StudcityConst.st_listROVD_OLD_LIST);
  end
  else
  begin
    LoadPackegeStudCity.LoadViewPrintPropi(self,Database.Handle,pFIBDataSetAllDoc.FieldByName('ID_LIST_ROVD').AsVariant,2,'FormaN35');
    dxBarLargeButtonRefreshClick(self);
  end;
end;

procedure TfrmMAinListROVD.dxBarLargeButton3Click(Sender: TObject);
begin
if pFIBDataSetAllDoc.FieldByName('ID_BUILDS').AsVariant=0 then
  begin
    showmessage('ƒанны список €вл€етьс€ старым и не может быть удаленным!!!');
    Exit;
  end;
if MessageBox(Handle,PChar('¬ы действительно хотите удалить список?'),'ѕодтверждение',MB_YESNO or MB_ICONQUESTION)= mrYes then
  begin
    pFIBStoredProc.Database:=Database;
    pFIBStoredProc.Transaction:=WriteTransaction;
    WriteTransaction.StartTransaction;
    pFIBStoredProc.StoredProcName:='ST_DT_LIST_ROVD_DELETE_LIST';
    pFIBStoredProc.Prepare;
    pFIBStoredProc.ParamByName('ID_LIST').AsInt64:=pFIBDataSetAllDoc.FieldByName('ID_LIST_ROVD').AsVariant;
    try
      pFIBStoredProc.ExecProc;
      except
        begin
          TfrmMAinListROVD(self.owner).WriteTransaction.Rollback;
          Exit;
        end;
     end;
     WriteTransaction.Commit;
     dxBarLargeButtonRefreshClick(self);
  end;
end;

procedure TfrmMAinListROVD.cxGridListSubsDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect:TRect;
  ind:Integer;
begin
  Arect:=AViewInfo.Bounds;
  if AViewInfo.GridRecord.Values[4]=0 then
    begin
      ACanvas.Canvas.Pen.Color:=clBlack;
      ACanvas.Canvas.Font.Style:=[];
      ACanvas.Canvas.FillRect(Arect);
    end
    else
    begin
      ACanvas.Canvas.Pen.Color:=clBlack;
      ACanvas.Canvas.Font.Style:=[fsBold];
      ACanvas.Canvas.FillRect(Arect);
    end;
end;

procedure TfrmMAinListROVD.frxReportAfterPrintReport(Sender: TObject);
begin
    pFIBStoredProc.Database:=Database;
    pFIBStoredProc.Transaction:=WriteTransaction;
    WriteTransaction.StartTransaction;
    pFIBStoredProc.StoredProcName:='ST_DT_LIST_ROVD_PRINT_SAVE';
    pFIBStoredProc.Prepare;
    pFIBStoredProc.ParamByName('ID_LIST').AsInt64:=pFIBDataSetAllDoc.FieldByName('ID_LIST_ROVD').AsVariant;
    pFIBStoredProc.ParamByName('PRINT_FORM').AsInteger:=1;
    try
      pFIBStoredProc.ExecProc;
      except
        begin
          WriteTransaction.Rollback;
          Exit;
        end;
     end;
     WriteTransaction.Commit;
     dxBarLargeButtonRefreshClick(self);
end;

end.
