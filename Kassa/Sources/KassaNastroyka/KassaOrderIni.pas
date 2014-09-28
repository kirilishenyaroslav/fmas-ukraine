unit KassaOrderIni;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, FIBDatabase,
  pFIBDatabase, pFIBDataSet, cxGridTableView, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, uKassaSetup, cxCalendar, cxButtonEdit,
  cxDropDownEdit, cxMaskEdit, cxCurrencyEdit, Un_R_file_Alex,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls;

type
  TfmOrderIni = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    StyleRepository: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    DataSet: TpFIBDataSet;
    DataSource1: TDataSource;
    Database: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    DataSetID_SHABLON_ORDER: TFIBIntegerField;
    DataSetSHOW_SHABLON_ORDER: TFIBIntegerField;
    DataSetSHABLON_NOTE: TFIBStringField;
    Panel2: TPanel;
    cxButtonClose: TcxButton;
    cxButton1: TcxButton;
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
      constructor Create(AOwner:TComponent; db : TpFIBDatabase);
  end;


{ TfmOrderIni;  }

implementation

{$R *.dfm}
constructor TfmOrderIni.Create(AOwner:TComponent; db : TpFIBDatabase);
begin
   inherited Create(AOwner);
   Database.Handle                          := DB.Handle;

   DataSet.Close;
   DataSet.SQLs.SelectSQL.Text:='select * from KASSA_INI_ORDER';
   DataSet.Open;

   cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.MY_COLTITL_PR_NUM;
   cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_SELECT_SHABLON_NAME;
   cxButton1.Caption                    := Un_R_file_Alex.CHOOSE_CONST[1];
   cxButtonClose.Caption                := Un_R_file_Alex.CLOSE_VIH[1];
   Caption                              := Un_R_file_Alex.KASSA_PRINT_ORDER_SHABL;
end;

procedure TfmOrderIni.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    ModalResult := mrOK;
end;

end.
