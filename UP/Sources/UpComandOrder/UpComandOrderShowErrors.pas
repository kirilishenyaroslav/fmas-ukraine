unit UpComandOrderShowErrors;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, RxMemDS,
    cxGridTableView, StdCtrls, Buttons, ExtCtrls, cxGridLevel,
    cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
    cxGridCustomView, cxGrid;

type
    TfrmGetErrors = class(TForm)
        cxGrid1: TcxGrid;
        cxGridDBTableView1: TcxGridDBTableView;
        cxGridDBTableView1DBColumn1: TcxGridDBColumn;
        cxGridDBColumn1: TcxGridDBColumn;
        cxGridLevel1: TcxGridLevel;
        Panel1: TPanel;
        OkButton: TBitBtn;
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
        ErrorTextsMemoryData: TRxMemoryData;
        ErrorTextDataSource: TDataSource;
        procedure OkButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    frmGetErrors: TfrmGetErrors;

implementation

{$R *.dfm}

procedure TfrmGetErrors.OkButtonClick(Sender: TObject);
begin
    ModalResult := MrYes;
end;

end.
