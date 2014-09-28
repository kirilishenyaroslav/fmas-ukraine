unit uUtvProv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxControls,
  cxGridCustomView, cxGrid, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, cxClasses, cxContainer,
  cxTextEdit, cxCurrencyEdit, StdCtrls, ExtCtrls, cxLookAndFeelPainters,
  cxButtons, ibase, dateutils, uMainPerem, ActnList,uMainFanc, cxMaskEdit,
  cxButtonEdit, RxMemDS, uSpVal, cxDropDownEdit, cxCalendar, cxSpinEdit,
  cxTimeEdit;

type
  TUtvProvForm = class(TForm)
    pnl1: TPanel;
    lblDoc: TLabel;
    lbl2: TLabel;
    pnl2: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    cxKurs: TcxCurrencyEdit;
    cxSumGrn: TcxCurrencyEdit;
    cxSumVal: TcxCurrencyEdit;
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
    ST_PR: TpFIBStoredProc;
    TR: TpFIBTransaction;
    DS: TpFIBDataSet;
    DB: TpFIBDatabase;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxOk: TcxButton;
    cxClose: TcxButton;
    DS_DOC: TpFIBDataSet;
    DS_DOCNUM_DOC: TFIBStringField;
    DS_DOCDATE_DOC: TFIBDateField;
    DS_DOCTYPE_DOC: TFIBStringField;
    DS_DOCDB_SUMMA: TFIBBCDField;
    DS_DOCKR_SUMMA: TFIBBCDField;
    DS_DOCDB_SUMMA_VAL: TFIBBCDField;
    DS_DOCKR_SUMMA_VAL: TFIBBCDField;
    DS_DOCNOTE: TFIBStringField;
    DS_DOCID_TYPE_DOC: TFIBBCDField;
    DS_DOCIS_OUR_DOC: TFIBIntegerField;
    DS_DOCID_VALUTE: TFIBBCDField;
    DS_DOCKURS: TFIBBCDField;
    DS_DOCIS_UTV: TFIBIntegerField;
    DS_DOCIS_DB_KR: TFIBIntegerField;
    DS_DOCN_VAL: TFIBStringField;
    DS_DOCVAL_TITLE: TFIBStringField;
    DSID_SM: TFIBBCDField;
    DSID_RZ: TFIBBCDField;
    DSID_ST: TFIBBCDField;
    DSID_KEKV: TFIBBCDField;
    DSSM_TITLE: TFIBStringField;
    DSSM_KOD: TFIBIntegerField;
    DSRZ_TITLE: TFIBStringField;
    DSRZ_KOD: TFIBIntegerField;
    DSST_TITLE: TFIBStringField;
    DSST_KOD: TFIBIntegerField;
    DSKEKV_TITLE: TFIBStringField;
    DSKEKV_KOD: TFIBIntegerField;
    DSID_PROV: TFIBBCDField;
    DSSUMMA_GRN: TFIBBCDField;
    DSSUMMA_VAL: TFIBBCDField;
    cxgrdbclmnGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    DSSumma_val_: TCurrencyField;
    actlst1: TActionList;
    actRefresh: TAction;
    StPrKurs: TpFIBStoredProc;
    StPrKurs1: TpFIBStoredProc;
    tr_kurs: TpFIBTransaction;
    tr_kurs1: TpFIBTransaction;
    DS_D: TpFIBDataSet;
    DS_DPC_ID_DOC: TFIBBCDField;
    DS_DPUB_ID_DOC: TFIBBCDField;
    DS_DPK_ID: TFIBBCDField;
    DS_DPUB_DATE_DOC: TFIBDateField;
    DS_DSUMMA_GRN: TFIBBCDField;
    DS_DSUMMA_VAL: TFIBBCDField;
    DS_DID_VALYUTA: TFIBIntegerField;
    DS_DKURS: TFIBBCDField;
    DS_DIS_UTV: TFIBIntegerField;
    DS_DIS_DB_KR: TFIBIntegerField;
    DS_DPK_ID1: TFIBBCDField;
    DS_DID_DOC: TFIBBCDField;
    DS_DDATETIME: TFIBDateTimeField;
    DS_DDATE_REG: TFIBDateField;
    DS_DDATE_PROV: TFIBDateField;
    DS_DDATE_DOC: TFIBDateField;
    DS_DID_TYPE_DOC: TFIBBCDField;
    DS_DNUM_DOC: TFIBStringField;
    DS_DSUMMA: TFIBBCDField;
    DS_DID_CUSTOMER: TFIBBCDField;
    DS_DNOTE: TFIBStringField;
    DS_DFIO: TFIBStringField;
    DS_DID_RATE_ACC: TFIBBCDField;
    DS_DID_RATE_ACC_NATIVE: TFIBBCDField;
    DS_DPRIHOD: TFIBBooleanField;
    DS_DID_USER: TFIBBCDField;
    DS_DID_OUT_DOC: TFIBBCDField;
    DS_DIS_SPRAVKA: TFIBBooleanField;
    DS_DID_SERVER: TFIBBCDField;
    DS_DCOMPUTER: TFIBStringField;
    DSID_SCH_DB: TFIBIntegerField;
    DSID_SCH_KR: TFIBIntegerField;
    DSNUM_SCH_DB: TFIBStringField;
    DSNUM_SCH_KR: TFIBStringField;
    DSNAME_SCH_DB: TFIBStringField;
    DSNAME_SCH_KR: TFIBStringField;
    DSID_OPER: TFIBBCDField;
    cxgrdbclmnFIO: TcxGridDBColumn;
    DSFIO: TFIBStringField;
    DSNUM_DOG: TFIBStringField;
    cxgrdbclmnNUM_DOG: TcxGridDBColumn;
    cxgrdbclmnNUM_SCH_DB: TcxGridDBColumn;
    cxgrdbclmnNUM_SCH_KR: TcxGridDBColumn;
    DSSYMBOL: TFIBStringField;
    lbl1: TcxTextEdit;
    actSave: TAction;
    cxValute: TcxButtonEdit;
    ds_val: TpFIBDataSet;
    RxMemoryData: TRxMemoryData;
    actReWrite: TAction;
    lbl6: TLabel;
    cxDateTime: TcxDateEdit;
    DS_DOCDATE_TIME_OPLAT: TFIBDateTimeField;
    cxTimeEdit: TcxTimeEdit;
    ds_kurs: TpFIBDataSet;
    procedure cxCloseClick(Sender: TObject);
    procedure cxKursExit(Sender: TObject);
    procedure DSCalcFields(DataSet: TDataSet);
    procedure actRefreshExecute(Sender: TObject);
    procedure cxOkClick(Sender: TObject);
    procedure DSSUMMA_VALGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure actSaveExecute(Sender: TObject);
    procedure cxValutePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure actReWriteExecute(Sender: TObject);
    procedure cxDateTimeExit(Sender: TObject);
    procedure cxTimeEditExit(Sender: TObject);
  private
    DB_HANDLE:TISC_DB_HANDLE;
  public
    id_doc_, id_session_val, id_valute:Integer;
    symbol:string;
    kurs:Double;
    DBEG:TDateTime;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE;  id_doc:integer);overload;
  end;

var
  UtvProvForm: TUtvProvForm;

implementation

{$R *.dfm}
uses uVopros, uUserRasch;
constructor TUtvProvForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE;  id_doc:integer);
var DATE_REC:TDateTime;
    month, year:Word;
begin
inherited Create(AOwner);
if Assigned(DBHandle)
then begin
 Self.DB_HANDLE := DBHandle;
 Self.DB.Close;
 Self.DB.Handle:=DBHANDLE;

 month:=MonthOf(PERS_PAY_PERIOD);
 year:=YearOf(PERS_PAY_PERIOD);
 DBEG:=StartOfAMonth(Year, Month);

 id_doc_:=id_doc;
  try
   ST_PR.Close;
   ST_PR.Transaction := TR;
   ST_PR.Transaction.StartTransaction;
   ST_PR.StoredProcName:='PC_DT_DOC_TO_TMP';
   ST_PR.Prepare;
   ST_PR.ParamByName('PC_ID_DOC').AsInteger:=id_doc_;
   ST_PR.ExecProc;
   ST_PR.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    ST_PR.Transaction.Rollback;
    exit;
   end;
   end;

   id_session_val:= ST_PR.ParamByName('ID_SESSION_VAL').Value;


 ds_doc.Close;
 DS_DOC.SelectSQL.Clear;
 DS_DOC.SelectSQL.Add('select * from PC_DT_DOC_TMP_SEL_INFO(:id_doc, :id_session)');
 DS_DOC.Prepare;
 DS_DOC.ParamByName('ID_DOC').asInteger:=id_doc_;
 DS_DOC.ParamByName('ID_SESSION').asInteger:=id_session_val;
 DS_DOC.CloseOpen(False);

 lbl1.Text:= vartostr(DS_DOCTYPE_DOC.value)+ ' '+vartostr(DS_DOCNUM_DOC.value)+' від '+ vartostr(DS_DOCDATE_DOC.value);
 cxValute.text:=DS_DOCVAL_TITLE.AsString+'('+DS_DOCN_VAL.AsString+')';
 cxKurs.EditValue:=DS_DOCKURS.AsCurrency;
 id_valute:=DS_DOCID_VALUTE.AsInteger;
 kurs:=DS_DOCKURS.AsFloat;
 cxDateTime.EditValue:= DS_DOCDATE_TIME_OPLAT.AsDateTime;
 cxTimeEdit.EditValue:= DS_DOCDATE_TIME_OPLAT.AsDateTime;

 if ((Self.DS_DOCDB_SUMMA.Value = null) or(Self.DS_DOCDB_SUMMA.Value = 0)) then
 begin
 cxSumGrn.EditValue:=DS_DOCKR_SUMMA.AsCurrency;
 cxSumVal.EditValue:=DS_DOCKR_SUMMA_VAL.AsCurrency;
 end
 else
 begin
 cxSumGrn.EditValue:=DS_DOCDB_SUMMA.AsCurrency;
 cxSumVal.EditValue:=DS_DOCDB_SUMMA_VAL.AsCurrency;
 end;

 DS.Close;
 DS.SelectSQL.Clear;
 DS.SelectSQL.Add('select * from PC_DT_PROV_TMP_INFO_SEL(:id_doc, :id_session, :date_reg)');
 DS.Prepare;
 DS.ParamByName('ID_DOC').AsInteger:=id_doc_;
 DS.ParamByName('ID_SESSION').AsInteger:=id_session_val;
 ds.ParamByName('DATE_REG').AsDate:= DBEG;
 ds.CloseOpen(False);
 DS.First;

 RxMemoryData.Open;
 while not DS.Eof do
 begin
  if not RxMemoryData.Locate('ID_PROV', DS['ID_PROV'],[loCaseInsensitive]) then
  begin
   RxMemoryData.Append;
   RxMemoryData.FieldByName('ID_SM').AsInteger:=DS['ID_SM'];
   RxMemoryData.FieldByName('ID_RZ').AsInteger:=DS['ID_RZ'];
   RxMemoryData.FieldByName('ID_ST').AsInteger:=DS['ID_ST'];
   RxMemoryData.FieldByName('ID_KEKV').AsInteger:=DS['ID_KEKV'];
   RxMemoryData.FieldByName('ID_SCH_DB').AsInteger:=DS['ID_SCH_DB'];
   RxMemoryData.FieldByName('ID_SCH_KR').AsInteger:=DS['ID_SCH_KR'];
   RxMemoryData.FieldByName('ID_PROV').AsInteger:=DS['ID_PROV'];
   RxMemoryData.FieldByName('ID_OPER').AsInteger:=DS['ID_OPER'];
   RxMemoryData.FieldByName('SM_KOD').AsInteger:=DS['SM_KOD'];
   RxMemoryData.FieldByName('RZ_KOD').AsInteger:=DS['RZ_KOD'];
   RxMemoryData.FieldByName('ST_KOD').AsInteger:=DS['ST_KOD'];
   RxMemoryData.FieldByName('KEKV_KOD').AsInteger:=DS['KEKV_KOD'];
   RxMemoryData.FieldByName('SUMMA_GRN').AsCurrency:=DS['SUMMA_GRN'];
   RxMemoryData.FieldByName('SUMMA_VAL').AsCurrency:=DS['SUMMA_VAL'];

   RxMemoryData.FieldByName('NUM_SCH_DB').Value:=DS['NUM_SCH_DB'];
   RxMemoryData.FieldByName('NUM_SCH_KR').Value:=DS['NUM_SCH_KR'];
   RxMemoryData.FieldByName('FIO').value:=DS['FIO'];
   RxMemoryData.FieldByName('NUM_DOG').Value:=DS['NUM_DOG'];
   RxMemoryData.FieldByName('SYMBOL').Value:=DS['SYMBOL'];
   RxMemoryData.Post;
  end;
  DS.Next;
 end;
end;
end;

procedure TUtvProvForm.cxCloseClick(Sender: TObject);
begin
try
   ST_PR.Close;
   ST_PR.Transaction := TR;
   ST_PR.Transaction.StartTransaction;
   ST_PR.StoredProcName:='PC_TMP_CLAER';
   ST_PR.Prepare;
   ST_PR.ParamByName('ID_SESSION').AsInteger:=id_session_val;
   ST_PR.ExecProc;
   ST_PR.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    ST_PR.Transaction.Rollback;
    exit;
   end;
   end;
Close;
end;

procedure TUtvProvForm.cxKursExit(Sender: TObject);
begin
  cxSumVal.EditValue:=cxSumGrn.EditValue/(cxKurs.EditValue);
  actReWrite.Execute;
 { try
   ST_PR.Close;
   ST_PR.Transaction := TR;
   ST_PR.Transaction.StartTransaction;
   ST_PR.StoredProcName:='PC_DT_PERESCH_PROV';
   ST_PR.Prepare;
   ST_PR.ParamByName('ID_DOC').AsInteger:=id_doc_;
   ST_PR.ParamByName('ID_SESSION').AsInteger:=id_session_val;
   ST_PR.ParamByName('KURS').AsCurrency:=cxKurs.EditValue;
   ST_PR.ExecProc;
   ST_PR.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    ST_PR.Transaction.Rollback;
    exit;
   end;
   end;

   try
   ST_PR.Close;
   ST_PR.Transaction := TR;
   ST_PR.Transaction.StartTransaction;
   ST_PR.StoredProcName:='PC_DT_PROVERKA';
   ST_PR.Prepare;
   ST_PR.ParamByName('ID_DOC').AsInteger:=id_doc_;
   ST_PR.ParamByName('ID_SESSION').AsInteger:=id_session_val;
   ST_PR.ParamByName('SUMMA_DOC').AsCurrency:=cxSumVal.EditValue;
   ST_PR.ExecProc;
   ST_PR.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    ST_PR.Transaction.Rollback;
    exit;
   end;
   end;  }
 // actRefresh.Execute;
end;

procedure TUtvProvForm.DSCalcFields(DataSet: TDataSet);
begin
DSSumma_val_.value:=DSSUMMA_VAL.Value;
end;

procedure TUtvProvForm.actRefreshExecute(Sender: TObject);
begin
 {DS.Close;
 DS.SelectSQL.Clear;
 DS.SelectSQL.Add('select * from PC_DT_PROV_TMP_INFO_SEL(:id_doc, :id_session, :date_reg)');
 DS.Prepare;
 DS.ParamByName('ID_DOC').AsInteger:=id_doc_;
 DS.ParamByName('ID_SESSION').AsInteger:=id_session_val;
 ds.ParamByName('DATE_REG').AsDate:= DBEG;
 ds.CloseOpen(False);  }
end;

procedure TUtvProvForm.cxOkClick(Sender: TObject);
var res:Integer;
    ff:TVoprosForm;
var summa_prov_val:Double;
    flag_rashod,i:Integer;
    f:TUserRashForm;
begin
RxMemoryData.Open;
RxMemoryData.First;
ds.first;
summa_prov_val:=0;
flag_rashod:=0;
while not ds.eof do
begin
summa_prov_val:=summa_prov_val+RxMemoryData.FieldByName('SUMMA_VAL').AsFloat;
if flag_rashod = 0 then
if DSSUMMA_VAL.AsCurrency<>RxMemoryData.FieldByName('SUMMA_VAL').AsCurrency then flag_rashod:=1;
DS.Next;
RxMemoryData.Next;
end;
if summa_prov_val<>cxSumVal.EditValue then
begin
  ShowMessage('Сума у валюті за документом не збігається із сумою у валюті за проводками!');
  Exit;
end
else
begin
  if flag_rashod=1 then
  begin
   f:=TUserRashForm.Create(Self);
   f.cxRBUser.Checked:=True;
   f.cxRBSys.Checked:=False;
   f.ShowModal;
   if f.ModalResult = mrOk then
   begin
     if f.cxRBSys.Checked = True then
     begin
       actReWrite.Execute;
       Exit;
     end;
     if f.cxRBUser.Checked = True then
     begin
       RxMemoryData.First;
       for i:=1 to RxMemoryData.RecordCount do
       begin
         try
         ST_PR.Close;
         ST_PR.Transaction := TR;
         ST_PR.Transaction.StartTransaction;
         ST_PR.StoredProcName:='PC_PUB_DOC_PROV_TMP_UPD';
         ST_PR.Prepare;
         ST_PR.ParamByName('PC_ID_DOC').AsInteger:=id_doc_;
         ST_PR.ParamByName('ID_SESSION').AsInteger:=id_session_val;
         ST_PR.ParamByName('SUMMA_VAL').AsCurrency:=RxMemoryData.FieldByName('SUMMA_VAL').AsCurrency;
         ST_PR.ParamByName('ID_PROV').AsInteger:=RxMemoryData.FieldByName('ID_PROV').AsInteger;
         ST_PR.ExecProc;
         ST_PR.Transaction.Commit;
         except on E : Exception
         do begin
          ShowMessage(E.Message);
          ST_PR.Transaction.Rollback;
          exit;
         end;
         end;
         RxMemoryData.Next;
       end;
     end;
   end
   else Exit;
   f.free;
  end;
end;

// cxKursExit(Self);
 // перевыберем данные по документу
  {ds_doc.Close;
  DS_D.SelectSQL.Clear;
  DS_D.SelectSQL.Add('select * from PC_PUB_DOC a inner join pub_dt_all_doc b on a.pk_id=b.pk_id where a.pc_id_doc=:id_doc');
  DS_D.Prepare;
  DS_D.ParamByName('ID_DOC').asInteger:=id_doc_;
  DS_D.CloseOpen(False); }
 // проверим курс
 { try
   StPrKurs.Close;
   StPrKurs.Transaction := tr_kurs;
   StPrKurs.Transaction.StartTransaction;
   StPrKurs.StoredProcName:='PC_PROVERKA_KURS';
   StPrKurs.Prepare;
   StPrKurs.ParamByName('ID_VALUTE').AsInteger:=DS_DID_VALYUTA.AsInteger;
   StPrKurs.ParamByName('DATE_KURS').AsDate:=DS_DDATE_DOC.AsDateTime;
   StPrKurs.ExecProc;
   StPrKurs.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPrKurs.Transaction.Rollback;
    exit;
   end;
  end;
  res:=StPrKurs.ParamByName('IS_UPDATE').AsInteger;
  if StPrKurs.ParamByName('KURS').AsCurrency<>cxKurs.EditValue then
  begin
  if res=1 then
  begin
   ff:=TVoprosForm.Create(Self);
   ff.lbl1.Caption:='На '+ DateToStr(StPrKurs.ParamByName('DATE_BEG').AsDate)+' за валютою ' + StPrKurs.ParamByName('NAME_VAL').AsString+ ' ('+ StPrKurs.ParamByName('SHORT_NAME_VAL').AsString+') діє курс '+FloatToStr(StPrKurs.ParamByName('KURS').AsCurrency);
   ff.lbl2.Caption:='Ви дійсно бажаєте його змінити на '+ FloatToStr(cxKurs.EditValue)+' ?';
   ff.ShowModal;
   if ff.ModalResult=mrOk then
   try
   StPrKurs1.Close;
   StPrKurs1.Transaction := tr_kurs1;
   StPrKurs1.Transaction.StartTransaction;
   StPrKurs1.StoredProcName:='PUB_DT_VALUTE_KURS_UPD';
   StPrKurs1.Prepare;
   StPrKurs1.ParamByName('ID_VALUTE').AsInteger:=DS_DID_VALYUTA.AsInteger;
   StPrKurs1.ParamByName('KURS').AsCurrency:=cxKurs.EditValue;
   StPrKurs1.ParamByName('DATE_KURS').AsDate:=DS_DDATE_DOC.AsDateTime;
   StPrKurs1.ParamByName('IS_UPD').AsInteger:=1;
   StPrKurs1.ExecProc;
   StPrKurs1.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPrKurs1.Transaction.Rollback;
    exit;
   end;
  end
  else
  begin
  cxKurs.EditValue:=DS_DOCKURS.AsCurrency;
  cxKurs.SetFocus;
  Exit;
  end;
  ff.Free;
  end;
  if res=0 then
  begin
   ff:=TVoprosForm.Create(Self);
   ff.lbl1.Caption:='З '+ DateToStr(StPrKurs.ParamByName('DATE_BEG').AsDate)+' по '+DAteToStr(StPrKurs.ParamByName('DATE_END').AsDate)+' за валютою ' + StPrKurs.ParamByName('NAME_VAL').AsString+ '('+ StPrKurs.ParamByName('SHORT_NAME_VAL').AsString+') діє курс '+FloatToStr(StPrKurs.ParamByName('KURS').AsCurrency);
   ff.lbl2.Caption:='Ви дійсно бажаєте його змінити на '+ FloatToStr(cxKurs.EditValue)+ ' з ' +DateToStr(DS_DOCDATE_DOC.AsDateTime)+' ?';
   ff.ShowModal;
   if ff.ModalResult=mrOk then
   try
   StPrKurs1.Close;
   StPrKurs1.Transaction := tr_kurs1;
   StPrKurs1.Transaction.StartTransaction;
   StPrKurs1.StoredProcName:='PUB_DT_VALUTE_KURS_UPD';
   StPrKurs1.Prepare;
   StPrKurs1.ParamByName('ID_VALUTE').AsInteger:=DS_DID_VALYUTA.AsInteger;
   StPrKurs1.ParamByName('KURS').AsCurrency:=cxKurs.EditValue;
   StPrKurs1.ParamByName('DATE_KURS').AsDate:=DS_DDATE_DOC.AsDateTime;
   StPrKurs1.ParamByName('IS_UPD').AsInteger:=0;
   StPrKurs1.ExecProc;
   StPrKurs1.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPrKurs1.Transaction.Rollback;
    exit;
   end;
  end
  else
  begin
  cxKurs.EditValue:=DS_DOCKURS.AsCurrency;
  cxKurs.SetFocus;
  Exit;
  end;
  ff.Free;
  end;
  if res=-1 then
  begin
   try
   StPrKurs1.Close;
   StPrKurs1.Transaction := tr_kurs1;
   StPrKurs1.Transaction.StartTransaction;
   StPrKurs1.StoredProcName:='PUB_DT_VALUTE_KURS_UPD';
   StPrKurs1.Prepare;
   StPrKurs1.ParamByName('ID_VALUTE').AsInteger:=DS_DID_VALYUTA.AsInteger;
   StPrKurs1.ParamByName('KURS').AsCurrency:=cxKurs.EditValue;
   StPrKurs1.ParamByName('DATE_KURS').AsDate:=DS_DDATE_DOC.AsDateTime;
   StPrKurs1.ParamByName('IS_UPD').AsInteger:=0;
   StPrKurs1.ExecProc;
   StPrKurs1.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPrKurs1.Transaction.Rollback;
    exit;
   end
   else
  begin
  cxKurs.EditValue:=DS_DOCKURS.AsCurrency;
  cxKurs.SetFocus;
  Exit;
  end;
  end;
  end;
  end;}
 //

 try
   ST_PR.Close;
   ST_PR.Transaction := TR;
   ST_PR.Transaction.StartTransaction;
   ST_PR.StoredProcName:='PC_DT_DOC_UTV';
   ST_PR.Prepare;
   ST_PR.ParamByName('ID_SESSION').AsInteger:=id_session_val;
   ST_PR.ExecProc;
   ST_PR.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    ST_PR.Transaction.Rollback;
    exit;
   end;
   end;

   ModalResult:=mrOk;
end;

procedure TUtvProvForm.DSSUMMA_VALGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
{if ((DSSUMMA_VAL.value<>null)or (DSSUMMA_VAL.Ascurrency<>0)) then
if DSSUMMA_VAL.AsCurrency=Trunc(DSSUMMA_VAL.AsCurrency) then
 text:=  GetRazryad(DSSUMMA_VAL.AsString)+DecimalSeparator+'00 '+DSSYMBOL.Asstring
 else text:=  GetRazryad(DSSUMMA_VAL.AsString)+' '+dsSymbol.Asstring;   }
text:=FloatToStrF(DSSUMMA_VAL.AsCurrency, ffNumber, 18, 2)+' '+DSSYMBOL.AsString;
end;

procedure TUtvProvForm.actSaveExecute(Sender: TObject);
begin
cxOkClick(Self);
end;

procedure TUtvProvForm.cxValutePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var f:TSpVAlForm;
    code_val:string;
begin
 f:=TspValForm.Create(Self);
 f.ds1.DataSet:=ds_val;

 DS_VAL.Close;
 DS_VAL.SelectSQL.Clear;
 DS_VAL.SelectSQL.Text:='Select * from pub_sp_valute where id_valute in (select distinct id_valute from pub_dt_valute_kurs)  order by valute_title';
 DS_VAL.closeopen(false);

 f.ShowModal;
 if f.ModalResult = mrOk then
 begin
  cxValute.Text:=VarToStr(DS_VAL.FieldValues['VALUTE_TITLE'])+'('+DS_VAL.FieldValues['CODE_VALUTE']+')';
  code_val:= DS_VAL.FieldValues['CODE_VALUTE'];
  id_valute :=DS_VAL.FieldValues['ID_VALUTE'];
  symbol:=DS_VAL.FieldValues['SPECIAL_SIGN'];

  // находим курс
  ds_val.Close;
  DS_VAL.SelectSQL.Clear;
  DS_VAL.SelectSQL.Add(' Select first(1) a.date_kurs, b.code_valute, a.kurs, a.id_valute, b.special_sign, b.valute_title ');
  DS_VAL.SelectSQL.Add(' from pub_dt_valute_kurs a inner join pub_sp_valute b on a.id_valute=b.id_valute');
  DS_VAL.SelectSQL.Add(' where (b.code_valute=:code_valute or b.special_sign=:code_valute)');
  DS_VAL.SelectSQL.Add(' and a.date_kurs<=:date_kurs order by  1 desc');
  DS_VAL.Prepare;
  DS_VAL.ParamByName('DATE_KURS').AsDate:=DS_DOCDATE_DOC.AsDateTime;
  DS_VAL.ParamByName('CODE_VALUTE').AsString:=AnsiUpperCase(code_val);
  ds_val.closeopen(false);
 if ((DS_VAL.FieldValues['KURS'] = null) and(DS_VAL.FieldValues['CODE_VALUTE'] = null)) then
 begin
   cxValute.Text:='';
   cxKurs.EditValue:=1;
   kurs:=1;
   symbol:='';
   end
 else
 begin
  cxValute.Text:=VarToStr(DS_VAL.FieldValues['VALUTE_TITLE'])+' '+VarToStr(DS_VAL.FieldValues['CODE_VALUTE']);
  kurs:=DS_VAL.FieldValues['KURS'];
  id_valute:= DS_VAL.FieldValues['ID_VALUTE'];
  cxKurs.EditValue:=kurs;
  symbol:=DS_VAL.FieldValues['SPECIAL_SIGN'];

 end;
 cxSumVal.EditValue:=  cxSumGrn.EditValue/kurs;
 end;
 f.free;
 actReWrite.Execute;
end;

procedure TUtvProvForm.actReWriteExecute(Sender: TObject);
begin
 try
   ST_PR.Close;
   ST_PR.Transaction := TR;
   ST_PR.Transaction.StartTransaction;
   ST_PR.StoredProcName:='PC_REWRITE_DOC_IN_TMP';
   ST_PR.Prepare;
   ST_PR.ParamByName('PC_ID_DOC').AsInteger:=id_doc_;
   ST_PR.ParamByName('ID_SESSION').AsInteger:=id_session_val;
   ST_PR.ParamByName('SUMMA_DOC_VAL').AsCurrency:=cxSumVal.EditValue;
   ST_PR.ParamByName('KURS').AsCurrency:=cxKurs.EditValue;
   ST_PR.ParamByName('ID_VALUTE').AsInteger:=id_valute;
   ST_PR.ExecProc;
   ST_PR.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    ST_PR.Transaction.Rollback;
    exit;
   end;
   end;

   ds_doc.Close;
 DS_DOC.SelectSQL.Clear;
 DS_DOC.SelectSQL.Add('select * from PC_DT_DOC_TMP_SEL_INFO(:id_doc, :id_session)');
 DS_DOC.Prepare;
 DS_DOC.ParamByName('ID_DOC').asInteger:=id_doc_;
 DS_DOC.ParamByName('ID_SESSION').asInteger:=id_session_val;
 DS_DOC.CloseOpen(False);

 lbl1.Text:= DS_DOCTYPE_DOC.AsString+ ' '+DS_DOCNUM_DOC.AsString+' від '+ DS_DOCDATE_DOC.AsString;
 cxValute.text:=DS_DOCVAL_TITLE.AsString+'('+DS_DOCN_VAL.AsString+')';
 cxKurs.EditValue:=DS_DOCKURS.AsCurrency;
 id_valute:=DS_DOCID_VALUTE.AsInteger;
 kurs:=DS_DOCKURS.AsFloat;

 if ((Self.DS_DOCDB_SUMMA.Value = null) or(Self.DS_DOCDB_SUMMA.Value = 0)) then
 begin
 cxSumGrn.EditValue:=DS_DOCKR_SUMMA.AsCurrency;
 cxSumVal.EditValue:=DS_DOCKR_SUMMA_VAL.AsCurrency;
 end
 else
 begin
 cxSumGrn.EditValue:=DS_DOCDB_SUMMA.AsCurrency;
 cxSumVal.EditValue:=DS_DOCDB_SUMMA_VAL.AsCurrency;
 end;

 DS.Close;
 DS.SelectSQL.Clear;
 DS.SelectSQL.Add('select * from PC_DT_PROV_TMP_INFO_SEL(:id_doc, :id_session, :date_reg)');
 DS.Prepare;
 DS.ParamByName('ID_DOC').AsInteger:=id_doc_;
 DS.ParamByName('ID_SESSION').AsInteger:=id_session_val;
 ds.ParamByName('DATE_REG').AsDate:= DBEG;
 ds.CloseOpen(False);
 DS.First;
 RxMemoryData.EmptyTable;
 RxMemoryData.Open;
 while not DS.Eof do
 begin
  if not RxMemoryData.Locate('ID_PROV', DS['ID_PROV'],[loCaseInsensitive]) then
  begin
   RxMemoryData.Append;
   RxMemoryData.FieldByName('ID_SM').AsInteger:=DS['ID_SM'];
   RxMemoryData.FieldByName('ID_RZ').AsInteger:=DS['ID_RZ'];
   RxMemoryData.FieldByName('ID_ST').AsInteger:=DS['ID_ST'];
   RxMemoryData.FieldByName('ID_KEKV').AsInteger:=DS['ID_KEKV'];
   RxMemoryData.FieldByName('ID_SCH_DB').AsInteger:=DS['ID_SCH_DB'];
   RxMemoryData.FieldByName('ID_SCH_KR').AsInteger:=DS['ID_SCH_KR'];
   RxMemoryData.FieldByName('ID_PROV').AsInteger:=DS['ID_PROV'];
   RxMemoryData.FieldByName('ID_OPER').AsInteger:=DS['ID_OPER'];
   RxMemoryData.FieldByName('SM_KOD').AsInteger:=DS['SM_KOD'];
   RxMemoryData.FieldByName('RZ_KOD').AsInteger:=DS['RZ_KOD'];
   RxMemoryData.FieldByName('ST_KOD').AsInteger:=DS['ST_KOD'];
   RxMemoryData.FieldByName('KEKV_KOD').AsInteger:=DS['KEKV_KOD'];
   RxMemoryData.FieldByName('SUMMA_GRN').AsCurrency:=DS['SUMMA_GRN'];
   RxMemoryData.FieldByName('SUMMA_VAL').AsCurrency:=DS['SUMMA_VAL'];
   RxMemoryData.FieldByName('NUM_SCH_DB').AsString:=DS['NUM_SCH_DB'];
   RxMemoryData.FieldByName('NUM_SCH_KR').AsString:=DS['NUM_SCH_KR'];
   RxMemoryData.FieldByName('FIO').AsString:=DS['FIO'];
   RxMemoryData.FieldByName('NUM_DOG').AsString:=DS['NUM_DOG'];
   RxMemoryData.FieldByName('SYMBOL').AsString:=DS['SYMBOL'];
   RxMemoryData.Post;
  end;
  DS.Next;
 end;
end;

procedure TUtvProvForm.cxDateTimeExit(Sender: TObject);
begin
try
   ST_PR.Close;
   ST_PR.Transaction := TR;
   ST_PR.Transaction.StartTransaction;
   ST_PR.StoredProcName:='PC_REWRITE_DOC_TIME_IN_TMP';
   ST_PR.Prepare;
   ST_PR.ParamByName('PC_ID_DOC').AsInteger:=id_doc_;
   ST_PR.ParamByName('ID_SESSION').AsInteger:=id_session_val;
   ST_PR.ParamByName('DATE_OPL').AsDate:=cxDateTime.EditValue;
   ST_PR.ParamByName('TIME_OPL').AsTime:=cxTimeEdit.EditValue;
   ST_PR.ExecProc;
   ST_PR.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    ST_PR.Transaction.Rollback;
    exit;
   end;
   end;
   ds_kurs.Close;
   ds_kurs.SelectSQL.Clear;
   ds_kurs.SelectSQL.Add('select kurs from PC_SELECT_VAL_DAY_TIME(:date_kurs, :time_kurs, :id_val) ');
   ds_kurs.Prepare;
   ds_kurs.ParamByName('ID_VAL').AsInteger:=id_valute;
   ds_kurs.ParamByName('DATE_KURS').AsDate:=cxDateTime.EditValue;
   ds_kurs.ParamByName('TIME_KURS').AsTime:=cxTimeEdit.EditValue;
   ds_kurs.CloseOpen(False);
   cxKurs.EditValue:=ds_kurs.FieldValues['KURS'];
   cxKursExit(Self);
//   actReWrite.Execute;
end;

procedure TUtvProvForm.cxTimeEditExit(Sender: TObject);
begin
try
   ST_PR.Close;
   ST_PR.Transaction := TR;
   ST_PR.Transaction.StartTransaction;
   ST_PR.StoredProcName:='PC_REWRITE_DOC_TIME_IN_TMP';
   ST_PR.Prepare;
   ST_PR.ParamByName('PC_ID_DOC').AsInteger:=id_doc_;
   ST_PR.ParamByName('ID_SESSION').AsInteger:=id_session_val;
   ST_PR.ParamByName('DATE_OPL').AsDate:=cxDateTime.EditValue;
   ST_PR.ParamByName('TIME_OPL').AsTime:=cxTimeEdit.EditValue;
   ST_PR.ExecProc;
   ST_PR.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    ST_PR.Transaction.Rollback;
    exit;
   end;
   end;
   ds_kurs.Close;
   ds_kurs.SelectSQL.Clear;
   ds_kurs.SelectSQL.Add('select kurs from PC_SELECT_VAL_DAY_TIME(:date_kurs, :time_kurs, :id_val)');
   ds_kurs.Prepare;
   ds_kurs.ParamByName('ID_VAL').AsInteger:=id_valute;
   ds_kurs.ParamByName('DATE_KURS').AsDate:=cxDateTime.EditValue;
   ds_kurs.ParamByName('TIME_KURS').AsTime:=cxTimeEdit.EditValue;
   ds_kurs.CloseOpen(False);
   cxKurs.EditValue:=ds_kurs.FieldValues['KURS'];
   cxKursExit(Self);
   //actReWrite.Execute;
end;

end.
