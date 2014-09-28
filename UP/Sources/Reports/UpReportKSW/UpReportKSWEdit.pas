unit UpReportKSWEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, ImgList,
  cxGridTableView, FIBDataSet, pFIBDataSet, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid,UpReportKSWMain, cxTL, cxInplaceContainer,
  cxMaskEdit, cxDBTL, cxTLData;

type
  TfrmReportKSWEdit = class(TForm)
    StatusBar1: TStatusBar;
    pFIBDataSetCreateTree: TpFIBDataSet;
    DataSourceCreate: TDataSource;
    IL_Orders: TImageList;
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
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn4: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn5: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn6: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn7: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn8: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn9: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn10: TcxDBTreeListColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportKSWEdit: TfrmReportKSWEdit;

implementation

{$R *.dfm}

procedure TfrmReportKSWEdit.FormCreate(Sender: TObject);
begin
  pFIBDataSetCreateTree.Database:=TfrmUpReportKSWMain(self.owner).DB;
  pFIBDataSetCreateTree.Transaction:=TfrmUpReportKSWMain(self.owner).ReadTransaction;
  pFIBDataSetCreateTree.Active:=true;
end;


procedure TfrmReportKSWEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TfrmUpReportKSWMain(self.owner).ReadTransaction.Commit;
  TfrmUpReportKSWMain(self.owner).ReadTransaction.Active:=true;
end;

end.
