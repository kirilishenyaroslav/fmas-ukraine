unit UDependOrders;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
    cxGridCustomView, cxGrid, StdCtrls, Buttons, ExtCtrls, RxMemDS, cxClasses;

type
    TfrmDependOList = class(TForm)
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
        DependTextsMemoryData: TRxMemoryData;
        ErrorTextDataSource: TDataSource;
        Panel1: TPanel;
        OkButton: TBitBtn;
        cxGrid1: TcxGrid;
        cxGridDBTableView1: TcxGridDBTableView;
        cxGridDBTableView1DBColumn1: TcxGridDBColumn;
        cxGridDBColumn1: TcxGridDBColumn;
        cxGridLevel1: TcxGridLevel;
        cxGridDBTableView1DBColumn2: TcxGridDBColumn;
        cxGridDBTableView1DBColumn3: TcxGridDBColumn;
        cxGridDBTableView1DBColumn4: TcxGridDBColumn;
        procedure OkButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    frmDependOList: TfrmDependOList;

implementation

{$R *.dfm}

procedure TfrmDependOList.OkButtonClick(Sender: TObject);
begin
    ModalResult := mrYes;
end;

end.
