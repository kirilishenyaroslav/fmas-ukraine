unit MainFormWorkSubsOrdel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, ImgList, cxClasses, FIBDatabase, pFIBDatabase,
  IBase, FIBDataSet, pFIBDataSet,StudcityConst, FIBQuery, pFIBQuery,
  pFIBStoredProc, ActnList, dxBar, dxBarExtItems,St_ser_function;

type
  TfrmMainFormWorkSubsOrdel = class(TForm)
    StatusBar1: TStatusBar;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
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
    cxStyleSilver: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    ImageList1: TImageList;
    cxGridListSubs: TcxGrid;
    cxGridListSubsDBTableView1: TcxGridDBTableView;
    cxGridListSubsLevel1: TcxGridLevel;
    pFIBDataSetAllList: TpFIBDataSet;
    DataSourceAllList: TDataSource;
    NUM_LIST: TcxGridDBColumn;
    DATE_LIST: TcxGridDBColumn;
    Name_subs: TcxGridDBColumn;
    pFIBStoredProc: TpFIBStoredProc;
    LargeImages: TImageList;
    dxBarManager1: TdxBarManager;
    ToolButtonEdit: TdxBarLargeButton;
    ToolButtonDel: TdxBarLargeButton;
    ToolButtonRefresh: TdxBarLargeButton;
    ToolButtonPrint: TdxBarLargeButton;
    ToolButtonExit: TdxBarLargeButton;
    Year_list: TcxGridDBColumn;
    pFIBDataSetWorkPeople: TpFIBDataSet;
    pFIBDataSetUnWorkPeople: TpFIBDataSet;
    SUBS_CNT: TcxGridDBColumn;
    SUBS_SUMMA: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Name_subsGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure DATE_LISTGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure ToolButtonDelClick(Sender: TObject);
    procedure ToolButtonRefreshClick(Sender: TObject);
    procedure ToolButtonPrintClick(Sender: TObject);
    procedure ToolButtonExitClick(Sender: TObject);
    procedure Year_listGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure pFIBDataSetWorkPeopleAfterScroll(DataSet: TDataSet);
    procedure pFIBDataSetUnWorkPeopleAfterScroll(DataSet: TDataSet);
    procedure ToolButtonEditClick(Sender: TObject);
  private
    Constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE);overload;
    { Private declarations }
  public
    { Public declarations }
  end;

function LoadWorkSubsOtdel(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
exports LoadWorkSubsOtdel;

var
  frmMainFormWorkSubsOrdel: TfrmMainFormWorkSubsOrdel;
  lang:Integer;
  
implementation
uses DateUtils,PrintOtdelSubs,
     EditWorkSubsOtdel;

{$R *.dfm}

function LoadWorkSubsOtdel(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  Subs:TfrmMainFormWorkSubsOrdel;
begin
  Subs := TfrmMainFormWorkSubsOrdel.Create(AOwner,DB);
end;


Constructor TfrmMainFormWorkSubsOrdel.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
begin
  Inherited Create(AOwner);
  Database.Handle:=DB;

  Lang:=ST_serLanguageIndex(DB);

  Caption:=StudcityConst.Studcity_WorkListOtdel_EX[lang];

  Year_list.Caption:=StudcityConst.Studcity_WorkListOtdelSubsYEARList_EX[lang];
  DATE_LIST.Caption:=StudcityConst.Studcity_WorkListOtdelSubsDateList_EX[lang];
  NUM_LIST.Caption:=StudcityConst.Studcity_WorkListOtdelSubsNumList_EX[lang];
  Name_subs.Caption:=StudcityConst.Studcity_WorkListOtdelSubsName_EX[lang];
  SUBS_CNT.Caption:=StudcityConst.Studcity_WorkListOtdelSubsCNT_EX[lang];
  SUBS_SUMMA.Caption:=StudcityConst.Studcity_WorkListOtdelSubsSummaCNT_EX[lang];

  ToolButtonRefresh.Caption:=StudcityConst.Studcity_ACTION_REFRESH_CONST_EX[lang];
  ToolButtonEdit.Caption:=StudcityConst.Studcity_ACTION_EDIT_CONST_EX[lang];
  ToolButtonDel.Caption:=StudcityConst.Studcity_ACTION_DELETE_CONST_EX[lang];
  ToolButtonPrint.Caption:=StudcityConst.Studcity_ACTION_PRINT_CONST_EX[lang];
  ToolButtonExit.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST_EX[lang];

  pFIBDataSetAllList.Active:=false;
  pFIBDataSetAllList.Active:=true;

end;



procedure TfrmMainFormWorkSubsOrdel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmMainFormWorkSubsOrdel.Name_subsGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  AText:=StudcityConst.Studcity_WorkListOtdelSubsNameTypeSubs_EX[lang];
end;

procedure TfrmMainFormWorkSubsOrdel.DATE_LISTGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var
  yy,mm,dd:Word;
  Month_str:String;
begin
  DecodeDate(ARecord.Values[0],yy,mm,dd);
  case mm of
    1:month_str:=StudcityConst.Studcity_MONTH1S;
    2:month_str:=StudcityConst.Studcity_MONTH2S;
    3:month_str:=StudcityConst.Studcity_MONTH3S;
    4:month_str:=StudcityConst.Studcity_MONTH4S;
    5:month_str:=StudcityConst.Studcity_MONTH5S;
    6:month_str:=StudcityConst.Studcity_MONTH6S;
    7:month_str:=StudcityConst.Studcity_MONTH7S;
    8:month_str:=StudcityConst.Studcity_MONTH8S;
    9:month_str:=StudcityConst.Studcity_MONTH9S;
    10:month_str:=StudcityConst.Studcity_MONTH10S;
    11:month_str:=StudcityConst.Studcity_MONTH11S;
    12:month_str:=StudcityConst.Studcity_MONTH12S;
  end;

  AText:=Month_str;//+ ' '+IntToStr(yy);
end;

procedure TfrmMainFormWorkSubsOrdel.ToolButtonDelClick(
  Sender: TObject);
begin
if messageBox(Handle,PChar(StudcityConst.Studcity_MESSAGE_DELETE),
     PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_YESNO or MB_ICONQUESTION)=mrYes then
  begin
{    WriteTransaction.StartTransaction;
    pFIBStoredProc.StoredProcName:='ST_DT_RZSUB_DELETE';
    pFIBStoredProc.Prepare;
    pFIBStoredProc.ParamByName('ID_LIST').Value:=pFIBDataSetAllList.FieldValues['ID_LIST'];
    try
      pFIBStoredProc.ExecProc;
      except
        begin
          WriteTransaction.Rollback;
          Exit;
        end;
    end;
    WriteTransaction.Commit;
    pFIBDataSetAllList.Active:=false;
    pFIBDataSetAllList.Active:=true;}
  end;
end;

procedure TfrmMainFormWorkSubsOrdel.ToolButtonRefreshClick(
  Sender: TObject);
begin
  pFIBDataSetAllList.Active:=false;
  pFIBDataSetAllList.Active:=true;
end;

procedure TfrmMainFormWorkSubsOrdel.ToolButtonPrintClick(
  Sender: TObject);
var
  print:TfrmPrintSubs;
begin
if pFIBDataSetUnWorkPeople.FieldByName('count').AsInteger=0 then
  begin
    print:=TfrmPrintSubs.Create(Self,pFIBDataSetAllList.FieldValues['id_list'],cxGridListSubsDBTableView1.Controller.SelectedRecords[0].Values[0]);
    print.ShowModal;
    print.Free;
  end
  else
  begin
   messageBox(Handle,PChar(StudcityConst.Studcity_WorkListNotprint_EX[lang]),PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_OK or MB_ICONWARNING)
  end;
end;

procedure TfrmMainFormWorkSubsOrdel.ToolButtonExitClick(
  Sender: TObject);
begin
  Close;
end;

procedure TfrmMainFormWorkSubsOrdel.Year_listGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var
  yy,mm,dd:Word;
begin
  DecodeDate(ARecord.Values[0],yy,mm,dd);
  AText:=IntToStr(yy);
end;

procedure TfrmMainFormWorkSubsOrdel.pFIBDataSetWorkPeopleAfterScroll(
  DataSet: TDataSet);
begin
  StatusBar1.Panels.Items[0].Text:=StudcityConst.Studcity_WorkListOtdelCNT_EX[lang]+pFIBDataSetWorkPeople.FieldByName('count').AsString;
end;

procedure TfrmMainFormWorkSubsOrdel.pFIBDataSetUnWorkPeopleAfterScroll(
  DataSet: TDataSet);
begin
  StatusBar1.Panels.Items[1].Text:=StudcityConst.Studcity_WorkListOtdelCNTUnWork_EX[lang]+pFIBDataSetUnWorkPeople.FieldByName('count').AsString;
end;

procedure TfrmMainFormWorkSubsOrdel.ToolButtonEditClick(Sender: TObject);
var
  Edit : TfrmEditWorkSubsOtdel;
  id_list, id_serves : Int64;
begin
  id_list   := pFIBDataSetAllList.FieldByName('ID_LIST').asVariant;
  id_serves := pFIBDataSetAllList.FieldByName('ID_SERVES').asVariant;

  Edit := TfrmEditWorkSubsOtdel.create(self,id_list);
  Edit.id_serves := id_serves;
  Edit.ShowModal;
  Edit.Free;
end;

end.
