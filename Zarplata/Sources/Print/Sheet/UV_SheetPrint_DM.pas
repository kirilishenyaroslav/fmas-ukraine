unit UV_SheetPrint_DM;

interface

uses
  SysUtils, Classes, frxClass, frxDBSet, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, IBase, ZProc, ZMessages, IniFiles,
  UV_SheetPrint_Dates_Form, UV_SheetPrint_Sort,
  Forms, Dates, Controls, Variants, frxDesgn,
  pFibStoredProc, Dialogs, frxExportXLS;

type
  TPrint_DM = class(TDataModule)
    DataBase: TpFIBDatabase;
    DSetSetup: TpFIBDataSet;
    DSetGrSheet: TpFIBDataSet;
    DSourceGrSheet: TDataSource;
    DSetSheet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    frxDBDSetSetup: TfrxDBDataset;
    frxDBDSetGrSheet: TfrxDBDataset;
    frxDBDSetSheet: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxXLSExport: TfrxXLSExport;
    frxReport: TfrxReport;
    procedure frxReportGetValue(const VarName: String; var Value: Variant);
    procedure DataModuleDestroy(Sender: TObject);
    procedure frxReportAfterPrintReport(Sender: TObject);
  private
    PTypePrint:Byte;
    PId:LongWord;
    PTypeForm:Byte;
  public
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AId:LongWord;ATypeForm:Byte);reintroduce;
    procedure Print;
  end;


implementation

uses pFIBProps;

{$R *.dfm}

const Path_IniFile_Reports      = 'Reports\Zarplata\Reports.ini';
const SectionSheetOfIniFile     = 'SHEET';
const SectionReeSheetsOfIniFile = 'REESHEETS';
const SectionSheetReeOfIniFile  = 'SHEETREE';


constructor TPrint_DM.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;AId:LongWord;ATypeForm:Byte);
begin
 inherited Create(AOwner);
 PTypePrint := ATypeForm;
 DataBase.Connected := False;
 DataBase.Handle := DB_HANDLE;
 ReadTransaction.StartTransaction;
 PTypeForm:=ATypeForm;
 PId:=AId;
end;

procedure TPrint_DM.Print;
var IniFile:TIniFile;
    ViewMode:byte;
    PathReport:string;
    FormTerms:TFTermsSheetPrint;
    FormOrder:TFSort;
begin
IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
ViewMode:=0;
case PTypePrint of
 1:
  begin
   FormOrder:=TFSort.Create(self.Owner);
   if FormOrder.ShowModal=mrYes then
    begin
     ViewMode:=IniFile.ReadInteger(SectionReeSheetsOfIniFile,'ViewMode',1);
     PathReport:=IniFile.ReadString(SectionSheetOfIniFile,'NameReport','Reports\Zarplata\GrSheetOne.fr3');
     frxReport.Clear;
     frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);
     frxReport.Variables.Clear;
     DSetSetup.SQLs.SelectSQL.Text:='SELECT FULL_NAME,DIRECTOR,GLAV_BUHG,OKPO,NAME_MANEG,GLBUHG_POST,POST_NAME_ZAM FROM Z_SETUP';
     DSetGrSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINT_SHEETONE('+IntToStr(PId)+', '+IntToStr(PTypePrint)+')';
     if FormOrder.RadioGroupOrder.ItemIndex=0 then
       DSetSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINT_SHEETONE_DATA(?ID_GRSHEET,1) ORDER BY TN'
     else DSetSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINT_SHEETONE_DATA(?ID_GRSHEET,1) ORDER BY FIO';
     DSetSetup.Open;
     DSetGrSheet.Open;
     DSetSheet.Open;
     frxReport.Variables['RFromMonth']   := ''''+AnsiLowerCase(KodSetupToPeriod(DSetGrSheet.FieldValues['KOD_SETUP'],5))+'''';
     if FormOrder.CheckBoxPrintDate.Checked then frxReport.Variables['RDate']   := '''     '''
     else frxReport.Variables['RDate']   := ''''+DateToStr(date)+'''';
    end;
   FormOrder.Free;
  end;
 2:
  begin
   FormOrder:=TFSort.Create(self.Owner);
   if FormOrder.ShowModal=mrYes then
    begin
     ViewMode:=IniFile.ReadInteger(SectionReeSheetsOfIniFile,'ViewMode',1);
     PathReport:=IniFile.ReadString(SectionReeSheetsOfIniFile,'NameReport','Reports\Zarplata\GrSheetsForReestr.fr3');
     frxReport.Clear;
     frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);
     frxReport.Variables.Clear;
     DSetSetup.SQLs.SelectSQL.Text:='SELECT FULL_NAME,DIRECTOR,GLAV_BUHG,OKPO,NAME_MANEG,GLBUHG_POST,POST_NAME_ZAM FROM Z_SETUP';
     DSetGrSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINT_SHEETONE('+IntToStr(PId)+', '+IntToStr(PTypePrint)+')';
     if FormOrder.RadioGroupOrder.ItemIndex=0 then
        DSetSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINT_SHEETONE_DATA(?ID_GRSHEET,1) ORDER BY TN'
     else DSetSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINT_SHEETONE_DATA(?ID_GRSHEET,1) ORDER BY FIO';
     DSetSetup.Open;
     DSetGrSheet.Open;
     DSetSheet.Open;
     frxReport.Variables['RFromMonth']   := ''''+AnsiLowerCase(KodSetupToPeriod(DSetGrSheet.FieldValues['KOD_SETUP'],5))+'''';
     if FormOrder.CheckBoxPrintDate.Checked then frxReport.Variables['RDate']   := '''     '''
     else frxReport.Variables['RDate']   := ''''+DateToStr(date)+'''';
    end;
   FormOrder.Free;
  end;
 3:
  begin
   FormTerms:=TFTermsSheetPrint.Create(self.Owner);
   if FormTerms.ShowModal=mrYes then
    begin
     ViewMode:=IniFile.ReadInteger(SectionSheetReeOfIniFile,'ViewMode',1);
     if(ValueFieldZSetup(DataBase.Handle,'NUM_PREDPR')=5)then
       PathReport:=IniFile.ReadString(SectionSheetReeOfIniFile,'NameReport','Reports\Zarplata\PlatSheetForReestrHAI.fr3')
     else
       PathReport:=IniFile.ReadString(SectionSheetReeOfIniFile,'NameReport','Reports\Zarplata\PlatSheetForReestr.fr3');
     frxReport.Clear;
     frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);
     frxReport.Variables.Clear;
     DSetSetup.SQLs.SelectSQL.Text:='SELECT FULL_NAME,DIRECTOR,GLAV_BUHG,OKPO,NAME_MANEG,GLBUHG_POST,POST_NAME_ZAM FROM Z_SETUP';
     DSetGrSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINT_SHEETONE('+IntToStr(PId)+', '+IntToStr(PTypePrint)+')';
     if FormTerms.RadioGroupOrder.ItemIndex=0 then
     begin
       if(ValueFieldZSetup(DataBase.Handle,'NUM_PREDPR')=5)then
         DSetSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINT_SHEETONE_DATA('+IntToStr(PId)+',2) ORDER BY NAME_DEPARTMENT'
       else
         DSetSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINT_SHEETONE_DATA('+IntToStr(PId)+',2) ORDER BY TN'
     end
     else DSetSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINT_SHEETONE_DATA('+IntToStr(PId)+',2) ORDER BY FIO';
     DSetSetup.Open;
     DSetGrSheet.Open;
     DSetSheet.Open;

     if DSetGrSheet.IsEmpty then Exit;
     frxReport.Variables['RFromMonth']   := ''''+AnsiLowerCase(KodSetupToPeriod(DSetGrSheet['KOD_SETUP'],5))+'''';
     if FormTerms.CheckBoxNonTerm.Checked then
      begin
       frxReport.Variables['RDateBeg']  := '''               ''';
       frxReport.Variables['RDateEnd']  := '''               ''';
      end
     else
      begin
       frxReport.Variables['RDateBeg']  := ''''+FormTerms.DateFrom.Text+'''';
       frxReport.Variables['RDateEnd']  := ''''+FormTerms.DateTo.Text+'''';
      end;
     if FormTerms.CheckBoxPrintDate.Checked then frxReport.Variables['RDate']   := '''     '''
     else frxReport.Variables['RDate']   := ''''+DateToStr(date)+'''';
    end;
   FormTerms.Free;
  end;
 4:
  begin
   FormTerms:=TFTermsSheetPrint.Create(self.Owner);
   FormTerms.cxCheckBox1.Visible:=true;
   if(NumPredpr(DataBase.Handle)<>1)then
     FormTerms.cxCheckBox2.Visible:=true;
   if FormTerms.ShowModal=mrYes then
   begin
     PathReport:=IniFile.ReadString(SectionSheetReeOfIniFile,'NameReport','Reports\Zarplata\PlatSheetForReestrNew.fr3');
     frxReport.Clear;
     frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);
     frxReport.Variables.Clear;
     DSetSetup.SQLs.SelectSQL.Text:='SELECT SHORT_NAME,DIRECTOR,GLAV_BUHG,OKPO,NAME_MANEG,GLBUHG_POST,POST_NAME_ZAM FROM Z_SETUP';
     if(FormTerms.cxCheckBox1.EditValue )then
       DSetGrSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINT_SHEETONE('+IntToStr(PId)+', '+IntToStr(PTypePrint)+')'
     else
     begin
       if(FormTerms.cxCheckBox2.EditValue )then
         DSetGrSheet.SQLs.SelectSQL.Text := 'SELECT KOD_SETUP, (SUM(GRSUMMA)) as GRSUMMA, SCH_NUMBER, ID_ORG, NAME_ORG, 0 as KOD_SHEET FROM UV_PRINT_SHEETONE('+IntToStr(PId)+', '+IntToStr(PTypePrint)+') GROUP BY 1,3,4,5 ORDER BY 5'
       else
         DSetGrSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINT_SHEETONE('+IntToStr(PId)+', 5)';
     end;
     DSetSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINT_SHEETONE_DATA';
     if(FormTerms.cxCheckBox1.EditValue)then
       DSetSheet.SQLs.SelectSQL.Text:=DSetSheet.SQLs.SelectSQL.Text+'(?ID_GRSHEET,1) '
     else
     begin
       if(FormTerms.cxCheckBox2.EditValue )then
         DSetSheet.SQLs.SelectSQL.Text:='SELECT * FROM UV_PRINT_SHEETONE_DATA_ORG_STR('+IntToStr(PId)+',?ID_ORG)'
       else
         DSetSheet.SQLs.SelectSQL.Text:=DSetSheet.SQLs.SelectSQL.Text+'('+IntToStr(PId)+',2) ';
     end;
     if FormTerms.RadioGroupOrder.ItemIndex=0 then
     begin
         DSetSheet.SQLs.SelectSQL.Text := DSetSheet.SQLs.SelectSQL.Text+'ORDER BY TN'
     end
     else DSetSheet.SQLs.SelectSQL.Text := DSetSheet.SQLs.SelectSQL.Text+'ORDER BY FIO';
     DSetSetup.Open;
     DSetGrSheet.Open;
     DSetSheet.Open;

     if DSetGrSheet.IsEmpty then Exit;
     frxReport.Variables['RFromMonth']   := ''''+AnsiLowerCase(KodSetupToPeriod(DSetGrSheet['KOD_SETUP'],4))+'''';
     frxReport.Variables['NumPredpr']:=ValueFieldZSetup(DataBase.Handle,'NUM_PREDPR');
     if FormTerms.CheckBoxNonTerm.Checked then
      begin
       frxReport.Variables['RDateBeg']  := '''               ''';
       frxReport.Variables['RDateEnd']  := '''               ''';
      end
     else
      begin
       frxReport.Variables['RDateBeg']  := ''''+FormTerms.DateFrom.Text+'''';
       frxReport.Variables['RDateEnd']  := ''''+FormTerms.DateTo.Text+'''';
      end;
     if FormTerms.CheckBoxPrintDate.Checked then frxReport.Variables['RDate']   := '''     '''
     else frxReport.Variables['RDate']   := ''''+DateToStr(date)+'''';
     if(FormTerms.cxCheckBox2.EditValue)then
       frxReport.Variables['TypeGroup']:=2
     else
       frxReport.Variables['TypeGroup']:=1;
    end;
   FormTerms.Free;
  end;
 5:
  begin
   FormTerms:=TFTermsSheetPrint.Create(self.Owner);
   FormTerms.cxCheckBox1.Visible:=false;
   FormTerms.CheckBoxNonTerm.Visible:=false;
   FormTerms.CheckBoxPrintDate.Visible:=false;
   FormTerms.cxLabelTo.Visible:=false;
   FormTerms.DateTo.Visible:=false;
   if FormTerms.ShowModal=mrYes then
   begin
     PathReport:=IniFile.ReadString(SectionSheetReeOfIniFile,'NameReport','Reports\Zarplata\DeponentForReestr.fr3');
     frxReport.Clear;
     frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);
     frxReport.Variables.Clear;
     DSetSetup.SQLs.SelectSQL.Text:='SELECT SHORT_NAME,DIRECTOR,GLAV_BUHG,OKPO,NAME_MANEG,GLBUHG_POST,POST_NAME_ZAM, FIRM_NAME_FULL FROM Z_SETUP';
     DSetGrSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINT_SHEETONE('+IntToStr(PId)+', 6)';
     DSetSheet.SQLs.SelectSQL.Text := 'SELECT * FROM UV_PRINT_SHEETONE_DATA'+'('+IntToStr(PId)+',3) ';
     if FormTerms.RadioGroupOrder.ItemIndex=0 then
     begin
         DSetSheet.SQLs.SelectSQL.Text := DSetSheet.SQLs.SelectSQL.Text+'ORDER BY TN'
     end
     else DSetSheet.SQLs.SelectSQL.Text := DSetSheet.SQLs.SelectSQL.Text+'ORDER BY FIO';
     DSetSetup.Open;
     DSetGrSheet.Open;
     DSetSheet.Open;

     if DSetGrSheet.IsEmpty then Exit;
     frxReport.Variables['RFromMonth']   := ''''+AnsiLowerCase(KodSetupToPeriod(DSetGrSheet['KOD_SETUP'],4))+'''';
     frxReport.Variables['NumPredpr']:=ValueFieldZSetup(DataBase.Handle,'NUM_PREDPR');
     frxReport.Variables['RDateBeg']  := ''''+FormTerms.DateFrom.Text+'''';
     frxReport.Variables['NumReestr']  :=   IntToStr(PId);
   end;
   FormTerms.Free;
  end;
end;
IniFile.Destroy;
if(frxReport.FileName<>'')then
begin
  if zDesignReport then frxReport.DesignReport
                   else frxReport.ShowReport;
end;
end;

procedure TPrint_DM.frxReportGetValue(const VarName: String;
  var Value: Variant);
begin
if UpperCase(VarName)='RSUMLETTERS' then
 Value:=SumToString(DSetGrSheet['GRSUMMA']);
if UpperCase(VarName)='RKASSASUMMA' then
 Value:= DSetGrSheet['GRSUMMA'];
end;

procedure TPrint_DM.DataModuleDestroy(Sender: TObject);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

procedure TPrint_DM.frxReportAfterPrintReport(Sender: TObject);
var pStProc:TpFIBStoredProc;
    pTransaction:TpFIBTransaction;
    pDataBase:TpFIBDatabase;
    wf:TForm;
begin
  if PTypePrint=3 then exit;
  
  pDataBase := TpFIBDatabase.Create(Application.MainForm);
  pTransaction := TpFIBTransaction.Create(Application.MainForm);
  pStProc := TpFIBStoredProc.Create(Application.MainForm);

  try
    try
       pDataBase.SQLDialect := 3;
       pDataBase.DefaultTransaction := pTransaction;
       pTransaction.DefaultDatabase := pDataBase;
       pStProc.Database := pDataBase;
       pStProc.Transaction := pTransaction;

       pDataBase.Handle := DataBase.Handle;
       pStProc.Transaction.StartTransaction;

       pStProc.StoredProcName := 'UV_GRSHEET_SET_FPRINT';
       pStProc.Prepare;

       DSetGrSheet.First;
       while not DSetGrSheet.Eof do
       begin
         pStProc.ParamByName('ID_GRSHEET').AsVariant := DSetGrSheet['ID_GRSHEET'];
         pStProc.ParamByName('FPRINT').AsString := 'T';
         pStProc.ExecProc;
         DSetGrSheet.Next;
       end;

       pStProc.Transaction.Commit;
    except
      on e:exception do
       begin
        pStProc.Transaction.Rollback;
        zShowMessage('Помилка',e.Message,mtError,[mbOK]);
       end;
    end;
  finally
     pStProc.Destroy;
     pTransaction.Destroy;
     pDataBase.Destroy;
  end;
end;

end.
