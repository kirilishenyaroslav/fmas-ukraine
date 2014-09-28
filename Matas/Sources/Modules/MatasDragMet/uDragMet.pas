{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с оборотами по драгметаллам             }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDragMet;

interface

uses  ibase,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCheckBox, DB, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, Buttons, frxDesgn, frxClass,
  frxDBSet, cxSpinEdit, uMatasUtils, uMatasVars, ActnList,
  cxLookAndFeelPainters, cxButtons, uResources, cxButtonEdit, uSpMatSchMulti,
  frxExportHTML, frxExportXML, frxExportRTF, frxExportPDF,  uSpMatOtv;

type
  TReportForm = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReportDataSet: TpFIBDataSet;
    WorkTransaction: TpFIBTransaction;
    ReportDataSource: TDataSource;
    Label4: TLabel;
    cxCheckEditRep: TcxCheckBox;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    cxCopies: TcxSpinEdit;
    cxReport: TcxComboBox;
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    ActionList1: TActionList;
    ActionOk: TAction;
    ActionCansel: TAction;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SBOk: TcxButton;
    SBCansel: TcxButton;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    LabelSch: TLabel;
    cxLookupSch: TcxButtonEdit;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxXMLExport1: TfrxXMLExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxReport: TfrxReport;
    lbl1: TLabel;
    MolSelect: TcxButtonEdit;
    procedure SBCanselClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBOkClick(Sender: TObject);
    procedure cxLookupSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure cxLookupSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxReportPropertiesChange(Sender: TObject);
    procedure MolSelectPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    Report_type:Integer;
    DesignReport:Boolean;
    DBHANDLE:TISC_DB_HANDLE;
    MatasMonth, MatasYear: Word;
    PERIOD: TDateTime;
    DateBeg:TDate;
    DateEnd:TDate;
    FILTER_ID_SESSION: integer;
    F_SCH: boolean;
    ID_MO: Integer;
    FIO, SpodrMO :string;
    constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; ID_USER: int64);overload;
  end;

  procedure ShowRepDragMetForm(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
  exports ShowRepDragMetForm;

var
  ReportForm: TReportForm;

implementation

{$R *.dfm}
uses DateUtils;

//-------------------------------------------------------
procedure ShowRepDragMetForm(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 fm:TReportForm;
begin
 fm:=TReportForm.Create(AOwner, DBHANDLE, aID_USER);
end;

constructor TReportForm.Create(AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; ID_USER : Int64);
var
 dy, dm, dd: Word;
 str:String;
begin
 inherited Create(AOwner);
 if Assigned(aDBHandle) then begin
  DBHANDLE := aDBHandle;
  PERIOD:=_MATAS_PERIOD;
  WorkDatabase.Handle:=aDBHANDLE;
  WorkDatabase.Open;

  DecodeDate(PERIOD, dy, dm, dd);
  MatasYear:=dy;
  MatasMonth:=dm;
  LoadMonthTocxComboBox(cxMonthBeg);
  LoadMonthTocxComboBox(cxMonthEnd);

  cxCopies.Value:=1;
  cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
  cxCheckEditRep.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
  cxMonthBeg.ItemIndex:=MatasMonth-1;
  cxMonthEnd.ItemIndex:=MatasMonth-1;
  cxYearBeg.Value:=MatasYear;
  cxYearEnd.Value:=MatasYear;

  cxReport.ItemIndex:=0;
  SBOk.Caption:=MAT_ACTION_PRINT_CONST;
  SBCansel.Caption:=MAT_BUTTON_CANCEL_CONST;
  id_mo := 0;
 end;
end;

procedure TReportForm.SBCanselClick(Sender: TObject);
begin
 Close;
end;

procedure TReportForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TReportForm.SBOkClick(Sender: TObject);
var
 DBEG, DEND: TDateTime;
 MatasMonth1, MatasYear1: Word;
 MatasMonth2, MatasYear2: Word;
 prefix:string;
begin
 MatasYear1:=cxYearBeg.Value;
 MatasMonth1:=cxMonthBeg.ItemIndex+1;
 DBEG:=StartOfAMonth(MatasYear1, MatasMonth1);
 MatasYear2:=cxYearEnd.Value;
 MatasMonth2:=cxMonthEnd.ItemIndex+1;
 DEND:=EndOfAMonth(MatasYear2, MatasMonth2);

 ReportDataSet.Close;
 ReportDataSet.SelectSQL.Clear;

 if cxReport.ItemIndex=0 then
 begin
  ReportDataSet.SelectSQL.Add('SELECT * FROM MAT_GET_DRAG_MET_OBOROT(:PDATE_BEG, :PDATE_END)');
  if (id_mo<>0) and (MolSelect.Text<>'') then ReportDataSet.SelectSQL.Add(' WHERE ID_MO = '+ IntToStr(ID_mo));
  ReportDataSet.SelectSQL.Add(' ORDER BY SFIO, NAME_DEPARTMENT, NAME, INV_NUM_FULL, NNUM, SHORT_NAME_DM');
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ReportMovingDragMetFull.fr3');
 end;

 if cxReport.ItemIndex=1 then
 begin
  ReportDataSet.SelectSQL.Add('SELECT ID_MO, FIO, SFIO, NAME_DEPARTMENT, ID_DRAG_MET, SHORT_NAME_DM,');
  ReportDataSet.SelectSQL.Add('       sum(BEG_KOL_DRAG_MET) as BEG_KOL_DRAG_MET,');
  ReportDataSet.SelectSQL.Add('       sum(PRH_KOL_DRAG_MET) as PRH_KOL_DRAG_MET,');
  ReportDataSet.SelectSQL.Add('       sum(RSH_KOL_DRAG_MET) as RSH_KOL_DRAG_MET,');
  ReportDataSet.SelectSQL.Add('       sum(OUT_KOL_DRAG_MET) as OUT_KOL_DRAG_MET');
  ReportDataSet.SelectSQL.Add(' FROM MAT_GET_DRAG_MET_OBOROT_BY_MO(:PDATE_BEG, :PDATE_END, '+IntToStr(ID_mo)+')');
  //if (id_mo<>0) and (MolSelect.Text<>'') then ReportDataSet.SelectSQL.Add(' WHERE ID_MO = '+ IntToStr(ID_mo));
  ReportDataSet.SelectSQL.Add(' GROUP BY 1, 2, 3, 4, 5, 6');
  ReportDataSet.SelectSQL.Add(' ORDER BY SFIO, NAME_DEPARTMENT, SHORT_NAME_DM');
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ReportMovingDragMetSumByMol.fr3');
 end;

 if cxReport.ItemIndex=2 then
 begin
  ReportDataSet.SelectSQL.Add('SELECT ID_DRAG_MET, SHORT_NAME_DM,');
  ReportDataSet.SelectSQL.Add('       sum(BEG_KOL_DRAG_MET) as BEG_KOL_DRAG_MET,');
  ReportDataSet.SelectSQL.Add('       sum(PRH_KOL_DRAG_MET) as PRH_KOL_DRAG_MET,');
  ReportDataSet.SelectSQL.Add('       sum(RSH_KOL_DRAG_MET) as RSH_KOL_DRAG_MET,');
  ReportDataSet.SelectSQL.Add('       sum(OUT_KOL_DRAG_MET) as OUT_KOL_DRAG_MET');
  ReportDataSet.SelectSQL.Add(' FROM MAT_GET_DRAG_MET_OBOROT(:PDATE_BEG, :PDATE_END)');
  if (id_mo<>0) and (MolSelect.Text<>'') then ReportDataSet.SelectSQL.Add(' WHERE ID_MO = '+ IntToStr(ID_mo));
  ReportDataSet.SelectSQL.Add(' GROUP BY 1, 2');
  ReportDataSet.SelectSQL.Add(' ORDER BY SHORT_NAME_DM');
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ReportMovingDragMetSum.fr3');
 end;

 if cxReport.ItemIndex=3 then
 begin
  ReportDataSet.SelectSQL.Add('SELECT * FROM MAT_GET_DRAG_MET_OBOROT(:PDATE_BEG, :PDATE_END)');
  prefix := ' WHERE ';
  if F_SCH then
  begin
    ReportDataSet.SelectSQL.Add(prefix+' ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    ReportDataSet.SelectSQL.Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
   prefix := ' AND ';
  end;
  if (id_mo<>0) and (MolSelect.Text<>'') then ReportDataSet.SelectSQL.Add(prefix+ 'ID_MO = '+ IntToStr(ID_mo));
  ReportDataSet.SelectSQL.Add('ORDER BY BAL_SCH_NUMBER, SCH_NUMBER, SFIO, NAME_DEPARTMENT, NAME, INV_NUM_FULL, NNUM, SHORT_NAME_DM');
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ReportMovingDragMetFullSch.fr3');
 end;

 if cxReport.ItemIndex=4 then
 begin
  ReportDataSet.SelectSQL.Add('SELECT BAL_ID_SCH, BAL_SCH_NUMBER, BAL_SCH_TITLE, ID_SCH, SCH_NUMBER, SCH_TITLE, ');
  ReportDataSet.SelectSQL.Add('       ID_MO, FIO, SFIO, NAME_DEPARTMENT, ID_DRAG_MET, SHORT_NAME_DM,');
  ReportDataSet.SelectSQL.Add('       sum(BEG_KOL_DRAG_MET) as BEG_KOL_DRAG_MET,');
  ReportDataSet.SelectSQL.Add('       sum(PRH_KOL_DRAG_MET) as PRH_KOL_DRAG_MET,');
  ReportDataSet.SelectSQL.Add('       sum(RSH_KOL_DRAG_MET) as RSH_KOL_DRAG_MET,');
  ReportDataSet.SelectSQL.Add('       sum(OUT_KOL_DRAG_MET) as OUT_KOL_DRAG_MET');
  ReportDataSet.SelectSQL.Add(' FROM MAT_GET_DRAG_MET_OBOROT(:PDATE_BEG, :PDATE_END)');
  prefix := ' WHERE ';
  if F_SCH then
  begin
    ReportDataSet.SelectSQL.Add(prefix+' ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    ReportDataSet.SelectSQL.Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    prefix := ' AND ';
  end;
   if (id_mo<>0) and (MolSelect.Text<>'') then ReportDataSet.SelectSQL.Add(prefix+ 'ID_MO = '+ IntToStr(ID_mo));
  ReportDataSet.SelectSQL.Add(' GROUP BY 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12');
  ReportDataSet.SelectSQL.Add(' ORDER BY BAL_SCH_NUMBER, SCH_NUMBER, SFIO, NAME_DEPARTMENT, SHORT_NAME_DM');
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ReportMovingDragMetSumByMolSch.fr3');
 end;

 if cxReport.ItemIndex=5 then
 begin
  ReportDataSet.SelectSQL.Add('SELECT BAL_ID_SCH, BAL_SCH_NUMBER, BAL_SCH_TITLE, ID_SCH, SCH_NUMBER, SCH_TITLE, ID_DRAG_MET, SHORT_NAME_DM,');
  ReportDataSet.SelectSQL.Add('       sum(BEG_KOL_DRAG_MET) as BEG_KOL_DRAG_MET,');
  ReportDataSet.SelectSQL.Add('       sum(PRH_KOL_DRAG_MET) as PRH_KOL_DRAG_MET,');
  ReportDataSet.SelectSQL.Add('       sum(RSH_KOL_DRAG_MET) as RSH_KOL_DRAG_MET,');
  ReportDataSet.SelectSQL.Add('       sum(OUT_KOL_DRAG_MET) as OUT_KOL_DRAG_MET');
  ReportDataSet.SelectSQL.Add(' FROM MAT_GET_DRAG_MET_OBOROT(:PDATE_BEG, :PDATE_END)');
  prefix := ' WHERE ';
  if F_SCH then
  begin
    ReportDataSet.SelectSQL.Add(prefix+' ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    ReportDataSet.SelectSQL.Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    prefix := ' AND ';
  end;
   if (id_mo<>0) and (MolSelect.Text<>'') then ReportDataSet.SelectSQL.Add(prefix+ 'ID_MO = '+ IntToStr(ID_mo));
  ReportDataSet.SelectSQL.Add(' GROUP BY 1, 2, 3, 4, 5, 6, 7, 8');
  ReportDataSet.SelectSQL.Add(' ORDER BY BAL_SCH_NUMBER, SCH_NUMBER, SHORT_NAME_DM');
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ReportMovingDragMetSumSch.fr3');
 end;

 ReportDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
 ReportDataSet.ParamByName('PDATE_END').Value:=DEND;
 ReportDataSet.CloseOpen(false);
 frxReport.Variables['DateB']:= ''''+DateToStr(DBEG)+'''';
 frxReport.Variables['DateE']:= ''''+DateToStr(DEND)+'''';
 frxReport.Variables['ORG_NAME']:=''''+_ORG_FULL_NAME+'''';
 frxReport.Variables['ORG_SHORT_NAME']:=''''+_ORG_SHORT_NAME+'''';
 frxReport.Variables['ORG_KOD_OKPO']:=''''+_ORG_KOD_OKPO+'''';
 frxReport.PrintOptions.Copies:=cxCopies.Value;
 frxReport.PrintOptions.ShowDialog:=cxSelectPrinter.Checked;
 if cxCheckOnPrinter.Checked then
  frxReport.Print
 else
  frxReport.ShowReport;
 if cxCheckEditRep.Checked then
  frxReport.DesignReport;
end;

procedure TReportForm.cxLookupSchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxLookupSch.Text:='';
  F_SCH:=false;
 end
end;

procedure TReportForm.FormCreate(Sender: TObject);
begin
 FILTER_ID_SESSION:=WorkDatabase.Gen_Id('MAT_ID_SESSION',1, WorkTransaction);
 F_SCH:=false;
end;

procedure TReportForm.cxLookupSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  mr: boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
 mr:=false;
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
  cxLookupSch.Text:='';
 end;
end;

procedure TReportForm.cxReportPropertiesChange(Sender: TObject);
begin
 if (cxReport.ItemIndex<3) then
  cxLookupSch.Enabled:=false
 else
  cxLookupSch.Enabled:=true;
end;

procedure TReportForm.MolSelectPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var   Res : Variant;
begin
  Res:=uSpMatOtv.GetMatOtv(self, DBHandle, 0, ID_MO);
  if  VarType(Res) <> varEmpty then
  begin
    ID_MO:=Res[0];
    Fio := Res[1];
    SpodrMO := Res[2];
    MolSelect.Text:=Fio+' / '+SpodrMO;
  end;
end;

end.
