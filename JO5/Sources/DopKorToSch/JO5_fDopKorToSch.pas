unit JO5_fDopKorToSch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, DB, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, ExtCtrls, StdCtrls, cxButtons, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Jo5_dmCommonStyles, IBase, cxGridBandedTableView, cxGridDBBandedTableView,
  Jo5_Types, Menus, Jo5_Consts, ActnList, Jo5_Proc;

type
  TfDopKorToSch = class(TForm)
    KorTypeRG: TRadioGroup;
    ExitBtn: TcxButton;
    ActionPnl: TPanel;
    DB: TpFIBDatabase;
    DSet1: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    DSource1: TDataSource;
    DetailGrid: TcxGrid;
    DetailGridTV: TcxGridDBBandedTableView;
    cmnGR_SMET_NUM: TcxGridDBBandedColumn;
    cmnGR_SMET_NAME: TcxGridDBBandedColumn;
    cmnSMET_NUM: TcxGridDBBandedColumn;
    cmnSMET_NAME: TcxGridDBBandedColumn;
    cmnRAZD_NUM: TcxGridDBBandedColumn;
    cmnRAZD_NAME: TcxGridDBBandedColumn;
    cmnSTAT_NUM: TcxGridDBBandedColumn;
    cmnSTAT_NAME: TcxGridDBBandedColumn;
    cmnKEKV_NUM: TcxGridDBBandedColumn;
    cmnKEKV_NAME: TcxGridDBBandedColumn;
    cmnSUMMA: TcxGridDBBandedColumn;
    DetailGridLvl: TcxGridLevel;
    DetailPM: TPopupMenu;
    S_SM_GR_NUM: TMenuItem;
    S_SM_GR_TITLE: TMenuItem;
    S_SM_NUM: TMenuItem;
    S_SM_TITLE: TMenuItem;
    S_RZ_NUM: TMenuItem;
    S_RZ_TITLE: TMenuItem;
    S_ST_NUM: TMenuItem;
    S_ST_TITLE: TMenuItem;
    S_KEKV_NUM: TMenuItem;
    S_KEKV_TITLE: TMenuItem;
    ActionList1: TActionList;
    A_SM_GR_NUM: TAction;
    A_SM_GR_TITLE: TAction;
    A_SM_NUM: TAction;
    A_SM_TITLE: TAction;
    A_RZ_NUM: TAction;
    A_RZ_TITLE: TAction;
    A_ST_NUM: TAction;
    A_ST_TITLE: TAction;
    A_KEKV_NUM: TAction;
    A_KEKV_TITLE: TAction;
    ExitAction: TAction;
    procedure KorTypeRGClick(Sender: TObject);
    procedure A_SM_GR_NUMExecute(Sender: TObject);
    procedure A_SM_GR_TITLEExecute(Sender: TObject);
    procedure A_SM_NUMExecute(Sender: TObject);
    procedure A_SM_TITLEExecute(Sender: TObject);
    procedure A_RZ_NUMExecute(Sender: TObject);
    procedure A_RZ_TITLEExecute(Sender: TObject);
    procedure A_ST_NUMExecute(Sender: TObject);
    procedure A_ST_TITLEExecute(Sender: TObject);
    procedure A_KEKV_NUMExecute(Sender: TObject);
    procedure A_KEKV_TITLEExecute(Sender: TObject);
    procedure ExitActionExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    PStylesDM:TStylesDM;
    pParam:TJo5SchKor;
    pLanguageIndex:byte;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE;AParam:TJo5SchKor); reintroduce;
    procedure DSetReOpen;
  end;

  function View_Jo5_DopKorToSch(AOwner:TComponent;AHandle:TISC_DB_HANDLE;AParam:TJo5SchKor):Variant; stdcall;
   exports View_Jo5_DopKorToSch;
implementation

uses Math;

{$R *.dfm}

function View_Jo5_DopKorToSch(AOwner:TComponent;AHandle:TISC_DB_HANDLE;AParam:TJo5SchKor):Variant;
var ViewForm:TfDopKorToSch;
begin
  ViewForm:=TfDopKorToSch.Create(AOwner,AHandle,AParam);
  ViewForm.ShowModal;
  ViewForm.Free;
end;

constructor TfDopKorToSch.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE;AParam:TJo5SchKor);
begin
  inherited Create(AOwner);
  pLanguageIndex:=IndexLanguage;
  pParam:=AParam;
//******************************************************************************
  PStylesDM:=TStylesDM.Create(self);
  DetailGridTV.Styles.StyleSheet:=PStylesDM.GridBandedTableViewStyleSheetDevExpress;
//******************************************************************************
  Caption:=pParam.SchTitle;
  KorTypeRG.Caption  := LabelKorType_Caption[PLanguageIndex];
  KorTypeRG.Items[0] := LabelDbKorType_Caption[PLanguageIndex];
  KorTypeRG.Items[1] := LabelKrKorType_Caption[PLanguageIndex];
  KorTypeRG.Hint     := LabelSelectKorType_Caption[PLanguageIndex];
  ExitAction.Caption := ExitBtn_Caption[PLanguageIndex];
//******************************************************************************
  A_SM_GR_NUM.Caption   := GridClGrSmetaNum_Caption[PLanguageIndex];
  A_SM_GR_TITLE.Caption := GridClGrSmetaName_Caption[PLanguageIndex];
  A_SM_NUM.Caption      := GridClSmetaNum_Caption[PLanguageIndex];
  A_SM_TITLE.Caption    := GridClSmetaName_Caption[PLanguageIndex];
  A_RZ_NUM.Caption      := GridClRazdNum_Caption[PLanguageIndex];
  A_RZ_TITLE.Caption    := GridClRazdName_Caption[PLanguageIndex];
  A_ST_NUM.Caption      := GridClStatNum_Caption[PLanguageIndex];
  A_ST_TITLE.Caption    := GridClStatName_Caption[PLanguageIndex];
  A_KEKV_NUM.Caption    := GridClKekvNum_Caption[PLanguageIndex];
  A_KEKV_TITLE.Caption  := GridClKekvName_Caption[PLanguageIndex];
//******************************************************************************
  cmnGR_SMET_NUM.Caption   := GridClGrSmetaNum_Caption[PLanguageIndex];
  cmnGR_SMET_NAME.Caption  := GridClGrSmetaName_Caption[PLanguageIndex];
  cmnSMET_NUM.Caption      := GridClSmetaNum_Caption[PLanguageIndex];
  cmnSMET_NAME.Caption     := GridClSmetaName_Caption[PLanguageIndex];
  cmnRAZD_NUM.Caption      := GridClRazdNum_Caption[PLanguageIndex];
  cmnRAZD_NAME.Caption     := GridClRazdName_Caption[PLanguageIndex];
  cmnSTAT_NUM.Caption      := GridClStatNum_Caption[PLanguageIndex];
  cmnSTAT_NAME.Caption     := GridClStatName_Caption[PLanguageIndex];
  cmnKEKV_NUM.Caption      := GridClKekvNum_Caption[PLanguageIndex];
  cmnKEKV_NAME.Caption     := GridClKekvName_Caption[PLanguageIndex];
//******************************************************************************
  DB.Handle:=AHandle;
  Transaction.Active:=True;
  DSetReOpen;
end;

procedure TfDopKorToSch.DSetReOpen;
begin
  if DSet1.Active then DSet1.Close;
  DSet1.SQLs.SelectSQL.Text:='SELECT * FROM JO5_GET_OUT_SALDO_DETAIL('
                             +IntToStr(pParam.IdSch)+','''+DateToStr(pParam.SelDate)+''')';
  DSet1.Open;
  KorTypeRGClick(Self);
end;

procedure TfDopKorToSch.KorTypeRGClick(Sender: TObject);
begin
  if KorTypeRG.ItemIndex=1 then
    cmnSUMMA.DataBinding.FieldName:='OUT_KR_OBOROT'
  else
    cmnSUMMA.DataBinding.FieldName:='OUT_DB_OBOROT';
end;

procedure TfDopKorToSch.A_SM_GR_NUMExecute(Sender: TObject);
begin
  if cmnGR_SMET_NUM.GroupIndex<0 then
  cmnGR_SMET_NUM.Visible:= not cmnGR_SMET_NUM.Visible
  else A_SM_GR_NUM.Checked:=True;
end;

procedure TfDopKorToSch.A_SM_GR_TITLEExecute(Sender: TObject);
begin
  if cmnGR_SMET_NAME.GroupIndex<0 then
  cmnGR_SMET_NAME.Visible:= not cmnGR_SMET_NAME.Visible
  else A_SM_GR_TITLE.Checked:=True;
end;

procedure TfDopKorToSch.A_SM_NUMExecute(Sender: TObject);
begin
  if cmnSMET_NUM.GroupIndex<0 then
  cmnSMET_NUM.Visible:= not cmnSMET_NUM.Visible
  else A_SM_NUM.Checked:=True;
end;

procedure TfDopKorToSch.A_SM_TITLEExecute(Sender: TObject);
begin
  if cmnSMET_NAME.GroupIndex<0 then
  cmnSMET_NAME.Visible:= not cmnSMET_NAME.Visible
  else A_SM_TITLE.Checked:=True;
end;

procedure TfDopKorToSch.A_RZ_NUMExecute(Sender: TObject);
begin
  if cmnRAZD_NUM.GroupIndex<0 then
  cmnRAZD_NUM.Visible:= not cmnRAZD_NUM.Visible
  else A_RZ_NUM.Checked:=True;
end;

procedure TfDopKorToSch.A_RZ_TITLEExecute(Sender: TObject);
begin
  if cmnRAZD_NAME.GroupIndex<0 then
  cmnRAZD_NAME.Visible:= not cmnRAZD_NAME.Visible
  else A_RZ_TITLE.Checked:=True;
end;

procedure TfDopKorToSch.A_ST_NUMExecute(Sender: TObject);
begin
  if cmnSTAT_NUM.GroupIndex<0 then
  cmnSTAT_NUM.Visible:= not cmnSTAT_NUM.Visible
  else A_ST_NUM.Checked:=True;
end;

procedure TfDopKorToSch.A_ST_TITLEExecute(Sender: TObject);
begin
  if cmnSTAT_NAME.GroupIndex<0 then
  cmnSTAT_NAME.Visible:= not cmnSTAT_NAME.Visible
  else A_ST_TITLE.Checked:=True;
end;

procedure TfDopKorToSch.A_KEKV_NUMExecute(Sender: TObject);
begin
  if cmnKEKV_NUM.GroupIndex<0 then
  cmnKEKV_NUM.Visible:= not cmnKEKV_NUM.Visible
  else A_KEKV_NUM.Checked:=True;
end;

procedure TfDopKorToSch.A_KEKV_TITLEExecute(Sender: TObject);
begin
  if cmnSTAT_NAME.GroupIndex<0 then
  cmnKEKV_NAME.Visible:= not cmnKEKV_NAME.Visible
  else A_KEKV_TITLE.Checked:=True;
end;

procedure TfDopKorToSch.ExitActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TfDopKorToSch.FormResize(Sender: TObject);
begin
  if Width<300 then Width:=300;
  KorTypeRG.Width:=Width-140;
  ExitBtn.Left   :=Width-130;
end;

end.
