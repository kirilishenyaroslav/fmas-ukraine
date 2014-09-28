unit ResultNeobrabot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, dxBar, dxBarExtItems, cxGraphics, cxControls,
  dxStatusBar, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, cxImage, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomView, cxGrid, cxClasses, ActnList,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, cxMemo, cxContainer,
  cxLabel, ExtCtrls, StdCtrls;

type
  TfmResultNeobrabot = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarStatic1: TdxBarStatic;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarLargeButton13: TdxBarLargeButton;
    ImageList: TImageList;
    dxStatusBar1: TdxStatusBar;
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
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    ActionList1: TActionList;
    ActionFilter: TAction;
    ActionRefresh: TAction;
    ActionClose: TAction;
    pFIBDataSet1: TpFIBDataSet;
    Database: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    DataSource1: TDataSource;
    pFIBDataSet1R_DATE_DOC: TFIBDateField;
    pFIBDataSet1R_NUM_DOC: TFIBStringField;
    pFIBDataSet1R_NAME_CUST: TFIBStringField;
    pFIBDataSet1R_PRIHOD: TFIBBCDField;
    pFIBDataSet1R_RASHOD: TFIBBCDField;
    pFIBDataSet1R_NOTE: TFIBStringField;
    pFIBDataSet1R_NAME_RAS_CUST: TFIBStringField;
    pFIBDataSet1R_MFO_CUST: TFIBStringField;
    pFIBDataSet1R_NAME_MFO_CUST: TFIBStringField;
    pFIBDataSet1R_OKPO_CUST: TFIBStringField;
    Panel2: TPanel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxLabel24: TcxMemo;
    GroupBox2: TGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxTextEdit;
    procedure ActionCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionFilterExecute(Sender: TObject);
    procedure pFIBDataSet1AfterScroll(DataSet: TDataSet);
  private
    date1, date2 : TDate;
    priznak : integer;
    id_sv : int64;
  public
    constructor Create(AOwner: TComponent; d1, d2 : TDate; pr : integer; id_us : int64; DB : TpFIBDatabase; id_szyazka : int64; rs, name_rs, sch, name_sch : string); reintroduce; overload;
  end;

function ShowNeobrobotBank(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_szyazka : int64; rs, name_rs, sch, name_sch : string):integer;stdcall;
exports ShowNeobrobotBank;

implementation
uses FilterNeobrabot, Un_R_file_Alex;
{$R *.dfm}

function ShowNeobrobotBank(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_szyazka : int64; rs, name_rs, sch, name_sch : string):integer;stdcall;
var
    T : TfmResultNeobrabot;
    d1, d2 : TDate;
    p : integer;
begin
    d2 := date;
    d1 := strToDate('01.'+copy(DateToStr(d2), 4, 7));
    if ShowFilterBankNeobr(d1, d2, p) then
    begin
        T := TfmResultNeobrabot.Create(AOwner, d1, d2, p, id_us, DB,id_szyazka, rs, name_rs, sch, name_sch);
        T.FormStyle := fsMdiChild;
    end;
end;

procedure TfmResultNeobrabot.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

constructor TfmResultNeobrabot.Create(AOwner: TComponent; d1, d2: TDate; pr: integer; id_us : int64; DB : TpFIBDatabase; id_szyazka : int64; rs, name_rs, sch, name_sch : string);
begin
    inherited Create (AOwner);
    Database                    := DB;
    Transaction.DefaultDatabase := Database;
    Database.DefaultTransaction := Transaction;
    pFIBDataSet1.Database       := Database;
    pFIBDataSet1.Transaction    := Transaction;
    Transaction.StartTransaction;
    date1   := d1;
    date2   := d2;
    priznak := pr;
    id_sv   := id_szyazka;

    cxGrid1DBBandedTableView1.Bands.Items[0].Caption  := Un_R_file_Alex.BANK_REK_DOCUMENT;
    cxGrid1DBBandedTableView1.Bands.Items[1].Caption  := Un_R_file_Alex.KASSA_SUMMA;
    cxGrid1DBBandedTableView1DBBandedColumn1.Caption  := Un_R_file_Alex.BANK_NUM_DOCUMENT;
    cxGrid1DBBandedTableView1DBBandedColumn2.Caption  := Un_R_file_Alex.BANK_DATE_DOCUMENT;
    cxGrid1DBBandedTableView1DBBandedColumn3.Caption  := Un_R_file_Alex.BANK_NAME_CUSTMERA;
    cxGrid1DBBandedTableView1DBBandedColumn4.Caption  := Un_R_file_Alex.KASSA_DOC_PRIHOD;
    cxGrid1DBBandedTableView1DBBandedColumn5.Caption  := Un_R_file_Alex.KASSA_DOC_RASHOD;

    dxStatusBar1.Panels[0].Text                  := 'F8 - ' + Un_R_file_Alex.MY_BUTTON_FILTER;
    dxStatusBar1.Panels[1].Text                  := 'F5 - '  + Un_R_file_Alex.MY_BUTTON_REFRESH;
    dxStatusBar1.Panels[2].Text                  := 'Esc - ' + Un_R_file_Alex.MY_BUTTON_CLOSE;

    ActionFilter.caption    := Un_R_file_Alex.MY_BUTTON_FILTER;
    ActionRefresh.caption   := Un_R_file_Alex.MY_BUTTON_REFRESH;
    ActionClose.caption     := Un_R_file_Alex.MY_BUTTON_CLOSE;

    GroupBox2.Caption              := Un_R_file_Alex.BANK_RECVIZ;
    cxLabel1.Caption               := Un_R_file_Alex.BANK_DAY_SHOW_SCH_BALL;
    cxLabel3.Caption               := Un_R_file_Alex.BANK_DAY_SHOW_SCH_NAME_BALL;
//    cxLabel5.Caption               := Un_R_file_Alex.BANK_BANK;
    cxLabel13.Caption              := Un_R_file_Alex.bank_rekv_cust;
    cxLabel15.Caption              := Un_R_file_Alex.BANK_NAZVANIE;
    cxLabel17.Caption              := Un_R_file_Alex.BANK_R_S;
    cxLabel19.Caption              := Un_R_file_Alex.BANK_MFO;
    cxLabel21.Caption              := Un_R_file_Alex.BANK_BANK;
    cxLabel23.Caption              := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;

    cxLabel2.Text                  := rs;
    cxLabel4.text                  := name_rs;


    pFIBDataSet1.Close;
    pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * from BANK_SELECT_NEONRABOTANNIE_DOCS('+IntToStr(id_szyazka)+', '''+DateToStr(d1)+''', '''+DateToStr(d2)+''', '+IntToStr(pr)+')';
    pFIBDataSet1.Open;
end;

procedure TfmResultNeobrabot.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle=fsMDIChild then Action := CaFree;
end;

procedure TfmResultNeobrabot.ActionRefreshExecute(Sender: TObject);
begin
    pFIBDataSet1.CloseOpen(false);
end;

procedure TfmResultNeobrabot.ActionFilterExecute(Sender: TObject);
begin
    if ShowFilterBankNeobr(date1, date2, priznak) then
    begin
        pFIBDataSet1.Close;
        pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * from BANK_SELECT_NEONRABOTANNIE_DOCS('+IntToStr(id_sv)+', '''+DateToStr(date1)+''', '''+DateToStr(date2)+''', '+IntToStr(priznak)+')';
        pFIBDataSet1.Open;
    end;
end;

procedure TfmResultNeobrabot.pFIBDataSet1AfterScroll(DataSet: TDataSet);
begin
    if pFIBDataSet1['R_OKPO_CUST'] <> null      then cxLabel14.Caption := pFIBDataSet1['R_OKPO_CUST']      else cxLabel14.Caption := '';
    if pFIBDataSet1['R_NAME_CUST'] <> null      then cxLabel16.Caption := pFIBDataSet1['R_NAME_CUST']      else cxLabel16.Caption := '';
    if pFIBDataSet1['R_NAME_RAS_CUST'] <> null  then cxLabel18.Caption := pFIBDataSet1['R_NAME_RAS_CUST']  else cxLabel18.Caption := '';
    if pFIBDataSet1['R_MFO_CUST'] <> null       then cxLabel20.Caption := pFIBDataSet1['R_MFO_CUST']       else cxLabel20.Caption := '';
    if pFIBDataSet1['R_NAME_MFO_CUST'] <> null  then cxLabel22.Caption := pFIBDataSet1['R_NAME_MFO_CUST']  else cxLabel22.Caption := '';
    if pFIBDataSet1['R_NOTE'] <> null           then cxLabel24.Text    := pFIBDataSet1['R_NOTE']           else cxLabel24.Text    := '';
end;

end.
