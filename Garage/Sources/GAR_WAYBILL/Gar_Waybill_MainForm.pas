unit Gar_Waybill_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, gr_uCommonLoader,
  gar_Waybill_DM, Gar_Waybilll_Edit, gar_Types, ZTypes, ActnList,
  cxGridBandedTableView, gr_uMessage, gr_uCommonConsts, gr_uCommonProc,
  cxCalendar, cxSplitter, cxLabel, cxMaskEdit, cxDBEdit, Gar_Waybilll_Filter,
  dxStatusBar;

type
  TFMainWayBill = class(TForm)
    BarManager: TdxBarManager;
    DeleteBtn: TdxBarLargeButton;
    AddManBtn: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeBtnAdd5: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    LBtnUpdate: TdxBarLargeButton;
    LBtnDeletePayment: TdxBarLargeButton;
    BtnSave: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    dxBarGroup1: TdxBarGroup;
    ActionList1: TActionList;
    ActionUpate: TAction;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridDBTableView1DBColumn7: TcxGridDBColumn;
    cxGridDBTableView1DBColumn13: TcxGridDBColumn;
    cxGridDBTableView1DBColumn15: TcxGridDBColumn;
    cxGridDBTableView1DBColumn16: TcxGridDBColumn;
    cxGrid2: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    cxSplitter1: TcxSplitter;
    cxGridDBTableView1DBColumn8: TcxGridDBColumn;
    Panel1: TPanel;
    DBMaskEditPost: TcxDBMaskEdit;
    cxDBMaskEdit1: TcxDBMaskEdit;
    LabelPost: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxDBMaskEdit3: TcxDBMaskEdit;
    cxLabel3: TcxLabel;
    cxDBMaskEdit2: TcxDBMaskEdit;
    cxDBMaskEdit4: TcxDBMaskEdit;
    cxDBMaskEdit5: TcxDBMaskEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxDBMaskEdit6: TcxDBMaskEdit;
    cxDBMaskEdit7: TcxDBMaskEdit;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxDBMaskEdit8: TcxDBMaskEdit;
    cxDBMaskEdit9: TcxDBMaskEdit;
    cxLabel10: TcxLabel;
    cxDBMaskEdit10: TcxDBMaskEdit;
    cxLabel11: TcxLabel;
    cxDBMaskEdit11: TcxDBMaskEdit;
    dxBarLargeButton5: TdxBarLargeButton;
    dxStatusBar2: TdxStatusBar;
    cxDBMaskEdit12: TcxDBMaskEdit;
    cxDBMaskEdit14: TcxDBMaskEdit;
    cxDBMaskEdit15: TcxDBMaskEdit;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxDBMaskEdit13: TcxDBMaskEdit;
    cxGridDBTableView1DBColumn9: TcxGridDBColumn;
    cxLabel16: TcxLabel;
    cxDBMaskEdit16: TcxDBMaskEdit;
    cxLabel17: TcxLabel;
    cxDBMaskEdit17: TcxDBMaskEdit;
    cxLabel18: TcxLabel;
    cxDBMaskEdit18: TcxDBMaskEdit;
    cxGridDBTableView1DBColumn10: TcxGridDBColumn;
    Styles: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
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
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBTableView2DBColumn1: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableView2DBColumn2: TcxGridDBColumn;
    cxGridDBTableView2DBColumn3: TcxGridDBColumn;
    Action1: TAction;
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarLargeBtnAdd5Click(Sender: TObject);
    procedure LBtnUpdateClick(Sender: TObject);
    procedure LBtnDeletePaymentClick(Sender: TObject);
    procedure ActionUpateExecute(Sender: TObject);   // ; focus:integer
    procedure ActionUpateExecuteMode(focus:integer);
    procedure cxGridDBTableView1DBColumn16GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure cxGridDBTableView1DBColumn9GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxGridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGridDBTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure Action1Execute(Sender: TObject);
  private
    PLanguageIndex:integer;
    id_driver:integer;
  public
    constructor Create(Param:TgarParamWaybillFilter);reintroduce;
  end;

var  FMainWayBill:TFMainWayBill;

implementation

uses Math, StrUtils;

{$R *.dfm}


constructor TFMainWayBill.Create(Param:TgarParamWaybillFilter);
begin
 DM:=TDM.Create(Param);
 try
 inherited Create(Param.Owner);
 except
 end;
 PLanguageIndex:=IndexLanguage;
 id_driver:=0;
 cxGridDBTableView1.DataController.DataSource:=DM.DataSource1;
 cxGridDBTableView3.DataController.DataSource:=DM.DataSource2;
 cxGridDBTableView2.DataController.DataSource:=DM.DataSource3;
 cxDBMaskEdit12.DataBinding.DataSource:=DM.DataSource1;
 cxDBMaskEdit13.DataBinding.DataSource:=DM.DataSource1;
 cxDBMaskEdit14.DataBinding.DataSource:=DM.DataSource1;
 cxDBMaskEdit15.DataBinding.DataSource:=DM.DataSource1;
 cxDBMaskEdit16.DataBinding.DataSource:=DM.DataSource1;

 cxDBMaskEdit12.DataBinding.DataField:='MILAGE';
 //cxDBMaskEdit13.DataBinding.DataField:='MILAGE';
 cxDBMaskEdit14.DataBinding.DataField:='FACT_RASH';
 //cxDBMaskEdit15.DataBinding.DataField:='MILAGE';
 cxDBMaskEdit16.DataBinding.DataField:='WORK_TIME';

 cxDBMaskEdit7.DataBinding.DataSource:=DM.DataSource1;
 cxDBMaskEdit6.DataBinding.DataSource:=DM.DataSource1;
 cxDBMaskEdit17.DataBinding.DataSource:=DM.DataSource1;
 cxDBMaskEdit18.DataBinding.DataSource:=DM.DataSource1;
 DBMaskEditPost.DataBinding.DataSource:=DM.DataSource1;

 cxDBMaskEdit7.DataBinding.DataField:='Time_Beg';
 cxDBMaskEdit6.DataBinding.DataField:='Time_End';
 cxDBMaskEdit17.DataBinding.DataField:='SERIES_OUT';
 cxDBMaskEdit18.DataBinding.DataField:='NOMBER_OUT';
 DBMaskEditPost.DataBinding.DataField:='KOLONA';

 cxDBMaskEdit5.DataBinding.DataSource:=DM.DataSource1;
 cxDBMaskEdit4.DataBinding.DataSource:=DM.DataSource1;
 cxDBMaskEdit10.DataBinding.DataSource:=DM.DataSource1;
 cxDBMaskEdit1.DataBinding.DataSource:=DM.DataSource1;
 cxDBMaskEdit2.DataBinding.DataSource:=DM.DataSource1;

 cxDBMaskEdit5.DataBinding.DataField:='PRICEP1';
 cxDBMaskEdit4.DataBinding.DataField:='Pricep2';
 cxDBMaskEdit10.DataBinding.DataField:='ORDER_TASK_TXT';
 cxDBMaskEdit1.DataBinding.DataField:='TempC';
 cxDBMaskEdit1.DataBinding.DataField:='PROSTOI';

 cxDBMaskEdit11.DataBinding.DataSource:=DM.DataSource1;
 cxDBMaskEdit8.DataBinding.DataSource:=DM.DataSource1;
 cxDBMaskEdit3.DataBinding.DataSource:=DM.DataSource1;
 cxDBMaskEdit9.DataBinding.DataSource:=DM.DataSource1;

 cxDBMaskEdit11.DataBinding.DataField:='RES_WORK_AVTO_WITH_PRICEP';
 cxDBMaskEdit8.DataBinding.DataField:='WAYPEOPLE_TXT';
 cxDBMaskEdit3.DataBinding.DataField:='Work_mode';
 cxDBMaskEdit9.DataBinding.DataField:='TASK_DRIVER_TXT';

 cxGridDBTableView1.Controller.GoToFirst;
end;

procedure TFMainWayBill.dxBarLargeButton2Click(Sender: TObject);
begin
  Free;
end;

procedure TFMainWayBill.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Free;
end;

procedure TFMainWayBill.dxBarLargeBtnAdd5Click(Sender: TObject);
var Param:TgarParamWaybill;
focus:integer;
begin
  Param:=TgarParamWaybill.create;
  Param.fs := garfsInsert;
  Param.DB_Handle:=DM.DB.Handle;
  Param.Owner:=Self;
  focus:=View_FEdit(Param);
  if focus<>0 then ActionUpateExecuteMode(focus);
  Param.Free;
end;

procedure TFMainWayBill.LBtnUpdateClick(Sender: TObject);
var Param:TgarParamWaybill;
begin
  Param:=TgarParamWaybill.create;
  Param.fs := garfsUpdate;
  Param.DB_Handle:=DM.DB.Handle;
  Param.Owner:= Self;

  Param.ID_Waybill         :=DM.pFIBDataSet1['ID_Waybill'];
  Param.ID_FORMA           :=DM.pFIBDataSet1['ID_FORMA_OUT'];
  Param.ParamPeople.id     :=DM.pFIBDataSet1['ID_MAN_OUT'];
  Param.ParamPeople.Caption:=DM.pFIBDataSet1['FIO'];
  Param.ParamPeople.tn     :=VarToStrDef(DM.pFIBDataSet1['TN'],'');
  Param.ParamAvto.id       :=DM.pFIBDataSet1['ID_AVTO_OUT'];
  Param.ParamAvto.Caption  :=DM.pFIBDataSet1['NAME_AVTO'];
  Param.ParamAvto.Tn       :=VarToStrDef(DM.pFIBDataSet1['NOM_GOS'],'');

  Param.DATE_BEG           :=DM.pFIBDataSet1['DATE_BEG_OUT'];
  Param.DATE_END           :=DM.pFIBDataSet1['DATE_END_OUT'];
  Param.TIME_BEG           :=DM.pFIBDataSet1['TIME_BEG'];
  Param.TIME_END           :=DM.pFIBDataSet1['TIME_END'];
  Param.ID_TOPL            :=DM.pFIBDataSet1['ID_TOPL'];
  Param.TOPL_COUNT_BEG     :=DM.pFIBDataSet1['TOPL_COUNT_BEG'];
  Param.TOPL_COUNT_END     :=DM.pFIBDataSet1['TOPL_COUNT_END'];
  Param.TOPL_COUNT         :=DM.pFIBDataSet1['TOPL_COUNT'];
  Param.SPIDOMETR_BEG      :=DM.pFIBDataSet1['SPIDOMETR_BEG'];
  Param.SPIDOMETR_END      :=DM.pFIBDataSet1['SPIDOMETR_END'];
  Param.SERIES             :=DM.pFIBDataSet1['SERIES_OUT'];
  Param.NOMBER             :=DM.pFIBDataSet1['NOMBER_OUT'];
  Param.ID_KOLONA          :=1; //DM.pFIBDataSet1['KOLONA'];
  Param.KOLONA             :=DM.pFIBDataSet1['KOLONA'];
  Param.ID_WORK_MODE       :=DM.pFIBDataSet1['ID_WORK_MODE'];
  Param.WORK_TIME          :=DM.pFIBDataSet1['WORK_TIME'];
  Param.CALC_METOD          :=DM.pFIBDataSet1['CALC_METOD'];

  Param.PRICEP1:=                   VarToStrDef(DM.pFIBDataSet1['PRICEP1'],'');
  Param.PRICEP2:=                   VarToStrDef(DM.pFIBDataSet1['PRICEP2'],'');
  Param.WAYPEOPLE_TXT:=             VarToStrDef(DM.pFIBDataSet1['WAYPEOPLE_TXT'],'');
  Param.TASK_DRIVER_TXT:=           VarToStrDef(DM.pFIBDataSet1['TASK_DRIVER_TXT'],'');
  Param.ORDER_TASK_TXT:=            VarToStrDef(DM.pFIBDataSet1['ORDER_TASK_TXT'],'');
  Param.RES_WORK_AVTO_WITH_PRICEP:= VarToStrDef(DM.pFIBDataSet1['RES_WORK_AVTO_WITH_PRICEP'],'');
                              //VarIsNull
  If DM.pFIBDataSet1['PROSTOI']<>Null then
    Param.PROSTOI := DM.pFIBDataSet1['PROSTOI']
  else Param.PROSTOI :=-1;
  If DM.pFIBDataSet1['tempc']<>Null then
    Param.tempc := DM.pFIBDataSet1['tempc']
  else Param.tempc :=-1;


  View_FEdit(Param);
  ActionUpateExecuteMode(Param.ID_Waybill);
  Param.Free;
end;

procedure TFMainWayBill.LBtnDeletePaymentClick(Sender: TObject);
var Param:TgarParamWaybill;
begin
  if grShowMessage(Caption_Delete[PLanguageIndex],
                  DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbCancel])=mrYes then
  begin
    Param:=TgarParamWaybill.create;
    Param.fs := garfsDelete;
    Param.ID_Waybill:=DM.pFIBDataSet1['ID_Waybill'];
    View_FEdit(Param);
    cxGridDBTableView1.DataController.GotoNext;
    ActionUpateExecuteMode(DM.pFIBDataSet1['ID_Waybill']);
  end;
end;

procedure TFMainWayBill.ActionUpateExecute(Sender: TObject);
begin
  ActionUpateExecuteMode(DM.pFIBDataSet1['ID_WAYBILL']); //обновить не теряя фокуса
end;

procedure TFMainWayBill.ActionUpateExecuteMode(focus:integer);
begin
  DM.pFIBDataSet1.Close;
  DM.pFIBDataSet1.Open;
  DM.pFIBDataSet1.Locate('ID_WAYBILL',focus,[loCaseInsensitive]);
  DM.pFIBDataSet2.Close;
  DM.pFIBDataSet2.Open;
  DM.pFIBDataSet3.Close;
  DM.pFIBDataSet3.Open;
end;

procedure TFMainWayBill.cxGridDBTableView1DBColumn16GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if AText='3' then AText:='№3'
  else   if AText = '2' then AText:='№2';
end;

procedure TFMainWayBill.dxBarLargeButton5Click(Sender: TObject);
begin
  ParamWaybillFilter.Owner:=self;
  ParamWaybillFilter.fs:=garfsUpdate;
  if  View_FFilter(ParamWaybillFilter) then
  begin
    DM.pFIBDataSet1.Close;

    DM.pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_BY_PARAM_S('''+VarToStrDef(ParamWaybillFilter.DATE_BEG,'01.01.1995')+
    ''','''+VarToStrDef(ParamWaybillFilter.DATE_END,'31.12.2050')+''','''+ParamWaybillFilter.SERIES+''','+
    varToStrDef(ParamWaybillFilter.NOMBER,'NULL')+','+IntToStr(ParamWaybillFilter.ParamAvto.id)+','
    +IntToStr(ParamWaybillFilter.ParamPeople.id)+','+IntToStr(ParamWaybillFilter.id_forma)+')';
    DM.pFIBDataSet1.Open;

    DM.pFIBDataSet2.Close;
    //DM.pFIBDataSet2.SQLs.SelectSQL.Text:='SELECT * FROM GAR_FACTOR_BY_WAYBILL_S(:ID_WAYBILL)';
    DM.pFIBDataSet2.Open;

    DM.pFIBDataSet3.Close;
    //DM.pFIBDataSet2.SQLs.SelectSQL.Text:='SELECT * FROM GAR_FACTOR_BY_WAYBILL_S(:ID_WAYBILL)';
    DM.pFIBDataSet3.Open;
  end;

end;

procedure TFMainWayBill.cxGridDBTableView1DBColumn9GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if AText='1' then AText:='по времени'
  else   if AText = '0' then AText:='по пути';
end;

procedure TFMainWayBill.cxGridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if DM.pFIBDataSet1['CALC_METOD']=1 then
  begin
    cxDBMaskEdit13.DataBinding.DataField:='CONSUPTION_BASE_TIME';
    cxDBMaskEdit15.DataBinding.DataField:='NORM_RASH_TIME';
    cxLabel12.Caption:='Расход в час';
  end
 else
  begin
    cxDBMaskEdit13.DataBinding.DataField:='CONSUPTION_BASE';
    cxDBMaskEdit15.DataBinding.DataField:='NORM_RASH';
    cxLabel12.Caption:='Расход на 100 км';
  end;

if DM.pFIBDataSet1['CLOSE_WAYBILL']=0 then
  begin
    //dxBarLargeBtnAdd5.Enabled:=False;
    LBtnUpdate.Enabled:=False;
    LBtnDeletePayment.Enabled:=False;
  end
else
  begin
    //dxBarLargeBtnAdd5.Enabled:=True;
    LBtnUpdate.Enabled:=True;
    LBtnDeletePayment.Enabled:=True;
  end

end;

procedure TFMainWayBill.cxGridDBTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if DM.pFIBDataSet1['CLOSE_WAYBILL']=0 then AStyle:=cxStyle27;
end;

procedure TFMainWayBill.Action1Execute(Sender: TObject);
begin



    //VarToStr(ParamWaybillFilter.ParamPeople.id)
    if id_driver=0 then
    begin
      if  DM.pFIBDataSet1.IsEmpty then exit;
      id_driver:=DM.pFIBDataSet1['ID_MAN_OUT'];
      DM.pFIBDataSet1.Close;
      DM.pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_BY_PARAM_S('''+VarToStrDef(ParamWaybillFilter.DATE_BEG,'01.01.1995')+
      ''','''+VarToStrDef(ParamWaybillFilter.DATE_END,'31.12.2050')+''','''+ParamWaybillFilter.SERIES+''','+
      varToStrDef(ParamWaybillFilter.NOMBER,'NULL')+','+IntToStr(ParamWaybillFilter.ParamAvto.id)+','
      +IntToStr(id_driver)+','+IntToStr(ParamWaybillFilter.id_forma)+')';
      id_driver:=1;
    end
    else
    begin
      DM.pFIBDataSet1.Close;
      DM.pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_BY_PARAM_S('''+VarToStrDef(ParamWaybillFilter.DATE_BEG,'01.01.1995')+
      ''','''+VarToStrDef(ParamWaybillFilter.DATE_END,'31.12.2050')+''','''+ParamWaybillFilter.SERIES+''','+
      varToStrDef(ParamWaybillFilter.NOMBER,'NULL')+','+IntToStr(ParamWaybillFilter.ParamAvto.id)+','
      +VarToStr(ParamWaybillFilter.ParamPeople.id)+','+IntToStr(ParamWaybillFilter.id_forma)+')';
      id_driver:=0;
    end;
    
    if not DM.pFIBDataSet1.active then DM.pFIBDataSet1.Open;

    DM.pFIBDataSet2.Close;
    //DM.pFIBDataSet2.SQLs.SelectSQL.Text:='SELECT * FROM GAR_FACTOR_BY_WAYBILL_S(:ID_WAYBILL)';
    DM.pFIBDataSet2.Open;

    DM.pFIBDataSet3.Close;
    //DM.pFIBDataSet2.SQLs.SelectSQL.Text:='SELECT * FROM GAR_FACTOR_BY_WAYBILL_S(:ID_WAYBILL)';
    DM.pFIBDataSet3.Open;
end;

end.
