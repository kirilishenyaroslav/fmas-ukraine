unit uHolidaySovmestOrderForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ActnList, cxGridTableView, StdCtrls,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, Buttons, uActionControl,
  dmHolidaySovmestOrder, uSearchFrame, qFTools, frexpimg, frOLEExl,
  FR_Class, frRtfExp, frxClass, frxDBSet, FIBDataSet, pFIBDataSet;

type
  TfmMassHolidayOrder = class(TForm)
    ItemsGrid: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBTableView5DBColumn1: TcxGridDBColumn;
    cxGridDBTableView5DBColumn2: TcxGridDBColumn;
    cxGridDBTableView5DBColumn5: TcxGridDBColumn;
    cxGridDBTableView5DBColumn3: TcxGridDBColumn;
    cxGridDBTableView5DBColumn4: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
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
    KeyList: TActionList;
    CloseAction: TAction;
    AddAction: TAction;
    ModifyAction: TAction;
    DeleteAction: TAction;
    Panel3: TPanel;
    AddItemButton: TSpeedButton;
    ModifyItemButton: TSpeedButton;
    DeleteItemButton: TSpeedButton;
    InfoButton: TSpeedButton;
    ViewAction: TAction;
    CancelButton: TSpeedButton;
    ActionControl: TqFActionControl;
    fmSearch: TfmSearch;
    cxGridDBTableView5DBColumn6: TcxGridDBColumn;
    cxGridDBTableView5DBColumn7: TcxGridDBColumn;
    CloneButton: TSpeedButton;
    CloneAction: TAction;
    SpeedButton1: TSpeedButton;
    RefreshAction: TAction;
    RecalcButton: TSpeedButton;
    cxGridDBTableView5DBColumn8: TcxGridDBColumn;
    cxGridDBTableView5DBColumn9: TcxGridDBColumn;
    cxGridDBTableView5DBColumn10: TcxGridDBColumn;
    PrintFooterQuery: TpFIBDataSet;
    GetOrderGroup: TpFIBDataSet;
    PrintFooterDataSet: TfrxDBDataset;
    PrintDataSet: TfrxDBDataset;
    frRtfAdvExport1: TfrRtfAdvExport;
    frOLEExcelExport1: TfrOLEExcelExport;
    frBMPExport1: TfrBMPExport;
    frJPEGExport1: TfrJPEGExport;
    SpeedButton2: TSpeedButton;
    Report: TfrxReport;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure RecalcButtonClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMassHolidayOrder: TfmMassHolidayOrder;

implementation

{$R *.dfm}

procedure TfmMassHolidayOrder.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmMassHolidayOrder.FormResize(Sender: TObject);
begin
    CancelButton.Left := Width - CancelButton.Width - 10;
end;

procedure TfmMassHolidayOrder.CloseActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmMassHolidayOrder.RecalcButtonClick(Sender: TObject);
begin
    if not qFConfirm('Сформувати відпустки сумісникам? Це призведе до вилучення створених раніше відпусток!') then
        exit;

    Dm.LocalWriteTransaction.StartTransaction;
    Dm.WorkQuery.Close;
    Dm.WorkQuery.QUpdate.SQL.Text := 'execute procedure ASUP_DT_MAN_HOLIDAY_SOVMEST(' +
                                IntToStr(dm.IdOrder) + ',' +
                                QuotedStr(DateToStr(Dm.DateOrder)) + ')';
    Dm.WorkQuery.QUpdate.ExecQuery;
    Dm.LocalWriteTransaction.Commit;

    Dm.ResultQuery.CloseOpen(False);
end;

procedure TfmMassHolidayOrder.SpeedButton2Click(Sender: TObject);
begin
    //PrintQuery.Close;
    //PrintQuery.ParamByName('id_order').AsInteger := Dm.IdOrder;
    //PrintQuery.Open;

    GetOrderGroup.Close;
    GetOrderGroup.ParamByName('ID_ORDER').AsInteger := Dm.IdOrder;
    GetOrderGroup.Open;

    PrintFooterQuery.Close;
    PrintFooterQuery.ParamByName('ID_ORDER_GROUP').AsInteger := GetOrderGroup['ID_ORDER_GROUP'];
    PrintFooterQuery.Open;

    Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Asup\Asup_Sovmest_Holiday_Order.fr3');
    Report.DesignReport;
//    Report.PrepareReport(True);
//    Report.ShowPreparedReport;
end;

end.
