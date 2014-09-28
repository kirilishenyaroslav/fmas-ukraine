unit UGetDbfDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, cxClasses, StdCtrls, cxButtons, ExtCtrls,
  cxContainer, cxTextEdit, cxMemo, cxDBEdit;

type
  TfrmGetDBFDoc = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxErrorStyle: TcxStyle;
    cxStyleTitle: TcxStyle;
    cxStyleMarked: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGrid5: TcxGrid;
    cxGrid5DBTableView1: TcxGridDBTableView;
    cxGrid5DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid5DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid5Level1: TcxGridLevel;
    cxGrid5DBTableView1DBColumn3: TcxGridDBColumn;
    DBFDocDataSource: TDataSource;
    cxDBMemo1: TcxDBMemo;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UGetDoc;
{$R *.dfm}

procedure TfrmGetDBFDoc.cxButton1Click(Sender: TObject);
begin
      if (DBFDocDataSource.DataSet.RecordCount>0)
      then ModalResult:=mrYes;
end;

procedure TfrmGetDBFDoc.cxButton2Click(Sender: TObject);
begin
      ModalResult:=mrNo;
end;

procedure TfrmGetDBFDoc.FormCreate(Sender: TObject);
begin
      DBFDocDataSource.DataSet:=TfrmDocsInfo(owner).HalcyonDataSet1;
end;

end.
