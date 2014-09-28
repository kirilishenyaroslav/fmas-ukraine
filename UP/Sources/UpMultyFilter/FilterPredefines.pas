unit FilterPredefines;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, Ibase, DB,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, cxClasses,
  ActnList;

type
  TfrmGetFilterPredefine = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DataDataSet: TpFIBDataSet;
    DataSource1: TDataSource;
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
    ItemsGrid: TcxGrid;
    ReportDataView: TcxGridDBTableView;
    ReportDataViewDBColumn1: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_predefine:Integer;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_order_type:Integer);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TfrmGetFilterPredefine.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; id_order_type: Integer);
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;
     DataDataSet.SelectSQL.Text:='select * from UP_DT_KERNELL_FILTER_DEFINE_SEL('+IntToStr(id_order_type)+') order by id_define desc';
     DataDataSet.Open;
     if not DataDataSet.RecordCount>0 then cxButton1.Enabled:=false;
end;

procedure TfrmGetFilterPredefine.cxButton1Click(Sender: TObject);
begin
     if (DataDataSet.RecordCount>0)
     then begin
               id_predefine:=DataDataSet.FBN('id_define').value;
               ModalResult:=mrYes;
     end;
end;

procedure TfrmGetFilterPredefine.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
