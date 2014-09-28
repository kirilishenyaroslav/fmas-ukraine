{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль анализа операций                                }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{

                                                                           }
unit uRepAnalizeTMC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, DB, FIBDataSet, pFIBDataSet, FR_Class, FR_DSet, FR_DBSet,
  cxCheckBox, FIBDatabase, pFIBDatabase, ibase, cxButtonEdit, uSpMatSch,
  uMatasVars, uMatasUtils, ActnList, GlobalSPR, FIBQuery, pFIBQuery,
  pFIBStoredProc, frxClass, frxDBSet, frxDesgn, frxExportRTF, frxExportXML,
  frxExportHTML;

procedure ShowRepAnalizeTMC(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;

exports ShowRepAnalizeTMC;

type
  TRepAnalizeTMCForm = class(TForm)
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
    frxHTMLExport1: TfrxHTMLExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    cxExportExel: TcxCheckBox;
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
    DBEG, DEND: TDateTime;
   gruppa,uroven_gr,mol,bal_sch,kor_sch,but,razd,stat,kekv,name_nomn,tp,kol_vo:Integer;
   st_gruppa,st_tmc,st_deb,st_kr,st_r_s,st_kek,st_but:string;
   date_select:TDateTime;
   procedure MakeReport;

   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64);overload;
  end;

var
  RepAnalizeTMCForm: TRepAnalizeTMCForm;

implementation

{$R *.dfm}
uses DateUtils,uPackageManager,uSelectRazrez, uOtchetForm;

procedure ShowRepAnalizeTMC(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 TRepAnalizeTMCForm.Create(AOwner, DBHANDLE, aID_USER);
end;

constructor TRepAnalizeTMCForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64);
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

   st_gruppa:='';
   st_tmc:='';
   st_deb:='';
   st_kr:='';
   st_r_s:='';
   st_kek:='';
   st_but:='';
   ID_SESSION:=WorkDatabase.Gen_Id('MAT_ID_SESSION',1,WorkTransaction);
 end;
end;


procedure TRepAnalizeTMCForm.OkButtonClick(Sender: TObject);
var
 gr,tmc,deb,kr,byut,strz,kek,k:integer;
 w: TForm;
 FM:TSelRazr;
 OFM:TOtchetForma;
begin


// w:=ShowWaitWindow(self);
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
 if cxReport.ItemIndex=2 then tp:=2;

  FM:=TSelRazr.Create(Self);
  fm.tip:=tp;
  FM.ShowModal;
  if FM.ModalResult=mrOk then
  begin
    gruppa:=FM.gruppa;
    uroven_gr:=FM.uroven_gr;
    mol:=FM.mol;
    bal_sch:=FM.bal_sch;
    kor_sch:=FM.kor_sch;
    but:=FM.byut;
    razd:=FM.razd;
    stat:=FM.stat;
    kekv:=FM.kekv;
    name_nomn:=FM.name_nomn;
    kol_vo:=FM.kol_vo;
  w:=ShowWaitWindow(self);
  Application.ProcessMessages;
  DataSetForTMC.Close;
  DataSetForTMC.SelectSQL.Clear;
  DataSetForTMC.SelectSQL.Add(FM.zapros) ;
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
  end;
//  OFM:=TOtchetForma.Create(Self);
//  OFM.ShowModal;


 // frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\TMC_deb.fr3');
 //  frxReport1.DesignReport;

   if not cxExportExel.Checked then
  begin
    {if cxReport.ItemIndex=0 then
      frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\TMC_deb.fr3');
    if cxReport.ItemIndex=1 then
      frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\TMC_kred.fr3');

    frxReport1.Variables['DateB']:= ''''+DateToStr(DBEG)+'''';
    frxReport1.Variables['DateE']:= ''''+DateToStr(DEND)+'''';
    frxReport1.Variables['ORG_NAME']:=''''+_ORG_FULL_NAME+'''';
    frxReport1.Variables['ORG_SHORT_NAME']:=''''+_ORG_SHORT_NAME+'''';
    frxReport1.Variables['ORG_KOD_OKPO']:=''''+_ORG_KOD_OKPO+'''';}
    MakeReport;
    CloseWaitWindow(w);
    frxReport1.PrintOptions.Copies:=cxCopies.Value;
    frxReport1.PrintOptions.ShowDialog:=cxSelectPrinter.Checked;
    if cxCheckOnPrinter.Checked then
      frxReport1.Print
    else
    if cxCheckEditRep.Checked then
      frxReport1.DesignReport
      else frxReport1.ShowReport;
  end
  else
  begin
   ExportDataSet(Self,  DataSetForTMC);
  end;

end;

procedure TRepAnalizeTMCForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TRepAnalizeTMCForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TRepAnalizeTMCForm.FormCreate(Sender: TObject);
begin
 WorkTransaction.StartTransaction;
 cxReport.ItemIndex:=0;
end;

procedure TRepAnalizeTMCForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

procedure TRepAnalizeTMCForm.CBDebPropertiesChange(Sender: TObject);
begin
  BEDeb.Enabled:=CBDeb.Checked;
end;

procedure TRepAnalizeTMCForm.CBKredPropertiesChange(Sender: TObject);
begin
  BEKred.Enabled:=CBKred.Checked;
end;

procedure TRepAnalizeTMCForm.CBButPropertiesChange(Sender: TObject);
begin
  BEBut.Enabled:=CBBut.Checked;
end;

procedure TRepAnalizeTMCForm.CBStatRozPropertiesChange(Sender: TObject);
begin
  BEStatRoz.Enabled:=CBStatRoz.Checked;
end;

procedure TRepAnalizeTMCForm.CBKekPropertiesChange(Sender: TObject);
begin
  BEKek.Enabled:=CBKek.Checked;
end;

procedure TRepAnalizeTMCForm.BEDebPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
//  FM:=TAddFormTMC.Create(Self,DBHANDLE, ID_USER,ID_SESSION,6,PERIOD,'дебету рахунків');
//  FM.ShowModal;
  date_select:=StartOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);

  BEDeb.Text:=VarToStr(uPackageManager.GetTMC(Self,DBHANDLE, ID_USER,ID_SESSION,6,date_select,'дебету рахунків'));
//  FM.Free;
  st_deb:=BEDeb.Text;
end;

procedure TRepAnalizeTMCForm.BEKredPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
//  FM:=TAddFormTMC.Create(Self,DBHANDLE, ID_USER,ID_SESSION,7,PERIOD,'кредиту рахунків');
//  FM.ShowModal;
  date_select:=StartOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);

  BEKred.Text:=VarToStr(uPackageManager.GetTMC(Self,DBHANDLE, ID_USER,ID_SESSION,7,date_select,'кредиту рахунків'));
//  FM.Free;
  st_kr:=BEKred.Text;
end;


procedure TRepAnalizeTMCForm.BEKekPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
//  FM:=TAddFormTMC.Create(Self,DBHANDLE, ID_USER,ID_SESSION,10,PERIOD,'КЕКВам');
//  FM.ShowModal;
  date_select:=StartOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);
  BEKek.Text:=VarToStr(uPackageManager.GetTMC(Self,DBHANDLE, ID_USER,ID_SESSION,10,date_select,'КЕКВам'));
//  FM.Free;
  st_kek:=BEKek.Text;
end;

procedure TRepAnalizeTMCForm.BEButPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
//  FM:=TAddFormTMC.Create(Self,DBHANDLE, ID_USER,ID_SESSION,8,PERIOD,'бюджетам');
 // FM.ShowModal;
  date_select:=StartOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);
  BEBut.Text:=VarToStr(uPackageManager.GetTMC(Self,DBHANDLE, ID_USER,ID_SESSION,8,date_select,'бюджетам'));
 // FM.Free;
  st_but:=BEBut.Text;
end;

procedure TRepAnalizeTMCForm.BEStatRozPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
//  FM:=TAddFormTMC.Create(Self,DBHANDLE, ID_USER,ID_SESSION,9,PERIOD,'статтям/розділам');
//  FM.ShowModal;
  date_select:=StartOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);
  BEStatRoz.Text:=VarToStr(uPackageManager.GetTMC(Self,DBHANDLE, ID_USER,ID_SESSION,9,date_select,'розділам/статтям'));
//  FM.Free;
  st_r_s:=BEStatRoz.Text;
end;

procedure TRepAnalizeTMCForm.BETMCPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
{  FM:=TAddFormTMC.Create(Self,DBHANDLE, ID_USER,ID_SESSION,30,PERIOD,'ТМЦ');
  FM.ShowModal;   }
   date_select:=StartOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);
  BETMC.Text:=VarToStr(uPackageManager.GetTMC(Self,DBHANDLE, ID_USER,ID_SESSION,30,date_select,'ТМЦ'));
//  FM.Free;
  st_tmc:=BETMC.Text;
end;



procedure TRepAnalizeTMCForm.BEGrTMCPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var Res:Variant;
begin
 // res:=uPackageManager.GetGruppTMC(Self,DBHANDLE, ID_USER,ID_SESSION,5,PERIOD,'групам ТМЦ',0);
  date_select:=StartOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);
  BEGrTMC.Text:=VarToStr(uPackageManager.GetGruppTMC(Self,DBHANDLE, ID_USER,ID_SESSION,5,date_select,'групам ТМЦ',0));
  st_gruppa:=BEGrTMC.Text;
end;


procedure TRepAnalizeTMCForm.BEDebPropertiesChange(Sender: TObject);
begin
  BEDeb.Enabled:=CBDeb.Checked;
end;

procedure TRepAnalizeTMCForm.CBTMCPropertiesChange(Sender: TObject);
begin
 BETMC.Enabled:=CBTMC.Checked;
end;

procedure TRepAnalizeTMCForm.CBGrTMCPropertiesChange(Sender: TObject);
begin
  BEGrTMC.Enabled:=CBGrTMC.Checked;
end;

procedure TRepAnalizeTMCForm.MakeReport;
var
    page:TfrxReportPage;
    band_header,band:TfrxBand;
    band_gr_h_1,band_gr_h_2,band_gr_h_3,band_gr_h_4, sch_h, sch_bal_h,mol_h:TfrxGroupHeader;
    band_gr_f_1,band_gr_f_2,band_gr_f_3,band_gr_f_4,sch_f,sch_bal_f,mol_f, band_footer:TfrxBand;
    DataBand:TfrxMasterData;
    m_kor_sch,m_byut,m_razd,m_st,m_kek,m_nomn, m_page, m_date:TfrxMemoView;
    Memo1,Memo2,Memo3,Memo4,mem,MemogrT,MemoT,MemoD,MemoK,MemoStR,MemoB,MemoKek:TfrxMemoView;
    i,k:Integer;
    top,height,width_memo,left_memo,left,rasst:Extended;
    page_header:TfrxPageHeader;
begin
  width_memo:=0;
  left_memo:=0;

  frxReport1.Clear;                         //создаем страницу отчета
  frxReport1.DataSets.Add(frxDBDataset1);
  page:=TfrxReportPage.Create(frxReport1);
  page.CreateUniqueName;
  page.SetDefaults;

  band:=TfrxReportTitle.Create(page);      //"верхушка" очета
  band.CreateUniqueName;
  band.top:=0;
  band.Height:=5.90*fr1cm;
  top:=band.top;
  height:=band.Height;
  Memo1:=TfrxMemoView.Create(band);
  Memo1.CreateUniqueName;
  Memo1.Height:=0.50*fr1cm;
  Memo1.Width:=7.70*fr1cm;
  Memo1.Frame.Typ:=[ftBottom];
  memo1.Font.Size:=8;
  Memo1.Left:=0.60*fr1cm;
  memo1.top:=0;
  memo1.Font.Style:=[fsBold];
  Memo1.HAlign:=haCenter;
  Memo1.Text:=_ORG_FULL_NAME;
    Memo2:=TfrxMemoView.Create(band);
    Memo2.CreateUniqueName;
    Memo2.Height:=0.50*fr1cm;
    Memo2.Width:=5.00*fr1cm;
    memo2.Font.Size:=8;
    Memo2.Left:=0.30*fr1cm;
    memo2.top:=0.70*fr1cm;
    Memo2.HAlign:=haCenter;
    Memo2.Text:='Ідентиікаційний код ЄДРПОУ';
      Memo3:=TfrxMemoView.Create(band);
      Memo3.CreateUniqueName;
      Memo3.Height:=0.50*fr1cm;
      Memo3.Width:=3.20*fr1cm;
      memo3.Font.Size:=8;
      Memo3.Left:=5.30*fr1cm;
      memo3.top:=0.80*fr1cm;
      Memo3.HAlign:=haCenter;
      Memo3.Text:=_ORG_KOD_OKPO;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
          Memo4:=TfrxMemoView.Create(band);
          Memo4.CreateUniqueName;
          Memo4.Font.Style:=[fsBold];
          Memo4.Height:=0.50*fr1cm;
          Memo4.Width:=15.60*fr1cm;
          memo4.Font.Size:=12;
          Memo4.Left:=1.50*fr1cm;
          memo4.top:=1.50*fr1cm;
          Memo4.HAlign:=haCenter;
          Memo4.Text:='Звіт по операціям за період з '+DateToStr(DBEG)+' по '+DateToStr(DEND);
      MemogrT:=TfrxMemoView.Create(band);
      MemogrT.CreateUniqueName;
      MemogrT.Height:=0.50*fr1cm;
      MemogrT.Width:=19.00*fr1cm;
      memogrT.Font.Size:=8;
      MemogrT.Left:=0;
      memogrT.top:=2.30*fr1cm;
      if CBGrTMC.Checked then
      MemogrT.Text:='Фільтр по групам ТМЦ: '+st_gruppa
      else MemogrT.Text:='Фільтр по групам ТМЦ: ';
       MemoT:=TfrxMemoView.Create(band);
       MemoT.CreateUniqueName;
       MemoT.Height:=0.50*fr1cm;
       MemoT.Width:=19.00*fr1cm;
       memoT.Font.Size:=8;
       MemoT.Left:=0;
       memoT.top:=2.80*fr1cm;
       if CBTMC.Checked then
       MemoT.Text:='Фільтр по ТМЦ: '+ st_tmc
       else MemoT.Text:='Фільтр по ТМЦ: ';
      MemoD:=TfrxMemoView.Create(band);
      MemoD.CreateUniqueName;
      MemoD.Height:=0.50*fr1cm;
      MemoD.Width:=19.00*fr1cm;
      memoD.Font.Size:=8;
      MemoD.Left:=0;
      memoD.top:=3.30*fr1cm;
      if CBDeb.Checked then
      MemoD.Text:='Фільтр по дебету рахунків: '+st_deb
      else MemoD.Text:='Фільтр по дебету рахунків: ';
       MemoK:=TfrxMemoView.Create(band);
       MemoK.CreateUniqueName;
       MemoK.Height:=0.50*fr1cm;
       MemoK.Width:=19.00*fr1cm;
       memoK.Font.Size:=8;
       MemoK.Left:=0;
       memoK.top:=3.80*fr1cm;
       if CBKred.Checked then
       MemoK.Text:='Фільтр по кредиту рахунків: '+st_kr
       else MemoK.Text:='Фільтр по кредиту рахунків: ';
      MemoB:=TfrxMemoView.Create(band);
      MemoB.CreateUniqueName;
      MemoB.Height:=0.50*fr1cm;
      MemoB.Width:=19.00*fr1cm;
      memoB.Font.Size:=8;
      MemoB.Left:=0;
      memoB.top:=4.30*fr1cm;
      if CBBut.Checked then
      MemoB.Text:='Фільтр по бюджетам: '+st_but
      else MemoB.Text:='Фільтр по бюджетам: ';
       MemoStR:=TfrxMemoView.Create(band);
       MemoStR.CreateUniqueName;
       MemoStR.Height:=0.50*fr1cm;
       MemoStR.Width:=19.00*fr1cm;
       memoStR.Font.Size:=8;
       MemoStR.Left:=0;
       memoStR.top:=4.80*fr1cm;
       if CBStatRoz.Checked then
       MemoStR.Text:='Фільтр по розділам/статтям: '+st_r_s
       else MemoStR.Text:='Фільтр по розділам/статтям: ';
      MemoKek:=TfrxMemoView.Create(band);
      MemoKek.CreateUniqueName;
      MemoKek.Height:=0.50*fr1cm;
      MemoKek.Width:=19.00*fr1cm;
      memoKek.Font.Size:=8;
      MemoKek.Left:=0;
      memoKek.top:=5.30*fr1cm;
      if CBKek.Checked then
      MemoKek.Text:='Фільтр по КЕКВам: '+st_kek
      else MemoKek.Text:='Фільтр по КЕКВам: ';

      // верхушка страницы
      page_header:=TfrxPageHeader.Create(page);
      page_header.CreateUniqueName;
      page_header.Top:=top;
      page_header.Width:=19*fr1cm;
      page_header.Height:=0.4*fr1cm;

      top:= page_header.Top;
      height:=page_header.Height;
      
      m_page:=TfrxMemoView.Create(page_header);
      m_page.CreateUniqueName;
      m_page.Height:=0.40*fr1cm;
      m_page.Width:=2.80*fr1cm;
      m_page.Font.Size:=8;
      m_page.Left:=16.2*fr1cm;
      m_page.top:=0*fr1cm;
      m_page.Text:='Стор. [Page] із [TotalPages#]';

      m_date:=TfrxMemoView.Create(page_header);
      m_date.CreateUniqueName;
      m_date.Height:=0.40*fr1cm;
      m_date.Width:=5*fr1cm;
      m_date.Font.Size:=8;
      m_date.Left:=0;
      m_date.top:=0*fr1cm;
      m_date.Text:='[Date]  [Time] ';
      //

  sch_h:=TfrxGroupHeader.Create(page);  //балансовй счет, есть всегда
  sch_h.CreateUniqueName;
  sch_h.top:=top+height;
  sch_h.Height:=18;
  top:=sch_h.top;
  height:=sch_h.Height;
  if tp=0 then sch_h.Condition:='frxDBDataset1."BAL_DB_ID_SCH"'
   else sch_h.Condition:='frxDBDataset1."BAL_KR_ID_SCH"' ;
  Memo1:=TfrxMemoView.Create(sch_h);
  Memo1.CreateUniqueName;
   if tp=0 then
       Memo1.Text:='[frxDBDataset1."BAL_DB_SCH_NUMBER"]  [frxDBDataset1."BAL_DB_SCH_TITLE"]'
   else  Memo1.Text:='[frxDBDataset1."BAL_KR_SCH_NUMBER"]  [frxDBDataset1."BAL_KR_SCH_TITLE"]';
  Memo1.Height:=sch_h.Height;
  Memo1.Width:=18.90*fr1cm;
  Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  memo1.Font.Size:=8;
  Memo1.Left:=0;

    if bal_sch=1 then                    //подсчет
      begin
        sch_bal_h:=TfrxGroupHeader.Create(page);
        sch_bal_h.CreateUniqueName;
        sch_bal_h.top:=top+height;
        sch_bal_h.Height:=18;
        top:=sch_bal_h.top;
        height:=sch_bal_h.Height;
        if tp=0 then sch_bal_h.Condition:='frxDBDataset1."DB_ID_SCH"'
         else sch_bal_h.Condition:='frxDBDataset1."KR_ID_SCH"';
        Memo1:=TfrxMemoView.Create(sch_bal_h);
        Memo1.CreateUniqueName;
          if tp=0 then
            Memo1.Text:='[frxDBDataset1."DB_SCH_NUMBER"]  [frxDBDataset1."DB_SCH_TITLE"]'
          else  Memo1.Text:='[frxDBDataset1."KR_SCH_NUMBER"]  [frxDBDataset1."KR_SCH_TITLE"]';
         Memo1.Height:=sch_bal_h.Height;
         Memo1.Width:=18.90*fr1cm;
         Memo1.Left:=0;
         Memo1.Font.Size:=8;
         Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      end;

  if uroven_gr>=1 then
    begin
      band_gr_h_4:=TfrxGroupHeader.Create(page);
      band_gr_h_4.CreateUniqueName;
      band_gr_h_4.top:=top+height;
      band_gr_h_4.Height:=18;
      band_gr_h_4.Condition:='frxDBDataset1."ID_GROUP_4"';
      top:=band_gr_h_4.top;
      height:=band_gr_h_4.Height;
      Memo1:=TfrxMemoView.Create(band_gr_h_4);
      Memo1.CreateUniqueName;
      Memo1.Text:='';
      Memo1.Height:=band_gr_h_4.Height;
      Memo1.Width:=width_memo;
      width_memo:=width_memo+40;
      Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo2:=TfrxMemoView.Create(band_gr_h_4);
      Memo2.CreateUniqueName;
      Memo2.DataSet:=frxDBDataset1;
      memo2.dataField:='NAME_GROUP4';
      Memo2.Height:=band_gr_h_4.Height;
      Memo2.Width:=18.90*fr1cm-Memo1.Width;
      Memo2.Left:=left_memo;
      left_memo:=left_memo+40;
      Memo2.Font.Size:=8;
      Memo2.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];

    end;
  if uroven_gr>=2 then
    begin
      band_gr_h_3:=TfrxGroupHeader.Create(page);
      band_gr_h_3.CreateUniqueName;
      band_gr_h_3.top:=top+height;
      top:=band_gr_h_3.top;
      band_gr_h_3.Height:=18;
      height:=band_gr_h_3.Height;
      band_gr_h_3.Condition:='frxDBDataset1."ID_GROUP_3"';
      Memo1:=TfrxMemoView.Create(band_gr_h_3);
      Memo1.CreateUniqueName;
      Memo1.Text:='';
      Memo1.Height:=band_gr_h_3.Height;
      Memo1.Width:=width_memo;
      width_memo:=width_memo+40;
      Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo2:=TfrxMemoView.Create(band_gr_h_3);
      Memo2.CreateUniqueName;
      Memo2.DataSet:=frxDBDataset1;
      memo2.dataField:='NAME_GROUP3';
      Memo2.Height:=band_gr_h_3.Height;
      Memo2.Width:=18.90*fr1cm-Memo1.Width;
      Memo2.Left:=left_memo;
      Memo2.Font.Size:=8;
      Memo2.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      left_memo:=left_memo+40;
    end;
  if uroven_gr>=3 then
    begin
      band_gr_h_2:=TfrxGroupHeader.Create(page);
      band_gr_h_2.CreateUniqueName;
      band_gr_h_2.top:=top+height;
      top:=band_gr_h_2.top;
      band_gr_h_2.Height:=18;
      height:=band_gr_h_2.Height;
      band_gr_h_2.Condition:='frxDBDataset1."ID_GROUP_2"';
      Memo1:=TfrxMemoView.Create(band_gr_h_2);
      Memo1.CreateUniqueName;
      Memo1.Text:='';
      Memo1.Height:=band_gr_h_2.Height;
      Memo1.Width:=width_memo;
      width_memo:=width_memo+40;
      Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo2:=TfrxMemoView.Create(band_gr_h_2);
      Memo2.CreateUniqueName;
      Memo2.DataSet:=frxDBDataset1;
      memo2.dataField:='NAME_GROUP2';
      Memo2.Height:=band_gr_h_2.Height;
      Memo2.Width:=18.90*fr1cm-Memo1.Width;
      Memo2.Left:=left_memo;
      left_memo:=left_memo+40;
      Memo2.Font.Size:=8;
      Memo2.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
    end;
  if uroven_gr>=4 then
    begin
      band_gr_h_1:=TfrxGroupHeader.Create(page);
      band_gr_h_1.CreateUniqueName;
      band_gr_h_1.top:=top+height;
      top:=band_gr_h_1.top;
      band_gr_h_1.Height:=18;
      height:=band_gr_h_1.Height;
      band_gr_h_1.Condition:='frxDBDataset1."ID_GROUP_1"';
      Memo1:=TfrxMemoView.Create(band_gr_h_1);
      Memo1.CreateUniqueName;
      Memo1.Text:='';
      Memo1.Height:=band_gr_h_1.Height;
      Memo1.Width:=width_memo;
      Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo2:=TfrxMemoView.Create(band_gr_h_1);
      Memo2.CreateUniqueName;
      Memo2.DataSet:=frxDBDataset1;
      memo2.dataField:='Name_Group1';
      Memo2.Height:=band_gr_h_1.Height;
      Memo2.Width:=18.90*fr1cm-Memo1.width;
      Memo2.Left:=left_memo;
      Memo2.Font.Size:=8;
      Memo2.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
    end;
     if mol=1 then
      begin
        mol_h:=TfrxGroupHeader.Create(page);
        mol_h.CreateUniqueName;
        mol_h.top:=top+height;
        mol_h.Height:=18;
        if tp=0 then mol_h.Condition:='frxDBDataset1."ID_MO_IN"'
         else mol_h.Condition:='frxDBDataset1."ID_MO_OUT"';
        top:=mol_h.top;
        height:=mol_h.Height;
        Memo2:=TfrxMemoView.Create(mol_h);
        Memo2.CreateUniqueName;
        if tp=0 then
         Memo2.Text:='[frxDBDataset1."FIO_MO_IN"]  [frxDBDataset1."DEP_MO_IN"]'
         else  Memo2.Text:='[frxDBDataset1."FIO_MO_OUT"]  [frxDBDataset1."DEP_MO_OUT"]';
        Memo2.Height:=mol_h.Height;
        Memo2.Width:=18.90*fr1cm;
        Memo2.Left:=0;
        Memo2.Font.Size:=8;
        Memo2.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      end;

  band_header:=TfrxHeader.Create(Page);
  band_header.CreateUniqueName;
  band_header.Top:=top+height;
  band_header.Height:=18;
  height:=band_header.Height;
  top:=band_header.Top;
   Memo1:=TfrxMemoView.Create(band_header);
   Memo1.CreateUniqueName;
   Memo1.Height:=band_header.Height;
   Memo1.Width:=2.10*fr1cm;
   MEmo1.Left:=14.10*fr1cm;
   Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
   Memo1.Text:='Кількість';
   Memo1.HAlign:=haCenter;
    Memo1.Font.Size:=8;
    Memo2:=TfrxMemoView.Create(band_header);
    Memo2.CreateUniqueName;
    Memo2.Height:=band_header.Height;
    Memo2.Width:=2.70*fr1cm;
    Memo2.Left:=14.10*fr1cm+memo1.Width;
    Memo2.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
    Memo2.Text:='Сума';
    Memo2.HAlign:=haCenter;
    Memo2.Font.Size:=8;
  left:=0;
  Memo1:=TfrxMemoView.Create(band_header);
  Memo1.CreateUniqueName;
  Memo1.Height:=band_header.Height;
  Memo1.Width:=14.10*fr1cm;
  MEmo1.Left:=0;
  Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  Memo1.Text:='';
   if name_nomn=1 then
    begin
       if kor_sch=1 then
        begin
            m_kor_sch:=TfrxMemoView.Create(band_header);
            m_kor_sch.CreateUniqueName;
            m_kor_sch.Height:=band_header.Height;
            m_kor_sch.Width:=2.00*fr1cm;
            m_kor_sch.Left:=left;
            left:=Left+m_kor_sch.Width;
            m_kor_sch.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            m_kor_sch.Text:='Кор.рахунок';
            m_kor_sch.HAlign:=haCenter;
            m_kor_sch.Font.Size:=8;
        end;
      if but=1 then
        begin
            m_byut:=TfrxMemoView.Create(band_header);
            m_byut.CreateUniqueName;
            m_byut.Height:=band_header.Height;
            m_byut.Width:=1.40*fr1cm;
            m_byut.Left:=left;
            left:=Left+m_byut.Width;
            m_byut.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            m_byut.Text:='Бюджет';
            m_byut.HAlign:=haCenter;
            m_byut.Font.Size:=8;
        end;
      if razd=1 then
        begin
            m_razd:=TfrxMemoView.Create(band_header);
            m_razd.CreateUniqueName;
            m_razd.Height:=band_header.Height;
            m_razd.Width:=1.40*fr1cm;
            m_razd.Left:=left;
            left:=Left+m_razd.Width;
            m_razd.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            m_razd.Text:='Розділ';
            m_razd.HAlign:=haCenter;
            m_razd.Font.Size:=8;
        end;
      if stat=1 then
        begin
            m_st:=TfrxMemoView.Create(band_header);
            m_st.CreateUniqueName;
            m_st.Height:=band_header.Height;
            m_st.Width:=1.40*fr1cm;
            m_st.Left:=left;
            left:=Left+m_st.Width;
            m_st.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            m_st.Text:='Стаття';
            m_st.HAlign:=haCenter;
            m_st.Font.Size:=8;
        end;
      if kekv=1 then
        begin
            m_kek:=TfrxMemoView.Create(band_header);
            m_kek.CreateUniqueName;
            m_kek.Height:=band_header.Height;
            m_kek.Width:=1.60*fr1cm;
            m_kek.Left:=left;
            left:=Left+m_kek.Width;
            m_kek.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            m_kek.Text:='КЕКВ';
            m_kek.HAlign:=haCenter;
            m_kek.Font.Size:=8;
        end;
            m_nomn:=TfrxMemoView.Create(band_header);
            m_nomn.CreateUniqueName;
            m_nomn.Height:=band_header.Height;
            m_nomn.Width:=13.00*fr1cm-left;
            m_nomn.Left:=left;
            m_nomn.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            m_nomn.Text:='Назва, дата опр.';
            m_nomn.HAlign:=haCenter;
            m_nomn.Font.Size:=8;
                Memo3:=TfrxMemoView.Create(band_header);
                Memo3.CreateUniqueName;
                Memo3.Height:=band_header.Height;
                Memo3.Width:=1.1*fr1cm;
                Memo3.Left:=13.00*fr1cm;
                Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
                Memo3.Text:='Од.вим';
                Memo3.HAlign:=haCenter;
                Memo3.Font.Size:=8;
    end
     else
      begin
        if not(kol_vo=0) then
        begin
         k:=trunc(14.10/kol_vo);
         rasst:= 14.10-k*kol_vo;
        end;
        if kor_sch=1 then
         begin
            m_kor_sch:=TfrxMemoView.Create(band_header);
            m_kor_sch.CreateUniqueName;
            m_kor_sch.Height:=band_header.Height;
            if not(rasst=0) then
             begin
              m_kor_sch.Width:=k*fr1cm+rasst*fr1cm;
              rasst:=0;              
             end
            else m_kor_sch.Width:=k*fr1cm;
            m_kor_sch.Left:=left;
            left:=Left+m_kor_sch.Width;
            m_kor_sch.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            m_kor_sch.Text:='Кор.рахунок';
            m_kor_sch.HAlign:=haCenter;
            m_kor_sch.Font.Size:=8;
        end;
      if but=1 then
        begin
            m_byut:=TfrxMemoView.Create(band_header);
            m_byut.CreateUniqueName;
            m_byut.Height:=band_header.Height;
            if not(rasst=0) then
            begin
              m_byut.Width:=k*fr1cm+rasst*fr1cm;
              rasst:=0;
            end
            else m_byut.Width:=k*fr1cm;
            m_byut.Left:=left;
            left:=Left+m_byut.Width;
            m_byut.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            m_byut.Text:='Бюджет';
            m_byut.HAlign:=haCenter;
            m_byut.Font.Size:=8;
        end;
      if razd=1 then
        begin
            m_razd:=TfrxMemoView.Create(band_header);
            m_razd.CreateUniqueName;
            m_razd.Height:=band_header.Height;
            if not(rasst=0) then
            begin
              m_razd.Width:=k*fr1cm+rasst*fr1cm;
              rasst:=0;
            end
            else m_razd.Width:=k*fr1cm;
            m_razd.Left:=left;
            left:=Left+m_razd.Width;
            m_razd.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            m_razd.Text:='Розділ';
            m_razd.HAlign:=haCenter;
            m_razd.Font.Size:=8;
        end;
      if stat=1 then
        begin
            m_st:=TfrxMemoView.Create(band_header);
            m_st.CreateUniqueName;
            m_st.Height:=band_header.Height;
            if not(rasst=0) then
            begin
            m_st.Width:=k*fr1cm+rasst*fr1cm;
            rasst:=0;
            end
            else m_st.Width:=k*fr1cm;
            m_st.Left:=left;
            left:=Left+m_st.Width;
            m_st.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            m_st.Text:='Стаття';
            m_st.HAlign:=haCenter;
            m_st.Font.Size:=8;
        end;
      if kekv=1 then
        begin
            m_kek:=TfrxMemoView.Create(band_header);
            m_kek.CreateUniqueName;
            m_kek.Height:=band_header.Height;
            if not(rasst=0) then m_kek.Width:=k*fr1cm+rasst*fr1cm
            else m_kek.Width:=k*fr1cm;
            m_kek.Left:=left;
            left:=Left+m_kek.Width;
            m_kek.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            m_kek.Text:='КЕКВ';
            m_kek.HAlign:=haCenter;
            m_kek.Font.Size:=8;
        end;
      end;

  DataBand:=TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.DataSet:=frxDBDataSet1;
  DAtaBand.Top:=top+height;
  DataBand.Height:=18;
  DataBAnd.Stretched:=True;
  height:=databand.Height;
  top:=DAtaBand.Top;
  Memo1:=TfrxMemoView.Create(DataBand);
  Memo1.CreateUniqueName;
  Memo1.Height:=DataBand.Height;
  Memo1.Width:=2.10*fr1cm;
  Memo1.Left:=14.10*fr1cm;
  Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  Memo1.Text:='[frxDBDataset1."KOL_MAT"]';
  Memo1.Font.Size:=8;
  Memo1.DisplayFormat.Kind:=fkNumeric;
  Memo1.DisplayFormat.FormatStr:='%2.4n';
  Memo1.DisplayFormat.Kind:=fkNumeric;
  Memo1.HAlign:=haRight;
  memo1.StretchMode:=smMaxHeight;

  Memo2:=TfrxMemoView.Create(DataBand);
  Memo2.CreateUniqueName;
  Memo2.Height:=DataBand.Height;
  Memo2.Width:=2.70*fr1cm;
  Memo2.Left:=14.10*fr1cm+memo1.Width;
  Memo2.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  Memo2.Text:='[frxDBDataset1."SUMMA"]';
  Memo2.HAlign:=haCenter;
  Memo2.Font.Size:=8;
  Memo2.DisplayFormat.Kind:=fkNumeric;
  Memo2.DisplayFormat.FormatStr:='%2.2n';
  Memo2.HAlign:=haRight;
  memo2.StretchMode:=smMaxHeight;

  left:=0;
  Memo1:=TfrxMemoView.Create(DataBand);
  Memo1.CreateUniqueName;
  Memo1.Height:=DataBand.Height;
  Memo1.Width:=14.10*fr1cm;
  MEmo1.Left:=0;
  Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  Memo1.Text:='';
  memo1.StretchMode:=smMaxHeight;
       if name_nomn=1 then
         begin
          if kor_sch=1 then
           begin
            m_kor_sch:=TfrxMemoView.Create(DataBand);
            m_kor_sch.CreateUniqueName;
            m_kor_sch.Height:=DataBand.Height;
            m_kor_sch.Width:=2.00*fr1cm;
            m_kor_sch.Left:=left;
            left:=Left+m_kor_sch.Width;
            m_kor_sch.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            if tp=0 then m_kor_sch.Text:='[frxDBDataset1."KR_SCH_NUMBER"]'
             else m_kor_sch.Text:='[frxDBDataset1."DB_SCH_NUMBER"]';
            m_kor_sch.Font.Size:=8;
            m_kor_sch.HAlign:=haRight;
            m_kor_sch.StretchMode:=smMaxHeight;
        end;
      if but=1 then
        begin
            m_byut:=TfrxMemoView.Create(DataBand);
            m_byut.CreateUniqueName;
            m_byut.Height:=DataBand.Height;
            m_byut.Width:=1.40*fr1cm;
            m_byut.Left:=left;
            left:=Left+m_byut.Width;
            m_byut.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            if tp=0 then m_byut.Text:='[frxDBDataset1."DB_SM_KOD"]'
            else m_byut.Text:='[frxDBDataset1."KR_SM_KOD"]';
            m_byut.Font.Size:=8;
            m_byut.HAlign:=haRight;
            m_byut.StretchMode:=smMaxHeight;
        end;
      if razd=1 then
        begin
            m_razd:=TfrxMemoView.Create(DataBand);
            m_razd.CreateUniqueName;
            m_razd.Height:=DataBand.Height;
            m_razd.Width:=1.40*fr1cm;
            m_razd.Left:=left;
            left:=Left+m_razd.Width;
            m_razd.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            if tp=0 then m_razd.Text:='[frxDBDataset1."DB_RZ_KOD"]'
            else m_razd.Text:='[frxDBDataset1."KR_RZ_KOD"]';
            m_razd.Font.Size:=8;
            m_razd.HAlign:=haRight;
            m_razd.StretchMode:=smMaxHeight;
        end;
      if stat=1 then
        begin
            m_st:=TfrxMemoView.Create(DataBand);
            m_st.CreateUniqueName;
            m_st.Height:=DataBand.Height;
            m_st.Width:=1.40*fr1cm;
            m_st.Left:=left;
            left:=Left+m_st.Width;
            m_st.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            if tp=0 then m_st.Text:='[frxDBDataset1."DB_ST_KOD"]'
            else m_st.Text:='[frxDBDataset1."KR_ST_KOD"]';
            m_st.Font.Size:=8;
            m_st.HAlign:=haRight;
            m_st.StretchMode:=smMaxHeight;
        end;
      if kekv=1 then
      begin
            m_kek:=TfrxMemoView.Create(DataBand);
            m_kek.CreateUniqueName;
            m_kek.Height:=DataBand.Height;
            m_kek.Width:=1.60*fr1cm;
            m_kek.Left:=left;
            left:=Left+m_kek.Width;
            m_kek.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            if tp=0 then  m_kek.Text:='[frxDBDataset1."DB_KEKV_KOD"]'
            else  m_kek.Text:='[frxDBDataset1."KR_KEKV_KOD"]';
            m_kek.Font.Size:=8;
            m_kek.HAlign:=haRight;
            m_kek.StretchMode:=smMaxHeight;
        end;
            m_nomn:=TfrxMemoView.Create(DataBand);
            m_nomn.CreateUniqueName;
            m_nomn.Height:=DataBand.Height;
            m_nomn.Width:=13.00*fr1cm-left;
            m_nomn.Left:=left;
            m_nomn.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            m_nomn.Text:='[frxDBDataset1."NAME"], [frxDBDataset1."DATE_OPR"]';
            m_nomn.Font.Size:=8;
            m_nomn.StretchMode:=smMaxHeight;
                Memo3:=TfrxMemoView.Create(DataBand);
                Memo3.CreateUniqueName;
                Memo3.Height:=databand.Height;
                Memo3.Width:=1.1*fr1cm;
                Memo3.Left:=13.00*fr1cm;
                Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
                Memo3.Text:='[frxDBDataset1."SHORT_NAME"]';
                Memo3.HAlign:=haCenter;
                Memo3.Font.Size:=8;
                Memo3.StretchMode:=smMaxHeight;
    end
     else
      begin
      if not(kol_vo=0) then
       begin
        k:=trunc(14.10/kol_vo);
        rasst:= 14.10-k*kol_vo;
       end;
      if kor_sch=1 then
        begin
            m_kor_sch:=TfrxMemoView.Create(DataBand);
            m_kor_sch.CreateUniqueName;
            m_kor_sch.Height:=DataBand.Height;
            if not(rasst=0) then
            begin
              m_kor_sch.Width:=k*fr1cm+rasst*fr1cm;
              rasst:=0;
            end
            else m_kor_sch.Width:=k*fr1cm;
            m_kor_sch.Left:=left;
            left:=Left+m_kor_sch.Width;
            m_kor_sch.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            if tp=0 then m_kor_sch.Text:='[frxDBDataset1."KR_SCH_NUMBER"]'
             else m_kor_sch.Text:='[frxDBDataset1."DB_SCH_NUMBER"]';
            m_kor_sch.Font.Size:=8;
            m_kor_sch.HAlign:=haRight;
            m_kor_sch.StretchMode:=smMaxHeight;
        end;
      if but=1 then
        begin
            m_byut:=TfrxMemoView.Create(DataBand);
            m_byut.CreateUniqueName;
            m_byut.Height:=DataBand.Height;
            if not(rasst=0) then
            begin
              m_byut.Width:=k*fr1cm+rasst*fr1cm;
              rasst:=0;
            end
            else m_byut.Width:=k*fr1cm;
            m_byut.Left:=left;
            left:=Left+m_byut.Width;
            m_byut.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            if tp = 0 then m_byut.Text:='[frxDBDataset1."DB_SM_KOD"]'
            else m_byut.Text:='[frxDBDataset1."KR_SM_KOD"]';
            m_byut.Font.Size:=8;
            m_byut.HAlign:=haRight;
            m_byut.StretchMode:=smMaxHeight;
        end;
      if razd=1 then
        begin
            m_razd:=TfrxMemoView.Create(DataBand);
            m_razd.CreateUniqueName;
            m_razd.Height:=DataBand.Height;
            if not(rasst=0) then
            begin
              m_razd.Width:=k*fr1cm+rasst*fr1cm;
              rasst:=0;
            end
            else m_razd.Width:=k*fr1cm;
            m_razd.Left:=left;
            left:=Left+m_razd.Width;
            m_razd.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            if tp=0 then m_razd.Text:='[frxDBDataset1."DB_RZ_KOD"]'
            else m_razd.Text:='[frxDBDataset1."KR_RZ_KOD"]';
            m_razd.Font.Size:=8;
            m_razd.HAlign:=haRight;
            m_razd.StretchMode:=smMaxHeight;
        end;
      if stat=1 then
        begin
            m_st:=TfrxMemoView.Create(DataBand);
            m_st.CreateUniqueName;
            m_st.Height:=DataBand.Height;
            if not(rasst=0) then
            begin
             m_st.Width:=k*fr1cm+rasst*fr1cm;
             rasst:=0;
            end
            else m_st.Width:=k*fr1cm;
            m_st.Left:=left;
            left:=Left+m_st.Width;
            m_st.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            if tp=0 then m_st.Text:='[frxDBDataset1."DB_ST_KOD"]'
            else m_st.Text:='[frxDBDataset1."KR_ST_KOD"]';
            m_st.Font.Size:=8;
            m_st.HAlign:=haRight;
            m_st.StretchMode:=smMaxHeight;
        end;
      if kekv=1 then
        begin
            m_kek:=TfrxMemoView.Create(DataBand);
            m_kek.CreateUniqueName;
            m_kek.Height:=DataBand.Height;
            if not(rasst=0) then m_kek.Width:=k*fr1cm+rasst*fr1cm
            else m_kek.Width:=k*fr1cm;
            m_kek.Left:=left;
            left:=Left+m_kek.Width;
            m_kek.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
            if tp=0 then m_kek.Text:='[frxDBDataset1."DB_KEKV_KOD"]'
            else m_kek.Text:='[frxDBDataset1."KR_KEKV_KOD"]';
            m_kek.Font.Size:=8;
            m_kek.HAlign:=haRight;
            m_kek.StretchMode:=smMaxHeight;
        end;
      end;

    if mol=1 then
      begin
        mol_f:=TfrxGroupFooter.Create(page);
        mol_f.CreateUniqueName;
        mol_f.top:=top+height;
        mol_f.Height:=18;
        top:=mol_f.top;
        height:=mol_f.Height;
        Memo1:=TfrxMemoView.Create(mol_f);
        Memo1.CreateUniqueName;
        if tp=0 then Memo1.Text:='Всього по [frxDBDataset1."SFIO_MO_IN"]'
         else Memo1.Text:='Всього по [frxDBDataset1."SFIO_MO_OUT"]';
        Memo1.Height:=mol_f.Height;
        Memo1.Left:=0;
        Memo1.Font.Size:=8;
        Memo1.Width:=14.10*fr1cm;
        Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
         Memo2:=TfrxMemoView.Create(mol_f);
         Memo2.CreateUniqueName;
         Memo2.Text:='[SUM(<frxDBDataset1."KOL_MAT">)]';
         Memo2.Height:=mol_f.Height;
         memo2.Left:=Memo1.Width;
         Memo2.Font.Size:=8;
         Memo2.Width:=2.10*fr1cm;
         Memo2.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
         Memo2.DisplayFormat.Kind:=fkNumeric;
         Memo2.DisplayFormat.FormatStr:='%2.4n';
         Memo2.HAlign:=haRight;
          Memo3:=TfrxMemoView.Create(mol_f);
          Memo3.CreateUniqueName;
          Memo3.Text:='[SUM(<frxDBDataset1."SUMMA">,MasterData1)]';
          Memo3.Height:=mol_f.Height;
          memo3.Left:=Memo1.Width+Memo2.Width;
          Memo3.Font.Size:=8;
          Memo3.Width:=2.70*fr1cm;
          Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
          Memo3.DisplayFormat.Kind:=fkNumeric;
          Memo3.DisplayFormat.FormatStr:='%2.2n';
          Memo3.HAlign:=haRight;
      end;

    if uroven_gr>=1 then
    begin
      band_gr_f_1:=TfrxGroupFooter.Create(page);
      band_gr_f_1.CreateUniqueName;
      band_gr_f_1.top:=top+height;
      band_gr_f_1.Height:=18;
      height:=band_gr_f_1.Height;
      top:=band_gr_f_1.top;
      Memo1:=TfrxMemoView.Create(band_gr_f_1);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по [frxDBDataset1."NAME_GROUP4"]';
      Memo1.Height:=band_gr_f_1.Height;
      Memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=14.10*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo2:=TfrxMemoView.Create(band_gr_f_1);
      Memo2.CreateUniqueName;
      Memo2.Text:='[SUM(<frxDBDataset1."KOL_MAT">)]';
      Memo2.Height:=band_gr_f_1.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=2.10*fr1cm;
      Memo2.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo2.DisplayFormat.Kind:=fkNumeric;
      Memo2.DisplayFormat.FormatStr:='%2.4n';
      Memo2.HAlign:=haRight;
      Memo3:=TfrxMemoView.Create(band_gr_f_1);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."SUMMA">,MasterData1)]';
      Memo3.Height:=band_gr_f_1.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2.70*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.HAlign:=haRight;
    end;

      if uroven_gr>=2 then
    begin
      band_gr_f_2:=TfrxGroupFooter.Create(page);
      band_gr_f_2.CreateUniqueName;
      band_gr_f_2.top:=top+height;
      band_gr_f_2.Height:=18;
      height:=band_gr_f_2.Height;
      top:=band_gr_f_2.top;
      Memo1:=TfrxMemoView.Create(band_gr_f_2);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по [frxDBDataset1."NAME_GROUP3"]';
      Memo1.Height:=band_gr_f_2.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=14.10*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo2:=TfrxMemoView.Create(band_gr_f_2);
      Memo2.CreateUniqueName;
      Memo2.Text:='[SUM(<frxDBDataset1."KOL_MAT">)]';
      Memo2.Height:=band_gr_f_2.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=2.10*fr1cm;
      Memo2.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo2.DisplayFormat.Kind:=fkNumeric;
      Memo2.DisplayFormat.FormatStr:='%2.4n';
      Memo2.HAlign:=haRight;
      Memo3:=TfrxMemoView.Create(band_gr_f_2);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."SUMMA">,MasterData1)]';
      Memo3.Height:=band_gr_f_2.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2.70*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.HAlign:=haRight;
    end;

      if uroven_gr>=3 then
    begin
      band_gr_f_3:=TfrxGroupFooter.Create(page);
      band_gr_f_3.CreateUniqueName;
      band_gr_f_3.top:=top+height;
      band_gr_f_3.Height:=18;
      height:=band_gr_f_3.Height;
      top:=band_gr_f_3.top;
      Memo1:=TfrxMemoView.Create(band_gr_f_3);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по [frxDBDataset1."NAME_GROUP2"]';
      Memo1.Height:=band_gr_f_3.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=14.10*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo2:=TfrxMemoView.Create(band_gr_f_3);
      Memo2.CreateUniqueName;
      Memo2.Text:='[SUM(<frxDBDataset1."KOL_MAT">)]';
      Memo2.Height:=band_gr_f_3.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=2.10*fr1cm;
      Memo2.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo2.DisplayFormat.Kind:=fkNumeric;
      Memo2.DisplayFormat.FormatStr:='%2.4n';
      Memo2.HAlign:=haRight;
      Memo3:=TfrxMemoView.Create(band_gr_f_3);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."SUMMA">,MasterData1)]';
      Memo3.Height:=band_gr_f_3.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2.70*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.HAlign:=haRight;
    end;

    if uroven_gr>=4 then
    begin
      band_gr_f_4:=TfrxGroupFooter.Create(page);
      band_gr_f_4.CreateUniqueName;
      band_gr_f_4.top:=top+height;
      band_gr_f_4.Height:=18;
      Memo1:=TfrxMemoView.Create(band_gr_f_4);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по [frxDBDataset1."NAME_GROUP1"]';
      Memo1.Height:=band_gr_f_4.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=14.10*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo2:=TfrxMemoView.Create(band_gr_f_4);
      Memo2.CreateUniqueName;
      Memo2.Text:='[SUM(<frxDBDataset1."KOL_MAT">)]';
      Memo2.Height:=band_gr_f_4.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=2.10*fr1cm;
      Memo2.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo2.DisplayFormat.Kind:=fkNumeric;
      Memo2.DisplayFormat.FormatStr:='%2.4n';
      Memo2.HAlign:=haRight;
      Memo3:=TfrxMemoView.Create(band_gr_f_4);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."SUMMA">,MasterData1)]';
      Memo3.Height:=band_gr_f_4.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2.70*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.HAlign:=haRight;
      height:=band_gr_f_4.Height;
      top:=band_gr_f_4.top;
    end;

        if bal_sch=1 then
      begin
        sch_bal_f:=TfrxGroupFooter.Create(page);
        sch_bal_f.CreateUniqueName;
        sch_bal_f.top:=top+height;
        sch_bal_f.Height:=18;
        top:=sch_bal_f.top;
        height:=sch_bal_f.Height;
         Memo1:=TfrxMemoView.Create(sch_bal_f);
         Memo1.CreateUniqueName;
         if tp=0 then Memo1.Text:='Всього по рахунку [frxDBDataset1."DB_SCH_NUMBER"]'
          else Memo1.Text:='Всього по рахунку [frxDBDataset1."KR_SCH_NUMBER"]';
         Memo1.Height:=sch_bal_f.Height;
         memo1.Left:=0;
         Memo1.Font.Size:=8;
         Memo1.Width:=14.10*fr1cm;
         Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
         Memo2:=TfrxMemoView.Create(sch_bal_f);
         Memo2.CreateUniqueName;
         Memo2.Text:='[SUM(<frxDBDataset1."KOL_MAT">)]';
         Memo2.Height:=sch_bal_f.Height;
         memo2.Left:=Memo1.Width;
         Memo2.Font.Size:=8;
         Memo2.Width:=2.10*fr1cm;
         Memo2.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
         Memo2.DisplayFormat.Kind:=fkNumeric;
         Memo2.DisplayFormat.FormatStr:='%2.4n';
         Memo2.HAlign:=haRight;
         Memo3:=TfrxMemoView.Create(sch_bal_f);
         Memo3.CreateUniqueName;
         Memo3.Text:='[SUM(<frxDBDataset1."SUMMA">,MasterData1)]';
         Memo3.Height:=sch_bal_f.Height;
         memo3.Left:=Memo1.Width+Memo2.Width;
         Memo3.Font.Size:=8;
         Memo3.Width:=2.70*fr1cm;
         Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
         Memo3.DisplayFormat.Kind:=fkNumeric;
         Memo3.DisplayFormat.FormatStr:='%2.2n';
         Memo3.HAlign:=haRight;

      end;

  sch_f:=TfrxGroupFooter.Create(page);
  sch_f.CreateUniqueName;
  sch_f.top:=top+height;
  sch_f.Height:=18;
  top:=sch_f.top;
  height:=sch_f.Height;
//  top:=band_gr_h_4.top;
//  height:=band_gr_h_4.Height;
  Memo1:=TfrxMemoView.Create(sch_f);
  Memo1.CreateUniqueName;
   if tp=0 then
       Memo1.Text:='Всього по рахунку [frxDBDataset1."BAL_DB_SCH_NUMBER"]'
   else  Memo1.Text:='Всього по рахунку [frxDBDataset1."BAL_KR_SCH_NUMBER"]';
  Memo1.Height:=sch_f.Height;
  Memo1.Width:=14.10*fr1cm;
  Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  memo1.Left:=0;
  Memo1.Font.Size:=8;
  Memo2:=TfrxMemoView.Create(sch_f);
  Memo2.CreateUniqueName;
  Memo2.Text:='[SUM(<frxDBDataset1."KOL_MAT">)]';
  Memo2.Height:=sch_f.Height;
  memo2.Left:=Memo1.Width;
  Memo2.Font.Size:=8;
  Memo2.Width:=2.10*fr1cm;
  Memo2.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  Memo2.DisplayFormat.Kind:=fkNumeric;
  Memo2.DisplayFormat.FormatStr:='%2.4n';
  Memo2.HAlign:=haRight;
  Memo3:=TfrxMemoView.Create(sch_f);
  Memo3.CreateUniqueName;
  Memo3.Text:='[SUM(<frxDBDataset1."SUMMA">,MasterData1)]';
  Memo3.Height:=sch_f.Height;
  memo3.Left:=Memo1.Width+Memo2.Width;
  Memo3.Font.Size:=8;
  Memo3.Width:=2.70*fr1cm;
  Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  Memo3.DisplayFormat.Kind:=fkNumeric;
  Memo3.DisplayFormat.FormatStr:='%2.2n';
  Memo3.HAlign:=haRight;

  band_footer:=TfrxReportSummary.Create(page);
  band_footer.CreateUniqueName;
  band_footer.top:=top+height;
  band_footer.Height:=18;
    Memo1:=TfrxMemoView.Create(band_footer);
  Memo1.CreateUniqueName;
  Memo1.Text:='Всього';
  Memo1.Height:=sch_f.Height;
  Memo1.Width:=14.10*fr1cm;
  Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  memo1.Left:=0;
  Memo1.Font.Size:=8;

  Memo2:=TfrxMemoView.Create(band_footer);
  Memo2.CreateUniqueName;
  Memo2.Text:='[SUM(<frxDBDataset1."KOL_MAT">)]';
  Memo2.Height:=sch_f.Height;
  memo2.Left:=Memo1.Width;
  Memo2.Font.Size:=8;
  Memo2.Width:=2.10*fr1cm;
  Memo2.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  Memo2.DisplayFormat.Kind:=fkNumeric;
  Memo2.DisplayFormat.FormatStr:='%2.4n';
  Memo2.HAlign:=haRight;

  Memo3:=TfrxMemoView.Create(band_footer);
  Memo3.CreateUniqueName;
  Memo3.Text:='[SUM(<frxDBDataset1."SUMMA">,MasterData1)]';
  Memo3.Height:=sch_f.Height;
  memo3.Left:=Memo1.Width+Memo2.Width;
  Memo3.Font.Size:=8;
  Memo3.Width:=2.70*fr1cm;
  Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  Memo3.DisplayFormat.Kind:=fkNumeric;
  Memo3.DisplayFormat.FormatStr:='%2.2n';
  Memo3.HAlign:=haRight;
// frxReport1.DesignReport;
// frxReport1.ShowReport;
end;



end.


