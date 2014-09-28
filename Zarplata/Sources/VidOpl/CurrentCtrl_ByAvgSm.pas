unit CurrentCtrl_ByAvgSm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, FIBDatabase, pFIBDatabase, DB, IBase,
  FIBDataSet, pFIBDataSet, ActnList, StdCtrls, cxButtons, cxTextEdit, zMessages,
  cxMaskEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, ZProc,
  Unit_Zglobal_Consts, cxCurrencyEdit, FIBQuery, pFIBQuery, pFIBStoredProc,
  PackageLoad, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  z_dmCommonStyles;

type TFAvgDaysSm_Result = record
  NumDays:integer;
  Summa:double;
  IdSession:variant;
  ModalResult:TModalResult;
end;

type
  TFAvgDaysSm = class(TForm)
    Bevel1: TBevel;
    LabelData: TcxLabel;
    EditData: TcxMaskEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    DB: TpFIBDatabase;
    StProcTransaction: TpFIBTransaction;
    ActionAvg: TAction;
    StProc: TpFIBStoredProc;
    AvgSumEdit: TcxMaskEdit;
    LabelAvg: TcxLabel;
    Bevel2: TBevel;
    GridDBTableView1: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    GridClKodSm: TcxGridDBColumn;
    GridClNameSm: TcxGridDBColumn;
    GridClSumma: TcxGridDBColumn;
    GridClSummaCount: TcxGridDBColumn;
    DSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    DataSource: TDataSource;
    LabelAllSum: TcxLabel;
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure LabelAvgClick(Sender: TObject);
    procedure EditDataExit(Sender: TObject);
    procedure AvgSumEditExit(Sender: TObject);
  private
    PLanguageIndex:Byte;
    CurrDecimalSeparator:string[1];
    PDB_Handle:TISC_DB_HANDLE;
    PRmoving:integer;
    PKod_Setup:Integer;
    pIdSession:variant;
    pSummaFull:variant;
    pStylesDM:TStylesDM;
    function GetAvg:variant;
    function GetSmets:variant;
  public
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;RMoving:integer;Kod_setup:integer);reintroduce;
    property Session:Variant read pIdSession;
  end;

implementation

{$R *.dfm}

constructor TFAvgDaysSm.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;RMoving:integer;Kod_setup:integer);
var AvgSum:Variant;
begin
 inherited Create(AOwner);
 DB.Handle := DB_Handle;
//------------------------------------------------------------------------------
 PLanguageIndex:=LanguageIndex;
 GridClKodSm.Caption := GridClKodSmeta_Caption[PLanguageIndex];
 GridClNameSm.Caption := LabelSmeta_Caption[PLanguageIndex];
 GridClSumma.Caption := GridClSumma_Caption[PLanguageIndex];
 GridClSummaCount.Caption := GridClCount_Caption[PLanguageIndex];

 YesBtn.Caption := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption :=  CancelBtn_Caption[PLanguageIndex];
 YesBtn.Hint := YesBtn.Caption;
 CancelBtn.Hint :=CancelBtn.Caption;
 LabelAvg.Caption := Average_Const[PLanguageIndex];
//------------------------------------------------------------------------------
 CurrDecimalSeparator:=ZSystemDecimalSeparator;
 EditData.Properties.EditMask := '[-]?\d\d?\d?';
 AvgSumEdit.Properties.EditMask := '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+CurrDecimalSeparator+']\d\d?)?';
 LabelData.Caption := LabelDays_Caption[PLanguageIndex];
//------------------------------------------------------------------------------
 PDB_Handle:=DB_Handle;
 PRmoving:=RMoving;
 PKod_Setup:=Kod_setup;
//------------------------------------------------------------------------------
 AvgSum := GetAvg;
 AvgSumEdit.Text := ifThen(VarIsNULL(AvgSum),'0'+CurrDecimalSeparator+'00',FloatToStrF(AvgSum,ffFixed,16,2));
//------------------------------------------------------------------------------
 pIdSession := GetSmets;
 DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_CURRENT_AVG_SM_SELECT('+VarToStrDef(pIdSession,'NULL')+')';
 DSet.Open;
//------------------------------------------------------------------------------
  pStylesDM:=TStylesDM.Create(Self);
  GridDBTableView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
end;

procedure TFAvgDaysSm.ActionYesExecute(Sender: TObject);
begin
if EditData.Text='' then
 begin
  EditData.SetFocus;
  Exit;
 end;
ModalResult:=mrYes;
end;

procedure TFAvgDaysSm.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFAvgDaysSm.LabelAvgClick(Sender: TObject);
begin
  LoadShowAvg(self,PDB_Handle,PRmoving,PKod_Setup);
end;

function TFAvgDaysSm.GetAvg:variant;
begin
 try
  StProc.Transaction.StartTransaction;
  StProc.StoredProcName := 'Z_AVARAGE_HOLIDAY';
  StProc.Prepare;
  StProc.ParamByName('RMOVING').AsInteger := PRmoving;
  StProc.ParamByName('KOD_SETUP_B').AsInteger := PKod_Setup;
  StProc.ParamByName('KOL_MONTHS').AsInteger := 12;

  StProc.ExecProc;
  Result := StProc.ParamByName('AVG_SUMMA').AsVariant;
  StProc.Transaction.Commit;
 except
  on E:Exception do
   begin
    StProc.Transaction.Rollback;
    ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
   end
 end;
end;

function TFAvgDaysSm.GetSmets:variant;
begin
 try
  StProc.Transaction.StartTransaction;
  StProc.StoredProcName := 'Z_CURRENT_AVG_SM_FILL';
  StProc.Prepare;
  StProc.ParamByName('RMOVING').AsInteger := PRmoving;
  StProc.ParamByName('KOD_SETUP_B').AsInteger := PKod_Setup;
  StProc.ParamByName('SUMMA_FULL').AsVariant := pSummaFull;
  StProc.ParamByName('IN_ID_SESSION').AsVariant := pIdSession;

  StProc.ExecProc;
  Result := StProc.ParamByName('ID_SESSION').AsVariant;
  StProc.Transaction.Commit;
 except
  on E:Exception do
   begin
    StProc.Transaction.Rollback;
    ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
   end
 end;
end;

procedure TFAvgDaysSm.EditDataExit(Sender: TObject);
var Avg:double;
    Days:integer;
begin
  if Trim(EditData.Text)='' then Days := 0
                            else Days := StrToInt(EditData.Text);
  if Trim(AvgSumEdit.Text)='' then Avg := 0
                              else Avg := StrToFloat(AvgSumEdit.Text);

  pSummaFull := zRoundTo(Days*Avg,-2);
  LabelAllSum.Caption := FloatToStrF(pSummaFull,ffFixed,10,2);
  GetSmets;
  DSet.CloseOpen(True);
end;

procedure TFAvgDaysSm.AvgSumEditExit(Sender: TObject);
begin
  EditDataExit(Sender);
end;

end.
