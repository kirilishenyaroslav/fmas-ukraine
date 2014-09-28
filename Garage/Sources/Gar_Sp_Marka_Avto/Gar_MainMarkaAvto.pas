unit Gar_MainMarkaAvto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, gr_uCommonLoader,
  gar_MarkaAvto_DM, Gar_MarkaAvto_Edit, gar_Types, ZTypes, ActnList,
  cxGridBandedTableView, gr_uMessage, gr_uCommonConsts, gr_uCommonProc,gar_Consts;

type
  TFMainMarkaAvto = class(TForm)
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
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeBtnAdd5Click(Sender: TObject);
    procedure LBtnUpdateClick(Sender: TObject);
    procedure LBtnDeletePaymentClick(Sender: TObject);
    procedure ActionUpateExecute(Sender: TObject);   
    procedure ActionUpateExecuteMode(focus:integer);

  private
    PLanguageIndex:integer;
  public
    constructor Create(Param:TgrSimpleParam);reintroduce;
    //PIndexLanguage:integer;
  end;

var  FMainMarkaAvto:TFMainMarkaAvto;

implementation

{$R *.dfm}


constructor TFMainMarkaAvto.Create(Param:TgrSimpleParam);
begin
 DM_Marka_Avto:=TDM_Marka_Avto.Create(Param);
 inherited Create(Param.Owner);
 cxGridDBTableView1.DataController.DataSource:=DM_Marka_Avto.DataSource1;
 PLanguageIndex:=IndexLanguage;

 FMainMarkaAvto.caption    := MainMenuMarkaAvro[PLanguageIndex];
 dxBarLargeBtnAdd5.caption := AddBtnCaption[PLanguageIndex];
 LBtnUpdate.caption        := EditBtnCaption[PLanguageIndex];
 LBtnDeletePayment.caption := DelBtnCaption[PLanguageIndex];
 RefreshBtn.caption        := UpdBtnCaption[PLanguageIndex];
 dxBarLargeButton2.caption := MainMenuExit[PLanguageIndex];

end;

procedure TFMainMarkaAvto.dxBarLargeButton2Click(Sender: TObject);
begin
  Free;
end;

procedure TFMainMarkaAvto.dxBarLargeBtnAdd5Click(Sender: TObject);
var Param:TgarParamMarkaAvto;
focus:integer;
begin
  Param:=TgarParamMarkaAvto.create;
  Param.fs := garfsInsert;
  focus:=View_FEdit(Param);
  if focus<>0 then ActionUpateExecuteMode(focus);
  Param.Free;
end;

procedure TFMainMarkaAvto.LBtnUpdateClick(Sender: TObject);
var Param:TgarParamMarkaAvto;
begin
  Param:=TgarParamMarkaAvto.create;
  Param.fs := garfsUpdate;
  Param.Id_Marka:= DM_Marka_Avto.pFIBDataSet1['ID_MARKA'];
  Param.Country_Provider:=DM_Marka_Avto.pFIBDataSet1['COUNTRY_PROVIDER'];
  Param.NameMarka:=DM_Marka_Avto.pFIBDataSet1['NAME_MARKA'];
  View_FEdit(Param);
  ActionUpateExecuteMode(Param.Id_Marka);
  Param.Free;
end;

procedure TFMainMarkaAvto.LBtnDeletePaymentClick(Sender: TObject);
var Param:TgarParamMarkaAvto;
begin
  if grShowMessage(Caption_Delete[PLanguageIndex],
                  DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbCancel])=mrYes then
  begin
    Param:=TgarParamMarkaAvto.create;
    Param.fs := garfsDelete;
    Param.Id_Marka:=DM_Marka_Avto.pFIBDataSet1['ID_MARKA'];
    View_FEdit(Param);
    cxGridDBTableView1.DataController.GotoNext;
    ActionUpateExecuteMode(DM_Marka_Avto.pFIBDataSet1['ID_MARKA']);
  end;
end;

procedure TFMainMarkaAvto.ActionUpateExecute(Sender: TObject);   // ; focus:integer
begin
  ActionUpateExecuteMode(DM_Marka_Avto.pFIBDataSet1['ID_MARKA']); //обновить не тер€€ фокуса
end;

procedure TFMainMarkaAvto.ActionUpateExecuteMode(focus:integer);
begin
  DM_Marka_Avto.pFIBDataSet1.Close;
  DM_Marka_Avto.pFIBDataSet1.Open;
  DM_Marka_Avto.pFIBDataSet1.Locate('ID_MARKA',focus,[loCaseInsensitive]);
end;

end.
