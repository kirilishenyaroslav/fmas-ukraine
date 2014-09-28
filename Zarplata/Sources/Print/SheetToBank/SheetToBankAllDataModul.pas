unit SheetToBankAllDataModul;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, IniFiles, Forms, Dates, Variants,
  ZProc, ZSvodTypesUnit, Controls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ZMessages, Dialogs, Math, ZSvodProcUnit, Unit_ZGlobal_Consts,
  frxExportXLS;


type
  TDMAll = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    Designer: TfrxDesigner;
    DSetData: TpFIBDataSet;
    ReportDsetData: TfrxDBDataset;
    DSetGlobalData: TpFIBDataSet;
    ReportDSetGlobalData: TfrxDBDataset;
    Report: TfrxReport;
    DSetSetup: TpFIBDataSet;
    ReportDSetSetup: TfrxDBDataset;
    StProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    frxXLSExport: TfrxXLSExport;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleCreate(Sender: TObject);
    procedure ReportAfterPrintReport(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    PId_man:integer;
    PId_Session:integer;
    PTn:integer;
    PKodSetup:integer;
    PStrIdBank:string;
    PIdBank:integer;
    PStrOrderBy:string;
    PlanguageIndex:byte;
    Is_Printed:boolean;
    IsCopy:boolean;
    procedure SetBank(ABank:integer);
  public
    function PrintSpr(var AParameter:TSheetToBankAllParameter):variant;
    property Bank:integer read PIdBank write SetBank;
    property OrderBy:String read PStrOrderBy write PStrOrderBy;
    property KodSetup:Integer read PKodSetup write PKodSetup;
    property Printed:boolean read Is_Printed;
  end;


implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'SheetToBank';
const NameReport               = 'Reports\Zarplata\SheetToBank.fr3';



function TDMAll.PrintSpr(var AParameter:TSheetToBankAllParameter):variant;

var IniFile:TIniFile;
    ViewMode:integer;
    PathReport,TPathReport:string;
    LengthOfFileNameExt:byte;

     function PrepareData:integer;
      begin
       try
        StProc.Transaction.StartTransaction;
        StProc.StoredProcName := 'UV_SHEET_TO_BANK_ALLDATA_PREP';
        StProc.Prepare;
        StProc.ParamByName('KOD_SETUP').AsInteger := PKodSetup;
        StProc.ParamByName('ID_TYPE_PAYMENT').AsInteger := PIdBank;
        StProc.ExecProc;
        PrepareData := StProc.ParamByName('ID_SESSION').AsInteger;
        StProc.Transaction.Commit;
       except
        on E:exception do
         begin
          ZShowMessage(Error_Caption[PlanguageIndex],e.Message,mtError,[mbOK]);
          StProc.Transaction.Rollback;
          PrepareData:=-1;
         end;
       end;
      end;

begin
 Is_Printed:=False;
 IsCopy:=AParameter.Id_session>0;
 PLanguageIndex:=LanguageIndex;
 IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
 ViewMode:=IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);
 PathReport:=IniFile.ReadString(SectionOfIniFile,'SheetToBank',NameReport);

 TPathReport:=ExtractFilePath(Application.ExeName)+PathReport;
 LengthOfFileNameExt:=length(ExtractFileExt(TPathReport));
 TPathReport:=copy(TPathReport,1,Length(TPathReport)-LengthOfFileNameExt)+PStrIdBank+ExtractFileExt(TPathReport);
 if FileExists(TPathReport) then
    PathReport:=TPathReport
 else
    if FileExists(ExtractFilePath(Application.ExeName)+PathReport) then
       PathReport:=ExtractFilePath(Application.ExeName)+PathReport
    else
     begin
      ZShowMessage(Error_Caption[PlanguageIndex],ZePrintShablonNotFound_Error_Text[PLanguageIndex],mtError,[mbOK]);
      Exit;
     end;

 IniFile.Free;

 PId_man:=0;
 PTn:=0;

 Screen.Cursor:=crHourGlass;

 DSetSetup.SQLs.SelectSQL.Text:='SELECT FULL_NAME,DIRECTOR,GLAV_BUHG,OKPO,NAME_MANEG,GlBuhg_post_short FROM Z_SETUP';

 if AParameter.Id_session=0 then
  DSetData.SQLs.SelectSQL.Text := 'SELECT * FROM UV_SHEET_TO_BANK_ALLDATA('+
    PStrIdBank+','+IntToStr(PKodSetup)+') '+PStrOrderBy
 else
  DSetData.SQLs.SelectSQL.Text := 'SELECT * FROM UV_SHEET_TO_BANK_ALLDATA('+
    IntToStr(AParameter.Id_session)+',0)'+PStrOrderBy;

 DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT KOD_SETUP,SUMMA FROM UV_SHEET_TO_BANK_ALLDATA_GLOBAL(?ID_SESSION)';

 try
  DB.Handle:=AParameter.DB_Handle;

  if AParameter.Id_session=0 then AParameter.Id_session:=PrepareData;
  if AParameter.Id_session=-1 then
   begin
    if not ReadTransaction.InTransaction then
     ReadTransaction.StartTransaction;
    ReadTransaction.Rollback; 
    Exit;
   end;

  PId_Session:=AParameter.Id_session;

  DSetSetup.SQLs.SelectSQL.Text:='SELECT FULL_NAME,DIRECTOR,GLAV_BUHG,OKPO,NAME_MANEG,GlBuhg_post_short FROM Z_SETUP';
  DSetData.SQLs.SelectSQL.Text := 'SELECT * FROM UV_SHEET_TO_BANK_ALLDATA('+
     IntToStr(AParameter.Id_session)+')'+PStrOrderBy;

  DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT KOD_SETUP,SUMMA FROM UV_SHEET_TO_BANK_ALLDATA_GLOBAL('+IntToStr(AParameter.id_session)+')';

   DSetData.Open;
   DSetGlobalData.Open;
   DSetSetup.Open;
 except
   on E:Exception do
    begin
     Screen.Cursor:=crDefault;
     ZShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
     Exit;
    end;
 end;
 if DSetData.IsEmpty then
  begin
   Screen.Cursor:=crDefault;
   ZShowMessage(Error_Caption[LanguageIndex],Message_Data_Nothing_Selected[LanguageIndex],mtInformation,[mbOK]);
   Exit;
  end;

 Report.Clear;

 Report.LoadFromFile(PathReport,True);
 Report.Variables.Clear;
 Screen.Cursor:=crDefault;
 if zDesignReport then Report.DesignReport
 else Report.ShowReport;

 // Report.DesignReport;
 Report.Free;

 if IsCopy then Exit;

 try
   StProc.Transaction.StartTransaction;
   StProc.StoredProcName := 'UV_AFTER_PRINT_TP_BANK';
   StProc.Prepare;
   if Is_Printed then StProc.ParamByName('KOD_SETUP').AsInteger := PKodSetup
   else StProc.ParamByName('KOD_SETUP').AsInteger := -1;
   StProc.ParamByName('ID_SESSION').AsInteger:= PId_Session;
   StProc.ParamByName('ID_TYPE_PAYMENT').AsInteger:=PIdBank;
   StProc.ExecProc;
   StProc.Transaction.Commit;
 except
  on E:exception do
   begin
    ZShowMessage(Error_Caption[PlanguageIndex],e.Message,mtError,[mbOK]);
    StProc.Transaction.Rollback;
   end;
  end;
end;

procedure TDMAll.ReportGetValue(const VarName: String; var Value: Variant);
begin
if UpperCase(VarName)='PPERIOD' then
 Value:= '<b><u>'+AnsiLowercase(KodSetupToPeriod(DSetGlobalData['KOD_SETUP'],5))+'</u></b>';
if UpperCase(VarName)='PSUMMASTR' then
 Value:= SumToString(DSetGlobalData['SUMMA']);
end;

procedure TDMAll.DataModuleCreate(Sender: TObject);
begin
PStrIdBank:='';
PStrOrderBy:='';
end;

procedure TDMAll.SetBank(ABank:integer);
begin
 PIdBank:=ABank;
 PStrIdBank:=IntToStr(ABank);
end;

procedure TDMAll.ReportAfterPrintReport(Sender: TObject);
begin
if IsCopy then Exit;
Is_Printed:=True;
end;

procedure TDMAll.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.

