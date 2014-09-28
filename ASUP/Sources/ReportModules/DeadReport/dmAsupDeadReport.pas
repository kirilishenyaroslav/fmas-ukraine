unit dmAsupDeadReport;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, frxDesgn, IBase, Forms, Variants,
  Controls, FIBQuery, pFIBQuery, pFIBStoredProc, Dialogs, Math,
  Asup_LoaderPrintDocs_Types, Asup_LoaderPrintDocs_Proc,
  Asup_LoaderPrintDocs_WaitForm, ASUP_LoaderPrintDocs_Consts,
  ASUP_LoaderPrintDocs_Messages, qFTools, frxExportHTML, frxExportXLS,
  frxExportRTF,Graphics;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    Designer: TfrxDesigner;
    DSetData: TpFIBDataSet;
    ReportDsetData: TfrxDBDataset;
    DSetGlobalData: TpFIBDataSet;
    ReportDSetGlobalData: TfrxDBDataset;
    RTFExport: TfrxRTFExport;
    XLSExport: TfrxXLSExport;
    HTMLExport: TfrxHTMLExport;
    Report: TfrxReport;
  private
    PId_Department:Integer;
    PFontNames:string;
    PFontSizes:integer;
    PFontColors:TColor;
    PFontStyles:TFontStyles;
    PDateFormBeg:TDate;
    PDateFormEnd:TDate;
    PWithChild:boolean;
    PDesignRep:Boolean;
  public
    constructor Create(AOwner:TComponent);reintroduce;
    function PrintSpr(AParameter:TSimpleParam):variant;
    property Id_Department:Integer read PId_Department write PId_Department;
    property FontNames:string read PFontNames write PFontNames;
    property FontSizes:integer read PFontSizes write PFontSizes;
    property FontColors:TColor read PFontColors write PFontColors;
    property FontStyles:TFontStyles read PFontStyles write PFontStyles;
    property WithChild:boolean read PWithChild write PWithChild;
    property DateFormBeg:TDate read PDateFormBeg write PDateFormBeg;
    property DateFormEnd:TDate read PDateFormEnd write PDateFormEnd;
    property DesignRep:Boolean read PDesignRep write PDesignRep;
  end;

var DM:TDM;

implementation
{$R *.dfm}

const NameReport               = '\AsupDeadReport.fr3';

constructor TDM.Create(AOwner:TComponent);
begin
    inherited Create(AOwner);
    PDateFormBeg := Date;
    PDateFormEnd := Date;
    PId_Department:=-255;
    PDesignRep:=False;
    PFontNames:='Times New Roman';
    PFontSizes:=-255;
    PFontColors:=clDefault;
end;

function TDM.PrintSpr(AParameter:TSimpleParam):variant;
var wf:TForm;
    m : TfrxDetailData;
begin
    if  AParameter.Owner is TForm then
    wf:=ShowWaitForm(AParameter.Owner as TForm,wfPrepareData)
    else wf:=ShowWaitForm(Application.MainForm,wfPrepareData);
    try
        Screen.Cursor:=crHourGlass;
        DSetData.SQLs.SelectSQL.Text :='SELECT * FROM Asup_Report_Dead('''+DateToStr(PDateFormBeg)+''','''+DateToStr(PDateFormEnd)+''','+
                                        IntToStr(PId_Department)+','+
                                        IfThen(PWithChild,'''T''','''F''')+')';
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
            qFErrorDialog('За такими даними працівників не знайдено!');
            Screen.Cursor:=crDefault;
            Exit;
        end;

        Report.Clear;
        Report.LoadFromFile(ExtractFilePath(Application.ExeName)+Path_ALL_Reports+NameReport,True);
        Report.Variables.Clear;
        Report.Variables[' '+'User Category']:=NULL;
        Report.Variables.AddVariable('User Category','PTerm',
                              '''в термін з '+DateToStr(PDateFormBeg)+' по '+DateToStr(PDateFormEnd)+'''');
        Report.Variables['NameV']:=QuotedStr(DSetGlobalData['FIRM_NAME']);                      
        if PFontSizes=-255 then PFontSizes:=10;
        m := TfrxDetailData(Report.FindObject('MasterData1'));
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
    if not DSetData.IsEmpty then
    begin
        if PDesignRep then Report.DesignReport
        else Report.ShowReport;
        Report.Free;
    end;
    if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.

