unit GetLgota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, Menus, dxBar, ImgList, ActnList,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDataSet, pFIBDataSet,
  dxStatusBar, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ComCtrls, ToolWin, StdCtrls, cxContainer, cxCheckBox, ExtCtrls;

type
  TfrmGetLgota = class(TForm)
    Panel1: TPanel;
    SokrLabel: TLabel;
    GosCheck: TcxCheckBox;
    MedCheck: TcxCheckBox;
    ShortNameLabel: TEdit;
    ToolBar1: TToolBar;
    SelectButton: TToolButton;
    ExitButton: TToolButton;
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    ReadOnlyDataSet: TpFIBDataSet;
    WriteStoredProc: TpFIBStoredProc;
    ActionList1: TActionList;
    ExitAction: TAction;
    SelectAction: TAction;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    dxBarManager1: TdxBarManager;
    N1: TdxBarButton;
    N2: TdxBarButton;
    DeleteAction1: TdxBarButton;
    RefreshAction1: TdxBarButton;
    N3: TdxBarButton;
    PopupImageList: TImageList;
    procedure ExitActionExecute(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure pFIBDataSet1AfterScroll(DataSet: TDataSet);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function Get():Variant;
    { Public declarations }
  end;

var
  frmGetLgota: TfrmGetLgota;
  Res:Variant;

implementation
uses
  ReportsFilter;  
{$R *.dfm}

procedure TfrmGetLgota.ExitActionExecute(Sender: TObject);
begin
  Close;
end;

function TfrmGetLgota.Get():Variant;
begin
  ShowModal;
  Get:=res;
  free;
end;

procedure TfrmGetLgota.SelectButtonClick(Sender: TObject);
var
  i:Integer;
begin
res:=VarArrayCreate([0,cxGridDBTableView1.DataController.GetSelectedCount-1],varVariant);
for i:=0 to cxGridDBTableView1.DataController.GetSelectedCount-1 do
  begin
    res[i]:=cxGridDBTableView1.Controller.SelectedRecords[i].Values[1];
  end;
close;
end;

procedure TfrmGetLgota.pFIBDataSet1AfterScroll(DataSet: TDataSet);
begin
 if pFIBDataSet1.RecordCount = 0 then exit;
 ShortNameLabel.Text := pFIBDataSet1['SHORT_NAME'];
 GosCheck.Checked := pFIBDataSet1['STATE_LGOT'] = 1;
 MedCheck.Checked := pFIBDataSet1['MEDICAL'] = 1;
end;

procedure TfrmGetLgota.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetLgota.FormCreate(Sender: TObject);
begin
  pFIBDataSet1.Database:=TfrmReportsFilter(self.owner).Database;
  pFIBDataSet1.Transaction:=TfrmReportsFilter(self.owner).ReadTransaction;
  pFIBDataSet1.Active:=true;
end;

end.
