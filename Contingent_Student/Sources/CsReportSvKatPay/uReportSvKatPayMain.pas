unit uReportSvKatPayMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, ComCtrls,
  ucs_types,ucs_Loader,uCS_WaitForm,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TfmReportSvKatPay = class(TForm)
    StatusBar1: TStatusBar;
    cxButtonFilter: TcxButton;
    cxButtonPrint: TcxButton;
    cxButtonClose: TcxButton;
    ActionList1: TActionList;
    FilterAction: TAction;
    PrintAction: TAction;
    DesAction: TAction;
    FontAction: TAction;
    FontDialogs: TFontDialog;
    procedure cxButtonFilterClick(Sender: TObject);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClearFilter;
    procedure FilterActionExecute(Sender: TObject);
    procedure PrintActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    id_sp_report,id_session:Int64;
    IsDesign:Boolean;
    constructor  Create(AParameter:TcsParamPacks);reintroduce;
  end;

var
  fmReportSvKatPay: TfmReportSvKatPay;

  
function CreateSprav(AParameter:TcsParamPacks):Variant;stdcall;
exports  CreateSprav;


implementation

uses DM_ReportSVKatPay;

{$R *.dfm}

function CreateSprav(AParameter:TcsParamPacks):Variant;stdcall;
var
  ViewForm:TfmReportSvKatPay;
begin
  ViewForm := TfmReportSvKatPay.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;
  ViewForm.id_sp_report := AParameter.ID_Locate;
end;

constructor  TfmReportSvKatPay.Create(AParameter:TcsParamPacks);
begin
  Screen.Cursor := crHourGlass;

  inherited Create(AParameter.Owner);

  DM := TDM.Create(Self);
  DM.DB.Handle:=AParameter.DB_Handle;
  DM.DB.Connected := True;
  id_sp_report := AParameter.ID_Locate;
  Dm.DSetDataReport.Close;
  Dm.DSetDataReport.SelectSQL.Text:='select distinct NAME_REPORT, NAME_FR3 from CS_DT_REPORT_SP_REPORT Where ID_SP_REPORT='+IntToStr(id_sp_report)+'';
  Dm.DSetDataReport.Open;
  Caption:=Dm.DSetDataReport.FieldValues['NAME_REPORT'];
  id_session := DM.DB.Gen_Id('CS_GEN_ID_REPORT_SESSION',1);

  Screen.Cursor:=crDefault;

end;

procedure  TfmReportSvKatPay.ClearFilter;
begin
    dm.WriteTransaction.StartTransaction;
    dm.StoredProc.StoredProcName:='CS_DT_REPORT_VAL_PARAM_DEL';
    dm.StoredProc.Prepare;
    dm.StoredProc.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
    try
      dm.StoredProc.ExecProc;
    except
      begin
        dm.WriteTransaction.Rollback;
        Exit;
      end;
     end;
    dm.WriteTransaction.Commit;
end;


procedure TfmReportSvKatPay.cxButtonFilterClick(Sender: TObject);
var AParameter:TcsParamPacks;
begin
    AParameter                 := TcsParamPacks.Create;
    AParameter.Owner           := self;
    AParameter.Db_Handle       := DM.DB.Handle;
    AParameter.Formstyle       := fsNormal;
    AParameter.ID_Locate       := id_sp_report;
    AParameter.ID_SESSION      := id_session;
    DoFunctionFromPackage(AParameter, ['Contingent_Student\CS_ReportFilter.bpl', 'CreateSprav']);
    AParameter.Free;
end;

procedure TfmReportSvKatPay.cxButtonCloseClick(Sender: TObject);
begin
   close;
end;

procedure TfmReportSvKatPay.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   ClearFilter;
   if FormStyle = fsMDIChild then action:=caFree
end;

procedure TfmReportSvKatPay.FilterActionExecute(Sender: TObject);
var AParameter:TcsParamPacks;
begin
    AParameter                 := TcsParamPacks.Create;
    AParameter.Owner           := self;
    AParameter.Db_Handle       := DM.DB.Handle;
    AParameter.Formstyle       := fsNormal;
    AParameter.ID_Locate       := id_sp_report;
    AParameter.ID_SESSION      := id_session;
    DoFunctionFromPackage(AParameter, ['Contingent_Student\CS_ReportFilter.bpl', 'CreateSprav']);
    AParameter.Free;
end;

procedure TfmReportSvKatPay.PrintActionExecute(Sender: TObject);
var
    ReportOptions:Variant;
    WaitForm: TForm;
begin
    ReportOptions:=VarArrayCreate([0,1],varVariant);
    ReportOptions[0]:=VarArrayOf([Dm.DSetDataReport.fieldByName('name_fr3').AsString]);
    ReportOptions[1]:=VarArrayOf([IsDesign]);

    with Dm do
    begin
    
        try
        WaitForm := ShowWaitForm(Self);
        DataSource.DataSet := dset;
        DataSourceKurs.DataSet := DataSetKurs;
        DataSetKurs.DataSource := DataSource;
        DSet.Close;
        DataSetKurs.Close;
        DSet.SelectSQL.Text:='select distinct * from CS_SVOD_FACULTY_BY_PAYMENT_KAT(:IN_ID_REPORT_SESSION) order by name_kat_stud, name_form_stud';
        DSet.ParamByName('IN_ID_REPORT_SESSION').AsInt64:= id_session;
        Dset.Open;
        DataSetKurs.SelectSQL.Text:='select distinct * from CS_SVOD_KURS_BY_PAYMENT(?out_date_beg,?kod_facul_edbo,?id_kat_stud,?id_form_stud, ?id_spec) order by id_kurs_edbo';
        DataSetKurs.Open;
            CloseWaitForm(WaitForm);
            except
            on E:Exception do
            begin
                messageBox(0,PChar('Помилка при підготовці звіту!'),'Помилка!',MB_OK);
                Exit;
            end;
        end;

        if  Dm.DSet.IsEmpty then
        begin
            messageBox(0,PChar('За такими данними інформації не знайдено'),'Увага!',MB_OK);
            Exit;
        end;

        Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contingent_Student\'+ReportOptions[0][0]+'.fr3',True);


        if ReportOptions[1][0]=true then
        begin
            Report.DesignReport;
        end
        else
        begin
            Report.ShowReport;
        end;
    end;
end;

end.
