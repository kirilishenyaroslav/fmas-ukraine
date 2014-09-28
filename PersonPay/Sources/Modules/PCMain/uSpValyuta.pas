unit uSpValyuta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, ibase, DateUtils, uMainPerem;

type
  TValyutaForm = class(TForm)
    pnl1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ds1: TDataSource;
    StPr: TpFIBStoredProc;
    TR: TpFIBTransaction;
    DS: TpFIBDataSet;
    DB: TpFIBDatabase;
    cxEdit: TcxButton;
    cxHistory: TcxButton;
    cxClose: TcxButton;
    cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn4: TcxGridDBColumn;
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
    DSID_VALUTE: TFIBBCDField;
    DSDATE_KURS: TFIBDateField;
    DSKURS: TFIBBCDField;
    DSVALUTE_TITLE: TFIBStringField;
    DSCODE_VALUTE: TFIBStringField;
    ds_hist_kurs: TpFIBDataSet;
    ST_PR_1: TpFIBStoredProc;
    TR_1: TpFIBTransaction;
    DSSPECIAL_SIGN: TFIBStringField;
    cxgrdbclmnGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxgrdbclmnGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    ds2: TDataSource;
    cxAddVal: TcxButton;
    DSTIME_KURS: TFIBTimeField;
    DSDATE_TIME: TFIBDateTimeField;
    ds_hist_kursKURS: TFIBBCDField;
    ds_hist_kursDATE_KURS: TFIBDateField;
    ds_hist_kursTIME_KURS: TFIBDateTimeField;
    ds_hist_kursDATE_TIME: TFIBDateTimeField;
    procedure cxCloseClick(Sender: TObject);
    procedure cxEditClick(Sender: TObject);
    procedure cxHistoryClick(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxAddValClick(Sender: TObject);
  private
    DBHANDLE : TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);overload;
  end;

var
  ValyutaForm: TValyutaForm;


implementation
   uses uEditKurs, uHistoryValute, uEditVal, uHistoryKurs;
{$R *.dfm}
constructor TValyutaForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
  if Assigned(DBHandle)
  then begin
   Self.DBHANDLE := DBHandle;
   Self.DB.Close;
   Self.DB.Handle:=DBHANDLE;
   Self.DB.Open;
   Self.DS.CloseOpen(false);

  end;
end;

procedure TValyutaForm.cxCloseClick(Sender: TObject);
begin
Close;
end;

procedure TValyutaForm.cxEditClick(Sender: TObject);
var f:TEditKursForm;
    res,id:Integer;
    ff:TEditValForm;
    kurs:Double;
    date_kurs:TDateTime;
    time_kurs:TTime;
begin
id:=DSID_VALUTE.AsInteger;

f:=TEditKursForm.Create(Self);
f.cxName.Caption:=DSVALUTE_TITLE.AsString;
f.cxKurs.EditValue:=DSKURS.Value;
f.cxDateEdit.EditValue:=Date();
f.cxName.Width:=200;
f.cxAddVal.Visible:=False;
f.cxName.Visible:=True;
f.cxTimeEdit.EditValue:=DSTIME_KURS.Value;
F.ShowModal;
if f.ModalResult=mrOk then
begin
  kurs:=f.cxKurs.EditValue;
  date_kurs:=f.cxDateEdit.EditValue;
  time_kurs:=f.cxTimeEdit.EditValue;
 try
   StPr.Close;
   StPr.Transaction := TR;
   StPr.Transaction.StartTransaction;
   StPr.StoredProcName:='PC_PROVERKA_KURS';
   StPr.Prepare;
   StPr.ParamByName('ID_VALUTE').AsInteger:=DSID_VALUTE.AsInteger;
   StPr.ParamByName('DATE_KURS').AsDate:=date_kurs;
   StPr.ParamByName('TIME_KURS').AsTime:=time_kurs;
   StPr.ExecProc;
   StPr.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr.Transaction.Rollback;
    exit;
   end;
  end;
  res:=StPr.ParamByName('IS_UPDATE').AsInteger;
  if StPr.ParamByName('KURS').AsCurrency<>kurs then
  begin
  if res=1 then
  begin
   ff:=TEditValForm.Create(Self);
   ff.lbl1.Caption:='На '+ DateToStr(StPr.ParamByName('DATE_BEG').AsDate)+' '+VarToStr(time_kurs)+' за валютою ' + StPr.ParamByName('NAME_VAL').AsString+ ' ('+ StPr.ParamByName('SHORT_NAME_VAL').AsString+') діє курс '+FloatToStr(StPr.ParamByName('KURS').AsCurrency);
   ff.lbl2.Caption:='Ви дійсно бажаєте його змінити на '+ FloatToStr(f.cxKurs.EditValue)+' ?';
   ff.ShowModal;
   if ff.ModalResult=mrOk then
   try
   ST_PR_1.Close;
   ST_PR_1.Transaction := TR_1;
   ST_PR_1.Transaction.StartTransaction;
   ST_PR_1.StoredProcName:='PUB_DT_VALUTE_KURS_UPD';
   ST_PR_1.Prepare;
   ST_PR_1.ParamByName('ID_VALUTE').AsInteger:=id;
   ST_PR_1.ParamByName('KURS').AsCurrency:=kurs;
   ST_PR_1.ParamByName('DATE_KURS').AsDate:=date_kurs;
   ST_PR_1.ParamByName('TIME_KURS').AsTime:=time_kurs;
   ST_PR_1.ParamByName('IS_UPD').AsInteger:=1;
   ST_PR_1.ExecProc;
   ST_PR_1.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    ST_PR_1.Transaction.Rollback;
    exit;
   end;
  end;
  ff.Free;
  end;
  if res=0 then
  begin
   ff:=TEditValForm.Create(Self);
   ff.lbl1.Caption:='З '+ DateToStr(StPr.ParamByName('DATE_BEG').AsDate)+' '+VarToStr(time_kurs)+' по '+DAteToStr(StPr.ParamByName('DATE_END').AsDate)+' '+VarToStr(time_kurs)+' за валютою ' + StPr.ParamByName('NAME_VAL').AsString+ '('+ StPr.ParamByName('SHORT_NAME_VAL').AsString+') діє курс '+FloatToStr(StPr.ParamByName('KURS').AsCurrency);
   ff.lbl2.Caption:='Ви дійсно бажаєте його змінити на '+ FloatToStr(f.cxKurs.EditValue)+ ' з ' +DateToStr(f.cxDateEdit.EditValue)+' ?';
   ff.ShowModal;
   if ff.ModalResult=mrOk then
   try
   ST_PR_1.Close;
   ST_PR_1.Transaction := TR_1;
   ST_PR_1.Transaction.StartTransaction;
   ST_PR_1.StoredProcName:='PUB_DT_VALUTE_KURS_UPD';
   ST_PR_1.Prepare;
   ST_PR_1.ParamByName('ID_VALUTE').AsInteger:=id;
   ST_PR_1.ParamByName('KURS').AsCurrency:=kurs;
   ST_PR_1.ParamByName('DATE_KURS').AsDate:=date_kurs;
   ST_PR_1.ParamByName('TIME_KURS').AsTime:=time_kurs;
   ST_PR_1.ParamByName('IS_UPD').AsInteger:=0;
   ST_PR_1.ExecProc;
   ST_PR_1.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    ST_PR_1.Transaction.Rollback;
    exit;
   end;
  end;
  ff.Free;
  end;
  if res=-1 then
  begin
   try
   ST_PR_1.Close;
   ST_PR_1.Transaction := TR_1;
   ST_PR_1.Transaction.StartTransaction;
   ST_PR_1.StoredProcName:='PUB_DT_VALUTE_KURS_UPD';
   ST_PR_1.Prepare;
   ST_PR_1.ParamByName('ID_VALUTE').AsInteger:=id;
   ST_PR_1.ParamByName('KURS').AsCurrency:=kurs;
   ST_PR_1.ParamByName('DATE_KURS').AsDate:=date_kurs;
   ST_PR_1.ParamByName('TIME_KURS').AsTime:=time_kurs;
   ST_PR_1.ParamByName('IS_UPD').AsInteger:=0;
   ST_PR_1.ExecProc;
   ST_PR_1.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    ST_PR_1.Transaction.Rollback;
    exit;
   end;
  end;
  end;
  end;
end;
f.Free;
DS.CloseOpen(False);
DS.Locate('ID_VALUTE',id,[]);
end;

procedure TValyutaForm.cxHistoryClick(Sender: TObject);
var f:THistoryForm;
    id:Integer;
begin
 id:=DSID_VALUTE.AsInteger;
 f:=THistoryForm.Create(Self, DBhandle, id);
 f.ShowModal;
 f.Free;
 DS.Locate('ID_VALUTE',id,[]);
end;

procedure TValyutaForm.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
    id:Integer;
begin
 id:=DSID_VALUTE.AsInteger;
 ds_hist_kurs.Close;
 ds_hist_kurs.SelectSQL.Text:='select * from PC_VAL_KURS_SELECT(:ID_VAL)';
 ds_hist_kurs.Prepare;
 ds_hist_kurs.ParamByName('ID_VAL').AsInteger:=id;
 ds_hist_kurs.CloseOpen(False);

end;

procedure TValyutaForm.cxAddValClick(Sender: TObject);
var f:TEditKursForm;
begin
f:=TEditKursForm.Create(Self);
f.cxName.Caption:='';
f.cxKurs.EditValue:=0;
f.cxDateEdit.EditValue:=Date();
f.cxName.Width:=200;
f.cxAddVal.Visible:=True;
f.cxName.Visible:=False;
F.ShowModal;
if f.ModalResult = mrOk then
begin
  try
   StPr.Close;
   StPr.Transaction := TR;
   StPr.Transaction.StartTransaction;
   StPr.StoredProcName:='PUB_DT_VALUTE_KURS_UPD';
   StPr.Prepare;
   StPr.ParamByName('ID_VALUTE').AsInteger:=f.id_add_val;
   StPr.ParamByName('KURS').AsCurrency:=f.cxKurs.EditValue;
   StPr.ParamByName('DATE_KURS').AsDate:=f.cxDateEdit.EditValue;
   StPr.ParamByName('IS_UPD').AsInteger:=0;
   StPr.ExecProc;
   StPr.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr.Transaction.Rollback;
    exit;
   end;
  end;
end;
f.Free;
DS.CloseOpen(False);
end;

end.
