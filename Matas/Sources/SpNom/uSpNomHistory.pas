unit uSpNomHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, uSpNom,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, FIBDataSet, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, ActnList, pFIBDataSet, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid;

type
  TSpNomHistoryForm = class(TForm)
    pnl1: TPanel;
    cxButton1: TcxButton;
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
    HistoryDS: TpFIBDataSet;
    actlst1: TActionList;
    act1: TAction;
    cxgrdbclmnNOMN: TcxGridDBColumn;
    HistoryDSKOD: TFIBStringField;
    HistoryDSNOMN: TFIBStringField;
    HistoryDSNAME: TFIBStringField;
    HistoryDSID_UNIT: TFIBBCDField;
    HistoryDSPRICE: TFIBBCDField;
    HistoryDSTIP: TFIBIntegerField;
    HistoryDSNTYPE: TFIBIntegerField;
    HistoryDSID_SCH: TFIBBCDField;
    HistoryDSNAME_USER: TFIBStringField;
    HistoryDSID_HIST: TFIBBCDField;
    HistoryDSDATETIME: TFIBDateTimeField;
    HistoryDSUSER_ACTION: TFIBStringField;
    HistoryDSSHORT_NAME: TFIBStringField;
    HistoryDSSCH_NUMBER: TFIBStringField;
    HistoryDSSCH_TITLE: TFIBStringField;
    HistoryDSCUR_PERIOD: TFIBDateField;
    cxgrdbclmnKOD: TcxGridDBColumn;
    cxgrdbclmnNAME: TcxGridDBColumn;
    cxgrdbclmnED_IZM: TcxGridDBColumn;
    cxgrdbclmnPRICE: TcxGridDBColumn;
    cxgrdbclmnTIP: TcxGridDBColumn;
    cxgrdbclmnUSER_FIO: TcxGridDBColumn;
    cxgrdbclmnDATETIME: TcxGridDBColumn;
    cxgrdbclmnUSER_ACTION: TcxGridDBColumn;
    procedure act1Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    id:Integer;
  end;

var
  SpNomHistoryForm: TSpNomHistoryForm;

implementation

{$R *.dfm}

procedure TSpNomHistoryForm.act1Execute(Sender: TObject);
begin
Close;
end;

procedure TSpNomHistoryForm.FormShow(Sender: TObject);
begin
 HistoryDS.Close;
 HistoryDS.SelectSQL.Clear;
 HistoryDS.SelectSQL.Add('SELECT * from MAT_SP_NOM_BASE_HIST_SEL(:ID_NOMN)');
 HistoryDS.Prepare;
 HistoryDS.ParamByName('ID_NOMN').AsInteger:=id;
 HistoryDS.CloseOpen(False);
end;

end.
