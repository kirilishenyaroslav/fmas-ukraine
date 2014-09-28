unit UGetFormUch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, FIBDataSet, pFIBDataSet, cxGridTableView, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid;

type
  TffmGetSystem = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
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
    GetSystemDataSet: TpFIBDataSet;
    GetSystemDataSource: TDataSource;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid2DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses dmMain_Book;

{$R *.dfm}

procedure TffmGetSystem.cxButton1Click(Sender: TObject);
begin
     if (GetSystemDataSet.RecordCount>0)
     then ModalResult:=mrYes;
end;

procedure TffmGetSystem.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TffmGetSystem.FormCreate(Sender: TObject);
begin
     GetSystemDataSet.Database:=dmMain_Book.dmMain.MainDatabase;
     GetSystemDataSet.Transaction:=dmMain_Book.dmMain.ReadTransaction;
     GetSystemDataSet.SelectSQL.Text:=' select * from pub_sp_system ';
     GetSystemDataSet.Open;
end;

procedure TffmGetSystem.cxGrid2DBTableView1DblClick(Sender: TObject);
begin
     cxButton1Click(self);
end;

end.
