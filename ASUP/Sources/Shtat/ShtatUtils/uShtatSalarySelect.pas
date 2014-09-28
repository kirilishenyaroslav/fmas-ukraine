unit uShtatSalarySelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uShtatUtils, Buttons, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, ActnList, uSearchFrame,
  StdCtrls;

type
  TfmShtatSalarySelect = class(TForm)
    Panel1: TPanel;
    RefreshButton: TSpeedButton;
    CancelButton: TSpeedButton;
    SelectButton: TSpeedButton;
    SalaryTableView: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
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
    ActionList1: TActionList;
    ExitAction: TAction;
    SelectAction: TAction;
    RefreshAction: TAction;
    Panel2: TPanel;
    SearchEdit: TEdit;
    Label1: TLabel;
    SalaryTableViewID_POST_SALARY: TcxGridDBColumn;
    SalaryTableViewName_Post: TcxGridDBColumn;
    SalaryTableViewNAME_POST_BASE_SALARY: TcxGridDBColumn;
    SalaryTableViewNAME_POST_SALARY: TcxGridDBColumn;
    SalaryTableViewSALARY_MIN: TcxGridDBColumn;
    SalaryTableViewSALARY_MAX: TcxGridDBColumn;
    SalaryTableViewID_POST: TcxGridDBColumn;
    SalaryTableViewPPS_KOEF: TcxGridDBColumn;
    SalaryTableViewNAME_CATEGORY: TcxGridDBColumn;
    SalaryTableViewFULL_SALARY_NAME: TcxGridDBColumn;
    procedure RefreshActionExecute(Sender: TObject);
    procedure SelectActionExecute(Sender: TObject);
    procedure ExitActionExecute(Sender: TObject);
    procedure SalaryTableViewDblClick(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
    procedure SalaryTableViewKeyPress(Sender: TObject; var Key: Char);
    procedure SalaryTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    DM: TdmShtatUtils;
  public
    constructor Create(AOwner: TComponent; DM: TdmShtatUtils); reintroduce;
  end;

var
  fmShtatSalarySelect: TfmShtatSalarySelect;

implementation

{$R *.dfm}

constructor TfmShtatSalarySelect.Create(AOwner: TComponent; DM: TdmShtatUtils);
begin
    inherited Create(AOwner);
    Self.DM := DM;

    SalaryTableView.DataController.DataSource := DM.SalarySource;
    SalaryTableView.DataController.DataSet.Close;
    SalaryTableView.DataController.DataSet.Open;
end;

procedure TfmShtatSalarySelect.RefreshActionExecute(Sender: TObject);
begin
    SalaryTableView.DataController.DataSet.Close;
    SalaryTableView.DataController.DataSet.Open;
end;

procedure TfmShtatSalarySelect.SelectActionExecute(Sender: TObject);
begin
    if not SalaryTableView.DataController.DataSet.IsEmpty then
        ModalResult := mrOk;
end;

procedure TfmShtatSalarySelect.ExitActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmShtatSalarySelect.SalaryTableViewDblClick(Sender: TObject);
begin
    SelectAction.Execute;
end;

procedure TfmShtatSalarySelect.SearchEditChange(Sender: TObject);
begin
    if SearchEdit.Text = '' then
    begin
        SalaryTableView.DataController.DataSet.Filtered := False;
    end
    else
    begin
        SalaryTableView.DataController.DataSet.Filtered := False;
        SalaryTableView.DataController.DataSet.Filter := 'UPPER(Name_Post) LIKE ''' +
            AnsiUpperCase(SearchEdit.Text) + '%''';
        SalaryTableView.DataController.DataSet.Filtered := True;
        SalaryTableView.ViewData.Expand(False);
    end;
end;

procedure TfmShtatSalarySelect.SalaryTableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
    if ord(Key) >= 32 then
    SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TfmShtatSalarySelect.SalaryTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = VK_BACK then
        SearchEdit.Text := '';
end;

procedure TfmShtatSalarySelect.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    SalaryTableView.DataController.DataSet.Filtered := False;
end;

end.
