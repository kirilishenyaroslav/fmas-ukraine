unit uHistoryNom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDataSet,
  pFIBDataSet, cxGridTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridDBTableView, cxGrid,
  StdCtrls, cxButtons, cxContainer, cxTextEdit, ExtCtrls, ibase, cxSplitter,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxCheckBox, DateUtils;

type
  THistoryNomForm = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    cxName: TcxTextEdit;
    cxShow: TcxButton;
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
    ds1: TDataSource;
    DB_History: TpFIBDatabase;
    DS_History: TpFIBDataSet;
    SP_History: TpFIBStoredProc;
    TR_History: TpFIBTransaction;
    cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    DS_Pos: TpFIBDataSet;
    ds2: TDataSource;
    cxgrdbclmnName: TcxGridDBColumn;
    cxgrdbclmnKOL: TcxGridDBColumn;
    cxgrdbclmnSumma: TcxGridDBColumn;
    cxgrdbclmnSCH: TcxGridDBColumn;
    cxSplitter1: TcxSplitter;
    Period: TcxCheckBox;
    cxFilterDateBeg: TcxDateEdit;
    lbl2: TLabel;
    cxFilterDateEnd: TcxDateEdit;
    DS_HistoryID_DOC: TFIBBCDField;
    DS_HistoryID_TIPD: TFIBBCDField;
    DS_HistoryTIPD: TFIBStringField;
    DS_HistoryNAME_TIPD: TFIBStringField;
    DS_HistoryKOD_DOC: TFIBSmallIntField;
    DS_HistoryNUM_DOC: TFIBStringField;
    DS_HistoryDATE_DOC: TFIBDateField;
    DS_HistoryOSN_ID_TIPD: TFIBBCDField;
    DS_HistoryOTIPD: TFIBStringField;
    DS_HistoryNAME_OSN: TFIBStringField;
    DS_HistoryOSN_NUM_DOC: TFIBStringField;
    DS_HistoryOSN_DATE_DOC: TFIBDateField;
    DS_HistoryID_MO_IN: TFIBBCDField;
    DS_HistoryFIO_MO_IN: TFIBStringField;
    DS_HistoryFIO_IN: TFIBStringField;
    DS_HistoryNAME_DEP_IN: TFIBStringField;
    DS_HistoryID_MO_OUT: TFIBBCDField;
    DS_HistoryFIO_MO_OUT: TFIBStringField;
    DS_HistoryFIO_OUT: TFIBStringField;
    DS_HistoryNAME_DEP_OUT: TFIBStringField;
    DS_HistoryID_CUST: TFIBBCDField;
    DS_HistoryNAME_CUSTOMER: TFIBStringField;
    DS_HistoryOKPO_CUSTOMER: TFIBStringField;
    DS_HistoryNAME_IN: TFIBStringField;
    DS_HistoryNAME_OUT: TFIBStringField;
    DS_HistorySUMMA: TFIBBCDField;
    DS_HistorySUMMA_DOC: TFIBBCDField;
    DS_HistoryID_MAN: TFIBBCDField;
    DS_HistoryFIO_MAN: TFIBStringField;
    DS_HistorySFIO_MAN: TFIBStringField;
    DS_HistoryDOV_NUM: TFIBStringField;
    DS_HistoryDOV_DATE: TFIBDateField;
    DS_HistoryDATE_REC: TFIBDateField;
    DS_HistoryPERIOD: TFIBStringField;
    DS_HistoryPUB_ID_DOC: TFIBBCDField;
    DS_HistoryNUM_REESTR: TFIBStringField;
    DS_HistoryDATE_REESTR: TFIBDateField;
    DS_HistoryUSER_NAME: TFIBStringField;
    DS_HistoryCOMPUTER: TFIBStringField;
    DS_HistoryDATETIME: TFIBDateTimeField;
    DS_HistoryDIR_KOMISSIA: TFIBStringField;
    DS_HistoryKOMISSIA: TFIBStringField;
    DS_HistoryNUM_PRIKAZ_KOMISSIA: TFIBStringField;
    DS_HistoryDATE_PRIKAZ_KOMISSIA: TFIBDateField;
    DS_HistoryDOC_NOTE: TFIBStringField;
    DS_HistoryINV_KART_MODE: TFIBIntegerField;
    DS_HistoryMNA_KART_MODE: TFIBIntegerField;
    DS_HistoryIKOL_MAT: TFIBBCDField;
    DS_HistoryIKOL_DOC: TFIBBCDField;
    DS_HistoryCOUNT_POS: TFIBIntegerField;
    DS_HistoryPUB_ID_USER: TFIBBCDField;
    DS_HistoryPUB_USER_NAME: TFIBStringField;
    DS_HistoryPUB_USER_FULL_NAME: TFIBStringField;
    DS_HistoryPUB_COMPUTER: TFIBStringField;
    DS_HistoryPUB_DATETIME: TFIBDateTimeField;
    DS_HistoryTIP_WORK: TFIBIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure cxShowClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PeriodPropertiesChange(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private

  public
    DBHANDLE : TISC_DB_HANDLE;
    NOMN_NAME:string;
    WORK_PERIOD: TDateTime;
    DateBeg, DateEnd: TDateTime;
    Year, Month, Day: Word;
  end;

var
  HistoryNomForm: THistoryNomForm;

implementation

{$R *.dfm}

procedure THistoryNomForm.FormCreate(Sender: TObject);
begin

 NOMN_NAME := cxName.Text;

 with DS_History do
 begin
  Close;
  SelectSQL.Clear;
  SelectSQL.Add('SELECT * FROM MAT_HISTORY_SP_NOM_POS('+nomn_name+')');
 end;
end;

procedure THistoryNomForm.cxShowClick(Sender: TObject);
begin
  if cxName.Text = '' then begin ShowMessage('Заповніть назву!'); Exit; cxName.SetFocus;end;
  NOMN_NAME:=AnsiUpperCase(cxName.Text);
 
 with DS_History do
 begin
  Close;
  SelectSQL.Clear;
  SelectSQL.Add('SELECT * FROM MAT_HISTORY_SP_NOM_POS(:PNAME)');
  if Period.Checked then SelectSQL.Add(' WHERE DATE_DOC between '''+datetostr(DateBeg)+''' and '''+DateToStr(DateEnd)+'''');
  ParamByName('PNAME').AsString:= NOMN_NAME;
  CloseOpen(False);
 end;
//  cxGrid1DBTableView1.
end;

procedure THistoryNomForm.FormShow(Sender: TObject);
begin
 with DS_Pos do
 begin
  Close;
  SelectSQL.Clear;
  SelectSQL.Add('SELECT DATE_REC FROM MAT_INI');
  Open;
  WORK_PERIOD:=FieldValues['DATE_REC'];
  DecodeDate(WORK_PERIOD, Year, Month, Day);
  DateBeg:=StartOfAMonth(Year, Month);
  DateEnd:=EndOfAMonth(Year, Month);
  cxFilterDateBeg.Date:=DateBeg;
  cxFilterDateEnd.Date:=DateEnd;
 end;
end;

procedure THistoryNomForm.PeriodPropertiesChange(Sender: TObject);
begin
   cxFilterDateBeg.Enabled:=Period.Checked;
  cxFilterDateEnd.Enabled:=Period.Checked;
end;

procedure THistoryNomForm.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  DS_Pos.Close;
  DS_Pos.SelectSQL.Clear;
  DS_Pos.SelectSQL.Add('SELECT * FROM MAT_DT_DOC_POS_SEL(:ID_DOC) ORDER BY NAME');
  DS_Pos.Prepare;
  DS_Pos.ParamByName('ID_DOC').AsInt64:=DS_HistoryID_DOC.AsInt64;
  DS_Pos.Open;
end;

end.
