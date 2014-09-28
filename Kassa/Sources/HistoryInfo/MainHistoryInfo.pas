unit MainHistoryInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ComCtrls, ToolWin, ImgList, Un_R_file_Alex, cxContainer, cxLabel,
  cxTextEdit;

type
  TfmMainHistoryInfo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxSplitter1: TcxSplitter;
    Database: TpFIBDatabase;
    DataSetIn: TpFIBDataSet;
    DataSetAll: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    DataSourceIn: TDataSource;
    DataSourceAll: TDataSource;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
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
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ImageList: TImageList;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    DataSetInR_ID_USER: TFIBBCDField;
    DataSetInR_PR_RAS: TFIBStringField;
    DataSetInR_USE_END: TFIBDateTimeField;
    DataSetInR_USE_BEG: TFIBDateTimeField;
    DataSetInR_ID_MAN: TFIBBCDField;
    DataSetInR_ID_ALL_DOC: TFIBBCDField;
    DataSetInR_SUMMA_DOC: TFIBBCDField;
    DataSetInR_ID_OPERATION: TFIBIntegerField;
    DataSetInR_OSNOVANIE: TFIBStringField;
    DataSetInR_FIO: TFIBStringField;
    DataSetInR_ADD_NUMBER_DOC: TFIBSmallIntField;
    DataSetInR_NUMBER_DOC: TFIBBCDField;
    DataSetInR_PRIHOD_RASHOD: TFIBIntegerField;
    DataSetInR_ID_DEL: TFIBBCDField;
    DataSetInR_FIO_USER: TFIBStringField;
    DataSetInR_FIO_USER_DEL: TFIBStringField;
    DataSetInR_PRIZNAK_DEL: TFIBStringField;
    DataSetInR_NUM_DOC: TFIBStringField;
    procedure ToolButton1Click(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure DataSetInAfterScroll(DataSet: TDataSet);
    procedure cxSplitter1AfterOpen(Sender: TObject);
    procedure cxSplitter1AfterClose(Sender: TObject);
  private
    id                       : int64;
    priznak_pr_ras, numb_doc : integer;
    date_doc                 : Tdate;
  public
    constructor Create(AOwner: TComponent; id_us : int64; DB : TpFIBDatabase; id_doc : int64); reintroduce; overload;
  end;

  {TfmMainHistoryInfo;}
function HistoryInfoShow(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_doc : int64):Integer;stdcall;
    exports HistoryInfoShow;

implementation
uses HistoryProvShow ;

{$R *.dfm}
function HistoryInfoShow(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_doc : int64):Integer;
var
    T : TfmMainHistoryInfo;
begin
    T := TfmMainHistoryInfo.Create(AOwner, id_us, DB, id_doc);
    T.ShowModal;
    T.Free;
    result := -1;
end;

constructor TfmMainHistoryInfo.Create(AOwner: TComponent; id_us : int64; DB : TpFIBDatabase; id_doc : int64);
begin
    inherited Create (AOwner);
    Database                        := DB;

    id                              := id_doc;

    Transaction.DefaultDatabase     := Database;
    Database.DefaultTransaction     := Transaction;

    DataSetIn.Transaction           := Transaction;
    DataSetIn.Database              := Database;

    DataSetAll.Transaction          := Transaction;
    DataSetAll.Database             := Database;

    Transaction.StartTransaction;

    ToolButton1.Caption             := Un_R_file_Alex.MY_ACTION_CLOSE_CONST;

    cxGrid1DBTableView1DBColumn1.Caption              := Un_R_file_Alex.KASSA_FIND_NUM_DOC;
    cxGrid1DBTableView1DBColumn3.Caption              := Un_R_file_Alex.KASSA_SUMMA;
    cxGrid1DBTableView1DBColumn4.Caption              := Un_R_file_Alex.INFO_CHANGE_DATE;
    cxGrid1DBTableView1DBColumn5.Caption              := Un_R_file_Alex.INFO_OPERATION;

    cxLabel1.Caption                                  := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;
    cxLabel2.Caption                                  := Un_R_file_Alex.INFO_USER;
    cxLabel3.Caption                                  := Un_R_file_Alex.INFO_USER_DEL;

    //cxSplitter1.CloseSplitter;

    DataSetIn.Close;
    DataSetIn.SQLs.SelectSQL.Text   := 'SELECT * FROM KASSA_SELECT_HISTORY_IN('+IntToStr(id_doc)+')';
    DataSetIn.Open;

    priznak_pr_ras  := DataSetIn.fbn('R_PRIHOD_RASHOD').asInteger;
    numb_doc        := DataSetIn.fbn('R_NUMBER_DOC').asInteger;
    date_doc        := DataSetIn.fbn('R_USE_BEG').AsDateTime;

    if  priznak_pr_ras=1
    then
    begin
        Caption        := Un_R_file_Alex.INFO_HISTORY_DOC+': '+Un_R_file_Alex.KASSA_DOC_ORDER_PRIH_KAS_ORD+inttostr(numb_doc)+' '+Un_R_file_Alex.KASSA_DOC_ORDER_FROM+' '+datetostr(date_doc);
        cxGrid1DBTableView1DBColumn2.Caption              := Un_R_file_Alex.KASSA_DOC_ORDER_PRINYATO;
    end
    else
    begin
        Caption        := Un_R_file_Alex.INFO_HISTORY_DOC+': '+Un_R_file_Alex.KASSA_DOC_ORDER_RASH_KAS_ORD+inttostr(numb_doc)+' '+Un_R_file_Alex.KASSA_DOC_ORDER_FROM+' '+datetostr(date_doc);;
        cxGrid1DBTableView1DBColumn2.Caption              := Un_R_file_Alex.KASSA_DOC_ORDER_VIDANO;
    end;
    cxGrid1.Height             := 300;
    cxLabel1.Top               := 308;
    cxLabel4.Top               := 308;
    cxLabel2.Top               := 332;
    cxLabel5.Top               := 332;
    cxLabel3.Top               := 356;
    cxLabel6.Top               := 356;
    cxSplitter1.CloseSplitter;
end;


procedure TfmMainHistoryInfo.ToolButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfmMainHistoryInfo.cxGrid1DBTableView1DblClick(Sender: TObject);
var
    T: TfmHistoryProvShow;
begin
    T  := TfmHistoryProvShow.Create(Self, Database, id, priznak_pr_ras, Self);
    T.ShowModal;
    T.Free;
end;

procedure TfmMainHistoryInfo.DataSetInAfterScroll(DataSet: TDataSet);
begin
   if not VarIsNull(DataSetIn['R_OSNOVANIE']) then
        cxLabel4.Caption                                  := DataSetIn.fbn('R_OSNOVANIE').asString
    else
        cxLabel4.Caption                                  := '';
    if not VarIsNull(DataSetIn['R_FIO_USER']) then
        cxLabel5.Caption                                  := DataSetIn.fbn('R_FIO_USER').asString
    else
        cxLabel5.Caption                                  := '';
    if not VarIsNull(DataSetIn['R_FIO_USER_DEL']) then
        cxLabel6.Caption                                  := DataSetIn.fbn('R_FIO_USER_DEL').asString
    else
        cxLabel6.Caption                                  := '';
end;



procedure TfmMainHistoryInfo.cxSplitter1AfterOpen(Sender: TObject);
begin
    cxGrid1.Height :=136;
    cxLabel1.Top   := 144;
    cxLabel4.Top   := 144;
    cxLabel2.Top   := 168;
    cxLabel5.Top   := 168;
    cxLabel3.Top   := 192;
    cxLabel6.Top   := 192;
end;

procedure TfmMainHistoryInfo.cxSplitter1AfterClose(Sender: TObject);
begin
    cxGrid1.Height := 300;
    cxLabel1.Top   := 308;
    cxLabel4.Top   := 308;
    cxLabel2.Top   := 332;
    cxLabel5.Top   := 332;
    cxLabel3.Top   := 356;
    cxLabel6.Top   := 356;
end;

end.
