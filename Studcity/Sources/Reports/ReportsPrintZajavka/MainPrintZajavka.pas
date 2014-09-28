unit MainPrintZajavka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBASE,StudcityConst, ComCtrls, FIBDatabase, pFIBDatabase,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxLabel,
  cxLookAndFeelPainters, StdCtrls, cxButtons, frxDesgn, frxClass, ActnList,
  frxDBSet, DB, FIBDataSet, pFIBDataSet;

type
  TfrmMainPrintZajavka = class(TForm)
    ReadTransaction: TpFIBTransaction;
    pFIBDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    StatusBar1: TStatusBar;
    cxTextEditWork: TcxTextEdit;
    cxTextEditSpec: TcxTextEdit;
    cxLabelSpec: TcxLabel;
    cxLabelWork: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    pFIBDataSet: TpFIBDataSet;
    frxDBDataset: TfrxDBDataset;
    ActionList1: TActionList;
    Designer: TAction;
    frxDesigner1: TfrxDesigner;
    PrintDoc: TAction;
    frxReport: TfrxReport;
    procedure DesignerExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxTextEditWorkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxTextEditSpecKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PrintDocExecute(Sender: TObject);
    procedure frxReportGetValue(const VarName: String; var Value: Variant);
  private
    constructor Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);overload;
    { Private declarations }
  public
    { Public declarations }
  end;
function PrintZajavka(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;stdcall;
exports PrintZajavka;
var
  frmMainPrintZajavka: TfrmMainPrintZajavka;
  designer_rep:Integer;
  id_people_pr:Int64;
implementation

{$R *.dfm}
function PrintZajavka(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;
var
  PrProp:TfrmMainPrintZajavka;
begin
  PrProp:=TfrmMainPrintZajavka.Create(AOwner,DB,id_people,type_doc_print);
  PrProp.ShowModal;
  PrProp.Free;
end;

constructor  TfrmMainPrintZajavka.Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);
begin
  Inherited Create(Aowner);
  pFIBDatabase.Handle:=DBL;

  Caption:=StPrZajavka;
  cxLabelWork.Caption:=StPrZajavkaWork;
  cxLabelSpec.Caption:=StPrZajavkaSpec;

{  pFIBDataSet.Active:=false;
  pFIBDataSet.ParamByName('param_people').AsInt64:=id_people;
  pFIBDataSet.Active:=true;}

  designer_rep:=0;
  id_people_pr:=id_people;
end;

procedure TfrmMainPrintZajavka.DesignerExecute(Sender: TObject);
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

procedure TfrmMainPrintZajavka.cxButton1Click(Sender: TObject);
var
  q: TpFIBDataSet;
begin
    pFIBDataSet.Active:=false;
    pFIBDataSet.ParamByName('param_people').AsInt64:=id_people_pr;
    pFIBDataSet.Active:=true;
    frxReport.Clear;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PrintZayvka.fr3');
    frxReport.Variables.Clear;
    frxReport.Variables['ST_WORK']:=''''+cxTextEditWork.Text+'''';
    frxReport.Variables['ST_SPEC']:=''''+cxTextEditSpec.Text+'''';
    q:=TpFIBDataSet.Create(nil);
    q.Database:=pFIBDatabase;
    q.SelectSQL.Text:='select d.cn_fr_univer from pub_sys_data d';
    q.Open;
    frxReport.Variables['VUZ']:=AnsiUpperCase(q.FBN('cn_fr_univer').AsString);
    q.close;
    q.SelectSQL.Text:='select d.ST_MAIN_PASP_UKR from ST_INI d';
    q.Open;
    frxReport.Variables['NA4ALNIK']:=q.FBN('ST_MAIN_PASP_UKR').AsString;
    q.close;
    if designer_rep=1
    then frxReport.DesignReport
    else begin
        frxReport.PrepareReport();
        frxReport.PrintOptions.ShowDialog:=false;
        frxReport.Print;
    end;
    ReadTransaction.commit;
    close;
end;

procedure TfrmMainPrintZajavka.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainPrintZajavka.cxTextEditWorkKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key=VK_RETURN
    then cxTextEditSpec.SetFocus;
end;

procedure TfrmMainPrintZajavka.cxTextEditSpecKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key=VK_RETURN
    then cxButton1.SetFocus;
end;

procedure TfrmMainPrintZajavka.PrintDocExecute(Sender: TObject);
begin
    cxButton1Click(self);
end;

procedure TfrmMainPrintZajavka.frxReportGetValue(const VarName: String; var Value: Variant);
var
  q: TpFIBDataSet;
begin
    if VarName='VUZ'
    then begin
        q:=TpFIBDataSet.Create(nil);
        q.Database:=pFIBDatabase;
        q.SelectSQL.Text:='select d.cn_fr_univer from pub_sys_data d';
        q.Open;
        Value:=AnsiUpperCase(q.FBN('cn_fr_univer').AsString);
    end;
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
