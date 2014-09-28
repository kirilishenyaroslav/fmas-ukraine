unit MAINPrinAdrListVIP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, FIBQuery, pFIBQuery, pFIBStoredProc,
  ActnList, frxDesgn, frxClass, DB, FIBDataSet, pFIBDataSet, frxDBSet,
  FIBDatabase, pFIBDatabase, ComCtrls, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxLabel,IBASE,StudcityConst;

type
  TfrmMAINPrinAdrListVIP = class(TForm)
    cxLabelStatus: TcxLabel;
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
function PrintAdrListVIP(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;stdcall;
exports PrintAdrListVIP;

var
  frmMAINPrinAdrListVIP: TfrmMAINPrinAdrListVIP;
  print_page:Integer;
  designer_rep:Integer;
  id_people_print:Int64;
implementation

{$R *.dfm}
function PrintAdrListVIP(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;
var
  PrProp:TfrmMAINPrinAdrListVIP;
begin
  PrProp:=TfrmMAINPrinAdrListVIP.Create(AOwner,DB,id_people,type_doc_print);
  PrProp.ShowModal;
  PrProp.Free;
end;

constructor  TfrmMAINPrinAdrListVIP.Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);
begin
  Inherited Create(Aowner);
  pFIBDatabase.Handle:=DBL;

  Caption:='Печать адресного листка убытия.';

  pFIBDataSet.Active:=false;
  pFIBDataSet.ParamByName('param_people').AsInt64:=id_people;
  pFIBDataSet.Active:=true;

  cxLabelStatus.Caption:=st_adrLsVIPPage1[1];

  print_page:=0;
  designer_rep:=0;
  id_people_print:=id_people;
end;


procedure TfrmMAINPrinAdrListVIP.cxButton1Click(Sender: TObject);
begin
if print_page=0 then
  begin
    frxReport.Clear;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PeopleAdrListVIP.fr3');
    frxReport.Variables.Clear;
    frxReport.Variables['NAME_REP']:=''''+st_adrLsPR[2]+'''';
    frxReport.Variables['LISTPROPN1ADR']:=''''+Studcity_ReportsST_LISTPROPN1ADR[2]+'''';
    frxReport.Variables['LISTPROPN2ADR']:=''''+Studcity_ReportsST_LISTPROPN2ADR[2]+'''';
    frxReport.Variables['LISTPROPN3ADR']:=''''+Studcity_ReportsST_LISTPROPN3ADR[2]+'''';
    frxReport.Variables['LISTPROPDateRogADR']:=''''+Studcity_ReportsST_LISTPROPDateRog[2]+'''';
    frxReport.Variables['LISTPROPN5ADR']:=''''+Studcity_ReportsST_LISTPROPN5ADR[2]+'''';
    frxReport.Variables['LISTPROPN6ADR']:=''''+Studcity_ReportsST_LISTPROPN6ADR[2]+'''';
    frxReport.Variables['LISTPROPN6PolADR']:=''''+Studcity_ReportsST_LISTPROPN6POLADR[2]+'''';
    frxReport.Variables['LISTPROPNOblADR']:=''''+Studcity_ReportsST_LISTPROPNOblADR[2]+'''';
    frxReport.Variables['LISTPROPNRajADR']:=''''+Studcity_ReportsST_LISTPROPNRajADR[2]+'''';
    frxReport.Variables['LISTPROPNTownADR']:=''''+Studcity_ReportsST_LISTPROPNTownADR[2]+'''';
    frxReport.Variables['LISTPROPNTownSelADR']:=''''+Studcity_ReportsST_LISTPROPNTownSelADR[2]+'''';
    frxReport.Variables['LISTPROPNTownKrajADR']:=''''+Studcity_ReportsST_LISTPROPNTownKrajADR[2]+'''';
    frxReport.Variables['LISTPROPNTownRespADR']:=''''+Studcity_ReportsST_LISTPROPNTownRespADR[2]+'''';
    frxReport.Variables['LISTPROPNTownDerADR']:=''''+Studcity_ReportsST_LISTPROPNTownDerADR[2]+'''';
    frxReport.Variables['LISTPROPNStritADR']:=''''+Studcity_ReportsST_LISTPROPNStritADR[2]+'''';
    frxReport.Variables['LISTPROPNBuildADR']:=''''+Studcity_ReportsST_LISTPROPNBuildADR[2]+'''';
    frxReport.Variables['LISTPROPNCorpADR']:=''''+Studcity_ReportsST_LISTPROPNCorpADR[2]+'''';
    frxReport.Variables['LISTPROPNKvADR']:=''''+Studcity_ReportsST_LISTPROPNKvADR[2]+'''';
    frxReport.Variables['LISTPROPNPGTADR']:=''''+Studcity_ReportsST_LISTPROPNPGTADR[2]+'''';
    frxReport.Variables['LISTPROPN7ADR']:=''''+Studcity_ReportsST_LISTPROPN7ADR[2]+'''';
    frxReport.Variables['LISTPROPNYearADR']:=''''+Studcity_ReportsST_LISTPROPNYearADR[2]+'''';
    frxReport.Variables['LISTPROPN8ADR']:=''''+st_adrLsVIP8[2]+'''';
    frxReport.Variables['LISTPROPN8ORGANADR']:=''''+Studcity_ReportsST_LISTPROPN8ORGANADR[2]+'''';
    frxReport.Variables['LISTPROPN9ADR']:=''''+st_adrLsVIP9[2]+'''';
    frxReport.Variables['LISTPROPN9DONADR']:=''''+Studcity_ReportsST_LISTPROPN9DONADR[2]+'''';
    frxReport.Variables['LISTPROPN9CHANGEFAMADR']:=''''+Studcity_ReportsST_LISTPROPN9CHANGEFAMADR[2]+'''';
    frxReport.Variables['LISTPROPN9CHANGE1ADR']:=''''+Studcity_ReportsST_LISTPROPN9CHANGE1ADR[2]+'''';
    frxReport.Variables['LISTPROPN9CHANGE2ADR']:=''''+Studcity_ReportsST_LISTPROPN9CHANGE2ADR[2]+'''';
    frxReport.Variables['LISTPROPN9OTHERADR']:=''''+Studcity_ReportsST_LISTPROPN9OTHERADR[2]+'''';
    frxReport.Variables['LISTPROPN10ADR']:=''''+Studcity_ReportsST_LISTPROPN10ADR[2]+'''';
    frxReport.Variables['LISTPROPN101ADR']:=''''+Studcity_ReportsST_LISTPROPN101ADR[2]+'''';
    frxReport.Variables['LISTPROPN102ADR']:=''''+Studcity_ReportsST_LISTPROPN102ADR[2]+'''';
    frxReport.Variables['LISTPROPN11ADR']:=''''+Studcity_ReportsST_LISTPROPN11ADR[2]+'''';
    frxReport.Variables['LISTPROPN111ADR']:=''''+Studcity_ReportsST_LISTPROPN111ADR[2]+'''';
    frxReport.Variables['LISTPROPN112ADR']:=''''+Studcity_ReportsST_LISTPROPN112ADR[2]+'''';
    frxReport.Variables['LISTPROPN12ADR']:=''''+st_adrLsVIPPasp[2]+'''';
    frxReport.Variables['LISTPROPN12NumberPass']:=''''+Studcity_ReportsST_LISTPROPN12NumberPass[2]+'''';
    frxReport.Variables['LISTPROPN12PassVudADR']:=''''+Studcity_ReportsST_LISTPROPN12PassVudADR[2]+'''';
    frxReport.Variables['LISTPROPN12PassORGANADR']:=''''+Studcity_ReportsST_LISTPROPN12PassORGANADR[2]+'''';
    frxReport.Variables['LISTPROPN13ADR']:=''''+st_adrLsVIPVmeste[2]+'''';
    frxReport.Variables['LISTPROPN131ADR']:=''''+Studcity_ReportsST_LISTPROPN131ADR[2]+'''';
    frxReport.Variables['LISTPROPN132ADR']:=''''+Studcity_ReportsST_LISTPROPN132ADR[2]+'''';
    frxReport.Variables['LISTPROPN133ADR']:=''''+Studcity_ReportsST_LISTPROPN133ADR[2]+'''';
    frxReport.Variables['LISTPROPN134ADR']:=''''+Studcity_ReportsST_LISTPROPN134ADR[2]+'''';
    frxReport.Variables['LISTPROPN135ADR']:=''''+Studcity_ReportsST_LISTPROPN135ADR[2]+'''';
    frxReport.Variables['LISTPROPN14ADR']:=''''+Studcity_ReportsST_LISTPROPN14ADR[2]+'''';
    frxReport.Variables['LISTPROPN141ADR']:=''''+Studcity_ReportsST_LISTPROPN141ADR[2]+'''';
    frxReport.Variables['LISTPROPN142ADR']:=''''+Studcity_ReportsST_LISTPROPN142ADR[2]+'''';
    frxReport.Variables['LISTPROPN15ADR']:=''''+Studcity_ReportsST_LISTPROPN15ADR[2]+'''';
    frxReport.Variables['LISTPROPN151ADR']:=''''+Studcity_ReportsST_LISTPROPN151ADR[2]+'''';
    frxReport.Variables['LISTPROPN13_TOADR']:=''''+Studcity_ReportsST_LISTPROPN13_TOADR[2]+'''';
    frxReport.Variables['LISTPROPN13_TSADR']:=''''+Studcity_ReportsST_LISTPROPN13_TSADR[2]+'''';
    frxReport.Variables['LISTPROPN10VIP']:=''''+st_adrLsVIP[2]+'''';
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
    cxLabelStatus.Caption:=st_adrLsVIPPage2;
  end
  else
  begin
    frxReport.Clear;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PeopleAdrListVIP_Page2.fr3');
    frxReport.Variables.Clear;
    frxReport.Variables['NAME_REP']:=''''+Studcity_ReportsST_ADRLISTPR[2]+'''';
    frxReport.Variables['LISTPROPN1ADR']:=''''+Studcity_ReportsST_LISTPROPN1ADR[2]+'''';
    frxReport.Variables['LISTPROPN2ADR']:=''''+Studcity_ReportsST_LISTPROPN2ADR[2]+'''';
    frxReport.Variables['LISTPROPN3ADR']:=''''+Studcity_ReportsST_LISTPROPN3ADR[2]+'''';
    frxReport.Variables['LISTPROPDateRogADR']:=''''+Studcity_ReportsST_LISTPROPDateRog[2]+'''';
    frxReport.Variables['LISTPROPN5ADR']:=''''+Studcity_ReportsST_LISTPROPN5ADR[2]+'''';
    frxReport.Variables['LISTPROPN6ADR']:=''''+Studcity_ReportsST_LISTPROPN6ADR[2]+'''';
    frxReport.Variables['LISTPROPN6PolADR']:=''''+Studcity_ReportsST_LISTPROPN6POLADR[2]+'''';
    frxReport.Variables['LISTPROPNOblADR']:=''''+Studcity_ReportsST_LISTPROPNOblADR[2]+'''';
    frxReport.Variables['LISTPROPNRajADR']:=''''+Studcity_ReportsST_LISTPROPNRajADR[2]+'''';
    frxReport.Variables['LISTPROPNTownADR']:=''''+Studcity_ReportsST_LISTPROPNTownADR[2]+'''';
    frxReport.Variables['LISTPROPNTownSelADR']:=''''+Studcity_ReportsST_LISTPROPNTownSelADR[2]+'''';
    frxReport.Variables['LISTPROPNTownKrajADR']:=''''+Studcity_ReportsST_LISTPROPNTownKrajADR[2]+'''';
    frxReport.Variables['LISTPROPNTownRespADR']:=''''+Studcity_ReportsST_LISTPROPNTownRespADR[2]+'''';
    frxReport.Variables['LISTPROPNTownDerADR']:=''''+Studcity_ReportsST_LISTPROPNTownDerADR[2]+'''';
    frxReport.Variables['LISTPROPNStritADR']:=''''+Studcity_ReportsST_LISTPROPNStritADR[2]+'''';
    frxReport.Variables['LISTPROPNBuildADR']:=''''+Studcity_ReportsST_LISTPROPNBuildADR[2]+'''';
    frxReport.Variables['LISTPROPNCorpADR']:=''''+Studcity_ReportsST_LISTPROPNCorpADR[2]+'''';
    frxReport.Variables['LISTPROPNKvADR']:=''''+Studcity_ReportsST_LISTPROPNKvADR[2]+'''';
    frxReport.Variables['LISTPROPNPGTADR']:=''''+Studcity_ReportsST_LISTPROPNPGTADR[2]+'''';
    frxReport.Variables['LISTPROPN7ADR']:=''''+Studcity_ReportsST_LISTPROPN7ADR[2]+'''';
    frxReport.Variables['LISTPROPNYearADR']:=''''+Studcity_ReportsST_LISTPROPNYearADR[2]+'''';
    frxReport.Variables['LISTPROPN8ADR']:=''''+st_adrLsVIP8[2]+'''';
    frxReport.Variables['LISTPROPN8ORGANADR']:=''''+Studcity_ReportsST_LISTPROPN8ORGANADR[2]+'''';
    frxReport.Variables['LISTPROPN9ADR']:=''''+st_adrLsVIP9[2]+'''';
    frxReport.Variables['LISTPROPN9DONADR']:=''''+Studcity_ReportsST_LISTPROPN9DONADR[2]+'''';
    frxReport.Variables['LISTPROPN9CHANGEFAMADR']:=''''+Studcity_ReportsST_LISTPROPN9CHANGEFAMADR[2]+'''';
    frxReport.Variables['LISTPROPN9CHANGE1ADR']:=''''+Studcity_ReportsST_LISTPROPN9CHANGE1ADR[2]+'''';
    frxReport.Variables['LISTPROPN9CHANGE2ADR']:=''''+Studcity_ReportsST_LISTPROPN9CHANGE2ADR[2]+'''';
    frxReport.Variables['LISTPROPN9OTHERADR']:=''''+Studcity_ReportsST_LISTPROPN9OTHERADR[2]+'''';
    frxReport.Variables['LISTPROPN10ADR']:=''''+Studcity_ReportsST_LISTPROPN10ADR[2]+'''';
    frxReport.Variables['LISTPROPN101ADR']:=''''+Studcity_ReportsST_LISTPROPN101ADR[2]+'''';
    frxReport.Variables['LISTPROPN102ADR']:=''''+Studcity_ReportsST_LISTPROPN102ADR[2]+'''';
    frxReport.Variables['LISTPROPN11ADR']:=''''+Studcity_ReportsST_LISTPROPN11ADR[2]+'''';
    frxReport.Variables['LISTPROPN111ADR']:=''''+Studcity_ReportsST_LISTPROPN111ADR[2]+'''';
    frxReport.Variables['LISTPROPN112ADR']:=''''+Studcity_ReportsST_LISTPROPN112ADR[2]+'''';
    frxReport.Variables['LISTPROPN12ADR']:=''''+st_adrLsVIPPasp[2]+'''';
    frxReport.Variables['LISTPROPN12NumberPass']:=''''+Studcity_ReportsST_LISTPROPN12NumberPass[2]+'''';
    frxReport.Variables['LISTPROPN12PassVudADR']:=''''+Studcity_ReportsST_LISTPROPN12PassVudADR[2]+'''';
    frxReport.Variables['LISTPROPN12PassORGANADR']:=''''+Studcity_ReportsST_LISTPROPN12PassORGANADR[2]+'''';
    frxReport.Variables['LISTPROPN13ADR']:=''''+st_adrLsVIPVmeste[2]+'''';
    frxReport.Variables['LISTPROPN131ADR']:=''''+Studcity_ReportsST_LISTPROPN131ADR[2]+'''';
    frxReport.Variables['LISTPROPN132ADR']:=''''+Studcity_ReportsST_LISTPROPN132ADR[2]+'''';
    frxReport.Variables['LISTPROPN133ADR']:=''''+Studcity_ReportsST_LISTPROPN133ADR[2]+'''';
    frxReport.Variables['LISTPROPN134ADR']:=''''+Studcity_ReportsST_LISTPROPN134ADR[2]+'''';
    frxReport.Variables['LISTPROPN135ADR']:=''''+st_adrLsVIPPrim[2]+'''';
    frxReport.Variables['LISTPROPN14ADR']:=''''+st_adrLsVIPSost[2]+'''';
    frxReport.Variables['LISTPROPN141ADR']:=''''+Studcity_ReportsST_LISTPROPN141ADR[2]+'''';
    frxReport.Variables['LISTPROPN142ADR']:=''''+Studcity_ReportsST_LISTPROPN142ADR[2]+'''';
    frxReport.Variables['LISTPROPN15ADR']:=''''+Studcity_ReportsST_LISTPROPN15ADR[2]+'''';
    frxReport.Variables['LISTPROPN151ADR']:=''''+Studcity_ReportsST_LISTPROPN151ADR[2]+'''';
    frxReport.Variables['LISTPROPN13_TOADR']:=''''+Studcity_ReportsST_LISTPROPN13_TOADR[2]+'''';
    frxReport.Variables['LISTPROPN13_TSADR']:=''''+Studcity_ReportsST_LISTPROPN13_TSADR[2]+'''';
    frxReport.Variables['LISTPROPNREASON']:=''''+st_adrLsVIPReason[2]+'''';
    frxReport.Variables['LISTPROPNREASONNAME']:=''''+st_adrLsVIPReasonName[2]+'''';
    frxReport.Variables['LISTPROPNWORK']:=''''+st_adrLsVIPWork[2]+'''';
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

procedure TfrmMAINPrinAdrListVIP.cxButton2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMAINPrinAdrListVIP.DesignerExecute(Sender: TObject);
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

