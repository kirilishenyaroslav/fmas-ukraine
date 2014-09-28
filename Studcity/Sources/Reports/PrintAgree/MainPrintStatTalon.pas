unit MainPrintStatTalon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, frxDesgn, frxClass, DB, FIBDataSet,
  pFIBDataSet, frxDBSet, FIBDatabase, pFIBDatabase, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxLabel,IBase,StudcityConst, ComCtrls,
  ActnList, FIBQuery, pFIBQuery, pFIBStoredProc, cxCheckBox, uZProc;

type
  TfrmMainPrintAgree = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    pFIBDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    frxDBDataset: TfrxDBDataset;
    pFIBDataSet: TpFIBDataSet;
    frxReport: TfrxReport;
    frxDesigner1: TfrxDesigner;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Designer: TAction;
    pFIBStoredProc: TpFIBStoredProc;
    lookbefore: TcxCheckBox;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure DesignerExecute(Sender: TObject);
  private
    constructor Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);overload;
    { Private declarations }
  public
    { Public declarations }
  end;
function PrintPrintAgree(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;stdcall;
exports PrintPrintAgree;
var
  frmMainPrintAgree: TfrmMainPrintAgree;
  print_page:Integer;
  designer_rep:Integer;
  id_people_print:int64;
implementation

{$R *.dfm}

function PrintPrintAgree(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;
var
  PrProp:TfrmMainPrintAgree;
begin
  PrProp:=TfrmMainPrintAgree.Create(AOwner,DB,id_people,type_doc_print);
  PrProp.ShowModal;
  PrProp.Free;
end;


constructor  TfrmMainPrintAgree.Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);
begin
  Inherited Create(Aowner);
  pFIBDatabase.Handle:=DBL;

  Caption:='Печать статического талона прибытия.';

  pFIBDataSet.Active:=false;
  pFIBDataSet.ParamByName('param_people').AsInt64:=id_people;
  pFIBDataSet.Active:=true;

  designer_rep:=0;
  print_page:=0;
  id_people_print:=id_people;
end;


procedure TfrmMainPrintAgree.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainPrintAgree.cxButton1Click(Sender: TObject);
var
  str : string;
begin
 frxReport .Clear;
 frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\agree.fr3');
 frxReport.Variables.Clear;

 if pFIBDataSet['PAY_SUM'] <> null
  then
   begin
    str := SumToString(pFIBDataSet['PAY_SUM'], 1);
    While (Pos('''', str) <> 0) do
     begin
      Insert('"', str, Pos('''', str));
      Delete(str, Pos('''', str), 1);
     end;
    frxReport.Variables['SUMMA_PROP'] := '''' + '(' + str + ')' + '''';
   End
  else frxReport.Variables['SUMMA_PROP'] := '''' + 'нуль' + '''';

 frxReport.PrepareReport(True);
 if designer_rep = 1 then
  Begin
    frxReport.DesignReport
  End
 else
   if not lookBefore.Checked
    then frxReport.print
    else frxReport.ShowReport;
end;

procedure TfrmMainPrintAgree.DesignerExecute(Sender: TObject);
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

