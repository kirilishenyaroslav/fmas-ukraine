//*****************************************************************************
//Печать ведомостей или платежной ведомости
//Параметры:
//AId - идентификатор ведомости или реестра
//ATypeForm - идентификатор типа: 1 - ведомость, 2 - ведомости реестра, 3 - платежная ведомомсть
//*****************************************************************************

unit UV_SheetPrint_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, frxClass, frxDBSet, FIBDatabase, pFIBDatabase,
  pFIBDataSet, Dates, IBase, frxDesgn, ZProc, IniFiles, Unit_SheetPrint_Consts,UV_SheetPrint_Dates_Form;

type
  TFPrintVed = class(TForm)
    DataBase: TpFIBDatabase;
    DSetSetup: TpFIBDataSet;
    DSetGrSheet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    DSetSheet: TpFIBDataSet;
    frxDBDSetSetup: TfrxDBDataset;
    frxDBDSetSheet: TfrxDBDataset;
    frxDBDSetGrSheet: TfrxDBDataset;
    DSourceGrSheet: TDataSource;
    frxReport: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frxReportGetValue(const VarName: String; var Value: Variant);
  private
    PResault:Variant;
    PTypePrint:Byte;
  public
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AId:LongWord;ATypeForm:Byte);reintroduce;
    property Resault:variant read PResault;
  end;

function CreateReportPrintSheet(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AId:LongWord;ATypeForm:Byte):variant;stdcall;
 exports CreateReportPrintSheet;

implementation

const Path_IniFile_Reports      = 'Reports\Zarplata\Reports.ini';
const SectionSheetOfIniFile     = 'SHEET';
const SectionReeSheetsOfIniFile = 'REESHEETS';
const SectionSheetReeOfIniFile  = 'SHEETREE';
{$R *.dfm}

function CreateReportPrintSheet(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AId:LongWord;ATypeForm:Byte):Variant;
var ViewForm:TFPrintVed;
begin
 ViewForm := TFPrintVed.Create(AOwner,DB_HANDLE,AId,ATypeForm);
 if ViewForm.Resault <> NULL then
  MessageBox((AOwner as TForm).Handle,PChar(ViewFormResault),PChar(CaptionError),mb_Ok+mb_IconError)
 else
  ViewForm.Close;
 ViewForm.Free;
end;

constructor TFPrintVed.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AId:LongWord;ATypeForm:Byte);
begin
 inherited Create(AOwner);
 PTypePrint := ATypeForm;
 DataBase.Connected := False;
 DataBase.Handle := DB_HANDLE;
 ReadTransaction.StartTransaction;
 DSetSetup.SQLs.SelectSQL.Text:='SELECT SHORT_NAME,DIRECTOR,GLAV_BUHG,OKPO FROM Z_SETUP';
 DSetGrSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINT_SHEETONE('+IntToStr(AId)+', '+IntToStr(PTypePrint)+')';
if PTypePrint<3 then
 DSetSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINT_SHEETONE_DATA(?ID_GRSHEET,1) ORDER BY TN'
else
 DSetSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINT_SHEETONE_DATA('+IntToStr(AId)+',2) ORDER BY TN';
end;

procedure TFPrintVed.FormCreate(Sender: TObject);
var IniFile:TIniFile;
    ViewMode:byte;
    PathReport:string;
    _summa:Extended;
    FormTerms:TFTermsSheetPrint;
    MR:TModalResult;
begin
MR:=mrYes;
if PTypePrint=3 then
 begin
  FormTerms:=TFTermsSheetPrint.Create(self);
  MR:=FormTerms.ShowModal;
 end;
if MR=mrYes then
 begin
  DSetSetup.Open;
  DSetGrSheet.Open;
  DSetSheet.Open;
 If (DSetSetup.IsEmpty) or (DSetSheet.IsEmpty) or (DSetGrSheet.IsEmpty) then
   PResault := 'Error'
 else
  begin
   DSetSheet.First;
   _summa:=0;
   while not DSetSheet.Eof do
    begin
     _summa:=_summa+DSetSheet.FieldValues['SUMMA'];
     DSetSheet.Next;
    end;
   PResault := Null;
   IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
   case PTypePrint of
    1:
    begin
      ViewMode:=IniFile.ReadInteger(SectionSheetOfIniFile,'ViewMode',1);
      PathReport:=IniFile.ReadString(SectionSheetOfIniFile,'NameReport','Reports\GrSheetOne.fr3');
     end;
    2:
     begin
      ViewMode:=IniFile.ReadInteger(SectionReeSheetsOfIniFile,'ViewMode',1);
      PathReport:=IniFile.ReadString(SectionReeSheetsOfIniFile,'NameReport','Reports\GrSheetsForReestr.fr3');
     end;
     3:
     begin
      ViewMode:=IniFile.ReadInteger(SectionSheetReeOfIniFile,'ViewMode',1);
      PathReport:=IniFile.ReadString(SectionSheetReeOfIniFile,'NameReport','Reports\PlatSheetForReestr.fr3');
     end;
    end;
    try
     frxReport.Clear;
     frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);
      frxReport.Variables['RPageOfPages'] := ''''+UV_SheetPrint_RPageOfPages_Text+'''';
      frxReport.Variables['RPage']        := ''''+UV_SheetPrint_RPage_Text+'''';
      frxReport.Variables['RHeaderPost']  := ''''+UV_SheetPrint_RHeaderPost_Text+'''';
      frxReport.Variables['RMoneyPost']   := ''''+UV_SheetPrint_RMoneyPost_Text+'''';
      frxReport.Variables['RSheet']       := ''''+UV_SheetPrint_RSheet_Text+ifthen(PTypePrint=3,' №''','''');
      frxReport.Variables['RFromMonth']   := ''''+UV_SheetPrint_RFromMonth_Text+
                                                  '<b>'+KodSetupToPeriod(DSetGrSheet.FieldValues['KOD_SETUP'],2)+'</b>''';
      frxReport.Variables['RFio']         := ''''+UV_SheetPrint_RFio_Text+'''';
      frxReport.Variables['RNumMan']      := ''''+UV_SheetPrint_RNumMan_Text+'''';
      frxReport.Variables['RTn']          := ''''+UV_SheetPrint_RTn_Text+'''';
      frxReport.Variables['RSumma']       := ''''+UV_SheetPrint_RSumma_Text+'''';
      frxReport.Variables['RSignature']   := ''''+UV_SheetPrint_RSignature_Text+'''';
      frxReport.Variables['RStBuhg']      := ''''+UV_SheetPrint_RStBuhg_Text+'''';
      frxReport.Variables['RPeoplePC']    := ''''+UV_SheetPrint_RPeoplePC_Text+'''';
      frxReport.Variables['RVidano']      := ''''+UV_SheetPrint_RVidano_Text+'''';
      frxReport.Variables['RDeponir']     := ''''+UV_SheetPrint_RDeponir_Text+'''';
      frxReport.Variables['Rraznoe']      := ''''+UV_SheetPrint_Rraznoe_Text+'''';
      frxReport.Variables['RSumOnList']   := ''''+UV_SheetPrint_RSumOnList_Text+'''';
      frxReport.Variables['RSumOnReport'] := ''''+UV_SheetPrint_RSumOnReport_Text+'''';

    if PTypePrint=3 then
     begin
      frxReport.Variables['RSum']          := ''''+UV_SheetPrint_RSum_Text+'''';
      frxReport.Variables['RSumOnReport']  := ''''+UV_SheetPrint_RSumOnReport_Text+'''';
      frxReport.Variables['RIdKod']        := ''''+UV_SheetPrint_RIdKod_Text+'''';
      frxReport.Variables['RKassaOnVipl']  := ''''+UV_SheetPrint_RKassaOnVipl_Text+FormTerms.DateFrom.Text+UV_SheetPrint_RKassaOnViplTo_Text+FormTerms.DateTo.Text+'''';
      frxReport.Variables['RKassaSumma']   := ''''+UV_SheetPrint_RKassaSumma_Text+VarToStr(DSetGrSheet['GRSUMMA'])+'''';
      frxReport.Variables['RKassaOrder']   := ''''+UV_SheetPrint_RKassaOrder_Text+'''';
      frxReport.Variables['RBuhgVipl']     := ''''+UV_SheetPrint_RBuhgVipl_Text+'''';
      frxReport.Variables['RBuhgProv']     := ''''+UV_SheetPrint_RBuhgProv_Text+'''';
      frxReport.Variables['ROnViplata']     := ''''+UV_SheetPrint_ROnViplata_Text+UV_SheetPrint_RFromMonth_Text+
                                                  KodSetupToPeriod(DSetGrSheet.FieldValues['KOD_SETUP'],2)+'''';
     end;

 //     frxReport.Variables['RSumLetters']  := '''''';//+SumToString(_summa,1,False)+'''';
     //**************************************************************************
      case ViewMode of
      1: frxReport.ShowReport;
      2: frxReport.DesignReport;
     end;
    except
     on E:Exception do
      MessageBox(self.Handle,PChar(E.Message),PChar(CaptionError),mb_ok+MB_ICONERROR);
    end;
    frxReport.Free;
  end;
 end
else
 PResault:=NULL;
end;

procedure TFPrintVed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

procedure TFPrintVed.frxReportGetValue(const VarName: String;
  var Value: Variant);
begin
if UpperCase(VarName)='RSUMLETTERS' then
 Value:=SumToString(DSetGrSheet['GRSUMMA'],1);
end;

end.
