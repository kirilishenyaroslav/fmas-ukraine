unit MainPeopleVypisSubs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxControls, cxContainer, cxEdit, cxLabel, StdCtrls,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet,St_ser_function,IBase,StudcityConst, cxLookAndFeelPainters,
  cxButtons, frxClass, frxDBSet, frxDesgn, ActnList;

type
  TPeopleVypisSub = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    cxLabelPriod: TcxLabel;
    pFIBDataSet: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    ReadTransaction: TpFIBTransaction;
    Database: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    cxButtonOK: TcxButton;
    cxButtonClose: TcxButton;
    frxDesigner1: TfrxDesigner;
    frxDBDataset: TfrxDBDataset;
    ActionList1: TActionList;
    ActionDesigned: TAction;
    frxReport: TfrxReport;
    cxDateEditPeriod: TDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonOKClick(Sender: TObject);
    procedure ActionDesignedExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE);overload;  
    { Private declarations }
  public
    { Public declarations }
  end;
function VypisSubsDPK(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
exports VypisSubsDPK;
var
  PeopleVypisSub: TPeopleVypisSub;
  lng:integer;
  designer_rep:Integer;
implementation

{$R *.dfm}

function VypisSubsDPK(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  Reports:TPeopleVypisSub;
begin
  Reports:=TPeopleVypisSub.Create(AOwner, DB);
end;


constructor TPeopleVypisSub.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
var
  i:Integer;
  dd,mm,yyyy:Word;
begin
  inherited Create (AOwner);
  Database.Handle:=DB;

  lng:=ST_serLanguageIndex(DB);
  Caption:=StudcityConst.ST_VypisSubs[lng];

  //Выставление дат
  DecodeDate(Date,yyyy,mm,dd);
  cxDateEditPeriod.date:=EncodeDate(yyyy,mm,1);

  cxLabelPriod.Caption:=StudcityConst.ST_VypisSubsDate[lng];

  cxButtonOK.Caption:=StudcityConst.Studcity_ACTION_OK_CONST_EX[lng];
  cxButtonClose.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST_EX[lng];

  pFIBDataSet.Database:=Database;
  pFIBDataSet.Transaction:=ReadTransaction;
  pFIBDataSet.Active:=true;

  designer_rep:=0;
end;

procedure TPeopleVypisSub.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TPeopleVypisSub.cxButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TPeopleVypisSub.cxButtonOKClick(Sender: TObject);
var
  dd,mm,yyyy:Word;
begin
  DecodeDate(cxDateEditPeriod.Date,yyyy,mm,dd);

  pFIBDataSet.Active:=false;
  pFIBDataSet.ParamByName('param_beg_check').AsDate:=EncodeDate(yyyy,mm,1);
  pFIBDataSet.Active:=true;

  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\PeopleVypisSubs.fr3');
  frxReport.Variables.Clear;
  frxReport.Variables['N1']:= ''''+StudcityConst.ST_VypisSubsN1[pFIBDataSet.FBN('REP_LNG').AsInteger]+'''';
  frxReport.Variables['N2']:= ''''+StudcityConst.ST_VypisSubsN2[pFIBDataSet.FBN('REP_LNG').AsInteger]+'''';
  frxReport.Variables['N3']:= ''''+StudcityConst.ST_VypisSubsN3[pFIBDataSet.FBN('REP_LNG').AsInteger]+'''';
  frxReport.Variables['N4']:= ''''+StudcityConst.ST_VypisSubsN4[pFIBDataSet.FBN('REP_LNG').AsInteger]+'''';
  frxReport.Variables['N5']:= ''''+StudcityConst.ST_VypisSubsN5[pFIBDataSet.FBN('REP_LNG').AsInteger]+'''';  
  frxReport.Variables['FIO']:= ''''+StudcityConst.ST_VypisSubsFIO[pFIBDataSet.FBN('REP_LNG').AsInteger]+'''';
  frxReport.Variables['NOM_ACT']:= ''''+StudcityConst.ST_VypisSubsNomAct[pFIBDataSet.FBN('REP_LNG').AsInteger]+'''';
  frxReport.Variables['NALOG']:= ''''+StudcityConst.ST_VypisSubsNalog[pFIBDataSet.FBN('REP_LNG').AsInteger]+'''';
  frxReport.Variables['DATA']:= ''''+StudcityConst.ST_VypisSubsDateVyp[pFIBDataSet.FBN('REP_LNG').AsInteger]+'''';
  frxReport.Variables['MAIN_PASP']:= ''''+StudcityConst.ST_MAIN_PASP[pFIBDataSet.FBN('REP_LNG').AsInteger]+'''';
  frxReport.Variables['BEG']:= ''''+StudcityConst.ST_BEGIN_EX[pFIBDataSet.FBN('REP_LNG').AsInteger]+'''';
  frxReport.Variables['END']:= ''''+StudcityConst.ST_END_EX[pFIBDataSet.FBN('REP_LNG').AsInteger]+'''';


  if designer_rep=0 then
    begin
      frxReport.PrepareReport(true);
      frxReport.ShowReport;
    end
    else
    begin
      frxReport.DesignReport;
    end;
end;

procedure TPeopleVypisSub.ActionDesignedExecute(Sender: TObject);
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

procedure TPeopleVypisSub.FormDestroy(Sender: TObject);
begin
  
  pFIBDataSet.Active:=false;
  if ReadTransaction.InTransaction then
    ReadTransaction.commit;
{  Database.Handle:=nil;
  Database.Destroy;
  ReadTransaction.Destroy;
  pFIBDataSet.Destroy;}
end;

end.
