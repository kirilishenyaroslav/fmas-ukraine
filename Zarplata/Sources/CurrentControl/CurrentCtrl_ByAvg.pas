unit CurrentCtrl_ByAvg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, FIBDatabase, pFIBDatabase, DB, IBase,
  FIBDataSet, pFIBDataSet, ActnList, StdCtrls, cxButtons, cxTextEdit, zMessages,
  cxMaskEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, ZProc,
  Unit_Zglobal_Consts, cxCurrencyEdit, FIBQuery, pFIBQuery, pFIBStoredProc,
  PackageLoad;

type TFAvgDays_Result = record
  NumDays:integer;
  Summa:double;
  ModalResult:TModalResult;
end;

type
  TFAvgDays = class(TForm)
    Bevel1: TBevel;
    LabelData: TcxLabel;
    EditData: TcxMaskEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    ActionAvg: TAction;
    StProc: TpFIBStoredProc;
    AvgSumEdit: TcxMaskEdit;
    LabelAvg: TcxLabel;
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure LabelAvgClick(Sender: TObject);
  private
    PLanguageIndex:Byte;
    CurrDecimalSeparator:string[1];
    PDB_Handle:TISC_DB_HANDLE;
    PRmoving:integer;
    PKod_Setup:Integer;
  public
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;RMoving:integer;Kod_setup:integer);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TFAvgDays.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;RMoving:integer;Kod_setup:integer);
begin
 inherited Create(AOwner);
//------------------------------------------------------------------------------
 PLanguageIndex:=LanguageIndex;
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
 try
  DB.Handle := DB_Handle;
  StProc.Transaction.StartTransaction;
  StProc.StoredProcName := 'Z_AVARAGE_HOLIDAY';
  StProc.Prepare;
  StProc.ParamByName('RMOVING').AsInteger := RMoving;
  StProc.ParamByName('KOD_SETUP_B').AsInteger := Kod_setup;
  StProc.ParamByName('KOL_MONTHS').AsInteger := 12;

  StProc.ExecProc;
  AvgSumEdit.Text := ifThen(VarIsNULL(StProc.ParamByName('AVG_SUMMA').AsVariant),'0'+CurrDecimalSeparator+'00',
                            FloatToStrF(StProc.ParamByName('AVG_SUMMA').AsDouble,ffFixed,16,2));
  StProc.Transaction.Commit;
 except
  on E:Exception do
   begin
    ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
    StProc.Transaction.Rollback;
   end
 end;
end;

procedure TFAvgDays.ActionYesExecute(Sender: TObject);
begin
if EditData.Text='' then
 begin
  EditData.SetFocus;
  Exit;
 end;
ModalResult:=mrYes;
end;

procedure TFAvgDays.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFAvgDays.LabelAvgClick(Sender: TObject);
begin
  LoadShowAvg(self,PDB_Handle,PRmoving,PKod_Setup);
end;

end.
