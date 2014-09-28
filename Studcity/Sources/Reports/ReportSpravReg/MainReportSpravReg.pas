unit MainReportSpravReg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, FIBDatabase, pFIBDatabase, StdCtrls, frxDesgn, frxClass,
  DB, FIBDataSet, pFIBDataSet, frxDBSet,StudcityConst, cxControls,
  cxContainer, cxEdit, cxLabel, cxLookAndFeelPainters, cxButtons, ActnList,
  ComCtrls, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TfrmMAINReportSpravReg = class(TForm)
    pFIBDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    frxDBDataset: TfrxDBDataset;
    pFIBDataSet: TpFIBDataSet;
    frxReport: TfrxReport;
    frxDesigner1: TfrxDesigner;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Designer: TAction;
    pFIBStoredProc: TpFIBStoredProc;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure DesignerExecute(Sender: TObject);
  private
    constructor Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);overload;
    { Private declarations }
  public
    { Public declarations }
  end;
function ReportSpravReg(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;stdcall;
exports ReportSpravReg;

var
  frmMAINReportSpravReg: TfrmMAINReportSpravReg;
  print_page:Integer;
  designer_rep:Integer;
  id_people_print:Int64;
implementation

{$R *.dfm}
function ReportSpravReg(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;
var
  PrProp:TfrmMAINReportSpravReg;
begin
  PrProp:=TfrmMAINReportSpravReg.Create(AOwner,DB,id_people,type_doc_print);
  PrProp.ShowModal;
  PrProp.Free;
end;

constructor  TfrmMAINReportSpravReg.Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);
begin
  Inherited Create(Aowner);
  pFIBDatabase.Handle:=DBL;

  Caption:='Печать справки по месту проживания';

  pFIBDataSet.Active:=false;
  pFIBDataSet.ParamByName('param_people').AsInt64:=id_people;
  pFIBDataSet.Active:=true;

  print_page:=0;
  id_people_print:=id_people;
end;


procedure TfrmMAINReportSpravReg.cxButton1Click(Sender: TObject);
begin
    frxReport.Clear;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PeopleSpravReg.fr3');
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
       end;
    print_page:=1;

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
            ParamByName('KOD_DOCS').AsInteger:=-1;
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
     close;
end;

procedure TfrmMAINReportSpravReg.cxButton2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMAINReportSpravReg.DesignerExecute(Sender: TObject);
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

