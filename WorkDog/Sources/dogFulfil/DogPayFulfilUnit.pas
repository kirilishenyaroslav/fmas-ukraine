unit DogPayFulfilUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dogLoaderUnit, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTL,
  ActnList, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, cxCheckBox,
  cxCalendar, cxCurrencyEdit, IBase, FIBQuery, pFIBQuery, pFIBStoredProc,
  cxSplitter, cxButtonEdit, cxImage, ImgList, cxTextEdit, cxLabel,
  cxContainer, cxDBEdit;

type
  TfrmPayFulfil = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ActionList1: TActionList;
    ActionQuit: TAction;
    DataSetPay: TpFIBDataSet;
    DataSetFulfil: TpFIBDataSet;
    DataSourcePay: TDataSource;
    DataSourceFulfil: TDataSource;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    cxStyleRepository1: TcxStyleRepository;
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
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    pFIBStoredProc1: TpFIBStoredProc;
    pFIBTransaction2: TpFIBTransaction;
    DataSetPaySmet: TpFIBDataSet;
    DataSourcePaySmet: TDataSource;
    Panel4: TPanel;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridTableView2: TcxGridTableView;
    cxGridColumn6: TcxGridColumn;
    cxGridColumn7: TcxGridColumn;
    cxGridColumn8: TcxGridColumn;
    cxGridColumn9: TcxGridColumn;
    cxGridColumn10: TcxGridColumn;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBTableView4DBColumn1: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    Panel5: TPanel;
    cxGrid4: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridTableView1: TcxGridTableView;
    cxGridColumn1: TcxGridColumn;
    cxGridColumn2: TcxGridColumn;
    cxGridColumn3: TcxGridColumn;
    cxGridColumn4: TcxGridColumn;
    cxGridColumn5: TcxGridColumn;
    cxGrid4DBTableView1: TcxGridDBTableView;
    cxGrid4DBTableView1SMETA: TcxGridDBColumn;
    cxGrid4DBTableView1RAZD: TcxGridDBColumn;
    cxGrid4DBTableView1ST: TcxGridDBColumn;
    cxGrid4DBTableView1KEKV: TcxGridDBColumn;
    cxGrid4DBTableView1SUM: TcxGridDBColumn;
    cxGrid4DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid4Level1: TcxGridLevel;
    DataSetFulfilSmet: TpFIBDataSet;
    DataSourceFulfilSmet: TDataSource;
    pFIBQuery1: TpFIBQuery;
    ImageList1: TImageList;
    Panel3: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1IS_PLAT: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_DOC: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_month: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_YEAR: TcxGridDBColumn;
    cxGrid1DBTableView1SUMM_DOC: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1IS_PAY: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel6: TPanel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    Panel7: TPanel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1NUM_DOC: TcxGridDBColumn;
    cxGridDBTableView1DATE_MONTH: TcxGridDBColumn;
    cxGridDBTableView1DATE_YEAR: TcxGridDBColumn;
    cxGridDBTableView1SUMM_DOC: TcxGridDBColumn;
    cxGridDBTableView1SUMMA_DOG: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel8: TPanel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cxGrid1DBTableView1DATE_DOC: TcxGridDBColumn;
    cxGridDBTableView1DATE_DOC: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_REG: TcxGridDBColumn;
    cxGridDBTableView1DATE_REG: TcxGridDBColumn;
    SmetDSPay: TpFIBDataSet;
    SmetDSFulfil: TpFIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActionQuitExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1IS_PLATCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableView4DblClick(Sender: TObject);
    procedure cxGridDBTableView4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid4DBTableView1DblClick(Sender: TObject);
    procedure cxGrid4DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  public
    id_dog : int64;
    ex_id_doc : int64;
    TotalPaySumma : Currency;
    TotalFulfilSumma : Currency;
    id_session : int64;
    procedure SelectAll;
  end;

var
  frmPayFulfil: TfrmPayFulfil;


function GetSpr(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle; const id_dog, exclude_id_doc : int64) : variant; stdcall;
exports GetSpr;

implementation
uses WSUnit, ProvUnit, LangUnit, Clipbrd;

{$R *.dfm}

function GetSpr(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle; const id_dog, exclude_id_doc : int64) : variant; stdcall;
var
 f : TfrmPayFulfil;
begin
 f := TfrmPayFulfil.Create(AOwner);
 f.pFIBDatabase1.Handle := DBHandle;
 f.pFIBTransaction1.Handle := RTrans;
 f.pFIBTransaction2.Handle := WTrans;
 f.FormStyle := fs;
 f.id_dog := id_dog;
 f.ex_id_doc := exclude_id_doc;
 if fs = fsNormal then begin
  f.showModal;
  f.free;
 end;
 Result := 1;
end;

procedure TfrmPayFulfil.FormCreate(Sender: TObject);
begin
 LangPackApply(Self);
 LoadPositionFromRegistry(Self);
 id_dog := -1;
// TdogForm(Owner).WorkDatabase
end;

procedure TfrmPayFulfil.FormDestroy(Sender: TObject);
begin
 SavePositionToRegistry(Self);
end;

procedure TfrmPayFulfil.ActionQuitExecute(Sender: TObject);
begin
 DataSetPay.Close;
 DataSetFulfil.Close;
 Close;
end;

procedure TfrmPayFulfil.SelectAll;
var
 f : TForm;
begin
 f := WaitScreenShow(Self);
 pFIBStoredProc1.Transaction.StartTransaction;
 pFIBStoredProc1.StoredProcName := 'PROC_DOG_DT_DOC_GET_PAY_FULFIL';
 pFIBStoredProc1.Prepare;
 pFIBStoredProc1.ParamByName('INP_ID_DOG').AsInt64 := id_dog;
 pFIBStoredProc1.ExecProc;
 id_session := pFIBStoredProc1['ID_SESSION'].AsInt64;
 pFIBStoredProc1.Transaction.Commit;


 DataSetPay.Close;
 DataSetPay.ParamByName('ID_SESSION').AsInt64 := id_session;
 DataSetPay.ParamByName('ID_DOG').AsInt64 := id_dog;
 DataSetPay.Open;

 DataSetPaySmet.Close;
 DataSetPaySmet.ParamByName('ID_SESSION').AsInt64 := id_session;
 DataSetPaySmet.ParamByName('ID_DOG').AsInt64 := id_dog;
 DataSetPaySmet.Open;

 DataSetFulfil.Close;
 DataSetFulfil.ParamByName('ID_SESSION').AsInt64 := id_session;
 DataSetFulfil.Open;

 DataSetFulfilSmet.Close;
 DataSetFulfilSmet.ParamByName('ID_SESSION').AsInt64 := id_session;
 DataSetFulfilSmet.Open;

 cxGrid1DBTableView1.DataController.FocusedRowIndex := 0;
 cxGridDBTableView1.DataController.FocusedRowIndex := 0;
 cxGrid4DBTableView1.DataController.FocusedRowIndex := 0;
 cxGridDBTableView4.DataController.FocusedRowIndex := 0;
// DataSetFulfil_Footer.Close;
{ DataSetPay.ParamByName('id_dog').AsInt64 := id_dog;
 DataSetPay_Footer.ParamByName('id_dog').AsInt64 := id_dog;
 DataSetFulfil.ParamByName('id_dog').AsInt64 := id_dog;
 DataSetFulfil_Footer.ParamByName('id_dog').AsInt64 := id_dog;
 DataSetPay.ParamByName('ex_id_doc').AsInt64 := ex_id_doc;
 DataSetPay_Footer.ParamByName('ex_id_doc').AsInt64 := ex_id_doc;
 DataSetFulfil.ParamByName('ex_id_doc').AsInt64 := ex_id_doc;
 DataSetFulfil_Footer.ParamByName('ex_id_doc').AsInt64 := ex_id_doc;
 DataSetPay.Open;
 DataSetPay_Footer.Open;
 DataSetFulfil.Open;
 DataSetFulfil_Footer.Open;}
 WaitScreenClose(f);
 //union select smeta1, razd1, st1, kekv1, sum(SUM_PAY) from PROC_DOG_DT_DOC_GET_PF_BY_PL(:id_dog, :ex_id_doc) group by smeta1, razd1, st1, kekv1

end;

procedure TfrmPayFulfil.FormShow(Sender: TObject);
begin
 SelectAll;
end;

procedure TfrmPayFulfil.FormResize(Sender: TObject);
begin
// Splitter1.Left := Width div 2 - 10;
end;

procedure TfrmPayFulfil.cxGrid1DBTableView1DblClick(Sender: TObject);
var
 f : TfrmProv;
begin
 f := TfrmProv.Create(Self);
 f.id_doc := TFIBBCDField(DataSetPay.FieldByName('ID_DOC')).AsInt64;
 f.id_session := id_session;
 f.is_pay := 1;
 f.TypeDocEdit.Text := DataSetPay['NAME_TYPE_DOC'];
 f.NumDocEdit.Text  := DataSetPay['NUM_DOC'];
 f.DateDocEdit.Text := DataSetPay['DATE_DOC'];
 f.DateRegEdit.Text := DataSetPay['DATE_REG'];
 f.CustEdit.Text    := DataSetPay['NAME_CUSTOMER'];
 f.NoteMemo.Text    := DataSetPay['NOTE'];
 f.ShowModal;
 f.Free;
end;

procedure TfrmPayFulfil.cxGridDBTableView1DblClick(Sender: TObject);
var
 f : TfrmProv;
begin
 f := TfrmProv.Create(Self);
 f.id_doc := TFIBBCDField(DataSetFulfil.FieldByName('ID_DOC')).AsInt64;
 f.id_session := id_session;
 f.is_pay := 0;
 f.TypeDocEdit.Text := DataSetFulfil['NAME_TYPE_DOC'];
 f.NumDocEdit.Text  := DataSetFulfil['NUM_DOC'];
 f.DateDocEdit.Text := DataSetFulfil['DATE_DOC'];
 f.DateRegEdit.Text := DataSetFulfil['DATE_REG'];
 f.CustEdit.Text    := DataSetFulfil['NAME_CUSTOMER'];
 f.NoteMemo.Text    := DataSetFulfil['NOTE'];
 f.ShowModal;
 f.Free;
end;

procedure TfrmPayFulfil.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then cxGrid1DBTableView1DblClick(Self);
 if (Key = ORD('ё')) and (ssShift in shift) and (ssCtrl in Shift) then
 begin
//   cxGridDBTableView1ID_DOC.Visible := not cxGridDBTableView1ID_DOC.Visible;
//   cxGrid1DBTableView1ID_DOC.Visible := not cxGrid1DBTableView1ID_DOC.Visible;
 end;
end;

procedure TfrmPayFulfil.cxGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
  ii : Int64;
begin
 if Key = VK_RETURN then cxGridDBTableView1DblClick(Self);
 if (Key = Ord('Z')) and (ssShift in Shift) and (ssCtrl in Shift) then cxGridDBTableView1DBColumn2.Visible := not cxGridDBTableView1DBColumn2.Visible;
 if (Key = Ord('I')) and (ssShift in Shift) and (ssCtrl in Shift) then
 begin
   ii := DataSetFulfil.FieldByName('ID_DOC').AsVariant;
   clipboard.AsText := IntToStr(ii);
 end;
end;

procedure TfrmPayFulfil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 pFIBQuery1.SQL.Text := 'delete from DOG_DT_ALL_PROV where id_session = ' + IntToStr(id_session);
 pFIBQuery1.Transaction.StartTransaction;
 pFIBQuery1.ExecQuery;
 pFIBQuery1.Transaction.Commit;
 pFIBQuery1.Close;
end;

procedure TfrmPayFulfil.cxGrid1DBTableView1IS_PLATCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 if AViewInfo.GridRecord.Values[cxGrid1DBTableView1IS_PLAT.Index] = 1 then begin
  ACanvas.FillRect(AViewInfo.Bounds);
  ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top, 0);
  ADone := true;
 end;
end;

procedure TfrmPayFulfil.cxGridDBTableView4DblClick(Sender: TObject);
var
 s : string;
begin
 if DataSetPaySmet.RecordCount = 0 then Exit;
 SmetDSPay.Close;
 SmetDSPay.SelectSQL.Text := 'SELECT SMETA_TITLE, SMETA_KOD as num FROM PUB_SPR_SMETA WHERE ID_SMETA = ?MAS_ID_SMETA';
 SmetDSPay.Open;
 s := 'Кошторис: № ' + IfNull(IntToStr(SmetDSPay['NUM']), '') + ' - ' + IfNull(SmetDSPay['SMETA_TITLE'], '') + #13;

 SmetDSPay.Close;
 SmetDSPay.SelectSQL.Text := 'SELECT RAZD_ST_TITLE, RAZD_ST_NUM as num FROM PUB_SPR_RAZD_ST WHERE ID_RAZD_ST = ?MAS_ID_RAZD';
 SmetDSPay.Open;
 s := s + 'Розділ: № ' + IfNull(IntToStr(SmetDSPay['NUM']), '') + ' - ' + IfNull(SmetDSPay['RAZD_ST_TITLE'], '') + #13;

 SmetDSPay.Close;
 SmetDSPay.SelectSQL.Text := 'SELECT RAZD_ST_TITLE, RAZD_ST_NUM as num FROM PUB_SPR_RAZD_ST WHERE ID_RAZD_ST = ?MAS_ID_STAT';
 SmetDSPay.Open;
 s := s + 'Стаття: № ' + IfNull(IntToStr(SmetDSPay['NUM']), '') + ' - ' + IfNull(SmetDSPay['RAZD_ST_TITLE'], '') + #13;

 SmetDSPay.Close;
 SmetDSPay.SelectSQL.Text := 'SELECT KEKV_TITLE, KEKV_CODE as Num FROM PUB_GET_KEKV_INFO(?MAS_ID_KEKV, ''' + DateToStr(DataSetPay['DATE_REG']) + ''')';
 SmetDSPay.Open;
 s := s + 'КЕКВ: № ' + IfNull(IntToStr(SmetDSPay['NUM']), '') + ' - ' + IfNull(SmetDSPay['KEKV_TITLE'], '') + #13;
 SmetDSPay.Close;
 ShowMessage(s);
end;

procedure TfrmPayFulfil.cxGridDBTableView4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then cxGridDBTableView4DblClick(Self);
end;

procedure TfrmPayFulfil.cxGrid4DBTableView1DblClick(Sender: TObject);
var
 s : string;
begin
 if DataSetFulfilSmet.RecordCount = 0 then Exit;
 SmetDSFulfil.Close;
 SmetDSFulfil.SelectSQL.Text := 'SELECT SMETA_TITLE, SMETA_KOD as num FROM PUB_SPR_SMETA WHERE ID_SMETA = ?MAS_ID_SMETA';
 SmetDSFulfil.Open;
 s := s + 'Кошторис: № ' + IfNull(IntToStr(SmetDSFulfil['NUM']), '') + ' - ' + IfNull(SmetDSFulfil['SMETA_TITLE'], '') + #13;

 SmetDSFulfil.Close;
 SmetDSFulfil.SelectSQL.Text := 'SELECT RAZD_ST_TITLE, RAZD_ST_NUM as num  FROM PUB_SPR_RAZD_ST WHERE ID_RAZD_ST = ?MAS_ID_RAZD';
 SmetDSFulfil.Open;
 s := s + 'Розділ: № ' + IfNull(IntToStr(SmetDSFulfil['NUM']), '') + ' - ' + IfNull(SmetDSFulfil['RAZD_ST_TITLE'], '') + #13;

 SmetDSFulfil.Close;
 SmetDSFulfil.SelectSQL.Text := 'SELECT RAZD_ST_TITLE, RAZD_ST_NUM as num  FROM PUB_SPR_RAZD_ST WHERE ID_RAZD_ST = ?MAS_ID_STAT';
 SmetDSFulfil.Open;
 s := s + 'Стаття: № ' + IfNull(IntToStr(SmetDSFulfil['NUM']), '') + ' - ' + IfNull(SmetDSFulfil['RAZD_ST_TITLE'], '') + #13;

 SmetDSFulfil.Close;
 SmetDSFulfil.SelectSQL.Text := 'SELECT KEKV_TITLE, KEKV_CODE as Num FROM PUB_GET_KEKV_INFO(?MAS_ID_KEKV, ''' + DateToStr(DataSetFulfil['DATE_REG']) + ''')';
 SmetDSFulfil.Open;
 s := s + 'КЕКВ: № ' + IfNull(IntToStr(SmetDSFulfil['NUM']), '') + ' - ' + IfNull(SmetDSFulfil['KEKV_TITLE'], '') + #13;
 SmetDSFulfil.Close;
 ShowMessage(s);
end;

procedure TfrmPayFulfil.cxGrid4DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then cxGrid4DBTableView1DblClick(Self);
end;

end.

