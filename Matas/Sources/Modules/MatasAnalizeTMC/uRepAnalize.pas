{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль анализа операций                                }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{

                                                                           }
unit uRepAnalize;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, DB, FIBDataSet, pFIBDataSet, FR_Class, FR_DSet, FR_DBSet,
  cxCheckBox, FIBDatabase, pFIBDatabase, ibase, cxButtonEdit, uSpMatSch,
  uMatasVars, uMatasUtils, ActnList, GlobalSPR, FIBQuery, pFIBQuery,
  pFIBStoredProc, frxClass, frxDBSet, frxDesgn;

procedure ShowRepAnalizeTMC(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;

exports ShowRepAnalizeTMC;

type
  TRepAnalizeForm = class(TForm)
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Label1: TLabel;
    cxCheckEditRep: TcxCheckBox;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    cxReport: TcxComboBox;
    Label2: TLabel;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    Label4: TLabel;
    cxCopies: TcxSpinEdit;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionOk: TAction;
    CBDeb: TcxCheckBox;
    CBKred: TcxCheckBox;
    CBBut: TcxCheckBox;
    CBStatRoz: TcxCheckBox;
    CBKek: TcxCheckBox;
    BEDeb: TcxButtonEdit;
    BEKred: TcxButtonEdit;
    BEBut: TcxButtonEdit;
    BEStatRoz: TcxButtonEdit;
    BEKek: TcxButtonEdit;
    Label3: TLabel;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    CBGrTMC: TcxCheckBox;
    CBTMC: TcxCheckBox;
    BEGrTMC: TcxButtonEdit;
    BETMC: TcxButtonEdit;
    OperStProc: TpFIBStoredProc;
    DataSetForTMC: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    DataSetForTMCID_DOC: TFIBBCDField;
    DataSetForTMCCR_BY_DT: TFIBIntegerField;
    DataSetForTMCPUB_ID_DOC: TFIBBCDField;
    DataSetForTMCID_OPER: TFIBBCDField;
    DataSetForTMCID_TIPD: TFIBBCDField;
    DataSetForTMCTIPD: TFIBStringField;
    DataSetForTMCNUM_DOC: TFIBStringField;
    DataSetForTMCDATE_DOC: TFIBDateField;
    DataSetForTMCID_MO_IN: TFIBBCDField;
    DataSetForTMCFIO_MO_IN: TFIBStringField;
    DataSetForTMCSFIO_MO_IN: TFIBStringField;
    DataSetForTMCDEP_MO_IN: TFIBStringField;
    DataSetForTMCID_MO_OUT: TFIBBCDField;
    DataSetForTMCFIO_MO_OUT: TFIBStringField;
    DataSetForTMCSFIO_MO_OUT: TFIBStringField;
    DataSetForTMCDEP_MO_OUT: TFIBStringField;
    DataSetForTMCDB_ID_SCH: TFIBBCDField;
    DataSetForTMCKR_ID_SCH: TFIBBCDField;
    DataSetForTMCDB_SCH_NUMBER: TFIBStringField;
    DataSetForTMCKR_SCH_NUMBER: TFIBStringField;
    DataSetForTMCDB_SCH_TITLE: TFIBStringField;
    DataSetForTMCKR_SCH_TITLE: TFIBStringField;
    DataSetForTMCBAL_DB_ID_SCH: TFIBBCDField;
    DataSetForTMCBAL_DB_SCH_NUMBER: TFIBStringField;
    DataSetForTMCBAL_DB_SCH_TITLE: TFIBStringField;
    DataSetForTMCBAL_KR_ID_SCH: TFIBBCDField;
    DataSetForTMCBAL_KR_SCH_NUMBER: TFIBStringField;
    DataSetForTMCBAL_KR_SCH_TITLE: TFIBStringField;
    DataSetForTMCDB_ID_FOND: TFIBBCDField;
    DataSetForTMCKR_ID_FOND: TFIBBCDField;
    DataSetForTMCDB_FOND_NUMBER: TFIBStringField;
    DataSetForTMCKR_FOND_NUMBER: TFIBStringField;
    DataSetForTMCDB_FOND_TITLE: TFIBStringField;
    DataSetForTMCKR_FOND_TITLE: TFIBStringField;
    DataSetForTMCDB_ID_SM: TFIBBCDField;
    DataSetForTMCDB_SM_TITLE: TFIBStringField;
    DataSetForTMCDB_SM_KOD: TFIBIntegerField;
    DataSetForTMCDB_ID_RZ: TFIBBCDField;
    DataSetForTMCDB_RZ_TITLE: TFIBStringField;
    DataSetForTMCDB_RZ_KOD: TFIBIntegerField;
    DataSetForTMCDB_ID_ST: TFIBBCDField;
    DataSetForTMCDB_ST_TITLE: TFIBStringField;
    DataSetForTMCDB_ST_KOD: TFIBIntegerField;
    DataSetForTMCDB_ID_KEKV: TFIBBCDField;
    DataSetForTMCDB_KEKV_TITLE: TFIBStringField;
    DataSetForTMCDB_KEKV_KOD: TFIBIntegerField;
    DataSetForTMCDB_ID_DOG: TFIBBCDField;
    DataSetForTMCDB_KOD_DOG: TFIBBCDField;
    DataSetForTMCDB_REG_NUM: TFIBStringField;
    DataSetForTMCDB_ID_TIP_DOG: TFIBBCDField;
    DataSetForTMCDB_TIP_DOG: TFIBStringField;
    DataSetForTMCDB_TIP_DOG_SHORT_NAME: TFIBStringField;
    DataSetForTMCDB_TIP_DOG_NAME: TFIBStringField;
    DataSetForTMCDB_N_DOG: TFIBStringField;
    DataSetForTMCDB_DATE_DOG: TFIBDateField;
    DataSetForTMCKR_ID_SM: TFIBBCDField;
    DataSetForTMCKR_SM_TITLE: TFIBStringField;
    DataSetForTMCKR_SM_KOD: TFIBIntegerField;
    DataSetForTMCKR_ID_RZ: TFIBBCDField;
    DataSetForTMCKR_RZ_TITLE: TFIBStringField;
    DataSetForTMCKR_RZ_KOD: TFIBIntegerField;
    DataSetForTMCKR_ID_ST: TFIBBCDField;
    DataSetForTMCKR_ST_TITLE: TFIBStringField;
    DataSetForTMCKR_ST_KOD: TFIBIntegerField;
    DataSetForTMCKR_ID_KEKV: TFIBBCDField;
    DataSetForTMCKR_KEKV_TITLE: TFIBStringField;
    DataSetForTMCKR_KEKV_KOD: TFIBIntegerField;
    DataSetForTMCKR_ID_DOG: TFIBBCDField;
    DataSetForTMCKR_KOD_DOG: TFIBBCDField;
    DataSetForTMCKR_REG_NUM: TFIBStringField;
    DataSetForTMCKR_ID_TIP_DOG: TFIBBCDField;
    DataSetForTMCKR_TIP_DOG: TFIBStringField;
    DataSetForTMCKR_TIP_DOG_SHORT_NAME: TFIBStringField;
    DataSetForTMCKR_TIP_DOG_NAME: TFIBStringField;
    DataSetForTMCKR_N_DOG: TFIBStringField;
    DataSetForTMCKR_DATE_DOG: TFIBDateField;
    DataSetForTMCDB_ISTFIN: TFIBStringField;
    DataSetForTMCKR_ISTFIN: TFIBStringField;
    DataSetForTMCDB_KOD_SYSTEM: TFIBIntegerField;
    DataSetForTMCKR_KOD_SYSTEM: TFIBIntegerField;
    DataSetForTMCNOTE: TFIBStringField;
    DataSetForTMCID_NOMN: TFIBBCDField;
    DataSetForTMCNAME: TFIBStringField;
    DataSetForTMCNOMN: TFIBStringField;
    DataSetForTMCID_UNIT: TFIBBCDField;
    DataSetForTMCSHORT_NAME: TFIBStringField;
    DataSetForTMCKOL_MAT: TFIBBCDField;
    DataSetForTMCPRICE: TFIBBCDField;
    DataSetForTMCID_GROUP_1: TFIBBCDField;
    DataSetForTMCID_GROUP_2: TFIBBCDField;
    DataSetForTMCID_GROUP_3: TFIBBCDField;
    DataSetForTMCID_GROUP_4: TFIBBCDField;
    DataSetForTMCNAME_GROUP1: TFIBStringField;
    DataSetForTMCNAME_GROUP2: TFIBStringField;
    DataSetForTMCNAME_GROUP3: TFIBStringField;
    DataSetForTMCNAME_GROUP4: TFIBStringField;
    DataSetForTMCSUMMA: TFIBBCDField;
    DataSetForTMCPROV_DATE_REG: TFIBDateField;
    frxReport1: TfrxReport;
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure CBDebPropertiesChange(Sender: TObject);
    procedure CBKredPropertiesChange(Sender: TObject);
    procedure CBButPropertiesChange(Sender: TObject);
    procedure CBStatRozPropertiesChange(Sender: TObject);
    procedure CBKekPropertiesChange(Sender: TObject);
    procedure BEDebPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BEKredPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BEKekPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BEButPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BEStatRozPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BETMCPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BEGrTMCPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BEDebPropertiesChange(Sender: TObject);
    procedure CBTMCPropertiesChange(Sender: TObject);
    procedure CBGrTMCPropertiesChange(Sender: TObject);

  private
    { Private declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
    { Public declarations }
   MatasMonth, MatasYear: Word;
   PERIOD: TDateTime;
   ID_SCH: integer;
   ID_SESSION:Integer;// содержит  идентификатор  сессии
   F_ID_NOMN, F_LINKTO: integer;

   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64);overload;
  end;

var
  RepAnalizeForm: TRepAnalizeForm;

implementation

{$R *.dfm}
uses uAddForm,DateUtils,uPackageManager,uGrTMC;

procedure ShowRepAnalizeTMC(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 TRepAnalizeForm.Create(AOwner, DBHANDLE, aID_USER);
end;

constructor TRepAnalizeForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64);
var
 dy, dm, dd: Word;
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.WorkDatabase.Close;
   Self.WorkDatabase.Handle:=DBHANDLE;
   Self.PERIOD:=_MATAS_PERIOD;
   Self.Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_REP_TMC;
   DecodeDate(Self.PERIOD, dy, dm,  dd);
   MatasYear:=dy;
   MatasMonth:=dm;
   LoadMonthTocxComboBox(self.cxMonthBeg);
   LoadMonthTocxComboBox(self.cxMonthEnd);
   self.cxCopies.Value:=1;
   self.cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
   self.cxCheckEditRep.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
   self.OkButton.Caption:=MAT_ACTION_PRINT_CONST;
   self.CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
   self.cxMonthBeg.ItemIndex:=MatasMonth-1;
   self.cxYearBeg.Value:=MatasYear;
   self.cxMonthEnd.ItemIndex:=MatasMonth-1;
   self.cxYearEnd.Value:=MatasYear;

   self.CBDeb.Checked:=false;
   self.CBKred.Checked:=false;
   self.CBBut.Checked:=false;
   self.CBStatRoz.Checked:=false;
   self.CBKek.Checked:=false;
   self.CBGrTMC.Checked:=false;
   self.CBTMC.Checked:=false;

   self.BEDeb.Enabled:=false;
   self.BEKred.Enabled:=false;
   self.BEBut.Enabled:=false;
   self.BEStatRoz.Enabled:=false;
   self.BEKek.Enabled:=false;
   self.BEGrTMC.Enabled:=false;
   self.BETMC.Enabled:=false;

   self.BEDeb.Text:='';
   self.BEKred.Text:='';
   self.BEBut.Text:='';
   self.BEStatRoz.Text:='';
   self.BEKek.Text:='';
   self.BEGrTMC.Text:='';
   self.BETMC.Text:='';

   ID_SESSION:=WorkDatabase.Gen_Id('MAT_ID_SESSION',1,WorkTransaction);
 end;
end;


procedure TRepAnalizeForm.OkButtonClick(Sender: TObject);
var
 DBEG, DEND: TDateTime;
 w: TForm;
 gr,tmc,deb,kr,byut,strz,kek,tp:integer;
begin
 w:=ShowWaitWindow(self);
 MatasYear:=cxYearBeg.Value;
 MatasMonth:=cxMonthBeg.ItemIndex+1;
 DBEG:=StartOfAMonth(MatasYear, MatasMonth);
 MatasYear:=cxYearEnd.Value;
 MatasMonth:=cxMonthEnd.ItemIndex+1;
 DEND:=EndOfAMonth(MatasYear, MatasMonth);
 DataSetForTMC.Close;


 if not(CBGrTMC.Checked) and not (BEGrTMC.Text='') then
 begin

 try

   WorkTransaction.StartTransaction;
   OperStProc.StoredProcName:='MAT_FILTER_CLEANER';
   OperStProc.Prepare;

   OperStProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   OperStProc.ParamByName('ID_OBJECT').AsInt64:=5;

   OperStProc.ExecProc;
   OperStProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    OperStProc.Transaction.Rollback;
    Exit;
   end;
  end;

 end ;

 if not(CBTMC.Checked) and not (BETMC.Text='') then
 begin

 try

   WorkTransaction.StartTransaction;
   OperStProc.StoredProcName:='MAT_FILTER_CLEANER';
   OperStProc.Prepare;

   OperStProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   OperStProc.ParamByName('ID_OBJECT').AsInt64:=30;

   OperStProc.ExecProc;
   OperStProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    OperStProc.Transaction.Rollback;
    Exit;
   end;
  end;

 end ;

 if not(CBDeb.Checked) and not (BEDeb.Text='') then
 begin

 try

   WorkTransaction.StartTransaction;
   OperStProc.StoredProcName:='MAT_FILTER_CLEANER';
   OperStProc.Prepare;

   OperStProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   OperStProc.ParamByName('ID_OBJECT').AsInt64:=6;

   OperStProc.ExecProc;
   OperStProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    OperStProc.Transaction.Rollback;
    Exit;
   end;
  end;

 end ;

 if not(CBKred.Checked) and not (BEKred.Text='') then
 begin

 try

   WorkTransaction.StartTransaction;
   OperStProc.StoredProcName:='MAT_FILTER_CLEANER';
   OperStProc.Prepare;

   OperStProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   OperStProc.ParamByName('ID_OBJECT').AsInt64:=7;

   OperStProc.ExecProc;
   OperStProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    OperStProc.Transaction.Rollback;
    Exit;
   end;
  end;

 end;

 if not(CBBut.Checked) and not (BEBut.Text='') then
 begin
 try

   WorkTransaction.StartTransaction;
   OperStProc.StoredProcName:='MAT_FILTER_CLEANER';
   OperStProc.Prepare;

   OperStProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   OperStProc.ParamByName('ID_OBJECT').AsInt64:=8;

   OperStProc.ExecProc;
   OperStProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    OperStProc.Transaction.Rollback;
    Exit;
   end;
  end;

 end;

 if not(CBStatRoz.Checked) and not (BEStatRoz.Text='') then
 begin
 try

   WorkTransaction.StartTransaction;
   OperStProc.StoredProcName:='MAT_FILTER_CLEANER';
   OperStProc.Prepare;

   OperStProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   OperStProc.ParamByName('ID_OBJECT').AsInt64:=9;

   OperStProc.ExecProc;
   OperStProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    OperStProc.Transaction.Rollback;
    Exit;
   end;
  end;

 end;

 if not(CBKek.Checked) and not (BEKek.Text='') then
 begin
 try

   WorkTransaction.StartTransaction;
   OperStProc.StoredProcName:='MAT_FILTER_CLEANER';
   OperStProc.Prepare;

   OperStProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   OperStProc.ParamByName('ID_OBJECT').AsInt64:=10;

   OperStProc.ExecProc;
   OperStProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    OperStProc.Transaction.Rollback;
    Exit;
   end;
  end;

 end;


 if (not(CBGrTMC.Checked) or (BEGrTMC.Text='')) then gr:=0 else gr:=1;
 if (not(CBTMC.Checked) or (BETMC.Text='')) then tmc:=0 else tmc:=1;
 if (not(CBDeb.Checked) or (BEDeb.Text='')) then deb:=0 else deb:=1;
 if (not(CBKred.Checked) or (BEKred.Text='')) then kr:=0 else kr:=1;
 if (not(CBBut.Checked) or (BEBut.Text='')) then byut:=0 else byut:=1;
 if (not(CBStatRoz.Checked) or (BEStatRoz.Text='')) then strz:=0 else strz:=1;
 if (not(CBKek.Checked) or (BEKek.Text='')) then kek:=0 else kek:=1;
 if cxReport.ItemIndex=0 then tp:=0;
 if cxReport.ItemIndex=1 then tp:=1;


  DataSetForTMC.Prepare;
  DataSetForTMC.ParamByName('DATE_BEG').Value:=DBEG;
  DataSetForTMC.ParamByName('DATE_END').Value:=DEND;
  DataSetForTMC.ParamByName('session').Value:=ID_SESSION;
  DataSetForTMC.ParamByName('grtmc').Value:=gr;
  DataSetForTMC.ParamByName('tmc').Value:=tmc;
  DataSetForTMC.ParamByName('debet').Value:=deb;
  DataSetForTMC.ParamByName('kredit').Value:=kr;
  DataSetForTMC.ParamByName('byutj').Value:=byut;
  DataSetForTMC.ParamByName('rozd_stat').Value:=strz;
  DataSetForTMC.ParamByName('kekv').Value:=kek;
   DataSetForTMC.ParamByName('tip').Value:=tp;

  DataSetForTMC.CloseOpen(false);
  if cxReport.ItemIndex=0 then
   frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\TMC_deb.fr3');
  if cxReport.ItemIndex=1 then
   frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\TMC_kred.fr3');

  frxReport1.Variables['DateB']:= ''''+DateToStr(DBEG)+'''';
  frxReport1.Variables['DateE']:= ''''+DateToStr(DEND)+'''';
  frxReport1.Variables['ORG_NAME']:=''''+_ORG_FULL_NAME+'''';
  frxReport1.Variables['ORG_SHORT_NAME']:=''''+_ORG_SHORT_NAME+'''';
  frxReport1.Variables['ORG_KOD_OKPO']:=''''+_ORG_KOD_OKPO+'''';
  CloseWaitWindow(w);
  frxReport1.PrintOptions.Copies:=cxCopies.Value;
  frxReport1.PrintOptions.ShowDialog:=cxSelectPrinter.Checked;
  if cxCheckOnPrinter.Checked then
   frxReport1.Print
  else
   frxReport1.ShowReport;
 //   frxReport1.DesignReport;
  if cxCheckEditRep.Checked then
   frxReport1.DesignReport;
end;

procedure TRepAnalizeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TRepAnalizeForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TRepAnalizeForm.FormCreate(Sender: TObject);
begin
 WorkTransaction.StartTransaction;
 cxReport.ItemIndex:=0;
end;

procedure TRepAnalizeForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

procedure TRepAnalizeForm.CBDebPropertiesChange(Sender: TObject);
begin
  BEDeb.Enabled:=CBDeb.Checked;
end;

procedure TRepAnalizeForm.CBKredPropertiesChange(Sender: TObject);
begin
  BEKred.Enabled:=CBKred.Checked;
end;

procedure TRepAnalizeForm.CBButPropertiesChange(Sender: TObject);
begin
  BEBut.Enabled:=CBBut.Checked;
end;

procedure TRepAnalizeForm.CBStatRozPropertiesChange(Sender: TObject);
begin
  BEStatRoz.Enabled:=CBStatRoz.Checked;
end;

procedure TRepAnalizeForm.CBKekPropertiesChange(Sender: TObject);
begin
  BEKek.Enabled:=CBKek.Checked;
end;

procedure TRepAnalizeForm.BEDebPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
   FM:TAddForm;
begin
  FM:=TAddForm.Create(Self,DBHANDLE, ID_USER,ID_SESSION,6,PERIOD,'дебету рахунків');
  FM.ShowModal;
  BEDeb.Text:=VarToStr(FM.Result);
  FM.Free;
end;

procedure TRepAnalizeForm.BEKredPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
   FM:TAddForm;
begin
  FM:=TAddForm.Create(Self,DBHANDLE, ID_USER,ID_SESSION,7,PERIOD,'кредиту рахунків');
  FM.ShowModal;
  BEKred.Text:=VarToStr(FM.Result);
  FM.Free;
end;


procedure TRepAnalizeForm.BEKekPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
   FM:TAddForm;
begin
  FM:=TAddForm.Create(Self,DBHANDLE, ID_USER,ID_SESSION,10,PERIOD,'КЕКВам');
  FM.ShowModal;
  BEKek.Text:=VarToStr(FM.Result);
  FM.Free;
end;

procedure TRepAnalizeForm.BEButPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
   FM:TAddForm;
begin
  FM:=TAddForm.Create(Self,DBHANDLE, ID_USER,ID_SESSION,8,PERIOD,'бюджетам');
  FM.ShowModal;
  BEBut.Text:=VarToStr(FM.Result);
  FM.Free;
end;

procedure TRepAnalizeForm.BEStatRozPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
   FM:TAddForm;
begin
  FM:=TAddForm.Create(Self,DBHANDLE, ID_USER,ID_SESSION,9,PERIOD,'статтям/розділам');
  FM.ShowModal;
  BEStatRoz.Text:=VarToStr(FM.Result);
  FM.Free;
end;

procedure TRepAnalizeForm.BETMCPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
   FM:TAddForm;
begin
  FM:=TAddForm.Create(Self,DBHANDLE, ID_USER,ID_SESSION,30,PERIOD,'ТМЦ');
  FM.ShowModal;
  BETMC.Text:=VarToStr(FM.Result);
  FM.Free;
end;



procedure TRepAnalizeForm.BEGrTMCPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    FM:TAddGrTMCForm;
begin
  FM:=TAddGrTMCForm.Create(Self,DBHANDLE, ID_USER,ID_SESSION,5,PERIOD,'групам ТМЦ');
  FM.ShowModal;
  BEGrTMC.Text:=VarToStr(FM.Result);
  FM.Free;

end;


procedure TRepAnalizeForm.BEDebPropertiesChange(Sender: TObject);
begin
  BEDeb.Enabled:=CBDeb.Checked;
end;

procedure TRepAnalizeForm.CBTMCPropertiesChange(Sender: TObject);
begin
 BETMC.Enabled:=CBTMC.Checked;
end;

procedure TRepAnalizeForm.CBGrTMCPropertiesChange(Sender: TObject);
begin
  BEGrTMC.Enabled:=CBGrTMC.Checked;
end;

end.


