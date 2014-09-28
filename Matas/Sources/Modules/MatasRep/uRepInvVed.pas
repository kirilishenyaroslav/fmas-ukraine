{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль печати отчетов                                 }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uRepInvVed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, DB, FIBDataSet, pFIBDataSet, FR_Class, FR_DSet, FR_DBSet,
  cxCheckBox, FIBDatabase, pFIBDatabase, ibase, cxButtonEdit,
  uSpMatOtv, uSpMatSchEx, uMatasVars, GlobalSPR, uMatasUtils, ActnList,
  frxClass, frxDBSet, frxDesgn, frxExportXLS, frxExportRTF;

procedure ShowRepInv(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;

exports ShowRepInv;

type
  TInvRepForm = class(TForm)
    cxMonth: TcxComboBox;
    cxYear: TcxSpinEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Label1: TLabel;
    cxCheckBox1: TcxCheckBox;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    ReportDataSet: TpFIBDataSet;
    cxMatOtv: TcxButtonEdit;
    Label2: TLabel;
    Label3: TLabel;
    cxReport: TcxComboBox;
    LabelSch: TLabel;
    cxSchEdit: TcxButtonEdit;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    Label4: TLabel;
    cxCopies: TcxSpinEdit;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionOk: TAction;
    cxPrintKol: TcxCheckBox;
    frxRTFExport1: TfrxRTFExport;
    frxXLSExport1: TfrxXLSExport;
    frxDesigner1: TfrxDesigner;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    cxButton1: TcxButton;
    actShablon: TAction;
    cxButton2: TcxButton;
    actShPrint: TAction;
    ds_vibor: TpFIBDataSet;
    ds_sch: TpFIBDataSet;
    lbl1: TLabel;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    cxDates: TcxCheckBox;
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxMatOtvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxSchEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxSchEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionOkExecute(Sender: TObject);
    procedure actShablonExecute(Sender: TObject);
    procedure actShPrintExecute(Sender: TObject);
  private
    { Private declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
    { Public declarations }
   MatasMonth, MatasYear: Word;
   PERIOD: TDateTime;
   ID_SCH: integer;
   TIP_SCH: integer;
   ID_MO: integer;
   avtoprint:Boolean;
   aReports: Variant;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64; PERIOD: TDateTime);overload;
  end;

var
  InvRepForm: TInvRepForm;

implementation

{$R *.dfm}
uses DateUtils, uShablonInvVed;

procedure ShowRepInv(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 TinvRepForm.Create(AOwner, DBHANDLE, aID_USER, aPERIOD);
end;

constructor TInvRepForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; PERIOD: TDateTime);
var
 dy, dm, dd: Word;
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.WorkDatabase.Close;
   Self.WorkDatabase.Handle:=DBHANDLE;
   Self.PERIOD:=PERIOD;
   Self.Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_REP_INV;
   DecodeDate(PERIOD, dy, dm,  dd);
   MatasYear:=dy;
   MatasMonth:=dm;
   LoadMonthTocxComboBox(self.cxMonth);
   LoadMonthTocxComboBox(self.cxMonthEnd);
   self.cxMonth.ItemIndex:=MatasMonth-1;
   self.cxYear.Value:=MatasYear;
   if MatasMonth=12 then
   begin
   self.cxMonthEnd.ItemIndex:=0;
   self.cxYearEnd.Value:=MatasYear+1;
   end
   else
   begin
   self.cxMonthEnd.ItemIndex:=MatasMonth;
   self.cxYearEnd.Value:=MatasYear;
   end;
   self.ID_SCH:=0;
   self.ID_MO:=0;
   self.TIP_SCH:=1;
 end;
end;

procedure TInvRepForm.OkButtonClick(Sender: TObject);
var
 DBEG, DEND: TDateTime;
 prefix: string;
 w: TForm;
 nRepKod: integer;
 cRepTemplate, period_str, period_end: string;
begin
 w:=ShowWaitWindow(self);
 MatasYear:=cxYear.Value;
 MatasMonth:=cxMonth.ItemIndex+1;
 DBEG:=StartOfAMonth(MatasYear, MatasMonth);
 DEND:=StartOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);
 ReportDataSet.Close;
 nRepKod:=aReports[cxReport.ItemIndex][1];
 cRepTemplate:=aReports[cxReport.ItemIndex][3];
 //showmessage(IntToStr(nRepKod));
 if (nRepKod=10) or (nRepKod=130) then
 begin
  with ReportDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_MAKE_INV_VED(:ID_MO, :PDATE)');
   if ID_SCH>0 then begin
   { if TIP_SCH=1 then
     Add('WHERE ID_SCH='+IntToStr(ID_SCH))
    else
     Add('WHERE GROUP_ID_SCH='+IntToStr(ID_SCH)); }
     Add('WHERE (ID_SCH='+IntToStr(ID_SCH)+') OR (GROUP_ID_SCH= '+IntToStr(ID_SCH)+')');
   end;
   Add('ORDER BY GROUP_SCH_NUMBER, NAME, ID_OST, INVNOM');
  end;
  ReportDataSet.Prepare;
  ReportDataSet.ParamByName('ID_MO').Value:=ID_MO;
  ReportDataSet.ParamByName('PDATE').Value:=DBEG;
//  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\inv_ved.frf');
 end;

 if nRepKod=11 then  begin
  with ReportDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_MAKE_INV_VED2(:ID_MO, :PDATE)');
   if ID_SCH>0 then begin
    if TIP_SCH=1 then
     Add('WHERE ID_SCH='+IntToStr(ID_SCH))
    else
     Add('WHERE GROUP_ID_SCH='+IntToStr(ID_SCH));
   end;
   Add('ORDER BY GROUP_SCH_NUMBER, NAME, ID_OST, INVNOM');
  end;
  ReportDataSet.Prepare;
  ReportDataSet.ParamByName('ID_MO').Value:=ID_MO;
  ReportDataSet.ParamByName('PDATE').Value:=DBEG;
//  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\inv_ved.frf');
 end;

 if (nRepKod=20) then  begin
  prefix:='WHERE';
  with ReportDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_MAKE_INV_PROT_ITOG(:PDATE)');
   if ID_SCH>0 then begin
    if TIP_SCH=1 then
     Add(prefix+' ID_SCH='+IntToStr(ID_SCH))
    else
     Add(prefix+' GROUP_ID_SCH='+IntToStr(ID_SCH));
    prefix:=' AND '
   end;
   if ID_MO>0 then begin
    Add(prefix+' ID_MO='+IntToStr(ID_MO))
   end;
   if cRepTemplate='inv_protokoli_sch_mo.fr3' then
   Add('ORDER BY  GROUP_SCH_NUMBER, SFIO')
   else
   Add('ORDER BY GROUP_SCH_NUMBER, SFIO, Name');

  end;
  ReportDataSet.Prepare;
  ReportDataSet.ParamByName('PDATE').Value:=DBEG;
 end;

 if (nRepKod=30) then  begin
  prefix:='WHERE';
  with ReportDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_MAKE_INV_PROT_FULL(:PDATE)');
   if ID_SCH>0 then begin
    if TIP_SCH=1 then
     Add(prefix+' ID_SCH='+IntToStr(ID_SCH))
    else
     Add(prefix+' GROUP_ID_SCH='+IntToStr(ID_SCH));
    prefix:=' AND '
   end;
   if ID_MO>0 then begin
    Add(prefix+' ID_MO='+IntToStr(ID_MO))
   end;
   Add('ORDER BY ID_MO, GROUP_SCH_NUMBER, NAME');
  end;
  ReportDataSet.Prepare;
  ReportDataSet.ParamByName('PDATE').Value:=DBEG;
 end;


 if (nRepKod>=40) and (cxReport.ItemIndex<=110) then  begin
  prefix:='WHERE';
  with ReportDataSet.SelectSQL do
  begin
   Clear;
{   Add('SELECT * FROM MAT_MAKE_INV_VED_FULL(:PDATE)');
   if ID_SCH>0 then begin
    if TIP_SCH=1 then
     Add(prefix+' ID_SCH='+IntToStr(ID_SCH))
    else
     Add(prefix+' GROUP_ID_SCH='+IntToStr(ID_SCH));
    prefix:=' AND '
   end;
   if ID_MO>0 then begin
    Add(prefix+' ID_MO='+IntToStr(ID_MO))
   end;
}
   Add('SELECT * FROM MAT_MAKE_INV_VED_FULL_EX(:PDATE, :PID_MO, :PID_SCH, :PBAL_ID_SCH)');
   Add('ORDER BY ID_MO, GROUP_SCH_NUMBER, NAME, ID_OST, INVNOM, NUM_BSO');
  end;
  ReportDataSet.Prepare;
  ReportDataSet.ParamByName('PDATE').Value:=DBEG;
  ReportDataSet.ParamByName('PID_MO').Value:=-1;
  ReportDataSet.ParamByName('PID_SCH').Value:=-1;
  ReportDataSet.ParamByName('PBAL_ID_SCH').Value:=-1;
  if ID_SCH>0 then begin
   if TIP_SCH=1 then
    ReportDataSet.ParamByName('PID_SCH').Value:=ID_SCH
   else
    ReportDataSet.ParamByName('PBAL_ID_SCH').Value:=ID_SCH;
  end;
  if ID_MO>0 then begin
   ReportDataSet.ParamByName('PID_MO').Value:=ID_MO
  end;
 end;

{ if cxReport.ItemIndex=1 then
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\inv_protokoli.frf');
 if cxReport.ItemIndex=2 then
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\inv_protokolf.frf');
 if cxReport.ItemIndex=3 then
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\inv_ved_os.frf');
 if cxReport.ItemIndex=4 then
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\inv_cmp_os.frf');
 if cxReport.ItemIndex=5 then
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\inv_ved_mat.frf');
 if cxReport.ItemIndex=6 then
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\inv_cmp_mat.frf');
 if cxReport.ItemIndex=7 then
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\inv_ved_nma.frf');
 if cxReport.ItemIndex=8 then
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\inv_cmp_nma.frf');
 if cxReport.ItemIndex=9 then
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\inv_ved_bso.frf');
 if cxReport.ItemIndex=10 then
  frOstReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\inv_cmp_bso.frf');
}

 if nRepKod=120 then  begin
  with ReportDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_MAKE_DRAG_MET_INV_VED(:ID_MO, :PERIOD)');
   if ID_SCH>0 then begin
    if TIP_SCH=1 then
     Add('WHERE ID_SCH='+IntToStr(ID_SCH))
    else
     Add('WHERE BAL_ID_SCH='+IntToStr(ID_SCH));
   end;
   Add('ORDER BY BAL_SCH_NUMBER, NAME, INVNUM');
  end;
  ReportDataSet.Prepare;
  ReportDataSet.ParamByName('ID_MO').Value:=ID_MO;
  ReportDataSet.ParamByName('PERIOD').Value:=DBEG;
 end;

 frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\'+cRepTemplate);
 ReportDataSet.CloseOpen(false);
 if ((ReportDataSet.IsEmpty) and (avtoprint=true)) then begin Exit; end;
 period_str:=  cxMonth.Text+' '+IntToStr(cxYear.Value);
 period_end:=  cxMonthEnd.Text+' '+IntToStr(cxYearEnd.Value);
 frxReport1.Variables['PERIOD']:=''''+period_str+'''';
 frxReport1.Variables['ORG_NAME']:=''''+_ORG_FULL_NAME+'''';
 frxReport1.Variables['ORG_SHORT_NAME']:=''''+_ORG_SHORT_NAME+'''';
 frxReport1.Variables['ORG_KOD_OKPO']:=''''+_ORG_KOD_OKPO+'''';
 frxReport1.Variables['PRINT_KOL_SUM']:=''''+IntToStr(BoolToInt(cxPrintKol.Checked))+'''';
 frxReport1.Variables['PERIOD_END']:=''''+period_end+'''';
 if cxDates.Checked=True then
 frxReport1.Variables['DateStr']:=''''+'1'+''''
 else
 frxReport1.Variables['DateStr']:=''''+'0'+'''';
 CloseWaitWindow(w);

frxReport1.PrepareReport;
 if cxCopies.Value>1 then
  frxReport1.PrintOptions.Copies:=cxCopies.Value;
 if cxCheckOnPrinter.Checked = True then
 begin
  if cxSelectPrinter.Checked = True then
   frxReport1.PrintOptions.ShowDialog:=True
  else
   frxReport1.Print;
 end
 else
  if cxCheckBox1.Checked then
   frxReport1.DesignReport
   else begin frxReport1.ShowReport; frxReport1.PrintOptions.ShowDialog:=True; end;
end;

procedure TInvRepForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TInvRepForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TInvRepForm.FormCreate(Sender: TObject);
begin
 ID_MO:=0;
 //procedure LoadReportsTocxComboBox(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE;
 //   aOBJECT: string; aComboBox: TcxComboBox; var aReports: Variant);
 LoadReportsTocxComboBox(self, DBHANDLE, 'INV_VED', cxReport, aReports);

 cxReport.ItemIndex:=0;
 cxCopies.Value:=1;
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 cxCheckBox1.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
 WorkTransaction.StartTransaction;
end;

procedure TInvRepForm.cxMatOtvPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  IsMoOk:boolean;
begin
 IsMoOk:=false;
 Res:=uSpMatOtv.GetMatOtv(self, DBHANDLE, 0, ID_MO);
 if  VarType(Res) <> varEmpty then
 begin
  ID_MO:=Res[0];
  IsMoOk:=true;
 end;
  if IsMoOk then
  begin
   cxMatOtv.Text:=Res[1];
  end;
end;

procedure TInvRepForm.cxSchEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=uSpMatSchEx.GetMatSchFull(self, DBHandle, 0, ID_SCH);
 if VarArrayDimCount(Res)>0 then
 begin
   ID_SCH := Res[0];
   cxSchEdit.Text := VarToStr(RES[1]);
   TIP_SCH:=Res[3];
 end;
end;

procedure TInvRepForm.cxSchEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxSchEdit.Text:='';
  ID_SCH:=0;
  TIP_SCH:=1;
 end
end;

procedure TInvRepForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

procedure TInvRepForm.ActionOkExecute(Sender: TObject);
begin
  OkButtonClick(self);
end;

procedure TInvRepForm.actShablonExecute(Sender: TObject);
var form:TShablonForm;
begin
 form:=TShablonForm.Create(Self);
 Form.dbhandle:=dbHandle;
 Form.showModal;
end;

procedure TInvRepForm.actShPrintExecute(Sender: TObject);
var n,i:Integer;
    flag_:Boolean;
begin
  n:= cxReport.Properties.Items.Count;
  flag_:=True;
  avtoprint:=true;
  cxCheckOnPrinter.Checked:=True;

  ds_vibor.close;
  ds_vibor.selectSql.text:='select id_sch from MAT_SHABLON_PRINT_INV_VED where linkto=0';
  ds_vibor.prepare;
  ds_vibor.closeopen(false);
  ds_vibor.fetchall;
  ds_vibor.first;
  i:=0;
  cxReport.ItemIndex:=0;
  while not ds_vibor.eof do
  begin
    cxReport.ItemIndex:=0;
    i:=0;
    flag_:=True;
    while ((flag_)and(i<n)) do
    begin
      if aReports[cxReport.ItemIndex][0] = ds_vibor.FieldValues['id_sch'] then
      begin
       cxReport.ItemIndex:=i;
       flag_:=False;
      end
      else
      begin
      Inc(i);
      cxReport.ItemIndex:=i;
      end;
    end;
    if flag_=false then
    begin
    ds_sch.close;
    ds_sch.selectsql.text:='select id_sch, type_sch from MAT_SHABLON_PRINT_BAL_SEL('+inttostr(ds_vibor.FieldValues['id_sch'])+')';
    ds_sch.prepare;
    ds_sch.closeopen(false);
    ds_sch.fetchall;
    ds_sch.first;
    while not ds_sch.eof do
    begin
      ID_SCH:= ds_sch.FieldValues['id_sch'];
      TIP_SCH:= ds_sch.FieldValues['type_sch'];
      OkButtonClick(self);
      ds_sch.next;
    end;

    end;
    ds_vibor.next;
  end;
end;

end.


