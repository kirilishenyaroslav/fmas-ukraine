unit uChooseParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, RxMemDS, FIBDatabase, pFIBDatabase,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, FIBDataSet, pFIBDataSet, uMainOborot, cxCheckBox, ActnList,
  Buttons, cxSpinEdit, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  StdCtrls, cxLookAndFeelPainters, cxButtons, cn_Common_Types, cn_common_loader,
  ibase, uMainPerem, frxClass, frxDBSet, frxDesgn, uWate, FIBQuery,
  pFIBQuery, pFIBStoredProc, DateUtils, frxExportPDF, frxExportImage,
  frxExportRTF, frxExportXLS, frxExportHTML, frxExportTXT, Printers, LoadPackegeStudCity;

type
  TChooseForm = class(TForm)
    pnl1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ds1: TDataSource;
    cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn2: TcxGridDBColumn;
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
    actlst1: TActionList;
    actPrint: TAction;
    actClose: TAction;
    cxButton1: TcxButton;
    CancelBut: TcxButton;
    cxButton2: TcxButton;
    actChoose: TAction;
    cxPidsum: TcxCheckBox;
    DataSet: TpFIBDataSet;
    DataSetORD_FIELD: TFIBIntegerField;
    DataSetNAME_FIELD: TFIBStringField;
    DataSetSELECT_FIELD: TFIBBooleanField;
    RxMemoryData: TRxMemoryData;
    DatabaseWork: TpFIBDatabase;
    ReadTr: TpFIBTransaction;
    DataSetReport: TpFIBDataSet;
    frxDesigner1: TfrxDesigner;
    frxDBDataset1: TfrxDBDataset;
    cxButton3: TcxButton;
    actReport: TAction;
    StorProc: TpFIBStoredProc;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxPDFExport1: TfrxPDFExport;
    cxPortrate: TcxCheckBox;
    cxFiltrMain: TcxCheckBox;
    cxPrintNumDog: TcxCheckBox;
    cxMemOrd: TcxCheckBox;
    ds_podchin: TpFIBDataSet;
    ds_podchin_1: TpFIBDataSet;
    DataSetFullSch: TpFIBDataSet;
    ds_pod: TfrxDBDataset;
    ds_pod2: TfrxDBDataset;
    acDesighn: TAction;
    lbl1: TLabel;
    frReport: TfrxReport;
    procedure actPrintExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actChooseExecute(Sender: TObject);
    procedure cxPidsumPropertiesChange(Sender: TObject);
    procedure actReportExecute(Sender: TObject);
    procedure cxFiltrMainPropertiesChange(Sender: TObject);
    procedure cxPrintNumDogPropertiesChange(Sender: TObject);
    procedure cxMemOrdPropertiesChange(Sender: TObject);
    procedure acDesighnExecute(Sender: TObject);
   private
    { Private declarations }
  public
    DB_HANDLE:TISC_DB_HANDLE;
    DBEG: TDateTime;
    id_session:Integer;
    druk_pid:boolean;
    Last:String;
    print, flag, rx_rec, id_main_session:Integer;
    fac_flag, spec_flag, nat_flag, f_stud_flag, k_stud_flag, kurs_flag, n_gr_flag, period_opl_flag:Integer;
    obsh_flag, fac_st_flag, kurs_st_flag, kat_pay_flag, type_live_flag, cl_live_flag, grp_flag:Integer;
    m_beg, m_end, y_beg, y_end, is_des:Integer;
    is_enabled:integer;
    gl_filtr:string;
    print_num_dog:Boolean;
    IN_DS, IN_KS, OUT_DS, OUT_KS:Double;

    procedure MakeReport;
    procedure MakeReport_portrate;
    procedure MakeReport_ost;
    procedure MakeReport_MemOrd;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; month_beg:Integer; month_end:Integer; year_beg:Integer; year_end:Integer; id_main_ses:Integer);overload;
  end;

var
  ChooseForm: TChooseForm;

implementation

{$R *.dfm}
constructor TChooseForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; month_beg:Integer; month_end:Integer; year_beg:Integer; year_end:Integer; id_main_ses:Integer);
var DATE_REC:TDateTime;
    month, year:Word;
begin
inherited Create(AOwner);
if Assigned(DBHandle)
then begin
 Self.DB_HANDLE := DBHandle;
 Self.DatabaseWork.Close;
 Self.DatabaseWork.Handle:=DBHANDLE;

 Self.DataSet.Close;
 Self.DataSet.SelectSQL.Clear;

 if FORM_UCH = 19 then
 begin
  Self.DataSet.SelectSQL.Add('SELECT * FROM ST_INI_PRINT_SETUP');
  //cxMemOrd.Visible:=False;
 end;

 if FORM_UCH = 20 then
 begin
  Self.DataSet.SelectSQL.Add('SELECT * FROM CN_INI_PRINT_SETUP ORDER BY ORD_FIELD');
 end;

 Self.DataSet.CloseOpen(false);
 Self.RxMemoryData.Open;
 Self.DataSet.FetchAll;
 Self.DataSet.First;

 while not Self.DataSet.Eof do
 begin
  if not Self.RxMemoryData.Locate('NAME_FIELD',DataSet['NAME_FIELD'],[loCaseInsensitive]) then
  begin
   Self.RxMemoryData.Append;
   Self.rxMemoryData.FieldByName('ORD_FIELD').AsInteger:= Self.DataSet['ORD_FIELD'];
   Self.RxMemoryData.FieldByName('NAME_FIELD').AsString:=Self.DataSet['NAME_FIELD'];
   Self.RxMemoryData.FieldByName('ON_CHECK').AsInteger:=Self.DataSetSELECT_FIELD.AsInteger;
   Self.RxMemoryData.Post;
  end;
  Self.DataSet.Next;
 end;

 druk_pid:=False;
 print:=0;

 if FORM_UCH = 20 then id_session := DatabaseWork.Gen_Id('CN_GEN_REPORT_ID_SESSION', 1, ReadTr);
 if FORM_UCH = 19 then id_session := DatabaseWork.Gen_Id('GEN_ST_DT_REPORTS_TRANSACTION', 1, ReadTr);

 flag:=0;

 fac_flag:=0;
 spec_flag:=0;
 nat_flag:=0;
 f_stud_flag:=0;
 k_stud_flag:=0;
 kurs_flag:=0;
 n_gr_flag:=0;
 period_opl_flag:=0;

 obsh_flag:=0;
 fac_st_flag:=0;
 kurs_st_flag:=0;
 kat_pay_flag:=0;
 type_live_flag:=0;
 cl_live_flag:=0;
 grp_flag:=0;

 is_des:=0;

 gl_filtr:='';

 id_main_session:=id_main_ses;
 cxButton1.Enabled:=False;
 cxPortrate.Checked:=True;

 print_num_dog:=True;

end;
end;

procedure TChooseForm.actPrintExecute(Sender: TObject);
var f:TWateForm;
    i,k:Integer;
    prefix:string;
    year, month:Word;
begin

 fac_flag:=0;
 spec_flag:=0;
 nat_flag:=0;
 f_stud_flag:=0;
 k_stud_flag:=0;
 kurs_flag:=0;
 n_gr_flag:=0;
 period_opl_flag:=0;

 obsh_flag:=0;
 fac_st_flag:=0;
 kurs_st_flag:=0;
 kat_pay_flag:=0;
 type_live_flag:=0;
 cl_live_flag:=0;
 grp_flag:=0;

 f:=TWateForm.Create(Self);
 f.Show;
 f.Update;

 flag:=1;
 if FORM_UCH = 20  then
 begin

  DataSetReport.Close;
  DataSetReport.SelectSql.Clear;

  if druk_pid = False then
  begin
   DataSetReport.SelectSQL.Add(' SELECT * FROM PC_TMP_REPORT_TABLE_SELECT(:ID_SESSION, :ID_SESSION_PARAMS)');
   if cxFiltrMain.Checked = True then   DataSetReport.SelectSQL.Add(gl_filtr);
  end
  else
  begin
   DataSetReport.SelectSql.Clear;
   if IS_VALYUTA = 1 then
   DataSetReport.SelectSQL.Add(' SELECT NAME_VAL, CODE_VAL, SYMBOL')
   else
   DataSetReport.SelectSQL.Add(' SELECT ');
   //i:=1;  showmessage('begin');
   RXMemoryData.Open;
   k:=RxMemoryData.RecordCount;
   rx_rec:=RxMemoryData.RecordCount;
   RXMemoryData.first;
   if IS_VALYUTA = 1 then
   prefix:=','
   else
   prefix:='';
   for i:=1 to k do
   begin
    if RXMemoryData.FieldByName('ON_CHECK').AsInteger = 1 then
    begin
     if RXMemoryData.FieldByName('NAME_FIELD').AsString='Факультет' then begin DataSetReport.SelectSQL.Add(prefix+' NAME_FACUL '); Last:='NAME_FACUL'; end;
     if RXMemoryData.FieldByName('NAME_FIELD').AsString='Спеціальність' then begin DataSetReport.SelectSQL.Add(prefix+' NAME_SPEC '); Last:='NAME_SPEC'; end;
     if RXMemoryData.FieldByName('NAME_FIELD').AsString='Громадянство' then begin DataSetReport.SelectSQL.Add(prefix+' NAME_NATIONAL '); Last:='NAME_NATIONAL'; end;
     if RXMemoryData.FieldByName('NAME_FIELD').AsString='Форма навчання' then begin DataSetReport.SelectSQL.Add(prefix+' NAME_FORM_STUD ');Last:='NAME_FORM_STUD'; end;
     if RXMemoryData.FieldByName('NAME_FIELD').AsString='Категорія навчання' then begin DataSetReport.SelectSQL.Add(prefix+' NAME_KAT_STUD '); Last:='NAME_KAT_STUD';end;
     if RXMemoryData.FieldByName('NAME_FIELD').AsString='Курс' then begin DataSetReport.SelectSQL.Add(prefix+' KURS '); Last:='KURS';end;
     if RXMemoryData.FieldByName('NAME_FIELD').AsString='Група' then begin DataSetReport.SelectSQL.Add(prefix+' NAME_GROUP ');Last:='NAME_GROUP'; end;
     if RXMemoryData.FieldByName('NAME_FIELD').AsString='Періодичність оплати' then begin DataSetReport.SelectSQL.Add(prefix+' NAME_STAGE ');Last:='NAME_STAGE'; end;
     prefix := ' , ';
    end;
    RxMemoryData.Next;
    end;
   if IS_VALYUTA = 1 then
   DataSetReport.SelectSQL.Add( prefix + 'SUM(IN_DB_SUMMA), SUM(IN_KR_SUMMA), SUM(DB_SUMMA), SUM(KR_SUMMA), SUM(OUT_DB_SUMMA), SUM(OUT_KR_SUMMA), SUM(IN_DB_SUMMA_VAL), SUM(IN_KR_SUMMA_VAL), SUM(DB_SUMMA_VAL), SUM(KR_SUMMA_VAL), SUM(OUT_DB_SUMMA_VAL), SUM(OUT_KR_SUMMA_VAL) ' )
   else
   DataSetReport.SelectSQL.Add( prefix + 'SUM(IN_DB_SUMMA), SUM(IN_KR_SUMMA), SUM(DB_SUMMA), SUM(KR_SUMMA), SUM(OUT_DB_SUMMA), SUM(OUT_KR_SUMMA) ' );
   DataSetReport.SelectSQL.Add(' FROM PC_TMP_REPORT_TABLE_SELECT(:ID_SESSION, :ID_SESSION_PARAMS) ');

   if IS_VALYUTA = 1 then
   DataSetReport.SelectSQL.Add(' GROUP BY NAME_VAL,  CODE_VAL, SYMBOL')
   else
   DataSetReport.SelectSQL.Add(' GROUP BY ');
   //i:=1;
   RXMemoryData.Open;
   k:=RxMemoryData.RecordCount;
   rx_rec:=RxMemoryData.RecordCount;
   RXMemoryData.first;
   if IS_VALYUTA = 1 then
   prefix:=','
   else
   prefix:='';
   for i:=1 to k do
   begin
    if RXMemoryData.FieldByName('ON_CHECK').AsInteger = 1 then
    begin
     if RXMemoryData.FieldByName('NAME_FIELD').AsString='Факультет' then begin DataSetReport.SelectSQL.Add(prefix+' NAME_FACUL '); Last:='NAME_FACUL'; end;
     if RXMemoryData.FieldByName('NAME_FIELD').AsString='Спеціальність' then begin DataSetReport.SelectSQL.Add(prefix+' NAME_SPEC '); Last:='NAME_SPEC'; end;
     if RXMemoryData.FieldByName('NAME_FIELD').AsString='Громадянство' then begin DataSetReport.SelectSQL.Add(prefix+' NAME_NATIONAL '); Last:='NAME_NATIONAL'; end;
     if RXMemoryData.FieldByName('NAME_FIELD').AsString='Форма навчання' then begin DataSetReport.SelectSQL.Add(prefix+' NAME_FORM_STUD ');Last:='NAME_FORM_STUD'; end;
     if RXMemoryData.FieldByName('NAME_FIELD').AsString='Категорія навчання' then begin DataSetReport.SelectSQL.Add(prefix+' NAME_KAT_STUD '); Last:='NAME_KAT_STUD';end;
     if RXMemoryData.FieldByName('NAME_FIELD').AsString='Курс' then begin DataSetReport.SelectSQL.Add(prefix+' KURS '); Last:='KURS';end;
     if RXMemoryData.FieldByName('NAME_FIELD').AsString='Група' then begin DataSetReport.SelectSQL.Add(prefix+' NAME_GROUP ');Last:='NAME_GROUP'; end;
     if RXMemoryData.FieldByName('NAME_FIELD').AsString='Періодичність оплати' then begin DataSetReport.SelectSQL.Add(prefix+' NAME_STAGE ');Last:='NAME_STAGE'; end;
     prefix := ' , ';
    end;
    RxMemoryData.Next;

   end;
  if druk_pid  = False then DataSetReport.SelectSQL.Add(prefix+' FIO ');
  end;

  RXMemoryData.Open;
  k:=RxMemoryData.RecordCount;
  rx_rec:=RxMemoryData.RecordCount;
  RXMemoryData.first;
 // i:=1;
  if IS_VALYUTA = 1 then
  prefix:=' ORDER BY NAME_VAL, '
  else
  prefix:=' ORDER BY ';

  for i:=1 to k do
  begin
   if RXMemoryData.FieldByName('ON_CHECK').AsInteger = 1 then
   begin
    if RXMemoryData.FieldByName('NAME_FIELD').AsString='Факультет' then
    begin
     DataSetReport.SelectSQL.Add(prefix+' NAME_FACUL ');
     fac_flag:=1;
    end;
    if RXMemoryData.FieldByName('NAME_FIELD').AsString='Спеціальність' then
    begin
     DataSetReport.SelectSQL.Add(prefix+' NAME_SPEC ');
     spec_flag:=1;
    end;
    if RXMemoryData.FieldByName('NAME_FIELD').AsString='Громадянство' then
    begin
     DataSetReport.SelectSQL.Add(prefix+' NAME_NATIONAL ');
     nat_flag:=1;
    end;
    if RXMemoryData.FieldByName('NAME_FIELD').AsString='Форма навчання' then
    begin
     DataSetReport.SelectSQL.Add(prefix+' NAME_FORM_STUD ');
     f_stud_flag:=1;
    end;
    if RXMemoryData.FieldByName('NAME_FIELD').AsString='Категорія навчання' then
    begin
     DataSetReport.SelectSQL.Add(prefix+' NAME_KAT_STUD ');
     k_stud_flag:=1;
    end;
    if RXMemoryData.FieldByName('NAME_FIELD').AsString='Курс' then
    begin
     DataSetReport.SelectSQL.Add(prefix+' KURS ');
     kurs_flag:=1;
    end;
    if RXMemoryData.FieldByName('NAME_FIELD').AsString='Група' then
    begin
     DataSetReport.SelectSQL.Add(prefix+' NAME_GROUP ');
     n_gr_flag:=1;
    end;
    if RXMemoryData.FieldByName('NAME_FIELD').AsString='Періодичність оплати' then
    begin
     DataSetReport.SelectSQL.Add(prefix+' NAME_STAGE ');
     period_opl_flag:=1;
    end;
    prefix := ',';
   end;
   //Inc(i);
   RXMemoryData.Next;
  end;

  if druk_pid  = False then DataSetReport.SelectSQL.Add(prefix+' FIO ');

  DataSetReport.Prepare;
  DataSetReport.ParamByName('ID_SESSION').AsInteger:=id_main_session;
  DataSetReport.ParamByName('ID_SESSION_PARAMS').AsInteger:=id_session;

  DataSetReport.CloseOpen(False);

  if (druk_pid = false) and (cxPortrate.Checked = False) and (cxMemOrd.Checked = False) then MakeReport;
  if (druk_pid = false) and (cxPortrate.Checked = True) and (cxMemOrd.Checked = False) then MakeReport_portrate;
  if druk_pid = true then  MakeReport_ost;
  if cxMemOrd.Checked = True then
  begin

  ds_podchin.Close;
  ds_podchin.SelectSQL.Text:='select db_sch_number, sum(d_s) from PC_MO_SCH(:ID_SESSION, :ID_SESSION_PARAMS, 0, :date_beg, :date_end) group by 1';
  ds_podchin.Prepare;
  ds_podchin.ParamByName('ID_SESSION').AsInteger:=id_main_session;
  ds_podchin.ParamByName('ID_SESSION_PARAMS').AsInteger:=id_session;
  ds_podchin.ParamByName('DATE_BEG').Value:=DBEG;
  ds_podchin.ParamByName('DATE_END').Value:=EndOfTheMonth(DBEG);
  ds_podchin.CloseOpen(False);

  ds_podchin_1.Close;
  ds_podchin_1.SelectSQL.Text:='select kr_sch_number, sum(k_s) from PC_MO_SCH(:ID_SESSION, :ID_SESSION_PARAMS, 1, :date_beg, :date_end) group by 1';
  ds_podchin_1.Prepare;
  ds_podchin_1.ParamByName('ID_SESSION').AsInteger:=id_main_session;
  ds_podchin_1.ParamByName('ID_SESSION_PARAMS').AsInteger:=id_session;
  ds_podchin_1.ParamByName('DATE_BEG').Value:=DBEG;
  ds_podchin_1.ParamByName('DATE_END').Value:=EndOfTheMonth(DBEG);
  ds_podchin_1.CloseOpen(False);

  DataSetFullSch.close;
  DataSetFullSch.SelectSQL.Clear;
  DataSetFullSch.SelectSQL.Add('SELECT SUM(IN_DB_SUMMA) AS S1, SUM(IN_KR_SUMMA) AS S2, SUM(OUT_DB_SUMMA) AS S3, SUM(OUT_KR_SUMMA) AS S4');
  DataSetFullSch.SelectSQL.Add(' FROM PC_TMP_REPORT_TABLE WHERE ID_SESSION = '+IntToStr(id_main_session)+' and ID_SESSION_PARAMS='+IntToStr(id_session));
  DataSetFullSch.CloseOpen(False);

  IN_DS:=DataSetFullSch.FieldByName('S1').AsFloat;
  IN_KS:=DataSetFullSch.FieldByName('S2').AsFloat;
  OUT_DS:=DataSetFullSch.FieldByName('S3').AsFloat;
  OUT_KS:=DataSetFullSch.FieldByName('S4').AsFloat;
  
  MakeReport_MemOrd;
  //showmessage(floattostr(in_db_summa)+' '+floattostr(DataSetFullSch.FieldByName('S1').AsFloat));
  end;
 end;

 if FORM_UCH = 19  then
 begin
  {DataSetReport.Close;
  DataSetReport.SelectSql.Clear;
  DataSetReport.SelectSQL.Add('SELECT * FROM PC_TMP_OBOROT_SELECT_INFO_ST(:ID_SESSION, :DATE_REG, :ID_REG)');
  DataSetReport.SelectSQL.Add('ORDER BY BUILDS, NAME_FAK, KURS, CAT_PAY, TYPE_LIVE, CLASS_LIVE, NAME_GROUP, FIO');
  DataSetReport.Prepare;
  DataSetReport.ParamByName('ID_SESSION').AsInteger:=id_session;
  DBEG:=PERS_PAY_PERIOD;
  DataSetReport.ParamByName('DATE_REG').Value:=DBEG;
  DataSetReport.ParamByName('ID_REG').AsInteger:=ID_REG;
  ShowMessage('1');
  DataSetReport.CloseOpen(False);
  RXMemoryData.Open;
  RXMemoryData.first;
  k:=RxMemoryData.RecordCount;
  i:=1;
  while i<=k do
  begin
   if RXMemoryData.FieldByName('ON_CHECK').AsInteger = 1 then
   begin
    if i = 1 then obsh_flag:=1;
    if i = 2 then fac_st_flag:=1;
    if i = 3 then kurs_st_flag:=1;
    if i = 4 then kat_pay_flag:=1;
    if i = 5 then type_live_flag:=1;
    if i = 6 then cl_live_flag:=1;
    if i = 7 then grp_flag:=1;
   end;
   Inc(i);
   RXMemoryData.Next; }
   ///////////////////////////////////////////////////////////////////////////
   DataSetReport.Close;
   DataSetReport.SelectSql.Clear;

  if druk_pid = False then  ///СТУДГОРОДОК !!!
  begin
   DataSetReport.SelectSQL.Add(' SELECT * FROM PC_TMP_REPORT_TABLE_SELECT_ST(:ID_SESSION, :ID_SESSION_PARAMS)');
   if cxFiltrMain.Checked = True then   DataSetReport.SelectSQL.Add(gl_filtr);
  end
  else
  begin
   DataSetReport.SelectSql.Clear;
   if IS_VALYUTA = 1 then
   DataSetReport.SelectSQL.Add(' SELECT NAME_VAL')
   else
   DataSetReport.SelectSQL.Add(' SELECT ');
   i:=1;
   RXMemoryData.Open;
   k:=RxMemoryData.RecordCount;
   rx_rec:=RxMemoryData.RecordCount;
   RXMemoryData.first;
   prefix:='';
   while i<=k-1 do
   begin
    if RXMemoryData.FieldByName('ON_CHECK').AsInteger = 1 then
    begin
     if i = 1 then begin DataSetReport.SelectSQL.Add(prefix+' BUILDS '); Last:='BUILDS'; end;
     if i = 2 then begin DataSetReport.SelectSQL.Add(prefix+' NAME_FAK '); Last:='NAME_FAK'; end;
     if i = 3 then begin DataSetReport.SelectSQL.Add(prefix+' KURS '); Last:='KURS'; end;
     if i = 4 then begin DataSetReport.SelectSQL.Add(prefix+' CAT_PAY ');Last:='CAT_PAY'; end;
     if i = 5 then begin DataSetReport.SelectSQL.Add(prefix+' TYPE_LIVE '); Last:='TYPE_LIVE';end;
     if i = 6 then begin DataSetReport.SelectSQL.Add(prefix+' CLASS_LIVE '); Last:='CLASS_LIVE';end;
     if i = 7 then begin DataSetReport.SelectSQL.Add(prefix+' NAME_GROUP ');Last:='NAME_GROUP'; end;
     prefix := ' , ';
    end;
    RxMemoryData.Next;
    Inc(i);
   end;
   if IS_VALYUTA = 1 then
   DataSetReport.SelectSQL.Add( prefix + 'SUM(IN_DB_SUMMA), SUM(IN_KR_SUMMA), SUM(DB_SUMMA), SUM(KR_SUMMA), SUM(OUT_DB_SUMMA), SUM(OUT_KR_SUMMA), SUM(IN_DB_SUMMA_VAL), SUM(IN_KR_SUMMA_VAL), SUM(DB_SUMMA_VAL), SUM(KR_SUMMA_VAL), SUM(OUT_DB_SUMMA_VAL), SUM(OUT_KR_SUMMA_VAL) ' )
   else
   DataSetReport.SelectSQL.Add( prefix + 'SUM(IN_DB_SUMMA), SUM(IN_KR_SUMMA), SUM(DB_SUMMA), SUM(KR_SUMMA), SUM(OUT_DB_SUMMA), SUM(OUT_KR_SUMMA) ' );
   DataSetReport.SelectSQL.Add(' FROM PC_TMP_REPORT_TABLE_SELECT_ST(:ID_SESSION, :ID_SESSION_PARAMS) ');
   if cxFiltrMain.Checked = True then DataSetReport.SelectSQL.Add(gl_filtr);
   if IS_VALYUTA  =1 then
   DataSetReport.SelectSQL.Add(' GROUP BY NAME_VAL')
   else
   DataSetReport.SelectSQL.Add(' GROUP BY ');
   i:=1;
   RXMemoryData.Open;
   k:=RxMemoryData.RecordCount;
   rx_rec:=RxMemoryData.RecordCount;
   RXMemoryData.first;
   if IS_VALYUTA=1 then
   prefix:=','
   else
   prefix:='';
   while i<=k-1 do
   begin
    if RXMemoryData.FieldByName('ON_CHECK').AsInteger = 1 then
    begin
     if i = 1 then DataSetReport.SelectSQL.Add(prefix+' BUILDS ');
     if i = 2 then DataSetReport.SelectSQL.Add(prefix+' NAME_FAK ');
     if i = 3 then DataSetReport.SelectSQL.Add(prefix+' KURS ');
     if i = 4 then DataSetReport.SelectSQL.Add(prefix+' CAT_PAY ');
     if i = 5 then DataSetReport.SelectSQL.Add(prefix+' TYPE_LIVE ');
     if i = 6 then DataSetReport.SelectSQL.Add(prefix+' CLASS_LIVE ');
     if i = 7 then DataSetReport.SelectSQL.Add(prefix+' NAME_GROUP ');
     prefix := ' , ';
    end;
    RxMemoryData.Next;
    Inc(i);
   end;
  if druk_pid  = False then DataSetReport.SelectSQL.Add(prefix+' FIO ');
  end;
  RXMemoryData.Open;
  k:=RxMemoryData.RecordCount;
  rx_rec:=RxMemoryData.RecordCount;
  RXMemoryData.first;
  i:=1;
  if IS_VALYUTA = 1 then
  prefix:=' ORDER BY NAME_VAL'
  else
  prefix:=' ORDER BY ';
  while i<=k-1 do
  begin
   if RXMemoryData.FieldByName('ON_CHECK').AsInteger = 1 then
   begin
    if i = 1 then
    begin
     DataSetReport.SelectSQL.Add(prefix+' BUILDS ');
     obsh_flag:=1;
    end;
    if i = 2 then
    begin
     DataSetReport.SelectSQL.Add(prefix+' NAME_FAK ');
     fac_st_flag:=1;
    end;
    if i = 3 then
    begin
     DataSetReport.SelectSQL.Add(prefix+' KURS ');
     kurs_st_flag:=1;
    end;
    if i = 4 then
    begin
     DataSetReport.SelectSQL.Add(prefix+' CAT_PAY ');
     kat_pay_flag:=1;
    end;
    if i = 5 then
    begin
     DataSetReport.SelectSQL.Add(prefix+' TYPE_LIVE ');
     type_live_flag:=1;
    end;
    if i = 6 then
    begin
     DataSetReport.SelectSQL.Add(prefix+' CLASS_LIVE ');
     cl_live_flag:=1;
    end;
    if i = 7 then
    begin
     DataSetReport.SelectSQL.Add(prefix+' NAME_GROUP ');
     grp_flag:=1;
    end;
    prefix := ',';
   end;
   Inc(i);
   RXMemoryData.Next;
  end;
  if druk_pid  = False then DataSetReport.SelectSQL.Add(prefix+' FIO ');

  DataSetReport.Prepare;
  DataSetReport.ParamByName('ID_SESSION').AsInteger:=id_main_session;
  DataSetReport.ParamByName('ID_SESSION_PARAMS').AsInteger:=id_session;

  DataSetReport.CloseOpen(False);
  if IS_VALYUTA=1 then
  begin
  end
  else
  begin
  if (druk_pid = false) and (cxPortrate.Checked = False) and (cxMemOrd.Checked = False) then MakeReport;
  if (druk_pid = false) and (cxPortrate.Checked = True) and (cxMemOrd.Checked = False) then MakeReport_portrate;
  if druk_pid = true then  MakeReport_ost;
  if cxMemOrd.Checked = True then
  begin

  ds_podchin.Close;
  ds_podchin.SelectSQL.Text:='select db_sch_number, sum(d_s) from PC_MO_SCH_ST(:ID_SESSION, :ID_SESSION_PARAMS, 0, :date_beg, :date_end) group by 1';
  ds_podchin.Prepare;
  ds_podchin.ParamByName('ID_SESSION').AsInteger:=id_main_session;
  ds_podchin.ParamByName('ID_SESSION_PARAMS').AsInteger:=id_session;
  ds_podchin.ParamByName('DATE_BEG').Value:=DBEG;
  ds_podchin.ParamByName('DATE_END').Value:=EndOfTheMonth(DBEG);
  ds_podchin.CloseOpen(False);

  ds_podchin_1.Close;
  ds_podchin_1.SelectSQL.Text:='select kr_sch_number, sum(k_s) from PC_MO_SCH_ST(:ID_SESSION, :ID_SESSION_PARAMS, 1, :date_beg, :date_end) group by 1';
  ds_podchin_1.Prepare;
  ds_podchin_1.ParamByName('ID_SESSION').AsInteger:=id_main_session;
  ds_podchin_1.ParamByName('ID_SESSION_PARAMS').AsInteger:=id_session;
  ds_podchin_1.ParamByName('DATE_BEG').Value:=DBEG;
  ds_podchin_1.ParamByName('DATE_END').Value:=EndOfTheMonth(DBEG);
  ds_podchin_1.CloseOpen(False);

  DataSetFullSch.close;
  DataSetFullSch.SelectSQL.Clear;
  DataSetFullSch.SelectSQL.Add('SELECT SUM(IN_DB_SUMMA) AS S1, SUM(IN_KR_SUMMA) AS S2, SUM(OUT_DB_SUMMA) AS S3, SUM(OUT_KR_SUMMA) AS S4');
  DataSetFullSch.SelectSQL.Add(' FROM PC_TMP_REPORT_TABLE_ST WHERE ID_SESSION = '+IntToStr(id_main_session)+' and ID_SESSION_PARAMS='+IntToStr(id_session));
  DataSetFullSch.CloseOpen(False);

  IN_DS:=DataSetFullSch.FieldByName('S1').AsFloat;
  IN_KS:=DataSetFullSch.FieldByName('S2').AsFloat;
  OUT_DS:=DataSetFullSch.FieldByName('S3').AsFloat;
  OUT_KS:=DataSetFullSch.FieldByName('S4').AsFloat;
  
  MakeReport_MemOrd;
  //showmessage(floattostr(in_db_summa)+' '+floattostr(DataSetFullSch.FieldByName('S1').AsFloat));
  end;
  end;
  end;
 if cxMemOrd.Checked = True then
 begin
  frReport.ScriptText.Clear;
  frReport.ScriptText.Add('procedure Header1OnAfterPrint(Sender: TfrxComponent);');
  frReport.ScriptText.Add('begin');
  frReport.ScriptText.Add(' PageHeader1.Visible:=False;');
  frReport.ScriptText.Add('end;');
  frReport.ScriptText.Add('begin');
  frReport.ScriptText.Add('end.');
  
 end;
if is_des=1 then frReport.DesignReport;
 frReport.PrintOptions.ShowDialog:=True;
 frReport.ShowReport;
 f.free;
end;

procedure TChooseForm.actCloseExecute(Sender: TObject);
begin
if FORM_UCH = 20 then
begin
try
 StorProc.Close;
 StorProc.Transaction := ReadTr;
 StorProc.Transaction.StartTransaction;
 StorProc.StoredProcName:='PC_CLEAR_REPORT_TABLE';
 StorProc.Prepare;
 StorProc.ParamByName('ID_SESSION').AsInteger:=id_main_session;
 StorProc.ParamByName('ID_SESSION_PARAMS').AsInteger:=id_session;
 StorProc.ExecProc;
 StorProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  StorProc.Transaction.Rollback;
  exit;
    end;
end;
end;
if FORM_UCH = 19 then
begin
try
 StorProc.Close;
 StorProc.Transaction := ReadTr;
 StorProc.Transaction.StartTransaction;
 StorProc.StoredProcName:='PC_CLEAR_REPORT_TABLE_ST';
 StorProc.Prepare;
 StorProc.ParamByName('ID_SESSION').AsInteger:=id_main_session;
 StorProc.ParamByName('ID_SESSION_PARAMS').AsInteger:=id_session;
 StorProc.ExecProc;
 StorProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  StorProc.Transaction.Rollback;
  exit;
    end;
end;
end;
 Close;
end;

procedure TChooseForm.actChooseExecute(Sender: TObject);
var
  AParameter:TcnSimpleParams;
  Res:Variant;
begin
 if FORM_UCH = 20 then
 begin
  AParameter := TcnSimpleParams.Create;
  AParameter.Owner := self;
  AParameter.Db_Handle := DB_Handle;
  AParameter.Formstyle := fsNormal;
  AParameter.WaitPakageOwner := self;
  AParameter.ID_SESSION := ID_SESSION;
  Res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportsFilter.bpl','ShowReportFilter');
  AParameter.Free;
 end;
  if FORM_UCH = 19 then
 begin
  Res:=LoadPackegeStudCity.LoadReportsFilter(self,DB_Handle,ID_SESSION);
 end;
end;

procedure TChooseForm.cxPidsumPropertiesChange(Sender: TObject);
begin
 druk_pid:=cxPidsum.Checked;
 cxPortrate.Enabled:=not(cxPidsum.Checked);
end;

procedure TChooseForm.actReportExecute(Sender: TObject);
var f:TWateForm;
    year, month:Integer;
begin
 f:=TWateForm.Create(Self);
 f.Show;
 f.Update;
if FORM_UCH = 20 then
begin
try
 StorProc.Close;
 StorProc.Transaction := ReadTr;
 StorProc.Transaction.StartTransaction;
 StorProc.StoredProcName:='PC_CLEAR_REPORT_TABLE';
 StorProc.Prepare;
 StorProc.ParamByName('ID_SESSION').AsInteger:=id_main_session;
 StorProc.ParamByName('ID_SESSION_PARAMS').AsInteger:=id_session;
 StorProc.ExecProc;
 StorProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  StorProc.Transaction.Rollback;
  exit;
    end;
end;
f.Update;
try
 StorProc.Close;
 StorProc.Transaction := ReadTr;
 StorProc.Transaction.StartTransaction;
 StorProc.StoredProcName:='PC_SEL_INFO_INTO_TMP_TABLE';
 StorProc.Prepare;
 StorProc.ParamByName('ID_SESSION').AsInteger:=id_main_session;
 DBEG:=PERS_PAY_PERIOD;
 StorProc.ParamByName('DATE_REG').Value:=DBEG;
 StorProc.ParamByName('ID_REG').AsInteger:=ID_REG;
 StorProc.ParamByName('ID_SESSION_PARAMS').AsInteger:=id_session;
 StorProc.ExecProc;
 StorProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  StorProc.Transaction.Rollback;
  exit;
    end;
end;
end;

if FORM_UCH = 19 then
begin
try
 StorProc.Close;
 StorProc.Transaction := ReadTr;
 StorProc.Transaction.StartTransaction;
 StorProc.StoredProcName:='PC_CLEAR_REPORT_TABLE_ST';
 StorProc.Prepare;
 StorProc.ParamByName('ID_SESSION').AsInteger:=id_main_session;
 StorProc.ParamByName('ID_SESSION_PARAMS').AsInteger:=id_session;
 StorProc.ExecProc;
 StorProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  StorProc.Transaction.Rollback;
  exit;
    end;
end;
f.Update;
try
 StorProc.Close;
 StorProc.Transaction := ReadTr;
 StorProc.Transaction.StartTransaction;
 StorProc.StoredProcName:='PC_SEL_ST_INFO_INTO_TMP_TABLE';
 StorProc.Prepare;
 StorProc.ParamByName('ID_SESSION').AsInteger:=id_main_session;
 DBEG:=PERS_PAY_PERIOD;
 StorProc.ParamByName('DATE_REG').Value:=DBEG;
 StorProc.ParamByName('ID_REG').AsInteger:=ID_REG;
 StorProc.ParamByName('ID_SESSION_PARAMS').AsInteger:=id_session;
 StorProc.ExecProc;
 StorProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  StorProc.Transaction.Rollback;
  exit;
    end;
end;
end;
f.Update;
f.Free;
cxButton1.Enabled:=True;
end;

procedure TChooseForm.MakeReport_ost;
var page:TfrxReportPage;
    //band_footer:TfrxReportSummary;
    band_header,band, fac_f, spec_f, nat_f, f_st_f, k_st_f, kurs_f, n_gr_f, band_footer, band_head,page_footer, val_f, stage_f:TfrxBand;
    Memo_PIB, Memo_Ist, Memo_sm, Memo_rz, Memo_st, Memo_kekv, saldo_in, s_in_db, memo_num:TfrxMemoView;
    s_in_kr, saldo_out, s_out_db, s_out_kr, db, kr, db_s, kr_s:TfrxMemoView;
    top_next,height,width_memo,left_memo,left,rasst, h_memo:Extended;
    fac, spec, nat, f_st, k_st, kurs, n_gr, val, stage:TfrxGroupHeader;
    fac_1, spec_1, spec_2, nat_1, nat_2, f_st_1, k_st_1, kurs_1, n_gr_1, f_st_2, k_st_2, kurs_2, n_gr_2, val_1, val_2, stage_1, stage_2:TfrxMemoView;
    Memo1, Memo2, Memo3, Memo4, Memo5, Memo6, Memo7, Memo8: TfrxMemoView;
    Memo_1, Memo_2, Memo_3, Memo_4, Memo_5, Memo_6, Memo_7, Memo_8: TfrxMemoView;
    memo_name, memo_inn, memo_inn_num, memo_period:TfrxMemoView;
    memo_vik, memo_vik_underline, memo_user, date_print, page_print, sch_for_sysytem:TfrxMemoView;
    i,k:Integer;
    DataBand:TfrxMasterData;
begin
if FORM_UCH = 20 then
begin
  frReport.Clear;                         //создаем страницу отчета
  frReport.DataSets.Add(frxDBDataset1);
  page:=TfrxReportPage.Create(frReport);
  page.CreateUniqueName;
  page.SetDefaults;

  band_head:=TfrxReportTitle.Create(page);
  band_head.Top:=0;
  band_head.Height:=4.2*fr1cm;
  top_next:=band_head.top + band_head.Height;

  memo_name:=TfrxMemoView.Create(band_head);
  memo_name.CreateUniqueName;
  memo_name.Height:=0.4*fr1cm;
  memo_name.Width:=10.8*fr1cm;
  memo_name.Frame.Typ:=[ftBottom];
  memo_name.Font.Size:=8;
  memo_name.Left:=0*fr1cm;
  memo_name.top:=0.2*fr1cm;
  memo_name.HAlign:=haCenter;
  memo_name.VAlign:=vaCenter;
  memo_name.Text:=ORG_FULL_NAME;
  memo_name.Font.Style:=[fsBold];

  memo_inn:=TfrxMemoView.Create(band_head);
  memo_inn.CreateUniqueName;
  memo_inn.Height:=0.8*fr1cm;
  memo_inn.Width:=2.5*fr1cm;
  memo_inn.Font.Size:=8;
  memo_inn.Left:=0*fr1cm;
  memo_inn.top:=0.6*fr1cm;
  memo_inn.HAlign:=haCenter;
  memo_inn.VAlign:=vaCenter;
  memo_inn.Text:='Ідентифікаційний код ЄДРПОУ';

  memo_inn_num:=TfrxMemoView.Create(band_head);
  memo_inn_num.CreateUniqueName;
  memo_inn_num.Height:=0.5*fr1cm;
  memo_inn_num.Width:=3*fr1cm;
  memo_inn_num.Font.Size:=8;
  memo_inn_num.Left:=2.6*fr1cm;
  memo_inn_num.top:=0.8*fr1cm;
  memo_inn_num.HAlign:=haCenter;
  memo_inn_num.VAlign:=vaCenter;
  memo_inn_num.Text:=ORG_KOD_OKPO;
  memo_inn_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  memo_period:=TfrxMemoView.Create(band_head);
  memo_period.CreateUniqueName;
  memo_period.Height:=1.3*fr1cm;
  memo_period.Width:=19.10*fr1cm;
  memo_period.Font.Size:=14;
  memo_period.Left:=0*fr1cm;
  memo_period.top:=1.8*fr1cm;
  memo_period.HAlign:=haCenter;
  memo_period.VAlign:=vaCenter;
  memo_period.Text:='Звіт за період з '+DatetoStr(StartOfAMonth(y_beg, m_beg))+' по '+Datetostr(EndOfAMonth(y_end, m_end));
  memo_period.Font.Style:=[fsBold];

  sch_for_sysytem:=TfrxMemoView.Create(band_head);
  sch_for_sysytem.CreateUniqueName;
  sch_for_sysytem.Height:=1*fr1cm;
  sch_for_sysytem.Width:=19*fr1cm;
  sch_for_sysytem.Font.Size:=10;
  sch_for_sysytem.Left:=0*fr1cm;
  sch_for_sysytem.top:=3.1*fr1cm;
  sch_for_sysytem.HAlign:=haCenter;
  sch_for_sysytem.VAlign:=vaCenter;
  sch_for_sysytem.Text:='Рахунки системи: '+ SCH_SYSTEM;

                                        //"верхушка" очета
  band:=TfrxPageHeader.Create(page);
  band.CreateUniqueName;
  band.top:=top_next;
  band.Height:=1*fr1cm;
  top_next:=band.top + band.Height;
  //height:=band.Height;
  memo_num:=TfrxMemoView.Create(band);
  memo_num.CreateUniqueName;
  memo_num.Height:=1*fr1cm;
  memo_num.Width:=1*fr1cm;
  memo_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_num.Font.Size:=8;
  memo_num.Left:=0*fr1cm;
  memo_num.top:=0;
  memo_num.HAlign:=haCenter;
  memo_num.VAlign:=vaCenter;
  memo_num.Color:= $00E4E4E4;
  memo_num.Text:='№ п/п';

  Memo_PIB:=TfrxMemoView.Create(band);
  Memo_PIB.CreateUniqueName;
  Memo_PIB.Height:=1*fr1cm;
  Memo_PIB.Width:=6*fr1cm;
  Memo_PIB.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_PIB.Font.Size:=8;
  Memo_PIB.Left:=1*fr1cm;
  memo_PIB.top:=0;
  Memo_PIB.HAlign:=haCenter;
  Memo_PIB.VAlign:=vaCenter;
  Memo_PIB.Color:= $00E4E4E4;
  Memo_PIB.Text:='Назва';

  saldo_in:=TfrxMemoView.Create(band);
  saldo_in.CreateUniqueName;
  saldo_in.Height:=0.5*fr1cm;
  saldo_in.Width:=4*fr1cm;
  saldo_in.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  saldo_in.Font.Size:=8;
  saldo_in.Left:=7*fr1cm;
  saldo_in.top:=0;
  saldo_in.HAlign:=haCenter;
  saldo_in.VAlign:=vaCenter;
  saldo_in.Color:= $00E4E4E4;
  saldo_in.Text:='Сальдо вхідне';

  s_in_db:=TfrxMemoView.Create(band);
  s_in_db.CreateUniqueName;
  s_in_db.Height:=0.5*fr1cm;
  s_in_db.Width:=2*fr1cm;
  s_in_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_db.Font.Size:=8;
  s_in_db.Left:=7*fr1cm;
  s_in_db.top:=0.5*fr1cm;
  s_in_db.HAlign:=haCenter;
  s_in_db.VAlign:=vaCenter;
  s_in_db.Color:= $00E4E4E4;
  s_in_db.Text:='Дебет';

  s_in_kr:=TfrxMemoView.Create(band);
  s_in_kr.CreateUniqueName;
  s_in_kr.Height:=0.5*fr1cm;
  s_in_kr.Width:=2*fr1cm;
  s_in_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_kr.Font.Size:=8;
  s_in_kr.Left:=9*fr1cm;
  s_in_kr.top:=0.5*fr1cm;
  s_in_kr.HAlign:=haCenter;
  s_in_kr.VAlign:=vaCenter;
  s_in_kr.Color:= $00E4E4E4;
  s_in_kr.Text:='Кредит';

  db:=TfrxMemoView.Create(band);
  db.CreateUniqueName;
  db.Height:=0.5*fr1cm;
  db.Width:=4*fr1cm;
  db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db.Font.Size:=8;
  db.Left:=11*fr1cm;
  db.top:=0;
  db.HAlign:=haCenter;
  db.VAlign:=vaCenter;
  db.Color:= $00E4E4E4;
  db.Text:='Рух коштів';

  db_s:=TfrxMemoView.Create(band);
  db_s.CreateUniqueName;
  db_s.Height:=0.5*fr1cm;
  db_s.Width:=2*fr1cm;
  db_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db_s.Font.Size:=8;
  db_s.Left:=11*fr1cm;
  db_s.top:=0.5*fr1cm;
  db_s.HAlign:=haCenter;
  db_s.VAlign:=vaCenter;
  db_s.Color:= $00E4E4E4;
  db_s.Text:='Дебет';

{  kr:=TfrxMemoView.Create(band);
  kr.CreateUniqueName;
  kr.Height:=0.5*fr1cm;
  kr.Width:=2*fr1cm;
  kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr.Font.Size:=8;
  kr.Left:=13*fr1cm;
  kr.top:=0;
  kr.HAlign:=haCenter;
  kr.VAlign:=vaCenter;
  kr.Color:= $00E4E4E4;
  kr.Text:='Кредит';
}
  kr_s:=TfrxMemoView.Create(band);
  kr_s.CreateUniqueName;
  kr_s.Height:=0.5*fr1cm;
  kr_s.Width:=2*fr1cm;
  kr_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr_s.Font.Size:=8;
  kr_s.Left:=13*fr1cm;
  kr_s.top:=0.5*fr1cm;
  kr_s.HAlign:=haCenter;
  kr_s.VAlign:=vaCenter;
  kr_s.Color:= $00E4E4E4;
  kr_s.Text:='Кредит';

  saldo_out:=TfrxMemoView.Create(band);
  saldo_out.CreateUniqueName;
  saldo_out.Height:=0.5*fr1cm;
  saldo_out.Width:=4*fr1cm;
  saldo_out.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  saldo_out.Font.Size:=8;
  saldo_out.Left:=15*fr1cm;
  saldo_out.top:=0;
  saldo_out.HAlign:=haCenter;
  saldo_out.VAlign:=vaCenter;
  saldo_out.Color:= $00E4E4E4;
  saldo_out.Text:='Сальдо вихідне';

  s_out_db:=TfrxMemoView.Create(band);
  s_out_db.CreateUniqueName;
  s_out_db.Height:=0.5*fr1cm;
  s_out_db.Width:=2*fr1cm;
  s_out_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_db.Font.Size:=8;
  s_out_db.Left:=15*fr1cm;
  s_out_db.top:=0.5*fr1cm;
  s_out_db.HAlign:=haCenter;
  s_out_db.VAlign:=vaCenter;
  s_out_db.Color:= $00E4E4E4;
  s_out_db.Text:='Дебет';

  s_out_kr:=TfrxMemoView.Create(band);
  s_out_kr.CreateUniqueName;
  s_out_kr.Height:=0.5*fr1cm;
  s_out_kr.Width:=2*fr1cm;
  s_out_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_kr.Font.Size:=8;
  s_out_kr.Left:=17*fr1cm;
  s_out_kr.top:=0.5*fr1cm;
  s_out_kr.HAlign:=haCenter;
  s_out_kr.VAlign:=vaCenter;
  s_out_kr.Color:= $00E4E4E4;
  s_out_kr.Text:='Кредит';

  // верх закончили
//верхние группы
if IS_VALYUTA = 1 then
  begin
       val:=TfrxGroupHeader.Create(page);
       val.CreateUniqueName;
       val.top:=top_next;
       val.Height:=0.8*fr1cm;
       top_next:=val.top + val.Height;

       val.Condition:='frxDBDataset1."NAME_VAL"' ;

       val_1:=TfrxMemoView.Create(val);
       val_1.CreateUniqueName;
       val_1.Height:=0.8*fr1cm;
       val_1.Width:=3.4*fr1cm;
       val_1.Font.Size:=10;
       val_1.Left:=0;
       val_1.top:=0;
       val_1.HAlign:=haLeft;
       val_1.VAlign:=vaCenter;
       val_1.Frame.Typ:=[ftLeft];
       val_1.Text:='Валюта:';

       val_2:=TfrxMemoView.Create(val);
       val_2.CreateUniqueName;
       val_2.Height:=0.8*fr1cm;
       val_2.Width:=15.6*fr1cm;
       val_2.Font.Size:=10;
       val_2.Left:=3.4*fr1cm;;
       val_2.top:=0;
       val_2.HAlign:=haLeft;
       val_2.VAlign:=vaCenter;
       val_2.Font.Style:=[fsBold];
       val_2.Frame.Typ:=[ftRight];
       val_2.Text:='[frxDBDataset1."NAME_VAL"] ([frxDBDataset1."CODE_VAL"])';
  end;

  if (fac_flag = 1) and (Last<>'NAME_FACUL')  then
   begin
       fac:=TfrxGroupHeader.Create(page);
       fac.CreateUniqueName;
       fac.top:=top_next;
       fac.Height:=0.8*fr1cm;
       top_next:=fac.top + fac.Height;

       fac.Condition:='frxDBDataset1."NAME_FACUL"' ;

       fac_1:=TfrxMemoView.Create(fac);
       fac_1.CreateUniqueName;
       fac_1.Height:=0.8*fr1cm;
       fac_1.Width:=19*fr1cm;
       fac_1.Font.Size:=10;
       fac_1.Left:=0;
       fac_1.top:=0;
       fac_1.HAlign:=haCenter;
       fac_1.VAlign:=vaCenter;
       fac_1.Font.Style:=[fsBold];
       fac_1.Frame.Typ:=[ftLeft,ftRight];
       fac_1.Text:='[frxDBDataset1."NAME_FACUL"]';
   end;

   if (period_opl_flag = 1) and(Last<>'NAME_STAGE') then
   begin
       stage:=TfrxGroupHeader.Create(page);
       stage.CreateUniqueName;
       stage.top:=top_next;
       stage.Height:=0.8*fr1cm;
       top_next:=stage.top + stage.Height;
       stage.Condition:='frxDBDataset1."NAME_STAGE"' ;

       stage_1:=TfrxMemoView.Create(stage);
       stage_1.CreateUniqueName;
       stage_1.Height:=0.8*fr1cm;
       stage_1.Width:=3.4*fr1cm;
       spec_1.Font.Size:=10;
       stage_1.Left:=0;
       stage_1.top:=0;
       stage_1.HAlign:=haLeft;
       stage_1.VAlign:=vaCenter;
       stage_1.Frame.Typ:=[ftLeft];
       stage_1.Text:='Період оплати:';

       stage_2:=TfrxMemoView.Create(stage);
       stage_2.CreateUniqueName;
       stage_2.Height:=0.8*fr1cm;
       stage_2.Width:=15.6*fr1cm;
       stage_2.Font.Size:=10;
       stage_2.Left:=3.4*fr1cm;
       stage_2.top:=0;
       stage_2.Font.Style:=[fsBold];
       stage_2.HAlign:=haLeft;
       stage_2.VAlign:=vaCenter;
       stage_2.Frame.Typ:=[ftRight];
       stage_2.Text:='[frxDBDataset1."NAME_STAGE"]';
   end;

  if (spec_flag = 1) and(Last<>'NAME_SPEC') then
   begin
       spec:=TfrxGroupHeader.Create(page);
       spec.CreateUniqueName;
       spec.top:=top_next;
       spec.Height:=0.8*fr1cm;
       top_next:=spec.top + spec.Height;
       spec.Condition:='frxDBDataset1."NAME_SPEC"' ;

       spec_1:=TfrxMemoView.Create(spec);
       spec_1.CreateUniqueName;
       spec_1.Height:=0.8*fr1cm;
       spec_1.Width:=3.4*fr1cm;
       spec_1.Font.Size:=10;
       spec_1.Left:=0;
       spec_1.top:=0;
       spec_1.HAlign:=haLeft;
       spec_1.VAlign:=vaCenter;
       spec_1.Frame.Typ:=[ftLeft];
       spec_1.Text:='Спеціальність:';

       spec_2:=TfrxMemoView.Create(spec);
       spec_2.CreateUniqueName;
       spec_2.Height:=0.8*fr1cm;
       spec_2.Width:=15.6*fr1cm;
       spec_2.Font.Size:=10;
       spec_2.Left:=3.4*fr1cm;
       spec_2.top:=0;
       spec_2.Font.Style:=[fsBold];
       spec_2.HAlign:=haLeft;
       spec_2.VAlign:=vaCenter;
       spec_2.Frame.Typ:=[ftRight];
       spec_2.Text:='[frxDBDataset1."NAME_SPEC"]';
   end;

  if (nat_flag = 1) and (Last<>'NAME_NATIONAL') then
   begin
       nat:=TfrxGroupHeader.Create(page);
       nat.CreateUniqueName;
       nat.top:=top_next;
       nat.Height:=0.8*fr1cm;
       top_next:=nat.top + nat.Height;
       nat.Condition:='frxDBDataset1."NAME_NATIONAL"' ;

       nat_1:=TfrxMemoView.Create(nat);
       nat_1.CreateUniqueName;
       nat_1.Height:=0.8*fr1cm;
       nat_1.Width:=3.4*fr1cm;
       nat_1.Font.Size:=10;
       nat_1.Left:=0;
       nat_1.top:=0;
       nat_1.HAlign:=haLeft;
       nat_1.VAlign:=vaCenter;
       nat_1.Frame.Typ:=[ftLeft];
       nat_1.Text:='Громадянство:';

       nat_2:=TfrxMemoView.Create(nat);
       nat_2.CreateUniqueName;
       nat_2.Height:=0.8*fr1cm;
       nat_2.Width:=15.6*fr1cm;
       nat_2.Font.Size:=10;
       nat_2.Left:=3.4*fr1cm;
       nat_2.top:=0;
       nat_2.Font.Style:=[fsBold];
       nat_2.HAlign:=haLeft;
       nat_2.VAlign:=vaCenter;
       nat_2.Frame.Typ:=[ftRight];
       nat_2.Text:='[frxDBDataset1."NAME_NATIONAL"]';
   end;

  if (f_stud_flag = 1) and (Last<>'NAME_FORM_STUD') then
   begin
       f_st:=TfrxGroupHeader.Create(page);
       f_st.CreateUniqueName;
       f_st.top:=top_next;
       f_st.Height:=0.8*fr1cm;
       top_next:=f_st.top + f_st.Height;
       f_st.Condition:='frxDBDataset1."NAME_FORM_STUD"' ;

       f_st_1:=TfrxMemoView.Create(f_st);
       f_st_1.CreateUniqueName;
       f_st_1.Height:=0.8*fr1cm;
       f_st_1.Width:=3.4*fr1cm;
       f_st_1.Font.Size:=10;
       f_st_1.Left:=0;
       f_st_1.top:=0;
       f_st_1.HAlign:=haLeft;
       f_st_1.VAlign:=vaCenter;
       f_st_1.Frame.Typ:=[ftLeft];
       f_st_1.Text:='Форма навчання:';

       f_st_2:=TfrxMemoView.Create(f_st);
       f_st_2.CreateUniqueName;
       f_st_2.Height:=0.8*fr1cm;
       f_st_2.Width:=15.6*fr1cm;
       f_st_2.Font.Size:=10;
       f_st_2.Left:=3.4*fr1cm;
       f_st_2.top:=0;
       f_st_2.Font.Style:=[fsBold];
       f_st_2.HAlign:=haLeft;
       f_st_2.VAlign:=vaCenter;
       f_st_2.Frame.Typ:=[ftRight];
       f_st_2.Text:='[frxDBDataset1."NAME_FORM_STUD"]';
   end;

  if (k_stud_flag = 1) and (Last<>'NAME_KAT_STUD') then
   begin
       k_st:=TfrxGroupHeader.Create(page);
       k_st.CreateUniqueName;
       k_st.top:=top_next;
       k_st.Height:=0.8*fr1cm;
       top_next:=k_st.top + k_st.Height;
       k_st.Condition:='frxDBDataset1."NAME_KAT_STUD"' ;

       k_st_1:=TfrxMemoView.Create(k_st);
       k_st_1.CreateUniqueName;
       k_st_1.Height:=0.8*fr1cm;
       k_st_1.Width:=3.4*fr1cm;
       k_st_1.Font.Size:=10;
       k_st_1.Left:=0;
       k_st_1.top:=0;
       k_st_1.HAlign:=haLeft;
       k_st_1.VAlign:=vaCenter;
       k_st_1.Frame.Typ:=[ftLeft];
       k_st_1.Text:='Категорія навчання:';

       k_st_2:=TfrxMemoView.Create(k_st);
       k_st_2.CreateUniqueName;
       k_st_2.Height:=0.8*fr1cm;
       k_st_2.Width:=15.6*fr1cm;
       k_st_2.Font.Size:=10;
       k_st_2.Left:=3.4*fr1cm;
       k_st_2.top:=0;
       k_st_2.Font.Style:=[fsBold];
       k_st_2.HAlign:=haLeft;
       k_st_2.VAlign:=vaCenter;
       k_st_2.Frame.Typ:=[ftRight];
       k_st_2.Text:='[frxDBDataset1."NAME_KAT_STUD"]';
   end;

  if (kurs_flag = 1) and (Last<>'KURS') then
   begin
       kurs:=TfrxGroupHeader.Create(page);
       kurs.CreateUniqueName;
       kurs.top:=top_next;
       kurs.Height:=0.8*fr1cm;
       top_next:=kurs.top + kurs.Height;
       kurs.Condition:='frxDBDataset1."KURS"' ;

       kurs_1:=TfrxMemoView.Create(kurs);
       kurs_1.CreateUniqueName;
       kurs_1.Height:=0.8*fr1cm;
       kurs_1.Width:=3.4*fr1cm;
       kurs_1.Font.Size:=10;
       kurs_1.Left:=0;
       kurs_1.top:=0;
       kurs_1.HAlign:=haLeft;
       kurs_1.VAlign:=vaCenter;
       kurs_1.Frame.Typ:=[ftLeft];
       kurs_1.Text:='Курс:';

       kurs_2:=TfrxMemoView.Create(kurs);
       kurs_2.CreateUniqueName;
       kurs_2.Height:=0.8*fr1cm;
       kurs_2.Width:=15.6*fr1cm;
       kurs_2.Font.Size:=10;
       kurs_2.Left:=3.4*fr1cm;
       kurs_2.top:=0;
       kurs_2.Font.Style:=[fsBold];
       kurs_2.HAlign:=haLeft;
       kurs_2.VAlign:=vaCenter;
       kurs_2.Frame.Typ:=[ftRight];
       kurs_2.Text:='[frxDBDataset1."KURS"]';
   end;

  if (n_gr_flag = 1) and (Last<>'NAME_GROUP') then
   begin
       n_gr:=TfrxGroupHeader.Create(page);
       n_gr.CreateUniqueName;
       n_gr.top:=top_next;
       n_gr.Height:=0.8*fr1cm;
       top_next:=n_gr.top + n_gr.Height;
       n_gr.Condition:='frxDBDataset1."NAME_GROUP"' ;

       n_gr_1:=TfrxMemoView.Create(n_gr);
       n_gr_1.CreateUniqueName;
       n_gr_1.Height:=0.8*fr1cm;
       n_gr_1.Width:=3.4*fr1cm;
       n_gr_1.Font.Size:=10;
       n_gr_1.Left:=0;
       n_gr_1.top:=0;
       n_gr_1.HAlign:=haLeft;
       n_gr_1.VAlign:=vaCenter;
       n_gr_1.Frame.Typ:=[ftLeft];
       n_gr_1.Text:='Група:';

       n_gr_2:=TfrxMemoView.Create(n_gr);
       n_gr_2.CreateUniqueName;
       n_gr_2.Height:=0.8*fr1cm;
       n_gr_2.Width:=15.6*fr1cm;
       n_gr_2.Font.Size:=10;
       n_gr_2.Left:=3.4*fr1cm;
       n_gr_2.top:=0;
       n_gr_2.Font.Style:=[fsBold];
       n_gr_2.HAlign:=haLeft;
       n_gr_2.VAlign:=vaCenter;
       n_gr_2.Frame.Typ:=[ftRight];
       n_gr_2.Text:='[frxDBDataset1."NAME_GROUP"]';
   end;
   //мастер дата

  DataBand:=TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.DataSet:=frxDBDataSet1;
  DAtaBand.Top:=top_next;
  DataBand.Height:=0.5*fr1cm;
  top_next:=DataBand.Top+DataBand.Height;
  DAtaBand.Stretched:=True;

  memo_num:=TfrxMemoView.Create(DataBand);
  memo_num.CreateUniqueName;
  memo_num.Height:=0.5*fr1cm;
  memo_num.Width:=1*fr1cm;
  memo_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_num.Font.Size:=8;
  memo_num.Left:=0*fr1cm;
  memo_num.top:=0;
  memo_num.HAlign:=haCenter;
  memo_num.VAlign:=vaCenter;
  memo_num.Text:='[Line]';
  memo_num.StretchMode:=smMaxHeight;

  Memo_PIB:=TfrxMemoView.Create(DataBand);
  Memo_PIB.CreateUniqueName;
  Memo_PIB.Height:=0.5*fr1cm;
  Memo_PIB.Width:=6*fr1cm;
  Memo_PIB.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_PIB.Font.Size:=8;
  Memo_PIB.Left:=1*fr1cm;
  memo_PIB.top:=0;
  if Last='NAME_FACUL' then Memo_PIB.Text:='Факультет: [frxDBDataset1."NAME_FACUL"]';
  if Last='NAME_SPEC' then Memo_PIB.Text:='Спеціальність: [frxDBDataset1."NAME_SPEC"]';
  if Last='NAME_NATIONAL' then Memo_PIB.Text:='Національність: [frxDBDataset1."NAME_NATIONAL"]';
  if Last='NAME_FORM_STUD' then Memo_PIB.Text:='Форма навчання: [frxDBDataset1."NAME_FORM_STUD"]';
  if Last='NAME_KAT_STUD' then Memo_PIB.Text:='Категорія навчання: [frxDBDataset1."NAME_KAT_STUD"]';
  if Last='KURS' then Memo_PIB.Text:='Курс: [frxDBDataset1."KURS"]';
  if Last='NAME_GROUP' then Memo_PIB.Text:='Група: [frxDBDataset1."NAME_GROUP"]';
  if Last='NAME_STAGE' then Memo_PIB.Text:='Період оплати: [frxDBDataset1."NAME_STAGE"]';
  Memo_PIB.StretchMode:=smMaxHeight;
  Memo_PIB.VAlign:=vaCenter;

  s_in_db:=TfrxMemoView.Create(DataBand);
  s_in_db.CreateUniqueName;
  s_in_db.Height:=0.5*fr1cm;;
  s_in_db.Width:=2*fr1cm;
  s_in_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_db.Font.Size:=8;
  s_in_db.Left:=7*fr1cm;
  s_in_db.top:=0;
  s_in_db.HAlign:=haRight;
  s_in_db.DisplayFormat.Kind:=fkNumeric;
  s_in_db.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  s_in_db.Text:='[frxDBDataset1."SUM"]'+#13+#10+'[frxDBDataset1."SUM6"] [frxDBDataset1."SYMBOL"]'
  else
  s_in_db.Text:='[frxDBDataset1."SUM"]';
  s_in_db.StretchMode:=smMaxHeight;
  s_in_db.VAlign:=vaCenter;

  s_in_kr:=TfrxMemoView.Create(DataBand);
  s_in_kr.CreateUniqueName;
  s_in_kr.Height:=0.5*fr1cm;;
  s_in_kr.Width:=2*fr1cm;
  s_in_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_kr.Font.Size:=8;
  s_in_kr.Left:=9*fr1cm;
  s_in_kr.top:=0;
  s_in_kr.HAlign:=haRight;
  s_in_kr.DisplayFormat.Kind:=fkNumeric;
  s_in_kr.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  s_in_kr.Text:='[frxDBDataset1."SUM1"]'+#13+#10+'[frxDBDataset1."SUM7"] [frxDBDataset1."SYMBOL"]'
  else
  s_in_kr.Text:='[frxDBDataset1."SUM1"]';
  s_in_kr.StretchMode:=smMaxHeight;
  s_in_kr.VAlign:=vaCenter;

  db_s:=TfrxMemoView.Create(DataBand);
  db_s.CreateUniqueName;
  db_s.Height:=0.5*fr1cm;
  db_s.Width:=2*fr1cm;
  db_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db_s.Font.Size:=8;
  db_s.Left:=11*fr1cm;
  db_s.top:=0;
  db_s.HAlign:=haRight;
  db_s.DisplayFormat.Kind:=fkNumeric;
  db_s.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  db_s.Text:='[frxDBDataset1."SUM2"]'+#13+#10+'[frxDBDataset1."SUM8"] [frxDBDataset1."SYMBOL"]'
  else
  db_s.Text:='[frxDBDataset1."SUM2"]';
  db_s.StretchMode:=smMaxHeight;
  db_s.VAlign:=vaCenter;

  kr_s:=TfrxMemoView.Create(DataBand);
  kr_s.CreateUniqueName;
  kr_s.Height:=0.5*fr1cm;
  kr_s.Width:=2*fr1cm;
  kr_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr_s.Font.Size:=8;
  kr_s.Left:=13*fr1cm;
  kr_s.top:=0;
  kr_s.HAlign:=haRight;
  kr_s.DisplayFormat.Kind:=fkNumeric;
  kr_s.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  kr_s.Text:='[frxDBDataset1."SUM3"]'+#13+#10+'[frxDBDataset1."SUM9"] [frxDBDataset1."SYMBOL"]'
  else
  kr_s.Text:='[frxDBDataset1."SUM3"]';
  kr_s.StretchMode:=smMaxHeight;
  kr_s.VAlign:=vaCenter;

  s_out_db:=TfrxMemoView.Create(DataBand);
  s_out_db.CreateUniqueName;
  s_out_db.Height:=0.5*fr1cm;
  s_out_db.Width:=2*fr1cm;
  s_out_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_db.Font.Size:=8;
  s_out_db.Left:=15*fr1cm;
  s_out_db.top:=0;
  s_out_db.HAlign:=haRight;
  s_out_db.DisplayFormat.Kind:=fkNumeric;
  s_out_db.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  s_out_db.Text:='[frxDBDataset1."SUM4"]'+#13+#10+'[frxDBDataset1."SUM10"] [frxDBDataset1."SYMBOL"]'
  else
  s_out_db.Text:='[frxDBDataset1."SUM4"]';
  s_out_db.StretchMode:=smMaxHeight;
  s_out_db.VAlign:=vaCenter;

  s_out_kr:=TfrxMemoView.Create(DataBand);
  s_out_kr.CreateUniqueName;
  s_out_kr.Height:=0.5*fr1cm;
  s_out_kr.Width:=2*fr1cm;
  s_out_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_kr.Font.Size:=8;
  s_out_kr.Left:=17*fr1cm;
  s_out_kr.top:=0;
  s_out_kr.HAlign:=haRight;
  s_out_kr.DisplayFormat.Kind:=fkNumeric;
  s_out_kr.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  s_out_kr.Text:='[frxDBDataset1."SUM5"]'+#13+#10+'[frxDBDataset1."SUM11"] [frxDBDataset1."SYMBOL"]'
  else
  s_out_kr.Text:='[frxDBDataset1."SUM5"]';
  s_out_kr.StretchMode:=smMaxHeight;
  s_out_kr.VAlign:=vaCenter;

  // нижние группы

  if (n_gr_flag = 1) and (Last<>'NAME_GROUP') then
   begin
      n_gr_f:=TfrxGroupFooter.Create(page);
      n_gr_f.CreateUniqueName;
      n_gr_f.top:=top_next;
      n_gr_f.Height:=0.8*fr1cm;
      top_next:=n_gr_f.Top+n_gr_f.Height;
      n_gr_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(n_gr_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по групі: ';
      Memo1.Height:=n_gr_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(n_gr_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_GROUP"]';
      Memo2.Height:=n_gr_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=4*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(n_gr_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[frxDBDataset1."SUM"]'+#13+#10+'[frxDBDataset1."SUM6"] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."SUM">)]';
      Memo3.Height:=n_gr_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(n_gr_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[frxDBDataset1."SUM1"]'+#13+#10+'[frxDBDataset1."SUM7"] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."SUM1">)]';
      Memo4.Height:=n_gr_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(n_gr_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[frxDBDataset1."SUM2"]'+#13+#10+'[frxDBDataset1."SUM8"] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."SUM2">)]';
      Memo5.Height:=n_gr_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(n_gr_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[frxDBDataset1."SUM3"]'+#13+#10+'[frxDBDataset1."SUM9"] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."SUM3">)]';
      Memo6.Height:=n_gr_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(n_gr_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[frxDBDataset1."SUM4"]'+#13+#10+'[frxDBDataset1."SUM10"] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."SUM4">)]';
      Memo7.Height:=n_gr_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(n_gr_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[frxDBDataset1."SUM5"]'+#13+#10+'[frxDBDataset1."SUM11"] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."SUM5">)]';
      Memo8.Height:=n_gr_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if (kurs_flag = 1) and(Last<>'KURS') then
   begin
      kurs_f:=TfrxGroupFooter.Create(page);
      kurs_f.CreateUniqueName;
      kurs_f.top:=top_next;
      kurs_f.Height:=0.8*fr1cm;
      top_next:=kurs_f.Top+kurs_f.Height;
      kurs_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(kurs_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по курсу: ';
      Memo1.Height:=kurs_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(kurs_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."KURS"]';
      Memo2.Height:=kurs_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=4*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(kurs_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[frxDBDataset1."SUM"]'+#13+#10+'[frxDBDataset1."SUM6"] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."SUM">)]';
      Memo3.Height:=kurs_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(kurs_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[frxDBDataset1."SUM1"]'+#13+#10+'[frxDBDataset1."SUM7"] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."SUM1">)]';
      Memo4.Height:=kurs_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(kurs_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[frxDBDataset1."SUM2"]'+#13+#10+'[frxDBDataset1."SUM8"] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."SUM2">)]';
      Memo5.Height:=kurs_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(kurs_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[frxDBDataset1."SUM3"]'+#13+#10+'[frxDBDataset1."SUM9"] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."SUM3">)]';
      Memo6.Height:=kurs_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(kurs_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[frxDBDataset1."SUM4"]'+#13+#10+'[frxDBDataset1."SUM10"] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."SUM4">)]';
      Memo7.Height:=kurs_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(kurs_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[frxDBDataset1."SUM5"]'+#13+#10+'[frxDBDataset1."SUM11"] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."SUM5">)]';
      Memo8.Height:=kurs_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;

   end;

  if (k_stud_flag = 1) and (Last<>'NAME_KAT_STUD') then
   begin
      k_st_f:=TfrxGroupFooter.Create(page);
      k_st_f.CreateUniqueName;
      k_st_f.top:=top_next;
      k_st_f.Height:=0.8*fr1cm;
      top_next:=k_st_f.Top+k_st_f.Height;
      k_st_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(k_st_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по категорії навчання: ';
      Memo1.Height:=k_st_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(k_st_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_KAT_STUD"]';
      Memo2.Height:=k_st_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=4*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(k_st_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[frxDBDataset1."SUM"]'+#13+#10+'[frxDBDataset1."SUM6"] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."SUM">)]';
      Memo3.Height:=k_st_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(k_st_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[frxDBDataset1."SUM1"]'+#13+#10+'[frxDBDataset1."SUM7"] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."SUM1">)]';
      Memo4.Height:=k_st_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(k_st_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[frxDBDataset1."SUM2"]'+#13+#10+'[frxDBDataset1."SUM5"] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."SUM2">)]';
      Memo5.Height:=k_st_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(k_st_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[frxDBDataset1."SUM3"]'+#13+#10+'[frxDBDataset1."SUM9"] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."SUM3">)]';
      Memo6.Height:=k_st_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(k_st_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[frxDBDataset1."SUM4"]'+#13+#10+'[frxDBDataset1."SUM10"] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."SUM4">)]';
      Memo7.Height:=k_st_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(k_st_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[frxDBDataset1."SUM5"]'+#13+#10+'[frxDBDataset1."SUM11"] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."SUM5">)]';
      Memo8.Height:=k_st_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if (f_stud_flag = 1)and (Last<>'NAME_FORM_STUD') then
   begin
      f_st_f:=TfrxGroupFooter.Create(page);
      f_st_f.CreateUniqueName;
      f_st_f.top:=top_next;
      f_st_f.Height:=0.8*fr1cm;
      top_next:=f_st_f.Top+f_st_f.Height;
      f_st_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(f_st_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по формі навчання: ';
      Memo1.Height:=f_st_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(f_st_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_FORM_STUD"]';
      Memo2.Height:=f_st_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=4*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.Font.Style:=[fsBold];
      Memo2.VAlign:=vaCenter;
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(f_st_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[frxDBDataset1."SUM"]'+#13+#10+'[frxDBDataset1."SUM6"] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."SUM">)]';
      Memo3.Height:=f_st_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(f_st_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[frxDBDataset1."SUM1"]'+#13+#10+'[frxDBDataset1."SUM7"] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."SUM1">)]';
      Memo4.Height:=f_st_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(f_st_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[frxDBDataset1."SUM2"]'+#13+#10+'[frxDBDataset1."SUM8"] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."SUM2">)]';
      Memo5.Height:=f_st_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(f_st_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[frxDBDataset1."SUM3"]'+#13+#10+'[frxDBDataset1."SUM9"] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."SUM3">)]';
      Memo6.Height:=f_st_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(f_st_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[frxDBDataset1."SUM4"]'+#13+#10+'[frxDBDataset1."SUM10"] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."SUM4">)]';
      Memo7.Height:=f_st_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(f_st_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[frxDBDataset1."SUM5"]'+#13+#10+'[frxDBDataset1."SUM11"] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."SUM5">)]';
      Memo8.Height:=f_st_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if (nat_flag = 1) and (Last<>'NAME_NATIONAL') then
   begin
      nat_f:=TfrxGroupFooter.Create(page);
      nat_f.CreateUniqueName;
      nat_f.top:=top_next;
      nat_f.Height:=0.8*fr1cm;
      top_next:=nat_f.Top+nat_f.Height;
      nat_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(nat_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по національності: ';
      Memo1.Height:=nat_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(nat_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_NATIONAL"]';
      Memo2.Height:=nat_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=4*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.Font.Style:=[fsBold];
      Memo2.VAlign:=vaCenter;
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(nat_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[frxDBDataset1."SUM"]'+#13+#10+'[frxDBDataset1."SUM6"] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."SUM">)]';
      Memo3.Height:=nat_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(nat_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[frxDBDataset1."SUM1"]'+#13+#10+'[frxDBDataset1."SUM7"] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."SUM1">)]';
      Memo4.Height:=nat_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(nat_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[frxDBDataset1."SUM2"]'+#13+#10+'[frxDBDataset1."SUM8"] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."SUM2">)]';
      Memo5.Height:=nat_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(nat_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[frxDBDataset1."SUM3"]'+#13+#10+'[frxDBDataset1."SUM9"] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."SUM3">)]';
      Memo6.Height:=nat_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(nat_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[frxDBDataset1."SUM4"]'+#13+#10+'[frxDBDataset1."SUM10"] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."SUM4">)]';
      Memo7.Height:=nat_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(nat_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[frxDBDataset1."SUM5"]'+#13+#10+'[frxDBDataset1."SUM11"] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."SUM5">)]';
      Memo8.Height:=nat_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if (spec_flag = 1) and(Last<>'NAME_SPEC') then
   begin
      spec_f:=TfrxGroupFooter.Create(page);
      spec_f.CreateUniqueName;
      spec_f.top:=top_next;
      spec_f.Height:=0.8*fr1cm;
      top_next:=spec_f.Top+spec_f.Height;
      spec_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(spec_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по спеціальності: ';
      Memo1.Height:=spec_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(spec_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_SPEC"]';
      Memo2.Height:=spec_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=4*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(spec_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[frxDBDataset1."SUM"]'+#13+#10+'[frxDBDataset1."SUM6"] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."SUM">)]';
      Memo3.Height:=spec_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(spec_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[frxDBDataset1."SUM1"]'+#13+#10+'[frxDBDataset1."SUM7"] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."SUM1">)]';
      Memo4.Height:=spec_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(spec_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[frxDBDataset1."SUM2"]'+#13+#10+'[frxDBDataset1."SUM8"] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."SUM2">)]';
      Memo5.Height:=spec_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(spec_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[frxDBDataset1."SUM3"]'+#13+#10+'[frxDBDataset1."SUM9"] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."SUM3">)]';
      Memo6.Height:=spec_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(spec_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[frxDBDataset1."SUM4"]'+#13+#10+'[frxDBDataset1."SUM10"] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."SUM4">)]';
      Memo7.Height:=spec_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(spec_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[frxDBDataset1."SUM5"]'+#13+#10+'[frxDBDataset1."SUM11"] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."SUM5">)]';
      Memo8.Height:=spec_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

   if (period_opl_flag = 1) and(Last<>'NAME_STAGE') then
   begin
      stage_f:=TfrxGroupFooter.Create(page);
      stage_f.CreateUniqueName;
      stage_f.top:=top_next;
      stage_f.Height:=0.8*fr1cm;
      top_next:=stage_f.Top+stage_f.Height;
      stage_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(stage_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по періоду оплати: ';
      Memo1.Height:=stage_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(stage_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_STAGE"]';
      Memo2.Height:=stage_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=4*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(stage_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[frxDBDataset1."SUM"]'+#13+#10+'[frxDBDataset1."SUM6"] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."SUM">)]';
      Memo3.Height:=stage_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(stage_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[frxDBDataset1."SUM1"]'+#13+#10+'[frxDBDataset1."SUM7"] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."SUM1">)]';
      Memo4.Height:=stage_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(stage_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[frxDBDataset1."SUM2"]'+#13+#10+'[frxDBDataset1."SUM8"] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."SUM2">)]';
      Memo5.Height:=stage_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(stage_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[frxDBDataset1."SUM3"]'+#13+#10+'[frxDBDataset1."SUM9"] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."SUM3">)]';
      Memo6.Height:=stage_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(stage_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[frxDBDataset1."SUM4"]'+#13+#10+'[frxDBDataset1."SUM10"] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."SUM4">)]';
      Memo7.Height:=stage_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(stage_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[frxDBDataset1."SUM5"]'+#13+#10+'[frxDBDataset1."SUM11"] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."SUM5">)]';
      Memo8.Height:=stage_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if (fac_flag = 1) and (Last<>'NAME_FACUL') then
   begin
      fac_f:=TfrxGroupFooter.Create(page);
      fac_f.CreateUniqueName;
      fac_f.top:=top_next;
      fac_f.Height:=0.8*fr1cm;
      top_next:=fac_f.Top+fac_f.Height;
      fac_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(fac_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по факультету: ';
      Memo1.Height:=fac_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(fac_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_FACUL"]';
      Memo2.Height:=fac_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=4*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(fac_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[frxDBDataset1."SUM"]'+#13+#10+'[frxDBDataset1."SUM6"] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."SUM">)]';
      Memo3.Height:=fac_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(fac_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[frxDBDataset1."SUM1"]'+#13+#10+'[frxDBDataset1."SUM7"] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."SUM1">)]';
      Memo4.Height:=fac_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(fac_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[frxDBDataset1."SUM2"]'+#13+#10+'[frxDBDataset1."SUM8"] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."SUM2">)]';
      Memo5.Height:=fac_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(fac_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[frxDBDataset1."SUM3"]'+#13+#10+'[frxDBDataset1."SUM9"] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."SUM3">)]';
      Memo6.Height:=fac_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(fac_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[frxDBDataset1."SUM4"]'+#13+#10+'[frxDBDataset1."SUM10"] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."SUM4">)]';
      Memo7.Height:=fac_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(fac_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[frxDBDataset1."SUM5"]'+#13+#10+'[frxDBDataset1."SUM11"] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."SUM5">)]';
      Memo8.Height:=fac_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.HAlign:=haRight;
      Memo8.VAlign:=vaCenter;
      Memo8.StretchMode:=smMaxHeight;
   end;
   if is_valyuta =1 then
   begin
      val_f:=TfrxGroupFooter.Create(page);
      val_f.CreateUniqueName;
      val_f.top:=top_next;
      val_f.Height:=0.8*fr1cm;
      top_next:=val_f.Top+val_f.Height;
      val_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(val_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по валюті: ';
      Memo1.Height:=val_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(val_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."CODE_VAL"]';
      Memo2.Height:=val_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=4*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(val_f);
      Memo3.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo3.Text:='[SUM(<frxDBDataset1."SUM">)]'+#13+#10 + '[SUM(<frxDBDataset1."SUM6">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."SUM">)]';
      Memo3.Height:=val_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(val_f);
      Memo4.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo4.Text:='[SUM(<frxDBDataset1."SUM1">)]'+#13+#10 + '[SUM(<frxDBDataset1."SUM7">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."SUM1">)]';
      Memo4.Height:=val_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(val_f);
      Memo5.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo5.Text:='[SUM(<frxDBDataset1."SUM2">)]'+#13+#10 + '[SUM(<frxDBDataset1."SUM8">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."SUM2">)]';
      Memo5.Height:=val_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(val_f);
      Memo6.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo6.Text:='[SUM(<frxDBDataset1."SUM3">)]'+#13+#10 + '[SUM(<frxDBDataset1."SUM9">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."SUM3">)]';
      Memo6.Height:=val_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(val_f);
      Memo7.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo7.Text:='[SUM(<frxDBDataset1."SUM4">)]'+#13+#10 + '[SUM(<frxDBDataset1."SUM10">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."SUM4">)]';
      Memo7.Height:=val_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(val_f);
      Memo8.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo8.Text:='[SUM(<frxDBDataset1."SUM5">)]'+#13+#10 + '[SUM(<frxDBDataset1."SUM11">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."SUM5">)]';
      Memo8.Height:=val_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.HAlign:=haRight;
      Memo8.VAlign:=vaCenter;
      Memo8.StretchMode:=smMaxHeight;
   end;
    //page_foter
   page_footer:=TfrxPageFooter.Create(page);
   page_footer.CreateUniqueName;
   page_footer.top:=top_next;
   page_footer.Height:=0.8*fr1cm;
   top_next:=page_footer.top + page_footer.Height;

   date_print:=TfrxMemoView.Create(page_footer);
   date_print.CreateUniqueName;
   date_print.Text:='Дата друку: [Now]';
   date_print.Height:=page_footer.Height;
   date_print.Left:=0;
   date_print.Font.Size:=8;
   date_print.Width:=5.4*fr1cm;
   date_print.VAlign:=vaCenter;
//   date_print.StretchMode:=smMaxHeight;

   page_print:=TfrxMemoView.Create(page_footer);
   page_print.CreateUniqueName;
   page_print.Text:='Стор. [Page#] із [TotalPages#]';
   page_print.Height:=page_footer.Height;
   page_print.Left:=13.6*fr1cm;
   page_print.Font.Size:=8;
   page_print.Width:=5.4*fr1cm;
   page_print.VAlign:=vaCenter;
 //  page_print.StretchMode:=smMaxHeight;
   //report summary
  band_footer:=TfrxReportSummary.Create(page);      
  band_footer.CreateUniqueName;
  band_footer.top:=top_next;
  band_footer.Height:=2.7*fr1cm;
  top_next:=band_footer.top + band_footer.Height;
  h_memo:=0.8*fr1cm;
  //height:=band.Height;
      Memo_1:=TfrxMemoView.Create(band_footer);
      Memo_1.CreateUniqueName;
      Memo_1.Text:='Всього: ';
      Memo_1.Height:=h_memo;
      memo_1.Left:=0;
      Memo_1.Font.Size:=8;
      Memo_1.Width:=7*fr1cm;
      Memo_1.VAlign:=vaCenter;
      Memo_1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
//      Memo_1.StretchMode:=smMaxHeight;
      Memo_1.Font.Style:=[fsBold];

      Memo_3:=TfrxMemoView.Create(band_footer);
      Memo_3.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo_3.Text:='[SUM(<frxDBDataset1."SUM">)]'+#13+#10 + '[SUM(<frxDBDataset1."SUM6">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo_3.Text:='[SUM(<frxDBDataset1."SUM">)]';
      Memo_3.Height:=h_memo;
      memo_3.Left:=Memo_1.Width;
      Memo_3.Font.Size:=8;
      Memo_3.Width:=2*fr1cm;
      Memo_3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_3.DisplayFormat.Kind:=fkNumeric;
      Memo_3.DisplayFormat.FormatStr:='%2.2n';
      Memo_3.VAlign:=vaCenter;
      Memo_3.HAlign:=haRight;
//      Memo_3.StretchMode:=smMaxHeight;
      Memo_3.Font.Style:=[fsBold];

      Memo_4:=TfrxMemoView.Create(band_footer);
      Memo_4.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo_4.Text:='[SUM(<frxDBDataset1."SUM1">)]'+#13+#10 + '[SUM(<frxDBDataset1."SUM7">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo_4.Text:='[SUM(<frxDBDataset1."SUM1">)]';
      Memo_4.Height:=h_memo;
      memo_4.Left:=Memo_1.Width+Memo_3.Width;
      Memo_4.Font.Size:=8;
      Memo_4.Width:=2*fr1cm;
      Memo_4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_4.DisplayFormat.Kind:=fkNumeric;
      Memo_4.DisplayFormat.FormatStr:='%2.2n';
      Memo_4.VAlign:=vaCenter;
      Memo_4.HAlign:=haRight;
 //     Memo_4.StretchMode:=smMaxHeight;
      Memo_4.Font.Style:=[fsBold];

      Memo_5:=TfrxMemoView.Create(band_footer);
      Memo_5.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo_5.Text:='[SUM(<frxDBDataset1."SUM2">)]'+#13+#10 + '[SUM(<frxDBDataset1."SUM8">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo_5.Text:='[SUM(<frxDBDataset1."SUM2">)]';
      Memo_5.Height:=h_memo;
      memo_5.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width;
      Memo_5.Font.Size:=8;
      Memo_5.Width:=2*fr1cm;
      Memo_5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_5.DisplayFormat.Kind:=fkNumeric;
      Memo_5.DisplayFormat.FormatStr:='%2.2n';
      Memo_5.VAlign:=vaCenter;
      Memo_5.HAlign:=haRight;
//      Memo_5.StretchMode:=smMaxHeight;
      Memo_5.Font.Style:=[fsBold];

      Memo_6:=TfrxMemoView.Create(band_footer);
      Memo_6.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo_6.Text:='[SUM(<frxDBDataset1."SUM3">)]'+#13+#10 + '[SUM(<frxDBDataset1."SUM9">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo_6.Text:='[SUM(<frxDBDataset1."SUM3">)]';
      Memo_6.Height:=h_memo;
      memo_6.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width+Memo_5.Width;
      Memo_6.Font.Size:=8;
      Memo_6.Width:=2*fr1cm;
      Memo_6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_6.DisplayFormat.Kind:=fkNumeric;
      Memo_6.DisplayFormat.FormatStr:='%2.2n';
      Memo_6.VAlign:=vaCenter;
      Memo_6.HAlign:=haRight;
//      Memo_6.StretchMode:=smMaxHeight;
      Memo_6.Font.Style:=[fsBold];

      Memo_7:=TfrxMemoView.Create(band_footer);
      Memo_7.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo_7.Text:='[SUM(<frxDBDataset1."SUM4">)]'+#13+#10 + '[SUM(<frxDBDataset1."SUM10">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo_7.Text:='[SUM(<frxDBDataset1."SUM4">)]';
      Memo_7.Height:=h_memo;
      memo_7.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width+Memo_5.Width+Memo_6.Width;
      Memo_7.Font.Size:=8;
      Memo_7.Width:=2*fr1cm;
      Memo_7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_7.DisplayFormat.Kind:=fkNumeric;
      Memo_7.DisplayFormat.FormatStr:='%2.2n';
      Memo_7.VAlign:=vaCenter;
      Memo_7.HAlign:=haRight;
 //     Memo_7.StretchMode:=smMaxHeight;
      Memo_7.Font.Style:=[fsBold];

      Memo_8:=TfrxMemoView.Create(band_footer);
      Memo_8.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo_8.Text:='[SUM(<frxDBDataset1."SUM5">)]'+#13+#10 + '[SUM(<frxDBDataset1."SUM11">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo_8.Text:='[SUM(<frxDBDataset1."SUM5">)]';
      Memo_8.Height:=h_memo;
      memo_8.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width+Memo_5.Width+Memo_6.Width+Memo_7.Width;
      Memo_8.Font.Size:=8;
      Memo_8.Width:=2*fr1cm;
      Memo_8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_8.DisplayFormat.Kind:=fkNumeric;
      Memo_8.DisplayFormat.FormatStr:='%2.2n';
      Memo_8.HAlign:=haRight;
      Memo_8.VAlign:=vaCenter;
//      Memo_8.StretchMode:=smMaxHeight;
      Memo_8.Font.Style:=[fsBold];

      memo_vik:=TfrxMemoView.Create(band_footer);
      memo_vik.CreateUniqueName;
      memo_vik.Text:='Виконавець';
      memo_vik.Height:=0.8*fr1cm;
      memo_vik.top:=1.1*fr1cm;
      memo_vik.Left:=1*fr1cm;
      memo_vik.Font.Size:=8;
      memo_vik.Width:=2*fr1cm;
      memo_vik.HAlign:=haLeft;
      memo_vik.VAlign:=vaCenter;
      if NOT_PRINT_FIO_ISPOLN=1 then  memo_vik.Visible:=False;
//      memo_vik.StretchMode:=smMaxHeight;
      

      memo_vik_underline:=TfrxMemoView.Create(band_footer);
      memo_vik_underline.CreateUniqueName;
      memo_vik_underline.Text:='';
      memo_vik_underline.Height:=0.8*fr1cm;
      memo_vik_underline.top:=1.1*fr1cm;
      memo_vik_underline.Left:=3*fr1cm;
      memo_vik_underline.Font.Size:=8;
      memo_vik_underline.Width:=6.3*fr1cm;
      memo_vik_underline.Frame.Typ:=[ftBottom];
      memo_vik_underline.HAlign:=haLeft;
      memo_vik_underline.VAlign:=vaCenter;
      if NOT_PRINT_FIO_ISPOLN=1 then  memo_vik_underline.Visible:=False;
//      memo_vik_underline.StretchMode:=smMaxHeight;

      memo_user:=TfrxMemoView.Create(band_footer);
      memo_user.CreateUniqueName;
      memo_user.Text:='/'+USER_FIO+'/';
      memo_user.Height:=0.8*fr1cm;
      memo_user.top:=1.1*fr1cm;
      memo_user.Left:=9.3*fr1cm;
      memo_user.Font.Size:=8;
      memo_user.Width:=9.6*fr1cm;
      memo_user.HAlign:=haLeft;
      memo_user.VAlign:=vaCenter;
      if NOT_PRINT_FIO_ISPOLN=1 then  memo_user.Visible:=False;
end;
if FORM_UCH = 19 then
begin
  frReport.Clear;                         //создаем страницу отчета
  frReport.DataSets.Add(frxDBDataset1);
  page:=TfrxReportPage.Create(frReport);
  page.CreateUniqueName;
  page.SetDefaults;

  band_head:=TfrxReportTitle.Create(page);
  band_head.Top:=0;
  band_head.Height:=3.2*fr1cm;
  top_next:=band_head.top + band_head.Height;

  memo_name:=TfrxMemoView.Create(band_head);
  memo_name.CreateUniqueName;
  memo_name.Height:=0.4*fr1cm;
  memo_name.Width:=10.8*fr1cm;
  memo_name.Frame.Typ:=[ftBottom];
  memo_name.Font.Size:=8;
  memo_name.Left:=0*fr1cm;
  memo_name.top:=0.2*fr1cm;
  memo_name.HAlign:=haCenter;
  memo_name.VAlign:=vaCenter;
  memo_name.Text:=ORG_FULL_NAME;
  memo_name.Font.Style:=[fsBold];

  memo_inn:=TfrxMemoView.Create(band_head);
  memo_inn.CreateUniqueName;
  memo_inn.Height:=0.8*fr1cm;
  memo_inn.Width:=2.5*fr1cm;
  memo_inn.Font.Size:=8;
  memo_inn.Left:=0*fr1cm;
  memo_inn.top:=0.6*fr1cm;
  memo_inn.HAlign:=haCenter;
  memo_inn.VAlign:=vaCenter;
  memo_inn.Text:='Ідентифікаційний код ЄДРПОУ';

  memo_inn_num:=TfrxMemoView.Create(band_head);
  memo_inn_num.CreateUniqueName;
  memo_inn_num.Height:=0.5*fr1cm;
  memo_inn_num.Width:=3*fr1cm;
  memo_inn_num.Font.Size:=8;
  memo_inn_num.Left:=2.6*fr1cm;
  memo_inn_num.top:=0.8*fr1cm;
  memo_inn_num.HAlign:=haCenter;
  memo_inn_num.VAlign:=vaCenter;
  memo_inn_num.Text:=ORG_KOD_OKPO;
  memo_inn_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  memo_period:=TfrxMemoView.Create(band_head);
  memo_period.CreateUniqueName;
  memo_period.Height:=1.3*fr1cm;
  memo_period.Width:=19.10*fr1cm;
  memo_period.Font.Size:=14;
  memo_period.Left:=0*fr1cm;
  memo_period.top:=1.8*fr1cm;
  memo_period.HAlign:=haCenter;
  memo_period.VAlign:=vaCenter;
  memo_period.Text:='Звіт за період з '+DatetoStr(StartOfAMonth(y_beg, m_beg))+' по '+Datetostr(EndOfAMonth(y_end, m_end));
  memo_period.Font.Style:=[fsBold];

  sch_for_sysytem:=TfrxMemoView.Create(band_head);
  sch_for_sysytem.CreateUniqueName;
  sch_for_sysytem.Height:=1*fr1cm;
  sch_for_sysytem.Width:=19*fr1cm;
  sch_for_sysytem.Font.Size:=10;
  sch_for_sysytem.Left:=0*fr1cm;
  sch_for_sysytem.top:=3.1*fr1cm;
  sch_for_sysytem.HAlign:=haCenter;
  sch_for_sysytem.VAlign:=vaCenter;
  sch_for_sysytem.Text:='Рахунки системи: '+ SCH_SYSTEM;

                                        //"верхушка" очета
  band:=TfrxPageHeader.Create(page);
  band.CreateUniqueName;
  band.top:=top_next;
  band.Height:=1*fr1cm;
  top_next:=band.top + band.Height;
  //height:=band.Height;
  memo_num:=TfrxMemoView.Create(band);
  memo_num.CreateUniqueName;
  memo_num.Height:=1*fr1cm;
  memo_num.Width:=1*fr1cm;
  memo_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_num.Font.Size:=8;
  memo_num.Left:=0*fr1cm;
  memo_num.top:=0;
  memo_num.HAlign:=haCenter;
  memo_num.VAlign:=vaCenter;
  memo_num.Color:= $00E4E4E4;
  memo_num.Text:='№ п/п';

  Memo_PIB:=TfrxMemoView.Create(band);
  Memo_PIB.CreateUniqueName;
  Memo_PIB.Height:=1*fr1cm;
  Memo_PIB.Width:=6*fr1cm;
  Memo_PIB.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_PIB.Font.Size:=8;
  Memo_PIB.Left:=1*fr1cm;
  memo_PIB.top:=0;
  Memo_PIB.HAlign:=haCenter;
  Memo_PIB.VAlign:=vaCenter;
  Memo_PIB.Color:= $00E4E4E4;
  Memo_PIB.Text:='Назва';

  saldo_in:=TfrxMemoView.Create(band);
  saldo_in.CreateUniqueName;
  saldo_in.Height:=0.5*fr1cm;
  saldo_in.Width:=4*fr1cm;
  saldo_in.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  saldo_in.Font.Size:=8;
  saldo_in.Left:=7*fr1cm;
  saldo_in.top:=0;
  saldo_in.HAlign:=haCenter;
  saldo_in.VAlign:=vaCenter;
  saldo_in.Color:= $00E4E4E4;
  saldo_in.Text:='Сальдо вхідне';

  s_in_db:=TfrxMemoView.Create(band);
  s_in_db.CreateUniqueName;
  s_in_db.Height:=0.5*fr1cm;
  s_in_db.Width:=2*fr1cm;
  s_in_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_db.Font.Size:=8;
  s_in_db.Left:=7*fr1cm;
  s_in_db.top:=0.5*fr1cm;
  s_in_db.HAlign:=haCenter;
  s_in_db.VAlign:=vaCenter;
  s_in_db.Color:= $00E4E4E4;
  s_in_db.Text:='Дебет';

  s_in_kr:=TfrxMemoView.Create(band);
  s_in_kr.CreateUniqueName;
  s_in_kr.Height:=0.5*fr1cm;
  s_in_kr.Width:=2*fr1cm;
  s_in_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_kr.Font.Size:=8;
  s_in_kr.Left:=9*fr1cm;
  s_in_kr.top:=0.5*fr1cm;
  s_in_kr.HAlign:=haCenter;
  s_in_kr.VAlign:=vaCenter;
  s_in_kr.Color:= $00E4E4E4;
  s_in_kr.Text:='Кредит';

  db:=TfrxMemoView.Create(band);
  db.CreateUniqueName;
  db.Height:=0.5*fr1cm;
  db.Width:=2*fr1cm;
  db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db.Font.Size:=8;
  db.Left:=11*fr1cm;
  db.top:=0;
  db.HAlign:=haCenter;
  db.VAlign:=vaCenter;
  db.Color:= $00E4E4E4;
  db.Text:='Дебет';

  db_s:=TfrxMemoView.Create(band);
  db_s.CreateUniqueName;
  db_s.Height:=0.5*fr1cm;
  db_s.Width:=2*fr1cm;
  db_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db_s.Font.Size:=8;
  db_s.Left:=11*fr1cm;
  db_s.top:=0.5*fr1cm;
  db_s.HAlign:=haCenter;
  db_s.VAlign:=vaCenter;
  db_s.Color:= $00E4E4E4;
  db_s.Text:='Сума';

  kr:=TfrxMemoView.Create(band);
  kr.CreateUniqueName;
  kr.Height:=0.5*fr1cm;
  kr.Width:=2*fr1cm;
  kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr.Font.Size:=8;
  kr.Left:=13*fr1cm;
  kr.top:=0;
  kr.HAlign:=haCenter;
  kr.VAlign:=vaCenter;
  kr.Color:= $00E4E4E4;
  kr.Text:='Кредит';

  kr_s:=TfrxMemoView.Create(band);
  kr_s.CreateUniqueName;
  kr_s.Height:=0.5*fr1cm;
  kr_s.Width:=2*fr1cm;
  kr_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr_s.Font.Size:=8;
  kr_s.Left:=13*fr1cm;
  kr_s.top:=0.5*fr1cm;
  kr_s.HAlign:=haCenter;
  kr_s.VAlign:=vaCenter;
  kr_s.Color:= $00E4E4E4;
  kr_s.Text:='Сума';

  saldo_out:=TfrxMemoView.Create(band);
  saldo_out.CreateUniqueName;
  saldo_out.Height:=0.5*fr1cm;
  saldo_out.Width:=4*fr1cm;
  saldo_out.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  saldo_out.Font.Size:=8;
  saldo_out.Left:=15*fr1cm;
  saldo_out.top:=0;
  saldo_out.HAlign:=haCenter;
  saldo_out.VAlign:=vaCenter;
  saldo_out.Color:= $00E4E4E4;
  saldo_out.Text:='Сальдо вихідне';

  s_out_db:=TfrxMemoView.Create(band);
  s_out_db.CreateUniqueName;
  s_out_db.Height:=0.5*fr1cm;
  s_out_db.Width:=2*fr1cm;
  s_out_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_db.Font.Size:=8;
  s_out_db.Left:=15*fr1cm;
  s_out_db.top:=0.5*fr1cm;
  s_out_db.HAlign:=haCenter;
  s_out_db.VAlign:=vaCenter;
  s_out_db.Color:= $00E4E4E4;
  s_out_db.Text:='Дебет';

  s_out_kr:=TfrxMemoView.Create(band);
  s_out_kr.CreateUniqueName;
  s_out_kr.Height:=0.5*fr1cm;
  s_out_kr.Width:=2*fr1cm;
  s_out_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_kr.Font.Size:=8;
  s_out_kr.Left:=17*fr1cm;
  s_out_kr.top:=0.5*fr1cm;
  s_out_kr.HAlign:=haCenter;
  s_out_kr.VAlign:=vaCenter;
  s_out_kr.Color:= $00E4E4E4;
  s_out_kr.Text:='Кредит';

  // верх закончили
//верхние группы
  if (obsh_flag = 1) and (Last<>'BUILDS')  then
   begin
       fac:=TfrxGroupHeader.Create(page);
       fac.CreateUniqueName;
       fac.top:=top_next;
       fac.Height:=0.8*fr1cm;
       top_next:=fac.top + fac.Height;

       fac.Condition:='frxDBDataset1."BUILDS"' ;

       fac_1:=TfrxMemoView.Create(fac);
       fac_1.CreateUniqueName;
       fac_1.Height:=0.8*fr1cm;
       fac_1.Width:=19*fr1cm;
       fac_1.Font.Size:=10;
       fac_1.Left:=0;
       fac_1.top:=0;
       fac_1.HAlign:=haCenter;
       fac_1.VAlign:=vaCenter;
       fac_1.Font.Style:=[fsBold];
       fac_1.Frame.Typ:=[ftLeft,ftRight];
       fac_1.Text:='[frxDBDataset1."BUILDS"]';
   end;

  if (fac_st_flag = 1) and(Last<>'NAME_FAK') then
   begin
       spec:=TfrxGroupHeader.Create(page);
       spec.CreateUniqueName;
       spec.top:=top_next;
       spec.Height:=0.8*fr1cm;
       top_next:=spec.top + spec.Height;
       spec.Condition:='frxDBDataset1."NAME_FAK"' ;

       spec_1:=TfrxMemoView.Create(spec);
       spec_1.CreateUniqueName;
       spec_1.Height:=0.8*fr1cm;
       spec_1.Width:=3.4*fr1cm;
       spec_1.Font.Size:=10;
       spec_1.Left:=0;
       spec_1.top:=0;
       spec_1.HAlign:=haLeft;
       spec_1.VAlign:=vaCenter;
       spec_1.Frame.Typ:=[ftLeft];
       spec_1.Text:='Факультет:';

       spec_2:=TfrxMemoView.Create(spec);
       spec_2.CreateUniqueName;
       spec_2.Height:=0.8*fr1cm;
       spec_2.Width:=15.6*fr1cm;
       spec_2.Font.Size:=10;
       spec_2.Left:=3.4*fr1cm;
       spec_2.top:=0;
       spec_2.Font.Style:=[fsBold];
       spec_2.HAlign:=haLeft;
       spec_2.VAlign:=vaCenter;
       spec_2.Frame.Typ:=[ftRight];
       spec_2.Text:='[frxDBDataset1."NAME_FAK"]';
   end;

  if (kurs_st_flag = 1) and (Last<>'KURS') then
   begin
       nat:=TfrxGroupHeader.Create(page);
       nat.CreateUniqueName;
       nat.top:=top_next;
       nat.Height:=0.8*fr1cm;
       top_next:=nat.top + nat.Height;
       nat.Condition:='frxDBDataset1."KURS"' ;

       nat_1:=TfrxMemoView.Create(nat);
       nat_1.CreateUniqueName;
       nat_1.Height:=0.8*fr1cm;
       nat_1.Width:=3.4*fr1cm;
       nat_1.Font.Size:=10;
       nat_1.Left:=0;
       nat_1.top:=0;
       nat_1.HAlign:=haLeft;
       nat_1.VAlign:=vaCenter;
       nat_1.Frame.Typ:=[ftLeft];
       nat_1.Text:='Курс:';

       nat_2:=TfrxMemoView.Create(nat);
       nat_2.CreateUniqueName;
       nat_2.Height:=0.8*fr1cm;
       nat_2.Width:=15.6*fr1cm;
       nat_2.Font.Size:=10;
       nat_2.Left:=3.4*fr1cm;
       nat_2.top:=0;
       nat_2.Font.Style:=[fsBold];
       nat_2.HAlign:=haLeft;
       nat_2.VAlign:=vaCenter;
       nat_2.Frame.Typ:=[ftRight];
       nat_2.Text:='[frxDBDataset1."KURS"]';
   end;

  if (kat_pay_flag = 1) and (Last<>'CAT_PAY') then
   begin
       f_st:=TfrxGroupHeader.Create(page);
       f_st.CreateUniqueName;
       f_st.top:=top_next;
       f_st.Height:=0.8*fr1cm;
       top_next:=f_st.top + f_st.Height;
       f_st.Condition:='frxDBDataset1."CAT_PAY"' ;

       f_st_1:=TfrxMemoView.Create(f_st);
       f_st_1.CreateUniqueName;
       f_st_1.Height:=0.8*fr1cm;
       f_st_1.Width:=3.4*fr1cm;
       f_st_1.Font.Size:=10;
       f_st_1.Left:=0;
       f_st_1.top:=0;
       f_st_1.HAlign:=haLeft;
       f_st_1.VAlign:=vaCenter;
       f_st_1.Frame.Typ:=[ftLeft];
       f_st_1.Text:='Категорія сплати:';

       f_st_2:=TfrxMemoView.Create(f_st);
       f_st_2.CreateUniqueName;
       f_st_2.Height:=0.8*fr1cm;
       f_st_2.Width:=15.6*fr1cm;
       f_st_2.Font.Size:=10;
       f_st_2.Left:=3.4*fr1cm;
       f_st_2.top:=0;
       f_st_2.Font.Style:=[fsBold];
       f_st_2.HAlign:=haLeft;
       f_st_2.VAlign:=vaCenter;
       f_st_2.Frame.Typ:=[ftRight];
       f_st_2.Text:='[frxDBDataset1."CAT_PAY"]';
   end;

  if (type_live_flag = 1) and (Last<>'TYPE_LIVE') then
   begin
       k_st:=TfrxGroupHeader.Create(page);
       k_st.CreateUniqueName;
       k_st.top:=top_next;
       k_st.Height:=0.8*fr1cm;
       top_next:=k_st.top + k_st.Height;
       k_st.Condition:='frxDBDataset1."TYPE_LIVE"' ;

       k_st_1:=TfrxMemoView.Create(k_st);
       k_st_1.CreateUniqueName;
       k_st_1.Height:=0.8*fr1cm;
       k_st_1.Width:=3.4*fr1cm;
       k_st_1.Font.Size:=10;
       k_st_1.Left:=0;
       k_st_1.top:=0;
       k_st_1.HAlign:=haLeft;
       k_st_1.VAlign:=vaCenter;
       k_st_1.Frame.Typ:=[ftLeft];
       k_st_1.Text:='Тип проживання:';

       k_st_2:=TfrxMemoView.Create(k_st);
       k_st_2.CreateUniqueName;
       k_st_2.Height:=0.8*fr1cm;
       k_st_2.Width:=15.6*fr1cm;
       k_st_2.Font.Size:=10;
       k_st_2.Left:=3.4*fr1cm;
       k_st_2.top:=0;
       k_st_2.Font.Style:=[fsBold];
       k_st_2.HAlign:=haLeft;
       k_st_2.VAlign:=vaCenter;
       k_st_2.Frame.Typ:=[ftRight];
       k_st_2.Text:='[frxDBDataset1."TYPE_LIVE"]';
   end;

  if (cl_live_flag = 1) and (Last<>'CLASS_LIVE') then
   begin
       kurs:=TfrxGroupHeader.Create(page);
       kurs.CreateUniqueName;
       kurs.top:=top_next;
       kurs.Height:=0.8*fr1cm;
       top_next:=kurs.top + kurs.Height;
       kurs.Condition:='frxDBDataset1."CLASS_LIVE"' ;

       kurs_1:=TfrxMemoView.Create(kurs);
       kurs_1.CreateUniqueName;
       kurs_1.Height:=0.8*fr1cm;
       kurs_1.Width:=3.4*fr1cm;
       kurs_1.Font.Size:=10;
       kurs_1.Left:=0;
       kurs_1.top:=0;
       kurs_1.HAlign:=haLeft;
       kurs_1.VAlign:=vaCenter;
       kurs_1.Frame.Typ:=[ftLeft];
       kurs_1.Text:='Клас проживання:';

       kurs_2:=TfrxMemoView.Create(kurs);
       kurs_2.CreateUniqueName;
       kurs_2.Height:=0.8*fr1cm;
       kurs_2.Width:=15.6*fr1cm;
       kurs_2.Font.Size:=10;
       kurs_2.Left:=3.4*fr1cm;
       kurs_2.top:=0;
       kurs_2.Font.Style:=[fsBold];
       kurs_2.HAlign:=haLeft;
       kurs_2.VAlign:=vaCenter;
       kurs_2.Frame.Typ:=[ftRight];
       kurs_2.Text:='[frxDBDataset1."CLASS_LIVE"]';
   end;

  if (grp_flag = 1) and (Last<>'NAME_GROUP') then
   begin
       n_gr:=TfrxGroupHeader.Create(page);
       n_gr.CreateUniqueName;
       n_gr.top:=top_next;
       n_gr.Height:=0.8*fr1cm;
       top_next:=n_gr.top + n_gr.Height;
       n_gr.Condition:='frxDBDataset1."NAME_GROUP"' ;

       n_gr_1:=TfrxMemoView.Create(n_gr);
       n_gr_1.CreateUniqueName;
       n_gr_1.Height:=0.8*fr1cm;
       n_gr_1.Width:=3.4*fr1cm;
       n_gr_1.Font.Size:=10;
       n_gr_1.Left:=0;
       n_gr_1.top:=0;
       n_gr_1.HAlign:=haLeft;
       n_gr_1.VAlign:=vaCenter;
       n_gr_1.Frame.Typ:=[ftLeft];
       n_gr_1.Text:='Група:';

       n_gr_2:=TfrxMemoView.Create(n_gr);
       n_gr_2.CreateUniqueName;
       n_gr_2.Height:=0.8*fr1cm;
       n_gr_2.Width:=15.6*fr1cm;
       n_gr_2.Font.Size:=10;
       n_gr_2.Left:=3.4*fr1cm;
       n_gr_2.top:=0;
       n_gr_2.Font.Style:=[fsBold];
       n_gr_2.HAlign:=haLeft;
       n_gr_2.VAlign:=vaCenter;
       n_gr_2.Frame.Typ:=[ftRight];
       n_gr_2.Text:='[frxDBDataset1."NAME_GROUP"]';
   end;
   //мастер дата

  DataBand:=TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.DataSet:=frxDBDataSet1;
  DAtaBand.Top:=top_next;
  DataBand.Height:=0.5*fr1cm;
  top_next:=DataBand.Top+DataBand.Height;
  DAtaBand.Stretched:=True;

  memo_num:=TfrxMemoView.Create(DataBand);
  memo_num.CreateUniqueName;
  memo_num.Height:=0.5*fr1cm;
  memo_num.Width:=1*fr1cm;
  memo_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_num.Font.Size:=8;
  memo_num.Left:=0*fr1cm;
  memo_num.top:=0;
  memo_num.HAlign:=haCenter;
  memo_num.VAlign:=vaCenter;
  memo_num.Text:='[Line]';
  memo_num.StretchMode:=smMaxHeight;

  Memo_PIB:=TfrxMemoView.Create(DataBand);
  Memo_PIB.CreateUniqueName;
  Memo_PIB.Height:=0.5*fr1cm;
  Memo_PIB.Width:=6*fr1cm;
  Memo_PIB.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_PIB.Font.Size:=8;
  Memo_PIB.Left:=1*fr1cm;
  memo_PIB.top:=0;
  if Last='BUILDS' then Memo_PIB.Text:='Гуртожиток: [frxDBDataset1."BUILDS"]';
  if Last='NAME_FAK' then Memo_PIB.Text:='Факультет: [frxDBDataset1."NAME_FAK"]';
  if Last='KURS' then Memo_PIB.Text:='Курс: [frxDBDataset1."KURS"]';
  if Last='CAT_PAY' then Memo_PIB.Text:='Категорія сплати: [frxDBDataset1."CAT_PAY"]';
  if Last='TYPE_LIVE' then Memo_PIB.Text:='Тип проживання: [frxDBDataset1."TYPE_LIVE"]';
  if Last='CLASS_LIVE' then Memo_PIB.Text:='Клас проживання: [frxDBDataset1."CLASS_LIVE"]';
  if Last='NAME_GROUP' then Memo_PIB.Text:='Група: [frxDBDataset1."NAME_GROUP"]';
  Memo_PIB.StretchMode:=smMaxHeight;
  Memo_PIB.VAlign:=vaCenter;

  s_in_db:=TfrxMemoView.Create(DataBand);
  s_in_db.CreateUniqueName;
  s_in_db.Height:=0.5*fr1cm;;
  s_in_db.Width:=2*fr1cm;
  s_in_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_db.Font.Size:=8;
  s_in_db.Left:=7*fr1cm;
  s_in_db.top:=0;
  s_in_db.HAlign:=haRight;
  s_in_db.DisplayFormat.Kind:=fkNumeric;
  s_in_db.DisplayFormat.FormatStr:='%2.2n';
  s_in_db.Text:='[frxDBDataset1."SUM"]';
  s_in_db.StretchMode:=smMaxHeight;
  s_in_db.VAlign:=vaCenter;

  s_in_kr:=TfrxMemoView.Create(DataBand);
  s_in_kr.CreateUniqueName;
  s_in_kr.Height:=0.5*fr1cm;;
  s_in_kr.Width:=2*fr1cm;
  s_in_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_kr.Font.Size:=8;
  s_in_kr.Left:=9*fr1cm;
  s_in_kr.top:=0;
  s_in_kr.HAlign:=haRight;
  s_in_kr.DisplayFormat.Kind:=fkNumeric;
  s_in_kr.DisplayFormat.FormatStr:='%2.2n';
  s_in_kr.Text:='[frxDBDataset1."SUM1"]';
  s_in_kr.StretchMode:=smMaxHeight;
  s_in_kr.VAlign:=vaCenter;

  db_s:=TfrxMemoView.Create(DataBand);
  db_s.CreateUniqueName;
  db_s.Height:=0.5*fr1cm;
  db_s.Width:=2*fr1cm;
  db_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db_s.Font.Size:=8;
  db_s.Left:=11*fr1cm;
  db_s.top:=0;
  db_s.HAlign:=haRight;
  db_s.DisplayFormat.Kind:=fkNumeric;
  db_s.DisplayFormat.FormatStr:='%2.2n';
  db_s.Text:='[frxDBDataset1."SUM2"]';
  db_s.StretchMode:=smMaxHeight;
  db_s.VAlign:=vaCenter;

  kr_s:=TfrxMemoView.Create(DataBand);
  kr_s.CreateUniqueName;
  kr_s.Height:=0.5*fr1cm;
  kr_s.Width:=2*fr1cm;
  kr_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr_s.Font.Size:=8;
  kr_s.Left:=13*fr1cm;
  kr_s.top:=0;
  kr_s.HAlign:=haRight;
  kr_s.DisplayFormat.Kind:=fkNumeric;
  kr_s.DisplayFormat.FormatStr:='%2.2n';
  kr_s.Text:='[frxDBDataset1."SUM3"]';
  kr_s.StretchMode:=smMaxHeight;
  kr_s.VAlign:=vaCenter;

  s_out_db:=TfrxMemoView.Create(DataBand);
  s_out_db.CreateUniqueName;
  s_out_db.Height:=0.5*fr1cm;
  s_out_db.Width:=2*fr1cm;
  s_out_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_db.Font.Size:=8;
  s_out_db.Left:=15*fr1cm;
  s_out_db.top:=0;
  s_out_db.HAlign:=haRight;
  s_out_db.DisplayFormat.Kind:=fkNumeric;
  s_out_db.DisplayFormat.FormatStr:='%2.2n';
  s_out_db.Text:='[frxDBDataset1."SUM4"]';
  s_out_db.StretchMode:=smMaxHeight;
  s_out_db.VAlign:=vaCenter;

  s_out_kr:=TfrxMemoView.Create(DataBand);
  s_out_kr.CreateUniqueName;
  s_out_kr.Height:=0.5*fr1cm;
  s_out_kr.Width:=2*fr1cm;
  s_out_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_kr.Font.Size:=8;
  s_out_kr.Left:=17*fr1cm;
  s_out_kr.top:=0;
  s_out_kr.HAlign:=haRight;
  s_out_kr.DisplayFormat.Kind:=fkNumeric;
  s_out_kr.DisplayFormat.FormatStr:='%2.2n';
  s_out_kr.Text:='[frxDBDataset1."SUM5"]';
  s_out_kr.StretchMode:=smMaxHeight;
  s_out_kr.VAlign:=vaCenter;

  // нижние группы

  if (grp_flag = 1) and (Last<>'NAME_GROUP') then
   begin
      n_gr_f:=TfrxGroupFooter.Create(page);
      n_gr_f.CreateUniqueName;
      n_gr_f.top:=top_next;
      n_gr_f.Height:=0.8*fr1cm;
      top_next:=n_gr_f.Top+n_gr_f.Height;
      n_gr_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(n_gr_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по групі: ';
      Memo1.Height:=n_gr_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(n_gr_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_GROUP"]';
      Memo2.Height:=n_gr_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=4*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(n_gr_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."SUM">)]';
      Memo3.Height:=n_gr_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(n_gr_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."SUM1">)]';
      Memo4.Height:=n_gr_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(n_gr_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."SUM2">)]';
      Memo5.Height:=n_gr_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(n_gr_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."SUM3">)]';
      Memo6.Height:=n_gr_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(n_gr_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."SUM4">)]';
      Memo7.Height:=n_gr_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(n_gr_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."SUM5">)]';
      Memo8.Height:=n_gr_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if (cl_live_flag = 1) and(Last<>'CLASS_LIVE') then
   begin
      kurs_f:=TfrxGroupFooter.Create(page);
      kurs_f.CreateUniqueName;
      kurs_f.top:=top_next;
      kurs_f.Height:=0.8*fr1cm;
      top_next:=kurs_f.Top+kurs_f.Height;
      kurs_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(kurs_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по класу проживання: ';
      Memo1.Height:=kurs_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(kurs_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."CLASS_LIVE"]';
      Memo2.Height:=kurs_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=4*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(kurs_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."SUM">)]';
      Memo3.Height:=kurs_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(kurs_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."SUM1">)]';
      Memo4.Height:=kurs_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(kurs_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."SUM2">)]';
      Memo5.Height:=kurs_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(kurs_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."SUM3">)]';
      Memo6.Height:=kurs_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(kurs_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."SUM4">)]';
      Memo7.Height:=kurs_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(kurs_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."SUM5">)]';
      Memo8.Height:=kurs_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;

   end;

  if (type_live_flag = 1) and (Last<>'TYPE_LIVE') then
   begin
      k_st_f:=TfrxGroupFooter.Create(page);
      k_st_f.CreateUniqueName;
      k_st_f.top:=top_next;
      k_st_f.Height:=0.8*fr1cm;
      top_next:=k_st_f.Top+k_st_f.Height;
      k_st_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(k_st_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по типу проживання: ';
      Memo1.Height:=k_st_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(k_st_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."TYPE_LIVE"]';
      Memo2.Height:=k_st_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=4*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(k_st_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."SUM">)]';
      Memo3.Height:=k_st_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(k_st_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."SUM1">)]';
      Memo4.Height:=k_st_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(k_st_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."SUM2">)]';
      Memo5.Height:=k_st_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(k_st_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."SUM3">)]';
      Memo6.Height:=k_st_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(k_st_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."SUM4">)]';
      Memo7.Height:=k_st_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(k_st_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."SUM5">)]';
      Memo8.Height:=k_st_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if (kat_pay_flag = 1)and (Last<>'CAT_PAY') then
   begin
      f_st_f:=TfrxGroupFooter.Create(page);
      f_st_f.CreateUniqueName;
      f_st_f.top:=top_next;
      f_st_f.Height:=0.8*fr1cm;
      top_next:=f_st_f.Top+f_st_f.Height;
      f_st_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(f_st_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по категорії сплати: ';
      Memo1.Height:=f_st_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(f_st_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."CAT_PAY"]';
      Memo2.Height:=f_st_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=4*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.Font.Style:=[fsBold];
      Memo2.VAlign:=vaCenter;
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(f_st_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."SUM">)]';
      Memo3.Height:=f_st_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(f_st_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."SUM1">)]';
      Memo4.Height:=f_st_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(f_st_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."SUM2">)]';
      Memo5.Height:=f_st_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(f_st_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."SUM3">)]';
      Memo6.Height:=f_st_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(f_st_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."SUM4">)]';
      Memo7.Height:=f_st_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(f_st_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."SUM5">)]';
      Memo8.Height:=f_st_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if (kurs_st_flag = 1) and (Last<>'KURS') then
   begin
      nat_f:=TfrxGroupFooter.Create(page);
      nat_f.CreateUniqueName;
      nat_f.top:=top_next;
      nat_f.Height:=0.8*fr1cm;
      top_next:=nat_f.Top+nat_f.Height;
      nat_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(nat_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по курсу: ';
      Memo1.Height:=nat_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(nat_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."KURS"]';
      Memo2.Height:=nat_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=4*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.Font.Style:=[fsBold];
      Memo2.VAlign:=vaCenter;
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(nat_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."SUM">)]';
      Memo3.Height:=nat_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(nat_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."SUM1">)]';
      Memo4.Height:=nat_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(nat_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."SUM2">)]';
      Memo5.Height:=nat_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(nat_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."SUM3">)]';
      Memo6.Height:=nat_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(nat_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."SUM4">)]';
      Memo7.Height:=nat_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(nat_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."SUM5">)]';
      Memo8.Height:=nat_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if (fac_st_flag = 1) and(Last<>'NAME_FAK') then
   begin
      spec_f:=TfrxGroupFooter.Create(page);
      spec_f.CreateUniqueName;
      spec_f.top:=top_next;
      spec_f.Height:=0.8*fr1cm;
      top_next:=spec_f.Top+spec_f.Height;
      spec_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(spec_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по факультету: ';
      Memo1.Height:=spec_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(spec_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_FAK"]';
      Memo2.Height:=spec_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=4*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(spec_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."SUM">)]';
      Memo3.Height:=spec_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(spec_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."SUM1">)]';
      Memo4.Height:=spec_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(spec_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."SUM2">)]';
      Memo5.Height:=spec_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(spec_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."SUM3">)]';
      Memo6.Height:=spec_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(spec_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."SUM4">)]';
      Memo7.Height:=spec_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(spec_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."SUM5">)]';
      Memo8.Height:=spec_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if (obsh_flag = 1) and (Last<>'BUILDS') then
   begin
      fac_f:=TfrxGroupFooter.Create(page);
      fac_f.CreateUniqueName;
      fac_f.top:=top_next;
      fac_f.Height:=0.8*fr1cm;
      top_next:=fac_f.Top+fac_f.Height;
      fac_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(fac_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по гуртожитку: ';
      Memo1.Height:=fac_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(fac_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."BUILDS"]';
      Memo2.Height:=fac_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=4*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(fac_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."SUM">)]';
      Memo3.Height:=fac_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(fac_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."SUM1">)]';
      Memo4.Height:=fac_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(fac_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."SUM2">)]';
      Memo5.Height:=fac_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(fac_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."SUM3">)]';
      Memo6.Height:=fac_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(fac_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."SUM4">)]';
      Memo7.Height:=fac_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(fac_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."SUM5">)]';
      Memo8.Height:=fac_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.HAlign:=haRight;
      Memo8.VAlign:=vaCenter;
      Memo8.StretchMode:=smMaxHeight;
   end;
    //page_foter
   page_footer:=TfrxPageFooter.Create(page);
   page_footer.CreateUniqueName;
   page_footer.top:=top_next;
   page_footer.Height:=0.8*fr1cm;
   top_next:=page_footer.top + page_footer.Height;

   date_print:=TfrxMemoView.Create(page_footer);
   date_print.CreateUniqueName;
   date_print.Text:='Дата друку: [Now]';
   date_print.Height:=page_footer.Height;
   date_print.Left:=0;
   date_print.Font.Size:=8;
   date_print.Width:=5.4*fr1cm;
   date_print.VAlign:=vaCenter;
//   date_print.StretchMode:=smMaxHeight;

   page_print:=TfrxMemoView.Create(page_footer);
   page_print.CreateUniqueName;
   page_print.Text:='Стор. [Page#] із [TotalPages#]';
   page_print.Height:=page_footer.Height;
   page_print.Left:=13.6*fr1cm;
   page_print.Font.Size:=8;
   page_print.Width:=5.4*fr1cm;
   page_print.VAlign:=vaCenter;
 //  page_print.StretchMode:=smMaxHeight;
   //report summary
  band_footer:=TfrxReportSummary.Create(page);      
  band_footer.CreateUniqueName;
  band_footer.top:=top_next;
  band_footer.Height:=2.7*fr1cm;
  top_next:=band_footer.top + band_footer.Height;
  h_memo:=0.8*fr1cm;
  //height:=band.Height;
      Memo_1:=TfrxMemoView.Create(band_footer);
      Memo_1.CreateUniqueName;
      Memo_1.Text:='Всього: ';
      Memo_1.Height:=h_memo;
      memo_1.Left:=0;
      Memo_1.Font.Size:=8;
      Memo_1.Width:=7*fr1cm;
      Memo_1.VAlign:=vaCenter;
      Memo_1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
//      Memo_1.StretchMode:=smMaxHeight;
      Memo_1.Font.Style:=[fsBold];

      Memo_3:=TfrxMemoView.Create(band_footer);
      Memo_3.CreateUniqueName;
      Memo_3.Text:='[SUM(<frxDBDataset1."SUM">)]';
      Memo_3.Height:=h_memo;
      memo_3.Left:=Memo_1.Width;
      Memo_3.Font.Size:=8;
      Memo_3.Width:=2*fr1cm;
      Memo_3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_3.DisplayFormat.Kind:=fkNumeric;
      Memo_3.DisplayFormat.FormatStr:='%2.2n';
      Memo_3.VAlign:=vaCenter;
      Memo_3.HAlign:=haRight;
//      Memo_3.StretchMode:=smMaxHeight;
      Memo_3.Font.Style:=[fsBold];

      Memo_4:=TfrxMemoView.Create(band_footer);
      Memo_4.CreateUniqueName;
      Memo_4.Text:='[SUM(<frxDBDataset1."SUM1">)]';
      Memo_4.Height:=h_memo;
      memo_4.Left:=Memo_1.Width+Memo_3.Width;
      Memo_4.Font.Size:=8;
      Memo_4.Width:=2*fr1cm;
      Memo_4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_4.DisplayFormat.Kind:=fkNumeric;
      Memo_4.DisplayFormat.FormatStr:='%2.2n';
      Memo_4.VAlign:=vaCenter;
      Memo_4.HAlign:=haRight;
//      Memo_4.StretchMode:=smMaxHeight;
      Memo_4.Font.Style:=[fsBold];

      Memo_5:=TfrxMemoView.Create(band_footer);
      Memo_5.CreateUniqueName;
      Memo_5.Text:='[SUM(<frxDBDataset1."SUM2">)]';
      Memo_5.Height:=h_memo;
      memo_5.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width;
      Memo_5.Font.Size:=8;
      Memo_5.Width:=2*fr1cm;
      Memo_5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_5.DisplayFormat.Kind:=fkNumeric;
      Memo_5.DisplayFormat.FormatStr:='%2.2n';
      Memo_5.VAlign:=vaCenter;
      Memo_5.HAlign:=haRight;
//      Memo_5.StretchMode:=smMaxHeight;
      Memo_5.Font.Style:=[fsBold];

      Memo_6:=TfrxMemoView.Create(band_footer);
      Memo_6.CreateUniqueName;
      Memo_6.Text:='[SUM(<frxDBDataset1."SUM3">)]';
      Memo_6.Height:=h_memo;
      memo_6.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width+Memo_5.Width;
      Memo_6.Font.Size:=8;
      Memo_6.Width:=2*fr1cm;
      Memo_6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_6.DisplayFormat.Kind:=fkNumeric;
      Memo_6.DisplayFormat.FormatStr:='%2.2n';
      Memo_6.VAlign:=vaCenter;
      Memo_6.HAlign:=haRight;
//      Memo_6.StretchMode:=smMaxHeight;
      Memo_6.Font.Style:=[fsBold];

      Memo_7:=TfrxMemoView.Create(band_footer);
      Memo_7.CreateUniqueName;
      Memo_7.Text:='[SUM(<frxDBDataset1."SUM4">)]';
      Memo_7.Height:=h_memo;
      memo_7.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width+Memo_5.Width+Memo_6.Width;
      Memo_7.Font.Size:=8;
      Memo_7.Width:=2*fr1cm;
      Memo_7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_7.DisplayFormat.Kind:=fkNumeric;
      Memo_7.DisplayFormat.FormatStr:='%2.2n';
      Memo_7.VAlign:=vaCenter;
      Memo_7.HAlign:=haRight;
//      Memo_7.StretchMode:=smMaxHeight;
      Memo_7.Font.Style:=[fsBold];

      Memo_8:=TfrxMemoView.Create(band_footer);
      Memo_8.CreateUniqueName;
      Memo_8.Text:='[SUM(<frxDBDataset1."SUM5">)]';
      Memo_8.Height:=h_memo;
      memo_8.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width+Memo_5.Width+Memo_6.Width+Memo_7.Width;
      Memo_8.Font.Size:=8;
      Memo_8.Width:=2*fr1cm;
      Memo_8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_8.DisplayFormat.Kind:=fkNumeric;
      Memo_8.DisplayFormat.FormatStr:='%2.2n';
      Memo_8.HAlign:=haRight;
      Memo_8.VAlign:=vaCenter;
//      Memo_8.StretchMode:=smMaxHeight;
      Memo_8.Font.Style:=[fsBold];

      memo_vik:=TfrxMemoView.Create(band_footer);
      memo_vik.CreateUniqueName;
      memo_vik.Text:='Виконавець';
      memo_vik.Height:=0.8*fr1cm;
      memo_vik.top:=1.1*fr1cm;
      memo_vik.Left:=1*fr1cm;
      memo_vik.Font.Size:=8;
      memo_vik.Width:=2*fr1cm;
      memo_vik.HAlign:=haLeft;
      memo_vik.VAlign:=vaCenter;
//      memo_vik.StretchMode:=smMaxHeight;
      if NOT_PRINT_FIO_ISPOLN=1 then  memo_vik.Visible:=False;

      memo_vik_underline:=TfrxMemoView.Create(band_footer);
      memo_vik_underline.CreateUniqueName;
      memo_vik_underline.Text:='';
      memo_vik_underline.Height:=0.8*fr1cm;
      memo_vik_underline.top:=1.1*fr1cm;
      memo_vik_underline.Left:=3*fr1cm;
      memo_vik_underline.Font.Size:=8;
      memo_vik_underline.Width:=6.3*fr1cm;
      memo_vik_underline.Frame.Typ:=[ftBottom];
      memo_vik_underline.HAlign:=haLeft;
      memo_vik_underline.VAlign:=vaCenter;
//      memo_vik_underline.StretchMode:=smMaxHeight;
      if NOT_PRINT_FIO_ISPOLN=1 then  memo_vik_underline.Visible:=False;

      memo_user:=TfrxMemoView.Create(band_footer);
      memo_user.CreateUniqueName;
      memo_user.Text:='/'+USER_FIO+'/';
      memo_user.Height:=0.8*fr1cm;
      memo_user.top:=1.1*fr1cm;
      memo_user.Left:=9.3*fr1cm;
      memo_user.Font.Size:=8;
      memo_user.Width:=9.6*fr1cm;
      memo_user.HAlign:=haLeft;
      memo_user.VAlign:=vaCenter;
      if NOT_PRINT_FIO_ISPOLN=1 then  memo_user.Visible:=False;
end;
frReport.Variables['BEG_PER']:=StartOfAMonth(y_beg, m_beg);
frReport.Variables['END_PER']:=EndOfAMonth(y_end, m_end);
end;

procedure TChooseForm.MakeReport;
var page:TfrxReportPage;
    band_footer:TfrxReportSummary;
    orient:TPrinterOrientation;
    band_header,band, fac_f, spec_f, nat_f, f_st_f, k_st_f, kurs_f, n_gr_f, band_head, page_footer, val_f, stage_f:TfrxBand;
    Memo_PIB, Memo_Ist, Memo_sm, Memo_rz, Memo_st, Memo_kekv, saldo_in, s_in_db, memo_num:TfrxMemoView;
    s_in_kr, saldo_out, s_out_db, s_out_kr, db, kr, db_s, kr_s:TfrxMemoView;
    top_next,height,width_memo,left_memo,left,rasst, h_memo:Extended;
    fac, spec, nat, f_st, k_st, kurs, n_gr, val, stage:TfrxGroupHeader;
    fac_1, spec_1, spec_2, nat_1, nat_2, f_st_1, k_st_1, kurs_1, n_gr_1, f_st_2, k_st_2, kurs_2, n_gr_2, val_1, val_2, stage_1, stage_2:TfrxMemoView;
    Memo1, Memo2, Memo3, Memo4, Memo5, Memo6, Memo7, Memo8: TfrxMemoView;
    Memo_1, Memo_2, Memo_3, Memo_4, Memo_5, Memo_6, Memo_7, Memo_8: TfrxMemoView;
    memo_name, memo_inn, memo_inn_num, memo_period:TfrxMemoView;
    memo_vik, memo_vik_underline, memo_user, date_print, page_print, sch_for_sysytem:TfrxMemoView;
    i,k:Integer;
    DataBand:TfrxMasterData;
begin
if FORM_UCH = 20 then
begin
  frReport.Clear;                         //создаем страницу отчета
  frReport.DataSets.Add(frxDBDataset1);
//  Page:=frReport.Pages[0] as TfrxReportPage;
  page:=TfrxReportPage.Create(frReport);
  page.CreateUniqueName;
  page.SetDefaults;
  page.Orientation:=poLandscape;

  band_head:=TfrxReportTitle.Create(page);
  band_head.Top:=0;
  band_head.Height:=4.2*fr1cm;
  top_next:=band_head.top + band_head.Height;

  memo_name:=TfrxMemoView.Create(band_head);
  memo_name.CreateUniqueName;
  memo_name.Height:=0.4*fr1cm;
  memo_name.Width:=10.8*fr1cm;
  memo_name.Frame.Typ:=[ftBottom];
  memo_name.Font.Size:=8;
  memo_name.Left:=0*fr1cm;
  memo_name.top:=0.2*fr1cm;
  memo_name.HAlign:=haCenter;
  memo_name.VAlign:=vaCenter;
  memo_name.Text:=ORG_FULL_NAME;
  memo_name.Font.Style:=[fsBold];

  memo_inn:=TfrxMemoView.Create(band_head);
  memo_inn.CreateUniqueName;
  memo_inn.Height:=0.8*fr1cm;
  memo_inn.Width:=2.5*fr1cm;
  memo_inn.Font.Size:=8;
  memo_inn.Left:=0*fr1cm;
  memo_inn.top:=0.6*fr1cm;
  memo_inn.HAlign:=haCenter;
  memo_inn.VAlign:=vaCenter;
  memo_inn.Text:='Ідентифікаційний код ЄДРПОУ';

  memo_inn_num:=TfrxMemoView.Create(band_head);
  memo_inn_num.CreateUniqueName;
  memo_inn_num.Height:=0.5*fr1cm;
  memo_inn_num.Width:=3*fr1cm;
  memo_inn_num.Font.Size:=8;
  memo_inn_num.Left:=2.6*fr1cm;
  memo_inn_num.top:=0.8*fr1cm;
  memo_inn_num.HAlign:=haCenter;
  memo_inn_num.VAlign:=vaCenter;
  memo_inn_num.Text:=ORG_KOD_OKPO;
  memo_inn_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  memo_period:=TfrxMemoView.Create(band_head);
  memo_period.CreateUniqueName;
  memo_period.Height:=1.3*fr1cm;
  memo_period.Width:=27*fr1cm;
  memo_period.Font.Size:=14;
  memo_period.Left:=0*fr1cm;
  memo_period.top:=1.8*fr1cm;
  memo_period.HAlign:=haCenter;
  memo_period.VAlign:=vaCenter;
  memo_period.Text:='Звіт за період з '+DatetoStr(StartOfAMonth(y_beg, m_beg))+' по '+Datetostr(EndOfAMonth(y_end, m_end));
  memo_period.Font.Style:=[fsBold];

  sch_for_sysytem:=TfrxMemoView.Create(band_head);
  sch_for_sysytem.CreateUniqueName;
  sch_for_sysytem.Height:=1*fr1cm;
  sch_for_sysytem.Width:=27*fr1cm;
  sch_for_sysytem.Font.Size:=10;
  sch_for_sysytem.Left:=0*fr1cm;
  sch_for_sysytem.top:=3.1*fr1cm;
  sch_for_sysytem.HAlign:=haCenter;
  sch_for_sysytem.VAlign:=vaCenter;
  sch_for_sysytem.Text:='Рахунки системи: '+ SCH_SYSTEM;

  band:=TfrxPageHeader.Create(page);      //"верхушка" очета
  band.CreateUniqueName;
  band.top:=top_next;
  band.Height:=1*fr1cm;
  top_next:=band.top + band.Height;
  //height:=band.Height;
  memo_num:=TfrxMemoView.Create(band);
  memo_num.CreateUniqueName;
  memo_num.Height:=1*fr1cm;
  memo_num.Width:=1*fr1cm;
  memo_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_num.Font.Size:=8;
  memo_num.Left:=0*fr1cm;
  memo_num.top:=0;
  memo_num.HAlign:=haCenter;
  memo_num.VAlign:=vaCenter;
  memo_num.Color:= $00E4E4E4;
  memo_num.Text:='№ п/п';

  Memo_PIB:=TfrxMemoView.Create(band);
  Memo_PIB.CreateUniqueName;
  Memo_PIB.Height:=1*fr1cm;
  Memo_PIB.Width:=10.3*fr1cm;
  Memo_PIB.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_PIB.Font.Size:=8;
  Memo_PIB.Left:=1*fr1cm;
  memo_PIB.top:=0;
  Memo_PIB.HAlign:=haCenter;
  Memo_PIB.VAlign:=vaCenter;
  Memo_PIB.Color:= $00E4E4E4;
  Memo_PIB.Text:='ПІБ';

  Memo_Ist:=TfrxMemoView.Create(band);
  Memo_Ist.CreateUniqueName;
  Memo_Ist.Height:=0.5*fr1cm;
  Memo_Ist.Width:=4.4*fr1cm;
  Memo_Ist.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_Ist.Font.Size:=8;
  Memo_Ist.Left:=11.29*fr1cm;
  memo_Ist.top:=0;
  Memo_Ist.HAlign:=haCenter;
  Memo_Ist.VAlign:=vaCenter;
  Memo_Ist.Color:= $00E4E4E4;
  Memo_Ist.Text:='Джерела фінансування';

  Memo_sm:=TfrxMemoView.Create(band);
  Memo_sm.CreateUniqueName;
  Memo_sm.Height:=0.5*fr1cm;
  Memo_sm.Width:=1.03*fr1cm;
  Memo_sm.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_sm.Font.Size:=8;
  Memo_sm.Left:=11.29*fr1cm;
  Memo_sm.top:=0.5*fr1cm;
  Memo_sm.HAlign:=haCenter;
  Memo_sm.VAlign:=vaCenter;
  Memo_sm.Color:= $00E4E4E4;
  Memo_sm.Text:='Кошт.';

  Memo_rz:=TfrxMemoView.Create(band);
  Memo_rz.CreateUniqueName;
  Memo_rz.Height:=0.5*fr1cm;
  Memo_rz.Width:=1.14*fr1cm;
  Memo_rz.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_rz.Font.Size:=8;
  Memo_rz.Left:=12.32*fr1cm;
  Memo_rz.top:=0.5*fr1cm;
  Memo_rz.HAlign:=haCenter;
  Memo_rz.VAlign:=vaCenter;
  Memo_rz.Color:= $00E4E4E4;
  Memo_rz.Text:='Розділ';

  Memo_st:=TfrxMemoView.Create(band);
  Memo_st.CreateUniqueName;
  Memo_st.Height:=0.5*fr1cm;
  Memo_st.Width:=1.22*fr1cm;
  Memo_st.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_st.Font.Size:=8;
  Memo_st.Left:=13.46*fr1cm;
  Memo_st.top:=0.5*fr1cm;
  Memo_st.HAlign:=haCenter;
  Memo_st.VAlign:=vaCenter;
  Memo_st.Color:= $00E4E4E4;
  Memo_st.Text:='Стаття';

  Memo_kekv:=TfrxMemoView.Create(band);
  Memo_kekv.CreateUniqueName;
  Memo_kekv.Height:=0.5*fr1cm;
  Memo_kekv.Width:=1.02*fr1cm;
  Memo_kekv.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_kekv.Font.Size:=8;
  Memo_kekv.Left:=14.68*fr1cm;
  Memo_kekv.top:=0.5*fr1cm;
  Memo_kekv.HAlign:=haCenter;
  Memo_kekv.VAlign:=vaCenter;
  Memo_kekv.Color:= $00E4E4E4;
  Memo_kekv.Text:='КЕКВ';

  saldo_in:=TfrxMemoView.Create(band);
  saldo_in.CreateUniqueName;
  saldo_in.Height:=0.5*fr1cm;
  saldo_in.Width:=4*fr1cm;
  saldo_in.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  saldo_in.Font.Size:=8;
  saldo_in.Left:=15.7*fr1cm;
  saldo_in.top:=0;
  saldo_in.HAlign:=haCenter;
  saldo_in.VAlign:=vaCenter;
  saldo_in.Color:= $00E4E4E4;
  saldo_in.Text:='Сальдо вхідне';

  s_in_db:=TfrxMemoView.Create(band);
  s_in_db.CreateUniqueName;
  s_in_db.Height:=0.5*fr1cm;
  s_in_db.Width:=2*fr1cm;
  s_in_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_db.Font.Size:=8;
  s_in_db.Left:=15.7*fr1cm;
  s_in_db.top:=0.5*fr1cm;
  s_in_db.HAlign:=haCenter;
  s_in_db.VAlign:=vaCenter;
  s_in_db.Color:= $00E4E4E4;
  s_in_db.Text:='Дебет';

  s_in_kr:=TfrxMemoView.Create(band);
  s_in_kr.CreateUniqueName;
  s_in_kr.Height:=0.5*fr1cm;
  s_in_kr.Width:=2*fr1cm;
  s_in_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_kr.Font.Size:=8;
  s_in_kr.Left:=17.7*fr1cm;
  s_in_kr.top:=0.5*fr1cm;
  s_in_kr.HAlign:=haCenter;
  s_in_kr.VAlign:=vaCenter;
  s_in_kr.Color:= $00E4E4E4;
  s_in_kr.Text:='Кредит';

  db:=TfrxMemoView.Create(band);
  db.CreateUniqueName;
  db.Height:=0.5*fr1cm;
  db.Width:=4*fr1cm;
  db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db.Font.Size:=8;
  db.Left:=19.7*fr1cm;
  db.top:=0;
  db.HAlign:=haCenter;
  db.VAlign:=vaCenter;
  db.Color:= $00E4E4E4;
  db.Text:='Рух коштів';

  db_s:=TfrxMemoView.Create(band);
  db_s.CreateUniqueName;
  db_s.Height:=0.5*fr1cm;
  db_s.Width:=2*fr1cm;
  db_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db_s.Font.Size:=8;
  db_s.Left:=19.7*fr1cm;
  db_s.top:=0.5*fr1cm;
  db_s.HAlign:=haCenter;
  db_s.VAlign:=vaCenter;
  db_s.Color:= $00E4E4E4;
  db_s.Text:='Дебет';
{
  kr:=TfrxMemoView.Create(band);
  kr.CreateUniqueName;
  kr.Height:=0.5*fr1cm;
  kr.Width:=2*fr1cm;
  kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr.Font.Size:=8;
  kr.Left:=21.7*fr1cm;
  kr.top:=0;
  kr.HAlign:=haCenter;
  kr.VAlign:=vaCenter;
  kr.Color:= $00E4E4E4;
  kr.Text:='Кредит';
}
  kr_s:=TfrxMemoView.Create(band);
  kr_s.CreateUniqueName;
  kr_s.Height:=0.5*fr1cm;
  kr_s.Width:=2*fr1cm;
  kr_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr_s.Font.Size:=8;
  kr_s.Left:=21.7*fr1cm;
  kr_s.top:=0.5*fr1cm;
  kr_s.HAlign:=haCenter;
  kr_s.VAlign:=vaCenter;
  kr_s.Color:= $00E4E4E4;
  kr_s.Text:='Кредит';

  saldo_out:=TfrxMemoView.Create(band);
  saldo_out.CreateUniqueName;
  saldo_out.Height:=0.5*fr1cm;
  saldo_out.Width:=4*fr1cm;
  saldo_out.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  saldo_out.Font.Size:=8;
  saldo_out.Left:=23.7*fr1cm;
  saldo_out.top:=0;
  saldo_out.HAlign:=haCenter;
  saldo_out.VAlign:=vaCenter;
  saldo_out.Color:= $00E4E4E4;
  saldo_out.Text:='Сальдо вихідне';

  s_out_db:=TfrxMemoView.Create(band);
  s_out_db.CreateUniqueName;
  s_out_db.Height:=0.5*fr1cm;
  s_out_db.Width:=2*fr1cm;
  s_out_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_db.Font.Size:=8;
  s_out_db.Left:=23.7*fr1cm;
  s_out_db.top:=0.5*fr1cm;
  s_out_db.HAlign:=haCenter;
  s_out_db.VAlign:=vaCenter;
  s_out_db.Color:= $00E4E4E4;
  s_out_db.Text:='Дебет';

  s_out_kr:=TfrxMemoView.Create(band);
  s_out_kr.CreateUniqueName;
  s_out_kr.Height:=0.5*fr1cm;
  s_out_kr.Width:=2*fr1cm;
  s_out_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_kr.Font.Size:=8;
  s_out_kr.Left:=25.7*fr1cm;
  s_out_kr.top:=0.5*fr1cm;
  s_out_kr.HAlign:=haCenter;
  s_out_kr.VAlign:=vaCenter;
  s_out_kr.Color:= $00E4E4E4;
  s_out_kr.Text:='Кредит';

  // верх закончили

  //верхние группы
  if IS_VALYUTA = 1 then
  begin
       val:=TfrxGroupHeader.Create(page);
       val.CreateUniqueName;
       val.top:=top_next;
       val.Height:=0.8*fr1cm;
       top_next:=val.top + val.Height;

       val.Condition:='frxDBDataset1."NAME_VAL"' ;

       val_1:=TfrxMemoView.Create(val);
       val_1.CreateUniqueName;
       val_1.Height:=0.8*fr1cm;
       val_1.Width:=3.4*fr1cm;
       val_1.Font.Size:=10;
       val_1.Left:=0;
       val_1.top:=0;
       val_1.HAlign:=haLeft;
       val_1.VAlign:=vaCenter;
       val_1.Frame.Typ:=[ftLeft];
       val_1.Text:='Валюта:';

       val_2:=TfrxMemoView.Create(val);
       val_2.CreateUniqueName;
       val_2.Height:=0.8*fr1cm;
       val_2.Width:=24.3*fr1cm;
       val_2.Font.Size:=10;
       val_2.Left:=3.4*fr1cm;;
       val_2.top:=0;
       val_2.HAlign:=haLeft;
       val_2.VAlign:=vaCenter;
       val_2.Font.Style:=[fsBold];
       val_2.Frame.Typ:=[ftRight];
       val_2.Text:='[frxDBDataset1."NAME_VAL"] ([frxDBDataset1."CODE_VAL"])';
  end;

  if fac_flag = 1 then
   begin
       fac:=TfrxGroupHeader.Create(page);
       fac.CreateUniqueName;
       fac.top:=top_next;
       fac.Height:=0.8*fr1cm;
       top_next:=fac.top + fac.Height;

       fac.Condition:='frxDBDataset1."NAME_FACUL"' ;

       fac_1:=TfrxMemoView.Create(fac);
       fac_1.CreateUniqueName;
       fac_1.Height:=0.8*fr1cm;
       fac_1.Width:=27.7*fr1cm;;
       fac_1.Font.Size:=10;
       fac_1.Left:=0;
       fac_1.top:=0;
       fac_1.HAlign:=haCenter;
       fac_1.VAlign:=vaCenter;
       fac_1.Font.Style:=[fsBold];
       fac_1.Frame.Typ:=[ftLeft,ftRight];
       fac_1.Text:='[frxDBDataset1."NAME_FACUL"]';
   end;

   if period_opl_flag = 1 then
   begin
       stage:=TfrxGroupHeader.Create(page);
       stage.CreateUniqueName;
       stage.top:=top_next;
       stage.Height:=0.8*fr1cm;
       top_next:=stage.top + stage.Height;
       stage.Condition:='frxDBDataset1."NAME_STAGE"' ;

       stage_1:=TfrxMemoView.Create(stage);
       stage_1.CreateUniqueName;
       stage_1.Height:=0.8*fr1cm;
       stage_1.Width:=3.4*fr1cm;
       stage_1.Font.Size:=10;
       stage_1.Left:=0;
       stage_1.top:=0;
       stage_1.HAlign:=haLeft;
       stage_1.VAlign:=vaCenter;
       stage_1.Frame.Typ:=[ftLeft];
       stage_1.Text:='Період оплати:';

       stage_2:=TfrxMemoView.Create(stage);
       stage_2.CreateUniqueName;
       stage_2.Height:=0.8*fr1cm;
       stage_2.Width:=24.3*fr1cm;
       stage_2.Font.Size:=10;
       stage_2.Left:=3.4*fr1cm;
       stage_2.top:=0;
       stage_2.Font.Style:=[fsBold];
       stage_2.HAlign:=haLeft;
       stage_2.VAlign:=vaCenter;
       stage_2.Frame.Typ:=[ftRight];
       stage_2.Text:='[frxDBDataset1."NAME_STAGE"]';
   end;

  if spec_flag = 1 then
   begin
       spec:=TfrxGroupHeader.Create(page);
       spec.CreateUniqueName;
       spec.top:=top_next;
       spec.Height:=0.8*fr1cm;
       top_next:=spec.top + spec.Height;
       spec.Condition:='frxDBDataset1."NAME_SPEC"' ;

       spec_1:=TfrxMemoView.Create(spec);
       spec_1.CreateUniqueName;
       spec_1.Height:=0.8*fr1cm;
       spec_1.Width:=3.4*fr1cm;
       spec_1.Font.Size:=10;
       spec_1.Left:=0;
       spec_1.top:=0;
       spec_1.HAlign:=haLeft;
       spec_1.VAlign:=vaCenter;
       spec_1.Frame.Typ:=[ftLeft];
       spec_1.Text:='Спеціальність:';

       spec_2:=TfrxMemoView.Create(spec);
       spec_2.CreateUniqueName;
       spec_2.Height:=0.8*fr1cm;
       spec_2.Width:=24.3*fr1cm;
       spec_2.Font.Size:=10;
       spec_2.Left:=3.4*fr1cm;
       spec_2.top:=0;
       spec_2.Font.Style:=[fsBold];
       spec_2.HAlign:=haLeft;
       spec_2.VAlign:=vaCenter;
       spec_2.Frame.Typ:=[ftRight];
       spec_2.Text:='[frxDBDataset1."NAME_SPEC"]';
   end;

  if nat_flag = 1 then
   begin
       nat:=TfrxGroupHeader.Create(page);
       nat.CreateUniqueName;
       nat.top:=top_next;
       nat.Height:=0.8*fr1cm;
       top_next:=nat.top + nat.Height;
       nat.Condition:='frxDBDataset1."NAME_NATIONAL"' ;

       nat_1:=TfrxMemoView.Create(nat);
       nat_1.CreateUniqueName;
       nat_1.Height:=0.8*fr1cm;
       nat_1.Width:=3.4*fr1cm;
       nat_1.Font.Size:=10;
       nat_1.Left:=0;
       nat_1.top:=0;
       nat_1.HAlign:=haLeft;
       nat_1.VAlign:=vaCenter;
       nat_1.Frame.Typ:=[ftLeft];
       nat_1.Text:='Громадянство:';

       nat_2:=TfrxMemoView.Create(nat);
       nat_2.CreateUniqueName;
       nat_2.Height:=0.8*fr1cm;
       nat_2.Width:=24.3*fr1cm;
       nat_2.Font.Size:=10;
       nat_2.Left:=3.4*fr1cm;
       nat_2.top:=0;
       nat_2.Font.Style:=[fsBold];
       nat_2.HAlign:=haLeft;
       nat_2.VAlign:=vaCenter;
       nat_2.Frame.Typ:=[ftRight];
       nat_2.Text:='[frxDBDataset1."NAME_NATIONAL"]';
   end;

  if f_stud_flag = 1 then
   begin
       f_st:=TfrxGroupHeader.Create(page);
       f_st.CreateUniqueName;
       f_st.top:=top_next;
       f_st.Height:=0.8*fr1cm;
       top_next:=f_st.top + f_st.Height;
       f_st.Condition:='frxDBDataset1."NAME_FORM_STUD"' ;

       f_st_1:=TfrxMemoView.Create(f_st);
       f_st_1.CreateUniqueName;
       f_st_1.Height:=0.8*fr1cm;
       f_st_1.Width:=3.4*fr1cm;
       f_st_1.Font.Size:=10;
       f_st_1.Left:=0;
       f_st_1.top:=0;
       f_st_1.HAlign:=haLeft;
       f_st_1.VAlign:=vaCenter;
       f_st_1.Frame.Typ:=[ftLeft];
       f_st_1.Text:='Форма навчання:';

       f_st_2:=TfrxMemoView.Create(f_st);
       f_st_2.CreateUniqueName;
       f_st_2.Height:=0.8*fr1cm;
       f_st_2.Width:=24.3*fr1cm;
       f_st_2.Font.Size:=10;
       f_st_2.Left:=3.4*fr1cm;
       f_st_2.top:=0;
       f_st_2.Font.Style:=[fsBold];
       f_st_2.HAlign:=haLeft;
       f_st_2.VAlign:=vaCenter;
       f_st_2.Frame.Typ:=[ftRight];
       f_st_2.Text:='[frxDBDataset1."NAME_FORM_STUD"]';
   end;

  if k_stud_flag = 1 then
   begin
       k_st:=TfrxGroupHeader.Create(page);
       k_st.CreateUniqueName;
       k_st.top:=top_next;
       k_st.Height:=0.8*fr1cm;
       top_next:=k_st.top + k_st.Height;
       k_st.Condition:='frxDBDataset1."NAME_KAT_STUD"' ;

       k_st_1:=TfrxMemoView.Create(k_st);
       k_st_1.CreateUniqueName;
       k_st_1.Height:=0.8*fr1cm;
       k_st_1.Width:=3.4*fr1cm;
       k_st_1.Font.Size:=10;
       k_st_1.Left:=0;
       k_st_1.top:=0;
       k_st_1.HAlign:=haLeft;
       k_st_1.VAlign:=vaCenter;
       k_st_1.Frame.Typ:=[ftLeft];
       k_st_1.Text:='Категорія навчання:';

       k_st_2:=TfrxMemoView.Create(k_st);
       k_st_2.CreateUniqueName;
       k_st_2.Height:=0.8*fr1cm;
       k_st_2.Width:=24.3*fr1cm;
       k_st_2.Font.Size:=10;
       k_st_2.Left:=3.4*fr1cm;
       k_st_2.top:=0;
       k_st_2.Font.Style:=[fsBold];
       k_st_2.HAlign:=haLeft;
       k_st_2.VAlign:=vaCenter;
       k_st_2.Frame.Typ:=[ftRight];
       k_st_2.Text:='[frxDBDataset1."NAME_KAT_STUD"]';
   end;

  if kurs_flag = 1 then
   begin
       kurs:=TfrxGroupHeader.Create(page);
       kurs.CreateUniqueName;
       kurs.top:=top_next;
       kurs.Height:=0.8*fr1cm;
       top_next:=kurs.top + kurs.Height;
       kurs.Condition:='frxDBDataset1."KURS"' ;

       kurs_1:=TfrxMemoView.Create(kurs);
       kurs_1.CreateUniqueName;
       kurs_1.Height:=0.8*fr1cm;
       kurs_1.Width:=3.4*fr1cm;
       kurs_1.Font.Size:=10;
       kurs_1.Left:=0;
       kurs_1.top:=0;
       kurs_1.HAlign:=haLeft;
       kurs_1.VAlign:=vaCenter;
       kurs_1.Frame.Typ:=[ftLeft];
       kurs_1.Text:='Курс:';

       kurs_2:=TfrxMemoView.Create(kurs);
       kurs_2.CreateUniqueName;
       kurs_2.Height:=0.8*fr1cm;
       kurs_2.Width:=24.3*fr1cm;
       kurs_2.Font.Size:=10;
       kurs_2.Left:=3.4*fr1cm;
       kurs_2.top:=0;
       kurs_2.Font.Style:=[fsBold];
       kurs_2.HAlign:=haLeft;
       kurs_2.VAlign:=vaCenter;
       kurs_2.Frame.Typ:=[ftRight];
       kurs_2.Text:='[frxDBDataset1."KURS"]';
   end;

  if n_gr_flag = 1 then
   begin
       n_gr:=TfrxGroupHeader.Create(page);
       n_gr.CreateUniqueName;
       n_gr.top:=top_next;
       n_gr.Height:=0.8*fr1cm;
       top_next:=n_gr.top + n_gr.Height;
       n_gr.Condition:='frxDBDataset1."NAME_GROUP"' ;

       n_gr_1:=TfrxMemoView.Create(n_gr);
       n_gr_1.CreateUniqueName;
       n_gr_1.Height:=0.8*fr1cm;
       n_gr_1.Width:=3.4*fr1cm;
       n_gr_1.Font.Size:=10;
       n_gr_1.Left:=0;
       n_gr_1.top:=0;
       n_gr_1.HAlign:=haLeft;
       n_gr_1.VAlign:=vaCenter;
       n_gr_1.Frame.Typ:=[ftLeft];
       n_gr_1.Text:='Група:';

       n_gr_2:=TfrxMemoView.Create(n_gr);
       n_gr_2.CreateUniqueName;
       n_gr_2.Height:=0.8*fr1cm;
       n_gr_2.Width:=24.3*fr1cm;
       n_gr_2.Font.Size:=10;
       n_gr_2.Left:=3.4*fr1cm;
       n_gr_2.top:=0;
       n_gr_2.Font.Style:=[fsBold];
       n_gr_2.HAlign:=haLeft;
       n_gr_2.VAlign:=vaCenter;
       n_gr_2.Frame.Typ:=[ftRight];
       n_gr_2.Text:='[frxDBDataset1."NAME_GROUP"]';
   end;
   //мастер дата

  DataBand:=TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.DataSet:=frxDBDataSet1;
  DAtaBand.Top:=top_next;
  DataBand.Height:=0.5*fr1cm;
  top_next:=DataBand.Top+DataBand.Height;
  DAtaBand.Stretched:=True;
  if druk_pid = True then DataBand.Visible := False;

  memo_num:=TfrxMemoView.Create(DataBand);
  memo_num.CreateUniqueName;
  memo_num.Height:=0.5*fr1cm;
  memo_num.Width:=1*fr1cm;
  memo_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_num.Font.Size:=8;
  memo_num.Left:=0*fr1cm;
  memo_num.top:=0;
  memo_num.Text:='[Line]';
  memo_num.StretchMode:=smMaxHeight;
  memo_num.VAlign:=vaCenter;
  memo_num.HAlign:=haRight;

  Memo_PIB:=TfrxMemoView.Create(DataBand);
  Memo_PIB.CreateUniqueName;
  Memo_PIB.Height:=0.5*fr1cm;
  Memo_PIB.Width:=10.3*fr1cm;
  Memo_PIB.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_PIB.Font.Size:=8;
  Memo_PIB.Left:=1*fr1cm;
  memo_PIB.top:=0;
  if print_num_dog = True then
  Memo_PIB.Text:='[frxDBDataset1."FIO"] ([frxDBDataset1."NUM_DOG"])'
  else Memo_PIB.Text:='[frxDBDataset1."FIO"]';
  Memo_PIB.StretchMode:=smMaxHeight;
  Memo_PIB.VAlign:=vaCenter;

  Memo_sm:=TfrxMemoView.Create(DataBand);
  Memo_sm.CreateUniqueName;
  Memo_sm.Height:=0.5*fr1cm;
  Memo_sm.Width:=1.03*fr1cm;
  Memo_sm.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_sm.Font.Size:=8;
  Memo_sm.Left:=11.29*fr1cm;
  Memo_sm.top:=0;
  Memo_sm.HAlign:=haCenter;
  Memo_sm.Text:='[frxDBDataset1."SM_KOD"]';
  Memo_sm.StretchMode:=smMaxHeight;
  Memo_sm.VAlign:=vaCenter;

  Memo_rz:=TfrxMemoView.Create(DataBand);
  Memo_rz.CreateUniqueName;
  Memo_rz.Height:=0.5*fr1cm;
  Memo_rz.Width:=1.14*fr1cm;
  Memo_rz.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_rz.Font.Size:=8;
  Memo_rz.Left:=12.32*fr1cm;
  Memo_rz.top:=0;
  Memo_rz.HAlign:=haCenter;
  Memo_rz.Text:='[frxDBDataset1."RZ_KOD"]';
  Memo_rz.StretchMode:=smMaxHeight;
  Memo_rz.VAlign:=vaCenter;

  Memo_st:=TfrxMemoView.Create(DataBand);
  Memo_st.CreateUniqueName;
  Memo_st.Height:=0.5*fr1cm;
  Memo_st.Width:=1.22*fr1cm;
  Memo_st.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_st.Font.Size:=8;
  Memo_st.Left:=13.46*fr1cm;
  Memo_st.top:=0;
  Memo_st.HAlign:=haCenter;
  Memo_st.Text:='[frxDBDataset1."ST_KOD"]';
  Memo_st.StretchMode:=smMaxHeight;
  Memo_st.VAlign:=vaCenter;

  Memo_kekv:=TfrxMemoView.Create(DataBand);
  Memo_kekv.CreateUniqueName;
  Memo_kekv.Height:=0.5*fr1cm;
  Memo_kekv.Width:=1.02*fr1cm;
  Memo_kekv.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_kekv.Font.Size:=8;
  Memo_kekv.Left:=14.68*fr1cm;
  Memo_kekv.top:=0;
  Memo_kekv.HAlign:=haCenter;
  Memo_kekv.Text:='[frxDBDataset1."KEKV_KOD"]';
  Memo_kekv.StretchMode:=smMaxHeight;
  Memo_kekv.VAlign:=vaCenter;

  s_in_db:=TfrxMemoView.Create(DataBand);
  s_in_db.CreateUniqueName;
  s_in_db.Height:=0.5*fr1cm;;
  s_in_db.Width:=2*fr1cm;
  s_in_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_db.Font.Size:=8;
  s_in_db.Left:=15.7*fr1cm;
  s_in_db.top:=0;
  s_in_db.HAlign:=haRight;
  s_in_db.DisplayFormat.Kind:=fkNumeric;
  s_in_db.DisplayFormat.FormatStr:='%2.2n';
  if IS_VALYUTA =1 then
  s_in_db.Text:='[frxDBDataset1."IN_DB_SUMMA"]'+#13+#10 + '[frxDBDataset1."IN_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  s_in_db.Text:='[frxDBDataset1."IN_DB_SUMMA"]';
  s_in_db.StretchMode:=smMaxHeight;
  s_in_db.VAlign:=vaCenter;

  s_in_kr:=TfrxMemoView.Create(DataBand);
  s_in_kr.CreateUniqueName;
  s_in_kr.Height:=0.5*fr1cm;;
  s_in_kr.Width:=2*fr1cm;
  s_in_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_kr.Font.Size:=8;
  s_in_kr.Left:=17.7*fr1cm;
  s_in_kr.top:=0;
  s_in_kr.HAlign:=haRight;
  s_in_kr.DisplayFormat.Kind:=fkNumeric;
  s_in_kr.DisplayFormat.FormatStr:='%2.2n';
  if IS_VALYUTA =1 then
  s_in_kr.Text:='[frxDBDataset1."IN_KR_SUMMA"]'+#13+#10 + '[frxDBDataset1."IN_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  s_in_kr.Text:='[frxDBDataset1."IN_KR_SUMMA"]';
  s_in_kr.StretchMode:=smMaxHeight;
  s_in_kr.VAlign:=vaCenter;

  db_s:=TfrxMemoView.Create(DataBand);
  db_s.CreateUniqueName;
  db_s.Height:=0.5*fr1cm;
  db_s.Width:=2*fr1cm;
  db_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db_s.Font.Size:=8;
  db_s.Left:=19.7*fr1cm;
  db_s.top:=0;
  db_s.HAlign:=haRight;
  db_s.DisplayFormat.Kind:=fkNumeric;
  db_s.DisplayFormat.FormatStr:='%2.2n';
  if IS_VALYUTA =1 then
  db_s.Text:='[frxDBDataset1."DB_SUMMA"]'+#13+#10 + '[frxDBDataset1."DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  db_s.Text:='[frxDBDataset1."DB_SUMMA"]';
  db_s.StretchMode:=smMaxHeight;
  db_s.VAlign:=vaCenter;

  kr_s:=TfrxMemoView.Create(DataBand);
  kr_s.CreateUniqueName;
  kr_s.Height:=0.5*fr1cm;
  kr_s.Width:=2*fr1cm;
  kr_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr_s.Font.Size:=8;
  kr_s.Left:=21.7*fr1cm;
  kr_s.top:=0;
  kr_s.HAlign:=haRight;
  kr_s.DisplayFormat.Kind:=fkNumeric;
  kr_s.DisplayFormat.FormatStr:='%2.2n';
  if IS_VALYUTA =1 then
  kr_s.Text:='[frxDBDataset1."KR_SUMMA"]'+#13+#10 + '[frxDBDataset1."KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  kr_s.Text:='[frxDBDataset1."KR_SUMMA"]';
  kr_s.StretchMode:=smMaxHeight;
  kr_s.VAlign:=vaCenter;

  s_out_db:=TfrxMemoView.Create(DataBand);
  s_out_db.CreateUniqueName;
  s_out_db.Height:=0.5*fr1cm;
  s_out_db.Width:=2*fr1cm;
  s_out_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_db.Font.Size:=8;
  s_out_db.Left:=23.7*fr1cm;
  s_out_db.top:=0;
  s_out_db.HAlign:=haRight;
  s_out_db.DisplayFormat.Kind:=fkNumeric;
  s_out_db.DisplayFormat.FormatStr:='%2.2n';
  if IS_VALYUTA =1 then
  s_out_db.Text:='[frxDBDataset1."OUT_DB_SUMMA"]'+#13+#10 + '[frxDBDataset1."OUT_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  s_out_db.Text:='[frxDBDataset1."OUT_DB_SUMMA"]';
  s_out_db.StretchMode:=smMaxHeight;
  s_out_db.VAlign:=vaCenter;

  s_out_kr:=TfrxMemoView.Create(DataBand);
  s_out_kr.CreateUniqueName;
  s_out_kr.Height:=0.5*fr1cm;
  s_out_kr.Width:=2*fr1cm;
  s_out_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_kr.Font.Size:=8;
  s_out_kr.Left:=25.7*fr1cm;
  s_out_kr.top:=0;
  s_out_kr.HAlign:=haRight;
  s_out_kr.DisplayFormat.Kind:=fkNumeric;
  s_out_kr.DisplayFormat.FormatStr:='%2.2n';
  if IS_VALYUTA =1 then
  s_out_kr.Text:='[frxDBDataset1."OUT_KR_SUMMA"]'+#13+#10 + '[frxDBDataset1."OUT_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  s_out_kr.Text:='[frxDBDataset1."OUT_KR_SUMMA"]';
  s_out_kr.StretchMode:=smMaxHeight;
  s_out_kr.VAlign:=vaCenter;

  // нижние группы
  if n_gr_flag = 1 then
   begin
      n_gr_f:=TfrxGroupFooter.Create(page);
      n_gr_f.CreateUniqueName;
      n_gr_f.top:=top_next;
      n_gr_f.Height:=0.8*fr1cm;
      top_next:=n_gr_f.Top+n_gr_f.Height;
      n_gr_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(n_gr_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по групі: ';
      Memo1.Height:=n_gr_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3.4*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(n_gr_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_GROUP"]';
      Memo2.Height:=n_gr_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=12.3*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(n_gr_f);
      Memo3.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=n_gr_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(n_gr_f);
      Memo4.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=n_gr_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(n_gr_f);
      Memo5.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=n_gr_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(n_gr_f);
      Memo6.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=n_gr_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(n_gr_f);
      Memo7.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=n_gr_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(n_gr_f);
      Memo8.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=n_gr_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if kurs_flag = 1 then
   begin
      kurs_f:=TfrxGroupFooter.Create(page);
      kurs_f.CreateUniqueName;
      kurs_f.top:=top_next;
      kurs_f.Height:=0.8*fr1cm;
      top_next:=kurs_f.Top+kurs_f.Height;
      kurs_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(kurs_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по курсу: ';
      Memo1.Height:=kurs_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3.4*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(kurs_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."KURS"]';
      Memo2.Height:=kurs_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=12.3*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(kurs_f);
      Memo3.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=kurs_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(kurs_f);
      Memo4.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=kurs_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(kurs_f);
      Memo5.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=kurs_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(kurs_f);
      Memo6.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=kurs_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(kurs_f);
      Memo7.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=kurs_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(kurs_f);
      Memo8.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=kurs_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;

   end;

  if k_stud_flag = 1 then
   begin
      k_st_f:=TfrxGroupFooter.Create(page);
      k_st_f.CreateUniqueName;
      k_st_f.top:=top_next;
      k_st_f.Height:=0.8*fr1cm;
      top_next:=k_st_f.Top+k_st_f.Height;
      k_st_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(k_st_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по категорії навчання: ';
      Memo1.Height:=k_st_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3.4*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(k_st_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_KAT_STUD"]';
      Memo2.Height:=k_st_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=12.3*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(k_st_f);
      Memo3.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=k_st_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(k_st_f);
      Memo4.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=k_st_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(k_st_f);
      Memo5.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=k_st_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(k_st_f);
      Memo6.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=k_st_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(k_st_f);
      Memo7.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=k_st_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(k_st_f);
      Memo8.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=k_st_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if f_stud_flag = 1 then
   begin
      f_st_f:=TfrxGroupFooter.Create(page);
      f_st_f.CreateUniqueName;
      f_st_f.top:=top_next;
      f_st_f.Height:=0.8*fr1cm;
      top_next:=f_st_f.Top+f_st_f.Height;
      f_st_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(f_st_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по формі навчання: ';
      Memo1.Height:=f_st_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3.4*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(f_st_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_FORM_STUD"]';
      Memo2.Height:=f_st_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=12.3*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.Font.Style:=[fsBold];
      Memo2.VAlign:=vaCenter;
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(f_st_f);
      Memo3.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=f_st_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(f_st_f);
      Memo4.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=f_st_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(f_st_f);
      Memo5.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=f_st_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(f_st_f);
      Memo6.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo7.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=f_st_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(f_st_f);
      Memo7.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=f_st_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(f_st_f);
      Memo8.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=f_st_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if nat_flag = 1 then
   begin
      nat_f:=TfrxGroupFooter.Create(page);
      nat_f.CreateUniqueName;
      nat_f.top:=top_next;
      nat_f.Height:=0.8*fr1cm;
      top_next:=nat_f.Top+nat_f.Height;
      nat_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(nat_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по національності: ';
      Memo1.Height:=nat_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3.4*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(nat_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_NATIONAL"]';
      Memo2.Height:=nat_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=12.3*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.Font.Style:=[fsBold];
      Memo2.VAlign:=vaCenter;
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(nat_f);
      Memo3.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=nat_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(nat_f);
      Memo4.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=nat_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(nat_f);
      Memo5.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=nat_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(nat_f);
      Memo6.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=nat_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(nat_f);
      Memo7.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=nat_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(nat_f);
      Memo8.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=nat_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if spec_flag = 1 then
   begin
      spec_f:=TfrxGroupFooter.Create(page);
      spec_f.CreateUniqueName;
      spec_f.top:=top_next;
      spec_f.Height:=0.8*fr1cm;
      top_next:=spec_f.Top+spec_f.Height;
      spec_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(spec_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по спеціальності: ';
      Memo1.Height:=spec_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3.4*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(spec_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_SPEC"]';
      Memo2.Height:=spec_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=12.3*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(spec_f);
      Memo3.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=spec_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(spec_f);
      Memo4.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=spec_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(spec_f);
      Memo5.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=spec_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(spec_f);
      Memo6.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=spec_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(spec_f);
      Memo7.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=spec_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(spec_f);
      Memo8.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=spec_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if period_opl_flag = 1 then
   begin
      stage_f:=TfrxGroupFooter.Create(page);
      stage_f.CreateUniqueName;
      stage_f.top:=top_next;
      stage_f.Height:=0.8*fr1cm;
      top_next:=stage_f.Top+stage_f.Height;
      stage_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(stage_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по періоду оплати: ';
      Memo1.Height:=stage_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3.4*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(stage_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_STAGE"]';
      Memo2.Height:=stage_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=12.3*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(stage_f);
      Memo3.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=stage_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(stage_f);
      Memo4.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=stage_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(stage_f);
      Memo5.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=stage_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(stage_f);
      Memo6.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=stage_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(stage_f);
      Memo7.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=stage_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(stage_f);
      Memo8.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=stage_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if fac_flag = 1 then
   begin
      fac_f:=TfrxGroupFooter.Create(page);
      fac_f.CreateUniqueName;
      fac_f.top:=top_next;
      fac_f.Height:=0.8*fr1cm;
      top_next:=fac_f.Top+fac_f.Height;
      fac_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(fac_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по факультету: ';
      Memo1.Height:=fac_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3.4*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(fac_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_FACUL"]';
      Memo2.Height:=fac_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=12.3*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(fac_f);
      Memo3.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=fac_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(fac_f);
      Memo4.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=fac_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(fac_f);
      Memo5.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=fac_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(fac_f);
      Memo6.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=fac_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(fac_f);
      Memo7.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=fac_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(fac_f);
      Memo8.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=fac_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.HAlign:=haRight;
      Memo8.VAlign:=vaCenter;
      Memo8.StretchMode:=smMaxHeight;
   end;
   if is_valyuta =1 then
   begin
      val_f:=TfrxGroupFooter.Create(page);
      val_f.CreateUniqueName;
      val_f.top:=top_next;
      val_f.Height:=0.8*fr1cm;
      top_next:=val_f.Top+val_f.Height;
      val_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(val_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по валюті: ';
      Memo1.Height:=val_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3.4*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(val_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."CODE_VAL"]';
      Memo2.Height:=val_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=12.3*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(val_f);
      Memo3.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=val_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(val_f);
      Memo4.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=val_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(val_f);
      Memo5.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=val_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(val_f);
      Memo6.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=val_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(val_f);
      Memo7.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=val_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(val_f);
      Memo8.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=val_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.HAlign:=haRight;
      Memo8.VAlign:=vaCenter;
      Memo8.StretchMode:=smMaxHeight;
   end;
    //page_foter
   page_footer:=TfrxPageFooter.Create(page);
   page_footer.CreateUniqueName;
   page_footer.top:=top_next;
   page_footer.Height:=0.8*fr1cm;
   top_next:=page_footer.top + page_footer.Height;

   date_print:=TfrxMemoView.Create(page_footer);
   date_print.CreateUniqueName;
   date_print.Text:='Дата друку: [Now]';
   date_print.Height:=page_footer.Height;
   date_print.Left:=0;
   date_print.Font.Size:=8;
   date_print.Width:=5.4*fr1cm;
   date_print.VAlign:=vaCenter;
//   date_print.StretchMode:=smMaxHeight;

   page_print:=TfrxMemoView.Create(page_footer);
   page_print.CreateUniqueName;
   page_print.Text:='Стор. [Page#] із [TotalPages#]';
   page_print.Height:=page_footer.Height;
   page_print.Left:=13.6*fr1cm;
   page_print.Font.Size:=8;
   page_print.Width:=5.4*fr1cm;
   page_print.VAlign:=vaCenter;
 //  page_print.StretchMode:=smMaxHeight;
  //report summary
  band_footer:=TfrxReportSummary.Create(page);
  band_footer.CreateUniqueName;
  band_footer.top:=top_next;
  band_footer.Height:=2.7*fr1cm;
  h_memo:=0.8*fr1cm;
  top_next:=band_footer.top + band_footer.Height;
  //height:=band.Height;
      Memo_1:=TfrxMemoView.Create(band_footer);
      Memo_1.CreateUniqueName;
      Memo_1.Text:='Всього: ';
      Memo_1.Height:=h_memo;
      Memo_1.Top:=0;
      memo_1.Left:=0;
      Memo_1.Font.Size:=8;
      Memo_1.Width:=15.7*fr1cm;
      Memo_1.VAlign:=vaCenter;
      Memo_1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
//      Memo_1.StretchMode:=smMaxHeight;
      Memo_1.Font.Style:=[fsBold];

      Memo_3:=TfrxMemoView.Create(band_footer);
      Memo_3.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo_3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo_3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo_3.Height:=h_memo;
      memo_3.Left:=Memo_1.Width;
      Memo_3.Font.Size:=8;
      Memo_3.Width:=2*fr1cm;
      Memo_3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_3.DisplayFormat.Kind:=fkNumeric;
      Memo_3.DisplayFormat.FormatStr:='%2.2n';
      Memo_3.VAlign:=vaCenter;
      Memo_3.HAlign:=haRight;
//      Memo_3.StretchMode:=smMaxHeight;
      Memo_3.Font.Style:=[fsBold];
      Memo_3.Top:=0;

      Memo_4:=TfrxMemoView.Create(band_footer);
      Memo_4.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo_4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo_4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo_4.Height:=h_memo;
      memo_4.Left:=Memo_1.Width+Memo_3.Width;
      Memo_4.Font.Size:=8;
      Memo_4.Width:=2*fr1cm;
      Memo_4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_4.DisplayFormat.Kind:=fkNumeric;
      Memo_4.DisplayFormat.FormatStr:='%2.2n';
      Memo_4.VAlign:=vaCenter;
      Memo_4.HAlign:=haRight;
//      Memo_4.StretchMode:=smMaxHeight;
      Memo_4.Font.Style:=[fsBold];
      Memo_4.Top:=0;

      Memo_5:=TfrxMemoView.Create(band_footer);
      Memo_5.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo_5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo_5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo_5.Height:=h_memo;
      memo_5.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width;
      Memo_5.Font.Size:=8;
      Memo_5.Width:=2*fr1cm;
      Memo_5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_5.DisplayFormat.Kind:=fkNumeric;
      Memo_5.DisplayFormat.FormatStr:='%2.2n';
      Memo_5.VAlign:=vaCenter;
      Memo_5.HAlign:=haRight;
//      Memo_5.StretchMode:=smMaxHeight;
      Memo_5.Font.Style:=[fsBold];
      Memo_5.Top:=0;

      Memo_6:=TfrxMemoView.Create(band_footer);
      Memo_6.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo_6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo_6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo_6.Height:=h_memo;
      memo_6.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width+Memo_5.Width;
      Memo_6.Font.Size:=8;
      Memo_6.Width:=2*fr1cm;
      Memo_6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_6.DisplayFormat.Kind:=fkNumeric;
      Memo_6.DisplayFormat.FormatStr:='%2.2n';
      Memo_6.VAlign:=vaCenter;
      Memo_6.HAlign:=haRight;
//      Memo_6.StretchMode:=smMaxHeight;
      Memo_6.Font.Style:=[fsBold];
      Memo_6.Top:=0;

      Memo_7:=TfrxMemoView.Create(band_footer);
      Memo_7.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo_7.Text:='[SUM(<frxDBDataset1."OUT_Db_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo_7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo_7.Height:=h_memo;
      memo_7.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width+Memo_5.Width+Memo_6.Width;
      Memo_7.Font.Size:=8;
      Memo_7.Width:=2*fr1cm;
      Memo_7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_7.DisplayFormat.Kind:=fkNumeric;
      Memo_7.DisplayFormat.FormatStr:='%2.2n';
      Memo_7.VAlign:=vaCenter;
      Memo_7.HAlign:=haRight;
//      Memo_7.StretchMode:=smMaxHeight;
      Memo_7.Font.Style:=[fsBold];
      Memo_7.Top:=0;

      Memo_8:=TfrxMemoView.Create(band_footer);
      Memo_8.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo_8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo_8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo_8.Height:=h_memo;
      memo_8.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width+Memo_5.Width+Memo_6.Width+Memo_7.Width;
      Memo_8.Font.Size:=8;
      Memo_8.Width:=2*fr1cm;
      Memo_8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_8.DisplayFormat.Kind:=fkNumeric;
      Memo_8.DisplayFormat.FormatStr:='%2.2n';
      Memo_8.HAlign:=haRight;
      Memo_8.VAlign:=vaCenter;
//      Memo_8.StretchMode:=smMaxHeight;
      Memo_8.Font.Style:=[fsBold];
      Memo_8.Top:=0;

      memo_vik:=TfrxMemoView.Create(band_footer);
      memo_vik.CreateUniqueName;
      memo_vik.Text:='Виконавець';
      memo_vik.Height:=0.8*fr1cm;
      memo_vik.top:=1.1*fr1cm;
      memo_vik.Left:=1*fr1cm;
      memo_vik.Font.Size:=8;
      memo_vik.Width:=2*fr1cm;
      memo_vik.HAlign:=haLeft;
      memo_vik.VAlign:=vaCenter;
//      memo_vik.StretchMode:=smMaxHeight;
      if NOT_PRINT_FIO_ISPOLN=1 then  memo_vik.Visible:=False;

      memo_vik_underline:=TfrxMemoView.Create(band_footer);
      memo_vik_underline.CreateUniqueName;
      memo_vik_underline.Text:='';
      memo_vik_underline.Height:=0.8*fr1cm;
      memo_vik_underline.top:=1.1*fr1cm;
      memo_vik_underline.Left:=3*fr1cm;
      memo_vik_underline.Font.Size:=8;
      memo_vik_underline.Width:=6.3*fr1cm;
      memo_vik_underline.Frame.Typ:=[ftBottom];
      memo_vik_underline.HAlign:=haLeft;
      memo_vik_underline.VAlign:=vaCenter;
      if NOT_PRINT_FIO_ISPOLN=1 then  memo_vik_underline.Visible:=False;
//      memo_vik_underline.StretchMode:=smMaxHeight;

      memo_user:=TfrxMemoView.Create(band_footer);
      memo_user.CreateUniqueName;
      memo_user.Text:='/'+USER_FIO+'/';
      memo_user.Height:=0.8*fr1cm;
      memo_user.top:=1.1*fr1cm;
      memo_user.Left:=9.3*fr1cm;
      memo_user.Font.Size:=8;
      memo_user.Width:=9.6*fr1cm;
      memo_user.HAlign:=haLeft;
      memo_user.VAlign:=vaCenter;
      if NOT_PRINT_FIO_ISPOLN=1 then  memo_user.Visible:=False;
//      memo_user.StretchMode:=smMaxHeight;
end;

if FORM_UCH = 19 then
begin
  frReport.Clear;                         //создаем страницу отчета
  frReport.DataSets.Add(frxDBDataset1);
//  Page:=frReport.Pages[0] as TfrxReportPage;
  page:=TfrxReportPage.Create(frReport);
  page.CreateUniqueName;
  page.SetDefaults;
  page.Orientation:=poLandscape;

  band_head:=TfrxReportTitle.Create(page);
  band_head.Top:=0;
  band_head.Height:=4.2*fr1cm;
  top_next:=band_head.top + band_head.Height;

  memo_name:=TfrxMemoView.Create(band_head);
  memo_name.CreateUniqueName;
  memo_name.Height:=0.4*fr1cm;
  memo_name.Width:=10.8*fr1cm;
  memo_name.Frame.Typ:=[ftBottom];
  memo_name.Font.Size:=8;
  memo_name.Left:=0*fr1cm;
  memo_name.top:=0.2*fr1cm;
  memo_name.HAlign:=haCenter;
  memo_name.VAlign:=vaCenter;
  memo_name.Text:=ORG_FULL_NAME;
  memo_name.Font.Style:=[fsBold];

  memo_inn:=TfrxMemoView.Create(band_head);
  memo_inn.CreateUniqueName;
  memo_inn.Height:=0.8*fr1cm;
  memo_inn.Width:=2.5*fr1cm;
  memo_inn.Font.Size:=8;
  memo_inn.Left:=0*fr1cm;
  memo_inn.top:=0.6*fr1cm;
  memo_inn.HAlign:=haCenter;
  memo_inn.VAlign:=vaCenter;
  memo_inn.Text:='Ідентифікаційний код ЄДРПОУ';

  memo_inn_num:=TfrxMemoView.Create(band_head);
  memo_inn_num.CreateUniqueName;
  memo_inn_num.Height:=0.5*fr1cm;
  memo_inn_num.Width:=3*fr1cm;
  memo_inn_num.Font.Size:=8;
  memo_inn_num.Left:=2.6*fr1cm;
  memo_inn_num.top:=0.8*fr1cm;
  memo_inn_num.HAlign:=haCenter;
  memo_inn_num.VAlign:=vaCenter;
  memo_inn_num.Text:=ORG_KOD_OKPO;
  memo_inn_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  memo_period:=TfrxMemoView.Create(band_head);
  memo_period.CreateUniqueName;
  memo_period.Height:=1.3*fr1cm;
  memo_period.Width:=27*fr1cm;
  memo_period.Font.Size:=14;
  memo_period.Left:=0*fr1cm;
  memo_period.top:=1.8*fr1cm;
  memo_period.HAlign:=haCenter;
  memo_period.VAlign:=vaCenter;
  memo_period.Text:='Звіт за період з '+DatetoStr(StartOfAMonth(y_beg, m_beg))+' по '+Datetostr(EndOfAMonth(y_end, m_end));
  memo_period.Font.Style:=[fsBold];

  sch_for_sysytem:=TfrxMemoView.Create(band_head);
  sch_for_sysytem.CreateUniqueName;
  sch_for_sysytem.Height:=1*fr1cm;
  sch_for_sysytem.Width:=27*fr1cm;
  sch_for_sysytem.Font.Size:=10;
  sch_for_sysytem.Left:=0*fr1cm;
  sch_for_sysytem.top:=3.1*fr1cm;
  sch_for_sysytem.HAlign:=haCenter;
  sch_for_sysytem.VAlign:=vaCenter;
  sch_for_sysytem.Text:='Рахунки системи: '+ SCH_SYSTEM;

  band:=TfrxPageHeader.Create(page);      //"верхушка" очета
  band.CreateUniqueName;
  band.top:=top_next;
  band.Height:=1*fr1cm;
  top_next:=band.top + band.Height;
  //height:=band.Height;
  memo_num:=TfrxMemoView.Create(band);
  memo_num.CreateUniqueName;
  memo_num.Height:=1*fr1cm;
  memo_num.Width:=1*fr1cm;
  memo_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_num.Font.Size:=8;
  memo_num.Left:=0*fr1cm;
  memo_num.top:=0;
  memo_num.HAlign:=haCenter;
  memo_num.VAlign:=vaCenter;
  memo_num.Color:= $00E4E4E4;
  memo_num.Text:='№ п/п';

  Memo_PIB:=TfrxMemoView.Create(band);
  Memo_PIB.CreateUniqueName;
  Memo_PIB.Height:=1*fr1cm;
  Memo_PIB.Width:=10.3*fr1cm;
  Memo_PIB.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_PIB.Font.Size:=8;
  Memo_PIB.Left:=1*fr1cm;
  memo_PIB.top:=0;
  Memo_PIB.HAlign:=haCenter;
  Memo_PIB.VAlign:=vaCenter;
  Memo_PIB.Color:= $00E4E4E4;
  Memo_PIB.Text:='ПІБ';

  Memo_Ist:=TfrxMemoView.Create(band);
  Memo_Ist.CreateUniqueName;
  Memo_Ist.Height:=0.5*fr1cm;
  Memo_Ist.Width:=4.4*fr1cm;
  Memo_Ist.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_Ist.Font.Size:=8;
  Memo_Ist.Left:=11.29*fr1cm;
  memo_Ist.top:=0;
  Memo_Ist.HAlign:=haCenter;
  Memo_Ist.VAlign:=vaCenter;
  Memo_Ist.Color:= $00E4E4E4;
  Memo_Ist.Text:='Джерела фінансування';

  Memo_sm:=TfrxMemoView.Create(band);
  Memo_sm.CreateUniqueName;
  Memo_sm.Height:=0.5*fr1cm;
  Memo_sm.Width:=1.03*fr1cm;
  Memo_sm.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_sm.Font.Size:=8;
  Memo_sm.Left:=11.29*fr1cm;
  Memo_sm.top:=0.5*fr1cm;
  Memo_sm.HAlign:=haCenter;
  Memo_sm.VAlign:=vaCenter;
  Memo_sm.Color:= $00E4E4E4;
  Memo_sm.Text:='Кошт.';

  Memo_rz:=TfrxMemoView.Create(band);
  Memo_rz.CreateUniqueName;
  Memo_rz.Height:=0.5*fr1cm;
  Memo_rz.Width:=1.14*fr1cm;
  Memo_rz.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_rz.Font.Size:=8;
  Memo_rz.Left:=12.32*fr1cm;
  Memo_rz.top:=0.5*fr1cm;
  Memo_rz.HAlign:=haCenter;
  Memo_rz.VAlign:=vaCenter;
  Memo_rz.Color:= $00E4E4E4;
  Memo_rz.Text:='Розділ';

  Memo_st:=TfrxMemoView.Create(band);
  Memo_st.CreateUniqueName;
  Memo_st.Height:=0.5*fr1cm;
  Memo_st.Width:=1.22*fr1cm;
  Memo_st.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_st.Font.Size:=8;
  Memo_st.Left:=13.46*fr1cm;
  Memo_st.top:=0.5*fr1cm;
  Memo_st.HAlign:=haCenter;
  Memo_st.VAlign:=vaCenter;
  Memo_st.Color:= $00E4E4E4;
  Memo_st.Text:='Стаття';

  Memo_kekv:=TfrxMemoView.Create(band);
  Memo_kekv.CreateUniqueName;
  Memo_kekv.Height:=0.5*fr1cm;
  Memo_kekv.Width:=1.02*fr1cm;
  Memo_kekv.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_kekv.Font.Size:=8;
  Memo_kekv.Left:=14.68*fr1cm;
  Memo_kekv.top:=0.5*fr1cm;
  Memo_kekv.HAlign:=haCenter;
  Memo_kekv.VAlign:=vaCenter;
  Memo_kekv.Color:= $00E4E4E4;
  Memo_kekv.Text:='КЕКВ';

  saldo_in:=TfrxMemoView.Create(band);
  saldo_in.CreateUniqueName;
  saldo_in.Height:=0.5*fr1cm;
  saldo_in.Width:=4*fr1cm;
  saldo_in.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  saldo_in.Font.Size:=8;
  saldo_in.Left:=15.7*fr1cm;
  saldo_in.top:=0;
  saldo_in.HAlign:=haCenter;
  saldo_in.VAlign:=vaCenter;
  saldo_in.Color:= $00E4E4E4;
  saldo_in.Text:='Сальдо вхідне';

  s_in_db:=TfrxMemoView.Create(band);
  s_in_db.CreateUniqueName;
  s_in_db.Height:=0.5*fr1cm;
  s_in_db.Width:=2*fr1cm;
  s_in_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_db.Font.Size:=8;
  s_in_db.Left:=15.7*fr1cm;
  s_in_db.top:=0.5*fr1cm;
  s_in_db.HAlign:=haCenter;
  s_in_db.VAlign:=vaCenter;
  s_in_db.Color:= $00E4E4E4;
  s_in_db.Text:='Дебет';

  s_in_kr:=TfrxMemoView.Create(band);
  s_in_kr.CreateUniqueName;
  s_in_kr.Height:=0.5*fr1cm;
  s_in_kr.Width:=2*fr1cm;
  s_in_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_kr.Font.Size:=8;
  s_in_kr.Left:=17.7*fr1cm;
  s_in_kr.top:=0.5*fr1cm;
  s_in_kr.HAlign:=haCenter;
  s_in_kr.VAlign:=vaCenter;
  s_in_kr.Color:= $00E4E4E4;
  s_in_kr.Text:='Кредит';

  db:=TfrxMemoView.Create(band);
  db.CreateUniqueName;
  db.Height:=0.5*fr1cm;
  db.Width:=2*fr1cm;
  db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db.Font.Size:=8;
  db.Left:=19.7*fr1cm;
  db.top:=0;
  db.HAlign:=haCenter;
  db.VAlign:=vaCenter;
  db.Color:= $00E4E4E4;
  db.Text:='Дебет';

  db_s:=TfrxMemoView.Create(band);
  db_s.CreateUniqueName;
  db_s.Height:=0.5*fr1cm;
  db_s.Width:=2*fr1cm;
  db_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db_s.Font.Size:=8;
  db_s.Left:=19.7*fr1cm;
  db_s.top:=0.5*fr1cm;
  db_s.HAlign:=haCenter;
  db_s.VAlign:=vaCenter;
  db_s.Color:= $00E4E4E4;
  db_s.Text:='Сума';

  kr:=TfrxMemoView.Create(band);
  kr.CreateUniqueName;
  kr.Height:=0.5*fr1cm;
  kr.Width:=2*fr1cm;
  kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr.Font.Size:=8;
  kr.Left:=21.7*fr1cm;
  kr.top:=0;
  kr.HAlign:=haCenter;
  kr.VAlign:=vaCenter;
  kr.Color:= $00E4E4E4;
  kr.Text:='Кредит';

  kr_s:=TfrxMemoView.Create(band);
  kr_s.CreateUniqueName;
  kr_s.Height:=0.5*fr1cm;
  kr_s.Width:=2*fr1cm;
  kr_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr_s.Font.Size:=8;
  kr_s.Left:=21.7*fr1cm;
  kr_s.top:=0.5*fr1cm;
  kr_s.HAlign:=haCenter;
  kr_s.VAlign:=vaCenter;
  kr_s.Color:= $00E4E4E4;
  kr_s.Text:='Сума';

  saldo_out:=TfrxMemoView.Create(band);
  saldo_out.CreateUniqueName;
  saldo_out.Height:=0.5*fr1cm;
  saldo_out.Width:=4*fr1cm;
  saldo_out.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  saldo_out.Font.Size:=8;
  saldo_out.Left:=23.7*fr1cm;
  saldo_out.top:=0;
  saldo_out.HAlign:=haCenter;
  saldo_out.VAlign:=vaCenter;
  saldo_out.Color:= $00E4E4E4;
  saldo_out.Text:='Сальдо вихідне';

  s_out_db:=TfrxMemoView.Create(band);
  s_out_db.CreateUniqueName;
  s_out_db.Height:=0.5*fr1cm;
  s_out_db.Width:=2*fr1cm;
  s_out_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_db.Font.Size:=8;
  s_out_db.Left:=23.7*fr1cm;
  s_out_db.top:=0.5*fr1cm;
  s_out_db.HAlign:=haCenter;
  s_out_db.VAlign:=vaCenter;
  s_out_db.Color:= $00E4E4E4;
  s_out_db.Text:='Дебет';

  s_out_kr:=TfrxMemoView.Create(band);
  s_out_kr.CreateUniqueName;
  s_out_kr.Height:=0.5*fr1cm;
  s_out_kr.Width:=2*fr1cm;
  s_out_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_kr.Font.Size:=8;
  s_out_kr.Left:=25.7*fr1cm;
  s_out_kr.top:=0.5*fr1cm;
  s_out_kr.HAlign:=haCenter;
  s_out_kr.VAlign:=vaCenter;
  s_out_kr.Color:= $00E4E4E4;
  s_out_kr.Text:='Кредит';

  // верх закончили

  //верхние группы
  if obsh_flag = 1 then
   begin
       fac:=TfrxGroupHeader.Create(page);
       fac.CreateUniqueName;
       fac.top:=top_next;
       fac.Height:=0.8*fr1cm;
       top_next:=fac.top + fac.Height;

       fac.Condition:='frxDBDataset1."BUILDS"' ;

       fac_1:=TfrxMemoView.Create(fac);
       fac_1.CreateUniqueName;
       fac_1.Height:=0.8*fr1cm;
       fac_1.Width:=27.7*fr1cm;
       fac_1.Font.Size:=10;
       fac_1.Left:=0;
       fac_1.top:=0;
       fac_1.HAlign:=haCenter;
       fac_1.VAlign:=vaCenter;
       fac_1.Font.Style:=[fsBold];
       fac_1.Frame.Typ:=[ftLeft,ftRight];
       fac_1.Text:='[frxDBDataset1."BUILDS"]';
   end;

  if fac_st_flag = 1 then
   begin
       spec:=TfrxGroupHeader.Create(page);
       spec.CreateUniqueName;
       spec.top:=top_next;
       spec.Height:=0.8*fr1cm;
       top_next:=spec.top + spec.Height;
       spec.Condition:='frxDBDataset1."NAME_FAK"' ;

       spec_1:=TfrxMemoView.Create(spec);
       spec_1.CreateUniqueName;
       spec_1.Height:=0.8*fr1cm;
       spec_1.Width:=3.4*fr1cm;
       spec_1.Font.Size:=10;
       spec_1.Left:=0;
       spec_1.top:=0;
       spec_1.HAlign:=haLeft;
       spec_1.VAlign:=vaCenter;
       spec_1.Frame.Typ:=[ftLeft];
       spec_1.Text:='Факультет:';

       spec_2:=TfrxMemoView.Create(spec);
       spec_2.CreateUniqueName;
       spec_2.Height:=0.8*fr1cm;
       spec_2.Width:=24.3*fr1cm;
       spec_2.Font.Size:=10;
       spec_2.Left:=3.4*fr1cm;
       spec_2.top:=0;
       spec_2.Font.Style:=[fsBold];
       spec_2.HAlign:=haLeft;
       spec_2.VAlign:=vaCenter;
       spec_2.Frame.Typ:=[ftRight];
       spec_2.Text:='[frxDBDataset1."NAME_FAK"]';
   end;

  if kurs_st_flag = 1 then
   begin
       nat:=TfrxGroupHeader.Create(page);
       nat.CreateUniqueName;
       nat.top:=top_next;
       nat.Height:=0.8*fr1cm;
       top_next:=nat.top + nat.Height;
       nat.Condition:='frxDBDataset1."KURS"' ;

       nat_1:=TfrxMemoView.Create(nat);
       nat_1.CreateUniqueName;
       nat_1.Height:=0.8*fr1cm;
       nat_1.Width:=3.4*fr1cm;
       nat_1.Font.Size:=10;
       nat_1.Left:=0;
       nat_1.top:=0;
       nat_1.HAlign:=haLeft;
       nat_1.VAlign:=vaCenter;
       nat_1.Frame.Typ:=[ftLeft];
       nat_1.Text:='Курс:';

       nat_2:=TfrxMemoView.Create(nat);
       nat_2.CreateUniqueName;
       nat_2.Height:=0.8*fr1cm;
       nat_2.Width:=24.3*fr1cm;
       nat_2.Font.Size:=10;
       nat_2.Left:=3.4*fr1cm;
       nat_2.top:=0;
       nat_2.Font.Style:=[fsBold];
       nat_2.HAlign:=haLeft;
       nat_2.VAlign:=vaCenter;
       nat_2.Frame.Typ:=[ftRight];
       nat_2.Text:='[frxDBDataset1."KURS"]';
   end;

  if kat_pay_flag = 1 then
   begin
       f_st:=TfrxGroupHeader.Create(page);
       f_st.CreateUniqueName;
       f_st.top:=top_next;
       f_st.Height:=0.8*fr1cm;
       top_next:=f_st.top + f_st.Height;
       f_st.Condition:='frxDBDataset1."CAT_PAY"' ;

       f_st_1:=TfrxMemoView.Create(f_st);
       f_st_1.CreateUniqueName;
       f_st_1.Height:=0.8*fr1cm;
       f_st_1.Width:=3.4*fr1cm;
       f_st_1.Font.Size:=10;
       f_st_1.Left:=0;
       f_st_1.top:=0;
       f_st_1.HAlign:=haLeft;
       f_st_1.VAlign:=vaCenter;
       f_st_1.Frame.Typ:=[ftLeft];
       f_st_1.Text:='Категорія сплати:';

       f_st_2:=TfrxMemoView.Create(f_st);
       f_st_2.CreateUniqueName;
       f_st_2.Height:=0.8*fr1cm;
       f_st_2.Width:=24.3*fr1cm;
       f_st_2.Font.Size:=10;
       f_st_2.Left:=3.4*fr1cm;
       f_st_2.top:=0;
       f_st_2.Font.Style:=[fsBold];
       f_st_2.HAlign:=haLeft;
       f_st_2.VAlign:=vaCenter;
       f_st_2.Frame.Typ:=[ftRight];
       f_st_2.Text:='[frxDBDataset1."CAT_PAY"]';
   end;

  if type_live_flag = 1 then
   begin
       k_st:=TfrxGroupHeader.Create(page);
       k_st.CreateUniqueName;
       k_st.top:=top_next;
       k_st.Height:=0.8*fr1cm;
       top_next:=k_st.top + k_st.Height;
       k_st.Condition:='frxDBDataset1."TYPE_LIVE"' ;

       k_st_1:=TfrxMemoView.Create(k_st);
       k_st_1.CreateUniqueName;
       k_st_1.Height:=0.8*fr1cm;
       k_st_1.Width:=3.4*fr1cm;
       k_st_1.Font.Size:=10;
       k_st_1.Left:=0;
       k_st_1.top:=0;
       k_st_1.HAlign:=haLeft;
       k_st_1.VAlign:=vaCenter;
       k_st_1.Frame.Typ:=[ftLeft];
       k_st_1.Text:='Тип проживання:';

       k_st_2:=TfrxMemoView.Create(k_st);
       k_st_2.CreateUniqueName;
       k_st_2.Height:=0.8*fr1cm;
       k_st_2.Width:=24.3*fr1cm;
       k_st_2.Font.Size:=10;
       k_st_2.Left:=3.4*fr1cm;
       k_st_2.top:=0;
       k_st_2.Font.Style:=[fsBold];
       k_st_2.HAlign:=haLeft;
       k_st_2.VAlign:=vaCenter;
       k_st_2.Frame.Typ:=[ftRight];
       k_st_2.Text:='[frxDBDataset1."TYPE_LIVE"]';
   end;

  if cl_live_flag = 1 then
   begin
       kurs:=TfrxGroupHeader.Create(page);
       kurs.CreateUniqueName;
       kurs.top:=top_next;
       kurs.Height:=0.8*fr1cm;
       top_next:=kurs.top + kurs.Height;
       kurs.Condition:='frxDBDataset1."CLASS_LIVE"' ;

       kurs_1:=TfrxMemoView.Create(kurs);
       kurs_1.CreateUniqueName;
       kurs_1.Height:=0.8*fr1cm;
       kurs_1.Width:=3.4*fr1cm;
       kurs_1.Font.Size:=10;
       kurs_1.Left:=0;
       kurs_1.top:=0;
       kurs_1.HAlign:=haLeft;
       kurs_1.VAlign:=vaCenter;
       kurs_1.Frame.Typ:=[ftLeft];
       kurs_1.Text:='Клас проживання:';

       kurs_2:=TfrxMemoView.Create(kurs);
       kurs_2.CreateUniqueName;
       kurs_2.Height:=0.8*fr1cm;
       kurs_2.Width:=24.3*fr1cm;
       kurs_2.Font.Size:=10;
       kurs_2.Left:=3.4*fr1cm;
       kurs_2.top:=0;
       kurs_2.Font.Style:=[fsBold];
       kurs_2.HAlign:=haLeft;
       kurs_2.VAlign:=vaCenter;
       kurs_2.Frame.Typ:=[ftRight];
       kurs_2.Text:='[frxDBDataset1."CLASS_LIVE"]';
   end;

  if grp_flag = 1 then
   begin
       n_gr:=TfrxGroupHeader.Create(page);
       n_gr.CreateUniqueName;
       n_gr.top:=top_next;
       n_gr.Height:=0.8*fr1cm;
       top_next:=n_gr.top + n_gr.Height;
       n_gr.Condition:='frxDBDataset1."NAME_GROUP"' ;

       n_gr_1:=TfrxMemoView.Create(n_gr);
       n_gr_1.CreateUniqueName;
       n_gr_1.Height:=0.8*fr1cm;
       n_gr_1.Width:=3.4*fr1cm;
       n_gr_1.Font.Size:=10;
       n_gr_1.Left:=0;
       n_gr_1.top:=0;
       n_gr_1.HAlign:=haLeft;
       n_gr_1.VAlign:=vaCenter;
       n_gr_1.Frame.Typ:=[ftLeft];
       n_gr_1.Text:='Група:';

       n_gr_2:=TfrxMemoView.Create(n_gr);
       n_gr_2.CreateUniqueName;
       n_gr_2.Height:=0.8*fr1cm;
       n_gr_2.Width:=24.3*fr1cm;
       n_gr_2.Font.Size:=10;
       n_gr_2.Left:=3.4*fr1cm;
       n_gr_2.top:=0;
       n_gr_2.Font.Style:=[fsBold];
       n_gr_2.HAlign:=haLeft;
       n_gr_2.VAlign:=vaCenter;
       n_gr_2.Frame.Typ:=[ftRight];
       n_gr_2.Text:='[frxDBDataset1."NAME_GROUP"]';
   end;
   //мастер дата

  DataBand:=TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.DataSet:=frxDBDataSet1;
  DAtaBand.Top:=top_next;
  DataBand.Height:=0.5*fr1cm;
  top_next:=DataBand.Top+DataBand.Height;
  DAtaBand.Stretched:=True;
  if druk_pid = True then DataBand.Visible := False;

  memo_num:=TfrxMemoView.Create(DataBand);
  memo_num.CreateUniqueName;
  memo_num.Height:=0.5*fr1cm;
  memo_num.Width:=1*fr1cm;
  memo_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_num.Font.Size:=8;
  memo_num.Left:=0*fr1cm;
  memo_num.top:=0;
  memo_num.Text:='[Line]';
  memo_num.StretchMode:=smMaxHeight;
  memo_num.VAlign:=vaCenter;
  memo_num.HAlign:=haRight;

  Memo_PIB:=TfrxMemoView.Create(DataBand);
  Memo_PIB.CreateUniqueName;
  Memo_PIB.Height:=0.5*fr1cm;
  Memo_PIB.Width:=10.3*fr1cm;
  Memo_PIB.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_PIB.Font.Size:=8;
  Memo_PIB.Left:=1*fr1cm;
  memo_PIB.top:=0;
  Memo_PIB.Text:='[frxDBDataset1."FIO"] ([frxDBDataset1."NUM_DOG"])';
  Memo_PIB.StretchMode:=smMaxHeight;
  Memo_PIB.VAlign:=vaCenter;

  Memo_sm:=TfrxMemoView.Create(DataBand);
  Memo_sm.CreateUniqueName;
  Memo_sm.Height:=0.5*fr1cm;
  Memo_sm.Width:=1.03*fr1cm;
  Memo_sm.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_sm.Font.Size:=8;
  Memo_sm.Left:=11.29*fr1cm;
  Memo_sm.top:=0;
  Memo_sm.HAlign:=haCenter;
  Memo_sm.Text:='[frxDBDataset1."SM_KOD"]';
  Memo_sm.StretchMode:=smMaxHeight;
  Memo_sm.VAlign:=vaCenter;

  Memo_rz:=TfrxMemoView.Create(DataBand);
  Memo_rz.CreateUniqueName;
  Memo_rz.Height:=0.5*fr1cm;
  Memo_rz.Width:=1.14*fr1cm;
  Memo_rz.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_rz.Font.Size:=8;
  Memo_rz.Left:=12.32*fr1cm;
  Memo_rz.top:=0;
  Memo_rz.HAlign:=haCenter;
  Memo_rz.Text:='[frxDBDataset1."RZ_KOD"]';
  Memo_rz.StretchMode:=smMaxHeight;
  Memo_rz.VAlign:=vaCenter;

  Memo_st:=TfrxMemoView.Create(DataBand);
  Memo_st.CreateUniqueName;
  Memo_st.Height:=0.5*fr1cm;
  Memo_st.Width:=1.22*fr1cm;
  Memo_st.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_st.Font.Size:=8;
  Memo_st.Left:=13.46*fr1cm;
  Memo_st.top:=0;
  Memo_st.HAlign:=haCenter;
  Memo_st.Text:='[frxDBDataset1."ST_KOD"]';
  Memo_st.StretchMode:=smMaxHeight;
  Memo_st.VAlign:=vaCenter;

  Memo_kekv:=TfrxMemoView.Create(DataBand);
  Memo_kekv.CreateUniqueName;
  Memo_kekv.Height:=0.5*fr1cm;
  Memo_kekv.Width:=1.02*fr1cm;
  Memo_kekv.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_kekv.Font.Size:=8;
  Memo_kekv.Left:=14.68*fr1cm;
  Memo_kekv.top:=0;
  Memo_kekv.HAlign:=haCenter;
  Memo_kekv.Text:='[frxDBDataset1."KEKV_KOD"]';
  Memo_kekv.StretchMode:=smMaxHeight;
  Memo_kekv.VAlign:=vaCenter;

  s_in_db:=TfrxMemoView.Create(DataBand);
  s_in_db.CreateUniqueName;
  s_in_db.Height:=0.5*fr1cm;;
  s_in_db.Width:=2*fr1cm;
  s_in_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_db.Font.Size:=8;
  s_in_db.Left:=15.7*fr1cm;
  s_in_db.top:=0;
  s_in_db.HAlign:=haRight;
  s_in_db.DisplayFormat.Kind:=fkNumeric;
  s_in_db.DisplayFormat.FormatStr:='%2.2n';
  s_in_db.Text:='[frxDBDataset1."IN_DB_SUMMA"]';
  s_in_db.StretchMode:=smMaxHeight;
  s_in_db.VAlign:=vaCenter;

  s_in_kr:=TfrxMemoView.Create(DataBand);
  s_in_kr.CreateUniqueName;
  s_in_kr.Height:=0.5*fr1cm;;
  s_in_kr.Width:=2*fr1cm;
  s_in_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_kr.Font.Size:=8;
  s_in_kr.Left:=17.7*fr1cm;
  s_in_kr.top:=0;
  s_in_kr.HAlign:=haRight;
  s_in_kr.DisplayFormat.Kind:=fkNumeric;
  s_in_kr.DisplayFormat.FormatStr:='%2.2n';
  s_in_kr.Text:='[frxDBDataset1."IN_KR_SUMMA"]';
  s_in_kr.StretchMode:=smMaxHeight;
  s_in_kr.VAlign:=vaCenter;

  db_s:=TfrxMemoView.Create(DataBand);
  db_s.CreateUniqueName;
  db_s.Height:=0.5*fr1cm;
  db_s.Width:=2*fr1cm;
  db_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db_s.Font.Size:=8;
  db_s.Left:=19.7*fr1cm;
  db_s.top:=0;
  db_s.HAlign:=haRight;
  db_s.DisplayFormat.Kind:=fkNumeric;
  db_s.DisplayFormat.FormatStr:='%2.2n';
  db_s.Text:='[frxDBDataset1."DB_SUMMA"]';
  db_s.StretchMode:=smMaxHeight;
  db_s.VAlign:=vaCenter;

  kr_s:=TfrxMemoView.Create(DataBand);
  kr_s.CreateUniqueName;
  kr_s.Height:=0.5*fr1cm;
  kr_s.Width:=2*fr1cm;
  kr_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr_s.Font.Size:=8;
  kr_s.Left:=21.7*fr1cm;
  kr_s.top:=0;
  kr_s.HAlign:=haRight;
  kr_s.DisplayFormat.Kind:=fkNumeric;
  kr_s.DisplayFormat.FormatStr:='%2.2n';
  kr_s.Text:='[frxDBDataset1."KR_SUMMA"]';
  kr_s.StretchMode:=smMaxHeight;
  kr_s.VAlign:=vaCenter;

  s_out_db:=TfrxMemoView.Create(DataBand);
  s_out_db.CreateUniqueName;
  s_out_db.Height:=0.5*fr1cm;
  s_out_db.Width:=2*fr1cm;
  s_out_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_db.Font.Size:=8;
  s_out_db.Left:=23.7*fr1cm;
  s_out_db.top:=0;
  s_out_db.HAlign:=haRight;
  s_out_db.DisplayFormat.Kind:=fkNumeric;
  s_out_db.DisplayFormat.FormatStr:='%2.2n';
  s_out_db.Text:='[frxDBDataset1."OUT_DB_SUMMA"]';
  s_out_db.StretchMode:=smMaxHeight;
  s_out_db.VAlign:=vaCenter;

  s_out_kr:=TfrxMemoView.Create(DataBand);
  s_out_kr.CreateUniqueName;
  s_out_kr.Height:=0.5*fr1cm;
  s_out_kr.Width:=2*fr1cm;
  s_out_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_kr.Font.Size:=8;
  s_out_kr.Left:=25.7*fr1cm;
  s_out_kr.top:=0;
  s_out_kr.HAlign:=haRight;
  s_out_kr.DisplayFormat.Kind:=fkNumeric;
  s_out_kr.DisplayFormat.FormatStr:='%2.2n';
  s_out_kr.Text:='[frxDBDataset1."OUT_KR_SUMMA"]';
  s_out_kr.StretchMode:=smMaxHeight;
  s_out_kr.VAlign:=vaCenter;

  // нижние группы
  if grp_flag = 1 then
   begin
      n_gr_f:=TfrxGroupFooter.Create(page);
      n_gr_f.CreateUniqueName;
      n_gr_f.top:=top_next;
      n_gr_f.Height:=0.8*fr1cm;
      top_next:=n_gr_f.Top+n_gr_f.Height;
      n_gr_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(n_gr_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по групі: ';
      Memo1.Height:=n_gr_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3.4*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(n_gr_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_GROUP"]';
      Memo2.Height:=n_gr_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=12.3*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(n_gr_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=n_gr_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(n_gr_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=n_gr_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(n_gr_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=n_gr_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(n_gr_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=n_gr_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(n_gr_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=n_gr_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(n_gr_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=n_gr_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if cl_live_flag = 1 then
   begin
      kurs_f:=TfrxGroupFooter.Create(page);
      kurs_f.CreateUniqueName;
      kurs_f.top:=top_next;
      kurs_f.Height:=0.8*fr1cm;
      top_next:=kurs_f.Top+kurs_f.Height;
      kurs_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(kurs_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по класу проживання: ';
      Memo1.Height:=kurs_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3.4*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(kurs_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."CLASS_LIVE"]';
      Memo2.Height:=kurs_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=12.3*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(kurs_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=kurs_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(kurs_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=kurs_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(kurs_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=kurs_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(kurs_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=kurs_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(kurs_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=kurs_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(kurs_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=kurs_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;

   end;

  if type_live_flag = 1 then
   begin
      k_st_f:=TfrxGroupFooter.Create(page);
      k_st_f.CreateUniqueName;
      k_st_f.top:=top_next;
      k_st_f.Height:=0.8*fr1cm;
      top_next:=k_st_f.Top+k_st_f.Height;
      k_st_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(k_st_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по типу проживання: ';
      Memo1.Height:=k_st_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3.4*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(k_st_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."TYPE_LIVE"]';
      Memo2.Height:=k_st_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=12.3*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(k_st_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=k_st_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(k_st_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=k_st_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(k_st_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=k_st_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(k_st_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=k_st_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(k_st_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=k_st_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(k_st_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=k_st_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if kat_pay_flag = 1 then
   begin
      f_st_f:=TfrxGroupFooter.Create(page);
      f_st_f.CreateUniqueName;
      f_st_f.top:=top_next;
      f_st_f.Height:=0.8*fr1cm;
      top_next:=f_st_f.Top+f_st_f.Height;
      f_st_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(f_st_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по категорії сплати: ';
      Memo1.Height:=f_st_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3.4*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(f_st_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."CAT_PAY"]';
      Memo2.Height:=f_st_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=12.3*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.Font.Style:=[fsBold];
      Memo2.VAlign:=vaCenter;
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(f_st_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=f_st_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(f_st_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=f_st_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(f_st_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=f_st_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(f_st_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=f_st_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(f_st_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=f_st_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(f_st_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=f_st_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if kurs_st_flag = 1 then
   begin
      nat_f:=TfrxGroupFooter.Create(page);
      nat_f.CreateUniqueName;
      nat_f.top:=top_next;
      nat_f.Height:=0.8*fr1cm;
      top_next:=nat_f.Top+nat_f.Height;
      nat_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(nat_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по курсу: ';
      Memo1.Height:=nat_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3.4*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(nat_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."KURS"]';
      Memo2.Height:=nat_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=12.3*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.Font.Style:=[fsBold];
      Memo2.VAlign:=vaCenter;
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(nat_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=nat_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(nat_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=nat_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(nat_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=nat_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(nat_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=nat_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(nat_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=nat_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(nat_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=nat_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if fac_st_flag = 1 then
   begin
      spec_f:=TfrxGroupFooter.Create(page);
      spec_f.CreateUniqueName;
      spec_f.top:=top_next;
      spec_f.Height:=0.8*fr1cm;
      top_next:=spec_f.Top+spec_f.Height;
      spec_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(spec_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по факультету: ';
      Memo1.Height:=spec_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3.4*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(spec_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_FAK"]';
      Memo2.Height:=spec_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=12.3*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(spec_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=spec_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(spec_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=spec_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(spec_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=spec_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(spec_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=spec_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(spec_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=spec_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(spec_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=spec_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if obsh_flag = 1 then
   begin
      fac_f:=TfrxGroupFooter.Create(page);
      fac_f.CreateUniqueName;
      fac_f.top:=top_next;
      fac_f.Height:=0.8*fr1cm;
      top_next:=fac_f.Top+fac_f.Height;
      fac_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(fac_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по гуртожитку: ';
      Memo1.Height:=fac_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=8;
      Memo1.Width:=3.4*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(fac_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."BUILDS"]';
      Memo2.Height:=fac_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=8;
      Memo2.Width:=12.3*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(fac_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=fac_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=8;
      Memo3.Width:=2*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(fac_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=fac_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=8;
      Memo4.Width:=2*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(fac_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=fac_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=8;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(fac_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=fac_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=8;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(fac_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=fac_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=8;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(fac_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=fac_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=8;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.HAlign:=haRight;
      Memo8.VAlign:=vaCenter;
      Memo8.StretchMode:=smMaxHeight;
   end;
   //page_foter
   page_footer:=TfrxPageFooter.Create(page);
   page_footer.CreateUniqueName;
   page_footer.top:=top_next;
   page_footer.Height:=0.8*fr1cm;
   top_next:=page_footer.top + page_footer.Height;

   date_print:=TfrxMemoView.Create(page_footer);
   date_print.CreateUniqueName;
   date_print.Text:='Дата друку: [Now]';
   date_print.Height:=date_print.Height;
   date_print.Left:=0;
   date_print.Font.Size:=8;
   date_print.Width:=5.4*fr1cm;
   date_print.VAlign:=vaCenter;
//   date_print.StretchMode:=smMaxHeight;

   page_print:=TfrxMemoView.Create(page_footer);
   page_print.CreateUniqueName;
   page_print.Text:='Стор. [Page#] із [TotalPages#]';
   page_print.Height:=date_print.Height;
   page_print.Left:=13.6*fr1cm;
   page_print.Font.Size:=8;
   page_print.Width:=5.4*fr1cm;
   page_print.VAlign:=vaCenter;
//   page_print.StretchMode:=smMaxHeight;

  //report summary
  band_footer:=TfrxReportSummary.Create(page);
  band_footer.CreateUniqueName;
  band_footer.top:=top_next;
  band_footer.Height:=2.7*fr1cm;
  h_memo:=0.8*fr1cm;
  top_next:=band_footer.top + band_footer.Height;
  //height:=band.Height;
      Memo_1:=TfrxMemoView.Create(band_footer);
      Memo_1.CreateUniqueName;
      Memo_1.Text:='Всього: ';
      Memo_1.Height:=h_memo;
      memo_1.Left:=0;
      Memo_1.Font.Size:=8;
      Memo_1.Width:=15.7*fr1cm;
      Memo_1.VAlign:=vaCenter;
      Memo_1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
//      Memo_1.StretchMode:=smMaxHeight;
      Memo_1.Font.Style:=[fsBold];

      Memo_3:=TfrxMemoView.Create(band_footer);
      Memo_3.CreateUniqueName;
      Memo_3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo_3.Height:=h_memo;
      memo_3.Left:=Memo_1.Width;
      Memo_3.Font.Size:=8;
      Memo_3.Width:=2*fr1cm;
      Memo_3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_3.DisplayFormat.Kind:=fkNumeric;
      Memo_3.DisplayFormat.FormatStr:='%2.2n';
      Memo_3.VAlign:=vaCenter;
      Memo_3.HAlign:=haRight;
//      Memo_3.StretchMode:=smMaxHeight;
      Memo_3.Font.Style:=[fsBold];

      Memo_4:=TfrxMemoView.Create(band_footer);
      Memo_4.CreateUniqueName;
      Memo_4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo_4.Height:=h_memo;
      memo_4.Left:=Memo_1.Width+Memo_3.Width;
      Memo_4.Font.Size:=8;
      Memo_4.Width:=2*fr1cm;
      Memo_4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_4.DisplayFormat.Kind:=fkNumeric;
      Memo_4.DisplayFormat.FormatStr:='%2.2n';
      Memo_4.VAlign:=vaCenter;
      Memo_4.HAlign:=haRight;
//      Memo_4.StretchMode:=smMaxHeight;
      Memo_4.Font.Style:=[fsBold];

      Memo_5:=TfrxMemoView.Create(band_footer);
      Memo_5.CreateUniqueName;
      Memo_5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo_5.Height:=h_memo;
      memo_5.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width;
      Memo_5.Font.Size:=8;
      Memo_5.Width:=2*fr1cm;
      Memo_5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_5.DisplayFormat.Kind:=fkNumeric;
      Memo_5.DisplayFormat.FormatStr:='%2.2n';
      Memo_5.VAlign:=vaCenter;
      Memo_5.HAlign:=haRight;
//      Memo_5.StretchMode:=smMaxHeight;
      Memo_5.Font.Style:=[fsBold];

      Memo_6:=TfrxMemoView.Create(band_footer);
      Memo_6.CreateUniqueName;
      Memo_6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo_6.Height:=h_memo;
      memo_6.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width+Memo_5.Width;
      Memo_6.Font.Size:=8;
      Memo_6.Width:=2*fr1cm;
      Memo_6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_6.DisplayFormat.Kind:=fkNumeric;
      Memo_6.DisplayFormat.FormatStr:='%2.2n';
      Memo_6.VAlign:=vaCenter;
      Memo_6.HAlign:=haRight;
//      Memo_6.StretchMode:=smMaxHeight;
      Memo_6.Font.Style:=[fsBold];

      Memo_7:=TfrxMemoView.Create(band_footer);
      Memo_7.CreateUniqueName;
      Memo_7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo_7.Height:=h_memo;
      memo_7.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width+Memo_5.Width+Memo_6.Width;
      Memo_7.Font.Size:=8;
      Memo_7.Width:=2*fr1cm;
      Memo_7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_7.DisplayFormat.Kind:=fkNumeric;
      Memo_7.DisplayFormat.FormatStr:='%2.2n';
      Memo_7.VAlign:=vaCenter;
      Memo_7.HAlign:=haRight;
//      Memo_7.StretchMode:=smMaxHeight;
      Memo_7.Font.Style:=[fsBold];

      Memo_8:=TfrxMemoView.Create(band_footer);
      Memo_8.CreateUniqueName;
      Memo_8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo_8.Height:=h_memo;
      memo_8.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width+Memo_5.Width+Memo_6.Width+Memo_7.Width;
      Memo_8.Font.Size:=8;
      Memo_8.Width:=2*fr1cm;
      Memo_8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_8.DisplayFormat.Kind:=fkNumeric;
      Memo_8.DisplayFormat.FormatStr:='%2.2n';
      Memo_8.HAlign:=haRight;
      Memo_8.VAlign:=vaCenter;
//      Memo_8.StretchMode:=smMaxHeight;
      Memo_8.Font.Style:=[fsBold];

      memo_vik:=TfrxMemoView.Create(band_footer);
      memo_vik.CreateUniqueName;
      memo_vik.Text:='Виконавець';
      memo_vik.Height:=0.8*fr1cm;
      memo_vik.top:=1.1*fr1cm;
      memo_vik.Left:=1*fr1cm;
      memo_vik.Font.Size:=8;
      memo_vik.Width:=2*fr1cm;
      memo_vik.HAlign:=haLeft;
      memo_vik.VAlign:=vaCenter;
//      memo_vik.StretchMode:=smMaxHeight;
      if NOT_PRINT_FIO_ISPOLN=1 then  memo_vik.Visible:=False;

      memo_vik_underline:=TfrxMemoView.Create(band_footer);
      memo_vik_underline.CreateUniqueName;
      memo_vik_underline.Text:='';
      memo_vik_underline.Height:=0.8*fr1cm;
      memo_vik_underline.top:=1.1*fr1cm;
      memo_vik_underline.Left:=3*fr1cm;
      memo_vik_underline.Font.Size:=8;
      memo_vik_underline.Width:=6.3*fr1cm;
      memo_vik_underline.Frame.Typ:=[ftBottom];
      memo_vik_underline.HAlign:=haLeft;
      memo_vik_underline.VAlign:=vaCenter;
      if NOT_PRINT_FIO_ISPOLN=1 then  memo_vik_underline.Visible:=False;
//      memo_vik_underline.StretchMode:=smMaxHeight;

      memo_user:=TfrxMemoView.Create(band_footer);
      memo_user.CreateUniqueName;
      memo_user.Text:='/'+USER_FIO+'/';
      memo_user.Height:=0.8*fr1cm;
      memo_user.top:=1.1*fr1cm;
      memo_user.Left:=9.3*fr1cm;
      memo_user.Font.Size:=8;
      memo_user.Width:=9.6*fr1cm;
      memo_user.HAlign:=haLeft;
      memo_user.VAlign:=vaCenter;
//      memo_user.StretchMode:=smMaxHeight;
     if NOT_PRINT_FIO_ISPOLN=1 then  memo_user.Visible:=False;
end;
end;


procedure TChooseForm.MakeReport_portrate;
var page:TfrxReportPage;
    band_footer:TfrxReportSummary;
    orient:TPrinterOrientation;
    band_header,band, fac_f, spec_f, nat_f, f_st_f, k_st_f, kurs_f, n_gr_f, band_head, page_footer, val_f, stage_f:TfrxBand;
    Memo_PIB, Memo_Ist, Memo_sm, Memo_rz, Memo_st, Memo_kekv, saldo_in, s_in_db, memo_num:TfrxMemoView;
    s_in_kr, saldo_out, s_out_db, s_out_kr, db, kr, db_s, kr_s:TfrxMemoView;
    top_next,height,width_memo,left_memo,left,rasst, h_memo:Extended;
    fac, spec, nat, f_st, k_st, kurs, n_gr, val, stage :TfrxGroupHeader;
    fac_1, spec_1, spec_2, nat_1, nat_2, f_st_1, k_st_1, kurs_1, n_gr_1, f_st_2, k_st_2, kurs_2, n_gr_2, val_1, val_2, stage_1, stage_2 :TfrxMemoView;
    Memo1, Memo2, Memo3, Memo4, Memo5, Memo6, Memo7, Memo8: TfrxMemoView;
    Memo_1, Memo_2, Memo_3, Memo_4, Memo_5, Memo_6, Memo_7, Memo_8: TfrxMemoView;
    memo_vik, memo_vik_underline, memo_user, date_print, page_print, sch_for_sysytem:TfrxMemoView;
    memo_name, memo_inn, memo_inn_num, memo_period:TfrxMemoView;
    i,k,size,size_zagolovok:Integer;
    with_summa:Double;
    DataBand:TfrxMasterData;

begin
if FORM_UCH = 20 then
begin
  frReport.Clear;                         //создаем страницу отчета
  frReport.DataSets.Add(frxDBDataset1);
//  Page:=frReport.Pages[0] as TfrxReportPage;
  page:=TfrxReportPage.Create(frReport);
  page.CreateUniqueName;
  page.SetDefaults;
 // page.Orientation:=poLandscape;
  size:=6;
  size_zagolovok:=8;
  with_summa:=1.7;
  
  band_head:=TfrxReportTitle.Create(page);
  band_head.Top:=0;
  band_head.Height:=4.2*fr1cm;
  top_next:=band_head.top + band_head.Height;

  memo_name:=TfrxMemoView.Create(band_head);
  memo_name.CreateUniqueName;
  memo_name.Height:=0.4*fr1cm;
  memo_name.Width:=10.8*fr1cm;
  memo_name.Frame.Typ:=[ftBottom];
  memo_name.Font.Size:=size;
  memo_name.Left:=0*fr1cm;
  memo_name.top:=0.2*fr1cm;
  memo_name.HAlign:=haCenter;
  memo_name.VAlign:=vaCenter;
  memo_name.Text:=ORG_FULL_NAME;
  memo_name.Font.Style:=[fsBold];

  memo_inn:=TfrxMemoView.Create(band_head);
  memo_inn.CreateUniqueName;
  memo_inn.Height:=0.8*fr1cm;
  memo_inn.Width:=2.5*fr1cm;
  memo_inn.Font.Size:=size;
  memo_inn.Left:=0*fr1cm;
  memo_inn.top:=0.6*fr1cm;
  memo_inn.HAlign:=haCenter;
  memo_inn.VAlign:=vaCenter;
  memo_inn.Text:='Ідентифікаційний код ЄДРПОУ';

  memo_inn_num:=TfrxMemoView.Create(band_head);
  memo_inn_num.CreateUniqueName;
  memo_inn_num.Height:=0.5*fr1cm;
  memo_inn_num.Width:=3*fr1cm;
  memo_inn_num.Font.Size:=size;
  memo_inn_num.Left:=2.6*fr1cm;
  memo_inn_num.top:=0.8*fr1cm;
  memo_inn_num.HAlign:=haCenter;
  memo_inn_num.VAlign:=vaCenter;
  memo_inn_num.Text:=ORG_KOD_OKPO;
  memo_inn_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  memo_period:=TfrxMemoView.Create(band_head);
  memo_period.CreateUniqueName;
  memo_period.Height:=1.3*fr1cm;
  memo_period.Width:=19*fr1cm;
  memo_period.Font.Size:=14;
  memo_period.Left:=0*fr1cm;
  memo_period.top:=1.8*fr1cm;
  memo_period.HAlign:=haCenter;
  memo_period.VAlign:=vaCenter;
  memo_period.Text:='Звіт за період з '+DatetoStr(StartOfAMonth(y_beg, m_beg))+' по '+Datetostr(EndOfAMonth(y_end, m_end));
  memo_period.Font.Style:=[fsBold];

  sch_for_sysytem:=TfrxMemoView.Create(band_head);
  sch_for_sysytem.CreateUniqueName;
  sch_for_sysytem.Height:=1*fr1cm;
  sch_for_sysytem.Width:=19*fr1cm;
  sch_for_sysytem.Font.Size:=10;
  sch_for_sysytem.Left:=0*fr1cm;
  sch_for_sysytem.top:=3.1*fr1cm;
  sch_for_sysytem.HAlign:=haCenter;
  sch_for_sysytem.VAlign:=vaCenter;
  sch_for_sysytem.Text:='Рахунки системи: '+ SCH_SYSTEM;

  band:=TfrxPageHeader.Create(page);      //"верхушка" очета
  band.CreateUniqueName;
  band.top:=top_next;
  band.Height:=1*fr1cm;
  top_next:=band.top + band.Height;

  memo_num:=TfrxMemoView.Create(band);
  memo_num.CreateUniqueName;
  memo_num.Height:=1*fr1cm;
  memo_num.Width:=1*fr1cm;
  memo_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_num.Font.Size:=size;
  memo_num.Left:=0*fr1cm;
  memo_num.top:=0;
  memo_num.HAlign:=haCenter;
  memo_num.VAlign:=vaCenter;
  memo_num.Color:= $00E4E4E4;
  memo_num.Text:='№ п/п';

  Memo_PIB:=TfrxMemoView.Create(band);
  Memo_PIB.CreateUniqueName;
  Memo_PIB.Height:=1*fr1cm;
  Memo_PIB.Width:=5.8*fr1cm;
  Memo_PIB.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_PIB.Font.Size:=size;
  Memo_PIB.Left:=memo_num.Width;
  memo_PIB.top:=0;
  Memo_PIB.HAlign:=haCenter;
  Memo_PIB.VAlign:=vaCenter;
  Memo_PIB.Color:= $00E4E4E4;
  Memo_PIB.Text:='ПІБ';

  Memo_Ist:=TfrxMemoView.Create(band);
  Memo_Ist.CreateUniqueName;
  Memo_Ist.Height:=0.5*fr1cm;
  Memo_Ist.Width:=2*fr1cm;
  Memo_Ist.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_Ist.Font.Size:=size;
  Memo_Ist.Left:=memo_num.Width+memo_pib.Width;
  memo_Ist.top:=0;
  Memo_Ist.HAlign:=haCenter;
  Memo_Ist.VAlign:=vaCenter;
  Memo_Ist.Color:= $00E4E4E4;
  Memo_Ist.Text:='Дж. фін.';

  Memo_sm:=TfrxMemoView.Create(band);
  Memo_sm.CreateUniqueName;
  Memo_sm.Height:=0.5*fr1cm;
  Memo_sm.Width:=2*fr1cm;
  Memo_sm.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_sm.Font.Size:=size;
  Memo_sm.Left:=memo_num.Width+memo_pib.Width;
  Memo_sm.top:=0.5*fr1cm;
  Memo_sm.HAlign:=haCenter;
  Memo_sm.VAlign:=vaCenter;
  Memo_sm.Color:= $00E4E4E4;
  Memo_sm.Text:='кш/рз/ст/КЕКВ';

  saldo_in:=TfrxMemoView.Create(band);
  saldo_in.CreateUniqueName;
  saldo_in.Height:=0.5*fr1cm;
  saldo_in.Width:=3.4*fr1cm;
  saldo_in.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  saldo_in.Font.Size:=size;
  saldo_in.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width;
  saldo_in.top:=0;
  saldo_in.HAlign:=haCenter;
  saldo_in.VAlign:=vaCenter;
  saldo_in.Color:= $00E4E4E4;
  saldo_in.Text:='Сальдо вхідне';

  s_in_db:=TfrxMemoView.Create(band);
  s_in_db.CreateUniqueName;
  s_in_db.Height:=0.5*fr1cm;
  s_in_db.Width:=with_summa*fr1cm;
  s_in_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_db.Font.Size:=size;
  s_in_db.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width;
  s_in_db.top:=0.5*fr1cm;
  s_in_db.HAlign:=haCenter;
  s_in_db.VAlign:=vaCenter;
  s_in_db.Color:= $00E4E4E4;
  s_in_db.Text:='Дебет';

  s_in_kr:=TfrxMemoView.Create(band);
  s_in_kr.CreateUniqueName;
  s_in_kr.Height:=0.5*fr1cm;
  s_in_kr.Width:=with_summa*fr1cm;
  s_in_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_kr.Font.Size:=size;
  s_in_kr.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+s_in_db.Width;
  s_in_kr.top:=0.5*fr1cm;
  s_in_kr.HAlign:=haCenter;
  s_in_kr.VAlign:=vaCenter;
  s_in_kr.Color:= $00E4E4E4;
  s_in_kr.Text:='Кредит';

  db:=TfrxMemoView.Create(band);
  db.CreateUniqueName;
  db.Height:=0.5*fr1cm;
  db.Width:=2*with_summa*fr1cm;
  db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db.Font.Size:=size;
  db.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+s_in_db.Width+s_in_kr.Width;
  db.top:=0;
  db.HAlign:=haCenter;
  db.VAlign:=vaCenter;
  db.Color:= $00E4E4E4;
  db.Text:='Рух коштів';

  db_s:=TfrxMemoView.Create(band);
  db_s.CreateUniqueName;
  db_s.Height:=0.5*fr1cm;
  db_s.Width:=with_summa*fr1cm;
  db_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db_s.Font.Size:=size;
  db_s.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+s_in_db.Width+s_in_kr.Width;
  db_s.top:=0.5*fr1cm;
  db_s.HAlign:=haCenter;
  db_s.VAlign:=vaCenter;
  db_s.Color:= $00E4E4E4;
  db_s.Text:='Дебет';
{
  kr:=TfrxMemoView.Create(band);
  kr.CreateUniqueName;
  kr.Height:=0.5*fr1cm;
  kr.Width:=with_summa*fr1cm;
  kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr.Font.Size:=size;
  kr.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+s_in_db.Width+s_in_kr.Width+db_s.Width;
  kr.top:=0;
  kr.HAlign:=haCenter;
  kr.VAlign:=vaCenter;
  kr.Color:= $00E4E4E4;
  kr.Text:='Кредит';
}
  kr_s:=TfrxMemoView.Create(band);
  kr_s.CreateUniqueName;
  kr_s.Height:=0.5*fr1cm;
  kr_s.Width:=with_summa*fr1cm;
  kr_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr_s.Font.Size:=size;
  kr_s.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+s_in_db.Width+s_in_kr.Width+db_s.Width;
  kr_s.top:=0.5*fr1cm;
  kr_s.HAlign:=haCenter;
  kr_s.VAlign:=vaCenter;
  kr_s.Color:= $00E4E4E4;
  kr_s.Text:='Кредит';

  saldo_out:=TfrxMemoView.Create(band);
  saldo_out.CreateUniqueName;
  saldo_out.Height:=0.5*fr1cm;
  saldo_out.Width:=3.4*fr1cm;
  saldo_out.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  saldo_out.Font.Size:=size;
  saldo_out.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+s_in_db.Width+s_in_kr.Width+db_s.Width+kr_s.Width;
  saldo_out.top:=0;
  saldo_out.HAlign:=haCenter;
  saldo_out.VAlign:=vaCenter;
  saldo_out.Color:= $00E4E4E4;
  saldo_out.Text:='Сальдо вихідне';

  s_out_db:=TfrxMemoView.Create(band);
  s_out_db.CreateUniqueName;
  s_out_db.Height:=0.5*fr1cm;
  s_out_db.Width:=with_summa*fr1cm;
  s_out_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_db.Font.Size:=size;
  s_out_db.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+s_in_db.Width+s_in_kr.Width+db_s.Width+kr_s.Width;
  s_out_db.top:=0.5*fr1cm;
  s_out_db.HAlign:=haCenter;
  s_out_db.VAlign:=vaCenter;
  s_out_db.Color:= $00E4E4E4;
  s_out_db.Text:='Дебет';

  s_out_kr:=TfrxMemoView.Create(band);
  s_out_kr.CreateUniqueName;
  s_out_kr.Height:=0.5*fr1cm;
  s_out_kr.Width:=with_summa*fr1cm;
  s_out_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_kr.Font.Size:=size;
  s_out_kr.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+s_in_db.Width+s_in_kr.Width+db_s.Width+kr_s.Width+s_out_kr.Width;
  s_out_kr.top:=0.5*fr1cm;
  s_out_kr.HAlign:=haCenter;
  s_out_kr.VAlign:=vaCenter;
  s_out_kr.Color:= $00E4E4E4;
  s_out_kr.Text:='Кредит';

  // верх закончили
 if IS_VALYUTA = 1 then
  begin
       val:=TfrxGroupHeader.Create(page);
       val.CreateUniqueName;
       val.top:=top_next;
       val.Height:=0.8*fr1cm;
       top_next:=val.top + val.Height;

       val.Condition:='frxDBDataset1."NAME_VAL"' ;

       val_1:=TfrxMemoView.Create(val);
       val_1.CreateUniqueName;
       val_1.Height:=0.8*fr1cm;
       val_1.Width:=4*fr1cm;
       val_1.Left:=0;
       val_1.top:=0;
       val_1.HAlign:=haLeft;
       val_1.VAlign:=vaCenter;
       val_1.Frame.Typ:=[ftLeft];
       val_1.Text:='Валюта:';

       val_2:=TfrxMemoView.Create(val);
       val_2.CreateUniqueName;
       val_2.Height:=0.8*fr1cm;
       val_2.Width:=15*fr1cm;
       val_2.Left:=4*fr1cm;
       val_2.top:=0;
       val_2.HAlign:=haLeft;
       val_2.VAlign:=vaCenter;
       val_2.Font.Style:=[fsBold];
       val_2.Frame.Typ:=[ftRight];
       val_2.Text:='[frxDBDataset1."NAME_VAL"] ([frxDBDataset1."CODE_VAL"])';
  end;
  //верхние группы
  if fac_flag = 1 then
   begin
       fac:=TfrxGroupHeader.Create(page);
       fac.CreateUniqueName;
       fac.top:=top_next;
       fac.Height:=0.8*fr1cm;
       top_next:=fac.top + fac.Height;

       fac.Condition:='frxDBDataset1."NAME_FACUL"' ;

       fac_1:=TfrxMemoView.Create(fac);
       fac_1.CreateUniqueName;
       fac_1.Height:=0.8*fr1cm;
       fac_1.Width:=19*fr1cm;
       fac_1.Font.Size:=size_zagolovok;
       fac_1.Left:=0;
       fac_1.top:=0;
       fac_1.HAlign:=haCenter;
       fac_1.VAlign:=vaCenter;
       fac_1.Font.Style:=[fsBold];
       fac_1.Frame.Typ:=[ftLeft,ftRight];
       fac_1.Text:='[frxDBDataset1."NAME_FACUL"]';
   end;

   if period_opl_flag = 1 then
   begin
       stage:=TfrxGroupHeader.Create(page);
       stage.CreateUniqueName;
       stage.top:=top_next;
       stage.Height:=0.8*fr1cm;
       top_next:=stage.top + stage.Height;
       stage.Condition:='frxDBDataset1."NAME_STAGE"' ;

       stage_1:=TfrxMemoView.Create(stage);
       stage_1.CreateUniqueName;
       stage_1.Height:=0.8*fr1cm;
       stage_1.Width:=4*fr1cm;
       stage_1.Font.Size:=size_zagolovok;
       stage_1.Left:=0;
       stage_1.top:=0;
       stage_1.HAlign:=haLeft;
       stage_1.VAlign:=vaCenter;
       stage_1.Frame.Typ:=[ftLeft];
       stage_1.Text:='Період оплати:';

       stage_2:=TfrxMemoView.Create(stage);
       stage_2.CreateUniqueName;
       stage_2.Height:=0.8*fr1cm;
       stage_2.Width:=15*fr1cm;
       stage_2.Font.Size:=size_zagolovok;
       stage_2.Left:=stage_1.Width;
       stage_2.top:=0;
       stage_2.Font.Style:=[fsBold];
       stage_2.HAlign:=haLeft;
       stage_2.VAlign:=vaCenter;
       stage_2.Frame.Typ:=[ftRight];
       stage_2.Text:='[frxDBDataset1."NAME_STAGE"]';
   end;

  if spec_flag = 1 then
   begin
       spec:=TfrxGroupHeader.Create(page);
       spec.CreateUniqueName;
       spec.top:=top_next;
       spec.Height:=0.8*fr1cm;
       top_next:=spec.top + spec.Height;
       spec.Condition:='frxDBDataset1."NAME_SPEC"' ;

       spec_1:=TfrxMemoView.Create(spec);
       spec_1.CreateUniqueName;
       spec_1.Height:=0.8*fr1cm;
       spec_1.Width:=4*fr1cm;
       spec_1.Font.Size:=size_zagolovok;
       spec_1.Left:=0;
       spec_1.top:=0;
       spec_1.HAlign:=haLeft;
       spec_1.VAlign:=vaCenter;
       spec_1.Frame.Typ:=[ftLeft];
       spec_1.Text:='Спеціальність:';

       spec_2:=TfrxMemoView.Create(spec);
       spec_2.CreateUniqueName;
       spec_2.Height:=0.8*fr1cm;
       spec_2.Width:=15*fr1cm;
       spec_2.Font.Size:=size_zagolovok;
       spec_2.Left:=spec_1.Width;
       spec_2.top:=0;
       spec_2.Font.Style:=[fsBold];
       spec_2.HAlign:=haLeft;
       spec_2.VAlign:=vaCenter;
       spec_2.Frame.Typ:=[ftRight];
       spec_2.Text:='[frxDBDataset1."NAME_SPEC"]';
   end;

  if nat_flag = 1 then
   begin
       nat:=TfrxGroupHeader.Create(page);
       nat.CreateUniqueName;
       nat.top:=top_next;
       nat.Height:=0.8*fr1cm;
       top_next:=nat.top + nat.Height;
       nat.Condition:='frxDBDataset1."NAME_NATIONAL"' ;

       nat_1:=TfrxMemoView.Create(nat);
       nat_1.CreateUniqueName;
       nat_1.Height:=0.8*fr1cm;
       nat_1.Width:=4*fr1cm;
       nat_1.Font.Size:=size_zagolovok;
       nat_1.Left:=0;
       nat_1.top:=0;
       nat_1.HAlign:=haLeft;
       nat_1.VAlign:=vaCenter;
       nat_1.Frame.Typ:=[ftLeft];
       nat_1.Text:='Громадянство:';

       nat_2:=TfrxMemoView.Create(nat);
       nat_2.CreateUniqueName;
       nat_2.Height:=0.8*fr1cm;
       nat_2.Width:=15*fr1cm;
       nat_2.Font.Size:=size_zagolovok;
       nat_2.Left:=nat_1.Width;
       nat_2.top:=0;
       nat_2.Font.Style:=[fsBold];
       nat_2.HAlign:=haLeft;
       nat_2.VAlign:=vaCenter;
       nat_2.Frame.Typ:=[ftRight];
       nat_2.Text:='[frxDBDataset1."NAME_NATIONAL"]';
   end;

  if f_stud_flag = 1 then
   begin
       f_st:=TfrxGroupHeader.Create(page);
       f_st.CreateUniqueName;
       f_st.top:=top_next;
       f_st.Height:=0.8*fr1cm;
       top_next:=f_st.top + f_st.Height;
       f_st.Condition:='frxDBDataset1."NAME_FORM_STUD"' ;

       f_st_1:=TfrxMemoView.Create(f_st);
       f_st_1.CreateUniqueName;
       f_st_1.Height:=0.8*fr1cm;
       f_st_1.Width:=4*fr1cm;
       f_st_1.Font.Size:=size_zagolovok;
       f_st_1.Left:=0;
       f_st_1.top:=0;
       f_st_1.HAlign:=haLeft;
       f_st_1.VAlign:=vaCenter;
       f_st_1.Frame.Typ:=[ftLeft];
       f_st_1.Text:='Форма навчання:';

       f_st_2:=TfrxMemoView.Create(f_st);
       f_st_2.CreateUniqueName;
       f_st_2.Height:=0.8*fr1cm;
       f_st_2.Width:=15*fr1cm;
       f_st_2.Font.Size:=size_zagolovok;
       f_st_2.Left:=f_st_1.Width;
       f_st_2.top:=0;
       f_st_2.Font.Style:=[fsBold];
       f_st_2.HAlign:=haLeft;
       f_st_2.VAlign:=vaCenter;
       f_st_2.Frame.Typ:=[ftRight];
       f_st_2.Text:='[frxDBDataset1."NAME_FORM_STUD"]';
   end;

  if k_stud_flag = 1 then
   begin
       k_st:=TfrxGroupHeader.Create(page);
       k_st.CreateUniqueName;
       k_st.top:=top_next;
       k_st.Height:=0.8*fr1cm;
       top_next:=k_st.top + k_st.Height;
       k_st.Condition:='frxDBDataset1."NAME_KAT_STUD"' ;

       k_st_1:=TfrxMemoView.Create(k_st);
       k_st_1.CreateUniqueName;
       k_st_1.Height:=0.8*fr1cm;
       k_st_1.Width:=4*fr1cm;
       k_st_1.Font.Size:=size_zagolovok;
       k_st_1.Left:=0;
       k_st_1.top:=0;
       k_st_1.HAlign:=haLeft;
       k_st_1.VAlign:=vaCenter;
       k_st_1.Frame.Typ:=[ftLeft];
       k_st_1.Text:='Категорія навчання:';

       k_st_2:=TfrxMemoView.Create(k_st);
       k_st_2.CreateUniqueName;
       k_st_2.Height:=0.8*fr1cm;
       k_st_2.Width:=15*fr1cm;
       k_st_2.Font.Size:=size_zagolovok;
       k_st_2.Left:=k_st_1.Width;
       k_st_2.top:=0;
       k_st_2.Font.Style:=[fsBold];
       k_st_2.HAlign:=haLeft;
       k_st_2.VAlign:=vaCenter;
       k_st_2.Frame.Typ:=[ftRight];
       k_st_2.Text:='[frxDBDataset1."NAME_KAT_STUD"]';
   end;

  if kurs_flag = 1 then
   begin
       kurs:=TfrxGroupHeader.Create(page);
       kurs.CreateUniqueName;
       kurs.top:=top_next;
       kurs.Height:=0.8*fr1cm;
       top_next:=kurs.top + kurs.Height;
       kurs.Condition:='frxDBDataset1."KURS"' ;

       kurs_1:=TfrxMemoView.Create(kurs);
       kurs_1.CreateUniqueName;
       kurs_1.Height:=0.8*fr1cm;
       kurs_1.Width:=4*fr1cm;
       kurs_1.Font.Size:=size_zagolovok;
       kurs_1.Left:=0;
       kurs_1.top:=0;
       kurs_1.HAlign:=haLeft;
       kurs_1.VAlign:=vaCenter;
       kurs_1.Frame.Typ:=[ftLeft];
       kurs_1.Text:='Курс:';

       kurs_2:=TfrxMemoView.Create(kurs);
       kurs_2.CreateUniqueName;
       kurs_2.Height:=0.8*fr1cm;
       kurs_2.Width:=15*fr1cm;
       kurs_2.Font.Size:=size_zagolovok;
       kurs_2.Left:=kurs_1.Width;
       kurs_2.top:=0;
       kurs_2.Font.Style:=[fsBold];
       kurs_2.HAlign:=haLeft;
       kurs_2.VAlign:=vaCenter;
       kurs_2.Frame.Typ:=[ftRight];
       kurs_2.Text:='[frxDBDataset1."KURS"]';
   end;

  if n_gr_flag = 1 then
   begin
       n_gr:=TfrxGroupHeader.Create(page);
       n_gr.CreateUniqueName;
       n_gr.top:=top_next;
       n_gr.Height:=0.8*fr1cm;
       top_next:=n_gr.top + n_gr.Height;
       n_gr.Condition:='frxDBDataset1."NAME_GROUP"' ;

       n_gr_1:=TfrxMemoView.Create(n_gr);
       n_gr_1.CreateUniqueName;
       n_gr_1.Height:=0.8*fr1cm;
       n_gr_1.Width:=4*fr1cm;
       n_gr_1.Font.Size:=size_zagolovok;
       n_gr_1.Left:=0;
       n_gr_1.top:=0;
       n_gr_1.HAlign:=haLeft;
       n_gr_1.VAlign:=vaCenter;
       n_gr_1.Frame.Typ:=[ftLeft];
       n_gr_1.Text:='Група:';

       n_gr_2:=TfrxMemoView.Create(n_gr);
       n_gr_2.CreateUniqueName;
       n_gr_2.Height:=0.8*fr1cm;
       n_gr_2.Width:=15*fr1cm;
       n_gr_2.Font.Size:=size_zagolovok;
       n_gr_2.Left:=n_gr_1.Width;
       n_gr_2.top:=0;
       n_gr_2.Font.Style:=[fsBold];
       n_gr_2.HAlign:=haLeft;
       n_gr_2.VAlign:=vaCenter;
       n_gr_2.Frame.Typ:=[ftRight];
       n_gr_2.Text:='[frxDBDataset1."NAME_GROUP"]';
   end;
   //мастер дата

  DataBand:=TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.DataSet:=frxDBDataSet1;
  DAtaBand.Top:=top_next;
  DataBand.Height:=0.5*fr1cm;
  top_next:=DataBand.Top+DataBand.Height;
  DAtaBand.Stretched:=True;
 // if druk_pid = True then DataBand.Visible := False;

  memo_num:=TfrxMemoView.Create(DataBand);
  memo_num.CreateUniqueName;
  memo_num.Height:=0.5*fr1cm;
  memo_num.Width:=1*fr1cm;
  memo_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_num.Font.Size:=size;
  memo_num.Left:=0*fr1cm;
  memo_num.top:=0;
  memo_num.Text:='[Line]';
  memo_num.StretchMode:=smMaxHeight;
  memo_num.VAlign:=vaCenter;
  memo_num.HAlign:=haRight;

  Memo_PIB:=TfrxMemoView.Create(DataBand);
  Memo_PIB.CreateUniqueName;
  Memo_PIB.Height:=0.5*fr1cm;
  Memo_PIB.Width:=5.8*fr1cm;
  Memo_PIB.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_PIB.Font.Size:=size;
  Memo_PIB.Left:=memo_num.Width;
  memo_PIB.top:=0;
  if print_num_dog = True then
  Memo_PIB.Text:='[frxDBDataset1."FIO"] ([frxDBDataset1."NUM_DOG"])'
  else Memo_PIB.Text:='[frxDBDataset1."FIO"]';
  Memo_PIB.StretchMode:=smMaxHeight;
  Memo_PIB.VAlign:=vaCenter;

  Memo_sm:=TfrxMemoView.Create(DataBand);
  Memo_sm.CreateUniqueName;
  Memo_sm.Height:=0.5*fr1cm;
  Memo_sm.Width:=2*fr1cm;
  Memo_sm.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_sm.Font.Size:=size;
  Memo_sm.Left:=memo_num.Width+memo_pib.Width;
  Memo_sm.top:=0;
  Memo_sm.HAlign:=haCenter;
  Memo_sm.Text:='[frxDBDataset1."SM_KOD"]/[frxDBDataset1."RZ_KOD"]/[frxDBDataset1."ST_KOD"]/[frxDBDataset1."KEKV_KOD"]';
  Memo_sm.StretchMode:=smMaxHeight;
  Memo_sm.VAlign:=vaCenter;

{  Memo_rz:=TfrxMemoView.Create(DataBand);
  Memo_rz.CreateUniqueName;
  Memo_rz.Height:=0.5*fr1cm;
  Memo_rz.Width:=1.14*fr1cm;
  Memo_rz.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_rz.Font.Size:=8;
  Memo_rz.Left:=12.32*fr1cm;
  Memo_rz.top:=0;
  Memo_rz.HAlign:=haCenter;
  Memo_rz.Text:='';
  Memo_rz.StretchMode:=smMaxHeight;
  Memo_rz.VAlign:=vaCenter;

  Memo_st:=TfrxMemoView.Create(DataBand);
  Memo_st.CreateUniqueName;
  Memo_st.Height:=0.5*fr1cm;
  Memo_st.Width:=1.22*fr1cm;
  Memo_st.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_st.Font.Size:=8;
  Memo_st.Left:=13.46*fr1cm;
  Memo_st.top:=0;
  Memo_st.HAlign:=haCenter;
  Memo_st.Text:='';
  Memo_st.StretchMode:=smMaxHeight;
  Memo_st.VAlign:=vaCenter;

  Memo_kekv:=TfrxMemoView.Create(DataBand);
  Memo_kekv.CreateUniqueName;
  Memo_kekv.Height:=0.5*fr1cm;
  Memo_kekv.Width:=1.02*fr1cm;
  Memo_kekv.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_kekv.Font.Size:=8;
  Memo_kekv.Left:=14.68*fr1cm;
  Memo_kekv.top:=0;
  Memo_kekv.HAlign:=haCenter;
  Memo_kekv.Text:='';
  Memo_kekv.StretchMode:=smMaxHeight;
  Memo_kekv.VAlign:=vaCenter; }

  s_in_db:=TfrxMemoView.Create(DataBand);
  s_in_db.CreateUniqueName;
  s_in_db.Height:=0.5*fr1cm;;
  s_in_db.Width:=with_summa*fr1cm;
  s_in_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_db.Font.Size:=size;
  s_in_db.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width;
  s_in_db.top:=0;
  s_in_db.HAlign:=haRight;
  s_in_db.DisplayFormat.Kind:=fkNumeric;
  s_in_db.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  s_in_db.Text:='[frxDBDataset1."IN_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  s_in_db.Text:='[frxDBDataset1."IN_DB_SUMMA"]';
  s_in_db.StretchMode:=smMaxHeight;
  s_in_db.VAlign:=vaCenter;

  s_in_kr:=TfrxMemoView.Create(DataBand);
  s_in_kr.CreateUniqueName;
  s_in_kr.Height:=0.5*fr1cm;;
  s_in_kr.Width:=with_summa*fr1cm;
  s_in_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_kr.Font.Size:=size;
  s_in_kr.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width;
  s_in_kr.top:=0;
  s_in_kr.HAlign:=haRight;
  s_in_kr.DisplayFormat.Kind:=fkNumeric;
  s_in_kr.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  s_in_kr.Text:='[frxDBDataset1."IN_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  s_in_kr.Text:='[frxDBDataset1."IN_KR_SUMMA"]';
  s_in_kr.StretchMode:=smMaxHeight;
  s_in_kr.VAlign:=vaCenter;

  db_s:=TfrxMemoView.Create(DataBand);
  db_s.CreateUniqueName;
  db_s.Height:=0.5*fr1cm;
  db_s.Width:=with_summa*fr1cm;
  db_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db_s.Font.Size:=size;
  db_s.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width+s_in_kr.Width;
  db_s.top:=0;
  db_s.HAlign:=haRight;
  db_s.DisplayFormat.Kind:=fkNumeric;
  db_s.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  db_s.Text:='[frxDBDataset1."DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  db_s.Text:='[frxDBDataset1."DB_SUMMA"]';
  db_s.StretchMode:=smMaxHeight;
  db_s.VAlign:=vaCenter;

  kr_s:=TfrxMemoView.Create(DataBand);
  kr_s.CreateUniqueName;
  kr_s.Height:=0.5*fr1cm;
  kr_s.Width:=with_summa*fr1cm;
  kr_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr_s.Font.Size:=size;
  kr_s.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width+s_in_kr.Width+db_s.Width;
  kr_s.top:=0;
  kr_s.HAlign:=haRight;
  kr_s.DisplayFormat.Kind:=fkNumeric;
  kr_s.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  kr_s.Text:='[frxDBDataset1."KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  kr_s.Text:='[frxDBDataset1."KR_SUMMA"]';
  kr_s.StretchMode:=smMaxHeight;
  kr_s.VAlign:=vaCenter;

  s_out_db:=TfrxMemoView.Create(DataBand);
  s_out_db.CreateUniqueName;
  s_out_db.Height:=0.5*fr1cm;
  s_out_db.Width:=with_summa*fr1cm;
  s_out_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_db.Font.Size:=size;
  s_out_db.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width+s_in_kr.Width+db_s.Width+kr_s.Width;
  s_out_db.top:=0;
  s_out_db.HAlign:=haRight;
  s_out_db.DisplayFormat.Kind:=fkNumeric;
  s_out_db.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  s_out_db.Text:='[frxDBDataset1."OUT_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  s_out_db.Text:='[frxDBDataset1."OUT_DB_SUMMA"]';
  s_out_db.StretchMode:=smMaxHeight;
  s_out_db.VAlign:=vaCenter;

  s_out_kr:=TfrxMemoView.Create(DataBand);
  s_out_kr.CreateUniqueName;
  s_out_kr.Height:=0.5*fr1cm;
  s_out_kr.Width:=with_summa*fr1cm;
  s_out_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_kr.Font.Size:=size;
  s_out_kr.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width+s_in_kr.Width+db_s.Width+kr_s.Width+s_out_kr.Width;
  s_out_kr.top:=0;
  s_out_kr.HAlign:=haRight;
  s_out_kr.DisplayFormat.Kind:=fkNumeric;
  s_out_kr.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  s_out_kr.Text:='[frxDBDataset1."OUT_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  s_out_kr.Text:='[frxDBDataset1."OUT_KR_SUMMA"]';
  s_out_kr.StretchMode:=smMaxHeight;
  s_out_kr.VAlign:=vaCenter;

  // нижние группы
  if n_gr_flag = 1 then
   begin
      n_gr_f:=TfrxGroupFooter.Create(page);
      n_gr_f.CreateUniqueName;
      n_gr_f.top:=top_next;
      n_gr_f.Height:=0.8*fr1cm;
      top_next:=n_gr_f.Top+n_gr_f.Height;
      n_gr_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(n_gr_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по групі: ';
      Memo1.Height:=n_gr_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(n_gr_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_GROUP"]';
      Memo2.Height:=n_gr_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.8*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(n_gr_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[frxDBDataset1."IN_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=n_gr_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=with_summa*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(n_gr_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[frxDBDataset1."IN_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=n_gr_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=with_summa*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(n_gr_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[frxDBDataset1."DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=n_gr_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(n_gr_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[frxDBDataset1."KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=n_gr_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(n_gr_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[frxDBDataset1."OUT_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=n_gr_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(n_gr_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[frxDBDataset1."OUT_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=n_gr_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if kurs_flag = 1 then
   begin
      kurs_f:=TfrxGroupFooter.Create(page);
      kurs_f.CreateUniqueName;
      kurs_f.top:=top_next;
      kurs_f.Height:=0.8*fr1cm;
      top_next:=kurs_f.Top+kurs_f.Height;
      kurs_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(kurs_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по курсу: ';
      Memo1.Height:=kurs_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(kurs_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."KURS"]';
      Memo2.Height:=kurs_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.8*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(kurs_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[frxDBDataset1."IN_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=kurs_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=with_summa*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(kurs_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[frxDBDataset1."IN_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=kurs_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=with_summa*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(kurs_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[frxDBDataset1."DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=kurs_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(kurs_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[frxDBDataset1."KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=kurs_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(kurs_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[frxDBDataset1."OUT_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=kurs_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(kurs_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[frxDBDataset1."OUT_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=kurs_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;

   end;

  if k_stud_flag = 1 then
   begin
      k_st_f:=TfrxGroupFooter.Create(page);
      k_st_f.CreateUniqueName;
      k_st_f.top:=top_next;
      k_st_f.Height:=0.8*fr1cm;
      top_next:=k_st_f.Top+k_st_f.Height;
      k_st_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(k_st_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по категорії навчання: ';
      Memo1.Height:=k_st_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(k_st_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_KAT_STUD"]';
      Memo2.Height:=k_st_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.8*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(k_st_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[frxDBDataset1."IN_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=k_st_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=with_summa*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(k_st_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[frxDBDataset1."IN_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=k_st_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=with_summa*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(k_st_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[frxDBDataset1."DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=k_st_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(k_st_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[frxDBDataset1."KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=k_st_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(k_st_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[frxDBDataset1."OUT_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=k_st_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(k_st_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[frxDBDataset1."OUT_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=k_st_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if f_stud_flag = 1 then
   begin
      f_st_f:=TfrxGroupFooter.Create(page);
      f_st_f.CreateUniqueName;
      f_st_f.top:=top_next;
      f_st_f.Height:=0.8*fr1cm;
      top_next:=f_st_f.Top+f_st_f.Height;
      f_st_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(f_st_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по формі навчання: ';
      Memo1.Height:=f_st_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(f_st_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_FORM_STUD"]';
      Memo2.Height:=f_st_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.8*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.Font.Style:=[fsBold];
      Memo2.VAlign:=vaCenter;
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(f_st_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[frxDBDataset1."IN_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=f_st_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=with_summa*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(f_st_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[frxDBDataset1."IN_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=f_st_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=with_summa*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(f_st_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[frxDBDataset1."DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=f_st_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(f_st_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[frxDBDataset1."KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=f_st_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(f_st_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[frxDBDataset1."OUT_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=f_st_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(f_st_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[frxDBDataset1."OUT_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=f_st_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if nat_flag = 1 then
   begin
      nat_f:=TfrxGroupFooter.Create(page);
      nat_f.CreateUniqueName;
      nat_f.top:=top_next;
      nat_f.Height:=0.8*fr1cm;
      top_next:=nat_f.Top+nat_f.Height;
      nat_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(nat_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по національності: ';
      Memo1.Height:=nat_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(nat_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_NATIONAL"]';
      Memo2.Height:=nat_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.8*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.Font.Style:=[fsBold];
      Memo2.VAlign:=vaCenter;
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(nat_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[frxDBDataset1."IN_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=nat_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=with_summa*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(nat_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[frxDBDataset1."IN_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=nat_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=with_summa*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(nat_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[frxDBDataset1."DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=nat_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(nat_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[frxDBDataset1."KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=nat_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(nat_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[frxDBDataset1."OUT_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=nat_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(nat_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[frxDBDataset1."OUT_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=nat_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if spec_flag = 1 then
   begin
      spec_f:=TfrxGroupFooter.Create(page);
      spec_f.CreateUniqueName;
      spec_f.top:=top_next;
      spec_f.Height:=0.8*fr1cm;
      top_next:=spec_f.Top+spec_f.Height;
      spec_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(spec_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по спеціальності: ';
      Memo1.Height:=spec_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(spec_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_SPEC"]';
      Memo2.Height:=spec_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.8*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(spec_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[frxDBDataset1."IN_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=spec_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=with_summa*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(spec_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[frxDBDataset1."IN_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=spec_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=with_summa*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(spec_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[frxDBDataset1."DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=spec_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(spec_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[frxDBDataset1."KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=spec_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(spec_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[frxDBDataset1."OUT_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=spec_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(spec_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[frxDBDataset1."OUT_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=spec_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

   if period_opl_flag = 1 then
   begin
      stage_f:=TfrxGroupFooter.Create(page);
      stage_f.CreateUniqueName;
      stage_f.top:=top_next;
      stage_f.Height:=0.8*fr1cm;
      top_next:=stage_f.Top+stage_f.Height;
      stage_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(stage_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по періоду оплати: ';
      Memo1.Height:=stage_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(stage_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_STAGE"]';
      Memo2.Height:=stage_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.8*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(stage_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[frxDBDataset1."IN_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=stage_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=with_summa*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(stage_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[frxDBDataset1."IN_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=stage_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=with_summa*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(stage_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[frxDBDataset1."DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=stage_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(stage_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[frxDBDataset1."KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=stage_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(stage_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[frxDBDataset1."OUT_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=stage_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(stage_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[frxDBDataset1."OUT_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=stage_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if fac_flag = 1 then
   begin
      fac_f:=TfrxGroupFooter.Create(page);
      fac_f.CreateUniqueName;
      fac_f.top:=top_next;
      fac_f.Height:=0.8*fr1cm;
      top_next:=fac_f.Top+fac_f.Height;
      fac_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(fac_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по факультету: ';
      Memo1.Height:=fac_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(fac_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_FACUL"]';
      Memo2.Height:=fac_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.8*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(fac_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[frxDBDataset1."IN_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=fac_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=with_summa*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(fac_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[frxDBDataset1."IN_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=fac_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=with_summa*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(fac_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[frxDBDataset1."DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=fac_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(fac_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[frxDBDataset1."KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=fac_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(fac_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[frxDBDataset1."OUT_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=fac_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(fac_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[frxDBDataset1."OUT_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=fac_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.HAlign:=haRight;
      Memo8.VAlign:=vaCenter;
      Memo8.StretchMode:=smMaxHeight;
   end;
   if is_valyuta =1 then
   begin
      val_f:=TfrxGroupFooter.Create(page);
      val_f.CreateUniqueName;
      val_f.top:=top_next;
      val_f.Height:=0.8*fr1cm;
      top_next:=val_f.Top+val_f.Height;
      val_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(val_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по валюті: ';
      Memo1.Height:=val_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(val_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."CODE_VAL"]';
      Memo2.Height:=val_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.8*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(val_f);
      Memo3.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=val_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=with_summa*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(val_f);
      Memo4.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=val_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=with_summa*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(val_f);
      Memo5.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=val_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(val_f);
      Memo6.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=val_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(val_f);
      Memo7.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=val_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(val_f);
      Memo8.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=val_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.HAlign:=haRight;
      Memo8.VAlign:=vaCenter;
      Memo8.StretchMode:=smMaxHeight;
   end;
     //page_foter
   page_footer:=TfrxPageFooter.Create(page);
   page_footer.CreateUniqueName;
   page_footer.top:=top_next;
   page_footer.Height:=0.8*fr1cm;
   top_next:=page_footer.top + page_footer.Height;

   date_print:=TfrxMemoView.Create(page_footer);
   date_print.CreateUniqueName;
   date_print.Text:='Дата друку: [Now]';
   date_print.Height:=page_footer.Height;
   date_print.Left:=0;
   date_print.Font.Size:=8;
   date_print.Width:=5.4*fr1cm;
   date_print.VAlign:=vaCenter;
//   date_print.StretchMode:=smMaxHeight;

   page_print:=TfrxMemoView.Create(page_footer);
   page_print.CreateUniqueName;
   page_print.Text:='Стор. [Page#] із [TotalPages#]';
   page_print.Height:=page_footer.Height;
   page_print.Left:=13.6*fr1cm;
   page_print.Font.Size:=8;
   page_print.Width:=5.4*fr1cm;
   page_print.VAlign:=vaCenter;
 //  page_print.StretchMode:=smMaxHeight;
  //report summary
  band_footer:=TfrxReportSummary.Create(page);
  band_footer.CreateUniqueName;
  band_footer.top:=top_next;
  band_footer.Height:=2.7*fr1cm;
  h_memo:=0.8*fr1cm;
  top_next:=band_footer.top + band_footer.Height;
  //height:=band.Height;
      Memo_1:=TfrxMemoView.Create(band_footer);
      Memo_1.CreateUniqueName;
      Memo_1.Text:='Всього: ';
      Memo_1.Height:=h_memo;
      memo_1.Left:=0;
      Memo_1.Font.Size:=size;
      Memo_1.Width:=8.8*fr1cm;
      Memo_1.VAlign:=vaCenter;
      Memo_1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
//      Memo_1.StretchMode:=smMaxHeight;
      Memo_1.Font.Style:=[fsBold];

      Memo_3:=TfrxMemoView.Create(band_footer);
      Memo_3.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo_3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo_3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo_3.Height:=h_memo;
      memo_3.Left:=Memo_1.Width;
      Memo_3.Font.Size:=size;
      Memo_3.Width:=with_summa*fr1cm;
      Memo_3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_3.DisplayFormat.Kind:=fkNumeric;
      Memo_3.DisplayFormat.FormatStr:='%2.2n';
      Memo_3.VAlign:=vaCenter;
      Memo_3.HAlign:=haRight;
//      Memo_3.StretchMode:=smMaxHeight;
      Memo_3.Font.Style:=[fsBold];

      Memo_4:=TfrxMemoView.Create(band_footer);
      Memo_4.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo_4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo_4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo_4.Height:=h_memo;
      memo_4.Left:=Memo_1.Width+Memo_3.Width;
      Memo_4.Font.Size:=size;
      Memo_4.Width:=with_summa*fr1cm;
      Memo_4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_4.DisplayFormat.Kind:=fkNumeric;
      Memo_4.DisplayFormat.FormatStr:='%2.2n';
      Memo_4.VAlign:=vaCenter;
      Memo_4.HAlign:=haRight;
//      Memo_4.StretchMode:=smMaxHeight;
      Memo_4.Font.Style:=[fsBold];

      Memo_5:=TfrxMemoView.Create(band_footer);
      Memo_5.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo_5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo_5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo_5.Height:=h_memo;
      memo_5.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width;
      Memo_5.Font.Size:=size;
      Memo_5.Width:=with_summa*fr1cm;
      Memo_5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_5.DisplayFormat.Kind:=fkNumeric;
      Memo_5.DisplayFormat.FormatStr:='%2.2n';
      Memo_5.VAlign:=vaCenter;
      Memo_5.HAlign:=haRight;
//      Memo_5.StretchMode:=smMaxHeight;
      Memo_5.Font.Style:=[fsBold];

      Memo_6:=TfrxMemoView.Create(band_footer);
      Memo_6.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo_6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo_6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo_6.Height:=h_memo;
      memo_6.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width+Memo_5.Width;
      Memo_6.Font.Size:=size;
      Memo_6.Width:=with_summa*fr1cm;
      Memo_6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_6.DisplayFormat.Kind:=fkNumeric;
      Memo_6.DisplayFormat.FormatStr:='%2.2n';
      Memo_6.VAlign:=vaCenter;
      Memo_6.HAlign:=haRight;
//      Memo_6.StretchMode:=smMaxHeight;
      Memo_6.Font.Style:=[fsBold];

      Memo_7:=TfrxMemoView.Create(band_footer);
      Memo_7.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo_7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo_7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo_7.Height:=h_memo;
      memo_7.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width+Memo_5.Width+Memo_6.Width;
      Memo_7.Font.Size:=size;
      Memo_7.Width:=with_summa*fr1cm;
      Memo_7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_7.DisplayFormat.Kind:=fkNumeric;
      Memo_7.DisplayFormat.FormatStr:='%2.2n';
      Memo_7.VAlign:=vaCenter;
      Memo_7.HAlign:=haRight;
//      Memo_7.StretchMode:=smMaxHeight;
      Memo_7.Font.Style:=[fsBold];

      Memo_8:=TfrxMemoView.Create(band_footer);
      Memo_8.CreateUniqueName;
      if IS_VALYUTA =1 then
      Memo_8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10 + '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo_8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo_8.Height:=h_memo;
      memo_8.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width+Memo_5.Width+Memo_6.Width+Memo_7.Width;
      Memo_8.Font.Size:=size;
      Memo_8.Width:=with_summa*fr1cm;
      Memo_8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_8.DisplayFormat.Kind:=fkNumeric;
      Memo_8.DisplayFormat.FormatStr:='%2.2n';
      Memo_8.HAlign:=haRight;
      Memo_8.VAlign:=vaCenter;
//      Memo_8.StretchMode:=smMaxHeight;
      Memo_8.Font.Style:=[fsBold];

        memo_vik:=TfrxMemoView.Create(band_footer);
      memo_vik.CreateUniqueName;
      memo_vik.Text:='Виконавець';
      memo_vik.Height:=0.8*fr1cm;
      memo_vik.top:=1.1*fr1cm;
      memo_vik.Left:=1*fr1cm;
      memo_vik.Font.Size:=8;
      memo_vik.Width:=2*fr1cm;
      memo_vik.HAlign:=haLeft;
      memo_vik.VAlign:=vaCenter;
//      memo_vik.StretchMode:=smMaxHeight;
      if NOT_PRINT_FIO_ISPOLN=1 then  memo_vik.Visible:=False;

      memo_vik_underline:=TfrxMemoView.Create(band_footer);
      memo_vik_underline.CreateUniqueName;
      memo_vik_underline.Text:='';
      memo_vik_underline.Height:=0.8*fr1cm;
      memo_vik_underline.top:=1.1*fr1cm;
      memo_vik_underline.Left:=3*fr1cm;
      memo_vik_underline.Font.Size:=8;
      memo_vik_underline.Width:=6.3*fr1cm;
      memo_vik_underline.Frame.Typ:=[ftBottom];
      memo_vik_underline.HAlign:=haLeft;
      memo_vik_underline.VAlign:=vaCenter;
      if NOT_PRINT_FIO_ISPOLN=1 then  memo_vik_underline.Visible:=False;
//      memo_vik_underline.StretchMode:=smMaxHeight;

      memo_user:=TfrxMemoView.Create(band_footer);
      memo_user.CreateUniqueName;
      memo_user.Text:='/'+USER_FIO+'/';
      memo_user.Height:=0.8*fr1cm;
      memo_user.top:=1.1*fr1cm;
      memo_user.Left:=9.3*fr1cm;
      memo_user.Font.Size:=8;
      memo_user.Width:=9.6*fr1cm;
      memo_user.HAlign:=haLeft;
      memo_user.VAlign:=vaCenter;
      if NOT_PRINT_FIO_ISPOLN=1 then  memo_user.Visible:=False;
end;

if FORM_UCH = 19 then
begin
  frReport.Clear;                         //создаем страницу отчета
  frReport.DataSets.Add(frxDBDataset1);

  page:=TfrxReportPage.Create(frReport);
  page.CreateUniqueName;
  page.SetDefaults;

  size:=6;
  size_zagolovok:=8;
  with_summa:=1.7;
  
  band_head:=TfrxReportTitle.Create(page);
  band_head.Top:=0;
  band_head.Height:=4.2*fr1cm;
  top_next:=band_head.top + band_head.Height;

  memo_name:=TfrxMemoView.Create(band_head);
  memo_name.CreateUniqueName;
  memo_name.Height:=0.4*fr1cm;
  memo_name.Width:=10.8*fr1cm;
  memo_name.Frame.Typ:=[ftBottom];
  memo_name.Font.Size:=size;
  memo_name.Left:=0*fr1cm;
  memo_name.top:=0.2*fr1cm;
  memo_name.HAlign:=haCenter;
  memo_name.VAlign:=vaCenter;
  memo_name.Text:=ORG_FULL_NAME;
  memo_name.Font.Style:=[fsBold];

  memo_inn:=TfrxMemoView.Create(band_head);
  memo_inn.CreateUniqueName;
  memo_inn.Height:=0.8*fr1cm;
  memo_inn.Width:=2.5*fr1cm;
  memo_inn.Font.Size:=size;
  memo_inn.Left:=0*fr1cm;
  memo_inn.top:=0.6*fr1cm;
  memo_inn.HAlign:=haCenter;
  memo_inn.VAlign:=vaCenter;
  memo_inn.Text:='Ідентифікаційний код ЄДРПОУ';

  memo_inn_num:=TfrxMemoView.Create(band_head);
  memo_inn_num.CreateUniqueName;
  memo_inn_num.Height:=0.5*fr1cm;
  memo_inn_num.Width:=3*fr1cm;
  memo_inn_num.Font.Size:=size;
  memo_inn_num.Left:=2.6*fr1cm;
  memo_inn_num.top:=0.8*fr1cm;
  memo_inn_num.HAlign:=haCenter;
  memo_inn_num.VAlign:=vaCenter;
  memo_inn_num.Text:=ORG_KOD_OKPO;
  memo_inn_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];

  memo_period:=TfrxMemoView.Create(band_head);
  memo_period.CreateUniqueName;
  memo_period.Height:=1.3*fr1cm;
  memo_period.Width:=19*fr1cm;
  memo_period.Font.Size:=14;
  memo_period.Left:=0*fr1cm;
  memo_period.top:=1.8*fr1cm;
  memo_period.HAlign:=haCenter;
  memo_period.VAlign:=vaCenter;
  memo_period.Text:='Звіт за період з '+DatetoStr(StartOfAMonth(y_beg, m_beg))+' по '+Datetostr(EndOfAMonth(y_end, m_end));
  memo_period.Font.Style:=[fsBold];

  sch_for_sysytem:=TfrxMemoView.Create(band_head);
  sch_for_sysytem.CreateUniqueName;
  sch_for_sysytem.Height:=1*fr1cm;
  sch_for_sysytem.Width:=19*fr1cm;
  sch_for_sysytem.Font.Size:=10;
  sch_for_sysytem.Left:=0*fr1cm;
  sch_for_sysytem.top:=3.1*fr1cm;
  sch_for_sysytem.HAlign:=haCenter;
  sch_for_sysytem.VAlign:=vaCenter;
  sch_for_sysytem.Text:='Рахунки системи: '+ SCH_SYSTEM;

  band:=TfrxPageHeader.Create(page);      //"верхушка" очета
  band.CreateUniqueName;
  band.top:=top_next;
  band.Height:=1*fr1cm;
  top_next:=band.top + band.Height;

  memo_num:=TfrxMemoView.Create(band);
  memo_num.CreateUniqueName;
  memo_num.Height:=1*fr1cm;
  memo_num.Width:=1*fr1cm;
  memo_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_num.Font.Size:=size;
  memo_num.Left:=0*fr1cm;
  memo_num.top:=0;
  memo_num.HAlign:=haCenter;
  memo_num.VAlign:=vaCenter;
  memo_num.Color:= $00E4E4E4;
  memo_num.Text:='№ п/п';

  Memo_PIB:=TfrxMemoView.Create(band);
  Memo_PIB.CreateUniqueName;
  Memo_PIB.Height:=1*fr1cm;
  Memo_PIB.Width:=5.8*fr1cm;
  Memo_PIB.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_PIB.Font.Size:=size;
  Memo_PIB.Left:=memo_num.Width;
  memo_PIB.top:=0;
  Memo_PIB.HAlign:=haCenter;
  Memo_PIB.VAlign:=vaCenter;
  Memo_PIB.Color:= $00E4E4E4;
  Memo_PIB.Text:='ПІБ';

  Memo_Ist:=TfrxMemoView.Create(band);
  Memo_Ist.CreateUniqueName;
  Memo_Ist.Height:=0.5*fr1cm;
  Memo_Ist.Width:=2*fr1cm;
  Memo_Ist.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_Ist.Font.Size:=size;
  Memo_Ist.Left:=memo_num.Width+memo_pib.Width;
  memo_Ist.top:=0;
  Memo_Ist.HAlign:=haCenter;
  Memo_Ist.VAlign:=vaCenter;
  Memo_Ist.Color:= $00E4E4E4;
  Memo_Ist.Text:='Дж. фін.';

  Memo_sm:=TfrxMemoView.Create(band);
  Memo_sm.CreateUniqueName;
  Memo_sm.Height:=0.5*fr1cm;
  Memo_sm.Width:=2*fr1cm;
  Memo_sm.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_sm.Font.Size:=size;
  Memo_sm.Left:=memo_num.Width+memo_pib.Width;
  Memo_sm.top:=0.5*fr1cm;
  Memo_sm.HAlign:=haCenter;
  Memo_sm.VAlign:=vaCenter;
  Memo_sm.Color:= $00E4E4E4;
  Memo_sm.Text:='кш/рз/ст/КЕКВ';

  saldo_in:=TfrxMemoView.Create(band);
  saldo_in.CreateUniqueName;
  saldo_in.Height:=0.5*fr1cm;
  saldo_in.Width:=3.4*fr1cm;
  saldo_in.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  saldo_in.Font.Size:=size;
  saldo_in.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width;
  saldo_in.top:=0;
  saldo_in.HAlign:=haCenter;
  saldo_in.VAlign:=vaCenter;
  saldo_in.Color:= $00E4E4E4;
  saldo_in.Text:='Сальдо вхідне';

  s_in_db:=TfrxMemoView.Create(band);
  s_in_db.CreateUniqueName;
  s_in_db.Height:=0.5*fr1cm;
  s_in_db.Width:=with_summa*fr1cm;
  s_in_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_db.Font.Size:=size;
  s_in_db.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width;
  s_in_db.top:=0.5*fr1cm;
  s_in_db.HAlign:=haCenter;
  s_in_db.VAlign:=vaCenter;
  s_in_db.Color:= $00E4E4E4;
  s_in_db.Text:='Дебет';

  s_in_kr:=TfrxMemoView.Create(band);
  s_in_kr.CreateUniqueName;
  s_in_kr.Height:=0.5*fr1cm;
  s_in_kr.Width:=with_summa*fr1cm;
  s_in_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_kr.Font.Size:=size;
  s_in_kr.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+s_in_db.Width;
  s_in_kr.top:=0.5*fr1cm;
  s_in_kr.HAlign:=haCenter;
  s_in_kr.VAlign:=vaCenter;
  s_in_kr.Color:= $00E4E4E4;
  s_in_kr.Text:='Кредит';

  db:=TfrxMemoView.Create(band);
  db.CreateUniqueName;
  db.Height:=0.5*fr1cm;
  db.Width:=with_summa*fr1cm;
  db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db.Font.Size:=size;
  db.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+s_in_db.Width+s_in_kr.Width;
  db.top:=0;
  db.HAlign:=haCenter;
  db.VAlign:=vaCenter;
  db.Color:= $00E4E4E4;
  db.Text:='Дебет';

  db_s:=TfrxMemoView.Create(band);
  db_s.CreateUniqueName;
  db_s.Height:=0.5*fr1cm;
  db_s.Width:=with_summa*fr1cm;
  db_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db_s.Font.Size:=size;
  db_s.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+s_in_db.Width+s_in_kr.Width;
  db_s.top:=0.5*fr1cm;
  db_s.HAlign:=haCenter;
  db_s.VAlign:=vaCenter;
  db_s.Color:= $00E4E4E4;
  db_s.Text:='Сума';

  kr:=TfrxMemoView.Create(band);
  kr.CreateUniqueName;
  kr.Height:=0.5*fr1cm;
  kr.Width:=with_summa*fr1cm;
  kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr.Font.Size:=size;
  kr.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+s_in_db.Width+s_in_kr.Width+db_s.Width;
  kr.top:=0;
  kr.HAlign:=haCenter;
  kr.VAlign:=vaCenter;
  kr.Color:= $00E4E4E4;
  kr.Text:='Кредит';

  kr_s:=TfrxMemoView.Create(band);
  kr_s.CreateUniqueName;
  kr_s.Height:=0.5*fr1cm;
  kr_s.Width:=with_summa*fr1cm;
  kr_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr_s.Font.Size:=size;
  kr_s.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+s_in_db.Width+s_in_kr.Width+db_s.Width;
  kr_s.top:=0.5*fr1cm;
  kr_s.HAlign:=haCenter;
  kr_s.VAlign:=vaCenter;
  kr_s.Color:= $00E4E4E4;
  kr_s.Text:='Сума';

  saldo_out:=TfrxMemoView.Create(band);
  saldo_out.CreateUniqueName;
  saldo_out.Height:=0.5*fr1cm;
  saldo_out.Width:=3.4*fr1cm;
  saldo_out.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  saldo_out.Font.Size:=size;
  saldo_out.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+s_in_db.Width+s_in_kr.Width+db_s.Width+kr_s.Width;
  saldo_out.top:=0;
  saldo_out.HAlign:=haCenter;
  saldo_out.VAlign:=vaCenter;
  saldo_out.Color:= $00E4E4E4;
  saldo_out.Text:='Сальдо вихідне';

  s_out_db:=TfrxMemoView.Create(band);
  s_out_db.CreateUniqueName;
  s_out_db.Height:=0.5*fr1cm;
  s_out_db.Width:=with_summa*fr1cm;
  s_out_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_db.Font.Size:=size;
  s_out_db.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+s_in_db.Width+s_in_kr.Width+db_s.Width+kr_s.Width;
  s_out_db.top:=0.5*fr1cm;
  s_out_db.HAlign:=haCenter;
  s_out_db.VAlign:=vaCenter;
  s_out_db.Color:= $00E4E4E4;
  s_out_db.Text:='Дебет';

  s_out_kr:=TfrxMemoView.Create(band);
  s_out_kr.CreateUniqueName;
  s_out_kr.Height:=0.5*fr1cm;
  s_out_kr.Width:=with_summa*fr1cm;
  s_out_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_kr.Font.Size:=size;
  s_out_kr.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+s_in_db.Width+s_in_kr.Width+db_s.Width+kr_s.Width+s_out_kr.Width;
  s_out_kr.top:=0.5*fr1cm;
  s_out_kr.HAlign:=haCenter;
  s_out_kr.VAlign:=vaCenter;
  s_out_kr.Color:= $00E4E4E4;
  s_out_kr.Text:='Кредит';

  // верх закончили

  //верхние группы
  if obsh_flag = 1 then
   begin
       fac:=TfrxGroupHeader.Create(page);
       fac.CreateUniqueName;
       fac.top:=top_next;
       fac.Height:=0.8*fr1cm;
       top_next:=fac.top + fac.Height;

       fac.Condition:='frxDBDataset1."BUILDS"' ;

       fac_1:=TfrxMemoView.Create(fac);
       fac_1.CreateUniqueName;
       fac_1.Height:=0.8*fr1cm;
       fac_1.Width:=19*fr1cm;
       fac_1.Font.Size:=size_zagolovok;
       fac_1.Left:=0;
       fac_1.top:=0;
       fac_1.HAlign:=haCenter;
       fac_1.VAlign:=vaCenter;
       fac_1.Font.Style:=[fsBold];
       fac_1.Frame.Typ:=[ftLeft,ftRight];
       fac_1.Text:='[frxDBDataset1."BUILDS"]';
   end;

  if fac_st_flag = 1 then
   begin
       spec:=TfrxGroupHeader.Create(page);
       spec.CreateUniqueName;
       spec.top:=top_next;
       spec.Height:=0.8*fr1cm;
       top_next:=spec.top + spec.Height;
       spec.Condition:='frxDBDataset1."NAME_FAK"' ;

       spec_1:=TfrxMemoView.Create(spec);
       spec_1.CreateUniqueName;
       spec_1.Height:=0.8*fr1cm;
       spec_1.Width:=4*fr1cm;
       spec_1.Font.Size:=size_zagolovok;
       spec_1.Left:=0;
       spec_1.top:=0;
       spec_1.HAlign:=haLeft;
       spec_1.VAlign:=vaCenter;
       spec_1.Frame.Typ:=[ftLeft];
       spec_1.Text:='Факультет:';

       spec_2:=TfrxMemoView.Create(spec);
       spec_2.CreateUniqueName;
       spec_2.Height:=0.8*fr1cm;
       spec_2.Width:=15*fr1cm;
       spec_2.Font.Size:=size_zagolovok;
       spec_2.Left:=spec_1.Width;
       spec_2.top:=0;
       spec_2.Font.Style:=[fsBold];
       spec_2.HAlign:=haLeft;
       spec_2.VAlign:=vaCenter;
       spec_2.Frame.Typ:=[ftRight];
       spec_2.Text:='[frxDBDataset1."NAME_FAK"]';
   end;

  if kurs_st_flag = 1 then
   begin
       nat:=TfrxGroupHeader.Create(page);
       nat.CreateUniqueName;
       nat.top:=top_next;
       nat.Height:=0.8*fr1cm;
       top_next:=nat.top + nat.Height;
       nat.Condition:='frxDBDataset1."KURS"' ;

       nat_1:=TfrxMemoView.Create(nat);
       nat_1.CreateUniqueName;
       nat_1.Height:=0.8*fr1cm;
       nat_1.Width:=4*fr1cm;
       nat_1.Font.Size:=size_zagolovok;
       nat_1.Left:=0;
       nat_1.top:=0;
       nat_1.HAlign:=haLeft;
       nat_1.VAlign:=vaCenter;
       nat_1.Frame.Typ:=[ftLeft];
       nat_1.Text:='Курс:';

       nat_2:=TfrxMemoView.Create(nat);
       nat_2.CreateUniqueName;
       nat_2.Height:=0.8*fr1cm;
       nat_2.Width:=15*fr1cm;
       nat_2.Font.Size:=size_zagolovok;
       nat_2.Left:=nat_1.Width;
       nat_2.top:=0;
       nat_2.Font.Style:=[fsBold];
       nat_2.HAlign:=haLeft;
       nat_2.VAlign:=vaCenter;
       nat_2.Frame.Typ:=[ftRight];
       nat_2.Text:='[frxDBDataset1."KURS"]';
   end;

  if kat_pay_flag = 1 then
   begin
       f_st:=TfrxGroupHeader.Create(page);
       f_st.CreateUniqueName;
       f_st.top:=top_next;
       f_st.Height:=0.8*fr1cm;
       top_next:=f_st.top + f_st.Height;
       f_st.Condition:='frxDBDataset1."CAT_PAY"' ;

       f_st_1:=TfrxMemoView.Create(f_st);
       f_st_1.CreateUniqueName;
       f_st_1.Height:=0.8*fr1cm;
       f_st_1.Width:=4*fr1cm;
       f_st_1.Font.Size:=size_zagolovok;
       f_st_1.Left:=0;
       f_st_1.top:=0;
       f_st_1.HAlign:=haLeft;
       f_st_1.VAlign:=vaCenter;
       f_st_1.Frame.Typ:=[ftLeft];
       f_st_1.Text:='Категорія оплати:';

       f_st_2:=TfrxMemoView.Create(f_st);
       f_st_2.CreateUniqueName;
       f_st_2.Height:=0.8*fr1cm;
       f_st_2.Width:=15*fr1cm;
       f_st_2.Font.Size:=size_zagolovok;
       f_st_2.Left:=f_st_1.Width;
       f_st_2.top:=0;
       f_st_2.Font.Style:=[fsBold];
       f_st_2.HAlign:=haLeft;
       f_st_2.VAlign:=vaCenter;
       f_st_2.Frame.Typ:=[ftRight];
       f_st_2.Text:='[frxDBDataset1."CAT_PAY"]';
   end;

  if type_live_flag = 1 then
   begin
       k_st:=TfrxGroupHeader.Create(page);
       k_st.CreateUniqueName;
       k_st.top:=top_next;
       k_st.Height:=0.8*fr1cm;
       top_next:=k_st.top + k_st.Height;
       k_st.Condition:='frxDBDataset1."TYPE_LIVE"' ;

       k_st_1:=TfrxMemoView.Create(k_st);
       k_st_1.CreateUniqueName;
       k_st_1.Height:=0.8*fr1cm;
       k_st_1.Width:=4*fr1cm;
       k_st_1.Font.Size:=size_zagolovok;
       k_st_1.Left:=0;
       k_st_1.top:=0;
       k_st_1.HAlign:=haLeft;
       k_st_1.VAlign:=vaCenter;
       k_st_1.Frame.Typ:=[ftLeft];
       k_st_1.Text:='Тип проживання:';

       k_st_2:=TfrxMemoView.Create(k_st);
       k_st_2.CreateUniqueName;
       k_st_2.Height:=0.8*fr1cm;
       k_st_2.Width:=15*fr1cm;
       k_st_2.Font.Size:=size_zagolovok;
       k_st_2.Left:=k_st_2.Width;
       k_st_2.top:=0;
       k_st_2.Font.Style:=[fsBold];
       k_st_2.HAlign:=haLeft;
       k_st_2.VAlign:=vaCenter;
       k_st_2.Frame.Typ:=[ftRight];
       k_st_2.Text:='[frxDBDataset1."TYPE_LIVE"]';
   end;

  if cl_live_flag = 1 then
   begin
       kurs:=TfrxGroupHeader.Create(page);
       kurs.CreateUniqueName;
       kurs.top:=top_next;
       kurs.Height:=0.8*fr1cm;
       top_next:=kurs.top + kurs.Height;
       kurs.Condition:='frxDBDataset1."CLASS_LIVE"' ;

       kurs_1:=TfrxMemoView.Create(kurs);
       kurs_1.CreateUniqueName;
       kurs_1.Height:=0.8*fr1cm;
       kurs_1.Width:=4*fr1cm;
       kurs_1.Font.Size:=size_zagolovok;
       kurs_1.Left:=0;
       kurs_1.top:=0;
       kurs_1.HAlign:=haLeft;
       kurs_1.VAlign:=vaCenter;
       kurs_1.Frame.Typ:=[ftLeft];
       kurs_1.Text:='Клас проживання:';

       kurs_2:=TfrxMemoView.Create(kurs);
       kurs_2.CreateUniqueName;
       kurs_2.Height:=0.8*fr1cm;
       kurs_2.Width:=15*fr1cm;
       kurs_2.Font.Size:=size_zagolovok;
       kurs_2.Left:=kurs_1.Width;
       kurs_2.top:=0;
       kurs_2.Font.Style:=[fsBold];
       kurs_2.HAlign:=haLeft;
       kurs_2.VAlign:=vaCenter;
       kurs_2.Frame.Typ:=[ftRight];
       kurs_2.Text:='[frxDBDataset1."CLASS_LIVE"]';
   end;

  if grp_flag = 1 then
   begin
       n_gr:=TfrxGroupHeader.Create(page);
       n_gr.CreateUniqueName;
       n_gr.top:=top_next;
       n_gr.Height:=0.8*fr1cm;
       top_next:=n_gr.top + n_gr.Height;
       n_gr.Condition:='frxDBDataset1."NAME_GROUP"' ;

       n_gr_1:=TfrxMemoView.Create(n_gr);
       n_gr_1.CreateUniqueName;
       n_gr_1.Height:=0.8*fr1cm;
       n_gr_1.Width:=4*fr1cm;
       n_gr_1.Font.Size:=size_zagolovok;
       n_gr_1.Left:=0;
       n_gr_1.top:=0;
       n_gr_1.HAlign:=haLeft;
       n_gr_1.VAlign:=vaCenter;
       n_gr_1.Frame.Typ:=[ftLeft];
       n_gr_1.Text:='Група:';

       n_gr_2:=TfrxMemoView.Create(n_gr);
       n_gr_2.CreateUniqueName;
       n_gr_2.Height:=0.8*fr1cm;
       n_gr_2.Width:=15*fr1cm;
       n_gr_2.Font.Size:=size_zagolovok;
       n_gr_2.Left:=n_gr_1.Width;
       n_gr_2.top:=0;
       n_gr_2.Font.Style:=[fsBold];
       n_gr_2.HAlign:=haLeft;
       n_gr_2.VAlign:=vaCenter;
       n_gr_2.Frame.Typ:=[ftRight];
       n_gr_2.Text:='[frxDBDataset1."NAME_GROUP"]';
   end;
   //мастер дата

  DataBand:=TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.DataSet:=frxDBDataSet1;
  DAtaBand.Top:=top_next;
  DataBand.Height:=0.5*fr1cm;
  top_next:=DataBand.Top+DataBand.Height;
  DAtaBand.Stretched:=True;
 // if druk_pid = True then DataBand.Visible := False;

  memo_num:=TfrxMemoView.Create(DataBand);
  memo_num.CreateUniqueName;
  memo_num.Height:=0.5*fr1cm;
  memo_num.Width:=1*fr1cm;
  memo_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_num.Font.Size:=size;
  memo_num.Left:=0*fr1cm;
  memo_num.top:=0;
  memo_num.Text:='[Line]';
  memo_num.StretchMode:=smMaxHeight;
  memo_num.VAlign:=vaCenter;
  memo_num.HAlign:=haRight;

  Memo_PIB:=TfrxMemoView.Create(DataBand);
  Memo_PIB.CreateUniqueName;
  Memo_PIB.Height:=0.5*fr1cm;
  Memo_PIB.Width:=5.8*fr1cm;
  Memo_PIB.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_PIB.Font.Size:=size;
  Memo_PIB.Left:=memo_num.Width;
  memo_PIB.top:=0;
  Memo_PIB.Text:='[frxDBDataset1."FIO"] ([frxDBDataset1."NUM_DOG"])';
  Memo_PIB.StretchMode:=smMaxHeight;
  Memo_PIB.VAlign:=vaCenter;

  Memo_sm:=TfrxMemoView.Create(DataBand);
  Memo_sm.CreateUniqueName;
  Memo_sm.Height:=0.5*fr1cm;
  Memo_sm.Width:=2*fr1cm;
  Memo_sm.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_sm.Font.Size:=size;
  Memo_sm.Left:=memo_num.Width+memo_pib.Width;
  Memo_sm.top:=0;
  Memo_sm.HAlign:=haCenter;
  Memo_sm.Text:='[frxDBDataset1."SM_KOD"]/[frxDBDataset1."RZ_KOD"]/[frxDBDataset1."ST_KOD"]/[frxDBDataset1."KEKV_KOD"]';
  Memo_sm.StretchMode:=smMaxHeight;
  Memo_sm.VAlign:=vaCenter;

  s_in_db:=TfrxMemoView.Create(DataBand);
  s_in_db.CreateUniqueName;
  s_in_db.Height:=0.5*fr1cm;;
  s_in_db.Width:=with_summa*fr1cm;
  s_in_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_db.Font.Size:=size;
  s_in_db.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width;
  s_in_db.top:=0;
  s_in_db.HAlign:=haRight;
  s_in_db.DisplayFormat.Kind:=fkNumeric;
  s_in_db.DisplayFormat.FormatStr:='%2.2n';
  s_in_db.Text:='[frxDBDataset1."IN_DB_SUMMA"]';
  s_in_db.StretchMode:=smMaxHeight;
  s_in_db.VAlign:=vaCenter;

  s_in_kr:=TfrxMemoView.Create(DataBand);
  s_in_kr.CreateUniqueName;
  s_in_kr.Height:=0.5*fr1cm;;
  s_in_kr.Width:=with_summa*fr1cm;
  s_in_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_kr.Font.Size:=size;
  s_in_kr.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width;
  s_in_kr.top:=0;
  s_in_kr.HAlign:=haRight;
  s_in_kr.DisplayFormat.Kind:=fkNumeric;
  s_in_kr.DisplayFormat.FormatStr:='%2.2n';
  s_in_kr.Text:='[frxDBDataset1."IN_KR_SUMMA"]';
  s_in_kr.StretchMode:=smMaxHeight;
  s_in_kr.VAlign:=vaCenter;

  db_s:=TfrxMemoView.Create(DataBand);
  db_s.CreateUniqueName;
  db_s.Height:=0.5*fr1cm;
  db_s.Width:=with_summa*fr1cm;
  db_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db_s.Font.Size:=size;
  db_s.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width+s_in_kr.Width;
  db_s.top:=0;
  db_s.HAlign:=haRight;
  db_s.DisplayFormat.Kind:=fkNumeric;
  db_s.DisplayFormat.FormatStr:='%2.2n';
  db_s.Text:='[frxDBDataset1."DB_SUMMA"]';
  db_s.StretchMode:=smMaxHeight;
  db_s.VAlign:=vaCenter;

  kr_s:=TfrxMemoView.Create(DataBand);
  kr_s.CreateUniqueName;
  kr_s.Height:=0.5*fr1cm;
  kr_s.Width:=with_summa*fr1cm;
  kr_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr_s.Font.Size:=size;
  kr_s.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width+s_in_kr.Width+db_s.Width;
  kr_s.top:=0;
  kr_s.HAlign:=haRight;
  kr_s.DisplayFormat.Kind:=fkNumeric;
  kr_s.DisplayFormat.FormatStr:='%2.2n';
  kr_s.Text:='[frxDBDataset1."KR_SUMMA"]';
  kr_s.StretchMode:=smMaxHeight;
  kr_s.VAlign:=vaCenter;

  s_out_db:=TfrxMemoView.Create(DataBand);
  s_out_db.CreateUniqueName;
  s_out_db.Height:=0.5*fr1cm;
  s_out_db.Width:=with_summa*fr1cm;
  s_out_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_db.Font.Size:=size;
  s_out_db.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width+s_in_kr.Width+db_s.Width+kr_s.Width;
  s_out_db.top:=0;
  s_out_db.HAlign:=haRight;
  s_out_db.DisplayFormat.Kind:=fkNumeric;
  s_out_db.DisplayFormat.FormatStr:='%2.2n';
  s_out_db.Text:='[frxDBDataset1."OUT_DB_SUMMA"]';
  s_out_db.StretchMode:=smMaxHeight;
  s_out_db.VAlign:=vaCenter;

  s_out_kr:=TfrxMemoView.Create(DataBand);
  s_out_kr.CreateUniqueName;
  s_out_kr.Height:=0.5*fr1cm;
  s_out_kr.Width:=with_summa*fr1cm;
  s_out_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_kr.Font.Size:=size;
  s_out_kr.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width+s_in_kr.Width+db_s.Width+kr_s.Width+s_out_kr.Width;
  s_out_kr.top:=0;
  s_out_kr.HAlign:=haRight;
  s_out_kr.DisplayFormat.Kind:=fkNumeric;
  s_out_kr.DisplayFormat.FormatStr:='%2.2n';
  s_out_kr.Text:='[frxDBDataset1."OUT_KR_SUMMA"]';
  s_out_kr.StretchMode:=smMaxHeight;
  s_out_kr.VAlign:=vaCenter;

  // нижние группы
  if grp_flag = 1 then
   begin
      n_gr_f:=TfrxGroupFooter.Create(page);
      n_gr_f.CreateUniqueName;
      n_gr_f.top:=top_next;
      n_gr_f.Height:=0.8*fr1cm;
      top_next:=n_gr_f.Top+n_gr_f.Height;
      n_gr_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(n_gr_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по групі: ';
      Memo1.Height:=n_gr_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(n_gr_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_GROUP"]';
      Memo2.Height:=n_gr_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.8*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(n_gr_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=n_gr_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=with_summa*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(n_gr_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=n_gr_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=with_summa*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(n_gr_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=n_gr_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(n_gr_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=n_gr_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(n_gr_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=n_gr_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(n_gr_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=n_gr_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if cl_live_flag = 1 then
   begin
      kurs_f:=TfrxGroupFooter.Create(page);
      kurs_f.CreateUniqueName;
      kurs_f.top:=top_next;
      kurs_f.Height:=0.8*fr1cm;
      top_next:=kurs_f.Top+kurs_f.Height;
      kurs_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(kurs_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по класу проживання: ';
      Memo1.Height:=kurs_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(kurs_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."CLASS_LIVE"]';
      Memo2.Height:=kurs_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.8*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(kurs_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=kurs_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=with_summa*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(kurs_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=kurs_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=with_summa*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(kurs_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=kurs_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(kurs_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=kurs_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(kurs_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=kurs_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(kurs_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=kurs_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;

   end;

  if type_live_flag = 1 then
   begin
      k_st_f:=TfrxGroupFooter.Create(page);
      k_st_f.CreateUniqueName;
      k_st_f.top:=top_next;
      k_st_f.Height:=0.8*fr1cm;
      top_next:=k_st_f.Top+k_st_f.Height;
      k_st_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(k_st_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по типу проживання: ';
      Memo1.Height:=k_st_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(k_st_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."TYPE_LIVE"]';
      Memo2.Height:=k_st_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.8*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(k_st_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=k_st_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=with_summa*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(k_st_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=k_st_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=with_summa*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(k_st_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=k_st_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(k_st_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=k_st_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(k_st_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=k_st_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(k_st_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=k_st_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if kat_pay_flag = 1 then
   begin
      f_st_f:=TfrxGroupFooter.Create(page);
      f_st_f.CreateUniqueName;
      f_st_f.top:=top_next;
      f_st_f.Height:=0.8*fr1cm;
      top_next:=f_st_f.Top+f_st_f.Height;
      f_st_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(f_st_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по категорії оплати: ';
      Memo1.Height:=f_st_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(f_st_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."CAT_PAY"]';
      Memo2.Height:=f_st_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.8*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.Font.Style:=[fsBold];
      Memo2.VAlign:=vaCenter;
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(f_st_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=f_st_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=with_summa*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(f_st_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=f_st_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=with_summa*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(f_st_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=f_st_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(f_st_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=f_st_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(f_st_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=f_st_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(f_st_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=f_st_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if kurs_st_flag = 1 then
   begin
      nat_f:=TfrxGroupFooter.Create(page);
      nat_f.CreateUniqueName;
      nat_f.top:=top_next;
      nat_f.Height:=0.8*fr1cm;
      top_next:=nat_f.Top+nat_f.Height;
      nat_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(nat_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по курсу: ';
      Memo1.Height:=nat_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(nat_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."KURS"]';
      Memo2.Height:=nat_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.8*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.Font.Style:=[fsBold];
      Memo2.VAlign:=vaCenter;
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(nat_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=nat_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=with_summa*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(nat_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=nat_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=with_summa*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(nat_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=nat_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(nat_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=nat_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(nat_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=nat_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(nat_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=nat_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if fac_st_flag = 1 then
   begin
      spec_f:=TfrxGroupFooter.Create(page);
      spec_f.CreateUniqueName;
      spec_f.top:=top_next;
      spec_f.Height:=0.8*fr1cm;
      top_next:=spec_f.Top+spec_f.Height;
      spec_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(spec_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по факультету: ';
      Memo1.Height:=spec_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(spec_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_FAK"]';
      Memo2.Height:=spec_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.8*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(spec_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=spec_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=with_summa*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(spec_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=spec_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=with_summa*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(spec_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=spec_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(spec_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=spec_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(spec_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=spec_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(spec_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=spec_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if obsh_flag = 1 then
   begin
      fac_f:=TfrxGroupFooter.Create(page);
      fac_f.CreateUniqueName;
      fac_f.top:=top_next;
      fac_f.Height:=0.8*fr1cm;
      top_next:=fac_f.Top+fac_f.Height;
      fac_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(fac_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по гуртожитку: ';
      Memo1.Height:=fac_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(fac_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."BUILDS"]';
      Memo2.Height:=fac_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.8*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(fac_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=fac_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=with_summa*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(fac_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=fac_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=with_summa*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(fac_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=fac_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(fac_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=fac_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(fac_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=fac_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(fac_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=fac_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.HAlign:=haRight;
      Memo8.VAlign:=vaCenter;
      Memo8.StretchMode:=smMaxHeight;
   end;
     //page_foter
   page_footer:=TfrxPageFooter.Create(page);
   page_footer.CreateUniqueName;
   page_footer.top:=top_next;
   page_footer.Height:=0.8*fr1cm;
   top_next:=page_footer.top + page_footer.Height;

   date_print:=TfrxMemoView.Create(page_footer);
   date_print.CreateUniqueName;
   date_print.Text:='Дата друку: [Now]';
   date_print.Height:=page_footer.Height;
   date_print.Left:=0;
   date_print.Font.Size:=8;
   date_print.Width:=5.4*fr1cm;
   date_print.VAlign:=vaCenter;
//   date_print.StretchMode:=smMaxHeight;

   page_print:=TfrxMemoView.Create(page_footer);
   page_print.CreateUniqueName;
   page_print.Text:='Стор. [Page#] із [TotalPages#]';
   page_print.Height:=page_footer.Height;
   page_print.Left:=13.6*fr1cm;
   page_print.Font.Size:=8;
   page_print.Width:=5.4*fr1cm;
   page_print.VAlign:=vaCenter;
 //  page_print.StretchMode:=smMaxHeight;
  //report summary
  band_footer:=TfrxReportSummary.Create(page);
  band_footer.CreateUniqueName;
  band_footer.top:=top_next;
  band_footer.Height:=2.7*fr1cm;
  top_next:=band_footer.top + band_footer.Height;
  h_memo:=0.8*fr1cm;
  //height:=band.Height;
      Memo_1:=TfrxMemoView.Create(band_footer);
      Memo_1.CreateUniqueName;
      Memo_1.Text:='Всього: ';
      Memo_1.Height:=h_memo;
      memo_1.Left:=0;
      Memo_1.Font.Size:=size;
      Memo_1.Width:=8.8*fr1cm;
      Memo_1.VAlign:=vaCenter;
      Memo_1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
//      Memo_1.StretchMode:=smMaxHeight;
      Memo_1.Font.Style:=[fsBold];

      Memo_3:=TfrxMemoView.Create(band_footer);
      Memo_3.CreateUniqueName;
      Memo_3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo_3.Height:=h_memo;
      memo_3.Left:=Memo_1.Width;
      Memo_3.Font.Size:=size;
      Memo_3.Width:=with_summa*fr1cm;
      Memo_3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_3.DisplayFormat.Kind:=fkNumeric;
      Memo_3.DisplayFormat.FormatStr:='%2.2n';
      Memo_3.VAlign:=vaCenter;
      Memo_3.HAlign:=haRight;
//      Memo_3.StretchMode:=smMaxHeight;
      Memo_3.Font.Style:=[fsBold];

      Memo_4:=TfrxMemoView.Create(band_footer);
      Memo_4.CreateUniqueName;
      Memo_4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo_4.Height:=h_memo;
      memo_4.Left:=Memo_1.Width+Memo_3.Width;
      Memo_4.Font.Size:=size;
      Memo_4.Width:=with_summa*fr1cm;
      Memo_4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_4.DisplayFormat.Kind:=fkNumeric;
      Memo_4.DisplayFormat.FormatStr:='%2.2n';
      Memo_4.VAlign:=vaCenter;
      Memo_4.HAlign:=haRight;
//      Memo_4.StretchMode:=smMaxHeight;
      Memo_4.Font.Style:=[fsBold];

      Memo_5:=TfrxMemoView.Create(band_footer);
      Memo_5.CreateUniqueName;
      Memo_5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo_5.Height:=h_memo;
      memo_5.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width;
      Memo_5.Font.Size:=size;
      Memo_5.Width:=with_summa*fr1cm;
      Memo_5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_5.DisplayFormat.Kind:=fkNumeric;
      Memo_5.DisplayFormat.FormatStr:='%2.2n';
      Memo_5.VAlign:=vaCenter;
      Memo_5.HAlign:=haRight;
//      Memo_5.StretchMode:=smMaxHeight;
      Memo_5.Font.Style:=[fsBold];

      Memo_6:=TfrxMemoView.Create(band_footer);
      Memo_6.CreateUniqueName;
      Memo_6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo_6.Height:=h_memo;
      memo_6.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width+Memo_5.Width;
      Memo_6.Font.Size:=size;
      Memo_6.Width:=with_summa*fr1cm;
      Memo_6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_6.DisplayFormat.Kind:=fkNumeric;
      Memo_6.DisplayFormat.FormatStr:='%2.2n';
      Memo_6.VAlign:=vaCenter;
      Memo_6.HAlign:=haRight;
//      Memo_6.StretchMode:=smMaxHeight;
      Memo_6.Font.Style:=[fsBold];

      Memo_7:=TfrxMemoView.Create(band_footer);
      Memo_7.CreateUniqueName;
      Memo_7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo_7.Height:=h_memo;
      memo_7.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width+Memo_5.Width+Memo_6.Width;
      Memo_7.Font.Size:=size;
      Memo_7.Width:=with_summa*fr1cm;
      Memo_7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_7.DisplayFormat.Kind:=fkNumeric;
      Memo_7.DisplayFormat.FormatStr:='%2.2n';
      Memo_7.VAlign:=vaCenter;
      Memo_7.HAlign:=haRight;
//      Memo_7.StretchMode:=smMaxHeight;
      Memo_7.Font.Style:=[fsBold];

      Memo_8:=TfrxMemoView.Create(band_footer);
      Memo_8.CreateUniqueName;
      Memo_8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo_8.Height:=h_memo;
      memo_8.Left:=Memo_1.Width+Memo_3.Width+Memo_4.Width+Memo_5.Width+Memo_6.Width+Memo_7.Width;
      Memo_8.Font.Size:=size;
      Memo_8.Width:=with_summa*fr1cm;
      Memo_8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo_8.DisplayFormat.Kind:=fkNumeric;
      Memo_8.DisplayFormat.FormatStr:='%2.2n';
      Memo_8.HAlign:=haRight;
      Memo_8.VAlign:=vaCenter;
//      Memo_8.StretchMode:=smMaxHeight;
      Memo_8.Font.Style:=[fsBold];

      memo_vik:=TfrxMemoView.Create(band_footer);
      memo_vik.CreateUniqueName;
      memo_vik.Text:='Виконавець';
      memo_vik.Height:=0.8*fr1cm;
      memo_vik.top:=1.1*fr1cm;
      memo_vik.Left:=1*fr1cm;
      memo_vik.Font.Size:=8;
      memo_vik.Width:=2*fr1cm;
      memo_vik.HAlign:=haLeft;
      memo_vik.VAlign:=vaCenter;
//      memo_vik.StretchMode:=smMaxHeight;
      if NOT_PRINT_FIO_ISPOLN=1 then  memo_vik.Visible:=False;

      memo_vik_underline:=TfrxMemoView.Create(band_footer);
      memo_vik_underline.CreateUniqueName;
      memo_vik_underline.Text:='';
      memo_vik_underline.Height:=0.8*fr1cm;
      memo_vik_underline.top:=1.1*fr1cm;
      memo_vik_underline.Left:=3*fr1cm;
      memo_vik_underline.Font.Size:=8;
      memo_vik_underline.Width:=6.3*fr1cm;
      memo_vik_underline.Frame.Typ:=[ftBottom];
      memo_vik_underline.HAlign:=haLeft;
      memo_vik_underline.VAlign:=vaCenter;
      if NOT_PRINT_FIO_ISPOLN=1 then  memo_vik_underline.Visible:=False;
//      memo_vik_underline.StretchMode:=smMaxHeight;

      memo_user:=TfrxMemoView.Create(band_footer);
      memo_user.CreateUniqueName;
      memo_user.Text:='/'+USER_FIO+'/';
      memo_user.Height:=0.8*fr1cm;
      memo_user.top:=1.1*fr1cm;
      memo_user.Left:=9.3*fr1cm;
      memo_user.Font.Size:=8;
      memo_user.Width:=9.6*fr1cm;
      memo_user.HAlign:=haLeft;
      memo_user.VAlign:=vaCenter;
      if NOT_PRINT_FIO_ISPOLN=1 then  memo_user.Visible:=False;
end;
end;
procedure TChooseForm.cxFiltrMainPropertiesChange(Sender: TObject);
begin
// with_filter:=cx
end;

procedure TChooseForm.cxPrintNumDogPropertiesChange(Sender: TObject);
begin
print_num_dog:=cxPrintNumDog.Checked;
end;

procedure TChooseForm.cxMemOrdPropertiesChange(Sender: TObject);
begin
if cxMemOrd.Checked=True then
begin
  cxPortrate.Checked:=True;
  cxPortrate.Enabled:=False;
  cxPidsum.Checked:=False;
  cxPidsum.Enabled:=False;
  cxFiltrMain.Checked:=False;
  cxFiltrMain.Enabled:=False;
end
else
begin
 cxPortrate.Enabled:=True;
 cxPidsum.Enabled:=True;
 cxFiltrMain.Enabled:=True; 
end;
end;

procedure TChooseForm.MakeReport_MemOrd;
var page:TfrxReportPage;
    band_footer:TfrxReportSummary;
    orient:TPrinterOrientation;
    band_header,band, fac_f, spec_f, nat_f, f_st_f, k_st_f, kurs_f, n_gr_f, band_head, page_footer, val_f, head1, head2, foot1, foot2, stage_f:TfrxBand;
    Memo_PIB, Memo_Ist, Memo_sm, Memo_rz, Memo_st, Memo_kekv, saldo_in, s_in_db, memo_num:TfrxMemoView;
    s_in_kr, saldo_out, s_out_db, s_out_kr, db, kr, db_s, kr_s:TfrxMemoView;
    top_next,height,width_memo,left_memo,left,rasst, h_memo:Extended;
    fac, spec, nat, f_st, k_st, kurs, n_gr, val, stage:TfrxGroupHeader;
    fac_1, spec_1, spec_2, nat_1, nat_2, f_st_1, k_st_1, kurs_1, n_gr_1, f_st_2, k_st_2, kurs_2, n_gr_2, val_1, val_2, stage_1, stage_2 :TfrxMemoView;
    Memo1, Memo2, Memo3, Memo4, Memo5, Memo6, Memo7, Memo8: TfrxMemoView;
    Memo_1, Memo_2, Memo_3, Memo_4, Memo_5, Memo_6, Memo_7, Memo_8: TfrxMemoView;
    memo_vik, memo_vik_underline, memo_user, date_print, page_print, sch_for_sysytem:TfrxMemoView;
    memo_name, memo_inn, memo_inn_num, memo_period, memo_tip_form, memo_dkud, memo_dkud_1:TfrxMemoView;
    m1, m2, m3, m4, m5, m6, m7:TfrxMemoView;
    i,k,size,size_zagolovok:Integer;
    with_summa:Double;
    DataBand, MD1, MD2:TfrxMasterData;
    main_header, main_footer:TfrxBand;
    tip:string;
begin
if FORM_UCH = 20 then
begin
  frReport.Clear;                         //создаем страницу отчета
  frReport.DataSets.Add(frxDBDataset1);
  frReport.DataSets.Add(ds_pod);
  frReport.DataSets.Add(ds_pod2);
//  Page:=frReport.Pages[0] as TfrxReportPage;
  page:=TfrxReportPage.Create(frReport);
  page.CreateUniqueName;
  page.SetDefaults;
 // page.Orientation:=poLandscape;
  size:=8;
  size_zagolovok:=8;
  with_summa:=2;

  band_head:=TfrxReportTitle.Create(page);
  band_head.Top:=0;
  band_head.Height:=6.2*fr1cm;
  top_next:=band_head.top + band_head.Height;

  memo_name:=TfrxMemoView.Create(band_head);
  memo_name.CreateUniqueName;
  memo_name.Height:=0.4*fr1cm;
  memo_name.Width:=8.1*fr1cm;
  memo_name.Frame.Typ:=[ftBottom];
  memo_name.Font.Size:=size;
  memo_name.Left:=0.7*fr1cm;
  memo_name.top:=0.2*fr1cm;
  memo_name.HAlign:=haCenter;
  memo_name.VAlign:=vaCenter;
  memo_name.Text:=ORG_FULL_NAME;
  memo_name.Font.Style:=[fsBold];
  memo_name.Font.Name:='Times New Roman';

  memo_inn:=TfrxMemoView.Create(band_head);
  memo_inn.CreateUniqueName;
  memo_inn.Height:=0.8*fr1cm;
  memo_inn.Width:=2.5*fr1cm;
  memo_inn.Font.Size:=size;
  memo_inn.Left:=0.7*fr1cm;
  memo_inn.top:=0.6*fr1cm;
  memo_inn.HAlign:=haCenter;
  memo_inn.VAlign:=vaCenter;
  memo_inn.Text:='Ідентифікаційний код ЄДРПОУ';
  memo_inn.Font.Name:='Times New Roman';

  memo_inn_num:=TfrxMemoView.Create(band_head);
  memo_inn_num.CreateUniqueName;
  memo_inn_num.Height:=0.5*fr1cm;
  memo_inn_num.Width:=3.1*fr1cm;
  memo_inn_num.Font.Size:=size;
  memo_inn_num.Left:=3.4*fr1cm;
  memo_inn_num.top:=0.8*fr1cm;
  memo_inn_num.HAlign:=haCenter;
  memo_inn_num.VAlign:=vaCenter;
  memo_inn_num.Text:=ORG_KOD_OKPO;
  memo_inn_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_inn_num.Font.Name:='Times New Roman';

  memo_tip_form:=TfrxMemoView.Create(band_head);
  memo_tip_form.CreateUniqueName;
  memo_tip_form.Height:=1.8*fr1cm;
  memo_tip_form.Width:=6.8*fr1cm;
  memo_tip_form.Font.Size:=10;
  memo_tip_form.Left:=11.5*fr1cm;
  memo_tip_form.top:=0*fr1cm;
  memo_tip_form.HAlign:=haLeft;
  memo_tip_form.VAlign:=vaCenter;
  memo_tip_form.Font.Name:='Times New Roman';
  if DEBETORI_KREDITORI='дебиторами' then tip:='408' else tip:='409';
  memo_tip_form.Text:='Типова форма № '+tip+'-авт (бюджет)'+#13+#10+'Затверджено'+#13+#10+'наказом Державного казначейства України'+#13+#10+'від 27 липня 2000р.  № 68';

  memo_dkud:=TfrxMemoView.Create(band_head);
  memo_dkud.CreateUniqueName;
  memo_dkud.Height:=0.5*fr1cm;
  memo_dkud.Width:=2.1*fr1cm;
  memo_dkud.Font.Size:=size;
  memo_dkud.Left:=12.9*fr1cm;
  memo_dkud.top:=2.1*fr1cm;
  memo_dkud.HAlign:=haCenter;
  memo_dkud.VAlign:=vaCenter;
  memo_dkud.Text:='Код за ДКУД';
  memo_dkud.Font.Name:='Times New Roman';

  memo_dkud_1:=TfrxMemoView.Create(band_head);
  memo_dkud_1.CreateUniqueName;
  memo_dkud_1.Height:=0.5*fr1cm;
  memo_dkud_1.Width:=2.5*fr1cm;
  memo_dkud_1.Font.Size:=size;
  memo_dkud_1.Left:=15.7*fr1cm;
  memo_dkud_1.top:=2.1*fr1cm;
  memo_dkud_1.HAlign:=haCenter;
  memo_dkud_1.VAlign:=vaCenter;
  memo_dkud_1.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_dkud_1.Font.Name:='Times New Roman';

  memo_period:=TfrxMemoView.Create(band_head);
  memo_period.CreateUniqueName;
  memo_period.Height:=1.4*fr1cm;
  memo_period.Width:=19*fr1cm;
  memo_period.Font.Size:=14;
  memo_period.Left:=0*fr1cm;
  memo_period.top:=2.9*fr1cm;
  memo_period.HAlign:=haCenter;
  memo_period.VAlign:=vaCenter;
  memo_period.Text:=SHORT_TITLE+#13+#10+'(рахунки:'+ SCH_SYSTEM+' )';
  memo_period.Font.Style:=[fsBold];
  memo_period.Font.Name:='Times New Roman';

  sch_for_sysytem:=TfrxMemoView.Create(band_head);
  sch_for_sysytem.CreateUniqueName;
  sch_for_sysytem.Height:=1*fr1cm;
  sch_for_sysytem.Width:=19*fr1cm;
  sch_for_sysytem.Font.Size:=10;
  sch_for_sysytem.Left:=0*fr1cm;
  sch_for_sysytem.top:=4.5*fr1cm;
  sch_for_sysytem.HAlign:=haCenter;
  sch_for_sysytem.VAlign:=vaCenter;
  sch_for_sysytem.Text:='за період з '+DatetoStr(StartOfAMonth(y_beg, m_beg))+' по '+Datetostr(EndOfAMonth(y_end, m_end))+#13+#10+'Накопичувальна відомість за розрахунками з іншими '+DEBETORI_KREDITORI;
  sch_for_sysytem.Font.Name:='Times New Roman';

  band:=TfrxPageHeader.Create(page);      //"верхушка" очета
  band.CreateUniqueName;
  band.top:=top_next;
  band.Height:=2*fr1cm;
  top_next:=band.top + band.Height;

  memo_num:=TfrxMemoView.Create(band);
  memo_num.CreateUniqueName;
  memo_num.Height:=1.6*fr1cm;
  memo_num.Width:=0.7*fr1cm;
  memo_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_num.Font.Size:=size;
  memo_num.Left:=0*fr1cm;
  memo_num.top:=0;
  memo_num.HAlign:=haCenter;
  memo_num.VAlign:=vaCenter;
 // memo_num.Color:= $00E4E4E4;
  memo_num.Text:='№'+#13+#10+'з/п';
  memo_num.Font.Style:=[fsBold];
  memo_num.Font.Name:='Times New Roman';

  m1:=TfrxMemoView.Create(band);
  m1.CreateUniqueName;
  m1.Height:=0.4*fr1cm;
  m1.Width:=0.7*fr1cm;
  m1.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  m1.Font.Size:=size;
  m1.Left:=0*fr1cm;
  m1.top:=1.6*fr1cm;
  m1.HAlign:=haCenter;
  m1.VAlign:=vaCenter;
  m1.Color:= $00E4E4E4;
  m1.Text:='1';
  m1.Font.Style:=[fsBold];
  m1.Font.Name:='Times New Roman';

  Memo_Ist:=TfrxMemoView.Create(band);
  Memo_Ist.CreateUniqueName;
  Memo_Ist.Height:=1.6*fr1cm;
  Memo_Ist.Width:=1.2*fr1cm;
  Memo_Ist.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_Ist.Font.Size:=size;
  Memo_Ist.Left:=memo_num.Width;
  memo_Ist.top:=0;
  Memo_Ist.HAlign:=haCenter;
  Memo_Ist.VAlign:=vaCenter;
//  Memo_Ist.Color:= $00E4E4E4;
  Memo_Ist.Font.Style:=[fsBold];
  Memo_Ist.Text:='КЕКВ';
  Memo_Ist.Font.Name:='Times New Roman';

  m2:=TfrxMemoView.Create(band);
  m2.CreateUniqueName;
  m2.Height:=0.4*fr1cm;
  m2.Width:=1.2*fr1cm;
  m2.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  m2.Font.Size:=size;
  m2.Left:=memo_num.Width;
  m2.top:=1.6*fr1cm;
  m2.HAlign:=haCenter;
  m2.VAlign:=vaCenter;
  m2.Color:= $00E4E4E4;
  m2.Text:='2';
  m2.Font.Name:='Times New Roman';
  m2.Font.Style:=[fsBold];

  Memo_PIB:=TfrxMemoView.Create(band);
  Memo_PIB.CreateUniqueName;
  Memo_PIB.Height:=1.6*fr1cm;
  Memo_PIB.Width:=5.2*fr1cm;
  Memo_PIB.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_PIB.Font.Size:=size;
  Memo_PIB.Left:=memo_num.Width+Memo_Ist.Width;
  memo_PIB.top:=0;
  Memo_PIB.HAlign:=haCenter;
  Memo_PIB.VAlign:=vaCenter;
//  Memo_PIB.Color:= $00E4E4E4;
  Memo_PIB.Text:='Назва'+#13+#10+' організації (установи),'+#13+#10+' дата,'+#13+#10+' № документа';
  Memo_PIB.Font.Name:='Times New Roman';
  Memo_PIB.Font.Style:=[fsBold];

  m3:=TfrxMemoView.Create(band);
  m3.CreateUniqueName;
  m3.Height:=0.4*fr1cm;
  m3.Width:=5.2*fr1cm;
  m3.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  m3.Font.Size:=size;
  m3.Left:=memo_num.Width+Memo_Ist.Width;
  m3.top:=1.6*fr1cm;
  m3.HAlign:=haCenter;
  m3.VAlign:=vaCenter;
  m3.Color:= $00E4E4E4;
  m3.Text:='3';
  m3.Font.Name:='Times New Roman';
  m3.Font.Style:=[fsBold];

  saldo_in:=TfrxMemoView.Create(band);
  saldo_in.CreateUniqueName;
  saldo_in.Height:=1.6*fr1cm;
  saldo_in.Width:=3.9*fr1cm;
  saldo_in.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  saldo_in.Font.Size:=size;
  saldo_in.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width;
  saldo_in.top:=0;
  saldo_in.HAlign:=haCenter;
  saldo_in.VAlign:=vaCenter;
 // saldo_in.Color:= $00E4E4E4;
  saldo_in.Text:='Залишок на'+#13+#10+' початок місяця за'+#13+#10+' субрахунком'+#13+#10+' (дебет,  кредит)';
  saldo_in.Font.Name:='Times New Roman';
  saldo_in.Font.Style:=[fsBold];

  m4:=TfrxMemoView.Create(band);
  m4.CreateUniqueName;
  m4.Height:=0.4*fr1cm;
  m4.Width:=3.9*fr1cm;
  m4.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  m4.Font.Size:=size;
  m4.Left:=memo_num.Width+Memo_Ist.Width+memo_pib.Width;
  m4.top:=1.6*fr1cm;
  m4.HAlign:=haCenter;
  m4.VAlign:=vaCenter;
  m4.Color:= $00E4E4E4;
  m4.Text:='4';
  m4.Font.Name:='Times New Roman';
  m4.Font.Style:=[fsBold];

  db_s:=TfrxMemoView.Create(band);
  db_s.CreateUniqueName;
  db_s.Height:=1.6*fr1cm;
  db_s.Width:=2*fr1cm;
  db_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db_s.Font.Size:=size;
  db_s.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+saldo_in.Width;
  db_s.top:=0*fr1cm;
  db_s.HAlign:=haCenter;
  db_s.VAlign:=vaCenter;
 // db_s.Color:= $00E4E4E4;
  db_s.Text:='Дебетова сума';
  db_s.Font.Name:='Times New Roman';
  db_s.Font.Style:=[fsBold];

  m5:=TfrxMemoView.Create(band);
  m5.CreateUniqueName;
  m5.Height:=0.4*fr1cm;
  m5.Width:=2*fr1cm;
  m5.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  m5.Font.Size:=size;
  m5.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+saldo_in.Width;
  m5.top:=1.6*fr1cm;
  m5.HAlign:=haCenter;
  m5.VAlign:=vaCenter;
  m5.Color:= $00E4E4E4;
  m5.Text:='5';
  m5.Font.Name:='Times New Roman';
  m5.Font.Style:=[fsBold];

  kr_s:=TfrxMemoView.Create(band);
  kr_s.CreateUniqueName;
  kr_s.Height:=1.6*fr1cm;
  kr_s.Width:=2*fr1cm;
  kr_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr_s.Font.Size:=size;
  kr_s.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+saldo_in.Width+db_s.Width;
  kr_s.top:=0*fr1cm;
  kr_s.HAlign:=haCenter;
  kr_s.VAlign:=vaCenter;
 // kr_s.Color:= $00E4E4E4;
  kr_s.Text:='Кредитова сума';
  kr_s.Font.Name:='Times New Roman';
  kr_s.Font.Style:=[fsBold];

  m6:=TfrxMemoView.Create(band);
  m6.CreateUniqueName;
  m6.Height:=0.4*fr1cm;
  m6.Width:=2*fr1cm;
  m6.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  m6.Font.Size:=size;
  m6.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+saldo_in.Width+db_s.Width;
  m6.top:=1.6*fr1cm;
  m6.HAlign:=haCenter;
  m6.VAlign:=vaCenter;
  m6.Color:= $00E4E4E4;
  m6.Text:='6';
  m6.Font.Name:='Times New Roman';
  m6.Font.Style:=[fsBold];

  saldo_out:=TfrxMemoView.Create(band);
  saldo_out.CreateUniqueName;
  saldo_out.Height:=1.6*fr1cm;
  saldo_out.Width:=4*fr1cm;
  saldo_out.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  saldo_out.Font.Size:=size;
  saldo_out.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+saldo_in.Width+db_s.Width+kr_s.Width;
  saldo_out.top:=0;
  saldo_out.HAlign:=haCenter;
  saldo_out.VAlign:=vaCenter;
 // saldo_out.Color:= $00E4E4E4;
  saldo_out.Text:='Залишок на'+#13+#10+'кінець місяця за'+#13+#10+'субрахунком (дебет,'+#13+#10+'кредит)';
  saldo_out.Font.Name:='Times New Roman';
  saldo_out.Font.Style:=[fsBold];

  m7:=TfrxMemoView.Create(band);
  m7.CreateUniqueName;
  m7.Height:=0.4*fr1cm;
  m7.Width:=4*fr1cm;
  m7.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  m7.Font.Size:=size;
  m7.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+saldo_in.Width+db_s.Width+kr_s.Width;
  m7.top:=1.6*fr1cm;
  m7.HAlign:=haCenter;
  m7.VAlign:=vaCenter;
  m7.Color:= $00E4E4E4;
  m7.Text:='7';
  m7.Font.Name:='Times New Roman';
  m7.Font.Style:=[fsBold];

  main_header:=TfrxHeader.Create(page);
  main_header.CreateUniqueName;
  main_header.top:=top_next;
  main_header.Height:=0.01*fr1cm;
  top_next:=main_header.top + main_header.Height;
   // верх закончили
 if IS_VALYUTA = 1 then
  begin
       val:=TfrxGroupHeader.Create(page);
       val.CreateUniqueName;
       val.top:=top_next;
       val.Height:=0.8*fr1cm;
       top_next:=val.top + val.Height;

       val.Condition:='frxDBDataset1."NAME_VAL"' ;

       val_1:=TfrxMemoView.Create(val);
       val_1.CreateUniqueName;
       val_1.Height:=0.8*fr1cm;
       val_1.Width:=4*fr1cm;
       val_1.Left:=0;
       val_1.top:=0;
       val_1.HAlign:=haLeft;
       val_1.VAlign:=vaCenter;
       val_1.Frame.Typ:=[ftLeft];
       val_1.Text:='Валюта:';

       val_2:=TfrxMemoView.Create(val);
       val_2.CreateUniqueName;
       val_2.Height:=0.8*fr1cm;
       val_2.Width:=15*fr1cm;
       val_2.Left:=4*fr1cm;
       val_2.top:=0;
       val_2.HAlign:=haLeft;
       val_2.VAlign:=vaCenter;
       val_2.Font.Style:=[fsBold];
       val_2.Frame.Typ:=[ftRight];
       val_2.Text:='[frxDBDataset1."NAME_VAL"] ([frxDBDataset1."CODE_VAL"])';
  end;
  //верхние группы
  if fac_flag = 1 then
   begin
       fac:=TfrxGroupHeader.Create(page);
       fac.CreateUniqueName;
       fac.top:=top_next;
       fac.Height:=0.8*fr1cm;
       top_next:=fac.top + fac.Height;

       fac.Condition:='frxDBDataset1."NAME_FACUL"' ;

       fac_1:=TfrxMemoView.Create(fac);
       fac_1.CreateUniqueName;
       fac_1.Height:=0.8*fr1cm;
       fac_1.Width:=19*fr1cm;
       fac_1.Font.Size:=size_zagolovok;
       fac_1.Left:=0;
       fac_1.top:=0;
       fac_1.HAlign:=haCenter;
       fac_1.VAlign:=vaCenter;
       fac_1.Font.Style:=[fsBold];
       fac_1.Frame.Typ:=[ftLeft,ftRight];
       fac_1.Text:='[frxDBDataset1."NAME_FACUL"]';
   end;

   if period_opl_flag = 1 then
   begin
       stage:=TfrxGroupHeader.Create(page);
       stage.CreateUniqueName;
       stage.top:=top_next;
       stage.Height:=0.8*fr1cm;
       top_next:=stage.top + stage.Height;
       stage.Condition:='frxDBDataset1."NAME_STAGE"' ;

       stage_1:=TfrxMemoView.Create(stage);
       stage_1.CreateUniqueName;
       stage_1.Height:=0.8*fr1cm;
       stage_1.Width:=4*fr1cm;
       stage_1.Font.Size:=size_zagolovok;
       stage_1.Left:=0;
       stage_1.top:=0;
       stage_1.HAlign:=haLeft;
       stage_1.VAlign:=vaCenter;
       stage_1.Frame.Typ:=[ftLeft];
       stage_1.Text:='Період оплати:';

       stage_2:=TfrxMemoView.Create(stage);
       stage_2.CreateUniqueName;
       stage_2.Height:=0.8*fr1cm;
       stage_2.Width:=15*fr1cm;
       stage_2.Font.Size:=size_zagolovok;
       stage_2.Left:=stage_1.Width;
       stage_2.top:=0;
       stage_2.Font.Style:=[fsBold];
       stage_2.HAlign:=haLeft;
       stage_2.VAlign:=vaCenter;
       stage_2.Frame.Typ:=[ftRight];
       stage_2.Text:='[frxDBDataset1."NAME_STAGE"]';
   end;

  if spec_flag = 1 then
   begin
       spec:=TfrxGroupHeader.Create(page);
       spec.CreateUniqueName;
       spec.top:=top_next;
       spec.Height:=0.8*fr1cm;
       top_next:=spec.top + spec.Height;
       spec.Condition:='frxDBDataset1."NAME_SPEC"' ;

       spec_1:=TfrxMemoView.Create(spec);
       spec_1.CreateUniqueName;
       spec_1.Height:=0.8*fr1cm;
       spec_1.Width:=4*fr1cm;
       spec_1.Font.Size:=size_zagolovok;
       spec_1.Left:=0;
       spec_1.top:=0;
       spec_1.HAlign:=haLeft;
       spec_1.VAlign:=vaCenter;
       spec_1.Frame.Typ:=[ftLeft];
       spec_1.Text:='Спеціальність:';

       spec_2:=TfrxMemoView.Create(spec);
       spec_2.CreateUniqueName;
       spec_2.Height:=0.8*fr1cm;
       spec_2.Width:=15*fr1cm;
       spec_2.Font.Size:=size_zagolovok;
       spec_2.Left:=spec_1.Width;
       spec_2.top:=0;
       spec_2.Font.Style:=[fsBold];
       spec_2.HAlign:=haLeft;
       spec_2.VAlign:=vaCenter;
       spec_2.Frame.Typ:=[ftRight];
       spec_2.Text:='[frxDBDataset1."NAME_SPEC"]';
   end;

  if nat_flag = 1 then
   begin
       nat:=TfrxGroupHeader.Create(page);
       nat.CreateUniqueName;
       nat.top:=top_next;
       nat.Height:=0.8*fr1cm;
       top_next:=nat.top + nat.Height;
       nat.Condition:='frxDBDataset1."NAME_NATIONAL"' ;

       nat_1:=TfrxMemoView.Create(nat);
       nat_1.CreateUniqueName;
       nat_1.Height:=0.8*fr1cm;
       nat_1.Width:=4*fr1cm;
       nat_1.Font.Size:=size_zagolovok;
       nat_1.Left:=0;
       nat_1.top:=0;
       nat_1.HAlign:=haLeft;
       nat_1.VAlign:=vaCenter;
       nat_1.Frame.Typ:=[ftLeft];
       nat_1.Text:='Громадянство:';

       nat_2:=TfrxMemoView.Create(nat);
       nat_2.CreateUniqueName;
       nat_2.Height:=0.8*fr1cm;
       nat_2.Width:=15*fr1cm;
       nat_2.Font.Size:=size_zagolovok;
       nat_2.Left:=nat_1.Width;
       nat_2.top:=0;
       nat_2.Font.Style:=[fsBold];
       nat_2.HAlign:=haLeft;
       nat_2.VAlign:=vaCenter;
       nat_2.Frame.Typ:=[ftRight];
       nat_2.Text:='[frxDBDataset1."NAME_NATIONAL"]';
   end;

  if f_stud_flag = 1 then
   begin
       f_st:=TfrxGroupHeader.Create(page);
       f_st.CreateUniqueName;
       f_st.top:=top_next;
       f_st.Height:=0.8*fr1cm;
       top_next:=f_st.top + f_st.Height;
       f_st.Condition:='frxDBDataset1."NAME_FORM_STUD"' ;

       f_st_1:=TfrxMemoView.Create(f_st);
       f_st_1.CreateUniqueName;
       f_st_1.Height:=0.8*fr1cm;
       f_st_1.Width:=4*fr1cm;
       f_st_1.Font.Size:=size_zagolovok;
       f_st_1.Left:=0;
       f_st_1.top:=0;
       f_st_1.HAlign:=haLeft;
       f_st_1.VAlign:=vaCenter;
       f_st_1.Frame.Typ:=[ftLeft];
       f_st_1.Text:='Форма навчання:';

       f_st_2:=TfrxMemoView.Create(f_st);
       f_st_2.CreateUniqueName;
       f_st_2.Height:=0.8*fr1cm;
       f_st_2.Width:=15*fr1cm;
       f_st_2.Font.Size:=size_zagolovok;
       f_st_2.Left:=f_st_1.Width;
       f_st_2.top:=0;
       f_st_2.Font.Style:=[fsBold];
       f_st_2.HAlign:=haLeft;
       f_st_2.VAlign:=vaCenter;
       f_st_2.Frame.Typ:=[ftRight];
       f_st_2.Text:='[frxDBDataset1."NAME_FORM_STUD"]';
   end;

  if k_stud_flag = 1 then
   begin
       k_st:=TfrxGroupHeader.Create(page);
       k_st.CreateUniqueName;
       k_st.top:=top_next;
       k_st.Height:=0.8*fr1cm;
       top_next:=k_st.top + k_st.Height;
       k_st.Condition:='frxDBDataset1."NAME_KAT_STUD"' ;

       k_st_1:=TfrxMemoView.Create(k_st);
       k_st_1.CreateUniqueName;
       k_st_1.Height:=0.8*fr1cm;
       k_st_1.Width:=4*fr1cm;
       k_st_1.Font.Size:=size_zagolovok;
       k_st_1.Left:=0;
       k_st_1.top:=0;
       k_st_1.HAlign:=haLeft;
       k_st_1.VAlign:=vaCenter;
       k_st_1.Frame.Typ:=[ftLeft];
       k_st_1.Text:='Категорія навчання:';

       k_st_2:=TfrxMemoView.Create(k_st);
       k_st_2.CreateUniqueName;
       k_st_2.Height:=0.8*fr1cm;
       k_st_2.Width:=15*fr1cm;
       k_st_2.Font.Size:=size_zagolovok;
       k_st_2.Left:=k_st_1.Width;
       k_st_2.top:=0;
       k_st_2.Font.Style:=[fsBold];
       k_st_2.HAlign:=haLeft;
       k_st_2.VAlign:=vaCenter;
       k_st_2.Frame.Typ:=[ftRight];
       k_st_2.Text:='[frxDBDataset1."NAME_KAT_STUD"]';
   end;

  if kurs_flag = 1 then
   begin
       kurs:=TfrxGroupHeader.Create(page);
       kurs.CreateUniqueName;
       kurs.top:=top_next;
       kurs.Height:=0.8*fr1cm;
       top_next:=kurs.top + kurs.Height;
       kurs.Condition:='frxDBDataset1."KURS"' ;

       kurs_1:=TfrxMemoView.Create(kurs);
       kurs_1.CreateUniqueName;
       kurs_1.Height:=0.8*fr1cm;
       kurs_1.Width:=4*fr1cm;
       kurs_1.Font.Size:=size_zagolovok;
       kurs_1.Left:=0;
       kurs_1.top:=0;
       kurs_1.HAlign:=haLeft;
       kurs_1.VAlign:=vaCenter;
       kurs_1.Frame.Typ:=[ftLeft];
       kurs_1.Text:='Курс:';

       kurs_2:=TfrxMemoView.Create(kurs);
       kurs_2.CreateUniqueName;
       kurs_2.Height:=0.8*fr1cm;
       kurs_2.Width:=15*fr1cm;
       kurs_2.Font.Size:=size_zagolovok;
       kurs_2.Left:=kurs_1.Width;
       kurs_2.top:=0;
       kurs_2.Font.Style:=[fsBold];
       kurs_2.HAlign:=haLeft;
       kurs_2.VAlign:=vaCenter;
       kurs_2.Frame.Typ:=[ftRight];
       kurs_2.Text:='[frxDBDataset1."KURS"]';
   end;

  if n_gr_flag = 1 then
   begin
       n_gr:=TfrxGroupHeader.Create(page);
       n_gr.CreateUniqueName;
       n_gr.top:=top_next;
       n_gr.Height:=0.8*fr1cm;
       top_next:=n_gr.top + n_gr.Height;
       n_gr.Condition:='frxDBDataset1."NAME_GROUP"' ;

       n_gr_1:=TfrxMemoView.Create(n_gr);
       n_gr_1.CreateUniqueName;
       n_gr_1.Height:=0.8*fr1cm;
       n_gr_1.Width:=4*fr1cm;
       n_gr_1.Font.Size:=size_zagolovok;
       n_gr_1.Left:=0;
       n_gr_1.top:=0;
       n_gr_1.HAlign:=haLeft;
       n_gr_1.VAlign:=vaCenter;
       n_gr_1.Frame.Typ:=[ftLeft];
       n_gr_1.Text:='Група:';

       n_gr_2:=TfrxMemoView.Create(n_gr);
       n_gr_2.CreateUniqueName;
       n_gr_2.Height:=0.8*fr1cm;
       n_gr_2.Width:=15*fr1cm;
       n_gr_2.Font.Size:=size_zagolovok;
       n_gr_2.Left:=n_gr_1.Width;
       n_gr_2.top:=0;
       n_gr_2.Font.Style:=[fsBold];
       n_gr_2.HAlign:=haLeft;
       n_gr_2.VAlign:=vaCenter;
       n_gr_2.Frame.Typ:=[ftRight];
       n_gr_2.Text:='[frxDBDataset1."NAME_GROUP"]';
   end;
   //мастер дата

  DataBand:=TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.DataSet:=frxDBDataSet1;
  DAtaBand.Top:=top_next;
  DataBand.Height:=0.5*fr1cm;
  top_next:=DataBand.Top+DataBand.Height;
  DAtaBand.Stretched:=True;
 // if druk_pid = True then DataBand.Visible := False;

  memo_num:=TfrxMemoView.Create(DataBand);
  memo_num.CreateUniqueName;
  memo_num.Height:=0.5*fr1cm;
  memo_num.Width:=0.7*fr1cm;
  memo_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_num.Font.Size:=size;
  memo_num.Left:=0*fr1cm;
  memo_num.top:=0;
  memo_num.Text:='[Line]';
  memo_num.StretchMode:=smMaxHeight;
  memo_num.VAlign:=vaCenter;
  memo_num.HAlign:=haRight;
  memo_num.Font.Name:='Times New Roman';

  Memo_sm:=TfrxMemoView.Create(DataBand);
  Memo_sm.CreateUniqueName;
  Memo_sm.Height:=0.5*fr1cm;
  Memo_sm.Width:=1.2*fr1cm;
  Memo_sm.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_sm.Font.Size:=size;
  Memo_sm.Left:=memo_num.Width;
  Memo_sm.top:=0;
  Memo_sm.HAlign:=haCenter;
  Memo_sm.Text:='[frxDBDataset1."KEKV_KOD"]';
  Memo_sm.StretchMode:=smMaxHeight;
  Memo_sm.VAlign:=vaCenter;
  Memo_sm.Font.Name:='Times New Roman';

  Memo_PIB:=TfrxMemoView.Create(DataBand);
  Memo_PIB.CreateUniqueName;
  Memo_PIB.Height:=0.5*fr1cm;
  Memo_PIB.Width:=5.2*fr1cm;
  Memo_PIB.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_PIB.Font.Size:=size;
  Memo_PIB.Left:=memo_num.Width+Memo_sm.Width;
  memo_PIB.top:=0;
  if print_num_dog = True then
  Memo_PIB.Text:='[frxDBDataset1."FIO"] ([frxDBDataset1."NUM_DOG"])'
  else Memo_PIB.Text:='[frxDBDataset1."FIO"]';
  Memo_PIB.StretchMode:=smMaxHeight;
  Memo_PIB.VAlign:=vaCenter;
  Memo_PIB.Font.Name:='Times New Roman';

  s_in_db:=TfrxMemoView.Create(DataBand);
  s_in_db.CreateUniqueName;
  s_in_db.Height:=0.5*fr1cm;;
  s_in_db.Width:=1.95*fr1cm;
  s_in_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_db.Font.Size:=size;
  s_in_db.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width;
  s_in_db.top:=0;
  s_in_db.HAlign:=haRight;
  s_in_db.DisplayFormat.Kind:=fkNumeric;
  s_in_db.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  s_in_db.Text:='[frxDBDataset1."IN_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  s_in_db.Text:='[frxDBDataset1."IN_DB_SUMMA"]';
  s_in_db.StretchMode:=smMaxHeight;
  s_in_db.VAlign:=vaCenter;
  s_in_db.Font.Name:='Times New Roman';

  s_in_kr:=TfrxMemoView.Create(DataBand);
  s_in_kr.CreateUniqueName;
  s_in_kr.Height:=0.5*fr1cm;;
  s_in_kr.Width:=1.95*fr1cm;
  s_in_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_kr.Font.Size:=size;
  s_in_kr.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width;
  s_in_kr.top:=0;
  s_in_kr.HAlign:=haRight;
  s_in_kr.DisplayFormat.Kind:=fkNumeric;
  s_in_kr.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  s_in_kr.Text:='[frxDBDataset1."IN_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  s_in_kr.Text:='[frxDBDataset1."IN_KR_SUMMA"]';
  s_in_kr.StretchMode:=smMaxHeight;
  s_in_kr.VAlign:=vaCenter;
  s_in_kr.Font.Name:='Times New Roman';

  db_s:=TfrxMemoView.Create(DataBand);
  db_s.CreateUniqueName;
  db_s.Height:=0.5*fr1cm;
  db_s.Width:=2*fr1cm;
  db_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db_s.Font.Size:=size;
  db_s.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width+s_in_kr.Width;
  db_s.top:=0;
  db_s.HAlign:=haRight;
  db_s.DisplayFormat.Kind:=fkNumeric;
  db_s.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  db_s.Text:='[frxDBDataset1."DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  db_s.Text:='[frxDBDataset1."DB_SUMMA"]';
  db_s.StretchMode:=smMaxHeight;
  db_s.VAlign:=vaCenter;
  db_s.Font.Name:='Times New Roman';

  kr_s:=TfrxMemoView.Create(DataBand);
  kr_s.CreateUniqueName;
  kr_s.Height:=0.5*fr1cm;
  kr_s.Width:=2*fr1cm;
  kr_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr_s.Font.Size:=size;
  kr_s.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width+s_in_kr.Width+db_s.Width;
  kr_s.top:=0;
  kr_s.HAlign:=haRight;
  kr_s.DisplayFormat.Kind:=fkNumeric;
  kr_s.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  kr_s.Text:='[frxDBDataset1."KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  kr_s.Text:='[frxDBDataset1."KR_SUMMA"]';
  kr_s.StretchMode:=smMaxHeight;
  kr_s.VAlign:=vaCenter;
  kr_s.Font.Name:='Times New Roman';

  s_out_db:=TfrxMemoView.Create(DataBand);
  s_out_db.CreateUniqueName;
  s_out_db.Height:=0.5*fr1cm;
  s_out_db.Width:=2*fr1cm;
  s_out_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_db.Font.Size:=size;
  s_out_db.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width+s_in_kr.Width+db_s.Width+kr_s.Width;
  s_out_db.top:=0;
  s_out_db.HAlign:=haRight;
  s_out_db.DisplayFormat.Kind:=fkNumeric;
  s_out_db.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  s_out_db.Text:='[frxDBDataset1."OUT_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  s_out_db.Text:='[frxDBDataset1."OUT_DB_SUMMA"]';
  s_out_db.StretchMode:=smMaxHeight;
  s_out_db.VAlign:=vaCenter;
  s_out_db.Font.Name:='Times New Roman';

  s_out_kr:=TfrxMemoView.Create(DataBand);
  s_out_kr.CreateUniqueName;
  s_out_kr.Height:=0.5*fr1cm;
  s_out_kr.Width:=with_summa*fr1cm;
  s_out_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_kr.Font.Size:=size;
  s_out_kr.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width+s_in_kr.Width+db_s.Width+kr_s.Width+s_out_db.Width;
  s_out_kr.top:=0;
  s_out_kr.HAlign:=haRight;
  s_out_kr.DisplayFormat.Kind:=fkNumeric;
  s_out_kr.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  s_out_kr.Text:='[frxDBDataset1."OUT_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  s_out_kr.Text:='[frxDBDataset1."OUT_KR_SUMMA"]';
  s_out_kr.StretchMode:=smMaxHeight;
  s_out_kr.VAlign:=vaCenter;
  s_out_kr.Font.Name:='Times New Roman';

  // нижние группы
  if n_gr_flag = 1 then
   begin
      n_gr_f:=TfrxGroupFooter.Create(page);
      n_gr_f.CreateUniqueName;
      n_gr_f.top:=top_next;
      n_gr_f.Height:=0.8*fr1cm;
      top_next:=n_gr_f.Top+n_gr_f.Height;
      n_gr_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(n_gr_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по групі: ';
      Memo1.Height:=n_gr_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=2*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;
      Memo1.Font.Name:='Times New Roman';

      Memo2:=TfrxMemoView.Create(n_gr_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_GROUP"]';
      Memo2.Height:=n_gr_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.1*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;
      Memo2.Font.Name:='Times New Roman';

      Memo3:=TfrxMemoView.Create(n_gr_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=n_gr_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=1.95*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;
      Memo3.Font.Name:='Times New Roman';

      Memo4:=TfrxMemoView.Create(n_gr_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=n_gr_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=1.95*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;
      Memo4.Font.Name:='Times New Roman';

      Memo5:=TfrxMemoView.Create(n_gr_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."DB_SUMMA">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=n_gr_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=2*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;
      Memo5.Font.Name:='Times New Roman';

      Memo6:=TfrxMemoView.Create(n_gr_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[frxDBDataset1."KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=n_gr_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=2*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;
      Memo6.Font.Name:='Times New Roman';

      Memo7:=TfrxMemoView.Create(n_gr_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=n_gr_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=2*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;
      Memo7.Font.Name:='Times New Roman';

      Memo8:=TfrxMemoView.Create(n_gr_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=n_gr_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=2*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
      Memo8.Font.Name:='Times New Roman';
   end;

  if kurs_flag = 1 then
   begin
      kurs_f:=TfrxGroupFooter.Create(page);
      kurs_f.CreateUniqueName;
      kurs_f.top:=top_next;
      kurs_f.Height:=0.8*fr1cm;
      top_next:=kurs_f.Top+kurs_f.Height;
      kurs_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(kurs_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по курсу: ';
      Memo1.Height:=kurs_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=2*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;
      Memo1.Font.Name:='Times New Roman';

      Memo2:=TfrxMemoView.Create(kurs_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."KURS"]';
      Memo2.Height:=kurs_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.1*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;
      Memo2.Font.Name:='Times New Roman';

      Memo3:=TfrxMemoView.Create(kurs_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=kurs_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=1.95*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;
      Memo3.Font.Name:='Times New Roman';

      Memo4:=TfrxMemoView.Create(kurs_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_KR_SUMMA">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=kurs_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=1.95*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;
      Memo4.Font.Name:='Times New Roman';

      Memo5:=TfrxMemoView.Create(kurs_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=kurs_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;
      Memo5.Font.Name:='Times New Roman';

      Memo6:=TfrxMemoView.Create(kurs_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=kurs_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;
      Memo6.Font.Name:='Times New Roman';

      Memo7:=TfrxMemoView.Create(kurs_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=kurs_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;
      Memo7.Font.Name:='Times New Roman';

      Memo8:=TfrxMemoView.Create(kurs_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=kurs_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
      Memo8.Font.Name:='Times New Roman';

   end;

  if k_stud_flag = 1 then
   begin
      k_st_f:=TfrxGroupFooter.Create(page);
      k_st_f.CreateUniqueName;
      k_st_f.top:=top_next;
      k_st_f.Height:=0.8*fr1cm;
      top_next:=k_st_f.Top+k_st_f.Height;
      k_st_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(k_st_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по категорії навчання: ';
      Memo1.Height:=k_st_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=2*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;
      Memo1.Font.Name:='Times New Roman';

      Memo2:=TfrxMemoView.Create(k_st_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_KAT_STUD"]';
      Memo2.Height:=k_st_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.1*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;
      Memo2.Font.Name:='Times New Roman';

      Memo3:=TfrxMemoView.Create(k_st_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=k_st_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=1.95*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;
      Memo3.Font.Name:='Times New Roman';

      Memo4:=TfrxMemoView.Create(k_st_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=k_st_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=1.95*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;
      Memo4.Font.Name:='Times New Roman';

      Memo5:=TfrxMemoView.Create(k_st_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=k_st_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;
      Memo5.Font.Name:='Times New Roman';

      Memo6:=TfrxMemoView.Create(k_st_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=k_st_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;
      Memo6.Font.Name:='Times New Roman';

      Memo7:=TfrxMemoView.Create(k_st_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=k_st_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;
      Memo7.Font.Name:='Times New Roman';

      Memo8:=TfrxMemoView.Create(k_st_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=k_st_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
      Memo8.Font.Name:='Times New Roman';
   end;

  if f_stud_flag = 1 then
   begin
      f_st_f:=TfrxGroupFooter.Create(page);
      f_st_f.CreateUniqueName;
      f_st_f.top:=top_next;
      f_st_f.Height:=0.8*fr1cm;
      top_next:=f_st_f.Top+f_st_f.Height;
      f_st_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(f_st_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по формі навчання: ';
      Memo1.Height:=f_st_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=2*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;
      Memo1.Font.Name:='Times New Roman';

      Memo2:=TfrxMemoView.Create(f_st_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_FORM_STUD"]';
      Memo2.Height:=f_st_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.1*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.Font.Style:=[fsBold];
      Memo2.VAlign:=vaCenter;
      Memo2.StretchMode:=smMaxHeight;
      Memo2.Font.Name:='Times New Roman';

      Memo3:=TfrxMemoView.Create(f_st_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=f_st_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=1.95*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;
      Memo3.Font.Name:='Times New Roman';

      Memo4:=TfrxMemoView.Create(f_st_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=f_st_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=1.95*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;
      Memo4.Font.Name:='Times New Roman';

      Memo5:=TfrxMemoView.Create(f_st_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=f_st_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;
      Memo5.Font.Name:='Times New Roman';

      Memo6:=TfrxMemoView.Create(f_st_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=f_st_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;
      Memo6.Font.Name:='Times New Roman';

      Memo7:=TfrxMemoView.Create(f_st_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=f_st_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;
      Memo7.Font.Name:='Times New Roman';

      Memo8:=TfrxMemoView.Create(f_st_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=f_st_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
      Memo8.Font.Name:='Times New Roman';
   end;

  if nat_flag = 1 then
   begin
      nat_f:=TfrxGroupFooter.Create(page);
      nat_f.CreateUniqueName;
      nat_f.top:=top_next;
      nat_f.Height:=0.8*fr1cm;
      top_next:=nat_f.Top+nat_f.Height;
      nat_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(nat_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по національності: ';
      Memo1.Height:=nat_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=2*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;
      Memo1.Font.Name:='Times New Roman';

      Memo2:=TfrxMemoView.Create(nat_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_NATIONAL"]';
      Memo2.Height:=nat_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.1*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.Font.Style:=[fsBold];
      Memo2.VAlign:=vaCenter;
      Memo2.StretchMode:=smMaxHeight;
      Memo2.Font.Name:='Times New Roman';

      Memo3:=TfrxMemoView.Create(nat_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=nat_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=1.95*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;
      Memo3.Font.Name:='Times New Roman';

      Memo4:=TfrxMemoView.Create(nat_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=nat_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=1.95*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;
      Memo4.Font.Name:='Times New Roman';

      Memo5:=TfrxMemoView.Create(nat_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=nat_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;
      Memo5.Font.Name:='Times New Roman';

      Memo6:=TfrxMemoView.Create(nat_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=nat_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;
      Memo6.Font.Name:='Times New Roman';

      Memo7:=TfrxMemoView.Create(nat_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=nat_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;
      Memo7.Font.Name:='Times New Roman';

      Memo8:=TfrxMemoView.Create(nat_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=nat_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
      Memo8.Font.Name:='Times New Roman';
   end;

  if spec_flag = 1 then
   begin
      spec_f:=TfrxGroupFooter.Create(page);
      spec_f.CreateUniqueName;
      spec_f.top:=top_next;
      spec_f.Height:=0.8*fr1cm;
      top_next:=spec_f.Top+spec_f.Height;
      spec_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(spec_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по спеціальності: ';
      Memo1.Height:=spec_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=2*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;
      Memo1.Font.Name:='Times New Roman';

      Memo2:=TfrxMemoView.Create(spec_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_SPEC"]';
      Memo2.Height:=spec_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.1*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;
      Memo2.Font.Name:='Times New Roman';

      Memo3:=TfrxMemoView.Create(spec_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=spec_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=1.95*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;
      Memo3.Font.Name:='Times New Roman';

      Memo4:=TfrxMemoView.Create(spec_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=spec_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=1.95*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;
      Memo4.Font.Name:='Times New Roman';

      Memo5:=TfrxMemoView.Create(spec_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."DB_SUMMA">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=spec_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;
      Memo5.Font.Name:='Times New Roman';

      Memo6:=TfrxMemoView.Create(spec_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=spec_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;
      Memo6.Font.Name:='Times New Roman';

      Memo7:=TfrxMemoView.Create(spec_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=spec_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;
      Memo7.Font.Name:='Times New Roman';

      Memo8:=TfrxMemoView.Create(spec_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=spec_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
      Memo8.Font.Name:='Times New Roman';
   end;

   if period_opl_flag = 1 then
   begin
      stage_f:=TfrxGroupFooter.Create(page);
      stage_f.CreateUniqueName;
      stage_f.top:=top_next;
      stage_f.Height:=0.8*fr1cm;
      top_next:=stage_f.Top+stage_f.Height;
      stage_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(stage_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по періоду оплати: ';
      Memo1.Height:=stage_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=2*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;
      Memo1.Font.Name:='Times New Roman';

      Memo2:=TfrxMemoView.Create(stage_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_STAGE"]';
      Memo2.Height:=stage_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.1*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;
      Memo2.Font.Name:='Times New Roman';

      Memo3:=TfrxMemoView.Create(stage_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=stage_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=1.95*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;
      Memo3.Font.Name:='Times New Roman';

      Memo4:=TfrxMemoView.Create(stage_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=stage_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=1.95*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;
      Memo4.Font.Name:='Times New Roman';

      Memo5:=TfrxMemoView.Create(stage_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."DB_SUMMA">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=stage_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;
      Memo5.Font.Name:='Times New Roman';

      Memo6:=TfrxMemoView.Create(stage_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=stage_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;
      Memo6.Font.Name:='Times New Roman';

      Memo7:=TfrxMemoView.Create(stage_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=stage_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;
      Memo7.Font.Name:='Times New Roman';

      Memo8:=TfrxMemoView.Create(stage_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=stage_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
      Memo8.Font.Name:='Times New Roman';
   end;

  if fac_flag = 1 then
   begin
      fac_f:=TfrxGroupFooter.Create(page);
      fac_f.CreateUniqueName;
      fac_f.top:=top_next;
      fac_f.Height:=0.8*fr1cm;
      top_next:=fac_f.Top+fac_f.Height;
      fac_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(fac_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по факультету: ';
      Memo1.Height:=fac_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=2*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;
      Memo1.Font.Name:='Times New Roman';

      Memo2:=TfrxMemoView.Create(fac_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_FACUL"]';
      Memo2.Height:=fac_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=5.1*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;
      Memo2.Font.Name:='Times New Roman';

      Memo3:=TfrxMemoView.Create(fac_f);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=fac_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=1.95*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;
      Memo3.Font.Name:='Times New Roman';

      Memo4:=TfrxMemoView.Create(fac_f);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=fac_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=1.95*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;
      Memo4.Font.Name:='Times New Roman';

      Memo5:=TfrxMemoView.Create(fac_f);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=fac_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;
      Memo5.Font.Name:='Times New Roman';

      Memo6:=TfrxMemoView.Create(fac_f);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=fac_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;
      Memo6.Font.Name:='Times New Roman';

      Memo7:=TfrxMemoView.Create(fac_f);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=fac_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;
      Memo7.Font.Name:='Times New Roman';

      Memo8:=TfrxMemoView.Create(fac_f);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=fac_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.HAlign:=haRight;
      Memo8.VAlign:=vaCenter;
      Memo8.StretchMode:=smMaxHeight;
   end;


      main_footer:=TfrxFooter.Create(page);
      main_footer.CreateUniqueName;
      main_footer.top:=top_next;
      main_footer.Height:=0.8*fr1cm;
      top_next:=main_footer.Top+main_footer.Height;
      main_footer.Stretched:=True;

      Memo1:=TfrxMemoView.Create(main_footer);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього: ';
      Memo1.Height:=fac_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=7.1*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;
      Memo1.Font.Name:='Times New Roman';
      Memo1.Font.Style:=[fsBold];

      Memo3:=TfrxMemoView.Create(main_footer);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=fac_f.Height;
      memo3.Left:=Memo1.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=1.95*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;
      Memo3.Font.Name:='Times New Roman';
      Memo3.Font.Style:=[fsBold];

      Memo4:=TfrxMemoView.Create(main_footer);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=fac_f.Height;
      memo4.Left:=Memo1.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=1.95*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;
      Memo4.Font.Name:='Times New Roman';
      Memo4.Font.Style:=[fsBold];

      Memo5:=TfrxMemoView.Create(main_footer);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=fac_f.Height;
      memo5.Left:=Memo1.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;
      Memo5.Font.Name:='Times New Roman';
      Memo5.Font.Style:=[fsBold];

      Memo6:=TfrxMemoView.Create(main_footer);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=fac_f.Height;
      memo6.Left:=Memo1.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;
      Memo6.Font.Name:='Times New Roman';
      Memo6.Font.Style:=[fsBold];

      Memo7:=TfrxMemoView.Create(main_footer);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=fac_f.Height;
      memo7.Left:=Memo1.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;
      Memo7.Font.Name:='Times New Roman';
      Memo7.Font.Style:=[fsBold];

      Memo8:=TfrxMemoView.Create(main_footer);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=fac_f.Height;
      memo8.Left:=Memo1.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.HAlign:=haRight;
      Memo8.VAlign:=vaCenter;
      Memo8.StretchMode:=smMaxHeight;
      Memo8.Font.Style:=[fsBold];
  
     //page_foter
   page_footer:=TfrxPageFooter.Create(page);
   page_footer.CreateUniqueName;
   page_footer.top:=top_next;
   page_footer.Height:=0.8*fr1cm;
   top_next:=page_footer.top + page_footer.Height;

   date_print:=TfrxMemoView.Create(page_footer);
   date_print.CreateUniqueName;
   date_print.Text:='Дата друку: [Now]';
   date_print.Height:=page_footer.Height;
   date_print.Left:=0;
   date_print.Font.Size:=8;
   date_print.Width:=5.4*fr1cm;
   date_print.VAlign:=vaCenter;
//   date_print.StretchMode:=smMaxHeight;

   page_print:=TfrxMemoView.Create(page_footer);
   page_print.CreateUniqueName;
   page_print.Text:='Стор. [Page#] із [TotalPages#]';
   page_print.Height:=page_footer.Height;
   page_print.Left:=13.6*fr1cm;
   page_print.Font.Size:=8;
   page_print.Width:=5.4*fr1cm;
   page_print.VAlign:=vaCenter;

   //итоги
   head1:=TfrxHeader.Create(page);
   head1.CreateUniqueName;
   head1.Top:=top_next;
   head1.Height:=1.6*fr1cm;
   top_next:=head1.Top+head1.Height;
   head1.OnAfterPrint:='Header1OnAfterPrint';
   h_memo:=0.5*fr1cm;

   Memo_1:=TfrxMemoView.Create(head1);
   Memo_1.CreateUniqueName;
   Memo_1.Text:='Залишок на початок місяця:';
   Memo_1.Height:=h_memo;
   Memo_1.Left:=0;
   Memo_1.Font.Size:=10;
   Memo_1.Width:=4.8*fr1cm;
   Memo_1.VAlign:=vaCenter;
   Memo_1.HAlign:=haLeft;
   Memo_1.Font.Style:=[fsBold];
   Memo_1.Font.Name:='Times New Roman';
   Memo_1.Top:=0.4*fr1cm;

   Memo_2:=TfrxMemoView.Create(head1);
   Memo_2.CreateUniqueName;
   Memo_2.Text:='Дебет';
   Memo_2.Height:=h_memo;
   Memo_2.Left:=9.4*fr1cm;
   Memo_2.Font.Size:=10;
   Memo_2.Width:=1.2*fr1cm;
   Memo_2.HAlign:=haLeft;
   Memo_2.Font.Style:=[fsBold];
   Memo_2.Font.Name:='Times New Roman';
   Memo_2.Top:=0.4*fr1cm;
    
   Memo_3:=TfrxMemoView.Create(head1);
   Memo_3.CreateUniqueName;
   Memo_3.Text:=FloatToStrF(IN_DS, ffFixed, 100, 2);;
   Memo_3.Height:=h_memo;
   Memo_3.Left:=10.6*fr1cm;
   Memo_3.Font.Size:=10;
   Memo_3.Width:=3*fr1cm;
   Memo_3.HAlign:=haRight;
   Memo_3.Font.Name:='Times New Roman';
   Memo_3.DisplayFormat.Kind:=fkNumeric;
   Memo_3.DisplayFormat.FormatStr:='%2.2n';
   Memo_3.Top:=0.4*fr1cm;

   Memo_4:=TfrxMemoView.Create(head1);
   Memo_4.CreateUniqueName;
   Memo_4.Text:='Кредит';
   Memo_4.Height:=h_memo;
   Memo_4.Left:=14.6*fr1cm;
   Memo_4.Font.Size:=10;
   Memo_4.Width:=1.4*fr1cm;
   Memo_4.HAlign:=haLeft;
   Memo_4.Font.Style:=[fsBold];
   Memo_4.Font.Name:='Times New Roman';
   Memo_4.Top:=0.4*fr1cm;

   Memo_5:=TfrxMemoView.Create(head1);
   Memo_5.CreateUniqueName;
   Memo_5.Text:=FloatToStrF(IN_KS, ffFixed, 100, 2);;
   Memo_5.Height:=h_memo;
   Memo_5.Left:=16*fr1cm;
   Memo_5.Font.Size:=10;
   Memo_5.Width:=3*fr1cm;
   Memo_5.HAlign:=haRight;
   Memo_5.Font.Name:='Times New Roman';
   Memo_5.DisplayFormat.Kind:=fkNumeric;
   Memo_5.DisplayFormat.FormatStr:='%2.2n';
   Memo_5.Top:=0.4*fr1cm;

   Memo_6:=TfrxMemoView.Create(head1);
   Memo_6.CreateUniqueName;
   Memo_6.Text:='Субрахунок';
   Memo_6.Height:=0.5*fr1cm;
   Memo_6.Left:=11.9*fr1cm;
   Memo_6.Font.Size:=10;
   Memo_6.Width:=2.5*fr1cm;
   Memo_6.HAlign:=haLeft;
   Memo_6.Font.Style:=[fsBold];
   Memo_6.Font.Name:='Times New Roman';
   Memo_6.Top:=1.1*fr1cm;

   Memo_7:=TfrxMemoView.Create(head1);
   Memo_7.CreateUniqueName;
   Memo_7.Text:='Сума';
   Memo_7.Height:=0.5*fr1cm;
   Memo_7.Left:=17*fr1cm;
   Memo_7.Font.Size:=10;
   Memo_7.Width:=2*fr1cm;
   Memo_7.HAlign:=haLeft;
   Memo_7.Font.Style:=[fsBold];
   Memo_7.Font.Name:='Times New Roman';
   Memo_7.Top:=1.1*fr1cm;

   Memo_1:=TfrxMemoView.Create(head1);
   Memo_1.CreateUniqueName;
   Memo_1.Text:=' Дебет субрахунку [frxDBDataset1."SCH_NUMBER"] до кредиту субрахунків:';
   Memo_1.Height:=h_memo;
   Memo_1.Left:=0;
   Memo_1.Font.Size:=10;
   Memo_1.Width:=11.8*fr1cm;
   Memo_1.HAlign:=haLeft;
   Memo_1.Font.Style:=[fsBold];
   Memo_1.Font.Name:='Times New Roman';
   Memo_1.Top:=1.1*fr1cm;

   MD1:=TfrxMasterData.Create(page);
   MD1.CreateUniqueName;
   MD1.DataSet:=ds_pod;
   MD1.Top:=top_next;
   MD1.Height:=0.5*fr1cm;
   top_next:=MD1.Top+MD1.Height;
   MD1.Stretched:=True;

   Memo_2:=TfrxMemoView.Create(MD1);
   Memo_2.CreateUniqueName;
   Memo_2.Text:='[ds_pod."DB_SCH_NUMBER"]'; // f_st_2.Text:='[frxDBDataset1."NAME_FORM_STUD"]';
   Memo_2.Height:=h_memo;
   Memo_2.Left:=11.9*fr1cm;
   Memo_2.Font.Size:=10;
   Memo_2.Width:=3.5*fr1cm;
   Memo_2.HAlign:=haCenter;
   Memo_2.Font.Name:='Times New Roman';
   Memo_2.Top:=0;
   Memo_2.Frame.Typ:=[ftBottom];

   Memo_3:=TfrxMemoView.Create(MD1);
   Memo_3.CreateUniqueName;
   Memo_3.Text:='[ds_pod."SUM"]';
   Memo_3.Height:=h_memo;
   Memo_3.Left:=15.4*fr1cm;
   Memo_3.Font.Size:=10;
   Memo_3.Width:=3.6*fr1cm;
   Memo_3.HAlign:=haRight;
   Memo_3.Font.Name:='Times New Roman';
   Memo_3.DisplayFormat.Kind:=fkNumeric;
   Memo_3.DisplayFormat.FormatStr:='%2.2n';
   Memo_3.Top:=0;
   Memo_3.Frame.Typ:=[ftBottom];

   foot1:=TfrxFooter.Create(page);
   foot1.CreateUniqueName;
   foot1.Top:=top_next;
   foot1.Height:=0.5*fr1cm;
   top_next:=foot1.Top+foot1.Height;

   Memo_1:=TfrxMemoView.Create(foot1);
   Memo_1.CreateUniqueName;
   Memo_1.Text:='Разом:';
   Memo_1.Height:=h_memo;
   Memo_1.Left:=11.9*fr1cm;
   Memo_1.Font.Size:=10;
   Memo_1.Width:=2.5*fr1cm;
   Memo_1.HAlign:=haLeft;
   Memo_1.Font.Style:=[fsBold];
   Memo_1.Font.Name:='Times New Roman';
   Memo_1.Top:=0*fr1cm;

   Memo_2:=TfrxMemoView.Create(foot1);
   Memo_2.CreateUniqueName;
   Memo_2.Text:='[SUM(<ds_pod."SUM">)]';
   Memo_2.Height:=h_memo;
   Memo_2.Left:=15.4*fr1cm;
   Memo_2.Font.Size:=10;
   Memo_2.Width:=3.6*fr1cm;
   Memo_2.HAlign:=haRight;
   Memo_2.Font.Name:='Times New Roman';
   Memo_2.DisplayFormat.Kind:=fkNumeric;
   Memo_2.DisplayFormat.FormatStr:='%2.2n';
   Memo_2.Font.Style:=[fsBold];
   Memo_2.Top:=0*fr1cm;

   //

   head2:=TfrxHeader.Create(page);
   head2.CreateUniqueName;
   head2.Top:=top_next;
   head2.Height:=0.8*fr1cm;
   top_next:=head2.Top+head2.Height;
   h_memo:=0.5*fr1cm;

   Memo_6:=TfrxMemoView.Create(head2);
   Memo_6.CreateUniqueName;
   Memo_6.Text:='Субрахунок';
   Memo_6.Height:=0.5*fr1cm;
   Memo_6.Left:=11.9*fr1cm;
   Memo_6.Font.Size:=10;
   Memo_6.Width:=2.5*fr1cm;
   Memo_6.HAlign:=haLeft;
   Memo_6.Font.Style:=[fsBold];
   Memo_6.Font.Name:='Times New Roman';
   Memo_6.Top:=0.3*fr1cm;

   Memo_7:=TfrxMemoView.Create(head2);
   Memo_7.CreateUniqueName;
   Memo_7.Text:='Сума';
   Memo_7.Height:=0.5*fr1cm;
   Memo_7.Left:=17*fr1cm;
   Memo_7.Font.Size:=10;
   Memo_7.Width:=2*fr1cm;
   Memo_7.HAlign:=haLeft;
   Memo_7.Font.Style:=[fsBold];
   Memo_7.Font.Name:='Times New Roman';
   Memo_7.Top:=0.3*fr1cm;

   Memo_1:=TfrxMemoView.Create(head2);
   Memo_1.CreateUniqueName;
   Memo_1.Text:=' Кредит субрахунку [frxDBDataset1."SCH_NUMBER"] до дебету субрахунків:';
   Memo_1.Height:=h_memo;
   Memo_1.Left:=0;
   Memo_1.Font.Size:=10;
   Memo_1.Width:=11.8*fr1cm;
   Memo_1.HAlign:=haLeft;
   Memo_1.Font.Style:=[fsBold];
   Memo_1.Font.Name:='Times New Roman';
   Memo_1.Top:=0.3*fr1cm;

   MD2:=TfrxMasterData.Create(page);
   MD2.CreateUniqueName;
   MD2.DataSet:=ds_pod2;
   MD2.Top:=top_next;
   MD2.Height:=0.5*fr1cm;
   top_next:=MD2.Top+MD2.Height;
   MD2.Stretched:=True;

   Memo_2:=TfrxMemoView.Create(MD2);
   Memo_2.CreateUniqueName;
   Memo_2.Text:='[ds_pod2."KR_SCH_NUMBER"]'; // f_st_2.Text:='[frxDBDataset1."NAME_FORM_STUD"]';
   Memo_2.Height:=h_memo;
   Memo_2.Left:=11.9*fr1cm;
   Memo_2.Font.Size:=10;
   Memo_2.Width:=3.5*fr1cm;
   Memo_2.HAlign:=haCenter;
   Memo_2.Font.Name:='Times New Roman';
   Memo_2.Top:=0;
   Memo_2.Frame.Typ:=[ftBottom];

   Memo_3:=TfrxMemoView.Create(MD2);
   Memo_3.CreateUniqueName;
   Memo_3.Text:='[ds_pod2."SUM"]';
   Memo_3.Height:=h_memo;
   Memo_3.Left:=15.4*fr1cm;
   Memo_3.Font.Size:=10;
   Memo_3.Width:=3.6*fr1cm;
   Memo_3.HAlign:=haRight;
   Memo_3.Font.Name:='Times New Roman';
   Memo_3.DisplayFormat.Kind:=fkNumeric;
   Memo_3.DisplayFormat.FormatStr:='%2.2n';
   Memo_3.Top:=0;
   Memo_3.Frame.Typ:=[ftBottom];

   foot2:=TfrxFooter.Create(page);
   foot2.CreateUniqueName;
   foot2.Top:=top_next;
   foot2.Height:=3.3*fr1cm;
   top_next:=foot2.Top+foot2.Height;

   Memo_1:=TfrxMemoView.Create(foot2);
   Memo_1.CreateUniqueName;
   Memo_1.Text:='Разом:';
   Memo_1.Height:=h_memo;
   Memo_1.Left:=11.9*fr1cm;
   Memo_1.Font.Size:=10;
   Memo_1.Width:=2.5*fr1cm;
   Memo_1.HAlign:=haLeft;
   Memo_1.Font.Style:=[fsBold];
   Memo_1.Font.Name:='Times New Roman';
   Memo_1.Top:=0*fr1cm;

   Memo_2:=TfrxMemoView.Create(foot2);
   Memo_2.CreateUniqueName;
   Memo_2.Text:='[SUM(<ds_pod2."SUM">)]';
   Memo_2.Height:=h_memo;
   Memo_2.Left:=15.4*fr1cm;
   Memo_2.Font.Size:=10;
   Memo_2.Width:=3.6*fr1cm;
   Memo_2.HAlign:=haRight;
   Memo_2.Font.Name:='Times New Roman';
   Memo_2.DisplayFormat.Kind:=fkNumeric;
   Memo_2.DisplayFormat.FormatStr:='%2.2n';
   Memo_2.Font.Style:=[fsBold];
   Memo_2.Font.Name:='Times New Roman';
   Memo_2.Top:=0*fr1cm;

   Memo_3:=TfrxMemoView.Create(foot2);
   Memo_3.CreateUniqueName;
   Memo_3.Text:='Залишок на кінець місяця:';
   Memo_3.Height:=h_memo;
   Memo_3.Left:=0*fr1cm;
   Memo_3.Font.Size:=10;
   Memo_3.Width:=4.8*fr1cm;
   Memo_3.HAlign:=haLeft;
   Memo_3.Font.Style:=[fsBold];
   Memo_3.Font.Name:='Times New Roman';
   Memo_3.Top:=0.9*fr1cm;

   Memo_4:=TfrxMemoView.Create(foot2);
   Memo_4.CreateUniqueName;
   Memo_4.Text:='Дебет';
   Memo_4.Height:=h_memo;
   Memo_4.Left:=9.4*fr1cm;
   Memo_4.Font.Size:=10;
   Memo_4.Width:=1.2*fr1cm;
   Memo_4.HAlign:=haLeft;
   Memo_4.Font.Style:=[fsBold];
   Memo_4.Font.Name:='Times New Roman';
   Memo_4.Top:=0.9*fr1cm;

   Memo_5:=TfrxMemoView.Create(foot2);
   Memo_5.CreateUniqueName;
   Memo_5.Text:=FloatToStrF(OUT_DS, ffFixed, 100, 2);;
   Memo_5.Height:=h_memo;
   Memo_5.Left:=10.6*fr1cm;
   Memo_5.Font.Size:=10;
   Memo_5.Width:=3*fr1cm;
   Memo_5.HAlign:=haRight;
   Memo_5.Font.Name:='Times New Roman';
   Memo_5.DisplayFormat.Kind:=fkNumeric;
   Memo_5.DisplayFormat.FormatStr:='%2.2n';
   Memo_5.Top:=0.9*fr1cm;

   Memo_6:=TfrxMemoView.Create(foot2);
   Memo_6.CreateUniqueName;
   Memo_6.Text:='Кредит';
   Memo_6.Height:=h_memo;
   Memo_6.Left:=14.6*fr1cm;
   Memo_6.Font.Size:=10;
   Memo_6.Width:=1.4*fr1cm;
   Memo_6.HAlign:=haLeft;
   Memo_6.Font.Style:=[fsBold];
   Memo_6.Font.Name:='Times New Roman';
   Memo_6.Top:=0.9*fr1cm;

   Memo_7:=TfrxMemoView.Create(foot2);
   Memo_7.CreateUniqueName;
   Memo_7.Text:=FloatToStrF(OUT_KS, ffFixed, 100, 2);
   Memo_7.Height:=h_memo;
   Memo_7.Left:=16*fr1cm;
   Memo_7.Font.Size:=10;
   Memo_7.Width:=3*fr1cm;
   Memo_7.HAlign:=haRight;
   Memo_7.Font.Name:='Times New Roman';
   Memo_7.DisplayFormat.Kind:=fkNumeric;
   Memo_7.DisplayFormat.FormatStr:='%2.2n';
   Memo_7.Top:=0.9*fr1cm;

   Memo1:=TfrxMemoView.Create(foot2);
   Memo1.CreateUniqueName;
   Memo1.Text:='Сума оборотів за меморіальним ордером:';
   Memo1.Height:=h_memo;
   Memo1.Left:=0*fr1cm;
   Memo1.Font.Size:=10;
   Memo1.Width:=7.2*fr1cm;
   Memo1.HAlign:=haLeft;
   Memo1.Font.Style:=[fsBold];
   Memo1.Font.Name:='Times New Roman';
   Memo1.Top:=2.3*fr1cm;

   Memo2:=TfrxMemoView.Create(foot2);
   Memo2.CreateUniqueName;
   Memo2.Text:= '[SUM(<ds_pod2."SUM">)]';
   Memo2.Height:=h_memo;
   Memo2.Left:=16*fr1cm;
   Memo2.Font.Size:=10;
   Memo2.Width:=3*fr1cm;
   Memo2.HAlign:=haRight;
   Memo2.Font.Name:='Times New Roman';
   Memo2.DisplayFormat.Kind:=fkNumeric;
   Memo2.DisplayFormat.FormatStr:='%2.2n';
   Memo2.Top:=2.3*fr1cm;
   Memo2.Font.Style:=[fsBold];

 //  page_print.StretchMode:=smMaxHeight;
  //report summary
  band_footer:=TfrxReportSummary.Create(page);
  band_footer.CreateUniqueName;
  band_footer.top:=top_next;
  band_footer.Height:=6.2*fr1cm;
  h_memo:=0.5*fr1cm;
  top_next:=band_footer.top + band_footer.Height;

  Memo1:=TfrxMemoView.Create(band_footer);
  Memo1.CreateUniqueName;
  Memo1.Text:='Виконавець';
  Memo1.Height:=h_memo;
  Memo1.Left:=0*fr1cm;
  Memo1.Font.Size:=10;
  Memo1.Width:=2.5*fr1cm;
  Memo1.HAlign:=haLeft;
  Memo1.Font.Name:='Times New Roman';
  Memo1.Top:=0*fr1cm;

  Memo2:=TfrxMemoView.Create(band_footer);
  Memo2.CreateUniqueName;
  Memo2.Text:='';
  Memo2.Height:=h_memo;
  Memo2.Left:=3.2*fr1cm;
  Memo2.Font.Size:=size;
  Memo2.Width:=2.5*fr1cm;
  Memo2.HAlign:=haLeft;
  Memo2.Font.Name:='Times New Roman';
  Memo2.Top:=0*fr1cm;
  Memo2.Frame.Typ:=[ftBottom];

  Memo3:=TfrxMemoView.Create(band_footer);
  Memo3.CreateUniqueName;
  Memo3.Text:='(посада)';
  Memo3.Height:=h_memo;
  Memo3.Left:=3.8*fr1cm;
  Memo3.Font.Size:=8;
  Memo3.Width:=1.1*fr1cm;
  Memo3.HAlign:=haCenter;
  Memo3.Font.Name:='Times New Roman';
  Memo3.Top:=0.5*fr1cm;

  Memo4:=TfrxMemoView.Create(band_footer);
  Memo4.CreateUniqueName;
  Memo4.Text:='';
  Memo4.Height:=h_memo;
  Memo4.Left:=6.8*fr1cm;
  Memo4.Font.Size:=size;
  Memo4.Width:=2.5*fr1cm;
  Memo4.HAlign:=haLeft;
  Memo4.Font.Name:='Times New Roman';
  Memo4.Top:=0*fr1cm;
  Memo4.Frame.Typ:=[ftBottom];

  Memo5:=TfrxMemoView.Create(band_footer);
  Memo5.CreateUniqueName;
  Memo5.Text:='(підпис)';
  Memo5.Height:=h_memo;
  Memo5.Left:=7.4*fr1cm;
  Memo5.Font.Size:=8;
  Memo5.Width:=1.1*fr1cm;
  Memo5.HAlign:=haCenter;
  Memo5.Font.Name:='Times New Roman';
  Memo5.Top:=0.5*fr1cm;

  Memo6:=TfrxMemoView.Create(band_footer);
  Memo6.CreateUniqueName;
  Memo6.Text:='/'+USER_FIO+'/';
  Memo6.Height:=h_memo;
  Memo6.Left:=9.7*fr1cm;
  Memo6.Font.Size:=10;
  Memo6.Width:=9.2*fr1cm;
  Memo6.HAlign:=haLeft;
  Memo6.Font.Name:='Times New Roman';
  Memo6.Top:=0*fr1cm;
  Memo6.Frame.Typ:=[ftBottom];

  Memo7:=TfrxMemoView.Create(band_footer);
  Memo7.CreateUniqueName;
  Memo7.Text:='(ПІБ)';
  Memo7.Height:=h_memo;
  Memo7.Left:=13.4*fr1cm;
  Memo7.Font.Size:=8;
  Memo7.Width:=0.8*fr1cm;
  Memo7.HAlign:=haCenter;
  Memo7.Font.Name:='Times New Roman';
  Memo7.Top:=0.5*fr1cm;

  Memo_1:=TfrxMemoView.Create(band_footer);
  Memo_1.CreateUniqueName;
  Memo_1.Text:='Перевірив';
  Memo_1.Height:=h_memo;
  Memo_1.Left:=0*fr1cm;
  Memo_1.Font.Size:=10;
  Memo_1.Width:=2.5*fr1cm;
  Memo_1.HAlign:=haLeft;
  Memo_1.Font.Name:='Times New Roman';
  Memo_1.Top:=1.6*fr1cm;

  Memo_2:=TfrxMemoView.Create(band_footer);
  Memo_2.CreateUniqueName;
  Memo_2.Text:='';
  Memo_2.Height:=h_memo;
  Memo_2.Left:=3.2*fr1cm;
  Memo_2.Font.Size:=size;
  Memo_2.Width:=2.5*fr1cm;
  Memo_2.HAlign:=haLeft;
  Memo_2.Font.Name:='Times New Roman';
  Memo_2.Top:=1.6*fr1cm;
  Memo_2.Frame.Typ:=[ftBottom];

  Memo_3:=TfrxMemoView.Create(band_footer);
  Memo_3.CreateUniqueName;
  Memo_3.Text:='(посада)';
  Memo_3.Height:=h_memo;
  Memo_3.Left:=3.8*fr1cm;
  Memo_3.Font.Size:=8;
  Memo_3.Width:=1.1*fr1cm;
  Memo_3.HAlign:=haCenter;
  Memo_3.Font.Name:='Times New Roman';
  Memo_3.Top:=2.1*fr1cm;

  Memo_4:=TfrxMemoView.Create(band_footer);
  Memo_4.CreateUniqueName;
  Memo_4.Text:='';
  Memo_4.Height:=h_memo;
  Memo_4.Left:=6.8*fr1cm;
  Memo_4.Font.Size:=size;
  Memo_4.Width:=2.5*fr1cm;
  Memo_4.HAlign:=haLeft;
  Memo_4.Font.Name:='Times New Roman';
  Memo_4.Top:=1.6*fr1cm;
  Memo_4.Frame.Typ:=[ftBottom];

  Memo_5:=TfrxMemoView.Create(band_footer);
  Memo_5.CreateUniqueName;
  Memo_5.Text:='(підпис)';
  Memo_5.Height:=h_memo;
  Memo_5.Left:=7.4*fr1cm;
  Memo_5.Font.Size:=8;
  Memo_5.Width:=1.1*fr1cm;
  Memo_5.HAlign:=haCenter;
  Memo_5.Font.Name:='Times New Roman';
  Memo_5.Top:=2.1*fr1cm;

  Memo_6:=TfrxMemoView.Create(band_footer);
  Memo_6.CreateUniqueName;
  Memo_6.Text:='';
  Memo_6.Height:=h_memo;
  Memo_6.Left:=9.7*fr1cm;
  Memo_6.Font.Size:=size;
  Memo_6.Width:=9.2*fr1cm;
  Memo_6.HAlign:=haLeft;
  Memo_6.Font.Name:='Times New Roman';
  Memo_6.Top:=1.6*fr1cm;
  Memo_6.Frame.Typ:=[ftBottom];

  Memo_7:=TfrxMemoView.Create(band_footer);
  Memo_7.CreateUniqueName;
  Memo_7.Text:='(ПІБ)';
  Memo_7.Height:=h_memo;
  Memo_7.Left:=13.4*fr1cm;
  Memo_7.Font.Size:=8;
  Memo_7.Width:=0.8*fr1cm;
  Memo_7.HAlign:=haCenter;
  Memo_7.Font.Name:='Times New Roman';
  Memo_7.Top:=2.1*fr1cm;

  m1:=TfrxMemoView.Create(band_footer);
  m1.CreateUniqueName;
  m1.Text:='Головний бухгалтер';
  m1.Height:=h_memo;
  m1.Left:=0*fr1cm;
  m1.Font.Size:=10;
  m1.Width:=3.5*fr1cm;
  m1.HAlign:=haLeft;
  m1.Font.Name:='Times New Roman';
  m1.Top:=3*fr1cm;

  m4:=TfrxMemoView.Create(band_footer);
  m4.CreateUniqueName;
  m4.Text:='';
  m4.Height:=h_memo;
  m4.Left:=6.8*fr1cm;
  m4.Font.Size:=size;
  m4.Width:=2.5*fr1cm;
  m4.HAlign:=haLeft;
  m4.Font.Name:='Times New Roman';
  m4.Top:=3*fr1cm;
  m4.Frame.Typ:=[ftBottom];

  m5:=TfrxMemoView.Create(band_footer);
  m5.CreateUniqueName;
  m5.Text:='(підпис)';
  m5.Height:=h_memo;
  m5.Left:=7.4*fr1cm;
  m5.Font.Size:=8;
  m5.Width:=1.1*fr1cm;
  m5.HAlign:=haCenter;
  m5.Font.Name:='Times New Roman';
  m5.Top:=3.5*fr1cm;

  m6:=TfrxMemoView.Create(band_footer);
  m6.CreateUniqueName;
  m6.Text:='';
  m6.Height:=h_memo;
  m6.Left:=9.7*fr1cm;
  m6.Font.Size:=size;
  m6.Width:=9.2*fr1cm;
  m6.HAlign:=haLeft;
  m6.Font.Name:='Times New Roman';
  m6.Top:=3*fr1cm;
  m6.Frame.Typ:=[ftBottom];

  m7:=TfrxMemoView.Create(band_footer);
  m7.CreateUniqueName;
  m7.Text:='(ПІБ)';
  m7.Height:=h_memo;
  m7.Left:=13.4*fr1cm;
  m7.Font.Size:=8;
  m7.Width:=0.8*fr1cm;
  m7.HAlign:=haCenter;
  m7.Font.Name:='Times New Roman';
  m7.Top:=3.5*fr1cm;

  memo8:=TfrxMemoView.Create(band_footer);
  memo8.CreateUniqueName;
  memo8.Text:='"__"_________________ 20__р.';
  memo8.Height:=h_memo;
  memo8.Left:=0*fr1cm;
  memo8.Font.Size:=10;
  memo8.Width:=5.1*fr1cm;
  memo8.HAlign:=haCenter;
  memo8.Font.Name:='Times New Roman';
  memo8.Top:=5.3*fr1cm;

  memo_8:=TfrxMemoView.Create(band_footer);
  memo_8.CreateUniqueName;
  memo_8.Text:='Додаток на ___________ аркушах';
  memo_8.Height:=h_memo;
  memo_8.Left:=12.3*fr1cm;
  memo_8.Font.Size:=10;
  memo_8.Width:=5.4*fr1cm;
  memo_8.HAlign:=haCenter;
  memo_8.Font.Name:='Times New Roman';
  memo_8.Top:=5.3*fr1cm;


end;

if FORM_UCH = 19 then
begin
 frReport.Clear;                         //создаем страницу отчета
  frReport.DataSets.Add(frxDBDataset1);
  frReport.DataSets.Add(ds_pod);
  frReport.DataSets.Add(ds_pod2);
//  Page:=frReport.Pages[0] as TfrxReportPage;
  page:=TfrxReportPage.Create(frReport);
  page.CreateUniqueName;
  page.SetDefaults;
 // page.Orientation:=poLandscape;
  size:=8;
  size_zagolovok:=8;
  with_summa:=2;

  band_head:=TfrxReportTitle.Create(page);
  band_head.Top:=0;
  band_head.Height:=6.2*fr1cm;
  top_next:=band_head.top + band_head.Height;

  memo_name:=TfrxMemoView.Create(band_head);
  memo_name.CreateUniqueName;
  memo_name.Height:=0.4*fr1cm;
  memo_name.Width:=8.1*fr1cm;
  memo_name.Frame.Typ:=[ftBottom];
  memo_name.Font.Size:=size;
  memo_name.Left:=0.7*fr1cm;
  memo_name.top:=0.2*fr1cm;
  memo_name.HAlign:=haCenter;
  memo_name.VAlign:=vaCenter;
  memo_name.Text:=ORG_FULL_NAME;
  memo_name.Font.Style:=[fsBold];
  memo_name.Font.Name:='Times New Roman';

  memo_inn:=TfrxMemoView.Create(band_head);
  memo_inn.CreateUniqueName;
  memo_inn.Height:=0.8*fr1cm;
  memo_inn.Width:=2.5*fr1cm;
  memo_inn.Font.Size:=size;
  memo_inn.Left:=0.7*fr1cm;
  memo_inn.top:=0.6*fr1cm;
  memo_inn.HAlign:=haCenter;
  memo_inn.VAlign:=vaCenter;
  memo_inn.Text:='Ідентифікаційний код ЄДРПОУ';
  memo_inn.Font.Name:='Times New Roman';

  memo_inn_num:=TfrxMemoView.Create(band_head);
  memo_inn_num.CreateUniqueName;
  memo_inn_num.Height:=0.5*fr1cm;
  memo_inn_num.Width:=3.1*fr1cm;
  memo_inn_num.Font.Size:=size;
  memo_inn_num.Left:=3.4*fr1cm;
  memo_inn_num.top:=0.8*fr1cm;
  memo_inn_num.HAlign:=haCenter;
  memo_inn_num.VAlign:=vaCenter;
  memo_inn_num.Text:=ORG_KOD_OKPO;
  memo_inn_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_inn_num.Font.Name:='Times New Roman';

  memo_tip_form:=TfrxMemoView.Create(band_head);
  memo_tip_form.CreateUniqueName;
  memo_tip_form.Height:=1.8*fr1cm;
  memo_tip_form.Width:=6.8*fr1cm;
  memo_tip_form.Font.Size:=10;
  memo_tip_form.Left:=11.5*fr1cm;
  memo_tip_form.top:=0*fr1cm;
  memo_tip_form.HAlign:=haLeft;
  memo_tip_form.VAlign:=vaCenter;
  memo_tip_form.Font.Name:='Times New Roman';
  if DEBETORI_KREDITORI='дебиторами' then tip:='408' else tip:='409';
  memo_tip_form.Text:='Типова форма № '+tip+'-авт (бюджет)'+#13+#10+'Затверджено'+#13+#10+'наказом Державного казначейства України'+#13+#10+'від 27 липня 2000р.  № 68';

  memo_dkud:=TfrxMemoView.Create(band_head);
  memo_dkud.CreateUniqueName;
  memo_dkud.Height:=0.5*fr1cm;
  memo_dkud.Width:=2.1*fr1cm;
  memo_dkud.Font.Size:=size;
  memo_dkud.Left:=12.9*fr1cm;
  memo_dkud.top:=2.1*fr1cm;
  memo_dkud.HAlign:=haCenter;
  memo_dkud.VAlign:=vaCenter;
  memo_dkud.Text:='Код за ДКУД';
  memo_dkud.Font.Name:='Times New Roman';

  memo_dkud_1:=TfrxMemoView.Create(band_head);
  memo_dkud_1.CreateUniqueName;
  memo_dkud_1.Height:=0.5*fr1cm;
  memo_dkud_1.Width:=2.5*fr1cm;
  memo_dkud_1.Font.Size:=size;
  memo_dkud_1.Left:=15.7*fr1cm;
  memo_dkud_1.top:=2.1*fr1cm;
  memo_dkud_1.HAlign:=haCenter;
  memo_dkud_1.VAlign:=vaCenter;
  memo_dkud_1.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_dkud_1.Font.Name:='Times New Roman';

  memo_period:=TfrxMemoView.Create(band_head);
  memo_period.CreateUniqueName;
  memo_period.Height:=1.4*fr1cm;
  memo_period.Width:=19*fr1cm;
  memo_period.Font.Size:=14;
  memo_period.Left:=0*fr1cm;
  memo_period.top:=2.9*fr1cm;
  memo_period.HAlign:=haCenter;
  memo_period.VAlign:=vaCenter;
  memo_period.Text:=SHORT_TITLE+#13+#10+'(рахунки:'+ SCH_SYSTEM+' )';
  memo_period.Font.Style:=[fsBold];
  memo_period.Font.Name:='Times New Roman';

  sch_for_sysytem:=TfrxMemoView.Create(band_head);
  sch_for_sysytem.CreateUniqueName;
  sch_for_sysytem.Height:=1*fr1cm;
  sch_for_sysytem.Width:=19*fr1cm;
  sch_for_sysytem.Font.Size:=10;
  sch_for_sysytem.Left:=0*fr1cm;
  sch_for_sysytem.top:=4.5*fr1cm;
  sch_for_sysytem.HAlign:=haCenter;
  sch_for_sysytem.VAlign:=vaCenter;
  sch_for_sysytem.Text:='за період з '+DatetoStr(StartOfAMonth(y_beg, m_beg))+' по '+Datetostr(EndOfAMonth(y_end, m_end))+#13+#10+'Накопичувальна відомість за розрахунками з іншими '+DEBETORI_KREDITORI;
  sch_for_sysytem.Font.Name:='Times New Roman';

  band:=TfrxPageHeader.Create(page);      //"верхушка" очета
  band.CreateUniqueName;
  band.top:=top_next;
  band.Height:=2*fr1cm;
  top_next:=band.top + band.Height;

  memo_num:=TfrxMemoView.Create(band);
  memo_num.CreateUniqueName;
  memo_num.Height:=1.6*fr1cm;
  memo_num.Width:=0.7*fr1cm;
  memo_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_num.Font.Size:=size;
  memo_num.Left:=0*fr1cm;
  memo_num.top:=0;
  memo_num.HAlign:=haCenter;
  memo_num.VAlign:=vaCenter;
 // memo_num.Color:= $00E4E4E4;
  memo_num.Text:='№'+#13+#10+'з/п';
  memo_num.Font.Style:=[fsBold];
  memo_num.Font.Name:='Times New Roman';

  m1:=TfrxMemoView.Create(band);
  m1.CreateUniqueName;
  m1.Height:=0.4*fr1cm;
  m1.Width:=0.7*fr1cm;
  m1.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  m1.Font.Size:=size;
  m1.Left:=0*fr1cm;
  m1.top:=1.6*fr1cm;
  m1.HAlign:=haCenter;
  m1.VAlign:=vaCenter;
  m1.Color:= $00E4E4E4;
  m1.Text:='1';
  m1.Font.Style:=[fsBold];
  m1.Font.Name:='Times New Roman';

  Memo_Ist:=TfrxMemoView.Create(band);
  Memo_Ist.CreateUniqueName;
  Memo_Ist.Height:=1.6*fr1cm;
  Memo_Ist.Width:=1.2*fr1cm;
  Memo_Ist.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_Ist.Font.Size:=size;
  Memo_Ist.Left:=memo_num.Width;
  memo_Ist.top:=0;
  Memo_Ist.HAlign:=haCenter;
  Memo_Ist.VAlign:=vaCenter;
//  Memo_Ist.Color:= $00E4E4E4;
  Memo_Ist.Font.Style:=[fsBold];
  Memo_Ist.Text:='КЕКВ';
  Memo_Ist.Font.Name:='Times New Roman';

  m2:=TfrxMemoView.Create(band);
  m2.CreateUniqueName;
  m2.Height:=0.4*fr1cm;
  m2.Width:=1.2*fr1cm;
  m2.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  m2.Font.Size:=size;
  m2.Left:=memo_num.Width;
  m2.top:=1.6*fr1cm;
  m2.HAlign:=haCenter;
  m2.VAlign:=vaCenter;
  m2.Color:= $00E4E4E4;
  m2.Text:='2';
  m2.Font.Name:='Times New Roman';
  m2.Font.Style:=[fsBold];

  Memo_PIB:=TfrxMemoView.Create(band);
  Memo_PIB.CreateUniqueName;
  Memo_PIB.Height:=1.6*fr1cm;
  Memo_PIB.Width:=5.2*fr1cm;
  Memo_PIB.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_PIB.Font.Size:=size;
  Memo_PIB.Left:=memo_num.Width+Memo_Ist.Width;
  memo_PIB.top:=0;
  Memo_PIB.HAlign:=haCenter;
  Memo_PIB.VAlign:=vaCenter;
//  Memo_PIB.Color:= $00E4E4E4;
  Memo_PIB.Text:='Назва'+#13+#10+' організації (установи),'+#13+#10+' дата,'+#13+#10+' № документа';
  Memo_PIB.Font.Name:='Times New Roman';
  Memo_PIB.Font.Style:=[fsBold];

  m3:=TfrxMemoView.Create(band);
  m3.CreateUniqueName;
  m3.Height:=0.4*fr1cm;
  m3.Width:=5.2*fr1cm;
  m3.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  m3.Font.Size:=size;
  m3.Left:=memo_num.Width+Memo_Ist.Width;
  m3.top:=1.6*fr1cm;
  m3.HAlign:=haCenter;
  m3.VAlign:=vaCenter;
  m3.Color:= $00E4E4E4;
  m3.Text:='3';
  m3.Font.Name:='Times New Roman';
  m3.Font.Style:=[fsBold];

  saldo_in:=TfrxMemoView.Create(band);
  saldo_in.CreateUniqueName;
  saldo_in.Height:=1.6*fr1cm;
  saldo_in.Width:=3.9*fr1cm;
  saldo_in.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  saldo_in.Font.Size:=size;
  saldo_in.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width;
  saldo_in.top:=0;
  saldo_in.HAlign:=haCenter;
  saldo_in.VAlign:=vaCenter;
 // saldo_in.Color:= $00E4E4E4;
  saldo_in.Text:='Залишок на'+#13+#10+' початок місяця за'+#13+#10+' субрахунком'+#13+#10+' (дебет,  кредит)';
  saldo_in.Font.Name:='Times New Roman';
  saldo_in.Font.Style:=[fsBold];

  m4:=TfrxMemoView.Create(band);
  m4.CreateUniqueName;
  m4.Height:=0.4*fr1cm;
  m4.Width:=3.9*fr1cm;
  m4.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  m4.Font.Size:=size;
  m4.Left:=memo_num.Width+Memo_Ist.Width+memo_pib.Width;
  m4.top:=1.6*fr1cm;
  m4.HAlign:=haCenter;
  m4.VAlign:=vaCenter;
  m4.Color:= $00E4E4E4;
  m4.Text:='4';
  m4.Font.Name:='Times New Roman';
  m4.Font.Style:=[fsBold];

  db_s:=TfrxMemoView.Create(band);
  db_s.CreateUniqueName;
  db_s.Height:=1.6*fr1cm;
  db_s.Width:=2*fr1cm;
  db_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db_s.Font.Size:=size;
  db_s.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+saldo_in.Width;
  db_s.top:=0*fr1cm;
  db_s.HAlign:=haCenter;
  db_s.VAlign:=vaCenter;
 // db_s.Color:= $00E4E4E4;
  db_s.Text:='Дебетова сума';
  db_s.Font.Name:='Times New Roman';
  db_s.Font.Style:=[fsBold];

  m5:=TfrxMemoView.Create(band);
  m5.CreateUniqueName;
  m5.Height:=0.4*fr1cm;
  m5.Width:=2*fr1cm;
  m5.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  m5.Font.Size:=size;
  m5.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+saldo_in.Width;
  m5.top:=1.6*fr1cm;
  m5.HAlign:=haCenter;
  m5.VAlign:=vaCenter;
  m5.Color:= $00E4E4E4;
  m5.Text:='5';
  m5.Font.Name:='Times New Roman';
  m5.Font.Style:=[fsBold];

  kr_s:=TfrxMemoView.Create(band);
  kr_s.CreateUniqueName;
  kr_s.Height:=1.6*fr1cm;
  kr_s.Width:=2*fr1cm;
  kr_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr_s.Font.Size:=size;
  kr_s.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+saldo_in.Width+db_s.Width;
  kr_s.top:=0*fr1cm;
  kr_s.HAlign:=haCenter;
  kr_s.VAlign:=vaCenter;
 // kr_s.Color:= $00E4E4E4;
  kr_s.Text:='Кредитова сума';
  kr_s.Font.Name:='Times New Roman';
  kr_s.Font.Style:=[fsBold];

  m6:=TfrxMemoView.Create(band);
  m6.CreateUniqueName;
  m6.Height:=0.4*fr1cm;
  m6.Width:=2*fr1cm;
  m6.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  m6.Font.Size:=size;
  m6.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+saldo_in.Width+db_s.Width;
  m6.top:=1.6*fr1cm;
  m6.HAlign:=haCenter;
  m6.VAlign:=vaCenter;
  m6.Color:= $00E4E4E4;
  m6.Text:='6';
  m6.Font.Name:='Times New Roman';
  m6.Font.Style:=[fsBold];

  saldo_out:=TfrxMemoView.Create(band);
  saldo_out.CreateUniqueName;
  saldo_out.Height:=1.6*fr1cm;
  saldo_out.Width:=4*fr1cm;
  saldo_out.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  saldo_out.Font.Size:=size;
  saldo_out.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+saldo_in.Width+db_s.Width+kr_s.Width;
  saldo_out.top:=0;
  saldo_out.HAlign:=haCenter;
  saldo_out.VAlign:=vaCenter;
 // saldo_out.Color:= $00E4E4E4;
  saldo_out.Text:='Залишок на'+#13+#10+'кінець місяця за'+#13+#10+'субрахунком (дебет,'+#13+#10+'кредит)';
  saldo_out.Font.Name:='Times New Roman';
  saldo_out.Font.Style:=[fsBold];

  m7:=TfrxMemoView.Create(band);
  m7.CreateUniqueName;
  m7.Height:=0.4*fr1cm;
  m7.Width:=4*fr1cm;
  m7.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  m7.Font.Size:=size;
  m7.Left:=memo_num.Width+memo_pib.Width+Memo_Ist.Width+saldo_in.Width+db_s.Width+kr_s.Width;
  m7.top:=1.6*fr1cm;
  m7.HAlign:=haCenter;
  m7.VAlign:=vaCenter;
  m7.Color:= $00E4E4E4;
  m7.Text:='7';
  m7.Font.Name:='Times New Roman';
  m7.Font.Style:=[fsBold];

   // верх закончили
  main_header:=TfrxHeader.Create(page);
  main_header.CreateUniqueName;
  main_header.top:=top_next;
  main_header.Height:=0.01*fr1cm;
  top_next:=main_header.top + main_header.Height;
  //верхние группы
  if obsh_flag = 1 then
   begin
       fac:=TfrxGroupHeader.Create(page);
       fac.CreateUniqueName;
       fac.top:=top_next;
       fac.Height:=0.8*fr1cm;
       top_next:=fac.top + fac.Height;

       fac.Condition:='frxDBDataset1."BUILDS"' ;

       fac_1:=TfrxMemoView.Create(fac);
       fac_1.CreateUniqueName;
       fac_1.Height:=0.8*fr1cm;
       fac_1.Width:=19*fr1cm;
       fac_1.Font.Size:=size_zagolovok;
       fac_1.Left:=0;
       fac_1.top:=0;
       fac_1.HAlign:=haCenter;
       fac_1.VAlign:=vaCenter;
       fac_1.Font.Style:=[fsBold];
       fac_1.Frame.Typ:=[ftLeft,ftRight];
       fac_1.Text:='[frxDBDataset1."BUILDS"]';
   end;

  if fac_st_flag = 1 then
   begin
       spec:=TfrxGroupHeader.Create(page);
       spec.CreateUniqueName;
       spec.top:=top_next;
       spec.Height:=0.8*fr1cm;
       top_next:=spec.top + spec.Height;
       spec.Condition:='frxDBDataset1."NAME_FAK"' ;

       spec_1:=TfrxMemoView.Create(spec);
       spec_1.CreateUniqueName;
       spec_1.Height:=0.8*fr1cm;
       spec_1.Width:=4*fr1cm;
       spec_1.Font.Size:=size_zagolovok;
       spec_1.Left:=0;
       spec_1.top:=0;
       spec_1.HAlign:=haLeft;
       spec_1.VAlign:=vaCenter;
       spec_1.Frame.Typ:=[ftLeft];
       spec_1.Text:='Факультет:';

       spec_2:=TfrxMemoView.Create(spec);
       spec_2.CreateUniqueName;
       spec_2.Height:=0.8*fr1cm;
       spec_2.Width:=15*fr1cm;
       spec_2.Font.Size:=size_zagolovok;
       spec_2.Left:=spec_1.Width;
       spec_2.top:=0;
       spec_2.Font.Style:=[fsBold];
       spec_2.HAlign:=haLeft;
       spec_2.VAlign:=vaCenter;
       spec_2.Frame.Typ:=[ftRight];
       spec_2.Text:='[frxDBDataset1."NAME_FAK"]';
   end;

  if kurs_st_flag = 1 then
   begin
       nat:=TfrxGroupHeader.Create(page);
       nat.CreateUniqueName;
       nat.top:=top_next;
       nat.Height:=0.8*fr1cm;
       top_next:=nat.top + nat.Height;
       nat.Condition:='frxDBDataset1."KURS"' ;

       nat_1:=TfrxMemoView.Create(nat);
       nat_1.CreateUniqueName;
       nat_1.Height:=0.8*fr1cm;
       nat_1.Width:=4*fr1cm;
       nat_1.Font.Size:=size_zagolovok;
       nat_1.Left:=0;
       nat_1.top:=0;
       nat_1.HAlign:=haLeft;
       nat_1.VAlign:=vaCenter;
       nat_1.Frame.Typ:=[ftLeft];
       nat_1.Text:='Курс:';

       nat_2:=TfrxMemoView.Create(nat);
       nat_2.CreateUniqueName;
       nat_2.Height:=0.8*fr1cm;
       nat_2.Width:=15*fr1cm;
       nat_2.Font.Size:=size_zagolovok;
       nat_2.Left:=nat_1.Width;
       nat_2.top:=0;
       nat_2.Font.Style:=[fsBold];
       nat_2.HAlign:=haLeft;
       nat_2.VAlign:=vaCenter;
       nat_2.Frame.Typ:=[ftRight];
       nat_2.Text:='[frxDBDataset1."KURS"]';
   end;

  if kat_pay_flag = 1 then
   begin
       f_st:=TfrxGroupHeader.Create(page);
       f_st.CreateUniqueName;
       f_st.top:=top_next;
       f_st.Height:=0.8*fr1cm;
       top_next:=f_st.top + f_st.Height;
       f_st.Condition:='frxDBDataset1."CAT_PAY"' ;

       f_st_1:=TfrxMemoView.Create(f_st);
       f_st_1.CreateUniqueName;
       f_st_1.Height:=0.8*fr1cm;
       f_st_1.Width:=4*fr1cm;
       f_st_1.Font.Size:=size_zagolovok;
       f_st_1.Left:=0;
       f_st_1.top:=0;
       f_st_1.HAlign:=haLeft;
       f_st_1.VAlign:=vaCenter;
       f_st_1.Frame.Typ:=[ftLeft];
       f_st_1.Text:='Категорія оплати:';

       f_st_2:=TfrxMemoView.Create(f_st);
       f_st_2.CreateUniqueName;
       f_st_2.Height:=0.8*fr1cm;
       f_st_2.Width:=15*fr1cm;
       f_st_2.Font.Size:=size_zagolovok;
       f_st_2.Left:=f_st_1.Width;
       f_st_2.top:=0;
       f_st_2.Font.Style:=[fsBold];
       f_st_2.HAlign:=haLeft;
       f_st_2.VAlign:=vaCenter;
       f_st_2.Frame.Typ:=[ftRight];
       f_st_2.Text:='[frxDBDataset1."CAT_PAY"]';
   end;

  if type_live_flag = 1 then
   begin
       k_st:=TfrxGroupHeader.Create(page);
       k_st.CreateUniqueName;
       k_st.top:=top_next;
       k_st.Height:=0.8*fr1cm;
       top_next:=k_st.top + k_st.Height;
       k_st.Condition:='frxDBDataset1."TYPE_LIVE"' ;

       k_st_1:=TfrxMemoView.Create(k_st);
       k_st_1.CreateUniqueName;
       k_st_1.Height:=0.8*fr1cm;
       k_st_1.Width:=4*fr1cm;
       k_st_1.Font.Size:=size_zagolovok;
       k_st_1.Left:=0;
       k_st_1.top:=0;
       k_st_1.HAlign:=haLeft;
       k_st_1.VAlign:=vaCenter;
       k_st_1.Frame.Typ:=[ftLeft];
       k_st_1.Text:='Тип проживання:';

       k_st_2:=TfrxMemoView.Create(k_st);
       k_st_2.CreateUniqueName;
       k_st_2.Height:=0.8*fr1cm;
       k_st_2.Width:=15*fr1cm;
       k_st_2.Font.Size:=size_zagolovok;
       k_st_2.Left:=k_st_2.Width;
       k_st_2.top:=0;
       k_st_2.Font.Style:=[fsBold];
       k_st_2.HAlign:=haLeft;
       k_st_2.VAlign:=vaCenter;
       k_st_2.Frame.Typ:=[ftRight];
       k_st_2.Text:='[frxDBDataset1."TYPE_LIVE"]';
   end;

  if cl_live_flag = 1 then
   begin
       kurs:=TfrxGroupHeader.Create(page);
       kurs.CreateUniqueName;
       kurs.top:=top_next;
       kurs.Height:=0.8*fr1cm;
       top_next:=kurs.top + kurs.Height;
       kurs.Condition:='frxDBDataset1."CLASS_LIVE"' ;

       kurs_1:=TfrxMemoView.Create(kurs);
       kurs_1.CreateUniqueName;
       kurs_1.Height:=0.8*fr1cm;
       kurs_1.Width:=4*fr1cm;
       kurs_1.Font.Size:=size_zagolovok;
       kurs_1.Left:=0;
       kurs_1.top:=0;
       kurs_1.HAlign:=haLeft;
       kurs_1.VAlign:=vaCenter;
       kurs_1.Frame.Typ:=[ftLeft];
       kurs_1.Text:='Клас проживання:';

       kurs_2:=TfrxMemoView.Create(kurs);
       kurs_2.CreateUniqueName;
       kurs_2.Height:=0.8*fr1cm;
       kurs_2.Width:=15*fr1cm;
       kurs_2.Font.Size:=size_zagolovok;
       kurs_2.Left:=kurs_1.Width;
       kurs_2.top:=0;
       kurs_2.Font.Style:=[fsBold];
       kurs_2.HAlign:=haLeft;
       kurs_2.VAlign:=vaCenter;
       kurs_2.Frame.Typ:=[ftRight];
       kurs_2.Text:='[frxDBDataset1."CLASS_LIVE"]';
   end;

  if grp_flag = 1 then
   begin
       n_gr:=TfrxGroupHeader.Create(page);
       n_gr.CreateUniqueName;
       n_gr.top:=top_next;
       n_gr.Height:=0.8*fr1cm;
       top_next:=n_gr.top + n_gr.Height;
       n_gr.Condition:='frxDBDataset1."NAME_GROUP"' ;

       n_gr_1:=TfrxMemoView.Create(n_gr);
       n_gr_1.CreateUniqueName;
       n_gr_1.Height:=0.8*fr1cm;
       n_gr_1.Width:=4*fr1cm;
       n_gr_1.Font.Size:=size_zagolovok;
       n_gr_1.Left:=0;
       n_gr_1.top:=0;
       n_gr_1.HAlign:=haLeft;
       n_gr_1.VAlign:=vaCenter;
       n_gr_1.Frame.Typ:=[ftLeft];
       n_gr_1.Text:='Група:';

       n_gr_2:=TfrxMemoView.Create(n_gr);
       n_gr_2.CreateUniqueName;
       n_gr_2.Height:=0.8*fr1cm;
       n_gr_2.Width:=15*fr1cm;
       n_gr_2.Font.Size:=size_zagolovok;
       n_gr_2.Left:=n_gr_1.Width;
       n_gr_2.top:=0;
       n_gr_2.Font.Style:=[fsBold];
       n_gr_2.HAlign:=haLeft;
       n_gr_2.VAlign:=vaCenter;
       n_gr_2.Frame.Typ:=[ftRight];
       n_gr_2.Text:='[frxDBDataset1."NAME_GROUP"]';
   end;
   //мастер дата

 DataBand:=TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.DataSet:=frxDBDataSet1;
  DAtaBand.Top:=top_next;
  DataBand.Height:=0.5*fr1cm;
  top_next:=DataBand.Top+DataBand.Height;
  DAtaBand.Stretched:=True;
 // if druk_pid = True then DataBand.Visible := False;

  memo_num:=TfrxMemoView.Create(DataBand);
  memo_num.CreateUniqueName;
  memo_num.Height:=0.5*fr1cm;
  memo_num.Width:=0.7*fr1cm;
  memo_num.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_num.Font.Size:=size;
  memo_num.Left:=0*fr1cm;
  memo_num.top:=0;
  memo_num.Text:='[Line]';
  memo_num.StretchMode:=smMaxHeight;
  memo_num.VAlign:=vaCenter;
  memo_num.HAlign:=haRight;
  memo_num.Font.Name:='Times New Roman';

  Memo_sm:=TfrxMemoView.Create(DataBand);
  Memo_sm.CreateUniqueName;
  Memo_sm.Height:=0.5*fr1cm;
  Memo_sm.Width:=1.2*fr1cm;
  Memo_sm.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  Memo_sm.Font.Size:=size;
  Memo_sm.Left:=memo_num.Width;
  Memo_sm.top:=0;
  Memo_sm.HAlign:=haCenter;
  Memo_sm.Text:='[frxDBDataset1."KEKV_KOD"]';
  Memo_sm.StretchMode:=smMaxHeight;
  Memo_sm.VAlign:=vaCenter;
  Memo_sm.Font.Name:='Times New Roman';

  Memo_PIB:=TfrxMemoView.Create(DataBand);
  Memo_PIB.CreateUniqueName;
  Memo_PIB.Height:=0.5*fr1cm;
  Memo_PIB.Width:=5.2*fr1cm;
  Memo_PIB.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  memo_PIB.Font.Size:=size;
  Memo_PIB.Left:=memo_num.Width+Memo_sm.Width;
  memo_PIB.top:=0;
  if print_num_dog = True then
  Memo_PIB.Text:='[frxDBDataset1."FIO"] ([frxDBDataset1."NUM_DOG"])'
  else Memo_PIB.Text:='[frxDBDataset1."FIO"]';
  Memo_PIB.StretchMode:=smMaxHeight;
  Memo_PIB.VAlign:=vaCenter;
  Memo_PIB.Font.Name:='Times New Roman';

  s_in_db:=TfrxMemoView.Create(DataBand);
  s_in_db.CreateUniqueName;
  s_in_db.Height:=0.5*fr1cm;;
  s_in_db.Width:=1.95*fr1cm;
  s_in_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_db.Font.Size:=size;
  s_in_db.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width;
  s_in_db.top:=0;
  s_in_db.HAlign:=haRight;
  s_in_db.DisplayFormat.Kind:=fkNumeric;
  s_in_db.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  s_in_db.Text:='[frxDBDataset1."IN_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  s_in_db.Text:='[frxDBDataset1."IN_DB_SUMMA"]';
  s_in_db.StretchMode:=smMaxHeight;
  s_in_db.VAlign:=vaCenter;
  s_in_db.Font.Name:='Times New Roman';

  s_in_kr:=TfrxMemoView.Create(DataBand);
  s_in_kr.CreateUniqueName;
  s_in_kr.Height:=0.5*fr1cm;;
  s_in_kr.Width:=1.95*fr1cm;
  s_in_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_in_kr.Font.Size:=size;
  s_in_kr.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width;
  s_in_kr.top:=0;
  s_in_kr.HAlign:=haRight;
  s_in_kr.DisplayFormat.Kind:=fkNumeric;
  s_in_kr.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  s_in_kr.Text:='[frxDBDataset1."IN_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."IN_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  s_in_kr.Text:='[frxDBDataset1."IN_KR_SUMMA"]';
  s_in_kr.StretchMode:=smMaxHeight;
  s_in_kr.VAlign:=vaCenter;
  s_in_kr.Font.Name:='Times New Roman';

  db_s:=TfrxMemoView.Create(DataBand);
  db_s.CreateUniqueName;
  db_s.Height:=0.5*fr1cm;
  db_s.Width:=2*fr1cm;
  db_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  db_s.Font.Size:=size;
  db_s.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width+s_in_kr.Width;
  db_s.top:=0;
  db_s.HAlign:=haRight;
  db_s.DisplayFormat.Kind:=fkNumeric;
  db_s.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  db_s.Text:='[frxDBDataset1."DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  db_s.Text:='[frxDBDataset1."DB_SUMMA"]';
  db_s.StretchMode:=smMaxHeight;
  db_s.VAlign:=vaCenter;
  db_s.Font.Name:='Times New Roman';

  kr_s:=TfrxMemoView.Create(DataBand);
  kr_s.CreateUniqueName;
  kr_s.Height:=0.5*fr1cm;
  kr_s.Width:=2*fr1cm;
  kr_s.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  kr_s.Font.Size:=size;
  kr_s.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width+s_in_kr.Width+db_s.Width;
  kr_s.top:=0;
  kr_s.HAlign:=haRight;
  kr_s.DisplayFormat.Kind:=fkNumeric;
  kr_s.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  kr_s.Text:='[frxDBDataset1."KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  kr_s.Text:='[frxDBDataset1."KR_SUMMA"]';
  kr_s.StretchMode:=smMaxHeight;
  kr_s.VAlign:=vaCenter;
  kr_s.Font.Name:='Times New Roman';

  s_out_db:=TfrxMemoView.Create(DataBand);
  s_out_db.CreateUniqueName;
  s_out_db.Height:=0.5*fr1cm;
  s_out_db.Width:=2*fr1cm;
  s_out_db.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_db.Font.Size:=size;
  s_out_db.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width+s_in_kr.Width+db_s.Width+kr_s.Width;
  s_out_db.top:=0;
  s_out_db.HAlign:=haRight;
  s_out_db.DisplayFormat.Kind:=fkNumeric;
  s_out_db.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  s_out_db.Text:='[frxDBDataset1."OUT_DB_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_DB_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  s_out_db.Text:='[frxDBDataset1."OUT_DB_SUMMA"]';
  s_out_db.StretchMode:=smMaxHeight;
  s_out_db.VAlign:=vaCenter;
  s_out_db.Font.Name:='Times New Roman';

  s_out_kr:=TfrxMemoView.Create(DataBand);
  s_out_kr.CreateUniqueName;
  s_out_kr.Height:=0.5*fr1cm;
  s_out_kr.Width:=with_summa*fr1cm;
  s_out_kr.Frame.Typ:=[ftLeft,ftRight,ftTop,ftBottom];
  s_out_kr.Font.Size:=size;
  s_out_kr.Left:=memo_num.Width+memo_pib.Width+Memo_sm.Width+s_in_db.Width+s_in_kr.Width+db_s.Width+kr_s.Width+s_out_db.Width;
  s_out_kr.top:=0;
  s_out_kr.HAlign:=haRight;
  s_out_kr.DisplayFormat.Kind:=fkNumeric;
  s_out_kr.DisplayFormat.FormatStr:='%2.2n';
  if is_valyuta=1 then
  s_out_kr.Text:='[frxDBDataset1."OUT_KR_SUMMA"]'+#13+#10+ '[frxDBDataset1."OUT_KR_SUMMA_VAL"] [frxDBDataset1."SYMBOL"]'
  else
  s_out_kr.Text:='[frxDBDataset1."OUT_KR_SUMMA"]';
  s_out_kr.StretchMode:=smMaxHeight;
  s_out_kr.VAlign:=vaCenter;
  s_out_kr.Font.Name:='Times New Roman';

  // нижние группы
  if grp_flag = 1 then
   begin
      n_gr_f:=TfrxGroupFooter.Create(page);
      n_gr_f.CreateUniqueName;
      n_gr_f.top:=top_next;
      n_gr_f.Height:=0.8*fr1cm;
      top_next:=n_gr_f.Top+n_gr_f.Height;
      n_gr_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(n_gr_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по групі: ';
      Memo1.Height:=n_gr_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(n_gr_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_GROUP"]';
      Memo2.Height:=n_gr_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=4.1*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(n_gr_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=n_gr_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=1.95*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(n_gr_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=n_gr_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=1.95*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(n_gr_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=n_gr_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(n_gr_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=n_gr_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(n_gr_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=n_gr_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(n_gr_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=n_gr_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if cl_live_flag = 1 then
   begin
      kurs_f:=TfrxGroupFooter.Create(page);
      kurs_f.CreateUniqueName;
      kurs_f.top:=top_next;
      kurs_f.Height:=0.8*fr1cm;
      top_next:=kurs_f.Top+kurs_f.Height;
      kurs_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(kurs_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по класу проживання: ';
      Memo1.Height:=kurs_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(kurs_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."CLASS_LIVE"]';
      Memo2.Height:=kurs_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=4.1*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(kurs_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=kurs_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=1.95*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(kurs_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=kurs_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=1.95*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(kurs_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=kurs_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(kurs_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=kurs_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(kurs_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=kurs_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(kurs_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=kurs_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;

   end;

  if type_live_flag = 1 then
   begin
      k_st_f:=TfrxGroupFooter.Create(page);
      k_st_f.CreateUniqueName;
      k_st_f.top:=top_next;
      k_st_f.Height:=0.8*fr1cm;
      top_next:=k_st_f.Top+k_st_f.Height;
      k_st_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(k_st_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по типу проживання: ';
      Memo1.Height:=k_st_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(k_st_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."TYPE_LIVE"]';
      Memo2.Height:=k_st_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=4.1*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(k_st_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=k_st_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=1.95*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(k_st_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=k_st_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=1.95*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(k_st_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=k_st_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(k_st_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=k_st_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(k_st_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=k_st_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(k_st_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=k_st_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if kat_pay_flag = 1 then
   begin
      f_st_f:=TfrxGroupFooter.Create(page);
      f_st_f.CreateUniqueName;
      f_st_f.top:=top_next;
      f_st_f.Height:=0.8*fr1cm;
      top_next:=f_st_f.Top+f_st_f.Height;
      f_st_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(f_st_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по категорії оплати: ';
      Memo1.Height:=f_st_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(f_st_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."CAT_PAY"]';
      Memo2.Height:=f_st_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=4.1*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.Font.Style:=[fsBold];
      Memo2.VAlign:=vaCenter;
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(f_st_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=f_st_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=1.95*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(f_st_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=f_st_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=1.95*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(f_st_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=f_st_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(f_st_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=f_st_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(f_st_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=f_st_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(f_st_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=f_st_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if kurs_st_flag = 1 then
   begin
      nat_f:=TfrxGroupFooter.Create(page);
      nat_f.CreateUniqueName;
      nat_f.top:=top_next;
      nat_f.Height:=0.8*fr1cm;
      top_next:=nat_f.Top+nat_f.Height;
      nat_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(nat_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по курсу: ';
      Memo1.Height:=nat_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.VAlign:=vaCenter;
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(nat_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."KURS"]';
      Memo2.Height:=nat_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=4.1*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.Font.Style:=[fsBold];
      Memo2.VAlign:=vaCenter;
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(nat_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=nat_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=1.95*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(nat_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=nat_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=1.95*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(nat_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=nat_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(nat_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=nat_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(nat_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=nat_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(nat_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=nat_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if fac_st_flag = 1 then
   begin
      spec_f:=TfrxGroupFooter.Create(page);
      spec_f.CreateUniqueName;
      spec_f.top:=top_next;
      spec_f.Height:=0.8*fr1cm;
      top_next:=spec_f.Top+spec_f.Height;
      spec_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(spec_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по факультету: ';
      Memo1.Height:=spec_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(spec_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."NAME_FAK"]';
      Memo2.Height:=spec_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=4.1*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(spec_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=spec_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=1.95*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(spec_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=spec_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=1.95*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(spec_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=spec_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(spec_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=spec_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(spec_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=spec_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(spec_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=spec_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.VAlign:=vaCenter;
      Memo8.HAlign:=haRight;
      Memo8.StretchMode:=smMaxHeight;
   end;

  if obsh_flag = 1 then
   begin
      fac_f:=TfrxGroupFooter.Create(page);
      fac_f.CreateUniqueName;
      fac_f.top:=top_next;
      fac_f.Height:=0.8*fr1cm;
      top_next:=fac_f.Top+fac_f.Height;
      fac_f.Stretched:=True;

      Memo1:=TfrxMemoView.Create(fac_f);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього по гуртожитку: ';
      Memo1.Height:=fac_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=3*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;

      Memo2:=TfrxMemoView.Create(fac_f);
      Memo2.CreateUniqueName;
      Memo2.Text:='[frxDBDataset1."BUILDS"]';
      Memo2.Height:=fac_f.Height;
      memo2.Left:=Memo1.Width;
      Memo2.Font.Size:=size;
      Memo2.Width:=4.1*fr1cm;
      Memo2.Frame.Typ:=[ftRight, ftTop, ftBottom];
      Memo2.VAlign:=vaCenter;
      Memo2.Font.Style:=[fsBold];
      Memo2.StretchMode:=smMaxHeight;

      Memo3:=TfrxMemoView.Create(fac_f);
      Memo3.CreateUniqueName;
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=fac_f.Height;
      memo3.Left:=Memo1.Width+Memo2.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=1.95*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;

      Memo4:=TfrxMemoView.Create(fac_f);
      Memo4.CreateUniqueName;
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=fac_f.Height;
      memo4.Left:=Memo1.Width+Memo2.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=1.95*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;

      Memo5:=TfrxMemoView.Create(fac_f);
      Memo5.CreateUniqueName;
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=fac_f.Height;
      memo5.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;

      Memo6:=TfrxMemoView.Create(fac_f);
      Memo6.CreateUniqueName;
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=fac_f.Height;
      memo6.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;

      Memo7:=TfrxMemoView.Create(fac_f);
      Memo7.CreateUniqueName;
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=fac_f.Height;
      memo7.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;

      Memo8:=TfrxMemoView.Create(fac_f);
      Memo8.CreateUniqueName;
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=fac_f.Height;
      memo8.Left:=Memo1.Width+Memo2.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.HAlign:=haRight;
      Memo8.VAlign:=vaCenter;
      Memo8.StretchMode:=smMaxHeight;
   end;

    main_footer:=TfrxFooter.Create(page);
      main_footer.CreateUniqueName;
      main_footer.top:=top_next;
      main_footer.Height:=0.8*fr1cm;
      top_next:=main_footer.Top+main_footer.Height;
      main_footer.Stretched:=True;

      Memo1:=TfrxMemoView.Create(main_footer);
      Memo1.CreateUniqueName;
      Memo1.Text:='Всього: ';
      Memo1.Height:=fac_f.Height;
      memo1.Left:=0;
      Memo1.Font.Size:=size;
      Memo1.Width:=7.1*fr1cm;
      Memo1.VAlign:=vaCenter;
      Memo1.Frame.Typ:=[ftLeft, ftTop, ftBottom];
      Memo1.StretchMode:=smMaxHeight;
      Memo1.Font.Name:='Times New Roman';
      Memo1.Font.Style:=[fsBold];

      Memo3:=TfrxMemoView.Create(main_footer);
      Memo3.CreateUniqueName;
      if is_valyuta=1 then
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo3.Text:='[SUM(<frxDBDataset1."IN_DB_SUMMA">)]';
      Memo3.Height:=fac_f.Height;
      memo3.Left:=Memo1.Width;
      Memo3.Font.Size:=size;
      Memo3.Width:=1.95*fr1cm;
      Memo3.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo3.DisplayFormat.Kind:=fkNumeric;
      Memo3.DisplayFormat.FormatStr:='%2.2n';
      Memo3.VAlign:=vaCenter;
      Memo3.HAlign:=haRight;
      Memo3.StretchMode:=smMaxHeight;
      Memo3.Font.Name:='Times New Roman';
      Memo3.Font.Style:=[fsBold];

      Memo4:=TfrxMemoView.Create(main_footer);
      Memo4.CreateUniqueName;
      if is_valyuta=1 then
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."IN_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo4.Text:='[SUM(<frxDBDataset1."IN_KR_SUMMA">)]';
      Memo4.Height:=fac_f.Height;
      memo4.Left:=Memo1.Width+Memo3.Width;
      Memo4.Font.Size:=size;
      Memo4.Width:=1.95*fr1cm;
      Memo4.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo4.DisplayFormat.Kind:=fkNumeric;
      Memo4.DisplayFormat.FormatStr:='%2.2n';
      Memo4.VAlign:=vaCenter;
      Memo4.HAlign:=haRight;
      Memo4.StretchMode:=smMaxHeight;
      Memo4.Font.Name:='Times New Roman';
      Memo4.Font.Style:=[fsBold];

      Memo5:=TfrxMemoView.Create(main_footer);
      Memo5.CreateUniqueName;
      if is_valyuta=1 then
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo5.Text:='[SUM(<frxDBDataset1."DB_SUMMA">)]';
      Memo5.Height:=fac_f.Height;
      memo5.Left:=Memo1.Width+Memo3.Width+Memo4.Width;
      Memo5.Font.Size:=size;
      Memo5.Width:=with_summa*fr1cm;
      Memo5.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo5.DisplayFormat.Kind:=fkNumeric;
      Memo5.DisplayFormat.FormatStr:='%2.2n';
      Memo5.VAlign:=vaCenter;
      Memo5.HAlign:=haRight;
      Memo5.StretchMode:=smMaxHeight;
      Memo5.Font.Name:='Times New Roman';
      Memo5.Font.Style:=[fsBold];

      Memo6:=TfrxMemoView.Create(main_footer);
      Memo6.CreateUniqueName;
      if is_valyuta=1 then
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo6.Text:='[SUM(<frxDBDataset1."KR_SUMMA">)]';
      Memo6.Height:=fac_f.Height;
      memo6.Left:=Memo1.Width+Memo3.Width+Memo4.Width+Memo5.Width;
      Memo6.Font.Size:=size;
      Memo6.Width:=with_summa*fr1cm;
      Memo6.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo6.DisplayFormat.Kind:=fkNumeric;
      Memo6.DisplayFormat.FormatStr:='%2.2n';
      Memo6.VAlign:=vaCenter;
      Memo6.HAlign:=haRight;
      Memo6.StretchMode:=smMaxHeight;
      Memo6.Font.Name:='Times New Roman';
      Memo6.Font.Style:=[fsBold];

      Memo7:=TfrxMemoView.Create(main_footer);
      Memo7.CreateUniqueName;
      if is_valyuta=1 then
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_DB_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo7.Text:='[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]';
      Memo7.Height:=fac_f.Height;
      memo7.Left:=Memo1.Width+Memo3.Width+Memo4.Width+Memo5.Width++Memo6.Width;
      Memo7.Font.Size:=size;
      Memo7.Width:=with_summa*fr1cm;
      Memo7.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo7.DisplayFormat.Kind:=fkNumeric;
      Memo7.DisplayFormat.FormatStr:='%2.2n';
      Memo7.VAlign:=vaCenter;
      Memo7.HAlign:=haRight;
      Memo7.StretchMode:=smMaxHeight;
      Memo7.Font.Name:='Times New Roman';
      Memo7.Font.Style:=[fsBold];

      Memo8:=TfrxMemoView.Create(main_footer);
      Memo8.CreateUniqueName;
      if is_valyuta=1 then
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]'+#13+#10+ '[SUM(<frxDBDataset1."OUT_KR_SUMMA_VAL">)] [frxDBDataset1."SYMBOL"]'
      else
      Memo8.Text:='[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]';
      Memo8.Height:=fac_f.Height;
      memo8.Left:=Memo1.Width+Memo3.Width+Memo4.Width+Memo5.Width+Memo6.Width+Memo7.Width;
      Memo8.Font.Size:=size;
      Memo8.Width:=with_summa*fr1cm;
      Memo8.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      Memo8.DisplayFormat.Kind:=fkNumeric;
      Memo8.DisplayFormat.FormatStr:='%2.2n';
      Memo8.HAlign:=haRight;
      Memo8.VAlign:=vaCenter;
      Memo8.StretchMode:=smMaxHeight;
      Memo8.Font.Style:=[fsBold];

      //page_foter
   page_footer:=TfrxPageFooter.Create(page);
   page_footer.CreateUniqueName;
   page_footer.top:=top_next;
   page_footer.Height:=0.8*fr1cm;
   top_next:=page_footer.top + page_footer.Height;

   date_print:=TfrxMemoView.Create(page_footer);
   date_print.CreateUniqueName;
   date_print.Text:='Дата друку: [Now]';
   date_print.Height:=page_footer.Height;
   date_print.Left:=0;
   date_print.Font.Size:=8;
   date_print.Width:=5.4*fr1cm;
   date_print.VAlign:=vaCenter;
//   date_print.StretchMode:=smMaxHeight;

   page_print:=TfrxMemoView.Create(page_footer);
   page_print.CreateUniqueName;
   page_print.Text:='Стор. [Page#] із [TotalPages#]';
   page_print.Height:=page_footer.Height;
   page_print.Left:=13.6*fr1cm;
   page_print.Font.Size:=8;
   page_print.Width:=5.4*fr1cm;
   page_print.VAlign:=vaCenter;

   //итоги
   head1:=TfrxHeader.Create(page);
   head1.CreateUniqueName;
   head1.Top:=top_next;
   head1.Height:=1.6*fr1cm;
   top_next:=head1.Top+head1.Height;
   head1.OnAfterPrint:='Header1OnAfterPrint';
   h_memo:=0.5*fr1cm;

   Memo_1:=TfrxMemoView.Create(head1);
   Memo_1.CreateUniqueName;
   Memo_1.Text:='Залишок на початок місяця:';
   Memo_1.Height:=h_memo;
   Memo_1.Left:=0;
   Memo_1.Font.Size:=10;
   Memo_1.Width:=4.8*fr1cm;
   Memo_1.VAlign:=vaCenter;
   Memo_1.HAlign:=haLeft;
   Memo_1.Font.Style:=[fsBold];
   Memo_1.Font.Name:='Times New Roman';
   Memo_1.Top:=0.4*fr1cm;

   Memo_2:=TfrxMemoView.Create(head1);
   Memo_2.CreateUniqueName;
   Memo_2.Text:='Дебет';
   Memo_2.Height:=h_memo;
   Memo_2.Left:=9.4*fr1cm;
   Memo_2.Font.Size:=10;
   Memo_2.Width:=1.2*fr1cm;
   Memo_2.HAlign:=haLeft;
   Memo_2.Font.Style:=[fsBold];
   Memo_2.Font.Name:='Times New Roman';
   Memo_2.Top:=0.4*fr1cm;
    
   Memo_3:=TfrxMemoView.Create(head1);
   Memo_3.CreateUniqueName;
   Memo_3.Text:=FloatToStrF(IN_DS, ffFixed, 100, 2);;
   Memo_3.Height:=h_memo;
   Memo_3.Left:=10.6*fr1cm;
   Memo_3.Font.Size:=10;
   Memo_3.Width:=3*fr1cm;
   Memo_3.HAlign:=haRight;
   Memo_3.Font.Name:='Times New Roman';
   Memo_3.DisplayFormat.Kind:=fkNumeric;
   Memo_3.DisplayFormat.FormatStr:='%2.2n';
   Memo_3.Top:=0.4*fr1cm;

   Memo_4:=TfrxMemoView.Create(head1);
   Memo_4.CreateUniqueName;
   Memo_4.Text:='Кредит';
   Memo_4.Height:=h_memo;
   Memo_4.Left:=14.6*fr1cm;
   Memo_4.Font.Size:=10;
   Memo_4.Width:=1.4*fr1cm;
   Memo_4.HAlign:=haLeft;
   Memo_4.Font.Style:=[fsBold];
   Memo_4.Font.Name:='Times New Roman';
   Memo_4.Top:=0.4*fr1cm;

   Memo_5:=TfrxMemoView.Create(head1);
   Memo_5.CreateUniqueName;
   Memo_5.Text:=FloatToStrF(IN_KS, ffFixed, 100, 2);;
   Memo_5.Height:=h_memo;
   Memo_5.Left:=16*fr1cm;
   Memo_5.Font.Size:=10;
   Memo_5.Width:=3*fr1cm;
   Memo_5.HAlign:=haRight;
   Memo_5.Font.Name:='Times New Roman';
   Memo_5.DisplayFormat.Kind:=fkNumeric;
   Memo_5.DisplayFormat.FormatStr:='%2.2n';
   Memo_5.Top:=0.4*fr1cm;

   Memo_6:=TfrxMemoView.Create(head1);
   Memo_6.CreateUniqueName;
   Memo_6.Text:='Субрахунок';
   Memo_6.Height:=0.5*fr1cm;
   Memo_6.Left:=11.9*fr1cm;
   Memo_6.Font.Size:=10;
   Memo_6.Width:=2.5*fr1cm;
   Memo_6.HAlign:=haLeft;
   Memo_6.Font.Style:=[fsBold];
   Memo_6.Font.Name:='Times New Roman';
   Memo_6.Top:=1.1*fr1cm;

   Memo_7:=TfrxMemoView.Create(head1);
   Memo_7.CreateUniqueName;
   Memo_7.Text:='Сума';
   Memo_7.Height:=0.5*fr1cm;
   Memo_7.Left:=17*fr1cm;
   Memo_7.Font.Size:=10;
   Memo_7.Width:=2*fr1cm;
   Memo_7.HAlign:=haLeft;
   Memo_7.Font.Style:=[fsBold];
   Memo_7.Font.Name:='Times New Roman';
   Memo_7.Top:=1.1*fr1cm;

   Memo_1:=TfrxMemoView.Create(head1);
   Memo_1.CreateUniqueName;
   Memo_1.Text:=' Дебет субрахунку [frxDBDataset1."SCH_NUMBER"] до кредиту субрахунків:';
   Memo_1.Height:=h_memo;
   Memo_1.Left:=0;
   Memo_1.Font.Size:=10;
   Memo_1.Width:=11.8*fr1cm;
   Memo_1.HAlign:=haLeft;
   Memo_1.Font.Style:=[fsBold];
   Memo_1.Font.Name:='Times New Roman';
   Memo_1.Top:=1.1*fr1cm;

   MD1:=TfrxMasterData.Create(page);
   MD1.CreateUniqueName;
   MD1.DataSet:=ds_pod;
   MD1.Top:=top_next;
   MD1.Height:=0.5*fr1cm;
   top_next:=MD1.Top+MD1.Height;
   MD1.Stretched:=True;

   Memo_2:=TfrxMemoView.Create(MD1);
   Memo_2.CreateUniqueName;
   Memo_2.Text:='[ds_pod."DB_SCH_NUMBER"]'; // f_st_2.Text:='[frxDBDataset1."NAME_FORM_STUD"]';
   Memo_2.Height:=h_memo;
   Memo_2.Left:=11.9*fr1cm;
   Memo_2.Font.Size:=10;
   Memo_2.Width:=3.5*fr1cm;
   Memo_2.HAlign:=haCenter;
   Memo_2.Font.Name:='Times New Roman';
   Memo_2.Top:=0;
   Memo_2.Frame.Typ:=[ftBottom];

   Memo_3:=TfrxMemoView.Create(MD1);
   Memo_3.CreateUniqueName;
   Memo_3.Text:='[ds_pod."SUM"]';
   Memo_3.Height:=h_memo;
   Memo_3.Left:=15.4*fr1cm;
   Memo_3.Font.Size:=10;
   Memo_3.Width:=3.6*fr1cm;
   Memo_3.HAlign:=haRight;
   Memo_3.Font.Name:='Times New Roman';
   Memo_3.DisplayFormat.Kind:=fkNumeric;
   Memo_3.DisplayFormat.FormatStr:='%2.2n';
   Memo_3.Top:=0;
   Memo_3.Frame.Typ:=[ftBottom];

   foot1:=TfrxFooter.Create(page);
   foot1.CreateUniqueName;
   foot1.Top:=top_next;
   foot1.Height:=0.5*fr1cm;
   top_next:=foot1.Top+foot1.Height;

   Memo_1:=TfrxMemoView.Create(foot1);
   Memo_1.CreateUniqueName;
   Memo_1.Text:='Разом:';
   Memo_1.Height:=h_memo;
   Memo_1.Left:=11.9*fr1cm;
   Memo_1.Font.Size:=10;
   Memo_1.Width:=2.5*fr1cm;
   Memo_1.HAlign:=haLeft;
   Memo_1.Font.Style:=[fsBold];
   Memo_1.Font.Name:='Times New Roman';
   Memo_1.Top:=0*fr1cm;

   Memo_2:=TfrxMemoView.Create(foot1);
   Memo_2.CreateUniqueName;
   Memo_2.Text:='[SUM(<ds_pod."SUM">)]';
   Memo_2.Height:=h_memo;
   Memo_2.Left:=15.4*fr1cm;
   Memo_2.Font.Size:=10;
   Memo_2.Width:=3.6*fr1cm;
   Memo_2.HAlign:=haRight;
   Memo_2.Font.Name:='Times New Roman';
   Memo_2.DisplayFormat.Kind:=fkNumeric;
   Memo_2.DisplayFormat.FormatStr:='%2.2n';
   Memo_2.Font.Style:=[fsBold];
   Memo_2.Top:=0*fr1cm;

   //

   head2:=TfrxHeader.Create(page);
   head2.CreateUniqueName;
   head2.Top:=top_next;
   head2.Height:=0.8*fr1cm;
   top_next:=head2.Top+head2.Height;
   h_memo:=0.5*fr1cm;

   Memo_6:=TfrxMemoView.Create(head2);
   Memo_6.CreateUniqueName;
   Memo_6.Text:='Субрахунок';
   Memo_6.Height:=0.5*fr1cm;
   Memo_6.Left:=11.9*fr1cm;
   Memo_6.Font.Size:=10;
   Memo_6.Width:=2.5*fr1cm;
   Memo_6.HAlign:=haLeft;
   Memo_6.Font.Style:=[fsBold];
   Memo_6.Font.Name:='Times New Roman';
   Memo_6.Top:=0.3*fr1cm;

   Memo_7:=TfrxMemoView.Create(head2);
   Memo_7.CreateUniqueName;
   Memo_7.Text:='Сума';
   Memo_7.Height:=0.5*fr1cm;
   Memo_7.Left:=17*fr1cm;
   Memo_7.Font.Size:=10;
   Memo_7.Width:=2*fr1cm;
   Memo_7.HAlign:=haLeft;
   Memo_7.Font.Style:=[fsBold];
   Memo_7.Font.Name:='Times New Roman';
   Memo_7.Top:=0.3*fr1cm;

   Memo_1:=TfrxMemoView.Create(head2);
   Memo_1.CreateUniqueName;
   Memo_1.Text:=' Кредит субрахунку [frxDBDataset1."SCH_NUMBER"] до дебету субрахунків:';
   Memo_1.Height:=h_memo;
   Memo_1.Left:=0;
   Memo_1.Font.Size:=10;
   Memo_1.Width:=11.8*fr1cm;
   Memo_1.HAlign:=haLeft;
   Memo_1.Font.Style:=[fsBold];
   Memo_1.Font.Name:='Times New Roman';
   Memo_1.Top:=0.3*fr1cm;

   MD2:=TfrxMasterData.Create(page);
   MD2.CreateUniqueName;
   MD2.DataSet:=ds_pod2;
   MD2.Top:=top_next;
   MD2.Height:=0.5*fr1cm;
   top_next:=MD2.Top+MD2.Height;
   MD2.Stretched:=True;

   Memo_2:=TfrxMemoView.Create(MD2);
   Memo_2.CreateUniqueName;
   Memo_2.Text:='[ds_pod2."KR_SCH_NUMBER"]'; // f_st_2.Text:='[frxDBDataset1."NAME_FORM_STUD"]';
   Memo_2.Height:=h_memo;
   Memo_2.Left:=11.9*fr1cm;
   Memo_2.Font.Size:=10;
   Memo_2.Width:=3.5*fr1cm;
   Memo_2.HAlign:=haCenter;
   Memo_2.Font.Name:='Times New Roman';
   Memo_2.Top:=0;
   Memo_2.Frame.Typ:=[ftBottom];

   Memo_3:=TfrxMemoView.Create(MD2);
   Memo_3.CreateUniqueName;
   Memo_3.Text:='[ds_pod2."SUM"]';
   Memo_3.Height:=h_memo;
   Memo_3.Left:=15.4*fr1cm;
   Memo_3.Font.Size:=10;
   Memo_3.Width:=3.6*fr1cm;
   Memo_3.HAlign:=haRight;
   Memo_3.Font.Name:='Times New Roman';
   Memo_3.DisplayFormat.Kind:=fkNumeric;
   Memo_3.DisplayFormat.FormatStr:='%2.2n';
   Memo_3.Top:=0;
   Memo_3.Frame.Typ:=[ftBottom];

   foot2:=TfrxFooter.Create(page);
   foot2.CreateUniqueName;
   foot2.Top:=top_next;
   foot2.Height:=3.3*fr1cm;
   top_next:=foot2.Top+foot2.Height;

   Memo_1:=TfrxMemoView.Create(foot2);
   Memo_1.CreateUniqueName;
   Memo_1.Text:='Разом:';
   Memo_1.Height:=h_memo;
   Memo_1.Left:=11.9*fr1cm;
   Memo_1.Font.Size:=10;
   Memo_1.Width:=2.5*fr1cm;
   Memo_1.HAlign:=haLeft;
   Memo_1.Font.Style:=[fsBold];
   Memo_1.Font.Name:='Times New Roman';
   Memo_1.Top:=0*fr1cm;

   Memo_2:=TfrxMemoView.Create(foot2);
   Memo_2.CreateUniqueName;
   Memo_2.Text:='[SUM(<ds_pod2."SUM">)]';
   Memo_2.Height:=h_memo;
   Memo_2.Left:=15.4*fr1cm;
   Memo_2.Font.Size:=10;
   Memo_2.Width:=3.6*fr1cm;
   Memo_2.HAlign:=haRight;
   Memo_2.Font.Name:='Times New Roman';
   Memo_2.DisplayFormat.Kind:=fkNumeric;
   Memo_2.DisplayFormat.FormatStr:='%2.2n';
   Memo_2.Font.Style:=[fsBold];
   Memo_2.Font.Name:='Times New Roman';
   Memo_2.Top:=0*fr1cm;

   Memo_3:=TfrxMemoView.Create(foot2);
   Memo_3.CreateUniqueName;
   Memo_3.Text:='Залишок на кінець місяця:';
   Memo_3.Height:=h_memo;
   Memo_3.Left:=0*fr1cm;
   Memo_3.Font.Size:=10;
   Memo_3.Width:=4.8*fr1cm;
   Memo_3.HAlign:=haLeft;
   Memo_3.Font.Style:=[fsBold];
   Memo_3.Font.Name:='Times New Roman';
   Memo_3.Top:=0.9*fr1cm;

   Memo_4:=TfrxMemoView.Create(foot2);
   Memo_4.CreateUniqueName;
   Memo_4.Text:='Дебет';
   Memo_4.Height:=h_memo;
   Memo_4.Left:=9.4*fr1cm;
   Memo_4.Font.Size:=10;
   Memo_4.Width:=1.2*fr1cm;
   Memo_4.HAlign:=haLeft;
   Memo_4.Font.Style:=[fsBold];
   Memo_4.Font.Name:='Times New Roman';
   Memo_4.Top:=0.9*fr1cm;

   Memo_5:=TfrxMemoView.Create(foot2);
   Memo_5.CreateUniqueName;
   Memo_5.Text:=FloatToStrF(OUT_DS, ffFixed, 100, 2);;
   Memo_5.Height:=h_memo;
   Memo_5.Left:=10.6*fr1cm;
   Memo_5.Font.Size:=10;
   Memo_5.Width:=3*fr1cm;
   Memo_5.HAlign:=haRight;
   Memo_5.Font.Name:='Times New Roman';
   Memo_5.DisplayFormat.Kind:=fkNumeric;
   Memo_5.DisplayFormat.FormatStr:='%2.2n';
   Memo_5.Top:=0.9*fr1cm;

   Memo_6:=TfrxMemoView.Create(foot2);
   Memo_6.CreateUniqueName;
   Memo_6.Text:='Кредит';
   Memo_6.Height:=h_memo;
   Memo_6.Left:=14.6*fr1cm;
   Memo_6.Font.Size:=10;
   Memo_6.Width:=1.4*fr1cm;
   Memo_6.HAlign:=haLeft;
   Memo_6.Font.Style:=[fsBold];
   Memo_6.Font.Name:='Times New Roman';
   Memo_6.Top:=0.9*fr1cm;

   Memo_7:=TfrxMemoView.Create(foot2);
   Memo_7.CreateUniqueName;
   Memo_7.Text:=FloatToStrF(OUT_KS, ffFixed, 100, 2);
   Memo_7.Height:=h_memo;
   Memo_7.Left:=16*fr1cm;
   Memo_7.Font.Size:=10;
   Memo_7.Width:=3*fr1cm;
   Memo_7.HAlign:=haRight;
   Memo_7.Font.Name:='Times New Roman';
   Memo_7.DisplayFormat.Kind:=fkNumeric;
   Memo_7.DisplayFormat.FormatStr:='%2.2n';
   Memo_7.Top:=0.9*fr1cm;

   Memo1:=TfrxMemoView.Create(foot2);
   Memo1.CreateUniqueName;
   Memo1.Text:='Сума оборотів за меморіальним ордером:';
   Memo1.Height:=h_memo;
   Memo1.Left:=0*fr1cm;
   Memo1.Font.Size:=10;
   Memo1.Width:=7.2*fr1cm;
   Memo1.HAlign:=haLeft;
   Memo1.Font.Style:=[fsBold];
   Memo1.Font.Name:='Times New Roman';
   Memo1.Top:=2.3*fr1cm;

   Memo2:=TfrxMemoView.Create(foot2);
   Memo2.CreateUniqueName;
   Memo2.Text:= '[SUM(<ds_pod2."SUM">)]';
   Memo2.Height:=h_memo;
   Memo2.Left:=16*fr1cm;
   Memo2.Font.Size:=10;
   Memo2.Width:=3*fr1cm;
   Memo2.HAlign:=haRight;
   Memo2.Font.Name:='Times New Roman';
   Memo2.DisplayFormat.Kind:=fkNumeric;
   Memo2.DisplayFormat.FormatStr:='%2.2n';
   Memo2.Top:=2.3*fr1cm;
   Memo2.Font.Style:=[fsBold];

 //  page_print.StretchMode:=smMaxHeight;
  //report summary
  band_footer:=TfrxReportSummary.Create(page);
  band_footer.CreateUniqueName;
  band_footer.top:=top_next;
  band_footer.Height:=6.2*fr1cm;
  h_memo:=0.5*fr1cm;
  top_next:=band_footer.top + band_footer.Height;

  Memo1:=TfrxMemoView.Create(band_footer);
  Memo1.CreateUniqueName;
  Memo1.Text:='Виконавець';
  Memo1.Height:=h_memo;
  Memo1.Left:=0*fr1cm;
  Memo1.Font.Size:=10;
  Memo1.Width:=2.5*fr1cm;
  Memo1.HAlign:=haLeft;
  Memo1.Font.Name:='Times New Roman';
  Memo1.Top:=0*fr1cm;

  Memo2:=TfrxMemoView.Create(band_footer);
  Memo2.CreateUniqueName;
  Memo2.Text:='';
  Memo2.Height:=h_memo;
  Memo2.Left:=3.2*fr1cm;
  Memo2.Font.Size:=size;
  Memo2.Width:=2.5*fr1cm;
  Memo2.HAlign:=haLeft;
  Memo2.Font.Name:='Times New Roman';
  Memo2.Top:=0*fr1cm;
  Memo2.Frame.Typ:=[ftBottom];

  Memo3:=TfrxMemoView.Create(band_footer);
  Memo3.CreateUniqueName;
  Memo3.Text:='(посада)';
  Memo3.Height:=h_memo;
  Memo3.Left:=3.8*fr1cm;
  Memo3.Font.Size:=8;
  Memo3.Width:=1.1*fr1cm;
  Memo3.HAlign:=haCenter;
  Memo3.Font.Name:='Times New Roman';
  Memo3.Top:=0.5*fr1cm;

  Memo4:=TfrxMemoView.Create(band_footer);
  Memo4.CreateUniqueName;
  Memo4.Text:='';
  Memo4.Height:=h_memo;
  Memo4.Left:=6.8*fr1cm;
  Memo4.Font.Size:=size;
  Memo4.Width:=2.5*fr1cm;
  Memo4.HAlign:=haLeft;
  Memo4.Font.Name:='Times New Roman';
  Memo4.Top:=0*fr1cm;
  Memo4.Frame.Typ:=[ftBottom];

  Memo5:=TfrxMemoView.Create(band_footer);
  Memo5.CreateUniqueName;
  Memo5.Text:='(підпис)';
  Memo5.Height:=h_memo;
  Memo5.Left:=7.4*fr1cm;
  Memo5.Font.Size:=8;
  Memo5.Width:=1.1*fr1cm;
  Memo5.HAlign:=haCenter;
  Memo5.Font.Name:='Times New Roman';
  Memo5.Top:=0.5*fr1cm;

  Memo6:=TfrxMemoView.Create(band_footer);
  Memo6.CreateUniqueName;
  Memo6.Text:='/'+USER_FIO+'/';
  Memo6.Height:=h_memo;
  Memo6.Left:=9.7*fr1cm;
  Memo6.Font.Size:=10;
  Memo6.Width:=9.2*fr1cm;
  Memo6.HAlign:=haLeft;
  Memo6.Font.Name:='Times New Roman';
  Memo6.Top:=0*fr1cm;
  Memo6.Frame.Typ:=[ftBottom];

  Memo7:=TfrxMemoView.Create(band_footer);
  Memo7.CreateUniqueName;
  Memo7.Text:='(ПІБ)';
  Memo7.Height:=h_memo;
  Memo7.Left:=13.4*fr1cm;
  Memo7.Font.Size:=8;
  Memo7.Width:=0.8*fr1cm;
  Memo7.HAlign:=haCenter;
  Memo7.Font.Name:='Times New Roman';
  Memo7.Top:=0.5*fr1cm;

  Memo_1:=TfrxMemoView.Create(band_footer);
  Memo_1.CreateUniqueName;
  Memo_1.Text:='Перевірив';
  Memo_1.Height:=h_memo;
  Memo_1.Left:=0*fr1cm;
  Memo_1.Font.Size:=10;
  Memo_1.Width:=2.5*fr1cm;
  Memo_1.HAlign:=haLeft;
  Memo_1.Font.Name:='Times New Roman';
  Memo_1.Top:=1.6*fr1cm;

  Memo_2:=TfrxMemoView.Create(band_footer);
  Memo_2.CreateUniqueName;
  Memo_2.Text:='';
  Memo_2.Height:=h_memo;
  Memo_2.Left:=3.2*fr1cm;
  Memo_2.Font.Size:=size;
  Memo_2.Width:=2.5*fr1cm;
  Memo_2.HAlign:=haLeft;
  Memo_2.Font.Name:='Times New Roman';
  Memo_2.Top:=1.6*fr1cm;
  Memo_2.Frame.Typ:=[ftBottom];

  Memo_3:=TfrxMemoView.Create(band_footer);
  Memo_3.CreateUniqueName;
  Memo_3.Text:='(посада)';
  Memo_3.Height:=h_memo;
  Memo_3.Left:=3.8*fr1cm;
  Memo_3.Font.Size:=8;
  Memo_3.Width:=1.1*fr1cm;
  Memo_3.HAlign:=haCenter;
  Memo_3.Font.Name:='Times New Roman';
  Memo_3.Top:=2.1*fr1cm;

  Memo_4:=TfrxMemoView.Create(band_footer);
  Memo_4.CreateUniqueName;
  Memo_4.Text:='';
  Memo_4.Height:=h_memo;
  Memo_4.Left:=6.8*fr1cm;
  Memo_4.Font.Size:=size;
  Memo_4.Width:=2.5*fr1cm;
  Memo_4.HAlign:=haLeft;
  Memo_4.Font.Name:='Times New Roman';
  Memo_4.Top:=1.6*fr1cm;
  Memo_4.Frame.Typ:=[ftBottom];

  Memo_5:=TfrxMemoView.Create(band_footer);
  Memo_5.CreateUniqueName;
  Memo_5.Text:='(підпис)';
  Memo_5.Height:=h_memo;
  Memo_5.Left:=7.4*fr1cm;
  Memo_5.Font.Size:=8;
  Memo_5.Width:=1.1*fr1cm;
  Memo_5.HAlign:=haCenter;
  Memo_5.Font.Name:='Times New Roman';
  Memo_5.Top:=2.1*fr1cm;

  Memo_6:=TfrxMemoView.Create(band_footer);
  Memo_6.CreateUniqueName;
  Memo_6.Text:='';
  Memo_6.Height:=h_memo;
  Memo_6.Left:=9.7*fr1cm;
  Memo_6.Font.Size:=size;
  Memo_6.Width:=9.2*fr1cm;
  Memo_6.HAlign:=haLeft;
  Memo_6.Font.Name:='Times New Roman';
  Memo_6.Top:=1.6*fr1cm;
  Memo_6.Frame.Typ:=[ftBottom];

  Memo_7:=TfrxMemoView.Create(band_footer);
  Memo_7.CreateUniqueName;
  Memo_7.Text:='(ПІБ)';
  Memo_7.Height:=h_memo;
  Memo_7.Left:=13.4*fr1cm;
  Memo_7.Font.Size:=8;
  Memo_7.Width:=0.8*fr1cm;
  Memo_7.HAlign:=haCenter;
  Memo_7.Font.Name:='Times New Roman';
  Memo_7.Top:=2.1*fr1cm;

  m1:=TfrxMemoView.Create(band_footer);
  m1.CreateUniqueName;
  m1.Text:='Головний бухгалтер';
  m1.Height:=h_memo;
  m1.Left:=0*fr1cm;
  m1.Font.Size:=10;
  m1.Width:=3*fr1cm;
  m1.HAlign:=haLeft;
  m1.Font.Name:='Times New Roman';
  m1.Top:=3*fr1cm;

  m4:=TfrxMemoView.Create(band_footer);
  m4.CreateUniqueName;
  m4.Text:='';
  m4.Height:=h_memo;
  m4.Left:=6.8*fr1cm;
  m4.Font.Size:=size;
  m4.Width:=2.5*fr1cm;
  m4.HAlign:=haLeft;
  m4.Font.Name:='Times New Roman';
  m4.Top:=3*fr1cm;
  m4.Frame.Typ:=[ftBottom];

  m5:=TfrxMemoView.Create(band_footer);
  m5.CreateUniqueName;
  m5.Text:='(підпис)';
  m5.Height:=h_memo;
  m5.Left:=7.4*fr1cm;
  m5.Font.Size:=8;
  m5.Width:=1.1*fr1cm;
  m5.HAlign:=haCenter;
  m5.Font.Name:='Times New Roman';
  m5.Top:=3.5*fr1cm;

  m6:=TfrxMemoView.Create(band_footer);
  m6.CreateUniqueName;
  m6.Text:='';
  m6.Height:=h_memo;
  m6.Left:=9.7*fr1cm;
  m6.Font.Size:=size;
  m6.Width:=9.2*fr1cm;
  m6.HAlign:=haLeft;
  m6.Font.Name:='Times New Roman';
  m6.Top:=3*fr1cm;
  m6.Frame.Typ:=[ftBottom];

  m7:=TfrxMemoView.Create(band_footer);
  m7.CreateUniqueName;
  m7.Text:='(ПІБ)';
  m7.Height:=h_memo;
  m7.Left:=13.4*fr1cm;
  m7.Font.Size:=8;
  m7.Width:=0.8*fr1cm;
  m7.HAlign:=haCenter;
  m7.Font.Name:='Times New Roman';
  m7.Top:=3.5*fr1cm;

  memo8:=TfrxMemoView.Create(band_footer);
  memo8.CreateUniqueName;
  memo8.Text:='"__"_________________ 20__р.';
  memo8.Height:=h_memo;
  memo8.Left:=0*fr1cm;
  memo8.Font.Size:=10;
  memo8.Width:=5.1*fr1cm;
  memo8.HAlign:=haCenter;
  memo8.Font.Name:='Times New Roman';
  memo8.Top:=5.3*fr1cm;

  memo_8:=TfrxMemoView.Create(band_footer);
  memo_8.CreateUniqueName;
  memo_8.Text:='Додаток на ___________ аркушах';
  memo_8.Height:=h_memo;
  memo_8.Left:=12.3*fr1cm;
  memo_8.Font.Size:=10;
  memo_8.Width:=5.4*fr1cm;
  memo_8.HAlign:=haCenter;
  memo_8.Font.Name:='Times New Roman';
  memo_8.Top:=5.3*fr1cm;


end;
end;
procedure TChooseForm.acDesighnExecute(Sender: TObject);
begin
if is_des=0 then begin is_des:=1; cxButton1.Colors.Normal:=$00B0FFFF; end
else
if is_des=1 then begin is_des:=0;  cxButton1.Colors.Normal:=clDefault;  end;
end;

end.
