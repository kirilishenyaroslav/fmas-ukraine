unit FormSheetMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxBar, dxBarExtItems, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,Ibase,
  Dates,Zproc,Unit_ReCountConsts,zMessages, zWait,
  DateUtils, cxContainer, cxProgressBar, dxStatusBar, Unit_ZGlobal_Consts,
  ExtCtrls;


type
  TuvFormSheet = class(TForm)
    PanelSheet: TPanel;
    pFIBDataSet1: TpFIBDataSet;
  private
    { Private declarations }
  public
  end;

function uvFormSheet(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;IDTypeSheet:integer;SumLimit:variant):Variant;stdcall;
 exports uvFormSheet;


implementation
{$R *.dfm}

function ShowForm(msg: string): TuvFormSheet;
var
 wf : TuvFormSheet;
begin
 wf := TuvFormSheet.Create(nil);
 wf.Width := 400;
 wf.Height := 100;
 wf.Left := (Application.MainForm.Width  - wf.Width)  div 2;
 wf.Top  := (Application.MainForm.Height - wf.Height) div 2;
 wf.PanelSheet.Caption := msg;

 Result         := wf;
 Result.Show;
 Result.Update;
end;


function zAccountToTmpShPro(DB_Handle:TISC_DB_HANDLE;aTypeSheet:integer;aIdSession:integer;SumLimit:variant):boolean;
var pStProc:TpFIBStoredProc;
    pTransaction:TpFIBTransaction;
    pDataBase:TpFIBDatabase;
begin
  pDataBase := TpFIBDatabase.Create(Application.MainForm);
  pTransaction := TpFIBTransaction.Create(Application.MainForm);
  pStProc := TpFIBStoredProc.Create(Application.MainForm);

  try
    try
       pDataBase.SQLDialect := 3;
       pDataBase.DefaultTransaction := pTransaction;
       pTransaction.DefaultDatabase := pDataBase;
       pStProc.Database := pDataBase;
       pStProc.Transaction := pTransaction;

       pDataBase.Handle := DB_Handle;
       pStProc.Transaction.StartTransaction;
       pStProc.StoredProcName := 'UV_FORMSHEET';
       pStProc.Prepare;
       pStProc.ParamByName('ID_TYPE_SHEET').AsInteger := aTypeSheet;
       pStProc.ParamByName('ID_SESSION').AsInteger := aIdSession;
       pStProc.ParamByName('LIMIT_SUM').AsVariant := SumLimit;
       pStProc.ExecProc;
       pStProc.Transaction.Commit;
       Result := True;
    except
      on e:exception do
       begin
        pStProc.Transaction.Rollback;
        zShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
        Result := False;
       end;
    end;
  finally
     pStProc.Destroy;
     pTransaction.Destroy;
     pDataBase.Destroy;
  end;
end;

function SetSch(DB_handle:TISC_DB_HANDLE;IdTypeSheet:integer;var Msg:string):integer;
var pStProc:TpFIBStoredProc;
    pTransaction:TpFIBTransaction;
    pDataBase:TpFIBDatabase;
    pDSet:TpFIBDataSet;
    pReadTransaction:TpFIBTransaction;
    prim:string;
    IdSession:integer;
begin
  Result := 0;
  Msg    := '';

  pDataBase        := TpFIBDatabase.Create(Application.MainForm);
  pTransaction     := TpFIBTransaction.Create(Application.MainForm);
  pStProc          := TpFIBStoredProc.Create(Application.MainForm);
  pDSet            := TpFIBDataSet.Create(Application.MainForm);
  pReadTransaction := TpFIBTransaction.Create(Application.MainForm);

  try
       pDataBase.SQLDialect             := 3;
       pDataBase.DefaultTransaction     := pTransaction;
       pTransaction.DefaultDatabase     := pDataBase;
       pReadTransaction.DefaultDatabase := pDataBase;
       pStProc.Database                 := pDataBase;
       pStProc.Transaction              := pTransaction;
       pDSet.Database                   := pDataBase;
       pDSet.Transaction                := pReadTransaction;
       pDataBase.Handle := DB_Handle;

    try
       pStProc.Transaction.StartTransaction;
       pStProc.StoredProcName := 'Z_PAYMENT_COUNT_SMETA_SCH_PREP';
       pStProc.Prepare;
       pStProc.ParamByName('ID_TYPE_SHEET').AsInteger := IDTypeSheet;
       pStProc.ExecProc;
       IdSession := pStProc.ParamByName('ID_SESSION').AsInteger;
       pStProc.Transaction.Commit;
    except
      on e:exception do
       begin
        pStProc.Transaction.Rollback;
        zShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
        Result := -1;
       end;
    end;

    if Result < 0 then exit;

    pDSet.sqls.SelectSQL.Text := 'select * from Z_PAYMENT_COUNT_SMETA_SCH_S('+IntToStr(IdSession)+')';
    pDSet.Open;
    pDSet.First;
    while not pDSet.Eof do
    try
       pStProc.Transaction.StartTransaction;
       pStProc.StoredProcName := 'Z_PAYMENT_COUNT_SMETA_SET_SCH';
       pStProc.Prepare;
       pStProc.ParamByName('ID_TYPE_SHEET').AsInteger := IDTypeSheet;
       pStProc.ParamByName('ID_SESSION').AsInteger    := IdSession;
       pStProc.ParamByName('ID_SMETA').AsVariant      := pDSet['ID_SMETA'];
       pStProc.ParamByName('PROP_ST').AsVariant       := pDSet['PROP_ST'];
       pStProc.ExecProc;
       pStProc.Transaction.Commit;
       pDSet.Next;
    except
      on e:exception do
      begin
          pStProc.Transaction.Rollback;
          Result := -2;
          Msg := Msg + e.message+#13;
          pDSet.Next;
      end;
    end;


    if (Result = -2) then
    try
       pStProc.Transaction.StartTransaction;
       pStProc.StoredProcName := 'Z_PAYMENT_COUNT_SMETA_SCH_D';
       pStProc.Prepare;
       pStProc.ParamByName('ID_SESSION').AsInteger := IdSession;
       pStProc.ExecProc;
       pStProc.Transaction.Commit;
    except
      on e:exception do
       begin
        pStProc.Transaction.Rollback;
        zShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
        Result := -3;
       end;
    end;

    if (Result=0) then Result := IdSession;

  finally
     pStProc.Destroy;
     pTransaction.Destroy;
     pDataBase.Destroy;
     pDSet.Destroy;
     pReadTransaction.Destroy;
  end;
end;

function uvFormSheet(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;IDTypeSheet:integer;SumLimit:variant):Variant;
var fs:TuvFormSheet;
    IdSession:integer;
    msg:string;
    Res:Variant;
begin
  Res:=0;
  try
   fs := ShowForm('Перевірка кошторисів');
   IdSession := SetSch(DB_HANDLE,IDTypeSheet,msg);
  finally
   fs.Destroy;
  end;

  if (IdSession=-2)
  then begin
            Res:=IdSession;  
            zShowMessage(Error_Caption[LanguageIndex],Msg + #13+'Увага! Ви не зможете зберегти розрахунок!',mtError,[mbOK]);
  end;

  try
   fs := ShowForm('Формування відомостей');
   zAccountToTmpShPro(DB_HANDLE,IDTypeSheet,IdSession,SumLimit);
  finally
   fs.Destroy;
  end;

  Result:=Res;
end;


end.
