unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, ibase, uMainPerem, FIBDatabase, pFIBDatabase,
  DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc,
  ComCtrls, DogLoaderUnit,   uMainFanc, DateUtils, AccMgmt,
  uExit, ImgList, dxBar, cxHint, jpeg, ExtCtrls, StdCtrls, UPCPackMan,
  dxBarExtItems, uMDIFormsBar,GlobalSPR;

type
  TuMainForm = class(TForm)
    MainDatabase: TpFIBDatabase;
    MainTransaction: TpFIBTransaction;
    MainDataSet: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    statPCStatusBar: TStatusBar;
    HintStyleController: TcxHintStyleController;
    main_BarManager: TdxBarManager;
    AboutBtn: TdxBarButton;
    ExitBtn: TdxBarButton;
    SpravBtn: TdxBarSubItem;
    TypeLgot: TdxBarButton;
    PayerType: TdxBarButton;
    FacultySpecialityGroup: TdxBarButton;
    FormStudy: TdxBarButton;
    Faculty: TdxBarButton;
    Nationality: TdxBarButton;
    CategoryStudy: TdxBarButton;
    IniPeriodic: TdxBarButton;
    DbDocBtn: TdxBarButton;
    WorkBtn: TdxBarSubItem;
    HelpBtn: TdxBarSubItem;
    Now_Date: TdxBarStatic;
    Windows: TdxBarSubItem;
    Cascade: TdxBarButton;
    Horizontal: TdxBarButton;
    Vertical: TdxBarButton;
    Minimize: TdxBarButton;
    WindowsCloseAll: TdxBarButton;
    ContractsList: TdxBarButton;
    Configuration: TdxBarSubItem;
    Options: TdxBarButton;
    Whats_New: TdxBarButton;
    TypeDiss: TdxBarButton;
    KrDocBtn: TdxBarButton;
    OborotBtn: TdxBarButton;
    ReportsBtn: TdxBarSubItem;
    OborotSchBtn: TdxBarButton;
    RolesBtn: TdxBarButton;
    VC_Import: TdxBarButton;
    Service: TdxBarSubItem;
    SpdbfBuffer: TdxBarButton;
    Actions: TdxBarButton;
    RZ_Postyp: TdxBarButton;
    SysOptions: TdxBarButton;
    SchOpen: TdxBarButton;
    ToNextCursBtn: TdxBarButton;
    frReestrSvodPoOplate: TdxBarButton;
    RahunokWork: TdxBarButton;
    dxBarButton1: TdxBarButton;
    SpSpecBtn: TdxBarButton;
    SpDepartmentBtn: TdxBarButton;
    frSplataIstochnikiBtn: TdxBarButton;
    frPercentValueBtn: TdxBarButton;
    frLgotaAnalisBtn: TdxBarButton;
    SvodNepostupSummBtn: TdxBarButton;
    frSvodPoOtchislenimBtn: TdxBarButton;
    DogStatusBtn: TdxBarButton;
    SpPeopleBtn: TdxBarButton;
    SpYurLizaBtn: TdxBarButton;
    cn_Main_DawaVCImport: TdxBarSubItem;
    cn_Main_DawaVCPrimary: TdxBarButton;
    cn_Main_DawaVCLinks: TdxBarButton;
    cn_Main_DawaVCBuffer: TdxBarButton;
    SpRapStatus: TdxBarButton;
    SpTypeDocum: TdxBarButton;
    RaportOtchislBtn: TdxBarButton;
    RaportVosstanovlBtn: TdxBarButton;
    frVikonannya_Btn: TdxBarButton;
    SpOrderTypesBtn: TdxBarButton;
    NamesReport: TdxBarButton;
    DogTypeBtn: TdxBarButton;
    dxBarBtnSpisanie: TdxBarButton;
    btnCredit: TdxBarButton;
    btnShowSPCreditStatus: TdxBarButton;
    BtAdminUsers: TdxBarButton;
    dxBarButtonPanel: TdxBarButton;
    pricebutton_ex: TdxBarLargeButton;
    SaldoBtn: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton6: TdxBarButton;
    ilMainImageList: TImageList;
    lbl1: TLabel;
    lbl2: TLabel;
    img1: TImage;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem3: TdxBarSubItem;
    Admin: TdxBarSubItem;
    dxBarSubItem5: TdxBarSubItem;
    Perzalishk: TdxBarButton;
    OpenSch: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton7: TdxBarButton;
    DS_Valute: TpFIBDataSet;
    DS_ValuteID_VISIT: TFIBIntegerField;
    DS_ValuteDATE_VISIT: TFIBDateField;
    DS_ValuteIS_EXIST_NEUTV_DOC: TFIBIntegerField;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    ds_nach: TpFIBDataSet;
    ds_nachID_TYPE_DOC: TFIBBCDField;
    dxBarButton10: TdxBarButton;
    ds_hst: TpFIBDataSet;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarSubItem6: TdxBarSubItem;
    dxBarSubItem7: TdxBarSubItem;
    dxBarSubItem8: TdxBarSubItem;
    dxBarSubItem9: TdxBarSubItem;
    dxBarButton13: TdxBarButton;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
    dxBarButton17: TdxBarButton;
    procedure N4Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure DbDocBtnClick(Sender: TObject);
    procedure KrDocBtnClick(Sender: TObject);
    procedure SaldoBtnClick(Sender: TObject);
    procedure OborotBtnClick(Sender: TObject);
    procedure OborotSchBtnClick(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PerzalishkClick(Sender: TObject);
    procedure OpenSchClick(Sender: TObject);
    procedure OnSchArray;
    procedure SetEnvironment;
    procedure IfExists(PC_ID_REG:Integer);
    procedure SetObjectSize;
    procedure FormCreate(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure dxBarButton7Click(Sender: TObject);
    procedure dxBarButton9Click(Sender: TObject);
    procedure dxBarButton10Click(Sender: TObject);
    procedure dxBarButton13Click(Sender: TObject);
    procedure dxBarButton14Click(Sender: TObject);
    procedure dxBarButton15Click(Sender: TObject);
    procedure dxBarButton16Click(Sender: TObject);
    procedure dxBarButton17Click(Sender: TObject);
  private
     DBHANDLE : TISC_DB_HANDLE;
  public
    month, year:Word;
    dbeg, dend:TDateTime;
    show_svod:Integer;
  end;

var
  uMainForm: TuMainForm;
  PCMDIFormBar: TMDIToolBar;

implementation

  uses uSchOpen, uPerenOst, uNewSystem, uSpValyuta, uHstSys, SysAdmin, uFormUch;

{$R *.dfm}
procedure TuMainForm.IfExists(PC_ID_REG:Integer);
var f:TNewSystemForm;
    id_type_doc, id_form_uch:Integer;
begin
  MainDatabase.Close;
  MainDatabase.Handle:=MAIN_DB_HANDLE;
  MainDatabase.Open;
  MainDataSet.Close;
  MainDataSet.SelectSQL.Clear;
  MainDataSet.SelectSQL.Add('SELECT * FROM PC_INI_REG WHERE ID_REG = '+IntToStr(ID_REG));
  MainDataSet.Open;
  if MainDataSet.FieldValues['ID_REG'] = null then
  begin
    f:=TNewSystemForm.Create(Self);

    MainDataSet.Close;
    MainDataSet.SelectSQL.Clear;
    MainDataSet.SelectSQL.Add('Select REG_TITLE, ID_FORM_UCH from PUB_SP_REG_UCH where ID_REG = '+IntToStr(ID_REG));
    MainDataSet.Open;
    id_form_uch:= MainDataSet.FieldValues['ID_FORM_UCH'];

    f.cxSysName.Text:= MainDataSet.FieldValues['REG_TITLE'];
    MainDataSet.Close;
    f.cxDateEdit.EditValue:=Date();
    f.ShowModal;

    try
     StoredProc.Transaction.StartTransaction;
     StoredProc.StoredProcName:='PC_INI_REG_INS';
     StoredProc.Prepare;
     StoredProc.ParamByName('ID_REG').AsInteger:=ID_REG;
     StoredProc.ParamByName('ID_FORM_UCH').AsInteger:=id_form_uch;
     StoredProc.ParamByName('DATE_REC').AsDate:=f.cxDateEdit.EditValue;
     if f.cxVal.Checked=True then
     StoredProc.ParamByName('IS_VAL').AsInteger:=1
     else StoredProc.ParamByName('IS_VAL').AsInteger:=0;
     StoredProc.ExecProc;
     StoredProc.Transaction.Commit;
    except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     Exit;
    end;
    end;

  end;
  MainDataSet.Close;
end;

procedure TuMainForm.SetEnvironment;
begin
  Caption:='Розрахунки ('+NAME_SYSTEM_+')';
  MainDatabase.Close;
  MainDatabase.Handle:=MAIN_DB_HANDLE;
  MainDatabase.Open;
  MainDataSet.Close;
  MainDataSet.SelectSQL.Clear;
  MainDataSet.SelectSQL.Add('SELECT * FROM PC_INI A INNER JOIN PC_INI_REG B ON A.PC_FORM_UCH = B.ID_FORM_UCH WHERE B.ID_REG = '+IntToStr(ID_REG));
  MainDataSet.Open;
  PERS_PAY_PERIOD:=MainDataSet.FieldValues['DATE_REC'];
  PC_ID_SCH_ROOT:=MainDataSet.FieldValues['PC_ID_SCH_ROOT'];
  GROUP_DOG_SEL_COMMON:=MainDataSet.FieldValues['PC_DOG_SEL'];
  GROUP_DOG_ADD_COMMON:=MainDataSet.FieldValues['PC_DOG_ADD'];
  TYPE_DOC:=MainDataSet.FieldValues['TYPE_DOC'];
  NOT_PRINT_FIO_ISPOLN:=MainDataSet.FieldValues['NOT_PRINT_FIO_ISPOLN'];

  if MainDataSet.FieldValues['IS_USE_NN']=null then USE_NALOG_NAKL:=0
  else USE_NALOG_NAKL:=MainDataSet.FieldValues['IS_USE_NN'];

  if MainDataSet.FieldValues['KASS_DAY']=null then KASS_DAY:=0
  else KASS_DAY:=MainDataSet.FieldValues['KASS_DAY'];
  //FLAG_FULL_DOG:= MainDataSet.FieldValues['FLAG_FULL_DOG'];

  if MainDataSet.FieldValues['SVOD_PROV']=null then show_svod:=0
  else show_svod:=MainDataSet.FieldValues['SVOD_PROV'];

  if MainDataSet.FieldValues['IS_VALYUTA']=null then IS_VALYUTA:=0
  else IS_VALYUTA:=MainDataSet.FieldValues['IS_VALYUTA'];

  if IS_VALYUTA = 0 then
  begin
   dxBarButton9.Visible:=ivNever;
   dxBarButton7.Visible:=ivNever;
   DbDocBtn.Visible:=ivAlways;
   KrDocBtn.Visible:=ivAlways;
   end;
  if IS_VALYUTA = 1 then
  begin
    TYPE_DOC_VAL:= MainDataSet.FieldValues['TYPE_DOC_VAL'];
  ds_nach.CloseOpen(False);
  TYPE_DOC_NACH:=ds_nachID_TYPE_DOC.AsInteger;
  dxBarButton9.Visible:=ivAlways;
  DbDocBtn.Visible:=ivNever;
  KrDocBtn.Visible:=ivNever;
  dxBarButton7.Visible:=ivAlways;

 { DS_Valute. Close;
  DS_Valute.SelectSQL.Text:='select * from PC_VISIT_SYSYTEM';
  DS_Valute.CloseOpen(False);
  if DS_ValuteID_VISIT.Value<>null then
  begin
  DATE_VISIT:=DS_ValuteDATE_VISIT.AsDateTime;
  IS_EXISTS_NEUTV_DOC:=DS_ValuteIS_EXIST_NEUTV_DOC.AsInteger;
  end; }
  end;

  if show_svod = 1 then
  dxBarButton4.Visible:=ivAlways
  else dxBarButton4.Visible:=ivNever;

  if KASS_DAY = 1 then
  dxBarButton15.Visible:=ivAlways
  else dxBarButton15.Visible:=ivNever;

   if USE_NALOG_NAKL = 1 then
  dxBarButton17.Visible:=ivAlways
  else dxBarButton17.Visible:=ivNever;

//  GRP_DOG_STUD:=MainDataSet.FieldValues['GRP_DOG_STUD'];
//  GRP_DOG_KONTR:=MainDataSet.FieldValues['GRP_DOG_KONTR'];
  if FORM_UCH = 19 then GROUP_DOG_SEL_COMMON:=MainDataSet.FieldValues['GRP_DOG_STUD'];
  if FORM_UCH = 20 then GROUP_DOG_SEL_COMMON:=MainDataSet.FieldValues['GRP_DOG_KONTR'];

  MainDataSet.Close;
  try
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='MAT_GET_ORG_DATA';
  StoredProc.Prepare;
  StoredProc.ExecProc;
  ORG_FULL_NAME:=StoredProc.ParamByName('FULL_NAME').AsString;
  ORG_SHORT_NAME:=StoredProc.ParamByName('SHORT_NAME').AsString;
  ORG_KOD_OKPO:=StoredProc.ParamByName('OKPO').AsString;
  SERVER_TITLE:=StoredProc.ParamByName('SERVER_TITLE').AsString;
  StoredProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StoredProc.Transaction.Rollback;
    Exit;
   end;
   end;
    lbl2.Caption:= NAME_SYSTEM+' ('+NAME_SYSTEM_+')';

  OnSchArray;

  month:=MonthOf(PERS_PAY_PERIOD);
  year:=YearOf(PERS_PAY_PERIOD);
//  statPCStatusBar.Panels[3].Width:=statPCStatusBar.Width-660;
  statPCStatusBar.Panels[0].Text:=' '+'Період'+': '+GetMonth(month)+' '+IntToStr(year);
  statPCStatusBar.Panels[1].Text:='Сервер'+': '+SERVER_TITLE;
  statPCStatusBar.Panels[2].Text:='Користувач'+': '+USER_FIO+' ('+USER_NAME+')';
  statPCStatusBar.Panels[3].Text:='База даних'+': '+fibGetCurrentDBPath;

  lbl1.Caption:=GetMonth(month)+' '+IntToStr(year);
  statPCStatusBar.Hint:='';
  statPCStatusBar.Hint:=statPCStatusBar.Panels[0].Text+chr(13);
  statPCStatusBar.Hint:=statPCStatusBar.Hint+statPCStatusBar.Panels[1].Text+chr(13);
  statPCStatusBar.Hint:=statPCStatusBar.Hint+statPCStatusBar.Panels[2].Text+chr(13);
  statPCStatusBar.Hint:=statPCStatusBar.Hint+statPCStatusBar.Panels[3].Text+chr(13);

  LENGHT_NUM_DOC:=4;

end;

procedure TuMainForm.OnSchArray;
var i:integer;
    prefix:string;
    sch_number:string;
begin
 Year:=YearOf(PERS_PAY_PERIOD);
 Month:=MonthOf(PERS_PAY_PERIOD);
 DBEG:=StartOfAMonth(Year, Month);
 DEND:=EndOfAMonth(Year, Month);
 SCH_SYSTEM:='';
 try
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='PC_DT_SCH_FOR_SYSTEM';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_REG').AsInteger:=ID_REG;
  StoredProc.ParamByName('DATE_BEG').AsDate:=DBEG;
  StoredProc.ParamByName('DATE_END').AsDate:=DEND;
  StoredProc.ExecProc;
  ID_SES_SCH_FOR_SYSTEM:=StoredProc.ParamByName('ID_SESSION').Value;
  StoredProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StoredProc.Transaction.Rollback;
    Exit;
   end;
  end;
  MainDataSet.Close;
  MainDataSet.SelectSQL.Clear;
  MainDataSet.SelectSQL.Add('SELECT * FROM PC_SP_SCH_FOR_SYSTEM WHERE ID_SESSION = '+IntToStr(ID_SES_SCH_FOR_SYSTEM));
  MainDataSet.Open;
  MainDataSet.FetchAll;
  prefix:=' ';
  SetLength(SCH_ARRAY, MainDataSet.RecordCount, 3);
  if ((MainDataSet.RecordCount = 0) or (MainDataSet.RecordCount = null)) then
  begin
    ShowMessage('В системі не заведені рахунки!');
    IS_NOT_EXIXSTS_SCH:=1;
  end
  else IS_NOT_EXIXSTS_SCH:=0;
  i:=0;
  while not MainDataSet.Eof do
  begin
    SCH_ARRAY[i][0]:=MainDataSet.FieldValues['ID_SCH'];
    SCH_ARRAY[i][1]:=MainDataSet.FieldValues['SCH_NUMBER'];
    SCH_ARRAY[i][2]:=MainDataSet.FieldValues['SCH_TITLE'];
    
    SCH_SYSTEM:=SCH_SYSTEM+prefix+MainDataSet.FieldValues['SCH_NUMBER'];
    prefix:=' , ';
//    PERS_PAY_PERIOD:=MainDataSet.FieldValues['DATE_OPEN'];
//    showmessage(datetostr(PERS_PAY_PERIOD));
    Sch_number:=VarToStr(MainDataSet.FieldValues['SCH_NUMBER']);
    if Copy(Sch_number,1,1)='3' then DEBETORI_KREDITORI:='дебиторами';
    if Copy(Sch_number,1,1)='6' then DEBETORI_KREDITORI:='кредиторами';
    i:=i+1;
    MainDataSet.Next;
  end;
end;

procedure TuMainForm.N4Click(Sender: TObject);
begin
 Close;
end;

procedure TuMainForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var form:TExitForm;
       i:Integer;
begin
 form:=TExitForm.Create(self);
 form.ShowModal;
 CanClose:=form.cls;
 if CanClose then
 begin
 FinalizeAdminSystem;
 try
  StoredProc.Close;
  StoredProc.Transaction := MainTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='PC_DEL_FROM_SCH_FOR_SYSTEM';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_SESSION').AsInteger:=ID_SES_SCH_FOR_SYSTEM;
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
 except on E : Exception
  do begin
   ShowMessage(E.Message);
   StoredProc.Transaction.Rollback;
   exit;
  end;
 end;
 end;
 form.Free;

end;


procedure TuMainForm.N2Click(Sender: TObject);
begin
UPCPackMan.ShowDocForm(Self, DBHANDLE, 0);
end;

procedure TuMainForm.N5Click(Sender: TObject);
begin
UPCPackMan.ShowDocForm(Self, DBHANDLE, 1);
end;

procedure TuMainForm.N6Click(Sender: TObject);
begin
  UPCPackMan.ShowSaldoForm(Self, DBHANDLE);
end;

procedure TuMainForm.FormShow(Sender: TObject);
var
   i:Integer;
begin
// DbDocBtn.Enabled:=PCCheckAccess('/ROOT/PERSONPAY/PC_UCH/PC_DOCS','Belong', false)=0;
// KrDocBtn.Enabled:=PCCheckAccess('/ROOT/PERSONPAY/PC_UCH/PC_DOCS','Belong', false)=0;
// SaldoBtn.Enabled:=PCCheckAccess('/ROOT/PERSONPAY/PC_UCH/PC_SALDO','Belong', false)=0;
// OborotBtn.Enabled:=PCCheckAccess('/ROOT/PERSONPAY/PC_OBOROT/PC_MAIN_OBOROT','Belong', false)=0;
// OborotSchBtn.Enabled:=PCCheckAccess('/ROOT/PERSONPAY/PC_OBOROT/PC_SCH_OBOROT','Belong', false)=0;
{ if ID_SYSTEM = 1 then
 Admin.Enabled:=PCCheckAccess('/ROOT/PERSONPAY/PC_CONTRACTS/PC_CONTR_ADMIN','Belong', false)=0;
 if ID_SYSTEM = 2 then
 Admin.Enabled:=PCCheckAccess('/ROOT/PERSONPAY/PC_STUD_SITY/PC_STUD_SITY_ADMIN','Belong', false)=0;
 if ID_SYSTEM = 3 then
 Admin.Enabled:=PCCheckAccess('/ROOT/PERSONPAY/PC_CONTRACTS_VALUTE/PC_CONTR_VAL_ADMIN','Belong', false)=0;
 }
 InitializaAdminSystem(Self, MAIN_DB_HANDLE, 2000, USER_ID, false);
 //LoadSysData(MainTransaction);

 Admin.Enabled:=PCCheckAccess('/ROOT/PERSONPAY/PC_'+ID_SYSTEM+'/PC_'+ID_SYSTEM+'_ADMIN','Belong', false)=0;
 IfExists(ID_REG);
 SetEnvironment;
 DBHANDLE:=MAIN_DB_HANDLE;
 LoadSysData(MainTransaction);
 SetObjectSize;
end;

procedure TuMainForm.N9Click(Sender: TObject);
begin
 UPCPackMan.ShowOborotForm(Self, DBHANDLE);
end;

procedure TuMainForm.N8Click(Sender: TObject);
begin
 UPCPackMan.ShowSchOborotForm(Self, DBHANDLE);
end;

procedure TuMainForm.DbDocBtnClick(Sender: TObject);
begin
 UPCPackMan.ShowDocForm(Self, DBHANDLE, 0);
end;

procedure TuMainForm.KrDocBtnClick(Sender: TObject);
begin
 UPCPackMan.ShowDocForm(Self, DBHANDLE, 1);
end;

procedure TuMainForm.SaldoBtnClick(Sender: TObject);
begin
 if IS_VALYUTA = 1 then
 UPCPackMan.ShowSaldoValForm(Self, DBHANDLE)
 else
 UPCPackMan.ShowSaldoForm(Self, DBHANDLE);
end;

procedure TuMainForm.OborotBtnClick(Sender: TObject);
begin
 if IS_VALYUTA = 1 then
 UPCPackMan.ShowOborotValuteForm(Self, DBHANDLE)
 else
 UPCPackMan.ShowOborotForm(Self, DBHANDLE);
end;

procedure TuMainForm.OborotSchBtnClick(Sender: TObject);
begin
 UPCPackMan.ShowSchOborotForm(Self, DBHANDLE);
end;

procedure TuMainForm.dxBarButton6Click(Sender: TObject);
begin
 Close;
end;

procedure TuMainForm.FormResize(Sender: TObject);
begin
 SetObjectSize;
 Repaint;
end;

procedure TuMainForm.PerzalishkClick(Sender: TObject);
var form:TPerOstForm;
begin
 form:=TPerOstForm.Create(Self, DBHANDLE);
 if form.ShowModal = mrOk then form.Free;
 SetEnvironment;
end;

procedure TuMainForm.OpenSchClick(Sender: TObject);
var form:TSchForm;
begin
 form:=TSchForm.Create(Self, DBHANDLE);
 if form.ShowModal = mrOk then form.Free;
 SetEnvironment;
end;

procedure TuMainForm.FormCreate(Sender: TObject);
begin
 PCMDIFormBar:=TMDIToolBar.Create(main_BarManager);
end;

procedure TuMainForm.SetObjectSize;
begin
 lbl2.Top:=Height-170-lbl2.Height;
 lbl1.Top:=Height-100-lbl1.Height;
 lbl2.Width := ClientWidth-10;
 img1.Left:=Width-img1.Width-40;
end;

procedure TuMainForm.dxBarButton4Click(Sender: TObject);
begin
 UPCPackMan.ShowProvForm(Self, DBHANDLE);
end;

procedure TuMainForm.dxBarButton5Click(Sender: TObject);
begin
 GlobalSPR.GetSch(self,DBHANDLE, fsMdiChild, PERS_PAY_PERIOD, 1, -1, -1);
end;

procedure TuMainForm.dxBarButton7Click(Sender: TObject);
var f:TValyutaForm;
begin
 f:=TValyutaForm.Create(Self, DBHANDLE);
 if f.ShowModal = mrOk then f.Free;
end;

procedure TuMainForm.dxBarButton9Click(Sender: TObject);
begin
UPCPackMan.ShowDocValForm(Self, DBHANDLE,1);
end;

procedure TuMainForm.dxBarButton10Click(Sender: TObject);
var f:THSTForm;
begin
ds_hst.Close;
ds_hst.SelectSQL.Clear;
ds_hst.SelectSQL.Add('select * from pc_moove_sys_hst where id_reg='+IntToStr(ID_REG));
ds_hst.Prepare;
ds_hst.CloseOpen(False);
ds_hst.FetchAll;
ds_hst.First;
f:=THSTForm.Create(Self);
f.cxMemo.Lines.Clear;
while not ds_hst.Eof do
begin
  f.cxMemo.Lines.Add(VarToStr(ds_hst.FieldValues['DATE_TIME'])+' '+VarToStr(ds_hst.FieldValues['ACTION_USER'])+' '+VarToStr(ds_hst.FieldValues['USER_NAME']));
  f.cxMemo.Lines.Add('');
  ds_hst.Next;
end;
f.ShowModal;
f.Free;
ds_hst.Close;
end;

procedure TuMainForm.dxBarButton13Click(Sender: TObject);
begin
 AdminShowUsers(Self);
end;

procedure TuMainForm.dxBarButton14Click(Sender: TObject);
begin
 AdminShowErrors(Self);
end;

procedure TuMainForm.dxBarButton15Click(Sender: TObject);
begin
 UPCPackMan.ShowKassDayForm(Self, DBHANDLE);
end;

procedure TuMainForm.dxBarButton16Click(Sender: TObject);
var form:TRegUchForm;
begin
  form:=TRegUchForm.Create(Self, DBHANDLE);
 //if form.ShowModal = mrOk then form.Free;
end;

procedure TuMainForm.dxBarButton17Click(Sender: TObject);
begin
  UPCPackMan.ShowNaklForm(Self, DBHANDLE, PERS_PAY_PERIOD, ID_REG, USER_ID);
end;

end.
