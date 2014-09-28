Unit UHolidayOrderShowErrors;

Interface

Uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, cxStyles, cxCustomData, cxGraphics, cxFilter,
    cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
    cxGridCustomView, cxGrid, ExtCtrls, cxClasses, RxMemDS;

Type
    TfrmGetErrors = Class(TForm)
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
        cxGridDBTableView1: TcxGridDBTableView;
        cxGridDBColumn1: TcxGridDBColumn;
        cxGridLevel1: TcxGridLevel;
        ErrorTextsMemoryData: TRxMemoryData;
        ErrorTextDataSource: TDataSource;
        cxGridDBTableView1DBColumn1: TcxGridDBColumn;
        Procedure OkButtonClick(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    End;



Implementation

{$R *.dfm}

Procedure TfrmGetErrors.OkButtonClick(Sender: TObject);
Begin
    ModalResult := mrYes;
End;

End.
