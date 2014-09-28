unit SpTuTemplet_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCalendar, cxTextEdit,
  cxCurrencyEdit, cxGridBandedTableView, cxGridTableView, dxBarExtItems,
  dxBar, cxSplitter, cxMaskEdit, cxDBEdit, cxContainer, cxLabel,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ExtCtrls, ComCtrls,SpTuTemplet_DM,
  iBase,SpTuTempet_Edit,TuCommonTypes, StdCtrls,TuCommonLoader,TuMessages,
  TuCommonProc,SpTuTemplet_SpCateg,TuCommonStyles, cxTL,
  cxInplaceContainer, cxDBTL, cxTLData, dxStatusBar, cxCheckBox,Dates,
  ActnList,SpTuTemplet_Warning, cxMemo,AccMGMT;

type
  TFormTemplet_Main = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl: TPageControl;
    TabSheetDepartment: TTabSheet;
    TabSheetCat: TTabSheet;
    TabSheetDog: TTabSheet;
    BarManager: TdxBarManager;
    ButtonRefresh: TdxBarLargeButton;
    ButtonExit: TdxBarLargeButton;
    ButtonInsert: TdxBarLargeButton;
    ButtonDelete: TdxBarLargeButton;
    ButtonUpdate: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    LineViewBtn: TdxBarLargeButton;
    MonthesComboBox: TdxBarCombo;
    YearSpinEdit: TdxBarSpinEdit;
    dxBarStatic1: TdxBarStatic;
    dxBarStatic2: TdxBarStatic;
    dxBarStatic3: TdxBarStatic;
    YesUseBtn: TdxBarButton;
    FilterBtn: TdxBarButton;
    dxBarStatic4: TdxBarStatic;
    dxBarStatic5: TdxBarStatic;
    dxBarStatic6: TdxBarStatic;
    UseCotractsStatic: TdxBarStatic;
    NoUseBtn: TdxBarButton;
    ButtonCtrlInsertCat: TdxBarLargeButton;
    dxBarStatic7: TdxBarStatic;
    CtrlUpdateBtn: TdxBarLargeButton;
    ButtonCtrlDeleteCat: TdxBarLargeButton;
    CtrlDetailBtn: TdxBarLargeButton;
    AcctCardBtn: TdxBarLargeButton;
    dxBarStatic8: TdxBarStatic;
    BroadFilterBtn: TdxBarButton;
    ShifrBtn: TdxBarLargeButton;
    ButtonPrint: TdxBarLargeButton;
    BarBtnGrantPrint: TdxBarButton;
    BarBtnPrintCat: TdxBarButton;
    BarBtnPrintKurs: TdxBarButton;
    dxBarDockControl1: TdxBarDockControl;
    GridDogovora: TcxGrid;
    GridDogDBTableView1: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    GridCateg: TcxGrid;
    GridCatDBTableView1: TcxGridDBTableView;
    GridCategColumnName: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    GridDogovoraColumnTN: TcxGridDBColumn;
    EditDateActuala: TdxBarDateCombo;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar2: TdxStatusBar;
    dxBarCombo1: TdxBarCombo;
    EditDateActual: TdxBarDateCombo;
    dxBarStatic9: TdxBarStatic;
    ButtonFYes: TdxBarButton;
    ButtonFNo: TdxBarButton;
    ButtonFilter: TdxBarButton;
    LabelShowAll: TdxBarStatic;
    dxBarStatic11: TdxBarStatic;
    dxBarStatic10: TdxBarStatic;
    dxBarStatic12: TdxBarStatic;
    dxBarDockControl2: TdxBarDockControl;
    dxBarDockControl3: TdxBarDockControl;
    TreeListDepBal: TcxDBTreeList;
    TreeListColumnName: TcxDBTreeListColumn;
    cxGrid1: TcxGrid;
    GridBalCatDBTableView1: TcxGridDBTableView;
    GridBalCatColumnName: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    TreeListDep: TcxDBTreeList;
    TreeListColumnDepName: TcxDBTreeListColumn;
    TreeListColumnDepYes: TcxDBTreeListColumn;
    dxBarLargeButton1: TdxBarLargeButton;
    ButtonCtrlInsertDep: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    ButtonCtrDeleteDep: TdxBarLargeButton;
    dxBarColorCombo1: TdxBarColorCombo;
    ButtonShow: TdxBarButton;
    TreeListColumnYes: TcxDBTreeListColumn;
    dxBarStatic13: TdxBarStatic;
    dxBarDockControl4: TdxBarDockControl;
    dxBarLargeButton2: TdxBarLargeButton;
    ButtonDogIns: TdxBarLargeButton;
    ButtonDogDel: TdxBarLargeButton;
    GridDogovoraColumnFIO: TcxGridDBColumn;
    GridDogovoraColumnKolStavok: TcxGridDBColumn;
    GridDogovoraColumnDateBeg: TcxGridDBColumn;
    GridDogovoraColumnDateEnd: TcxGridDBColumn;
    GridDogovoraColumnPost: TcxGridDBColumn;
    ButtonOk: TdxBarLargeButton;
    Splitter33: TcxSplitter;
    TreeListColumnID: TcxDBTreeListColumn;
    TreeListColumnDepId: TcxDBTreeListColumn;
    GridBalCatColumnID: TcxGridDBColumn;
    GridCategColumnId: TcxGridDBColumn;
    ActionList: TActionList;
    ActionF6: TAction;
    ActionCtrlIns: TAction;
    dxBarStatic14: TdxBarStatic;
    cxSplitter1: TcxSplitter;
    cxSplitter2: TcxSplitter;
    cxSplitter3: TcxSplitter;
    cxSplitter4: TcxSplitter;
    cxSplitter5: TcxSplitter;
    GridTempletDBTableView1: TcxDBTreeList;
    GridTempletColumnName: TcxDBTreeListColumn;
    ColumnTempletHeadFio: TcxDBTreeListColumn;
    GridTempletColumnKoment: TcxDBTreeListColumn;
    ColumnTempletDateBeg: TcxDBTreeListColumn;
    ColumnTempletDateEnd: TcxDBTreeListColumn;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    EditdateBeg: TdxBarDateCombo;
    procedure ButtonInsertClick(Sender: TObject);
    procedure ButtonRefreshClick(Sender: TObject);
    procedure ButtonUpdateClick (Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ButtonCtrlInsertCatClick(Sender: TObject);
    procedure ButtonCtrlDeleteCatClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonExitClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure ButtonFYesClick(Sender: TObject);
    procedure ButtonFNoClick(Sender: TObject);
    procedure GridDepDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ButtonCtrlInsertDepClick(Sender: TObject);
    procedure ButtonCtrDeleteDepClick(Sender: TObject);
    procedure TreeListDepChange(Sender: TObject);
    procedure TreeListDepBalChange(Sender: TObject);
    procedure GridBalCatDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ButtonDogInsClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ActionF6Execute(Sender: TObject);
    procedure ButtonDogDelClick(Sender: TObject);
    procedure GridTempletDBTableView1Change(Sender: TObject);
    procedure GridTempletDBTableView1DblClick(Sender: TObject);
    procedure EditdateBegChange(Sender: TObject);

  private
    DM:TDM;
  public
    { Public declarations }
       pStylesDM:TStyleDM;
       Res:variant;
       KodSetupAct:integer;
       Style:TtuFormStyle;
       IsParent:Boolean;
       idTemplate:variant;
    constructor Create(AOwner:TComponent;ADM:TDM; PKodSetup:variant;tfsFormStyle:TtuFormStyle ; AidTemplate:variant);reintroduce;
  end;



implementation

uses Math, FIBDataSet, FIBQuery;

{$R *.dfm}
constructor TFormTemplet_Main.Create(AOwner:TComponent;ADM:TDM;PKodSetup:variant;tfsFormStyle:TtuFormStyle; AidTemplate:variant);
var i:integer;
begin
  inherited Create(AOwner);
  DM:=ADM;
  idTemplate :=AidTemplate;
  if  idTemplate<>null then IsParent:=true
  else   IsParent:=false;
  Style:=tfsFormStyle;
  KodSetupAct:=PKodSetup;
  Res:=VarArrayCreate([0,2], varVariant);
  if Style = tfsNormal then  ButtonOk.Visible:=ivNever;
//******************************************************************************
  GridTempletDBTableView1.DataController.DataSource:=Dm.DSourceTemplet;
  TreeListDep.DataController.DataSource:=DM.DSourceTempletDep;
  GridCatDBTableView1.DataController.DataSource:=DM.DSourceTempletCat;
  TreeListDepBal.DataController.DataSource:=DM.DSourceTempletBalDep;
  GridBalCatDBTableView1.DataController.DataSource:=DM.DSourceTempletBalCat;
  GridDogDBTableView1.DataController.DataSource:=dM.DSourceTempletDog;
//******************************************************************************
  EditdateBeg.date:=strtodate(KodSetupToPeriod(PKodSetup,6));

  pStylesDM:=TStyleDM.Create(Self);
  GridCatDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress ;
  GridDogDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress ;
  GridBalCatDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress ;
  TreeListDep.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress ;
 Caption                               :=GetConst('TempletTimesheet','Form');
 ButtonInsert.Caption                  :=GetConst('Insert','Button');
 ButtonUpdate.Caption                  :=GetConst('Update','Button');
 ButtonDelete.Caption                  :=GetConst('Delete','Button');
 ButtonRefresh.Caption                 :=GetConst('Refresh','Button');
 ButtonExit.Caption                    :=GetConst('Exit','Button');
 TabSheetDepartment.Caption            :=GetConst('Department','TabSheet');
 TabSheetCat.Caption                   :=GetConst('Categor','TabSheet');
 TabSheetDog.Caption                   :=GetConst('Dog','TabSheet');
 GridTempletColumnName.Caption.text    :=GetConst('NameTemplet','GridColumn');
 GridTempletColumnKoment.Caption.text  :=GetConst('KomentTemplet','GridColumn') ;
 TreeListColumnDepName.Caption.Text    :=GetConst('NameDep','GridColumn') ;
 GridCategColumnName.Caption           :=GetConst('NameCat','GridColumn') ;
 TreeListColumnName.Caption.Text       :=GetConst('NameDep','GridColumn') ;
 GridBalCatColumnName.Caption          :=GetConst('NameCat','GridColumn') ;
 ColumnTempletDateBeg.Caption.text     :=GetConst('PeriodBeg','GridColumn') ;
 ColumnTempletDateEnd.Caption.text     :=GetConst('PeriodEnd','GridColumn') ;
 ColumnTempletHeadFio.Caption.text     :=GetConst('HeadMan','Label');
 EditDateActual.Caption                :=GetConst('Date','Label') ;
 LabelShowAll.Caption                  :=GetConst('ShowAll','Label') ;
 ButtonFYes.Caption                    :=GetConst('Yes1','Button') +'    ';
 ButtonFNo.Caption                     :=GetConst('No','Button')+'      ' ;
 ButtonFilter.Caption                  :=GetConst('Filter','Button') ;
 GridDogovoraColumnFIO.Caption:=GetConst('Fio','GridColumn');
 GridDogovoraColumnDateBeg.Caption:=GetConst('PeriodBeg','GridColumn');
 GridDogovoraColumnDateEnd.Caption:=GetConst('PeriodEnd','GridColumn');
 GridDogovoraColumnKolStavok.Caption:=GetConst('Stavka','GridColumn');
 GridDogovoraColumnPost.Caption:=GetConst('Post','GridColumn');
 GridDogovoraColumnTN.Caption:=GetConst('TIN','GridColumn');
 ButtonOk.Caption:=GetConst('Select','Button');

//******************************************************************************
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
//******************************************************************************
 if Style=tfsModal then
 begin
   ButtonInsert.Enabled:=false;
   ButtonPrint.Enabled:=false;
   ButtonDelete.Enabled:=False;
   ButtonUpdate.Enabled:=False;
   ButtonCtrlInsertDep.Enabled:=false;
   ButtonCtrDeleteDep.Enabled:=False;
   ButtonCtrlInsertCat.Enabled:=False;
   ButtonCtrlDeleteCat.Enabled:=False;
   ButtonDogDel.Enabled:=false;

   Width:=800;
   Height:=400;
   GridTempletColumnKoment.Visible:=false;
   Panel2.Visible:=false;
   BarManager.Bars[2].Visible:=false
 end;
end;

procedure TFormTemplet_Main.ButtonInsertClick(Sender: TObject);
var  Param:TTemplet;
begin


  Param:=TTemplet.Create;
  Param.CFStyle:=tcfsInsert;
  Param.Owner:=Self;
  Param.KodSetup:=KodSetupAct;
  Param.id:=null;
  Param.DM:=Dm;
  if  dm.DSetTemplet.RecordCount<>0 then
  begin
    Param.ID_PARENT:=dm.DSetTemplet['ID'];
    Param.NAME_PARENT:=dm.DSetTemplet['NAME'];
  end
  else
   Param.ID_PARENT:=-1;
   Param.IS_TEMPLATE:=1;
  if View_TempletEdit(Param) then
  begin

    ButtonRefreshClick(Sender);
    dm.DSetTemplet.Locate('Id',  Param.id, []);
  end;
end;

procedure TFormTemplet_Main.ButtonRefreshClick(Sender: TObject);
var T:integer;
begin


  T:=0;
  DM.DSetTemplet.Close;
  Dm.DSetTempletDep.Close;
  Dm.DSetTempletCat.Close;
  DM.DSetTempletDog.close;
  Dm.DSetTempletBalDep.Close;
  Dm.DSetTempletBalCat.Close;
  KodSetupAct:=DateToKodSetup(EditdateBeg.date);
  if not IsParent then
    if Style<>tfsModal then
      DM.DSetTemplet.SQLs.SelectSQL.Text:='select * from TU_TEMPLATE_TIMESHEET_S('+inttostr(KodSetupAct)+',Null, null,-1,Null)'
    else
      DM.DSetTemplet.SQLs.SelectSQL.Text:='select * from TU_TEMPLATE_TIMESHEET_S('+inttostr(KodSetupAct)+',Null,'+inttostr(AccMGMT.GetUserIdMan)+ ',-1,Null)'
  else
    DM.DSetTemplet.SQLs.SelectSQL.Text:='select * from TU_TEMPLATE_TIMESHEET_S('+inttostr(KodSetupAct)+',Null,Null,-1,'+ VarToStrDef(idTemplate,'Null')+')';

  DM.DSetTempletDep.SQLs.SelectSQL.Text:='select * from TU_TEMPLATE_TRANSCRIPT_S(?ID, 0,'''+Datetostr(EditdateBeg.date)+''')group by ID,ID_DEP_OR_CAT ,NAME_FULL,ID_LINK,EXISTS_LINE';
  DM.DSetTempletCat.SQLs.SelectSQL.Text:='select * from TU_TEMPLATE_TRANSCRIPT_S(?ID, 1,'''+Datetostr(EditdateBeg.date)+''')';
  DM.DSetTempletBalDep.SQLs.SelectSQL.Text:='select * from TU_SP_DEPARTMENT_FILT_S(99,'''+Datetostr(EditdateBeg.date)+''',0,-1)';
  DM.DSetTempletBalCat.SQLs.SelectSQL.Text:='select * from TU_SP_CATEGORY_FILT_S('''+Datetostr(EditdateBeg.date)+''')';
  DM.DSetTempletDog.SQLs.SelectSQL.Text:='select * from  TU_TEMPLET_DOG_S(?ID,'''+Datetostr(EditdateBeg.date)+''','''+Datetostr(EditdateBeg.date)+''')';
  DM.DSetTemplet.Open;
  if T<>0 then DM.DSetTemplet.Locate('ID',T,[]) ;
  Dm.DSetTempletDep.Open;
  if Style=tfsNormal then
  begin
    Dm.DSetTempletCat.Open;
    DM.DSetTempletDog.Open;
    Dm.DSetTempletBalDep.Open;
    Dm.DSetTempletBalCat.Open;
  end;
  if (DM.DSetTemplet.RecordCount =0) then
  begin
   ButtonDelete.Enabled:=False;
   ButtonUpdate.Enabled:=False;
   ButtonCtrlInsertDep.Enabled:=false;
   ButtonCtrDeleteDep.Enabled:=False;
   ButtonCtrlInsertCat.Enabled:=False;
   ButtonCtrlDeleteCat.Enabled:=False;
   ButtonDogIns.Enabled:=false;
   ButtonDogDel.Enabled:=false;
   Exit;
  end
  else
  if Style=tfsNormal then
  begin
   ButtonDelete.Enabled:=True;
   ButtonUpdate.Enabled:=True;
  end;
end;

procedure TFormTemplet_Main.ButtonUpdateClick(Sender: TObject);
var  Param:TTemplet;
   T:Variant;
begin
  T:= DM.DSetTemplet['ID'];
  Param:=TTemplet.Create;
  Param.CFStyle:=tcfsUpdate;
  Param.Owner:=Self;
  Param.KodSetup:=KodSetupAct;
  Param.IS_TEMPLATE:=dm.DSetTemplet['IS_TEMPLATE'];
  Param.ID_PARENT:=dm.DSetTemplet['ID_PARENT'];
  if  not(Param.ID_PARENT=-1) then
    Param.NAME_PARENT:=dm.DSetTemplet['NAME_PARENT'];
  Param.id:=Dm.DSetTemplet['ID'];
  Param.Name:=Dm.DSetTemplet['NAME'];
  Param.Comentar:=Dm.DSetTemplet['COMMENTAR'];
  Param.DateBeg:=Dm.DSetTemplet['DATE_BEG'];
  Param.DateEnd:=Dm.DSetTemplet['DATE_END'];
  Param.ID_MAN_RESPONSIBLE:=DM.DsetTemplet['ID_MAN_RESPONSIBLE'];
  Param.ID_MAN_HEAD:=DM.DsetTemplet['ID_MAN_HEAD'];
  Param.ID_MAN_PERSONNEL:=DM.DsetTemplet['ID_MAN_PERSONNEL'];

  Param.FIO_RESPONSIBLE:=VarToStrDef(DM.DsetTemplet['FIO_RESPONSIBLE'],'');
  Param.FIO_HEAD:=VarToStrDef(DM.DsetTemplet['FIO_HEAD'],'');
  Param.FIO_PERSONNEL:=VarToStrDef(DM.DsetTemplet['FIO_PERSONNEL'],'');

  Param.POST_RESPONSIBLE:=VarToStrDef(DM.DsetTemplet['POST_RESPONSIBLE'],'');
  Param.POST_HEAD:=VarToStrDef(DM.DsetTemplet['POST_HEAD'],'');
  Param.POST_PERSONNEL:=VarToStrDef(DM.DsetTemplet['POST_PERSONNEL'],'');
  Param.DM:=Dm;
  if View_TempletEdit(Param) then
  begin
    dm.DSetTemplet.CloseOpen(true);
    dm.DSetTemplet.Locate('Id',  T, []);
  end
end;

procedure TFormTemplet_Main.ButtonDeleteClick(Sender: TObject);
var  Param:TTemplet;
begin
  Param:=TTemplet.Create;
  Param.CFStyle:=tcfsDelete;
  Param.Owner:=Self;
  Param.id:= Dm.DSetTemplet['ID'];
  Param.DM:=DM;
  if View_TempletEdit(Param) then
     ButtonRefreshClick(Sender);
end;

procedure TFormTemplet_Main.ButtonCtrlInsertCatClick(Sender: TObject);
var ResultView:Variant;
    T,T2,T1,i:integer;
  Form :TFormWarning;
  Yes:Boolean;
begin
  Form:=TFormWarning.create(self,DM);
  DM.DsetEditWarning.Close;
  DM.DsetEditWarning.SelectSQL.text:='select * from TU_TEMPLATE_TRANSCRIPT_I_TEST('+
                                                         inttostr(Dm.DsetTemplet['ID'])+
                                                         ',:ID_DEP_CAT_DOG,1,null)' ;
  for i:=0 to GridBalCatDBTableView1.Controller.SelectedRowCount-1 do
  begin
    DM.DsetEditWarning.Close;
    DM.DsetEditWarning.Params.ByName['ID_DEP_CAT_DOG'].AsVariant:=GridBalCatDBTableView1.Controller.SelectedRows[i].Values[GridBalCatColumnID.Index];
    DM.DsetEditWarning.Open;
    if  DM.DsetEditWarning.RecordCount>0 then
    begin
      if Form.ShowModal=mrYes then Yes:=true
      else Yes:=false;
    end
    else
      Yes:=true;
    if Yes then
    try
      DM.StProc.Transaction.StartTransaction;
      DM.StProc.StoredProcName:='TU_TEMPLATE_TRANSCRIPT_I';
      DM.StProc.Prepare;
      DM.StProc.ParamByName('ID_TEMPLET').asinteger:=Dm.DsetTemplet['ID'];
      DM.StProc.ParamByName('TYPE_ID').asinteger:=1;
      DM.StProc.ParamByName('ID_DEP_CAT_DOG').asinteger:=GridBalCatDBTableView1.Controller.SelectedRows[i].Values[GridBalCatColumnID.Index];
      DM.StProc.ExecProc;
      DM.StProc.Transaction.Commit;
   except
     on E:Exception do
     begin
       TuShowMessage(GetConst('Caption','Error'),E.Message,mtError,[mbOK]);
       DM.StProc.Transaction.Rollback;
     end;
   end;
  end;
  T2:= DM.DSetTemplet['ID'];
  T:=DM.DSetTempletBalCat['ID_CATEGORY'];
  ButtonRefreshClick(sender);
  DM.DSetTemplet.Locate('ID',T2,[]);
  DM.DSetTempletDep.Locate('ID_DEP_OR_CAT',T,[]);
  DM.DSetTempletBalDep.LocateNExt('ID_PARENT',T1,[]);
end;

procedure TFormTemplet_Main.ButtonCtrlDeleteCatClick(Sender: TObject);
var i,T2,T1,T : integer;
  Form :TFormWarning;
  Yes:Boolean;
begin
  Form:=TFormWarning.create(self,DM);
  DM.DsetEditWarning.Close;
  DM.DsetEditWarning.SelectSQL.text:='select * from TU_TEMPLATE_TRANSCRIPT_D_TEST(:ID)' ;
  for i:=0 to GridCatDBTableView1.Controller.SelectedRowCount-1 do
  begin
    DM.DsetEditWarning.Close;
    DM.DsetEditWarning.Params.ByName['ID'].AsVariant:=GridCatDBTableView1.Controller.SelectedRows[i].Values[GridCategColumnId.Index];
    if  DM.DsetEditWarning.RecordCount>0 then
    begin
      if Form.ShowModal=mrYes then Yes:=true
      else Yes:=false;
    end
    else
      Yes:=true;
    if Yes then
    try
      DM.StProc.Transaction.StartTransaction;
      DM.StProc.StoredProcName:='TU_TEMPLATE_TRANSCRIPT_D';
      DM.StProc.Prepare;
      DM.StProc.ParamByName('ID').asinteger:=GridCatDBTableView1.Controller.SelectedRows[i].Values[GridCategColumnId.Index];
      DM.StProc.ExecProc;
      DM.StProc.Transaction.Commit;
    except
     on E:Exception do
     begin
       TuShowMessage(GetConst('Caption','Error'),E.Message,mtError,[mbOK]);
       DM.StProc.Transaction.Rollback;
     end;
    end;
    T2:= DM.DSetTemplet['ID'];
    T:=DM.DSetTempletCat['ID_DEP_OR_CAT'];
    ButtonRefreshClick(sender);
    if Dm.DSetTempletDep.RecordCountFromSrv=0 then ButtonCtrDeleteDep.Enabled:=False
    else
    begin
      DM.DSetTemplet.Locate('ID',T2,[]);
      DM.DSetTempletBalDep.Locate('ID_DEPARTMENT',T,[]);
    end;
  end;
end;

procedure TFormTemplet_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFormTemplet_Main.ButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFormTemplet_Main.FormResize(Sender: TObject);
var i:Integer;
begin
  TreeListDep.Width:=Trunc(Width/2)-50;
  for i:=0 to dxStatusBar1.Panels.Count-1 do
    dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
  for i:=0 to dxStatusBar2.Panels.Count-1 do
    dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
  TreeListDep.Width:= Width div 2-30;
  GridCateg.Width:= Width div 2-30;
end;

procedure TFormTemplet_Main.PageControlChange(Sender: TObject);
begin
  FormResize(sender);
  if (Dm.DSetTemplet.RecordCount=0)   then
  begin
    ButtonCtrlInsertDep.Enabled:=False;
    ButtonCtrDeleteDep.Enabled:=False;
    ButtonCtrlInsertCat.Enabled:=False;
    ButtonCtrlDeleteCat.Enabled:=False;
    ButtonOk.Enabled:=False;
    Exit;
  end;
  if PageControl.ActivePage=TabSheetDepartment then
  begin
    if Style=tfsNormal then ButtonCtrlInsertDep.Enabled:=True;
    if Dm.DSetTempletDep.RecordCountFromSrv=0 then
      ButtonCtrlDeleteCat.Enabled:=False
    else
    if Style=tfsNormal then ButtonCtrlDeleteCat.Enabled:=True;
  end;

  if PageControl.ActivePage=TabSheetCat then
  begin
    if Style=tfsNormal then   ButtonCtrlInsertCat.Enabled:=True;
    if Dm.DSetTempletCat.RecordCountFromSrv=0 then
      ButtonCtrlDeleteCat.Enabled:=False
    else
      if Style=tfsNormal then ButtonCtrlDeleteCat.Enabled:=True;
  end;
  if PageControl.ActivePage=TabSheetDog then
  begin
    if Style=tfsNormal then   ButtonDogIns.Enabled:=True;
    if Dm.DSetTempletDog.RecordCountFromSrv=0 then
      ButtonDogDel.Enabled:=False
    else
      if Style=tfsNormal then ButtonDogDel.Enabled:=True;
  end;
  if Dm.DSetTemplet.Active then
  if  (Dm.DSetTemplet['IS_TEMPLATE']=0) and (not IsParent) then
  begin
    ButtonOk.Enabled:=False;
    ButtonCtrlInsertDep.Enabled:=False;
    ButtonCtrDeleteDep.Enabled:=False;
    ButtonCtrlInsertCat.Enabled:=False;
    ButtonCtrlDeleteCat.Enabled:=False;
    ButtonDogIns.Enabled:=false;
  end
  else
    ButtonOk.Enabled:=True;

end;

procedure  TFormTemplet_Main.ButtonFYesClick(Sender: TObject);
begin
ButtonFNo.down:=not  ButtonFYes.down
end;

procedure TFormTemplet_Main.ButtonFNoClick(Sender: TObject);
begin
ButtonFYes.down:=not  ButtonFNo.down
end;

procedure TFormTemplet_Main.GridDepDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if Dm.DSetTemplet.RecordCount=0 then
begin
  ButtonCtrlDeleteCat.Enabled := False ;
  Exit;
end;
  if (AFocusedRecord=nil) or (AFocusedRecord.Expandable)  then
  ButtonCtrlDeleteCat.Enabled := False
else
   if (Style=tfsNormal) and (DM.DSetTemplet['IS_TEMPLATE']=1) then ButtonCtrlInsertCat.Enabled := True;
end;


procedure TFormTemplet_Main.ButtonCtrlInsertDepClick(Sender: TObject);
var T,T1,T2,i: integer;
  Form :TFormWarning;
  Yes:Boolean;
begin
   Form:=TFormWarning.create(self,DM);
   DM.DsetEditWarning.Close;
   DM.DsetEditWarning.SelectSQL.text:='select * from TU_TEMPLATE_TRANSCRIPT_I_TEST('+
                                                             inttostr(Dm.DsetTemplet['ID'])+
                                                             ',:ID_DEP_CAT_DOG,0,null)' ;
   for i:=0 to TreeListDepBal.SelectionCount-1 do
   begin
     DM.DsetEditWarning.Close;
     DM.DsetEditWarning.Params.ByName['ID_DEP_CAT_DOG'].AsVariant:=TreeListDepBal.Selections[i].Values[TreeListColumnID.ItemIndex];
     if TreeListDepBal.Selections[i].Values[TreeListColumnYes.ItemIndex]=1 then
       DM.DsetEditWarning.Open;
     if  DM.DsetEditWarning.RecordCount>0 then
     begin
       if Form.ShowModal=mrYes then Yes:=true
       else Yes:=false;
     end
     else
       Yes:=true;
     if Yes then
     try
       DM.StProc.Transaction.StartTransaction;
       DM.StProc.StoredProcName:='TU_TEMPLATE_TRANSCRIPT_I';
       DM.StProc.Prepare;
       DM.StProc.ParamByName('TYPE_ID').asinteger:=0;
       DM.StProc.ParamByName('ID_TEMPLET').asinteger:=Dm.DsetTemplet['ID'];
       DM.StProc.ParamByName('ID_DEP_CAT_DOG').asinteger:=TreeListDepBal.Selections[i].Values[TreeListColumnID.ItemIndex];
       if TreeListDepBal.Selections[i].Values[TreeListColumnYes.ItemIndex]=1 then
         DM.StProc.ExecProc;
       DM.StProc.Transaction.Commit;
     except
       on E:Exception do
       begin
         TuShowMessage(GetConst('Caption','Error'),E.Message,mtError,[mbOK]);
         DM.StProc.Transaction.Rollback;
       end;
     end;
   end;
   T2:= DM.DSetTemplet['ID'];
   T:=DM.DSetTempletBalDep['ID_DEPARTMENT'];
   T1:=DM.DSetTempletBalDep['ID_PARENT'];
   ButtonRefreshClick(sender);
   DM.DSetTemplet.Locate('ID',T2,[]);
   DM.DSetTempletDep.Locate('ID_DEP_OR_CAT',T,[]);
   DM.DSetTempletBalDep.Locate('ID_PARENT',T1,[]);
   DM.DSetTempletBalDep.LocateNExt('ID_PARENT',T1,[]);
end;

procedure TFormTemplet_Main.ButtonCtrDeleteDepClick(Sender: TObject);
var T,T1,T2,i:Integer;
  Form :TFormWarning;
  Yes:Boolean;
begin
  Form:=TFormWarning.create(self,DM);
  DM.DsetEditWarning.Close;
  DM.DsetEditWarning.SelectSQL.text:='select * from TU_TEMPLATE_TRANSCRIPT_D_TEST(:ID)' ;
  for i:=0 to TreeListDep.SelectionCount-1 do
  begin
    DM.DsetEditWarning.Close;
    DM.DsetEditWarning.Params.ByName['ID'].AsVariant:=TreeListDep.Selections[i].Values[TreeListColumnDepId.ItemIndex];
    if TreeListDep.Selections[i].Values[TreeListColumnDepYes.ItemIndex]=1 then
      DM.DsetEditWarning.Open;
    if  DM.DsetEditWarning.RecordCount>0 then
    begin
      if Form.ShowModal=mrYes then Yes:=true
      else Yes:=false;
    end
    else
      Yes:=true;
    if Yes then
    try
      DM.StProc.Transaction.StartTransaction;
      DM.StProc.StoredProcName:='TU_TEMPLATE_TRANSCRIPT_D';
      DM.StProc.Prepare;
      if TreeListDep.Selections[i].Values[TreeListColumnDepYes.ItemIndex]=1 then
      begin
        DM.StProc.ParamByName('ID').asinteger:=TreeListDep.Selections[i].Values[TreeListColumnDepId.ItemIndex];
        DM.StProc.ExecProc;
      end;
       DM.StProc.Transaction.Commit;
    except
      on E:Exception do
      begin
        TuShowMessage(GetConst('Caption','Error'),E.Message,mtError,[mbOK]);
        DM.StProc.Transaction.Rollback;
      end;
    end;
  end;
  T2:= DM.DSetTemplet['ID'];
  T:=DM.DSetTempletDep['ID_DEP_OR_CAT'];
  T1:=DM.DSetTempletDep['ID_LINK'];
  ButtonRefreshClick(sender);
  if Dm.DSetTempletDep.RecordCountFromSrv=0 then ButtonCtrDeleteDep.Enabled:=False
  else
  begin
   DM.DSetTemplet.Locate('ID',T2,[]);
   DM.DSetTempletBalDep.Locate('ID_DEPARTMENT',T,[]);
   DM.DSetTempletDep.Locate('ID_LINK',T1,[]);
   DM.DSetTempletDep.LocateNext('ID_LINK',T1,[]);
  end;
end;

procedure TFormTemplet_Main.TreeListDepChange(Sender: TObject);
begin
if Dm.DSetTempletDep.RecordCountFromSrv=0 then ButtonCtrDeleteDep.Enabled:=False
else
 if Dm.DSetTempletDep['EXISTS_LINE']=1 then
 begin
    if Style=tfsNormal then ButtonCtrDeleteDep.Enabled:=True;
 end
 else
  ButtonCtrDeleteDep.Enabled:=False;
end;

procedure TFormTemplet_Main.TreeListDepBalChange(Sender: TObject);
begin
    if DM.DSetTemplet.Active then
    begin
      if (Dm.DSetTempletBalDep['EXISTS_LINE']=1) and(Dm.DSetTemplet.RecordCount<>0)and (DM.DSetTemplet['IS_TEMPLATE']=1) then
      begin
          if Style=tfsNormal then ButtonCtrlInsertDep.Enabled:=True;
      end
      else
        ButtonCtrlInsertDep.Enabled:=False;
    end;
end;

procedure TFormTemplet_Main.GridBalCatDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin

  if ((AFocusedRecord=nil) or (AFocusedRecord.Expandable))or(Dm.DSetTemplet.RecordCount=0)  then
  ButtonCtrlInsertCat.Enabled := False
else
   if (Style=tfsNormal)and (DM.DSetTemplet['IS_TEMPLATE']=1) then ButtonCtrlInsertCat.Enabled := True;
end;



procedure TFormTemplet_Main.ButtonDogInsClick(Sender: TObject);
var Result:variant;
  Form :TFormWarning;
  Yes:Boolean;
begin
  if not ButtonDogIns.Enabled then Exit;
  if not (PageControl.ActivePage=TabSheetDog) then   PageControl.ActivePage:=TabSheetDog;
  Result:=LoadTuSpDog(self,dm.db.Handle, KodSetupAct,Null);
  if Result[0]<>null then
  begin
    Form:=TFormWarning.create(self,DM);
    DM.DsetEditWarning.Close;
    DM.DsetEditWarning.SelectSQL.text:='select * from TU_TEMPLATE_TRANSCRIPT_I_TEST('+
                                                           inttostr(Dm.DsetTemplet['ID'])+
                                                           ',:ID_DEP_CAT_DOG,2,:ID_POST_MOVING)' ;
    DM.DsetEditWarning.Params.ByName['ID_DEP_CAT_DOG'].AsVariant:=Result[0];
    DM.DsetEditWarning.Params.ByName['ID_POST_MOVING'].AsVariant:=Result[1];
    DM.DsetEditWarning.Open;
    if  DM.DsetEditWarning.RecordCount>0 then
    begin
      if Form.ShowModal=mrYes then Yes:=true
      else Yes:=false;
    end
    else
      Yes:=true;
    if Yes then
      with Dm.StProc do
      begin
        Transaction.StartTransaction;
        StoredProcName:='TU_TEMPLATE_TRANSCRIPT_I';
        Prepare;
        ParamByName('ID_TEMPLET').asinteger:=Dm.DsetTemplet['ID'];
        ParamByName('ID_DEP_CAT_DOG').asinteger:=Result[0];
        ParamByName('ID_POST_MOVING').asinteger:=Result[1];
        ParamByName('TYPE_ID').asinteger:=2;
        ExecProc;
        Transaction.Commit;
        Dm.DSetTempletDog.CloseOpen(true);
        PageControlChange(Sender);
      end;
  end;
end;

procedure TFormTemplet_Main.ButtonOkClick(Sender: TObject);
begin
if ButtonOk.Enabled then
begin
  Res[0]:=DM.DSetTemplet['ID'];
  Res[1]:=DM.DSetTemplet['NAME'];
  ModalResult:=mrYes;
end;
end;

procedure TFormTemplet_Main.ActionF6Execute(Sender: TObject);
begin

 if PageControl.ActivePage=TabSheetDepartment then
 begin
  if TreeListDep.Focused then  ButtonCtrDeleteDepClick(sender) else
  if TreeListDepBal.Focused then ButtonCtrlInsertDepClick(sender);
 end
 else
  if PageControl.ActivePage=TabSheetCat then
  begin
   if GridCatDBTableView1.IsControlFocused then
    ButtonCtrlDeleteCatClick(sender)
    else
   if GridBalCatDBTableView1.IsControlFocused then
   ButtonCtrlInsertCatClick(sender);
  end
end;

procedure TFormTemplet_Main.ButtonDogDelClick(Sender: TObject);
 var Form :TFormWarning;
  Yes:Boolean;
begin
  if not ButtonDogIns.Enabled then Exit;
  if not (PageControl.ActivePage=TabSheetDog) then   PageControl.ActivePage:=TabSheetDog;
  if   TuShowMessage(GetConst('Delete','Error'),GetConst('DeleteText','Error'),
                mtWarning, [mbYes,mbNo])=mrYes then
  begin
    Form:=TFormWarning.create(self,DM);
    DM.DsetEditWarning.Close;
    DM.DsetEditWarning.SelectSQL.text:='select * from TU_TEMPLATE_TRANSCRIPT_D_TEST(:ID)' ;
    DM.DsetEditWarning.Params.ByName['ID'].AsVariant:=Dm.DSetTempletDog['ID'];
    DM.DsetEditWarning.Open;
    if  DM.DsetEditWarning.RecordCount>0 then
    begin
      if Form.ShowModal=mrYes then Yes:=true
      else Yes:=false;
    end
    else
      Yes:=true;
    if Yes then
    begin
      DM.StProc.Transaction.StartTransaction;
      DM.StProc.StoredProcName:='TU_TEMPLATE_TRANSCRIPT_D';
      DM.StProc.Prepare;
      DM.StProc.ParamByName('ID').asinteger:=Dm.DSetTempletDog['ID'];
      DM.StProc.ExecProc;
      DM.StProc.Transaction.Commit;
      DM.DSetTempletDog.closeopen(true);
      PageControlChange(Sender);
    end
  end;
end;

procedure TFormTemplet_Main.GridTempletDBTableView1Change(Sender: TObject);
begin
  if (Dm.DSetTemplet.RecordCount=0) or( (Dm.DSetTemplet['IS_TEMPLATE']=0) and (not IsParent)) then
  begin
    ButtonOk.Enabled:=False;
    ButtonCtrlInsertDep.Enabled:=False;
    ButtonDogIns.Enabled:=false;
    ButtonCtrlInsertCat.Enabled:=False;
  end
  else
  begin
    ButtonOk.Enabled:=true;
    ButtonCtrlInsertDep.Enabled:=true;
    ButtonDogIns.Enabled:=true;
    ButtonCtrlInsertCat.Enabled:=true;
  end;
  PageControlChange(Sender);
end;

procedure TFormTemplet_Main.GridTempletDBTableView1DblClick(
  Sender: TObject);
begin
if (FormStyle=fsNormal) and ButtonOk.Enabled then ButtonOkClick(sender);
end;


procedure TFormTemplet_Main.EditdateBegChange(Sender: TObject);
begin
ButtonRefreshClick(sender)
end;

end.
