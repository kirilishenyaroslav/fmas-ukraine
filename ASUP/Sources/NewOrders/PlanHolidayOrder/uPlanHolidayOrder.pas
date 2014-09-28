unit uPlanHolidayOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Buttons, ExtCtrls, FIBDatabase, pFIBDatabase,
  ActnList, uFormControl, FIBDataSet, pFIBDataSet, uSelectForm,
  qFTools, uSelectParams, frxClass, frxDBSet, uHolidayPageView, frRtfExp,
  FR_Class, frOLEExl, frexpimg;

type
  TfmPlanHolidayOrder = class(TForm)
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    LocalWriteTransaction: TpFIBTransaction;
    LocalReadTransaction: TpFIBTransaction;
    LocalDatabase: TpFIBDatabase;
    Panel3: TPanel;
    DeleteItemButton: TSpeedButton;
    ItemsGrid: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
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
    AutoCreateButton: TSpeedButton;
    AutoCreate: TAction;
    CancelButton: TSpeedButton;
    CreateOrderQuery: TpFIBDataSet;
    AutoCreateQuery: TpFIBDataSet;
    SelectQuery: TpFIBDataSet;
    SelectQueryID_MAN_HOLIDAY: TFIBIntegerField;
    SelectQueryID_HOLIDAY: TFIBIntegerField;
    SelectQueryPERIOD: TFIBStringField;
    SelectQueryDATE_BEG: TFIBDateField;
    SelectQueryDATE_END: TFIBDateField;
    SelectQueryH_TERM: TFIBIntegerField;
    SelectQueryNAME_HOLIDAY: TFIBStringField;
    SelectQueryNAME_DEPARTMENT: TFIBStringField;
    SelectQueryNAME_POST: TFIBStringField;
    SelectQueryFIO: TFIBStringField;
    cxGridDBTableView5DBColumn1: TcxGridDBColumn;
    ResultSource: TDataSource;
    cxGridDBTableView5DBColumn2: TcxGridDBColumn;
    cxGridDBTableView5DBColumn3: TcxGridDBColumn;
    cxGridDBTableView5DBColumn4: TcxGridDBColumn;
    cxGridDBTableView5DBColumn5: TcxGridDBColumn;
    cxGridDBTableView5DBColumn6: TcxGridDBColumn;
    cxGridDBTableView5DBColumn7: TcxGridDBColumn;
    cxGridDBTableView5DBColumn8: TcxGridDBColumn;
    DeleteHolidayAction: TAction;
    SpeedButton2: TSpeedButton;
    PrintAction: TAction;
    PrintQuery: TpFIBDataSet;
    Report: TfrxReport;
    PrintDataSet: TfrxDBDataset;
    PrintFooterQuery: TpFIBDataSet;
    PrintFooterDataSet: TfrxDBDataset;
    GetOrderGroup: TpFIBDataSet;
    SelectQueryID_PCARD: TFIBIntegerField;
    SpeedButton1: TSpeedButton;
    ViewHolidayAction: TAction;
    SelectQueryPARENT_DEPARTMENT_NAME: TFIBStringField;
    cxGridDBTableView5DBColumn9: TcxGridDBColumn;
    DeleteQuery: TpFIBDataSet;
    frOLEExcelExport1: TfrOLEExcelExport;
    frRtfAdvExport1: TfrRtfAdvExport;
    frBMPExport1: TfrBMPExport;
    frJPEGExport1: TfrJPEGExport;
    procedure CancelActionExecute(Sender: TObject);
    procedure AutoCreateExecute(Sender: TObject);
    procedure PrintActionExecute(Sender: TObject);
    procedure ViewHolidayActionExecute(Sender: TObject);
    procedure DeleteHolidayActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    IdOrder : Integer;
    DateOrder : TDate;
  end;

var
  fmPlanHolidayOrder: TfmPlanHolidayOrder;

implementation

uses StdCtrls;

{$R *.dfm}

procedure TfmPlanHolidayOrder.CancelActionExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TfmPlanHolidayOrder.AutoCreateExecute(Sender: TObject);
begin
    fmSelectParams := TfmSelectParams.Create(Self);

    if fmSelectParams.ShowModal <> mrOk then begin
        fmSelectParams.Free;
        exit;
    end;

    AutoCreateQuery.Transaction.StartTransaction;

    try
        AutoCreateQuery.Close;
        AutoCreateQuery.ParamByName('ID_ORDER').AsInteger :=IdOrder;
        AutoCreateQuery.ParamByName('POST_STR').AsString := fmSelectParams.ResultPostStr;
        AutoCreateQuery.ParamByName('ID_DEPARTMENT').AsInteger := fmSelectParams.Department.Value;
        AutoCreateQuery.ParamByName('INTRO').AsString := fmSelectParams.IntroText.Value;

        fmSelectParams.Free;

        AutoCreateQuery.Open;
    except on e:exception do begin
            qFErrorDialog(e.Message);
            AutoCreateQuery.Transaction.Rollback;
            Exit;
        end;
    end;

    AutoCreateQuery.Transaction.Commit;

    SelectQuery.CloseOpen(False);
end;

procedure TfmPlanHolidayOrder.PrintActionExecute(Sender: TObject);
begin
    PrintQuery.Close;
    PrintQuery.ParamByName('id_order').AsInteger := IdOrder;
    PrintQuery.Open;

    GetOrderGroup.Close;
    GetOrderGroup.ParamByName('ID_ORDER').AsInteger := IdOrder;
    GetOrderGroup.Open;

    PrintFooterQuery.Close;
    PrintFooterQuery.ParamByName('ID_ORDER_GROUP').AsInteger := GetOrderGroup['ID_ORDER_GROUP'];
    PrintFooterQuery.Open;

    Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Asup\Asup_Plan_Holiday_Order.fr3');
    //Report.DesignReport;
    Report.PrepareReport(True);
    Report.ShowPreparedReport;
end;

procedure TfmPlanHolidayOrder.ViewHolidayActionExecute(Sender: TObject);
var
    Form : TfmHolidayPageView;
begin
    Form := TfmHolidayPageView.Create(Self);
    Form.ShowModal;
    Form.Free;
end;

procedure TfmPlanHolidayOrder.DeleteHolidayActionExecute(Sender: TObject);
begin
    if SelectQuery.IsEmpty then begin
        qFErrorDialog('Немає записів!');
        exit;
    end;

    if not qFConfirm('Ви справді бажаєте вилучити цей запис?') then
        exit;

    DeleteQuery.QDelete.Transaction.StartTransaction;
    DeleteQuery.QDelete.Close;
    DeleteQuery.QDelete.ParamByName('ID_MAN_HOLIDAY').AsInteger := SelectQueryID_MAN_HOLIDAY.Value;
    DeleteQuery.QDelete.ExecQuery;
    DeleteQuery.QDelete.Transaction.Commit;

    SelectQuery.CloseOpen(False);
end;

end.
