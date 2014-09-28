unit SpWorkModeEditDays;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxBar, dxBarExtItems, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxTextEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  cxGridBandedTableView, cxClasses,ibase,SpWorkModeEditDays_Edit,TuCommonTypes,
  cxTimeEdit,TuCommonProc,TuCommonStyles, cxCurrencyEdit, dxStatusBar;

type
  TFormEditDays = class(TForm)
    dxBarManager1: TdxBarManager;
    BtnRefresh: TdxBarLargeButton;
    BtnUpdate: TdxBarLargeButton;
    BtnExit: TdxBarLargeButton;
    BtnDel: TdxBarLargeButton;
    Grid: TcxGrid;
    GridDBTableEditDays: TcxGridDBTableView;
    GridIdDayWeek: TcxGridDBColumn;
    GridWorkBeg: TcxGridDBColumn;
    GridWorkEnd: TcxGridDBColumn;
    GridBreakBeg: TcxGridDBColumn;
    GridBreakEnd: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    GridTodayHours: TcxGridDBColumn;
    GridTOMORROW_HOURS: TcxGridDBColumn;
    ButtonInsert: TdxBarLargeButton;
    GridTODAY_HOURS_NIGHT: TcxGridDBColumn;
    GridTOMORROW_HOURS_NIGHT: TcxGridDBColumn;
    dxStatusBar1: TdxStatusBar;
    procedure ButtonInsertClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure GridDBTableEditDaysDataControllerDataChanged(
      Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure GridWorkBegCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure GridWorkBegGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure GridTodayHoursGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
  private
   pStylesDM:TStyleDM;
  public
    { Public declarations }
    id:Integer;
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE; Id_WorkMode:Integer);reintroduce;

  end;

var
  FormEditDays: TFormEditDays;

implementation

uses SpWorkModeEditDays_DM, pFIBDataSet;

{$R *.dfm}
constructor TFormEditDays.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;Id_WorkMode:Integer);
var i: Integer;
    y, m, d: Word;
begin
  inherited Create(AOwner);
  DModule:=TDModule.Create(AOwner);
  DModule.DB.Handle:=ADB_Handle;
  id:=Id_WorkMode;

  DModule.DSetDays.Close;
  DModule.DSetDays.SelectSQL.Text:= 'select * from TU_WORKREG_SELECT('+inttostr(id)+')';
  DModule.DSetDays.Active:=true;
  GridDBTableEditDays.DataController.DataSource:=DModule.DSourceDays;
  DModule.DSourceDays.DataSet:=DModule.DSetDays;
  pStylesDM:=TStyleDM.Create(Self);
  GridDBTableEditDays.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress ;
  Caption                           :=GetConst('TranscriptWorkMode','Form');
  BtnRefresh.Caption                :=GetConst('Refresh','Button');
  BtnUpdate.Caption                 :=GetConst('Update','Button');
  ButtonInsert.Caption              :=GetConst('Insert','Button');
  BtnDel.Caption                    :=GetConst('Delete','Button');
  BtnExit.Caption                   :=GetConst('Exit','Button');
  GridIdDayWeek.Caption             :=GetConst('Day','GridColumn');
  GridWorkBeg.Caption               :=GetConst('WorkBeg','GridColumn');
  GridWorkBeg.Caption               :=GetConst('WorkBeg','GridColumn');
  GridWorkEnd.Caption               :=GetConst('WorkEnd','GridColumn');
  GridBreakBeg.Caption              :=GetConst('BreakBeg','GridColumn');
  GridBreakEnd.Caption              :=GetConst('BreakEnd','GridColumn');
  GridTodayHours.Caption            :=GetConst('TodayHour','GridColumn');
  GridTOMORROW_HOURS.Caption        :=GetConst('TomorrowHours','GridColumn');
  GridTODAY_HOURS_NIGHT.Caption     :=GetConst('TodayHoursNight','GridColumn');
  GridTOMORROW_HOURS_NIGHT.Caption  :=GetConst('TomorrowHoursNight','GridColumn');
end;

procedure TFormEditDays.ButtonInsertClick(Sender: TObject);
var Param: TTuModeDay;
  K,max:Integer;
begin
Param               :=TTuModeDay.Create;
Param.Owner         :=Self;
Param.CFStyle       :=tcfsInsert;
Param.Id_Work_Mode  :=Id;
Param.Id_Day_Week   :=DModule.DSetDays.RecordCountFromSrv+1 ;

if View_SpWorkModeEditDays(Param) then
begin
  DModule.DSetDays.SQLs.RefreshSQL.Text := 'SELECT * FROM DT_WORK_MODE_SELECT_BY_KEY('+VarToStr(id)+')';
  DModule.DSetDays.SQLs.InsertSQL.Text := 'execute procedure z_empty_proc';
  DModule.DSetDays.Insert;
  DModule.DSetDays.Post;
  DModule.DSetDays.CloseOpen(true);
  DModule.DSetDays.Locate('ID_DAY_WEEK', Param.Id_Day_Week,[]) ;
  end;
Param.Destroy;
end;

procedure TFormEditDays.BtnUpdateClick(Sender: TObject);
var Param: TTuModeDay;
begin
Param               :=TTuModeDay.Create;
Param.Owner         :=Self;
Param.CFStyle       :=tcfsUpdate;
Param.Id_Work_Mode  :=Id;
Param.Id_Day_Week   :=DModule.DSetDays['ID_DAY_WEEK'];
if  DModule.DSetDays['WORK_BEG']=null then
begin

   Param.Work_Beg      :=0;
   Param.Work_End      :=0
end
else
begin
 Param.Work_Beg      :=DModule.DSetDays['WORK_BEG'];
 Param.Work_End      :=DModule.DSetDays['WORK_END'];
end;
if DModule.DSetDays['BREAK_BEG']<>null then
  Param.Break_Beg     := DModule.DSetDays['BREAK_BEG'];

if  DModule.DSetDays['BREAK_END']<>null then
  Param.Break_End     := DModule.DSetDays['BREAK_END'];

if View_SpWorkModeEditDays(Param) then
   begin
    DModule.DSetDays.SQLs.RefreshSQL.Text := 'SELECT * FROM DT_WORK_MODE_SELECT_BY_KEY('+VarToStr(id)+')';
    DModule.DSetDays.SQLs.UpdateSQL.Text := 'execute procedure z_empty_proc';
    DModule.DSetDays.Edit;
    DModule.DSetDays.Post;
    DModule.DSetDays.CloseOpen(true);
    DModule.DSetDays.Locate('ID_DAY_WEEK', Param.Id_Day_Week,[]) ;
   end;
Param.Destroy;
end;

procedure TFormEditDays.BtnDelClick(Sender: TObject);
var Param: TTuModeDay;
begin
Param               :=TTuModeDay.Create;
Param.Owner         :=Self;                                         
Param.CFStyle       :=tcfsDelete;
Param.Id_Work_Mode  :=Id;

Param.Id_Day_Week   :=DModule.DSetDays.RecordCountFromSrv;

if View_SpWorkModeEditDays(Param) then
   begin
BtnRefreshClick(sender);
   end;
Param.Destroy;
end;

procedure TFormEditDays.BtnExitClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFormEditDays.GridDBTableEditDaysDataControllerDataChanged(
  Sender: TObject);
begin
if DModule=nil then Exit;
if  DModule.DSetDays.RecordCount=0 then
begin
 BtnDel.Enabled:=False;
 BtnUpdate.Enabled:=False;
end
else
begin
 BtnDel.Enabled:=True;
 BtnUpdate.Enabled:=True;
end;


end;

procedure TFormEditDays.BtnRefreshClick(Sender: TObject);
var T:Integer;
begin
  if DModule.DSetDays.RecordCount =0 then Exit;
    T:=DModule.DSetDays['ID_DAY_WEEK'];
    DModule.DSetDays.CloseOpen(true);
    DModule.DSetDays.Locate('ID_DAY_WEEK',T,[]) ;
end;

procedure TFormEditDays.GridWorkBegCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
// AViewInfo.Item.Caption:='45654';


end;

procedure TFormEditDays.GridWorkBegGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin

if AText='' then AText:=GetConst('Holiday','CheckBox')
end;

procedure TFormEditDays.GridTodayHoursGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var i:integer;
begin
//for i:=length(AText) to 1 do
// if  AText[i]='0' then  Delete(AText, I, 1)
// else break;
end;

end.
