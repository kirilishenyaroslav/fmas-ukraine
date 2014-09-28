unit UShowMaxRate;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
    cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
    cxGridCustomView, cxGrid, ExtCtrls, StdCtrls, Buttons, RxMemDS, pFibDataSet,
    FIBDataSet;

type
    TfrmMaxRate = class(TForm)
        RateGrid: TcxGrid;
        RateView: TcxGridDBTableView;
        TNColumn: TcxGridDBColumn;
        FIOColumn: TcxGridDBColumn;
        AllRateColumn: TcxGridDBColumn;
        RateSovmColumn: TcxGridDBColumn;
        RateLevel: TcxGridLevel;
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
        RateViewDBColumn1: TcxGridDBColumn;
        Panel1: TPanel;
        OkButton: TBitBtn;
        RateTextDataSource: TDataSource;
        DateColumn: TcxGridDBColumn;
        procedure OkButtonClick(Sender: TObject);
    private
    { Private declarations }
        Id_Order_Rates: Int64;
        Id_Level_Rates: Integer;
        Rates: TpFIBDataSet;
    public
    { Public declarations }
        constructor Create(AOwner: TComponent; Rates: TpFIBDataSet;
            Id_Order_Rates, Id_Level_Rates: Int64); reintroduce;
    end;

{var
  frmMaxRate: TfrmMaxRate; }

implementation

{$R *.dfm}

constructor TfrmMaxRate.Create(AOwner: TComponent;
    Rates: TpFIBDataSet; Id_Order_Rates, Id_Level_Rates: Int64);
begin
    inherited Create(AOwner);
    RateTextDataSource.DataSet := Rates;

    Self.Rates := Rates;

    Self.Id_Order_Rates := Id_Order_Rates;
    Self.Id_Level_Rates := Id_Level_Rates;

    //Rates.AfterScroll := AfterScroll;
   // Rates.First;

end;


procedure TfrmMaxRate.OkButtonClick(Sender: TObject);
begin
    ModalResult := mrYes;
end;

end.
