unit MainReportZajavStay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, FIBQuery, pFIBQuery, pFIBStoredProc,
  ActnList, frxDesgn, frxClass, DB, FIBDataSet, pFIBDataSet, frxDBSet,
  FIBDatabase, pFIBDatabase, ComCtrls, StdCtrls, cxButtons, IBase,
  frxExportRTF;

type
  TfrmMainReportZajavStay = class(TForm)
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
    procedure cxButton2Click(Sender: TObject);
    procedure DesignerExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure frxReportGetValue(const VarName: String; var Value: Variant);
  private
    constructor Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64);overload;
    { Private declarations }
  public
    { Public declarations }
  end;

function ReportZajavStay(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64):Integer;stdcall;
exports ReportZajavStay;

var
  frmMainReportZajavStay: TfrmMainReportZajavStay;
  id_people_print:Int64;
  designer_rep:integer;
implementation

{$R *.dfm}
function ReportZajavStay(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64):Integer;
var
  PrProp:TfrmMainReportZajavStay;
begin
    PrProp:=TfrmMainReportZajavStay.Create(AOwner,DB,id_people);
    PrProp.ShowModal;
    PrProp.Free;
end;

constructor  TfrmMainReportZajavStay.Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64);
begin
    Inherited Create(Aowner);
    pFIBDatabase.Handle:=DBL;
    id_people_print:=id_people;
end;

procedure TfrmMainReportZajavStay.cxButton2Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmMainReportZajavStay.DesignerExecute(Sender: TObject);
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

procedure TfrmMainReportZajavStay.cxButton1Click(Sender: TObject);
begin
    pFIBDataSet.Database:=pFIBDatabase;
    pFIBDataSet.Transaction:=ReadTransaction;

    pFIBDataSet.Active:=false;
    pFIBDataSet.ParamByName('param_people').AsInt64:=id_people_print;
    pFIBDataSet.Active:=true;

    frxReport.Clear;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\ZajavStay.fr3');
    frxReport.Variables.Clear;
    if designer_rep=1
    then frxReport.DesignReport
    else begin
        frxReport.PrepareReport();
        frxReport.PrintOptions.ShowDialog:=false;
        frxReport.Print;
        Close;
    end;
end;

procedure TfrmMainReportZajavStay.frxReportGetValue(const VarName: String; var Value: Variant);
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
