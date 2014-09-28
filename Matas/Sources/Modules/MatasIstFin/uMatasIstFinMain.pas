unit uMatasIstFinMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, uResources, uMatasVars, uMatasUtils,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGrid, FIBDatabase,
  pFIBDatabase, Placemnt, ActnList, ImgList, cxClasses, StdCtrls,
  cxButtons, cxSpinEdit, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, ExtCtrls, Menus, DateUtils, FIBDataSet, pFIBDataSet,
  cxGridDBTableView, FIBQuery, pFIBQuery, pFIBStoredProc, cxCheckBox,
  cxSplitter, uPackageManager;

type
  TfmMatasIstFin = class(TForm)
    Panel1: TPanel;
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    ApplyButton: TcxButton;
    PrintButton: TcxButton;
    ExitButton: TcxButton;
    StyleRepository: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    imgOborot: TImageList;
    MainActionList: TActionList;
    acShow: TAction;
    acPrint: TAction;
    acExit: TAction;
    acFields: TAction;
    acExport: TAction;
    OborotFormStorage: TFormStorage;
    OborotDataBase: TpFIBDatabase;
    OborotTransaction: TpFIBTransaction;
    LabelBeg: TLabel;
    LabelEnd: TLabel;
    pmOborot: TPopupMenu;
    NRefresh: TMenuItem;
    NPrint: TMenuItem;
    N4: TMenuItem;
    NMoveOst: TMenuItem;
    N1: TMenuItem;
    acExport1: TMenuItem;
    OborotDataSet: TpFIBDataSet;
    OborotDataSetBAL_ID_SCH: TFIBIntegerField;
    OborotDataSetBAL_SCH_NUMBER: TFIBStringField;
    OborotDataSetBAL_SCH_TITLE: TFIBStringField;
    OborotDataSetID_SCH: TFIBBCDField;
    OborotDataSetSCH_NUMBER: TFIBStringField;
    OborotDataSetSCH_TITLE: TFIBStringField;
    OborotDataSetID_SM: TFIBBCDField;
    OborotDataSetSM_TITLE: TFIBStringField;
    OborotDataSetSM_KOD: TFIBIntegerField;
    OborotDataSetID_RZ: TFIBBCDField;
    OborotDataSetRZ_TITLE: TFIBStringField;
    OborotDataSetRZ_KOD: TFIBIntegerField;
    OborotDataSetID_ST: TFIBBCDField;
    OborotDataSetST_TITLE: TFIBStringField;
    OborotDataSetST_KOD: TFIBIntegerField;
    OborotDataSetID_KEKV: TFIBBCDField;
    OborotDataSetKEKV_TITLE: TFIBStringField;
    OborotDataSetKEKV_KOD: TFIBIntegerField;
    OborotDataSetSUMMA_BEG: TFIBBCDField;
    OborotDataSetSUMMA_DB: TFIBBCDField;
    OborotDataSetSUMMA_KR: TFIBBCDField;
    OborotDataSetSUMMA_END: TFIBBCDField;
    DataSource1: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1BAL_SCH_NUMBER: TcxGridDBColumn;
    cxGrid1DBTableView1SCH_NUMBER: TcxGridDBColumn;
    cxGrid1DBTableView1SM_KOD: TcxGridDBColumn;
    cxGrid1DBTableView1RZ_KOD: TcxGridDBColumn;
    cxGrid1DBTableView1ST_KOD: TcxGridDBColumn;
    cxGrid1DBTableView1KEKV_KOD: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA_BEG: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA_DB: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA_KR: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA_END: TcxGridDBColumn;
    N2: TMenuItem;
    N3: TMenuItem;
    acMoveSaldo: TAction;
    StoredProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    OborotDataSetSUMMA_OST: TFIBBCDField;
    cxGrid1DBTableView1SUMMA_OST: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA_PROVERKA: TcxGridDBColumn;
    OborotDataSetSUM_PROVERKA: TFIBBCDField;
    cxCheckBoxSum_Prov: TcxCheckBox;
    cxCheckBoxPanel_grupp: TcxCheckBox;
    pnl1: TPanel;
    cxSplitter1: TcxSplitter;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxgrdbclmnGrid2ID_DOC: TcxGridDBColumn;
    cxgrdbclmnGrid2ID_TIPD: TcxGridDBColumn;
    cxgrdbclmnGrid2TIPD: TcxGridDBColumn;
    cxgrdbclmnGrid2NAME_TIPD: TcxGridDBColumn;
    cxgrdbclmnGrid2NUM_DOC: TcxGridDBColumn;
    cxgrdbclmnGrid2DATE_DOC: TcxGridDBColumn;
    cxgrdbclmnGrid2ID_MO_OUT: TcxGridDBColumn;
    cxgrdbclmnGrid2NAME: TcxGridDBColumn;
    cxgrdbclmnGrid2ID_CUST: TcxGridDBColumn;
    cxgrdbclmnGrid2KOL_MAT: TcxGridDBColumn;
    cxgrdbclmnGrid2SUMMA: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxgrdbclmnGrid3ID_DOC: TcxGridDBColumn;
    cxgrdbclmnGrid3ID_TIPD: TcxGridDBColumn;
    cxgrdbclmnGrid3TIPD: TcxGridDBColumn;
    cxgrdbclmnGrid3NAME_TIPD: TcxGridDBColumn;
    cxgrdbclmnGrid3NUM_DOC: TcxGridDBColumn;
    cxgrdbclmnGrid3DATE_DOC: TcxGridDBColumn;
    cxgrdbclmnGrid3ID_MO_IN: TcxGridDBColumn;
    cxgrdbclmnGrid3ID_CUST: TcxGridDBColumn;
    cxgrdbclmnGrid3NAME: TcxGridDBColumn;
    cxgrdbclmnGrid3KOL_MAT: TcxGridDBColumn;
    cxgrdbclmnGrid3SUMMA: TcxGridDBColumn;
    cxGrid3Level1: TcxGridLevel;
    Pr_ds: TpFIBDataSet;
    rs_ds: TpFIBDataSet;
    ds1: TDataSource;
    ds2: TDataSource;
    Pr_dsID_DOC: TFIBBCDField;
    Pr_dsID_TIPD: TFIBBCDField;
    Pr_dsTIPD: TFIBStringField;
    Pr_dsNAME_TIPD: TFIBStringField;
    Pr_dsNUM_DOC: TFIBStringField;
    Pr_dsDATE_DOC: TFIBDateField;
    Pr_dsID_MO_OUT: TFIBBCDField;
    Pr_dsID_CUST: TFIBBCDField;
    Pr_dsKOL_MAT: TFIBBCDField;
    Pr_dsSUMMA: TFIBBCDField;
    Pr_dsNAME_OUT: TFIBStringField;
    rs_dsID_DOC: TFIBBCDField;
    rs_dsID_TIPD: TFIBBCDField;
    rs_dsTIPD: TFIBStringField;
    rs_dsNAME_TIPD: TFIBStringField;
    rs_dsNUM_DOC: TFIBStringField;
    rs_dsDATE_DOC: TFIBDateField;
    rs_dsID_MO_OUT: TFIBBCDField;
    rs_dsID_CUST: TFIBBCDField;
    rs_dsKOL_MAT: TFIBBCDField;
    rs_dsSUMMA: TFIBBCDField;
    rs_dsNAME_OUT: TFIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure acShowExecute(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure acMoveSaldoExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acExportExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxCheckBoxSum_ProvClick(Sender: TObject);
    procedure cxCheckBoxPanel_gruppClick(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure cxGrid3DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
    { Public declarations }
    DATE_BEG, DATE_END: TDateTime;
    check:integer;
   constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER: int64);overload;
  end;

  procedure ShowIstFinOborot(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
  exports ShowIstFinOborot;

var
  fmMatasIstFin: TfmMatasIstFin;

implementation

{$R *.dfm}

procedure ShowIstFinOborot(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 TfmMatasIstFin.Create(aOwner, aDBHANDLE, aID_USER);
end;

constructor TfmMatasIstFin.Create(aOwner: TComponent; aDBHANDLE: TISC_DB_HANDLE; aID_USER: int64);
begin
 inherited Create(aOwner);
 if Assigned(aDBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.OborotDataBase.Close;
   Self.OborotDatabase.Handle:=aDBHANDLE;
   cxSplitter1.CloseSplitter;
 end;
end;

procedure TfmMatasIstFin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmMatasIstFin.FormCreate(Sender: TObject);
var
 dd, dm, dy: Word;
begin
 Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_ACC_OBV;
 with OborotFormStorage do
 begin
  RestoreFormPlacement;
  Width:=StoredValue['FormWidth'];
  Height:=StoredValue['FormHeight'];
 end;
 if Width<750 then Width:=750;
 if Height<550 then Height:=550;
 LoadMonthTocxComboBox(cxMonthBeg);
 LoadMonthTocxComboBox(cxMonthEnd);
 LabelBeg.Caption:=MAT_STR_COL_BEG;
 LabelEnd.Caption:=MAT_STR_COL_END;
 ApplyButton.Caption:=MAT_BUTTON_SHOW_CONST;
 PrintButton.Caption:=MAT_ACTION_PRINT_CONST;
 ExitButton.Caption:=MAT_ACTION_CLOSE_CONST;

 NRefresh.Caption:=MAT_ACTION_REFRESH_CONST;
 NPrint.Caption:=MAT_ACTION_PRINT_CONST;
 NMoveOst.Caption:=MAT_STR_MOVE_OST;
 acExport.Caption:=MAT_ACTION_EXPORT_CONST;

 cxGrid1DBTableView1SM_KOD.Caption:='Бюджет';
 cxGrid1DBTableView1RZ_KOD.Caption:='Розділ';
 cxGrid1DBTableView1ST_KOD.Caption:='Стаття';
 cxGrid1DBTableView1KEKV_KOD.Caption:='КЕКВ';
 cxGrid1DBTableView1SUMMA_BEG.Caption:='Сальдо вхідне';
 cxGrid1DBTableView1SUMMA_DB.Caption:='Дебет';
 cxGrid1DBTableView1SUMMA_KR.Caption:='Кредит';
 cxGrid1DBTableView1SUMMA_END.Caption:='Сальдо вихідне';
 cxGrid1DBTableView1SCH_NUMBER.Caption:='Рахунок';
 cxGrid1DBTableView1BAL_SCH_NUMBER.Caption:='Бал.рахунок';
 cxGrid1DBTableView1SUMMA_OST.Caption:='Сума залишків';
 cxGrid1DBTableView1SUMMA_PROVERKA.Caption:='Різниця';

 DecodeDate(_MATAS_PERIOD, dy, dm,  dd);
 cxMonthEnd.ItemIndex:=dm-1;
 cxYearEnd.Value:=dy;
 cxMonthBeg.ItemIndex:=dm-1;
 cxYearBeg.Value:=dy;
 acShowExecute(self);
 check:=0;
end;

procedure TfmMatasIstFin.acExitExecute(Sender: TObject);
begin
 with OborotFormStorage do
 begin
  StoredValue['FormWidth']:=Width;
  StoredValue['FormHeight']:=Height;
  SaveFormPlacement;
 end;
 Close;
end;

procedure TfmMatasIstFin.acShowExecute(Sender: TObject);
var
  w: TForm;
begin
  w:=ShowWaitWindow(self);
  DATE_END:=EndOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);
  DATE_BEG:=StartOfAMonth(cxYearBeg.Value, cxMonthBeg.ItemIndex+1);
  with OborotDataSet do
  begin
    Close;
    ParamByName('PDATE_BEG').Value:=DATE_BEG;
    ParamByName('PDATE_END').Value:=DATE_END;
    CloseOpen(false);
  end;
  Pr_DS.ParamByName('PDATE_BEG').Value:=DATE_BEG;
  Pr_DS.ParamByName('PDATE_END').Value:=DATE_END;
  rs_ds.ParamByName('PDATE_BEG').Value:=DATE_BEG;
  rs_DS.ParamByName('PDATE_END').Value:=DATE_END;
  Pr_DS.CloseOpen(false);
  rs_ds.CloseOpen(false);
  cxGrid1DBTableView1.ViewData.Expand(true);
  CloseWaitWindow(w);
end;

procedure TfmMatasIstFin.N3Click(Sender: TObject);
begin
  if N3.Checked then N3.Checked:=false else N3.Checked:=true;
  cxGrid1DBTableView1.OptionsView.GroupByBox:=N3.Checked;
end;

procedure TfmMatasIstFin.acMoveSaldoExecute(Sender: TObject);
var
 NewDateRec: TDateTime;
 dy, dm, dd: Word;
 MsgStr: string;
 w: TForm;
begin
 DecodeDate(DATE_END, dy, dm,  dd);
 IncAMonth(dy, dm, dd, 1);
 MsgStr:=PChar('Ви дійсно бажаєте перенести залишки на '+GetMonthName(dm)+' '+IntToStr(dy)+'?');
 NewDateRec:=StartOfAMonth(dy, dm);
 if agMessageDlg(PChar('Увага!'), MsgStr, mtConfirmation, mbOKCancel)=mrOk then
 begin
   Application.ProcessMessages;
   w:=ShowWaitWindow(self);
   try
     StoredProc.Transaction.StartTransaction;
     StoredProc.StoredProcName:='MAT_MOVE_SALDO_ISTFIN';
     StoredProc.Prepare;
     StoredProc.ParamByName('DATE_BEG').Value:=DATE_BEG;
     StoredProc.ParamByName('DATE_END').Value:=DATE_END;
     StoredProc.ParamByName('NEW_PERIOD').Value:=NewDateRec;
     StoredProc.ExecProc;
     StoredProc.Transaction.Commit;
    except on E : Exception
     do begin
      ShowMessage(E.Message);
      StoredProc.Transaction.Rollback;
      CloseWaitWindow(w);
      Exit;
     end;
    end;
    CloseWaitWindow(w);
  end;
end;

procedure TfmMatasIstFin.acPrintExecute(Sender: TObject);
begin
//
end;

procedure TfmMatasIstFin.acExportExecute(Sender: TObject);
begin
  ExportDataSet(self, OborotDataSet);
end;

procedure TfmMatasIstFin.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var   Arect : TRect;
begin
{ Arect:=AViewInfo.Bounds;
  if (AViewInfo.GridRecord.Values[11]<>0)  then
  begin
      ACanvas.Canvas.Font.Color := clRed;
      ACanvas.Canvas.FillRect(Arect);
  end;}
end;

procedure TfmMatasIstFin.cxCheckBoxSum_ProvClick(Sender: TObject);
var   w: TForm;
begin
  w:=ShowWaitWindow(self);
  DATE_END:=EndOfAMonth(cxYearEnd.Value, cxMonthEnd.ItemIndex+1);
  DATE_BEG:=StartOfAMonth(cxYearBeg.Value, cxMonthBeg.ItemIndex+1);
  with OborotDataSet do
  begin
    Close;
    OborotDataSet.SelectSQL.Clear;
    OborotDataSet.SelectSQL.Add('SELECT * FROM MAT_GET_OBOROT_ISTFIN(:PDATE_BEG, :PDATE_END)');
    if check=0 then
     begin
      check:=1;
      OborotDataSet.SelectSQL.Add('WHERE SUM_PROVERKA<>0');
     end
    else check:=0;
    OborotDataSet.SelectSQL.Add('ORDER BY BAL_SCH_NUMBER, SCH_NUMBER, SM_KOD, RZ_KOD, ST_KOD, KEKV_KOD');
    ParamByName('PDATE_BEG').Value:=DATE_BEG;
    ParamByName('PDATE_END').Value:=DATE_END;
    CloseOpen(false);
  end;
  cxGrid1DBTableView1.ViewData.Expand(true);
  CloseWaitWindow(w);

end;

procedure TfmMatasIstFin.cxCheckBoxPanel_gruppClick(Sender: TObject);
begin
 cxGrid1DBTableView1.OptionsView.GroupByBox:=cxCheckBoxPanel_grupp.Checked;
end;

procedure TfmMatasIstFin.cxGridDBTableView1DblClick(Sender: TObject);
begin
 uPackageManager.ViewDoc(self, OborotDatabase.Handle, pr_dsID_DOC.AsInteger);
end;

procedure TfmMatasIstFin.cxGrid3DBTableView1DblClick(Sender: TObject);
begin
 uPackageManager.ViewDoc(self, OborotDatabase.Handle, rs_dsID_DOC.AsInteger);
end;

end.
