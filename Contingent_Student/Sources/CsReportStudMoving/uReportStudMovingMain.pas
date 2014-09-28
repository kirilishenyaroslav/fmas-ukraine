unit uReportStudMovingMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, ComCtrls,
  ucs_Types,ucs_Loader,uCS_WaitForm;

type
  TfmReportStudMoving = class(TForm)
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
    procedure ClearFilter;
    procedure FilterActionExecute(Sender: TObject);
    procedure PrintActionExecute(Sender: TObject);
    procedure cxButtonCloseClick(Sender: TObject);
   private
    { Private declarations }
  public
    id_sp_report,id_session:Int64;
    IsDesign:Boolean;
    constructor  Create(AParameter:TcsParamPacks);reintroduce;
  end;


{var
  fmReportStudMoving: TfmReportStudMoving; }

function CreateSprav(AParameter:TcsParamPacks):Variant;stdcall;
exports  CreateSprav;


implementation

uses DM_ReportStudMoving;

{$R *.dfm}

function CreateSprav(AParameter:TcsParamPacks):Variant;stdcall;
var
  ViewForm:TfmReportStudMoving;
begin
  ViewForm := TfmReportStudMoving.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;
  ViewForm.id_sp_report := AParameter.ID_Locate;
end;

constructor  TfmReportStudMoving.Create(AParameter:TcsParamPacks);
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


procedure  TfmReportStudMoving.ClearFilter;
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

procedure TfmReportStudMoving.FilterActionExecute(Sender: TObject);
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

procedure TfmReportStudMoving.PrintActionExecute(Sender: TObject);
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
        DSet.SelectSQL.Text:='select distinct * from CS_REPORT_STUD_MOVING(:IN_ID_REPORT_SESSION) order by  name_form_stud, name_kat_stud,name_facul, name_kurs_edbo, FIO';
        DSet.ParamByName('IN_ID_REPORT_SESSION').AsInt64:= id_session;
        Dset.Open;
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

procedure TfmReportStudMoving.cxButtonCloseClick(Sender: TObject);
begin
    close;
end;

end.
