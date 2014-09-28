unit dmAsupReportCandZaslProf;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, Forms, Variants,
  Controls, FIBQuery, pFIBQuery, pFIBStoredProc, Dialogs, Math,
  Asup_LoaderPrintDocs_Types, Asup_LoaderPrintDocs_Proc,
  Asup_LoaderPrintDocs_WaitForm, ASUP_LoaderPrintDocs_Consts,
  ASUP_LoaderPrintDocs_Messages, frxExportXLS, frxExportHTML, frxExportRTF,
  qFTools,Graphics;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    Designer: TfrxDesigner;
    DSetData: TpFIBDataSet;
    ReportDsetData: TfrxDBDataset;
    RTFExport: TfrxRTFExport;
    HTMLExport: TfrxHTMLExport;
    XLSExport: TfrxXLSExport;
    ReportDSetGlobalData: TfrxDBDataset;
    DSetGlobalData: TpFIBDataSet;
    Report: TfrxReport;
  private
    PDateForm:TDate;
    PDesignRep:Boolean;
    PFontNames:string;
    PFontSizes:integer;
    PFontColors:TColor;
    PFontStyles:TFontStyles;
  public
    constructor Create(AOwner:TComponent);reintroduce;
    function PrintSpr(AParameter:TSimpleParam):variant;
    property DateForm:TDate read PDateForm write PDateForm;
    property FontNames:string read PFontNames write PFontNames;
    property FontSizes:integer read PFontSizes write PFontSizes;
    property FontColors:TColor read PFontColors write PFontColors;
    property FontStyles:TFontStyles read PFontStyles write PFontStyles;    
    property DesignRep:Boolean read PDesignRep write PDesignRep;    
  end;
var DM:TDM;

implementation
{$R *.dfm}

const NameReport               = '\AsupReportCandZaslProf.fr3';

constructor TDM.Create(AOwner:TComponent);
begin
    inherited Create(AOwner);
    PDateForm := Date;
    PDesignRep:=False;
    PFontNames:='Times New Roman';
    PFontSizes:=-255;
    PFontColors:=clDefault;
end;

function TDM.PrintSpr(AParameter:TSimpleParam):variant;
var wf:TForm;
    m : TfrxMasterData;
begin
    if  AParameter.Owner is TForm then
    wf:=ShowWaitForm(AParameter.Owner as TForm,wfPrepareData)
    else wf:=ShowWaitForm(Application.MainForm,wfPrepareData);
    try
        Screen.Cursor:=crHourGlass;
        DSetData.SQLs.SelectSQL.Text:='SELECT * FROM ASUP_REPORT_CAND_ZASL_PROF('''+DateToStr(PDateForm)+''')';
        DSetGlobalData.SQLs.SelectSQL.Text := 'SELECT FIRM_NAME FROM INI_ASUP_CONSTS';
        try
            DSetData.Open;
            DSetGlobalData.Open;
            except
            on E:Exception do
            begin
                AsupShowMessage(Error_Caption,e.Message,mtError,[mbOK]);
                Screen.Cursor:=crDefault;
                Exit;
            end;
        end;

        if  DSetData.IsEmpty then
        begin
            qFErrorDialog('За такими даними співробітників не знайдено!');
            Screen.Cursor:=crDefault;
            Exit;
        end;

        Report.Clear;
        Report.LoadFromFile(ExtractFilePath(Application.ExeName)+Path_ALL_Reports+NameReport,True);
        Report.Variables['dates'] := QuotedStr(DateToStr(PDateForm));
        Report.Variables['NameV']:=QuotedStr(DSetGlobalData['FIRM_NAME']);
        if PFontSizes=-255 then PFontSizes:=10;
        m := TfrxMasterData(Report.FindObject('MasterData1'));
        if m <> nil then
        begin
            m.Font.Name := PFontNames;
            m.Font.Size := PFontSizes;
            m.Font.Color := PFontColors;
            m.Font.Style := PFontStyles;
        end;        
        Screen.Cursor:=crDefault;
        finally
        CloseWaitForm(wf);
    end;
    if DesignReport then Report.DesignReport
    else Report.ShowReport;
    Report.Free;
    if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.

