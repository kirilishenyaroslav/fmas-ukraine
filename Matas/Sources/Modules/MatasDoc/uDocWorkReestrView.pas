unit uDocWorkReestrView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, FIBDataSet, FIBDatabase,
  pFIBDatabase, pFIBDataSet, Buttons, uResources, ActnList;

type
  TDocWorkReestrView = class(TForm)
    Panel1: TPanel;
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
    DocGrid: TcxGrid;
    DocsView: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    WorkDatabase: TpFIBDatabase;
    WorkDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WorkDataSetID_DOC: TFIBIntegerField;
    WorkDataSetID_TIPD: TFIBIntegerField;
    WorkDataSetTIPD: TFIBStringField;
    WorkDataSetNAME_TIPD: TFIBStringField;
    WorkDataSetKOD_DOC: TFIBSmallIntField;
    WorkDataSetNUM_DOC: TFIBStringField;
    WorkDataSetDATE_DOC: TFIBDateField;
    WorkDataSetOSN_ID_TIPD: TFIBIntegerField;
    WorkDataSetOTIPD: TFIBStringField;
    WorkDataSetNAME_OSN: TFIBStringField;
    WorkDataSetOSN_NUM_DOC: TFIBStringField;
    WorkDataSetOSN_DATE_DOC: TFIBDateField;
    WorkDataSetID_MO_IN: TFIBIntegerField;
    WorkDataSetFIO_MO_IN: TFIBStringField;
    WorkDataSetNAME_DEP_IN: TFIBStringField;
    WorkDataSetID_MO_OUT: TFIBIntegerField;
    WorkDataSetFIO_MO_OUT: TFIBStringField;
    WorkDataSetNAME_DEP_OUT: TFIBStringField;
    WorkDataSetID_CUST: TFIBBCDField;
    WorkDataSetNAME_CUSTOMER: TFIBStringField;
    WorkDataSetNAME_IN: TFIBStringField;
    WorkDataSetNAME_OUT: TFIBStringField;
    WorkDataSetSHORT_NAME_IN: TFIBStringField;
    WorkDataSetSHORT_NAME_OUT: TFIBStringField;
    WorkDataSetSUMMA: TFIBBCDField;
    WorkDataSetID_MAN: TFIBIntegerField;
    WorkDataSetFIO_MAN: TFIBStringField;
    WorkDataSetDOV_NUM: TFIBStringField;
    WorkDataSetDOV_DATE: TFIBDateField;
    WorkDataSetDATE_REC: TFIBDateField;
    WorkDataSetPUB_ID_DOC: TFIBBCDField;
    WorkDataSetNUM_REESTR: TFIBStringField;
    WorkDataSetDATE_REESTR: TFIBDateField;
    WorkDataSetUSER_NAME: TFIBStringField;
    WorkDataSetCOMPUTER: TFIBStringField;
    WorkDataSetDATETIME: TFIBDateTimeField;
    DataSource1: TDataSource;
    DocsViewID_DOC: TcxGridDBColumn;
    DocsViewID_TIPD: TcxGridDBColumn;
    DocsViewTIPD: TcxGridDBColumn;
    DocsViewNAME_TIPD: TcxGridDBColumn;
    DocsViewKOD_DOC: TcxGridDBColumn;
    DocsViewNUM_DOC: TcxGridDBColumn;
    DocsViewDATE_DOC: TcxGridDBColumn;
    DocsViewOSN_ID_TIPD: TcxGridDBColumn;
    DocsViewOTIPD: TcxGridDBColumn;
    DocsViewNAME_OSN: TcxGridDBColumn;
    DocsViewOSN_NUM_DOC: TcxGridDBColumn;
    DocsViewOSN_DATE_DOC: TcxGridDBColumn;
    DocsViewID_MO_IN: TcxGridDBColumn;
    DocsViewFIO_MO_IN: TcxGridDBColumn;
    DocsViewNAME_DEP_IN: TcxGridDBColumn;
    DocsViewID_MO_OUT: TcxGridDBColumn;
    DocsViewFIO_MO_OUT: TcxGridDBColumn;
    DocsViewNAME_DEP_OUT: TcxGridDBColumn;
    DocsViewID_CUST: TcxGridDBColumn;
    DocsViewNAME_CUSTOMER: TcxGridDBColumn;
    DocsViewNAME_IN: TcxGridDBColumn;
    DocsViewNAME_OUT: TcxGridDBColumn;
    DocsViewSHORT_NAME_IN: TcxGridDBColumn;
    DocsViewSHORT_NAME_OUT: TcxGridDBColumn;
    DocsViewSUMMA: TcxGridDBColumn;
    DocsViewID_MAN: TcxGridDBColumn;
    DocsViewFIO_MAN: TcxGridDBColumn;
    DocsViewDOV_NUM: TcxGridDBColumn;
    DocsViewDOV_DATE: TcxGridDBColumn;
    DocsViewDATE_REC: TcxGridDBColumn;
    DocsViewNUM_REESTR: TcxGridDBColumn;
    DocsViewDATE_REESTR: TcxGridDBColumn;
    DocsViewUSER_NAME: TcxGridDBColumn;
    DocsViewCOMPUTER: TcxGridDBColumn;
    DocsViewDATETIME: TcxGridDBColumn;
    RefreshButton: TSpeedButton;
    CancelButton: TSpeedButton;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    procedure RefreshButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocWorkReestrView: TDocWorkReestrView;

implementation

{$R *.dfm}

procedure TDocWorkReestrView.RefreshButtonClick(Sender: TObject);
begin
 WorkDataSet.CloseOpen(False);
end;

procedure TDocWorkReestrView.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TDocWorkReestrView.FormCreate(Sender: TObject);
begin
 RefreshButton.Caption:=MAT_ACTION_REFRESH_CONST;
 CancelButton.Caption:=MAT_ACTION_CLOSE_CONST;
 CancelButton.Align:=alRight;
 RefreshButton.Align:=alLeft;
end;

procedure TDocWorkReestrView.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

end.
