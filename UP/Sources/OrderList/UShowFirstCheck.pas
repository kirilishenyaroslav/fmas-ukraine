unit UShowFirstCheck;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, StdCtrls, Buttons,
    ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
    cxClasses, cxControls, cxGridCustomView, cxGrid, RxMemDS, pFibDataSet,
    FIBDataSet, cxTextEdit;

type
    TfrmFirstCheck = class(TForm)
        FirstCheckGrid: TcxGrid;
        FirstCheckView: TcxGridDBTableView;
        NumItemColumn: TcxGridDBColumn;
        NumSubItemColumn: TcxGridDBColumn;
        TypeColumn: TcxGridDBColumn;
        FIOColumn: TcxGridDBColumn;
        ResultsColumn: TcxGridDBColumn;
        FirstCheckLevel: TcxGridLevel;
        Panel1: TPanel;
        OkButton: TBitBtn;
        FirstCheckDataSource: TDataSource;
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
        CancelButton: TBitBtn;
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
    private
    { Private declarations }
        Id_Order_FirstCheck: Int64;
        FirstCheck: TpFIBDataSet;
    public
    { Public declarations }
        constructor Create(AOwner: TComponent; FirstCheck: TpFIBDataSet;
            Id_Order_FirstCheck: Int64); reintroduce;
    end;

var
    frmFirstCheck: TfrmFirstCheck;

implementation

{$R *.dfm}

constructor TfrmFirstCheck.Create(AOwner: TComponent;
    FirstCheck: TpFIBDataSet; Id_Order_FirstCheck: Int64);
begin
    inherited Create(AOwner);
    FirstCheckDataSource.DataSet := FirstCheck;

    Self.FirstCheck := FirstCheck;
    Self.Id_Order_FirstCheck := Id_Order_FirstCheck;

end;

procedure TfrmFirstCheck.OkButtonClick(Sender: TObject);
begin
    ModalResult := mrOK;
end;

procedure TfrmFirstCheck.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

end.
