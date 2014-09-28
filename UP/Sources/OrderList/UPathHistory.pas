unit UPathHistory;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
    cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit,
    cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
    cxControls, cxGridCustomView, cxGrid, cxClasses, FIBDataSet, pFIBDataSet,
    ImgList, cxTimeEdit, cxCheckBox, cxCalendar;

type
    TfrmPathHistory = class(TForm)
        Panel1: TPanel;
        OkButton: TBitBtn;
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
        Grid: TcxGrid;
        PlanBplView: TcxGridDBTableView;
        cxGridDBColumn8: TcxGridDBColumn;
        cxGridDBColumn9: TcxGridDBColumn;
        cxGridDBColumn10: TcxGridDBColumn;
        Level: TcxGridLevel;
        PathDataSet: TpFIBDataSet;
        PathDataSource: TDataSource;
        PlanBplViewDBColumn1: TcxGridDBColumn;
        cxgrdbclmnPlanBplViewDBColumn2: TcxGridDBColumn;
        cxgrdbclmnTypeMove: TcxGridDBColumn;
        ImageList1: TImageList;
        PlanBplViewDBColumn2: TcxGridDBColumn;
        procedure OkButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure cxgrdbclmnPlanBplViewDBColumn2CustomDrawCell(
            Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
            AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
        procedure PlanBplViewDBColumn2GetDisplayText(
            Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
            var AText: string);
    private
    { Private declarations }
    public
    { Public declarations }
    end;



implementation

uses UpOrderList;

{$R *.dfm}

procedure TfrmPathHistory.OkButtonClick(Sender: TObject);
begin
    ModalResult := mrYes;
end;

procedure TfrmPathHistory.FormCreate(Sender: TObject);
begin
    PathDataSet.Database := TUpOrderListForm(Owner).WorkDatabase;
    PathDataSet.Transaction := TUpOrderListForm(Owner).ReadTransaction;
    PathDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_ORDER_PATH_SEL(' + TUpOrderListForm(Owner).OrderList.FieldByName('ID_ORDER').AsString + ')';
    PathDataSet.Open;
end;

procedure TfrmPathHistory.cxgrdbclmnPlanBplViewDBColumn2CustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    ACanvas.FillRect(AViewInfo.Bounds);
    ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 6, AViewInfo.Bounds.Top, 1 - AViewInfo.GridRecord.Values[cxgrdbclmnTypeMove.Index]);
    ADone := true;
end;

procedure TfrmPathHistory.PlanBplViewDBColumn2GetDisplayText(
    Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
    var AText: string);
begin
    AText := '>>'
end;

end.
