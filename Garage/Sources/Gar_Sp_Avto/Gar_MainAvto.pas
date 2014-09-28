unit Gar_MainAvto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, gr_uCommonLoader,
  gar_Avto_DM, Gar_Avto_Edit, gar_Types, ZTypes, ActnList,
  cxGridBandedTableView, gr_uMessage, gr_uCommonConsts, gr_uCommonProc,
  cxSplitter, Gar_Edit_EQUIPMENT, gar_GarageProc, cxCalendar, gar_LoadPackageGarage;

type
  TFMainAvto = class(TForm)
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
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDBTableView1DBColumn7: TcxGridDBColumn;
    cxGridDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
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
    Panel2: TPanel;
    Panel3: TPanel;
    dxBarDockControl2: TdxBarDockControl;
    cxGrid2: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    Panel1: TPanel;
    cxSplitter2: TcxSplitter;
    cxGrid1: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2DBColumn1: TcxGridDBColumn;
    cxGridDBTableView2DBColumn2: TcxGridDBColumn;
    cxGridDBTableView2DBColumn3: TcxGridDBColumn;
    cxGridDBTableView2DBColumn4: TcxGridDBColumn;
    cxGridDBTableView2DBColumn5: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    dxBarLargeButton20: TdxBarLargeButton;
    cxGridDBTableView1DBColumn8: TcxGridDBColumn;
    cxGridDBTableView1DBColumn9: TcxGridDBColumn;
    Action1: TAction;
    Action2: TAction;
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
    procedure BtnSaveClick(Sender: TObject);
    procedure dxBarLargeButton13Click(Sender: TObject);
    procedure dxBarLargeButton14Click(Sender: TObject);
    procedure dxBarLargeButton15Click(Sender: TObject);
    procedure dxBarLargeButton18Click(Sender: TObject);
    procedure dxBarLargeButton19Click(Sender: TObject);
    procedure cxGridDBTableView1DBColumn9GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure Action1Execute(Sender: TObject);
  private
    ParamLoc:TgarSimpleParamMode;
    PLanguageIndex:integer;

  public
    Res:Variant;
    constructor Create(Param:TgarSimpleParamMode);reintroduce;
  end;

var  FMainAvto:TFMainAvto;

implementation

{$R *.dfm}


constructor TFMainAvto.Create(Param:TgarSimpleParamMode);
begin
 DM:=TDM.Create(Param);
 inherited Create(Param.Owner);
 PLanguageIndex:=IndexLanguage;
 cxGridDBTableView1.DataController.DataSource:=DM.DataSource1;
 cxGridDBTableView2.DataController.DataSource:=DM.DataSource2;
 cxGridDBTableView3.DataController.DataSource:=DM.DataSource3;
 ParamLoc := Param;
 case ParamLoc.fs of
   garfsEdit: BtnSave.Visible:=ivNever;
   garfsSelect: Begin
                  dxBarLargeBtnAdd5.Enabled:=False;
                  LBtnUpdate.Enabled:=False;
                  LBtnDeletePayment.Enabled:=False;
                  Panel2.Visible:=False;
                  cxSplitter1.Visible:=False;
                end;
    garfsAccept:Begin
                  //
                end;

  end;
 //RefreshBtn.Enabled:=True;
 //DM.pFIBDataSet1.Close;
 //DM.pFIBDataSet1.Open;
end;

procedure TFMainAvto.dxBarLargeButton2Click(Sender: TObject);
begin
  if FMainAvto.FormStyle=fsNormal  then
    begin
      ModalResult:=mrYes;
    end
  else  Free;
end;

procedure TFMainAvto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dxBarLargeButton2Click(Sender);
end;

procedure TFMainAvto.dxBarLargeBtnAdd5Click(Sender: TObject);
var Param:TgarParamAvto;
focus:integer;
begin
  Param:=TgarParamAvto.create;
  Param.fs := garfsInsert;
  focus:=View_FEdit(Param);
  if focus<>0 then ActionUpateExecuteMode(focus);
  Param.Free;
end;

procedure TFMainAvto.LBtnUpdateClick(Sender: TObject);
var Param:TgarParamAvto;
begin
  Param:=TgarParamAvto.create;
  Param.fs := garfsUpdate;
  Param.ID_AVTO:= DM.pFIBDataSet1['ID_AVTO'];
  Param.NAME:=DM.pFIBDataSet1['NAME'];
  Param.NOM_GOS:=DM.pFIBDataSet1['NOM_GOS'];
  Param.NOM_MOTOR:=DM.pFIBDataSet1['NOM_MOTOR'];
  Param.CALC_METOD:=DM.pFIBDataSet1['CALC_METOD'];        
  Param.NOM_KUZ:=DM.pFIBDataSet1['NOM_KUZ'];
  Param.CONSUPTION_BASE:=   DM.pFIBDataSet1['CONSUPTION_BASE'];

  Param.NAME_MARKA_TOPL:=DM.pFIBDataSet1['NAME_MARKA_TOPL'];
  Param.NAME_MODEL:=DM.pFIBDataSet1['NAME_MODEL'];
  
  View_FEdit(Param);
  ActionUpateExecuteMode(Param.ID_AVTO);
  Param.Free;
end;

procedure TFMainAvto.LBtnDeletePaymentClick(Sender: TObject);
var Param:TgarParamAvto;
begin
  if grShowMessage(Caption_Delete[PLanguageIndex],
                  DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbCancel])=mrYes then
  begin
    Param:=TgarParamAvto.create;
    Param.fs := garfsDelete;
    Param.ID_AVTO:=DM.pFIBDataSet1['ID_AVTO'];
    View_FEdit(Param);
    cxGridDBTableView1.DataController.GotoNext;
    ActionUpateExecuteMode(DM.pFIBDataSet1['ID_AVTO']);
  end;
end;

procedure TFMainAvto.ActionUpateExecute(Sender: TObject);
begin
  ActionUpateExecuteMode(DM.pFIBDataSet1['ID_AVTO']); //обновить не теряя фокуса
end;

procedure TFMainAvto.ActionUpateExecuteMode(focus:integer);
begin
  DM.pFIBDataSet1.Close;
  DM.pFIBDataSet1.Open;
  if not DM.pFIBDataSet1.isEmpty then
  begin
    DM.pFIBDataSet2.Open;
    DM.pFIBDataSet3.Open;
    DM.pFIBDataSet1.Locate('ID_AVTO',focus,[loCaseInsensitive]);
  end;
end;

procedure TFMainAvto.BtnSaveClick(Sender: TObject);
begin
  Res:=VarArrayCreate([0,2], varVariant);
  Res[0]:=DM.pFIBDataSet1['ID_AVTO'];
  Res[1]:=DM.pFIBDataSet1['NOM_GOS'];
  Res[2]:=DM.pFIBDataSet1['NAME'];
  dxBarLargeButton2Click(Sender);
end;

procedure TFMainAvto.dxBarLargeButton13Click(Sender: TObject);
var param:TgarParamEQUIPMENT;
begin
  param:=TgarParamEQUIPMENT.Create;
  param.Owner:=ParamLoc.Owner;
  param.DB_Handle:= ParamLoc.DB_Handle;
  param.fs:=garfsInsert;
  if View_FEditEQUIPMENT(param) then
    begin
      DM.pFIBDataSet2.CloseOpen(True);
      DM.pFIBDataSet2.Locate('ID_GAR_EQUIPMENT',param.ID_GAR_EQUIPMENT,[]);
    end;
  param.Free;

end;

procedure TFMainAvto.dxBarLargeButton14Click(Sender: TObject);
var param:TgarParamEQUIPMENT;
id:integer;
begin
  param:=TgarParamEQUIPMENT.Create;
  param.Owner:=ParamLoc.Owner;
  param.DB_Handle:= ParamLoc.DB_Handle;
  param.fs:=garfsUpdate;
  if View_FEditEQUIPMENT(param) then
    begin
      id:=DM.pFIBDataSet2['ID_GAR_EQUIPMENT'];
      DM.pFIBDataSet2.CloseOpen(True);
      DM.pFIBDataSet2.Locate('ID_GAR_EQUIPMENT',id,[]);
    end;
    //DM.pFIBDataSet2.Refresh;
  param.Free;
end;

procedure TFMainAvto.dxBarLargeButton15Click(Sender: TObject);
var id:Integer;
begin
with DM do
  try
    pFIBStoredProc1.Transaction.StartTransaction;
    pFIBStoredProc1.StoredProcName:='GAR_EQUIPMENT_D';
    pFIBStoredProc1.Prepare;
    pFIBStoredProc1.ParamByName('ID_GAR_EQUIPMENT').AsInt64   := pFIBDataSet2['ID_GAR_EQUIPMENT'];
    pFIBStoredProc1.ExecProc;
    pFIBStoredProc1.Transaction.Commit;
    cxGridDBTableView2.Controller.GoToNext(True);
    id:=pFIBDataSet2['ID_GAR_EQUIPMENT'];
    pFIBDataSet2.CloseOpen(True);
    if not pFIBDataSet2.IsEmpty then pFIBDataSet2.Locate('ID_GAR_EQUIPMENT',id,[]);
  except
    on e:Exception do
      begin
        grShowMessage(ECaption[LanguageIndex],e.message,mtError,[mbOk]);
        pFIBStoredProc1.Transaction.RollBack;
      end;
  end;
end;

procedure TFMainAvto.dxBarLargeButton18Click(Sender: TObject);
var factor:variant;
param:TgarSimpleParamMode;
id:Integer;
begin
  param:=TgarSimpleParamMode.Create;
  param.DB_Handle:=ParamLoc.DB_Handle;
  Param.Owner:=self;
  Param.fs:=garfsSelect;
  factor:=LoadPackageGarage(Param, Name_Gar_Sp_Factor);
  if VarArrayDimCount(factor)>0 then
   begin
     if factor[0]<>NULL then
      begin
        with DM do
          try
            pFIBStoredProc1.Transaction.StartTransaction;
            pFIBStoredProc1.StoredProcName:='GAR_AVTO_FACTOR_I';
            pFIBStoredProc1.Prepare;
            pFIBStoredProc1.ParamByName('ID_AVTO').AsInt64  :=    pFIBDataSet1['ID_AVTO'];
            pFIBStoredProc1.ParamByName('ID_FACTOR').AsInt64  := factor[0];
            pFIBStoredProc1.ExecProc;
            id:=pFIBStoredProc1.ParamByName('ID_AVTO_FACTOR').AsInt64;
            pFIBStoredProc1.Transaction.Commit;
            pFIBDataSet3.CloseOpen(True);
            pFIBDataSet3.Locate('ID_AVTO_FACTOR',id,[]);
          except
            on e:Exception do
              begin
                grShowMessage(ECaption[LanguageIndex],e.message,mtError,[mbOk]);
                pFIBStoredProc1.Transaction.RollBack;
              end;
          end;
      end;
   end;
end;

procedure TFMainAvto.dxBarLargeButton19Click(Sender: TObject);
var id:integer;
begin
with DM do
          try
            pFIBStoredProc1.Transaction.StartTransaction;
            pFIBStoredProc1.StoredProcName:='GAR_FACTOR_BY_AVTO_D';
            pFIBStoredProc1.Prepare;
            pFIBStoredProc1.ParamByName('ID_AVTO_FACTOR').AsInt64  :=    pFIBDataSet3['ID_AVTO_FACTOR'];
            pFIBStoredProc1.ExecProc;
            pFIBStoredProc1.Transaction.Commit;
            cxGridDBTableView3.Controller.GoToNext(True);
            id:=pFIBDataSet3['ID_AVTO_FACTOR'];
            pFIBDataSet3.CloseOpen(True);
            if not pFIBDataSet3.IsEmpty then pFIBDataSet3.Locate('ID_AVTO_FACTOR',id,[]);
          except
            on e:Exception do
              begin
                grShowMessage(ECaption[LanguageIndex],e.message,mtError,[mbOk]);
                pFIBStoredProc1.Transaction.RollBack;
              end;
          end;
end;

procedure TFMainAvto.cxGridDBTableView1DBColumn9GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if AText='1' then AText:='по времени'
  else   if AText = '0' then AText:='по пути';
end;

procedure TFMainAvto.Action1Execute(Sender: TObject);
begin
  if (ParamLoc.fs=garfsSelect) and (cxGridDBTableView1.Focused) then BtnSaveClick(Sender);
end;

end.
