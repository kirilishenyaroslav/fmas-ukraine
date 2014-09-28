unit USmetHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxTextEdit, cxCheckBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet;

type
  TfrmGetHistory = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxGrid4: TcxGrid;
    SmView: TcxGridDBTableView;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    SmViewDBColumn1: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    SmViewDBColumn2: TcxGridDBColumn;
    SmetaHistoryDS: TpFIBDataSet;
    HistoryDataSource: TDataSource;
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

uses USprSmeta;

{$R *.dfm}

procedure TfrmGetHistory.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmGetHistory.FormCreate(Sender: TObject);
begin
     SmetaHistoryDS.Database      :=TfrmSmetaSpr(Owner).WorkDatabase;
     SmetaHistoryDS.Transaction   :=TfrmSmetaSpr(Owner).ReadTransaction;
     SmetaHistoryDS.SelectSQL.Text:='SELECT * FROM PUB_SPR_SMETA_HISTORY WHERE ID_SMETA='+TfrmSmetaSpr(Owner).SmetaDataSet.FieldByName('P_ID_SMETA').AsString+
     'ORDER BY ID_REC ASC';
     SmetaHistoryDS.Open;
end;

end.
