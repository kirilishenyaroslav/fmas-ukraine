unit uHistoryValute;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, uSpValyuta, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, ibase;

type
  THistoryForm = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ds1: TDataSource;
    cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn6: TcxGridDBColumn;
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
    DS_History: TpFIBDataSet;
    DB: TpFIBDatabase;
    TR: TpFIBTransaction;
    cxgrdbclmnGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    DS_HistoryID_KURS_HST: TFIBBCDField;
    DS_HistoryID_KURS: TFIBBCDField;
    DS_HistoryID_VALUTE: TFIBBCDField;
    DS_HistoryDATE_KURS: TFIBDateField;
    DS_HistoryKURS: TFIBBCDField;
    DS_HistoryACTION_HST: TFIBStringField;
    DS_HistoryUSER_FIO_HST: TFIBStringField;
    DS_HistoryDATE_TIME_HST: TFIBDateTimeField;
    DS_HistoryID_HISTORY_INFO_HST: TFIBBCDField;
    DS_HistoryCODE_VALUTE: TFIBStringField;
    DS_HistoryVALUTE_TITLE: TFIBStringField;
    DS_HistoryID_VALUTE1: TFIBBCDField;
    DS_HistoryCOMP: TFIBStringField;
    cxgrdbclmnGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    DS_HistoryTIME_KURS: TFIBTimeField;
    DS_HistorySPECIAL_SIGN: TFIBStringField;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
  private
    DB_Handle:TISC_DB_HANDLE;
  public
     constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; id_v:integer);overload;
  end;

var
  HistoryForm: THistoryForm;

implementation

{$R *.dfm}
constructor THistoryForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; id_v:integer);
begin
 inherited Create(AOwner);
  if Assigned(DBHandle)
  then begin
   Self.DB_HANDLE := DBHandle;
   Self.DB.Close;
   Self.DB.Handle:=DB_HANDLE;
   Self.DB.Open;
   Self.DS_History.Close;
   Self.DS_History.SelectSQL.Clear;
   Self.DS_History.SelectSQL.Add('select * from PUB_DT_VALUTE_KURS_HST a inner join pub_sp_valute b on a.id_valute=b.id_valute where a.id_valute=:id_val order by a.date_time_hst');
   Self.DS_History.Prepare;
   Self.DS_History.ParamByName('id_val').AsInteger:=id_v;
   Self.DS_History.CloseOpen(False);
  end;
end;
end.
