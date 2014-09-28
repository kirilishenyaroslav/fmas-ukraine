unit HistoryProvShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ComCtrls, ToolWin, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, ImgList, Un_R_file_Alex, cxContainer, cxLabel,
  cxDropDownEdit, cxCalendar, cxMemo, cxMaskEdit, cxMRUEdit, cxTextEdit,
  ExtCtrls, cxSplitter, MainHistoryInfo;

type
  TfmHistoryProvShow = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Database: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    Transaction: TpFIBTransaction;
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
    ImageList: TImageList;
    DataSource: TDataSource;
    DataSetR_FIO_USER_DEL: TFIBStringField;
    DataSetR_PRIZNAK_DEL: TFIBStringField;
    DataSetSUMMA: TFIBBCDField;
    DataSetID_SM: TFIBBCDField;
    DataSetID_DEL: TFIBBCDField;
    DataSetUSE_END: TFIBDateTimeField;
    DataSetUSE_BEG: TFIBDateTimeField;
    DataSetID_USER: TFIBBCDField;
    DataSetID_RAZD: TFIBBCDField;
    DataSetID_ST: TFIBBCDField;
    DataSetID_KEKV: TFIBBCDField;
    DataSetID_DOG: TFIBBCDField;
    DataSetKOD_DOG: TFIBBCDField;
    DataSetID_MAN: TFIBBCDField;
    DataSetID_SCH: TFIBBCDField;
    DataSetSUMMA_VALUE: TFIBBCDField;
    DataSetID_VALUE: TFIBBCDField;
    DataSetSMETA_KOD: TFIBIntegerField;
    DataSetRAZD_NUM: TFIBIntegerField;
    DataSetKEKV_KOD: TFIBIntegerField;
    DataSetFIO_MAN: TFIBStringField;
    DataSetSCH_NUMBER: TFIBStringField;
    DataSetSTAT_KOD: TFIBIntegerField;
    DataSetID_KASS_SH: TFIBBCDField;
    DataSetSCH_KASS_NUMBER: TFIBStringField;
    DataSetTITLE_SMETA: TFIBStringField;
    DataSetTITLE_RAZD: TFIBStringField;
    DataSetTITLE_STATE: TFIBStringField;
    DataSetTITLE_KEKV: TFIBStringField;
    DataSetDATE_DOG: TFIBDateField;
    DataSetNAME_CUST: TFIBStringField;
    DataSetTITLE_SCH: TFIBStringField;
    DataSetTITLE_KOR_SCH: TFIBStringField;
    DataSetTYPE_DOG: TFIBStringField;
    DataSetREG_DOG: TFIBStringField;
    DataSetNUM_DOG: TFIBStringField;
    DataSetTIN: TFIBStringField;
    DataSetBIRTHDAY: TFIBDateField;
    DataSetR_FIO_USER: TFIBStringField;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cxTextEditNum: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxTextEditAddNum: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxMemo1: TcxMemo;
    cxLabel7: TcxLabel;
    DateTimePicker1: TDateTimePicker;
    cxDateEdit2: TcxDateEdit;
    cxLabel13: TcxLabel;
    cxTextEditSumma: TcxTextEdit;
    cxLabel14: TcxLabel;
    cxTextEdit5: TcxTextEdit;
    cxTextEdit6: TcxTextEdit;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    Panel1: TPanel;
    cxSplitter1: TcxSplitter;
    cxTextEdit7: TcxTextEdit;
    Panel2: TPanel;
    cxLabel15: TcxLabel;
    cxTextEdit4: TcxTextEdit;
    cxLabel16: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxLabel17: TcxLabel;
    cxTextEdit2: TcxTextEdit;
    cxLabel18: TcxLabel;
    cxTextEdit3: TcxTextEdit;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel19: TcxLabel;
    DataSetSM_R_ST_KEKV: TFIBStringField;
    cxLabel8: TcxLabel;
    cxTextEdit8: TcxTextEdit;
    procedure ToolButton1Click(Sender: TObject);
    procedure cxTextEditNumKeyPress(Sender: TObject; var Key: Char);
    procedure DataSetAfterScroll(DataSet: TDataSet);
    procedure cxSplitter1AfterOpen(Sender: TObject);
    procedure cxSplitter1AfterClose(Sender: TObject);
  private
    id_doc : int64;
    mformhistory  : TfmMainHistoryInfo;
  public
    constructor Create(AOwner: TComponent; DB : TpFIBDatabase; id : int64; priznak_pr_ras : integer; mform : TfmMainHistoryInfo); reintroduce; overload;
  end;


  {TfmHistoryProvShow;}

implementation

{$R *.dfm}


constructor TfmHistoryProvShow.Create(AOwner: TComponent;  DB : TpFIBDatabase; id : int64; priznak_pr_ras : integer; mform : TfmMainHistoryInfo);
begin
    inherited Create (AOwner);
    DecimalSeparator                := ',';

    mformHistory                    := mform;
    id_doc                          := id;
    Database                        := DB;
    Transaction.DefaultDatabase     := Database;
    Database.DefaultTransaction     := Transaction;

    DataSet.Transaction             := Transaction;
    DataSet.Database                := Database;

    Caption                         := Un_R_file_Alex.INFO_HISTORY_DOC_PROV;
    ToolButton1.Caption             := Un_R_file_Alex.MY_ACTION_CLOSE_CONST;

    cxGrid1DBTableView1DBColumn1.Caption              := Un_R_file_Alex.KASSA_CLOSE_NUMBER_SCH;
    cxGrid1DBTableView1DBColumn2.Caption              := Un_R_file_Alex.KASSA_SCH_KORESPOND ;
    cxGrid1DBTableView1DBColumn3.Caption              := Un_R_file_Alex.KASSA_KOD_S_R_S_K;
    cxGrid1DBTableView1DBColumn4.Caption              := Un_R_file_Alex.KASSA_SMETA;
    cxGrid1DBTableView1DBColumn5.Caption              := Un_R_file_Alex.KASSA_SUMMA;
    cxGrid1DBTableView1DBColumn6.Caption              := Un_R_file_Alex.INFO_CHANGE_DATE;

    Transaction.StartTransaction;

    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_HISTORY_PROV_IN('+IntToStr(id_doc) + ', '+IntToStr(priznak_pr_ras)+')';
    DataSet.Open;

    if  priznak_pr_ras=1
    then
    begin
        cxLabel1.Caption   := Un_R_file_Alex.KASSA_DOC_ORDER_PRIH_KAS_ORD;
        cxLabel6.Caption   := Un_R_file_Alex.KASSA_DOC_ORDER_PRINYATO;
    end
    else
    begin
        cxLabel1.Caption   := Un_R_file_Alex.KASSA_DOC_ORDER_RASH_KAS_ORD;
        cxLabel6.Caption   := Un_R_file_Alex.KASSA_DOC_ORDER_VIDANO;
    end;

    cxLabel3.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_FROM;
    cxLabel13.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_FROM;
    cxLabel7.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;
    cxLabel8.Caption  := Un_R_file_Alex.KASSA_SCH_KASSA;
    cxLabel9.Caption  := Un_R_file_Alex.INFO_USER;
    cxLabel10.Caption := Un_R_file_Alex.INFO_USER_DEL;
    cxLabel15.Caption := Un_R_file_Alex.KOR_SCH_SHORT;
    cxLabel14.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_SUMMA_ALL;
    cxLabel16.Caption := Un_R_file_Alex.KASSA_RAZD;
    cxLabel17.Caption := Un_R_file_Alex.KASSA_STAT;
    cxLabel18.Caption := Un_R_file_Alex.KASSA_KEKV;
    
    cxTextEditNum.Text         := mformHistory.DataSetIn['R_NUMBER_DOC'];
    if  mformHistory.DataSetIn['R_ADD_NUMBER_DOC']<>'0' then
        cxTextEditAddNum.Text      := mformHistory.DataSetIn['R_ADD_NUMBER_DOC'];
        
    DateTimePicker1.Date       := mformHistory.DataSetIn['R_USE_BEG'];
    cxDateEdit2.Date           := mformHistory.DataSetIn['R_USE_BEG'];
    cxMemo1.Text               := mformHistory.DataSetIn['R_OSNOVANIE'];
    cxTextEdit7.Text           := mformHistory.DataSetIn['R_FIO'];
    cxTextEditSumma.Text       := mformHistory.DataSetIn['R_SUMMA_DOC'];

    cxGrid1.Height             := 300;
    cxSplitter1.CloseSplitter;
end;

procedure TfmHistoryProvShow.ToolButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfmHistoryProvShow.cxTextEditNumKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

procedure TfmHistoryProvShow.DataSetAfterScroll(DataSet: TDataSet);
begin
    cxTextEdit1.Text           := DataSet['TITLE_RAZD'];
    cxTextEdit2.Text           := DataSet['TITLE_STATE'];
    cxTextEdit3.Text           := DataSet['TITLE_KEKV'];
    cxTextEdit4.Text           := DataSet['TITLE_SCH'];
    cxTextEdit8.Text           := DataSet['TITLE_KOR_SCH'];

    //if not VarIsNull(DataSetIn['R_OSNOVANIE']) then
        //cxLabel4.Caption                                  := DataSetIn.fbn('R_OSNOVANIE').asString
    //else
        //cxLabel4.Caption                                  := '';
    if not VarIsNull(DataSet['R_FIO_USER']) then
        cxLabel12.Caption                                  := DataSet['R_FIO_USER']
    else
        cxLabel12.Caption                                  := '';
    if not VarIsNull(DataSet['R_FIO_USER_DEL']) then
        cxLabel19.Caption                                  := DataSet['R_FIO_USER_DEL']
    else
        cxLabel19.Caption                                  := '';
end;

procedure TfmHistoryProvShow.cxSplitter1AfterOpen(Sender: TObject);
begin
    cxGrid1.Height :=163;
end;

procedure TfmHistoryProvShow.cxSplitter1AfterClose(Sender: TObject);
begin
    cxGrid1.Height :=300;
end;

end.
