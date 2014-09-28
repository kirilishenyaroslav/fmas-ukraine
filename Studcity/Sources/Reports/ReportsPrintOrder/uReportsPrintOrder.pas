unit uReportsPrintOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, FIBQuery, pFIBQuery, pFIBStoredProc,
  ActnList, frxDesgn, frxClass, DB, FIBDataSet, pFIBDataSet, frxDBSet,
  FIBDatabase, pFIBDatabase, ComCtrls, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxLabel,IBase;

type
  TfrmReportsPrintOrder = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    StatusBar1: TStatusBar;
    pFIBDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    frxDBDatasetFio: TfrxDBDataset;
    pFIBDataSet: TpFIBDataSet;
    frxReport: TfrxReport;
    frxDesigner1: TfrxDesigner;
    ActionList1: TActionList;
    Designer: TAction;
    pFIBStoredProc: TpFIBStoredProc;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure DesignerExecute(Sender: TObject);
  private
    constructor Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64);overload;
    { Private declarations }
  public
    { Public declarations }
  end;
function ReportsPrintOrder(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64):Integer;stdcall;
exports ReportsPrintOrder;
var
  frmReportsPrintOrder: TfrmReportsPrintOrder;
  id_people_print:Int64;
  designer_rep:integer;
implementation

{$R *.dfm}
function ReportsPrintOrder(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64):Integer;
var
  PrProp:TfrmReportsPrintOrder;
begin
  PrProp:=TfrmReportsPrintOrder.Create(AOwner,DB,id_people);
  PrProp.ShowModal;
  PrProp.Free;
end;


constructor  TfrmReportsPrintOrder.Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64);
begin
  Inherited Create(Aowner);
  pFIBDatabase.Handle:=DBL;
  id_people_print:=id_people;
end;

procedure TfrmReportsPrintOrder.cxButton2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmReportsPrintOrder.cxButton1Click(Sender: TObject);
begin
  pFIBDataSet.Database:=pFIBDatabase;
  pFIBDataSet.Transaction:=ReadTransaction;

  pFIBDataSet.Active:=false;
  pFIBDataSet.ParamByName('param_people').AsInt64:=id_people_print;
  pFIBDataSet.Active:=true;

  frxReport.Clear;
  if pFIBDataSet.FieldByName('OUT_CONT_PROPI').AsInteger=0 then
    begin
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\ReportsOrder.fr3');
    end
    else
    begin
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\ReportsOrder_CONT.fr3');
    end;  
  frxReport.Variables.Clear;
  if designer_rep=1 then
    begin
      frxReport.DesignReport;
    end
    else
    begin
      frxReport.PrepareReport();
      frxReport.PrintOptions.ShowDialog:=false;
      frxReport.Print;
      Close;
    end;  
end;

procedure TfrmReportsPrintOrder.DesignerExecute(Sender: TObject);
begin
if designer_rep=0 then
  begin
    designer_rep:=1;
    StatusBar1.Panels[0].Text:='Режим отладки отчетов';
  end
  else
  begin
    designer_rep:=0;
    StatusBar1.Panels[0].Text:='';
  end;
end;

end.

