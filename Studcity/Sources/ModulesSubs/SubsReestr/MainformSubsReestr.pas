unit MainformSubsReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid,IBase, cxTextEdit,StudcityConst, ImgList,
  FIBQuery, pFIBQuery, pFIBStoredProc, frxClass, frxDBSet, frxDesgn, dxBar,
  dxBarExtItems, ActnList, StdCtrls,St_ser_function;

type
  TfrmMainFormListSubs = class(TForm)
    StatusBar: TStatusBar;
    Database: TpFIBDatabase;
    pFIBDataSetLsitSubs: TpFIBDataSet;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    cxGridListSubsDBTableView1: TcxGridDBTableView;
    cxGridListSubsLevel1: TcxGridLevel;
    cxGridListSubs: TcxGrid;
    DataSourceListSubs: TDataSource;
    NOM_LIST: TcxGridDBColumn;
    DATE_REG: TcxGridDBColumn;
    DATE_START: TcxGridDBColumn;
    NAME_BUILD: TcxGridDBColumn;
    StyleRepository: TcxStyleRepository;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    AFFIX: TcxGridDBColumn;
    cxStyleSilver: TcxStyle;
    pFIBDataSetCount: TpFIBDataSet;
    ImageList1: TImageList;
    pFIBStoredProc: TpFIBStoredProc;
    pFIBDataSetPrintFIO: TpFIBDataSet;
    frxDesigner: TfrxDesigner;
    pFIBDataSetPRINTName_ORG: TpFIBDataSet;
    frxDBDatasetNAME_ORG: TfrxDBDataset;
    pFIBDataSetFooter: TpFIBDataSet;
    frxDBDatasetFooter: TfrxDBDataset;
    DataSourcePRINTFIO: TDataSource;
    ImageList: TImageList;
    frxDBDatasetFIO: TfrxDBDataset;
    dxBarManager1: TdxBarManager;
    ToolButtonADD: TdxBarLargeButton;
    ToolButtonEdit: TdxBarLargeButton;
    ToolButtonDel: TdxBarLargeButton;
    ToolButtonRefresh: TdxBarLargeButton;
    ToolButtonPrint: TdxBarLargeButton;
    ToolButtonCommit: TdxBarLargeButton;
    ToolButtonExit: TdxBarLargeButton;
    LargeImages: TImageList;
    ActionList1: TActionList;
    ActionDesigned: TAction;
    dxBarButton1: TdxBarButton;
    ToolButtonPrintNew: TdxBarLargeButton;
    pFIBDataSetDetail: TpFIBDataSet;
    pFIBDataSetMaster: TpFIBDataSet;
    frxDBDatasetDetail: TfrxDBDataset;
    frxDBDatasetMaster: TfrxDBDataset;
    DataSourceMaster: TDataSource;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton2: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    frxReport: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGridListSubsDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure pFIBDataSetCountAfterScroll(DataSet: TDataSet);
    procedure ToolButtonRefreshClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToolButtonADDClick(Sender: TObject);
    procedure ToolButtonEditClick(Sender: TObject);
    procedure dxBarLargeButtonRefreshClick(Sender: TObject);
    procedure ToolButtonCommitClick(Sender: TObject);
    procedure ToolButtonExitClick(Sender: TObject);
    procedure ActionDesignedExecute(Sender: TObject);
    procedure ToolButtonDelClick(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
  private
    Constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE);overload;
    { Private declarations }
  public
    { Public declarations }
  end;
function LoadSudsReestr(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
exports LoadSudsReestr;
var
  frmMainFormListSubs: TfrmMainFormListSubs;
  designer_rep:Integer;
  Lang:Integer;
implementation
uses
  EditReestSubs;
{$R *.dfm}

function LoadSudsReestr(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  Subs:TfrmMainFormListSubs;
begin
  Subs:=TfrmMainFormListSubs.Create(AOwner,DB);
end;


Constructor TfrmMainFormListSubs.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
begin
  Inherited Create(AOwner);
  Database.Handle:=DB;

  Lang:=ST_serLanguageIndex(DB);

  Caption:=StudcityConst.Studcity_SubsMAIN_EX[lang];
  DATE_REG.Caption:=StudcityConst.Studcity_SubsReg_EX[lang];
  DATE_START.Caption:=StudcityConst.Studcity_SubsStart_EX[lang];
  NOM_LIST.Caption:=StudcityConst.Studcity_SubsList_EX[lang];
  NAME_BUILD.Caption:=StudcityConst.Studcity_SubsHostel_EX[lang];

  ToolButtonADD.Caption:=StudcityConst.Studcity_ACTION_ADD_CONST_EX[lang];
  ToolButtonEdit.Caption:=StudcityConst.Studcity_ACTION_EDIT_CONST_EX[lang];
  ToolButtonDel.Caption:=StudcityConst.Studcity_ACTION_DELETE_CONST_EX[lang];
  ToolButtonPrint.Caption:=StudcityConst.Studcity_ACTION_PRINT_CONST_EX[lang];
  ToolButtonExit.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST_EX[lang];
  ToolButtonCommit.Caption:=StudcityConst.Studcity_ACTION_STAMP_CONST_EX[lang];
  ToolButtonRefresh.Caption:=StudcityConst.Studcity_ACTION_REFRESH_CONST_EX[lang];

  pFIBDataSetLsitSubs.Active:=false;
  pFIBDataSetLsitSubs.Active:=true;
end;

procedure TfrmMainFormListSubs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmMainFormListSubs.cxGridListSubsDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect:TRect;
  ind:Integer;
begin
  Arect:=AViewInfo.Bounds;

  if AViewInfo.GridRecord.Values[4]=null then
    begin
      ACanvas.Canvas.Pen.Color:=clBlack;
      ACanvas.Canvas.Font.Style:=[];
      ACanvas.Canvas.FillRect(Arect);
    end
    else
    begin
      ACanvas.Canvas.Pen.Color:=clBlack;
      ACanvas.Canvas.Font.Style:=[fsBold];
      ACanvas.Canvas.FillRect(Arect);
    end;
  if AViewInfo.GridRecord.Values[4]='' then
    begin
      ACanvas.Canvas.Pen.Color:=clBlack;
      ACanvas.Canvas.Font.Style:=[];
      ACanvas.Canvas.FillRect(Arect);
    end
end;

procedure TfrmMainFormListSubs.pFIBDataSetCountAfterScroll(
  DataSet: TDataSet);
begin
  StatusBar.Panels.Items[0].Text:=StudcityConst.Studcity_SubsRegFIOCount_EX[lang]+pFIBDataSetCount.FieldByName('count').AsString;
end;

procedure TfrmMainFormListSubs.ToolButtonRefreshClick(Sender: TObject);
begin
pFIBDataSetLsitSubs.active:=false;
pFIBDataSetLsitSubs.active:=true;
end;

procedure TfrmMainFormListSubs.FormActivate(Sender: TObject);
var
  id:Variant;
begin
  id:=pFIBDataSetLsitSubs.FieldByName('id_list').AsVariant;
  pFIBDataSetLsitSubs.Active:=false;
  pFIBDataSetLsitSubs.Active:=true;
  pFIBDataSetLsitSubs.Locate('id_list',id,[]);
end;

procedure TfrmMainFormListSubs.ToolButtonADDClick(Sender: TObject);
var
  ADD:TfrmEditReestrSubs;
begin
  ADD:=TfrmEditReestrSubs.Create(Self);
end;

procedure TfrmMainFormListSubs.ToolButtonEditClick(Sender: TObject);
var
  Edit:TfrmEditReestrSubs;
begin
  Edit:=TfrmEditReestrSubs.Create(Self,pFIBDataSetLsitSubs.FieldValues['id_list']);
end;

procedure TfrmMainFormListSubs.dxBarLargeButtonRefreshClick(
  Sender: TObject);
begin
pFIBDataSetLsitSubs.active:=false;
pFIBDataSetLsitSubs.active:=true;
end;

procedure TfrmMainFormListSubs.ToolButtonCommitClick(Sender: TObject);
var
  id_list_local:Integer;
begin
if pFIBDataSetLsitSubs.FieldByName('affix').AsString<>'' then
  begin
    Exit;
  end;
//Подписание документа
if messageBox(Handle,PChar(StudcityConst.Studcity_MESSAGE_Q_COMMIT),
     PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_YESNO or MB_ICONQUESTION)=mrYes then
begin
  WriteTransaction.StartTransaction;
  pFIBStoredProc.StoredProcName:='ST_DT_SLSUB_COMMIT';
  pFIBStoredProc.Prepare;
  pFIBStoredProc.ParamByName('ID_LIST').AsInt64:=pFIBDataSetLsitSubs.FieldByName('id_list').AsVariant;
  pFIBStoredProc.ParamByName('user_commit').Value:='ser';
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
id_list_local:=pFIBDataSetLsitSubs.FieldValues['id_list'];
pFIBDataSetLsitSubs.Active:=false;
pFIBDataSetLsitSubs.Active:=true;
pFIBDataSetLsitSubs.Locate('ID_LIST',id_list_local,[]);
end;

procedure TfrmMainFormListSubs.ToolButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainFormListSubs.ActionDesignedExecute(Sender: TObject);
begin
if designer_rep=0 then
  begin
    designer_rep:=1;
    StatusBar.Panels[1].Text:='Режим отладки отчетов';
  end
  else
  begin
    designer_rep:=0;
    StatusBar.Panels[1].Text:='';
  end;
end;

procedure TfrmMainFormListSubs.ToolButtonDelClick(Sender: TObject);
begin
if pFIBDataSetLsitSubs.FieldByName('affix').AsString<>'' then
  begin
    Exit;
  end;
//Подписание документа
if messageBox(Handle,PChar(StudcityConst.Studcity_MESSAGE_DELETE),
     PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_YESNO or MB_ICONQUESTION)=mrYes then
  begin
    WriteTransaction.StartTransaction;
    pFIBStoredProc.StoredProcName:='ST_DT_SLSUB_DELETE_LIST';
    pFIBStoredProc.Prepare;
    pFIBStoredProc.ParamByName('IN_ID_LIST').AsInt64:=pFIBDataSetLsitSubs.FieldByName('id_list').AsVariant;
    try
      pFIBStoredProc.ExecProc;
        except
          begin
            WriteTransaction.Rollback;
            Exit;
          end;
        end;
    WriteTransaction.Commit;
    ToolButtonRefreshClick(self);
  end;
end;

procedure TfrmMainFormListSubs.dxBarButton2Click(Sender: TObject);
var
  year,month,day:Word;
  month_str:String;
begin
  pFIBDataSetPrintFIO.Active:=false;
  pFIBDataSetPrintFIO.ParamByName('param_list').Value:=pFIBDataSetLsitSubs.FieldValues['id_list'];
  pFIBDataSetPrintFIO.Active:=true;

  pFIBDataSetPRINTName_ORG.Active:=false;
  pFIBDataSetPRINTName_ORG.Active:=true;

  pFIBDataSetFooter.Active:=false;
  pFIBDataSetFooter.Active:=true;
  pFIBDataSetFooter.FetchAll;

  DecodeDate(pFIBDataSetLsitSubs.FieldValues['date_start'],year,month,day);
  case month of
    1:month_str:=StudcityConst.Studcity_MONTH1;
    2:month_str:=StudcityConst.Studcity_MONTH2;
    3:month_str:=StudcityConst.Studcity_MONTH3;
    4:month_str:=StudcityConst.Studcity_MONTH4;
    5:month_str:=StudcityConst.Studcity_MONTH5;
    6:month_str:=StudcityConst.Studcity_MONTH6;
    7:month_str:=StudcityConst.Studcity_MONTH7;
    8:month_str:=StudcityConst.Studcity_MONTH8;
    9:month_str:=StudcityConst.Studcity_MONTH9;
    10:month_str:=StudcityConst.Studcity_MONTH10;
    11:month_str:=StudcityConst.Studcity_MONTH11;
    12:month_str:=StudcityConst.Studcity_MONTH12;
  end;

  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\subsList.fr3');
  frxReport.Variables.Clear;
  frxReport.Variables['NOMBER']:= ''''+StudcityConst.Studcity_SubsRegNomber+'''';
  frxReport.Variables['FIO']:= ''''+StudcityConst.Studcity_SubsRegFIO+'''';
  frxReport.Variables['DATA']:= ''''+StudcityConst.Studcity_SubsRegDRPASSID+'''';
  frxReport.Variables['NOM_ACT']:= ''''+StudcityConst.Studcity_SubsRegNomberWork+'''';
  frxReport.Variables['CAT_PAY']:= ''''+StudcityConst.Studcity_SubsRegCatPay+'''';
  frxReport.Variables['SUMMA_LIVE']:= ''''+StudcityConst.Studcity_SubsRegSumLive+'''';
  frxReport.Variables['D']:= ''''+StudcityConst.Studcity_SubsRegD+'''';
  frxReport.Variables['DATE_INCOME']:= ''''+StudcityConst.Studcity_SubsRegDateInCome+'''';
  frxReport.Variables['SUM_ZAR']:= ''''+StudcityConst.Studcity_SubsRegZAR+'''';
  frxReport.Variables['SUM_OTHER']:= ''''+StudcityConst.Studcity_SubsRegOther+'''';
  frxReport.Variables['SUM_HELPCH']:= ''''+StudcityConst.Studcity_SubsRegHelpCh+'''';
  frxReport.Variables['SUM_ALIM']:= ''''+StudcityConst.Studcity_SubsRegAlim+'''';
  frxReport.Variables['STAMP']:= ''''+StudcityConst.Studcity_SubsRegSTAMP+'''';
  frxReport.Variables['DATE_STAMP']:= ''''+'"___"__________'+IntToStr(year)+'''';
  frxReport.Variables['LIST']:= ''''+StudcityConst.Studcity_SubsRegLIST+' № '+pFIBDataSetLsitSubs.FieldByName('NOM_LIST').asString+'''';
  frxReport.Variables['LIST1']:= ''''+StudcityConst.Studcity_SubsRegLIST1+' '+pFIBDataSetLsitSubs.FieldbyName('name_build').AsString+' '+pFIBDataSetLsitSubs.FieldByName('ADR').AsString+'''';
  frxReport.Variables['LIST2']:= ''''+StudcityConst.Studcity_SubsRegLIST2+' '+'жилищно-коммунальные услуги'+'''';
  frxReport.Variables['LIST3']:= ''''+StudcityConst.Studcity_SubsRegLIST3+' '+month_str+' '+IntToStr(year)+'''';
  if designer_rep=0 then
    begin
      frxReport.PrepareReport(true);
      frxReport.ShowReport;
    end
    else
    begin
      frxReport.DesignReport;
    end;

  //обновление даты редактирования
  WriteTransaction.StartTransaction;
  pFIBStoredProc.StoredProcName:='ST_DT_SLSUB_UPDATE_PR_EDIT';
  pFIBStoredProc.Prepare;
  pFIBStoredProc.ParamByName('ID_LIST').AsInt64:=pFIBDataSetLsitSubs.FieldByName('id_list').asVariant;
  pFIBStoredProc.ParamByName('PARAM_WORK').AsInteger:=0;
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

procedure TfrmMainFormListSubs.dxBarButton3Click(Sender: TObject);
var
  year,month,day:Word;
  month_str:String;
  i,cnt:Integer;
  sql_master:String;
begin
  sql_master:='select st_dt_slsub.*,st_sp_builds.* from st_dt_slsub,st_sp_builds where st_dt_slsub.kod_build=st_sp_builds.id_build and (';
  cnt:=0;
  for i:=0 to cxGridListSubsDBTableView1.DataController.GetSelectedCount-1 do
    begin
      if (cnt>0) then
        begin
          sql_master:=sql_master+' or ';
        end;
      sql_master:=sql_master+' st_dt_slsub.nom_list='+varToStr(cxGridListSubsDBTableView1.Controller.SelectedRecords[i].Values[2]);
      inc(cnt);
    end;
  sql_master:=sql_master+' ) order by ID_BUILD';

  pFIBDataSetMaster.Database:=Database;
  pFIBDataSetMaster.Transaction:=ReadTransaction;
  pFIBDataSetMaster.Active:=false;
  pFIBDataSetMaster.SQLs.SelectSQL.Clear;
  pFIBDataSetMaster.SQLs.SelectSQL.Text:=sql_master;
  pFIBDataSetMaster.Active:=true;

  pFIBDataSetDetail.Database:=Database;
  pFIBDataSetDetail.Transaction:=ReadTransaction;


{  pFIBDataSetPrintFIO.Active:=false;
  pFIBDataSetPrintFIO.ParamByName('param_list').Value:=pFIBDataSetLsitSubs.FieldValues['id_list'];
  pFIBDataSetPrintFIO.Active:=true;
}
  DecodeDate(pFIBDataSetLsitSubs.FieldValues['date_start'],year,month,day);
  case month of
    1:month_str:=StudcityConst.Studcity_MONTH1;
    2:month_str:=StudcityConst.Studcity_MONTH2;
    3:month_str:=StudcityConst.Studcity_MONTH3;
    4:month_str:=StudcityConst.Studcity_MONTH4;
    5:month_str:=StudcityConst.Studcity_MONTH5;
    6:month_str:=StudcityConst.Studcity_MONTH6;
    7:month_str:=StudcityConst.Studcity_MONTH7;
    8:month_str:=StudcityConst.Studcity_MONTH8;
    9:month_str:=StudcityConst.Studcity_MONTH9;
    10:month_str:=StudcityConst.Studcity_MONTH10;
    11:month_str:=StudcityConst.Studcity_MONTH11;
    12:month_str:=StudcityConst.Studcity_MONTH12;
  end;

  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\SubsListNew.fr3');
  frxReport.Variables.Clear;
  frxReport.Variables['NOMBER']:= ''''+StudcityConst.Studcity_SubsRegNomber+'''';
  frxReport.Variables['FIO']:= ''''+StudcityConst.Studcity_SubsRegFIO+'''';
  frxReport.Variables['DATA']:= ''''+StudcityConst.Studcity_SubsRegDRPASSID+'''';
  frxReport.Variables['NOM_ACT']:= ''''+StudcityConst.Studcity_SubsRegNomberWork+'''';
  frxReport.Variables['CAT_PAY']:= ''''+StudcityConst.Studcity_SubsRegCatPay+'''';
  frxReport.Variables['SUMMA_LIVE']:= ''''+StudcityConst.Studcity_SubsRegSumLive+'''';
  frxReport.Variables['D']:= ''''+StudcityConst.Studcity_SubsRegD+'''';
  frxReport.Variables['DATE_INCOME']:= ''''+StudcityConst.Studcity_SubsRegDateInCome+'''';
  frxReport.Variables['SUM_ZAR']:= ''''+StudcityConst.Studcity_SubsRegZAR+'''';
  frxReport.Variables['SUM_OTHER']:= ''''+StudcityConst.Studcity_SubsRegOther+'''';
  frxReport.Variables['SUM_HELPCH']:= ''''+StudcityConst.Studcity_SubsRegHelpCh+'''';
  frxReport.Variables['SUM_ALIM']:= ''''+StudcityConst.Studcity_SubsRegAlim+'''';
  frxReport.Variables['STAMP']:= ''''+StudcityConst.Studcity_SubsRegSTAMP+'''';
  frxReport.Variables['DATE_STAMP']:= ''''+'"___"__________'+IntToStr(year)+'''';
  frxReport.Variables['LIST']:= ''''+StudcityConst.Studcity_SubsRegLIST+' № '+pFIBDataSetLsitSubs.FieldByName('NOM_LIST').asString+'''';
  frxReport.Variables['LIST1']:= ''''+StudcityConst.Studcity_SubsRegLIST1+' '+pFIBDataSetLsitSubs.FieldbyName('name_build').AsString+' '+pFIBDataSetLsitSubs.FieldByName('ADR').AsString+'''';
  frxReport.Variables['LIST2']:= ''''+StudcityConst.Studcity_SubsRegLIST2+' '+'жилищно-коммунальные услуги'+'''';
  frxReport.Variables['LIST3']:= ''''+StudcityConst.Studcity_SubsRegLIST3+' '+month_str+' '+IntToStr(year)+'''';
  if designer_rep=0 then
    begin
      frxReport.PrepareReport(true);
      frxReport.ShowReport;
    end
    else
    begin
      frxReport.DesignReport;
    end;

  //обновление даты редактирования
  WriteTransaction.StartTransaction;
  pFIBStoredProc.StoredProcName:='ST_DT_SLSUB_UPDATE_PR_EDIT';
  pFIBStoredProc.Prepare;
  pFIBStoredProc.ParamByName('ID_LIST').AsInt64:=pFIBDataSetLsitSubs.FieldByName('id_list').asVariant;
  pFIBStoredProc.ParamByName('PARAM_WORK').AsInteger:=0;
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

procedure TfrmMainFormListSubs.dxBarButton4Click(Sender: TObject);
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\PeopleSubsSprav.fr3');

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

end.
