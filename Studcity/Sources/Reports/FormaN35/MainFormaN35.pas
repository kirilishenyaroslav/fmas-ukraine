unit MainFormaN35;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, StdCtrls, cxLookAndFeelPainters, frxDesgn, frxClass, DB,
  FIBDataSet, pFIBDataSet, frxDBSet, FIBDatabase, pFIBDatabase, cxButtons,
  cxControls, cxContainer, cxEdit, cxLabel, ActnList, ComCtrls, FIBQuery,
  pFIBQuery, pFIBStoredProc, ExtCtrls, cxCheckBox;

type
  TfrmMainFormaN35 = class(TForm)
    cxLabelStatus: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    pFIBDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    frxDBDataset: TfrxDBDataset;
    pFIBDataSet: TpFIBDataSet;
    frxReport: TfrxReport;
    frxDesigner1: TfrxDesigner;
    ActionList1: TActionList;
    ActionDesigned: TAction;
    pFIBDataSetF35: TpFIBDataSet;
    frxDBDataset2: TfrxDBDataset;
    StatusBar1: TStatusBar;
    pFIBStoredProc: TpFIBStoredProc;
    cxCheckBoxFamily: TcxCheckBox;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure ActionDesignedExecute(Sender: TObject);
    procedure frxReportAfterPrintReport(Sender: TObject);
  private
    constructor Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);overload;
    { Private declarations }
  public
    { Public declarations }
  end;
function FormaN35(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;stdcall;
exports FormaN35;
var
  frmMainFormaN35: TfrmMainFormaN35;
  id_people_pr:Int64;
  print_page:Integer;
  type_print:Integer;
  designer_rep:Integer;
implementation

{$R *.dfm}
function FormaN35(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;
var
  PrProp:TfrmMainFormaN35;
begin
  PrProp:=TfrmMainFormaN35.Create(AOwner,DB,id_people,type_doc_print);
  PrProp.ShowModal;
  PrProp.Free;
end;

constructor  TfrmMainFormaN35.Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);
begin
  Inherited Create(Aowner);
  pFIBDatabase.Handle:=DBL;

  id_people_pr:=id_people;
  Caption:='Печать 35 формы.';


  cxLabelStatus.Caption:='Печать первой страницы';
  type_print:=type_doc_print;
  designer_rep:=0;
  print_page:=0;
  if  type_print=0 then
    begin
      cxCheckBoxFamily.Visible:=true;
    end
    else
    begin
      cxCheckBoxFamily.Visible:=false;
    end;
end;

procedure TfrmMainFormaN35.cxButton1Click(Sender: TObject);
begin
if type_print=0 then
  begin
    //cxCheckBoxFamily.Visible:=true;
    if print_page=0 then
      begin
        with pFIBDataSet do
          begin
            Database:=Database;
            Transaction:=ReadTransaction;
            Active:=false;
            ParamByName('param_people').AsInt64:=id_people_pr;
            Active:=true;

          end;
          frxReport.Clear;
          frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PeopleN35.fr3');
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
          cxLabelStatus.Caption:='Печать второй страницы';
      end
      else
      begin
        frxReport.Clear;
        frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PeopleN35_Page2.fr3');
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
              //записываем на сервер
                 With pFIBStoredProc do
                  begin
                  try
                  StoredProcName:='ST_DT_DOC_SAVE_CHANGE';
                  Database:=pFIBDatabase;
                  Transaction:=WriteTransaction;
                  WriteTransaction.StartTransaction;
                  Prepare;
                  ParamByName('ID_PEOPLE').AsInt64:=id_people_pr;
                  ParamByName('KOD_DOCS').AsInteger:=3001;
                  ExecProc;
                  Transaction.Commit;
                except
                  begin
                  Transaction.Rollback;
                  ShowMessage('Ошибка при сохранении статического листка учета. Обратитесь к администратору!!!');
                  raise;
                  end;
                end;
                end;//конец

           end;
        close;
      end;
  end;

//печать общего списка
if type_print=2 then
  begin
    if print_page=0 then
      begin
        with pFIBDataSetF35 do
          begin
            Database:=Database;
            Transaction:=ReadTransaction;
            Active:=false;
            ParamByName('param_id_list').AsInt64:=id_people_pr;
            Active:=true;
          end;

          frxReport.Clear;
          frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PeopleN35_TOListROVD.fr3');
          frxReport.Variables.Clear;
          print_page:=1;
          cxLabelStatus.Caption:='Печать второй страницы';
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
      end
      else
      begin
        frxReport.Clear;
        frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PeopleN35_Page2.fr3');
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
        close;
      end;
  end;
end;

procedure TfrmMainFormaN35.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainFormaN35.ActionDesignedExecute(Sender: TObject);
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

procedure TfrmMainFormaN35.frxReportAfterPrintReport(Sender: TObject);
begin
if (type_print=2) and (print_page=1) then
  begin
    pFIBStoredProc.Database:=pFIBDatabase;
    pFIBStoredProc.Transaction:=WriteTransaction;
    WriteTransaction.StartTransaction;
    pFIBStoredProc.StoredProcName:='ST_DT_LIST_ROVD_PRINT_SAVE';
    pFIBStoredProc.Prepare;
    pFIBStoredProc.ParamByName('ID_LIST').AsInt64:=id_people_pr;
    pFIBStoredProc.ParamByName('PRINT_FORM').AsInteger:=2;
    try
      pFIBStoredProc.ExecProc;
      except
        begin
          WriteTransaction.Rollback;
          Exit;
        end;
     end;
     WriteTransaction.Commit;
  end;
end;

end.
