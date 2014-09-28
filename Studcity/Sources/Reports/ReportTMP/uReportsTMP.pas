unit uReportsTMP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxGroupBox, Cn_uReportsConst, cn_Common_Funcs, iBase, cn_Common_Types,
  DM_ReportsTMP, cnConsts, ActnList, cn_Common_WaitForm;

type
  TfrmReportTMP = class(TForm)
    cxButtonRun: TcxButton;
    cxButtonQuit: TcxButton;
    ActionList1: TActionList;
    debug_act: TAction;
    procedure FormShow(Sender: TObject);
    procedure cxButtonQuitClick(Sender: TObject);
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE); overload;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonRunClick(Sender: TObject);
    procedure debug_actExecute(Sender: TObject);
  private
    PLanguageIndex:Byte;
    IsDebugMode: boolean;
  public
    { Public declarations }
  end;

function ReportsTMP(aOwner : TComponent; db_handle : TISC_DB_HANDLE):integer;stdcall;
exports  ReportsTMP;

var
  frmReportTMP: TfrmReportTMP;
  res:Variant;
  DM:TDataModul_TMP;

implementation

{$R *.dfm}

function ReportsTMP(aOwner : TComponent; db_handle : TISC_DB_HANDLE):integer;stdcall;
var
  ViewForm:TfrmReportTMP;
begin
  ViewForm := TfrmReportTMP.Create(aOwner, db_handle);
//  ViewForm.FormStyle:= AParameter.Formstyle;
  ViewForm.ShowModal;
  ViewForm.Free;
  
end;

constructor TfrmReportTMP.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  DM:=TDataModul_TMP.Create(Self);
  DM.Database.Handle:=DB_Handle;
  DM.Database.Connected:=true;
  DM.Transaction_Read.StartTransaction;
  Screen.Cursor:=crDefault;
end;

procedure TfrmReportTMP.FormShow(Sender: TObject);
begin
  PLanguageIndex:=                      cn_Common_Funcs.cnLanguageIndex();
  cxButtonRun.Caption:=                 cnConsts.cn_accept[PLanguageIndex];
  cxButtonQuit.Caption:=                Cn_uReportsConst.cn_RepStudQuit[PLanguageIndex];
end;

procedure TfrmReportTMP.cxButtonQuitClick(Sender: TObject);
begin
  DM.Free;
  close;
end;

procedure TfrmReportTMP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmReportTMP.FormCreate(Sender: TObject);
var
  day,month,year:Word;
begin
  DM.Transaction_write.StartTransaction;
  DM.StoredProc.StoredProcName := 'ST_DT_REPORT_LIVERS_WORK';
  DM.StoredProc.Prepare;
  DM.StoredProc.ParamByName('ID_TRANSACTION').AsInt64 := -1;
  DM.StoredProc.ExecProc;
  DM.Transaction_write.Commit;
end;

procedure TfrmReportTMP.cxButtonRunClick(Sender: TObject);
var
  wf:TForm;
begin

  DM.DataSet_Report.close;
  DM.DataSet_Report.SQLs.SelectSQL.Text:='select * from ST_REPORT_TMP order by room';
  DM.DataSet_Report.Open;

  DM.Report.Clear;
  DM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\ReportsTMP.fr3');
  DM.Report.Variables.Clear;

  DM.Report.PrepareReport(True);
  if IsDebugMode then DM.Report.DesignReport
                 else DM.Report.ShowReport;
end;

procedure TfrmReportTMP.debug_actExecute(Sender: TObject);
begin
  if not IsDebugMode
   then
    Begin
     Caption:=Caption+' *debug';
     IsDebugMode:=true;
    End
   Else
    Begin
     IsDebugMode:=false;
     Caption := 'Звіт про експорт послуг';
    End;
end;

end.
