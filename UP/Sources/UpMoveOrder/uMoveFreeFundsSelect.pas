unit uMoveFreeFundsSelect;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, Buttons, ExtCtrls, cxGridTableView,
    ActnList, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
    cxGridCustomTableView, cxGridDBTableView, cxGrid;

type
    TfmMoveFreeFundsSelect = class(TForm)
        Grid: TcxGrid;
        TableView: TcxGridDBTableView;
        GridLevel1: TcxGridLevel;
        ActionList1: TActionList;
        SelectAction: TAction;
        QuitAction: TAction;
        RefreshAction: TAction;
        ShowId: TAction;
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
        Panel1: TPanel;
        RefreshButton: TSpeedButton;
        CancelButton: TSpeedButton;
        SelectButton: TSpeedButton;
        TableViewSMETA_FULL_TITLE: TcxGridDBColumn;
        TableViewKOL_STAVOK: TcxGridDBColumn;
        TableViewKOL_VACANT_STAVOK: TcxGridDBColumn;
        TableViewOKLAD: TcxGridDBColumn;
        TableViewKOEFF_PPS: TcxGridDBColumn;
        TableViewSMETA_PPS_FULL_TITLE: TcxGridDBColumn;
        TableViewSR_NAME: TcxGridDBColumn;
        TableViewID_SR: TcxGridDBColumn;
        TableViewSMETA_TITLE: TcxGridDBColumn;
        TableViewSMETA_KOD: TcxGridDBColumn;
        TableViewOKLAD_PPS: TcxGridDBColumn;
        TableViewSMETA_PPS_TITLE: TcxGridDBColumn;
        TableViewSMETA_PPS_KOD: TcxGridDBColumn;
        TableViewID_SMETA: TcxGridDBColumn;
        TableViewID_SMETA_PPS: TcxGridDBColumn;
        TableViewID_WORK_COND: TcxGridDBColumn;
        TableViewNAME_WORK_COND: TcxGridDBColumn;
        TableViewID_WORK_MODE: TcxGridDBColumn;
        TableViewNAME_WORK_MODE: TcxGridDBColumn;
    TableViewNUM_DIGIT: TcxGridDBColumn;
        procedure TableViewDblClick(Sender: TObject);
        procedure TableViewKeyUp(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure SelectActionExecute(Sender: TObject);
        procedure RefreshActionExecute(Sender: TObject);
        procedure QuitActionExecute(Sender: TObject);
        procedure TableViewKOL_STAVOKGetDisplayText(
            Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
            var AText: string);
        procedure TableViewKOL_VACANT_STAVOKGetDisplayText(
            Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
            var AText: string);
    private
        { Private declarations }
    public
        { Public declarations }
        mov_fdostup: Boolean;
    end;

var
    fmMoveFreeFundsSelect: TfmMoveFreeFundsSelect;

implementation

{$R *.dfm}

procedure TfmMoveFreeFundsSelect.TableViewDblClick(Sender: TObject);
begin
    SelectButton.Click;
end;

procedure TfmMoveFreeFundsSelect.TableViewKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_RETURN then SelectButton.Click;
end;

procedure TfmMoveFreeFundsSelect.SelectActionExecute(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfmMoveFreeFundsSelect.RefreshActionExecute(Sender: TObject);
begin
    TableView.DataController.DataSet.Refresh;
end;

procedure TfmMoveFreeFundsSelect.QuitActionExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TfmMoveFreeFundsSelect.TableViewKOL_STAVOKGetDisplayText(
    Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
    var AText: string);
begin
    if not mov_fdostup then AText := '***';
end;

procedure TfmMoveFreeFundsSelect.TableViewKOL_VACANT_STAVOKGetDisplayText(
    Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
    var AText: string);
begin
    if not mov_fdostup then AText := '***';
end;

end.
