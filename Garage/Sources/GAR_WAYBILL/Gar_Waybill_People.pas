unit Gar_Waybill_People;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, gr_uCommonLoader,
  gar_People_DM, Gar_Peoplel_Edit, gar_Types, ZTypes, ActnList,
  cxGridBandedTableView;

type
  TFMainPeople = class(TForm)
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
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarLargeBtnAdd5Click(Sender: TObject);
    procedure LBtnUpdateClick(Sender: TObject);
    procedure LBtnDeletePaymentClick(Sender: TObject);
    procedure ActionUpateExecute(Sender: TObject);   // ; focus:integer
    procedure ActionUpateExecuteMode(focus:integer);
  private

  public
    constructor Create(Param:TgrSimpleParam);reintroduce;
  end;

var  FMainPeople:TFMainPeople;

implementation

{$R *.dfm}


constructor TFMainPeople.Create(Param:TgrSimpleParam);
begin
 DM:=TDM.Create(Param);
 inherited Create(Param.Owner);
 cxGridDBTableView1.DataController.DataSource:=DM.DataSource1;
end;

procedure TFMainPeople.dxBarLargeButton2Click(Sender: TObject);
begin
  Free;
end;

procedure TFMainPeople.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Free;
end;

procedure TFMainPeople.dxBarLargeBtnAdd5Click(Sender: TObject);
var Param:TgarParamPeople;
focus:integer;
begin
  Param:=TgarParamPeople.create;
  Param.fs := zcfsInsert;
  Param.DB_Handle:=DM.DB.Handle;
  focus:=View_FEdit(Param);
  if focus<>0 then ActionUpateExecuteMode(focus);
  Param.Free;
end;

procedure TFMainPeople.LBtnUpdateClick(Sender: TObject);
var Param:TgarParamPeople;
begin
  Param:=TgarParamPeople.create;
  Param.fs := zcfsUpdate;
  Param.DB_Handle:=DM.DB.Handle;
  Param.ParamEditBtn.id_man:= DM.pFIBDataSet1['id_man'];
  Param.ParamEditBtn.Tn:=DM.pFIBDataSet1['Tn'];
  Param.ParamEditBtn.Caption:=DM.pFIBDataSet1['FIO'];
  Param.Dolgnost:=DM.pFIBDataSet1['post'];
  View_FEdit(Param);
  ActionUpateExecuteMode(Param.ParamEditBtn.Id_Man);
  Param.Free;
end;

procedure TFMainPeople.LBtnDeletePaymentClick(Sender: TObject);
var Param:TgarParamPeople;
begin
  Param:=TgarParamPeople.create;
  Param.fs := zcfsDelete;
  Param.ParamEditBtn.id_man:=DM.pFIBDataSet1['Id_Man'];
  View_FEdit(Param);
  cxGridDBTableView1.DataController.GotoNext;
  ActionUpateExecuteMode(DM.pFIBDataSet1['Id_Man']);
end;

procedure TFMainPeople.ActionUpateExecute(Sender: TObject);
begin
  ActionUpateExecuteMode(DM.pFIBDataSet1['Id_Man']); //обновить не тер€€ фокуса
end;

procedure TFMainPeople.ActionUpateExecuteMode(focus:integer);
begin
  DM.pFIBDataSet1.Close;
  DM.pFIBDataSet1.Open;
  DM.pFIBDataSet1.Locate('Id_Man',focus,[loCaseInsensitive]);
end;

end.
