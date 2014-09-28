unit uMnaHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet,
  pFIBDataSet, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, ActnList,
  StdCtrls, cxButtons, ExtCtrls, uMatasMnaMain, cxContainer, cxTextEdit,
  cxDBEdit;

type
  THistoryForm = class(TForm)
    pnl1: TPanel;
    cxButton1: TcxButton;
    actlst1: TActionList;
    actClose: TAction;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxgrdbclmnSCH: TcxGridDBColumn;
    HistoryDS: TpFIBDataSet;
    ds1: TDataSource;
    HistoryDSID_MNA_KART: TFIBBCDField;
    HistoryDSTIP_MNA_KART: TFIBIntegerField;
    HistoryDSID_MO: TFIBBCDField;
    HistoryDSFIO: TFIBStringField;
    HistoryDSSFIO: TFIBStringField;
    HistoryDSID_SPODR: TFIBIntegerField;
    HistoryDSNAME_DEPARTMENT: TFIBStringField;
    HistoryDSIS_SKLAD: TFIBSmallIntField;
    HistoryDSBAL_ID_SCH: TFIBBCDField;
    HistoryDSBAL_SCH_NUMBER: TFIBStringField;
    HistoryDSBAL_SCH_TITLE: TFIBStringField;
    HistoryDSID_SCH: TFIBBCDField;
    HistoryDSSCH_NUMBER: TFIBStringField;
    HistoryDSSCH_TITLE: TFIBStringField;
    HistoryDSNNUM: TFIBIntegerField;
    HistoryDSGNUM: TFIBSmallIntField;
    HistoryDSINUM: TFIBIntegerField;
    HistoryDSID_NOMN: TFIBBCDField;
    HistoryDSNOMN: TFIBStringField;
    HistoryDSNAME: TFIBStringField;
    HistoryDSID_OST: TFIBBCDField;
    HistoryDSID_UNIT: TFIBBCDField;
    HistoryDSUNIT: TFIBStringField;
    HistoryDSPRICE: TFIBBCDField;
    HistoryDSKOL_MAT: TFIBBCDField;
    HistoryDSSUMMA: TFIBBCDField;
    HistoryDSSUMMA_OST: TFIBBCDField;
    HistoryDSDATE_OST: TFIBDateField;
    HistoryDSSUMMA_AMORT: TFIBBCDField;
    HistoryDSDATE_OPR: TFIBDateField;
    HistoryDSID_OPER_OPR: TFIBBCDField;
    HistoryDSDATE_EXPL: TFIBDateField;
    HistoryDSID_OPER_EXPL: TFIBBCDField;
    HistoryDSDATE_OUT: TFIBDateField;
    HistoryDSID_OPER_OUT: TFIBBCDField;
    HistoryDSYEAR_EXPL: TFIBIntegerField;
    HistoryDSMONTH_EXPL: TFIBIntegerField;
    HistoryDSDATE_CREATE: TFIBDateField;
    HistoryDSMODEL: TFIBStringField;
    HistoryDSMARKA: TFIBStringField;
    HistoryDSZAVNUM: TFIBStringField;
    HistoryDSPASSNUM: TFIBStringField;
    HistoryDSNOTE: TFIBStringField;
    HistoryDSIS_AMORT: TFIBIntegerField;
    HistoryDSAMOR_METHOD: TFIBIntegerField;
    HistoryDSAMORT_PERCENT: TFIBFloatField;
    HistoryDSDB_ID_SCH_AMORT: TFIBBCDField;
    HistoryDSDB_ID_SM_AMORT: TFIBBCDField;
    HistoryDSDB_ID_RZ_AMORT: TFIBBCDField;
    HistoryDSDB_ID_ST_AMORT: TFIBBCDField;
    HistoryDSDB_ID_KEKV_AMORT: TFIBBCDField;
    HistoryDSKR_ID_SCH_AMORT: TFIBBCDField;
    HistoryDSKR_ID_SM_AMORT: TFIBBCDField;
    HistoryDSKR_ID_RZ_AMORT: TFIBBCDField;
    HistoryDSKR_ID_ST_AMORT: TFIBBCDField;
    HistoryDSKR_ID_KEKV_AMORT: TFIBBCDField;
    HistoryDSINV_NUM_FULL: TFIBStringField;
    HistoryDSNNUM_EXT: TFIBStringField;
    HistoryDSNNUM_FULL: TFIBStringField;
    HistoryDSOST_INFO: TFIBStringField;
    cxgrdbclmnFIO: TcxGridDBColumn;
    cxgrdbclmnPIDR: TcxGridDBColumn;
    cxgrdbclmnNomN: TcxGridDBColumn;
    cxgrdbclmnInvN: TcxGridDBColumn;
    cxgrdbclmnName: TcxGridDBColumn;
    cxgrdbclmnKol: TcxGridDBColumn;
    cxgrdbclmnSum: TcxGridDBColumn;
    cxgrdbclmnDateTime: TcxGridDBColumn;
    HistoryDSDATETIME: TFIBDateTimeField;
    HistoryDSUSER_ACTION: TFIBStringField;
    cxgrdbclmnAction: TcxGridDBColumn;
    pnl2: TPanel;
    lbl1: TLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    lbl2: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    lbl5: TLabel;
    HistoryDSNAME_USER: TFIBStringField;
    cxgrdbclmnUSER: TcxGridDBColumn;
    cxDBTextEdit2: TcxDBTextEdit;
    lbl6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
  private
    { Private declarations }
  public
    id: Integer;
  end;

var
  HistoryForm: THistoryForm;

implementation

{$R *.dfm}

procedure THistoryForm.FormShow(Sender: TObject);
begin
 HistoryDS.Close;
 HistoryDS.SelectSQL.Clear;
 HistoryDS.SelectSQL.Add('SELECT * FROM MAT_DT_MNA_KART_HIST_SEL(:ID_KART)');
 HistoryDS.Prepare;
 HistoryDS.ParamByName('ID_KART').AsInteger:=id;
 HistoryDS.CloseOpen(False);
end;

procedure THistoryForm.actCloseExecute(Sender: TObject);
begin
 Close;
end;

end.
