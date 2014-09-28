unit gr_Stud_Group_DM;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  IBase, RxMemDS, FIBQuery, pFIBQuery, pFIBStoredProc,
  Forms, gr_uCommonConsts, gr_uCommonProc, gr_uMessage, Dialogs, 
  gr_uCommonTypes,Dates,Variants, DBClient,
  pFIBClientDataSet, FMTBcd, SqlExpr, IBCustomDataSet;

type
  TDM_G = class(TDataModule)
    DSource1: TDataSource;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    StProcTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    RxMemoryData1: TRxMemoryData;
    DSetMoving: TpFIBDataSet;
    WriteTransaction: TpFIBTransaction;
    DSetEditPayment: TpFIBDataSet;
    DSourceEditPayment: TDataSource;
    StProc2: TpFIBStoredProc;
    StProc3: TpFIBStoredProc;
    StProcImport: TpFIBStoredProc;
    DSetStudSelEdit: TpFIBDataSet;
    DSourceStudEdit: TDataSource;
    DSetStudSel: TpFIBDataSet;
    DSourceStud: TDataSource;
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure RxMemoryData1AfterInsert(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
    CDate:string;
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);reintroduce;
  end;



var

Checked:integer;
UnChecked:integer;
CheckedColor:integer;
DefaultCheckedColor:integer;
UnCheckedColor:integer;

DM:TDM_G;
exports DM;


implementation

uses StrUtils;

{$R *.dfm}


constructor TDM_G.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  DB.Handle:=AHandle;
  ReadTransaction.DefaultDatabase:=DB;
  StProcTransaction.DefaultDatabase:=DB;
  WriteTransaction.DefaultDatabase:=DB;
  ReadTransaction.StartTransaction;
  DSetEditPayment.Close;
  DSetEditPayment.Transaction:=ReadTransaction;
  DSourceEditPayment.DataSet:=DSetEditPayment;


 //******************************************************************************
  DSetEditPayment.SQLs.SelectSQL.Text:='SELECT * FROM GR_MASS_PAYMENT_S';

  DSetEditPayment.AutoUpdateOptions.AutoReWriteSqls := True;
  DSetEditPayment.AutoUpdateOptions.CanChangeSQLs   := True;
  DSetEditPayment.AutoUpdateOptions.UpdateOnlyModifiedFields := True;


  DSetStudSel.AutoUpdateOptions.AutoReWriteSqls := True;
  DSetStudSel.AutoUpdateOptions.CanChangeSQLs   := True;
  DSetStudSel.AutoUpdateOptions.UpdateOnlyModifiedFields := True;

  DSetStudSelEdit.CachedUpdates:=True;


  //******************************************************************************


  DSetStudSel.SelectSQL.Text:='select * from GR_MASS_PAYMENT_MAN_S(:ID_GR_MASS_PAYMENT)';

  try
    DSetStudSel.Close;
    DSetEditPayment.Close;
    DSetEditPayment.Open;
    DSetStudSel.Open;
    DSetEditPayment.first;
  except
    showMessage('Помилка відбору виплат');
  end;



  RxMemoryData1.Close;
  RxMemoryData1.FieldDefs.Clear;
  RxMemoryData1.FieldDefs.Add('CHECKBOX',ftInteger,0,True);
  RxMemoryData1.FieldDefs.Add('ID_MAN',ftInteger,0,True);
  RxMemoryData1.FieldDefs.Add('ID_STUD',ftString,20,True);
  RxMemoryData1.FieldDefs.Add('FIO',ftString,100,True);
  RxMemoryData1.FieldDefs.Add('TYPE_PAYMENT_OUT',ftString,15,True);
  RxMemoryData1.FieldDefs.Add('NAME_DEPARTMENT',ftString,255,True);
  RxMemoryData1.FieldDefs.Add('CAT',ftString,40,True);
  RxMemoryData1.FieldDefs.Add('FORMA_OB',ftString,40,True);
  RxMemoryData1.FieldDefs.Add('TIN',ftString,40,True);
  RxMemoryData1.FieldDefs.Add('KURS',ftInteger,0,True);
  RxMemoryData1.FieldDefs.Add('CHECKBOXCOLOR',ftInteger,0,True);
  RxMemoryData1.Open;

  Checked:=1;
  UnChecked:=0;
  CheckedColor:=1;
  UnCheckedColor:=0;

  DefaultCheckedColor:=CheckedColor;

end;



procedure TDM_G.ReportGetValue(const VarName: String; var Value: Variant);
begin
  {if UpperCase(VarName)='FIRM' then
    Value:=grNameFirm(DB.Handle);

  if UpperCase(VarName)='CDATE' then
    Value:=CDate;}
end;

procedure TDM_G.RxMemoryData1AfterInsert(DataSet: TDataSet);
begin
  RxMemoryData1.FieldByName('CHECKBOX').Value:=UNCHECKED;
  RxMemoryData1.FieldByName('CHECKBOXCOLOR').Value:=DefaultCheckedColor;
end;

procedure TDM_G.DataModuleDestroy(Sender: TObject);
begin
  if ReadTransaction.active then  ReadTransaction.Commit;
end;

end.
