unit uSpDismissionView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, Buttons, ExtCtrls, ActnList, FIBDataSet, pFIBDataSet,
  cxClasses, FIBDatabase, pFIBDatabase, uActionControl;

type
  TfmSpDismissionView = class(TForm)
    LocalDatabase: TpFIBDatabase;
    LocalReadTransaction: TpFIBTransaction;
    LocalWriteTransaction: TpFIBTransaction;
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
    ResultQuery: TpFIBDataSet;
    WorkQuery: TpFIBDataSet;
    DataSource: TDataSource;
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    AddAction: TAction;
    ModifyAction: TAction;
    DeleteAction: TAction;
    FindPanel: TPanel;
    SearchLabel: TLabel;
    Label1: TLabel;
    SearchNextButton: TSpeedButton;
    SearchEdit: TEdit;
    OrderGrid: TcxGrid;
    OrderGridDBTableView1: TcxGridDBTableView;
    OrderGridDBTableView1DBColumn3: TcxGridDBColumn;
    OrderGridDBTableView1DBColumn1: TcxGridDBColumn;
    OrderGridLevel1: TcxGridLevel;
    ResultQueryID_DISMISSION: TFIBIntegerField;
    ResultQueryNAME_DISMISSION: TFIBStringField;
    ResultQueryKZOT_ST: TFIBStringField;
    ActionControl: TqFActionControl;
    Panel3: TPanel;
    AddItemButton: TSpeedButton;
    ModifyItemButton: TSpeedButton;
    DeleteItemButton: TSpeedButton;
    InfoButton: TSpeedButton;
    CancelButton: TSpeedButton;
    SelectButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    RefreshAction: TAction;
    CloneAction: TAction;
    InfoAction: TAction;
    CloneButton: TSpeedButton;
    procedure SearchEditChange(Sender: TObject);
    procedure SearchNextButtonClick(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure OkActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSpDismissionView: TfmSpDismissionView;

implementation

{$R *.dfm}

procedure TfmSpDismissionView.SearchEditChange(Sender: TObject);
begin
    try
        ResultQuery.ExtLocate('NAME_DISMISSION', '%'+SearchEdit.Text+'%', [eloCaseInsensitive, eloWildCards]);
    except
    end;
end;

procedure TfmSpDismissionView.SearchNextButtonClick(Sender: TObject);
begin
    ResultQuery.ExtLocateNext('NAME_DISMISSION', '%'+SearchEdit.Text+'%', [eloCaseInsensitive, eloWildCards]);
end;

procedure TfmSpDismissionView.CancelActionExecute(Sender: TObject);
begin
    ModalResult := mrCancel;

    if FormStyle = fsMDIChild then
        Close;
end;

procedure TfmSpDismissionView.OkActionExecute(Sender: TObject);
begin
    if SearchEdit.Focused then  SearchNextButtonClick(Sender);
    ModalResult := mrOk;
end;

procedure TfmSpDismissionView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
        Action := caFree;
end;

end.
