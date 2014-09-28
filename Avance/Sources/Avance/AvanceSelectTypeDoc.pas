unit AvanceSelectTypeDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, ActnList, cxClasses,
  RxMemDS, Un_r_file_Alex, FIBDatabase, pFIBDatabase;

type
  TfmSelectTypeDoc = class(TForm)
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
    DSourceTypeDoc: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1DB_name_type_doc_for_create_av_o: TcxGridDBColumn;
    DSetTypeDoc: TpFIBDataSet;
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

procedure TfmSelectTypeDoc.LoadCaptions;
begin
end;

procedure TfmSelectTypeDoc.ActionCloseExecute(Sender: TObject);
begin
    close;
end;

procedure TfmSelectTypeDoc.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
     ModalResult := mrOk;
end;

end.
