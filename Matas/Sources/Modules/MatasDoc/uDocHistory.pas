unit uDocHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, ActnList,
  StdCtrls, cxButtons, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, uDocWork, FIBDataSet, pFIBDataSet;

type
  THistoryForm = class(TForm)
    pnl1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxButton1: TcxButton;
    actlst1: TActionList;
    actClose: TAction;
    HistoryDS: TpFIBDataSet;
    ds1: TDataSource;
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
    cxgrdbclmnDOC: TcxGridDBColumn;
    HistoryDSID_TIPD: TFIBIntegerField;
    HistoryDSTIPD: TFIBStringField;
    HistoryDSNAME_TIPD: TFIBStringField;
    HistoryDSKOD_DOC: TFIBSmallIntField;
    HistoryDSNUM_DOC: TFIBStringField;
    HistoryDSDATE_DOC: TFIBDateField;
    HistoryDSOSN_ID_TIPD: TFIBIntegerField;
    HistoryDSOTIPD: TFIBStringField;
    HistoryDSNAME_OSN: TFIBStringField;
    HistoryDSOSN_NUM_DOC: TFIBStringField;
    HistoryDSOSN_DATE_DOC: TFIBDateField;
    HistoryDSID_MO_IN: TFIBIntegerField;
    HistoryDSFIO_MO_IN: TFIBStringField;
    HistoryDSFIO_IN: TFIBStringField;
    HistoryDSNAME_DEP_IN: TFIBStringField;
    HistoryDSID_MO_OUT: TFIBIntegerField;
    HistoryDSFIO_MO_OUT: TFIBStringField;
    HistoryDSFIO_OUT: TFIBStringField;
    HistoryDSNAME_DEP_OUT: TFIBStringField;
    HistoryDSID_CUST: TFIBBCDField;
    HistoryDSNAME_CUSTOMER: TFIBStringField;
    HistoryDSNAME_IN: TFIBStringField;
    HistoryDSNAME_OUT: TFIBStringField;
    HistoryDSSUMMA: TFIBBCDField;
    HistoryDSSUMMA_DOC: TFIBBCDField;
    HistoryDSID_MAN: TFIBIntegerField;
    HistoryDSFIO_MAN: TFIBStringField;
    HistoryDSSFIO_MAN: TFIBStringField;
    HistoryDSDOV_NUM: TFIBStringField;
    HistoryDSDOV_DATE: TFIBDateField;
    HistoryDSDATE_REC: TFIBDateField;
    HistoryDSPUB_ID_DOC: TFIBBCDField;
    HistoryDSNUM_REESTR: TFIBStringField;
    HistoryDSDATE_REESTR: TFIBDateField;
    HistoryDSUSER_NAME: TFIBStringField;
    HistoryDSCOMPUTER: TFIBStringField;
    HistoryDSDATETIME: TFIBDateTimeField;
    HistoryDSDIR_KOMISSIA: TFIBStringField;
    HistoryDSKOMISSIA: TFIBStringField;
    HistoryDSNUM_PRIKAZ_KOMISSIA: TFIBStringField;
    HistoryDSDATE_PRIKAZ_KOMISSIA: TFIBDateField;
    HistoryDSDOC_NOTE: TFIBStringField;
    HistoryDSINV_KART_MODE: TFIBIntegerField;
    HistoryDSMNA_KART_MODE: TFIBIntegerField;
    HistoryDSID_USER: TFIBBCDField;
    HistoryDSUSER_FULL_NAME: TFIBStringField;
    HistoryDSPUB_COMPUTER: TFIBStringField;
    HistoryDSPUB_DATETIME: TFIBDateTimeField;
    HistoryDSSTORNO: TFIBIntegerField;
    HistoryDSR_PUB_ID_DOC: TFIBBCDField;
    HistoryDSTIP_WORK: TFIBIntegerField;
    HistoryDSUSER_ACTION: TFIBStringField;
    cxgrdbclmnNUM_DOC: TcxGridDBColumn;
    cxgrdbclmnMO_OUT: TcxGridDBColumn;
    cxgrdbclmnMO_IN: TcxGridDBColumn;
    cxgrdbclmnSUMMA: TcxGridDBColumn;
    cxgrdbclmnUSER: TcxGridDBColumn;
    cxgrdbclmnACTION: TcxGridDBColumn;
    cxgrdbclmnTime: TcxGridDBColumn;
    procedure actCloseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    id:Integer;
  end;

var
  HistoryForm: THistoryForm;

implementation

{$R *.dfm}

procedure THistoryForm.actCloseExecute(Sender: TObject);
begin
Close;
end;

procedure THistoryForm.FormShow(Sender: TObject);
begin
 HistoryDS.Close;
 HistoryDS.SelectSQL.Clear;
 HistoryDS.SelectSQL.Add('SELECT * from MAT_DT_DOC_HIST_SEL(:ID_DOC)');
 HistoryDS.Prepare;
 HistoryDS.ParamByName('ID_DOC').AsInteger:=id;
 HistoryDS.CloseOpen(False);
end;

end.
