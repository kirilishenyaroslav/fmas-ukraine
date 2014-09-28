unit uSelectForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, uSearchFrame, ActnList;

type
  TSelectForm = class(TForm)
    Panel1: TPanel;
    RefreshButton: TSpeedButton;
    CancelButton: TSpeedButton;
    SelectButton: TSpeedButton;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
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
    SearchFrame: TfmSearch;
    ActionList1: TActionList;
    SelectAction: TAction;
    QuitAction: TAction;
    RefreshAction: TAction;
    SelectSource: TDataSource;
    ShowId: TAction;
    procedure QuitActionExecute(Sender: TObject);
    procedure SelectActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure TableViewDblClick(Sender: TObject);
    procedure TableViewKeyPress(Sender: TObject; var Key: Char);
    procedure TableViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ShowIdExecute(Sender: TObject);
  private
    Data: TDataSet;
  public
    constructor Create(AOwner: TComponent; DataSet: TDataSet); reintroduce;
  end;

  function qSelect(DataSet: TDataSet; Caption: String = 'Вибір...'): Boolean;

var
  SelectForm: TSelectForm;

implementation

{$R *.dfm}

function qSelect(DataSet: TDataSet; Caption: String = 'Вибір...'): Boolean;
var
    form: TSelectForm;
begin
    form := TSelectForm.Create(Application.MainForm, DataSet);
    form.Caption := Caption;
    Result := form.ShowModal = mrOk;
    form.Free;
end;

constructor TSelectForm.Create(AOwner: TComponent; DataSet: TDataSet);
begin
    inherited Create(AOwner);
    Data := DataSet;
    if not Data.Active then
    begin
        Data.Close;
        Data.Open;
    end;
    SearchFrame.Prepare(Data);
    SelectSource.DataSet := Data;
    TableView.DataController.CreateAllItems;
end;

procedure TSelectForm.QuitActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TSelectForm.SelectActionExecute(Sender: TObject);
begin
    if not Data.IsEmpty then ModalResult := mrOk;
end;

procedure TSelectForm.RefreshActionExecute(Sender: TObject);
begin
    TableView.DataController.DataSet.Close;
    TableView.DataController.DataSet.Open;
end;

procedure TSelectForm.GridDblClick(Sender: TObject);
begin
    SelectAction.Execute;
end;

procedure TSelectForm.TableViewDblClick(Sender: TObject);
begin
    SelectAction.Execute;
end;

procedure TSelectForm.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
    if ord(Key) > 31  then
        SearchFrame.SearchEdit.Text := SearchFrame.SearchEdit.Text + Key;
end;

procedure TSelectForm.TableViewCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
	SearchFrame.SearchEdit.Text := '';
end;

procedure TSelectForm.TableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_BACK then SearchFrame.SearchEdit.Text := '';
end;

procedure TSelectForm.ShowIdExecute(Sender: TObject);
var text : string;
    i : integer;
begin
    text:='';

    for i:=1 to SelectSource.DataSet.Fields.Count do
        text:=text + SelectSource.DataSet.Fields[i-1].FieldName + ' : ' +
            SelectSource.DataSet.Fields[i-1].DisplayText + #13;

    ShowMessage(text);
end;

end.
