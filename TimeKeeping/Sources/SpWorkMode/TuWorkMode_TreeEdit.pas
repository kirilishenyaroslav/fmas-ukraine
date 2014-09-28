unit TuWorkMode_TreeEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit,
  cxCheckBox, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxTextEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxInplaceContainer, cxDBTL, cxTLData, ExtCtrls, dxBarExtItems, dxBar,
  cxSplitter, dxStatusBar,TuCommonProc,SpWorkMode_DM,TuMessages, ActnList,TuCommonStyles,
  cxGridBandedTableView;

type
  TFormWorkModeTreeEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    TreeListTree1: TcxDBTreeList;
    cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeListColumn3: TcxDBTreeListColumn;
    Grid: TcxGrid;
    GridDBTableEditDays: TcxGridDBTableView;
    GridIdDayWeek: TcxGridDBColumn;
    GridWorkBeg: TcxGridDBColumn;
    GridWorkEnd: TcxGridDBColumn;
    GridBreakBeg: TcxGridDBColumn;
    GridBreakEnd: TcxGridDBColumn;
    GridTodayHours: TcxGridDBColumn;
    GridTOMORROW_HOURS: TcxGridDBColumn;
    GridTODAY_HOURS_NIGHT: TcxGridDBColumn;
    GridTOMORROW_HOURS_NIGHT: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    cxSplitter1: TcxSplitter;
    dxBarDockControl1: TdxBarDockControl;
    BarManager: TdxBarManager;
    dxBarDockControl2: TdxBarDockControl;
    ButtonRefresh: TdxBarLargeButton;
    ButtonExit: TdxBarLargeButton;
    ButtonBottom: TdxBarLargeButton;
    ButtonLeft: TdxBarLargeButton;
    cxDBTreeListColumn4: TcxDBTreeListColumn;
    cxDBTreeListColumn5: TcxDBTreeListColumn;
    TreeListTree2: TcxDBTreeList;
    cxDBTreeListColumn6: TcxDBTreeListColumn;
    cxDBTreeListColumn7: TcxDBTreeListColumn;
    cxDBTreeListColumn8: TcxDBTreeListColumn;
    cxDBTreeListColumn9: TcxDBTreeListColumn;
    cxDBTreeListColumn10: TcxDBTreeListColumn;
    cxDBTreeListColumnId1: TcxDBTreeListColumn;
    cxDBTreeListColumnId2: TcxDBTreeListColumn;
    ButtonRight: TdxBarLargeButton;
    Splitter33: TcxSplitter;
    Splitter2: TSplitter;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar2: TdxStatusBar;
    Styles: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    procedure ButtonRefreshClick(Sender: TObject);
    procedure ButtonLeftClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ButtonBottomClick(Sender: TObject);
    procedure ButtonRightClick(Sender: TObject);
    procedure TreeListTree1Change(Sender: TObject);
    procedure TreeListTree2Change(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure ActionF6Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    DModule:TDModule;
  public
    pStylesDM:TStyleDM;
    constructor create (Aowner:TComponent;ADModule:TDModule); reintroduce;
  end;

var
  FormWorkModeTreeEdit: TFormWorkModeTreeEdit;

implementation

{$R *.dfm}

constructor TFormWorkModeTreeEdit.create(Aowner: TComponent;ADModule:TDModule);
var i:integer;
begin
   inherited Create(AOwner);
 DModule:=ADModule;

ButtonRefreshClick(nil);
//******************************************************************************
 ButtonRefresh.Caption:=GetConst('Refresh','Button');

 ButtonRefresh.Caption:=GetConst('Refresh','Button');
 ButtonExit.Caption:=GetConst('Exit','Button');
 dxStatusBar1.Panels[0].Text:= 'Ins-'+GetConst('Insert','Button');
 dxStatusBar1.Panels[1].Text:= 'F2-'+GetConst('Update','Button');
 dxStatusBar1.Panels[2].Text:= 'Del-'+GetConst('Delete','Button');
 dxStatusBar1.Panels[3].Text:= 'F5-'+GetConst('Refresh','Button');
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
 dxStatusBar2.Panels[0].Text:= 'F6-'+GetConst('MoveSelect','Label');
 dxStatusBar2.Panels[1].Text:= 'Ctrl+Ins-'+GetConst('Insert','Button') + ' '+GetConst('RMoving','TabSheet');
 dxStatusBar2.Panels[2].Text:= 'Ctrl+Del-'+GetConst('Delete','Button')+' '+GetConst('RMoving','TabSheet');
 dxStatusBar2.Panels[3].Text:= 'Esc-'+GetConst('Exit','Button');
 for i:=0 to dxStatusBar2.Panels.Count-1 do
   dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
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

  cxDBTreeListColumn1.Caption.Text     :=GetConst('Nomer','GridColumn');
  cxDBTreeListColumn2.Caption.Text       :=GetConst('Name','GridColumn');
  cxDBTreeListColumn3.Caption.Text   :=GetConst('NightBeg','GridColumn');
  cxDBTreeListColumn4.Caption.Text   :=GetConst('NightEnd','GridColumn');
  cxDBTreeListColumn5.Caption.Text    :=GetConst('IsSmena','GridColumn');

  cxDBTreeListColumn6.Caption.Text      :=GetConst('Nomer','GridColumn');
  cxDBTreeListColumn7.Caption.Text       :=GetConst('Name','GridColumn');
  cxDBTreeListColumn8.Caption.Text   :=GetConst('NightBeg','GridColumn');
  cxDBTreeListColumn9.Caption.Text   :=GetConst('NightEnd','GridColumn');
  cxDBTreeListColumn10.Caption.Text    :=GetConst('IsSmena','GridColumn');
//******************************************************************************
 TreeListTree1.DataController.DataSource:=DModule.DSourceTree1;
 TreeListTree2.DataController.DataSource:=DModule.DSourceTree2;
 GridDBTableEditDays.DataController.DataSource:=DModule.DSourceTreeTrans;
 //*****************************************************************************
   pStylesDM:=TStyleDM.Create(Self);
  GridDBTableEditDays.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress ;
end;

procedure TFormWorkModeTreeEdit.ButtonRefreshClick(Sender: TObject);
begin
with DModule do
begin
  DSetTree1.Close;
  DSetTree2.Close;
  DSetTree1.SelectSQL.text:='SELECT * FROM DT_WORK_MODE_SELECT WHERE ID_PARENT<>-1';
  DSetTree2.SelectSQL.text:='SELECT * FROM DT_WORK_MODE_SELECT WHERE ID_PARENT=-1';
  DSetTree1.OPEN;
  DSetTree2.OPEN;
  if DSetTree1.RecordCount=0 then  ButtonRight.Enabled:=false else ButtonRight.Enabled:=true;
  if DSetTree2.RecordCount=0 then  begin Buttonleft.Enabled:=false; ButtonBottom.Enabled:=false; end
  else  begin Buttonleft.Enabled:=true; ButtonBottom.Enabled:=true; end

end

end;

procedure TFormWorkModeTreeEdit.ButtonLeftClick(Sender: TObject);
var i :integer;
begin
try
    DModule.StProc.Transaction.StartTransaction;
    DModule.StProc.StoredProcName:='TU_WORK_MODE_PARENT_U';
    DModule.StProc.Prepare;
    DModule.StProc.ParamByName('ID_PARENT').asinteger:=DModule.DSetTree1['id_work_mode'];
    for i:=0 to TreeListTree2.SelectionCount-1 do
    begin
     DModule.StProc.ParamByName('ID').asinteger:=TreeListTree2.Selections[i].Values[cxDBTreeListColumnId2.ItemIndex];
     DModule.StProc.ExecProc;
    end;
    DModule.StProc.Transaction.Commit;
    ButtonRefreshClick(Sender);
   except
   on E:Exception do
   begin
     TuShowMessage(GetConst('Caption','Error'),E.Message,mtError,[mbOK]);
     DModule.StProc.Transaction.Rollback;
  end;

end;
end;

procedure TFormWorkModeTreeEdit.FormResize(Sender: TObject);
var i:Integer;
begin
  TreeListTree1.Width:=Trunc(Width/2)-50;
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
 for i:=0 to dxStatusBar2.Panels.Count-1 do
   dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
 TreeListTree1.Width:= Width div 2-30;
 TreeListTree2.Width:= Width div 2-30;
end;

procedure TFormWorkModeTreeEdit.ButtonBottomClick(Sender: TObject);
var i :integer;
begin
try
    DModule.StProc.Transaction.StartTransaction;
    DModule.StProc.StoredProcName:='TU_WORK_MODE_PARENT_U';
    DModule.StProc.Prepare;
    DModule.StProc.ParamByName('ID_PARENT').asinteger:=0;
    for i:=0 to TreeListTree2.SelectionCount-1 do
    begin
     DModule.StProc.ParamByName('ID').asinteger:=TreeListTree2.Selections[i].Values[cxDBTreeListColumnId2.ItemIndex];
     DModule.StProc.ExecProc;
    end;
    DModule.StProc.Transaction.Commit;
    ButtonRefreshClick(Sender);
   except
   on E:Exception do
   begin
     TuShowMessage(GetConst('Caption','Error'),E.Message,mtError,[mbOK]);
     DModule.StProc.Transaction.Rollback;
  end;

end;
end;

procedure TFormWorkModeTreeEdit.ButtonRightClick(Sender: TObject);
var i :integer;
begin
try
    DModule.StProc.Transaction.StartTransaction;
    DModule.StProc.StoredProcName:='TU_WORK_MODE_PARENT_U';
    DModule.StProc.Prepare;
    DModule.StProc.ParamByName('ID_PARENT').asinteger:=-1;
    for i:=0 to TreeListTree1.SelectionCount-1 do
    begin
     DModule.StProc.ParamByName('ID').asinteger:=TreeListTree1.Selections[i].Values[cxDBTreeListColumnId1.ItemIndex];
     DModule.StProc.ExecProc;
    end;
    DModule.StProc.Transaction.Commit;
    ButtonRefreshClick(Sender);
   except
   on E:Exception do
   begin
     TuShowMessage(GetConst('Caption','Error'),E.Message,mtError,[mbOK]);
     DModule.StProc.Transaction.Rollback;
   end;
end;
end;
procedure TFormWorkModeTreeEdit.TreeListTree1Change(Sender: TObject);
begin
  if dmodule.DSetTree1.RecordCount<>0 then
with DModule do
begin
  DSetTreeTrans.Close;
  DSetTreeTrans.SelectSQL.text:='select * from TU_WORKREG_SELECT('+inttostr(DSetTree1['id_work_mode'])+')';
  DSetTreeTrans.open;
end
end;

procedure TFormWorkModeTreeEdit.TreeListTree2Change(Sender: TObject);
begin
 if dmodule.DSetTree1.RecordCount=0 then
   ButtonLeft.Enabled:=false
 else   ButtonLeft.Enabled:=true;
 if DModule.DSetTree2.RecordCount<>0 then
 with DModule do
 begin

  DSetTreeTrans.Close;
  DSetTreeTrans.SelectSQL.text:='select * from TU_WORKREG_SELECT('+inttostr(DSetTree2['id_work_mode'])+')';
  DSetTreeTrans.open;
 end

end;

procedure TFormWorkModeTreeEdit.ButtonExitClick(Sender: TObject);
begin
close;
end;

procedure TFormWorkModeTreeEdit.ActionF6Execute(Sender: TObject);
begin

  if TreeListTree1.Focused then  ButtonRightClick(sender) else
  if TreeListtree2.Focused then ButtonLeftClick(sender);


end;

procedure TFormWorkModeTreeEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

end.
