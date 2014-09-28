unit UWSelectTypeVedom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, ActnList, cxClasses,
  RxMemDS, Un_r_file_Alex, FIBDatabase, pFIBDatabase;

type
  TfmSelectTypeVedom = class(TForm)
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
    ActionList1: TActionList;
    ActionClose: TAction;
    ActionTake: TAction;
    ActionShowmes: TAction;
    DataSource: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1DB_NAME_TYPE_VEDOMOST: TcxGridDBColumn;
    cxGrid1DBTableView1DB_ID_TYPE_VEDOMOST: TcxGridDBColumn;
    DSetTypeVed: TpFIBDataSet;
    Database: TpFIBDatabase;
    Trans: TpFIBTransaction;
    procedure ActionCloseExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    procedure LoadCaptions;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ Tfm_j4shablon }

procedure TfmSelectTypeVedom.LoadCaptions;
begin
end;

procedure TfmSelectTypeVedom.ActionCloseExecute(Sender: TObject);
begin
    close;
end;

procedure TfmSelectTypeVedom.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
     ModalResult := mrOk;
end;

end.
