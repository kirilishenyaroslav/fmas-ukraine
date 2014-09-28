unit MainReportsPrintVip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, FIBQuery, pFIBQuery, pFIBStoredProc,
  ActnList, frxDesgn, frxClass, DB, FIBDataSet, pFIBDataSet, frxDBSet,
  FIBDatabase, pFIBDatabase, ComCtrls, StdCtrls, cxButtons, IBase,
  frxExportRTF, cxControls, cxContainer, cxEdit, cxLabel;

type
  TfrmMainReportsPrintVip = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    StatusBar1: TStatusBar;
    pFIBDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    frxDBDataset: TfrxDBDataset;
    pFIBDataSet: TpFIBDataSet;
    frxDesigner1: TfrxDesigner;
    ActionList1: TActionList;
    Designer: TAction;
    pFIBStoredProc: TpFIBStoredProc;
    frxRTFExport1: TfrxRTFExport;
    frxReport: TfrxReport;
    cxLabel1: TcxLabel;
    procedure cxButton2Click(Sender: TObject);
    procedure DesignerExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure frxReportGetValue(const VarName: String; var Value: Variant);
  private
    print_page : integer;
    constructor Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64);overload;
    { Private declarations }
  public
    { Public declarations }
  end;
function ReportsPrintVip(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64):Integer;stdcall;
exports ReportsPrintVip;

var
  frmMainReportsPrintVip: TfrmMainReportsPrintVip;
  id_people_print:Int64;
  designer_rep:integer;
implementation

{$R *.dfm}
function ReportsPrintVip(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64):Integer;
var
  PrProp:TfrmMainReportsPrintVip;
begin
    PrProp:=TfrmMainReportsPrintVip.Create(AOwner,DB,id_people);
    PrProp.ShowModal;
    PrProp.Free;
end;

constructor  TfrmMainReportsPrintVip.Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64);
begin
    Inherited Create(Aowner);
    pFIBDatabase.Handle:=DBL;
    id_people_print:=id_people;
    print_page := 1;
end;

procedure TfrmMainReportsPrintVip.cxButton2Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmMainReportsPrintVip.DesignerExecute(Sender: TObject);
begin
    if designer_rep=0
    then begin
        designer_rep:=1;
        StatusBar1.Panels[0].Text:='Режим отладки отчетов';
    end else begin
        designer_rep:=0;
        StatusBar1.Panels[0].Text:='';
    end;
end;

procedure TfrmMainReportsPrintVip.cxButton1Click(Sender: TObject);
begin
  pFIBDataSet.Database:=pFIBDatabase;
  pFIBDataSet.Transaction:=ReadTransaction;

  pFIBDataSet.Active:=false;
  pFIBDataSet.ParamByName('param_people').AsInt64:=id_people_print;
  pFIBDataSet.Active:=true;

  frxReport.Clear;

  if print_page = 1
   then
    begin
     frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\PeopleN35_VIP.fr3');
     cxLabel1.Caption := 'Друк другої сторінки';
     print_page := 2;
    End
   else
    begin
     frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\PeopleN35_VIP_Page2.fr3');
     print_page := 3;
    end;

  frxReport.Variables.Clear;
  if designer_rep=1
    then frxReport.DesignReport
    else
     begin
      frxReport.PrepareReport();
      frxReport.PrintOptions.ShowDialog:=false;
      frxReport.Print;
      if print_page = 3 then Close;
     end;
end;

procedure TfrmMainReportsPrintVip.frxReportGetValue(const VarName: String; var Value: Variant);
var
  q: TpFIBDataSet;
begin
    if VarName='NA4ALNIK'
    then begin
        q:=TpFIBDataSet.Create(nil);
        q.Database:=pFIBDatabase;
        q.SelectSQL.Text:='select d.ST_MAIN_PASP_UKR from ST_INI d';
        q.Open;
        Value:=q.FBN('ST_MAIN_PASP_UKR').AsString;
    end;
end;

end.
