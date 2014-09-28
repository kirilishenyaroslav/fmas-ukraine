unit UpPochasChangeManInfo;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxMemo, cxContainer, cxTextEdit,
    cxDBEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
    cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, dxBar,
    dxBarExtItems, ImgList, ExtCtrls, UpPochasChangeMain, FIBDatabase,
    pFIBDatabase, FIBDataSet, pFIBDataSet;

type
    TfrmPochasMan = class(TForm)
        Panel1: TPanel;
        IL_OrdAcc: TImageList;
        dxBarManager1: TdxBarManager;
        dxRefreshBtn: TdxBarLargeButton;
        dxSelectBtn: TdxBarLargeButton;
        dxCloseBtn: TdxBarLargeButton;
        cxGrid1DBTableView1: TcxGridDBTableView;
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
        colId_Department: TcxGridDBColumn;
        colName_Department: TcxGridDBColumn;
        colDate_Beg: TcxGridDBColumn;
        colDate_End: TcxGridDBColumn;
        colId_Pochas_Type: TcxGridDBColumn;
        colPochas_Type: TcxGridDBColumn;
        colHours: TcxGridDBColumn;
        colId_Type_Tarif: TcxGridDBColumn;
        colNum_Order: TcxGridDBColumn;
        colDate_Order: TcxGridDBColumn;
        colNum_Project: TcxGridDBColumn;
        colDate_Project: TcxGridDBColumn;
        Panel2: TPanel;
        cxDBMemo1: TcxDBMemo;
        DSPochasMan: TpFIBDataSet;
        ReadTr: TpFIBTransaction;
        DSourcePochasMan: TDataSource;
        procedure dxSelectBtnClick(Sender: TObject);
        procedure dxRefreshBtnClick(Sender: TObject);
        procedure dxCloseBtnClick(Sender: TObject);
        procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    frmPochasMan: TfrmPochasMan;

implementation

{$R *.dfm}

procedure TfrmPochasMan.dxSelectBtnClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfrmPochasMan.dxRefreshBtnClick(Sender: TObject);
begin
    DSPochasMan.Close;
    DSPochasMan.Open;
end;

procedure TfrmPochasMan.dxCloseBtnClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TfrmPochasMan.cxGrid1DBTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_RETURN) then
        ModalResult := mrOk;
end;

end.
