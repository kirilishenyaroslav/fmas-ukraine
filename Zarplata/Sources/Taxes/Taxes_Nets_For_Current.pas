unit Taxes_Nets_For_Current;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxLookAndFeelPainters,
  ActnList, StdCtrls, cxButtons, cxGridTableView, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxGridLevel, ZProc, ZMessages,Unit_ZGlobal_Consts,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, IBase, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TFTaxesNetForCurrent = class(TForm)
    Grid_TaxNets: TcxGrid;
    Grid_TaxNetsDBTableView1: TcxGridDBTableView;
    Grid_TaxNets_Column_SumMin: TcxGridDBColumn;
    Grid_TaxNets_Column_SumMax: TcxGridDBColumn;
    Grid_TaxNets_Column_Percent: TcxGridDBColumn;
    Grid_TaxNets_Column_SumAdd: TcxGridDBColumn;
    Grid_TaxNets_Column_TextAdd: TcxGridDBColumn;
    Grid_TaxNetsLevel1: TcxGridLevel;
    DSet_TaxInfo: TpFIBDataSet;
    DSource_TaxInfo: TDataSource;
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    SelectBtn: TcxButton;
    ExitBtn: TcxButton;
    ActionList: TActionList;
    ActionSelect: TAction;
    ActionExit: TAction;
    StProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    procedure ActionExitExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActionSelectExecute(Sender: TObject);
  private
    PLanguageIndex:Byte;
    PIsOk:boolean;
  public
    constructor Create(AOwner:TComponent;ADb_Handle:TISC_DB_HANDLE;ID_Vidopl:integer;Kod_setup:integer);reintroduce;
    property IsOk:Boolean read PIsOk;
  end;

function ViewTaxNetForCurrent(AOwner:TComponent;ADb_Handle:TISC_DB_HANDLE;ID_Vidopl:integer;Kod_setup:integer):variant;stdcall;
 exports ViewTaxNetForCurrent;

implementation

{$R *.dfm}

function ViewTaxNetForCurrent(AOwner:TComponent;ADb_Handle:TISC_DB_HANDLE;ID_Vidopl:integer;Kod_setup:integer):variant;stdcall;
var FormView:TFTaxesNetForCurrent;
begin
FormView:=TFTaxesNetForCurrent.Create(AOwner,ADb_Handle,ID_Vidopl,Kod_setup);
Result:=Null;
if FormView.IsOk then
  if FormView.ShowModal=mrYes then
     Result:=FormView.DSet_TaxInfo['ADD_TEXT'];
FormView.Destroy;
end;

constructor TFTaxesNetForCurrent.Create(AOwner:TComponent;ADb_Handle:TISC_DB_HANDLE;ID_Vidopl:integer;Kod_setup:integer);
begin
 inherited Create(AOwner);
 PIsOk:=True;
//******************************************************************************
 PLanguageIndex:=LanguageIndex;
 Caption:=SelectRecordForCorrectSvod_Const[PLanguageIndex];;
 SelectBtn.Caption := SelectBtn_Caption[PLanguageIndex];
 ExitBtn.Caption := ExitBtn_Caption[PLanguageIndex];
 SelectBtn.Hint := SelectBtn.Caption;
 ExitBtn.Hint := ExitBtn.Caption;
 Grid_TaxNets_Column_SumMin.Caption                    := GridClFrom_Caption[PLanguageIndex];
 Grid_TaxNets_Column_SumMax.Caption                    := GridClTo_Caption[PLanguageIndex];
 Grid_TaxNets_Column_SumAdd.Caption                    := GridClPlus_Caption[PLanguageIndex];
 Grid_TaxNets_Column_Percent.Caption                   := GridClPercentSiqn_Caption[PLanguageIndex];
 Grid_TaxNets_Column_TextAdd.Caption                   := GridClAddText_Caption[PLanguageIndex];
//******************************************************************************
 try
  DB.Handle:=ADb_Handle;
  StProc.Transaction.StartTransaction;
  StProc.StoredProcName:='Z_TAX_NET_PERIOD_FOR_VO';
  StProc.Prepare;
  StProc.ParamByName('ID_VIDOPL').AsInteger := ID_Vidopl;
  StProc.ParamByName('KOD_SETUP').AsInteger := Kod_setup;
  StProc.ExecProc;
  DSet_TaxInfo.SQLs.SelectSQL.Text := 'SELECT * FROM Z_TAX_NETS_S('+StProc.ParamByName('ID_TAX_NET_PERIOD').AsString+')';
  StProc.Transaction.Commit;
 except
  on E:Exception do
   begin
    ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
    StProc.Transaction.Rollback;
    PIsOk:=False;
   end;
 end;
 if PIsOk then
  begin
   DefaultTransaction.StartTransaction;
   DSet_TaxInfo.Open;
   SelectBtn.Enabled := not DSet_TaxInfo.IsEmpty;
  end;
end;


procedure TFTaxesNetForCurrent.ActionExitExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFTaxesNetForCurrent.FormDestroy(Sender: TObject);
begin
if DefaultTransaction.InTransaction then DefaultTransaction.Commit;
end;

procedure TFTaxesNetForCurrent.ActionSelectExecute(Sender: TObject);
begin
if SelectBtn.Enabled then ModalResult:=mrYes;
end;

end.
