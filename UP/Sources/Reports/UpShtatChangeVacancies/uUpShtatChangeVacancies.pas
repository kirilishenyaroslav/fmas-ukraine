unit uUpShtatChangeVacancies;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxControls, dxStatusBar, ActnList,uCommonSp,RxMemDS,
  DB, FIBDatabase, pFIBDatabase,IBase, ComCtrls,
  Gauges,pFIBStoredProc,
  FIBQuery, pFIBQuery, frxDesgn, frxClass, frxDBSet, frxExportXLS,
  FIBDataSet, pFIBDataSet, frxExportHTML, frxExportRTF;

type
  TFormMain = class(TForm)
    dxStatusBar: TdxStatusBar;
    cxButtonFont: TcxButton;
    cxButtonFilter: TcxButton;
    cxButtonApply: TcxButton;
    cxButtonCancel: TcxButton;
    FontDialog: TFontDialog;
    ActionList: TActionList;
    FilterAction: TAction;
    PrintAction: TAction;
    FontAction: TAction;
    procedure FilterActionExecute(Sender: TObject);
    procedure PrintActionExecute(Sender: TObject);
    procedure FontActionExecute(Sender: TObject);
    procedure cxButtonCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    {Overloaded function of this form}
    constructor Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE);reintroduce;

  end;

{My WorkTimeNorm type based on TSprav}
type TUpShtatChangeVacancies=class(TSprav)
  private
    Form:TFormMain;
  public
    constructor Create;
    destructor Destroy;override;
    procedure Show;override;
  end;

{Exported function to call TSprav}
function CreateSprav:TSprav;stdcall;
exports CreateSprav;

var
  FormMain: TFormMain;

  {My variabeles}
  {Session and report ID}
  ID_SP_REPORT,ID_SESSION:Int64;
  {Can editing report or not}
  IsDesign:Boolean;
  {Font properties}
  PFontNames:string;
  PFontSizes:integer;
  PFontColors:TColor;
  PFontStyles:TFontStyles;

implementation

{$R *.dfm}

uses dmUpShtatChangeVacancies;

{Overloaded form create function}
constructor TFormMain.Create(AOwner:TComponent; DBHandle:TISC_DB_HANDLE);
begin
    inherited Create(AOwner);
    {Set database handle}
    dModule.DSet.SelectSQL.Text:='select distinct NAME_REPORT from UP_DT_REPORT_SP_REPORT Where ID_SP_REPORT='+IntToStr(id_sp_report)+'';
    dModule.DSet.Active:=True;
    Caption:=dModule.DSet.FieldValues['NAME_REPORT'];
    dModule.DSet.Active:=False;

    {Start transaction}
    dModule.WriteTransaction.StartTransaction;
    dModule.StoredProc.StoredProcName:='UP_DT_REPORT_SESSION';
    dModule.StoredProc.Prepare;

  try
    dModule.StoredProc.ExecProc;
    except
      begin
        dModule.WriteTransaction.Rollback;
        Exit;
      end;
    end;

  ID_SESSION:=dModule.StoredProc.FieldByName('OUT_ID_REPORT_SESSION').AsVariant;
  dModule.WriteTransaction.Commit;
end;

{Create TSprav class create function}
function CreateSprav: TSprav;
begin
    Result:=TUpShtatChangeVacancies.Create;
end;

{Class TSprav constructor}
constructor TUpShtatChangeVacancies.Create;
begin
    inherited Create;

    {Session and report ID}
    Input.FieldDefs.Add('id_session', ftVariant);
    Input.FieldDefs.Add('id_sp_report', ftVariant);

    {Can edit report or not}
    Input.FieldDefs.Add('DesignReport', ftBoolean);

    PrepareMemoryDatasets;
end;

{Class TSprav destructor}
destructor TUpShtatChangeVacancies.Destroy;
begin
    inherited Destroy;
end;

{Overloaded show form function of my class based on TSprav}
procedure TUpShtatChangeVacancies.Show;
  var hnd:Integer;
begin
  {Set db handle and input params}
  hnd:=Input['DBHandle'];
  id_sp_report:=Input['id_sp_report'];
  IsDesign:=Input['DesignReport'];

  {Set default font settings}
  PFontNames:='Times New Roman';
  PFontSizes:=10;
  PFontColors:=clDefault;

  {Create data module}
  dModule:=TdModule.Create(nil);
  dModule.DB.Handle:=TISC_DB_HANDLE(hnd);

  {Create form}
  Form:=TFormMain.Create(Application.MainForm,TISC_DB_HANDLE(Integer(Input['DBHandle'])));
  Form.ShowModal;
  Form.Free;
  dModule.Free;
end;

{Call filter list form}
procedure TFormMain.FilterActionExecute(Sender: TObject);
  var sp:TSprav;
begin
  try
    sp:=GetSprav('UP\UpReportFilter');

    if sp<>nil then
      begin
        with sp.Input do
          begin
            {Send DBHandle and oter params}
            Append;
            FieldValues['DBHandle'] := Integer(dModule.DB.Handle);
            FieldValues['id_session'] := id_session;
            FieldValues['id_sp_report'] := id_sp_report;
            Post;
          end;

        sp.Show;

        if sp.Output['CorrFilter']=1
          then PrintAction.Enabled:=true;

        sp.Free;
      end
        else ShowMessage('Error: Pointer to TSprav module is Null.');
      except
        on e:Exception
          do MessageDlg(e.Message,mtError,[mbOk],0);
    end;
end;

procedure TFormMain.PrintActionExecute(Sender: TObject);
  var ReportOptions:Variant;
      NameReport:TpFIBDataSet;
      m:TfrxMasterData;
begin
    NameReport:=TpFIBDataSet.Create(Self);
    NameReport.Database:=dModule.DB;
    NameReport.Transaction:=dModule.ReadTransaction;
    NameReport.SelectSQL.Text:='select R.name_fr3 from up_dt_report_sp_report R where R.id_sp_report=:id_sp_report';
    NameReport.ParamByName('id_sp_report').AsInt64:=id_sp_report;
    NameReport.Active:=true;

    ReportOptions:=VarArrayCreate([0,1],varVariant);
    ReportOptions[0]:=VarArrayOf([NameReport.FieldByName('name_fr3').AsString]);
    ReportOptions[1]:=VarArrayOf([IsDesign]);

    with dModule do
    begin
        DSetData.Active:=False;
        DSetData.SelectSQL.Text:='select distinct * from UP_SHTAT_REP_CHANGE_VACANCIES(:IN_ID_REPORT_SESSION) ORDER BY DISPLAY_2, DISPLAY_1';

        try
            DSetData.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
            DSetData.Active:=True;

            except
              on E:Exception do
                begin
                  MessageBox(Self.Handle,
                    PAnsiChar(AnsiString(e.Message)),
                    'Помилка',
                    MB_OK+MB_ICONERROR);
                  Exit;
                end;
        end;

        if DSetData.IsEmpty then
        begin
            MessageBox(Self.Handle,
              'За такими фільтром данних не знайдено.',
              'Інформація',MB_OK+MB_ICONINFORMATION);
            Exit;
        end;

        Report.Clear;
        Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Up\'+ReportOptions[0][0]+'.fr3',True);
        //Report.Variables['CUR_DATE']:=QuotedStr(DSetData['CUR_DATE']);
        //Report.Variables['FIRM_NAME']:=QuotedStr(DSetData['FIRM_NAME']);

        m := TfrxMasterData(Report.FindObject('MasterData1'));
        if m <> nil then
        begin
            m.Font.Name := PFontNames;
            m.Font.Size := PFontSizes;
            m.Font.Color := PFontColors;
            m.Font.Style := PFontStyles;
        end;

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

{Show font dialog properties}
procedure TFormMain.FontActionExecute(Sender: TObject);
begin
  if FontDialog.Execute then
    begin
      PFontNames:=FontDialog.Font.Name;
      PFontSizes:=FontDialog.Font.Size;
      PFontColors:=FontDialog.Font.Color;
      PFontStyles:=FontDialog.Font.Style;
    end;
end;

{Button close event}
procedure TFormMain.cxButtonCancelClick(Sender: TObject);
begin
  Close;
end;

end.
