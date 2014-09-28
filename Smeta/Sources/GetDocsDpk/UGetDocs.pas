unit UGetDocs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxTextEdit, cxCheckBox, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, FIBDatabase, pFIBDatabase,Ibase,
  pFibStoredProc, cxRadioGroup, DB, FIBDataSet, pFIBDataSet, frxClass,
  frxDBSet, frxExportTXT, frxExportHTML, frxExportPDF, frxExportRTF,
  frxExportXLS, Placemnt;

type
  TfrmDocReestrEx = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton3: TcxButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edSm: TcxTextEdit;
    edRz: TcxTextEdit;
    edSt: TcxTextEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cbMonthBeg: TComboBox;
    cbYearBeg: TComboBox;
    cbMonthEnd: TComboBox;
    cbYearEnd: TComboBox;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    GroupBox3: TGroupBox;
    RandD: TcxRadioButton;
    D: TcxRadioButton;
    R: TcxRadioButton;
    PrintDataSet: TpFIBDataSet;
    DocReestr: TfrxDBDataset;
    RunByAllBudget: TcxCheckBox;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxTXTExport1: TfrxTXTExport;
    cxRadioGroup1: TcxRadioGroup;
    cxRadioGroup2: TcxRadioGroup;
    CheckTypeBudget: TcxRadioGroup;
    FormStorage1: TFormStorage;
    frxReport1: TfrxReport;
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cbMonthBegChange(Sender: TObject);
    procedure cbYearBegChange(Sender: TObject);
    procedure cxCheckBox3PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DateBeg:TDateTime;
    DateEnd:TDateTIme;
    ID_PLAN :Int64;
    ID_SM   :Integer;
    ID_RZ   :Integer;
    ID_ST   :Integer;
    Constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ID_PLAN:Int64;ID_SM:Integer;ID_RZ:Integer;ID_ST:Integer);overload;
  end;

  procedure GetDocsUnderBudget(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ID_PLAN:Int64;ID_SM:Integer;ID_RZ:Integer;ID_ST:Integer);stdcall;
  exports GetDocsUnderBudget;

implementation

uses GlobalSpr, Resources_unitb, DateUtils;
{$R *.dfm}

procedure GetDocsUnderBudget(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ID_PLAN:Int64;ID_SM:Integer;ID_RZ:Integer;ID_ST:Integer);
begin
     with TfrmDocReestrEx.Create(AOwner,DB_HANDLE,ID_PLAN,ID_SM,ID_RZ,ID_ST) do
     begin
           ShowModal;
           Free;
     end;
end;


procedure TfrmDocReestrEx.cxButton3Click(Sender: TObject);
var F_V, U_V :Boolean;
    ORDER_STR, PROC_NAME:String;
begin
     DateSeparator:='.';
     DateBeg:=StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Items[cbYearBeg.ItemIndex]);
     DateEnd:=StrToDate('01.'+IntToStr(cbMonthEnd.ItemIndex+1)+'.'+cbYearEnd.Items[cbYearEnd.ItemIndex]);
     DateEnd:=EndOfTheMonth(DateEnd);

     if PrintDataSet.Active then PrintDataSet.Close;
     Screen.Cursor:=crHourGlass;

     if (cxRadioGroup1.ItemIndex=0)
     then begin
               U_V:=false;
               F_V:=true;
     end
     else begin
               U_V:=true;
               F_V:=false;
     end;

     If (CheckTypeBudget.ItemIndex=0)
     then PROC_NAME:='BU_GET_DOCS_UNDER_BUDGET'
     else PROC_NAME:='BU_GET_DOCS_UNDER_BUDGET_SHORT';

     if (cxRadioGroup2.ItemIndex = 0)
     then begin
               ORDER_STR:=' ,DOC_NUM ASC ';
     end;
     if (cxRadioGroup2.ItemIndex = 1)
     then begin
               if (CheckTypeBudget.ItemIndex=0)
               then ORDER_STR:=' ,DATE_PROV ASC '
               else ORDER_STR:=' ,DATE_REG ASC ';
     end;
     if (cxRadioGroup2.ItemIndex = 2)
     then begin
               ORDER_STR:=' ,PROV_SUM ASC ';
     end;

     if RunByAllBudget.Checked
     then begin
               PrintDataSet.SelectSQL.Text:='SELECT * FROM '+PROC_NAME+'('+
               IntToStr(Id_SM)+','+
               IntToStr(0)+','+
               IntToStr(0)+','+
               IntToStr(Integer(U_V))+','+
               IntToStr(Integer(F_V))+','+
               ''''+DateToStr(DateBeg)+''''+','+
               ''''+DateToStr(DateEnd)+''''+') ORDER BY   RZ_PROFITABLE_TEXT DESC, RZ_NUM, ST_NUM '+ORDER_STR;
     end
     else begin
               PrintDataSet.SelectSQL.Text:='SELECT * FROM '+PROC_NAME+'('+
               IntToStr(Id_SM)+','+
               IntToStr(Id_RZ)+','+
               IntToStr(Id_ST)+','+
               IntToStr(Integer(U_V))+','+
               IntToStr(Integer(F_V))+','+
               ''''+DateToStr(DateBeg)+''''+','+
               ''''+DateToStr(DateEnd)+''''+') ORDER BY   RZ_PROFITABLE_TEXT DESC, RZ_NUM, ST_NUM '+ORDER_STR;
     end;

     if D.Checked
     then begin
               if RunByAllBudget.Checked
               then begin
                         PrintDataSet.SelectSQL.Text:='SELECT * FROM '+PROC_NAME+'('+
                         IntToStr(Id_SM)+','+
                         IntToStr(0)+','+
                         IntToStr(0)+','+
                         IntToStr(Integer(U_V))+','+
                         IntToStr(Integer(F_V))+','+
                         ''''+DateToStr(DateBeg)+''''+','+
                         ''''+DateToStr(DateEnd)+''''+') WHERE PROFITABLE=1 ORDER BY   RZ_PROFITABLE_TEXT DESC, RZ_NUM, ST_NUM '+ORDER_STR;
               end
               else begin
                         PrintDataSet.SelectSQL.Text:='SELECT * FROM '+PROC_NAME+'('+
                         IntToStr(Id_SM)+','+
                         IntToStr(Id_RZ)+','+
                         IntToStr(Id_ST)+','+
                         IntToStr(Integer(U_V))+','+
                         IntToStr(Integer(F_V))+','+
                         ''''+DateToStr(DateBeg)+''''+','+
                         ''''+DateToStr(DateEnd)+''''+') WHERE PROFITABLE=1 ORDER BY   RZ_PROFITABLE_TEXT DESC, RZ_NUM, ST_NUM '+ORDER_STR;
               end
     end;

     if R.Checked
     then begin
               if RunByAllBudget.Checked
               then begin
                         PrintDataSet.SelectSQL.Text:='SELECT * FROM '+PROC_NAME+'('+
                         IntToStr(Id_SM)+','+
                         IntToStr(0)+','+
                         IntToStr(0)+','+
                         IntToStr(Integer(U_V))+','+
                         IntToStr(Integer(F_V))+','+
                         ''''+DateToStr(DateBeg)+''''+','+
                         ''''+DateToStr(DateEnd)+''''+') WHERE PROFITABLE=0 ORDER BY   RZ_PROFITABLE_TEXT DESC, RZ_NUM, ST_NUM '+ORDER_STR;
               end
               else begin
                         PrintDataSet.SelectSQL.Text:='SELECT * FROM '+PROC_NAME+'('+
                         IntToStr(Id_SM)+','+
                         IntToStr(Id_RZ)+','+
                         IntToStr(Id_ST)+','+
                         IntToStr(Integer(U_V))+','+
                         IntToStr(Integer(F_V))+','+
                         ''''+DateToStr(DateBeg)+''''+','+
                         ''''+DateToStr(DateEnd)+''''+') WHERE PROFITABLE=0 ORDER BY   RZ_PROFITABLE_TEXT DESC, RZ_NUM, ST_NUM '+ORDER_STR;
               end
     end;

     PrintDataSet.Open;

     PrintDataSet.FetchAll;

     if (CheckTypeBudget.ItemIndex=0)
     then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\ReportBudgetDocs.fr3',true)
     else frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\ReportBudgetDocsShort.fr3',true);

     frxReport1.Variables['SM']:=''''+edSm.Text+'''';
     if cxRadioGroup1.ItemIndex=0
     then frxReport1.Variables['TYPE_UCH']:=''''+'Касовий облік'+''''
     else frxReport1.Variables['TYPE_UCH']:=''''+'Фінансовий облік'+'''';

     frxReport1.Variables['DATE_BEG']:=DateBeg;
     frxReport1.Variables['DATE_END']:=DateEnd;
     frxReport1.PrepareReport;
     Screen.Cursor:=crDefault;
     frxReport1.ShowPreparedReport;

end;

procedure TfrmDocReestrEx.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

constructor TfrmDocReestrEx.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ID_PLAN:Int64;ID_SM:Integer;ID_RZ:Integer;ID_ST:Integer);
var i :Integer;
    date_str:string;
    GetInfoSP:TpFibStoredProc;
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DB_HANDLE;

     self.ID_PLAN:=ID_PLAN;
     self.ID_SM  :=ID_SM;
     self.ID_RZ  :=ID_RZ;
     self.ID_ST  :=ID_ST;

     if self.ID_RZ<0 then self.ID_RZ:=0;
     if self.ID_ST<0 then self.ID_ST:=0;

     ReadTransaction.StartTransaction;

     //Получение информации о бюджете
     GetInfoSP:=TpFibStoredProc.Create(self);
     GetInfoSP.Database:=WorkDatabase;
     GetInfoSP.Transaction:=ReadTransaction;
     GetInfoSP.StoredProcName:='PUB_SPR_SMETA_INFO';
     GetInfoSP.Prepare;
     GetInfoSP.ParamByName('ID_SMETA').Value:=self.ID_SM;
     GetInfoSP.ExecProc;
     if GetInfoSP.ParamByName('SMETA_KOD').Value<>null
     then edSm.Text:=GetInfoSP.ParamByName('SMETA_KOD').AsString+' "'+GetInfoSP.ParamByName('SMETA_TITLE').AsString+'"';


     //Получение информации о разделе
     GetInfoSP.Close;
     GetInfoSP.StoredProcName:='PUB_SPR_RAZD_ST_INFO';
     GetInfoSP.Prepare;
     GetInfoSP.ParamByName('ID_RAZD_ST_IN').Value:=self.ID_RZ;
     GetInfoSP.ExecProc;
     if GetInfoSP.ParamByName('RAZD_ST_NUM').Value<>null
     then edRz.Text:=GetInfoSP.ParamByName('RAZD_ST_NUM').AsString+' "'+GetInfoSP.ParamByName('RAZD_ST_TITLE').AsString+'"';

     //Получение информации о статье
     GetInfoSP.Close;
     GetInfoSP.StoredProcName:='PUB_SPR_RAZD_ST_INFO';
     GetInfoSP.Prepare;
     GetInfoSP.ParamByName('ID_RAZD_ST_IN').Value:=self.ID_ST;
     GetInfoSP.ExecProc;

     if GetInfoSP.ParamByName('RAZD_ST_NUM').Value<>null
     then edSt.Text:=GetInfoSP.ParamByName('RAZD_ST_NUM').AsString+' "'+GetInfoSP.ParamByName('RAZD_ST_TITLE').AsString+'"';

     //Получение информации о периоде функционирования бюджета
     GetInfoSP.Close;
     GetInfoSP.StoredProcName:='BU_GET_SM_INFO_BY_PLAN';
     GetInfoSP.Prepare;
     GetInfoSP.ParamByName('ID_PLAN').AsInt64:=self.ID_PLAN;
     GetInfoSP.ExecProc;

     if GetInfoSP.ParamByName('DATE_BEG').Value<>null
     then begin
               self.DateBeg:=GetInfoSP.ParamByName('DATE_BEG').Value;
               self.DateEnd:=GetInfoSP.ParamByName('DATE_END').Value;
     end
     else begin
               self.DateBeg:=Date;
               self.DateEnd:=Date;
     end;

     GetInfoSP.Close;
     GetInfoSP.Free;

     //Отображение периода функционирования бюджета
     cbMonthBeg.Items.Add(TRIM(BU_Month_01));
     cbMonthBeg.Items.Add(TRIM(BU_Month_02));
     cbMonthBeg.Items.Add(TRIM(BU_Month_03));
     cbMonthBeg.Items.Add(TRIM(BU_Month_04));
     cbMonthBeg.Items.Add(TRIM(BU_Month_05));
     cbMonthBeg.Items.Add(TRIM(BU_Month_06));
     cbMonthBeg.Items.Add(TRIM(BU_Month_07));
     cbMonthBeg.Items.Add(TRIM(BU_Month_08));
     cbMonthBeg.Items.Add(TRIM(BU_Month_09));
     cbMonthBeg.Items.Add(TRIM(BU_Month_10));
     cbMonthBeg.Items.Add(TRIM(BU_Month_11));
     cbMonthBeg.Items.Add(TRIM(BU_Month_12));

     for i:=0 to YEARS_COUNT do
     begin
        cbYearBeg.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
     end;

     dateTimetostring(date_str,'dd.mm.yyyy', Datebeg);
     cbMonthBeg.ItemIndex:=MonthOf(Datebeg)-1;
     for i:=0 to cbYearBeg.Items.Count-1 do
     begin
         if pos(cbYearBeg.Items[i],IntToStr(YearOf(Datebeg)))>0
         then begin
            cbYearBeg.ItemIndex:=i;
            break;
         end;
     end;

     cbMonthEnd.Items.Add(TRIM(BU_Month_01));
     cbMonthEnd.Items.Add(TRIM(BU_Month_02));
     cbMonthEnd.Items.Add(TRIM(BU_Month_03));
     cbMonthEnd.Items.Add(TRIM(BU_Month_04));
     cbMonthEnd.Items.Add(TRIM(BU_Month_05));
     cbMonthEnd.Items.Add(TRIM(BU_Month_06));
     cbMonthEnd.Items.Add(TRIM(BU_Month_07));
     cbMonthEnd.Items.Add(TRIM(BU_Month_08));
     cbMonthEnd.Items.Add(TRIM(BU_Month_09));
     cbMonthEnd.Items.Add(TRIM(BU_Month_10));
     cbMonthEnd.Items.Add(TRIM(BU_Month_11));
     cbMonthEnd.Items.Add(TRIM(BU_Month_12));

     for i:=0 to YEARS_COUNT do
     begin
        cbYearEnd.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
     end;

     dateTimetostring(date_str,'dd.mm.yyyy', Dateend);
     cbMonthEnd.ItemIndex:=MonthOf(Dateend)-1;
     for i:=0 to cbYearEnd.Items.Count-1 do
     begin
         if pos(cbYearEnd.Items[i],IntToStr(YearOf(Dateend)))>0
         then begin
            cbYearEnd.ItemIndex:=i;
            break;
         end;
     end;
end;

procedure TfrmDocReestrEx.cbMonthBegChange(Sender: TObject);
begin
     cbMonthEnd.ItemIndex:=cbMonthBeg.ItemIndex;
     cbYearEnd.ItemIndex:=cbYearBeg.ItemIndex;

end;

procedure TfrmDocReestrEx.cbYearBegChange(Sender: TObject);
begin
     cbMonthEnd.ItemIndex:=cbMonthBeg.ItemIndex;
     cbYearEnd.ItemIndex:=cbYearBeg.ItemIndex;
end;

procedure TfrmDocReestrEx.cxCheckBox3PropertiesChange(Sender: TObject);
begin
     label5.Enabled:=not RunByAllBudget.Checked;
     label6.Enabled:=not RunByAllBudget.Checked;
     edRz.Enabled  :=not RunByAllBudget.Checked;
     edSt.Enabled  :=not RunByAllBudget.Checked;
end;

end.
