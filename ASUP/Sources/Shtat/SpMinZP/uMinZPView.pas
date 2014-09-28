unit uMinZPView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ActnList, uActionControl,
  cxGridTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, Buttons, ExtCtrls,
  uMinZPData;

type
  TfmMinZPView = class(TForm)
    Panel1: TPanel;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    CancelButton: TSpeedButton;
    MinZPGridView: TcxGridDBTableView;
    MinZPGridLevel1: TcxGridLevel;
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
    ActionControl: TqFActionControl;
    ActionList1: TActionList;
    AddAction: TAction;
    ModifyAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    MinZPGrid: TcxGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure ActionControlAfterPrepare(Sender: TObject; Form: TForm);
  private
    DM: TdmMinZP;
  public
    constructor Create(AOwner: TComponent; DM: TdmMinZP); reintroduce;
  end;

var
  fmMinZPView: TfmMinZPView;

implementation

{$R *.dfm}

uses uAddMinZP;

constructor TfmMinZPView.Create(AOwner: TComponent; DM: TdmMinZP);
begin
    inherited Create(AOwner);

    Self.DM := DM;

    ActionControl.Database := DM.Database;
    DM.MinZPSelect.Close;
    DM.MinZPSelect.Open;
    MinZPGridView.DataController.DataSource := DM.MinZPSource;
    MinZPGridView.DataController.CreateAllItems;
    ActionControl.SelectDataSet := DM.MinZPSelect;
end;

procedure TfmMinZPView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmMinZPView.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmMinZPView.ActionControlAfterPrepare(Sender: TObject;
  Form: TForm);
begin
    if Form is TfmAddMinZP then
        (Form as TfmAddMinZP).DM := DM;
end;

end.
