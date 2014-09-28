unit uOrdersNotInZP;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
    cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
    cxGridDBTableView, cxGrid, ExtCtrls, StdCtrls, Buttons;

type
    TfmOrdersNotInZP = class(TForm)
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
        Panel1: TPanel;
        Label1: TLabel;
        CancelButton: TSpeedButton;
        procedure CancelButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
        constructor Create(AOwner: TComponent; Source: TDataSource); reintroduce;
    end;

var
    fmOrdersNotInZP: TfmOrdersNotInZP;

implementation

{$R *.dfm}

constructor TfmOrdersNotInZP.Create(AOwner: TComponent; Source: TDataSource);
begin
    inherited Create(AOwner);

    TableView.DataController.DataSource := Source;
    TableView.DataController.CreateAllItems;
end;

procedure TfmOrdersNotInZP.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

end.
