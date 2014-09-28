unit UpItemStru;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit,
    cxInplaceContainer, cxDBTL, StdCtrls, Buttons, ExtCtrls, cxControls,
    cxTLData, DB, FIBDataSet, pFIBDataSet, cxClasses, cxGridTableView,
    cxTextEdit;

type
    TfrmGetItemsStru = class(TForm)
        cxDBTreeList1: TcxDBTreeList;
        Panel1: TPanel;
        OkButton: TBitBtn;
        cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
        cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
        TreeDataSet: TpFIBDataSet;
        TreeDataSource: TDataSource;
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
        cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn;
        cxDBTreeList1cxDBTreeListColumn4: TcxDBTreeListColumn;
        procedure OkButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
        loc_id_order: Int64;
        loc_id_item: Int64;
        constructor Create(Aowner: TComponent; id_order, id_item: Int64); reintroduce;
    end;



implementation

uses UpOrderEdit;

{$R *.dfm}

constructor TfrmGetItemsStru.Create(Aowner: TComponent; id_order, id_item: Int64);
begin
    inherited Create(AOwner);
    loc_id_order := id_order;
    loc_id_item := id_item;
    TreeDataSet.Database := TUpEditOrder(Owner).WorkDatabase;
    TreeDataSet.Transaction := TUpEditOrder(Owner).ReadTransaction;
    TreeDataSet.SelectSQL.Text := 'SELECT * FROM UP_KER_GET_ITEMS_TREE_EX(' + IntToStr(loc_id_order) + ',NULL)';
    TreeDataSet.Open;
end;

procedure TfrmGetItemsStru.OkButtonClick(Sender: TObject);
begin
    ModalResult := mrYes;
end;

end.
