{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль просмотра остатков и оборотов                  }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uViewOstIstfin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, FIBDataSet,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  FIBDatabase, pFIBDatabase, pFIBDataSet, cxButtonEdit, StdCtrls,
  cxButtons, cxSpinEdit, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, ExtCtrls, ibase, Placemnt, uResources,
  uPackageManager, uMatasVars, uSpMatSchEx, uSpMatSchMulti, uMatasUtils,
  frxClass, frxDBSet, frxCross, cxCheckBox, GlobalSPR, FIBQuery, pFIBQuery,
  pFIBStoredProc, uSpMatOtv, frxDesgn, frxExportPDF, frxExportRTF,
  frxExportXLS;

type
  TOstIstfinForm = class(TForm)
    Panel1: TPanel;
    LabelPeriod: TLabel;
    LabelSch: TLabel;
    cxMonth: TcxComboBox;
    cxYear: TcxSpinEdit;
    cxLookupSch: TcxButtonEdit;
    OstDatabase: TpFIBDatabase;
    DocOstDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
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
    DocOstDataSetID_OST: TFIBBCDField;
    DocOstDataSetBAL_ID_SCH: TFIBIntegerField;
    DocOstDataSetBAL_SCH_NUMBER: TFIBStringField;
    DocOstDataSetBAL_SCH_TITLE: TFIBStringField;
    DocOstDataSetID_SCH: TFIBBCDField;
    DocOstDataSetSCH_NUMBER: TFIBStringField;
    DocOstDataSetSCH_TITLE: TFIBStringField;
    DocOstDataSetID_NOMN: TFIBBCDField;
    DocOstDataSetNOMN: TFIBStringField;
    DocOstDataSetLINKTO: TFIBBCDField;
    DocOstDataSetNAME: TFIBStringField;
    DocOstDataSetID_UNIT: TFIBBCDField;
    DocOstDataSetUNIT: TFIBStringField;
    DocOstDataSetID_MO: TFIBBCDField;
    DocOstDataSetFIO: TFIBStringField;
    DocOstDataSetSFIO: TFIBStringField;
    DocOstDataSetNAME_DEPARTMENT: TFIBStringField;
    DocOstDataSetID_SM: TFIBBCDField;
    DocOstDataSetSM_TITLE: TFIBStringField;
    DocOstDataSetSM_KOD: TFIBIntegerField;
    DocOstDataSetID_RZ: TFIBBCDField;
    DocOstDataSetRZ_TITLE: TFIBStringField;
    DocOstDataSetRZ_KOD: TFIBIntegerField;
    DocOstDataSetID_ST: TFIBBCDField;
    DocOstDataSetST_TITLE: TFIBStringField;
    DocOstDataSetST_KOD: TFIBIntegerField;
    DocOstDataSetID_KEKV: TFIBBCDField;
    DocOstDataSetKEKV_TITLE: TFIBStringField;
    DocOstDataSetKEKV_KOD: TFIBIntegerField;
    DocOstDataSetKOL_MAT: TFIBBCDField;
    DocOstDataSetSUMMA: TFIBBCDField;
    DataSource1: TDataSource;
    cxGrid1DBTableView1BAL_SCH_NUMBER: TcxGridDBColumn;
    cxGrid1DBTableView1SCH_NUMBER: TcxGridDBColumn;
    cxGrid1DBTableView1NOMN: TcxGridDBColumn;
    cxGrid1DBTableView1NAME: TcxGridDBColumn;
    cxGrid1DBTableView1UNIT: TcxGridDBColumn;
    cxGrid1DBTableView1FIO: TcxGridDBColumn;
    cxGrid1DBTableView1SFIO: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_DEPARTMENT: TcxGridDBColumn;
    cxGrid1DBTableView1SM_KOD: TcxGridDBColumn;
    cxGrid1DBTableView1RZ_KOD: TcxGridDBColumn;
    cxGrid1DBTableView1ST_KOD: TcxGridDBColumn;
    cxGrid1DBTableView1KEKV_KOD: TcxGridDBColumn;
    cxGrid1DBTableView1KOL_MAT: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA: TcxGridDBColumn;
    OstFormStorage: TFormStorage;
    WriteTransaction: TpFIBTransaction;
    frxDBDataset: TfrxDBDataset;
    pFIBDataSetForReport: TpFIBDataSet;
    frxReport: TfrxReport;
    frxCrossObject1: TfrxCrossObject;
    lbl1: TLabel;
    cxMatOtv: TcxButtonEdit;
    lbl2: TLabel;
    cxSmeta: TcxButtonEdit;
    lbl3: TLabel;
    cxRz: TcxButtonEdit;
    lbl4: TLabel;
    cxKekv: TcxButtonEdit;
    pnl1: TPanel;
    ApplyButton: TcxButton;
    PrintButton: TcxButton;
    ExitButton: TcxButton;
    cxGroup: TcxCheckBox;
    TR: TpFIBTransaction;
    StPr: TpFIBStoredProc;
    DocOstDataSetID_FOND: TFIBBCDField;
    DocOstDataSetFOND_NUMBER: TFIBStringField;
    DocOstDataSetFOND_TITLE: TFIBStringField;
    DocOstDataSetRASHOD_POS: TFIBIntegerField;
    cxgrdbclmnRASHOD_POS: TcxGridDBColumn;
    cxButton1: TcxButton;
    frxDesigner1: TfrxDesigner;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    procedure cxLookupSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxLookupSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ApplyButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FilterButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure cxGroupPropertiesChange(Sender: TObject);
    procedure cxSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxRzPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxKekvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxMatOtvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxSmetaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxRzKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxKekvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxButton1Click(Sender: TObject);
    procedure DocOstDataSetKOL_MATGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DocOstDataSetUNITGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DocOstDataSetSM_KODGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DocOstDataSetRZ_KODGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DocOstDataSetST_KODGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DocOstDataSetKEKV_KODGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    { Private declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
    { Public declarations }
   F_SCH: boolean;
   FILTER_ID_SESSION: integer;
   PERIOD: TDateTime;
   ID_SM, ID_RZ, ID_ST, ID_KEKV, ID_MO:Integer;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64);overload;
  end;

  procedure ShowOstIstFin(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
  exports ShowOstIstFin;

var
  OstIstfinForm: TOstIstfinForm;
//  IstFinFilter: TMatasFilter;

implementation

{$R *.dfm}

uses uViewOstIstfinFilter, uPrintIstfin;

procedure ShowOstIstFin(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 TOstIstfinForm.Create(AOwner, DBHANDLE, aID_USER);
end;

constructor TOstIstfinForm.Create(AOwner: TComponent; DBHANDLE: TISC_DB_HANDLE; ID_USER: int64);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.ID_USER:=ID_USER;
   Self.OstDatabase.Handle:=DBHANDLE;
   Self.F_SCH:=false;
   ID_SM:=0;
   ID_RZ:=0;
   ID_ST:=0;
   ID_KEKV:=0;
   ID_MO:=0;
   FILTER_ID_SESSION:=OstDatabase.Gen_Id('MAT_ID_SESSION',1, ReadTransaction);
//   IstFinFilter:=TMatasFilter.Create(self, DBHANDLE, 0);
 end;
end;

procedure TOstIstfinForm.cxLookupSchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxLookupSch.Text:='';
  F_SCH:=false;
//  FILTER_ID_SESSION:=0;
 end
end;

procedure TOstIstfinForm.cxLookupSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  mr: boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
 mr:=false;
 //if FILTER_ID_SESSION=0 then


 Res:=uSpMatSchMulti.GetMatSchMulti(self, DBHandle, 0, FILTER_ID_SESSION, mr);
 if mr then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   cxLookupSch.Text := s;
   F_SCH:=true;
  end
 end
 else
 begin
  F_SCH:=false;
  FILTER_ID_SESSION:=0;
  cxLookupSch.Text:='';
 end;
// ApplyButtonClick(self);
end;

procedure TOstIstfinForm.ApplyButtonClick(Sender: TObject);
var
 dm, dy: Word;
 prefix: string;
 w: TForm;
begin
 w:=ShowWaitWindow(self);
 prefix:=' WHERE ';
 dy:=cxYear.Value;
 dm:=cxMonth.ItemIndex+1;
 PERIOD:=EncodeDate(dy, dm, 1);
 DocOstDataSet.Close;
 DocOstDataSet.SelectSql.Clear;
 DocostDataSet.SelectSql.Add('SELECT * FROM MAT_GET_OST_MAT_BY_ISTFIN(:PERIOD, :PID_SESSION, :ID_MO) ');
 DocOstDataSet.ParamByName('PERIOD').Value:=PERIOD;

 DocOstDataSet.ParamByName('PID_SESSION').Value:=FILTER_ID_SESSION;
 DocOstDataSet.ParamByName('ID_MO').Value:=ID_MO;
 DocOstDataSet.CloseOpen(false);
 cxGrid1DBTableView1.ViewData.Expand(true);
 CloseWaitWindow(w);
end;

procedure TOstIstfinForm.ExitButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TOstIstfinForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 try
   TR.StartTransaction;
   StPr.StoredProcName:='MAT_CLEAR_TMP_BY_SESSION';
   StPr.Prepare;

   StPr.ParamByName('ID_SESSION').AsInt64:=FILTER_ID_SESSION;
   StPr.ExecProc;
   StPr.Transaction.Commit;

   except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr.Transaction.Rollback;
    Exit;
   end;
 end;
 OstFormStorage.StoredValue['FormWidth']:=Width;
 OstFormStorage.StoredValue['FormHeight']:=Height;
 OstFormStorage.SaveFormPlacement;
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TOstIstfinForm.FormCreate(Sender: TObject);
var
  dd, dm, dy: Word;
begin
 Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_ACC_OSTB;
 OstFormStorage.RestoreFormPlacement;
 try
  Width:=OstFormStorage.StoredValue['FormWidth'];
  Height:=OstFormStorage.StoredValue['FormHeight'];
 except
  Width:=750;
  Height:=500;
 end;
 if Width<200 then Width:=750;
 if Height<100 then Height:=500;
 PERIOD:=_MATAS_PERIOD;
 DecodeDate(PERIOD, dy, dm, dd);
 LoadMonthTocxComboBox(cxMonth);
 cxMonth.ItemIndex:=dm-1;
 cxYear.Value:=dy;
 LabelPeriod.Caption:=MAT_STR_COL_PERIOD;
 LabelSch.Caption:=MAT_STR_COL_SCH;
 ApplyButton.Caption:=MAT_BUTTON_SHOW_CONST;
 PrintButton.Caption:=MAT_ACTION_PRINT_CONST;
 ExitButton.Caption:=MAT_BUTTON_EXIT_CONST;
 //FilterButton.Caption:=MAT_ACTION_FILTER_CONST;
end;

procedure TOstIstfinForm.FormDestroy(Sender: TObject);
begin
// IstFinFilter.Free;
end;

procedure TOstIstfinForm.FilterButtonClick(Sender: TObject);
begin
// IstFinFilter.F_DB_SCH:=false;
// IstFinFilter.ShowModal;
end;

procedure TOstIstfinForm.PrintButtonClick(Sender: TObject);
var  fp : TPrintFormIstfin;
     id: integer;
     period_for_report:string;
     w: TForm;
begin
 if DocOstDataSet.IsEmpty then Exit;
 fp:=TPrintFormIstfin.Create(self);
 fp.DBHANDLE:=DBHANDLE;
 if fp.ShowModal = mrOk then
 begin

    w:=ShowWaitWindow(self);
   pFIBDataSetForReport.Close;
   pFIBDataSetForReport.SelectSql.Clear;

   if fp.cxPrintForm.ItemIndex=0 then
   begin
    pFIBDataSetForReport.SelectSql.Add('SELECT * FROM MAT_GET_OST_MAT_BY_ISTFIN(:PERIOD, :PID_SESSION, :ID_MO)');
    pFIBDataSetForReport.SelectSql.Add(' Order by SCH_NUMBER,FIO,name_department');
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\osn_ist_fin.fr3');
   end;
   if fp.cxPrintForm.ItemIndex=1 then
   begin
    pFIBDataSetForReport.SelectSql.Add('SELECT ID_SCH, SCH_NUMBER, SCH_TITLE, ID_MO, FIO, NAME_DEPARTMENT, ID_SM, SM_KOD, ID_ST, ST_KOD, ID_RZ, RZ_KOD, ID_KEKV, KEKV_KOD, SUM(KOL_MAT), SUM(SUMMA) FROM MAT_GET_OST_MAT_BY_ISTFIN(:PERIOD, :PID_SESSION, :ID_MO)');
    pFIBDataSetForReport.SelectSql.Add('GROUP BY ID_SCH, SCH_NUMBER, SCH_TITLE, ID_MO, FIO, NAME_DEPARTMENT, ID_SM, SM_KOD, ID_ST, ST_KOD, ID_RZ, RZ_KOD, ID_KEKV, KEKV_KOD Order by SCH_NUMBER,FIO');
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\MVO_ist_fin.fr3');
   end;
   if fp.cxPrintForm.ItemIndex=2 then
   begin
    pFIBDataSetForReport.SelectSql.Add('SELECT ID_SCH, SCH_NUMBER, SCH_TITLE, ID_SM, SM_KOD, SM_TITLE, ID_ST, ST_KOD, ST_TITLE, ID_RZ, RZ_KOD, RZ_TITLE, ID_KEKV, KEKV_KOD, KEKV_TITLE, SUM(KOL_MAT), SUM(SUMMA) FROM MAT_GET_OST_MAT_BY_ISTFIN(:PERIOD, :PID_SESSION, :ID_MO)');
    pFIBDataSetForReport.SelectSql.Add('GROUP BY ID_SCH, SCH_NUMBER, SCH_TITLE, ID_SM, SM_KOD, SM_TITLE, ID_ST, ST_KOD, ST_TITLE, ID_RZ, RZ_KOD, RZ_TITLE, ID_KEKV, KEKV_KOD, KEKV_TITLE Order by SCH_NUMBER ');
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\sch_ist_fin.fr3');
   end;
   if fp.cxPrintForm.ItemIndex=3 then
   begin

    pFIBDataSetForReport.SelectSql.Add('SELECT ID_SCH, SCH_NUMBER, SCH_TITLE, ID_SM, SM_KOD, SM_TITLE, ID_RZ, RZ_KOD, RZ_TITLE, ID_ST, ST_KOD, ST_TITLE, ID_KEKV, KEKV_KOD, KEKV_TITLE, SUM(KOL_MAT), SUM(SUMMA) FROM MAT_GET_OST_MAT_BY_ISTFIN(:PERIOD, :PID_SESSION, :ID_MO)');
    pFIBDataSetForReport.SelectSql.Add('GROUP BY ID_SCH, SCH_NUMBER, SCH_TITLE, ID_SM, SM_KOD, SM_TITLE, ID_RZ, RZ_KOD, RZ_TITLE, ID_ST, ST_KOD, ST_TITLE, ID_KEKV, KEKV_KOD, KEKV_TITLE Order by SCH_NUMBER, SM_KOD, RZ_KOD, ST_KOD, KEKV_KOD ');
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\byut_ist_fin.fr3');
    frxReport.Variables['SCH']:=cxLookupSch.Text;
   end;
      if fp.cxPrintForm.ItemIndex=4 then
   begin
    pFIBDataSetForReport.SelectSql.Add('SELECT ID_SCH, SCH_NUMBER, SCH_TITLE, SM_KOD, SM_TITLE, SUM(SUMMA) FROM MAT_GET_OST_MAT_BY_ISTFIN(:PERIOD, :PID_SESSION, :ID_MO)');
    pFIBDataSetForReport.SelectSql.Add('GROUP BY ID_SCH, SCH_NUMBER, SCH_TITLE, SM_KOD, SM_TITLE  Order by SM_KOD, SCH_NUMBER ');
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\byut_ist_fin_by_s.fr3');
   end;
      if fp.cxPrintForm.ItemIndex=5 then
   begin
    pFIBDataSetForReport.SelectSql.Add('SELECT ID_SCH, SCH_NUMBER, SCH_TITLE, RZ_KOD, RZ_TITLE, SUM(SUMMA) FROM MAT_GET_OST_MAT_BY_ISTFIN(:PERIOD, :PID_SESSION, :ID_MO)');
    pFIBDataSetForReport.SelectSql.Add('GROUP BY ID_SCH, SCH_NUMBER, SCH_TITLE, RZ_KOD, RZ_TITLE Order by  RZ_KOD, SCH_NUMBER ');
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\byut_ist_fin_by_rz.fr3');
   end;
     if fp.cxPrintForm.ItemIndex=6 then
   begin
    pFIBDataSetForReport.SelectSql.Add('SELECT ID_SCH, SCH_NUMBER, SCH_TITLE, KEKV_KOD, KEKV_TITLE, SUM(SUMMA) FROM MAT_GET_OST_MAT_BY_ISTFIN(:PERIOD, :PID_SESSION, :ID_MO)');
    pFIBDataSetForReport.SelectSql.Add('GROUP BY ID_SCH, SCH_NUMBER, SCH_TITLE, KEKV_KOD, KEKV_TITLE Order by KEKV_KOD, SCH_NUMBER ');
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\byut_ist_fin_by_kekv.fr3');
   end;
   if fp.cxPrintForm.ItemIndex=7 then
   begin
    pFIBDataSetForReport.SelectSql.Add('SELECT ID_SCH, SCH_NUMBER, SCH_TITLE, ID_SM, SM_KOD, SM_TITLE, ID_RZ, RZ_KOD, RZ_TITLE,  SUM(SUMMA) FROM MAT_GET_OST_MAT_BY_ISTFIN(:PERIOD, :PID_SESSION, :ID_MO)');
    pFIBDataSetForReport.SelectSql.Add('GROUP BY ID_SCH, SCH_NUMBER, SCH_TITLE, ID_SM, SM_KOD, SM_TITLE, ID_RZ, RZ_KOD, RZ_TITLE Order by SM_KOD, RZ_KOD, SCH_NUMBER ');
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\byut_ist_fin_widh_cross_table.fr3');
    frxReport.Variables['SCH']:=''''+cxLookupSch.Text+'''';
  end;
   if fp.cxPrintForm.ItemIndex=8 then
   begin
    pFIBDataSetForReport.SelectSql.Add('SELECT FOND_NUMBER, FOND_TITLE, ID_RZ, RZ_KOD, RZ_TITLE,  SUM(SUMMA) FROM MAT_GET_OST_MAT_BY_ISTFIN(:PERIOD, :PID_SESSION, :ID_MO)');
    pFIBDataSetForReport.SelectSql.Add('GROUP BY FOND_NUMBER, FOND_TITLE, ID_RZ, RZ_KOD, RZ_TITLE Order by FOND_NUMBER, RZ_KOD ');
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\byut_ist_fin_fond_cross_table.fr3');
    frxReport.Variables['SCH']:=''''+cxLookupSch.Text+'''';
  end;

   if fp.cxPrintForm.ItemIndex=9 then
   begin
    pFIBDataSetForReport.SelectSql.Add('SELECT SM_KOD, SM_TITLE, NAME_DEPARTMENT, SFIO, NAME, date_opr, KOL_MAT, SUM(SUMMA) FROM MAT_GET_OST_MAT_BY_ISTFIN(:PERIOD, :PID_SESSION, :ID_MO)');
    pFIBDataSetForReport.SelectSql.Add('GROUP BY 1,2,3,4,5,6,7 Order by 1,3,4,5,7');
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\Uprow_forma_ist_fin.fr3');
   end;

    pFIBDataSetForReport.Prepare;
    pFIBDataSetForReport.ParamByName('PERIOD').Value:=PERIOD;
    pFIBDataSetForReport.ParamByName('PID_SESSION').Value:=FILTER_ID_SESSION;
    pFIBDataSetForReport.ParamByName('ID_MO').Value:=ID_MO;
    pFIBDataSetForReport.Open;

   period_for_report:= cxMonth.Text+' '+ IntToStr(cxYear.Value);


   frxReport.Variables['PERIOD']:=''''+period_for_report+'''';
   frxReport.Variables['ORG_NAME']:=''''+_ORG_FULL_NAME+'''';
   frxReport.Variables['ORG_KOD_OKPO']:=_ORG_KOD_OKPO;
   frxReport.PrintOptions.Copies:=fp.cxCopies.Value;
   frxReport.PrintOptions.Reverse:=true;
   frxReport.PrepareReport(True);
   if fp.cxCheckEdit.Checked = True then
    Begin
     Screen.Cursor:=crDefault;
     frxReport.DesignReport
    End
   else
   if fp.cxCheckOnPrinter.Checked = True then frxReport.print
                      else frxReport.ShowReport;
 end;
pFIBDataSetForReport.Close;
  CloseWaitWindow(w);
end;

procedure TOstIstfinForm.cxGroupPropertiesChange(Sender: TObject);
begin
if cxGroup.Checked then cxGrid1DBTableView1.OptionsView.GroupByBox:=False
else cxGrid1DBTableView1.OptionsView.GroupByBox:=True;
end;

procedure TOstIstfinForm.cxSmetaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
 cxSmeta.Text:=VarToStr(uPackageManager.GetTMC(Self,DBHANDLE, ID_USER,FILTER_ID_SESSION,8,_MATAS_PERIOD,'бюджетам'));
end;

procedure TOstIstfinForm.cxRzPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  cxRz.Text:=VarToStr(uPackageManager.GetTMC(Self,DBHANDLE, ID_USER,FILTER_ID_SESSION,9,_MATAS_PERIOD,'розділам/статтям'));
end;


procedure TOstIstfinForm.cxKekvPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  cxKekv.Text:=VarToStr(uPackageManager.GetTMC(Self,DBHANDLE, ID_USER,FILTER_ID_SESSION,10,_MATAS_PERIOD,'КЕКВам'));
end;

procedure TOstIstfinForm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var  Res : Variant;
  FioMO, SpodrMO: string;
  IsMoOk:Boolean;
  begin
  Res:=uSpMatOtv.GetMatOtv(self, DBHandle, 0, ID_MO);
  if  VarType(Res) <> varEmpty
   then begin
    ID_MO:=Res[0];
    FioMO := Res[1];
    SpodrMO := Res[2];
    IsMoOk:=true;
  end;
  if IsMoOk then
   cxMatOtv.Text:=FioMO+' / '+SpodrMO;
end;

procedure TOstIstfinForm.cxMatOtvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxMatOtv.Text:='';
  ID_MO:=0;
 end;
end;

procedure TOstIstfinForm.cxSmetaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxSmeta.Text:='';
  ID_SM:=0;
 end;
end;

procedure TOstIstfinForm.cxRzKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxRz.Text:='';
  ID_RZ:=0;
 end;
end;

procedure TOstIstfinForm.cxKekvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxKekv.Text:='';
  ID_KEKV:=0;
 end;
end;

procedure TOstIstfinForm.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var   Arect : TRect;
begin
Arect:=AViewInfo.Bounds;
  if (vartostr(AViewInfo.GridRecord.Values[14])= '1')  then
  begin
      ACanvas.Canvas.Brush.Color := $008484FF;
      ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TOstIstfinForm.cxButton1Click(Sender: TObject);
begin
 try
   TR.StartTransaction;
   StPr.StoredProcName:='MAT_CLEAR_TMP_BY_SESSION';
   StPr.Prepare;

   StPr.ParamByName('ID_SESSION').AsInt64:=FILTER_ID_SESSION;
   StPr.ExecProc;
   StPr.Transaction.Commit;

   except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr.Transaction.Rollback;
    Exit;
   end;
 end;
 cxLookupSch.text:='';
 cxSmeta.Text:='';
 cxRz.text:='';
 cxKekv.text:='';
end;

procedure TOstIstfinForm.DocOstDataSetKOL_MATGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
if DocOstDataSetRASHOD_POS.AsInteger = 1 then text:=''
else text:= FloatToStrF(DocOstDataSetKOL_MAT.AsCurrency, ffNumber, 16, 4);
end;

procedure TOstIstfinForm.DocOstDataSetUNITGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
if DocOstDataSetRASHOD_POS.AsInteger = 1 then text:=''
else text:= DocOstDataSetUNIT.AsString;
end;

procedure TOstIstfinForm.DocOstDataSetSM_KODGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
if DocOstDataSetRASHOD_POS.AsInteger = 1 then text:=''
else text:= IntToStr(DocOstDataSetSM_KOD.AsInteger);
end;

procedure TOstIstfinForm.DocOstDataSetRZ_KODGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
if DocOstDataSetRASHOD_POS.AsInteger = 1 then text:=''
else text:= IntToStr(DocOstDataSetRZ_KOD.AsInteger);
end;

procedure TOstIstfinForm.DocOstDataSetST_KODGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
if DocOstDataSetRASHOD_POS.AsInteger = 1 then text:=''
else text:= IntToStr(DocOstDataSetST_KOD.AsInteger);
end;

procedure TOstIstfinForm.DocOstDataSetKEKV_KODGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
if DocOstDataSetRASHOD_POS.AsInteger = 1 then text:=''
else text:= IntToStr(DocOstDataSetKEKV_KOD.AsInteger);
end;

end.
