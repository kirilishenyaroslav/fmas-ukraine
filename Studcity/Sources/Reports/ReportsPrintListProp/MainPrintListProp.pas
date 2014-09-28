unit MainPrintListProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, frxClass, StdCtrls, frxDesgn,StudcityConst, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, frxDBSet, cxControls,
  cxContainer, cxEdit, cxLabel, cxLookAndFeelPainters, cxButtons, ActnList,
  ComCtrls, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TfrmMainPrintListProp = class(TForm)
    frxDesigner1: TfrxDesigner;
    pFIBDatabase: TpFIBDatabase;
    pFIBDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    frxDBDataset: TfrxDBDataset;
    cxLabelStatus: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    Designer: TAction;
    StatusBar1: TStatusBar;
    pFIBStoredProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    frxReport: TfrxReport;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure DesignerExecute(Sender: TObject);
  private
    constructor Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);overload;
    { Private declarations }
  public
    { Public declarations }
  end;
function PrintListProp(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;stdcall;
exports PrintListProp;

var
  frmMainPrintListProp: TfrmMainPrintListProp;
  print_page:Integer;
  designer_rep:Integer;
  id_people_print:Int64;
implementation

{$R *.dfm}

function PrintListProp(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;
var
  PrProp:TfrmMainPrintListProp;
begin
  PrProp:=TfrmMainPrintListProp.Create(AOwner,DB,id_people,type_doc_print);
  PrProp.ShowModal;
  PrProp.Free;
end;


constructor  TfrmMainPrintListProp.Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);
begin
  Inherited Create(Aowner);
  pFIBDatabase.Handle:=DBL;

  Caption:=Studcity_ReportsST_LISTPROP;
  cxLabelStatus.Caption:=Studcity_ReportsST_LISTPROPPage1;

  pFIBDataSet.Active:=false;
  pFIBDataSet.ParamByName('param_people').AsInt64:=id_people;
  pFIBDataSet.Active:=true;

  print_page:=0;
  designer_rep:=0;
  id_people_print:=id_people;
end;

procedure TfrmMainPrintListProp.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainPrintListProp.cxButton2Click(Sender: TObject);
begin
if print_page=0 then
  begin
    frxReport.Clear;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PeopleListPROP.fr3');
    frxReport.Variables.Clear;
    frxReport.Variables['LISTPROPN1']:=''''+Studcity_ReportsST_LISTPROPN1+'''';
    frxReport.Variables['LISTPROPN2']:=''''+Studcity_ReportsST_LISTPROPN2+'''';
    frxReport.Variables['LISTPROPN3']:=''''+Studcity_ReportsST_LISTPROPN3+'''';
    frxReport.Variables['LISTPROPN4']:=''''+Studcity_ReportsST_LISTPROPN4+'''';
    frxReport.Variables['LISTPROPDateRog']:=''''+Studcity_ReportsST_LISTPROPDateRog+'''';
    frxReport.Variables['LISTPROPN6']:=''''+Studcity_ReportsST_LISTPROPN6+'''';
    frxReport.Variables['LISTPROPNCountry']:=''''+Studcity_ReportsST_LISTPROPNCountry+'''';
    frxReport.Variables['LISTPROPNObl']:=''''+Studcity_ReportsST_LISTPROPNObl+'''';
    frxReport.Variables['LISTPROPNRaj']:=''''+Studcity_ReportsST_LISTPROPNRaj+'''';
    frxReport.Variables['LISTPROPNTown']:=''''+Studcity_ReportsST_LISTPROPNTown+'''';
    frxReport.Variables['LISTPROPNTownSel']:=''''+Studcity_ReportsST_LISTPROPNTownSel+'''';
    frxReport.Variables['LISTPROPNTownKraj']:=''''+Studcity_ReportsST_LISTPROPNTownKraj+'''';
    frxReport.Variables['LISTPROPNTownResp']:=''''+Studcity_ReportsST_LISTPROPNTownResp+'''';
    frxReport.Variables['LISTPROPNStrit']:=''''+Studcity_ReportsST_LISTPROPNStrit+'''';
    frxReport.Variables['LISTPROPNBuild']:=''''+Studcity_ReportsST_LISTPROPNBuild+'''';
    frxReport.Variables['LISTPROPNCorp']:=''''+Studcity_ReportsST_LISTPROPNCorp+'''';
    frxReport.Variables['LISTPROPNKv']:=''''+Studcity_ReportsST_LISTPROPNKv+'''';
    frxReport.Variables['LISTPROPN7']:=''''+Studcity_ReportsST_LISTPROPN7+'''';
    frxReport.Variables['LISTPROPNYear']:=''''+Studcity_ReportsST_LISTPROPNYear+'''';
    frxReport.Variables['LISTPROPN8']:=''''+Studcity_ReportsST_LISTPROPN8+'''';
    frxReport.Variables['LISTPROPN8NumberPass']:=''''+Studcity_ReportsST_LISTPROPN8NumberPass+'''';
    frxReport.Variables['LISTPROPN8PassVud']:=''''+Studcity_ReportsST_LISTPROPN8PassVud+'''';
    frxReport.Variables['LISTPROPN9']:=''''+Studcity_ReportsST_LISTPROPN9+'''';
    frxReport.Variables['LISTPROPN10']:=''''+  Studcity_ReportsST_LISTPROPN10+'''';
    frxReport.Variables['LISTPROPN0STAN1']:=''''+  Studcity_ReportsST_LISTPROPN0STAN1+'''';
    frxReport.Variables['LISTPROPN0STAN2']:=''''+  Studcity_ReportsST_LISTPROPN0STAN2+'''';
    frxReport.Variables['LISTPROPN0STAN3']:=''''+  Studcity_ReportsST_LISTPROPN0STAN3+'''';
    frxReport.Variables['LISTPROPN0STAN4']:=''''+  Studcity_ReportsST_LISTPROPN0STAN4+'''';
    if designer_rep=1 then
      begin
        frxReport.DesignReport;
      end
      else
      begin
        frxReport.PrepareReport();
        frxReport.PrintOptions.ShowDialog:=false;
        frxReport.Print;
       end;
    print_page:=1;
    cxLabelStatus.Caption:=Studcity_ReportsST_LISTPROPPage2;
  end
  else
  begin
    frxReport.Clear;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PeopleListPROP_Page2.fr3');
    frxReport.Variables.Clear;
    frxReport.Variables['LISTPROPN11']:=''''+  Studcity_ReportsST_LISTPROPN11+'''';
    frxReport.Variables['LISTPROPN12']:=''''+  Studcity_ReportsST_LISTPROPN12+'''';
    frxReport.Variables['LISTPROPN13']:=''''+  Studcity_ReportsST_LISTPROPN13+'''';
    frxReport.Variables['LISTPROPN14']:=''''+  Studcity_ReportsST_LISTPROPN14+'''';
    frxReport.Variables['LISTPROPN13TS']:=''''+  Studcity_ReportsST_LISTPROPN13_TS+'''';
    frxReport.Variables['LISTPROPN13To']:=''''+  Studcity_ReportsST_LISTPROPN13_TO+'''';    
    if designer_rep=1 then
      begin
        frxReport.DesignReport;
      end
      else
      begin
        frxReport.PrepareReport();
        frxReport.PrintOptions.ShowDialog:=false;
        frxReport.Print;
        //записываем на сервер
           With pFIBStoredProc do
            begin
              StoredProcName:='ST_DT_DOC_SAVE_CHANGE';
              Database:=pFIBDatabase;
              Transaction:=WriteTransaction;
              WriteTransaction.StartTransaction;
              Prepare;
              ParamByName('ID_PEOPLE').AsInt64:=id_people_print;
              ParamByName('KOD_DOCS').AsInteger:=5;
          try
              ExecProc;
              WriteTransaction.Commit;
          except
            begin
              WriteTransaction.Rollback;
              ShowMessage('Ошибка при сохранении карточки прописки. Обратитесь к администратору!!!');
              raise;
            end;
          end;
          end;//конец

       end;
    close;
  end;
end;

procedure TfrmMainPrintListProp.DesignerExecute(Sender: TObject);
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
