unit USpecModules;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, cxStyles, cxCustomData, cxGraphics, cxFilter,
    cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, ExtCtrls,
    cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
    cxClasses, cxControls, cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet,
    IBase, FIBDatabase, pFIBDatabase;

type
    TfrmSpecModulesSelect = class(TForm)
        cxGrid3: TcxGrid;
        SpecModulesView: TcxGridDBTableView;
        cxGridDBColumn14: TcxGridDBColumn;
        cxGridDBColumn16: TcxGridDBColumn;
        cxGridDBColumn15: TcxGridDBColumn;
        cxGridLevel3: TcxGridLevel;
        pnl1: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        SelectModuleDataSet: TpFIBDataSet;
        dsSelectDataSet: TDataSource;
        WorkDatabase: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
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
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
    private
    { Private declarations }
        LId_Order: Int64;
    public
    { Public declarations }
        SelectBplName: string;
        constructor Create(AOwner: TComponent; id_order: Int64; DbHandle: TISC_DB_HANDLE); reintroduce;
    end;

implementation

{$R *.dfm}

{ TfrmSpecModulesSelect }

constructor TfrmSpecModulesSelect.Create(AOwner: TComponent; id_order: Int64; DbHandle: TISC_DB_HANDLE);
begin
    inherited Create(AOwner);
    SelectBplName := '';
    LId_Order := id_order;
    WorkDatabase.Handle := DbHandle;
    SelectModuleDataSet.SelectSQL.Text := 'SELECT * FROM UP_DT_SPECIAL_EDIT_MOD_SEL_BY_O(' + IntToStr(id_order) + ')';
    SelectModuleDataSet.Open;
end;


procedure TfrmSpecModulesSelect.OkButtonClick(Sender: TObject);
begin
    if SelectModuleDataSet.RecordCount > 0
        then begin
        SelectBplName := SelectModuleDataSet.FieldByName('SPEC_MODULE_NAME').AsString;
    end;
    ModalResult := mrYes;
end;

procedure TfrmSpecModulesSelect.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrNo;
end;

end.
