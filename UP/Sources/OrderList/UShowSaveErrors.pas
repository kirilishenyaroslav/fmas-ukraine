unit UShowSaveErrors;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, cxStyles, cxCustomData, cxGraphics, cxFilter,
    cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
    cxGridCustomView, cxGrid, ExtCtrls, cxClasses, RxMemDS, pFibDataSet,
    FIBDataSet;

type
    TfrmGetErrors = class(TForm)
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
        ContentError: TcxStyle;
        qizzStyle: TcxGridTableViewStyleSheet;
        Panel1: TPanel;
        OkButton: TBitBtn;
        cxGrid1: TcxGrid;
        VacanciesView: TcxGridDBTableView;
        cxGridDBColumn1: TcxGridDBColumn;
        cxGridLevel1: TcxGridLevel;
        ErrorTextDataSource: TDataSource;
        VacanciesViewDBColumn1: TcxGridDBColumn;
        VacanciesViewDBColumn2: TcxGridDBColumn;
        VacanciesViewDBColumn3: TcxGridDBColumn;
        VacanciesViewDBColumn4: TcxGridDBColumn;
        PeopleGrid: TcxGrid;
        PeopleView: TcxGridDBTableView;
        cxGridLevel2: TcxGridLevel;
        CheckDateColumn: TcxGridDBColumn;
        SmetaPpsKod: TcxGridDBColumn;
        AbsentColumn: TcxGridDBColumn;
        PeopleSource: TDataSource;
        TNColumn: TcxGridDBColumn;
        FIOColumn: TcxGridDBColumn;
        NameSovmestColumn: TcxGridDBColumn;
        OrderColumn: TcxGridDBColumn;
        StavokColumn: TcxGridDBColumn;
        Panel2: TPanel;
        Panel3: TPanel;
        IdOrderCreateColumn: TcxGridDBColumn;
        procedure OkButtonClick(Sender: TObject);
        procedure AfterScroll(DataSet: TDataSet);
        procedure PeopleViewCustomDrawCell(Sender: TcxCustomGridTableView;
            ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
            var ADone: Boolean);
        procedure VacanciesViewDBColumn2GetDisplayText(
            Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
            var AText: string);
    private
        Id_Order: Int64;
        Id_Level: Integer;
        dostup: Boolean;
        Vacancies, People: TpFIBDataSet;
    public
    { Public declarations }
        constructor Create(AOwner: TComponent; Vacancies, People: TpFIBDataSet;
            Id_Order, Id_Level: Int64; dostup: boolean); reintroduce;
    end;



implementation

{$R *.dfm}

constructor TfrmGetErrors.Create(AOwner: TComponent;
    Vacancies, People: TpFIBDataSet; Id_Order, Id_Level: Int64; dostup: boolean);
var
    i: Integer;
begin
    inherited Create(AOwner);
    ErrorTextDataSource.DataSet := Vacancies;
    PeopleSource.DataSet := People;

    Self.Vacancies := Vacancies;
    Self.People := People;

    Self.Id_Order := Id_Order;
    Self.Id_Level := Id_Level;
    Self.dostup := dostup;

    Vacancies.AfterScroll := AfterScroll;
    Vacancies.First;

    i := 0;

    while true do
    begin
        if i >= VacanciesView.ViewData.RowCount then
            break;
        VacanciesView.ViewData.Rows[i].Expand(True);
        inc(i);
    end;
end;

procedure TfrmGetErrors.OkButtonClick(Sender: TObject);
begin
    ModalResult := mrYes;
end;

procedure TfrmGetErrors.AfterScroll(DataSet: TDataSet);
begin
    People.Close;
    People.ParamByName('Id_Department').AsVariant := DataSet['Id_Department'];
    People.ParamByName('Id_Smeta').AsVariant := DataSet['Id_Smet'];
    People.ParamByName('Id_Post_Salary').AsVariant := DataSet['Id_Post_Salary'];
    People.ParamByName('Id_Smeta_Pps').AsVariant := DataSet['Id_Smet_Pps'];
    People.ParamByName('Koeff').AsVariant := DataSet['Koeff_Pps'];
    People.ParamByName('Id_Type_Post').AsVariant := DataSet['Id_Type_Post'];
    People.ParamByName('Filter_Id_PCard_Away').AsVariant := DataSet['Id_PCard_Away'];
    People.ParamByName('Act_Date').AsVariant := DataSet['Check_Date'];
    People.ParamByName('Id_Level').AsInteger := Id_Level;
    People.Open;
end;

procedure TfrmGetErrors.PeopleViewCustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if AViewInfo.GridRecord.Values[IdOrderCreateColumn.Index] = Id_Order then
        ACanvas.Brush.Color := $8080FF
    else ACanvas.Brush.Color := clInfoBk
end;

procedure TfrmGetErrors.VacanciesViewDBColumn2GetDisplayText(
    Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
    var AText: string);
begin
    if not Self.dostup then AText := '***';
end;

end.
