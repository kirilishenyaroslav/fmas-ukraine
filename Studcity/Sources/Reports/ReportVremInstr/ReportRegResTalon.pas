unit ReportRegResTalon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, frxDesgn, frxClass, DB, FIBDataSet,
  pFIBDataSet, frxDBSet, FIBDatabase, pFIBDatabase, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxLabel,IBase, StudcityConst, ComCtrls,
  ActnList, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TfrmMainRegResTalon = class(TForm)
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
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Designer: TAction;
    pFIBStoredProc: TpFIBStoredProc;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure DesignerExecute(Sender: TObject);
  private
    constructor Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);overload;
    { Private declarations }
  public
    { Public declarations }
  end;

function ReportRegRes(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;stdcall;
exports ReportRegRes;

var
  frmMainRegResTalon: TfrmMainRegResTalon;
  print_page:Integer;
  designer_rep:Integer;
  id_people_print:int64;
implementation

{$R *.dfm}

function ReportRegRes(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;
var
  PrProp:TfrmMainRegResTalon;
begin
  PrProp:=TfrmMainRegResTalon.Create(AOwner,DB,id_people,type_doc_print);
  PrProp.ShowModal;
  PrProp.Free;
end;


constructor  TfrmMainRegResTalon.Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);
begin
  Inherited Create(Aowner);
  pFIBDatabase.Handle:=DBL;

  Caption:='Талон регистрации по месту проживания';

  pFIBDataSet.Active:=false;
  pFIBDataSet.ParamByName('param_people').AsInt64:=id_people;
  pFIBDataSet.Active:=true;

  cxLabelStatus.Caption:=Studcity_ReportsST_LISTPROPPage1ADR;
  designer_rep:=0;
  print_page:=0;
  id_people_print:=id_people;
end;


procedure TfrmMainRegResTalon.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainRegResTalon.cxButton1Click(Sender: TObject);
begin
if print_page=0 then
  begin
    frxReport.Clear;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ReportRegRes.fr3');
    frxReport.Variables.Clear;
    frxReport.Variables['StRep_Stat_N1']:=''''+StRep_Stat_N1+'''';
    frxReport.Variables['StRep_Stat_N2']:=''''+StRep_Stat_N2+'''';
    frxReport.Variables['StRep_StatN1']:=''''+StRep_StatN1+'''';
    frxReport.Variables['StRep_StatN2']:=''''+StRep_StatN2+'''';
    frxReport.Variables['StRep_StatN3']:=''''+StRep_StatN3+'''';
    frxReport.Variables['StRep_StatDateRog']:=''''+StRep_StatDateRog+'''';
    frxReport.Variables['StRep_StatN5']:=''''+StRep_StatN5+'''';
    frxReport.Variables['StRep_StatN6']:=''''+StRep_StatN6+'''';
    frxReport.Variables['StRep_StatN7']:=''''+StRep_StatN7+'''';
    frxReport.Variables['StRep_StatN71']:=''''+StRep_StatN71+'''';
    frxReport.Variables['StRep_StatN72']:=''''+StRep_StatN72+'''';
    frxReport.Variables['StRep_StatN8']:=''''+StRep_StatN8+'''';
    frxReport.Variables['StRep_StatN9']:=''''+StRep_StatN9+'''';
    frxReport.Variables['StRep_StatN91']:=''''+StRep_StatN91+'''';
    frxReport.Variables['StRep_StatN10']:=''''+StRep_StatN10+'''';
    frxReport.Variables['StRep_StatCountry']:=''''+StRep_StatCountry+'''';
    frxReport.Variables['StRep_StatObl']:=''''+StRep_StatObl+'''';
    frxReport.Variables['StRep_StatRaj']:=''''+StRep_StatRaj+'''';
    frxReport.Variables['StRep_StatTown']:=''''+StRep_StatTown+'''';
    frxReport.Variables['StRep_StatPGT']:=''''+StRep_StatPGT+'''';
    frxReport.Variables['StRep_StatSel']:=''''+StRep_StatSel+'''';
    frxReport.Variables['StRep_StatDer']:=''''+StRep_StatDer+'''';
    frxReport.Variables['StRep_StatResp']:=''''+StRep_StatResp+'''';
    frxReport.Variables['StRep_StatYEAR']:=''''+StRep_StatYEAR+'''';
    frxReport.Variables['StRep_StatN11']:=''''+StRep_StatN11+'''';
    frxReport.Variables['StRep_StatN12']:=''''+StRep_StatN12+'''';
    frxReport.Variables['StRep_StatN121']:=''''+StRep_StatN121+'''';
    frxReport.Variables['StRep_StatN122']:=''''+StRep_StatN122+'''';
    frxReport.Variables['StRep_StatN13']:=''''+StRep_StatN13+'''';
    frxReport.Variables['StRep_StatN131']:=''''+StRep_StatN131+'''';
    frxReport.Variables['StRep_StatN131_1']:=''''+StRep_StatN131_1+'''';
    frxReport.Variables['StRep_StatN132']:=''''+StRep_StatN132+'''';
    frxReport.Variables['StRep_StatN133']:=''''+StRep_StatN133+'''';
    frxReport.Variables['StRep_StatN134']:=''''+StRep_StatN134+'''';
    frxReport.Variables['StRep_StatN136']:=''''+StRep_StatN136+'''';
    frxReport.Variables['StRep_StatN137']:=''''+StRep_StatN137+'''';
    frxReport.Variables['StRep_StatN135']:=''''+StRep_StatN135+'''';
    frxReport.Variables['StRep_StatN138']:=''''+StRep_StatN138+'''';
    frxReport.Variables['StRep_StatN139']:=''''+StRep_StatN139+'''';
    frxReport.Variables['StRep_StatN1310']:=''''+StRep_StatN1310+'''';
    frxReport.Variables['StRep_StatN1311']:=''''+StRep_StatN1311+'''';
    frxReport.Variables['StRep_StatN1312']:=''''+StRep_StatN1312+'''';
    frxReport.Variables['StRep_StatN1313']:=''''+StRep_StatN1313+'''';
    frxReport.Variables['StRep_StatN141']:=''''+StRep_StatN141+'''';
    frxReport.Variables['StRep_StatN142']:=''''+StRep_StatN142+'''';
    frxReport.Variables['StRep_StatN143']:=''''+StRep_StatN143+'''';
    frxReport.Variables['StRep_StatN15']:=''''+StRep_StatN15+'''';
    frxReport.Variables['StRep_StatN151']:=''''+StRep_StatN151+'''';
    frxReport.Variables['StRep_StatN152']:=''''+StRep_StatN152+'''';
    frxReport.Variables['StRep_StatN153']:=''''+StRep_StatN153+'''';
    frxReport.Variables['StRep_StatN154']:=''''+StRep_StatN154+'''';
    frxReport.Variables['StRep_StatN155']:=''''+StRep_StatN155+'''';
    frxReport.Variables['StRep_StatN156']:=''''+StRep_StatN156+'''';
    frxReport.Variables['StRep_StatN157']:=''''+StRep_StatN157+'''';
    frxReport.Variables['StRep_StatN158']:=''''+StRep_StatN158+'''';
    frxReport.Variables['StRep_StatN159']:=''''+StRep_StatN159+'''';
    frxReport.Variables['StRep_StatN16']:=''''+StRep_StatN16+'''';
    frxReport.Variables['StRep_StatN161']:=''''+StRep_StatN161+'''';
    frxReport.Variables['StRep_StatN162']:=''''+StRep_StatN162+'''';
    frxReport.Variables['StRep_StatN163']:=''''+StRep_StatN163+'''';
    frxReport.Variables['StRep_StatN164']:=''''+StRep_StatN164+'''';
    frxReport.Variables['StRep_StatN165']:=''''+StRep_StatN165+'''';
    frxReport.Variables['StRep_StatN166']:=''''+StRep_StatN166+'''';
    frxReport.Variables['StRep_StatN167']:=''''+StRep_StatN167+'''';
    frxReport.Variables['StRep_StatN168']:=''''+StRep_StatN168+'''';
    frxReport.Variables['StRep_StatN169']:=''''+StRep_StatN169+'''';
    frxReport.Variables['StRep_StatN1610']:=''''+StRep_StatN1610+'''';
    frxReport.Variables['StRep_StatN1611']:=''''+StRep_StatN1611+'''';
    frxReport.Variables['StRep_StatN17']:=''''+StRep_StatN17+'''';
    frxReport.Variables['StRep_StatN171']:=''''+StRep_StatN171+'''';
    frxReport.Variables['StRep_StatN172']:=''''+StRep_StatN172+'''';
    frxReport.Variables['StRep_StatN173']:=''''+StRep_StatN173+'''';
    frxReport.Variables['StRep_StatN174']:=''''+StRep_StatN174+'''';
    frxReport.Variables['StRep_StatN175']:=''''+StRep_StatN175+'''';
    frxReport.Variables['StRep_StatN176']:=''''+StRep_StatN176+'''';
    frxReport.Variables['StRep_StatN177']:=''''+StRep_StatN177+'''';
    frxReport.Variables['StRep_StatN18']:=''''+StRep_StatN18+'''';
    frxReport.Variables['StRep_StatN181']:=''''+StRep_StatN181+'''';
    frxReport.Variables['StRep_StatN18_1']:=''''+StRep_StatN18_1+'''';
    frxReport.Variables['StRep_StatN182']:=''''+StRep_StatN182+'''';
    frxReport.Variables['StRep_StatN183']:=''''+StRep_StatN183+'''';
    frxReport.Variables['StRep_StatN185']:=''''+StRep_StatN185+'''';
    frxReport.Variables['StRep_StatN186']:=''''+StRep_StatN186+'''';
    frxReport.Variables['StRep_StatN187']:=''''+StRep_StatN187+'''';
    frxReport.Variables['StRep_StatN188']:=''''+StRep_StatN188+'''';
    frxReport.Variables['StRep_StatN189']:=''''+StRep_StatN189+'''';
    frxReport.Variables['StRep_StatN1810']:=''''+StRep_StatN1810+'''';
    frxReport.Variables['StRep_StatN1811']:=''''+StRep_StatN1811+'''';
    frxReport.Variables['StRep_StatN1812']:=''''+StRep_StatN1812+'''';
    frxReport.Variables['StRep_StatN1813']:=''''+StRep_StatN1813+'''';
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
    cxLabelStatus.Caption:=Studcity_ReportsST_LISTPROPPage2ADR;
    print_page:=1;

  end
  else
  begin
    frxReport.Clear;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'ReportRegRes_Page2.fr3');
    frxReport.Variables.Clear;
    frxReport.Variables['StRep_Stat_N1']:=''''+StRep_Stat_N1+'''';
    frxReport.Variables['StRep_Stat_N2']:=''''+StRep_Stat_N2+'''';
    frxReport.Variables['StRep_StatN1']:=''''+StRep_StatN1+'''';
    frxReport.Variables['StRep_StatN2']:=''''+StRep_StatN2+'''';
    frxReport.Variables['StRep_StatN3']:=''''+StRep_StatN3+'''';
    frxReport.Variables['StRep_StatDateRog']:=''''+StRep_StatDateRog+'''';
    frxReport.Variables['StRep_StatN5']:=''''+StRep_StatN5+'''';
    frxReport.Variables['StRep_StatN6']:=''''+StRep_StatN6+'''';
    frxReport.Variables['StRep_StatN7']:=''''+StRep_StatN7+'''';
    frxReport.Variables['StRep_StatN71']:=''''+StRep_StatN71+'''';
    frxReport.Variables['StRep_StatN72']:=''''+StRep_StatN72+'''';
    frxReport.Variables['StRep_StatN8']:=''''+StRep_StatN8+'''';
    frxReport.Variables['StRep_StatN9']:=''''+StRep_StatN9+'''';
    frxReport.Variables['StRep_StatN91']:=''''+StRep_StatN91+'''';
    frxReport.Variables['StRep_StatN10']:=''''+StRep_StatN10+'''';
    frxReport.Variables['StRep_StatCountry']:=''''+StRep_StatCountry+'''';
    frxReport.Variables['StRep_StatObl']:=''''+StRep_StatObl+'''';
    frxReport.Variables['StRep_StatRaj']:=''''+StRep_StatRaj+'''';
    frxReport.Variables['StRep_StatTown']:=''''+StRep_StatTown+'''';
    frxReport.Variables['StRep_StatPGT']:=''''+StRep_StatPGT+'''';
    frxReport.Variables['StRep_StatSel']:=''''+StRep_StatSel+'''';
    frxReport.Variables['StRep_StatDer']:=''''+StRep_StatDer+'''';
    frxReport.Variables['StRep_StatResp']:=''''+StRep_StatResp+'''';
    frxReport.Variables['StRep_StatYEAR']:=''''+StRep_StatYEAR+'''';
    frxReport.Variables['StRep_StatN11']:=''''+StRep_StatN11+'''';
    frxReport.Variables['StRep_StatN12']:=''''+StRep_StatN12+'''';
    frxReport.Variables['StRep_StatN121']:=''''+StRep_StatN121+'''';
    frxReport.Variables['StRep_StatN122']:=''''+StRep_StatN122+'''';
    frxReport.Variables['StRep_StatN13']:=''''+StRep_StatN13+'''';
    frxReport.Variables['StRep_StatN131']:=''''+StRep_StatN131+'''';
    frxReport.Variables['StRep_StatN131_1']:=''''+StRep_StatN131_1+'''';
    frxReport.Variables['StRep_StatN132']:=''''+StRep_StatN132+'''';
    frxReport.Variables['StRep_StatN133']:=''''+StRep_StatN133+'''';
    frxReport.Variables['StRep_StatN134']:=''''+StRep_StatN134+'''';
    frxReport.Variables['StRep_StatN136']:=''''+StRep_StatN136+'''';
    frxReport.Variables['StRep_StatN137']:=''''+StRep_StatN137+'''';
    frxReport.Variables['StRep_StatN135']:=''''+StRep_StatN135+'''';
    frxReport.Variables['StRep_StatN138']:=''''+StRep_StatN138+'''';
    frxReport.Variables['StRep_StatN139']:=''''+StRep_StatN139+'''';
    frxReport.Variables['StRep_StatN1310']:=''''+StRep_StatN1310+'''';
    frxReport.Variables['StRep_StatN1311']:=''''+StRep_StatN1311+'''';
    frxReport.Variables['StRep_StatN1312']:=''''+StRep_StatN1312+'''';
    frxReport.Variables['StRep_StatN1313']:=''''+StRep_StatN1313+'''';
    frxReport.Variables['StRep_StatN141']:=''''+StRep_StatN141+'''';
    frxReport.Variables['StRep_StatN142']:=''''+StRep_StatN142+'''';
    frxReport.Variables['StRep_StatN143']:=''''+StRep_StatN143+'''';
    frxReport.Variables['StRep_StatN15']:=''''+StRep_StatN15+'''';
    frxReport.Variables['StRep_StatN151']:=''''+StRep_StatN151+'''';
    frxReport.Variables['StRep_StatN152']:=''''+StRep_StatN152+'''';
    frxReport.Variables['StRep_StatN153']:=''''+StRep_StatN153+'''';
    frxReport.Variables['StRep_StatN154']:=''''+StRep_StatN154+'''';
    frxReport.Variables['StRep_StatN154_1']:=''''+StRep_StatN154_1+'''';    
    frxReport.Variables['StRep_StatN155']:=''''+StRep_StatN155+'''';
    frxReport.Variables['StRep_StatN156']:=''''+StRep_StatN156+'''';
    frxReport.Variables['StRep_StatN157']:=''''+StRep_StatN157+'''';
    frxReport.Variables['StRep_StatN157_1']:=''''+StRep_StatN157_1+'''';    
    frxReport.Variables['StRep_StatN158']:=''''+StRep_StatN158+'''';
    frxReport.Variables['StRep_StatN159']:=''''+StRep_StatN159+'''';
    frxReport.Variables['StRep_StatN16']:=''''+StRep_StatN16+'''';
    frxReport.Variables['StRep_StatN161']:=''''+StRep_StatN161+'''';
    frxReport.Variables['StRep_StatN162']:=''''+StRep_StatN162+'''';
    frxReport.Variables['StRep_StatN163']:=''''+StRep_StatN163+'''';
    frxReport.Variables['StRep_StatN164']:=''''+StRep_StatN164+'''';
    frxReport.Variables['StRep_StatN165']:=''''+StRep_StatN165+'''';
    frxReport.Variables['StRep_StatN166']:=''''+StRep_StatN166+'''';
    frxReport.Variables['StRep_StatN167']:=''''+StRep_StatN167+'''';
    frxReport.Variables['StRep_StatN168']:=''''+StRep_StatN168+'''';
    frxReport.Variables['StRep_StatN169']:=''''+StRep_StatN169+'''';
    frxReport.Variables['StRep_StatN1610']:=''''+StRep_StatN1610+'''';
    frxReport.Variables['StRep_StatN1611']:=''''+StRep_StatN1611+'''';
    frxReport.Variables['StRep_StatN17']:=''''+StRep_StatN17+'''';
    frxReport.Variables['StRep_StatN171']:=''''+StRep_StatN171+'''';
    frxReport.Variables['StRep_StatN172']:=''''+StRep_StatN172+'''';
    frxReport.Variables['StRep_StatN173']:=''''+StRep_StatN173+'''';
    frxReport.Variables['StRep_StatN174']:=''''+StRep_StatN174+'''';
    frxReport.Variables['StRep_StatN175']:=''''+StRep_StatN175+'''';
    frxReport.Variables['StRep_StatN175_1']:=''''+StRep_StatN175_1+'''';       
    frxReport.Variables['StRep_StatN176']:=''''+StRep_StatN176+'''';
    frxReport.Variables['StRep_StatN177']:=''''+StRep_StatN177+'''';
    frxReport.Variables['StRep_StatN18']:=''''+StRep_StatN18+'''';
    frxReport.Variables['StRep_StatN181']:=''''+StRep_StatN181+'''';
    frxReport.Variables['StRep_StatN18_1']:=''''+StRep_StatN18_1+'''';
    frxReport.Variables['StRep_StatN182']:=''''+StRep_StatN182+'''';
    frxReport.Variables['StRep_StatN183']:=''''+StRep_StatN183+'''';
    frxReport.Variables['StRep_StatN185']:=''''+StRep_StatN185+'''';
    frxReport.Variables['StRep_StatN186']:=''''+StRep_StatN186+'''';
    frxReport.Variables['StRep_StatN187']:=''''+StRep_StatN187+'''';
    frxReport.Variables['StRep_StatN188']:=''''+StRep_StatN188+'''';
    frxReport.Variables['StRep_StatN189']:=''''+StRep_StatN189+'''';
    frxReport.Variables['StRep_StatN1810']:=''''+StRep_StatN1810+'''';
    frxReport.Variables['StRep_StatN1811']:=''''+StRep_StatN1811+'''';
    frxReport.Variables['StRep_StatN1812']:=''''+StRep_StatN1812+'''';
    frxReport.Variables['StRep_StatN1813']:=''''+StRep_StatN1813+'''';
    frxReport.Variables['StRep_StatN1814']:=''''+StRep_StatN1814+'''';
    frxReport.Variables['StRep_StatN1815']:=''''+StRep_StatN1815+'''';         
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
            ParamByName('ID_PEOPLE').AsInt64:=id_people_print;
            ParamByName('KOD_DOCS').AsInteger:=1902;
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

procedure TfrmMainRegResTalon.DesignerExecute(Sender: TObject);
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

