unit USprPassOrg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, ExtCtrls, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxBar, dxBarExtItems, cxTextEdit,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDataSet, pFIBDataSet, cxLabel,
  cxContainer;

type
  TfrmPassOrg = class(TForm)
    dxBarManager1: TdxBarManager;
    btnAdd: TdxBarLargeButton;
    btnSetOld: TdxBarLargeButton;
    btnSelect: TdxBarLargeButton;
    btnExit: TdxBarLargeButton;
    PassOrgGridDBView: TcxGridDBTableView;
    PassOrgGridLevel: TcxGridLevel;
    PassOrgGrid: TcxGrid;
    pnlFilter: TPanel;
    ColumnPassPlaceIssue: TcxGridDBColumn;
    PassOrgDSet: TpFIBDataSet;
    StorProc: TpFIBStoredProc;
    PassOrgDS: TDataSource;
    FilterEdit: TcxTextEdit;
    lblFilter: TcxLabel;
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
    ContentError: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    procedure btnExitClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure PassOrgGridDBViewDblClick(Sender: TObject);
    procedure FilterEditPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    PlaceIssue:String;
    procedure PassOrgCloseOpen;
  public
    { Public declarations }
    PassVidan:string;
    constructor Create(AOwner:TComponent; Place:String);reintroduce;
  end;

var
  frmPassOrg: TfrmPassOrg;

implementation

{$R *.dfm}

uses UMainSetNameOrder;

constructor TfrmPassOrg.Create(AOwner:TComponent; Place:String);
begin
   inherited Create(AOwner);
   PlaceIssue:=Place;
   PassOrgCloseOpen;
   //PassOrgDSet.Locate('VIDAN', PlaceIssue, []);
end;

procedure TfrmPassOrg.btnExitClick(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfrmPassOrg.PassOrgCloseOpen;
begin
   if PassOrgDSet.Active then PassOrgDSet.Close;
   PassOrgDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM Z_GET_PASS_VIDAN(NULL) ORDER BY VIDAN COLLATE WIN1251_UA';
   PassOrgDSet.Open;
end;

procedure TfrmPassOrg.btnSelectClick(Sender: TObject);
begin
   if PassOrgDSet.IsEmpty then Exit;
   if not VarIsNull(PassOrgDSet['Vidan']) then PassVidan:=PassOrgDSet['Vidan']
   else PassVidan:='';
   ModalResult:=mrOk;
end;

procedure TfrmPassOrg.PassOrgGridDBViewDblClick(Sender: TObject);
begin
   btnSelectClick(Sender);
end;

procedure TfrmPassOrg.FilterEditPropertiesChange(Sender: TObject);
begin
   if FilterEdit.Text='' then
   begin
      PassOrgGridDBView.DataController.DataSet.Filtered:=False;
   end
   else
   begin
      PassOrgGridDBView.DataController.DataSet.Filtered:=False;
      PassOrgGridDBView.DataController.DataSet.Filter:= 'UPPER('+AnsiUpperCase('VIDAN')+') LIKE '''+'%'+
                                                     AnsiUpperCase(FilterEdit.Text) + '%'' and '+'VIDAN'+' is not null';
      PassOrgGridDBView.DataController.DataSet.Filtered:=True;
   end;
end;

end.
