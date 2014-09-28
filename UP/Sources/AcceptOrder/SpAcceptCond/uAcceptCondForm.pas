unit uAcceptCondForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, Buttons, ExtCtrls, ActnList,
  cxGridLevel, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, uActionControl;

type
  TfmAcceptCond = class(TForm)
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
    cxGrid1: TcxGrid;
    AcceptCondView: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    ActionList1: TActionList;
    AddAction: TAction;
    ModifyAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    QuitAction: TAction;
    SelectAction: TAction;
    CloneAction: TAction;
    PrintAction: TAction;
    PlanValuesAction: TAction;
    Panel1: TPanel;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    CancelButton: TSpeedButton;
    SelectButton: TSpeedButton;
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    AcceptCondSelect: TpFIBDataSet;
    AcceptDataSource: TDataSource;
    AcceptCondSelectID_ACCEPT_COND: TFIBIntegerField;
    AcceptCondSelectNAME_ACCEPT_COND: TFIBStringField;
    AcceptCondSelectNAME_ACCEPT_COND_PRINT: TFIBStringField;
    AcceptCondViewID_ACCEPT_COND: TcxGridDBColumn;
    AcceptCondViewNAME_ACCEPT_COND: TcxGridDBColumn;
    AcceptCondViewNAME_ACCEPT_COND_PRINT: TcxGridDBColumn;
    ActionControl: TqFActionControl;
    procedure QuitActionExecute(Sender: TObject);
    procedure SelectActionExecute(Sender: TObject);
    procedure AcceptCondViewDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; DBHandle: Integer); reintroduce;
  end;

var
  fmAcceptCond: TfmAcceptCond;

implementation

{$R *.dfm}

{ TfmAcceptCond }

uses IBase;

constructor TfmAcceptCond.Create(AOwner: TComponent; DBHandle: Integer);
begin
    inherited Create(AOwner);
    DB.Handle := TISC_DB_Handle(DBHandle);
    AcceptCondSelect.Close;
    AcceptCondSelect.Open;

    ActionControl.Database := DB;
end;

procedure TfmAcceptCond.QuitActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmAcceptCond.SelectActionExecute(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfmAcceptCond.AcceptCondViewDblClick(Sender: TObject);
begin
    SelectAction.Execute;
end;

end.
