unit MainReportsFamily;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, FIBDatabase, pFIBDatabase, frxDesgn,
  frxClass, DB, FIBDataSet, pFIBDataSet, frxDBSet, ActnList, ComCtrls,
  StdCtrls, cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  IBase, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TfrmMainReportsFamily = class(TForm)
    cxLabelWork: TcxLabel;
    cxTextEditWork: TcxTextEdit;
    cxTextEditSpec: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Designer: TAction;
    PrintDoc: TAction;
    frxDBDataset: TfrxDBDataset;
    pFIBDataSet: TpFIBDataSet;
    frxDesigner1: TfrxDesigner;
    ReadTransaction: TpFIBTransaction;
    pFIBDatabase: TpFIBDatabase;
    cxLabelSpec: TcxLabel;
    WriteTransaction: TpFIBTransaction;
    pFIBStoredProc: TpFIBStoredProc;
    frxReport: TfrxReport;
    procedure cxButton2Click(Sender: TObject);
    procedure DesignerExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxTextEditWorkKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxTextEditSpecKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PrintDocExecute(Sender: TObject);
  private
    Constructor  Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);overload;
    { Private declarations }
  public
    { Public declarations }
  end;

function ReportsFamily (AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;stdcall;
exports ReportsFamily;
var
  frmMainReportsFamily: TfrmMainReportsFamily;
  designer_rep:Integer;
  id_people_pr:Int64;
implementation

{$R *.dfm}
function ReportsFamily(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;
var
  PrProp:TfrmMainReportsFamily;
begin
    PrProp:=TfrmMainReportsFamily.Create(AOwner,DB,id_people,type_doc_print);
    PrProp.ShowModal;
    PrProp.Free;
end;

constructor TfrmMainReportsFamily.Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);
begin
    Inherited Create(Aowner);
    pFIBDatabase.Handle:=DBL;

    Caption:='Справка о проживании в студгородке и составе семьи';
    designer_rep:=0;
    id_people_pr:=id_people;
end;
procedure TfrmMainReportsFamily.cxButton2Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmMainReportsFamily.DesignerExecute(Sender: TObject);
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

procedure TfrmMainReportsFamily.cxButton1Click(Sender: TObject);
var
  q: TpFIBQuery;
begin
    q:=TpFIBQuery.Create(nil);
    q.Database:=pFIBDatabase;
    q.Transaction:=ReadTransaction;
    q.Transaction.StartTransaction;
    q.SQL.Text:='select d.ST_MAIN_PASP_UKR from ST_INI d';
    q.ExecQuery;
    pFIBDataSet.Active:=false;
    pFIBDataSet.ParamByName('param_people').AsInt64:=id_people_pr;
    pFIBDataSet.Active:=true;
    if pFIBDataSet.FieldByName('OUT_NOT_LIVE').AsInteger=0
    then begin
        frxReport.Clear;
        frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ReportsFamily.fr3');
        frxReport.Variables.Clear;
        frxReport.Variables['ST_WHERE']:=''''+cxTextEditWork.Text+'''';
        frxReport.Variables['ST_NOTE']:=''''+cxTextEditSpec.Text+'''';
        frxReport.Variables['NA4ALNIK']:=''''+q.FldByName['ST_MAIN_PASP_UKR'].AsString+'''';

        if designer_rep=1
        then frxReport.DesignReport
        else begin
            frxReport.PrepareReport();
            frxReport.PrintOptions.ShowDialog:=false;
            frxReport.Print;
          //записываем на север
            With pFIBStoredProc do
            begin
              try
                StoredProcName:='ST_DT_DOC_SAVE_CHANGE';
                Database:=pFIBDatabase;
                Transaction:=WriteTransaction;
                WriteTransaction.StartTransaction;
                Prepare;
                ParamByName('ID_PEOPLE').AsInt64:=id_people_pr;
                ParamByName('KOD_DOCS').AsInteger:=2;
                ExecProc;
                Transaction.Commit;
            except begin
                Transaction.Rollback;
                ShowMessage('Ошибка при сохранении справки. Обратитесь к администратору!!!');
                raise;
                end;
            end;
            end;//конец
        end;
        ReadTransaction.commit;
    end else MessageBox(handle,'не продлена регистрация','Внимание',MB_OK or MB_ICONWARNING);
    q.Close;
    q.Free;
    close;
end;

procedure TfrmMainReportsFamily.cxTextEditWorkKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if key=VK_RETURN
    then cxTextEditSpec.SetFocus;
end;

procedure TfrmMainReportsFamily.cxTextEditSpecKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if key=VK_RETURN
    then cxButton1.SetFocus;
end;

procedure TfrmMainReportsFamily.PrintDocExecute(Sender: TObject);
begin
    cxButton1Click(self);
end;

end.
