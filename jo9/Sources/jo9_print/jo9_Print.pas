unit jo9_Print;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxProgressBar, StdCtrls, cxButtons, ExtCtrls, FIBDatabase, pFIBDatabase,
  frxClass, RxMemDS, frxDBSet, DB, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, IBase, TagTypes, jpeg, StrUtils, frxExportPDF,
  frxExportXML, frxExportHTML, frxExportXLS, frxExportRTF, frxExportTXT,
  jo9_print_filter, cxCheckBox, dates, frxDesgn;

type
  TMO_Smets_Record = packed record
   _id_S  : integer;
   _id_MO : integer;
  end;

  TDocsInfoRecord = packed record
   _id_Doc   : int64;
   _Reg_Num  : string;
   _Date_Doc : TDate;
  end;

  TDogsInfoRecord = packed record
   _id_Dog    : variant;
   _Reg_Num   : string;
   _Date      : variant;
   _Move_Date : variant;
   _Date_Dog : variant;
  end;

  TTreeRecord = packed record
   _ID_CUSTOMER : int64;
   _NAME_CUST   : string;
   _IDD         : variant;
   _ID_DOC      : string;
   _DATE_DOC    : TDate;
   _DATE_REG    : TDate;
   _NUM_DOC     : string;
   _id_Type_Dog : int64;
   _Name_Type_D : string;
   _NOTE        : string;
   _DOG_NOTE    : string;
   _DOG_NUM     : string;
   _DOG_DATE    : TDate;
  end;

  TSRStTreeRecord = packed record
   _id_Fst    : integer;
   _kod_Fst   : integer;
   _Name_Fst  : string;

   _id_Snd    : integer;
   _kod_Snd   : integer;

   _id_Trd    : integer;
   _kod_Trd   : integer;

   _id_Fth    : integer;
   _kod_Fth   : integer;
  end;

  TInCurBuffRecord = packed record
   _IDD     : int64;
   _ID_CUST : int64;
   _ID_SCH  : int64;
   _IN_DB   : variant;
   _IN_KR   : variant;
   _CUR_DB  : variant;
   _CUR_KR  : variant;
   _OUT_DB  : variant;
   _OUT_KR  : variant;
  end;

  TProvBuffRecord = packed record
   IDD         : int64;
   ID_SCH      : int64;
   ID_SCH_COR  : variant;
   ID_S        : int64;
   ID_R        : int64;
   ID_ST       : int64;
   ID_KEKV     : int64;
   KOD_SCH     : string;
   KOD_SCH_COR : variant;
   KOD_S       : variant;
   KOD_R       : variant;
   KOD_ST      : variant;
   KOD_KEKV    : variant;
   IS_DB       : boolean;
   SUMMA       : currency;
   OST         : boolean;
   OUT_DB      : boolean;
  end;

  TSaldoOutRecord = packed record
   NUM_SCH_COR : string;
   OUT_DB      : boolean;
   KOD_S       : integer;
   KOD_R       : integer;
   KOD_ST      : integer;
   KOD_KEKV    : integer;
   SUMMA       : currency;
  end;

  TSaldoOutIdRecord = packed record
   ID_SCH  : integer;
   OUT_DB  : boolean;
   ID_S    : integer;
   ID_R    : integer;
   ID_ST   : integer;
   ID_KEKV : integer;
   SUMMA   : currency;
  end;

  TPrintSch_Record = packed record
   _Kind          : string;
   _id_Sch_Native : integer;
   _id_Sch_Cor    : integer;
   _Num_Sch_C     : string;
   _Name_Sch_C    : string;
   _Summa         : currency;

   _id_Type_Dog   : integer;   //  Используется при группировке по типу договоров

   _is_turnover   : integer;   // признак включать ли в сумму оборотов
   _is_db         : Integer;
   _out_db        : Integer;
  end;

  TPrintSchCur_Record = packed record
   _id_Sch_Native : integer;
   _id_Sch_Cor    : integer;
   _Num_Sch_C     : string;
   _Name_Sch_C    : string;
   _Summa         : currency;
   _id_Parent     : integer;
   _Num_Parent    : string;
   _Name_Parent   : string;
  end;

  TOstDocRecord = packed record
   _Name_Cust : string;
   _Reg_Num   : string;
   _Num_Doc   : string;
   _Date_Doc  : TDate;
   _Date_Reg  : TDate;
   _Date_Move : TDate;
   _Note      : string;

   _Num_Sch   : variant;
   _kod_S     : variant;
   _kod_R     : variant;
   _kod_St    : variant;
   _kod_Kekv  : variant;
   _Summa     : currency;
  end;

  TCurDocRecord = packed record
   _Name_Cust  : string;
   _Reg_Num    : variant;
   _Num_Doc    : string;
   _Date_Doc   : TDate;
   _Date_Reg   : TDate;
   _Note       : string;
   _FIO        : string;

   _Kr_Num_Sch : variant;
   _Db_Num_Sch : variant;
   _kod_S      : variant;
   _kod_R      : variant;
   _kod_St     : variant;
   _kod_Kekv   : variant;
   _Summa      : currency;
  end;

  TResultRecord = packed record
   _Rec_Count : integer;
   _In_Db     : variant;
   _In_Kr     : variant;
   _Cur_Db    : variant;
   _Cur_Kr    : variant;
   _Out_Db    : variant;
   _Out_Kr    : variant;
  end;

  TSummaryRecord = packed record
   _Num_Sch : string;
   _In_db   : currency;
   _In_kr   : currency;
   _Cur_db  : currency;
   _Cur_kr  : currency;
   _Out_db  : currency;
   _Out_kr  : currency;
  end;

  TOstPeriodsRecord = packed record
   _Year  : integer;
   _Month : variant;
  end;

  TCustSchRecord = packed record
   _Db        : boolean;
   _id_Sch    : integer;
   _Num_Sch   : string;
   _NameField : string;

   _Sum       : currency;
  end;

  TSRStKekvTreeRecord = packed record
   _id_Fst   : integer;
   _kod_Fst  : integer;
   _Name_Fst : string;

   _id_Snd   : integer;
   _kod_Snd  : integer;

   _id_Trd   : integer;
   _kod_Trd  : integer;

   _id_Fth   : integer;
   _kod_Fth  : integer;
  end;

  TPrintCaption = packed record
   _report_header  : string;
   _type_form      : string;
   _nakaz_form     : string;
  end;

  TDocsInfo = array of TDocsInfoRecord;
  TDogsInfo = array of TDogsInfoRecord;
  TTreeArray = array of TTreeRecord;
  TInCurBuffer = array of TInCurBuffRecord;
  TProvBuffArray = array of TProvBuffRecord;
  TSaldoOutArray = array of TSaldoOutRecord;
  TSaldoOutIdArray = array of TSaldoOutIdRecord;
  TPrintSchArray = array of TPrintSch_Record;
  TPrintSchCurArray = array of TPrintSchCur_Record;
  TOstDocsArray = array of TOstDocRecord;
  TCurDocsArray = array of TCurDocRecord;
  TSummaryArray = array of TSummaryRecord;
  TOstPeriodsArray = array of TOstPeriodsRecord;
  POstPeriodsArray = ^TOstPeriodsArray;
  TCustSchArray = array of TCustSchRecord;
  TSRStKekvTreeArray = array of TSRStKekvTreeRecord;
  TSRStTreeArray = array of TSRStTreeRecord;
  TMO_Smets_Array = array of TMO_Smets_Record;

  PPrintSchArray = ^TPrintSchArray;
  PPrintSchCurArray = ^TPrintSchCurArray;
  PCustSchArray = ^TCustSchArray;

  Tjo9_PrintForm = class(TForm)
    Image1: TImage;
    CancelButton: TcxButton;
    ProgressBar: TcxProgressBar;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    StoredProc1: TpFIBStoredProc;
    DataSet: TpFIBDataSet;
    DBDataset: TfrxDBDataset;
    JOMemoryData: TRxMemoryData;
    SchMemoryData: TRxMemoryData;
    OstMemoryData: TRxMemoryData;
    CurMemoryData: TRxMemoryData;
    JOTotalsMData: TRxMemoryData;
    JODataset: TfrxDBDataset;
    SchOrderMData: TRxMemoryData;
    GrMemoryData: TRxMemoryData;
    RTFExport: TfrxRTFExport;
    XLSExport: TfrxXLSExport;
    HTMLExport: TfrxHTMLExport;
    XMLExport: TfrxXMLExport;
    PDFExport: TfrxPDFExport;
    SecMemoryData: TRxMemoryData;
    SecDataset: TfrxDBDataset;
    TXTExport: TfrxTXTExport;
    OstCustData: TRxMemoryData;
    ColDataSet: TfrxUserDataSet;
    AutoStoredProc: TpFIBStoredProc;
    TransferTransaction: TpFIBTransaction;
    JOMemoryDataCust: TRxMemoryData;
    MOSchMemoryData: TRxMemoryData;
    Query: TpFIBDataSet;
    frxDesigner1: TfrxDesigner;
    DS_1: TpFIBDataSet;
    StorProc: TpFIBStoredProc;
    ReadTr: TpFIBTransaction;
    DS_IN: TpFIBDataSet;
    DS_OUT: TpFIBDataSet;
    StPr: TpFIBStoredProc;
    Tr: TpFIBTransaction;
    DS_AKT: TRxMemoryData;
    db_akt_sverki: TfrxDBDataset;
    ds_akt_1: TRxMemoryData;
    ds_2: TpFIBDataSet;
    ds_akt_3: TRxMemoryData;
    svodnVed: TfrxDBDataset;
    st_pr_proverka: TpFIBStoredProc;
    Tr_proverka: TpFIBTransaction;
    ds_proverka: TpFIBDataSet;
    ds_proverkaIN_DB: TFIBBCDField;
    ds_proverkaIN_KR: TFIBBCDField;
    Report: TfrxReport;
    ds_empty_report: TpFIBDataSet;
    ds_3: TpFIBDataSet;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ReportBeforePrint(Sender: TfrxReportComponent);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ReportAfterPrint(Sender: TfrxReportComponent);
  private
    { Private declarations }
  public
    PrintFilter : TFilterRecord;

    LastPixel   : integer;

    KEY_SESSION : int64;
    KEY_SESSION_SALDO : int64;

    DogsInfo  : TDogsInfo;
    DocsInfo  : TDocsInfo;

    MO_Smets  : TMO_Smets_Array; // массив смет, которые присутствуют в журнале

    TreeArray     : TTreeArray;
    SRStArray     : TSRStTreeArray;
    ProvBuffArray : TProvBuffArray;
    InOstArray    : TProvBuffArray;
    SaldoOut      : TSaldoOutArray;
    SaldoOutId    : TSaldoOutIdArray;

    CustSch       : TCustSchArray;

    LastCustName : variant;

    Step      : currency;
    PBarPos   : currency;

    NSch      : TSchArray;

    PrintKind : TJO9_Report_Kind;

    OstPeriods : TOstPeriodsArray;

    f_Date_Reg : TFormatSettings;

    DocTotalSumma : currency;

    WrongCust : TTreeArray;   // при формировании журнала за прошлый период сюда заношу
                              // перечень контрагентов, по которым не совпадает
                              // сальдо исходящщее с расчитанным ранее (JO9_DT_OST_DOC)

    id_report : integer;
    sch_empty :string; // номер счета привязанного к пустому мем.ордеру

    procedure InitConnection(DBhandle: TISC_DB_HANDLE; RTransaction: TISC_TR_HANDLE);

    procedure PrepareData(DoCalc : boolean); // Параметр означает необходимость вызова JO9_IN_CUR_BUFF_CALC

    procedure FillArrays(SelNote : boolean = False); //   Печать
    procedure FillMemoryData;      //        журнала-ордера
    procedure SetSummary;          //                    № 9
    procedure FillSchTotals;       //  Заполнение итоговых данных в разрезе счетов для ЖО 9

    procedure FillCustSch;  // Выбираю все корреспондирующие счета в дебетовых и кредитовых оборотах
    procedure FillMemoryDataCust;
    procedure OrderCustSch(InSch : PCustSchArray); // Сортирую счета
    procedure SetCustSchSummary;
    procedure MakeCustSchReport; //Ведомость расчетов с контрагентами (для ДнДз)

    procedure FillSecondProvs;    // Заполняю агрегированные данные по вторым проводкам

    procedure FillPBArray(Ost: boolean; idd, id_Doc : string; Group_By_Sch : boolean = False); // Заполняю входящие остатки или обороты
    procedure FillSaldoOut(idd : string; id_Cust : integer; Name_Cust : string; Group_By_Sch : boolean = False); // Заполняю исходящие остатки

    procedure Print_Sch_Report;    // Aналитическая ведомость движения средств по счетам
    procedure Print_Sch_MO_Report; // MO: аналитическая ведомость движения средств по счетам
    procedure OrderSch(InSch : PPrintSchArray); // Упорядочиваю счета

    procedure Print_Sch_Cur_Report(is_Db : boolean); // Печать расшифровки счетов
    procedure OrderSch_Cur(InSch : PPrintSchCurArray); // Упорядочиваю счета

    function  CloseSch : boolean; // Закрытие счетов системы при переходе в след. период
    function  SaveSaldoOut : boolean; // Сохранение остатков при переходе системы в след. период
    procedure FillSaldoOutId(idd : string);
    function  OpenSch  : boolean; // Открытие счета при откате системы в предыдущий период

    procedure DoCurDocsReport(Kredit : boolean); // Печать реестра текущих документов
    procedure DoCurDocsExReport(Kredit : boolean); // Печать реестра текущих документов
    procedure DoOstDocsReport(Kredit : boolean); // Печать реестра документов в остатках

    procedure Print_Sch_Grp; // Расшифровка счетов по статьям затрат (группировка Sm\Rz\St\Kekv)

    procedure Print_Ost_Report; // Печать отчета по задолженности контрагентов в разрезе лет
    function  Ost_Report_Get_Value(Header : boolean) : variant; // Функция возвращает значение ячеек данных отчета задолж-ти

    function  DoTransfer : boolean; // Переброска документов системы на другой договор (автоматическая генерация документа)

    procedure DoProgress(PPosition : currency);

    procedure SaveFilter;
    procedure ShowReport;
    procedure CloseReport(Sender: TObject; var Action: TCloseAction);
    procedure Print_Sch_Report_2011;    // Aналитическая ведомость движения средств по счетам
  end;


function  DoPrintReportEx(AOwner : TComponent; Filter : TFilterRecord; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; INFO : Pjo9_SYS_INFO) : variant; stdcall;
function  DoPrintReport(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
          FS : TFormStyle; INFO : Pjo9_SYS_INFO; PrintKind : TJO9_Report_Kind): variant; stdcall;
function  DoSaveSaldoOut(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
          WTrans : TISC_TR_HANDLE; INFO : Pjo9_SYS_INFO; USE_MAIN_BOOK : boolean) : boolean; stdcall;
function  DoRollbackSystem(DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
          WTrans : TISC_TR_HANDLE; INFO : Pjo9_SYS_INFO; USE_MAIN_BOOK : boolean) : boolean; stdcall;


exports  DoPrintReportEx;
exports  DoPrintReport;
exports  DoSaveSaldoOut; // Переход системы в следующий период
exports  DoRollbackSystem; // Откат системы в педыдущий период


var
 // jo9_PrintForm : Tjo9_PrintForm;
  SYS_INFO      : Pjo9_SYS_INFO;
  OnCloseEvent  :TCloseEvent;

implementation

uses Wait, Math, DateUtils, cxGridTableView, jo9_Preview_jo, Kernel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxClasses, cxTextEdit;

{$R *.dfm}

function DoPrintReport(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         FS : TFormStyle; INFO : Pjo9_SYS_INFO; PrintKind : TJO9_Report_Kind): variant; stdcall;
begin
 SYS_INFO := INFO;

 CreateFilter(AOwner, DBHandle, RTrans, SYS_INFO, PrintKind, fsMDIChild);
end;

function DoPrintReportEx(AOwner : TComponent; Filter : TFilterRecord; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; INFO : Pjo9_SYS_INFO): variant; stdcall;
var
 P          : Tjo9_PrintForm;
 jo_Preview : Tjo9_Preview_joForm;

 Rep_File   : string;
 //d_s :double;

 date_beg, date_end, date_cur :TDateTime;
 i:Integer;
 saldo_db, saldo_kr, saldo_db_proverka, saldo_kr_proverka, s, k_s, d_s :Double;
 num_dog, in_db_str, in_db_str_1, in_kr_str, in_kr_str_1, d_s_str, d_s_str_1, k_s_str, k_s_str_1:string;
 mes, date_reg, org_name_2, prefix:string;
 date_array:array  of array of Variant;
 sod, rekv, st, ds,ks:Variant;
 j,k:Integer;
 date_1, date_2:TDateTime;
 name_org_2, num_dog_1:string;
 s_kod:AnsiString;
 ss,in_db,in_kr,db,kr,out_db,out_kr:Double;
 first:integer;
 sum_d, sum_k:Double;
 date_sys:TDateTime;
begin
 SYS_INFO := INFO;

 P := Tjo9_PrintForm.Create(AOwner);
 P.ProgressBar.Position := 0;
 P.LastPixel := 0;

 P.PrintFilter := Filter;

 P.Show;
 P.Update;

 P.InitConnection(DBHandle, RTrans);

 P.KEY_SESSION := P.Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);
 P.KEY_SESSION_SALDO := P.Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);

 Rep_File := SYS_INFO^._App_Path;

 P.id_report:=0;

 P.Report.Clear;
              //
 if (Filter._PrintKind = JO9_REPORT_MAIN) or (Filter._PrintKind = JO9_REPORT_MAIN_MO)
    or (Filter._PrintKind = JO9_REPORT_MAIN_MO_2011) or (Filter._PrintKind = JO9_AKT_SVERKI) or (Filter._PrintKind = JO9_REPORT_MAIN_MO_BASE_2011) then begin
  if P.PrintFilter._PaperFormat = pfA3 then begin
   if Filter._PrintKind = JO9_REPORT_MAIN then Rep_File := Rep_File + 'Reports\JO9\JO9.fr3'
   else
   begin
     if Filter._PrintKind=JO9_REPORT_MAIN_MO_2011 then
     begin
       Rep_File := Rep_File + 'Reports\JO9\JO9_MO_2011.fr3';
       P.id_report:=14;
     end
     else
     if Filter._PrintKind=JO9_REPORT_MAIN_MO_BASE_2011 then
     begin
       Rep_File := Rep_File + 'Reports\JO9\JO9_BASE_MO_A3.fr3';
       P.id_report:=14;
     end
     else
       Rep_File := Rep_File + 'Reports\JO9\JO9_MO.fr3';
   end
  end
  else begin
   if Filter._PrintKind = JO9_REPORT_MAIN then Rep_File := Rep_File + 'Reports\JO9\JO9_A4.fr3'
   else
   begin
     if Filter._PrintKind=JO9_REPORT_MAIN_MO_2011 then
     begin
       Rep_File := Rep_File + 'Reports\JO9\JO9_MO_2011_A4.fr3';
       P.id_report:=14;
     end
     else
     if Filter._PrintKind=JO9_REPORT_MAIN_MO_BASE_2011 then
     begin
       Rep_File := Rep_File + 'Reports\JO9\JO9_BASE_MO.fr3';
       P.id_report:=14;
     end
     else
     if Filter._PrintKind=JO9_AKT_SVERKI then
      begin
       if Filter._PrintSvodTable then
       Rep_File := Rep_File + 'Reports\JO9\jo9_rep_akt_vzaimorsh_d_s.fr3'
       else
       Rep_File := Rep_File + 'Reports\JO9\jo9_rep_akt_vzaimorsh_d.fr3';
       P.id_report:=15;
      end
     else
       Rep_File := Rep_File + 'Reports\JO9\JO9_MO_A4.fr3';
   end;


  end;

  //
    p.ds_empty_report.Close;
    p.ds_empty_report.SelectSQL.Text:='SELECT * FROM MBOOK_MO_GET_REG_UCH_EX(:DATE_BEG, :DATE_END, :KOD_SYS)';
    p.ds_empty_report.Prepare;
    p.ds_empty_report.ParamByName('DATE_BEG').AsDate:=P.PrintFilter._Date_Beg;
    p.ds_empty_report.ParamByName('DATE_END').AsDate:=P.PrintFilter._Date_End;
    p.ds_empty_report.ParamByName('KOD_SYS').Value  := SYS_INFO^._id_Reg_Uch;
    p.ds_empty_report.CloseOpen(False);
    p.ds_empty_report.FetchAll;
    if p.ds_empty_report.RecordCount = 0 then
    begin
    if P.PrintFilter._PaperFormat = pfA3 then Rep_File := SYS_INFO^._App_Path + 'Reports\JO9\JO9_MO_EMPTY_2011.fr3'
    else Rep_File := SYS_INFO^._App_Path + 'Reports\JO9\JO9_MO_EMPTY_A4_2011.fr3';

    p.ds_empty_report.Close;
    p.ds_empty_report.SelectSQL.Text:='select first(1) sch_number from pub_sp_main_sch where id_reg_uch=:kod_sys and :date_beg between date_beg and date_end';
    p.ds_empty_report.Prepare;
    p.ds_empty_report.ParamByName('KOD_SYS').Value  := SYS_INFO^._id_Reg_Uch;
    p.ds_empty_report.ParamByName('DATE_BEG').AsDate:=P.PrintFilter._Date_Beg;
    p.ds_empty_report.CloseOpen(False);

    p.sch_empty:=p.ds_empty_report.FieldValues['sch_number'];
    end;
  //

  if not P.Report.LoadFromFile(Rep_File) then begin
   ShowMessage('Файл звіту [' + Rep_File + '] не знайдено!');
   Exit;
  end;

  P.Report.Variables.Variables['HeaderOnNewPage'] := P.PrintFilter._PrintOnNewPage;

  P.StoredProc.Transaction.StartTransaction;

  P.SaveFilter;

  P.PrepareData(True);
  p.StoredProc.Transaction.CommitRetaining;

  P.FillArrays;
  P.FillMemoryData;
  P.SetSummary;
//  P.FillSchTotals;

  if SYS_INFO^._Use_Sec_Provs then P.FillSecondProvs;
   Filter._CommitTrans:=true;
  if Filter._CommitTrans then begin
   P.StoredProc.Transaction.Commit;

   //ShowMessage('KEY_SESSION = ' + IntToStr(P.KEY_SESSION));
  end
  else P.StoredProc.Transaction.Rollback;

  P.JOMemoryData.First;

  // попробуем подсветить строку
  { while not P.JOMemoryData.Eof do
   begin
     if (P.JOMemoryData.FieldByName('State').Value = null) and
        (P.JOMemoryData.FieldByName('IN_S').Value <> null) and
        (P.JOMemoryData.FieldByName('IN_R').Value <> null) and
        (P.JOMemoryData.FieldByName('IN_ST').Value <> null) and
        (P.JOMemoryData.FieldByName('IN_KEKV').Value <> null) and
        (P.JOMemoryData.FieldByName('DB_SUM').Value = null) and
        (P.JOMemoryData.FieldByName('KR_SUM').Value = null) then
        begin
          P.JOMemoryData.Edit;
          P.JOMemoryData.FieldByName('State').AsString:= 'NoMoove';
          P.JOMemoryData.Post;
        end;
    P.JOMemoryData.Next;
   end;}
   {
  while not P.JOMemoryData.Eof do
   begin
   try
    P.StPr.Close;
    P.StPr.Transaction := P.Tr;
    P.StPr.Transaction.StartTransaction;
    P.StPr.StoredProcName:='JO9_BORROW_STRUCTURE_INS';
    P.StPr.Prepare;
    P.StPr.ParamByName('State').Value:=P.JOMemoryData.FieldByName('State').Value;
    P.StPr.ParamByName('CustNum').Value:=P.JOMemoryData.FieldByName('CustNum').Value;
    P.StPr.ParamByName('RegNum').Value:=P.JOMemoryData.FieldByName('RegNum').Value;
    P.StPr.ParamByName('Date_ost').Value:=P.JOMemoryData.FieldByName('Date_ost').Value;
    P.StPr.ParamByName('Date_move').Value:=P.JOMemoryData.FieldByName('Date_move').Value;
   //if P.JOMemoryData.FieldByName('In_db').Value=null then
  //  P.StPr.ParamByName('In_db').Value:=P.JOMemoryData.FieldByName('In_db').Value
 //   else  P.StPr.ParamByName('In_db').AsFloat:=P.JOMemoryData.FieldByName('In_db').AsFloat;
  //if P.JOMemoryData.FieldByName('In_kr').Value=null then
  //  P.StPr.ParamByName('In_kr').Value:=P.JOMemoryData.FieldByName('In_kr').Value
  //  else  P.StPr.ParamByName('In_kr').AsFloat:=P.JOMemoryData.FieldByName('In_kr').AsFloat;
    P.StPr.ParamByName('In_Sch').Value:=P.JOMemoryData.FieldByName('In_Sch').Value;
    P.StPr.ParamByName('In_S').Value:=P.JOMemoryData.FieldByName('In_S').Value;
    P.StPr.ParamByName('In_R').Value:=P.JOMemoryData.FieldByName('In_R').Value;
    P.StPr.ParamByName('In_St').Value:=P.JOMemoryData.FieldByName('In_St').Value;
    P.StPr.ParamByName('In_Kekv').Value:=P.JOMemoryData.FieldByName('In_Kekv').Value;
    P.StPr.ParamByName('Db_doc').Value:=P.JOMemoryData.FieldByName('Db_doc').Value;
    P.StPr.ParamByName('Db_date').Value:=P.JOMemoryData.FieldByName('Db_date').Value;
    P.StPr.ParamByName('Db_date_reg').Value:=P.JOMemoryData.FieldByName('Db_date_reg').Value;
    P.StPr.ParamByName('Db_sch_db').Value:=P.JOMemoryData.FieldByName('Db_sch_db').Value;
    P.StPr.ParamByName('Db_sch_kr').Value:=P.JOMemoryData.FieldByName('Db_sch_kr').Value;

    if P.JOMemoryData.FieldByName('db_sum').Value=null then
    P.StPr.ParamByName('db_sum').Value:=null
    else
    begin
       P.StPr.ParamByName('db_sum').Value:=P.JOMemoryData.FieldByName('db_sum').Value

    end;

  //  else  P.StPr.ParamByName('db_sum').AsFloat:=P.JOMemoryData.FieldByName('db_sum').AsFloat;
    P.StPr.ParamByName('Db_s').Value:=P.JOMemoryData.FieldByName('Db_s').Value;
    P.StPr.ParamByName('Db_r').Value:=P.JOMemoryData.FieldByName('Db_r').Value;
    P.StPr.ParamByName('Db_st').Value:=P.JOMemoryData.FieldByName('Db_st').Value;
    P.StPr.ParamByName('Db_Kekv').Value:=P.JOMemoryData.FieldByName('Db_Kekv').Value;
    P.StPr.ParamByName('Kr_doc').Value:=P.JOMemoryData.FieldByName('Kr_doc').Value;
    P.StPr.ParamByName('kr_date').Value:=P.JOMemoryData.FieldByName('kr_date').Value;
    P.StPr.ParamByName('Kr_date_reg').Value:=P.JOMemoryData.FieldByName('Kr_date_reg').Value;
    P.StPr.ParamByName('Kr_sch_db').Value:=P.JOMemoryData.FieldByName('Kr_sch_db').Value;
    P.StPr.ParamByName('Kr_sch_kr').Value:=P.JOMemoryData.FieldByName('Kr_sch_kr').Value;
  //  if P.JOMemoryData.FieldByName('Kr_sum').Value=null then
 //   P.StPr.ParamByName('Kr_sum').Value:=P.JOMemoryData.FieldByName('Kr_sum').Value
  //  else  P.StPr.ParamByName('Kr_sum').AsFloat:=P.JOMemoryData.FieldByName('Kr_sum').AsFloat;
    P.StPr.ParamByName('Kr_s').Value:=P.JOMemoryData.FieldByName('Kr_s').Value;
    P.StPr.ParamByName('Kr_R').Value:=P.JOMemoryData.FieldByName('Kr_R').Value;
    P.StPr.ParamByName('Kr_St').Value:=P.JOMemoryData.FieldByName('Kr_St').Value;
    P.StPr.ParamByName('Kr_kekv').Value:=P.JOMemoryData.FieldByName('Kr_kekv').Value;
   // if P.JOMemoryData.FieldByName('Out_db').Value=null then
   // P.StPr.ParamByName('Out_db').Value:=P.JOMemoryData.FieldByName('Out_db').Value
   // else  P.StPr.ParamByName('Out_db').AsFloat:=P.JOMemoryData.FieldByName('Out_db').AsFloat;
    // if P.JOMemoryData.FieldByName('Out_kr').Value=null then
   // P.StPr.ParamByName('Out_kr').Value:=null
   // else  P.StPr.ParamByName('Out_kr').Asstring:=FloatToStr(P.JOMemoryData.FieldByName('Out_kr').Value);

    P.StPr.ParamByName('Out_sch').Value:=P.JOMemoryData.FieldByName('Out_sch').Value;
    P.StPr.ParamByName('Out_s').Value:=P.JOMemoryData.FieldByName('Out_s').Value;
    P.StPr.ParamByName('Out_r').Value:=P.JOMemoryData.FieldByName('Out_r').Value;
    P.StPr.ParamByName('Out_st').Value:=P.JOMemoryData.FieldByName('Out_st').Value;
    P.StPr.ParamByName('Out_kekv').Value:=P.JOMemoryData.FieldByName('Out_kekv').Value;
    P.StPr.ParamByName('CustNameFilter').Value:=P.JOMemoryData.FieldByName('CustNameFilter').Value;
    P.StPr.ExecProc;
    P.StPr.Transaction.Commit;
   except on E : Exception
    do begin
    ShowMessage(E.Message);
    P.StPr.Transaction.Rollback;
    exit;
    end;
   end;
   P.JOMemoryData.Next;
 end;}

   //

  P.DBDataset.DataSet := P.JOMemoryData;
  P.JODataset.DataSet := P.JOTotalsMData;

  P.StoredProc.Transaction.StartTransaction;

  if ((Filter._PrintKind=JO9_REPORT_MAIN_MO_2011) or (Filter._PrintKind=JO9_REPORT_MAIN_MO_BASE_2011)) then
  begin
    P.Print_Sch_Report_2011;
    P.SchMemoryData.First;
    P.SecDataset.DataSet := P.SchMemoryData;
  end;
 if Filter._PrintKind<>JO9_AKT_SVERKI then
  begin
  jo_Preview                      := Tjo9_Preview_joForm.Create(P);
  jo_Preview.Caption              := 'Журнал-ордер';
  jo_Preview.DataSource.DataSet   := P.DBDataset.DataSet;

  jo_Preview.GridLevel.Visible        := True;
  jo_Preview.GridLevelOst.Visible     := False;
  jo_Preview.GridLevelCustSch.Visible := False;

  jo_Preview.FormStyle := fsMDIChild;
 end
  else
  begin
   date_beg:=P.PrintFilter._Date_beg;
   date_end:=P.PrintFilter._Date_end;
   date_cur:=EndOfTheMonth(P.PrintFilter._date_beg);
   date_reg:='';
   date_sys:=StartOfAMonth(SYS_YEAR, SYS_MONTH);
   if MonthOf(P.PrintFilter._Date_beg)<10 then
   date_reg:='0'+ vartostr(MonthOf(P.PrintFilter._Date_beg))
   else date_reg:= vartostr(MonthOf(P.PrintFilter._Date_beg));
   date_reg:=date_reg+'/'+vartostr(YearOf(P.PrintFilter._Date_beg));
   i:=0;
   saldo_db:=0;
   saldo_kr:=0;
   saldo_db_proverka:=0;
   saldo_kr_proverka:=0;
   d_s:=0;
   k_s:=0;
   in_db_str:='';
   in_kr_str:='';
   //
   try
       p.st_pr_proverka.Close;
       p.st_pr_proverka.Transaction := p.Tr_proverka;
       p.st_pr_proverka.Transaction.StartTransaction;
       p.st_pr_proverka.StoredProcName:='JO9_PRINT_FILTER_ADD_DOUBLE';
       p.st_pr_proverka.Prepare;
       p.st_pr_proverka.ParamByName('KEY_SES_1').AsInteger:=p.KEY_SESSION;
       p.st_pr_proverka.ParamByName('KEY_SES_2').AsInteger:=p.KEY_SESSION_SALDO;
       p.st_pr_proverka.ExecProc;
       p.st_pr_proverka.Transaction.Commit;
       except on E : Exception
       do begin
        ShowMessage(E.Message);
        p.st_pr_proverka.Transaction.Rollback;
        exit;
       end;
        end;
   //
   p.Ds_Akt.Close;
   p.Ds_AKT.Open;
   while date_beg<=date_end do
   begin
   //  showmessage(datetostr(date_beg)+' '+datetostr(date_end));
     //saldo
     p.Ds_Akt.Append;
     p.Ds_Akt.FieldByName('Soderjanie').AsString:= 'Сальдо на '+Datetostr(date_beg);
     p.Ds_Akt.FieldByName('Rekviz').AsString:= '';
     p.Ds_Akt.FieldByName('State').AsString:= 'Bold';
     if date_beg=P.PrintFilter._Date_beg then
     begin
     P.JOMemoryData.First;
     while not P.JOMemoryData.Eof do
     begin
       if P.JOMemoryData.FieldByName('State').Value<>'Summs' then
       if P.JOMemoryData.FieldByName('RegNum').Value=null then
       begin
         if P.JOMemoryData.FieldByName('In_Db').Value<>null then
         begin
         in_db_str:=VarToStr(P.JOMemoryData.FieldByName('In_Db').Value);
         in_db_str_1:='';
         for i:=1 to Length(in_db_str) do
         if (copy(in_db_str,i,1)='0') or (copy(in_db_str,i,1)='1') or
            (copy(in_db_str,i,1)='2') or (copy(in_db_str,i,1)='3') or
            (copy(in_db_str,i,1)='4') or (copy(in_db_str,i,1)='5') or
            (copy(in_db_str,i,1)='6') or (copy(in_db_str,i,1)='7') or
            (copy(in_db_str,i,1)='8') or (copy(in_db_str,i,1)='9') or
            (copy(in_db_str,i,1)=',') or (copy(in_db_str,i,1)='-')
            then in_db_str_1:=in_db_str_1+ copy(in_db_str,i,1);

        saldo_db:=saldo_db+StrToFloat(in_db_str_1);
        end;

        if  P.JOMemoryData.FieldByName('In_Kr').Value<>null then
        begin
         in_kr_str:=VarToStr(P.JOMemoryData.FieldByName('In_Kr').Value);
         in_kr_str_1:='';
         for i:=1 to Length(in_kr_str) do
         if (copy(in_kr_str,i,1)='0') or (copy(in_kr_str,i,1)='1') or
            (copy(in_kr_str,i,1)='2') or (copy(in_kr_str,i,1)='3') or
            (copy(in_kr_str,i,1)='4') or (copy(in_kr_str,i,1)='5') or
            (copy(in_kr_str,i,1)='6') or (copy(in_kr_str,i,1)='7') or
            (copy(in_kr_str,i,1)='8') or (copy(in_kr_str,i,1)='9') or
            (copy(in_kr_str,i,1)=',') or (copy(in_kr_str,i,1)='-') then
            in_kr_str_1:=in_kr_str_1+ copy(in_kr_str,i,1);

       saldo_kr:=saldo_kr+StrToFloat(in_kr_str_1);
       end;
       end;
       P.JOMemoryData.Next;
     end;
     p.Ds_Akt.FieldByName('DB_SUMMA').Value:= saldo_db;
     p.Ds_Akt.FieldByName('KR_SUMMA').Value:= saldo_kr;
     p.Ds_Akt.Post;
     end
     else
     begin
     s:=saldo_db+d_s-saldo_kr-k_s;
       if s>=0 then
       begin
         saldo_db:=s;
         saldo_kr:=0;
       end
       else
       begin
         saldo_kr:=s*(-1);
         saldo_db:=0;
       end;
     // проверка расчитанного и системного сальдо
      //1
      if date_beg<=date_sys then
      begin
      try
       p.st_pr_proverka.Close;
       p.st_pr_proverka.Transaction := p.Tr_proverka;
       p.st_pr_proverka.Transaction.StartTransaction;
       p.st_pr_proverka.StoredProcName:='JO9_IN_CUR_BUFF_ADD_IN';
       p.st_pr_proverka.Prepare;
       p.st_pr_proverka.ParamByName('KEY_SESSION').AsInt64   := p.KEY_SESSION_SALDO;
       p.st_pr_proverka.ParamByName('KOD_SYS').Value         := SYS_INFO^._id_Reg_Uch;
       p.st_pr_proverka.ParamByName('DATE_BEG').Value        := date_beg;
       p.st_pr_proverka.ParamByName('DATE_END').Value        := EndOfTheMonth(date_beg);
       p.st_pr_proverka.ParamByName('DO_IN_CUR_BUFF').Value  := 0;
       p.st_pr_proverka.ParamByName('KEY_SESSION_OLD').Value := -1;
       p.st_pr_proverka.ExecProc;
       p.st_pr_proverka.Transaction.Commit;
       except on E : Exception
       do begin
        ShowMessage(E.Message);
        p.st_pr_proverka.Transaction.Rollback;
        exit;
       end;
        end;
      //2
      p.ds_proverka.close;
      p.ds_proverka.selectSql.clear;
      p.ds_proverka.selectSql.Add('select sum(in_db) as in_db, sum(in_kr) as in_kr from JO9_IN_CUR_BUFF where key_session='+Inttostr(p.key_session_saldo));
      p.ds_proverka.prepare;
      p.ds_proverka.closeopen(false);
      saldo_db_proverka:=p.ds_proverkaIN_DB.AsFloat;
      saldo_kr_proverka:=p.ds_proverkaIN_KR.AsFloat;
      saldo_db_proverka:=RoundTo(saldo_db_proverka,-2);
      saldo_kr_proverka:=RoundTo(saldo_kr_proverka,-2);
      saldo_db:=RoundTo(saldo_db,-2);
      saldo_kr:=RoundTo(saldo_kr,-2);
      sum_d:=saldo_db-saldo_kr;
      sum_k:=saldo_db_proverka-saldo_kr_proverka;
      sum_d:= RoundTo(sum_d,-2);
      sum_k:= RoundTo(sum_k,-2);
       if  sum_d<>sum_k then showmessage('Системне сальдо на '+DateToStr(date_beg)+' не збігається із розрахованим на '+floattostr(saldo_db-saldo_db_proverka)+ 'грн.');
      
      //if  (saldo_db-saldo_kr)<>(saldo_db_proverka-saldo_kr_proverka) then showmessage('Системне сальдо на '+DateToStr(date_beg)+' не збігається із розрахованим на '+floattostr(saldo_db-saldo_db_proverka)+ 'грн.');
//      showmessage(floattostr(saldo_db)+' '+floattostr(saldo_kr)+' '+vartostr(p.ds_proverka.FieldValues['in_db'])+' '+vartostr(p.ds_proverka.FieldValues['in_kr']));
      //if saldo_db<>saldo_db_proverka then showmessage('Системне дебетове сальдо на '+DateToStr(date_beg)+' не збігається із розрахованим на '+floattostr(saldo_db-saldo_db_proverka)+ 'грн.');
      //if saldo_kr<>saldo_kr_proverka then showmessage('Системне кредитове сальдо  на '+DateToStr(date_beg)+' не збігається із розрахованим на '+floattostr(saldo_kr-saldo_kr_proverka)+ 'грн.');;
      //3
      try
       p.st_pr_proverka.Close;
       p.st_pr_proverka.Transaction := p.Tr_proverka;
       p.st_pr_proverka.Transaction.StartTransaction;
       p.st_pr_proverka.StoredProcName:='JO9_IN_CUR_BUFF_CLEAR';
       p.st_pr_proverka.Prepare;
       p.st_pr_proverka.ParamByName('KEY_SESSION').AsInteger:=p.KEY_SESSION_SALDO;
       p.st_pr_proverka.ExecProc;
       p.st_pr_proverka.Transaction.Commit;
       except on E : Exception
       do begin
        ShowMessage(E.Message);
        p.st_pr_proverka.Transaction.Rollback;
        exit;
       end;
        end;
      end;  
     //
     p.Ds_Akt.FieldByName('Db_SUMMA').Value:= saldo_db;
     p.Ds_Akt.FieldByName('KR_SUMMA').Value:= saldo_kr;
     p.Ds_Akt.Post;
     end;
    //oboroti
     P.JOMemoryData.First;
     d_s:=0;
     k_s:=0;
     num_dog:='';
     while not P.JOMemoryData.Eof do
     begin
       if (P.JOMemoryData.FieldByName('State').Value<>'NameCust') and (P.JOMemoryData.FieldByName('State').Value<>'Summs') then
       begin
        if P.JOMemoryData.FieldByName('RegNum').Value<>null then
        begin
          num_dog:=P.JOMemoryData.FieldByName('RegNum').Value;
          num_dog_1:='';
          i:=1;

          while ((num_dog[i]<>'(') and (i<=Length(num_dog))) do
          begin
          num_dog_1:=num_dog_1+Copy(num_dog,i,1);
          inc(i);
          end;

           p.ds_2.close;
           p.ds_2.selectSql.Text:='select dog_note, n_dog, id_dog, kod_dog from DOG_DT_DOCUMENT where regest_num=:num';
           p.ds_2.prepare;
           p.ds_2.ParamByName('num').AsString:=num_dog_1;
           p.ds_2.CloseOpen(False);

           if p.ds_2.FieldValues['id_dog']=p.ds_2.FieldValues['kod_dog'] then
           num_dog_1:='дог. '+num_dog_1+'(№ '+p.ds_2.FieldValues['n_dog']+', '+p.ds_2.FieldValues['dog_note']+'), док.'
           else
           begin
            p.ds_3.close;
            p.ds_3.selectSql.Text:='select n_dog, d_dog from DOG_DT_DOCUMENT where id_dog=:id_dog';
            p.ds_3.prepare;
            p.ds_3.ParamByName('id_dog').AsInt64:=p.ds_2.FieldValues['kod_dog'];
            p.ds_3.CloseOpen(False);

            num_dog_1:= 'дог. № '+p.ds_3.FieldValues['n_dog']+ ' від '+VarToStr(p.ds_3.FieldValues['d_dog'])+' (рег. '+num_dog_1+', № '+p.ds_2.FieldValues['n_dog']+', '+p.ds_2.FieldValues['dog_note']+'), док.'
           end;

          if (P.JOMemoryData.FieldByName('Db_Date_Reg').Value<>null) and (P.JOMemoryData.FieldByName('Db_Date_Reg').AsString=date_reg) then
          begin
            P.Ds_Akt.Append;

            p.Ds_Akt.FieldByName('Soderjanie').AsString:= P.JOMemoryData.FieldByName('Db_date').AsString;
            p.Ds_Akt.FieldByName('Rekviz').AsString:=num_dog_1+P.JOMemoryData.FieldByName('Db_doc').AsString;

            p.Ds_Akt.FieldByName('State').AsString:= 'NotBold';

            d_s_str:=VarToStr(P.JOMemoryData.FieldByName('Db_Sum').Value);
            d_s_str_1:='';
            for i:=1 to Length(d_s_str) do
            if (copy(d_s_str,i,1)='0') or (copy(d_s_str,i,1)='1') or
               (copy(d_s_str,i,1)='2') or (copy(d_s_str,i,1)='3') or
               (copy(d_s_str,i,1)='4') or (copy(d_s_str,i,1)='5') or
               (copy(d_s_str,i,1)='6') or (copy(d_s_str,i,1)='7') or
               (copy(d_s_str,i,1)='8') or (copy(d_s_str,i,1)='9') or
               (copy(d_s_str,i,1)=',') or (copy(d_s_str,i,1)='-') then
               d_s_str_1:=d_s_str_1+ copy(d_s_str,i,1);

             p.Ds_Akt.FieldByName('Db_SUMMA').Value:= StrToFloat(d_s_str_1);
             P.Ds_Akt.Post;
             d_s:=d_s+ StrToFloat(d_s_str_1);
          end;
          if (P.JOMemoryData.FieldByName('Kr_Date_Reg').Value<>null) and (P.JOMemoryData.FieldByName('Kr_Date_Reg').AsString=date_reg) then
          begin
            P.Ds_Akt.Append;

            p.Ds_Akt.FieldByName('Soderjanie').AsString:= P.JOMemoryData.FieldByName('Kr_date').AsString;
            p.Ds_Akt.FieldByName('Rekviz').AsString:=num_dog_1+P.JOMemoryData.FieldByName('Kr_doc').AsString;

            p.Ds_Akt.FieldByName('State').AsString:= 'NotBold';

            k_s_str:=VarToStr(P.JOMemoryData.FieldByName('Kr_Sum').Value);
            k_s_str_1:='';
            for i:=1 to Length(k_s_str) do
            if (copy(k_s_str,i,1)='0') or (copy(k_s_str,i,1)='1') or
               (copy(k_s_str,i,1)='2') or (copy(k_s_str,i,1)='3') or
               (copy(k_s_str,i,1)='4') or (copy(k_s_str,i,1)='5') or
               (copy(k_s_str,i,1)='6') or (copy(k_s_str,i,1)='7') or
               (copy(k_s_str,i,1)='8') or (copy(k_s_str,i,1)='9') or
               (copy(k_s_str,i,1)=',') or (copy(k_s_str,i,1)='-') then
               k_s_str_1:=k_s_str_1+ copy(k_s_str,i,1);

             p.Ds_Akt.FieldByName('Kr_SUMMA').Value:= StrToFloat(k_s_str_1);
             P.Ds_Akt.Post;
             k_s:=k_s + StrToFloat(k_s_str_1);
          end;
        end
        else if P.JOMemoryData.FieldByName('RegNum').Value=null then
        begin
          if (P.JOMemoryData.FieldByName('Db_Date_Reg').Value<>null) and (P.JOMemoryData.FieldByName('Db_Date_Reg').AsString=date_reg) then
          begin
            P.Ds_Akt.Append;

            p.Ds_Akt.FieldByName('Soderjanie').AsString:= P.JOMemoryData.FieldByName('Db_date').AsString;
            p.Ds_Akt.FieldByName('Rekviz').AsString:=num_dog_1+P.JOMemoryData.FieldByName('Db_doc').AsString;

            p.Ds_Akt.FieldByName('State').AsString:= 'NotBold';

            d_s_str:=VarToStr(P.JOMemoryData.FieldByName('Db_Sum').Value);
            d_s_str_1:='';
            for i:=1 to Length(d_s_str) do
            if (copy(d_s_str,i,1)='0') or (copy(d_s_str,i,1)='1') or
               (copy(d_s_str,i,1)='2') or (copy(d_s_str,i,1)='3') or
               (copy(d_s_str,i,1)='4') or (copy(d_s_str,i,1)='5') or
               (copy(d_s_str,i,1)='6') or (copy(d_s_str,i,1)='7') or
               (copy(d_s_str,i,1)='8') or (copy(d_s_str,i,1)='9') or
               (copy(d_s_str,i,1)=',') or (copy(d_s_str,i,1)='-') then
               d_s_str_1:=d_s_str_1+ copy(d_s_str,i,1);

             p.Ds_Akt.FieldByName('Db_SUMMA').Value:= StrToFloat(d_s_str_1);
             P.Ds_Akt.Post;
             d_s:=d_s+ StrToFloat(d_s_str_1);
          end;
          if (P.JOMemoryData.FieldByName('Kr_Date_Reg').Value<>null) and (P.JOMemoryData.FieldByName('Kr_Date_Reg').AsString=date_reg) then
          begin
            P.Ds_Akt.Append;

            p.Ds_Akt.FieldByName('Soderjanie').AsString:= P.JOMemoryData.FieldByName('Kr_date').AsString;
            p.Ds_Akt.FieldByName('Rekviz').AsString:=num_dog_1+P.JOMemoryData.FieldByName('Kr_doc').AsString;

            p.Ds_Akt.FieldByName('State').AsString:= 'NotBold';

            k_s_str:=VarToStr(P.JOMemoryData.FieldByName('Kr_Sum').Value);
            k_s_str_1:='';
            for i:=1 to Length(k_s_str) do
            if (copy(k_s_str,i,1)='0') or (copy(k_s_str,i,1)='1') or
               (copy(k_s_str,i,1)='2') or (copy(k_s_str,i,1)='3') or
               (copy(k_s_str,i,1)='4') or (copy(k_s_str,i,1)='5') or
               (copy(k_s_str,i,1)='6') or (copy(k_s_str,i,1)='7') or
               (copy(k_s_str,i,1)='8') or (copy(k_s_str,i,1)='9') or
               (copy(k_s_str,i,1)=',') or (copy(k_s_str,i,1)='-') then
               k_s_str_1:=k_s_str_1+ copy(k_s_str,i,1);

             p.Ds_Akt.FieldByName('Kr_SUMMA').Value:= StrToFloat(k_s_str_1);
             P.Ds_Akt.Post;
             k_s:=k_s + StrToFloat(k_s_str_1);
          end;
        end;
       end;
       P.JOMemoryData.Next;
     end;
     // итого
     mes:='';
     if MonthOf(date_beg)=1 then mes:='січень';
     if MonthOf(date_beg)=2 then mes:='лютий';
     if MonthOf(date_beg)=3 then mes:='березень';
     if MonthOf(date_beg)=4 then mes:='квітень';
     if MonthOf(date_beg)=5 then mes:='травень';
     if MonthOf(date_beg)=6 then mes:='червень';
     if MonthOf(date_beg)=7 then mes:='липень';
     if MonthOf(date_beg)=8 then mes:='серпень';
     if MonthOf(date_beg)=9 then mes:='вересень';
     if MonthOf(date_beg)=10 then mes:='жовтень';
     if MonthOf(date_beg)=11 then mes:='листопад';
     if MonthOf(date_beg)=12 then mes:='грудень';
     P.Ds_Akt.Append;
     p.Ds_Akt.FieldByName('Soderjanie').AsString:= 'Разом за '+mes+' '+VarToStr(YearOf(date_beg));
     p.Ds_Akt.FieldByName('Rekviz').AsString:='';
     p.Ds_Akt.FieldByName('State').AsString:= 'Bold';
     p.Ds_Akt.FieldByName('Db_SUMMA').Value:= d_s;
     p.Ds_Akt.FieldByName('Kr_SUMMA').Value:= k_s;
     P.Ds_Akt.Post; 

     date_beg:= IncDay(date_cur);
     date_cur:=EndOfTheMonth(date_beg);
     if MonthOf(date_beg)<10 then
     date_reg:='0'+ vartostr(MonthOf(date_beg))
     else date_reg:= vartostr(MonthOf(date_beg));
     date_reg:=date_reg+'/'+vartostr(YearOf(date_beg));

    end;
   // сальдо на след.период
   p.Ds_Akt.Append;
   p.Ds_Akt.FieldByName('Soderjanie').AsString:= 'Сальдо на '+Datetostr(date_beg);
   p.Ds_Akt.FieldByName('State').AsString:= 'Bold';
   // ShowMessage(FloatToStr(saldo_db)+' '+FloatToStr(saldo_kr)+' ' +FloatToStr(d_s)+' '+FloatToStr(k_S));
   s:=saldo_db+d_s-saldo_kr-k_s;
   if s>=0 then
   begin
    saldo_db:=s;
    saldo_kr:=0;
   end
   else
   begin
    saldo_kr:=s*(-1);
    saldo_db:=0;
   end;
   // проверка расчитанного и системного сальдо
     //1
     if date_beg<=date_sys then
     begin
      try
       p.st_pr_proverka.Close;
       p.st_pr_proverka.Transaction := p.Tr_proverka;
       p.st_pr_proverka.Transaction.StartTransaction;
       p.st_pr_proverka.StoredProcName:='JO9_IN_CUR_BUFF_ADD_IN';
       p.st_pr_proverka.Prepare;
       p.st_pr_proverka.ParamByName('KEY_SESSION').AsInt64   := p.KEY_SESSION_SALDO;
       p.st_pr_proverka.ParamByName('KOD_SYS').Value         := SYS_INFO^._id_Reg_Uch;
       p.st_pr_proverka.ParamByName('DATE_BEG').Value        := date_beg;
       p.st_pr_proverka.ParamByName('DATE_END').Value        := EndOfTheMonth(date_beg);
       p.st_pr_proverka.ParamByName('DO_IN_CUR_BUFF').Value  := 0;
       p.st_pr_proverka.ParamByName('KEY_SESSION_OLD').Value := -1;
       p.st_pr_proverka.ExecProc;
       p.st_pr_proverka.Transaction.Commit;
       except on E : Exception
       do begin
        ShowMessage(E.Message);
        p.st_pr_proverka.Transaction.Rollback;
        exit;
       end;
        end;
      //2
      p.ds_proverka.close;
      p.ds_proverka.selectSql.clear;
      p.ds_proverka.selectSql.Add('select sum(in_db) as in_db, sum(in_kr) as in_kr from JO9_IN_CUR_BUFF where key_session='+Inttostr(p.key_session_saldo));
      p.ds_proverka.prepare;
      p.ds_proverka.closeopen(false);
      if date_beg<=EncodeDate(SYS_YEAR, SYS_MONTH, 1) then
      begin
      saldo_db_proverka:=p.ds_proverkaIN_DB.AsFloat;
      saldo_kr_proverka:=p.ds_proverkaIN_KR.AsFloat;
      saldo_db_proverka:=RoundTo(saldo_db_proverka,-2);
      saldo_kr_proverka:=RoundTo(saldo_kr_proverka,-2);
      saldo_db:=RoundTo(saldo_db,-2);
      saldo_kr:=RoundTo(saldo_kr,-2);
      sum_d:=saldo_db-saldo_kr;
      sum_k:=saldo_db_proverka-saldo_kr_proverka;
      sum_d:= RoundTo(sum_d,-2);
      sum_k:= RoundTo(sum_k,-2);
       if  sum_d<>sum_k then showmessage('Системне сальдо на '+DateToStr(date_beg)+' не збігається із розрахованим на '+floattostr(saldo_db-saldo_db_proverka)+ 'грн.');
      //showmessage(floattostr(saldo_db)+' '+floattostr(saldo_kr)+' '+floattostr(saldo_db_proverka)+' '+floattostr(saldo_kr_proverka));
     // if saldo_db<>saldo_db_proverka then showmessage('Системне дебетове сальдо на '+DateToStr(date_beg)+' не збігається із розрахованим на '+floattostr(saldo_db-saldo_db_proverka)+ 'грн.');
     // if saldo_kr<>saldo_kr_proverka then showmessage('Системне кредитове сальдо на '+DateToStr(date_beg)+' не збігається із розрахованим на '+floattostr(saldo_kr-saldo_kr_proverka)+ 'грн.');;
      end;
       //3
      try
       p.st_pr_proverka.Close;
       p.st_pr_proverka.Transaction := p.Tr_proverka;
       p.st_pr_proverka.Transaction.StartTransaction;
       p.st_pr_proverka.StoredProcName:='JO9_IN_CUR_BUFF_CLEAR';
       p.st_pr_proverka.Prepare;
       p.st_pr_proverka.ParamByName('KEY_SESSION').AsInteger:=p.KEY_SESSION_SALDO;
       p.st_pr_proverka.ExecProc;
       p.st_pr_proverka.Transaction.Commit;
       except on E : Exception
       do begin
        ShowMessage(E.Message);
        p.st_pr_proverka.Transaction.Rollback;
        exit;
       end;
        end;
     //
     end;           
   p.Ds_Akt.FieldByName('Db_SUMMA').Value:= saldo_db;
   p.Ds_Akt.FieldByName('KR_SUMMA').Value:= saldo_kr;
   p.Ds_Akt.Post;
//

   P.db_akt_sverki.DataSet:=P.ds_akt_1;
  // P.Report.Prepare;
  org_name_2:='';
  prefix:='';
  for i:=0 to Length(P.PrintFilter._Customers)-1 do
  begin
  org_name_2:=org_name_2+prefix+P.PrintFilter._Customers[i]._Name;
  prefix:=', ';
  end;
  P.JOMemoryData.First;

  // сортировка по дате
   p.ds_akt_1.Close;
   p.ds_akt_1.Open;
   p.DS_AKT.First;
   while not p.DS_AKT.Eof do
   begin
     if Copy(p.ds_akt.FieldByName('Soderjanie').AsString,1,1)='С' then
     begin
       date_array:=nil;
       i:=0;
       p.ds_akt_1.Append;
       p.ds_akt_1.FieldByName('Soderjanie').AsString:= p.ds_akt.FieldByName('Soderjanie').AsString;
       p.ds_akt_1.FieldByName('Rekviz').AsString:= p.ds_akt.FieldByName('Rekviz').AsString;
       p.ds_akt_1.FieldByName('State').AsString:= p.ds_akt.FieldByName('State').AsString;
       p.ds_akt_1.FieldByName('Db_SUMMA').Value:= p.ds_akt.FieldByName('Db_SUMMA').Value;
       p.ds_akt_1.FieldByName('Kr_SUMMA').Value:= p.ds_akt.FieldByName('Kr_SUMMA').Value;
       p.ds_akt_1.Post;
     end
     else
     if Copy(p.ds_akt.FieldByName('Soderjanie').AsString,1,1)='Р' then
     begin
       for j:=0 to i-2 do
       for k:=j to i-1 do
       begin
        date_1:=StrToDate(date_array[j][0]);
        date_2:= StrToDate(date_array[k][0]);
        if date_1>date_2 then
          begin
        //    showmessage('1');
          sod:=  date_array[j][0];
          rekv:= date_array[j][1];
          st:=   date_array[j][2];
          ds:=   date_array[j][3];
          ks:=   date_array[j][4];

          date_array[j][0]:=date_array[k][0];
          date_array[j][1]:=date_array[k][1];
          date_array[j][2]:=date_array[k][2];
          date_array[j][3]:=date_array[k][3];
          date_array[j][4]:=date_array[k][4];

          date_array[k][0]:=sod;
          date_array[k][1]:=rekv;
          date_array[k][2]:=st;
          date_array[k][3]:=ds;
          date_array[k][4]:=ks;
          end;
       end;
       for k:=0 to i-1 do
       begin
       p.ds_akt_1.Append;
       p.ds_akt_1.FieldByName('Soderjanie').Value:= date_array[k][0];
       p.ds_akt_1.FieldByName('Rekviz').Value:= date_array[k][1];
       p.ds_akt_1.FieldByName('State').Value:= date_array[k][2];
       p.ds_akt_1.FieldByName('Db_SUMMA').Value:= date_array[k][3];
       p.ds_akt_1.FieldByName('Kr_SUMMA').Value:= date_array[k][4];
       p.ds_akt_1.Post;
       end;
       p.ds_akt_1.Append;
       p.ds_akt_1.FieldByName('Soderjanie').AsString:= p.ds_akt.FieldByName('Soderjanie').AsString;
       p.ds_akt_1.FieldByName('Rekviz').AsString:= p.ds_akt.FieldByName('Rekviz').AsString;
       p.ds_akt_1.FieldByName('State').AsString:= p.ds_akt.FieldByName('State').AsString;
       p.ds_akt_1.FieldByName('Db_SUMMA').Value:= p.ds_akt.FieldByName('Db_SUMMA').Value;
       p.ds_akt_1.FieldByName('Kr_SUMMA').Value:= p.ds_akt.FieldByName('Kr_SUMMA').Value;
       p.ds_akt_1.Post;
     end
     else
     begin
       SetLength(date_array,i+1,5);
       date_array[i][0]:= p.ds_akt.FieldByName('Soderjanie').AsString;
       date_array[i][1]:= p.ds_akt.FieldByName('Rekviz').AsString;
       date_array[i][2]:= p.ds_akt.FieldByName('State').AsString;
       date_array[i][3]:= p.ds_akt.FieldByName('Db_SUMMA').VAlue;
       date_array[i][4]:= p.ds_akt.FieldByName('Kr_SUMMA').Value;
       Inc(i);
     end;
     P.DS_AKT.Next;

   end;
  //
  //печать сводной таблицы

  in_db:=0;
  in_kr:=0;
  db:=0;
  kr:=0;
  out_db:=0;
  out_kr:=0;
  first:=0;
  if P.PrintFilter._PrintSvodTable then
  begin
    P.JOMemoryData.First;
    while not P.JOMemoryData.Eof do
    begin
      
      if (P.JOMemoryData.FieldByName('State').Value<>'NameCust') then
      begin
       if ((P.JOMemoryData.FieldByName('RegNum').Value<>null) or (P.JOMemoryData.FieldByName('State').Value='Summs') ) then
       begin
         if first<>0 then
         begin
          num_dog_1:='';
          i:=1;
          while ((num_dog[i]<>'(') and (i<=Length(num_dog))) do
          begin
          num_dog_1:=num_dog_1+Copy(num_dog,i,1);
          inc(i);
          end;

           p.ds_2.close;
           p.ds_2.selectSql.Text:='select dog_note, n_dog, d_dog, id_dog, kod_dog from DOG_DT_DOCUMENT where regest_num=:num';
           p.ds_2.prepare;
           p.ds_2.ParamByName('num').AsString:=num_dog_1;
           p.ds_2.CloseOpen(False);

           if p.ds_2.FieldValues['id_dog']=p.ds_2.FieldValues['kod_dog'] then
           num_dog_1:='дог. '+num_dog_1+' (№ '+p.ds_2.FieldValues['n_dog']+' від '+VarToStr(p.ds_2.FieldValues['d_dog'])+', '+p.ds_2.FieldValues['dog_note']+'), док.'
           else
           begin
            p.ds_3.close;
            p.ds_3.selectSql.Text:='select n_dog, d_dog from DOG_DT_DOCUMENT where id_dog=:id_dog';
            p.ds_3.prepare;
            p.ds_3.ParamByName('id_dog').AsInt64:=p.ds_2.FieldValues['kod_dog'];
            p.ds_3.CloseOpen(False);

            num_dog_1:='дог. № ' + p.ds_3.FieldValues['n_dog'] +' від '+VarToStr(p.ds_3.FieldValues['d_dog'])+' (рег. '+num_dog_1+', № '+p.ds_2.FieldValues['n_dog']+' від '+VarToStr(p.ds_2.FieldValues['d_dog'])+', '+p.ds_2.FieldValues['dog_note']+'), док.'
           end;

           ss:=in_db+db-in_kr-kr;
           if ss>0 then out_db:=ss else out_kr:=(-1)*ss;
         P.ds_akt_3.Append;
         p.Ds_Akt_3.FieldByName('Soderjanie').AsString:= num_dog_1;
         p.Ds_Akt_3.FieldByName('DB_SUMMA').Value:= db;
         p.Ds_Akt_3.FieldByName('KR_SUMMA').Value:= kr;
         p.Ds_Akt_3.FieldByName('IN_DB_SUMMA').Value:= in_db;
         p.Ds_Akt_3.FieldByName('IN_KR_SUMMA').Value:= in_kr;
         p.Ds_Akt_3.FieldByName('OUT_DB_SUMMA').Value:= out_db;
         p.Ds_Akt_3.FieldByName('OUT_KR_SUMMA').Value:= out_kr;
         P.ds_akt_3.Post;
         end;
         if P.JOMemoryData.FieldByName('RegNum').Value<>null then
         num_dog := P.JOMemoryData.FieldByName('RegNum').Value;

         in_db:=0;
         in_kr:=0;
         db:=0;
         kr:=0;
         out_db:=0;
         out_kr:=0;

         if ((P.JOMemoryData.FieldByName('In_Sch').Value<>null) or(P.JOMemoryData.FieldByName('DB_Sch_Db').Value<>null) or (P.JOMemoryData.FieldByName('Kr_Sch_Db').Value<>null)) then
         begin
          // in_db
         if ((P.JOMemoryData.FieldByName('In_Db').AsString<>'') and (P.JOMemoryData.FieldByName('In_Sch').Value<>null)) then
         begin

         in_db_str:=VarToStr(P.JOMemoryData.FieldByName('In_Db').Value);
         in_db_str_1:='';
         for i:=1 to Length(in_db_str) do
         if (copy(in_db_str,i,1)='0') or (copy(in_db_str,i,1)='1') or
            (copy(in_db_str,i,1)='2') or (copy(in_db_str,i,1)='3') or
            (copy(in_db_str,i,1)='4') or (copy(in_db_str,i,1)='5') or
            (copy(in_db_str,i,1)='6') or (copy(in_db_str,i,1)='7') or
            (copy(in_db_str,i,1)='8') or (copy(in_db_str,i,1)='9') or
            (copy(in_db_str,i,1)=',') or (copy(in_db_str,i,1)='-')
            then in_db_str_1:=in_db_str_1+ copy(in_db_str,i,1);


        in_db:=in_db+StrToFloat(in_db_str_1);
        end;
        //

        // in_kr
         if  ((P.JOMemoryData.FieldByName('In_Kr').AsString<>'') and (P.JOMemoryData.FieldByName('In_Sch').Value<>null)) then
         begin
         in_kr_str:=VarToStr(P.JOMemoryData.FieldByName('In_Kr').Value);
         in_kr_str_1:='';
         for i:=1 to Length(in_kr_str) do
         if (copy(in_kr_str,i,1)='0') or (copy(in_kr_str,i,1)='1') or
            (copy(in_kr_str,i,1)='2') or (copy(in_kr_str,i,1)='3') or
            (copy(in_kr_str,i,1)='4') or (copy(in_kr_str,i,1)='5') or
            (copy(in_kr_str,i,1)='6') or (copy(in_kr_str,i,1)='7') or
            (copy(in_kr_str,i,1)='8') or (copy(in_kr_str,i,1)='9') or
            (copy(in_kr_str,i,1)=',') or (copy(in_kr_str,i,1)='-')
            then in_kr_str_1:=in_kr_str_1+ copy(in_kr_str,i,1);

        in_kr:=in_kr+StrToFloat(in_kr_str_1);
        end;
        //

        // db
         if  ((P.JOMemoryData.FieldByName('Db_Sum').AsString<>'') and (P.JOMemoryData.FieldByName('DB_Sch_Db').Value<>null)) then
         begin
         d_s_str:=VarToStr(P.JOMemoryData.FieldByName('Db_Sum').Value);
            d_s_str_1:='';
            for i:=1 to Length(d_s_str) do
            if (copy(d_s_str,i,1)='0') or (copy(d_s_str,i,1)='1') or
               (copy(d_s_str,i,1)='2') or (copy(d_s_str,i,1)='3') or
               (copy(d_s_str,i,1)='4') or (copy(d_s_str,i,1)='5') or
               (copy(d_s_str,i,1)='6') or (copy(d_s_str,i,1)='7') or
               (copy(d_s_str,i,1)='8') or (copy(d_s_str,i,1)='9') or
               (copy(d_s_str,i,1)=',') or (copy(d_s_str,i,1)='-') then
          d_s_str_1:=d_s_str_1+ copy(d_s_str,i,1);

          db:=db+StrToFloat(d_s_str_1);
          end;
        //

        // kr
         if  ((P.JOMemoryData.FieldByName('Kr_Sum').AsString<>'') and (P.JOMemoryData.FieldByName('KR_Sch_Db').Value<>null)) then
         begin
         k_s_str:=VarToStr(P.JOMemoryData.FieldByName('Kr_Sum').Value);
            k_s_str_1:='';
            for i:=1 to Length(k_s_str) do
            if (copy(k_s_str,i,1)='0') or (copy(k_s_str,i,1)='1') or
               (copy(k_s_str,i,1)='2') or (copy(k_s_str,i,1)='3') or
               (copy(k_s_str,i,1)='4') or (copy(k_s_str,i,1)='5') or
               (copy(k_s_str,i,1)='6') or (copy(k_s_str,i,1)='7') or
               (copy(k_s_str,i,1)='8') or (copy(k_s_str,i,1)='9') or
               (copy(k_s_str,i,1)=',') or (copy(k_s_str,i,1)='-') then
          k_s_str_1:=k_s_str_1+ copy(k_s_str,i,1);

          kr:=kr+StrToFloat(k_s_str_1);
          end;
        //
         end
       end
       else
       begin
        if ((P.JOMemoryData.FieldByName('In_Sch').Value<>null) or(P.JOMemoryData.FieldByName('DB_Sch_Db').Value<>null) or (P.JOMemoryData.FieldByName('Kr_Sch_Db').Value<>null)) then
        begin
        first:=1;
        // in_db
         if ((P.JOMemoryData.FieldByName('In_Db').AsString<>'') and (P.JOMemoryData.FieldByName('In_Sch').Value<>null)) then
         begin
         in_db_str:=VarToStr(P.JOMemoryData.FieldByName('In_Db').Value);
         in_db_str_1:='';
         for i:=1 to Length(in_db_str) do
         if (copy(in_db_str,i,1)='0') or (copy(in_db_str,i,1)='1') or
            (copy(in_db_str,i,1)='2') or (copy(in_db_str,i,1)='3') or
            (copy(in_db_str,i,1)='4') or (copy(in_db_str,i,1)='5') or
            (copy(in_db_str,i,1)='6') or (copy(in_db_str,i,1)='7') or
            (copy(in_db_str,i,1)='8') or (copy(in_db_str,i,1)='9') or
            (copy(in_db_str,i,1)=',') or (copy(in_db_str,i,1)='-')
            then in_db_str_1:=in_db_str_1+ copy(in_db_str,i,1);


        in_db:=in_db+StrToFloat(in_db_str_1);
        end;
        //

        // in_kr
         if  ((P.JOMemoryData.FieldByName('In_Kr').AsString<>'') and (P.JOMemoryData.FieldByName('In_Sch').Value<>null)) then
         begin
         in_kr_str:=VarToStr(P.JOMemoryData.FieldByName('In_Kr').Value);
         in_kr_str_1:='';
         for i:=1 to Length(in_kr_str) do
         if (copy(in_kr_str,i,1)='0') or (copy(in_kr_str,i,1)='1') or
            (copy(in_kr_str,i,1)='2') or (copy(in_kr_str,i,1)='3') or
            (copy(in_kr_str,i,1)='4') or (copy(in_kr_str,i,1)='5') or
            (copy(in_kr_str,i,1)='6') or (copy(in_kr_str,i,1)='7') or
            (copy(in_kr_str,i,1)='8') or (copy(in_kr_str,i,1)='9') or
            (copy(in_kr_str,i,1)=',') or (copy(in_kr_str,i,1)='-')
            then in_kr_str_1:=in_kr_str_1+ copy(in_kr_str,i,1);

        in_kr:=in_kr+StrToFloat(in_kr_str_1);
        end;
        //

        // db
         if  ((P.JOMemoryData.FieldByName('Db_Sum').AsString<>'') and (P.JOMemoryData.FieldByName('DB_Sch_Db').Value<>null)) then
         begin
         d_s_str:=VarToStr(P.JOMemoryData.FieldByName('Db_Sum').Value);
            d_s_str_1:='';
            for i:=1 to Length(d_s_str) do
            if (copy(d_s_str,i,1)='0') or (copy(d_s_str,i,1)='1') or
               (copy(d_s_str,i,1)='2') or (copy(d_s_str,i,1)='3') or
               (copy(d_s_str,i,1)='4') or (copy(d_s_str,i,1)='5') or
               (copy(d_s_str,i,1)='6') or (copy(d_s_str,i,1)='7') or
               (copy(d_s_str,i,1)='8') or (copy(d_s_str,i,1)='9') or
               (copy(d_s_str,i,1)=',') or (copy(d_s_str,i,1)='-') then
          d_s_str_1:=d_s_str_1+ copy(d_s_str,i,1);

          db:=db+StrToFloat(d_s_str_1);
          end;
        //

        // kr
         if ((P.JOMemoryData.FieldByName('Kr_Sum').AsString<>'') and(P.JOMemoryData.FieldByName('KR_Sch_Db').Value<>null)) then
         begin
         k_s_str:=VarToStr(P.JOMemoryData.FieldByName('Kr_Sum').Value);
            k_s_str_1:='';
            for i:=1 to Length(k_s_str) do
            if (copy(k_s_str,i,1)='0') or (copy(k_s_str,i,1)='1') or
               (copy(k_s_str,i,1)='2') or (copy(k_s_str,i,1)='3') or
               (copy(k_s_str,i,1)='4') or (copy(k_s_str,i,1)='5') or
               (copy(k_s_str,i,1)='6') or (copy(k_s_str,i,1)='7') or
               (copy(k_s_str,i,1)='8') or (copy(k_s_str,i,1)='9') or
               (copy(k_s_str,i,1)=',') or (copy(k_s_str,i,1)='-') then
          k_s_str_1:=k_s_str_1+ copy(k_s_str,i,1);

          kr:=kr+StrToFloat(k_s_str_1);
          end;
        //
        end;
       end;
       end;
      
       P.JOMemoryData.Next;
      end;

    end;
  P.JOMemoryData.First;

  name_org_2:='';
  for i:=1 to Length(org_name_2) do
  begin
    if Ord(org_name_2[i])=39 then name_org_2:= name_org_2+#146
    else name_org_2:= name_org_2+ Copy(org_name_2,i,1);
  end;
   P.report.Variables['ORG_NAME_1']:=''''+SYS_INFO._Full_Name_Org+'''';
   P.report.Variables['ORG_NAME_2']:=''''+name_org_2+'''';
   P.report.Variables['DATE_BEG']:=''''+DateToStr(P.PrintFilter._Date_beg)+'''';
   P.report.Variables['DATE_END']:=''''+DateToStr(P.PrintFilter._Date_end)+'''';
   P.report.Variables['DATE_END_1']:=''''+Datetostr(date_beg)+'''';
   P.report.Variables['USER']:=''''+CURRENT_USER+'''';
   s:=saldo_db-saldo_kr;
   if s=0 then
   begin
   P.report.Variables['OKONCH']:=  ''''+' заборгованності на '+Datetostr(date_beg)+ ' немає.'+'''';
   P.report.Variables['OKONCH2']:=''''+'''';
   P.report.Variables['OKONCH3']:=''''+'''';
   P.report.Variables['NAME_DOLG']:=''''+'''';
   P.report.Variables['SUMMA_DOLG']:=''''+'''';
   end
   else
   begin
    P.report.Variables['OKONCH']:= ''''+' сторони визнають заборгованість за '+'''';
    P.report.Variables['OKONCH2']:=''''+' у сумі '+'''';
    P.report.Variables['OKONCH3']:=''''+' грн.'+'''';
    if s>0 then
    P.report.Variables['NAME_DOLG']:=''''+name_org_2+'''';
    if s<0 then
    begin
    s:=s*(-1);
    P.report.Variables['NAME_DOLG']:=''''+SYS_INFO._Full_Name_Org+'''';
    end;
    P.report.Variables['SUMMA_DOLG']:=''''+DoCurrFormat(FloatToStrF(s, ffFixed, 100, 2))+'''';


   end;

   if  Filter._Font_Name<>'' then
   begin
   p.Report.FindObject('Memo17').Font.Name:=Filter._Font_Name;
   p.Report.FindObject('Memo17').Font.Size:=Filter._Font_Size;

   p.Report.FindObject('Memo12').Font.Name:=Filter._Font_Name;
   p.Report.FindObject('Memo12').Font.Size:=Filter._Font_Size;

   p.Report.FindObject('Memo18').Font.Name:=Filter._Font_Name;
   p.Report.FindObject('Memo18').Font.Size:=Filter._Font_Size;

   p.Report.FindObject('Memo19').Font.Name:=Filter._Font_Name;
   p.Report.FindObject('Memo19').Font.Size:=Filter._Font_Size;
   end;
   P.ShowReport; // P.ShowReport;
  end;
 // ShowMessage(VarToStr(P.JOMemoryData.FieldByName('REG_NUM').Value));
  if Filter._PrintKind<>JO9_AKT_SVERKI then jo_Preview.Show;
 end
 else if (Filter._PrintKind = JO9_REPORT_SCH) or (Filter._PrintKind = JO9_REPORT_SCH_MO) then begin
  if (Filter._PrintKind = JO9_REPORT_SCH) then Rep_File := Rep_File + 'Reports\JO9\JO9_SCH.fr3'
  else Rep_File := Rep_File + 'Reports\JO9\JO9_SCH_MO.fr3';

  if not P.Report.LoadFromFile(Rep_File) then begin
   ShowMessage('Файл звіту [' + Rep_File + '] не знайдено!');
   Exit;
  end;

  P.Report.Variables.Variables['HeaderOnNewPage'] := P.PrintFilter._PrintOnNewPage;

//  P.PrintFilter._Date_End := EndOfTheMonth(P.PrintFilter._Date_Beg);
  P.StoredProc.Transaction.StartTransaction;

  P.SaveFilter;

  if Filter._PrintKind = JO9_REPORT_SCH then begin

   P.Print_Sch_Report;

   if Filter._CommitTrans then begin
    P.StoredProc.Transaction.Commit;

    //ShowMessage('KEY_SESSION = ' + IntToStr(P.KEY_SESSION));
   end
   else P.StoredProc.Transaction.Rollback;

   P.SchMemoryData.First;
   P.DBDataset.DataSet := P.SchMemoryData;
  end
  else begin
   P.Print_Sch_MO_Report;

   if Filter._CommitTrans then begin
    P.StoredProc.Transaction.Commit;

    //ShowMessage('KEY_SESSION = ' + IntToStr(P.KEY_SESSION));
   end
   else P.StoredProc.Transaction.Rollback;

   P.MOSchMemoryData.First;
   P.DBDataset.DataSet := P.MOSchMemoryData;
  end;

  P.ShowReport;
 end
 else if (Filter._PrintKind = JO9_REPORT_REG) or (Filter._PrintKind = JO9_REPORT_REG_MO) then begin
  if P.PrintFilter._PrintCurDoc then begin
   if P.PrintFilter._PaperFormat = pfA3 then Rep_File := Rep_File + 'Reports\JO9\JO9_Reg_Cur.fr3'
   else Rep_File := Rep_File + 'Reports\JO9\JO9_Reg_Cur_A4.fr3';

   if not P.Report.LoadFromFile(Rep_File) then begin
    ShowMessage('Файл звіту [' + Rep_File + '] не знайдено!');
    Exit;
   end;

   P.Report.Variables.Variables['HeaderOnNewPage'] := P.PrintFilter._PrintOnNewPage;

   P.StoredProc.Transaction.StartTransaction;

   P.SaveFilter;

   P.DoCurDocsReport(P.PrintFilter._is_Kredit);

   if Filter._CommitTrans then begin
    P.StoredProc.Transaction.Commit;

    //ShowMessage('KEY_SESSION = ' + IntToStr(P.KEY_SESSION));
   end
   else P.StoredProc.Transaction.Rollback;

   P.CurMemoryData.First;
   P.DBDataset.DataSet := P.CurMemoryData;
  end
  else begin
   if P.PrintFilter._PaperFormat = pfA3 then Rep_File := Rep_File + 'Reports\JO9\JO9_Reg_Ost.fr3'
   else Rep_File := Rep_File + 'Reports\JO9\JO9_Reg_Ost_A4.fr3';

   if not P.Report.LoadFromFile(Rep_File) then begin
    ShowMessage('Файл звіту [' + Rep_File + '] не знайдено!');
    Exit;
   end;

   P.StoredProc.Transaction.StartTransaction;

   P.SaveFilter;

   P.Report.Variables.Variables['HeaderOnNewPage'] := P.PrintFilter._PrintOnNewPage;

   P.DoOstDocsReport(P.PrintFilter._is_Kredit);

   if Filter._CommitTrans then begin
    P.StoredProc.Transaction.Commit;

    //ShowMessage('KEY_SESSION = ' + IntToStr(P.KEY_SESSION));
   end
   else P.StoredProc.Transaction.Rollback;

   P.OstMemoryData.First;
   P.DBDataset.DataSet := P.OstMemoryData;
  end;

  P.ShowReport;
     
 end
 else if (Filter._PrintKind = JO9_REPORT_REG_EX) then begin
  if Filter._GroupByTypeDog then
   Rep_File := Rep_File + 'Reports\JO9\JO9_Reg_Cur_Ex.fr3'
  else
   Rep_File := Rep_File + 'Reports\JO9\JO9_Reg_Cur_Ex2.fr3';

  if not P.Report.LoadFromFile(Rep_File) then begin
   ShowMessage('Файл звіту [' + Rep_File + '] не знайдено!');
   Exit;
  end;

  P.Report.Variables.Variables['HeaderOnNewPage'] := P.PrintFilter._PrintOnNewPage;

  P.StoredProc.Transaction.StartTransaction;

  P.SaveFilter;

  P.DoCurDocsExReport(P.PrintFilter._is_Kredit);

  if Filter._CommitTrans then begin
   P.StoredProc.Transaction.Commit;

   //ShowMessage('KEY_SESSION = ' + IntToStr(P.KEY_SESSION));
  end
  else P.StoredProc.Transaction.Rollback;

  P.JODataset.DataSet := P.DataSet;

  P.ShowReport;
 end
 else if (Filter._PrintKind = JO9_REPORT_SCH_CUR) or (Filter._PrintKind =  JO9_REPORT_SCH_CUR_MO) then begin
  if not P.Report.LoadFromFile(SYS_INFO^._App_Path + 'Reports\JO9\JO9_SCH_CUR.fr3') then begin
   ShowMessage('Файл звіту ' + QuotedStr(SYS_INFO^._App_Path + 'Reports\JO9\JO9_SCH_CUR.fr3') + ' не знайдено!');
   Exit;
  end;

  P.Report.Variables.Variables['HeaderOnNewPage'] := P.PrintFilter._PrintOnNewPage;
//  P.PrintFilter._Date_End                         := EndOfTheMonth(P.PrintFilter._Date_Beg);

  P.StoredProc.Transaction.StartTransaction;

  P.SaveFilter;

  P.Print_Sch_Cur_Report(not P.PrintFilter._is_Kredit);

  if Filter._CommitTrans then begin
   P.StoredProc.Transaction.Commit;

   //ShowMessage('KEY_SESSION = ' + IntToStr(P.KEY_SESSION));
  end
  else P.StoredProc.Transaction.Rollback;

  P.SchMemoryData.First;
  P.DBDataset.DataSet := P.SchMemoryData;

  P.ShowReport;
 end
 else if (Filter._PrintKind = JO9_REPORT_SCH_GRP) or (Filter._PrintKind = JO9_REPORT_SCH_GRP_MO) then begin
  if not P.Report.LoadFromFile(SYS_INFO^._App_Path + 'Reports\JO9\JO9_SM_RZ_ST.fr3') then begin
   ShowMessage('Файл звіту ' + QuotedStr(SYS_INFO^._App_Path + 'Reports\JO9\JO9_SM_RZ_ST.fr3') + ' не знайдено!');
   Exit;
  end;

  P.Report.Variables.Variables['HeaderOnNewPage'] := P.PrintFilter._PrintOnNewPage;

//  P.PrintFilter._Date_End := EndOfTheMonth(P.PrintFilter._Date_Beg);

  P.StoredProc.Transaction.StartTransaction;

  P.SaveFilter;
  P.PrepareData(True);
  P.Print_Sch_Grp;

  if Filter._CommitTrans then begin
   P.StoredProc.Transaction.Commit;

   //ShowMessage('KEY_SESSION = ' + IntToStr(P.KEY_SESSION));
  end
  else P.StoredProc.Transaction.Rollback;

  P.GrMemoryData.First;
  P.DBDataset.DataSet := P.GrMemoryData;

  P.ShowReport;
 end
 else if Filter._PrintKind = JO9_REPORT_OST then begin
  if not P.Report.LoadFromFile(SYS_INFO^._App_Path + 'Reports\JO9\JO9_Ost_By_Periods.fr3') then begin
   ShowMessage('Файл звіту ' + QuotedStr(SYS_INFO^._App_Path + 'Reports\JO9\JO9_Ost_By_Periods.fr3') + ' не знайдено!');
   Exit;
  end;

  P.Report.Variables.Variables['HeaderOnNewPage'] := P.PrintFilter._PrintOnNewPage;

  P.PrintFilter._Date_End := EndOfTheMonth(P.PrintFilter._Date_Beg);

  P.StoredProc.Transaction.StartTransaction;

  P.Print_Ost_Report;
  P.DBDataset.DataSet := P.OstCustData;
  P.OstCustData.First;

  if P.PrintFilter._ShowSRStKEKV then P.ColDataSet.RangeEndCount := 8 + Length(P.OstPeriods)
  else P.ColDataSet.RangeEndCount := 4 + Length(P.OstPeriods);

  if Filter._CommitTrans then begin
   P.StoredProc.Transaction.Commit;

   //ShowMessage('KEY_SESSION = ' + IntToStr(P.KEY_SESSION));
  end
  else P.StoredProc.Transaction.Rollback;

  jo_Preview                      := Tjo9_Preview_joForm.Create(P);
  jo_Preview.Caption              := 'Заборгованість контрагентів у розрізі років';
  jo_Preview.DataSource.DataSet   := P.OstCustData;

  jo_Preview.GridLevel.Visible        := False;
  jo_Preview.GridLevelOst.Visible     := True;
  jo_Preview.GridLevelCustSch.Visible := False;

  jo_Preview.SchVisible := P.PrintFilter._ShowSRStKEKV;
  jo_Preview.MakeColumnsOst(P.OstCustData, 9, @P.OstPeriods);

  if P.PrintFilter._DateKind = odkAppear then jo_Preview.TableViewOst.Bands[1].Caption := 'Періоди виникнення заборгованості'
  else jo_Preview.TableViewOst.Bands[1].Caption := 'Періоди останнього руху коштів';

  jo_Preview.FormStyle := fsMDIChild;

  jo_Preview.Show;
 end
 else if Filter._PrintKind = JO9_REPORT_CUST then begin
{  if not P.Report.LoadFromFile(SYS_INFO^._App_Path + 'Reports\JO9\JO9_Ost_By_Periods.fr3') then begin
   ShowMessage('Файл звіту ' + QuotedStr(SYS_INFO^._App_Path + 'Reports\JO9\JO9_Ost_By_Periods.fr3') + ' не знайдено!');
   Exit;
  end;}

  P.MakeCustSchReport;
 end;

 P.FormStyle := fsNormal;
 P.Hide;
// очищаю временную таблицу
{ try
       p.st_pr_proverka.Close;
       p.st_pr_proverka.Transaction := p.Tr_proverka;
       p.st_pr_proverka.Transaction.StartTransaction;
       p.st_pr_proverka.StoredProcName:='JO9_IN_CUR_BUFF_CLEAR';
       p.st_pr_proverka.Prepare;
       p.st_pr_proverka.ParamByName('KEY_SESSION').AsInteger:=p.KEY_SESSION;
       p.st_pr_proverka.ExecProc;
       p.st_pr_proverka.Transaction.Commit;
       except on E : Exception
       do begin
        ShowMessage(E.Message);
        p.st_pr_proverka.Transaction.Rollback;
        exit;
       end;
        end;   }
        //

// очищаю временную таблицу проводок
 try
       p.st_pr_proverka.Close;
       p.st_pr_proverka.Transaction := p.Tr_proverka;
       p.st_pr_proverka.Transaction.StartTransaction;
       p.st_pr_proverka.StoredProcName:='JO9_IN_CUR_PROV_BUFF_CLEAR';
       p.st_pr_proverka.Prepare;
       p.st_pr_proverka.ParamByName('KEY_SESSION').AsInteger:=p.KEY_SESSION;
       p.st_pr_proverka.ExecProc;
       p.st_pr_proverka.Transaction.Commit;
       except on E : Exception
       do begin
        ShowMessage(E.Message);
        p.st_pr_proverka.Transaction.Rollback;
        exit;
       end;
        end;

  // очищаю таблицу настроек фильтра
        try
       p.st_pr_proverka.Close;
       p.st_pr_proverka.Transaction := p.Tr_proverka;
       p.st_pr_proverka.Transaction.StartTransaction;
       p.st_pr_proverka.StoredProcName:='JO9_PRINT_FILTER_CLEAR';
       p.st_pr_proverka.Prepare;
       p.st_pr_proverka.ParamByName('KEY_SESSION').AsInteger:=p.KEY_SESSION;
       p.st_pr_proverka.ExecProc;
       p.st_pr_proverka.Transaction.Commit;
       except on E : Exception
       do begin
        ShowMessage(E.Message);
        p.st_pr_proverka.Transaction.Rollback;
        exit;
       end;
        end;
        //

   // очищаю таблицу дерева контрагентов
        try
       p.st_pr_proverka.Close;
       p.st_pr_proverka.Transaction := p.Tr_proverka;
       p.st_pr_proverka.Transaction.StartTransaction;
       p.st_pr_proverka.StoredProcName:='JO9_TREE_BUFFER_CLEAR';
       p.st_pr_proverka.Prepare;
       p.st_pr_proverka.ParamByName('KEY_SESSION').AsInteger:=p.KEY_SESSION;
       p.st_pr_proverka.ExecProc;
       p.st_pr_proverka.Transaction.Commit;
       except on E : Exception
       do begin
        ShowMessage(E.Message);
        p.st_pr_proverka.Transaction.Rollback;
        exit;
       end;
        end;
        //

// Application.MainForm.MDIChildren[Application.MainForm.MDIChildCount - 1].OnClose := P.OnClose;
end;

function DoSaveSaldoOut(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         WTrans : TISC_TR_HANDLE; INFO : Pjo9_SYS_INFO; USE_MAIN_BOOK : boolean) : boolean; stdcall;
var
 F  : Tjo9_PrintForm;
begin
 Result := False;

 SYS_INFO := INFO;
 F := Tjo9_PrintForm.Create(AOwner);

 F.Database.Handle         := DBHandle;
 F.ReadTransaction.Handle  := RTrans;
 F.WriteTransaction.Handle := WTrans;

 F.FormStyle := fsNormal;
 F.Visible := False;

 F.PrintFilter._Date_Beg := SYS_INFO^._Period_Beg;
 F.PrintFilter._Date_End := SYS_INFO^._Period_End;

 ///////////

 F.KEY_SESSION := F.Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);

 try

  F.PrepareData(True);

  if USE_MAIN_BOOK then begin
   if F.CloseSch then if F.SaveSaldoOut then Result := True;
  end
  else if F.SaveSaldoOut then Result := True;
 except
  begin
   ShowMessage('Виникла критична помилка!'
   + #13 + 'Перехід системи у наступний період не здійснено.');
   Result := False;
  end;
 end;

 F.Free;
end;

function DoRollbackSystem(DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         WTrans : TISC_TR_HANDLE; INFO : Pjo9_SYS_INFO; USE_MAIN_BOOK : boolean) : boolean; stdcall;
var
 F  : Tjo9_PrintForm;
begin
 SYS_INFO := INFO;
 F        := Tjo9_PrintForm.Create(nil);

 F.Database.Handle         := DBHandle;
 F.ReadTransaction.Handle  := RTrans;
 F.WriteTransaction.Handle := WTrans;

 F.FormStyle := fsNormal;
 F.Visible   := False;

 F.PrintFilter._Date_Beg := SYS_INFO^._Period_Beg;
 F.PrintFilter._Date_End := SYS_INFO^._Period_End;

 F.DataSet.SelectSQL.Text := 'select * from PUB_SYS_DATA';
 F.DataSet.Open;
 F.DataSet.Close;

 ///////////

 if USE_MAIN_BOOK then Result := F.OpenSch
 else Result := True;

 F.Free;
end;

{ Tjo9_PrintForm }

procedure Tjo9_PrintForm.DoProgress(PPosition : currency);
var
 k : integer;
 s : string;
begin
 ProgressBar.Position := Trunc(PPosition);

 k := Trunc(ProgressBar.Position / ProgressBar.Properties.Max * ProgressBar.Width);
 if k = LastPixel then Exit;

 s := IntToStr(Round(ProgressBar.Position / ProgressBar.Properties.Max * 100)) + '%';

 Caption := s;

 Application.ProcessMessages;
end;

procedure Tjo9_PrintForm.FillArrays(SelNote : boolean = False);
var
 s, d : string;
 i    : integer;
begin
 TreeArray     := nil;
 ProvBuffArray := nil;

 if PrintFilter._Db_Cust and not PrintFilter._Kr_Cust then s := '1'
 else if not PrintFilter._Db_Cust and PrintFilter._Kr_Cust then s := '2'
 else if PrintFilter._Db_Cust and PrintFilter._Kr_Cust then s := '3'
 else s := '0';

 if SelNote then d := '1' else d := '0';

 if PrintFilter._GroupByTypeDog then
  DataSet.SelectSQL.Text := 'select * from JO9_TREE_BUFFER_SEL(' + IntToStr(KEY_SESSION)
  + ',' + s + ', 1,' + d + ') order by NUM_TYPE_DOG, name_customer, idd, DATE_REG'
 else
  DataSet.SelectSQL.Text := 'select * from JO9_TREE_BUFFER_SEL(' + IntToStr(KEY_SESSION)
  + ',' + s + ', 0,' + d + ') order by name_customer, idd, DATE_REG';
 DataSet.Open;

 SetLength(TreeArray, DataSet.RecordCount);

 for i := 0 to DataSet.RecordCount - 1 do begin
  with TreeArray[i] do begin
   _ID_CUSTOMER := DataSet.FieldByName('ID_CUSTOMER').AsInteger;
   _NAME_CUST   := DataSet.FieldByName('NAME_CUSTOMER').AsString;
   _IDD         := DataSet['IDD'];
   _ID_DOC      := DataSet['ID_DOC'];
   _DATE_DOC    := DataSet.FieldByName('DATE_DOC').AsDateTime;
   _DATE_REG    := DataSet.FieldByName('DATE_REG').AsDateTime;
   _NUM_DOC     := DataSet.FieldByName('NUM_DOC').AsString;
   _NOTE        := DataSet.FieldByName('NOTE').AsString;
   _DOG_NOTE    := DataSet.FieldByName('DOG_NOTE').AsString;
   _DOG_NUM     := DataSet.FieldByName('DOG_NUM').AsString;
   _DOG_DATE    := DataSet.FieldByName('DOG_DATE').AsDateTime;

   if VarIsNull(DataSet['ID_TYPE_DOG']) then begin
    _id_Type_Dog := -2;
    _Name_Type_D := 'Тип договора не определен';
   end
   else begin
    _id_Type_Dog := DataSet['ID_TYPE_DOG'];
    _Name_Type_D := DataSet.FieldByName('NAME_TYPE_DOG').AsString;
   end;
  end;

  DataSet.Next;
 end;

 DataSet.Close;
end;

procedure Tjo9_PrintForm.FillMemoryData;
 procedure AddOst(FromLine : integer; DbSum, KrSum : currency; InArray : TProvBuffArray; Summary : boolean; isBad : boolean);
 var
  i    : integer;
  Line : integer;
 begin
  if Length(InArray) = 0 then Exit;

  Line := FromLine;

  JOMemoryData.RecNo := Line;

  if Summary then begin
   JOMemoryData.Edit;
   JOMemoryData.FieldByName('In_Db').Value  := DoCurrFormat(FloatToStrF(DbSum, ffFixed, 100, 2));
   JOMemoryData.FieldByName('In_Kr').Value  := DoCurrFormat(FloatToStrF(KrSum, ffFixed, 100, 2));

   if isBad then JOMemoryData.FieldByName('State').Value  := 'BadDoc';

   JOMemoryData.Post;

   Inc(Line);
  end;

  for i := 0 to Length(InArray) - 1 do begin
   JOMemoryData.RecNo := Line;

   if Line > JOMemoryData.RecordCount then begin
    JOMemoryData.Append;
    JOMemoryData.Edit;
    JOMemoryData.FieldByName('CustNameFilter').Value  := LastCustName;
    JOMemoryData.Post;
   end;

   if i <> 0 then begin
    if (InArray[i - 1].ID_SCH = InArray[i].ID_SCH)
    and (InArray[i - 1].ID_S = InArray[i].ID_S) and (InArray[i - 1].ID_R = InArray[i].ID_R)
    and (InArray[i - 1].ID_St = InArray[i].ID_St) and (InArray[i - 1].ID_KEKV = InArray[i].ID_KEKV)
    and (InArray[i - 1].IS_DB = InArray[i].IS_DB) then begin
     JOMemoryData.Edit;

     if InArray[i].IS_DB then JOMemoryData.FieldByName('In_Db').Value := DoCurrFormat(FloatToStrF(InArray[i].SUMMA, ffFixed, 100, 2))
     else JOMemoryData.FieldByName('In_Kr').Value := DoCurrFormat(FloatToStrF(InArray[i].SUMMA, ffFixed, 100, 2));

     if isBad then JOMemoryData.FieldByName('State').Value  := 'BadDoc';

     JOMemoryData.Post;

     Inc(Line);
     Continue;
    end;
   end;

   JOMemoryData.Edit;
   if InArray[i].IS_DB then JOMemoryData.FieldByName('In_Db').Value := DoCurrFormat(FloatToStrF(InArray[i].SUMMA, ffFixed, 100, 2))
   else JOMemoryData.FieldByName('In_Kr').Value := DoCurrFormat(FloatToStrF(InArray[i].SUMMA, ffFixed, 100, 2));
     //showmessage('1');
  //  Showmessage(FloatToStr(InArray[i].SUMMA)+' '+VarToStr(InArray[i].KOD_SCH)+' '+VarTOstr(InArray[i].KOD_KEKV));
   JOMemoryData.FieldByName('In_Sch').Value  := InArray[i].KOD_SCH;
   JOMemoryData.FieldByName('In_S').Value    := InArray[i].KOD_S;
   JOMemoryData.FieldByName('In_R').Value    := InArray[i].KOD_R;
   JOMemoryData.FieldByName('In_St').Value   := InArray[i].KOD_St;
//   if  InArray[i].KOD_KEKV=null then  JOMemoryData.FieldByName('In_Kekv').Value :=9999
  // else
   JOMemoryData.FieldByName('In_Kekv').Value := InArray[i].KOD_KEKV;

//   if not Summary then JOMemoryData.FieldByName('In_Sch').Value := InArray[0].KOD_SCH;

   if isBad then JOMemoryData.FieldByName('State').Value  := 'BadDoc';

   JOMemoryData.Post;

   Inc(Line);
  end;
 end;

 procedure AddDoc(var Line : integer; Sum : currency; InArray : TProvBuffArray; index : integer; isBad : boolean);
 var
  i : integer;
 begin
  // ShowMessage(varToStr(TreeArray[index]._NUM_DOC));
  if Length(InArray) = 0 then Exit;

  if Line > JOMemoryData.RecordCount then begin
   JOMemoryData.Append;
   JOMemoryData.Edit;
   JOMemoryData.FieldByName('CustNameFilter').Value  := LastCustName;
   JOMemoryData.Post;
  end;

  JOMemoryData.RecNo := Line;
  JOMemoryData.Edit;

  if InArray[0].IS_DB then begin
   JOMemoryData.FieldByName('Db_Doc').Value      := TreeArray[index]._NUM_DOC;
   JOMemoryData.FieldByName('Db_Date').Value     := TreeArray[index]._DATE_DOC;
   JOMemoryData.FieldByName('Db_Date_Reg').Value := DateToStr(TreeArray[index]._DATE_REG, f_Date_Reg);

   if Length(InArray) > 1 then begin
    JOMemoryData.FieldByName('Db_Sum').Value := DoCurrFormat(FloatToStrF(Sum, ffFixed, 100, 2));
    Inc(Line);
   end;
  end
  else begin
   JOMemoryData.FieldByName('Kr_Doc').Value      := TreeArray[index]._NUM_DOC;
   JOMemoryData.FieldByName('Kr_Date').Value     := TreeArray[index]._DATE_DOC;
   JOMemoryData.FieldByName('Kr_Date_Reg').Value := DateToStr(TreeArray[index]._DATE_REG, f_Date_Reg);

   if Length(InArray) > 1 then begin
    JOMemoryData.FieldByName('Kr_Sum').Value := DoCurrFormat(FloatToStrF(Sum, ffFixed, 100, 2));
    Inc(Line);
   end;
  end;

  if isBad then JOMemoryData.FieldByName('State').Value  := 'BadDoc';

  JOMemoryData.Post;

  for i := 0 to Length(InArray) - 1 do begin
   JOMemoryData.RecNo := Line;

   if Line > JOMemoryData.RecordCount then begin
    JOMemoryData.Append;
    JOMemoryData.Edit;
    JOMemoryData.FieldByName('CustNameFilter').Value  := LastCustName;
    JOMemoryData.Post;
   end;

   JOMemoryData.Edit;

   if InArray[i].IS_DB then begin
    JOMemoryData.FieldByName('Db_Sch_Db').Value := InArray[i].KOD_SCH;
    JOMemoryData.FieldByName('Db_Sch_Kr').Value := InArray[i].KOD_SCH_COR;
    JOMemoryData.FieldByName('Db_Sum').Value    := DoCurrFormat(FloatToStrF(InArray[i].SUMMA, ffFixed, 100, 2));
    JOMemoryData.FieldByName('Db_S').Value      := InArray[i].KOD_S;
    JOMemoryData.FieldByName('Db_R').Value      := InArray[i].KOD_R;
    JOMemoryData.FieldByName('Db_St').Value     := InArray[i].KOD_St;
    JOMemoryData.FieldByName('Db_Kekv').Value   := InArray[i].KOD_KEKV;
   end
   else begin
    JOMemoryData.FieldByName('Kr_Sch_Db').Value := InArray[i].KOD_SCH_COR;
    JOMemoryData.FieldByName('Kr_Sch_Kr').Value := InArray[i].KOD_SCH;
    JOMemoryData.FieldByName('Kr_Sum').Value    := DoCurrFormat(FloatToStrF(InArray[i].SUMMA, ffFixed, 100, 2));
    JOMemoryData.FieldByName('Kr_S').Value      := InArray[i].KOD_S;
    JOMemoryData.FieldByName('Kr_R').Value      := InArray[i].KOD_R;
    JOMemoryData.FieldByName('Kr_St').Value     := InArray[i].KOD_St;
    JOMemoryData.FieldByName('Kr_Kekv').Value   := InArray[i].KOD_KEKV;
   end;

   if isBad then JOMemoryData.FieldByName('State').Value  := 'BadDoc';

   JOMemoryData.Post;

   Inc(Line);
  end;
 end;

 procedure AddSaldo(FromLine : integer; DbSum, KrSum : currency; InArray : TSaldoOutArray; isBad : boolean);
 var
  i    : integer;
  Line : integer;
 begin
  Line := FromLine;

  JOMemoryData.RecNo := Line;

  if Length(InArray) = 0 then begin
   JOMemoryData.Edit;
   JOMemoryData.FieldByName('Out_Db').Value := '0.00';
   JOMemoryData.FieldByName('Out_Kr').Value := '0.00';

   if isBad then JOMemoryData.FieldByName('State').Value  := 'BadDoc';

   JOMemoryData.Post;

   Exit;
  end
  else if Length(InArray) > 1 then begin
   JOMemoryData.Edit;
   JOMemoryData.FieldByName('Out_Db').Value := DoCurrFormat(FloatToStrF(DbSum, ffFixed, 100, 2));
   JOMemoryData.FieldByName('Out_Kr').Value := DoCurrFormat(FloatToStrF(KrSum, ffFixed, 100, 2));

   if isBad then JOMemoryData.FieldByName('State').Value  := 'BadDoc';

   JOMemoryData.Post;
  end
  else Dec(Line);

  for i := 0 to Length(InArray) - 1 do begin
   JOMemoryData.RecNo := Line;

   if i <> 0 then begin
    if (InArray[i - 1].NUM_SCH_COR = InArray[i].NUM_SCH_COR)
    and (InArray[i - 1].KOD_S = InArray[i].KOD_S) and (InArray[i - 1].KOD_R = InArray[i].KOD_R)
    and (InArray[i - 1].KOD_St = InArray[i].KOD_St) and (InArray[i - 1].KOD_KEKV = InArray[i].KOD_KEKV) then begin
     JOMemoryData.Edit;

     if InArray[i].OUT_DB then JOMemoryData.FieldByName('Out_Db').Value := DoCurrFormat(FloatToStrF(InArray[i].SUMMA, ffFixed, 100, 2))
     else JOMemoryData.FieldByName('Out_Kr').Value := DoCurrFormat(FloatToStrF(InArray[i].SUMMA, ffFixed, 100, 2));

     if isBad then JOMemoryData.FieldByName('State').Value  := 'BadDoc';

     JOMemoryData.Post;

     Continue;
    end;
   end;

   Inc(Line);
   JOMemoryData.RecNo := Line;

   if Line > JOMemoryData.RecordCount then begin
    JOMemoryData.Append;
    JOMemoryData.Edit;
    JOMemoryData.FieldByName('CustNameFilter').Value  := LastCustName;
    JOMemoryData.Post;
   end;

   JOMemoryData.Edit;
   if InArray[i].OUT_DB then JOMemoryData.FieldByName('Out_Db').Value := DoCurrFormat(FloatToStrF(InArray[i].SUMMA, ffFixed, 100, 2))
   else JOMemoryData.FieldByName('Out_Kr').Value := DoCurrFormat(FloatToStrF(InArray[i].SUMMA, ffFixed, 100, 2));

   JOMemoryData.FieldByName('Out_Sch').Value  := InArray[i].NUM_SCH_COR;
   JOMemoryData.FieldByName('Out_S').Value    := InArray[i].KOD_S;
   JOMemoryData.FieldByName('Out_R').Value    := InArray[i].KOD_R;
   JOMemoryData.FieldByName('Out_St').Value   := InArray[i].KOD_St;
   JOMemoryData.FieldByName('Out_Kekv').Value := InArray[i].KOD_KEKV;

   if isBad then JOMemoryData.FieldByName('State').Value  := 'BadDoc';

   JOMemoryData.Post;
  end;
 end;
var
 i, j : integer;
 k    : integer;

 FirstRow     : integer;
 DbLine       : integer;
 KrLine       : integer;
 LastCustomer : int64;
 LastTypeDog  : int64;
 Last_IDD     : string;

 TempProv     : TProvBuffArray;
 DbSum        : currency;
 KrSum        : currency;

 Flag         : boolean;

 id_sch       : integer;
 Db, Kr       : boolean;
 NeedSummary  : boolean;

 Count        : integer;
begin
 JOMemoryData.Open;

 LastCustomer := -20;
 LastCustName := '';
 LastTypeDog  := -7836537485;

 if Length(TreeArray) > 0 then Step := 90 / Length(TreeArray);

 Count := 0;

 try
  for i := 0 to Length(TreeArray) - 1 do begin

   PBarPos := PBarPos + Step;
   DoProgress(PBarPos);

    // Заполняю массивы

   FillSaldoOut(TreeArray[i]._IDD, TreeArray[i]._ID_CUSTOMER, TreeArray[i]._NAME_CUST); // Заполняю исходящие остатки

   ///-------->>>>>>

   FillPBArray(True, TreeArray[i]._IDD, ''); // Заполняю входящие остатки
   FillPBArray(False, TreeArray[i]._IDD, TreeArray[i]._ID_DOC); // Заполняю обороты

   if (Length(InOstArray) = 0) and (Length(ProvBuffArray) = 0) and (Length(SaldoOut) = 0) then Continue;

   if PrintFilter._GroupByTypeDog then begin
    if TreeArray[i]._id_Type_Dog <> LastTypeDog then begin
     Count := 0;

     if LastTypeDog  <> -7836537485 then begin
      JOMemoryData.Append;
      JOMemoryData.Edit;

      JOMemoryData.FieldByName('CustNameFilter').Value := LastCustName;
      JOMemoryData.FieldByName('State').Value          := 'EmptyRow';

      JOMemoryData.Post;
     end;

     JOMemoryData.Append;
     JOMemoryData.Edit;
     JOMemoryData.FieldByName('CustNameFilter').Value  := LastCustName;

     JOMemoryData.FieldByName('CustNum').Value := '';
     JOMemoryData.FieldByName('RegNum').Value  := TreeArray[i]._Name_Type_D;

     JOMemoryData.FieldByName('State').Value  := 'NameTypeDog';

     JOMemoryData.Post;

     LastTypeDog := TreeArray[i]._id_Type_Dog;
    end;
   end;

   if TreeArray[i]._ID_CUSTOMER <> LastCustomer then begin
    Inc(Count);

    JOMemoryData.Append;
    JOMemoryData.Edit;
    JOMemoryData.FieldByName('CustNameFilter').Value  := LastCustName;

    JOMemoryData.FieldByName('CustNum').Value         := IntToStr(Count) + '.';
    JOMemoryData.FieldByName('RegNum').Value          := TreeArray[i]._NAME_CUST;
    LastCustName                                      := AnsiUpperCase(TreeArray[i]._NAME_CUST);
    JOMemoryData.FieldByName('CustNameFilter').Value  := LastCustName;

    if TreeArray[i]._ID_CUSTOMER = -2 then JOMemoryData.FieldByName('State').Value  := 'NameCustBad'
    else JOMemoryData.FieldByName('State').Value  := 'NameCust';

    JOMemoryData.Post;

    LastCustomer := TreeArray[i]._ID_CUSTOMER;
   end;

   if TreeArray[i]._IDD <> Last_IDD then begin

    JOMemoryData.Append;
    JOMemoryData.Edit;
    JOMemoryData.FieldByName('CustNameFilter').Value  := LastCustName;

    Flag := True;

    if TreeArray[i]._IDD = -2 then Flag := False // Если это неразнесенный документ
    else begin
     for j := 0 to Length(DogsInfo) - 1 do
      if TreeArray[i]._IDD = DogsInfo[j]._id_Dog then begin
       Flag := False;
       JOMemoryData.FieldByName('RegNum').Value := DogsInfo[j]._Reg_Num;
       Break;
      end;
     end;
    //
    if Flag then begin

     SetLength(DogsInfo, Length(DogsInfo) + 1);
     with DogsInfo[Length(DogsInfo) - 1] do begin
      _id_Dog := TreeArray[i]._IDD;

      DataSet.SelectSQL.Text := 'select * from JO9_GET_DOG_INFO('
      + IntToStr(KEY_SESSION) + ',' + VarToStr(_id_Dog) + ', 1)';

      DataSet.Open;
      if not VarIsNull(DataSet['REG_NUM'])   then _Reg_Num   := DataSet['REG_NUM'];

      if not VarIsNull(DataSet['DATE_DOLG']) then _Date      := DataSet['DATE_DOLG'];

      if not VarIsNull(DataSet['DATE_MOVE']) then _Move_Date := DataSet['DATE_MOVE'];

      if not VarIsNull(DataSet['DATE_DOG'])  then _Date_Dog := DataSet['DATE_DOG'];

      JOMemoryData.FieldByName('RegNum').Value    := _Reg_Num;
      JOMemoryData.FieldByName('Date_Ost').Value  := _Date;
      JOMemoryData.FieldByName('Date_Move').Value := _Move_Date;
      JOMemoryData.FieldByName('Date_Dog').Value := _Date_Dog;

      DataSet.Close;
     end;
    end;

    if TreeArray[i]._ID_CUSTOMER = -2 then JOMemoryData.FieldByName('State').Value  := 'BadDoc';

    JOMemoryData.Post;

    FirstRow := JOMemoryData.RecordCount;
    DbLine   := 0;
    KrLine   := 0;

    Last_IDD := TreeArray[i]._IDD;

    // Добавляю сальдо входящее

    if Length(InOstArray) > 0 then begin
     DbSum  := 0;
     KrSum  := 0;
     id_sch := InOstArray[0].ID_SCH;

     k           := 0;
     Db          := False;
     Kr          := False;
     NeedSummary := False;
     TempProv    := nil;

     while k < Length(InOstArray) do begin
      SetLength(TempProv, Length(TempProv) + 1);
      TempProv[Length(TempProv) - 1] := InOstArray[k];

      if InOstArray[k].IS_DB then begin
        if Db then NeedSummary := True
       else Db := True;
     //  showmessage(Floattostr(InOstArray[k].SUMMA));
       DbSum := DbSum + InOstArray[k].SUMMA;
      end
      else begin
       if Kr then NeedSummary := True
       else Kr := True;

       KrSum := KrSum + InOstArray[k].SUMMA;
      end;

      if (InOstArray[k].ID_SCH <> id_sch) or (k = Length(InOstArray) - 1 ) then begin
       id_sch := InOstArray[k].ID_SCH;
      
       AddOst(FirstRow + 1, DbSum, KrSum, TempProv, NeedSummary, TreeArray[i]._ID_CUSTOMER = -2);

       DbSum       := 0;
       KrSum       := 0;
       NeedSummary := False;
       Db          := False;
       Kr          := False;
      end;

      Inc(k);
     end;
    end;
   end;

   //Добавляю текущие документы

   if Length(ProvBuffArray) > 0 then begin
    // Добавляю дебетовые проводки

    k        := 0;
    DbSum    := 0;
    TempProv := nil;

    while k < Length(ProvBuffArray) do begin
     if ProvBuffArray[k].IS_DB then begin
      DbSum := DbSum + ProvBuffArray[k].SUMMA;

      SetLength(TempProv, Length(TempProv) + 1);
      TempProv[Length(TempProv) - 1] := ProvBuffArray[k];
     end;

     Inc(k);
    end;

    if Length(TempProv) > 0 then begin
     DbLine := Max(DbLine, FirstRow);
     AddDoc(DbLine, DbSum, TempProv, i, TreeArray[i]._ID_CUSTOMER = -2);
    end;

    // Добавляю кредитовые проводки

    k        := 0;
    KrSum    := 0;
    TempProv := nil;

    while k < Length(ProvBuffArray) do begin
     if not ProvBuffArray[k].IS_DB then begin
      KrSum := KrSum + ProvBuffArray[k].SUMMA;

      SetLength(TempProv, Length(TempProv) + 1);
      TempProv[Length(TempProv) - 1] := ProvBuffArray[k];
     end;

     Inc(k);
    end;

    if Length(TempProv) > 0 then begin
     KrLine := Max(KrLine, FirstRow);
     AddDoc(KrLine, KrSum, TempProv, i, TreeArray[i]._ID_CUSTOMER = -2);
    end;
   end;

   // Добавляю сальдо исходящее

   if Length(SaldoOut) > 0 then begin
    DbSum := 0;
    KrSum := 0;

    for j := 0 to Length(SaldoOut) - 1 do
     if SaldoOut[j].OUT_DB then DbSum := DbSum + SaldoOut[j].SUMMA
     else KrSum := KrSum + SaldoOut[j].SUMMA;

    AddSaldo(FirstRow, DbSum, KrSum, SaldoOut, TreeArray[i]._ID_CUSTOMER = -2);
   end;
  end;
  
 except
  raise Exception.Create('Ошибка! Номер строки с ошибкой: ' + IntToStr(i));
 end;
end;

procedure Tjo9_PrintForm.FillPBArray(Ost: boolean; idd, id_Doc: string; Group_By_Sch : boolean = False);
var
 i : integer;
begin
//  showmessage('1');
 if Ost then begin
  InOstArray := nil;

  if Group_By_Sch then
   Query.SelectSQL.Text := 'select ID_SCH, NUM_SCH, IS_DB, sum(SUMMA) as SUMMA '
   + 'from JO9_IN_CUR_PROV_BUFF_SEL(' + IntToStr(KEY_SESSION) + ','
   + idd + ', null, 1) group by ID_SCH, NUM_SCH, IS_DB order by NUM_SCH, kod_st'
  else
   Query.SelectSQL.Text := 'select * from JO9_IN_CUR_PROV_BUFF_SEL(' + IntToStr(KEY_SESSION) + ','
   + idd + ', null, 1) order by NUM_SCH';
//  ShowMessage(IntToStr(KEY_SESSION));
  Query.Open;

  SetLength(InOstArray, Query.RecordCount);

  for i := 0 to Query.RecordCount - 1 do begin
   with InOstArray[i] do begin
    ID_SCH   := Query.FieldByName('ID_SCH').AsInteger;
    KOD_SCH  := Query.FieldByName('NUM_SCH').AsString;

    if not Group_By_Sch then begin
     ID_S     := Query.FieldByName('ID_S').AsInteger;
     ID_R     := Query.FieldByName('ID_R').AsInteger;
     ID_ST    := Query.FieldByName('ID_ST').AsInteger;
     ID_KEKV  := Query.FieldByName('ID_KEKV').AsInteger;
     KOD_S    := Query.FieldByName('KOD_S').AsString;
     KOD_R    := Query.FieldByName('KOD_R').AsString;
     KOD_ST   := Query.FieldByName('KOD_ST').AsString;
     KOD_KEKV := Query.FieldByName('KOD_KEKV').AsString;
    end;

    IS_DB    := Query.FieldByName('IS_DB').AsInteger = 1;
    SUMMA    := Query.FieldByName('SUMMA').AsCurrency;
    OST      := True;
   end;

   Query.Next;
  end;

  Query.Close;
 end
 else begin
  ProvBuffArray := nil;

  if Group_By_Sch then
   Query.SelectSQL.Text := 'select ID_SCH, ID_SCH_COR, NUM_SCH, NUM_SCH_COR, IS_DB, sum(SUMMA) as SUMMA '
   + 'from JO9_IN_CUR_PROV_BUFF_SEL(' + IntToStr(KEY_SESSION) + ','
   + idd + ',' + id_Doc + ', 0) group by ID_SCH, ID_SCH_COR, NUM_SCH, NUM_SCH_COR, IS_DB order by NUM_SCH, NUM_SCH_COR'
  else
   Query.SelectSQL.Text := 'select * from JO9_IN_CUR_PROV_BUFF_SEL(' + IntToStr(KEY_SESSION) + ','
   + idd + ',' + id_Doc + ', 0) order by NUM_SCH, NUM_SCH_COR';

  Query.Open;

  SetLength(ProvBuffArray, Query.RecordCount);

  for i := 0 to Query.RecordCount - 1 do begin
   with ProvBuffArray[i] do begin
    ID_SCH      := Query.FieldByName('ID_SCH').AsInteger;
    ID_SCH_COR  := Query.FieldByName('ID_SCH_COR').AsInteger;
    KOD_SCH     := Query.FieldByName('NUM_SCH').AsString;
    KOD_SCH_COR := Query.FieldByName('NUM_SCH_COR').AsString;

    if not Group_By_Sch then begin
     ID_S        := Query.FieldByName('ID_S').AsInteger;
     ID_R        := Query.FieldByName('ID_R').AsInteger;
     ID_ST       := Query.FieldByName('ID_ST').AsInteger;
     ID_KEKV     := Query.FieldByName('ID_KEKV').AsInteger;
     KOD_S       := Query.FieldByName('KOD_S').AsString;
     KOD_R       := Query.FieldByName('KOD_R').AsString;
     KOD_ST      := Query.FieldByName('KOD_ST').AsString;
     KOD_KEKV    := Query.FieldByName('KOD_KEKV').AsString;
    end;

    IS_DB       := Query.FieldByName('IS_DB').AsInteger = 1;
    SUMMA       := Query.FieldByName('SUMMA').AsCurrency;
    OST         := False;
   end;

   Query.Next;
  end;

  Query.Close;
 end;
end;

procedure Tjo9_PrintForm.FillSaldoOut(idd: string; id_Cust : integer; Name_Cust : string; Group_By_Sch : boolean = False);
var
 db_sum   : currency;
 kr_sum   : currency;

 r_db_sum : currency;
 r_kr_sum : currency;

 i        : integer;
 Flag     : boolean;
begin
 SaldoOut := nil;

 if Group_By_Sch then
  Query.SelectSQL.Text := 'select NUM_SCH, OUT_DB, SUM(SUMMA) as SUMMA from JO9_GET_SALDO_OUT('
  + IntToStr(KEY_SESSION) + ',' + idd + ','+IntToStr(SYS_INFO^._id_Reg_Uch)+') group by NUM_SCH, OUT_DB'
 else
  Query.SelectSQL.Text := 'select * from JO9_GET_SALDO_OUT('
  + IntToStr(KEY_SESSION) + ',' + idd + ','+IntToStr(SYS_INFO^._id_Reg_Uch)+')';

 Query.Open;

 SetLength(SaldoOut, Query.RecordCount);

 for i := 0 to Query.RecordCount - 1 do begin
  with SaldoOut[i] do begin
   NUM_SCH_COR := Query.FieldByName('NUM_SCH').AsString;
   OUT_DB      := Query.FieldByName('OUT_DB').AsInteger = 1;

   if not Group_By_Sch then begin
    KOD_S       := Query.FieldByName('KOD_S').AsInteger;
    KOD_R       := Query.FieldByName('KOD_R').AsInteger;
    KOD_ST      := Query.FieldByName('KOD_ST').AsInteger;
    KOD_KEKV    := Query.FieldByName('KOD_KEKV').AsInteger;
   end;

   SUMMA       := Query.FieldByName('SUMMA').AsCurrency;
  end;

  Query.Next;
 end;

 Query.Close;

 if (StartOfTheMonth(PrintFilter._Date_Beg) = StartOfTheMonth(PrintFilter._Date_End))
 and (PrintFilter._Date_End < SYS_INFO^._Period_Beg) then begin
  Flag := True;
  for i := 0 to Length(WrongCust) - 1 do begin
   if WrongCust[i]._ID_CUSTOMER = id_Cust then begin
    Flag := False;
    Break;
   end;
  end;

  if (Length(PrintFilter._RazdSt) > 0) or (Length(PrintFilter._Smets) > 0) or (Length(PrintFilter._Kekv) > 0)
  or (Length(PrintFilter._CSch) > 0) or (Length(PrintFilter._Note) > 0) then Flag := False;

  if Flag then begin
   Query.SelectSQL.Text := 'select * from JO9_DT_OST_SMET_SEL_BY_IDD(' + idd + ','
   + QuotedStr(DateToStr(StartOfTheMonth(IncMonth(PrintFilter._Date_Beg, 1)))) + ','
   + IntToStr(SYS_INFO._id_Reg_Uch) + ',' + IntToStr(KEY_SESSION) + ')';
   Query.Open;

   db_sum := Query.Fields[0].AsCurrency;
   kr_sum := Query.Fields[1].AsCurrency;

   Query.Close;

   r_db_sum := 0;
   r_kr_sum := 0;
   for i := 0 to Length(SaldoOut) - 1 do begin
    if SaldoOut[i].OUT_DB then
     r_db_sum := r_db_sum + SaldoOut[i].SUMMA
    else
     r_kr_sum := r_kr_sum + SaldoOut[i].SUMMA;
   end;

   if (r_db_sum <> db_sum) or (r_kr_sum <> kr_sum) then begin
    SetLength(WrongCust, Length(WrongCust) + 1);

    WrongCust[Length(WrongCust) - 1]._ID_CUSTOMER := id_Cust;
    WrongCust[Length(WrongCust) - 1]._NAME_CUST   := Name_Cust;
   //ShowMessage(Name_Cust+' '+floattostr(r_db_sum)+' '+floattostr(db_sum)+' '+floattostr(r_kr_sum)+' '+floattostr(kr_sum));
   end;
  end;
 end;
end;

procedure Tjo9_PrintForm.FillSaldoOutId(idd: string);
var
 i : integer;
begin
 SaldoOutId := nil;

 Query.SelectSQL.Text := 'select * from JO9_GET_SALDO_OUT_ID(' + IntToStr(KEY_SESSION)
 + ',' + idd +' , '+ IntToStr(SYS_INFO^._id_Reg_Uch)+')';
 Query.Open;

 SetLength(SaldoOutId, Query.RecordCount);

 for i := 0 to Query.RecordCount - 1 do begin
  with SaldoOutId[i] do begin
   ID_SCH  := Query.FieldByName('ID_SCH').AsInteger;
   OUT_DB  := Query.FieldByName('OUT_DB').AsInteger = 1;
   ID_S    := Query.FieldByName('ID_S').AsInteger;
   ID_R    := Query.FieldByName('ID_R').AsInteger;
   ID_ST   := Query.FieldByName('ID_ST').AsInteger;
   ID_KEKV := Query.FieldByName('ID_KEKV').AsInteger;
   SUMMA   := Query.FieldByName('SUMMA').AsCurrency;
  end;

  Query.Next;
 end;

 Query.Close;
end;

procedure Tjo9_PrintForm.InitConnection(DBhandle: TISC_DB_HANDLE;
  RTransaction: TISC_TR_HANDLE);
begin
 Database.Handle        := DBhandle;
 ReadTransaction.Handle := RTransaction;
end;

procedure Tjo9_PrintForm.PrepareData(DoCalc : boolean);
var
 Res : boolean;
begin
 if not VarIsNull(SYS_INFO._id_Dog_Transfer) or not VarIsNull(SYS_INFO._id_Dog_Transfer_Fix) then begin
  if not ((PrintFilter._Date_Beg > SYS_INFO^._Period_End) or (PrintFilter._Date_End < SYS_INFO^._Period_Beg)) then begin
   try
    Res := DoTransfer;
   except
   end;

   if not Res then ShowMessage('Автоматичне перекидання документів завершено невдачою!');
  end;
 end;

 StoredProc.StoredProcName := 'JO9_REPORT_PREPARE_DATA';
 StoredProc.Prepare;
 StoredProc.ParamByName('KEY_SESSION').AsInt64   := KEY_SESSION;
 StoredProc.ParamByName('DATE_BEG').Value        := PrintFilter._Date_Beg;
 StoredProc.ParamByName('DATE_END').Value        := PrintFilter._Date_End;
 StoredProc.ParamByName('DO_IN_CUR_BUFF').Value  := 0;
 StoredProc.ParamByName('KEY_SESSION_OLD').Value := -1;

 if DoCalc then
  StoredProc.ParamByName('DO_CALC').Value     := 1
 else
  StoredProc.ParamByName('DO_CALC').Value     := 0;

 StoredProc.ParamByName('KOD_SYS').Value       := SYS_INFO^._id_Reg_Uch;

 StoredProc.ExecProc;
end;

function Tjo9_PrintForm.SaveSaldoOut: boolean;
var
 i, j, k  : integer;
 Flag  : boolean;
 Saved : array of int64;

 Num_Doc   : string;
 Date_Doc  : TDate;
 Note      : string;
 Date_Move : TDate;

 RegDate     : TDate;
 DB_Summa    : currency;
 KR_Summa    : currency;

 DB_id_Doc   : integer;
 KR_id_Doc   : integer;

 last_out_db : boolean;
 do_two_docs : boolean;

 _IDD        : int64;
begin
 TreeArray     := nil;

 // Выбираю данные

 DataSet.SelectSQL.Text := 'select * from JO9_TREE_BUFFER where KEY_SESSION=' + IntToStr(KEY_SESSION)
 + ' order by id_customer, idd';
 DataSet.Open;

 SetLength(TreeArray, DataSet.RecordCount);

 k := 0;
 while not DataSet.Eof do begin
  if DataSet['IDD'] = -2 then begin
   ShowMessage('Один або декілька документів системи не рознесені по договорам!'
                + #13 + #13 + 'Неможливо перейти у наступний період!');
   DataSet.Close;
   Exit;
  end;

  with TreeArray[k] do begin
   _ID_CUSTOMER := DataSet['ID_CUSTOMER'];
   _IDD         := DataSet['IDD'];
   _ID_DOC      := DataSet['ID_DOC'];
   _DATE_DOC    := DataSet['DATE_DOC'];
   _NUM_DOC     := DataSet['NUM_DOC'];
  end;

  Inc(k);
  DataSet.Next;
 end;

 DataSet.Close;

// Добавляю остатки

 for i := 0 to Length(TreeArray) - 1 do begin
  Flag := False;
  for j := 0 to Length(Saved) - 1 do
   if Saved[j] = TreeArray[i]._IDD then begin
    Flag := True;
    Break;
   end;

  if not Flag then begin
   SetLength(Saved, Length(Saved) + 1);
   Saved[Length(Saved) - 1] := TreeArray[i]._IDD;
  end
  else Continue;

///////////////////--------------
{//} FillSaldoOutId(TreeArray[i]._IDD);
/////////////////----------------

  if Length(SaldoOutId) = 0 then Continue;

  do_two_docs := False;

  last_out_db := SaldoOutId[0].OUT_DB;
  for j := 1 to Length(SaldoOutId) - 1 do
   if last_out_db <> SaldoOutId[j].OUT_DB then begin
    do_two_docs := True;
    Break;
   end;

  _IDD := TreeArray[i]._IDD;

  DataSet.SelectSQL.Text := 'select * from JO9_GET_SALDO_OUT_INFO('
  + IntToStr(KEY_SESSION) + ',' + IntToStr(_IDD) + ')';

  DataSet.Open;

  Num_Doc   := DataSet.FieldByName('NUM_DOC').AsString;
  Date_Doc  := DataSet.FieldByName('DATE_DOC').AsDateTime;
  Note      := DataSet.FieldByName('NOTE').AsString;
  Date_Move := DataSet.FieldByName('DATE_MOVE').AsDateTime;

  DataSet.Close;

  DB_Summa := 0;
  KR_Summa := 0;
  for j := 0 to Length(SaldoOutId) - 1 do begin
   if SaldoOutId[j].OUT_DB then DB_Summa := DB_Summa + SaldoOutId[j].SUMMA
   else KR_Summa := KR_Summa + SaldoOutId[j].SUMMA;
  end;

  if SYS_INFO^._Month + 1 > 12 then
   RegDate := EncodeDate(SYS_INFO^._Year + 1, 1, 1)
  else
   RegDate := EncodeDate(SYS_INFO^._Year, SYS_INFO^._Month + 1, 1);

  if SaldoOutId[0].OUT_DB or do_two_docs then begin
   StoredProc.StoredProcName := 'JO9_DT_OST_DOC_ADD';
   StoredProc.Prepare;

   StoredProc.ParamByName('KREDIT').AsString     := '0';
   StoredProc.ParamByName('KOD_SYS').AsInteger   := SYS_INFO^._id_Reg_Uch;
   StoredProc.ParamByName('DATE_REG').AsDate     := RegDate;
   StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := TreeArray[i]._ID_CUSTOMER;
   StoredProc.ParamByName('NUM_DOC').AsString    := Num_Doc;
   StoredProc.ParamByName('DATE_DOC').AsDate     := Date_Doc;
   StoredProc.ParamByName('OPL_DATE').AsDate     := Date_Move;
   StoredProc.ParamByName('SUMMA').AsCurrency    := DB_Summa;
   StoredProc.ParamByName('NOTE').AsString       := Note;
   StoredProc.ParamByName('ID_SERVER').AsInteger := SYS_INFO^._id_Server;
   StoredProc.ParamByName('HAND_ADD').AsString   := '0';
   StoredProc.ParamByName('ID_USER').AsInteger   := SYS_INFO^._id_User;
   StoredProc.ParamByName('COMPUTER').AsString   := SYS_INFO^._Comp_Name;

   StoredProc.ExecProc;

   DB_id_Doc := StoredProc.FldByName['ID_DOC'].AsInteger;
  end;

  if not SaldoOutId[0].OUT_DB or do_two_docs then begin
   StoredProc.StoredProcName := 'JO9_DT_OST_DOC_ADD';
   StoredProc.Prepare;

   StoredProc.ParamByName('KREDIT').AsString     := '1';
   StoredProc.ParamByName('KOD_SYS').AsInteger   := SYS_INFO^._id_Reg_Uch;
   StoredProc.ParamByName('DATE_REG').AsDate     := RegDate;
   StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := TreeArray[i]._ID_CUSTOMER;
   StoredProc.ParamByName('NUM_DOC').AsString    := Num_Doc;
   StoredProc.ParamByName('DATE_DOC').AsDate     := Date_Doc;
   StoredProc.ParamByName('OPL_DATE').AsDate     := Date_Move;
   StoredProc.ParamByName('SUMMA').AsCurrency    := KR_Summa;
   StoredProc.ParamByName('NOTE').AsString       := Note;
   StoredProc.ParamByName('ID_SERVER').AsInteger := SYS_INFO^._id_Server;
   StoredProc.ParamByName('HAND_ADD').AsString   := '0';
   StoredProc.ParamByName('ID_USER').AsInteger   := SYS_INFO^._id_User;
   StoredProc.ParamByName('COMPUTER').AsString   := SYS_INFO^._Comp_Name;

   StoredProc.ExecProc;

   KR_id_Doc := StoredProc.FldByName['ID_DOC'].AsInteger;
  end;

  for j := 0 to Length(SaldoOutId) - 1 do begin
   StoredProc1.StoredProcName := 'JO9_DT_OST_SMET_ADD';
   StoredProc1.Prepare;

   if SaldoOutId[j].OUT_DB then
    StoredProc1.ParamByName('ID_DOC').AsInteger  := DB_id_Doc
   else
    StoredProc1.ParamByName('ID_DOC').AsInteger  := KR_id_Doc;

   StoredProc1.ParamByName('ID_DOG').AsInt64    := TreeArray[i]._IDD;
   StoredProc1.ParamByName('KOD_DOG').AsInt64   := TreeArray[i]._IDD;
   StoredProc1.ParamByName('ID_SCH').AsInteger  := SaldoOutId[j].ID_SCH;
   StoredProc1.ParamByName('ID_SM').AsInteger   := SaldoOutId[j].ID_S;
   StoredProc1.ParamByName('ID_RZ').AsInteger   := SaldoOutId[j].ID_R;
   StoredProc1.ParamByName('ID_ST').AsInteger   := SaldoOutId[j].ID_ST;
   StoredProc1.ParamByName('ID_KEKV').AsInteger := SaldoOutId[j].ID_KEKV;
   StoredProc1.ParamByName('SUMMA'). AsCurrency := SaldoOutId[j].SUMMA;

   StoredProc1.ExecProc;
  end;
 end;

 Result := True;
end;

procedure Tjo9_PrintForm.SetSummary;
var
 k, i   : integer;

 In_Db  : currency;
 In_Kr  : currency;
 Cur_Db : currency;
 Cur_Kr : currency;
 Out_Db : currency;
 Out_Kr : currency;

 t_In_Db  : currency;
 t_In_Kr  : currency;
 t_Cur_Db : currency;
 t_Cur_Kr : currency;
 t_Out_Db : currency;
 t_Out_Kr : currency;

 has_bad_doc  : boolean;
 Sum    : TSummaryArray;
 Flag   : boolean;

 last_type : integer;
 go_to     : integer;

 s      : string;
begin
 In_Db  := 0;
 In_Kr  := 0;
 Cur_Db := 0;
 Cur_Kr := 0;
 Out_Db := 0;
 Out_Kr := 0;

 t_In_Db  := 0;
 t_In_Kr  := 0;
 t_Cur_Db := 0;
 t_Cur_Kr := 0;
 t_Out_Db := 0;
 t_Out_Kr := 0;

 LastCustName := '';

 last_type := -1;

 Sum := nil;

 k := 1;

 if JOMemoryData.RecordCount > 0 then Step := 10 / JOMemoryData.RecordCount;

 while k <= JOMemoryData.RecordCount + 1 do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  LastCustName := JOMemoryData.FieldByName('CustNameFilter').Value;

  JOMemoryData.RecNo := k;

  if JOMemoryData.FieldByName('State').Value = 'BadDoc' then has_bad_doc := True;

  if not VarIsNull(JOMemoryData.FieldByName('State').Value) or (k = JOMemoryData.RecordCount + 1) then begin
   if k = 1 then begin
    Inc(k);
    Continue;
   end;

   if JOMemoryData.FieldByName('State').Value = 'NameTypeDog' then begin
    if last_type <> -1 then begin
     go_to := JOMemoryData.RecNo;

     JOMemoryData.RecNo := last_type;

     JOMemoryData.Edit;

     JOMemoryData.FieldByName('In_Db').Value  := DoCurrFormat(FloatToStrF(t_In_Db, ffFixed,  100, 2));
     JOMemoryData.FieldByName('In_Kr').Value  := DoCurrFormat(FloatToStrF(t_In_Kr, ffFixed,  100, 2));
     JOMemoryData.FieldByName('Db_Sum').Value := DoCurrFormat(FloatToStrF(t_Cur_Db, ffFixed, 100, 2));
     JOMemoryData.FieldByName('Kr_Sum').Value := DoCurrFormat(FloatToStrF(t_Cur_Kr, ffFixed, 100, 2));
     JOMemoryData.FieldByName('Out_Db').Value := DoCurrFormat(FloatToStrF(t_Out_Db, ffFixed, 100, 2));
     JOMemoryData.FieldByName('Out_Kr').Value := DoCurrFormat(FloatToStrF(t_Out_Kr, ffFixed,  100, 2));

     JOMemoryData.Post;

     t_In_Db  := 0;
     t_In_Kr  := 0;
     t_Cur_Db := 0;
     t_Cur_Kr := 0;
     t_Out_Db := 0;
     t_Out_Kr := 0;

     JOMemoryData.RecNo := go_to;
    end;

    last_type := JOMemoryData.RecNo;
   end;

   if (k = JOMemoryData.RecordCount + 1) then JOMemoryData.Append
   else JOMemoryData.Insert;


   JOMemoryData.FieldByName('State').Value  := 'Summs';
   JOMemoryData.FieldByName('In_Db').Value  := DoCurrFormat(FloatToStrF(In_Db, ffFixed,  100, 2));
   JOMemoryData.FieldByName('In_Kr').Value  := DoCurrFormat(FloatToStrF(In_Kr, ffFixed,  100, 2));
   JOMemoryData.FieldByName('Db_Sum').Value := DoCurrFormat(FloatToStrF(Cur_Db, ffFixed, 100, 2));
   JOMemoryData.FieldByName('Kr_Sum').Value := DoCurrFormat(FloatToStrF(Cur_Kr, ffFixed, 100, 2));
   JOMemoryData.FieldByName('Out_Db').Value := DoCurrFormat(FloatToStrF(Out_Db, ffFixed, 100, 2));
   JOMemoryData.FieldByName('Out_Kr').Value := DoCurrFormat(FloatToStrF(Out_Kr, ffFixed,  100, 2));

   JOMemoryData.FieldByName('CustNameFilter').Value  := LastCustName;

   JOMemoryData.Post;

   In_Db  := 0;
   In_Kr  := 0;
   Cur_Db := 0;
   Cur_Kr := 0;
   Out_Db := 0;
   Out_Kr := 0;

   Inc(k, 2);
  end
  else begin
   if not VarIsNull(JOMemoryData.FieldByName('In_Sch').Value) then begin
    if not VarIsNull(JOMemoryData.FieldByName('In_Db').Value)  then In_Db  := In_Db  + StrToCurr(AnsiReplaceStr(JOMemoryData.FieldByName('In_Db').Value, ThousandSeparator, ''));
    if not VarIsNull(JOMemoryData.FieldByName('In_Kr').Value)  then In_Kr  := In_Kr  + StrToCurr(AnsiReplaceStr(JOMemoryData.FieldByName('In_Kr').Value, ThousandSeparator, ''));
   end;

   if not VarIsNull(JOMemoryData.FieldByName('Db_Doc').Value) then
    if not VarIsNull(JOMemoryData.FieldByName('Db_Sum').Value) then Cur_Db := Cur_Db + StrToCurr(AnsiReplaceStr(JOMemoryData.FieldByName('Db_Sum').Value, ThousandSeparator, ''));

   if not VarIsNull(JOMemoryData.FieldByName('Kr_Doc').Value) then
    if not VarIsNull(JOMemoryData.FieldByName('Kr_Sum').Value) then Cur_Kr := Cur_Kr + StrToCurr(AnsiReplaceStr(JOMemoryData.FieldByName('Kr_Sum').Value, ThousandSeparator, ''));

   if not (VarIsNull(JOMemoryData.FieldByName('Out_Sch').Value) and VarIsNull(JOMemoryData.FieldByName('Out_S').Value)
   and VarIsNull(JOMemoryData.FieldByName('Out_R').Value) and VarIsNull(JOMemoryData.FieldByName('Out_St').Value)
   and VarIsNull(JOMemoryData.FieldByName('Out_Kekv').Value)) then begin
    if not VarIsNull(JOMemoryData.FieldByName('Out_Db').Value) then Out_Db := Out_Db + StrToCurr(AnsiReplaceStr(JOMemoryData.FieldByName('Out_Db').Value, ThousandSeparator, ''));
    if not VarIsNull(JOMemoryData.FieldByName('Out_Kr').Value) then Out_Kr := Out_Kr + StrToCurr(AnsiReplaceStr(JOMemoryData.FieldByName('Out_Kr').Value, ThousandSeparator, ''));
   end;

   // А это итоги по всему журналу формирую
        // In
   if not VarIsNull(JOMemoryData.FieldByName('In_Sch').Value) then begin
    Flag := True;
    for i := 0 to Length(Sum) - 1 do
     if Sum[i]._Num_Sch = JOMemoryData.FieldByName('In_Sch').Value then begin
      Flag := False;
      Break;
     end;

    if Flag then begin
     SetLength(Sum, Length(Sum) + 1);
     Sum[Length(Sum) - 1]._Num_Sch := JOMemoryData.FieldByName('In_Sch').Value;
     i := Length(Sum) - 1;

     Sum[i]._In_db  := 0;
     Sum[i]._In_kr  := 0;
     Sum[i]._Cur_db := 0;
     Sum[i]._Cur_kr := 0;
     Sum[i]._Out_db := 0;
     Sum[i]._Out_kr := 0;
    end;

    if not VarIsNull(JOMemoryData.FieldByName('In_Db').Value) then Sum[i]._In_db := Sum[i]._In_db + StrToCurr(AnsiReplaceStr(JOMemoryData.FieldByName('In_Db').Value, ThousandSeparator, ''));
    if not VarIsNull(JOMemoryData.FieldByName('In_Kr').Value) then Sum[i]._In_kr := Sum[i]._In_kr + StrToCurr(AnsiReplaceStr(JOMemoryData.FieldByName('In_Kr').Value, ThousandSeparator, ''));
   end;

        // Cur_Db
   if not VarIsNull(JOMemoryData.FieldByName('Db_Sch_Db').Value) then begin
    Flag := True;
    for i := 0 to Length(Sum) - 1 do
     if Sum[i]._Num_Sch = JOMemoryData.FieldByName('Db_Sch_Db').Value then begin
      Flag := False;
      Break;
     end;

    if Flag then begin
     SetLength(Sum, Length(Sum) + 1);
     Sum[Length(Sum) - 1]._Num_Sch := JOMemoryData.FieldByName('Db_Sch_Db').Value;
     i := Length(Sum) - 1;

     Sum[i]._In_db  := 0;
     Sum[i]._In_kr  := 0;
     Sum[i]._Cur_db := 0;
     Sum[i]._Cur_kr := 0;
     Sum[i]._Out_db := 0;
     Sum[i]._Out_kr := 0;
    end;

    if not VarIsNull(JOMemoryData.FieldByName('Db_Sum').Value) then Sum[i]._Cur_db := Sum[i]._Cur_db + StrToCurr(AnsiReplaceStr(JOMemoryData.FieldByName('Db_Sum').Value, ThousandSeparator, ''));
   end;

      // CurKr

   if not VarIsNull(JOMemoryData.FieldByName('Kr_Sch_Kr').Value) then begin
    Flag := True;
    for i := 0 to Length(Sum) - 1 do
     if Sum[i]._Num_Sch = JOMemoryData.FieldByName('Kr_Sch_Kr').Value then begin
      Flag := False;
      Break;
     end;

    if Flag then begin
     SetLength(Sum, Length(Sum) + 1);
     Sum[Length(Sum) - 1]._Num_Sch := JOMemoryData.FieldByName('Kr_Sch_Kr').Value;
     i := Length(Sum) - 1;

     Sum[i]._In_db  := 0;
     Sum[i]._In_kr  := 0;
     Sum[i]._Cur_db := 0;
     Sum[i]._Cur_kr := 0;
     Sum[i]._Out_db := 0;
     Sum[i]._Out_kr := 0;
    end;

    if not VarIsNull(JOMemoryData.FieldByName('Kr_Sum').Value) then Sum[i]._Cur_kr := Sum[i]._Cur_kr + StrToCurr(AnsiReplaceStr(JOMemoryData.FieldByName('Kr_Sum').Value, ThousandSeparator, ''));
   end;

      // Out

   if not VarIsNull(JOMemoryData.FieldByName('Out_Sch').Value) then begin
    Flag := True;
    for i := 0 to Length(Sum) - 1 do
     if Sum[i]._Num_Sch = JOMemoryData.FieldByName('Out_Sch').Value then begin
      Flag := False;
      Break;
     end;

    if Flag then begin
     SetLength(Sum, Length(Sum) + 1);
     Sum[Length(Sum) - 1]._Num_Sch := JOMemoryData.FieldByName('Out_Sch').Value;
     i := Length(Sum) - 1;

     Sum[i]._In_db  := 0;
     Sum[i]._In_kr  := 0;
     Sum[i]._Cur_db := 0;
     Sum[i]._Cur_kr := 0;
     Sum[i]._Out_db := 0;
     Sum[i]._Out_kr := 0;
    end;

    if not VarIsNull(JOMemoryData.FieldByName('Out_Db').Value) then Sum[i]._Out_db := Sum[i]._Out_db + StrToCurr(AnsiReplaceStr(JOMemoryData.FieldByName('Out_Db').Value, ThousandSeparator, ''));
    if not VarIsNull(JOMemoryData.FieldByName('Out_Kr').Value) then Sum[i]._Out_kr := Sum[i]._Out_kr + StrToCurr(AnsiReplaceStr(JOMemoryData.FieldByName('Out_Kr').Value, ThousandSeparator, ''));
   end;

   Inc(k);
  end;
 end;

 // Заполняю итоги по журналу

 JOTotalsMData.EmptyTable;

 for i := 0 to Length(Sum) - 1 do begin
  JOTotalsMData.Append;
  JOTotalsMData.Edit;

  JOTotalsMData.FieldByName('Num_Sch').Value := Sum[i]._Num_Sch;
  JOTotalsMData.FieldByName('In_Db').Value   := DoCurrFormat(FloatToStrF(Sum[i]._In_db, ffFixed, 100, 2));
  JOTotalsMData.FieldByName('In_Kr').Value   := DoCurrFormat(FloatToStrF(Sum[i]._In_kr, ffFixed, 100, 2));
  JOTotalsMData.FieldByName('Cur_Db').Value  := DoCurrFormat(FloatToStrF(Sum[i]._Cur_db, ffFixed, 100, 2));
  JOTotalsMData.FieldByName('Cur_Kr').Value  := DoCurrFormat(FloatToStrF(Sum[i]._Cur_kr, ffFixed, 100, 2));
  JOTotalsMData.FieldByName('Out_Db').Value  := DoCurrFormat(FloatToStrF(Sum[i]._Out_db, ffFixed, 100, 2));
  JOTotalsMData.FieldByName('Out_Kr').Value  := DoCurrFormat(FloatToStrF(Sum[i]._Out_kr, ffFixed, 100, 2));

  JOTotalsMData.Post;
 end;

 JOTotalsMData.First;

 if has_bad_doc then ShowMessage('Увага!!!' + #13 + #13 + 'Один або декілька документів не рознесено по договорам!');


 // Вывожу сообщение о расхождении сальдо исходящего расчитанного с сохраненным в базе
 if Length(WrongCust) > 0 then begin
  s := 'У нижче перелікованих контрагентів по одному або декількох договорах розраховане сальдо (за бюджетами) вихідне '
  + ' не збігається із збереженим!' + #13 + #13 + 'Перелік контрагентів:';

  for i := 0 to Length(WrongCust) - 1 do
   s := s + #13 + WrongCust[i]._NAME_CUST;

  ShowMessage(s);
 end;
end;

procedure Tjo9_PrintForm.ReportGetValue(const VarName: String;
  var Value: Variant);
var
 s : string;
 i : integer;
 id_report :integer;
begin
//if  PrintFilter._PrintKind <> JO9_AKT_SVERKI then
//begin
 if VarName = 'sch_number' then
 begin
  Value:= sch_empty;
 end;

 if VarName = 'Period' then begin
  if YearOf(PrintFilter._Date_Beg) = YearOf(PrintFilter._Date_End) then begin
   if MonthOf(PrintFilter._Date_Beg) = MonthOf(PrintFilter._Date_End) then
    Value := 'за ' + GetMonthName(MonthOf(PrintFilter._Date_Beg)) + ' ' + IntToStr(YearOf(PrintFilter._Date_Beg)) + ' р.'
   else
    Value := 'за ' + GetMonthName(MonthOf(PrintFilter._Date_Beg)) + ' - ' + GetMonthName(MonthOf(PrintFilter._Date_End))
    + ' ' + IntToStr(YearOf(PrintFilter._Date_Beg)) + ' р.';
  end
  else begin
   Value := 'за ' + GetMonthName(MonthOf(PrintFilter._Date_Beg)) + ' ' + IntToStr(YearOf(PrintFilter._Date_Beg)) + ' р.'
   + ' - ' + GetMonthName(MonthOf(PrintFilter._Date_End)) + ' ' + IntToStr(YearOf(PrintFilter._Date_End)) + ' р.';
  end;
 end 
 else if VarName = 'Col_Header' then begin
  if PrintFilter._is_Kredit then Value := 'Кредитові документи'
  else Value := 'Дебетові документи';

  if not PrintFilter._PrintCurDoc then Value := Value + ' ( у залишках )';
 end
 else if VarName = 'System' then Value := SYS_INFO^._Name_Sys
 else if VarName = 'Jo9Title' then Value := SYS_INFO^._Sys_Caption
 else if VarName = 'Visa' then Value := SYS_INFO^._Name_Org + #13 + DateToStr(Now)
 else if VarName = 'Filter' then begin
  s := '';

  if Length(PrintFilter._Customers) > 0 then begin
   if s <> '' then s := s + ', ';
   s := s + 'на контрагентів';
  end;

  if Length(PrintFilter._Smets) > 0 then begin
   if s <> '' then s := s + ', ';
   s := s + 'на кошторис';
  end;

  if Length(PrintFilter._Kekv) > 0 then begin
   if s <> '' then s := s + ', ';
   s := s + 'на КЕКВ';
  end;

  if Length(PrintFilter._NSch) > 0 then begin
   if s <> '' then s := s + ', ';
   s := s + 'на рахунки системи';
  end;

  if Length(PrintFilter._CSch) > 0 then begin
   if s <> '' then s := s + ', ';
   s := s + 'на кореспондуючі рахунки';
  end;

  if Length(PrintFilter._Note) > 0 then begin
   if s <> '' then s := s + ', ';
   s := s + 'на підставу';
  end;

  if s <> '' then Value := 'Фільтр: ' + s
  else Value := '';
 end
 else
   if VarName = 'Author' then
   begin
     if SYS_INFO^._Name_User <> '' then
       Value := '/' + SYS_INFO^._Name_User + '/'
     else
       Value := '';
   end
 else if VarName = 'Sch_Name' then begin
  if PrintFilter._is_Kredit then Value := ' кредита '
  else Value := ' дебета ';

  if Length(NSch) = 1 then
   Value := Value + NSch[0]._Num_Sch + ' рахунка'
  else if Length(NSch) > 1 then
   Value := Value + 'рахунків';
 end
 else if VarName = 'KOD_FST' then begin
  if PrintFilter._Gr[1] = 0 then Value := 'Код кошторису'
  else if PrintFilter._Gr[1] = 1 then Value := 'Код розділу'
  else if PrintFilter._Gr[1] = 2 then Value := 'Код статті'
  else if PrintFilter._Gr[1] = 3 then Value := 'Код КЕКВа';
 end
 else if VarName = 'NAME_FST' then begin
  if PrintFilter._Gr[1] = 0 then Value := 'Назва кошторису'
  else if PrintFilter._Gr[1] = 1 then Value := 'Назва розділу'
  else if PrintFilter._Gr[1] = 2 then Value := 'Назва статті'
  else if PrintFilter._Gr[1] = 3 then Value := 'Назва КЕКВа';
 end
 else if VarName = 'KOD_SND' then begin
  if PrintFilter._Gr[2] = 0 then Value := 'Кошт.'
  else if PrintFilter._Gr[2] = 1 then Value := 'Розд.'
  else if PrintFilter._Gr[2] = 2 then Value := 'Стат.'
  else if PrintFilter._Gr[2] = 3 then Value := 'КЕКВ';
 end
 else if VarName = 'KOD_TRD' then begin
  if PrintFilter._Gr[3] = 0 then Value := 'Кошт.'
  else if PrintFilter._Gr[3] = 1 then Value := 'Розд.'
  else if PrintFilter._Gr[3] = 2 then Value := 'Стат.'
  else if PrintFilter._Gr[3] = 3 then Value := 'КЕКВ';
 end
 else if VarName = 'KOD_FTH' then begin
  if PrintFilter._Gr[4] = 0 then Value := 'Кошт.'
  else if PrintFilter._Gr[4] = 1 then Value := 'Розд.'
  else if PrintFilter._Gr[4] = 2 then Value := 'Стат.'
  else if PrintFilter._Gr[4] = 3 then Value := 'КЕКВ';
 end
 else if VarName = 'Ost_Period' then Value := EncodeDate(PrintFilter._OstYear, PrintFilter._OstMonth, 1)
 else if VarName = 'DbKr' then begin
  if PrintFilter._is_Kredit then Value := 'Кредиторська'
  else Value := 'Дебеторська';
 end
 else if VarName = 'Cell' then Value := Ost_Report_Get_Value(False)
 else if VarName = 'HeaderCell' then Value := Ost_Report_Get_Value(True)
 else if VarName = 'MO_Letters' then begin
  s := '';
  for i := 0 to Length(PrintFilter._MO_Sel) - 1 do begin
   if i = 0 then s := ': '
   else s := s + ', ';

   s := s + PrintFilter._MO_Sel[i]._MO_Char;
  end;

  Value := s;
 end
 else if VarName = 'MO_PKV_TF' then begin
  s := '';
  for i := 0 to Length(PrintFilter._MO_Sel) - 1 do begin
   if i > 0 then s := s + #13;

   s := s + PrintFilter._MO_Sel[i]._MO_Char + ': ' + PrintFilter._MO_Sel[i]._kod_PKV + '/' + PrintFilter._MO_Sel[i]._kod_Type_Fin;
  end;

  Value := s;
 end
 else if VarName = 'TotalSumma' then Value := DoCurrFormat(FloatToStrF(DocTotalSumma, ffFixed, 100, 2));

 if VarName= 'GlBuhg' then
 begin
   DataSet.Close;
   DataSet.SelectSQL.Text := 'SELECT GLAV_BUHG FROM Z_SETUP';
   DataSet.Open;
   if (DataSet['GLAV_BUHG']<>null)then
     Value:='/'+DataSet['GLAV_BUHG']+'/'
   else
     Value := '';
   DataSet.Close;
   // showmessage(SYS_INFO^._Name_Org+'  '+inttostr(SYS_INFO^._id_Reg_Uch));
  // if ((SYS_INFO^._Name_Org='НАУ ХАІ')and(SYS_INFO^._id_Reg_Uch=31499)and (SYS_INFO^._id_User=62791)) then Value := '/ Колєснікова Таміла Матвіївна /';
 end;

 if VarName='NameFirm' then
   Value:= SYS_INFO._Name_Org;

 if ((PrintFilter._PrintKind=JO9_REPORT_MAIN_MO_2011) or (PrintFilter._PrintKind=JO9_REPORT_MAIN_MO_BASE_2011)) then
   id_report:=14;

 if PrintFilter._PrintKind=JO9_AKT_SVERKI then
   id_report:=15;

 if VarName= 'EDRPOU' then
 begin
   DataSet.Close;
   DataSet.SelectSQL.Text := 'SELECT * FROM Z_SETUP';
   DataSet.Open;
   if (DataSet['OKPO']<>null)then
     Value:=DataSet['OKPO']
   else
     Value := '';
   DataSet.Close;
 end;

 if VarName= 'TypeForm' then
 begin
   DataSet.Close;
   DataSet.SelectSQL.Text := 'SELECT * FROM JO9_REPORTS_PRINT_CAPTION_S('+IntToStr(id_report)+', :kod_sys)';    //showmessage(DataSet.SelectSQL.Text);
   DataSet.Prepare;
   DataSet.ParamByName('kod_sys').asstring:=KOD_SYS;
   DataSet.Open;
   if (DataSet['TYPE_FORM']<>null)then
     Value:=DataSet['TYPE_FORM']
   else
     Value := '';
   DataSet.Close;
 end;

 if VarName= 'NakazForm' then
 begin
   DataSet.Close;
   DataSet.SelectSQL.Text := 'SELECT * FROM JO9_REPORTS_PRINT_CAPTION_S('+IntToStr(id_report)+', :kod_sys)';    //showmessage(DataSet.SelectSQL.Text);
   DataSet.Prepare;
   DataSet.ParamByName('kod_sys').asstring:=KOD_SYS;
   DataSet.Open;
   if (DataSet['NAKAZ_FORM']<>null)then
     Value:=DataSet['NAKAZ_FORM']
   else
     Value := '';
   DataSet.Close;
 end;

 if VarName= 'Jo9Header' then
 begin
   DataSet.Close;
   DataSet.SelectSQL.Text := 'SELECT * FROM JO9_REPORTS_PRINT_CAPTION_S('+IntToStr(id_report)+', :kod_sys)';    //showmessage(DataSet.SelectSQL.Text);
   DataSet.Prepare;
   DataSet.ParamByName('kod_sys').asstring:=KOD_SYS;
   DataSet.Open;
   if (DataSet['REPORT_HEADER']<>null)then
     Value:=DataSet['REPORT_HEADER']
   else
     Value := '';
   DataSet.Close;
 end;

 if VarName= 'Footer1' then
 begin
   DataSet.Close;
   DataSet.SelectSQL.Text := 'SELECT * FROM JO9_REPORTS_PRINT_CAPTION_S('+IntToStr(id_report)+', :kod_sys)';    //showmessage(DataSet.SelectSQL.Text);
   DataSet.Prepare;
   DataSet.ParamByName('kod_sys').asstring:=KOD_SYS;
   DataSet.Open;
   if (DataSet['FOOTER1']<>null)then
     Value:=DataSet['FOOTER1']
   else
     Value := '';
   DataSet.Close;
 end;

 if VarName= 'Footer2' then
 begin

   DataSet.Close;
   DataSet.SelectSQL.Text := 'SELECT * FROM JO9_REPORTS_PRINT_CAPTION_S('+IntToStr(id_report)+', :kod_sys)';    //showmessage(DataSet.SelectSQL.Text);
   DataSet.Prepare;
   DataSet.ParamByName('kod_sys').asstring:=KOD_SYS;
   DataSet.Open;

   if (DataSet['FOOTER2']<>null)then
     Value:=DataSet['FOOTER2']
   else
     Value := '';
   DataSet.Close;
 end;

 if VarName= 'CurDate' then
 begin
   Value :=IntToStr(DayOf(Date))+' '+KodSetupToLitFormat(DateToKodSetup(Date),pRoditelny);
 end;
//end;

end;

procedure Tjo9_PrintForm.CancelButtonClick(Sender: TObject);
begin
 if fsModal in FormState then ModalResult := mrCancel
 else Close;
end;

procedure Tjo9_PrintForm.Print_Sch_Report;
var
 TempArray : TSchArray;
 PrintSch  : TPrintSchArray;
 i, j, k   : integer;
 IN_DB     : currency;
 IN_KR     : currency;
 CUR_DB    : currency;
 CUR_KR    : currency;
 OUT_DB    : currency;
 OUT_KR    : currency;

 Line_DB   : integer;
 Line_KR   : integer;

 Flag      : boolean;

 last_sch  : integer;
begin

 PrepareData(False);

 if PrintFilter._GroupByTypeDog then
  DataSet.SelectSQL.Text := 'select * from JO9_IN_CUR_BUFF_SEL_SCH('
  + IntToStr(KEY_SESSION) + ',1) order by NUM_TYPE_DOG'
 else
  DataSet.SelectSQL.Text := 'select * from JO9_IN_CUR_BUFF_SEL_SCH('
  + IntToStr(KEY_SESSION) + ',0)';

 DataSet.Open;

 while not DataSet.Eof do begin
  Flag := (Length(PrintFilter._NSch) = 0);

  for i := 0 to Length(PrintFilter._NSch) - 1 do
   if PrintFilter._NSch[i]._id_Sch = DataSet['ID_SCH'] then begin
    Flag := True;
    Break;
   end;

  if Flag then begin
   SetLength(TempArray, Length(TempArray) + 1);

   TempArray[Length(TempArray) - 1]._id_Sch := DataSet['ID_SCH'];

   if PrintFilter._GroupByTypeDog then begin
    TempArray[Length(TempArray) - 1]._id_Type_Dog   := DataSet['ID_TYPE_DOG'];
    TempArray[Length(TempArray) - 1]._Num_Type_Dog  := DataSet['NUM_TYPE_DOG'];
    TempArray[Length(TempArray) - 1]._Name_Type_Dog := DataSet['NAME_TYPE_DOG'];
   end
   else TempArray[Length(TempArray) - 1]._id_Type_Dog := 0;
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 for i := 0 to Length(TempArray) - 1 do begin
  DataSet.SelectSQL.Text := 'select * from PUB_SP_MAIN_SCH_INFO('
  + QuotedStr(DateToStr(PrintFilter._Date_Beg))
  + ',' + IntToStr(TempArray[i]._id_Sch) + ')';

  DataSet.Open;

  TempArray[i]._Num_Sch  := DataSet['SCH_NUMBER'];
  TempArray[i]._Name_Sch := DataSet['SCH_TITLE'];

  DataSet.Close;
 end;

 /////////---------->>>>>   Выбираю входящие остатки

 if PrintFilter._GroupByTypeDog then
  DataSet.SelectSQL.Text := 'select * from JO9_PRINT_SCH_SEL_IN(' + IntToStr(KEY_SESSION) + ',1)'
 else
  DataSet.SelectSQL.Text := 'select * from JO9_PRINT_SCH_SEL_IN(' + IntToStr(KEY_SESSION) + ',0)';

 DataSet.Open;

 if DataSet.RecordCount > 0 then Step := 20 / DataSet.RecordCount;

 while not DataSet.Eof do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  if not VarIsNull(DataSet['DB_SUM']) then begin
   SetLength(PrintSch, Length(PrintSch) + 1);

   with PrintSch[Length(PrintSch) - 1] do begin
    _Kind          := 'IN_DB';
    _id_Sch_Native := DataSet['ID_SCH'];

    _Summa         := DataSet['DB_SUM'];

    if PrintFilter._GroupByTypeDog then _id_Type_Dog := DataSet['ID_TYPE_DOG']
    else _id_Type_Dog := 0;
   end;
  end;

  if not VarIsNull(DataSet['KR_SUM']) then begin
   SetLength(PrintSch, Length(PrintSch) + 1);

   with PrintSch[Length(PrintSch) - 1] do begin
    _Kind          := 'IN_KR';
    _id_Sch_Native := DataSet['ID_SCH'];
    _Summa         := DataSet['KR_SUM'];

    if PrintFilter._GroupByTypeDog then _id_Type_Dog := DataSet['ID_TYPE_DOG']
    else _id_Type_Dog := 0;
   end;
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 ///////------------->>>>>>>   Выбираю текущие документы

 if PrintFilter._GroupByTypeDog then
  DataSet.SelectSQL.Text := 'select * from JO9_PRINT_SCH_SEL_CUR('
  + IntToStr(KEY_SESSION) + ',' + QuotedStr(DateToStr(PrintFilter._Date_Beg)) + ',1)'
 else
 begin

  DataSet.SelectSQL.Text := 'select * from JO9_PRINT_SCH_SEL_CUR('
  + IntToStr(KEY_SESSION) + ',' + QuotedStr(DateToStr(PrintFilter._Date_Beg)) + ',0)';
  end;
 DataSet.Open;

 if DataSet.RecordCount > 0 then Step := 20 / DataSet.RecordCount;

 while not DataSet.Eof do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  SetLength(PrintSch, Length(PrintSch) + 1);

  with PrintSch[Length(PrintSch) - 1] do begin
   if DataSet['IS_DB'] = 1 then _Kind := 'CUR_DB'
   else _Kind := 'CUR_KR';

   _id_Sch_Native := DataSet.FieldByName('ID_SCH').AsInteger;
   _id_Sch_Cor    := DataSet.FieldByName('ID_SCH_COR').AsInteger;
   _Num_Sch_C     := DataSet.FieldByName('NUM_SCH_COR').AsString;
   _Name_Sch_C    := DataSet.FieldByName('NAME_SCH_COR').AsString;
   _Summa         := DataSet.FieldByName('SUMMA').AsCurrency;
   _is_turnover   := DataSet.FieldByName('IS_TURNOVER').AsInteger;
   
   if PrintFilter._GroupByTypeDog then _id_Type_Dog := DataSet.FieldByName('ID_TYPE_DOG').AsInteger
   else _id_Type_Dog := 0;
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 // Выбираю исходящие остатки

    // Пускаю процедуру CALC
 StoredProc.StoredProcName := 'JO9_IN_CUR_BUFF_CALC';
 StoredProc.Prepare;
 StoredProc.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
 StoredProc.ExecProc;

 if PrintFilter._GroupByTypeDog then
  DataSet.SelectSQL.Text := 'select * from JO9_GET_SALDO_OUT_TOTAL(' + IntToStr(KEY_SESSION) + ', 1,'+IntToStr(SYS_INFO^._id_Reg_Uch)+')'
 else
  DataSet.SelectSQL.Text := 'select * from JO9_GET_SALDO_OUT_TOTAL(' + IntToStr(KEY_SESSION) + ', 0,'+IntToStr(SYS_INFO^._id_Reg_Uch)+')';

 DataSet.Open;

 if DataSet.RecordCount > 0 then Step := 20 / DataSet.RecordCount;

 while not DataSet.Eof do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  SetLength(PrintSch, Length(PrintSch) + 2);

  with PrintSch[Length(PrintSch) - 2] do begin
   _Kind          := 'OUT_DB';
   _id_Sch_Native := DataSet.FieldByName('ID_SCH').AsInteger;
   _Summa         := DataSet.FieldByName('OUT_DB').AsCurrency;

   if PrintFilter._GroupByTypeDog then _id_Type_Dog := DataSet.FieldByName('ID_TYPE_DOG').AsInteger
   else _id_Type_Dog := 0;
  end;

  with PrintSch[Length(PrintSch) - 1] do begin
   _Kind          := 'OUT_KR';
   _id_Sch_Native := DataSet['ID_SCH'];
   _Summa         := DataSet.FieldByName('OUT_KR').AsCurrency;

   if PrintFilter._GroupByTypeDog then _id_Type_Dog := DataSet.FieldByName('ID_TYPE_DOG').AsInteger
   else _id_Type_Dog := 0;
  end;

  DataSet.Next;
 end;

 DataSet.Close;


 //-------->>>>>>>>>>>>>>>> Заполняю SchMemoryData

 if Length(TempArray) > 0 then Step := 40 / Length(TempArray);

 last_sch := -1;

 for i := 0 to Length(TempArray) - 1 do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  if (last_sch <> TempArray[i]._id_Sch) or (i = 0) then begin
   SchMemoryData.Append;
   SchMemoryData.Edit;

   SchMemoryData.FieldByName('Style').Value := 0;
   SchMemoryData.FieldByName('Cell1').Value := TempArray[i]._Num_Sch + ' <' + TempArray[i]._Name_Sch + '>';

   SchMemoryData.Post;

   last_sch := TempArray[i]._id_Sch;
  end;

  if PrintFilter._GroupByTypeDog then begin
   SchMemoryData.Append;
   SchMemoryData.Edit;

   if i <> 0 then begin
    SchMemoryData.FieldByName('Style').Value := 6;
    SchMemoryData.Post;
    SchMemoryData.Append;
    SchMemoryData.Edit;
   end;

   SchMemoryData.FieldByName('Style').Value := 0;
   SchMemoryData.FieldByName('Cell1').Value := TempArray[i]._Name_Type_Dog;

   SchMemoryData.Post;
  end;

  //--------

  SchMemoryData.Append;
  SchMemoryData.Edit;

  SchMemoryData.FieldByName('Style').Value := 1;
  SchMemoryData.FieldByName('Cell1').Value := 'Вхідний залишок :';
  SchMemoryData.FieldByName('Cell3').Value := 'Вхідний залишок :';

  IN_DB  := 0;
  IN_KR  := 0;
  CUR_DB := 0;
  CUR_KR := 0;
  OUT_DB := 0;
  OUT_KR := 0;

  // Добавляю входящие остатки

  for j := 0 to Length(PrintSch) - 1 do
   if (PrintSch[j]._id_Sch_Native = TempArray[i]._id_Sch)
   and (PrintSch[j]._id_Type_Dog = TempArray[i]._id_Type_Dog) then begin
    if PrintSch[j]._Kind = 'IN_DB' then IN_DB := PrintSch[j]._Summa
    else if PrintSch[j]._Kind = 'IN_KR' then IN_KR := PrintSch[j]._Summa;
   end;

  SchMemoryData.FieldByName('Cell2').Value := DoCurrFormat(FloatToStrF(IN_DB, ffFixed, 100, 2));
  SchMemoryData.FieldByName('Cell4').Value := DoCurrFormat(FloatToStrF(IN_KR, ffFixed, 100, 2));

  SchMemoryData.Post;

  SchMemoryData.Append;
  SchMemoryData.Edit;

  SchMemoryData.FieldByName('Style').Value := 2;
  SchMemoryData.FieldByName('Cell1').Value := 'РУХ КОШТІВ';

  SchMemoryData.Post;

  SchMemoryData.Append;
  SchMemoryData.Edit;

  SchMemoryData.FieldByName('Style').Value := 3;
  SchMemoryData.FieldByName('Cell1').Value := 'Рахунок';
  SchMemoryData.FieldByName('Cell2').Value := 'Сума';
  SchMemoryData.FieldByName('Cell3').Value := 'Рахунок';
  SchMemoryData.FieldByName('Cell4').Value := 'Сума';

  SchMemoryData.Post;

  Line_DB := SchMemoryData.RecordCount;
  Line_KR := SchMemoryData.RecordCount;

  // Добавляю движение средств

  OrderSch(@PrintSch);

  SchOrderMData.First;
  while not SchOrderMData.Eof do begin

   for j := 0 to Length(PrintSch) - 1 do begin
    if SchOrderMData.Fields[0].Value <> PrintSch[j]._id_Sch_Cor then Continue;
    if PrintSch[j]._id_Sch_Native <> TempArray[i]._id_Sch then Continue;
    if PrintSch[j]._id_Type_Dog <> TempArray[i]._id_Type_Dog then Continue;

    if PrintSch[j]._Kind = 'CUR_DB' then begin
     Inc(Line_DB);

     CUR_DB := CUR_DB + PrintSch[j]._Summa;

     if Line_DB > SchMemoryData.RecordCount then SchMemoryData.Append
     else begin
      SchMemoryData.First;
      k := 1;
      while not SchMemoryData.Eof do begin
       if k = Line_DB then Break;
       inc(k);
       SchMemoryData.Next;
      end;
     end;

     SchMemoryData.Edit;

     SchMemoryData.FieldByName('Style').Value := 4;
     SchMemoryData.FieldByName('Cell1').Value := PrintSch[j]._Num_Sch_C;
     SchMemoryData.FieldByName('Cell2').Value := DoCurrFormat(FloatToStrF(PrintSch[j]._Summa, ffFixed, 100, 2));

     SchMemoryData.Post;
    end
    else if PrintSch[j]._Kind = 'CUR_KR' then begin
     Inc(Line_KR);

     if Line_KR > SchMemoryData.RecordCount then SchMemoryData.Append
     else begin
      SchMemoryData.First;
      k := 1;
      while not SchMemoryData.Eof do begin
       if k = Line_KR then Break;
       inc(k);
       SchMemoryData.Next;
      end;
     end;

     CUR_KR := CUR_KR + PrintSch[j]._Summa;

     SchMemoryData.Edit;

     SchMemoryData.FieldByName('Style').Value := 4;
     SchMemoryData.FieldByName('Cell3').Value := PrintSch[j]._Num_Sch_C;
     SchMemoryData.FieldByName('Cell4').Value := DoCurrFormat(FloatToStrF(PrintSch[j]._Summa, ffFixed, 100, 2));

     SchMemoryData.Post;
    end;
   end;

   SchOrderMData.Next;
  end;

  SchMemoryData.Append;
  SchMemoryData.Edit;

  SchMemoryData.FieldByName('Style').Value := 5;
  SchMemoryData.FieldByName('Cell1').Value := 'Разом :';
  SchMemoryData.FieldByName('Cell2').Value := DoCurrFormat(FloatToStrF(CUR_DB, ffFixed, 100, 2));
  SchMemoryData.FieldByName('Cell3').Value := 'Разом :';
  SchMemoryData.FieldByName('Cell4').Value := DoCurrFormat(FloatToStrF(CUR_KR, ffFixed, 100, 2));

  SchMemoryData.Post;

  // Добавляю исходящие остатки

  for j := 0 to Length(PrintSch) - 1 do
   if (PrintSch[j]._id_Sch_Native = TempArray[i]._id_Sch)
   and (PrintSch[j]._id_Type_Dog = TempArray[i]._id_Type_Dog) then begin
    if PrintSch[j]._Kind = 'OUT_DB' then OUT_DB := PrintSch[j]._Summa
    else if PrintSch[j]._Kind = 'OUT_KR' then OUT_KR := PrintSch[j]._Summa;
   end;

  SchMemoryData.Append;
  SchMemoryData.Edit;

  SchMemoryData.FieldByName('Style').Value := 1;
  SchMemoryData.FieldByName('Cell1').Value := 'Вихідний залишок :';
  SchMemoryData.FieldByName('Cell3').Value := 'Вихідний залишок :';

  SchMemoryData.FieldByName('Cell2').Value := DoCurrFormat(FloatToStrF(OUT_DB, ffFixed, 100, 2));
  SchMemoryData.FieldByName('Cell4').Value := DoCurrFormat(FloatToStrF(OUT_KR, ffFixed, 100, 2));

  SchMemoryData.Post;
 end;

 SchMemoryData.SortOnFields('Kind');
end;

procedure Tjo9_PrintForm.Print_Sch_MO_Report;
var
 TempArray : TSchArray;
 PrintSch  : TPrintSchArray;
 i, j, k   : integer;
 IN_DB     : currency;
 IN_KR     : currency;
 CUR_DB    : currency;
 CUR_KR    : currency;
 OUT_DB    : currency;
 OUT_KR    : currency;

 CUR_DB_MO : currency;
 CUR_KR_MO : currency;

 Line_DB   : integer;
 Line_KR   : integer;

 Flag      : boolean;

 last_sch  : integer;

 function Check_MO(id_Sch_N, id_Sch_C : integer; is_DB : byte) : boolean;
 begin
  Result := False;

  DataSet.Close;
  DataSet.SelectSQL.Text := 'select ID_MO from JO9_PRINT_SCH_CHECK_MO('
  + IntToStr(id_Sch_N) + ',' + IntToStr(id_Sch_C) + ','
  + QuotedStr(DateToStr(PrintFilter._Date_Beg)) + ',' + QuotedStr(DateToStr(PrintFilter._Date_End)) + ','
  + IntToStr(is_DB) + ')';

  DataSet.Open;

  if not VarIsNull(DataSet['ID_MO']) then if DataSet['ID_MO'] = SYS_INFO^._id_Reg_Uch then Result := True;
 end;
begin

 PrepareData(False);

 if PrintFilter._GroupByTypeDog then
  DataSet.SelectSQL.Text := 'select * from JO9_IN_CUR_BUFF_SEL_SCH('
  + IntToStr(KEY_SESSION) + ',1) order by NUM_TYPE_DOG'
 else
  DataSet.SelectSQL.Text := 'select * from JO9_IN_CUR_BUFF_SEL_SCH('
  + IntToStr(KEY_SESSION) + ',0)';

 DataSet.Open;

 while not DataSet.Eof do begin
  Flag := (Length(PrintFilter._NSch) = 0);

  for i := 0 to Length(PrintFilter._NSch) - 1 do
   if PrintFilter._NSch[i]._id_Sch = DataSet['ID_SCH'] then begin
    Flag := True;
    Break;
   end;

  if Flag then begin
   SetLength(TempArray, Length(TempArray) + 1);

   TempArray[Length(TempArray) - 1]._id_Sch := DataSet['ID_SCH'];

   if PrintFilter._GroupByTypeDog then begin
    TempArray[Length(TempArray) - 1]._id_Type_Dog   := DataSet['ID_TYPE_DOG'];
    TempArray[Length(TempArray) - 1]._Num_Type_Dog  := DataSet['NUM_TYPE_DOG'];
    TempArray[Length(TempArray) - 1]._Name_Type_Dog := DataSet['NAME_TYPE_DOG'];
   end
   else TempArray[Length(TempArray) - 1]._id_Type_Dog := 0;
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 for i := 0 to Length(TempArray) - 1 do begin
  DataSet.SelectSQL.Text := 'select * from PUB_SP_MAIN_SCH_INFO('
  + QuotedStr(DateToStr(PrintFilter._Date_Beg))
  + ',' + IntToStr(TempArray[i]._id_Sch) + ')';

  DataSet.Open;

  TempArray[i]._Num_Sch  := DataSet['SCH_NUMBER'];
  TempArray[i]._Name_Sch := DataSet['SCH_TITLE'];

  DataSet.Close;
 end;

 /////////---------->>>>>   Выбираю входящие остатки

 if PrintFilter._GroupByTypeDog then
  DataSet.SelectSQL.Text := 'select * from JO9_PRINT_SCH_SEL_IN(' + IntToStr(KEY_SESSION) + ',1)'
 else
  DataSet.SelectSQL.Text := 'select * from JO9_PRINT_SCH_SEL_IN(' + IntToStr(KEY_SESSION) + ',0)';

 DataSet.Open;

 if DataSet.RecordCount > 0 then Step := 20 / DataSet.RecordCount;

 while not DataSet.Eof do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  if not VarIsNull(DataSet['DB_SUM']) then begin
   SetLength(PrintSch, Length(PrintSch) + 1);

   with PrintSch[Length(PrintSch) - 1] do begin
    _Kind          := 'IN_DB';
    _id_Sch_Native := DataSet['ID_SCH'];
    _Summa         := DataSet['DB_SUM'];

    if PrintFilter._GroupByTypeDog then _id_Type_Dog := DataSet['ID_TYPE_DOG']
    else _id_Type_Dog := 0;
   end;
  end;

  if not VarIsNull(DataSet['KR_SUM']) then begin
   SetLength(PrintSch, Length(PrintSch) + 1);

   with PrintSch[Length(PrintSch) - 1] do begin
    _Kind          := 'IN_KR';
    _id_Sch_Native := DataSet['ID_SCH'];
    _Summa         := DataSet['KR_SUM'];

    if PrintFilter._GroupByTypeDog then _id_Type_Dog := DataSet['ID_TYPE_DOG']
    else _id_Type_Dog := 0;
   end;
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 ///////------------->>>>>>>   Выбираю текущие документы

 if PrintFilter._GroupByTypeDog then
  DataSet.SelectSQL.Text := 'select * from JO9_PRINT_SCH_SEL_CUR('
  + IntToStr(KEY_SESSION) + ',' + QuotedStr(DateToStr(PrintFilter._Date_Beg)) + ',1)'
 else
  DataSet.SelectSQL.Text := 'select * from JO9_PRINT_SCH_SEL_CUR('
  + IntToStr(KEY_SESSION) + ',' + QuotedStr(DateToStr(PrintFilter._Date_Beg)) + ',0)';

 DataSet.Open;

 if DataSet.RecordCount > 0 then Step := 20 / DataSet.RecordCount;

 while not DataSet.Eof do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  SetLength(PrintSch, Length(PrintSch) + 1);

  with PrintSch[Length(PrintSch) - 1] do begin
   if DataSet['IS_DB'] = 1 then _Kind := 'CUR_DB'
   else _Kind := 'CUR_KR';

   _id_Sch_Native := DataSet.FieldByName('ID_SCH').AsInteger;
   _id_Sch_Cor    := DataSet.FieldByName('ID_SCH_COR').AsInteger;
   _Num_Sch_C     := DataSet.FieldByName('NUM_SCH_COR').AsString;
   _Name_Sch_C    := DataSet.FieldByName('NAME_SCH_COR').AsString;
   _Summa         := DataSet.FieldByName('SUMMA').AsCurrency;
  _is_turnover   := DataSet.FieldByName('IS_TURNOVER').AsInteger;
       
   if PrintFilter._GroupByTypeDog then _id_Type_Dog := DataSet.FieldByName('ID_TYPE_DOG').AsInteger
   else _id_Type_Dog := 0;
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 // Пускаю процедуру CALC

 StoredProc.StoredProcName := 'JO9_IN_CUR_BUFF_CALC';
 StoredProc.Prepare;
 StoredProc.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
 StoredProc.ExecProc;

 // Выбираю исходящие остатки

 if PrintFilter._GroupByTypeDog then
  DataSet.SelectSQL.Text := 'select * from JO9_GET_SALDO_OUT_TOTAL(' + IntToStr(KEY_SESSION) + ', 1,'+IntToStr(SYS_INFO^._id_Reg_Uch)+')'
 else
  DataSet.SelectSQL.Text := 'select * from JO9_GET_SALDO_OUT_TOTAL(' + IntToStr(KEY_SESSION) + ', 0,'+IntToStr(SYS_INFO^._id_Reg_Uch)+')';

 DataSet.Open;

 if DataSet.RecordCount > 0 then Step := 20 / DataSet.RecordCount;

 while not DataSet.Eof do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  SetLength(PrintSch, Length(PrintSch) + 2);

  with PrintSch[Length(PrintSch) - 2] do begin
   _Kind          := 'OUT_DB';
   _id_Sch_Native := DataSet.FieldByName('ID_SCH').AsInteger;
   _Summa         := DataSet.FieldByName('OUT_DB').AsCurrency;

   if PrintFilter._GroupByTypeDog then _id_Type_Dog := DataSet.FieldByName('ID_TYPE_DOG').AsInteger
   else _id_Type_Dog := 0;
  end;

  with PrintSch[Length(PrintSch) - 1] do begin
   _Kind          := 'OUT_KR';
   _id_Sch_Native := DataSet['ID_SCH'];
   _Summa         := DataSet.FieldByName('OUT_KR').AsCurrency;

   if PrintFilter._GroupByTypeDog then _id_Type_Dog := DataSet.FieldByName('ID_TYPE_DOG').AsInteger
   else _id_Type_Dog := 0;
  end;

  DataSet.Next;
 end;

 DataSet.Close;


 //-------->>>>>>>>>>>>>>>> Заполняю MOSchMemoryData

 if Length(TempArray) > 0 then Step := 40 / Length(TempArray);

 last_sch := -1;

 for i := 0 to Length(TempArray) - 1 do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  if (last_sch <> TempArray[i]._id_Sch) or (i = 0) then begin
   MOSchMemoryData.Append;
   MOSchMemoryData.Edit;

   MOSchMemoryData.FieldByName('Style').Value := 0;
   MOSchMemoryData.FieldByName('Cell1').Value := TempArray[i]._Num_Sch + ' <' + TempArray[i]._Name_Sch + '>';

   MOSchMemoryData.Post;

   last_sch := TempArray[i]._id_Sch;
  end;

  if PrintFilter._GroupByTypeDog then begin
   MOSchMemoryData.Append;
   MOSchMemoryData.Edit;

   if i <> 0 then begin
    MOSchMemoryData.FieldByName('Style').Value := 6;
    MOSchMemoryData.Post;
    MOSchMemoryData.Append;
    MOSchMemoryData.Edit;
   end;

   MOSchMemoryData.FieldByName('Style').Value := 0;
   MOSchMemoryData.FieldByName('Cell1').Value := TempArray[i]._Name_Type_Dog;

   MOSchMemoryData.Post;
  end;

  //--------

  MOSchMemoryData.Append;
  MOSchMemoryData.Edit;

  MOSchMemoryData.FieldByName('Style').Value := 1;
  MOSchMemoryData.FieldByName('Cell1').Value := 'Вхідний залишок :';
  MOSchMemoryData.FieldByName('Cell4').Value := 'Вхідний залишок :';

  IN_DB  := 0;
  IN_KR  := 0;
  CUR_DB := 0;
  CUR_KR := 0;
  OUT_DB := 0;
  OUT_KR := 0;

  CUR_DB_MO := 0;
  CUR_KR_MO := 0;

  // Добавляю входящие остатки

  for j := 0 to Length(PrintSch) - 1 do
   if (PrintSch[j]._id_Sch_Native = TempArray[i]._id_Sch)
   and (PrintSch[j]._id_Type_Dog = TempArray[i]._id_Type_Dog) then begin
    if PrintSch[j]._Kind = 'IN_DB' then IN_DB := PrintSch[j]._Summa
    else if PrintSch[j]._Kind = 'IN_KR' then IN_KR := PrintSch[j]._Summa;
   end;

  MOSchMemoryData.FieldByName('Cell3').Value := DoCurrFormat(FloatToStrF(IN_DB, ffFixed, 100, 2));
  MOSchMemoryData.FieldByName('Cell6').Value := DoCurrFormat(FloatToStrF(IN_KR, ffFixed, 100, 2));

  MOSchMemoryData.Post;

  MOSchMemoryData.Append;
  MOSchMemoryData.Edit;

  MOSchMemoryData.FieldByName('Style').Value := 2;
  MOSchMemoryData.FieldByName('Cell1').Value := 'РУХ КОШТІВ';

  MOSchMemoryData.Post;

  MOSchMemoryData.Append;
  MOSchMemoryData.Edit;

  MOSchMemoryData.FieldByName('Style').Value := 3;
  MOSchMemoryData.FieldByName('Cell1').Value := 'Рахунок';
  MOSchMemoryData.FieldByName('Cell2').Value := 'Сума оборотів';
  MOSchMemoryData.FieldByName('Cell3').Value := 'Надійшло до ГК';
  MOSchMemoryData.FieldByName('Cell4').Value := 'Рахунок';
  MOSchMemoryData.FieldByName('Cell5').Value := 'Сума оборотів';
  MOSchMemoryData.FieldByName('Cell6').Value := 'Надійшло до ГК';

  MOSchMemoryData.Post;

  Line_DB := MOSchMemoryData.RecordCount;
  Line_KR := MOSchMemoryData.RecordCount;

  // Добавляю движение средств

  OrderSch(@PrintSch);

  SchOrderMData.First;
  while not SchOrderMData.Eof do begin
   for j := 0 to Length(PrintSch) - 1 do begin
    if SchOrderMData.Fields[0].Value <> PrintSch[j]._id_Sch_Cor then Continue;
    if PrintSch[j]._id_Sch_Native <> TempArray[i]._id_Sch then Continue;
    if PrintSch[j]._id_Type_Dog <> TempArray[i]._id_Type_Dog then Continue;

    if PrintSch[j]._Kind = 'CUR_DB' then begin
     Inc(Line_DB);

     CUR_DB := CUR_DB + PrintSch[j]._Summa;

     if Line_DB > MOSchMemoryData.RecordCount then MOSchMemoryData.Append
     else begin
      MOSchMemoryData.First;
      k := 1;
      while not MOSchMemoryData.Eof do begin
       if k = Line_DB then Break;
       inc(k);
       MOSchMemoryData.Next;
      end;
     end;

     MOSchMemoryData.Edit;

     MOSchMemoryData.FieldByName('Style').Value := 4;
     MOSchMemoryData.FieldByName('Cell1').Value := PrintSch[j]._Num_Sch_C;
     MOSchMemoryData.FieldByName('Cell2').Value := DoCurrFormat(FloatToStrF(PrintSch[j]._Summa, ffFixed, 100, 2));

     if Check_MO(PrintSch[j]._id_Sch_Native, PrintSch[j]._id_Sch_Cor, 1) then begin
      MOSchMemoryData.FieldByName('Cell3').Value := DoCurrFormat(FloatToStrF(PrintSch[j]._Summa, ffFixed, 100, 2));
      CUR_DB_MO := CUR_DB_MO + PrintSch[j]._Summa;
     end
     else
      MOSchMemoryData.FieldByName('Cell3').Value := DoCurrFormat(FloatToStrF(0, ffFixed, 100, 2));

     MOSchMemoryData.Post;
    end
    else if PrintSch[j]._Kind = 'CUR_KR' then begin
     Inc(Line_KR);

     if Line_KR > MOSchMemoryData.RecordCount then MOSchMemoryData.Append
     else begin
      MOSchMemoryData.First;
      k := 1;
      while not MOSchMemoryData.Eof do begin
       if k = Line_KR then Break;
       inc(k);
       MOSchMemoryData.Next;
      end;
     end;

     CUR_KR := CUR_KR + PrintSch[j]._Summa;

     MOSchMemoryData.Edit;

     MOSchMemoryData.FieldByName('Style').Value := 4;

     MOSchMemoryData.FieldByName('Cell4').Value := PrintSch[j]._Num_Sch_C;
     MOSchMemoryData.FieldByName('Cell5').Value := DoCurrFormat(FloatToStrF(PrintSch[j]._Summa, ffFixed, 100, 2));

     if Check_MO(PrintSch[j]._id_Sch_Native, PrintSch[j]._id_Sch_Cor, 0) then begin
      MOSchMemoryData.FieldByName('Cell6').Value := DoCurrFormat(FloatToStrF(PrintSch[j]._Summa, ffFixed, 100, 2));
      CUR_KR_MO := CUR_KR_MO + PrintSch[j]._Summa;
     end
     else
      MOSchMemoryData.FieldByName('Cell6').Value := DoCurrFormat(FloatToStrF(0, ffFixed, 100, 2));

     MOSchMemoryData.Post;
    end;
   end;

   SchOrderMData.Next;
  end;

  MOSchMemoryData.Append;
  MOSchMemoryData.Edit;

  MOSchMemoryData.FieldByName('Style').Value := 5;
  MOSchMemoryData.FieldByName('Cell1').Value := 'Разом :';
  MOSchMemoryData.FieldByName('Cell2').Value := DoCurrFormat(FloatToStrF(CUR_DB, ffFixed, 100, 2));
  MOSchMemoryData.FieldByName('Cell3').Value := DoCurrFormat(FloatToStrF(CUR_DB_MO, ffFixed, 100, 2));
  MOSchMemoryData.FieldByName('Cell4').Value := 'Разом :';
  MOSchMemoryData.FieldByName('Cell5').Value := DoCurrFormat(FloatToStrF(CUR_KR, ffFixed, 100, 2));
  MOSchMemoryData.FieldByName('Cell6').Value := DoCurrFormat(FloatToStrF(CUR_KR_MO, ffFixed, 100, 2));

  MOSchMemoryData.Post;

  // Добавляю исходящие остатки

  for j := 0 to Length(PrintSch) - 1 do
   if (PrintSch[j]._id_Sch_Native = TempArray[i]._id_Sch)
   and (PrintSch[j]._id_Type_Dog = TempArray[i]._id_Type_Dog) then begin
    if PrintSch[j]._Kind = 'OUT_DB' then OUT_DB := PrintSch[j]._Summa
    else if PrintSch[j]._Kind = 'OUT_KR' then OUT_KR := PrintSch[j]._Summa;
   end;

  MOSchMemoryData.Append;
  MOSchMemoryData.Edit;

  MOSchMemoryData.FieldByName('Style').Value := 1;
  MOSchMemoryData.FieldByName('Cell1').Value := 'Вихідний залишок :';
  MOSchMemoryData.FieldByName('Cell4').Value := 'Вихідний залишок :';

  MOSchMemoryData.FieldByName('Cell3').Value := DoCurrFormat(FloatToStrF(OUT_DB, ffFixed, 100, 2));
  MOSchMemoryData.FieldByName('Cell6').Value := DoCurrFormat(FloatToStrF(OUT_KR, ffFixed, 100, 2));

  MOSchMemoryData.Post;
 end;

 MOSchMemoryData.SortOnFields('Kind');
end;

procedure Tjo9_PrintForm.Print_Sch_Cur_Report(is_Db : boolean);
var
 PrintSch  : TPrintSchCurArray;

 i, j, k   : integer;

 Sch       : array of integer;
 Flag      : boolean;

 Sum       : variant;
 SchSum    : currency;
 TotalSum  : currency;
begin
 PrepareData(False);

 ///////------------->>>>>>>   Выбираю текущие документы

 if is_Db then
  DataSet.SelectSQL.Text := 'select * from JO9_PRINT_SCH_SEL_CUR_EX('
  + IntToStr(KEY_SESSION)
  + ',' + QuotedStr(DateToStr(PrintFilter._Date_Beg)) + ',1)'
 else
  DataSet.SelectSQL.Text := 'select * from JO9_PRINT_SCH_SEL_CUR_EX('
  + IntToStr(KEY_SESSION)
  + ',' + QuotedStr(DateToStr(PrintFilter._Date_Beg)) + ',0)';

 DataSet.Open;

 if DataSet.RecordCount > 0 then Step := 50 / DataSet.RecordCount;

 while not DataSet.Eof do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  SetLength(PrintSch, Length(PrintSch) + 1);

  with PrintSch[Length(PrintSch) - 1] do begin
   _id_Sch_Native := DataSet.FieldByName('ID_SCH').AsInteger;
   _id_Sch_Cor    := DataSet.FieldByName('ID_SCH_COR').AsInteger;
   _Num_Sch_C     := DataSet.FieldByName('NUM_SCH_COR').AsString;
   _Name_Sch_C    := DataSet.FieldByName('NAME_SCH_COR').AsString;
   _Summa         := DataSet.FieldByName('SUMMA').AsCurrency;
   _id_Parent     := DataSet.FieldByName('ID_PARENT').AsInteger;
   _Num_Parent    := DataSet.FieldByName('NUM_PARENT').AsString;
   _Name_Parent   := DataSet.FieldByName('NAME_PARENT').AsString;
  
  end;

  Flag := True;
  for i := 0 to Length(NSch) - 1 do
   if NSch[i]._id_Sch = PrintSch[Length(PrintSch) - 1]._id_Sch_Native then begin
    Flag := False;
    Break;
   end;

  if Flag then begin
   SetLength(NSch, Length(NSch) + 1);
   NSch[Length(NSch) - 1]._id_Sch := PrintSch[Length(PrintSch) - 1]._id_Sch_Native;
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 OrderSch_Cur(@PrintSch);

 SchOrderMData.First;

 if SchOrderMData.RecordCount > 0 then Step := 50 / SchOrderMData.RecordCount;

 for i := 0 to Length(NSch) - 1 do begin
  // Добавляю заголовок Native Sch

  DataSet.SelectSQL.Text := 'SELECT SCH_NUMBER FROM PUB_SP_MAIN_SCH_INFO('
  + QuotedStr(DateToStr(SYS_INFO^._Period_Beg)) + ',' + IntToStr(NSch[i]._id_Sch) + ')';
  DataSet.Open;

  NSch[i]._Num_Sch := DataSet.FieldByName('SCH_NUMBER').AsString;

  DataSet.Close;

  SchMemoryData.Append;
  SchMemoryData.Edit;

  SchMemoryData.FieldByName('Style').Value := 2;
  SchMemoryData.FieldByName('Cell1').Value := NSch[i]._Num_Sch;

  SchMemoryData.Post;

  // Добавляю заголовок

  SchMemoryData.Append;
  SchMemoryData.Edit;

  SchMemoryData.FieldByName('Style').Value := 5;
  SchMemoryData.FieldByName('Cell1').Value := 'Рахунок';
  SchMemoryData.FieldByName('Cell3').Value := 'Розшифровка';
  SchMemoryData.FieldByName('Cell4').Value := 'С У М А';

  SchMemoryData.Post;


  SchOrderMData.First;
  Sch := nil;

  while not SchOrderMData.Eof do begin
   PBarPos := PBarPos + Step;
   DoProgress(PBarPos);

   for j := 0 to Length(PrintSch) - 1 do begin
    if SchOrderMData.Fields[0].Value <> PrintSch[j]._id_Sch_Cor then Continue;
    if NSch[i]._id_Sch <> PrintSch[j]._id_Sch_Native then Continue;

    Flag := True;
    for k := 0 to Length(Sch) - 1 do
     if Sch[k] = PrintSch[j]._id_Parent then begin
      Flag := False;
      Break;
     end;

    if Flag then begin
    // Добавляю родителя
     SchMemoryData.Append;
     SchMemoryData.Edit;

     SchMemoryData.FieldByName('Style').Value := 0;
     SchMemoryData.FieldByName('Cell1').Value := PrintSch[j]._Num_Parent;
     SchMemoryData.FieldByName('Cell2').Value := '   ' + PrintSch[j]._Name_Parent;

     if PrintSch[j]._id_Parent = PrintSch[j]._id_Sch_Cor then
      SchMemoryData.FieldByName('Cell4').Value := DoCurrFormat(FloatToStrF(PrintSch[j]._Summa, ffFixed, 100, 2));

     SchMemoryData.Post;

              ///////////

     SetLength(Sch, Length(Sch) + 1);
     Sch[Length(Sch) - 1] := PrintSch[j]._id_Parent;
    end;

    if PrintSch[j]._id_Parent = PrintSch[j]._id_Sch_Cor then Continue;

    SchMemoryData.Append;
    SchMemoryData.Edit;

    SchMemoryData.FieldByName('Style').Value := 1;
    SchMemoryData.FieldByName('Cell2').Value := PrintSch[j]._Num_Sch_C;
    SchMemoryData.FieldByName('Cell3').Value := '   ' + PrintSch[j]._Name_Sch_C;
    SchMemoryData.FieldByName('Cell4').Value := DoCurrFormat(FloatToStrF(PrintSch[j]._Summa, ffFixed, 100, 2));

    SchMemoryData.Post;
   end;

   SchOrderMData.Next;
  end;
 end;

 // Считаю суммы по счетам - родителям

 SchMemoryData.Last;

 Sum := null;
 while not SchMemoryData.Bof do begin
  if SchMemoryData.FieldByName('Style').Value = 1 then begin
   if VarIsNull(Sum) then Sum := 0;

   Sum := Sum + StrToCurr(AnsiReplaceStr(SchMemoryData.FieldByName('Cell4').Value, ThousandSeparator, ''))
  end
  else begin
   if not VarIsNull(Sum) then begin
    SchMemoryData.Edit;

    SchMemoryData.FieldByName('Cell4').Value := DoCurrFormat(FloatToStrF(Sum, ffFixed, 100, 2));

    SchMemoryData.Post;

    Sum := null;
   end;
  end;

  SchMemoryData.Prior;
 end;

 // Считаю итоги по счетам и ИТОГО

 SchMemoryData.First;

 Flag := False;
 while not SchMemoryData.Eof do begin
  if SchMemoryData.FieldByName('Style').Value = 0 then
   SchSum := SchSum + StrToCurr(AnsiReplaceStr(SchMemoryData.FieldByName('Cell4').Value, ThousandSeparator, ''))
  else if SchMemoryData.FieldByName('Style').Value = 2 then begin
   if not Flag then Flag := True
   else begin
    SchMemoryData.Insert;
    SchMemoryData.Edit;

    SchMemoryData.FieldByName('Style').Value := 3;
    SchMemoryData.FieldByName('Cell1').Value := 'Разом по рахунку :';
    SchMemoryData.FieldByName('Cell4').Value := DoCurrFormat(FloatToStrF(SchSum, ffFixed, 100, 2));

    SchMemoryData.Post;

    TotalSum := TotalSum + SchSum;
    SchSum   := 0;

    SchMemoryData.Next;
   end;
  end;

  SchMemoryData.Next;
 end;

 SchMemoryData.Append;
 SchMemoryData.Edit;

 SchMemoryData.FieldByName('Style').Value := 3;
 SchMemoryData.FieldByName('Cell1').Value := 'Разом по рахунку :';
 SchMemoryData.FieldByName('Cell4').Value := DoCurrFormat(FloatToStrF(SchSum, ffFixed, 100, 2));

 SchMemoryData.Post;

 TotalSum := TotalSum + SchSum;

 //-----

 if Length(NSch) > 1 then begin
  SchMemoryData.Append;
  SchMemoryData.Edit;

  SchMemoryData.FieldByName('Style').Value := 4;
  SchMemoryData.FieldByName('Cell1').Value := 'Разом :';
  SchMemoryData.FieldByName('Cell4').Value := DoCurrFormat(FloatToStrF(TotalSum, ffFixed, 100, 2));

  SchMemoryData.Post;
 end; 
end;

procedure Tjo9_PrintForm.OrderSch_Cur(InSch: PPrintSchCurArray);
var
 i, j : integer;
 s : string;

 k : integer;

 Flag : boolean;
 Last : integer;
 Temp : array of integer;
begin
 SchOrderMData.Open;
 SchOrderMData.EmptyTable;

 for i := 0 to Length(InSch^) - 1 do begin
  Flag := True;
  for j := 0 to Length(Temp) - 1 do
   if Temp[j] = InSch^[i]._id_Sch_Cor then begin
    Flag := False;
    Break;
   end;

  if Flag then begin
   SetLength(Temp, Length(Temp) + 1);
   Temp[Length(Temp) - 1] := InSch^[i]._id_Sch_Cor;
  end
  else Continue;

  s := InSch^[i]._Num_Sch_C;

  k    := 0;
  Last := 0;

  SchOrderMData.Append;

  SchOrderMData.Edit;
  SchOrderMData.FieldByName('id_Sch').Value := InSch^[i]._id_Sch_Cor;
  SchOrderMData.Post;

  for j := 1 to Length(s) do begin
   if not (s[j] in ['0'..'9']) then begin
    Inc(k);

    SchOrderMData.Edit;
    SchOrderMData.FieldByName('Field' + IntToStr(k)).Value := StrToInt(Copy(s, Last + 1, j - Last - 1));
    SchOrderMData.Post;

    Last := j;
   end;
  end;

  Inc(k);

  SchOrderMData.Edit;

  if s = '' then SchOrderMData.Fields[k].Value := 0
  else SchOrderMData.Fields[k].Value := StrToInt(Copy(s, Last + 1, Length(s) - Last));

  SchOrderMData.Post;
 end;

 SchOrderMData.SortOnFields('Field1;Field2;Field3;Field4;Field5');
end;

procedure Tjo9_PrintForm.DoCurDocsReport(Kredit: boolean);
var
 Docs      : TCurDocsArray;
 i         : integer;

 Num       : integer;
 Name_Cust : string;

 CustCount : integer;
 DocCount  : integer;
 CustSum   : currency;
 DocSum    : currency;
 s         : string;
begin
 DocTotalSumma := 0;

 ///////------------>>>>>>>>> Выбираю данные для формирования отчета

 if Kredit then
  DataSet.SelectSQL.Text := 'select * from JO9_DT_ALL_PROV_SEL_REG(' + IntToStr(KEY_SESSION) + ','
  + IntToStr(SYS_INFO^._id_Reg_Uch) + ',1,' + QuotedStr(DateToStr(PrintFilter._Date_Beg)) + ','
  + QuotedStr(DateToStr(PrintFilter._Date_End)) + ') order by NAME_CUSTOMER, REG_NUM'
 else
  DataSet.SelectSQL.Text := 'select * from JO9_DT_ALL_PROV_SEL_REG(' + IntToStr(KEY_SESSION) + ','
  + IntToStr(SYS_INFO^._id_Reg_Uch) + ',0,' + QuotedStr(DateToStr(PrintFilter._Date_Beg)) + ','
  + QuotedStr(DateToStr(PrintFilter._Date_End)) + ') order by NAME_CUSTOMER, REG_NUM';

 DataSet.Open;

 if DataSet.RecordCount > 0 then Step := 20 / DataSet.RecordCount;

 SetLength(Docs, DataSet.RecordCount);

 for i := 0 to DataSet.RecordCount - 1 do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  with Docs[i] do begin
   _Name_Cust  := DataSet['NAME_CUSTOMER'];

    if VarIsNull(DataSet['REG_NUM']) then _Reg_Num := ''
    else _Reg_Num := DataSet['REG_NUM'];

   _Num_Doc    := DataSet.FieldByName('NUM_DOC').AsString;
   _Date_Doc   := DataSet.FieldByName('DATE_DOC').AsDateTime;
   _Date_Reg   := DataSet.FieldByName('DATE_REG').AsDateTime;
   _Note       := DataSet.FieldByName('NOTE').AsString;
   _FIO        := DataSet.FieldByName('FIO').AsString;
   _Db_Num_Sch := DataSet['NUM_SCH_DB'];
   _Kr_Num_Sch := DataSet['NUM_SCH_KR'];
   _kod_S      := DataSet['KOD_S'];
   _kod_R      := DataSet['KOD_R'];
   _kod_St     := DataSet['KOD_ST'];
   _kod_Kekv   := DataSet['KOD_KEKV'];
   _Summa      := DataSet['SUMMA'];

  end;

  DataSet.Next;
 end;

 DataSet.Close;

 if Length(Docs) = 0 then Exit;

 ////////////----------->>>>>>>>>> Формирую отчет

 Num       := 0;
 DocCount  := 0;
 Name_Cust := '_____________{}{}{}{}{}{}{}{}_____________';

 if Length(Docs) > 0 then Step := 80 / Length(Docs);

 for i := 0 to Length(Docs) - 1 do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  if Docs[i]._Name_Cust <> Name_Cust then begin
   if DocCount > 1 then begin
    CurMemoryData.Append;
    CurMemoryData.Edit;

    CurMemoryData.FieldByName('NumSchKr').Value := 'Разом:';
    CurMemoryData.FieldByName('Summa').Value    := DoCurrFormat(FloatToStrF(DocSum, ffFixed, 100, 2));

    CurMemoryData.Post;
   end
   else if CurMemoryData.RecordCount > 0 then begin
    if not VarIsNull(CurMemoryData.FieldByName('CustCell').Value) then begin
     CurMemoryData.Edit;

     s := CurMemoryData.FieldByName('CustCell').Value;
     CurMemoryData.FieldByName('CustCell').Value := s[1] + '1';

     CurMemoryData.Post;
    end;

    if not VarIsNull(CurMemoryData.FieldByName('RegCell').Value) then begin
     CurMemoryData.Edit;

     s := CurMemoryData.FieldByName('RegCell').Value;
     CurMemoryData.FieldByName('RegCell').Value := s[1] + '1';

     CurMemoryData.Post;
    end;

    if not VarIsNull(CurMemoryData.FieldByName('DocCell').Value) then begin
     CurMemoryData.Edit;

     s := CurMemoryData.FieldByName('DocCell').Value;
     CurMemoryData.FieldByName('DocCell').Value := s[1] + '1';

     CurMemoryData.Post;
    end;
   end;

   if CustCount > 1 then begin
    CurMemoryData.Append;
    CurMemoryData.Edit;

    CurMemoryData.FieldByName('Totals').Value  := '1';
    CurMemoryData.FieldByName('RegNum').Value := 'Разом по контрагенту:';
    CurMemoryData.FieldByName('NumSchKr').Value := '';
    CurMemoryData.FieldByName('Summa').Value   := DoCurrFormat(FloatToStrF(CustSum, ffFixed, 100, 2));

    CurMemoryData.Post;
   end;

   Inc(Num);
   Name_Cust := Docs[i]._Name_Cust;

   CustCount     := 1;
   DocCount      := 1;

   CustSum       := Docs[i]._Summa;
   DocTotalSumma := DocTotalSumma + Docs[i]._Summa;
   DocSum        := Docs[i]._Summa;

   CurMemoryData.Append;
   CurMemoryData.Edit;

   CurMemoryData.FieldByName('Num').Value      := Num;
   CurMemoryData.FieldByName('CustName').Value := Docs[i]._Name_Cust;

   CurMemoryData.FieldByName('CustCell').Value := '10';
   CurMemoryData.FieldByName('RegCell').Value  := '10';
   CurMemoryData.FieldByName('DocCell').Value  := '10';

   CurMemoryData.FieldByName('RegNum').Value   := Docs[i]._Reg_Num;
   CurMemoryData.FieldByName('NumDoc').Value   := Docs[i]._Num_Doc;

   if Docs[i]._FIO <> '' then
    CurMemoryData.FieldByName('Note').Value     := Docs[i]._Note + '(' + Docs[i]._FIO + ')'
   else
    CurMemoryData.FieldByName('Note').Value     := Docs[i]._Note;

   DateTimeToString(s, 'dd.mm.yy', Docs[i]._Date_Doc);
   CurMemoryData.FieldByName('DateDoc').Value := s;

   CurMemoryData.FieldByName('DateReg').Value := DateTimeToStr(Docs[i]._Date_Reg, f_Date_Reg);

   CurMemoryData.FieldByName('NumSchDb').Value := Docs[i]._Db_Num_Sch;
   CurMemoryData.FieldByName('NumSchKr').Value := Docs[i]._Kr_Num_Sch;
   CurMemoryData.FieldByName('S').Value        := Docs[i]._kod_S;
   CurMemoryData.FieldByName('R').Value        := Docs[i]._kod_R;
   CurMemoryData.FieldByName('St').Value       := Docs[i]._kod_St;
   CurMemoryData.FieldByName('Kekv').Value     := Docs[i]._kod_Kekv;
   CurMemoryData.FieldByName('Summa').Value    := DoCurrFormat(FloatToStrF(Docs[i]._Summa, ffFixed, 100, 2));

   CurMemoryData.Post;
  end
  else if Docs[i]._Reg_Num <> Docs[i - 1]._Reg_Num then begin
   if DocCount > 1 then begin
    CurMemoryData.Append;
    CurMemoryData.Edit;

    CurMemoryData.FieldByName('NumSchKr').Value  := 'Разом:';
    CurMemoryData.FieldByName('Summa').Value     := DoCurrFormat(FloatToStrF(DocSum, ffFixed, 100, 2));

    CurMemoryData.Post;
   end
   else if CurMemoryData.RecordCount > 0 then begin
    if not VarIsNull(CurMemoryData.FieldByName('RegCell').Value) then begin
     CurMemoryData.Edit;

     s := CurMemoryData.FieldByName('RegCell').Value;
     CurMemoryData.FieldByName('RegCell').Value := s[1] + '1';

     CurMemoryData.Post;
    end;

    if not VarIsNull(CurMemoryData.FieldByName('DocCell').Value) then begin
     CurMemoryData.Edit;

     s := CurMemoryData.FieldByName('DocCell').Value;
     CurMemoryData.FieldByName('DocCell').Value := s[1] + '1';

     CurMemoryData.Post;
    end;
   end;

   DocCount      := 1;
   DocSum        := Docs[i]._Summa;
   CustSum       := CustSum + Docs[i]._Summa;
   DocTotalSumma := DocTotalSumma + Docs[i]._Summa;

   Inc(CustCount);

   CurMemoryData.Append;
   CurMemoryData.Edit;

   CurMemoryData.FieldByName('RegNum').Value   := Docs[i]._Reg_Num;
   CurMemoryData.FieldByName('NumDoc').Value   := Docs[i]._Num_Doc;

   if Docs[i]._FIO <> '' then
    CurMemoryData.FieldByName('Note').Value     := Docs[i]._Note + '(' + Docs[i]._FIO + ')'
   else
    CurMemoryData.FieldByName('Note').Value     := Docs[i]._Note;

   DateTimeToString(s, 'dd.mm.yy', Docs[i]._Date_Doc);
   CurMemoryData.FieldByName('DateDoc').Value := s;

   CurMemoryData.FieldByName('DateReg').Value := DateTimeToStr(Docs[i]._Date_Reg, f_Date_Reg);

   CurMemoryData.FieldByName('RegCell').Value := '10';
   CurMemoryData.FieldByName('DocCell').Value := '10';

   CurMemoryData.FieldByName('NumSchDb').Value := Docs[i]._Db_Num_Sch;
   CurMemoryData.FieldByName('NumSchKr').Value := Docs[i]._Kr_Num_Sch;
   CurMemoryData.FieldByName('S').Value        := Docs[i]._kod_S;
   CurMemoryData.FieldByName('R').Value        := Docs[i]._kod_R;
   CurMemoryData.FieldByName('St').Value       := Docs[i]._kod_St;
   CurMemoryData.FieldByName('Kekv').Value     := Docs[i]._kod_Kekv;
   CurMemoryData.FieldByName('Summa').Value    := DoCurrFormat(FloatToStrF(Docs[i]._Summa, ffFixed, 100, 2));

   CurMemoryData.Post;
  end
  else if Docs[i]._Num_Doc <> Docs[i - 1]._Num_Doc then begin
   if DocCount > 1 then begin
    CurMemoryData.Append;
    CurMemoryData.Edit;

    CurMemoryData.FieldByName('NumSchKr').Value  := 'Разом:';
    CurMemoryData.FieldByName('Summa').Value     := DoCurrFormat(FloatToStrF(DocSum, ffFixed, 100, 2));

    CurMemoryData.Post;
   end
   else if CurMemoryData.RecordCount > 0 then begin
    if not VarIsNull(CurMemoryData.FieldByName('DocCell').Value) then begin
     CurMemoryData.Edit;

     s := CurMemoryData.FieldByName('DocCell').Value;
     CurMemoryData.FieldByName('DocCell').Value := s[1] + '1';

     CurMemoryData.Post;
    end;
   end;

   DocCount      := 1;
   DocSum        := Docs[i]._Summa;
   CustSum       := CustSum + Docs[i]._Summa;
   DocTotalSumma := DocTotalSumma + Docs[i]._Summa;

   CurMemoryData.Append;
   CurMemoryData.Edit;

   CurMemoryData.FieldByName('NumDoc').Value   := Docs[i]._Num_Doc;

   if Docs[i]._FIO <> '' then
    CurMemoryData.FieldByName('Note').Value     := Docs[i]._Note + '  (' + Docs[i]._FIO + ')'
   else
    CurMemoryData.FieldByName('Note').Value     := Docs[i]._Note;

   DateTimeToString(s, 'dd.mm.yy', Docs[i]._Date_Doc);
   CurMemoryData.FieldByName('DateDoc').Value := s;

   CurMemoryData.FieldByName('DateReg').Value := DateTimeToStr(Docs[i]._Date_Reg, f_Date_Reg);

   CurMemoryData.FieldByName('RegCell').Value  := '00';
   CurMemoryData.FieldByName('DocCell').Value  := '10';

   CurMemoryData.FieldByName('NumSchDb').Value := Docs[i]._Db_Num_Sch;
   CurMemoryData.FieldByName('NumSchKr').Value := Docs[i]._Kr_Num_Sch;
   CurMemoryData.FieldByName('S').Value        := Docs[i]._kod_S;
   CurMemoryData.FieldByName('R').Value        := Docs[i]._kod_R;
   CurMemoryData.FieldByName('St').Value       := Docs[i]._kod_St;
   CurMemoryData.FieldByName('Kekv').Value     := Docs[i]._kod_Kekv;
   CurMemoryData.FieldByName('Summa').Value    := DoCurrFormat(FloatToStrF(Docs[i]._Summa, ffFixed, 100, 2));

   CurMemoryData.Post;
  end
  else begin
   Inc(DocCount);

   DocSum        := DocSum + Docs[i]._Summa;
   CustSum       := CustSum + Docs[i]._Summa;
   DocTotalSumma := DocTotalSumma + Docs[i]._Summa;

   CurMemoryData.Append;
   CurMemoryData.Edit;


   CurMemoryData.FieldByName('RegCell').Value := '00';
   CurMemoryData.FieldByName('DocCell').Value := '00';

   CurMemoryData.FieldByName('NumSchDb').Value := Docs[i]._Db_Num_Sch;
   CurMemoryData.FieldByName('NumSchKr').Value := Docs[i]._Kr_Num_Sch;
   CurMemoryData.FieldByName('S').Value        := Docs[i]._kod_S;
   CurMemoryData.FieldByName('R').Value        := Docs[i]._kod_R;
   CurMemoryData.FieldByName('St').Value       := Docs[i]._kod_St;
   CurMemoryData.FieldByName('Kekv').Value     := Docs[i]._kod_Kekv;
   CurMemoryData.FieldByName('Summa').Value    := DoCurrFormat(FloatToStrF(Docs[i]._Summa, ffFixed, 100, 2));

   CurMemoryData.Post;
  end;
 end;

 if DocCount > 1 then begin
  CurMemoryData.Append;
  CurMemoryData.Edit;

  CurMemoryData.FieldByName('NumSchKr').Value := 'Разом:';
  CurMemoryData.FieldByName('Summa').Value    := DoCurrFormat(FloatToStrF(DocSum, ffFixed, 100, 2));

  CurMemoryData.Post;
 end;

 if CustCount > 1 then begin
  CurMemoryData.Last;
  CurMemoryData.Edit;

  CurMemoryData.FieldByName('RegCell').Value  := '01';
  CurMemoryData.FieldByName('DocCell').Value  := '01';

  CurMemoryData.Post;

  CurMemoryData.Append;
  CurMemoryData.Edit;

  CurMemoryData.FieldByName('Totals').Value   := '1';
  CurMemoryData.FieldByName('RegNum').Value   := 'Разом по контрагенту:';
  CurMemoryData.FieldByName('NumSchKr').Value := '';
  CurMemoryData.FieldByName('Summa').Value    := DoCurrFormat(FloatToStrF(CustSum, ffFixed, 100, 2));

  CurMemoryData.Post;
 end;

 CurMemoryData.Last;
 CurMemoryData.Edit;

 CurMemoryData.FieldByName('CustCell').Value := '01';
 CurMemoryData.FieldByName('RegCell').Value  := '01';
 CurMemoryData.FieldByName('DocCell').Value  := '01';

 CurMemoryData.Post;
end;

procedure Tjo9_PrintForm.DoOstDocsReport(Kredit: boolean);
var
 Docs      : TOstDocsArray;
 i         : integer;

 Num       : integer;
 Name_Cust : string;

// CustCount : integer;
 DocCount  : integer;
 CustSum   : currency;
 DocSum    : currency;
 s         : string;
begin
 DocTotalSumma := 0;

 ///////------------>>>>>>>>> Выбираю данные для формирования отчета

 if Kredit then
  DataSet.SelectSQL.Text := 'select * from JO9_DT_OST_SMET_SEL_REG(' + IntToStr(KEY_SESSION) + ','
  + IntToStr(SYS_INFO^._id_Reg_Uch) + ',1,' + QuotedStr(DateToStr(PrintFilter._Date_Beg)) + ','
  + QuotedStr(DateToStr(PrintFilter._Date_End)) + ')'
 else
  DataSet.SelectSQL.Text := 'select * from JO9_DT_OST_SMET_SEL_REG(' + IntToStr(KEY_SESSION) + ','
  + IntToStr(SYS_INFO^._id_Reg_Uch) + ',0,' + QuotedStr(DateToStr(PrintFilter._Date_Beg)) + ','
  + QuotedStr(DateToStr(PrintFilter._Date_End)) + ')';

 DataSet.Open;

 if DataSet.RecordCount > 0 then Step := 20 / DataSet.RecordCount;

 SetLength(Docs, DataSet.RecordCount);

 for i := 0 to DataSet.RecordCount - 1 do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  with Docs[i] do begin
   _Name_Cust := DataSet['NAME_CUSTOMER'];
    if VarIsNull(DataSet['REG_NUM']) then _Reg_Num := ''
    else _Reg_Num := DataSet['REG_NUM'];
   _Num_Doc   := DataSet['NUM_DOC'];
   _Date_Doc  := DataSet['DATE_DOC'];
   _Date_Move := DataSet['MOVE_DATE'];
   _Date_Reg  := DataSet['DATE_REG'];
   _Note      := DataSet['NOTE'];
   _Num_Sch   := DataSet['NUM_SCH'];
   _kod_S     := DataSet['KOD_S'];
   _kod_R     := DataSet['KOD_R'];
   _kod_St    := DataSet['KOD_ST'];
   _kod_Kekv  := DataSet['KOD_KEKV'];
   _Summa     := DataSet['SUMMA'];
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 if Length(Docs) = 0 then Exit;

 ////////////----------->>>>>>>>>> Формирую отчет

 Num       := 0;
 DocCount  := 0;
 Name_Cust := '_____________{}{}{}{}{}{}{}{}_____________';

 if Length(Docs) > 0 then Step := 80 / Length(Docs);

 for i := 0 to Length(Docs) - 1 do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  if Docs[i]._Name_Cust <> Name_Cust then begin
   if DocCount > 1 then begin
    OstMemoryData.Append;
    OstMemoryData.Edit;

    OstMemoryData.FieldByName('NumSch').Value   := 'Разом :';
    OstMemoryData.FieldByName('Summa').Value    := DoCurrFormat(FloatToStrF(DocSum, ffFixed, 100, 2));

    OstMemoryData.Post;
   end
   else if OstMemoryData.RecordCount > 0 then begin
    if not VarIsNull(OstMemoryData.FieldByName('CustCell').Value) then begin
     OstMemoryData.Edit;

     s := OstMemoryData.FieldByName('CustCell').Value;
     OstMemoryData.FieldByName('CustCell').Value := s[1] + '1';

     OstMemoryData.Post;
    end;

    if not VarIsNull(OstMemoryData.FieldByName('RegCell').Value) then begin
     OstMemoryData.Edit;

     s := OstMemoryData.FieldByName('RegCell').Value;
     OstMemoryData.FieldByName('RegCell').Value := s[1] + '1';

     OstMemoryData.Post;
    end;

    if not VarIsNull(OstMemoryData.FieldByName('DocCell').Value) then begin
     OstMemoryData.Edit;

     s := OstMemoryData.FieldByName('DocCell').Value;
     OstMemoryData.FieldByName('DocCell').Value := s[1] + '1';

     OstMemoryData.Post;
    end;
   end;

{   if CustCount > 1 then begin
    OstMemoryData.Append;
    OstMemoryData.Edit;

    OstMemoryData.FieldByName('Totals').Value  := '1';
    OstMemoryData.FieldByName('NumSch').Value  := '';
    OstMemoryData.FieldByName('RegNum').Value  := 'Разом по контрагенту :';
    OstMemoryData.FieldByName('Summa').Value   := DoCurrFormat(FloatToStrF(CustSum, ffFixed, 100, 2));

    OstMemoryData.Post;
   end;}

   Inc(Num);
   Name_Cust := Docs[i]._Name_Cust;

//   CustCount := 1;
   DocCount      := 1;

   CustSum       := Docs[i]._Summa;
   DocSum        := Docs[i]._Summa;
   DocTotalSumma := DocTotalSumma + Docs[i]._Summa;

   OstMemoryData.Append;
   OstMemoryData.Edit;

   OstMemoryData.FieldByName('Num').Value      := Num;
   OstMemoryData.FieldByName('CustName').Value := Docs[i]._Name_Cust;

   OstMemoryData.FieldByName('CustCell').Value := '10';
   OstMemoryData.FieldByName('RegCell').Value  := '10';
   OstMemoryData.FieldByName('DocCell').Value  := '10';

   OstMemoryData.FieldByName('RegNum').Value   := Docs[i]._Reg_Num;
   OstMemoryData.FieldByName('NumDoc').Value   := Docs[i]._Num_Doc;
   OstMemoryData.FieldByName('Note').Value     := Docs[i]._Note;

   DateTimeToString(s, 'dd.mm.yy', Docs[i]._Date_Doc);
   OstMemoryData.FieldByName('DateDoc').Value := s;

   OstMemoryData.FieldByName('DateReg').Value := DateTimeToStr(Docs[i]._Date_Reg, f_Date_Reg);

   DateTimeToString(s, 'dd.mm.yy', Docs[i]._Date_Move);
   OstMemoryData.FieldByName('DateMove').Value := s;

   OstMemoryData.FieldByName('NumSch').Value := Docs[i]._Num_Sch;
   OstMemoryData.FieldByName('S').Value      := Docs[i]._kod_S;
   OstMemoryData.FieldByName('R').Value      := Docs[i]._kod_R;
   OstMemoryData.FieldByName('St').Value     := Docs[i]._kod_St;
   OstMemoryData.FieldByName('Kekv').Value   := Docs[i]._kod_Kekv;
   OstMemoryData.FieldByName('Summa').Value  := DoCurrFormat(FloatToStrF(Docs[i]._Summa, ffFixed, 100, 2));

   OstMemoryData.Post;
  end
  else if Docs[i]._Reg_Num <> Docs[i - 1]._Reg_Num then begin
   if DocCount > 1 then begin
    OstMemoryData.Append;
    OstMemoryData.Edit;

    OstMemoryData.FieldByName('NumSch').Value  := 'Разом :';
    OstMemoryData.FieldByName('Summa').Value   := DoCurrFormat(FloatToStrF(DocSum, ffFixed, 100, 2));

    OstMemoryData.Post;
   end
   else if OstMemoryData.RecordCount > 0 then begin
    if not VarIsNull(OstMemoryData.FieldByName('RegCell').Value) then begin
     OstMemoryData.Edit;

     s := OstMemoryData.FieldByName('RegCell').Value;
     OstMemoryData.FieldByName('RegCell').Value := s[1] + '1';

     OstMemoryData.Post;
    end;

    if not VarIsNull(OstMemoryData.FieldByName('DocCell').Value) then begin
     OstMemoryData.Edit;

     s := OstMemoryData.FieldByName('DocCell').Value;
     OstMemoryData.FieldByName('DocCell').Value := s[1] + '1';

     OstMemoryData.Post;
    end;
   end;

   DocCount := 1;

   DocSum        := Docs[i]._Summa;
   CustSum       := CustSum + Docs[i]._Summa;
   DocTotalSumma := DocTotalSumma + Docs[i]._Summa;
//   Inc(CustCount);

   OstMemoryData.Append;
   OstMemoryData.Edit;

   OstMemoryData.FieldByName('RegNum').Value   := Docs[i]._Reg_Num;
   OstMemoryData.FieldByName('NumDoc').Value   := Docs[i]._Num_Doc;
   OstMemoryData.FieldByName('Note').Value     := Docs[i]._Note;

   DateTimeToString(s, 'dd.mm.yy', Docs[i]._Date_Doc);
   OstMemoryData.FieldByName('DateDoc').Value := s;

   OstMemoryData.FieldByName('DateReg').Value := DateTimeToStr(Docs[i]._Date_Reg, f_Date_Reg);

   DateTimeToString(s, 'dd.mm.yy', Docs[i]._Date_Move);
   OstMemoryData.FieldByName('DateMove').Value := s;

   OstMemoryData.FieldByName('RegCell').Value := '10';
   OstMemoryData.FieldByName('DocCell').Value := '10';

   OstMemoryData.FieldByName('NumSch').Value := Docs[i]._Num_Sch;
   OstMemoryData.FieldByName('S').Value      := Docs[i]._kod_S;
   OstMemoryData.FieldByName('R').Value      := Docs[i]._kod_R;
   OstMemoryData.FieldByName('St').Value     := Docs[i]._kod_St;
   OstMemoryData.FieldByName('Kekv').Value   := Docs[i]._kod_Kekv;
   OstMemoryData.FieldByName('Summa').Value  := DoCurrFormat(FloatToStrF(Docs[i]._Summa, ffFixed, 100, 2));

   OstMemoryData.Post;
  end
  else if Docs[i]._Num_Doc <> Docs[i - 1]._Num_Doc then begin
   if DocCount > 1 then begin
    OstMemoryData.Append;
    OstMemoryData.Edit;

    OstMemoryData.FieldByName('NumSch').Value  := 'Разом :';
    OstMemoryData.FieldByName('Summa').Value   := DoCurrFormat(FloatToStrF(DocSum, ffFixed, 100, 2));

    OstMemoryData.Post;
   end
   else if OstMemoryData.RecordCount > 0 then begin
    if not VarIsNull(OstMemoryData.FieldByName('DocCell').Value) then begin
     OstMemoryData.Edit;

     s := OstMemoryData.FieldByName('DocCell').Value;
     OstMemoryData.FieldByName('DocCell').Value := s[1] + '1';

     OstMemoryData.Post;
    end;
   end;

   DocCount := 1;

   DocSum        := Docs[i]._Summa;
   CustSum       := CustSum + Docs[i]._Summa;
   DocTotalSumma := DocTotalSumma + Docs[i]._Summa;

   OstMemoryData.Append;
   OstMemoryData.Edit;

   OstMemoryData.FieldByName('NumDoc').Value   := Docs[i]._Num_Doc;
   OstMemoryData.FieldByName('Note').Value     := Docs[i]._Note;

   DateTimeToString(s, 'dd.mm.yy', Docs[i]._Date_Doc);
   OstMemoryData.FieldByName('DateDoc').Value := s;

   OstMemoryData.FieldByName('DateReg').Value := DateTimeToStr(Docs[i]._Date_Reg, f_Date_Reg);

   DateTimeToString(s, 'dd.mm.yy', Docs[i]._Date_Move);
   OstMemoryData.FieldByName('DateMove').Value := s;

   OstMemoryData.FieldByName('RegCell').Value  := '00';
   OstMemoryData.FieldByName('DocCell').Value  := '10';

   OstMemoryData.FieldByName('NumSch').Value   := Docs[i]._Num_Sch;
   OstMemoryData.FieldByName('S').Value        := Docs[i]._kod_S;
   OstMemoryData.FieldByName('R').Value        := Docs[i]._kod_R;
   OstMemoryData.FieldByName('St').Value       := Docs[i]._kod_St;
   OstMemoryData.FieldByName('Kekv').Value     := Docs[i]._kod_Kekv;
   OstMemoryData.FieldByName('Summa').Value    := DoCurrFormat(FloatToStrF(Docs[i]._Summa, ffFixed, 100, 2));

   OstMemoryData.Post;
  end
  else begin
   Inc(DocCount);

   DocSum        := DocSum + Docs[i]._Summa;
   CustSum       := CustSum + Docs[i]._Summa;
   DocTotalSumma := DocTotalSumma + Docs[i]._Summa;

   OstMemoryData.Append;
   OstMemoryData.Edit;


   OstMemoryData.FieldByName('RegCell').Value := '00';
   OstMemoryData.FieldByName('DocCell').Value := '00';

   OstMemoryData.FieldByName('NumSch').Value  := Docs[i]._Num_Sch;
   OstMemoryData.FieldByName('S').Value       := Docs[i]._kod_S;
   OstMemoryData.FieldByName('R').Value       := Docs[i]._kod_R;
   OstMemoryData.FieldByName('St').Value      := Docs[i]._kod_St;
   OstMemoryData.FieldByName('Kekv').Value    := Docs[i]._kod_Kekv;
   OstMemoryData.FieldByName('Summa').Value   := DoCurrFormat(FloatToStrF(Docs[i]._Summa, ffFixed, 100, 2));

   OstMemoryData.Post;
  end;
 end;

 if DocCount > 1 then begin
  OstMemoryData.Append;
  OstMemoryData.Edit;

  OstMemoryData.FieldByName('NumSch').Value := 'Разом :';
  OstMemoryData.FieldByName('Summa').Value  := DoCurrFormat(FloatToStrF(DocSum, ffFixed, 100, 2));

  OstMemoryData.Post;
 end;

{ if CustCount > 1 then begin
  OstMemoryData.Last;
  OstMemoryData.Edit;

  OstMemoryData.FieldByName('RegCell').Value  := '01';
  OstMemoryData.FieldByName('DocCell').Value  := '01';

  OstMemoryData.Post;

  OstMemoryData.Append;
  OstMemoryData.Edit;

  OstMemoryData.FieldByName('Totals').Value  := '1';
  OstMemoryData.FieldByName('RegNum').Value  := 'Разом по контрагенту :';
  OstMemoryData.FieldByName('Summa').Value   := DoCurrFormat(FloatToStrF(CustSum, ffFixed, 100, 2));

  OstMemoryData.Post;
 end;}


 OstMemoryData.Last;
 OstMemoryData.Edit;

 OstMemoryData.FieldByName('CustCell').Value := '01';
 OstMemoryData.FieldByName('RegCell').Value  := '01';
 OstMemoryData.FieldByName('DocCell').Value  := '01';

 OstMemoryData.Post;
end;

procedure Tjo9_PrintForm.FormCreate(Sender: TObject);
begin
 Height := 212;
// Brush.Style := bsClear;

 f_Date_Reg.DateSeparator := '/';
 f_Date_Reg.ShortDateFormat := 'mm/yyyy';
 f_Date_Reg.LongDateFormat  := 'mm/yyyy';
end;

procedure Tjo9_PrintForm.FillSchTotals;
begin
{ JOTotalsMData.EmptyTable;

 DataSet.SelectSQL.Text := 'select * from JO9_IN_CUR_PROV_BUFF_SEL_SCH('
 + IntToStr(KEY_SESSION) + ') order by num_sch';
 DataSet.Open;

 while not DataSet.Eof do begin
  JOTotalsMData.Append;
  JOTotalsMData.Edit;

  JOTotalsMData.FieldByName('Num_Sch').Value := DataSet.FieldByName('NUM_SCH').AsString;
  JOTotalsMData.FieldByName('In_Db').Value   := DoCurrFormat(FloatToStrF(DataSet.FieldByName('IN_DB').AsCurrency, ffFixed, 100, 2));
  JOTotalsMData.FieldByName('In_Kr').Value   := DoCurrFormat(FloatToStrF(DataSet.FieldByName('IN_KR').AsCurrency, ffFixed, 100, 2));
  JOTotalsMData.FieldByName('Cur_Db').Value  := DoCurrFormat(FloatToStrF(DataSet.FieldByName('CUR_DB').AsCurrency, ffFixed, 100, 2));
  JOTotalsMData.FieldByName('Cur_Kr').Value  := DoCurrFormat(FloatToStrF(DataSet.FieldByName('CUR_KR').AsCurrency, ffFixed, 100, 2));
  JOTotalsMData.FieldByName('Out_Db').Value  := DoCurrFormat(FloatToStrF(DataSet.FieldByName('OUT_DB').AsCurrency, ffFixed, 100, 2));
  JOTotalsMData.FieldByName('Out_Kr').Value  := DoCurrFormat(FloatToStrF(DataSet.FieldByName('OUT_KR').AsCurrency, ffFixed, 100, 2));


  JOTotalsMData.Post;

  DataSet.Next;
 end;

 DataSet.Close;

 JOTotalsMData.First;}
end;

function Tjo9_PrintForm.CloseSch: boolean;
var
 i, j : integer;
 SCH  : KERNEL_SCH_MNGR_STRUCTURE;
 RES  : RESULT_STRUCTURE;

 SchArray : TInCurBuffer;
begin
 DataSet.SelectSQL.Text := 'select * from JO9_IN_CUR_PROV_BUFF_SEL_SCH(' + IntToStr(KEY_SESSION) + ')';
 DataSet.Open;

 while not DataSet.Eof do begin
  SetLength(SchArray, Length(SchArray) + 1);

  SchArray[Length(SchArray) - 1]._ID_SCH := DataSet.FieldByName('ID_SCH').AsInteger;
  SchArray[Length(SchArray) - 1]._IN_DB  := DataSet.FieldByName('IN_DB').AsCurrency;
  SchArray[Length(SchArray) - 1]._IN_KR  := DataSet.FieldByName('IN_KR').AsCurrency;
  SchArray[Length(SchArray) - 1]._CUR_DB := DataSet.FieldByName('CUR_DB').AsCurrency;
  SchArray[Length(SchArray) - 1]._CUR_KR := DataSet.FieldByName('CUR_KR').AsCurrency;
  SchArray[Length(SchArray) - 1]._OUT_DB := DataSet.FieldByName('OUT_DB').AsCurrency;
  SchArray[Length(SchArray) - 1]._OUT_KR := DataSet.FieldByName('OUT_KR').AsCurrency;

  DataSet.Next;
 end;

 DataSet.Close;

 for i := 0 to Length(SYS_INFO^._Native_Sch^) - 1 do begin
  SCH.DBHANDLE    := Database.Handle;
  SCH.TRHANDLE    := WriteTransaction.Handle;
  SCH.ID_USER     := SYS_INFO^._id_PCard;
  SCH.ID_SCH      := SYS_INFO^._Native_Sch^[i]._id_Sch;

  SCH.MODE         := 1;
  SCH.KR_SALDO_IN  := 0;
  SCH.DB_SALDO_IN  := 0;
  SCH.KR_OBOR      := 0;
  SCH.DB_OBOR      := 0;
  SCH.DB_SALDO_OUT := 0;
  SCH.KR_SALDO_OUT := 0;

  for j := 0 to Length(SchArray) - 1 do
   if SchArray[j]._ID_SCH = SCH.ID_SCH then begin
    SCH.KR_SALDO_IN  := SchArray[j]._IN_KR;
    SCH.DB_SALDO_IN  := SchArray[j]._IN_DB;
    SCH.KR_OBOR      := SchArray[j]._CUR_KR;
    SCH.DB_OBOR      := SchArray[j]._CUR_DB;
    SCH.KR_SALDO_OUT := SchArray[j]._OUT_KR;
    SCH.DB_SALDO_OUT := SchArray[j]._OUT_DB;

    Break;
   end;

  try
   RES := SchManager(@SCH);
  except on e : Exception do begin
    ShowMessage(e.Message);
    Result := False;
    Exit;
   end;
  end;

  if RES.RESULT_CODE = 0 then begin
   ShowMessage(RES.RESULT_MESSAGE);
   Result := False;
   Exit;
  end;
 end;

 Result := True;
end;

function Tjo9_PrintForm.OpenSch: boolean;
var
 i, j : integer;
 SCH  : KERNEL_SCH_MNGR_STRUCTURE;
 RES  : RESULT_STRUCTURE;
 Flag : boolean;

 s    : TSchArray;
begin
 Result := False;

 for i := 0 to Length(SYS_INFO^._Native_Sch^) - 1 do begin
  SCH.DBHANDLE    := Database.Handle;
  SCH.TRHANDLE    := WriteTransaction.Handle;
  SCH.ID_USER     := SYS_INFO^._id_PCard;
  SCH.ID_SCH      := SYS_INFO^._Native_Sch^[i]._id_Sch;

  SCH.MODE        := 2;

  RES := SchManager(@SCH);

  if RES.RESULT_CODE = 0 then begin
   ShowMessage(RES.RESULT_MESSAGE);
   Exit;
  end;
 end;

 // Откатываю счета, которые были закрыты (DATE_END) в предыдщем периоде, но активны в текущем (OPEN_SCH)
 GetNativeSch(ReadTransaction, s, IncMonth(EncodeDate(SYS_YEAR, SYS_MONTH, 1), -1));

 for j := 0 to Length(s) - 1 do begin
  Flag := False;

  for i := 0 to Length(SYS_INFO^._Native_Sch^) - 1 do
   if SYS_INFO^._Native_Sch^[i]._id_Sch = s[j]._id_Sch then begin
    Flag := True;
    Break;
   end;

  if Flag then Continue;

  SCH.DBHANDLE    := Database.Handle;
  SCH.TRHANDLE    := WriteTransaction.Handle;
  SCH.ID_USER     := SYS_INFO^._id_PCard;
  SCH.ID_SCH      := s[j]._id_Sch;

  SCH.MODE        := 2;

  RES := SchManager(@SCH);

  if RES.RESULT_CODE = 0 then begin
   ShowMessage(RES.RESULT_MESSAGE);
   Exit;
  end;
 end;

 Result := True;
end;

procedure Tjo9_PrintForm.ReportBeforePrint(Sender: TfrxReportComponent);
var
 m : TfrxMasterData;
 c : TfrxColumnHeader;
begin
 if PrintFilter._PrintKind <> JO9_AKT_SVERKI then
  begin

 if PrintFilter._Font_Name = '' then Exit;

 m := TfrxMasterData(Report.FindObject('MasterData1'));
 if m <> nil then begin
  m.Font.Name := PrintFilter._Font_Name;
  m.Font.Size := PrintFilter._Font_Size;
 end;

 if PrintKind = JO9_REPORT_SCH then begin
  m := TfrxMasterData(Report.FindObject('MasterData2'));
  if m <> nil then begin
   m.Font.Name := PrintFilter._Font_Name;
   m.Font.Size := PrintFilter._Font_Size;
  end;
 end
 else if PrintKind = JO9_REPORT_OST then begin
  ShowMessage('ColumnHeader1');
  c := TfrxColumnHeader(Report.FindObject('ColumnHeader1'));
  if c <> nil then begin
   c.Font.Name := PrintFilter._Font_Name;
   c.Font.Size := PrintFilter._Font_Size;
  end;
 end;
 end;

end;

procedure Tjo9_PrintForm.OrderSch(InSch : PPrintSchArray);
var
 i, j : integer;
 s : string;

 k : integer;

 Flag : boolean;
 Last : integer;
 Temp : array of integer;
begin
 SchOrderMData.Open;
 SchOrderMData.EmptyTable;

 for i := 0 to Length(InSch^) - 1 do begin
  if not ((InSch^[i]._Kind = 'CUR_DB') or (InSch^[i]._Kind = 'CUR_KR')) then Continue;

  Flag := True;
  for j := 0 to Length(Temp) - 1 do
   if Temp[j] = InSch^[i]._id_Sch_Cor then begin
    Flag := False;
    Break;
   end;

  if Flag then begin
   SetLength(Temp, Length(Temp) + 1);
   Temp[Length(Temp) - 1] := InSch^[i]._id_Sch_Cor;
  end
  else Continue;

  s := InSch^[i]._Num_Sch_C;

  k    := 0;
  Last := 0;

  SchOrderMData.Append;

  SchOrderMData.Edit;
  SchOrderMData.FieldByName('id_Sch').Value := InSch^[i]._id_Sch_Cor;
  SchOrderMData.Post;

  for j := 1 to Length(s) do begin
   if not (s[j] in ['0'..'9']) then begin
    Inc(k);

    SchOrderMData.Edit;
    SchOrderMData.FieldByName('Field' + IntToStr(k)).Value := StrToInt(Copy(s, Last + 1, j - Last - 1));
    SchOrderMData.Post;

    Last := j;
   end;
  end;

  Inc(k);

  SchOrderMData.Edit;

  if s = '' then SchOrderMData.Fields[k].Value := 0
  else SchOrderMData.Fields[k].Value := StrToInt(Copy(s, Last + 1, Length(s) - Last));

  SchOrderMData.Post;

 end;

 SchOrderMData.SortOnFields('Field1;Field2;Field3;Field4;Field5');
end;

procedure Tjo9_PrintForm.Print_Sch_Grp;
var
 s : string;
 o : string;
 i : integer;

 Fst, Snd, Trd, Fth : integer;

 Count : integer;

 Tot_Res : TResultRecord;
 Fst_Res : TResultRecord;
 Snd_Res : TResultRecord;
 Trd_Res : TResultRecord;
 Fth_Res : TResultRecord;

 id_S    : integer;
 id_R    : integer;
 id_St   : integer;
 id_Kekv : integer;

 Line : integer;

 procedure NullRes(var InRes : TResultRecord);
 begin
  InRes._Rec_Count := 0;
  InRes._In_Db     := null;
  InRes._In_Kr     := null;
  InRes._Cur_Db    := null;
  InRes._Cur_Kr    := null;
  InRes._Out_Db    := null;
  InRes._Out_Kr    := null;
 end;

 procedure AddIn;
 var
  a : boolean;
  c : integer;
 begin
  // Входящее сальдо

  DataSet.SelectSQL.Text := 'select * from JO9_PRINT_S_R_ST_SEL_IN('
  + IntToStr(KEY_SESSION) + ',' + IntToStr(id_S) + ',' + IntToStr(id_R) + ','
  + IntToStr(id_St) + ',' + IntToStr(id_Kekv) + ') order by NUM_SCH';

  DataSet.Open;

  a := True;
  c := 0;
  while not DataSet.Eof do begin
   inc(c);

   if not a then GrMemoryData.Append else a := False;

   GrMemoryData.Edit;

   GrMemoryData.FieldByName('In_Sch').Value  := DataSet['NUM_SCH'];

   GrMemoryData.FieldByName('In_Db').Value := DoCurrFormat(FloatToStrF(DataSet['IN_DB'], ffFixed, 100, 2));
   GrMemoryData.FieldByName('In_Kr').Value := DoCurrFormat(FloatToStrF(DataSet['IN_KR'], ffFixed, 100, 2));

   GrMemoryData.Post;

   if VarIsNull(Fst_Res._In_Db) then Fst_Res._In_Db  := DataSet['IN_DB'] else Fst_Res._In_Db := Fst_Res._In_Db + DataSet['IN_DB'];
   if VarIsNull(Fst_Res._In_Kr) then Fst_Res._In_Kr  := DataSet['IN_KR'] else Fst_Res._In_Kr := Fst_Res._In_Kr + DataSet['IN_KR'];
   if VarIsNull(Snd_Res._In_Db) then Snd_Res._In_Db  := DataSet['IN_DB'] else Snd_Res._In_Db := Snd_Res._In_Db + DataSet['IN_DB'];
   if VarIsNull(Snd_Res._In_Kr) then Snd_Res._In_Kr  := DataSet['IN_KR'] else Snd_Res._In_Kr := Snd_Res._In_Kr + DataSet['IN_KR'];
   if VarIsNull(Trd_Res._In_Db) then Trd_Res._In_Db  := DataSet['IN_DB'] else Trd_Res._In_Db := Trd_Res._In_Db + DataSet['IN_DB'];
   if VarIsNull(Trd_Res._In_Kr) then Trd_Res._In_Kr  := DataSet['IN_KR'] else Trd_Res._In_Kr := Trd_Res._In_Kr + DataSet['IN_KR'];
   if VarIsNull(Fth_Res._In_Db) then Fth_Res._In_Db  := DataSet['IN_DB'] else Fth_Res._In_Db := Fth_Res._In_Db + DataSet['IN_DB'];
   if VarIsNull(Fth_Res._In_Kr) then Fth_Res._In_Kr  := DataSet['IN_KR'] else Fth_Res._In_Kr := Fth_Res._In_Kr + DataSet['IN_KR'];

   DataSet.Next;
  end;

  DataSet.Close;

  if c > Fth_Res._Rec_Count then Fth_Res._Rec_Count := c;
 end;

 procedure AddCur(is_Db : boolean);
 var
  rec : integer;
  c   : integer;
 begin
  // Обороты

  rec := GrMemoryData.RecNo;

  if is_Db then
   DataSet.SelectSQL.Text := 'select * from JO9_PRINT_S_R_ST_SEL_CUR('
   + IntToStr(KEY_SESSION) + ',' + IntToStr(id_S) + ',' + IntToStr(id_R) + ','
   + IntToStr(id_St) + ',' + IntToStr(id_Kekv) + ', 1) order by NUM_SCH_COR'
  else
   DataSet.SelectSQL.Text := 'select * from JO9_PRINT_S_R_ST_SEL_CUR('
   + IntToStr(KEY_SESSION) + ',' + IntToStr(id_S) + ',' + IntToStr(id_R) + ','
   + IntToStr(id_St) + ',' + IntToStr(id_Kekv) + ', 0) order by NUM_SCH_COR';

  DataSet.Open;

  c := 0;
  while not DataSet.Eof do begin
   inc(c);

   if rec > GrMemoryData.RecordCount then begin
    GrMemoryData.Append;
    GrMemoryData.Edit;

    GrMemoryData.FieldByName('FstFrame').Value := '00';
    GrMemoryData.FieldByName('SndFrame').Value := '00';
    GrMemoryData.FieldByName('TrdFrame').Value := '00';
    GrMemoryData.FieldByName('FthFrame').Value := '00';

    GrMemoryData.Post;
   end;

   GrMemoryData.Edit;

   
   if is_Db then begin
    GrMemoryData.FieldByName('Cur_Db_Sch_N').Value := DataSet['NUM_SCH_N'];//SYS_INFO^._Native_Sch^[0]._Num_Sch;
    GrMemoryData.FieldByName('Cur_Db_Sch_Cor').Value := DataSet['NUM_SCH_COR'];

    if not VarIsNull(DataSet['CUR_SUM']) then GrMemoryData.FieldByName('Cur_Db_Sum').Value := DoCurrFormat(FloatToStrF(DataSet['CUR_SUM'], ffFixed, 100, 2));

    if VarIsNull(Fst_Res._Cur_Db) then Fst_Res._Cur_Db  := DataSet['CUR_SUM'] else Fst_Res._Cur_Db := Fst_Res._Cur_Db + DataSet['CUR_SUM'];
    if VarIsNull(Snd_Res._Cur_Db) then Snd_Res._Cur_Db  := DataSet['CUR_SUM'] else Snd_Res._Cur_Db := Snd_Res._Cur_Db + DataSet['CUR_SUM'];
    if VarIsNull(Trd_Res._Cur_Db) then Trd_Res._Cur_Db  := DataSet['CUR_SUM'] else Trd_Res._Cur_Db := Trd_Res._Cur_Db + DataSet['CUR_SUM'];
    if VarIsNull(Fth_Res._Cur_Db) then Fth_Res._Cur_Db  := DataSet['CUR_SUM'] else Fth_Res._Cur_Db := Fth_Res._Cur_Db + DataSet['CUR_SUM'];
   end
   else begin
    GrMemoryData.FieldByName('Cur_Kr_Sch_N').Value := DataSet['NUM_SCH_N'];//SYS_INFO^._Native_Sch^[0]._Num_Sch;
    GrMemoryData.FieldByName('Cur_Kr_Sch_Cor').Value := DataSet['NUM_SCH_COR'];

    if not VarIsNull(DataSet['CUR_SUM']) then GrMemoryData.FieldByName('Cur_Kr_Sum').Value := DoCurrFormat(FloatToStrF(DataSet['CUR_SUM'], ffFixed, 100, 2));

    if VarIsNull(Fst_Res._Cur_Kr) then Fst_Res._Cur_Kr  := DataSet['CUR_SUM'] else Fst_Res._Cur_Kr := Fst_Res._Cur_Kr + DataSet['CUR_SUM'];
    if VarIsNull(Snd_Res._Cur_Kr) then Snd_Res._Cur_Kr  := DataSet['CUR_SUM'] else Snd_Res._Cur_Kr := Snd_Res._Cur_Kr + DataSet['CUR_SUM'];
    if VarIsNull(Trd_Res._Cur_Kr) then Trd_Res._Cur_Kr  := DataSet['CUR_SUM'] else Trd_Res._Cur_Kr := Trd_Res._Cur_Kr + DataSet['CUR_SUM'];
    if VarIsNull(Fth_Res._Cur_Kr) then Fth_Res._Cur_Kr  := DataSet['CUR_SUM'] else Fth_Res._Cur_Kr := Fth_Res._Cur_Kr + DataSet['CUR_SUM'];
   end;
   GrMemoryData.Post;
   GrMemoryData.Last;
   Inc(rec);
   DataSet.Next;
  end;

  if c > Fth_Res._Rec_Count then Fth_Res._Rec_Count := c;

  DataSet.Close;
 end;

 procedure AddOut;
 var
  a : boolean;
  c : integer;
 begin
  // Исходящее сальдо

  DataSet.SelectSQL.Text := 'select * from JO9_PRINT_S_R_ST_SEL_OUT('
  + IntToStr(KEY_SESSION) + ','
  + IntToStr(id_S) + ',' + IntToStr(id_R) + ',' + IntToStr(id_St) + ','
  + IntToStr(id_Kekv) + ') order by NUM_SCH';

  DataSet.Open;

  a := True;
  c := 0;
  while not DataSet.Eof do begin
   inc(c);

   if not a then GrMemoryData.Append else a := False;

   GrMemoryData.Edit;

   GrMemoryData.FieldByName('Out_Sch').Value := DataSet['NUM_SCH'];

   if not VarIsNull(DataSet['OUT_DB']) then GrMemoryData.FieldByName('Out_Db').Value := DoCurrFormat(FloatToStrF(DataSet['OUT_DB'], ffFixed, 100, 2));
   if not VarIsNull(DataSet['OUT_KR']) then GrMemoryData.FieldByName('Out_Kr').Value := DoCurrFormat(FloatToStrF(DataSet['OUT_KR'], ffFixed, 100, 2));

   GrMemoryData.Post;

   if VarIsNull(Fst_Res._Out_Db) then Fst_Res._Out_Db  := DataSet['OUT_DB'] else Fst_Res._Out_Db := Fst_Res._Out_Db + DataSet['OUT_DB'];
   if VarIsNull(Fst_Res._Out_Kr) then Fst_Res._Out_Kr  := DataSet['OUT_KR'] else Fst_Res._Out_Kr := Fst_Res._Out_Kr + DataSet['OUT_KR'];
   if VarIsNull(Snd_Res._Out_Db) then Snd_Res._Out_Db  := DataSet['OUT_DB'] else Snd_Res._Out_Db := Snd_Res._Out_Db + DataSet['OUT_DB'];
   if VarIsNull(Snd_Res._Out_Kr) then Snd_Res._Out_Kr  := DataSet['OUT_KR'] else Snd_Res._Out_Kr := Snd_Res._Out_Kr + DataSet['OUT_KR'];
   if VarIsNull(Trd_Res._Out_Db) then Trd_Res._Out_Db  := DataSet['OUT_DB'] else Trd_Res._Out_Db := Trd_Res._Out_Db + DataSet['OUT_DB'];
   if VarIsNull(Trd_Res._Out_Kr) then Trd_Res._Out_Kr  := DataSet['OUT_KR'] else Trd_Res._Out_Kr := Trd_Res._Out_Kr + DataSet['OUT_KR'];
   if VarIsNull(Fth_Res._Out_Db) then Fth_Res._Out_Db  := DataSet['OUT_DB'] else Fth_Res._Out_Db := Fth_Res._Out_Db + DataSet['OUT_DB'];
   if VarIsNull(Fth_Res._Out_Kr) then Fth_Res._Out_Kr  := DataSet['OUT_KR'] else Fth_Res._Out_Kr := Fth_Res._Out_Kr + DataSet['OUT_KR'];

   DataSet.Next;
  end;

  DataSet.Close;

  if c > Fth_Res._Rec_Count then Fth_Res._Rec_Count := c;
 end;

 procedure AddSumms;
 begin
  // Добавляю результирующие строки по каждому из группируемых элементов

  if (SRStArray[i]._id_Fth <> Fth)
  or (SRStArray[i]._id_Trd <> Trd)
  or (SRStArray[i]._id_Snd <> Snd)
  or (SRStArray[i]._id_Fst <> Fst) then begin
   if Fth_Res._Rec_Count > 1 then begin
    GrMemoryData.Append;
    GrMemoryData.Edit;

    GrMemoryData.FieldByName('ResKind').Value := '1';
    GrMemoryData.FieldByName('Kod_Fth').Value := 'Разом : ';

    if not VarIsNull(Fth_Res._In_Db)  then GrMemoryData.FieldByName('In_Db').Value := DoCurrFormat(FloatToStrF(Fth_Res._In_Db, ffFixed, 100, 2)) else GrMemoryData.FieldByName('In_Db').Value := FloatToStrF(0.00, ffFixed, 100, 2);
    if not VarIsNull(Fth_Res._In_Kr)  then GrMemoryData.FieldByName('In_Kr').Value := DoCurrFormat(FloatToStrF(Fth_Res._In_Kr, ffFixed, 100, 2)) else GrMemoryData.FieldByName('In_Kr').Value := FloatToStrF(0.00, ffFixed, 100, 2);
    if not VarIsNull(Fth_Res._Cur_Db) then GrMemoryData.FieldByName('Cur_Db_Sum').Value := DoCurrFormat(FloatToStrF(Fth_Res._Cur_Db, ffFixed, 100, 2));
    if not VarIsNull(Fth_Res._Cur_Kr) then GrMemoryData.FieldByName('Cur_Kr_Sum').Value := DoCurrFormat(FloatToStrF(Fth_Res._Cur_Kr, ffFixed, 100, 2));
    if not VarIsNull(Fth_Res._Out_Db) then GrMemoryData.FieldByName('Out_Db').Value := DoCurrFormat(FloatToStrF(Fth_Res._Out_Db, ffFixed, 100, 2));
    if not VarIsNull(Fth_Res._Out_Kr) then GrMemoryData.FieldByName('Out_Kr').Value := DoCurrFormat(FloatToStrF(Fth_Res._Out_Kr, ffFixed, 100, 2));

    GrMemoryData.Post;
   end;

   NullRes(Fth_Res);
  end;
  if (SRStArray[i]._id_Trd <> Trd)
  or (SRStArray[i]._id_Snd <> Snd)
  or (SRStArray[i]._id_Fst <> Fst) then begin
   if Trd_Res._Rec_Count > 1 then begin
    GrMemoryData.Append;
    GrMemoryData.Edit;

    GrMemoryData.FieldByName('ResKind').Value := '1';
    GrMemoryData.FieldByName('Kod_Trd').Value := 'Разом : ';

    if not VarIsNull(Trd_Res._In_Db)  then GrMemoryData.FieldByName('In_Db').Value := DoCurrFormat(FloatToStrF(Trd_Res._In_Db, ffFixed, 100, 2)) else GrMemoryData.FieldByName('In_Db').Value := FloatToStrF(0.00, ffFixed, 100, 2);
    if not VarIsNull(Trd_Res._In_Kr)  then GrMemoryData.FieldByName('In_Kr').Value := DoCurrFormat(FloatToStrF(Trd_Res._In_Kr, ffFixed, 100, 2)) else GrMemoryData.FieldByName('In_Kr').Value := FloatToStrF(0.00, ffFixed, 100, 2);
    if not VarIsNull(Trd_Res._Cur_Db) then GrMemoryData.FieldByName('Cur_Db_Sum').Value := DoCurrFormat(FloatToStrF(Trd_Res._Cur_Db, ffFixed, 100, 2));
    if not VarIsNull(Trd_Res._Cur_Kr) then GrMemoryData.FieldByName('Cur_Kr_Sum').Value := DoCurrFormat(FloatToStrF(Trd_Res._Cur_Kr, ffFixed, 100, 2));
    if not VarIsNull(Trd_Res._Out_Db) then GrMemoryData.FieldByName('Out_Db').Value := DoCurrFormat(FloatToStrF(Trd_Res._Out_Db, ffFixed, 100, 2));
    if not VarIsNull(Trd_Res._Out_Kr) then GrMemoryData.FieldByName('Out_Kr').Value := DoCurrFormat(FloatToStrF(Trd_Res._Out_Kr, ffFixed, 100, 2));

    GrMemoryData.Post;
   end;

   NullRes(Trd_Res);
   NullRes(Fth_Res);
  end;

  if (SRStArray[i]._id_Snd <> Snd)
  or (SRStArray[i]._id_Fst <> Fst) then begin
   if Snd_Res._Rec_Count > 1 then begin
    GrMemoryData.Append;
    GrMemoryData.Edit;

    GrMemoryData.FieldByName('ResKind').Value := '1';
    GrMemoryData.FieldByName('Kod_Snd').Value := 'Разом : ';

    if not VarIsNull(Snd_Res._In_Db)  then GrMemoryData.FieldByName('In_Db').Value := DoCurrFormat(FloatToStrF(Snd_Res._In_Db, ffFixed, 100, 2)) else GrMemoryData.FieldByName('In_Db').Value := FloatToStrF(0.00, ffFixed, 100, 2);
    if not VarIsNull(Snd_Res._In_Kr)  then GrMemoryData.FieldByName('In_Kr').Value := DoCurrFormat(FloatToStrF(Snd_Res._In_Kr, ffFixed, 100, 2)) else GrMemoryData.FieldByName('In_Kr').Value := FloatToStrF(0.00, ffFixed, 100, 2);
    if not VarIsNull(Snd_Res._Cur_Db) then GrMemoryData.FieldByName('Cur_Db_Sum').Value := DoCurrFormat(FloatToStrF(Snd_Res._Cur_Db, ffFixed, 100, 2));
    if not VarIsNull(Snd_Res._Cur_Kr) then GrMemoryData.FieldByName('Cur_Kr_Sum').Value := DoCurrFormat(FloatToStrF(Snd_Res._Cur_Kr, ffFixed, 100, 2));
    if not VarIsNull(Snd_Res._Out_Db) then GrMemoryData.FieldByName('Out_Db').Value := DoCurrFormat(FloatToStrF(Snd_Res._Out_Db, ffFixed, 100, 2));
    if not VarIsNull(Snd_Res._Out_Kr) then GrMemoryData.FieldByName('Out_Kr').Value := DoCurrFormat(FloatToStrF(Snd_Res._Out_Kr, ffFixed, 100, 2));

    GrMemoryData.Post;
   end;

   NullRes(Snd_Res);
   NullRes(Trd_Res);
   NullRes(Fth_Res);
  end;

  if SRStArray[i]._id_Fst <> Fst then begin
   if Fst_Res._Rec_Count > 1 then begin
    GrMemoryData.Append;
    GrMemoryData.Edit;

    GrMemoryData.FieldByName('ResKind').Value := '1';
    GrMemoryData.FieldByName('Name_Fst').Value := 'Разом : ';

    if not VarIsNull(Fst_Res._In_Db)  then GrMemoryData.FieldByName('In_Db').Value := DoCurrFormat(FloatToStrF(Fst_Res._In_Db, ffFixed, 100, 2)) else GrMemoryData.FieldByName('In_Db').Value := FloatToStrF(0.00, ffFixed, 100, 2);
    if not VarIsNull(Fst_Res._In_Kr)  then GrMemoryData.FieldByName('In_Kr').Value := DoCurrFormat(FloatToStrF(Fst_Res._In_Kr, ffFixed, 100, 2)) else GrMemoryData.FieldByName('In_Kr').Value := FloatToStrF(0.00, ffFixed, 100, 2);
    if not VarIsNull(Fst_Res._Cur_Db) then GrMemoryData.FieldByName('Cur_Db_Sum').Value := DoCurrFormat(FloatToStrF(Fst_Res._Cur_Db, ffFixed, 100, 2));
    if not VarIsNull(Fst_Res._Cur_Kr) then GrMemoryData.FieldByName('Cur_Kr_Sum').Value := DoCurrFormat(FloatToStrF(Fst_Res._Cur_Kr, ffFixed, 100, 2));
    if not VarIsNull(Fst_Res._Out_Db) then GrMemoryData.FieldByName('Out_Db').Value := DoCurrFormat(FloatToStrF(Fst_Res._Out_Db, ffFixed, 100, 2));
    if not VarIsNull(Fst_Res._Out_Kr) then GrMemoryData.FieldByName('Out_Kr').Value := DoCurrFormat(FloatToStrF(Fst_Res._Out_Kr, ffFixed, 100, 2));

    GrMemoryData.Post;
   end;

   if not VarIsNull(Fst_Res._In_Db) then begin
    if not VarIsNull(Tot_Res._In_Db) then Tot_Res._In_Db := Tot_Res._In_Db + Fst_Res._In_Db
    else Tot_Res._In_Db := Fst_Res._In_Db;
   end;

   if not VarIsNull(Fst_Res._In_Kr) then begin
    if not VarIsNull(Tot_Res._In_Kr) then Tot_Res._In_Kr := Tot_Res._In_Kr + Fst_Res._In_Kr
    else Tot_Res._In_Kr := Fst_Res._In_Kr;
   end;

   if not VarIsNull(Fst_Res._Cur_Db) then begin
    if not VarIsNull(Tot_Res._Cur_Db) then Tot_Res._Cur_Db := Tot_Res._Cur_Db + Fst_Res._Cur_Db
    else Tot_Res._Cur_Db:= Fst_Res._Cur_Db;
   end;

   if not VarIsNull(Fst_Res._Cur_Kr) then begin
    if not VarIsNull(Tot_Res._Cur_Kr) then Tot_Res._Cur_Kr := Tot_Res._Cur_Kr + Fst_Res._Cur_Kr
    else Tot_Res._Cur_Kr:= Fst_Res._Cur_Kr;
   end;

   if not VarIsNull(Fst_Res._Out_Db) then begin
    if not VarIsNull(Tot_Res._Out_Db) then Tot_Res._Out_Db := Tot_Res._Out_Db + Fst_Res._Out_Db
    else Tot_Res._Out_Db := Fst_Res._Out_Db;
   end;

   if not VarIsNull(Fst_Res._Out_Kr) then begin
    if not VarIsNull(Tot_Res._Out_Kr) then Tot_Res._Out_Kr := Tot_Res._Out_Kr + Fst_Res._Out_Kr
    else Tot_Res._Out_Kr := Fst_Res._Out_Kr;
   end;

   NullRes(Fst_Res);
   NullRes(Snd_Res);
   NullRes(Trd_Res);
   NullRes(Fth_Res);
  end;
 end;
begin
 GrMemoryData.EmptyTable;

 NullRes(Tot_Res);

 s := '';
 for i := 1 to 4 do begin
  if s <> '' then s := s + ', ';
  if o <> '' then o := o + ', ';

  if PrintFilter._Gr[i] = 0 then begin
   s := s + 'ID_S, KOD_S';
   o := o + 'KOD_S';
  end
  else if PrintFilter._Gr[i] = 1 then begin
   s := s + 'ID_R, KOD_R';
   o := o + 'KOD_R';
  end
  else if PrintFilter._Gr[i] = 2 then begin
   s := s + 'ID_ST, KOD_ST';
   o := o + 'KOD_ST';
  end
  else if PrintFilter._Gr[i] = 3 then begin
   s := s + 'ID_KEKV, KOD_KEKV';
   o := o + 'KOD_KEKV';
  end;

  if i = 1 then begin
   s := s + ', ';

   if PrintFilter._Gr[i] = 0 then s := s + 'NAME_S'
   else if PrintFilter._Gr[i] = 1 then s := s + 'NAME_R'
   else if PrintFilter._Gr[i] = 2 then s := s + 'NAME_ST'
   else if PrintFilter._Gr[i] = 3 then s := s + 'NAME_KEKV';
  end;
 end;

 // Заполняю дерево

 DataSet.SelectSQL.Text := 'select ' + s + ' from JO9_PRINT_S_R_ST_SEL_TREE('
 + IntToStr(KEY_SESSION) + ') order by ' + o;

 DataSet.Open;

 if DataSet.RecordCount > 0 then Step := 10 / DataSet.RecordCount;

 SRStArray := nil;
 while not DataSet.Eof do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  SetLength(SRStArray, Length(SRStArray) + 1);

  with SRStArray[Length(SRStArray) - 1] do begin
   _id_Fst   := DataSet.Fields[0].AsInteger;
   _kod_Fst  := DataSet.Fields[1].AsInteger;
   _Name_Fst := DataSet.Fields[2].AsString;

   _id_Snd   := DataSet.Fields[3].AsInteger;
   _kod_Snd  := DataSet.Fields[4].AsInteger;

   _id_Trd   := DataSet.Fields[5].AsInteger;
   _kod_Trd  := DataSet.Fields[6].AsInteger;

   _id_Fth   := DataSet.Fields[7].AsInteger;
   _kod_Fth  := DataSet.Fields[8].AsInteger;
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 // Заполняю GrMemoryData

 Fst := -9999999;
 Snd := -9999999;
 Trd := -9999999;
 Fth := -9999999;

 if Length(SRStArray) > 0 then Step := 90 / Length(SRStArray);

 for i := 0 to Length(SRStArray) do begin
  // Добавляю результирующие строки по каждому из группируемых элементов

  AddSumms;

  if i >= Length(SRStArray) then Break;

  // Добавляю строку данных

  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  GrMemoryData.Append;
  GrMemoryData.Edit;

  if SRStArray[i]._id_Fst <> Fst then begin
   Inc(Count);

   GrMemoryData.FieldByName('FstFrame').Value := '10';

   GrMemoryData.FieldByName('Num').Value      := Count;
   GrMemoryData.FieldByName('Kod_Fst').Value  := SRStArray[i]._kod_Fst;
   GrMemoryData.FieldByName('Name_Fst').Value := SRStArray[i]._Name_Fst;
  end
  else GrMemoryData.FieldByName('FstFrame').Value := '00';

  //////////

  if (SRStArray[i]._id_Snd <> Snd)
  or (SRStArray[i]._id_Fst <> Fst)
  then begin
   GrMemoryData.FieldByName('SndFrame').Value := '10';
   GrMemoryData.FieldByName('Kod_Snd').Value  := SRStArray[i]._kod_Snd;
  end
  else GrMemoryData.FieldByName('SndFrame').Value := '00';

  //////////

  if (SRStArray[i]._id_Trd <> Trd)
  or (SRStArray[i]._id_Snd <> Snd)
  or (SRStArray[i]._id_Fst <> Fst)
  then begin
   GrMemoryData.FieldByName('TrdFrame').Value := '10';
   GrMemoryData.FieldByName('Kod_Trd').Value  := SRStArray[i]._kod_Trd;
  end
  else GrMemoryData.FieldByName('TrdFrame').Value := '00';

  //////////

  if (SRStArray[i]._id_Fth <> Fth)
  or (SRStArray[i]._id_Trd <> Trd)
  or (SRStArray[i]._id_Snd <> Snd)
  or (SRStArray[i]._id_Fst <> Fst)
  then begin
   GrMemoryData.FieldByName('FthFrame').Value := '10';
   GrMemoryData.FieldByName('Kod_Fth').Value  := SRStArray[i]._kod_Fth;
  end
  else GrMemoryData.FieldByName('FthFrame').Value := '00';

  ///////////////////


  if ((SRStArray[i]._id_Trd <> Trd) and (Snd_Res._Rec_Count = 0))
  or ((SRStArray[i]._id_Trd = Trd) and (SRStArray[i]._id_Fth <> Fth))
  then Inc(Trd_Res._Rec_Count);

  if ((SRStArray[i]._id_Snd <> Snd) and (Snd_Res._Rec_Count = 0))
  or ((SRStArray[i]._id_Snd  = Snd) and (SRStArray[i]._id_Trd <> Trd))
  then Inc(Snd_Res._Rec_Count);

  if ((SRStArray[i]._id_Fst <> Fst) and (Fst_Res._Rec_Count = 0))
  or ((SRStArray[i]._id_Fst  = Fst) and (SRStArray[i]._id_Snd <> Snd))
  then Inc(Fst_Res._Rec_Count);

  ////////////////


  GrMemoryData.Post;

  Fst := SRStArray[i]._id_Fst;
  Snd := SRStArray[i]._id_Snd;
  Trd := SRStArray[i]._id_Trd;
  Fth := SRStArray[i]._id_Fth;

  if PrintFilter._Gr[1] = 0 then id_S := SRStArray[i]._id_Fst
  else if PrintFilter._Gr[1] = 1 then id_R := SRStArray[i]._id_Fst
  else if PrintFilter._Gr[1] = 2 then id_St := SRStArray[i]._id_Fst
  else if PrintFilter._Gr[1] = 3 then id_Kekv := SRStArray[i]._id_Fst;

  if PrintFilter._Gr[2] = 0 then id_S := SRStArray[i]._id_Snd
  else if PrintFilter._Gr[2] = 1 then id_R := SRStArray[i]._id_Snd
  else if PrintFilter._Gr[2] = 2 then id_St := SRStArray[i]._id_Snd
  else if PrintFilter._Gr[2] = 3 then id_Kekv := SRStArray[i]._id_Snd;

  if PrintFilter._Gr[3] = 0 then id_S := SRStArray[i]._id_Trd
  else if PrintFilter._Gr[3] = 1 then id_R := SRStArray[i]._id_Trd
  else if PrintFilter._Gr[3] = 2 then id_St := SRStArray[i]._id_Trd
  else if PrintFilter._Gr[3] = 3 then id_Kekv := SRStArray[i]._id_Trd;

  if PrintFilter._Gr[4] = 0 then id_S := SRStArray[i]._id_Fth
  else if PrintFilter._Gr[4] = 1 then id_R := SRStArray[i]._id_Fth
  else if PrintFilter._Gr[4] = 2 then id_St := SRStArray[i]._id_Fth
  else if PrintFilter._Gr[4] = 3 then id_Kekv := SRStArray[i]._id_Fth;

  Line := GrMemoryData.RecNo;

  AddIn;

  GrMemoryData.RecNo := Line;

  AddOut;

  GrMemoryData.RecNo := Line;

  AddCur(True);

  GrMemoryData.RecNo := Line;

  AddCur(False);
 end;

 if GrMemoryData.RecordCount <> 0 then begin
  // Подвожу черту

  GrMemoryData.Edit;

  s := GrMemoryData.FieldByName('FstFrame').AsString;
  if s <> '' then GrMemoryData.FieldByName('FstFrame').Value := s[1] + '1' else GrMemoryData.FieldByName('FstFrame').Value := '01';

  s := GrMemoryData.FieldByName('SndFrame').AsString;
  if s <> '' then GrMemoryData.FieldByName('SndFrame').Value := s[1] + '1' else GrMemoryData.FieldByName('SndFrame').Value := '01';

  s := GrMemoryData.FieldByName('TrdFrame').AsString;
  if s <> '' then GrMemoryData.FieldByName('TrdFrame').Value := s[1] + '1' else GrMemoryData.FieldByName('TrdFrame').Value := '01';

  s := GrMemoryData.FieldByName('FthFrame').AsString;
  if s <> '' then GrMemoryData.FieldByName('FthFrame').Value := s[1] + '1' else GrMemoryData.FieldByName('FthFrame').Value := '01';

  GrMemoryData.Post;
 end;

 // Добавляю общий итог
 GrMemoryData.Append;
 GrMemoryData.Edit;

 GrMemoryData.FieldByName('ResKind').Value := '2';
 GrMemoryData.FieldByName('Num').Value     := 'Разом : ';

 if not VarIsNull(Tot_Res._In_Db)  then GrMemoryData.FieldByName('In_Db').Value      := DoCurrFormat(FloatToStrF(Tot_Res._In_Db, ffFixed, 100, 2)) else GrMemoryData.FieldByName('In_Db').Value := FloatToStrF(0.00, ffFixed, 100, 2);
 if not VarIsNull(Tot_Res._In_Kr)  then GrMemoryData.FieldByName('In_Kr').Value      := DoCurrFormat(FloatToStrF(Tot_Res._In_Kr, ffFixed, 100, 2)) else GrMemoryData.FieldByName('In_Kr').Value := FloatToStrF(0.00, ffFixed, 100, 2);
 if not VarIsNull(Tot_Res._Cur_Db) then GrMemoryData.FieldByName('Cur_Db_Sum').Value := DoCurrFormat(FloatToStrF(Tot_Res._Cur_Db, ffFixed, 100, 2));
 if not VarIsNull(Tot_Res._Cur_Kr) then GrMemoryData.FieldByName('Cur_Kr_Sum').Value := DoCurrFormat(FloatToStrF(Tot_Res._Cur_Kr, ffFixed, 100, 2));
 if not VarIsNull(Tot_Res._Out_Db) then GrMemoryData.FieldByName('Out_Db').Value     := DoCurrFormat(FloatToStrF(Tot_Res._Out_Db, ffFixed, 100, 2));
 if not VarIsNull(Tot_Res._Out_Kr) then GrMemoryData.FieldByName('Out_Kr').Value     := DoCurrFormat(FloatToStrF(Tot_Res._Out_Kr, ffFixed, 100, 2));

 GrMemoryData.Post;
end;

procedure Tjo9_PrintForm.SaveFilter;
var
 i : integer;
begin
 StoredProc.StoredProcName := 'JO9_PRINT_FILTER_ADD';
 StoredProc.Prepare;

 // Добавляю период

 StoredProc.ParamByName('KEY_SESSION').AsInt64        := KEY_SESSION;
 StoredProc.ParamByName('KIND').AsInteger             := 9;
 StoredProc.ParamByName('FIELD_DATE').AsDate          := PrintFilter._Date_Beg;

 StoredProc.ExecProc;

 StoredProc.ParamByName('KEY_SESSION').AsInt64        := KEY_SESSION;
 StoredProc.ParamByName('KIND').AsInteger             := 10;
 StoredProc.ParamByName('FIELD_DATE').AsDate          := PrintFilter._Date_End;

 StoredProc.ExecProc;

 ///////////

 if Length(PrintFilter._Smets) > 0 then begin
  for i := 0 to Length(PrintFilter._Smets) - 1 do begin
   StoredProc.ParamByName('KEY_SESSION').AsInt64        := KEY_SESSION;
   StoredProc.ParamByName('KIND').AsInteger             := 1;
   StoredProc.ParamByName('FIELD1').AsInteger           := PrintFilter._Smets[i]._id;
   StoredProc.ParamByName('NUM_FILTER_GROUP').AsInteger := 1;

   StoredProc.ExecProc;
  end;
 end;

 if Length(PrintFilter._MO_Sel) > 0 then begin
  for i := 0 to Length(PrintFilter._MO_Sel) - 1 do begin
   DataSet.SelectSQL.Text := 'select * from JO9_SEL_SM_BY_TF_PKV('
   + IntToStr(PrintFilter._MO_Sel[i]._id_PKV) + ',' + IntToStr(PrintFilter._MO_Sel[i]._id_Type_Fin) + ','
   + QuotedStr(DateToStr(PrintFilter._Date_Beg)) + ',' + QuotedStr(DateToStr(PrintFilter._Date_End)) + ')';
   DataSet.Open;

   while not DataSet.Eof do begin
    StoredProc.ParamByName('KEY_SESSION').AsInt64        := KEY_SESSION;
    StoredProc.ParamByName('KIND').AsInteger             := 1;
    StoredProc.ParamByName('FIELD1').AsInteger           := DataSet['ID_SM'];
    StoredProc.ParamByName('NUM_FILTER_GROUP').AsInteger := 2;

    StoredProc.ExecProc;

    DataSet.Next;
   end;

   DataSet.Close;
  end;
 end;

 if Length(PrintFilter._RazdSt) > 0 then begin
  for i := 0 to Length(PrintFilter._RazdSt) - 1 do begin
   StoredProc.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
   StoredProc.ParamByName('KIND').AsInteger      := 6;
   StoredProc.ParamByName('FIELD1').AsInteger    := PrintFilter._RazdSt[i]._id_R;
   StoredProc.ParamByName('FIELD2').AsInteger    := PrintFilter._RazdSt[i]._id_St;

   StoredProc.ExecProc;
  end;
 end;

 if Length(PrintFilter._Kekv) > 0 then begin
  for i := 0 to Length(PrintFilter._Kekv) - 1 do begin
   StoredProc.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
   StoredProc.ParamByName('KIND').AsInteger      := 2;
   StoredProc.ParamByName('FIELD1').AsInteger    := PrintFilter._Kekv[i]._id;

   StoredProc.ExecProc;
  end;
 end;

 if Length(PrintFilter._NSch) > 0 then begin
  for i := 0 to Length(PrintFilter._NSch) - 1 do begin
   StoredProc.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
   StoredProc.ParamByName('KIND').AsInteger      := 3;
   StoredProc.ParamByName('FIELD1').AsInteger    := PrintFilter._NSch[i]._id_Sch;

   StoredProc.ExecProc;
  end;
 end;

 if Length(PrintFilter._CSch) > 0 then begin
  for i := 0 to Length(PrintFilter._CSch) - 1 do begin
   StoredProc.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
   StoredProc.ParamByName('KIND').AsInteger      := 4;
   StoredProc.ParamByName('FIELD1').AsInteger    := PrintFilter._CSch[i]._id_Sch;

   StoredProc.ExecProc;
  end;
 end;

 if Length(PrintFilter._Customers) > 0 then begin
  for i := 0 to Length(PrintFilter._Customers) - 1 do begin
   StoredProc.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
   StoredProc.ParamByName('KIND').AsInteger      := 5;
   StoredProc.ParamByName('FIELD1').AsInteger    := PrintFilter._Customers[i]._id;

   StoredProc.ExecProc;
  end;
 end;

 if PrintFilter._DoNote then begin
  for i := 0 to Length(PrintFilter._Note) - 1 do begin
   StoredProc.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
   StoredProc.ParamByName('KIND').AsInteger      := 7;

   if PrintFilter._Note_Or then
    StoredProc.ParamByName('FIELD1').AsInteger := 1
   else
    StoredProc.ParamByName('FIELD1').AsInteger := 0;

   StoredProc.ParamByName('FIELD3').AsString     := PrintFilter._Note[i];

   StoredProc.ExecProc;
  end;
 end;

  if Length(PrintFilter._Dogs) > 0 then begin
  for i := 0 to Length(PrintFilter._Dogs) - 1 do begin
   StoredProc.ParamByName('KEY_SESSION').AsInt64        := KEY_SESSION;
   StoredProc.ParamByName('KIND').AsInteger             := 11;
   StoredProc.ParamByName('FIELD1').AsInt64           := PrintFilter._Dogs[i]._id;
   StoredProc.ExecProc;
  end;
 end;
end;

procedure Tjo9_PrintForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// Action := caFree;
end;

procedure Tjo9_PrintForm.ShowReport;
begin
//  Report.DesignReport;
  Report.ShowReport;
end;

procedure Tjo9_PrintForm.FillSecondProvs;
begin
 SecMemoryData.EmptyTable;

 DataSet.Close;
 DataSet.SelectSQL.Text := 'select * from JO9_GET_SEC_PROVS_GR(' + IntToStr(SYS_INFO^._id_Reg_Uch)
 + ',' + QuotedStr(DateToStr(PrintFilter._Date_Beg)) + ',' + QuotedStr(DateToStr(PrintFilter._Date_End)) + ')';
 DataSet.Open;

 while not DataSet.Eof do begin
  SecMemoryData.Append;
  SecMemoryData.Edit;

  SecMemoryData.FieldByName('DBSch').AsVariant := DataSet['DB_NUM_SCH'];
  SecMemoryData.FieldByName('KRSch').AsVariant := DataSet['KR_NUM_SCH'];
  SecMemoryData.FieldByName('S').AsVariant     := DataSet['KOD_S'];
  SecMemoryData.FieldByName('R').AsVariant     := DataSet['KOD_R'];
  SecMemoryData.FieldByName('St').AsVariant    := DataSet['KOD_ST'];
  SecMemoryData.FieldByName('KEKV').AsVariant  := DataSet['KOD_KEKV'];
  SecMemoryData.FieldByName('Summa').AsVariant := DoCurrFormat(FloatToStrF(DataSet.FieldByName('SUMMA').AsCurrency, ffFixed, 100, 2));

  SecMemoryData.Post;

  DataSet.Next;
 end;

 DataSet.Close;

 SecMemoryData.First;
end;

procedure Tjo9_PrintForm.Print_Ost_Report;
var
 Date_Kind : string;
 Kredit    : string;
 ShowSm    : string;

 i         : integer;

 Cust_Count : integer;
 Sch_Count  : integer;
 Ost_Count  : integer;
 Last_Cust  : integer;
 Last_Sch   : integer;
 Cust_Sum   : currency;
 Sch_Sum    : currency;
 all_summ   : Double;
 summs      :array of Double;
 print_if_one :Integer;
begin
  ds_empty_report.Close;
  ds_empty_report.selectSql.Text:='select print_if_one from jo9_ini';
  ds_empty_report.closeopen(False);
  if ds_empty_report.FieldValues['print_if_one'] <> null then
  print_if_one:=ds_empty_report.fieldValues['print_if_one']
  else print_if_one:=0;

 OstPeriods := nil;
 all_summ:=0;
 if PrintFilter._DateKind = odkAppear then Date_Kind := '0'
 else Date_Kind := '1';

 if PrintFilter._is_Kredit then Kredit := '1' else Kredit := '0';
 if PrintFilter._ShowSRStKEKV then ShowSm := '1' else ShowSm := '0';

 // Выбираю периоды

 if not PrintFilter._ShowSelYear then
  DataSet.SelectSQL.Text := 'select * from JO9_DT_OST_DOC_SEL_PERIODS('
  + IntToStr(SYS_INFO^._id_Reg_Uch)
  + ',' + QuotedStr(DateToStr(EncodeDate(PrintFilter._OstYear, PrintFilter._OstMonth, 1)))
  + ',' + IntToStr(PrintFilter._YearByMonths)
  + ',' + Kredit + ',' + Date_Kind + ') order by OST_YEAR, OST_MONTH'
 else
  DataSet.SelectSQL.Text := 'select * from JO9_DT_OST_DOC_SEL_PERIODS('
  + IntToStr(SYS_INFO^._id_Reg_Uch)
  + ',' + QuotedStr(DateToStr(EncodeDate(PrintFilter._OstYear, PrintFilter._OstMonth, 1)))
  + ',' + IntToStr(PrintFilter._YearByMonths)
  + ',' + Kredit + ',' + Date_Kind + ')'
  + ' where OST_YEAR =' + IntToStr(PrintFilter._YearByMonths)
  + ' order by OST_YEAR, OST_MONTH';

 DataSet.Open;

 while not DataSet.Eof do begin
  SetLength(OstPeriods, Length(OstPeriods) + 1);

  OstPeriods[Length(OstPeriods) - 1]._Year  := DataSet.FieldByName('OST_YEAR').AsInteger;
  OstPeriods[Length(OstPeriods) - 1]._Month := DataSet.FieldByName('OST_MONTH').AsVariant;

  DataSet.Next;
 end;

 DataSet.Close;
 //
 SetLength(summs,Length(OstPeriods));
 for i := 0 to Length(OstPeriods) - 1 do summs[i]:=0;
 //

 // Добавляю столбцы периодов в MemoryData

 OstCustData.Close;

 for i := 0 to Length(OstPeriods) - 1 do begin
  OstCustData.FieldDefs.Add('MyField_' + IntToStr(i), ftVariant);
 end;

 OstCustData.FieldDefs.Find('CustKind').Index := OstCustData.FieldDefs.Count - 1;

 OstCustData.Open;

 // Выбираю контрагентов и суммы задолженности по ним

 DataSet.SelectSQL.Text := 'select * from JO9_DT_OST_DOC_SEL_CUST('
 + IntToStr(SYS_INFO^._id_Reg_Uch)
 + ',' + QuotedStr(DateToStr(EncodeDate(PrintFilter._OstYear, PrintFilter._OstMonth, 1)))
 + ',' + Kredit + ',' + ShowSm + ')';

 if PrintFilter._ShowSRStKEKV and not PrintFilter._GroupBySch then
  DataSet.SelectSQL.Text := DataSet.SelectSQL.Text + ' order by NAME_CUST, KOD_S, KOD_R, KOD_ST, KOD_KEKV, NUM_SCH'
 else
  DataSet.SelectSQL.Text := DataSet.SelectSQL.Text + ' order by NAME_CUST, NUM_SCH, KOD_S, KOD_R, KOD_ST, KOD_KEKV';

 DataSet.Open;

 Cust_Count := 0;
 Sch_Count  := 0;
 Ost_Count  := 0;
 Last_Cust  := 0;
 Last_Sch   := 0;
 Cust_Sum   := 0;
 Sch_Sum    := 0;

 LastCustName := '';

 while not DataSet.Eof do begin
  OstCustData.Append;

  if DataSet.FieldByName('ID_CUSTOMER').AsInteger <> Last_Cust then begin
   if (Last_Sch <> 0) and (Sch_Count > 1) then begin
    OstCustData.FieldByName('Sch').AsString := 'Разом:';
    OstCustData.FieldByName('Sum').AsVariant := DoCurrFormat(FloatToStrF(Sch_Sum, ffFixed, 100, 2));
    OstCustData.FieldByName('CustKind').AsString := '01';

    OstCustData.Post;
    OstCustData.Append;
    OstCustData.FieldByName('CustFilter').AsVariant := LastCustName;
   end;
    //showmessage(inttostr(ost_count));
   if (Last_Cust <> 0)  and (Ost_Count > 1) then begin
    OstCustData.FieldByName('NameCustomer').AsString := 'Разом по контрагенту:';
    OstCustData.FieldByName('Sum').AsVariant := DoCurrFormat(FloatToStrF(Cust_Sum, ffFixed, 100, 2));
    OstCustData.FieldByName('CustKind').AsString := '01';

    OstCustData.Post;
    OstCustData.Append;
    OstCustData.FieldByName('CustFilter').AsVariant := LastCustName;
   end;

   if (print_if_one=1) and (Ost_Count=1) then begin
    OstCustData.FieldByName('NameCustomer').AsString := 'Разом по контрагенту:';
    OstCustData.FieldByName('Sum').AsVariant := DoCurrFormat(FloatToStrF(Cust_Sum, ffFixed, 100, 2));
    OstCustData.FieldByName('CustKind').AsString := '01';

    OstCustData.Post;
    OstCustData.Append;
    OstCustData.FieldByName('CustFilter').AsVariant := LastCustName;
   end;


   Last_Cust := DataSet.FieldByName('ID_CUSTOMER').AsInteger;

   Inc(Cust_Count);
   Sch_Count := 0;
   Last_Sch  := 0;
   Ost_Count := 0;
   Sch_Sum   := 0;
   Cust_Sum  := 0;

   OstCustData.FieldByName('Num').AsInteger := Cust_Count;
   OstCustData.FieldByName('NameCustomer').AsVariant := DataSet.FieldByName('NAME_CUST').AsVariant;
   LastCustName := AnsiUpperCase(DataSet.FieldByName('NAME_CUST').AsVariant);
   OstCustData.FieldByName('CustFilter').AsVariant := LastCustName;

   OstCustData.FieldByName('CustKind').AsString := '10';
  end;

  if (DataSet.FieldByName('ID_SCH').AsInteger <> Last_Sch) and (Last_Sch <> 0) then begin
   OstCustData.FieldByName('Sch').AsString := 'Разом:';
   OstCustData.FieldByName('Sum').AsVariant := DoCurrFormat(FloatToStrF(Sch_Sum, ffFixed, 100, 2));
   OstCustData.FieldByName('CustKind').AsString := '01';

   OstCustData.Post;
   OstCustData.Append;

   OstCustData.FieldByName('CustFilter').AsVariant := LastCustName;

   Last_Sch := DataSet.FieldByName('NUM_SCH').AsInteger;
   Sch_Sum  := 0;
  end;

  Inc(Ost_Count);

  OstCustData.FieldByName('Sch').AsVariant  := DataSet.FieldByName('NUM_SCH').AsVariant;
  OstCustData.FieldByName('S').AsVariant    := DataSet.FieldByName('KOD_S').AsVariant;
  OstCustData.FieldByName('R').AsVariant    := DataSet.FieldByName('KOD_R').AsVariant;
  OstCustData.FieldByName('St').AsVariant   := DataSet.FieldByName('KOD_ST').AsVariant;
  OstCustData.FieldByName('KEKV').AsVariant := DataSet.FieldByName('KOD_KEKV').AsVariant;
  OstCustData.FieldByName('Sum').AsVariant  := DoCurrFormat(FloatToStrF(DataSet.FieldByName('SUMMA').AsVariant, ffFixed, 100, 2));

  all_summ:=all_summ+DataSet.FieldByName('SUMMA').AsFloat;

  Sch_Sum  := Sch_Sum  + DataSet.FieldByName('SUMMA').AsCurrency;
  Cust_Sum := Cust_Sum + DataSet.FieldByName('SUMMA').AsCurrency;

  if PrintFilter._ShowSRStKEKV then
   Query.SelectSQL.Text := 'select * from JO9_DT_OST_DOC_SEL_CUST_SUM('
   + IntToStr(SYS_INFO^._id_Reg_Uch)
   + ',' + QuotedStr(DateToStr(EncodeDate(PrintFilter._OstYear, PrintFilter._OstMonth, 1)))
   + ',' + Kredit + ',' + ShowSm + ',' + Date_Kind
   + ',' + IntToStr(PrintFilter._YearByMonths)
   + ',' + DataSet.FieldByName('ID_CUSTOMER').AsString
   + ',' + DataSet.FieldByName('ID_SCH').AsString
   + ',' + DataSet.FieldByName('ID_S').AsString
   + ',' + DataSet.FieldByName('ID_R').AsString
   + ',' + DataSet.FieldByName('ID_ST').AsString
   + ',' + DataSet.FieldByName('ID_KEKV').AsString
   + ') order by OST_YEAR, OST_MONTH'
  else
   Query.SelectSQL.Text := 'select * from JO9_DT_OST_DOC_SEL_CUST_SUM('
   + IntToStr(SYS_INFO^._id_Reg_Uch)
   + ',' + QuotedStr(DateToStr(EncodeDate(PrintFilter._OstYear, PrintFilter._OstMonth, 1)))
   + ',' + Kredit + ',' + ShowSm + ',' + Date_Kind
   + ',' + IntToStr(PrintFilter._YearByMonths)
   + ',' + DataSet.FieldByName('ID_CUSTOMER').AsString
   + ',' + DataSet.FieldByName('ID_SCH').AsString
   + ', -1, -1, -1, -1) order by OST_YEAR, OST_MONTH';

  Query.Open;

  while not Query.Eof do begin
   for i := 0 to Length(OstPeriods) - 1 do begin
    if (OstPeriods[i]._Year = Query.FieldByName('OST_YEAR').AsInteger)
    and (OstPeriods[i]._Month = Query.FieldByName('OST_MONTH').AsVariant)
    then begin
     OstCustData.FieldByName('MyField_' + IntToStr(i)).AsString := DoCurrFormat(FloatToStrF(Query.FieldByName('SUMMA').AsVariant, ffFixed, 100, 2));
     summs[i]:=summs[i]+ Query.FieldByName('SUMMA').AsFloat;
    end;
   end;

   Query.Next;
  end;

  Query.Close;

  OstCustData.Post;

  DataSet.Next;
 end;
    // добавляем итоги последнего контрагента (Мардарь 20-08-13)
    if not DataSet.IsEmpty then
    begin
    OstCustData.Append;
    OstCustData.FieldByName('NameCustomer').AsString := 'Разом по контрагенту:';
    OstCustData.FieldByName('Sum').AsVariant := DoCurrFormat(FloatToStrF(Cust_Sum, ffFixed, 100, 2));
    OstCustData.FieldByName('CustKind').AsString := '01';

    OstCustData.Post;
    OstCustData.Append;
    OstCustData.FieldByName('CustFilter').AsVariant := LastCustName;
    OstCustData.Post;
    end;
   //
 OstCustData.Last;
 OstCustData.Edit;
 if OstCustData.FieldByName('CustKind').AsString <> '' then
  OstCustData.FieldByName('CustKind').AsString := OstCustData.FieldByName('CustKind').AsString[1] + '1';
 OstCustData.Post;

 //итоги по отчету
   OstCustData.Append;
   OstCustData.FieldByName('Num').AsVariant := null;
   OstCustData.FieldByName('NameCustomer').AsString := 'Разом за звітом:';
   OstCustData.FieldByName('Sch').AsVariant  := null;
   OstCustData.FieldByName('S').AsVariant    := null;
   OstCustData.FieldByName('R').AsVariant    := null;
   OstCustData.FieldByName('St').AsVariant   := null;
   OstCustData.FieldByName('KEKV').AsVariant := null;
   OstCustData.FieldByName('Sum').AsVariant  := DoCurrFormat(FloatToStrF(all_summ, ffFixed, 100, 2));
   OstCustData.FieldByName('CustKind').AsString := '10';
   OstCustData.FieldByName('CustFilter').AsVariant := LastCustName;
   for i := 0 to Length(OstPeriods) - 1 do
   OstCustData.FieldByName('MyField_' + IntToStr(i)).AsString := DoCurrFormat(FloatToStrF(summs[i], ffFixed, 100, 2));
   OstCustData.Post;
 //

 DataSet.Close;
end;

function Tjo9_PrintForm.Ost_Report_Get_Value (Header : boolean): variant;
const
 c = 18/5;
var
 m       : TfrxMemoView;
 pWidth  : extended;
 p       : TfrxReportPage;

 s       : string;
begin
 if Header then begin
  if ColDataSet.RecNo = 0 then Result := '№ п/п'
  else if ColDataSet.RecNo = 1 then Result := 'Контрагент'
  else if PrintFilter._ShowSRStKEKV then begin
   if ColDataSet.RecNo in [2..6] then begin
    if PrintFilter._GroupBySch then begin
     if ColDataSet.RecNo = 2 then Result := 'Рахунок'
     else if ColDataSet.RecNo = 3 then Result := 'Кошт.'
     else if ColDataSet.RecNo = 4 then Result := 'Розд.'
     else if ColDataSet.RecNo = 5 then Result := 'Ст.'
     else if ColDataSet.RecNo = 6 then Result := 'КЕКВ';
    end
    else begin
     if ColDataSet.RecNo = 2 then Result := 'Кошт.'
     else if ColDataSet.RecNo = 3 then Result := 'Розд.'
     else if ColDataSet.RecNo = 4 then Result := 'Ст.'
     else if ColDataSet.RecNo = 5 then Result := 'КЕКВ'
     else if ColDataSet.RecNo = 6 then Result := 'Рахунок';
    end;
   end
   else if ColDataSet.RecNo = 7 then Result := 'Сума'
   else begin
    if not VarIsNull(OstPeriods[ColDataSet.RecNo - 8]._Month) then
     Result := TagTypes.GetMonthName(OstPeriods[ColDataSet.RecNo - 8]._Month) + ' ' + IntToStr(OstPeriods[ColDataSet.RecNo - 8]._Year)
    else
     Result := OstPeriods[ColDataSet.RecNo - 8]._Year;
   end;
  end
  else begin
   if ColDataSet.RecNo = 2 then Result := 'Рахунок'
   else if ColDataSet.RecNo = 3 then Result := 'Cума'
   else begin
    if not VarIsNull(OstPeriods[ColDataSet.RecNo - 4]._Month) then
     Result := TagTypes.GetMonthName(OstPeriods[ColDataSet.RecNo - 4]._Month) + ' ' + IntToStr(OstPeriods[ColDataSet.RecNo - 4]._Year)
    else
     Result := OstPeriods[ColDataSet.RecNo - 4]._Year;
   end;
  end;
 end
 else begin
  if PrintFilter._ShowSRStKEKV then begin
   if (ColDataSet.RecNo in [2..6]) and not PrintFilter._GroupBySch then begin
    if ColDataSet.RecNo = 6 then Result := OstCustData.Fields[2].AsVariant
    else Result := OstCustData.Fields[ColDataSet.RecNo + 1].AsVariant;
   end
   else begin
    if ColDataSet.RecNo > 7 then
     Result := OstCustData.Fields[ColDataSet.RecNo + 1].AsVariant
    else
     Result := OstCustData.Fields[ColDataSet.RecNo].AsVariant;
   end;
  end
  else begin
   if ColDataSet.RecNo <= 2 then
    Result := OstCustData.Fields[ColDataSet.RecNo].AsVariant
   else if ColDataSet.RecNo > 3 then
    Result := OstCustData.Fields[ColDataSet.RecNo + 5].AsVariant
   else
    Result := OstCustData.Fields[ColDataSet.RecNo + 4].AsVariant;
  end;
 end;

 if Header then m := (Report.FindComponent('HeaderMemo') as TfrxMemoView)
 else m := (Report.FindComponent('CellMemo') as TfrxMemoView);

 if m = nil then Exit;

 if Header then begin
  m.VAlign := TfrxVAlign(vaCenter);
  m.HAlign := haCenter;
 end;

 m.Frame.Typ := [ftLeft, ftRight];

 if (ColDataSet.RecNo in [0, 1]) and not Header then begin
  s := OstCustData.FieldByName('CustKind').AsString;

  if s <> '' then begin
   if s[1] = '1' then m.Frame.Typ := m.Frame.Typ + [ftTop];
   if s[2] = '1' then m.Frame.Typ := m.Frame.Typ + [ftBottom];
  end;
 end
 else begin
  m.Frame.Typ := m.Frame.Typ + [ftTop, ftBottom];
 end;

 m.Font.Style := [];

 if ColDataSet.RecNo = 0 then begin
  m.Width  := 25;

  if not Header then begin
   m.VAlign := TfrxVAlign(vaTop);
   m.HAlign := haRight;
  end;
 end
 else if ColDataSet.RecNo = 1 then begin
  m.Width  := 230;
  m.Left   := 25;

  if not Header then begin
   m.VAlign := TfrxVAlign(vaTop);
   m.HAlign := haLeft;
  end;

  if (OstCustData.FieldByName('NameCustomer').AsString = 'Разом:')
  or (OstCustData.FieldByName('NameCustomer').AsString = 'Разом по контрагенту:')
  or (OstCustData.FieldByName('NameCustomer').AsString = 'Разом за звітом:')
  then begin
   m.HAlign     := haRight;
   m.Font.Style := [fsBold];
  end;
 end
 else if ColDataSet.RecNo <= ColDataSet.RangeEndCount - Length(OstPeriods) - 2 then begin
  m.Width  := 55;
  m.Left   := 25 + 230 + 55 * (ColDataSet.RecNo - 2);

  if not Header then begin
   m.VAlign := TfrxVAlign(vaCenter);
   m.HAlign := haCenter;
  end;
 end
 else begin
  p       := (Report.FindObject('Page1') as TfrxReportPage);
  pWidth  := c* (p.PaperWidth - p.LeftMargin - p.RightMargin);

  if PrintFilter._ShowSRStKEKV then begin
   m.Width := (pWidth - (25 + 230 + (55 * 5))) / (Length(OstPeriods) + 1);
   m.Left  := 25 + 230 + (55 * 5) + m.Width * (ColDataSet.RecNo - 7);
   if ((OstCustData.FieldByName('NameCustomer').AsString = 'Разом за звітом:')
   or (OstCustData.FieldByName('NameCustomer').AsString = 'Разом по контрагенту:')) then
     //mardar
  m.Font.Style:=[fsBold];
  //
  end
  else begin
   m.Width := (pWidth - (25 + 230 + (55 * 1))) / (Length(OstPeriods) + 1);
   m.Left  := 25 + 230 + (55 * 1) + m.Width * (ColDataSet.RecNo - 3);
  if ((OstCustData.FieldByName('NameCustomer').AsString = 'Разом за звітом:')
   or (OstCustData.FieldByName('NameCustomer').AsString = 'Разом по контрагенту:')) then
     //mardar
  m.Font.Style:=[fsBold];
  //
  end;

  if not Header then begin
   m.VAlign := TfrxVAlign(vaCenter);
   m.HAlign := haRight;
  end;
 end;
end;

function Tjo9_PrintForm.DoTransfer : boolean;
var
 ErrorList : TStringList;
 STRU      : KERNEL_MODE_STRUCTURE;

 KEY_SESSION     : variant;
 KEY_SESSION_DEL : variant;
 RES             : integer;
begin
 Result := False;

 if MessageDlg('Увага!', 'Чи бажаєте ви здійснити автоматичне перекидання документів системи на визначений договір?', mtConfirmation, [mbYes, mbNo]) <> mrYes then begin
  Result := True;
  Exit;
 end;

 // Перебрасываю дебетовые документы

 try
  if not AutoStoredProc.Transaction.Active then AutoStoredProc.Transaction.StartTransaction;

  AutoStoredProc.StoredProcName := 'JO9_TRANSFER_DOCS';
  AutoStoredProc.Prepare;

  AutoStoredProc.ParamByName('TRANSFER_DB').AsInteger := 1;
  AutoStoredProc.ParamByName('WORK_DATE').AsDate      := SYS_INFO^._Period_Beg;
  AutoStoredProc.ParamByName('ID_REG_UCH').AsInteger  := SYS_INFO^._id_Reg_Uch;
  AutoStoredProc.ParamByName('ID_USER').AsInteger     := SYS_INFO^._id_User;
  AutoStoredProc.ParamByName('COMPUTER').AsString     := SYS_INFO^._Comp_Name;

  AutoStoredProc.ExecProc;

  RES             := AutoStoredProc.FieldByName('RESULT').AsVariant;
  KEY_SESSION     := AutoStoredProc.FieldByName('KEY_SESSION').AsVariant;
  KEY_SESSION_DEL := AutoStoredProc.FieldByName('KEY_SESSION_DEL').AsVariant;

  if Res <> 1 then begin
   if VarIsNull(KEY_SESSION)
   and VarIsNull(KEY_SESSION_DEL) then begin
    ShowMessage('Непредвиденная ошибка! Обратитесь к разработчику.');
    AutoStoredProc.Transaction.Rollback;
    Exit;
   end;

   STRU.AOWNER := Self;
   STRU.DBHANDLE := Database.Handle;
   STRU.TRHANDLE := AutoStoredProc.Transaction.Handle;

   if not VarIsNull(KEY_SESSION) then STRU.KEY_SESSION := KEY_SESSION
   else STRU.KEY_SESSION := KEY_SESSION_DEL;

   if not VarIsNull(KEY_SESSION_DEL) then STRU.KEY_SESSION := KEY_SESSION_DEL
   else STRU.KEY_SESSION := KEY_SESSION;

   ErrorList := Kernel.GetDocErrorsListEx(@STRU);
   ShowMessage(ErrorList.Text);
   AutoStoredProc.Transaction.Rollback;
  end;
 except
  AutoStoredProc.Transaction.Rollback;
  ShowMessage('Автоматичну перекидання дебетових документів завершено невдачою!');
  Exit;
 end;

 // Перебрасываю кредитовые документы

 try
  if not AutoStoredProc.Transaction.Active then AutoStoredProc.Transaction.StartTransaction;

  AutoStoredProc.StoredProcName := 'JO9_TRANSFER_DOCS';
  AutoStoredProc.Prepare;

  AutoStoredProc.ParamByName('TRANSFER_DB').AsInteger := 0;
  AutoStoredProc.ParamByName('WORK_DATE').AsDate      := SYS_INFO^._Period_Beg;
  AutoStoredProc.ParamByName('ID_REG_UCH').AsInteger  := SYS_INFO^._id_Reg_Uch;
  AutoStoredProc.ParamByName('ID_USER').AsInteger     := SYS_INFO^._id_User;
  AutoStoredProc.ParamByName('COMPUTER').AsString     := SYS_INFO^._Comp_Name;

  AutoStoredProc.ExecProc;

  RES             := AutoStoredProc.FieldByName('RESULT').AsVariant;
  KEY_SESSION     := AutoStoredProc.FieldByName('KEY_SESSION').AsVariant;
  KEY_SESSION_DEL := AutoStoredProc.FieldByName('KEY_SESSION_DEL').AsVariant;

  if Res <> 1 then begin
   if VarIsNull(KEY_SESSION)
   and VarIsNull(KEY_SESSION_DEL) then begin
    ShowMessage('Непредвиденная ошибка! Обратитесь к разработчику.');
    AutoStoredProc.Transaction.Rollback;
    Exit;
   end;

   STRU.AOWNER := Self;
   STRU.DBHANDLE := Database.Handle;
   STRU.TRHANDLE := AutoStoredProc.Transaction.Handle;

   if not VarIsNull(KEY_SESSION) then STRU.KEY_SESSION := KEY_SESSION
   else STRU.KEY_SESSION := KEY_SESSION_DEL;

   if not VarIsNull(KEY_SESSION_DEL) then STRU.KEY_SESSION := KEY_SESSION_DEL
   else STRU.KEY_SESSION := KEY_SESSION;

   ErrorList := Kernel.GetDocErrorsListEx(@STRU);
   ShowMessage(ErrorList.Text);
   AutoStoredProc.Transaction.Rollback;
  end;
 except
  AutoStoredProc.Transaction.Rollback;
  ShowMessage('Автоматичну перекидання кредитових документів завершено невдачою!');
  Exit;
 end;

 AutoStoredProc.Transaction.Commit;

 Result := True;
end;

procedure Tjo9_PrintForm.FillMemoryDataCust;
 procedure AddOst(FromLine : integer; DbSum, KrSum : currency; InArray : TProvBuffArray; Summary : boolean; isBad : boolean);
 var
  i    : integer;
  Line : integer;
 begin
  if Length(InArray) = 0 then Exit;

  Line := FromLine + 30;

  JOMemoryDataCust.RecNo := Line;

  if Summary then begin
   JOMemoryDataCust.Edit;
   JOMemoryDataCust.FieldByName('In_Db').Value  := DoCurrFormat(FloatToStrF(DbSum, ffFixed, 100, 2));
   JOMemoryDataCust.FieldByName('In_Kr').Value  := DoCurrFormat(FloatToStrF(KrSum, ffFixed, 100, 2));

   if isBad then JOMemoryDataCust.FieldByName('State').Value  := 'BadDoc';

   JOMemoryDataCust.FieldByName('CustNameFilter').Value := LastCustName;
   JOMemoryDataCust.Post;

   Inc(Line);
  end;

  for i := 0 to Length(InArray) - 1 do begin
   JOMemoryDataCust.RecNo := Line;

   if Line > JOMemoryDataCust.RecordCount then begin
    JOMemoryDataCust.Append;
    JOMemoryDataCust.Edit;
    JOMemoryDataCust.FieldByName('CustNameFilter').Value  := LastCustName;
    JOMemoryDataCust.Post;
   end;

   if i <> 0 then begin
    if (InArray[i - 1].ID_SCH = InArray[i].ID_SCH)
    and (InArray[i - 1].IS_DB = InArray[i].IS_DB) then begin
     JOMemoryDataCust.Edit;
                                                                                                      //
     if InArray[i].IS_DB then JOMemoryDataCust.FieldByName('In_Db').Value := DoCurrFormat(FloatToStrF(InArray[i].SUMMA, ffFixed, 100, 2))
     else JOMemoryDataCust.FieldByName('In_Kr').Value := DoCurrFormat(FloatToStrF(InArray[i].SUMMA, ffFixed, 100, 2));

     if isBad then JOMemoryDataCust.FieldByName('State').Value  := 'BadDoc';

     JOMemoryDataCust.FieldByName('CustNameFilter').Value := LastCustName;
     JOMemoryDataCust.Post;

     Inc(Line);
     Continue;
    end;
   end;

   JOMemoryDataCust.Edit;
   if InArray[i].IS_DB then JOMemoryDataCust.FieldByName('In_Db').Value := DoCurrFormat(FloatToStrF(InArray[i].SUMMA, ffFixed, 100, 2))
   else JOMemoryDataCust.FieldByName('In_Kr').Value := DoCurrFormat(FloatToStrF(InArray[i].SUMMA, ffFixed, 100, 2));

   JOMemoryDataCust.FieldByName('In_Sch').Value  := InArray[i].KOD_SCH;

//   if not Summary then JOMemoryDataCust.FieldByName('In_Sch').Value := InArray[0].KOD_SCH;

   if isBad then JOMemoryDataCust.FieldByName('State').Value  := 'BadDoc';

   JOMemoryDataCust.FieldByName('CustNameFilter').Value := LastCustName;
   JOMemoryDataCust.Post;

   Inc(Line);
  end;
 end;

 procedure AddDoc(var Line : integer; Sum : currency; InArray : TProvBuffArray; index : integer; isBad : boolean);
 var
  i, j  : integer;
  Month : byte;
  Year  : integer;
  s     : string;

  Flag : boolean;

  Last_id_Sch : integer;
  Db_Sum : currency;
  Kr_Sum : currency;
 begin
  if Length(InArray) = 0 then Exit;

  if Line > JOMemoryDataCust.RecordCount then begin
   JOMemoryDataCust.Append;
   JOMemoryDataCust.Edit;
   JOMemoryDataCust.FieldByName('CustNameFilter').Value  := LastCustName;
   JOMemoryDataCust.Post;
  end;

  JOMemoryDataCust.RecNo := Line;
  JOMemoryDataCust.Edit;

  Month := MonthOfTheYear(TreeArray[index]._DATE_REG);
  Year  := YearOf(TreeArray[index]._DATE_REG);

  if Month < 10 then s := '0' + IntToStr(Month)
  else s := IntToStr(Month);

  s := s + '/' + IntToStr(Year);

  if InArray[0].IS_DB then begin
   JOMemoryDataCust.FieldByName('Db_Doc').AsString := TreeArray[index]._NUM_DOC
   + ' (від ' + DateToStr(TreeArray[index]._DATE_DOC) + ')';
   JOMemoryDataCust.FieldByName('Db_Date_Reg').Value := s;
  end
  else begin
   JOMemoryDataCust.FieldByName('Kr_Doc').AsString := TreeArray[index]._NUM_DOC
   + ' (від ' + DateToStr(TreeArray[index]._DATE_DOC) + ')';
   JOMemoryDataCust.FieldByName('Kr_Date_Reg').Value := s;
  end;

  if isBad then JOMemoryDataCust.FieldByName('State').Value  := 'BadDoc';

  JOMemoryDataCust.FieldByName('CustNameFilter').Value := LastCustName;
  JOMemoryDataCust.Post;

  Last_id_Sch := InArray[0].ID_SCH;
  Db_Sum      := 0;
  Kr_Sum      := 0;

  for i := 0 to Length(InArray) - 1 do begin
   if Last_id_Sch <> InArray[i].ID_SCH then begin
    JOMemoryDataCust.Edit;

    JOMemoryDataCust.FieldByName('Db_Sum').AsVariant := DoCurrFormat(FloatToStrF(Db_Sum, ffFixed, 100, 2));
    JOMemoryDataCust.FieldByName('Kr_Sum').AsVariant := DoCurrFormat(FloatToStrF(Kr_Sum, ffFixed, 100, 2));

    JOMemoryDataCust.FieldByName('CustNameFilter').Value := LastCustName;
    JOMemoryDataCust.Post;

    Inc(Line);

    Db_Sum := 0;
    Kr_Sum := 0;
   end;

   JOMemoryDataCust.RecNo := Line;

   if Line > JOMemoryDataCust.RecordCount then begin
    JOMemoryDataCust.Append;
    JOMemoryDataCust.Edit;
    JOMemoryDataCust.FieldByName('CustNameFilter').Value  := LastCustName;
    JOMemoryDataCust.Post;
   end;

   JOMemoryDataCust.Edit;

   Flag := True;

   for j := 0 to Length(CustSch) - 1 do
    if (CustSch[j]._id_Sch = InArray[i].ID_SCH_COR) and (CustSch[j]._Db = InArray[i].IS_DB) then begin
     Flag := False;
     Break;
    end;

   if Flag then begin
    ShowMessage('Увага! У контрагента "' + TreeArray[index]._NAME_CUST + '" у документі [' +  TreeArray[index]._NUM_DOC + '] у проводці на суму '
    + DoCurrFormat(FloatToStrF(InArray[i].SUMMA, ffFixed, 100, 2)) + ' виникла помилка!' + #13 + 'Кореспондуючий рахунок не входить до переліку можливих');
    Continue;
   end;

   JOMemoryDataCust.FieldByName(CustSch[j]._NameField).Value := DoCurrFormat(FloatToStrF(InArray[i].SUMMA, ffFixed, 100, 2));

   if InArray[i].IS_DB then begin
    JOMemoryDataCust.FieldByName('Db_Sch').AsVariant := InArray[i].KOD_SCH;
    Db_Sum := Db_Sum + InArray[i].SUMMA;
   end
   else begin
    JOMemoryDataCust.FieldByName('Kr_Sch').AsVariant := InArray[i].KOD_SCH;
    Kr_Sum := Kr_Sum + InArray[i].SUMMA;
   end;

   if isBad then JOMemoryDataCust.FieldByName('State').Value  := 'BadDoc';

   JOMemoryDataCust.FieldByName('CustNameFilter').Value := LastCustName;
   JOMemoryDataCust.Post;
  end;

  JOMemoryDataCust.Edit;

  if InArray[0].IS_DB then
   JOMemoryDataCust.FieldByName('Db_Sum').AsVariant := DoCurrFormat(FloatToStrF(Db_Sum, ffFixed, 100, 2))
  else
   JOMemoryDataCust.FieldByName('Kr_Sum').AsVariant := DoCurrFormat(FloatToStrF(Kr_Sum, ffFixed, 100, 2));

  JOMemoryDataCust.FieldByName('CustNameFilter').Value := LastCustName;
  JOMemoryDataCust.Post;

  Inc(Line);
 end;

 procedure AddSaldo(FromLine : integer; DbSum, KrSum : currency; InArray : TSaldoOutArray; isBad : boolean);
 var
  i            : integer;
  Line         : integer;
  Last_Num_Sch : string;
 begin
  Line := FromLine;

  JOMemoryDataCust.RecNo := Line;

  if Length(InArray) = 0 then begin
   JOMemoryDataCust.Edit;
   JOMemoryDataCust.FieldByName('Out_Db').Value := '0.00';
   JOMemoryDataCust.FieldByName('Out_Kr').Value := '0.00';

   if isBad then JOMemoryDataCust.FieldByName('State').Value  := 'BadDoc';

   JOMemoryDataCust.FieldByName('CustNameFilter').Value := LastCustName;
   JOMemoryDataCust.Post;

   Exit;
  end;

  Last_Num_Sch := '';

  for i := 0 to Length(InArray) - 1 do begin
   JOMemoryDataCust.RecNo := Line;

   Inc(Line);
   JOMemoryDataCust.RecNo := Line;

   if Line > JOMemoryDataCust.RecordCount then begin
    JOMemoryDataCust.Append;
    JOMemoryDataCust.Edit;
    JOMemoryDataCust.FieldByName('CustNameFilter').Value  := LastCustName;
    JOMemoryDataCust.Post;
   end;

   JOMemoryDataCust.Edit;
   if InArray[i].OUT_DB then JOMemoryDataCust.FieldByName('Out_Db').Value := DoCurrFormat(FloatToStrF(InArray[i].SUMMA, ffFixed, 100, 2))
   else JOMemoryDataCust.FieldByName('Out_Kr').Value := DoCurrFormat(FloatToStrF(InArray[i].SUMMA, ffFixed, 100, 2));

   JOMemoryDataCust.FieldByName('Out_Sch').Value  := InArray[i].NUM_SCH_COR;

   if isBad then JOMemoryDataCust.FieldByName('State').Value  := 'BadDoc';

   JOMemoryDataCust.FieldByName('CustNameFilter').Value := LastCustName;
   JOMemoryDataCust.Post;
  end;
 end;
var
 i, j : integer;
 k    : integer;

 FirstRow     : integer;
 DbLine       : integer;
 KrLine       : integer;
 LastCustomer : int64;
 LastTypeDog  : int64;
 Last_IDD     : string;

 TempProv     : TProvBuffArray;
 Sum          : currency;
 DbSum        : currency;
 KrSum        : currency;

 Flag         : boolean;

 id_sch       : integer;
 Db, Kr       : boolean;
 NeedSummary  : boolean;

 Count        : integer;
begin
 JOMemoryDataCust.Open;

 LastCustomer := -20;
 LastCustName := '';
 LastTypeDog  := -7836537485;

 if Length(TreeArray) > 0 then Step := 90 / Length(TreeArray);

 Count := 0;

 try
  for i := 0 to Length(TreeArray) - 1 do begin
   PBarPos := PBarPos + Step;
   DoProgress(PBarPos);

    // Заполняю массивы

   FillSaldoOut(TreeArray[i]._IDD, TreeArray[i]._ID_CUSTOMER, TreeArray[i]._NAME_CUST, True); // Заполняю исходящие остатки

   ///-------->>>>>>

   FillPBArray(True, TreeArray[i]._IDD, '', True); // Заполняю входящие остатки
   FillPBArray(False, TreeArray[i]._IDD, TreeArray[i]._ID_DOC, True); // Заполняю обороты

   if (Length(InOstArray) = 0) and (Length(ProvBuffArray) = 0) and (Length(SaldoOut) = 0) then Continue;

   if PrintFilter._GroupByTypeDog then begin
    if TreeArray[i]._id_Type_Dog <> LastTypeDog then begin
     Count := 0;

     JOMemoryDataCust.Append;
     JOMemoryDataCust.Edit;
     JOMemoryDataCust.FieldByName('CustNameFilter').Value  := LastCustName;

     JOMemoryDataCust.FieldByName('CustNum').Value := '';
     JOMemoryDataCust.FieldByName('RegNum').Value  := TreeArray[i]._Name_Type_D;

     JOMemoryDataCust.FieldByName('State').Value  := 'NameTypeDog';

     JOMemoryDataCust.FieldByName('CustNameFilter').Value := LastCustName;
     JOMemoryDataCust.Post;

     LastTypeDog := TreeArray[i]._id_Type_Dog;
    end;
   end;

   if TreeArray[i]._ID_CUSTOMER <> LastCustomer then begin
    Inc(Count);

    JOMemoryDataCust.Append;
    JOMemoryDataCust.Edit;
    JOMemoryDataCust.FieldByName('CustNameFilter').Value  := LastCustName;

    JOMemoryDataCust.FieldByName('CustNum').Value         := IntToStr(Count) + '.';
    JOMemoryDataCust.FieldByName('RegNum').Value          := TreeArray[i]._NAME_CUST;

    LastCustName := AnsiUpperCase(TreeArray[i]._NAME_CUST);
    JOMemoryDataCust.FieldByName('CustNameFilter').Value  := LastCustName;

    if TreeArray[i]._ID_CUSTOMER = -2 then JOMemoryDataCust.FieldByName('State').Value  := 'NameCustBad'
    else JOMemoryDataCust.FieldByName('State').Value  := 'NameCust';

    JOMemoryDataCust.FieldByName('CustNameFilter').Value := LastCustName;
    JOMemoryDataCust.Post;

    LastCustomer := TreeArray[i]._ID_CUSTOMER;
   end;

   if TreeArray[i]._IDD <> Last_IDD then begin

    JOMemoryDataCust.Append;
    JOMemoryDataCust.Edit;
    JOMemoryDataCust.FieldByName('CustNameFilter').Value  := LastCustName;

    Flag := True;

    if TreeArray[i]._IDD = -2 then Flag := False // Если это неразнесенный документ
    else begin
     for j := 0 to Length(DogsInfo) - 1 do
      if TreeArray[i]._IDD = DogsInfo[j]._id_Dog then begin
       Flag := False;
       JOMemoryDataCust.FieldByName('RegNum').Value := DogsInfo[j]._Reg_Num;
       Break;
      end;
     end;

    if Flag then begin
     SetLength(DogsInfo, Length(DogsInfo) + 1);
     with DogsInfo[Length(DogsInfo) - 1] do begin
      _id_Dog := TreeArray[i]._IDD;

      DataSet.SelectSQL.Text := 'select * from JO9_GET_DOG_INFO('
      + IntToStr(KEY_SESSION) + ',' + VarToStr(_id_Dog) + ', 1)';

      DataSet.Open;
      if not VarIsNull(DataSet['REG_NUM'])   then _Reg_Num   := DataSet['REG_NUM'];
      if not VarIsNull(DataSet['DATE_DOLG']) then _Date      := DataSet['DATE_DOLG'];
      if not VarIsNull(DataSet['DATE_MOVE']) then _Move_Date := DataSet['DATE_MOVE'];

      JOMemoryDataCust.FieldByName('Dog_Note').Value := TreeArray[i]._DOG_NOTE
      + ' (Договір № ' + TreeArray[i]._DOG_NUM + ' від ' + DateToStr(TreeArray[i]._DOG_DATE) + ')';

      JOMemoryDataCust.FieldByName('RegNum').Value    := _Reg_Num;
      JOMemoryDataCust.FieldByName('Date_Ost').Value  := _Date;
      JOMemoryDataCust.FieldByName('Date_Move').Value := _Move_Date;

      DataSet.Close;
     end;
    end;

    if TreeArray[i]._ID_CUSTOMER = -2 then JOMemoryDataCust.FieldByName('State').Value  := 'BadDoc';

    JOMemoryDataCust.FieldByName('CustNameFilter').Value := LastCustName;
    JOMemoryDataCust.Post;

    FirstRow := JOMemoryDataCust.RecordCount;
    DbLine   := 0;
    KrLine   := 0;

    Last_IDD := TreeArray[i]._IDD;

    // Добавляю сальдо входящее

    if Length(InOstArray) > 0 then begin
     DbSum  := 0;
     KrSum  := 0;
     id_sch := InOstArray[0].ID_SCH;

     Db          := False;
     Kr          := False;
     NeedSummary := False;
     TempProv    := nil;

     SetLength(TempProv, Length(InOstArray));

     for k := 0 to Length(InOstArray) - 1 do begin
      TempProv[k] := InOstArray[k];

      if InOstArray[k].IS_DB then begin
       if Db then NeedSummary := True
       else Db := True;

       DbSum := DbSum + InOstArray[k].SUMMA;
      end
      else begin
       if Kr then NeedSummary := True
       else Kr := True;

       KrSum := KrSum + InOstArray[k].SUMMA;
      end;

      if (InOstArray[k].ID_SCH <> id_sch) or (k = Length(InOstArray) - 1) then begin
       id_sch := InOstArray[k].ID_SCH;

       AddOst(FirstRow, DbSum, KrSum, TempProv, NeedSummary, TreeArray[i]._ID_CUSTOMER = -2);

       DbSum       := 0;
       KrSum       := 0;
       NeedSummary := False;
       Db          := False;
       Kr          := False;
      end;
     end;
    end;
   end;

   //Добавляю текущие документы

   if Length(ProvBuffArray) > 0 then begin
    Sum  := 0;
    TempProv := nil;

    k := 0;

    while k < Length(ProvBuffArray) do begin
     Sum := Sum + ProvBuffArray[k].SUMMA;

     SetLength(TempProv, Length(TempProv) + 1);
     TempProv[Length(TempProv) - 1] := ProvBuffArray[k];

     Inc(k);
    end;


    if TempProv[0].IS_DB then begin
     DbLine := Max(DbLine, FirstRow);
     AddDoc(DbLine, Sum, TempProv, i, TreeArray[i]._ID_CUSTOMER = -2);
    end
    else begin
     KrLine := Max(KrLine, FirstRow);
     AddDoc(KrLine, Sum, TempProv, i, TreeArray[i]._ID_CUSTOMER = -2);
    end;
   end;

   // Добавляю сальдо исходящее

   if Length(SaldoOut) > 0 then begin
    DbSum := 0;
    KrSum := 0;

    for j := 0 to Length(SaldoOut) - 1 do
     if SaldoOut[j].OUT_DB then DbSum := DbSum + SaldoOut[j].SUMMA
     else KrSum := KrSum + SaldoOut[j].SUMMA;

    AddSaldo(FirstRow, DbSum, KrSum, SaldoOut, TreeArray[i]._ID_CUSTOMER = -2);
   end;
  end;
 except
  ShowMessage('Ошибка. i=' + IntToStr(i));
 end;
end;

procedure Tjo9_PrintForm.FillCustSch;
var
 i, k  : integer;
 KrSch : TCustSchArray;
begin
 CustSch := nil;

 // Выбираю все корреспондирующие счета в дебетовых оборотах

 DataSet.SelectSQL.Text := 'select ID_SCH, NUM_SCH from JO9_IN_CUR_BUFF_SEL_ALL_SCH('
 + IntToStr(KEY_SESSION) + ', 1)';
 DataSet.Open;

 SetLength(CustSch, DataSet.RecordCount);

 for i := 0 to DataSet.RecordCount - 1 do begin
  with CustSch[i] do begin
   _Db        := True;
   _id_Sch    := DataSet.FieldByName('ID_SCH').AsInteger;
   _Num_Sch   := DataSet.FieldByName('NUM_SCH').AsString;
   _NameField := 'DbSch_' + IntToStr(i);
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 // Сортирую дебетовые счета
 OrderCustSch(@CustSch);

 // Выбираю все корреспондирующие счета в кредитовых оборотах

 DataSet.SelectSQL.Text := 'select ID_SCH, NUM_SCH from JO9_IN_CUR_BUFF_SEL_ALL_SCH('
 + IntToStr(KEY_SESSION) + ', 0)';
 DataSet.Open;

 SetLength(KrSch, DataSet.RecordCount);

 for i := 0 to DataSet.RecordCount - 1 do begin
  with KrSch[i] do begin
   _Db        := False;
   _id_Sch    := DataSet.FieldByName('ID_SCH').AsInteger;
   _Num_Sch   := DataSet.FieldByName('NUM_SCH').AsString;
   _NameField := 'KrSch_' + IntToStr(i);
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 // Сортирую кредитовые счета

 OrderCustSch(@KrSch);

 // Добавляю кредитовые счета в массив

 k := Length(CustSch);

 SetLength(CustSch, Length(CustSch) + Length(KrSch));
 for i := 0 to Length(KrSch) - 1 do CustSch[k + i] := KrSch[i];

 // Добавляю поля в МемориДата

 for i := 0 to Length(CustSch) - 1 do JOMemoryDataCust.FieldDefs.Add(CustSch[i]._NameField, ftVariant);

 JOMemoryDataCust.Close;
 JOMemoryDataCust.Open;
end;

procedure Tjo9_PrintForm.MakeCustSchReport;
var
 i : integer;
 jo_Preview : Tjo9_Preview_joForm;

 Db_Count   : byte;
 Kr_Count   : byte;
begin
 Report.Variables.Variables['HeaderOnNewPage'] := PrintFilter._PrintOnNewPage;

 StoredProc.Transaction.StartTransaction;

 SaveFilter;

 PrepareData(True);

 FillArrays;
 FillCustSch;
 FillMemoryDataCust;
 SetCustSchSummary;

 if PrintFilter._CommitTrans then begin
  StoredProc.Transaction.Commit;

  ShowMessage('KEY_SESSION = ' + IntToStr(KEY_SESSION));
 end
 else StoredProc.Transaction.Rollback;

 JOMemoryDataCust.First;
 DBDataset.DataSet := JOMemoryDataCust;

 jo_Preview                          := Tjo9_Preview_joForm.Create(Self);
 jo_Preview.Caption                  := 'Відомість розрахунків з контрагентами';
 jo_Preview.GridLevel.Visible        := False;
 jo_Preview.GridLevelOst.Visible     := False;
 jo_Preview.GridLevelCustSch.Visible := True;

 Db_Count := 0;
 Kr_Count := 0;

 for i := 0 to Length(CustSch) - 1 do with jo_Preview.TableViewCustSch.CreateColumn do begin
  Name := 'TableViewCustSch_' + CustSch[i]._NameField;
  Caption := CustSch[i]._Num_Sch;

  if CustSch[i]._Db then begin
   Position.BandIndex := 4;

   Inc(Db_Count);
  end
  else begin
   Position.BandIndex := 6;

   Inc(Kr_Count);
  end;

  HeaderAlignmentVert := vaCenter;
  HeaderAlignmentHorz := taCenter;

  PropertiesClass   := TcxTextEditProperties;
  TcxTextEditProperties(Properties).Alignment.Horz := taRightJustify;
  TcxTextEditProperties(Properties).Alignment.Vert := taVCenter;

  DataBinding.FieldName := CustSch[i]._NameField;

  Width := 80;
 end;

 if Db_Count = 0 then jo_Preview.TableViewCustSch.Bands[3].Visible := False
 else jo_Preview.TableViewCustSch.Bands[4].Width := 80 * Db_Count;

 if Kr_Count = 0 then jo_Preview.TableViewCustSch.Bands[5].Visible := False
 else jo_Preview.TableViewCustSch.Bands[6].Width := 80 * Kr_Count;

 jo_Preview.DataSource.DataSet := DBDataset.DataSet;

 jo_Preview.FormStyle := fsMDIChild;

 jo_Preview.ApplyButton.Visible := False;

 jo_Preview.Show;
end;

procedure Tjo9_PrintForm.OrderCustSch(InSch : PCustSchArray);
var
 i, j : integer;
 s : string;

 k : integer;

 Flag : boolean;
 Last : integer;
 Temp : array of integer;
 Res  : TCustSchArray;
begin
 SchOrderMData.Open;
 SchOrderMData.EmptyTable;

 for i := 0 to Length(InSch^) - 1 do begin
  Flag := True;
  for j := 0 to Length(Temp) - 1 do
   if Temp[j] = InSch^[i]._id_Sch then begin
    Flag := False;
    Break;
   end;

  if Flag then begin
   SetLength(Temp, Length(Temp) + 1);
   Temp[Length(Temp) - 1] := InSch^[i]._id_Sch;
  end
  else Continue;

  s := InSch^[i]._Num_Sch;

  k    := 0;
  Last := 0;

  SchOrderMData.Append;

  SchOrderMData.Edit;
  SchOrderMData.FieldByName('id_Sch').Value := InSch^[i]._id_Sch;
  if InSch^[i]._Db then
   SchOrderMData.FieldByName('Field1').Value := 0
  else
   SchOrderMData.FieldByName('Field1').Value := 1;

  SchOrderMData.Post;

  for j := 1 to Length(s) do begin
   if not (s[j] in ['0'..'9']) then begin
    Inc(k);

    SchOrderMData.Edit;
    SchOrderMData.FieldByName('Field' + IntToStr(k + 1)).Value := StrToInt(Copy(s, Last + 1, j - Last - 1));
    SchOrderMData.Post;

    Last := j;
   end;
  end;

  Inc(k);

  SchOrderMData.Edit;

  if s = '' then SchOrderMData.Fields[k].Value := 0
  else SchOrderMData.Fields[k + 1].Value := StrToInt(Copy(s, Last + 1, Length(s) - Last));

  SchOrderMData.Post;
 end;

 SchOrderMData.SortOnFields('Field1;Field2;Field3;Field4;Field5');

 Res := nil;

 SchOrderMData.First;
 while not SchOrderMData.Eof do begin
  for i := 0 to Length(InSch^) - 1 do if InSch^[i]._id_Sch = SchOrderMData.FieldByName('id_Sch').AsInteger then Break;

  SetLength(Res, Length(Res) + 1);
  Res[Length(Res) - 1] := InSch^[i];

  SchOrderMData.Next;
 end;

 SchOrderMData.Close;

 InSch^ := nil;
 InSch^ := Copy(Res, 0, Length(Res));
 Res    := nil;
end;

procedure Tjo9_PrintForm.SetCustSchSummary;
var
 k, i   : integer;
 j      : integer;

 In_Db  : currency;
 In_Kr  : currency;
 Cur_Db : currency;
 Cur_Kr : currency;
 Out_Db : currency;
 Out_Kr : currency;

 RIn_Db  : currency;
 RIn_Kr  : currency;
 RCur_Db : currency;
 RCur_Kr : currency;
 ROut_Db : currency;
 ROut_Kr : currency;

 Sum    : TSummaryArray;

 go_from   : integer;
 go_to     : integer;

 ResSum    : TCustSchArray;
begin
 In_Db  := 0;
 In_Kr  := 0;
 Cur_Db := 0;
 Cur_Kr := 0;
 Out_Db := 0;
 Out_Kr := 0;

 RIn_Db  := 0;
 RIn_Kr  := 0;
 RCur_Db := 0;
 RCur_Kr := 0;
 ROut_Db := 0;
 ROut_Kr := 0;

 ResSum := Copy(CustSch, 0, Length(CustSch));

 for i := 0 to Length(CustSch) - 1 do CustSch[i]._Sum := 0;

 LastCustName := '';

 go_to     := -1;

 Sum := nil;

 k := 1;

 if JOMemoryDataCust.RecordCount > 0 then Step := 10 / JOMemoryDataCust.RecordCount;

 while k <= JOMemoryDataCust.RecordCount + 1 do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  LastCustName := JOMemoryDataCust.FieldByName('CustNameFilter').Value;

  JOMemoryDataCust.RecNo := k;

  if not VarIsNull(JOMemoryDataCust.FieldByName('State').Value) or (k = JOMemoryDataCust.RecordCount + 1) then begin
   if k = 1 then begin
    go_to := JOMemoryDataCust.RecNo;
    Inc(k);
    Continue;
   end;

   go_from := JOMemoryDataCust.RecNo;
   JOMemoryDataCust.RecNo := go_to;

   JOMemoryDataCust.Edit;

   JOMemoryDataCust.FieldByName('In_Db').Value  := DoCurrFormat(FloatToStrF(In_Db, ffFixed,  100, 2));
   JOMemoryDataCust.FieldByName('In_Kr').Value  := DoCurrFormat(FloatToStrF(In_Kr, ffFixed,  100, 2));
   JOMemoryDataCust.FieldByName('Db_Sum').Value := DoCurrFormat(FloatToStrF(Cur_Db, ffFixed, 100, 2));
   JOMemoryDataCust.FieldByName('Kr_Sum').Value := DoCurrFormat(FloatToStrF(Cur_Kr, ffFixed, 100, 2));
   JOMemoryDataCust.FieldByName('Out_Db').Value := DoCurrFormat(FloatToStrF(Out_Db, ffFixed, 100, 2));
   JOMemoryDataCust.FieldByName('Out_Kr').Value := DoCurrFormat(FloatToStrF(Out_Kr, ffFixed,  100, 2));

   RIn_Db  := RIn_Db  + In_Db;
   RIn_Kr  := RIn_Kr  + In_Kr;
   RCur_Db := RCur_Db + Cur_Db;
   RCur_Kr := RCur_Kr + Cur_Kr;
   ROut_Db := ROut_Db + Out_Db;
   ROut_Kr := ROut_Kr + Out_Kr;

   for i := 0 to Length(CustSch) - 1 do begin
    JOMemoryDataCust.FieldByName(CustSch[i]._NameField).Value := DoCurrFormat(FloatToStrF(CustSch[i]._Sum, ffFixed,  100, 2));

    for j := 0 to Length(ResSum) - 1 do if ResSum[j]._NameField = CustSch[i]._NameField then begin
     ResSum[j]._Sum := ResSum[j]._Sum + CustSch[i]._Sum;
     Break;
    end;
   end;

   JOMemoryDataCust.FieldByName('CustNameFilter').Value  := LastCustName;

   JOMemoryDataCust.Post;

   In_Db  := 0;
   In_Kr  := 0;
   Cur_Db := 0;
   Cur_Kr := 0;
   Out_Db := 0;
   Out_Kr := 0;

   for i := 0 to Length(CustSch) - 1 do CustSch[i]._Sum := 0;

   JOMemoryDataCust.RecNo := go_from;
   go_to := go_from;
  end
  else begin
   if not VarIsNull(JOMemoryDataCust.FieldByName('In_Sch').Value) then begin
    if not VarIsNull(JOMemoryDataCust.FieldByName('In_Db').Value)  then In_Db  := In_Db  + StrToCurr(AnsiReplaceStr(JOMemoryDataCust.FieldByName('In_Db').Value, ThousandSeparator, ''));
    if not VarIsNull(JOMemoryDataCust.FieldByName('In_Kr').Value)  then In_Kr  := In_Kr  + StrToCurr(AnsiReplaceStr(JOMemoryDataCust.FieldByName('In_Kr').Value, ThousandSeparator, ''));
   end;

   if not VarIsNull(JOMemoryDataCust.FieldByName('Db_Sch').Value) then
    if not VarIsNull(JOMemoryDataCust.FieldByName('Db_Sum').Value) then Cur_Db := Cur_Db + StrToCurr(AnsiReplaceStr(JOMemoryDataCust.FieldByName('Db_Sum').Value, ThousandSeparator, ''));

   if not VarIsNull(JOMemoryDataCust.FieldByName('Kr_Sch').Value) then
    if not VarIsNull(JOMemoryDataCust.FieldByName('Kr_Sum').Value) then Cur_Kr := Cur_Kr + StrToCurr(AnsiReplaceStr(JOMemoryDataCust.FieldByName('Kr_Sum').Value, ThousandSeparator, ''));

   if not VarIsNull(JOMemoryDataCust.FieldByName('Out_Sch').Value) then begin
    if not VarIsNull(JOMemoryDataCust.FieldByName('Out_Db').Value) then Out_Db := Out_Db + StrToCurr(AnsiReplaceStr(JOMemoryDataCust.FieldByName('Out_Db').Value, ThousandSeparator, ''));
    if not VarIsNull(JOMemoryDataCust.FieldByName('Out_Kr').Value) then Out_Kr := Out_Kr + StrToCurr(AnsiReplaceStr(JOMemoryDataCust.FieldByName('Out_Kr').Value, ThousandSeparator, ''));
   end;

   for i := 0 to Length(CustSch) - 1 do if not VarIsNull(JOMemoryDataCust.FieldByName(CustSch[i]._NameField).Value) then begin
    CustSch[i]._Sum := CustSch[i]._Sum + StrToCurr(AnsiReplaceStr(JOMemoryDataCust.FieldByName(CustSch[i]._NameField).Value, ThousandSeparator, ''));
   end;
  end;

  Inc(k);

  JOMemoryDataCust.Next;
 end;

 JOMemoryDataCust.Append;

 JOMemoryDataCust.FieldByName('State').Value  := 'ResSumms';
 JOMemoryDataCust.FieldByName('RegNum').Value := 'Разом по контрагентам:';
 JOMemoryDataCust.FieldByName('In_Db').Value  := DoCurrFormat(FloatToStrF(RIn_Db, ffFixed,  100, 2));
 JOMemoryDataCust.FieldByName('In_Kr').Value  := DoCurrFormat(FloatToStrF(RIn_Kr, ffFixed,  100, 2));
 JOMemoryDataCust.FieldByName('Db_Sum').Value := DoCurrFormat(FloatToStrF(RCur_Db, ffFixed, 100, 2));
 JOMemoryDataCust.FieldByName('Kr_Sum').Value := DoCurrFormat(FloatToStrF(RCur_Kr, ffFixed, 100, 2));
 JOMemoryDataCust.FieldByName('Out_Db').Value := DoCurrFormat(FloatToStrF(ROut_Db, ffFixed, 100, 2));
 JOMemoryDataCust.FieldByName('Out_Kr').Value := DoCurrFormat(FloatToStrF(ROut_Kr, ffFixed,  100, 2));

 for i := 0 to Length(ResSum) - 1 do JOMemoryDataCust.FieldByName(ResSum[i]._NameField).Value := DoCurrFormat(FloatToStrF(ResSum[i]._Sum, ffFixed,  100, 2));

 JOMemoryDataCust.Post;
end;

procedure Tjo9_PrintForm.DoCurDocsExReport(Kredit: boolean);
var
 kr, gr : string;
begin
 DocTotalSumma := 0;

 if Kredit then kr := '1' else kr := '0';
 if PrintFilter._GroupByTypeDog then gr := '1' else gr := '0';

 ///////------------>>>>>>>>> Выбираю данные для формирования отчета

 DataSet.SelectSQL.Text := 'select * from JO9_DT_ALL_PROV_SEL_REG_EX(' + IntToStr(KEY_SESSION) + ','
 + IntToStr(SYS_INFO^._id_Reg_Uch) + ', ' + kr + ', ' + QuotedStr(DateToStr(PrintFilter._Date_Beg)) + ','
 + QuotedStr(DateToStr(PrintFilter._Date_End)) + ', ' + gr + ') order by NAME_CUSTOMER, KOD_S, KOD_R, KOD_ST, KOD_KEKV';

 DataSet.Open;
end;

procedure Tjo9_PrintForm.ReportAfterPrint(Sender: TfrxReportComponent);
begin

  OnCloseEvent:=Report.PreviewForm.OnClose;
   if PrintFilter._PrintKind <> JO9_AKT_SVERKI then
  begin
  Report.PreviewForm.OnClose:=CloseReport;
  end;
end;

procedure Tjo9_PrintForm.CloseReport(Sender: TObject; var Action: TCloseAction);
begin
  try

  //  Report.Free;
    Report.PreviewForm.Free;
//  OnCloseEvent(Sender,Action);
    DBDataset.Free;
    JODataset.Free;
    SecDataset.Free;
//    Self.Free;

  except
  end;
end;

procedure Tjo9_PrintForm.Print_Sch_Report_2011;
var
 TempArray : TSchArray;
 PrintSch  : TPrintSchArray;
 i, j, k   : integer;
 IN_DB     : currency;
 IN_KR     : currency;
 CUR_DB    : currency;
 CUR_KR    : currency;
 OUT_DB    : currency;
 OUT_KR    : currency;
 TURNOVER  : currency;

 Line_DB   : integer;
 Line_KR   : integer;

 Flag      : boolean;

 last_sch  : integer;
begin

 PrepareData(False);

 if PrintFilter._GroupByTypeDog then
  DataSet.SelectSQL.Text := 'select * from JO9_IN_CUR_BUFF_SEL_SCH('
  + IntToStr(KEY_SESSION) + ',1) order by NUM_TYPE_DOG'
 else
  DataSet.SelectSQL.Text := 'select * from JO9_IN_CUR_BUFF_SEL_SCH('
  + IntToStr(KEY_SESSION) + ',0)';

 DataSet.Open;

 while not DataSet.Eof do begin
  Flag := (Length(PrintFilter._NSch) = 0);

  for i := 0 to Length(PrintFilter._NSch) - 1 do
   if PrintFilter._NSch[i]._id_Sch = DataSet['ID_SCH'] then begin
    Flag := True;
    Break;
   end;

  if Flag then begin
   SetLength(TempArray, Length(TempArray) + 1);

   TempArray[Length(TempArray) - 1]._id_Sch := DataSet['ID_SCH'];

   if PrintFilter._GroupByTypeDog then begin
    TempArray[Length(TempArray) - 1]._id_Type_Dog   := DataSet['ID_TYPE_DOG'];
    TempArray[Length(TempArray) - 1]._Num_Type_Dog  := DataSet['NUM_TYPE_DOG'];
    TempArray[Length(TempArray) - 1]._Name_Type_Dog := DataSet['NAME_TYPE_DOG'];
   end
   else TempArray[Length(TempArray) - 1]._id_Type_Dog := 0;
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 for i := 0 to Length(TempArray) - 1 do begin
  DataSet.SelectSQL.Text := 'select * from PUB_SP_MAIN_SCH_INFO('
  + QuotedStr(DateToStr(PrintFilter._Date_Beg))
  + ',' + IntToStr(TempArray[i]._id_Sch) + ')';

  DataSet.Open;

  TempArray[i]._Num_Sch  := DataSet['SCH_NUMBER'];
  TempArray[i]._Name_Sch := DataSet['SCH_TITLE'];

  DataSet.Close;
 end;
  try
 StorProc.Close;
 StorProc.Transaction := ReadTr;
 StorProc.Transaction.StartTransaction;
 StorProc.StoredProcName:='JO9_PRINT_SCH_SEL_CUR_3';
 StorProc.Prepare;
 StorProc.ParamByName('KEY_SESSION').AsInteger:=KEY_SESSION;
 StorProc.ExecProc;
 StorProc.Transaction.Commit;
 except on E : Exception
 do begin
  ShowMessage(E.Message);
  StorProc.Transaction.Rollback;
  exit;
    end;
 end;
 /////////---------->>>>>   Выбираю входящие остатки
  DS_IN.Close;
 if PrintFilter._GroupByTypeDog then
  DS_IN.SelectSQL.Text := 'select * from JO9_PRINT_SCH_SEL_IN_2(' + IntToStr(KEY_SESSION) + ',1)'
 else
  DS_IN.SelectSQL.Text := 'select * from JO9_PRINT_SCH_SEL_IN_2(' + IntToStr(KEY_SESSION) + ',0)';

 DS_IN.Open;

 if DS_IN.RecordCount > 0 then Step := 20 / DS_IN.RecordCount;

 while not DS_IN.Eof do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  if not VarIsNull(DS_IN['DB_SUM']) then begin
   SetLength(PrintSch, Length(PrintSch) + 1);

   with PrintSch[Length(PrintSch) - 1] do begin
    _Kind          := 'IN_DB';
    _id_Sch_Native := DS_IN['ID_SCH'];
   // ShowMessage(DataSet['DB_SUM']);
    _Summa         := DS_IN['DB_SUM'];

    if PrintFilter._GroupByTypeDog then _id_Type_Dog := DS_IN['ID_TYPE_DOG']
    else _id_Type_Dog := 0;
   end;
  end;

  if not VarIsNull(DS_IN['KR_SUM']) then begin
   SetLength(PrintSch, Length(PrintSch) + 1);

   with PrintSch[Length(PrintSch) - 1] do begin
    _Kind          := 'IN_KR';
    _id_Sch_Native := DS_IN['ID_SCH'];
    _Summa         := DS_IN['KR_SUM'];

    if PrintFilter._GroupByTypeDog then _id_Type_Dog := DS_IN['ID_TYPE_DOG']
    else _id_Type_Dog := 0;
   end;
  end;

  DS_IN.Next;
 end;
  DS_IN.Close;


 DS_1.Close;

 ///////------------->>>>>>>   Выбираю текущие документы
  DS_1.SelectSQL.Clear;
  {DataSet.SelectSQL.Add('select * from JO9_PRINT_SCH_SEL_CUR(:id_session, :date_beg, :tip)');
  DataSet.Prepare;

  DataSet.ParamByName('ID_SESSION').AsInt64:= KEY_SESSION;
  DataSet.ParamByName('DATE_BEG').AsDate:= PrintFilter._Date_Beg;
  if PrintFilter._GroupByTypeDog = True then
  Dataset.ParamByName('TIP').AsInteger:=1
  else
  Dataset.ParamByName('TIP').AsInteger:=0; }
 if PrintFilter._GroupByTypeDog then
  DS_1.SelectSQL.Text := 'select * from JO9_PRINT_SCH_SEL_CUR_2('
  + IntToStr(KEY_SESSION) + ',' + QuotedStr(DateToStr(PrintFilter._Date_Beg)) + ',1)'
 else
  DS_1.SelectSQL.Text := 'select * from JO9_PRINT_SCH_SEL_CUR_2('
  + IntToStr(KEY_SESSION) + ',' + QuotedStr(DateToStr(PrintFilter._Date_Beg)) + ',0)';
   //ShowMessage(DataSet.SelectSQL.Text);
 DS_1.Open;
 DS_1.FetchAll;
// ShowMessage(IntToStr(DataSet.RecordCount));
 if DS_1.RecordCount > 0 then Step := 20 / DS_1.RecordCount;
  DS_1.First;
 while not DS_1.Eof do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  SetLength(PrintSch, Length(PrintSch) + 1);

  with PrintSch[Length(PrintSch) - 1] do begin
   if DS_1['IS_DB'] = 1 then _Kind := 'CUR_DB'
   else _Kind := 'CUR_KR';

   _id_Sch_Native := DS_1.FieldByName('ID_SCH').AsInteger;
   _id_Sch_Cor    := DS_1.FieldByName('ID_SCH_COR').AsInteger;
   _Num_Sch_C     := DS_1.FieldByName('NUM_SCH_COR').AsString;
   _Name_Sch_C    := DS_1.FieldByName('NAME_SCH_COR').AsString;

   _Summa         := DS_1.FieldByName('SUMMA').AsCurrency;
   _is_turnover   := DS_1.FieldByName('IS_TURNOVER').AsInteger;

   if PrintFilter._GroupByTypeDog then _id_Type_Dog := DS_1.FieldByName('ID_TYPE_DOG').AsInteger
   else _id_Type_Dog := 0;
  end;

  DS_1.Next;
 end;

 DS_1.Close;

 // Выбираю исходящие остатки

    // Пускаю процедуру CALC
 {StoredProc.StoredProcName := 'JO9_IN_CUR_BUFF_CALC';
 StoredProc.Prepare;
 StoredProc.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
 StoredProc.ExecProc; }
 DS_OUT.Close;
 if PrintFilter._GroupByTypeDog then
  DS_OUT.SelectSQL.Text := 'select * from JO9_GET_SALDO_OUT_TOTAL_2(' + IntToStr(KEY_SESSION) + ', 1)'
 else
  DS_OUT.SelectSQL.Text := 'select * from JO9_GET_SALDO_OUT_TOTAL_2(' + IntToStr(KEY_SESSION) + ', 0)';

 DS_OUT.Open;

 if DS_OUT.RecordCount > 0 then Step := 20 / DS_OUT.RecordCount;

 while not DS_OUT.Eof do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  SetLength(PrintSch, Length(PrintSch) + 2);

  with PrintSch[Length(PrintSch) - 2] do begin
   _Kind          := 'OUT_DB';
   _id_Sch_Native := DS_OUT.FieldByName('ID_SCH').AsInteger;
   _Summa         := DS_OUT.FieldByName('OUT_DB').AsCurrency;

   if PrintFilter._GroupByTypeDog then _id_Type_Dog := DS_OUT.FieldByName('ID_TYPE_DOG').AsInteger
   else _id_Type_Dog := 0;
  end;

  with PrintSch[Length(PrintSch) - 1] do begin
   _Kind          := 'OUT_KR';
   _id_Sch_Native := DS_OUT['ID_SCH'];
   _Summa         := DS_OUT.FieldByName('OUT_KR').AsCurrency;

   if PrintFilter._GroupByTypeDog then _id_Type_Dog := DS_OUT.FieldByName('ID_TYPE_DOG').AsInteger
   else _id_Type_Dog := 0;
  end;

  DS_OUT.Next;
 end;

 DS_OUT.Close;


 //-------->>>>>>>>>>>>>>>> Заполняю SchMemoryData

 if Length(TempArray) > 0 then Step := 40 / Length(TempArray);

 last_sch := -1;

 for i := 0 to Length(TempArray) - 1 do begin
  PBarPos := PBarPos + Step;
  DoProgress(PBarPos);

  if (last_sch <> TempArray[i]._id_Sch) or (i = 0) then begin
{   SchMemoryData.Append;
   SchMemoryData.Edit;

   SchMemoryData.FieldByName('Style').Value := 0;
   SchMemoryData.FieldByName('Cell1').Value := TempArray[i]._Num_Sch + ' <' + TempArray[i]._Name_Sch + '>';

   SchMemoryData.Post;

}   last_sch := TempArray[i]._id_Sch;
  end;

  if PrintFilter._GroupByTypeDog then begin
   SchMemoryData.Append;
   SchMemoryData.Edit;

   if i <> 0 then begin
    SchMemoryData.FieldByName('Style').Value := 6;
    SchMemoryData.Post;
    SchMemoryData.Append;
    SchMemoryData.Edit;
   end;

   SchMemoryData.FieldByName('Style').Value := 0;
   SchMemoryData.FieldByName('Cell1').Value := TempArray[i]._Name_Type_Dog;

   SchMemoryData.Post;
  end;

  //--------

  SchMemoryData.Append;
  SchMemoryData.Edit;

  SchMemoryData.FieldByName('Style').Value := 0;
  SchMemoryData.FieldByName('Cell1').Value := 'Залишок на початок місяця субрахунку '+TempArray[i]._Num_Sch+':';

  SchMemoryData.Post;

  SchMemoryData.Append;
  SchMemoryData.Edit;

  SchMemoryData.FieldByName('Style').Value := 1;
  IN_DB  := 0;
  IN_KR  := 0;
  CUR_DB := 0;
  CUR_KR := 0;
  OUT_DB := 0;
  OUT_KR := 0;
  TURNOVER := 0;

  // Добавляю входящие остатки

  for j := 0 to Length(PrintSch) - 1 do
   if (PrintSch[j]._id_Sch_Native = TempArray[i]._id_Sch)
   and (PrintSch[j]._id_Type_Dog = TempArray[i]._id_Type_Dog) then begin
    if PrintSch[j]._Kind = 'IN_DB' then IN_DB := PrintSch[j]._Summa
    else if PrintSch[j]._Kind = 'IN_KR' then IN_KR := PrintSch[j]._Summa;
   end;

  SchMemoryData.FieldByName('Cell2').Value := DoCurrFormat(FloatToStrF(IN_DB, ffFixed, 100, 2));
  SchMemoryData.FieldByName('Cell4').Value := DoCurrFormat(FloatToStrF(IN_KR, ffFixed, 100, 2));

  SchMemoryData.Post;

{  SchMemoryData.Append;
  SchMemoryData.Edit;

  SchMemoryData.FieldByName('Style').Value := 2;
  SchMemoryData.FieldByName('Cell1').Value := 'РУХ КОШТІВ';

  SchMemoryData.Post;

  SchMemoryData.Append;
  SchMemoryData.Edit;

  SchMemoryData.FieldByName('Style').Value := 3;
  SchMemoryData.FieldByName('Cell1').Value := 'Рахунок';
  SchMemoryData.FieldByName('Cell2').Value := 'Сума';
  SchMemoryData.FieldByName('Cell3').Value := 'Рахунок';
  SchMemoryData.FieldByName('Cell4').Value := 'Сума';

  SchMemoryData.Post;
 }

  // Добавляю движение средств

  // Дебет
  SchMemoryData.Append;
  SchMemoryData.Edit;

  SchMemoryData.FieldByName('Style').Value := 0;
  SchMemoryData.FieldByName('Cell1').Value := 'Дебет субрахунку '+TempArray[i]._Num_Sch+' до кредиту субрахунків:';

  SchMemoryData.Post;

  Line_DB := SchMemoryData.RecordCount;

  OrderSch(@PrintSch);

  SchOrderMData.First;
  while not SchOrderMData.Eof do begin
   for j := 0 to Length(PrintSch) - 1 do begin
    if SchOrderMData.Fields[0].Value <> PrintSch[j]._id_Sch_Cor then Continue;
    if PrintSch[j]._id_Sch_Native <> TempArray[i]._id_Sch then Continue;
    if PrintSch[j]._id_Type_Dog <> TempArray[i]._id_Type_Dog then Continue;

    if PrintSch[j]._Kind = 'CUR_DB' then begin
     Inc(Line_DB);

     CUR_DB := CUR_DB + PrintSch[j]._Summa;
     // считаем сумму оборотов по МО только по кредиту -- Мардарь О.В. 15.08.2012
    
    // if(PrintSch[j]._is_turnover=1)then
    //   TURNOVER:=TURNOVER + PrintSch[j]._Summa;

     if Line_DB > SchMemoryData.RecordCount then SchMemoryData.Append
     else begin
      SchMemoryData.First;
      k := 1;
      while not SchMemoryData.Eof do begin
       if k = Line_DB then Break;
       inc(k);
       SchMemoryData.Next;
      end;
     end;

     SchMemoryData.Edit;

     SchMemoryData.FieldByName('Style').Value := 4;
     SchMemoryData.FieldByName('Cell1').Value := PrintSch[j]._Num_Sch_C;
     SchMemoryData.FieldByName('Cell2').Value := DoCurrFormat(FloatToStrF(PrintSch[j]._Summa, ffFixed, 100, 2));

     SchMemoryData.Post;
    end
   end;

   SchOrderMData.Next;
  end;

  // Кредит
  SchMemoryData.Append;
  SchMemoryData.Edit;

  SchMemoryData.FieldByName('Style').Value := 0;
  SchMemoryData.FieldByName('Cell1').Value := 'Кредит субрахунку '+TempArray[i]._Num_Sch+' до дебету субрахунків:';

  SchMemoryData.Post;

  Line_KR := SchMemoryData.RecordCount;

    SchOrderMData.First;
  while not SchOrderMData.Eof do begin
   for j := 0 to Length(PrintSch) - 1 do begin
    if SchOrderMData.Fields[0].Value <> PrintSch[j]._id_Sch_Cor then Continue;
    if PrintSch[j]._id_Sch_Native <> TempArray[i]._id_Sch then Continue;
    if PrintSch[j]._id_Type_Dog <> TempArray[i]._id_Type_Dog then Continue;

    if PrintSch[j]._Kind = 'CUR_KR' then begin
     Inc(Line_KR);

     if Line_KR > SchMemoryData.RecordCount then SchMemoryData.Append
     else begin
      SchMemoryData.First;
      k := 1;
      while not SchMemoryData.Eof do begin
       if k = Line_KR then Break;
       inc(k);
       SchMemoryData.Next;
      end;
     end;

     CUR_KR := CUR_KR + PrintSch[j]._Summa;

     if(PrintSch[j]._is_turnover=1)then
       TURNOVER:=TURNOVER + PrintSch[j]._Summa;

     SchMemoryData.Edit;

     SchMemoryData.FieldByName('Style').Value := 4;
     SchMemoryData.FieldByName('Cell3').Value := PrintSch[j]._Num_Sch_C;
     SchMemoryData.FieldByName('Cell4').Value := DoCurrFormat(FloatToStrF(PrintSch[j]._Summa, ffFixed, 100, 2));

     SchMemoryData.Post;
    end;
   end;

   SchOrderMData.Next;
  end;

  // Добавляю исходящие остатки

  for j := 0 to Length(PrintSch) - 1 do
   if (PrintSch[j]._id_Sch_Native = TempArray[i]._id_Sch)
   and (PrintSch[j]._id_Type_Dog = TempArray[i]._id_Type_Dog) then begin
    if PrintSch[j]._Kind = 'OUT_DB' then OUT_DB := PrintSch[j]._Summa
    else if PrintSch[j]._Kind = 'OUT_KR' then OUT_KR := PrintSch[j]._Summa;
   end;

  SchMemoryData.Append;
  SchMemoryData.Edit;

  SchMemoryData.FieldByName('Style').Value := 0;
  SchMemoryData.FieldByName('Cell1').Value := 'Залишок на кінець місяця субрахунку '+TempArray[i]._Num_Sch+':';

  SchMemoryData.Post;

  SchMemoryData.Append;
  SchMemoryData.Edit;

  SchMemoryData.FieldByName('Style').Value := 1;
  SchMemoryData.FieldByName('Cell2').Value := DoCurrFormat(FloatToStrF(OUT_DB, ffFixed, 100, 2));
  SchMemoryData.FieldByName('Cell4').Value := DoCurrFormat(FloatToStrF(OUT_KR, ffFixed, 100, 2));

  SchMemoryData.Post;

  SchMemoryData.Append;
  SchMemoryData.Edit;

  SchMemoryData.FieldByName('Style').Value := 0;
  SchMemoryData.FieldByName('Cell1').Value := 'Сума оборотів за меморіальним ордером:';

  SchMemoryData.Post;

  SchMemoryData.Append;
  SchMemoryData.Edit;

  SchMemoryData.FieldByName('Style').Value := 5;
  SchMemoryData.FieldByName('Cell4').Value := DoCurrFormat(FloatToStrF(TURNOVER, ffFixed, 100, 2));

  SchMemoryData.Post;
 end;

 SchMemoryData.SortOnFields('Kind');
end;

end.
