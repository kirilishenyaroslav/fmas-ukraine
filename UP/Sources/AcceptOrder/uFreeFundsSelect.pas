unit uFreeFundsSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, Buttons, ExtCtrls, cxGridTableView,
  ActnList, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, UP_DMAcception;

type
  TfmFreeFundsSelect = class(TForm)
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
    TableViewNum_Digit: TcxGridDBColumn;
     procedure Prepare(dos : Boolean);
    procedure TableViewDblClick(Sender: TObject);
    procedure TableViewKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SelectActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure QuitActionExecute(Sender: TObject);
    procedure TableViewKOL_STAVOKGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure TableViewKOL_VACANT_STAVOKGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
  private
    { Private declarations }
    dos:Boolean;

  public
    { Public declarations }
  end;

var
  fmFreeFundsSelect: TfmFreeFundsSelect;

implementation

{$R *.dfm}



procedure TfmFreeFundsSelect.TableViewDblClick(Sender: TObject);
begin
    SelectButton.Click;
end;

procedure TfmFreeFundsSelect.TableViewKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then ModalResult := mrOk;;
end;

procedure TfmFreeFundsSelect.SelectActionExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfmFreeFundsSelect.RefreshActionExecute(Sender: TObject);
begin
  TableView.DataController.DataSet.Refresh;
end;

procedure TfmFreeFundsSelect.QuitActionExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;


procedure TfmFreeFundsSelect.Prepare(dos: Boolean);
begin
    self.dos:=dos;
end;

procedure TfmFreeFundsSelect.TableViewKOL_STAVOKGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
    if not self.dos then AText:='***';
end;

procedure TfmFreeFundsSelect.TableViewKOL_VACANT_STAVOKGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
    if not self.dos then AText:='***';
end;

end.
