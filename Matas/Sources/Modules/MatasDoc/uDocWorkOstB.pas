{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkOstB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet,
  cxCurrencyEdit, cxContainer, cxTextEdit, StdCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, cxButtons, ExtCtrls, FIBQuery, pFIBQuery,
  pFIBStoredProc, ImgList, cxClasses, pFIBDataSet, FIBDatabase,
  pFIBDatabase, ibase, uResources, Resources_unitb, cxSplitter, cxCheckBox,
  cxGridBandedTableView, cxGridDBBandedTableView, uMatasVars, uMatasUtils,
  cxMemo;

type
  TDocWorkOstBForm = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DocPosDataSet: TpFIBDataSet;
    DocPosDataSetID_SESSION: TFIBIntegerField;
    DocPosDataSetID_POS: TFIBIntegerField;
    DocPosDataSetID_NOMN: TFIBIntegerField;
    DocPosDataSetNAME: TFIBStringField;
    DocPosDataSetID_UNIT: TFIBIntegerField;
    DocPosDataSetUNIT: TFIBStringField;
    DocPosDataSetKOL_MAT: TFIBBCDField;
    DocPosDataSetKOL_DOC: TFIBBCDField;
    DocPosDataSetPRICE: TFIBBCDField;
    DocPosDataSetSUMMA: TFIBBCDField;
    DocPosDataSetID_SCH: TFIBIntegerField;
    DocPosDataSetNAME_SCH: TFIBStringField;
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
    PosWorkImageList: TImageList;
    DocPosDataSource: TDataSource;
    StoredProc: TpFIBStoredProc;
    Panel1: TPanel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID_SESSION: TcxGridDBColumn;
    cxGrid1DBTableView1ID_POS: TcxGridDBColumn;
    cxGrid1DBTableView1ID_NOMN: TcxGridDBColumn;
    cxGrid1DBTableView1NAME: TcxGridDBColumn;
    cxGrid1DBTableView1ID_UNIT: TcxGridDBColumn;
    cxGrid1DBTableView1UNIT: TcxGridDBColumn;
    cxGrid1DBTableView1KOL_MAT: TcxGridDBColumn;
    cxGrid1DBTableView1PRICE: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA: TcxGridDBColumn;
    cxGrid1DBTableView1ID_SCH: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_SCH: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Label1: TLabel;
    Label2: TLabel;
    cxNumDoc: TcxTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    cxTotalSum: TcxCurrencyEdit;
    Label7: TLabel;
    Label8: TLabel;
    cxNameOut: TcxTextEdit;
    cxNameIn: TcxTextEdit;
    cxDateDoc: TcxTextEdit;
    cxTipDoc: TcxTextEdit;
    DocDataSet: TpFIBDataSet;
    DocDataSource: TDataSource;
    DocPosDataSetSCH_NUMBER: TFIBStringField;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    EditButton: TcxButton;
    WorkQuery: TpFIBQuery;
    DocIstFInDataSet: TpFIBDataSet;
    DocIstFInDataSource: TDataSource;
    cxGridIstFin: TcxGrid;
    cxSplitter1: TcxSplitter;
    cxGridIstFinLevel1: TcxGridLevel;
    cxGridIstFinDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridIstFinDBBandedTableView1SM_TITLE: TcxGridDBBandedColumn;
    cxGridIstFinDBBandedTableView1SM_KOD: TcxGridDBBandedColumn;
    cxGridIstFinDBBandedTableView1RZ_TITLE: TcxGridDBBandedColumn;
    cxGridIstFinDBBandedTableView1RZ_KOD: TcxGridDBBandedColumn;
    cxGridIstFinDBBandedTableView1ST_TITLE: TcxGridDBBandedColumn;
    cxGridIstFinDBBandedTableView1ST_KOD: TcxGridDBBandedColumn;
    cxGridIstFinDBBandedTableView1KEKV_TITLE: TcxGridDBBandedColumn;
    cxGridIstFinDBBandedTableView1KEKV_KOD: TcxGridDBBandedColumn;
    cxGridIstFinDBBandedTableView1SUMMA: TcxGridDBBandedColumn;
    WorkStoredProc: TpFIBStoredProc;
    DocIstFInDataSetID_POS: TFIBBCDField;
    DocIstFInDataSetID_SM: TFIBBCDField;
    DocIstFInDataSetSM_TITLE: TFIBStringField;
    DocIstFInDataSetSM_KOD: TFIBIntegerField;
    DocIstFInDataSetID_RZ: TFIBBCDField;
    DocIstFInDataSetRZ_TITLE: TFIBStringField;
    DocIstFInDataSetRZ_KOD: TFIBIntegerField;
    DocIstFInDataSetID_ST: TFIBBCDField;
    DocIstFInDataSetST_TITLE: TFIBStringField;
    DocIstFInDataSetST_KOD: TFIBIntegerField;
    DocIstFInDataSetID_KEKV: TFIBBCDField;
    DocIstFInDataSetKEKV_TITLE: TFIBStringField;
    DocIstFInDataSetKEKV_KOD: TFIBIntegerField;
    DocIstFInDataSetANALIZE1: TFIBBCDField;
    DocIstFInDataSetANALIZE2: TFIBBCDField;
    DocIstFInDataSetANALIZE3: TFIBBCDField;
    DocIstFInDataSetANALIZE4: TFIBBCDField;
    DocIstFInDataSetANALIZE5: TFIBBCDField;
    DocIstFInDataSetANALIZE6: TFIBBCDField;
    DocIstFInDataSetANALIZE7: TFIBBCDField;
    DocIstFInDataSetANALIZE8: TFIBBCDField;
    DocIstFInDataSetANALIZE9: TFIBBCDField;
    DocIstFInDataSetANALIZE10: TFIBBCDField;
    DocIstFInDataSetSUMMA: TFIBBCDField;
    DocIstFInDataSetPERCENT: TFIBBCDField;
    AddIstFinButton: TcxButton;
    cxButton1: TcxButton;
    DocDataSetID_DOC: TFIBBCDField;
    DocDataSetID_TIPD: TFIBBCDField;
    DocDataSetTIPD: TFIBStringField;
    DocDataSetNAME_TIPD: TFIBStringField;
    DocDataSetKOD_DOC: TFIBSmallIntField;
    DocDataSetNUM_DOC: TFIBStringField;
    DocDataSetDATE_DOC: TFIBDateField;
    DocDataSetOSN_ID_TIPD: TFIBBCDField;
    DocDataSetOTIPD: TFIBStringField;
    DocDataSetNAME_OSN: TFIBStringField;
    DocDataSetOSN_NUM_DOC: TFIBStringField;
    DocDataSetOSN_DATE_DOC: TFIBDateField;
    DocDataSetID_MO_IN: TFIBBCDField;
    DocDataSetFIO_MO_IN: TFIBStringField;
    DocDataSetFIO_IN: TFIBStringField;
    DocDataSetNAME_DEP_IN: TFIBStringField;
    DocDataSetID_MO_OUT: TFIBBCDField;
    DocDataSetFIO_MO_OUT: TFIBStringField;
    DocDataSetFIO_OUT: TFIBStringField;
    DocDataSetNAME_DEP_OUT: TFIBStringField;
    DocDataSetID_CUST: TFIBBCDField;
    DocDataSetNAME_CUSTOMER: TFIBStringField;
    DocDataSetOKPO_CUSTOMER: TFIBStringField;
    DocDataSetNAME_IN: TFIBStringField;
    DocDataSetNAME_OUT: TFIBStringField;
    DocDataSetSUMMA: TFIBBCDField;
    DocDataSetSUMMA_DOC: TFIBBCDField;
    DocDataSetID_MAN: TFIBBCDField;
    DocDataSetFIO_MAN: TFIBStringField;
    DocDataSetSFIO_MAN: TFIBStringField;
    DocDataSetDOV_NUM: TFIBStringField;
    DocDataSetDOV_DATE: TFIBDateField;
    DocDataSetDATE_REC: TFIBDateField;
    DocDataSetPERIOD: TFIBStringField;
    DocDataSetPUB_ID_DOC: TFIBBCDField;
    DocDataSetNUM_REESTR: TFIBStringField;
    DocDataSetDATE_REESTR: TFIBDateField;
    DocDataSetUSER_NAME: TFIBStringField;
    DocDataSetCOMPUTER: TFIBStringField;
    DocDataSetDATETIME: TFIBDateTimeField;
    DocDataSetDIR_KOMISSIA: TFIBStringField;
    DocDataSetKOMISSIA: TFIBStringField;
    DocDataSetNUM_PRIKAZ_KOMISSIA: TFIBStringField;
    DocDataSetDATE_PRIKAZ_KOMISSIA: TFIBDateField;
    DocDataSetDOC_NOTE: TFIBStringField;
    DocDataSetINV_KART_MODE: TFIBIntegerField;
    DocDataSetMNA_KART_MODE: TFIBIntegerField;
    DocDataSetIKOL_MAT: TFIBBCDField;
    DocDataSetIKOL_DOC: TFIBBCDField;
    DocDataSetCOUNT_POS: TFIBIntegerField;
    DocDataSetPUB_ID_USER: TFIBBCDField;
    DocDataSetPUB_USER_NAME: TFIBStringField;
    DocDataSetPUB_USER_FULL_NAME: TFIBStringField;
    DocDataSetPUB_COMPUTER: TFIBStringField;
    DocDataSetPUB_DATETIME: TFIBDateTimeField;
    DocDataSetTIP_WORK: TFIBIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure DocDataSetCalcFields(DataSet: TDataSet);
    procedure CancelButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AddIstFinButtonClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    DBHandle: TISC_DB_HANDLE;
  public
    ID_DOC, ID_SESSION: integer;
    DATE_DOC: TDateTime;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; ID_DOC: integer; DATE_DOC: TDateTime);overload;
  end;

var
  DocWorkOstBForm: TDocWorkOstBForm;

implementation

uses uDocWorkPosEditForm, uDocWorkBudgetEditForm;
{$R *.dfm}

constructor TDocWorkOstBForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; ID_DOC: integer; DATE_DOC: TDateTime);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.WorkDatabase.Close;
   Self.WorkDatabase.Handle:=DBHANDLE;
 end;
 Self.ID_DOC:=ID_DOC;
 Self.DATE_DOC:=DATE_DOC;
 Self.EditButton.Caption:=MAT_ACTION_UPDATE_CONST;
 Self.OkButton.Caption:=MAT_BUTTON_OK_CONST;
 Self.CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
end;

procedure TDocWorkOstBForm.FormCreate(Sender: TObject);
var
 w: TForm;
begin
 w:=ShowWaitWindow(self);
 ID_SESSION:=-1;
 Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_WORK_OSTB;
// DocDataSet.ParamByName('DATE_BEG').Value:=DATE_DOC;
// DocDataSet.ParamByName('DATE_END').Value:=DATE_DOC;
 DocDataSet.ParamByName('ID_DOC').Value:=ID_DOC;
 DocDataSet.CloseOpen(True);
 cxTipDoc.Text:=DocDataSetTIPD.AsString;
 cxNumDoc.Text:=DocDataSetNUM_DOC.AsString;
 cxDateDoc.Text:=DocDataSetDATE_DOC.AsString;
 cxNameOut.Text:=DocDataSetNAME_OUT.AsString;
 cxNameIn.Text:=DocDataSetNAME_IN.AsString;
 cxTotalSum.Text:=DocDataSetSUMMA.AsString;
 try
  StoredProc.ParamByName('ID_DOC').Value:=ID_DOC;
  StoredProc.Transaction := ReadTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
  ID_SESSION:=StoredProc.ParamByName('ID_SESSION').AsInteger;
 except on E : Exception
  do begin
   ShowMessage(E.Message);
   StoredProc.Transaction.Rollback;
   exit;
  end;
 end;
 DocPosDataSet.ParamByName('ID_SESSION').Value:=ID_SESSION;
 DocPosDataSet.CloseOpen(false);
 DocIstFInDataSet.ParamByName('PID_SESSION').Value:=ID_SESSION;
 DocIstFInDataSet.CloseOpen(false);
 // скрываем данные об источнике, если хозрасчет
 if _TYPE_ACCOUNT = 2 then cxSplitter1.CloseSplitter;
 CloseWaitWindow(w);
end;

procedure TDocWorkOstBForm.DocDataSetCalcFields(DataSet: TDataSet);
begin
  if DocDataSetID_MO_IN.Value<>0 then
 begin
  DocDataSetNAME_IN.Value:=DocDataSetFIO_MO_IN.Value;
  if DocDataSetID_CUST.Value<>0 then
   DocDataSetNAME_OUT.Value:=DocDataSetNAME_CUSTOMER.Value;
 end;
 if DocDataSetID_MO_OUT.Value<>0 then
 begin
  DocDataSetNAME_OUT.Value:=DocDataSetFIO_MO_OUT.Value;
  if DocDataSetID_CUST.Value<>0 then
   DocDataSetNAME_IN.Value:=DocDataSetNAME_CUSTOMER.Value;
 end;
end;

procedure TDocWorkOstBForm.CancelButtonClick(Sender: TObject);
begin
 try
  WorkQuery.SQL.Clear;
  WorkQuery.SQL.Add('DELETE FROM MAT_DT_DOC_POS_INTF WHERE ID_SESSION='+IntToStr(ID_SESSION));
  WorkQuery.Transaction.StartTransaction;
  WorkQuery.ExecProc;
  WorkQuery.SQL.Clear;
  WorkQuery.SQL.Add('DELETE FROM MAT_DT_DOC_ISTFIN_INTF WHERE ID_SESSION='+IntToStr(ID_SESSION));
  WorkQuery.ExecProc;
  WorkQuery.Transaction.Commit;
 except on E : Exception
  do begin
   ShowMessage(E.Message);
   WorkQuery.Transaction.Rollback;
   exit;
  end;
 end;
 ModalResult:=mrCancel;
end;

procedure TDocWorkOstBForm.EditButtonClick(Sender: TObject);
var
 pform: TDocWorkPosEditForm;
 ID_POS: integer;
 update_smeta: boolean;
begin
 if DocPosDataSet.IsEmpty then
  exit;
 id_pos:=DocPosDataSet.FieldByName('ID_POS').AsInteger;
 pform:=TDocWorkPosEditForm.Create(self);
 pform.Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_WORK_OSTB+' :: '+MAT_STR_MODE_EDIT;
 pform.DBHANDLE:=self.DBHANDLE;
 update_smeta:=false;
 pform.ID_MO_OUT:=0;
 pform.ID_NOMN:=DocPosDataSet.FieldByName('ID_NOMN').AsInteger;
 pform.cxName.Text:=DocPosDataSet.FieldByName('NAME').AsString;
 pform.ID_UNIT:=DocPosDataSet.FieldByName('ID_UNIT').AsInteger;
 pform.cxKolMat.EditValue:=DocPosDataSet.FieldByName('KOL_MAT').AsFloat;
 pform.cxKolDoc.EditValue:=DocPosDataSet.FieldByName('KOL_DOC').AsFloat;
 pform.cxPrice.EditValue:=DocPosDataSet.FieldByName('PRICE').AsFloat;
 pform.cxSumma.EditValue:=DocPosDataSet.FieldByName('SUMMA').AsFloat;
 pform.ID_SCH:=DocPosDataSet.FieldByName('ID_SCH').AsInteger;
 pform.cxNameSch.Text:=DocPosDataSet.FieldByName('SCH_NUMBER').AsString;
 pform.cxUnit.Text:=DocPosDataSet.FieldByName('UNIT').AsString;
 pform.cxKolDoc.Enabled:=false;
 pform.cxName.Enabled:=false;
 pform.cxKolMat.Enabled:=false;
 pform.cxPrice.Enabled:=false;
 pform.cxSumma.Enabled:=false;
 pform.cxUnit.Enabled:=false;
 if pform.ShowModal=mrOk then
 begin
  try
   WorkQuery.SQL.Clear;
   WorkQuery.SQL.Add('UPDATE MAT_DT_DOC_POS_INTF SET ID_SCH='+IntToStr(pform.ID_SCH)+' WHERE ID_SESSION='+IntToStr(ID_SESSION)+' AND ID_POS='+IntToStr(ID_POS));
   WorkQuery.Transaction.StartTransaction;
   WorkQuery.ExecQuery;
   WorkQuery.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    WorkQuery.Transaction.Rollback;
    exit;
   end;
  end;
  DocPosDataSet.CloseOpen(False);
  DocPosDataSet.Locate('ID_POS', id_pos, []);
  DocIstFInDataSet.CloseOpen(false);
 end;
 pform.Free;
end;

procedure TDocWorkOstBForm.OkButtonClick(Sender: TObject);
var
 w:TForm;
begin
 w:=ShowWaitWindow(self);
 try
  StoredProc.SQL.Clear;
  StoredProc.SQL.Add('EXECUTE PROCEDURE MAT_POS_MOVE_TO_OSTB(:ID_SESSION)');
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_SESSION').Value:=ID_SESSION;
  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
 except on E : Exception
  do begin
   ShowMessage(E.Message);
   StoredProc.Transaction.Rollback;
   exit;
  end;
 end;
 CloseWaitWindow(w);
 ModalResult:=mrOk;
end;

procedure TDocWorkOstBForm.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_RETURN then
 begin
  EditButtonClick(Self);
 end;
end;

procedure TDocWorkOstBForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
  Key:=VK_TAB;
 if Key=VK_ESCAPE	then
  CancelButton.SetFocus;
 if (Key=VK_F10) or ((Key=VK_END) and (Shift=[ssCtrl])) then
  OkButton.SetFocus;
end;

procedure TDocWorkOstBForm.AddIstFinButtonClick(Sender: TObject);
var
 bform: TDocWorkBudgetEditForm;
 ID_POS: integer;
 Vals: array of variant;
begin
  bform:=TDocWorkBudgetEditForm.Create(self);
  bform.Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_DOCWORK+' :: '+MAT_STR_MODE_ADD;
  bform.DBHANDLE:=WorkDatabase.Handle;
  bform.cxSumma.Enabled:=false;
  if bform.ShowModal=mrOk then
  begin
   ID_POS:=DocPosDataSet.FieldByName('ID_POS').AsInteger;
//MAT_DT_DOC_ISTFIN_INTF_UPDATE
//MAT_DT_DOC_ISTFIN_INTF_UPD_EX
// 0    ID_SESSION NUMERIC(10,0),
// 1    ID_POS NUMERIC(10,0),
// 2    ID_SM NUMERIC(10,0),
// 3    ID_RZ NUMERIC(10,0),
// 4    ID_ST NUMERIC(10,0),
// 5    ID_KEKV NUMERIC(10,0),
// 6    ANALIZE1 NUMERIC(10,0),
// 7    ANALIZE2 NUMERIC(10,0),
// 8    ANALIZE3 NUMERIC(10,0),
// 9    ANALIZE4 NUMERIC(10,0),
//10    ANALIZE5 NUMERIC(10,0),
//11    ANALIZE6 NUMERIC(10,0),
//12    ANALIZE7 NUMERIC(10,0),
//13    ANALIZE8 NUMERIC(10,0),
//14    ANALIZE9 NUMERIC(10,0),
//15    ANALIZE10 NUMERIC(10,0),
//16    SUMMA NUMERIC(16,2),
//17    PERCENT DECIMAL(16,4))

    SetLength(Vals, 18);
    Vals[0]  := ID_SESSION;
    Vals[1]  := ID_POS;
    Vals[2]  := bform.ID_SM;
    Vals[3]  := bform.ID_RZ;
    Vals[4]  := bform.ID_ST;
    Vals[5]  := bform.ID_KEKV;
    Vals[6]  := Null;
    Vals[7]  := Null;
    Vals[8]  := Null;
    Vals[9]  := Null;
    Vals[10] := Null;
    Vals[11] := Null;
    Vals[12] := Null;
    Vals[13] := Null;
    Vals[14] := Null;
    Vals[15] := Null;
    Vals[16] := DocPosDataSet.FieldByName('SUMMA').AsFloat;
    Vals[17] := 100;
    try
     WorkStoredProc.Close;
     WorkStoredProc.Transaction := WriteTransaction;
     WorkStoredProc.Transaction.StartTransaction;
     WorkStoredProc.StoredProcName:='MAT_DT_DOC_ISTFIN_INTF_UPDATE';
     WorkStoredProc.Prepare;
     WorkStoredProc.ExecProcedure('MAT_DT_DOC_ISTFIN_INTF_UPDATE', vals);
     WorkStoredProc.Transaction.Commit;
    except on E : Exception
     do begin
      ShowMessage(E.Message);
      WorkStoredProc.Transaction.Rollback;
     end;
    end;
   DocIstFinDataSet.CloseOpen(false);
  end;
  bform.Free;
end;

procedure TDocWorkOstBForm.cxButton1Click(Sender: TObject);
var
 bform: TDocWorkBudgetEditForm;
 ID_POS: integer;
 Vals: array of variant;
begin
  bform:=TDocWorkBudgetEditForm.Create(self);
  bform.Caption:=MAT_SYS_PREFIX+MAT_FORMCAP_DOCWORK+' :: '+MAT_STR_MODE_ADD;
  bform.DBHANDLE:=WorkDatabase.Handle;
  bform.cxSumma.Enabled:=false;
  if bform.ShowModal=mrOk then
  begin
   ID_POS:=DocPosDataSet.FieldByName('ID_POS').AsInteger;
//MAT_DT_DOC_ISTFIN_INTF_UPD_EX
// 0    ID_SESSION NUMERIC(10,0),
// 1    ID_SM NUMERIC(10,0),
// 2    ID_RZ NUMERIC(10,0),
// 3    ID_ST NUMERIC(10,0),
// 4    ID_KEKV NUMERIC(10,0),
// 5    ANALIZE1 NUMERIC(10,0),
// 6    ANALIZE2 NUMERIC(10,0),
// 7    ANALIZE3 NUMERIC(10,0),
// 8    ANALIZE4 NUMERIC(10,0),
// 9    ANALIZE5 NUMERIC(10,0),
//10    ANALIZE6 NUMERIC(10,0),
//11    ANALIZE7 NUMERIC(10,0),
//12    ANALIZE8 NUMERIC(10,0),
//13    ANALIZE9 NUMERIC(10,0),
//14    ANALIZE10 NUMERIC(10,0),

    SetLength(Vals, 15);
    Vals[0]  := ID_SESSION;
    Vals[1]  := bform.ID_SM;
    Vals[2]  := bform.ID_RZ;
    Vals[3]  := bform.ID_ST;
    Vals[4]  := bform.ID_KEKV;
    Vals[5]  := Null;
    Vals[6]  := Null;
    Vals[7]  := Null;
    Vals[8]  := Null;
    Vals[9] := Null;
    Vals[10] := Null;
    Vals[11] := Null;
    Vals[12] := Null;
    Vals[13] := Null;
    Vals[14] := Null;
    try
     WorkStoredProc.Close;
     WorkStoredProc.Transaction := WriteTransaction;
     WorkStoredProc.Transaction.StartTransaction;
     WorkStoredProc.StoredProcName:='MAT_DT_DOC_ISTFIN_INTF_UPD_EX';
     WorkStoredProc.Prepare;
     WorkStoredProc.ExecProcedure('MAT_DT_DOC_ISTFIN_INTF_UPD_EX', vals);
     WorkStoredProc.Transaction.Commit;
    except on E : Exception
     do begin
      ShowMessage(E.Message);
      WorkStoredProc.Transaction.Rollback;
     end;
    end;
   DocIstFinDataSet.CloseOpen(false);
  end;
  bform.Free;
end;

end.
