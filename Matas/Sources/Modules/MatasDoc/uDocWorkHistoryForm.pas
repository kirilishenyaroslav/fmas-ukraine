{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkHistoryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, cxButtons, cxContainer,
  cxTextEdit, cxDBEdit, frxExportRTF, frxClass, frxExportXLS, frxDesgn,
  frxDBSet, cxCheckBox, uMatasVars;

type
  TDocWorkViewHistoryForm = class(TForm)
    CancelButton: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    HistoryDataSet: TpFIBDataSet;
    HistoryDataSource: TDataSource;
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
    HistoryDataSetID_DOC: TFIBBCDField;
    HistoryDataSetKOL_MAT: TFIBBCDField;
    HistoryDataSetSUMMA: TFIBBCDField;
    HistoryDataSetID_TIPD: TFIBBCDField;
    HistoryDataSetTIPD: TFIBStringField;
    HistoryDataSetNAME_TIPD: TFIBStringField;
    HistoryDataSetKOD_DOC: TFIBSmallIntField;
    HistoryDataSetNUM_DOC: TFIBStringField;
    HistoryDataSetDATE_DOC: TFIBDateField;
    HistoryDataSetOSN_ID_TIPD: TFIBBCDField;
    HistoryDataSetOTIPD: TFIBStringField;
    HistoryDataSetNAME_OSN: TFIBStringField;
    HistoryDataSetOSN_NUM_DOC: TFIBStringField;
    HistoryDataSetOSN_DATE_DOC: TFIBDateField;
    HistoryDataSetID_MO_IN: TFIBBCDField;
    HistoryDataSetFIO_MO_IN: TFIBStringField;
    HistoryDataSetFIO_IN: TFIBStringField;
    HistoryDataSetNAME_DEP_IN: TFIBStringField;
    HistoryDataSetID_MO_OUT: TFIBBCDField;
    HistoryDataSetFIO_MO_OUT: TFIBStringField;
    HistoryDataSetFIO_OUT: TFIBStringField;
    HistoryDataSetNAME_DEP_OUT: TFIBStringField;
    HistoryDataSetID_CUST: TFIBBCDField;
    HistoryDataSetNAME_CUSTOMER: TFIBStringField;
    HistoryDataSetSUMMA_DOC: TFIBBCDField;
    HistoryDataSetID_MAN: TFIBBCDField;
    HistoryDataSetFIO_MAN: TFIBStringField;
    HistoryDataSetSFIO_MAN: TFIBStringField;
    HistoryDataSetDOV_NUM: TFIBStringField;
    HistoryDataSetDOV_DATE: TFIBDateField;
    HistoryDataSetDATE_REC: TFIBDateField;
    HistoryDataSetPERIOD: TFIBStringField;
    HistoryDataSetPUB_ID_DOC: TFIBBCDField;
    HistoryDataSetUSER_NAME: TFIBStringField;
    HistoryDataSetCOMPUTER: TFIBStringField;
    HistoryDataSetDATETIME: TFIBDateTimeField;
    HistoryDataSetDOC_NOTE: TFIBStringField;
    HistoryDataSetINV_KART_MODE: TFIBIntegerField;
    HistoryDataSetMNA_KART_MODE: TFIBIntegerField;
    HistoryDataSetCOUNT_POS: TFIBIntegerField;
    HistoryDataSetPUB_ID_USER: TFIBBCDField;
    HistoryDataSetPUB_USER_NAME: TFIBStringField;
    HistoryDataSetPUB_USER_FULL_NAME: TFIBStringField;
    HistoryDataSetPUB_COMPUTER: TFIBStringField;
    HistoryDataSetPUB_DATETIME: TFIBDateTimeField;
    HistoryDataSetDIRECTION: TFIBIntegerField;
    cxGrid1DBTableView1ID_DOC: TcxGridDBColumn;
    cxGrid1DBTableView1KOL_MAT: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA: TcxGridDBColumn;
    cxGrid1DBTableView1ID_TIPD: TcxGridDBColumn;
    cxGrid1DBTableView1TIPD: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_TIPD: TcxGridDBColumn;
    cxGrid1DBTableView1KOD_DOC: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_DOC: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_DOC: TcxGridDBColumn;
    cxGrid1DBTableView1OSN_ID_TIPD: TcxGridDBColumn;
    cxGrid1DBTableView1OTIPD: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_OSN: TcxGridDBColumn;
    cxGrid1DBTableView1OSN_NUM_DOC: TcxGridDBColumn;
    cxGrid1DBTableView1OSN_DATE_DOC: TcxGridDBColumn;
    cxGrid1DBTableView1ID_MO_IN: TcxGridDBColumn;
    cxGrid1DBTableView1FIO_MO_IN: TcxGridDBColumn;
    cxGrid1DBTableView1FIO_IN: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_DEP_IN: TcxGridDBColumn;
    cxGrid1DBTableView1ID_MO_OUT: TcxGridDBColumn;
    cxGrid1DBTableView1FIO_MO_OUT: TcxGridDBColumn;
    cxGrid1DBTableView1FIO_OUT: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_DEP_OUT: TcxGridDBColumn;
    cxGrid1DBTableView1ID_CUST: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_CUSTOMER: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA_DOC: TcxGridDBColumn;
    cxGrid1DBTableView1ID_MAN: TcxGridDBColumn;
    cxGrid1DBTableView1FIO_MAN: TcxGridDBColumn;
    cxGrid1DBTableView1SFIO_MAN: TcxGridDBColumn;
    cxGrid1DBTableView1DOV_NUM: TcxGridDBColumn;
    cxGrid1DBTableView1DOV_DATE: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_REC: TcxGridDBColumn;
    cxGrid1DBTableView1PERIOD: TcxGridDBColumn;
    cxGrid1DBTableView1USER_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1COMPUTER: TcxGridDBColumn;
    cxGrid1DBTableView1DATETIME: TcxGridDBColumn;
    cxGrid1DBTableView1DOC_NOTE: TcxGridDBColumn;
    cxGrid1DBTableView1INV_KART_MODE: TcxGridDBColumn;
    cxGrid1DBTableView1MNA_KART_MODE: TcxGridDBColumn;
    cxGrid1DBTableView1COUNT_POS: TcxGridDBColumn;
    cxGrid1DBTableView1PUB_ID_USER: TcxGridDBColumn;
    cxGrid1DBTableView1PUB_USER_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1PUB_USER_FULL_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1PUB_COMPUTER: TcxGridDBColumn;
    cxGrid1DBTableView1PUB_DATETIME: TcxGridDBColumn;
    cxGrid1DBTableView1DIRECTION: TcxGridDBColumn;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    HistoryDataSetNAME_IN: TStringField;
    HistoryDataSetNAME_OUT: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    cxButton1: TcxButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    cxCheckBox: TcxCheckBox;
    HistoryDataSetNAME: TFIBStringField;
    procedure HistoryDataSetCalcFields(DataSet: TDataSet);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocWorkViewHistoryForm: TDocWorkViewHistoryForm;

implementation

{$R *.dfm}

procedure TDocWorkViewHistoryForm.HistoryDataSetCalcFields(
  DataSet: TDataSet);
begin
 if HistoryDataSetID_MO_IN.Value<>0 then
 begin
  HistoryDataSetNAME_IN.Value:=HistoryDataSetFIO_IN.Value+' / '+HistoryDataSetNAME_DEP_IN.Value;
  if HistoryDataSetID_CUST.Value<>0 then
   HistoryDataSetNAME_OUT.Value:=HistoryDataSetNAME_CUSTOMER.Value;
 end;
 if HistoryDataSetID_MO_OUT.Value<>0 then
 begin
  HistoryDataSetNAME_OUT.Value:=HistoryDataSetFIO_OUT.Value+' / '+HistoryDataSetNAME_DEP_IN.Value;
  if HistoryDataSetID_CUST.Value<>0 then
   HistoryDataSetNAME_IN.Value:=HistoryDataSetNAME_CUSTOMER.Value;
 end;
end;

procedure TDocWorkViewHistoryForm.cxButton1Click(Sender: TObject);
begin
frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\Print_hist_doc.fr3');
frxReport1.PrepareReport;
frxReport1.PrintOptions.ShowDialog:=True;
frxReport1.ShowReport;
if cxCheckBox.Checked then
frxReport1.DesignReport;
end;

end.
