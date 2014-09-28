unit UPriceSmet_ex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, ComCtrls, ToolWin, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ImgList, FIBDataSet, pFIBDataSet,
  pFibStoredProc, FIBDatabase, pFIBDatabase, RxMemDS, iBase, ActnList,
  dxBar, dxBarExtItems, cxTL, FIBQuery, pFIBQuery, cn_Common_Messages, cnConsts,
  cn_common_funcs, BaseTypes, cxCalendar;

type
  TfrmGetValueSmet_ex = class(TForm)
    Panel2: TPanel;
    DataSource: TDataSource;
    DataSet_Read: TpFIBDataSet;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    PrintButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    ActionList2: TActionList;
    act_Refresh: TAction;
    act_exit: TAction;
    act_edit: TAction;
    act_add: TAction;
    act_del: TAction;
    ImageList1: TImageList;
    LargeImages: TImageList;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    testColorStyle: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    smettable: TcxGridDBColumn;
    Razdeltable: TcxGridDBColumn;
    stattable: TcxGridDBColumn;
    kekvtable: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    SProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    procedure act_exitExecute(Sender: TObject);
    procedure act_RefreshExecute(Sender: TObject);
    procedure refresh;
    procedure FormShow(Sender: TObject);
    procedure act_addExecute(Sender: TObject);
    procedure act_editExecute(Sender: TObject);
    procedure act_delExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function Checkdata:boolean;
    procedure RepairSmInfo;
  public
    aHandle:TISC_DB_HANDLE;
    id_price_param:Int64;
    PLanguageIndex:integer;
    constructor Create(aOwner:TComponent;pHandle:TISC_DB_HANDLE;pid_price_param:int64);overload;
  end;

implementation

uses uAdd_Edit_ex, UParamsReestr_ex;

{$R *.dfm}

constructor TfrmGetValueSmet_ex.Create(aOwner:TComponent;pHandle:TISC_DB_HANDLE;pid_price_param:int64);
begin
     inherited Create(AOwner);
     aHandle:=pHandle;
     Id_price_param:=pid_price_param;
end;

function TfrmGetValueSmet_ex.Checkdata: boolean;
begin
end;

procedure TfrmGetValueSmet_ex.RepairSmInfo;
begin
end;

procedure TfrmGetValueSmet_ex.act_exitExecute(Sender: TObject);
begin
  close;
end;

Procedure TfrmGetValueSmet_ex.refresh;
Begin
  DataSet_Read.close;
  DataSet_Read.SQLs.SelectSQL.Text:='SELECT * FROM CN_DT_PRICE_SMET_SELECT(:ID_PRICE_PARAM)';
  DataSet_Read.ParamByName('ID_PRICE_PARAM').AsInt64:=id_price_param;
  DataSet_Read.Open;
End;

procedure TfrmGetValueSmet_ex.act_RefreshExecute(Sender: TObject);
begin
  refresh;
end;

procedure TfrmGetValueSmet_ex.FormShow(Sender: TObject);
begin
  refresh;
end;

procedure TfrmGetValueSmet_ex.act_addExecute(Sender: TObject);
Var
  T:TfrmAdd_Edit;
  id:int64;
begin
  T:=TfrmAdd_Edit.create(Self,aHandle);
  T.is_add:=True;
  T.ShowModal;
  If t.ModalResult=mrOk then
   Begin
    WriteTransaction.StartTransaction;
    SProc.StoredProcName:='CN_DT_PRICE_SMET_INSERT';
    SProc.Prepare;
    Sproc.ParamByName('ID_PRICE_PARAM').AsInt64:=id_price_param;
    SProc.ParamByName('ID_SM').AsInt64:=T.ID_SMETA;
    SProc.ParamByName('ID_RZ').AsInt64:=T.ID_RAZDEL;
    SProc.ParamByName('ID_ST').AsInt64:=T.ID_STAT;
    SProc.ParamByName('ID_KEKV').AsInt64:=T.ID_KEKV;
    SProc.ExecProc;
    Try
     WriteTransaction.Commit;
     except
      WriteTransaction.Rollback;
    End;
    refresh;
    DataSet_Read.Locate('ID_PRICE_PARAM',id_price_param,[]);
   End;
  T.Free;
end;

procedure TfrmGetValueSmet_ex.act_editExecute(Sender: TObject);
Var
  T:TfrmAdd_Edit;
  id:int64;
  smeta_kod,razdel_kod,stat_kod,kekv_kod:integer;
begin
  If DataSet_Read.RecordCount=0 then exit;

  T:=TfrmAdd_Edit.create(self,aHandle);
  If DataSet_read['Smet']<> null   then Smeta_kod:=DataSet_read['Smet'];
  If DataSet_read['Razdel']<> null then Razdel_kod:=DataSet_read['Razdel'];
  If DataSet_read['Stat']<> null   then Stat_kod:=DataSet_read['Stat'];
  If DataSet_read['Kekv']<> null   then Kekv_kod:=DataSet_read['Kekv'];

  T.Smeta_Edit.Text:=IntToStr(smeta_kod);
  T.Razdel_Edit.Text:=IntToStr(razdel_kod);
  T.Stat_Edit.Text:=IntToStr(stat_kod);
  T.Kekv_Edit.Text:=IntToStr(kekv_kod);
  T.is_add:=true;
  T.ShowModal;
  If t.ModalResult=mrOk then
   Begin
    WriteTransaction.StartTransaction;
    SProc.StoredProcName:='CN_DT_PRICE_SMET_UPDATE';
    SProc.Prepare;
    Sproc.ParamByName('ID_PRICE_SMET').AsInt64:=DataSet_Read['ID_PRICE_SMET'];
    Sproc.ParamByName('ID_PRICE_PARAM').AsInt64:=id_price_param;
    SProc.ParamByName('ID_SM').AsInt64:=T.ID_SMETA;
    SProc.ParamByName('ID_RZ').AsInt64:=T.ID_RAZDEL;
    SProc.ParamByName('ID_ST').AsInt64:=T.ID_STAT;
    SProc.ParamByName('ID_KEKV').AsInt64:=T.ID_KEKV;
    SProc.ExecProc;
    Try
     WriteTransaction.Commit;
     except
      WriteTransaction.Rollback;
    End;
    refresh;
    DataSet_Read.Locate('ID_PRICE_PARAM',id_price_param,[]);
   End;
  T.Free;
end;

procedure TfrmGetValueSmet_ex.act_delExecute(Sender: TObject);
Var
  i:byte;
begin
  if DataSet_Read.RecordCount = 0 then exit;
  i:= cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  WriteTransaction.StartTransaction;
  SProc.StoredProcName:='CN_DT_PRICE_SMET_DELETE';
  SProc.Prepare;
  SProc.ParamByName('ID_PRICE_SMET').AsInt64:=DataSet_Read['ID_PRICE_SMET'];
  SProc.ExecProc;
  Try
   WriteTransaction.Commit;
   except
    WriteTransaction.Rollback;
  End;
  refresh;
end;

procedure TfrmGetValueSmet_ex.FormCreate(Sender: TObject);
begin
  PLanguageIndex        := cn_Common_Funcs.cnLanguageIndex;
  Caption               := cn_Istochniki_GroupBox[PLanguageIndex];
  AddButton.Caption     := cn_InsertBtn_Caption[PLanguageIndex];
  AddButton.Hint        := cn_InsertBtn_Caption[PLanguageIndex];
  EditButton.Caption    := cn_EditBtn_Caption[PLanguageIndex];
  EditButton.Hint       := cn_EditBtn_Caption[PLanguageIndex];
  RefreshButton.Caption := cn_RefreshBtn_Caption[PLanguageIndex];
  RefreshButton.Hint    := cn_RefreshBtn_Caption[PLanguageIndex];
  DeleteButton.Caption  := cn_DeleteBtn_Caption[PLanguageIndex];
  DeleteButton.Hint     := cn_DeleteBtn_Caption[PLanguageIndex];
  SelectButton.Caption  := cn_SelectBtn_Caption[PLanguageIndex];
  SelectButton.Hint     := cn_SelectBtn_Caption[PLanguageIndex];
  ExitButton.Caption    := cn_ExitBtn_Caption[PLanguageIndex];
  ExitButton.Hint       := cn_ExitBtn_Caption[PLanguageIndex];
  smettable.Caption     := cn_Smeta[PLanguageIndex];
  Razdeltable.Caption   := cn_Razdel[PLanguageIndex];
  Stattable.Caption     := cn_Statya[PLanguageIndex];
  kekvtable.Caption     := cn_Kekv[PLanguageIndex];
end;

end.
