unit uReportExpSer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxGroupBox, Cn_uReportsConst, cn_Common_Funcs, iBase, cn_Common_Types,
  DM_exp_ser, cnConsts, ActnList, cn_Common_WaitForm;

type
  TfrmReportExpSer = class(TForm)
    cxButtonRun: TcxButton;
    cxButtonQuit: TcxButton;
    cxGroupBoxPeriodStud: TcxGroupBox;
    cxLabelPriodBegin: TcxLabel;
    cxLabelPeriodEnd: TcxLabel;
    cxDateEditPeriodBegin: TcxDateEdit;
    cxDateEditPeriodEnd: TcxDateEdit;
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

function ShowReportExpSer(AParameter:TcnSimpleParams):Variant;stdcall;
exports  ShowReportExpSer;

var
  frmReportExpSer: TfrmReportExpSer;
  res:Variant;
  DM:TDataModul_EXP_SER;

implementation

{$R *.dfm}

function ShowReportExpSer(AParameter:TcnSimpleParams):Variant;stdcall;
var
  ViewForm:TfrmReportExpSer;
begin
  if AParameter.Formstyle = fsMDIChild then
  if IsMDIChildFormShow(TfrmReportExpSer) then exit;
  ViewForm := TfrmReportExpSer.Create(AParameter.Owner, AParameter.Db_Handle);
  ViewForm.FormStyle:= AParameter.Formstyle;

  case ViewForm.FormStyle of
   fsNormal, fsStayOnTop : ViewForm.ShowModal;
   fsMDIChild	          : ViewForm.Show;
  else
   begin
    ViewForm.ShowModal;
    ViewForm.free;
   end;
  end;
  Result:=res;
end;

constructor TfrmReportExpSer.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  DM:=TDataModul_EXP_SER.Create(Self);
  DM.Database.Handle:=DB_Handle;
  DM.Database.Connected:=true;
  DM.Transaction_Read.StartTransaction;
  Screen.Cursor:=crDefault;
end;

procedure TfrmReportExpSer.FormShow(Sender: TObject);
begin
  PLanguageIndex:=                      cn_Common_Funcs.cnLanguageIndex();
  cxGroupBoxPeriodStud.Caption:=        Cn_uReportsConst.cn_RepStudPeriod[PLanguageIndex];
  cxButtonRun.Caption:=                 cnConsts.cn_accept[PLanguageIndex];
  cxButtonQuit.Caption:=                Cn_uReportsConst.cn_RepStudQuit[PLanguageIndex];
  cxLabelPriodBegin.Caption:=           Cn_uReportsConst.cn_RepStudPeriodBeg[PLanguageIndex];
  cxLabelPeriodEnd.Caption:=            Cn_uReportsConst.cn_RepStudPeriodEnd[PLanguageIndex];
end;

procedure TfrmReportExpSer.cxButtonQuitClick(Sender: TObject);
begin
  DM.Free;
  close;
end;

procedure TfrmReportExpSer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmReportExpSer.FormCreate(Sender: TObject);
var
  day,month,year:Word;
begin
  DecodeDate(date,year,month,day);
  month := 1;
  day   := 1;
  cxDateEditPeriodBegin.EditValue := EncodeDate(year,month,day);
  cxDateEditPeriodEnd.EditValue   := date;
end;

procedure TfrmReportExpSer.cxButtonRunClick(Sender: TObject);
var
  wf:TForm;
begin
  If ((cxDateEditPeriodBegin.Text='') or (cxDateEditPeriodEnd.text='')) or
     (cxDateEditPeriodBegin.EditValue>cxDateEditPeriodEnd.EditValue)
   then
    begin
     ShowMessage('Невірно заповненні дати!');
     Exit;
    end;

  wf:=ShowWaitForm(self,wfLoadPackage);

  DM.DataSet_Report.close;
  DM.DataSet_Report.SQLs.SelectSQL.Text:='Select * from CN_REPORT_EXP_SER_SELECT(:DATE_BEG,:DATE_END)';
  DM.DataSet_Report.ParamByName('DATE_BEG').AsDate:= cxDateEditPeriodBegin.EditValue;
  DM.DataSet_Report.ParamByName('DATE_END').AsDate:= cxDateEditPeriodEnd.EditValue;
  DM.DataSet_Report.Open;

  DM.DataSet_Rashfr.close;
  DM.DataSet_Rashfr.SQLs.SelectSQL.Text:='Select * from CN_REPORT_EXP_SER_RASHFR(:DATE_BEG,:DATE_END)';
  DM.DataSet_Rashfr.ParamByName('DATE_BEG').AsDate:= cxDateEditPeriodBegin.EditValue;
  DM.DataSet_Rashfr.ParamByName('DATE_END').AsDate:= cxDateEditPeriodEnd.EditValue;
  DM.DataSet_Rashfr.Open;

  DM.Report.Clear;
  DM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\cn_exp_ser.fr3');
  DM.Report.Variables.Clear;
  DM.Report.Variables['DATE_BEG'] := ''''+ DateToStr(cxDateEditPeriodBegin.EditValue) + '''';
  DM.Report.Variables['DATE_END'] := ''''+ DateToStr(cxDateEditPeriodEnd.EditValue) + '''';

  DM.Report.PrepareReport(True);
  if IsDebugMode then DM.Report.DesignReport
                 else DM.Report.ShowReport;
  CloseWaitForm(wf);
end;

procedure TfrmReportExpSer.debug_actExecute(Sender: TObject);
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
