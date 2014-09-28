unit MainNarush;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, ToolWin,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxControls, cxGridCustomView, cxGrid, ImgList, cxClasses, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet,IBase, cxCheckBox,StudcityConst,
  cxContainer, cxLabel, cxTextEdit, cxMemo, FIBQuery, pFIBQuery,
  pFIBStoredProc,St_ser_function, frxClass, frxDBSet, frxDesgn, ActnList,
  AccMGMT, st_ConstUnit, st_Proc, Menus;

type
  TfrmMainNarush = class(TForm)
    StatusBar1: TStatusBar;
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
    ImageList: TImageList;
    ToolBar1: TToolBar;
    ToolButtonADD: TToolButton;
    ToolButtonEdit: TToolButton;
    ToolButtonDel: TToolButton;
    ToolButtonRefresh: TToolButton;
    ToolButtonExit: TToolButton;
    pFIBDatabase: TpFIBDatabase;
    pFIBDataSetNarush: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSourceNarush: TDataSource;
    GroupBox2: TGroupBox;
    cxLabelCount: TcxLabel;
    cxLabelCountNarush: TcxLabel;
    cxMemoNarush: TcxMemo;
    pFIBStoredProc: TpFIBStoredProc;
    cxGridNarush: TcxGrid;
    cxGridNarushDBTableView1: TcxGridDBTableView;
    SHORT_NAME: TcxGridDBColumn;
    DATE_NARUSH: TcxGridDBColumn;
    NAME_VZYSK: TcxGridDBColumn;
    OTRAB: TcxGridDBColumn;
    cxGridNarushLevel1: TcxGridLevel;
    ToolButtonPrint: TToolButton;
    frxDesigner1: TfrxDesigner;
    report_dataset: TfrxDBDataset;
    ActionList1: TActionList;
    isDebugMode_act: TAction;
    PopupMenu1: TPopupMenu;
    NarushPrint: TMenuItem;
    NarushPrintCard: TMenuItem;
    Report_narush: TfrxReport;
    procedure ToolButtonExitClick(Sender: TObject);
    procedure ToolButtonRefreshClick(Sender: TObject);
    procedure pFIBDataSetNarushAfterScroll(DataSet: TDataSet);
    procedure ToolButtonDelClick(Sender: TObject);
    procedure ToolButtonADDClick(Sender: TObject);
    procedure ToolButtonEditClick(Sender: TObject);
    procedure pFIBDataSetNarushAfterOpen(DataSet: TDataSet);
    procedure isDebugMode_actExecute(Sender: TObject);
    procedure NarushPrintClick(Sender: TObject);
    procedure NarushPrintCardClick(Sender: TObject);
  private
    IsDebugMode : Boolean;
    PLanguageIndex: byte;
    Constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE;ID_PEOPLE:Int64;id_user:Int64);overload;
  public
    id_people_n:Int64;
    id_user : Int64;
    Lang:Integer;
    count_rec :string;
  end;

  function LoadWorkWithNarush(AOwner : TComponent;DB:TISC_DB_HANDLE;id_people:Int64;id_user:Int64):Integer;stdcall;
  exports LoadWorkWithNarush;

var
  frmMainNarush: TfrmMainNarush;

implementation
uses
  AddNewNarush;
{$R *.dfm}
function LoadWorkWithNarush(AOwner : TComponent;DB:TISC_DB_HANDLE;id_people:Int64;id_user:Int64):Integer;
var
  Narush:TfrmMainNarush;
begin
  Narush:=TfrmMainNarush.Create(AOwner,DB,id_people,id_user);
  Narush.ShowModal;
  Narush.free;
end;

Constructor TfrmMainNarush.Create(AOwner : TComponent;DB:TISC_DB_HANDLE;ID_PEOPLE:Int64;id_user:Int64);
begin
  Inherited Create(AOwner);
  pFIBDatabase.Handle:=DB;

  self.id_user := id_user;
  id_people_n:=ID_PEOPLE;
  Lang:=ST_serLanguageIndex(DB);
  PLanguageIndex := St_Proc.cnLanguageIndex;

  ToolButtonRefresh.Caption:=StudcityConst.Studcity_ACTION_REFRESH_CONST_EX[lang];
  ToolButtonADD.Caption:=StudcityConst.Studcity_ACTION_ADD_CONST_EX[lang];
  ToolButtonEdit.Caption:=StudcityConst.Studcity_ACTION_EDIT_CONST_EX[lang];
  ToolButtonDel.Caption:=StudcityConst.Studcity_ACTION_DELETE_CONST_EX[lang];
  ToolButtonExit.Caption:= StudcityConst.Studcity_ACTION_CLOSE_CONST_EX[lang];
  ToolButtonPrint.Caption := StudcityConst.Studcity_ACTION_PRINT_CONST_EX[lang];
  Caption:=StudcityConst.Studcity_SpNarushWork_EX[lang];

  SHORT_NAME.Caption:=StudcityConst.Studcity_SpNarushName_EX[lang];
  DATE_NARUSH.Caption:=StudcityConst.Studcity_SpNarushDate_EX[lang];
  NAME_VZYSK.Caption:=StudcityConst.Studcity_SpNarushVzysk_EX[lang];
  OTRAB.Caption:=StudcityConst.Studcity_SpNarushOTRAB_EX[lang];
  cxLabelCount.Caption:=StudcityConst.Studcity_SpNarushCount_EX[lang];

  pFIBDataSetNarush.Active:=false;
  pFIBDataSetNarush.SQLs.SelectSQL.Text:='select * from ST_DT_NARUSH_SELECT_BY_ID(:param_people) order by date_narus';
  pFIBDataSetNarush.ParamByName('param_people').AsInt64:=id_people_n;
  pFIBDataSetNarush.Active:=true;
  pFIBDataSetNarush.FetchAll;
  count_rec    := inttostr(pFIBDataSetNarush.RecordCount);
  cxLabelCountNarush.Caption:=IntToStr(pFIBDataSetNarush.RecordCount);

  IsDebugMode := False;
end;

procedure TfrmMainNarush.ToolButtonExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMainNarush.ToolButtonRefreshClick(Sender: TObject);
var
  id_r:Int64;
begin
  pFIBDataSetNarush.Active:=false;
  pFIBDataSetNarush.SQLs.SelectSQL.Text:='select * from ST_DT_NARUSH_SELECT_BY_ID(:param_people) order by date_narus';
  pFIBDataSetNarush.ParamByName('param_people').AsInt64:=id_people_n;
  pFIBDataSetNarush.fetchAll;
  pFIBDataSetNarush.Active:=true;
  count_rec    := inttostr(pFIBDataSetNarush.RecordCount);
end;

procedure TfrmMainNarush.pFIBDataSetNarushAfterScroll(DataSet: TDataSet);
begin
  cxMemoNarush.Clear;
  cxMemoNarush.Lines.Add(pFIBDataSetNarush.FieldByName('NARUSH').AsString);
  cxMemoNarush.Lines.Add('Примітка: '+pFIBDataSetNarush.FieldByName('NOTES').AsString);
end;

procedure TfrmMainNarush.ToolButtonDelClick(Sender: TObject);
begin
  if pFIBDataSetNarush.recordcount=0 then  exit;

  if ID_User <> -999 then
   if fibCheckPermission('/ROOT/Studcity/Narushitely','Del') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

if messageBox(Handle,PChar(StudcityConst.Studcity_MESSAGE_DELETE),
     PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_YESNO or MB_ICONQUESTION)=mrYes then
  begin
    WriteTransaction.StartTransaction;
    pFIBStoredProc.Database:=pFIBDatabase;
    pFIBStoredProc.Transaction:=WriteTransaction;
    pFIBStoredProc.StoredProcName:='ST_DT_NARUSH_DELETE';
    pFIBStoredProc.Prepare;
    pFIBStoredProc.ParamByName('ID_RECORD').Value:=pFIBDataSetNarush.FieldByName('ID_RECORD').AsVariant;
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
ToolButtonRefreshClick(self);
end;

procedure TfrmMainNarush.ToolButtonADDClick(Sender: TObject);
var
  ViewForm:TfrmAddNewnarush;
begin
  if ID_User <> -999 then
   if fibCheckPermission('/ROOT/Studcity/Narushitely','Add') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;
  ViewForm := TfrmAddNewnarush.Create(Self,-1,lang);
  ViewForm.ShowModal;
  ViewForm.Free;
  ToolButtonRefreshClick(self);
end;

procedure TfrmMainNarush.ToolButtonEditClick(Sender: TObject);
var
  edit:TfrmAddNewnarush;
begin
  if pFIBDataSetNarush.recordcount=0 then exit;

  if ID_User <> -999 then
   if fibCheckPermission('/ROOT/Studcity/Narushitely','Edit') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;
  edit:=TfrmAddNewnarush.Create(Self,pFIBDataSetNarush.FieldByName('ID_RECORD').AsVariant,lang);
  edit.ShowModal;
  edit.Free;
  ToolButtonRefreshClick(self);
end;

procedure TfrmMainNarush.pFIBDataSetNarushAfterOpen(DataSet: TDataSet);
begin
  pFIBDataSetNarush.FetchAll;
  cxLabelCountNarush.Caption:=IntToStr(pFIBDataSetNarush.RecordCount);
end;

procedure TfrmMainNarush.isDebugMode_actExecute(Sender: TObject);
begin
  if IsDebugMode
   then IsDebugMode := False
   else IsDebugMode := True;
end;

procedure TfrmMainNarush.NarushPrintClick(Sender: TObject);
begin
  if cxGridNarushDBTableView1.DataController.RecordCount = 0 then Exit;

  if ID_User <> -999 then
   if fibCheckPermission('/ROOT/Studcity/Narushitely','Print') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  Report_narush.Clear;
  Report_narush.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\narush_people.fr3');
  Report_narush.Variables.Clear;

  Screen.Cursor:=crDefault;
  Report_narush.PrepareReport(True);
  if IsDebugMode
   then Report_narush.DesignReport
   else Report_narush.ShowReport;
end;

procedure TfrmMainNarush.NarushPrintCardClick(Sender: TObject);
begin
  if cxGridNarushDBTableView1.DataController.RecordCount = 0 then Exit;

  if ID_User <> -999 then
   if fibCheckPermission('/ROOT/Studcity/Narushitely','Print') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  Report_narush.Clear;
  Report_narush.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\narush_people_card.fr3');
  Report_narush.Variables.Clear;
  Report_narush.Variables['rec_count']           := Quotedstr(count_rec);
  Report_narush.Script.Variables['LastPage'] := 0;

  Screen.Cursor:=crDefault;
  Report_narush.PrepareReport(True);

  Report_narush.Script.Variables['LastPage']     := Report_narush.PreviewPages.Count;
  //Report_narush.Variables['rec_count']           := Quotedstr(count_rec);
  Report_narush.PrepareReport(True);


  if IsDebugMode
   then Report_narush.DesignReport
   else Report_narush.ShowReport;

end;

end.
