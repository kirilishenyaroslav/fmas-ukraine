unit uSpMatOtvHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, ExtCtrls, uSpMatOtv,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxCheckBox, FIBDataSet, pFIBDataSet,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TSpMatOtvHistoryForm = class(TForm)
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
    cxgrdbclmnFIO: TcxGridDBColumn;
    ds1: TDataSource;
    HistorySet: TpFIBDataSet;
    HistorySetID_MAN: TFIBBCDField;
    HistorySetID_SPODR: TFIBBCDField;
    HistorySetIS_SKLAD: TFIBIntegerField;
    HistorySetDISABLE: TFIBIntegerField;
    HistorySetDATE_BEG: TFIBDateField;
    HistorySetDATE_END: TFIBDateField;
    HistorySetCOMMENT: TFIBStringField;
    HistorySetUSER_FIO: TFIBStringField;
    HistorySetID_HIST: TFIBBCDField;
    HistorySetUSER_ACTION: TFIBStringField;
    HistorySetDATETIME: TFIBDateTimeField;
    HistorySetFIO: TFIBStringField;
    HistorySetNAME_DEPARTMENT: TFIBStringField;
    cxgrdbclmnDEP: TcxGridDBColumn;
    cxgrdbclmnDateBeg: TcxGridDBColumn;
    cxgrdbclmnDateEnd: TcxGridDBColumn;
    cxgrdbclmnUser: TcxGridDBColumn;
    cxgrdbclmnAction: TcxGridDBColumn;
    cxgrdbclmnDATETIME: TcxGridDBColumn;
    procedure actCloseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    id: Integer;
  end;

var
  SpMatOtvHistoryForm: TSpMatOtvHistoryForm;

implementation

{$R *.dfm}

procedure TSpMatOtvHistoryForm.actCloseExecute(Sender: TObject);
begin
Close;
end;

procedure TSpMatOtvHistoryForm.FormShow(Sender: TObject);
begin
 HistorySet.Close;
 HistorySet.SelectSQL.Clear;
 HistorySet.SelectSQL.Add('SELECT * from MAT_SP_MO_HIST_SEL(:ID_MO)');
 HistorySet.Prepare;
 HistorySet.ParamByName('ID_MO').AsInteger:=id;
 HistorySet.CloseOpen(False);
end;

end.
