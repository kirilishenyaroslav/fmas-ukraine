unit uAddDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxLookAndFeelPainters, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxMaskEdit, cxButtonEdit, ibase,
  uMainPerem, cxCheckBox, cxCurrencyEdit, FIBDatabase, pFIBDatabase,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, FIBQuery, pFIBQuery, pFIBStoredProc, DogLoaderUnit, GlobalSpr,
  FIBDataSet, pFIBDataSet, cn_Common_Types, cn_Common_Loader, ST_Loader_Unit,
  ActnList, Placemnt, DateUtils, cxRadioGroup;

type
  TAddDocForm = class(TForm)
    pnl1: TPanel;
    lbl10: TLabel;
    lbl20: TLabel;
    cxNameKrSch: TcxButtonEdit;
    cxDogEdit: TcxButtonEdit;
    pnl2: TPanel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    pnl3: TPanel;
    AddBut: TcxButton;
    UpdBut: TcxButton;
    DelBut: TcxButton;
    SaldoDS: TpFIBDataSet;
    SaldoDB: TpFIBDatabase;
    SaldoStoredProc: TpFIBStoredProc;
    SaldoTr: TpFIBTransaction;
    ds: TDataSource;
    cxgrdbclmnSmeta: TcxGridDBColumn;
    cxgrdbclmnRz: TcxGridDBColumn;
    cxgrdbclmnSt: TcxGridDBColumn;
    cxgrdbclmnKEKV: TcxGridDBColumn;
    cxgrdbclmnDB_Sum: TcxGridDBColumn;
    cxgrdbclmnKR_Sum: TcxGridDBColumn;
    SaldoDSID: TFIBBCDField;
    SaldoDSID_DOG: TFIBBCDField;
    SaldoDSKOD_DOG: TFIBBCDField;
    SaldoDSID_SM: TFIBBCDField;
    SaldoDSID_RZ: TFIBBCDField;
    SaldoDSID_ST: TFIBBCDField;
    SaldoDSID_KEKV: TFIBBCDField;
    SaldoDSDB_SUMMA: TFIBBCDField;
    SaldoDSKR_SUMMA: TFIBBCDField;
    SaldoDSSM_TITLE: TFIBStringField;
    SaldoDSSM_KOD: TFIBIntegerField;
    SaldoDSRZ_TITLE: TFIBStringField;
    SaldoDSRZ_KOD: TFIBIntegerField;
    SaldoDSST_TITLE: TFIBStringField;
    SaldoDSST_KOD: TFIBIntegerField;
    SaldoDSKEKV_TITLE: TFIBStringField;
    SaldoDSKEKV_KOD: TFIBIntegerField;
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
    WriteTr: TpFIBTransaction;
    SaldoDSFIO: TFIBStringField;
    actlst1: TActionList;
    actOk: TAction;
    lbl1: TLabel;
    cxVal: TcxButtonEdit;
    lbl2: TLabel;
    cxKurs: TcxCurrencyEdit;
    ds_val: TpFIBDataSet;
    ds_valCODE_VALUTE: TFIBStringField;
    ds_valVALUTE_TITLE: TFIBStringField;
    ds_valID_VALUTE: TFIBBCDField;
    ds_valSPECIAL_SIGN: TFIBStringField;
    ds_kurs: TpFIBDataSet;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    SaldoDSDB_SUMMA_VAL: TFIBBCDField;
    SaldoDSKR_SUMMA_VAL: TFIBBCDField;
    SaldoDSID_VALUTE: TFIBBCDField;
    SaldoDSCODE_VAL: TFIBStringField;
    SaldoDSSYMBOL: TFIBStringField;
    cxgrdbclmnSM_KOD: TcxGridDBColumn;
    cxgrdbclmnRZ_KOD: TcxGridDBColumn;
    cxgrdbclmnST_KOD: TcxGridDBColumn;
    cxgrdbclmnKEKV_KOD: TcxGridDBColumn;
    cxgrdbclmnDB_SUMMA: TcxGridDBColumn;
    cxgrdbclmnKR_SUMMA: TcxGridDBColumn;
    cxgrdbclmnDB_SUMMA_VAL: TcxGridDBColumn;
    cxgrdbclmnKR_SUMMA_VAL: TcxGridDBColumn;
    cxgrdbclmnCODE_VAL: TcxGridDBColumn;
    actIns: TAction;
    actEdit: TAction;
    actDel: TAction;
    CxDebet: TcxRadioButton;
    cxKredit: TcxRadioButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cxNameKrSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CancelButtonClick(Sender: TObject);
    procedure cxDogEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure AddButClick(Sender: TObject);
    procedure UpdButClick(Sender: TObject);
    procedure DelButClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actOkExecute(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxValPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SaldoDSDB_SUMMA_VALGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure SaldoDSKR_SUMMA_VALGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure actInsExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
  private
   DBHANDLE : TISC_DB_HANDLE;
  public
   D_rec:TDateTime;
   KOD_DOG, ID_DOG: int64;
   ID_SCH, id_rec: integer;
   is_come:Integer;
   id_pos_for_upd, is_upd: Integer;
   id_valute:Integer;
   code_val, symbol:string;
   kurs:Double;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; date_rec:TDateTime; add_upd:integer; id_pos:integer);overload;
  end;

var
  AddDocForm: TAddDocForm;

implementation

{$R *.dfm}
uses uWate, uAddInsIstFin, uDel, uSpValSaldo, uAddIstFinVal;

constructor TAddDocForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; date_rec:TDateTime;  add_upd:integer; id_pos:integer);
var month, year:Word;
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
  Self.DBHANDLE := DBHandle;
  Self.SaldoDB.Close;
  Self.SaldoDB.Handle:=DBHANDLE;
  d_rec:=date_rec;
  ID_DOG:=0;
  KOD_DOG:=2;
  id_sch:=0;
  is_upd:=0;
  if add_upd = 0 then Caption:='Додання сальдо'
  else Caption:='Редагування сальдо';
  id_pos_for_upd:=id_pos;
  is_come:=0;
  id_valute:=0;
  code_val:='';
  symbol:='';
  kurs:=0;
  if FORM_UCH=19 then
  begin
    Self.Label1.Visible:=True;
    cxKredit.Visible:=True;
    cxDebet.Visible:=True;
    cxDebet.Checked:=True;
    cxKredit.Checked:=False;
    end
    else
    begin
       Self.Label1.Visible:=False;
       cxKredit.Visible:=False;
       cxDebet.Visible:=False;
      end
 //  FormStorage1.RestoreFormPlacement;
 end;
end;

procedure TAddDocForm.FormCreate(Sender: TObject);
begin
 DBHANDLE:= MAIN_DB_HANDLE;
 SaldoDB.Handle:=DBHANDLE;
end;

procedure TAddDocForm.cxNameKrSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=GlobalSPR.GetSch(self, DBHandle, fsNormal, PERS_PAY_PERIOD, PC_ID_SCH_ROOT, FORM_UCH, ID_SCH);
 if VarArrayDimCount(Res)>0 then
 begin
  ID_SCH := Res[0][0];
  cxNameKRSch.Text := VarToStr(RES[0][3]);
 end;
 if cxNameKRSch.Text <>'' then cxDogEdit.Enabled:=True;
end;

procedure TAddDocForm.CancelButtonClick(Sender: TObject);
begin
try
 SaldoStoredProc.Close;
 SaldoStoredProc.Transaction := SaldoTr;
 SaldoStoredProc.Transaction.StartTransaction;
 SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_DELETE';
 SaldoStoredProc.Prepare;
 SaldoStoredProc.ParamByName('ID').AsInteger:=0;
 SaldoStoredProc.ParamByName('IF_ALL').AsInteger:=1;
 SaldoStoredProc.ParamByName('ID_SES').AsInteger:=USER_ID;
 SaldoStoredProc.ExecProc;
 SaldoStoredProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  SaldoStoredProc.Transaction.Rollback;
  exit;
 end;
end;
Close;
end;

procedure TAddDocForm.cxDogEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var input : TDogInput;
    dog_pos: TDogLocateInfo;
    dog_filter: TDogFilter;
    res   : TDogResult;
    res_st : Variant;
    cur_summa: double;
    wait:TWateForm;
    i,l:Integer;
    vals: array of Variant;
    AParameter : TcnSimpleParamsEx;
    ResOpl     : Variant;
begin
is_come:=is_come+1;
if is_come > 1 then
begin
 try
 SaldoStoredProc.Close;
 SaldoStoredProc.Transaction := SaldoTr;
 SaldoStoredProc.Transaction.StartTransaction;
 SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_DELETE';
 SaldoStoredProc.Prepare;
 SaldoStoredProc.ParamByName('ID').AsInteger:=0;
 SaldoStoredProc.ParamByName('IF_ALL').AsInteger:=1;
 SaldoStoredProc.ParamByName('ID_SES').AsInteger:=USER_ID;
 SaldoStoredProc.ExecProc;
 SaldoStoredProc.Transaction.Commit;
 except on E : Exception
 do begin
  ShowMessage(E.Message);
  SaldoStoredProc.Transaction.Rollback;
  exit;
 end;
 end;
end;
 // контракты
if FORM_UCH = 20 then
begin
 AParameter                              := TcnSimpleParamsEx.Create;
 AParameter.Owner                        := self;
 AParameter.Db_Handle                    := SaldoDB.Handle;
 AParameter.Formstyle                    := fsNormal;
 AParameter.cnParamsToPakage.Note        := '';
 AParameter.WaitPakageOwner              := self;
 AParameter.cnParamsToPakage.IsWithSumma := True;
 AParameter.cnParamsToPakage.Summa       := 0;
 ResOpl:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_ContractsList.bpl','ShowSPContractsList');

 if VarArrayDimCount(ResOpl)>0
 then begin
  l := ResOpl[0][11];  //ShowMessage(IntToStr(l));
  for i := 1 to l do
  begin
   try
    SaldoStoredProc.Close;
    SaldoStoredProc.Transaction := SaldoTr;
    SaldoStoredProc.Transaction.StartTransaction;
    SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_INSERT';
    SaldoStoredProc.Prepare;
    SaldoStoredProc.ParamByName('ID_DOG').AsInt64:=ResOpl[0][2];
    SaldoStoredProc.ParamByName('KOD_DOG').AsInt64:=CN_KOD_DOG;  //константа
    SaldoStoredProc.ParamByName('ID_SM').AsInteger:=StrToInt64(ResOpl[i][0]);
    SaldoStoredProc.ParamByName('ID_RZ').AsInteger:=StrToInt64(ResOpl[i][1]);
    SaldoStoredProc.ParamByName('ID_ST').AsInteger:=ResOpl[i][2];
    SaldoStoredProc.ParamByName('ID_KEKV').AsInteger:=ResOpl[i][3];
    SaldoStoredProc.ParamByName('DB_SUMMA').Value:=0;
    SaldoStoredProc.ParamByName('KR_SUMMA').Value:=0;
    SaldoStoredProc.ParamByName('ID_SES').AsInt64:=USER_ID;
    SaldoStoredProc.ParamByName('DB_SUMMA_VAl').Value:=0;
    SaldoStoredProc.ParamByName('KR_SUMMA_VAL').Value:=0;
    SaldoStoredProc.ParamByName('ID_VALUTE').AsInteger:=id_valute;
    SaldoStoredProc.ExecProc;
    SaldoStoredProc.Transaction.Commit;
    except on E : Exception
    do begin
    ShowMessage(E.Message);
    SaldoStoredProc.Transaction.Rollback;
    exit;
    end;
   end;
   cxDogEdit.Text:= IntToStr(ResOpl[0][1]);
   ID_DOG:= ResOpl[0][2];
  end;
  if l = 0 then
  begin
    try
    SaldoStoredProc.Close;
    SaldoStoredProc.Transaction := SaldoTr;
    SaldoStoredProc.Transaction.StartTransaction;
    SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_INSERT';
    SaldoStoredProc.Prepare;
    SaldoStoredProc.ParamByName('ID_DOG').AsInt64:=ResOpl[0][2];
    SaldoStoredProc.ParamByName('KOD_DOG').AsInt64:=CN_KOD_DOG;  //константа
    SaldoStoredProc.ParamByName('ID_SM').AsInteger:=0;
    SaldoStoredProc.ParamByName('ID_RZ').AsInteger:=0;
    SaldoStoredProc.ParamByName('ID_ST').AsInteger:=0;
    SaldoStoredProc.ParamByName('ID_KEKV').AsInteger:=0;
    SaldoStoredProc.ParamByName('DB_SUMMA').Value:=0;
    SaldoStoredProc.ParamByName('KR_SUMMA').Value:=0;
    SaldoStoredProc.ParamByName('ID_SES').AsInt64:=USER_ID;
    SaldoStoredProc.ParamByName('DB_SUMMA_VAl').Value:=0;
    SaldoStoredProc.ParamByName('KR_SUMMA_VAL').Value:=0;
    SaldoStoredProc.ParamByName('ID_VALUTE').AsInteger:=id_valute;
    SaldoStoredProc.ExecProc;
    SaldoStoredProc.Transaction.Commit;
    except on E : Exception
    do begin
    ShowMessage(E.Message);
    SaldoStoredProc.Transaction.Rollback;
    exit;
    end;
   end;
   cxDogEdit.Text:= IntToStr(ResOpl[0][1]);
   ID_DOG:= ResOpl[0][2];
  end;
 end;
 SaldoDS.Close;
 SaldoDS.SelectSQL.Clear;
 SaldoDS.SelectSQL.Add('SELECT * FROM PC_TMP_SALDO_DOG_ADD_SELECT(:ID_SES, :DATE_REG, :ID_REG)');
 SaldoDS.ParamByName('ID_SES').AsInt64:=USER_ID;
 SaldoDS.ParamByName('DATE_REG').AsDate:=D_rec;
 SaldoDS.ParamByName('ID_REG').AsInteger:=ID_REG;
 SaldoDS.CloseOpen(false);
end;
// студгородок
if FORM_UCH = 19 then
 begin

  Res_st := Load_st_BuildLivers(self, DBHANDLE, True, '', '',0 ,True);
  if VarArrayDimCount(Res_st)>0 then
  begin
  for i := 1 to VarArrayHighBound(Res_st,1)-1  do begin
   try
    SaldoStoredProc.Close;
    SaldoStoredProc.Transaction := SaldoTr;
    SaldoStoredProc.Transaction.StartTransaction;
    SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_INSERT';
    SaldoStoredProc.Prepare;
    SaldoStoredProc.ParamByName('ID_DOG').AsInt64:=Res_st[0][0];
    SaldoStoredProc.ParamByName('KOD_DOG').AsInt64:=ST_KOD_DOG;  //константа
    SaldoStoredProc.ParamByName('ID_SM').AsInteger:=StrToInt64(Res_st[i][0]);
    SaldoStoredProc.ParamByName('ID_RZ').AsInteger:=StrToInt64(Res_st[i][1]);
    SaldoStoredProc.ParamByName('ID_ST').AsInteger:=Res_st[i][2];
    SaldoStoredProc.ParamByName('ID_KEKV').AsInteger:=Res_st[i][3];
    SaldoStoredProc.ParamByName('DB_SUMMA_VAL').Value:=0;
    SaldoStoredProc.ParamByName('KR_SUMMA_VAL').Value:=0;
    SaldoStoredProc.ParamByName('ID_SES').AsInt64:=USER_ID;
    if  cxDebet.Checked=True then
    begin
    SaldoStoredProc.ParamByName('DB_SUMMA').Value:=Res_st[i][4];;
    SaldoStoredProc.ParamByName('KR_SUMMA').Value:=0;
    end
    else
    begin
    SaldoStoredProc.ParamByName('DB_SUMMA').Value:=0;
    SaldoStoredProc.ParamByName('KR_SUMMA').Value:=Res_st[i][4];;
    end;
    SaldoStoredProc.ParamByName('ID_VALUTE').AsInteger:=id_valute;
    SaldoStoredProc.ExecProc;
    SaldoStoredProc.Transaction.Commit;
    except on E : Exception
    do begin
       ShowMessage(E.Message);
       SaldoStoredProc.Transaction.Rollback;
       exit;
       end;
   end;
//    ShowMessage('1');
   ID_DOG:= Res_st[0][0];
   end;
  end;

 SaldoDS.Close;
 SaldoDS.SelectSQL.Clear;
 SaldoDS.SelectSQL.Add('SELECT * FROM PC_TMP_SALDO_DOG_ADD_SELECT(:ID_SES, :DATE_REG, :ID_REG)');
 SaldoDS.ParamByName('ID_SES').AsInt64:=USER_ID;
 SaldoDS.ParamByName('DATE_REG').AsDate:=D_rec;
 SaldoDS.ParamByName('ID_REG').AsInteger:=ID_REG;
 SaldoDS.CloseOpen(false);
 cxDogEdit.Text:= SaldoDS.FieldValues['FIO'];
 if IS_VALYUTA =1 then  cxGrid1DBTableView1.ViewData.Expand(true);
end;
end;

procedure TAddDocForm.AddButClick(Sender: TObject);
var form:TAddUpdIstFinForm;
    f_val:TAddIstValForm;
    vals: array of Variant;
begin
{ if IS_VALYUTA <>1then
 begin
form:=TAddUpdIstFinForm.Create(Self, MAIN_DB_HANDLE, 0);
form.lbl3.Caption:=SaldoDSFIO.AsString;
Form.ShowModal;
if Form.ModalResult = mrOk then
begin
 try
 SaldoStoredProc.Close;
 SaldoStoredProc.Transaction := SaldoTr;
 SaldoStoredProc.Transaction.StartTransaction;
 SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_INSERT';
 SaldoStoredProc.Prepare;
 SaldoStoredProc.ParamByName('ID_DOG').AsInt64:=ID_DOG;
 SaldoStoredProc.ParamByName('KOD_DOG').AsInt64:=KOD_DOG;
 SaldoStoredProc.ParamByName('ID_SM').AsInteger:=Form.ID_SM;
 SaldoStoredProc.ParamByName('ID_RZ').AsInteger:=Form.ID_RZ;
 SaldoStoredProc.ParamByName('ID_ST').AsInteger:=Form.ID_ST;
 SaldoStoredProc.ParamByName('ID_KEKV').AsInteger:=Form.ID_KEKV;
 SaldoStoredProc.ParamByName('DB_SUMMA').Value:=Form.D_summa;
 SaldoStoredProc.ParamByName('KR_SUMMA').Value:=Form.K_summa;
 SaldoStoredProc.ParamByName('ID_SES').AsInt64:=USER_ID;
 SaldoStoredProc.ExecProc;
 SaldoStoredProc.Transaction.Commit;
 except on E : Exception
 do begin
    ShowMessage(E.Message);
    SaldoStoredProc.Transaction.Rollback;
    exit;
    end;
 end;
end;
form.free;

SaldoDS.Close;
SaldoDS.SelectSQL.Clear;
SaldoDS.SelectSQL.Add('SELECT * FROM PC_TMP_SALDO_DOG_ADD_SELECT(:ID_SES, :DATE_REG, :ID_REG)');
SaldoDS.ParamByName('ID_SES').AsInt64:=USER_ID;
SaldoDS.ParamByName('DATE_REG').AsDate:=D_rec;
SaldoDS.ParamByName('ID_REG').AsInteger:=ID_REG;
SaldoDS.CloseOpen(false);
if (SaldoDS.FieldValues['FIO'] <>'') and (SaldoDS.FieldValues['FIO']<> null) then
cxDogEdit.Text:= SaldoDS.FieldValues['FIO'];
end;
if IS_VALYUTA = 1 then
begin
  if id_valute = 0 then begin ShowMessage('Не введена валюта!'); cxVal.SetFocus; Exit; end;
  if kurs = 0 then begin ShowMessage('Не введен курс!'); cxKurs.SetFocus; Exit; end;
  kurs:=cxKurs.EditValue;
  f_val:=TAddIstValForm.Create(Self, MAIN_DB_HANDLE, 0);;
  f_val.lblVal.Caption:=cxVal.Text;
  f_val.lblKurs.Caption:=cxKurs.Text;
  f_val.kurs:=kurs;
  f_val.lbl3.Caption:=SaldoDSFIO.AsString;
  f_val.ShowModal;
  if f_val.ModalResult = mrOk then
  begin
    try
 SaldoStoredProc.Close;
 SaldoStoredProc.Transaction := SaldoTr;
 SaldoStoredProc.Transaction.StartTransaction;
 SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_INSERT';
 SaldoStoredProc.Prepare;
 SaldoStoredProc.ParamByName('ID_DOG').AsInt64:=ID_DOG;
 SaldoStoredProc.ParamByName('KOD_DOG').AsInt64:=KOD_DOG;
 SaldoStoredProc.ParamByName('ID_SM').AsInteger:=f_val.ID_SM;
 SaldoStoredProc.ParamByName('ID_RZ').AsInteger:=f_val.ID_RZ;
 SaldoStoredProc.ParamByName('ID_ST').AsInteger:=f_val.ID_ST;
 SaldoStoredProc.ParamByName('ID_KEKV').AsInteger:=f_val.ID_KEKV;
 SaldoStoredProc.ParamByName('DB_SUMMA').Value:=f_val.D_summa;
 SaldoStoredProc.ParamByName('KR_SUMMA').Value:=f_val.K_summa;
 SaldoStoredProc.ParamByName('ID_SES').AsInt64:=USER_ID;
 SaldoStoredProc.ParamByName('DB_SUMMA_VAL').Value:=f_val.D_summa_val;
 SaldoStoredProc.ParamByName('KR_SUMMA_VAL').Value:=f_val.K_summa_val;
 SaldoStoredProc.ParamByName('ID_VALUTE').AsInteger:=id_valute;
 SaldoStoredProc.ExecProc;
 SaldoStoredProc.Transaction.Commit;
 except on E : Exception
 do begin
    ShowMessage(E.Message);
    SaldoStoredProc.Transaction.Rollback;
    exit;
    end;
 end;
end;

SaldoDS.Close;
SaldoDS.SelectSQL.Clear;
SaldoDS.SelectSQL.Add('SELECT * FROM PC_TMP_SALDO_DOG_ADD_SELECT(:ID_SES, :DATE_REG, :ID_REG)');
SaldoDS.ParamByName('ID_SES').AsInt64:=USER_ID;
SaldoDS.ParamByName('DATE_REG').AsDate:=D_rec;
SaldoDS.ParamByName('ID_REG').AsInteger:=ID_REG;
SaldoDS.CloseOpen(false);
if (SaldoDS.FieldValues['FIO'] <>'') and (SaldoDS.FieldValues['FIO']<> null) then
cxDogEdit.Text:= SaldoDS.FieldValues['FIO'];
f_val.Free;
  end;

 if IS_VALYUTA =1 then  cxGrid1DBTableView1.ViewData.Expand(true); }
end;

procedure TAddDocForm.UpdButClick(Sender: TObject);
var form:TAddUpdIstFinForm;
    f_val:TAddIstValForm;
    vals:array of Variant;
    result:Integer;
begin
{if IS_VALYUTA<>1 then
begin
if SaldoDs.IsEmpty then Exit;
id_rec:= SaldoDS.FieldValues['ID'];
form:=TAddUpdIstFinForm.Create(Self, MAIN_DB_HANDLE, 1);
if SaldoDS.FieldValues['SM_KOD']<>null then
 form.cxDbSmeta.Text:=SaldoDS.FieldValues['SM_KOD']
else form.cxDbSmeta.Text:= '';
if SaldoDS.FieldValues['RZ_KOD']<> null then
 form.cxDBRazdel.Text:=SaldoDS.FieldValues['RZ_KOD']
else form.cxDBRazdel.Text:='';
if SaldoDS.FieldValues['ST_KOD']<>null then
 form.cxDBStatya.Text:=SaldoDS.FieldValues['ST_KOD']
else form.cxDBKEKV.Text:='';
if SaldoDS.FieldValues['KEKV_KOD']<>null then
 form.cxDBKEKV.Text:=SaldoDS.FieldValues['KEKV_KOD']
else form.cxDBKEKV.Text:='';
form.Db_summa.Value:=SaldoDS.FieldValues['DB_SUMMA'];
form.Kr_summa.Value:=SaldoDS.FieldValues['KR_SUMMA'];
form.ID_SM:=SaldoDS.FieldValues['ID_SM'];
form.ID_RZ:=SaldoDS.FieldValues['ID_RZ'];
form.ID_ST:=SaldoDS.FieldValues['ID_ST'];
form.D_summa:=SaldoDS.FieldValues['DB_SUMMA'];
form.K_summa:=SaldoDS.FieldValues['KR_SUMMA'];
form.ID_KEKV:=SaldoDS.FieldValues['ID_KEKV'];
form.lbl3.Caption:=SaldoDSFIO.AsString;
Form.ShowModal;
SetLength(vals,10);
if Form.ModalResult = mrOk then
 begin
   result:=1;
  try
   SaldoStoredProc.Close;
   SaldoStoredProc.Transaction := SaldoTr;
   SaldoStoredProc.Transaction.StartTransaction;
   SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_UPDATE';
   SaldoStoredProc.Prepare;
   SaldoStoredProc.ParamByName('ID').AsInteger:=id_rec;
   SaldoStoredProc.ParamByName('ID_DOG').AsInt64:=ID_DOG;
   SaldoStoredProc.ParamByName('KOD_DOG').AsInt64:=KOD_DOG;
   SaldoStoredProc.ParamByName('ID_SM').AsInteger:=Form.ID_SM;
   SaldoStoredProc.ParamByName('ID_RZ').AsInteger:=Form.ID_RZ;
   SaldoStoredProc.ParamByName('ID_ST').AsInteger:=Form.ID_ST;
   SaldoStoredProc.ParamByName('ID_KEKV').AsInteger:=Form.ID_KEKV;
   SaldoStoredProc.ParamByName('DB_SUMMA').Value:=Form.D_summa;
   SaldoStoredProc.ParamByName('KR_SUMMA').Value:=Form.K_summa;
   SaldoStoredProc.ParamByName('ID_SES').AsInt64:=USER_ID;
   SaldoStoredProc.ExecProc;
   SaldoStoredProc.Transaction.Commit;
  except on E : Exception
  do begin
    ShowMessage(E.Message);
    SaldoStoredProc.Transaction.Rollback;
    exit;
     end;
  end;
end else result:=0;
form.free;
SaldoDS.Close;
SaldoDS.SelectSQL.Clear;
SaldoDS.SelectSQL.Add('SELECT * FROM PC_TMP_SALDO_DOG_ADD_SELECT(:ID_SES, :DATE_REG, :ID_REG)');
SaldoDS.ParamByName('ID_SES').AsInt64:=USER_ID;
SaldoDS.ParamByName('DATE_REG').AsDate:=D_rec;
SaldoDS.ParamByName('ID_REG').AsInteger:=ID_REG;
SaldoDS.CloseOpen(false);
//ShowMessage(SaldoDS.FieldValues['FIO']);
cxDogEdit.Text:= SaldoDS.FieldValues['FIO'];
if is_upd = 1 then
 if result = 1 then actOk.Execute else  CancelButtonClick(Self);
end;
if IS_VALYUTA=1 then
begin
  if SaldoDs.IsEmpty then Exit;
  id_rec:= SaldoDS.FieldValues['ID'];
  if id_valute = 0 then begin ShowMessage('Не введена валюта!'); cxVal.SetFocus; Exit; end;
  if cxKurs.Text='' then begin ShowMessage('Не введен курс!'); cxKurs.SetFocus; Exit; end;
  kurs:=cxKurs.EditValue;
  f_val:=TAddIstValForm.Create(Self, MAIN_DB_HANDLE, 1);
  f_val.lblVal.Caption:=cxVal.Text;
  f_val.lblKurs.Caption:=cxKurs.Text;
  f_val.kurs:=kurs;
  f_val.lbl3.Caption:=SaldoDSFIO.AsString;
  if SaldoDS.FieldValues['SM_KOD']<>null then
 f_val.cxDbSmeta.Text:=SaldoDS.FieldValues['SM_KOD']
else f_val.cxDbSmeta.Text:= '';
if SaldoDS.FieldValues['RZ_KOD']<> null then
 f_val.cxDBRazdel.Text:=SaldoDS.FieldValues['RZ_KOD']
else f_val.cxDBRazdel.Text:='';
if SaldoDS.FieldValues['ST_KOD']<>null then
 f_val.cxDBStatya.Text:=SaldoDS.FieldValues['ST_KOD']
else f_val.cxDBKEKV.Text:='';
if SaldoDS.FieldValues['KEKV_KOD']<>null then
 f_val.cxDBKEKV.Text:=SaldoDS.FieldValues['KEKV_KOD']
else f_val.cxDBKEKV.Text:='';
f_val.Db_summa.Value:=SaldoDS.FieldValues['DB_SUMMA'];
f_val.Kr_summa.Value:=SaldoDS.FieldValues['KR_SUMMA'];
f_val.ID_SM:=SaldoDS.FieldValues['ID_SM'];
f_val.ID_RZ:=SaldoDS.FieldValues['ID_RZ'];
f_val.ID_ST:=SaldoDS.FieldValues['ID_ST'];
f_val.D_summa:=SaldoDS.FieldValues['DB_SUMMA'];
f_val.K_summa:=SaldoDS.FieldValues['KR_SUMMA'];
f_val.D_summa_val:=SaldoDS.FieldValues['DB_SUMMA_VAL'];
f_val.K_summa_val:=SaldoDS.FieldValues['KR_SUMMA_VAL'];
f_val.ID_KEKV:=SaldoDS.FieldValues['ID_KEKV'];
f_val.lbl3.Caption:=SaldoDSFIO.AsString;
  f_val.ShowModal;
  if f_val.ModalResult = mrOk then
  begin
    result:=1;
  try
   SaldoStoredProc.Close;
   SaldoStoredProc.Transaction := SaldoTr;
   SaldoStoredProc.Transaction.StartTransaction;
   SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_UPDATE';
   SaldoStoredProc.Prepare;
   SaldoStoredProc.ParamByName('ID').AsInteger:=id_rec;
   SaldoStoredProc.ParamByName('ID_DOG').AsInt64:=ID_DOG;
   SaldoStoredProc.ParamByName('KOD_DOG').AsInt64:=KOD_DOG;
   SaldoStoredProc.ParamByName('ID_SM').AsInteger:=f_val.ID_SM;
   SaldoStoredProc.ParamByName('ID_RZ').AsInteger:=f_val.ID_RZ;
   SaldoStoredProc.ParamByName('ID_ST').AsInteger:=f_val.ID_ST;
   SaldoStoredProc.ParamByName('ID_KEKV').AsInteger:=f_val.ID_KEKV;
   SaldoStoredProc.ParamByName('DB_SUMMA').Value:=f_val.D_summa;
   SaldoStoredProc.ParamByName('KR_SUMMA').Value:=f_val.K_summa;
   SaldoStoredProc.ParamByName('ID_SES').AsInt64:=USER_ID;
   SaldoStoredProc.ParamByName('DB_SUMMA_VAL').Value:=f_val.D_summa_val;
   SaldoStoredProc.ParamByName('KR_SUMMA_VAL').Value:=f_val.K_summa_val;
   SaldoStoredProc.ParamByName('ID_VALUTE').AsInteger:=id_valute;
   SaldoStoredProc.ExecProc;
   SaldoStoredProc.Transaction.Commit;
  except on E : Exception
  do begin
    ShowMessage(E.Message);
    SaldoStoredProc.Transaction.Rollback;
    exit;
     end;
  end;
end else result:=0;
SaldoDS.Close;
SaldoDS.SelectSQL.Clear;
SaldoDS.SelectSQL.Add('SELECT * FROM PC_TMP_SALDO_DOG_ADD_SELECT(:ID_SES, :DATE_REG, :ID_REG)');
SaldoDS.ParamByName('ID_SES').AsInt64:=USER_ID;
SaldoDS.ParamByName('DATE_REG').AsDate:=D_rec;
SaldoDS.ParamByName('ID_REG').AsInteger:=ID_REG;
SaldoDS.CloseOpen(false);
//ShowMessage(SaldoDS.FieldValues['FIO']);
cxDogEdit.Text:= SaldoDS.FieldValues['FIO'];
//if is_upd = 1 then
 //if result = 1 then actOk.Execute else  CancelButtonClick(Self);
f_val.free;
  end;

 if IS_VALYUTA =1 then  cxGrid1DBTableView1.ViewData.Expand(true); }
end;

procedure TAddDocForm.DelButClick(Sender: TObject);
var f:TDelForm;
begin
{if SaldoDS.IsEmpty then Exit;
id_rec:=SaldoDS.FieldValues['ID'];
f:=TDelForm.Create(Self);
f.ShowModal;
if f.ModalResult = mrOk then
begin
 try
  SaldoStoredProc.Close;
  SaldoStoredProc.Transaction := SaldoTr;
  SaldoStoredProc.Transaction.StartTransaction;
  SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_DELETE';
  SaldoStoredProc.Prepare;
  SaldoStoredProc.ParamByName('ID').AsInteger:=id_rec;
  SaldoStoredProc.ParamByName('IF_ALL').AsInteger:=0;
  SaldoStoredProc.ParamByName('ID_SES').AsInteger:=0;
  SaldoStoredProc.ExecProc;
  SaldoStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    SaldoStoredProc.Transaction.Rollback;
    exit;
    end;
  end;
end;
SaldoDS.Close;
SaldoDS.SelectSQL.Clear;
SaldoDS.SelectSQL.Add('SELECT * FROM PC_TMP_SALDO_DOG_ADD_SELECT(:ID_SES, :DATE_REG, :ID_REG)');
SaldoDS.ParamByName('ID_SES').AsInt64:=USER_ID;
SaldoDS.ParamByName('DATE_REG').AsDate:=D_rec;
SaldoDS.ParamByName('ID_REG').AsInteger:=ID_REG;
SaldoDS.CloseOpen(false);
cxDogEdit.Text:= SaldoDS.FieldValues['FIO'];
 if IS_VALYUTA =1 then  cxGrid1DBTableView1.ViewData.Expand(true); }
end;

procedure TAddDocForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
try
 SaldoStoredProc.Close;
 SaldoStoredProc.Transaction := SaldoTr;
 SaldoStoredProc.Transaction.StartTransaction;
 SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_DELETE';
 SaldoStoredProc.Prepare;
 SaldoStoredProc.ParamByName('ID').AsInteger:=0;
 SaldoStoredProc.ParamByName('IF_ALL').AsInteger:=1;
 SaldoStoredProc.ParamByName('ID_SES').AsInteger:=USER_ID;
 SaldoStoredProc.ExecProc;
 SaldoStoredProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  SaldoStoredProc.Transaction.Rollback;
  exit;
    end;
end;
 //FormStorage1.SaveFormPlacement;
  if IS_VALYUTA =1 then  cxGrid1DBTableView1.ViewData.Expand(true);
end;

procedure TAddDocForm.actOkExecute(Sender: TObject);
begin
if cxNameKrSch.Text = '' then
begin
 ShowMessage('Заповніть поле рахунку!');
 cxNameKrSch.SetFocus;
 Exit;
end;
if cxDogEdit.Text = '' then
begin
 ShowMessage('Заповніть поле договору!');
 cxDogEdit.SetFocus;
 Exit;
end;
if id_pos_for_upd = 0 then
try
 SaldoStoredProc.Close;
 SaldoStoredProc.Transaction := SaldoTr;
 SaldoStoredProc.Transaction.StartTransaction;
 SaldoStoredProc.StoredProcName:='PC_DT_SALDO_ADD';
 SaldoStoredProc.Prepare;
 SaldoStoredProc.ParamByName('ID_SES').AsInteger:=USER_ID;
 SaldoStoredProc.ParamByName('DATE_REC').AsDate:=D_rec;
 SaldoStoredProc.ParamByName('ID_SCH').AsInteger:=id_sch;
 SaldoStoredProc.ExecProc;
 SaldoStoredProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  SaldoStoredProc.Transaction.Rollback;
  end;
end
else
try
 SaldoStoredProc.Close;
 SaldoStoredProc.Transaction := SaldoTr;
 SaldoStoredProc.Transaction.StartTransaction;
 SaldoStoredProc.StoredProcName:='PC_DT_SALDO_VAL_UPDATE';
 SaldoStoredProc.Prepare;
 SaldoStoredProc.ParamByName('ID_SALDO').AsInteger:=id_pos_for_upd;
 SaldoStoredProc.ParamByName('ID_SES').AsInteger:=USER_ID;
 SaldoStoredProc.ParamByName('DATE_REC').AsDate:=D_rec;
 SaldoStoredProc.ParamByName('ID_SCH').AsInteger:=id_sch;
 SaldoStoredProc.ExecProc;
 SaldoStoredProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  SaldoStoredProc.Transaction.Rollback;
    end;
end;
try
 SaldoStoredProc.Close;
 SaldoStoredProc.Transaction := SaldoTr;
 SaldoStoredProc.Transaction.StartTransaction;
 SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_DELETE';
 SaldoStoredProc.Prepare;
 SaldoStoredProc.ParamByName('ID').AsInteger:=0;
 SaldoStoredProc.ParamByName('IF_ALL').AsInteger:=1;
 SaldoStoredProc.ParamByName('ID_SES').AsInteger:=USER_ID;
 SaldoStoredProc.ExecProc;
 SaldoStoredProc.Transaction.Commit;
except on E : Exception
 do begin
   ShowMessage(E.Message);
   SaldoStoredProc.Transaction.Rollback;
   exit;
    end;
end;
ModalResult:=mrOk;
end;

procedure TAddDocForm.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
cxDogEdit.Text:= SaldoDS.FieldValues['FIO'];
end;

procedure TAddDocForm.cxValPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var f:TSpValSaldoForm;
begin
 f:=TSpValSaldoForm.Create(Self);
 ds_val.CloseOpen(False);
 f.ShowModal;
 if f.ModalResult = mrOk then
 begin
   cxVal.Text:=ds_valCode_Valute.AsString;
   code_val:= ds_valCode_Valute.AsString;
   id_valute:=ds_valID_VALUTE.AsInteger;
   symbol:=ds_valSPECIAL_SIGN.AsString;
   ds_kurs.Close;
   ds_kurs.SelectSQL.Clear;
   ds_kurs.SelectSQL.Add('select first(1) date_kurs, kurs from pub_dt_valute_kurs where id_valute='+inttostr(id_valute)+' and date_kurs<=:date_kurs order by date_kurs desc');
   ds_kurs.Prepare;
   ds_kurs.ParamByName('DATE_KURS').AsDate:=PERS_PAY_PERIOD;
   ds_kurs.CloseOpen(False);
   kurs:=ds_kurs.FieldValues['kurs'];
   cxKurs.EditValue:=kurs;
 end;
 f.free;
end;

procedure TAddDocForm.SaldoDSDB_SUMMA_VALGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if SaldoDSDB_SUMMA_VAL.value<>null then
text:=FloatToStrF(SaldoDSDB_SUMMA_VAL.AsCurrency, ffNumber, 18, 2)+' '+SaldoDSSYMBOL.AsString;
end;

procedure TAddDocForm.SaldoDSKR_SUMMA_VALGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   if SaldoDSKR_SUMMA_VAL.value<>null then
text:=FloatToStrF(SaldoDSKR_SUMMA_VAL.AsCurrency, ffNumber, 18, 2)+' '+SaldoDSSYMBOL.AsString;
end;

procedure TAddDocForm.actInsExecute(Sender: TObject);
var form:TAddUpdIstFinForm;
    f_val:TAddIstValForm;
    vals: array of Variant;
begin
 if IS_VALYUTA <>1then
 begin
form:=TAddUpdIstFinForm.Create(Self, MAIN_DB_HANDLE, 0);
form.lbl3.Caption:=SaldoDSFIO.AsString;
Form.ShowModal;
if Form.ModalResult = mrOk then
begin
 try
 SaldoStoredProc.Close;
 SaldoStoredProc.Transaction := SaldoTr;
 SaldoStoredProc.Transaction.StartTransaction;
 SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_INSERT';
 SaldoStoredProc.Prepare;
 SaldoStoredProc.ParamByName('ID_DOG').AsInt64:=ID_DOG;
 SaldoStoredProc.ParamByName('KOD_DOG').AsInt64:=KOD_DOG;
 SaldoStoredProc.ParamByName('ID_SM').AsInteger:=Form.ID_SM;
 SaldoStoredProc.ParamByName('ID_RZ').AsInteger:=Form.ID_RZ;
 SaldoStoredProc.ParamByName('ID_ST').AsInteger:=Form.ID_ST;
 SaldoStoredProc.ParamByName('ID_KEKV').AsInteger:=Form.ID_KEKV;
 SaldoStoredProc.ParamByName('DB_SUMMA').Value:=Form.D_summa;
 SaldoStoredProc.ParamByName('KR_SUMMA').Value:=Form.K_summa;
 SaldoStoredProc.ParamByName('ID_SES').AsInt64:=USER_ID;
 SaldoStoredProc.ExecProc;
 SaldoStoredProc.Transaction.Commit;
 except on E : Exception
 do begin
    ShowMessage(E.Message);
    SaldoStoredProc.Transaction.Rollback;
    exit;
    end;
 end;
end;
form.free;

SaldoDS.Close;
SaldoDS.SelectSQL.Clear;
SaldoDS.SelectSQL.Add('SELECT * FROM PC_TMP_SALDO_DOG_ADD_SELECT(:ID_SES, :DATE_REG, :ID_REG)');
SaldoDS.ParamByName('ID_SES').AsInt64:=USER_ID;
SaldoDS.ParamByName('DATE_REG').AsDate:=D_rec;
SaldoDS.ParamByName('ID_REG').AsInteger:=ID_REG;
SaldoDS.CloseOpen(false);
if (SaldoDS.FieldValues['FIO'] <>'') and (SaldoDS.FieldValues['FIO']<> null) then
cxDogEdit.Text:= SaldoDS.FieldValues['FIO'];
end;
if IS_VALYUTA = 1 then
begin
  if id_valute = 0 then begin ShowMessage('Не введена валюта!'); cxVal.SetFocus; Exit; end;
  if kurs = 0 then begin ShowMessage('Не введен курс!'); cxKurs.SetFocus; Exit; end;
  kurs:=cxKurs.EditValue;
  f_val:=TAddIstValForm.Create(Self, MAIN_DB_HANDLE, 0);;
  f_val.lblVal.Caption:=cxVal.Text;
  f_val.lblKurs.Caption:=cxKurs.Text;
  f_val.kurs:=kurs;
  f_val.lbl3.Caption:=SaldoDSFIO.AsString;
  f_val.ShowModal;
  if f_val.ModalResult = mrOk then
  begin
    try
 SaldoStoredProc.Close;
 SaldoStoredProc.Transaction := SaldoTr;
 SaldoStoredProc.Transaction.StartTransaction;
 SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_INSERT';
 SaldoStoredProc.Prepare;
 SaldoStoredProc.ParamByName('ID_DOG').AsInt64:=ID_DOG;
 SaldoStoredProc.ParamByName('KOD_DOG').AsInt64:=KOD_DOG;
 SaldoStoredProc.ParamByName('ID_SM').AsInteger:=f_val.ID_SM;
 SaldoStoredProc.ParamByName('ID_RZ').AsInteger:=f_val.ID_RZ;
 SaldoStoredProc.ParamByName('ID_ST').AsInteger:=f_val.ID_ST;
 SaldoStoredProc.ParamByName('ID_KEKV').AsInteger:=f_val.ID_KEKV;
 SaldoStoredProc.ParamByName('DB_SUMMA').Value:=f_val.D_summa;
 SaldoStoredProc.ParamByName('KR_SUMMA').Value:=f_val.K_summa;
 SaldoStoredProc.ParamByName('ID_SES').AsInt64:=USER_ID;
 SaldoStoredProc.ParamByName('DB_SUMMA_VAL').Value:=f_val.D_summa_val;
 SaldoStoredProc.ParamByName('KR_SUMMA_VAL').Value:=f_val.K_summa_val;
 SaldoStoredProc.ParamByName('ID_VALUTE').AsInteger:=id_valute;
 SaldoStoredProc.ExecProc;
 SaldoStoredProc.Transaction.Commit;
 except on E : Exception
 do begin
    ShowMessage(E.Message);
    SaldoStoredProc.Transaction.Rollback;
    exit;
    end;
 end;
end;

SaldoDS.Close;
SaldoDS.SelectSQL.Clear;
SaldoDS.SelectSQL.Add('SELECT * FROM PC_TMP_SALDO_DOG_ADD_SELECT(:ID_SES, :DATE_REG, :ID_REG)');
SaldoDS.ParamByName('ID_SES').AsInt64:=USER_ID;
SaldoDS.ParamByName('DATE_REG').AsDate:=D_rec;
SaldoDS.ParamByName('ID_REG').AsInteger:=ID_REG;
SaldoDS.CloseOpen(false);
if (SaldoDS.FieldValues['FIO'] <>'') and (SaldoDS.FieldValues['FIO']<> null) then
cxDogEdit.Text:= SaldoDS.FieldValues['FIO'];
f_val.Free;
  end;

 if IS_VALYUTA =1 then  cxGrid1DBTableView1.ViewData.Expand(true);

end;

procedure TAddDocForm.actEditExecute(Sender: TObject);
var form:TAddUpdIstFinForm;
    f_val:TAddIstValForm;
    vals:array of Variant;
    result:Integer;
begin
if IS_VALYUTA<>1 then
begin
if SaldoDs.IsEmpty then Exit;
id_rec:= SaldoDS.FieldValues['ID'];
form:=TAddUpdIstFinForm.Create(Self, MAIN_DB_HANDLE, 1);
if SaldoDS.FieldValues['SM_KOD']<>null then
 form.cxDbSmeta.Text:=SaldoDS.FieldValues['SM_KOD']
else form.cxDbSmeta.Text:= '';
if SaldoDS.FieldValues['RZ_KOD']<> null then
 form.cxDBRazdel.Text:=SaldoDS.FieldValues['RZ_KOD']
else form.cxDBRazdel.Text:='';
if SaldoDS.FieldValues['ST_KOD']<>null then
 form.cxDBStatya.Text:=SaldoDS.FieldValues['ST_KOD']
else form.cxDBKEKV.Text:='';
if SaldoDS.FieldValues['KEKV_KOD']<>null then
 form.cxDBKEKV.Text:=SaldoDS.FieldValues['KEKV_KOD']
else form.cxDBKEKV.Text:='';
form.Db_summa.Value:=SaldoDS.FieldValues['DB_SUMMA'];
form.Kr_summa.Value:=SaldoDS.FieldValues['KR_SUMMA'];
form.ID_SM:=SaldoDS.FieldValues['ID_SM'];
form.ID_RZ:=SaldoDS.FieldValues['ID_RZ'];
form.ID_ST:=SaldoDS.FieldValues['ID_ST'];
form.D_summa:=SaldoDS.FieldValues['DB_SUMMA'];
form.K_summa:=SaldoDS.FieldValues['KR_SUMMA'];
form.ID_KEKV:=SaldoDS.FieldValues['ID_KEKV'];
form.lbl3.Caption:=SaldoDSFIO.AsString;
Form.ShowModal;
SetLength(vals,10);
if Form.ModalResult = mrOk then
 begin
   result:=1;
  try
   SaldoStoredProc.Close;
   SaldoStoredProc.Transaction := SaldoTr;
   SaldoStoredProc.Transaction.StartTransaction;
   SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_UPDATE';
   SaldoStoredProc.Prepare;
   SaldoStoredProc.ParamByName('ID').AsInteger:=id_rec;
   SaldoStoredProc.ParamByName('ID_DOG').AsInt64:=ID_DOG;
   SaldoStoredProc.ParamByName('KOD_DOG').AsInt64:=KOD_DOG;
   SaldoStoredProc.ParamByName('ID_SM').AsInteger:=Form.ID_SM;
   SaldoStoredProc.ParamByName('ID_RZ').AsInteger:=Form.ID_RZ;
   SaldoStoredProc.ParamByName('ID_ST').AsInteger:=Form.ID_ST;
   SaldoStoredProc.ParamByName('ID_KEKV').AsInteger:=Form.ID_KEKV;
   SaldoStoredProc.ParamByName('DB_SUMMA').Value:=Form.D_summa;
   SaldoStoredProc.ParamByName('KR_SUMMA').Value:=Form.K_summa;
   SaldoStoredProc.ParamByName('ID_SES').AsInt64:=USER_ID;
   SaldoStoredProc.ExecProc;
   SaldoStoredProc.Transaction.Commit;
  except on E : Exception
  do begin
    ShowMessage(E.Message);
    SaldoStoredProc.Transaction.Rollback;
    exit;
     end;
  end;
end else result:=0;
form.free;
SaldoDS.Close;
SaldoDS.SelectSQL.Clear;
SaldoDS.SelectSQL.Add('SELECT * FROM PC_TMP_SALDO_DOG_ADD_SELECT(:ID_SES, :DATE_REG, :ID_REG)');
SaldoDS.ParamByName('ID_SES').AsInt64:=USER_ID;
SaldoDS.ParamByName('DATE_REG').AsDate:=D_rec;
SaldoDS.ParamByName('ID_REG').AsInteger:=ID_REG;
SaldoDS.CloseOpen(false);
//ShowMessage(SaldoDS.FieldValues['FIO']);
cxDogEdit.Text:= SaldoDS.FieldValues['FIO'];
if is_upd = 1 then
 if result = 1 then actOk.Execute else  CancelButtonClick(Self);
end;
if IS_VALYUTA=1 then
begin
  if SaldoDs.IsEmpty then Exit;
  id_rec:= SaldoDS.FieldValues['ID'];
  if id_valute = 0 then begin ShowMessage('Не введена валюта!'); cxVal.SetFocus; Exit; end;
  if cxKurs.Text='' then begin ShowMessage('Не введен курс!'); cxKurs.SetFocus; Exit; end;
  kurs:=cxKurs.EditValue;
  f_val:=TAddIstValForm.Create(Self, MAIN_DB_HANDLE, 1);
  f_val.lblVal.Caption:=cxVal.Text;
  f_val.lblKurs.Caption:=cxKurs.Text;
  f_val.kurs:=kurs;
  f_val.lbl3.Caption:=SaldoDSFIO.AsString;
  if SaldoDS.FieldValues['SM_KOD']<>null then
 f_val.cxDbSmeta.Text:=SaldoDS.FieldValues['SM_KOD']
else f_val.cxDbSmeta.Text:= '';
if SaldoDS.FieldValues['RZ_KOD']<> null then
 f_val.cxDBRazdel.Text:=SaldoDS.FieldValues['RZ_KOD']
else f_val.cxDBRazdel.Text:='';
if SaldoDS.FieldValues['ST_KOD']<>null then
 f_val.cxDBStatya.Text:=SaldoDS.FieldValues['ST_KOD']
else f_val.cxDBKEKV.Text:='';
if SaldoDS.FieldValues['KEKV_KOD']<>null then
 f_val.cxDBKEKV.Text:=SaldoDS.FieldValues['KEKV_KOD']
else f_val.cxDBKEKV.Text:='';
f_val.Db_summa.Value:=SaldoDS.FieldValues['DB_SUMMA'];
f_val.Kr_summa.Value:=SaldoDS.FieldValues['KR_SUMMA'];
f_val.ID_SM:=SaldoDS.FieldValues['ID_SM'];
f_val.ID_RZ:=SaldoDS.FieldValues['ID_RZ'];
f_val.ID_ST:=SaldoDS.FieldValues['ID_ST'];
f_val.D_summa:=SaldoDS.FieldValues['DB_SUMMA'];
f_val.K_summa:=SaldoDS.FieldValues['KR_SUMMA'];
f_val.D_summa_val:=SaldoDS.FieldValues['DB_SUMMA_VAL'];
f_val.K_summa_val:=SaldoDS.FieldValues['KR_SUMMA_VAL'];
f_val.ID_KEKV:=SaldoDS.FieldValues['ID_KEKV'];
f_val.lbl3.Caption:=SaldoDSFIO.AsString;
  f_val.ShowModal;
  if f_val.ModalResult = mrOk then
  begin
    result:=1;
  try
   SaldoStoredProc.Close;
   SaldoStoredProc.Transaction := SaldoTr;
   SaldoStoredProc.Transaction.StartTransaction;
   SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_UPDATE';
   SaldoStoredProc.Prepare;
   SaldoStoredProc.ParamByName('ID').AsInteger:=id_rec;
   SaldoStoredProc.ParamByName('ID_DOG').AsInt64:=ID_DOG;
   SaldoStoredProc.ParamByName('KOD_DOG').AsInt64:=KOD_DOG;
   SaldoStoredProc.ParamByName('ID_SM').AsInteger:=f_val.ID_SM;
   SaldoStoredProc.ParamByName('ID_RZ').AsInteger:=f_val.ID_RZ;
   SaldoStoredProc.ParamByName('ID_ST').AsInteger:=f_val.ID_ST;
   SaldoStoredProc.ParamByName('ID_KEKV').AsInteger:=f_val.ID_KEKV;
   SaldoStoredProc.ParamByName('DB_SUMMA').Value:=f_val.D_summa;
   SaldoStoredProc.ParamByName('KR_SUMMA').Value:=f_val.K_summa;
   SaldoStoredProc.ParamByName('ID_SES').AsInt64:=USER_ID;
   SaldoStoredProc.ParamByName('DB_SUMMA_VAL').Value:=f_val.D_summa_val;
   SaldoStoredProc.ParamByName('KR_SUMMA_VAL').Value:=f_val.K_summa_val;
   SaldoStoredProc.ParamByName('ID_VALUTE').AsInteger:=id_valute;
   SaldoStoredProc.ExecProc;
   SaldoStoredProc.Transaction.Commit;
  except on E : Exception
  do begin
    ShowMessage(E.Message);
    SaldoStoredProc.Transaction.Rollback;
    exit;
     end;
  end;
end else result:=0;
SaldoDS.Close;
SaldoDS.SelectSQL.Clear;
SaldoDS.SelectSQL.Add('SELECT * FROM PC_TMP_SALDO_DOG_ADD_SELECT(:ID_SES, :DATE_REG, :ID_REG)');
SaldoDS.ParamByName('ID_SES').AsInt64:=USER_ID;
SaldoDS.ParamByName('DATE_REG').AsDate:=D_rec;
SaldoDS.ParamByName('ID_REG').AsInteger:=ID_REG;
SaldoDS.CloseOpen(false);
//ShowMessage(SaldoDS.FieldValues['FIO']);
cxDogEdit.Text:= SaldoDS.FieldValues['FIO'];
//if is_upd = 1 then
 //if result = 1 then actOk.Execute else  CancelButtonClick(Self);
f_val.free;
  end;

 if IS_VALYUTA =1 then  cxGrid1DBTableView1.ViewData.Expand(true);

end;

procedure TAddDocForm.actDelExecute(Sender: TObject);
var f:TDelForm;
begin
if SaldoDS.IsEmpty then Exit;
id_rec:=SaldoDS.FieldValues['ID'];
f:=TDelForm.Create(Self);
f.ShowModal;
if f.ModalResult = mrOk then
begin
 try
  SaldoStoredProc.Close;
  SaldoStoredProc.Transaction := SaldoTr;
  SaldoStoredProc.Transaction.StartTransaction;
  SaldoStoredProc.StoredProcName:='PC_TMP_SALDO_DOG_ADD_DELETE';
  SaldoStoredProc.Prepare;
  SaldoStoredProc.ParamByName('ID').AsInteger:=id_rec;
  SaldoStoredProc.ParamByName('IF_ALL').AsInteger:=0;
  SaldoStoredProc.ParamByName('ID_SES').AsInteger:=0;
  SaldoStoredProc.ExecProc;
  SaldoStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    SaldoStoredProc.Transaction.Rollback;
    exit;
    end;
  end;
end;
SaldoDS.Close;
SaldoDS.SelectSQL.Clear;
SaldoDS.SelectSQL.Add('SELECT * FROM PC_TMP_SALDO_DOG_ADD_SELECT(:ID_SES, :DATE_REG, :ID_REG)');
SaldoDS.ParamByName('ID_SES').AsInt64:=USER_ID;
SaldoDS.ParamByName('DATE_REG').AsDate:=D_rec;
SaldoDS.ParamByName('ID_REG').AsInteger:=ID_REG;
SaldoDS.CloseOpen(false);
cxDogEdit.Text:= SaldoDS.FieldValues['FIO'];
 if IS_VALYUTA =1 then  cxGrid1DBTableView1.ViewData.Expand(true);

end;

end.


