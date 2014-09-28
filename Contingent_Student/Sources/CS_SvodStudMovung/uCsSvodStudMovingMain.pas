unit uCsSvodStudMovingMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, ComCtrls, uCS_loader,
  ucs_types, uCS_WaitForm;

type
  TfmSvodStudMoving = class(TForm)
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
    procedure PrintActionExecute(Sender: TObject);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure FilterActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    id_sp_report,id_session:Int64;
    IsDesign:Boolean;
    constructor  Create(AParameter:TcsParamPacks);reintroduce;
  end;

{var
  fmSvodStudMoving: TfmSvodStudMoving; }

  
function CreateSprav(AParameter:TcsParamPacks):Variant;stdcall;
exports  CreateSprav;

implementation

uses DM_SvodSrudMoving;


{$R *.dfm}

function CreateSprav(AParameter:TcsParamPacks):Variant;stdcall;
var
  ViewForm:TfmSvodStudMoving;
begin
  ViewForm := TfmSvodStudMoving.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;
  ViewForm.id_sp_report := AParameter.ID_Locate;
end;

constructor  TfmSvodStudMoving.Create(AParameter:TcsParamPacks);
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

procedure  TfmSvodStudMoving.ClearFilter;
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

procedure TfmSvodStudMoving.PrintActionExecute(Sender: TObject);
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
        DataSourceInfo.DataSet := DataSetInfo;
        DataSetInfo.DataSource := DataSource;
        DSet.Close;
        DSet.SelectSQL.Text:='select distinct * from CS_SVOD_STUD_MOVING(:IN_ID_REPORT_SESSION) order by  name_form_stud, name_kat_stud,name_facul';
        DSet.ParamByName('IN_ID_REPORT_SESSION').AsInt64:= id_session;
        Dset.Open;
        DataSetInfo.SelectSQL.Text:='select distinct * from CS_SVOD_STUD_MOVING_DETAILS(?out_date_beg,?kod_facul_edbo,?id_kat_stud,?id_form_stud, ?id_spec) order by id_kurs';
        DataSetInfo.Open;
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


       // if ReportOptions[1][0]=true then
       // begin
            Report.DesignReport;
        //end
      // else
      //  begin
      //      Report.ShowReport;
       // end;
    end;
end;

procedure TfmSvodStudMoving.cxButtonCloseClick(Sender: TObject);
begin
    close;
end;

procedure TfmSvodStudMoving.FilterActionExecute(Sender: TObject);
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

end.
