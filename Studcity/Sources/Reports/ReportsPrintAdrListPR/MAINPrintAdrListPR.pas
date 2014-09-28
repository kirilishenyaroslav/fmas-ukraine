unit MAINPrintAdrListPR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, FIBDatabase, pFIBDatabase, StdCtrls, frxDesgn, frxClass,
  DB, FIBDataSet, pFIBDataSet, frxDBSet,StudcityConst, cxControls,
  cxContainer, cxEdit, cxLabel, cxLookAndFeelPainters, cxButtons, ActnList,
  ComCtrls, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TfrmMAINPrinAdrListPR = class(TForm)
    pFIBDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    frxDBDataset: TfrxDBDataset;
    pFIBDataSet: TpFIBDataSet;
    frxDesigner1: TfrxDesigner;
    cxLabelStatus: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Designer: TAction;
    pFIBStoredProc: TpFIBStoredProc;
    frxReport: TfrxReport;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure DesignerExecute(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);reintroduce;
    { Public declarations }
  end;
function PrintAdrListPR(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer; stdcall;
exports PrintAdrListPR;

var
  frmMAINPrinAdrListPR: TfrmMAINPrinAdrListPR;
  print_page:Integer;
  designer_rep:Integer;
  id_people_print:Int64;
implementation

{$R *.dfm}
constructor TfrmMAINPrinAdrListPR.Create(Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);
begin
  Inherited Create(Aowner);
  pFIBDatabase.Handle:=DBL;

  Caption:='Печать адресного листка прибытия.';

  pFIBDataSet.Active:=false;
  pFIBDataSet.ParamByName('param_people').AsInt64:=id_people;
  pFIBDataSet.Active:=true;

  cxLabelStatus.Caption:=Studcity_ReportsST_LISTPROPPage1ADR;

  print_page:=0;
  id_people_print:=id_people;
end;

function PrintAdrListPR(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;
var
  PrProp:TfrmMAINPrinAdrListPR;
begin
  PrProp := TfrmMAINPrinAdrListPR.Create(AOwner,DB,id_people,type_doc_print);
  PrProp.ShowModal;
  PrProp.Free;
end;

procedure TfrmMAINPrinAdrListPR.cxButton1Click(Sender: TObject);
begin
  if print_page = 0 then
   begin
    frxReport.Clear;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PeopleAdrListPR.fr3');
    frxReport.Variables.Clear;

    if designer_rep = 1
     then frxReport.DesignReport
     else
      begin
        frxReport.PrepareReport();
        frxReport.PrintOptions.ShowDialog:=false;
        frxReport.Print;
       end;
    print_page:=1;
    cxLabelStatus.Caption:=Studcity_ReportsST_LISTPROPPage2ADR;
   end
  else
   begin
    frxReport.Clear;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PeopleAdrListPR_Page2.fr3');
    frxReport.Variables.Clear;

    if designer_rep = 1
     then frxReport.DesignReport
     else
      begin
        frxReport.PrepareReport();
        frxReport.PrintOptions.ShowDialog:=false;
        frxReport.Print;

        //записываем на сервер
        With pFIBStoredProc do
         begin
          try
           StoredProcName:='ST_DT_DOC_SAVE_CHANGE';
           Database:=pFIBDatabase;
           Transaction:=WriteTransaction;
           WriteTransaction.StartTransaction;
           Prepare;
           ParamByName('ID_PEOPLE').AsInt64:=id_people_print;
           ParamByName('KOD_DOCS').AsInteger:=1901;
           ExecProc;
           Transaction.Commit;
          except
           begin
            Transaction.Rollback;
            ShowMessage('Ошибка при сохранении адресного листка. Обратитесь к администратору!!!');
            raise;
           end;
          end;
         end;//конец
      end;
    close;
   end;
end;

procedure TfrmMAINPrinAdrListPR.cxButton2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMAINPrinAdrListPR.DesignerExecute(Sender: TObject);
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

