unit gar_SP_FACTOR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxBar, dxBarExtItems, gar_FACTOR_DM,
  gar_Types, gar_FACTOR_EDIT, cxGridBandedTableView;

type
  TFFactor = class(TForm)
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
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton13: TdxBarLargeButton;
    dxBarLargeButton14: TdxBarLargeButton;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarLargeButton16: TdxBarLargeButton;
    dxBarLargeButton17: TdxBarLargeButton;
    dxBarLargeButton18: TdxBarLargeButton;
    dxBarLargeButton19: TdxBarLargeButton;
    dxBarGroup1: TdxBarGroup;
    cxGrid2: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshBtnClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    Res:variant;
    constructor create(Param:TgarSimpleParamMode); reintroduce;

    { Public declarations }
  end;

var
  FFactor: TFFactor;

implementation

{$R *.dfm}

{ TFFactor }

constructor TFFactor.create(Param: TgarSimpleParamMode);
begin
  DM:=TDM.Create(Param);
  inherited create(Param.owner);
  cxGridDBTableView3.DataController.DataSource:=DM.DataSource1;
  //FFactor.WindowState:=wsNormal;
  case Param.fs of
    garfsSelect:
                begin
                  dxBarLargeBtnAdd5.Visible:=ivNever;
                  LBtnUpdate.Visible:=ivNever;
                  LBtnDeletePayment.Visible:=ivNever;
                  RefreshBtn.Visible:=ivNever;
                end;
    garfsInsert:
                begin
                  BtnSave.Visible:=ivNever;
                end
  end;


end;

procedure TFFactor.dxBarLargeButton2Click(Sender: TObject);
begin
  if FFactor.FormStyle=fsNormal  then
    begin
      ModalResult:=mrYes;
      close;
    end
  else  if FFactor.FormStyle=fsMDIChild then
    close;
end;

procedure TFFactor.dxBarLargeBtnAdd5Click(Sender: TObject);
var Param:TgarParamFactor;
//focus:integer;
begin
  Param:=TgarParamFactor.create;
  Param.fs := garfsInsert;
  Param.DB_Handle:=DM.DB.Handle;
  Param.Owner:=Self;
  View_FFACTOR_EDIT(Param);
  //focus:=View_FEdit(Param);
  //if focus<>0 then ActionUpateExecuteMode(focus);
  Param.Free;
  RefreshBtnClick(Sender);
end;

procedure TFFactor.LBtnUpdateClick(Sender: TObject);
var Param:TgarParamFactor;
//focus:integer;
begin
  Param:=TgarParamFactor.create;
  Param.fs := garfsUpdate;
  Param.DB_Handle:=DM.DB.Handle;
  Param.Owner:=Self;
  View_FFACTOR_EDIT(Param);
  //focus:=View_FEdit(Param);
  //if focus<>0 then ActionUpateExecuteMode(focus);
  Param.Free;
  RefreshBtnClick(Sender);
end;

procedure TFFactor.LBtnDeletePaymentClick(Sender: TObject);
var Param:TgarParamFactor;
//focus:integer;
begin
  Param:=TgarParamFactor.create;
  Param.fs := garfsDelete;
  Param.DB_Handle:=DM.DB.Handle;
  Param.Owner:=Self;
  View_FFACTOR_EDIT(Param);
  //focus:=View_FEdit(Param);
  //if focus<>0 then ActionUpateExecuteMode(focus);
  Param.Free;
  RefreshBtnClick(Sender);
end;

procedure TFFactor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFFactor.RefreshBtnClick(Sender: TObject);
begin
  DM.pFIBDataSet1.CloseOpen(True);
end;

procedure TFFactor.BtnSaveClick(Sender: TObject);
begin
  Res:=VarArrayCreate([0,2], varVariant);
  Res[0]:=DM.pFIBDataSet1['ID_FACTOR'];
  Res[1]:=DM.pFIBDataSet1['NAME'];
  Res[2]:=DM.pFIBDataSet1['VALUE_FACTOR'];
  dxBarLargeButton2Click(Sender);
end;

end.
