unit UAccountDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, DB,
  FIBDataSet, pFIBDataSet, ComCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxTextEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ImgList, cxContainer,
  cxCheckBox, ToolWin, cxDBEdit, Grids, DBGrids, FIBQuery, pFIBQuery,
  pFIBStoredProc, ibase, FIBDatabase, pFIBDatabase;

type
  TfrmAccDetail = class(TForm)
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    CalcDataDataSet: TpFIBDataSet;
    CalcDataDataSource: TDataSource;
    ImageList1: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    columnst: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    GridAccData: TcxGrid;
    ViewAccData: TcxGridDBTableView;
    TYPE_CALC: TcxGridDBColumn;
    FIO: TcxGridDBColumn;
    SM: TcxGridDBColumn;
    RZ: TcxGridDBColumn;
    ST: TcxGridDBColumn;
    KEKV: TcxGridDBColumn;
    LevelAccData: TcxGridLevel;
    Panel3: TPanel;
    NACH: TcxGridDBColumn;
    PAY: TcxGridDBColumn;
    ToolBar1: TToolBar;
    FilterButton: TToolButton;
    RefreshButton: TToolButton;
    CloseButton: TToolButton;
    CheckGroupPanel: TcxCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    ProvsGrid: TcxGrid;
    ProvsView: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    ProvsLevel: TcxGridLevel;
    ProvsDataSet: TpFIBDataSet;
    ProvsDataSource: TDataSource;
    Label9: TLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    Label10: TLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    cxStyle4: TcxStyle;
    ToolButton_del: TToolButton;
    WriteTransaction: TpFIBTransaction;
    StorProc: TpFIBStoredProc;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FilterButtonClick(Sender: TObject);
    procedure CheckGroupPanelPropertiesChange(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton_delClick(Sender: TObject);
  private
    { Private declarations }
    Status_acc:Integer;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; db_handle:TISC_DB_HANDLE; sch_status:Integer); reintroduce;
  end;



implementation

uses UMainAccounts;

{$R *.dfm}

procedure TfrmAccDetail.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmAccDetail.FormCreate(Sender: TObject);
begin
     PageControl1.ActivePageIndex:=0;
     CalcDataDataSet.Database:=TfrmAccountMain(Owner).WorkDatabase;
     CalcDataDataSet.Transaction:=TfrmAccountMain(Owner).ReadTransaction;
     CalcDataDataSet.SelectSQL.Text:='SELECT DISTINCT * FROM ST_DT_ACCOUNT_DATA_SELECT('+TfrmAccountMain(Owner).AccDataSet.FieldByName('ID_ACCOUNT').AsString+')';
     CalcDataDataSet.Open;

     ViewAccData.BeginUpdate;
     ViewAccData.ViewData.Expand(true);
     ViewAccData.EndUpdate;


     ProvsDataSet.Database:=TfrmAccountMain(Owner).WorkDatabase;
     ProvsDataSet.Transaction:=TfrmAccountMain(Owner).ReadTransaction;
     ProvsDataSet.SelectSQL.Text:='SELECT * FROM ST_ACCOUNT_PROVS_SELECT('+TfrmAccountMain(Owner).AccDataSet.FieldByName('ID_ACCOUNT').AsString+')';
     ProvsDataSet.Open;
end;

procedure TfrmAccDetail.FilterButtonClick(Sender: TObject);
var I:Integer;
begin
     for i:=0 to ViewAccData.ColumnCount-1 do ViewAccData.Columns[i].Options.Filtering:=FilterButton.Down;
end;

procedure TfrmAccDetail.CheckGroupPanelPropertiesChange(Sender: TObject);
begin
     ViewAccData.OptionsView.GroupByBox:=CheckGroupPanel.Checked;
end;

procedure TfrmAccDetail.CloseButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmAccDetail.RefreshButtonClick(Sender: TObject);
begin
     if (PageControl1.ActivePageIndex=0)
     then begin
               CalcDataDataSet.CloseOpen(true);
               ViewAccData.BeginUpdate;
               ViewAccData.ViewData.Expand(true);
               ViewAccData.EndUpdate;
     end
     else begin
               ProvsDataSet.CloseOpen(true);
     end;
end;

procedure TfrmAccDetail.ToolButton1Click(Sender: TObject);
var I:Integer;
begin
     for i:=0 to ViewAccData.ColumnCount-1 do ProvsView.Columns[i].Options.Filtering:=ToolButton1.Down;
end;

procedure TfrmAccDetail.ToolButton_delClick(Sender: TObject);
begin
 if Status_acc <> 2 then
  begin
   if (CalcDataDataSet.RecordCount>0) then
    begin
     if Application.MessageBox('Ви дійсно бажаете видалити запис?',
                           'Увага!', MB_YESNO + MB_ICONQUESTION) = IDYES then
     begin
      WriteTransaction.StartTransaction;
      StorProc.StoredProcName:='ST_DT_ACCOUNT_DATA_DELETE';
      StorProc.Prepare;
      StorProc.ParamByName('ID_STUD').Value   := CalcDataDataSet.FieldByName('ID_KOD').Value;
      StorProc.ParamByName('TYPE_CALC').Value := CalcDataDataSet.FieldByName('TYPE_CALC').Value;
      StorProc.ParamByName('ID_ACCOUNT').Value:= TfrmAccountMain(Owner).AccDataSet.FieldByName('ID_ACCOUNT').AsVariant;
      StorProc.ExecProc;
      WriteTransaction.Commit;
      RefreshButtonClick(Self);
      StorProc.Free;
     end;
    end;
  end;
end;

constructor TfrmAccDetail.Create(AOwner: TComponent;
  db_handle: TISC_DB_HANDLE; sch_status: Integer);
begin
  inherited Create(AOwner);
  status_acc := sch_status;
  if (status_acc = 2) then ToolButton_del.Enabled := False;
  WorkDatabase.Handle := db_handle;
  ReadTransaction.StartTransaction;
end;

end.
