unit Gar_MainMarka_Topl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, gr_uCommonLoader,
  gar_MarkaTopl_DM, Gar_MarkaTopl_Edit, gar_Types, ZTypes, ActnList,
  cxGridBandedTableView, gr_uMessage, gr_uCommonConsts, gr_uCommonProc;

type
  TFMainMarkaTopl = class(TForm)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarLargeBtnAdd5Click(Sender: TObject);
    procedure LBtnUpdateClick(Sender: TObject);
    procedure LBtnDeletePaymentClick(Sender: TObject);
    procedure ActionUpateExecute(Sender: TObject);   // ; focus:integer
    procedure ActionUpateExecuteMode(focus:integer);
  private

  public
    PLanguageIndex:integer;
    constructor Create(Param:TgrSimpleParam);reintroduce;
  end;

var  FMainMarkaTopl:TFMainMarkaTopl;

implementation

{$R *.dfm}


constructor TFMainMarkaTopl.Create(Param:TgrSimpleParam);
begin
 DM:=TDM.Create(Param);
 inherited Create(Param.Owner);
 cxGridDBTableView1.DataController.DataSource:=DM.DataSource1;
 PLanguageIndex:=IndexLanguage;
 //RefreshBtn.Enabled:=True;
 //DM.pFIBDataSet1.Close;
 //DM.pFIBDataSet1.Open;
end;

procedure TFMainMarkaTopl.dxBarLargeButton2Click(Sender: TObject);
begin
  Free;
end;

procedure TFMainMarkaTopl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Free;
end;

procedure TFMainMarkaTopl.dxBarLargeBtnAdd5Click(Sender: TObject);
var Param:TgarParamMarkaTopl;
focus:integer;
begin
  Param:=TgarParamMarkaTopl.create;
  Param.fs := garfsInsert;
  focus:=View_FEdit(Param);
  if focus<>0 then ActionUpateExecuteMode(focus);
  Param.Free;
end;

procedure TFMainMarkaTopl.LBtnUpdateClick(Sender: TObject);
var Param:TgarParamMarkaTopl;
begin
  Param:=TgarParamMarkaTopl.create;
  Param.fs := garfsUpdate;
  Param.ID_MARKA_TOPL:= DM.pFIBDataSet1['ID_MARKA_TOPL'];
  Param.MARKA_TOPL:=DM.pFIBDataSet1['NAME_MARKA_TOPL'];
  View_FEdit(Param);
  ActionUpateExecuteMode(Param.ID_MARKA_TOPL);
  Param.Free;
end;

procedure TFMainMarkaTopl.LBtnDeletePaymentClick(Sender: TObject);
var Param:TgarParamMarkaTopl;
begin
  if grShowMessage(Caption_Delete[PLanguageIndex],
                  DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbCancel])=mrYes then
  begin
    Param:=TgarParamMarkaTopl.create;
    Param.fs := garfsDelete;
    Param.ID_MARKA_TOPL:=DM.pFIBDataSet1['ID_MARKA_TOPL'];
    View_FEdit(Param);
    cxGridDBTableView1.DataController.GotoNext;
    ActionUpateExecuteMode(DM.pFIBDataSet1['ID_MARKA_TOPL']);
  end;
end;

procedure TFMainMarkaTopl.ActionUpateExecute(Sender: TObject);
begin
  ActionUpateExecuteMode(DM.pFIBDataSet1['ID_MARKA_TOPL']); //обновить не тер€€ фокуса
end;

procedure TFMainMarkaTopl.ActionUpateExecuteMode(focus:integer);
begin
  DM.pFIBDataSet1.Close;
  DM.pFIBDataSet1.Open;
  DM.pFIBDataSet1.Locate('ID_MARKA_TOPL',focus,[loCaseInsensitive]);
end;

end.
