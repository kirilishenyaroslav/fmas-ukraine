unit uShtatDefaultSmeta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxClasses, cxStyles, cxGridTableView, ActnList, uActionControl,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, Buttons, ExtCtrls, cxGridLevel, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, uShtatDocData;

type
  TfmDefaultSmeta = class(TForm)
    ActionControl: TqFActionControl;
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
    ShtatDefaultSmeta: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    CancelButton: TSpeedButton;
    ShtatDefaultSmetaID_SMETA: TcxGridDBColumn;
    ShtatDefaultSmetaPERCENT: TcxGridDBColumn;
    ShtatDefaultSmetaSMETA_NAME: TcxGridDBColumn;
    procedure QuitActionExecute(Sender: TObject);
    procedure ActionControlBeforePrepare(Sender: TObject; Form: TForm);
  private
    Data: TdmShtatDoc;
  public
    constructor Create(AOwner: TComponent; Data: TdmShtatDoc); reintroduce;
  end;

var
  fmDefaultSmeta: TfmDefaultSmeta;

implementation

{$R *.dfm}

uses uAddDefaultSmeta;

constructor TfmDefaultSmeta.Create(AOwner: TComponent; Data: TdmShtatDoc);
begin
    inherited Create(AOwner);

    Self.Data := Data;

    with Data do
    begin
        DefaultSmeta.Close;
        DefaultSmeta.ParamByName('ID_SR').AsInteger := ShtatDocSelect['Id_SR'];
        DefaultSmeta.Open;
    end;

    ActionControl.AddKeys := Data.ShtatDocSelect['Id_SR'];
    ActionControl.Database := Data.DB;
    ActionControl.SelectDataSet := Data.DefaultSmeta;

    ShtatDefaultSmeta.DataController.DataSource := Data.DefaultSmetaSource;
end;

procedure TfmDefaultSmeta.QuitActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmDefaultSmeta.ActionControlBeforePrepare(Sender: TObject;
  Form: TForm);
begin
    if Form is TfmAddDefaultSmeta then
    begin
        (Form as TfmAddDefaultSmeta).ID_SR.Value := Data.ShtatDocSelect['Id_SR'];
        (Form as TfmAddDefaultSmeta).Data := Data;
    end;
end;

end.
