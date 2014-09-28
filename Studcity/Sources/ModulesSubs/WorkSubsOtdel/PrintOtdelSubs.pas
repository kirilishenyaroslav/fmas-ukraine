unit PrintOtdelSubs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls,StudcityConst, frxClass, frxDesgn,
  DB, FIBDataSet, pFIBDataSet, frxDBSet, cxLookAndFeelPainters, cxButtons,
  ActnList,St_ser_function, frxExportImage, frxExportXLS, frxExportPDF,
  frxExportHTML, frxExportRTF;

type
  TfrmPrintSubs = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    RadioGroupPrintOtdelSubs: TRadioGroup;
    frxDesigner1: TfrxDesigner;
    pFIBDataSetPrintMaster: TpFIBDataSet;
    frxDBDatasetPrintMaster: TfrxDBDataset;
    frxDBDatasetPrintDetails: TfrxDBDataset;
    pFIBDataSetprintDetails: TpFIBDataSet;
    DataSourceMaster: TDataSource;
    frxReport: TfrxReport;
    ButtonPrint: TcxButton;
    ButtonClose: TcxButton;
    ActionList1: TActionList;
    ActionDesigned: TAction;
    frxRTFExport1: TfrxRTFExport;
    frxBMPExport1: TfrxBMPExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxXLSExport1: TfrxXLSExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxRTFExport2: TfrxRTFExport;
    frxBMPExport2: TfrxBMPExport;
    frxHTMLExport2: TfrxHTMLExport;
    frxPDFExport2: TfrxPDFExport;
    frxJPEGExport2: TfrxJPEGExport;
    frxXLSExport2: TfrxXLSExport;
    frxTIFFExport2: TfrxTIFFExport;
    procedure FormDestroy(Sender: TObject);
    procedure ButtonPrintClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ActionDesignedExecute(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(Aowner:TComponent;id_list_pr:Variant;DateList:String);overload;
    { Public declarations }
  end;

var
  frmPrintSubs: TfrmPrintSubs;
  id_list:Variant;
  id_transaction:Variant;
  D_list:String;
  designer_rep:Integer;
  Lang:Integer;
implementation
uses
  MainFormWorkSubsOrdel, FIBQuery;
{$R *.dfm}

constructor TfrmPrintSubs.Create(Aowner:TComponent;id_list_pr:Variant;DateList:String);
begin
  Inherited Create(Aowner);
  id_list:=id_list_pr;
  D_list:=DateList;

  Lang:=ST_serLanguageIndex(TfrmMainFormWorkSubsOrdel(Self.Owner).Database.Handle);

  RadioGroupPrintOtdelSubs.Items.Add(StudcityConst.Studcity_WorkListOtdelSubsPRAll_EX[lang]);
  RadioGroupPrintOtdelSubs.Items.Add(StudcityConst.Studcity_WorkListOtdelSubsPRBuilds_EX[lang]);
  RadioGroupPrintOtdelSubs.Items.Add(StudcityConst.Studcity_WorkListOtdelSubsPRFak_EX[lang]);
  RadioGroupPrintOtdelSubs.ItemIndex:=0;

  ButtonClose.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST_EX[lang];
  ButtonPrint.Caption:=StudcityConst.Studcity_ACTION_PRINT_CONST_EX[lang];
end;

procedure TfrmPrintSubs.FormDestroy(Sender: TObject);
begin
  if id_transaction>0 then
    begin
      TfrmMainFormWorkSubsOrdel(Self.Owner).WriteTransaction.StartTransaction;
      TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.StoredProcName:='ST_DT_REPORT_SUBSOTDEL_DELETE';
      TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.Prepare;
      TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.ParamByName('ID_TRANSACTION').Value:=id_transaction;
      try
        TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.ExecProc;
        except
          begin
            TfrmMainFormWorkSubsOrdel(Self.Owner).WriteTransaction.Rollback;
            Exit;
          end;
      end;
      TfrmMainFormWorkSubsOrdel(Self.Owner).WriteTransaction.Commit;
    end;
end;

procedure TfrmPrintSubs.ButtonPrintClick(Sender: TObject);
var
  sql_master,sql_details:String;
  type_work:Integer;
begin
  if id_transaction>0 then
    begin
      TfrmMainFormWorkSubsOrdel(Self.Owner).WriteTransaction.StartTransaction;
      TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.StoredProcName:='ST_DT_REPORT_SUBSOTDEL_DELETE';
      TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.Prepare;
      TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.ParamByName('ID_TRANSACTION').Value:=id_transaction;
      try
        TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.ExecProc;
        except
          begin
            TfrmMainFormWorkSubsOrdel(Self.Owner).WriteTransaction.Rollback;
            Exit;
          end;
      end;
      TfrmMainFormWorkSubsOrdel(Self.Owner).WriteTransaction.Commit;
    end;

  TfrmMainFormWorkSubsOrdel(Self.Owner).WriteTransaction.StartTransaction;
  TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.StoredProcName:='ST_DT_REPORT_SUBSOTDEL_WORK';
  TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.Prepare;
  TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.ParamByName('ID_LIST').Value:=id_list;
  try
    TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.ExecProc;
    except
      begin
        TfrmMainFormWorkSubsOrdel(Self.Owner).WriteTransaction.Rollback;
        Exit;
      end;
  end;
  id_transaction:=TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.FieldByName('ID_TRANSACTION').AsVariant;
  TfrmMainFormWorkSubsOrdel(Self.Owner).WriteTransaction.Commit;

  pFIBDataSetPrintMaster.Active:=false;
  pFIBDataSetPrintMaster.Database:=TfrmMainFormWorkSubsOrdel(Self.Owner).Database;
  pFIBDataSetPrintMaster.Transaction:=TfrmMainFormWorkSubsOrdel(Self.Owner).ReadTransaction;

  pFIBDataSetprintDetails.Active:=false;
  pFIBDataSetprintDetails.Database:=TfrmMainFormWorkSubsOrdel(Self.Owner).Database;
  pFIBDataSetprintDetails.Transaction:=TfrmMainFormWorkSubsOrdel(Self.Owner).ReadTransaction;

  if (RadioGroupPrintOtdelSubs.ItemIndex=0) then
    begin
      type_work:=1;
      sql_details:='select * from ST_DT_REPORT_SUBSOTDEL where id_transaction=:id_transaction_r ORDER BY FAMILIA,IMYA,OTCHESTVO';
    end;
  if (RadioGroupPrintOtdelSubs.ItemIndex=1) then
    begin
      type_work:=2;
      sql_details:='select * from ST_DT_REPORT_SUBSOTDEL where id_transaction=:id_transaction_r and id_fak=:id_fak ORDER BY FAMILIA,IMYA,OTCHESTVO';
    end;
  if (RadioGroupPrintOtdelSubs.ItemIndex=2) then
    begin
      type_work:=3;
      sql_details:='select * from ST_DT_REPORT_SUBSOTDEL where id_transaction=:id_transaction_r and id_builds=:id_builds ORDER BY FAMILIA,IMYA,OTCHESTVO';
    end;

  pFIBDataSetprintDetails.SQLs.SelectSQL.Clear;
  pFIBDataSetprintDetails.SQLs.SelectSQL.Add(sql_details);

  pFIBDataSetPrintMaster.ParamByName('ID_TR').Value:=id_transaction;
  pFIBDataSetPrintMaster.ParamByName('TYPE_WORK').Value:=type_work;
  pFIBDataSetPrintMaster.Active:=true;

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\subsListWorkOtdel.fr3');
  frxReport.Variables['NameReport1']:=''''+StudcityConst.Studcity_WorkListOtdelSubsPr1+'''';
  frxReport.Variables['NameReport2']:=''''+StudcityConst.Studcity_WorkListOtdelSubsPr2+'''';
  frxReport.Variables['NameReport3']:=''''+StudcityConst.Studcity_WorkListOtdelSubsPr3+'''';
  frxReport.Variables['Number']:=''''+StudcityConst.Studcity_WorkListOtdelSubsNum+'''';
  frxReport.Variables['FIO']:=''''+StudcityConst.Studcity_WorkListOtdelSubsFIO+'''';
  frxReport.Variables['FakKurs']:=''''+StudcityConst.Studcity_WorkListOtdelSubsFakKurs+'''';
  frxReport.Variables['BuildsRoom']:=''''+StudcityConst.Studcity_WorkListOtdelSubsBuildsRoom+'''';
  frxReport.Variables['Summa']:=''''+StudcityConst.Studcity_WorkListOtdelSubsSumma+'''';
  frxReport.Variables['DateList']:=''''+D_list+'''';
  if designer_rep=0 then
    begin
      frxReport.ShowReport;
    end
    else
    begin
      frxReport.DesignReport;
    end;  
end;

procedure TfrmPrintSubs.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrintSubs.ActionDesignedExecute(Sender: TObject);
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
