unit Main_OrderPrintDolgn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxBar, dxBarExtItems,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet,ibase,
  Edit_OrderPrintDolgn, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, ZDPKConsts, ZMessages, Zproc;

type
  TFMain_OrderPrintDolgn = class(TForm)
    GridMain: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    GridMainColOrder: TcxGridDBColumn;
    GridMainColDolgnost: TcxGridDBColumn;
    GridMainColValDolgnost: TcxGridDBColumn;
    BarManager: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton2: TdxBarLargeButton;
    DSourceGridMain: TDataSource;
    DSetGridMain: TpFIBDataSet;
    WriteTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    Styles: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure GridMainDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    LocAOwner:TComponent;
    constructor create(AOwner : TComponent; aDB:TISC_DB_HANDLE);
  public
    { Public declarations }
  end;

var
  FMain_OrderPrintDolgn: TFMain_OrderPrintDolgn;

function View_SpOrderPrintDolgnost(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;stdcall;
exports View_SpOrderPrintDolgnost;

implementation

{$R *.dfm}

function View_SpOrderPrintDolgnost(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;
begin
  if IsMDIChildFormShow(TFMain_OrderPrintDolgn) then Exit;
  FMain_OrderPrintDolgn:= TFMain_OrderPrintDolgn.Create(AOwner, DB_HANDLE);
end;

constructor TFMain_OrderPrintDolgn.create(AOwner : TComponent;aDB:TISC_DB_HANDLE);
begin
  inherited create(AOwner);
  DB.Handle:= ADB;
  LocAOwner:=AOwner;
  DefaultTransaction.StartTransaction;
  DSetGridMain.Close;
  DSetGridMain.SelectSQL.Text:='select * from Z_INI_REPORT_PRINT ORDER BY NAME_REPORT';
  DSetGridMain.Open;
  GridMain.Controller.GoToFirst;
end;

procedure TFMain_OrderPrintDolgn.dxBarLargeButton1Click(Sender: TObject);
var   FEdit: TFEdit;
ParamEdit:TParamEdit;
begin
  if DSetGridMain.IsEmpty then Exit;
  ParamEdit:=TParamEdit.Create;
  ParamEdit.idReport:=DSetGridMain['ID_INI_REPORT_PRINT'];
  ParamEdit.ZnachDolgnost:=VarToStrDef(DSetGridMain['VALUE_DOLGNOST'],'');
  ParamEdit.ZnachNameDolgnost:=VarToStrDef(DSetGridMain['NAME_DOLGNOST'],'');
  ParamEdit.AOwner:=LocAOwner;
  FEdit:= TFEdit.create(ParamEdit);
  if FEdit.ShowModal = mrOk then
  begin
      WriteTransaction.StartTransaction;
      StProc.StoredProcName:='Z_INI_REPORT_PRINT_U';
      StProc.ParamByName('ID_INI_REPORT_PRINT').AsInteger:=ParamEdit.idReport;
      StProc.ParamByName('VALUE_DOLGNOST').AsVariant:=ParamEdit.ZnachDolgnost;
      StProc.ParamByName('NAME_DOLGNOST').AsVariant:=ParamEdit.ZnachNameDolgnost;
      try
        StProc.Prepare;
        StProc.ExecProc;
        WriteTransaction.Commit;
      except
        on E:exception do
        begin
         ZShowMessage(Error_Caption[1], e.Message, mtError, [mbOK]);
         WriteTransaction.Rollback;
        end;
      end;
  end;
  DSetGridMain.RefreshSQL.Text:='select * from Z_INI_REPORT_PRINT '+
  'where ID_INI_REPORT_PRINT='+vartostr(DSetGridMain['ID_INI_REPORT_PRINT'])+
  'ORDER BY NAME_REPORT';
  DSetGridMain.Refresh;
  FEdit.Free;
  ParamEdit.free;
end;

procedure TFMain_OrderPrintDolgn.dxBarLargeButton2Click(Sender: TObject);
begin
  close;
end;

procedure TFMain_OrderPrintDolgn.GridMainDblClick(Sender: TObject);
begin
  dxBarLargeButton1Click(Sender);
end;

procedure TFMain_OrderPrintDolgn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
