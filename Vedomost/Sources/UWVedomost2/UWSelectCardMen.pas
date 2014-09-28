unit UWSelectCardMen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, ActnList, cxClasses,
  RxMemDS, Un_r_file_Alex, FIBDatabase, pFIBDatabase, StdCtrls, Buttons,
  ExtCtrls;

type
  TfmSelectCardMen = class(TForm)
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
    DSourceCardMen: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1DB_NUM_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1DB_DATE_DOG: TcxGridDBColumn;
    DSetCardMen: TpFIBDataSet;
    Database: TpFIBDatabase;
    Trans: TpFIBTransaction;
    Panel1: TPanel;
    Label1: TLabel;
    LabelPIB: TLabel;
    BitBtn1: TBitBtn;
    cxGrid1DBTableView1DB_NUM_LIC_ACCAUNT: TcxGridDBColumn;
    cxGrid1DBTableView1DB_DATE_BEG: TcxGridDBColumn;
    cxGrid1DBTableView1DB_DATE_END: TcxGridDBColumn;
    cxGrid1DBTableView1DB_CONTROL_ID: TcxGridDBColumn;
    cxGrid1DBTableView1DB_COMENT: TcxGridDBColumn;
    cxGrid1DBTableView1DB_SHORT_NAME_TYPE_PAYMENT: TcxGridDBColumn;
    DSetActiveCard: TpFIBDataSet;
    procedure ActionCloseExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure LoadCaptions;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ Tfm_j4shablon }

procedure TfmSelectCardMen.LoadCaptions;
begin
end;

procedure TfmSelectCardMen.ActionCloseExecute(Sender: TObject);
begin
    close;
end;

procedure TfmSelectCardMen.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
   ModalResult := mrOk;
end;

procedure TfmSelectCardMen.BitBtn1Click(Sender: TObject);
begin
  Modalresult := mrOk;
end;

end.
