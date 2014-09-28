unit ReprortsST_PROP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet, frxClass, frxDBSet, cxLookAndFeelPainters, StdCtrls,
  cxButtons, frxDesgn,StudcityConst;

type
  TfrmST_PROP = class(TForm)
    frxDBDataset1: TfrxDBDataset;
    pFIBDataSet: TpFIBDataSet;
    pFIBStoredProc: TpFIBStoredProc;
    cxButtonOK: TcxButton;
    frxReport: TfrxReport;
    frxDesigner1: TfrxDesigner;
    procedure cxButtonOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmST_PROP: TfrmST_PROP;

implementation
uses
  ViewDocPrint;
{$R *.dfm}

procedure TfrmST_PROP.cxButtonOKClick(Sender: TObject);
var
  F_P,N_P,O_P:String;
  FAK,KURS,BUILDS,BUILDS_NUM,ROOMS:String;
  DATE_BEG,DATE_END:TDateTime;
begin
  With pFIBStoredProc do
    begin
    try
    StoredProcName:='ST_DT_PROP_PRINT';
    Database:=TfrmViewDocPrint(self.owner).Database;
    Transaction:=TfrmViewDocPrint(self.owner).WriteTransaction;
    TfrmViewDocPrint(self.owner).WriteTransaction.StartTransaction;
    Prepare;
    ParamByName('INPUT_ID_PEOPLE').AsInt64:=TfrmViewDocPrint(self.owner).id_people_print;
    ExecProc;
    N_P:=FieldByName('OUNT_IMYA').AsString;
    F_P:=FieldByName('OUT_FAM').AsString;
    O_P:=FieldByName('OUT_OTCHESTVO').AsString;
    FAK:=FieldByName('OUT_FAK').AsString;
    BUILDS:=FieldByName('OUT_BUILDS').AsString;
//    BUILDS_NUM:=FieldByName('OUT_BUILDS_NUM').AsString;
    ROOMS:=FieldByName('OUT_ROOMSTR').AsString;
    DATE_BEG:=FieldByName('OUT_DATE_BEGIN').AsDateTime;
    DATE_END:=FieldByName('OUT_DATE_END').AsDateTime;    
    Transaction.Commit;
  except
    Transaction.Rollback;
    raise;
  end;
  end;

  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'PeoplePROP'+'.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['NAME_PROP']:=''''+Studcity_ReportsST_PROP_NAME+'''';
  frxReport.Variables['OSN_PROP']:=''''+Studcity_ReportsST_PROP_OSN+'''';
  frxReport.Variables['ROOMS_PROP']:=''''+Studcity_ReportsST_PROP_ROOM+'''';
  frxReport.Variables['FAM_PROP']:=''''+Studcity_ReportsST_PROP_FAM_P+'''';
  frxReport.Variables['IMYA_PROP']:=''''+Studcity_ReportsST_PROP_NAME_P+'''';
  frxReport.Variables['OTCH_PROP']:=''''+Studcity_ReportsST_PROP_OTDH_P+'''';
  frxReport.Variables['CAT_PROP']:=''''+Studcity_ReportsST_PROP_CAT+'''';
  frxReport.Variables['SROK_BEG_PROP']:=''''+Studcity_ReportsST_PROP_SROK_BEG+'''';
  frxReport.Variables['SROK_END_PROP']:=''''+Studcity_ReportsST_PROP_SROK_END+'''';
  frxReport.Variables['DIR_PROP']:=''''+Studcity_ReportsST_PROP_DIR+'''';
  frxReport.Variables['DIR0_PROP']:=''''+Studcity_ReportsST_PROP_DIR0+'''';

  frxReport.Variables['FAM']:=''''+F_P+'''';
  frxReport.Variables['IMYA']:=''''+N_P+'''';
  frxReport.Variables['OTCH']:=''''+O_P+'''';
  frxReport.Variables['FAK']:=''''+FAK+'''';
  frxReport.Variables['KURS']:=''''+KURS+'''';
  frxReport.Variables['BUILDS']:=''''+BUILDS+'''';
  frxReport.Variables['BUILDS_NUM']:=''''+BUILDS_NUM+'''';
  frxReport.Variables['ROOMS']:=''''+ROOMS+'''';
  frxReport.Variables['DATE_BEG']:=''''+DateToStr(DATE_BEG)+'''';
  frxReport.Variables['DATE_END']:=''''+DateToStr(DATE_END)+'''';
  frxReport.DesignReport;
end;

end.
