unit Gar_MainModel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, gr_uCommonLoader,
  gar_DM, Gar_Model_Edit, gar_Types, ZTypes, ActnList,
  cxGridBandedTableView, gr_uMessage, gr_uCommonConsts, gr_uCommonProc;

type
  TFMainModel = class(TForm)
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
    cxGrid1Payment: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
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
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeBtnAdd5Click(Sender: TObject);
    procedure LBtnUpdateClick(Sender: TObject);
    procedure LBtnDeletePaymentClick(Sender: TObject);
    procedure ActionUpateExecute(Sender: TObject);   // ; focus:integer
    procedure ActionUpateExecuteMode(focus:integer);
  private
    PLanguageIndex:integer;
  public
    constructor Create(Param:TgrSimpleParam);reintroduce;
  end;

var  FMainModel:TFMainModel;

implementation

{$R *.dfm}


constructor TFMainModel.Create(Param:TgrSimpleParam);
begin
 DM:=TDM.Create(Param);
 inherited Create(Param.Owner);
 cxGridDBTableView1.DataController.DataSource:=DM.DataSource1;
 PLanguageIndex:=IndexLanguage;
 //RefreshBtn.Enabled:=True;
 //DM.pFIBDataSet1.Close;
 //DM.pFIBDataSet1.Open;
end;

procedure TFMainModel.dxBarLargeButton2Click(Sender: TObject);
begin
  Free;
end;

procedure TFMainModel.dxBarLargeBtnAdd5Click(Sender: TObject);
var Param:TgarParamModel;
focus:integer;
begin
  Param:=TgarParamModel.create;
  Param.fs := garfsInsert;
  focus:=View_FEdit(Param);
  if focus<>0 then ActionUpateExecuteMode(focus);
  Param.Free;
end;

procedure TFMainModel.LBtnUpdateClick(Sender: TObject);
var Param:TgarParamModel;
begin
  Param:=TgarParamModel.create;
  Param.fs := garfsUpdate;
  Param.Id_Model:= DM.pFIBDataSet1['Id_Model'];
  Param.CONSUPTION_BASE:=DM.pFIBDataSet1['CONSUPTION_BASE'];
  Param.CONSUPTION_BASE_TIME:=DM.pFIBDataSet1['CONSUPTION_BASE_TIME'];
  Param.NameModel:=DM.pFIBDataSet1['Name_Model'];
  Param.Id_Marka:=DM.pFIBDataSet1['Id_Marka'];
  View_FEdit(Param);
  ActionUpateExecuteMode(Param.Id_Model);
  Param.Free;
end;

procedure TFMainModel.LBtnDeletePaymentClick(Sender: TObject);
var Param:TgarParamModel;
begin
  if grShowMessage(Caption_Delete[PLanguageIndex],
                  DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbCancel])=mrYes then
  begin
    Param:=TgarParamModel.create;
    Param.fs := garfsDelete;
    Param.Id_Model:=DM.pFIBDataSet1['Id_Model'];
    View_FEdit(Param);
    cxGridDBTableView1.DataController.GotoNext;
    ActionUpateExecuteMode(DM.pFIBDataSet1['Id_Model']);
  end;
end;

procedure TFMainModel.ActionUpateExecute(Sender: TObject);   
begin
  ActionUpateExecuteMode(DM.pFIBDataSet1['Id_Model']); //обновить не тер€€ фокуса
end;

procedure TFMainModel.ActionUpateExecuteMode(focus:integer);
begin
  DM.pFIBDataSet1.Close;
  DM.pFIBDataSet1.Open;
  DM.pFIBDataSet1.Locate('Id_Model',focus,[loCaseInsensitive]);
end;

end.
