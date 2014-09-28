unit UImportThread;

interface

uses
  Classes, Windows, Controls, DB,
  Ibase, ComCtrls, Dialogs, Forms,pFibDataSet,
  pFibStoredProc, SysUtils, Halcn6db,   StdCtrls;

type
  TDataImportThread = class(TThread)
  private
    ImportKeySession:Integer;
    PrBar       :TProgressBar;
    Form        :TForm;
    ResLabel    :TLabel;
    ResText     :string;
  protected
    procedure   Execute; override;
    procedure   UpdateBar;
    procedure   ClearBar;
    procedure   UpdateText;
    procedure   ImportRegUch;
    procedure   ImportKekv;
    procedure   ImportProperties;
    procedure   ImportBallance;
    procedure   ImportOper;
    procedure   ImportRazdSt;
    procedure   ImportBuInfo;
    procedure   ImportBuStru;
    procedure   ImportBuStru2;
    procedure   ImportBuDocs;
    procedure   ImportBuVal;
    procedure   ImportBuMval;
    procedure   ImportBuRests;
    procedure   ImportDoc;
    procedure   ImportSmGr;
    procedure   ImportPKV;
    procedure   ImportSmFnds;
    procedure   ImportPkvRsch;
    procedure   ImportBuCalc;
  public
    constructor Create(CreateSuspended: Boolean; Form:TForm);overload;
  end;

implementation

uses MainImport, IniFiles, FIBDataSet;

procedure TDataImportThread.Execute;
begin
     ImportKeySession:=TfrmImportMain(Form).Database.Gen_Id('GEN_ID_SESSION',1);

     if TfrmImportMain(Form).CheckRegUch.Checked and (not self.Terminated)
     then ImportRegUch;

     if TfrmImportMain(Form).CheckKEKV.Checked and (not self.Terminated)
     then ImportKekv;

     if TfrmImportMain(Form).CheckProperties.Checked and (not self.Terminated)
     then ImportProperties;

     if TfrmImportMain(Form).CheckRazdSt.Checked and (not self.Terminated)
     then ImportRazdSt;

     if TfrmImportMain(Form).CheckSch.Checked and (not self.Terminated)
     then ImportBallance;

     if TfrmImportMain(Form).CheckOper.Checked and (not self.Terminated)
     then ImportOper;

     if TfrmImportMain(Form).CheckBudget.Checked and (not self.Terminated)
     then ImportBuInfo;

     if TfrmImportMain(Form).CheckBuGr.Checked and (not self.Terminated)
     then ImportSmGr;

     if TfrmImportMain(Form).CheckBuPKV.Checked and (not self.Terminated)
     then ImportPKV;

     if TfrmImportMain(Form).CheckPkvRsch.Checked and (not self.Terminated)
     then ImportPkvRsch;

     if TfrmImportMain(Form).CheckBuFnds.Checked and (not self.Terminated)
     then ImportSmFnds;

     if TfrmImportMain(Form).CheckBudgetPer.Checked and (not self.Terminated)
     then ImportBuStru;

     if TfrmImportMain(Form).CheckBuStru.Checked and (not self.Terminated)
     then ImportBuStru2;

     if TfrmImportMain(Form).CheckBuDoc.Checked and (not self.Terminated)
     then ImportBuDocs;

     if TfrmImportMain(Form).CheckBuVal.Checked and (not self.Terminated)
     then ImportBuVal;

     if TfrmImportMain(Form).CheckBuMVal.Checked and (not self.Terminated)
     then ImportBuMVal;


     if TfrmImportMain(Form).CheckBuPValues.Checked and (not self.Terminated)
     then ImportBuRests;

     if TfrmImportMain(Form).CheckDocProv.Checked and (not self.Terminated)
     then ImportDoc;


     if TfrmImportMain(Form).CheckBuCalc.Checked and (not self.Terminated)
     then ImportBuCalc;
end;


constructor TDataImportThread.Create(CreateSuspended: Boolean;
  Form:TForm);
begin
  inherited Create(true);
  self.Form:=Form;
end;


procedure TDataImportThread.UpdateBar;
begin
     self.PrBar.StepBy(self.PrBar.Step);
end;

procedure TDataImportThread.ClearBar;
begin
    self.PrBar.Position:=0;
    self.PrBar.Update;
end;


procedure TDataImportThread.UpdateText;
begin
     ResLabel.Caption:=ResText;
end;

procedure TDataImportThread.ImportRegUch;
var i:Integer;
    DosDataDataSet:TpFibDataset;
    ClearProc,ImportProc:TpFibStoredProc;
begin
     //Очищаем таблицу от старых данных
     ClearProc:=TpFibStoredProc.Create(nil);
     ClearProc.Database:=TfrmImportMain(Form).Database;
     ClearProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     TfrmImportMain(Form).WriteTransaction.StartTransaction;
     ClearProc.StoredProcName:='DOS_IMPORT_INIT';
     ClearProc.Prepare;
     ClearProc.ParamByName('FLAG').AsInteger:=1;
     ClearProc.ExecProc;
     TfrmImportMain(Form).WriteTransaction.Commit;
     ClearProc.Close;
     ClearProc.Free;

     //Загружаем новые данные
     self.PrBar:=TfrmImportMain(Form).PrRegUch;
     DosDataDataSet:=TpFibDataset.Create(nil);
     DosDataDataSet.Database   :=TfrmImportMain(Form).Database;
     DosDataDataSet.Transaction:=TfrmImportMain(Form).ReadTransaction;
     DosDataDataSet.SelectSQL.Text:='SELECT * FROM DOS_SPR_SYS';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc:=TpFibStoredProc.Create(nil);
     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_REG_UCH';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('KOD_SYS').Value           :=DosDataDataSet.FieldByName('KOD_SYS').Value;
            ImportProc.ParamByName('NAME_SYS').Value          :=DosDataDataSet.FieldByName('NAME_SYS').Value;
            ImportProc.ParamByName('NAME_SHORT').Value        :=DosDataDataSet.FieldByName('NAME_SHORT').Value;
            ImportProc.ExecProc;
            Synchronize(UpdateBar);
            TfrmImportMain(Form).WriteTransaction.Commit;
            DosDataDataSet.Next;
     end;
     ImportProc.Free;
     DosDataDataSet.Close;
     DosDataDataSet.Free;
end;

procedure TDataImportThread.ImportBallance;
var i:Integer;
    DosDataDataSet:TpFibDataset;
    ClearProc,ImportProc:TpFibStoredProc;
begin
     //Очищаем таблицу от старых данных
     ClearProc:=TpFibStoredProc.Create(nil);
     ClearProc.Database:=TfrmImportMain(Form).Database;
     ClearProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     TfrmImportMain(Form).WriteTransaction.StartTransaction;
     ClearProc.StoredProcName:='DOS_IMPORT_INIT';
     ClearProc.Prepare;
     ClearProc.ParamByName('FLAG').AsInteger:=6;
     ClearProc.ExecProc;
     TfrmImportMain(Form).WriteTransaction.Commit;
     ClearProc.Close;
     ClearProc.Free;

     //Загружаем новые данные
     self.PrBar:=TfrmImportMain(Form).PrBal;
     DosDataDataSet:=TpFibDataset.Create(nil);
     DosDataDataSet.Database   :=TfrmImportMain(Form).Database;
     DosDataDataSet.Transaction:=TfrmImportMain(Form).ReadTransaction;
     DosDataDataSet.SelectSQL.Text:='SELECT * FROM DOS_SCH_SPR ORDER BY USE_END DESC';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc:=TpFibStoredProc.Create(nil);
     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
          //MessageBox(Application.MainForm.Handle,PChar(DosDataDataSet.ParamByName('BAL_ID').AsString+''+DosDataDataSet.ParamByName('SUB_ID').AsString+' '+DosDataDataSet.ParamByName('USE_BEG').AsString+'-'+DosDataDataSet.ParamByName('USE_END').AsString),PChar(DosDataDataSet.FieldByName('BAL_SCH').AsString+'/'+DosDataDataSet.FieldByName('SUB_SCH').AsString),MB_Ok);
          try
                  TfrmImportMain(Form).WriteTransaction.StartTransaction;
                  ImportProc.StoredProcName:='DOS_IMPORT_SCH';
                  ImportProc.Prepare;
                  ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
                  ImportProc.ParamByName('BAL_ID').Value        :=DosDataDataSet.FieldByName('BAL_ID').Value;
                  ImportProc.ParamByName('SUB_ID').Value        :=DosDataDataSet.FieldByName('SUB_ID').Value;
                  ImportProc.ParamByName('USE_BEG').Value       :=DosDataDataSet.FieldByName('USE_BEG').Value;
                  ImportProc.ParamByName('USE_END').Value       :=DosDataDataSet.FieldByName('USE_END').Value;
                  ImportProc.ParamByName('BAL_SCH').Value       :=DosDataDataSet.FieldByName('BAL_SCH').Value;
                  ImportProc.ParamByName('SUB_SCH').Value       :=DosDataDataSet.FieldByName('SUB_SCH').Value;
                  ImportProc.ParamByName('NAME_SCH').Value      :=DosDataDataSet.FieldByName('NAME_SCH').Value;
                  ImportProc.ParamByName('TIP_SCH').Value       :=DosDataDataSet.FieldByName('TIP_SCH').Value;
                  ImportProc.ParamByName('OPEN_SCH').Value      :=DosDataDataSet.FieldByName('OPEN_SCH').Value;
                  ImportProc.ParamByName('BLOCKED').Value       :=DosDataDataSet.FieldByName('BLOCKED').Value;
                  ImportProc.ParamByName('OPEN_SCH').Value      :=DosDataDataSet.FieldByName('OPEN_SCH').Value;
                  ImportProc.ParamByName('SYS_SCH').Value       :=DosDataDataSet.FieldByName('SYS_SCH').Value;
                  ImportProc.ExecProc;
                  Synchronize(UpdateBar);
                  TfrmImportMain(Form).WriteTransaction.Commit;
          except on E:Exception do
                 begin
                      if TfrmImportMain(Form).WriteTransaction.InTransaction
                      then TfrmImportMain(Form).WriteTransaction.Rollback;
                 end;
          end;


          DosDataDataSet.Next;
     end;
     ImportProc.Free;
     DosDataDataSet.Close;
     DosDataDataSet.Free;
end;

procedure TDataImportThread.ImportBuInfo;
var i:Integer;
    DosDataDataSet:TpFibDataset;
    ClearProc,ImportProc:TpFibStoredProc;
begin
     //Очищаем таблицу от старых данных
     ClearProc:=TpFibStoredProc.Create(nil);
     ClearProc.Database:=TfrmImportMain(Form).Database;
     ClearProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     TfrmImportMain(Form).WriteTransaction.StartTransaction;
     ClearProc.StoredProcName:='DOS_IMPORT_INIT';
     ClearProc.Prepare;
     ClearProc.ParamByName('FLAG').AsInteger:=8;
     ClearProc.ExecProc;
     TfrmImportMain(Form).WriteTransaction.Commit;
     ClearProc.Close;
     ClearProc.Free;

     //Загружаем новые данные
     self.PrBar:=TfrmImportMain(Form).PrBu;
     DosDataDataSet:=TpFibDataset.Create(nil);
     DosDataDataSet.Database   :=TfrmImportMain(Form).Database;
     DosDataDataSet.Transaction:=TfrmImportMain(Form).ReadTransaction;
     DosDataDataSet.SelectSQL.Text:='SELECT * FROM DOS_SMETA';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc:=TpFibStoredProc.Create(nil);
     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_SMETA';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('KOD_SM').Value        :=DosDataDataSet.FieldByName('KOD_SM').Value;
            ImportProc.ParamByName('NAME_SM').Value       :=DosDataDataSet.FieldByName('NAME_SM').Value;
            ImportProc.ParamByName('ENABLE').Value        :=DosDataDataSet.FieldByName('ENABLE').Value;
            ImportProc.ParamByName('KOD_S').Value         :=DosDataDataSet.FieldByName('KOD_S').Value;
            ImportProc.ParamByName('NAME').Value          :=DosDataDataSet.FieldByName('NAME').Value;
            ImportProc.ExecProc;
            Synchronize(UpdateBar);
            TfrmImportMain(Form).WriteTransaction.Commit;
            DosDataDataSet.Next;
     end;
     ImportProc.Free;
     DosDataDataSet.Close;
     DosDataDataSet.Free;
end;

procedure TDataImportThread.ImportKekv;
var i:Integer;
    DosDataDataSet:TpFibDataset;
    ClearProc,ImportProc:TpFibStoredProc;
begin
     //Очищаем таблицу от старых данных
     ClearProc:=TpFibStoredProc.Create(nil);
     ClearProc.Database:=TfrmImportMain(Form).Database;
     ClearProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     TfrmImportMain(Form).WriteTransaction.StartTransaction;
     ClearProc.StoredProcName:='DOS_IMPORT_INIT';
     ClearProc.Prepare;
     ClearProc.ParamByName('FLAG').AsInteger:=3;
     ClearProc.ExecProc;
     TfrmImportMain(Form).WriteTransaction.Commit;
     ClearProc.Close;
     ClearProc.Free;

     //Загружаем новые данные
     self.PrBar:=TfrmImportMain(Form).PrKekv;
     DosDataDataSet:=TpFibDataset.Create(nil);
     DosDataDataSet.Database   :=TfrmImportMain(Form).Database;
     DosDataDataSet.Transaction:=TfrmImportMain(Form).ReadTransaction;
     DosDataDataSet.SelectSQL.Text:='SELECT * FROM DOS_KEKV_DBF';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc:=TpFibStoredProc.Create(nil);
     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_KEKV';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('KEKV').Value           :=DosDataDataSet.FieldByName('KEKV').Value;
            ImportProc.ParamByName('NAME_KEKV').Value      :=DosDataDataSet.FieldByName('NAME_KEKV').Value;
            ImportProc.ParamByName('DATE_BEG').Value       :=DosDataDataSet.FieldByName('DATE_BEG').Value;
            ImportProc.ParamByName('LINKTO').Value         :=1;
            ImportProc.ExecProc;
            TfrmImportMain(Form).WriteTransaction.Commit;
            Synchronize(UpdateBar);
            DosDataDataSet.Next;
     end;

     TfrmImportMain(Form).WriteTransaction.StartTransaction;
     ImportProc.StoredProcName:='DOS_IMPORT_KEKV';
     ImportProc.Prepare;
     ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
     ImportProc.ParamByName('KEKV').Value           :=1;
     ImportProc.ParamByName('NAME_KEKV').Value      :='Коди видатків';
     ImportProc.ParamByName('DATE_BEG').Value       :=StrToDateTime('01.01.1996');
     ImportProc.ParamByName('LINKTO').Value         :=0;
     ImportProc.ExecProc;
     TfrmImportMain(Form).WriteTransaction.Commit;

     ImportProc.Free;
     DosDataDataSet.Close;
     DosDataDataSet.Free;
end;

procedure TDataImportThread.ImportOper;
var i:Integer;
    DosDataDataSet:TpFibDataset;
    ClearProc,ImportProc:TpFibStoredProc;
begin
     //Очищаем таблицу от старых данных
     ClearProc:=TpFibStoredProc.Create(nil);
     ClearProc.Database:=TfrmImportMain(Form).Database;
     ClearProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     TfrmImportMain(Form).WriteTransaction.StartTransaction;
     ClearProc.StoredProcName:='DOS_IMPORT_INIT';
     ClearProc.Prepare;
     ClearProc.ParamByName('FLAG').AsInteger:=4;
     ClearProc.ExecProc;
     TfrmImportMain(Form).WriteTransaction.Commit;
     ClearProc.Close;
     ClearProc.Free;

     //Загружаем новые данные
     self.PrBar:=TfrmImportMain(Form).PrOper;
     DosDataDataSet:=TpFibDataset.Create(nil);
     DosDataDataSet.Database   :=TfrmImportMain(Form).Database;
     DosDataDataSet.Transaction:=TfrmImportMain(Form).ReadTransaction;
     DosDataDataSet.SelectSQL.Text:='SELECT * FROM DOS_SPR_OPER';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc:=TpFibStoredProc.Create(nil);
     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_OPER';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('ID_OPER').Value           :=DosDataDataSet.FieldByName('ID_OPER').Value;
            ImportProc.ParamByName('USE_BEG').Value           :=DosDataDataSet.FieldByName('USE_BEG').Value;
            ImportProc.ParamByName('USE_END').Value           :=DosDataDataSet.FieldByName('USE_END').Value;
            ImportProc.ParamByName('DB_BAL_ID').Value         :=DosDataDataSet.FieldByName('DB_BAL_ID').Value;
            ImportProc.ParamByName('DB_SUB_ID').Value         :=DosDataDataSet.FieldByName('DB_SUB_ID').Value;
            ImportProc.ParamByName('DB_CR_RPOV').Value        :=DosDataDataSet.FieldByName('DB_CR_RPOV').Value;
            ImportProc.ParamByName('DB_CR_DOC').Value         :=DosDataDataSet.FieldByName('DB_CR_DOC').Value;
            ImportProc.ParamByName('KR_BAL_ID').Value         :=DosDataDataSet.FieldByName('KR_BAL_ID').Value;
            ImportProc.ParamByName('KR_SUB_ID').Value         :=DosDataDataSet.FieldByName('KR_SUB_ID').Value;
            ImportProc.ParamByName('KR_CR_PROV').Value        :=DosDataDataSet.FieldByName('KR_CR_PROV').Value;
            ImportProc.ParamByName('KR_CR_DOC').Value         :=DosDataDataSet.FieldByName('KR_CR_DOC').Value;
            ImportProc.ParamByName('COMMENT').Value           :=DosDataDataSet.FieldByName('COMMENT').Value;


            ImportProc.ExecProc;
            TfrmImportMain(Form).WriteTransaction.Commit;
            Synchronize(UpdateBar);
            DosDataDataSet.Next;
     end;

     ImportProc.Free;
     DosDataDataSet.Close;
     DosDataDataSet.Free;
end;

procedure TDataImportThread.ImportProperties;
var i:Integer;
    DosDataDataSet:TpFibDataset;
    ClearProc,ImportProc:TpFibStoredProc;
begin
     //Очищаем таблицу от старых данных
     ClearProc:=TpFibStoredProc.Create(nil);
     ClearProc.Database:=TfrmImportMain(Form).Database;
     ClearProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     TfrmImportMain(Form).WriteTransaction.StartTransaction;
     ClearProc.StoredProcName:='DOS_IMPORT_INIT';
     ClearProc.Prepare;
     ClearProc.ParamByName('FLAG').AsInteger:=2;
     ClearProc.ExecProc;
     TfrmImportMain(Form).WriteTransaction.Commit;
     ClearProc.Close;
     ClearProc.Free;

     //Загружаем новые данные
     self.PrBar:=TfrmImportMain(Form).PrProperties;
     DosDataDataSet:=TpFibDataset.Create(nil);
     DosDataDataSet.Database   :=TfrmImportMain(Form).Database;
     DosDataDataSet.Transaction:=TfrmImportMain(Form).ReadTransaction;
     DosDataDataSet.SelectSQL.Text:='SELECT * FROM DOS_SCH_RSCH';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc:=TpFibStoredProc.Create(nil);
     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_PROPERTIES';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('PROPERTIES').Value   :=DosDataDataSet.FieldByName('PROPERTIES').Value;
            ImportProc.ParamByName('NOTE').Value         :=DosDataDataSet.FieldByName('NOTE').Value;
            ImportProc.ParamByName('PROP_TYPE').Value    :=1;
            ImportProc.ExecProc;
            TfrmImportMain(Form).WriteTransaction.Commit;
            Synchronize(UpdateBar);
            DosDataDataSet.Next;
     end;

     DosDataDataSet.Close;
     Synchronize(ClearBar);

     DosDataDataSet.SelectSQL.Text:='SELECT * FROM DOS_RST_PROP';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_PROPERTIES';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('PROPERTIES').Value   :=DosDataDataSet.FieldByName('PROPERTY').Value;
            ImportProc.ParamByName('NOTE').Value         :=DosDataDataSet.FieldByName('NAME_PROP').Value;
            ImportProc.ParamByName('PROP_TYPE').Value    :=3;
            ImportProc.ExecProc;
            TfrmImportMain(Form).WriteTransaction.Commit;
            Synchronize(UpdateBar);
            DosDataDataSet.Next;
     end;

     DosDataDataSet.Close;

     ImportProc.Free;
     DosDataDataSet.Free;
end;

procedure TDataImportThread.ImportBuStru;
var i:Integer;
    DosDataDataSet:TpFibDataset;
    ClearProc,ImportProc:TpFibStoredProc;
begin
     //Очищаем таблицу от старых данных
     ClearProc:=TpFibStoredProc.Create(nil);
     ClearProc.Database:=TfrmImportMain(Form).Database;
     ClearProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     TfrmImportMain(Form).WriteTransaction.StartTransaction;
     ClearProc.StoredProcName:='DOS_IMPORT_INIT';
     ClearProc.Prepare;
     ClearProc.ParamByName('FLAG').AsInteger:=10;
     ClearProc.ExecProc;
     TfrmImportMain(Form).WriteTransaction.Commit;
     ClearProc.Close;
     ClearProc.Free;

     //Загружаем новые данные
     self.PrBar:=TfrmImportMain(Form).PrBuPeriod;
     DosDataDataSet:=TpFibDataset.Create(nil);
     DosDataDataSet.Database   :=TfrmImportMain(Form).Database;
     DosDataDataSet.Transaction:=TfrmImportMain(Form).ReadTransaction;
     DosDataDataSet.SelectSQL.Text:='SELECT * FROM DOS_SM_REAL';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc:=TpFibStoredProc.Create(nil);
     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_SMETA_PERIODS';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('ID_SM').Value             :=DosDataDataSet.FieldByName('ID_SM').Value;
            ImportProc.ParamByName('DATE_BEG').Value          :=DosDataDataSet.FieldByName('DATE_BEG').Value;
            ImportProc.ParamByName('DATE_END').Value          :=DosDataDataSet.FieldByName('DATE_END').Value;
            ImportProc.ParamByName('KOD_SM_GR').Value         :=DosDataDataSet.FieldByName('KOD_SM_GR').Value;
            ImportProc.ParamByName('KOD_SM').Value            :=DosDataDataSet.FieldByName('KOD_SM').Value;
            ImportProc.ParamByName('LAST_F').Value            :=DosDataDataSet.FieldByName('LAST_F').Value;
            ImportProc.ParamByName('LAST_K').Value            :=DosDataDataSet.FieldByName('LAST_K').Value;
            ImportProc.ExecProc;
            TfrmImportMain(Form).WriteTransaction.Commit;
            Synchronize(UpdateBar);
            DosDataDataSet.Next;
     end;

     ImportProc.Free;
     DosDataDataSet.Close;
     DosDataDataSet.Free;
end;

procedure TDataImportThread.ImportBuStru2;
var i:Integer;
    DosDataDataSet:TpFibDataset;
    ClearProc,ImportProc:TpFibStoredProc;
begin
     //Очищаем таблицу от старых данных
     ClearProc:=TpFibStoredProc.Create(nil);
     ClearProc.Database:=TfrmImportMain(Form).Database;
     ClearProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     TfrmImportMain(Form).WriteTransaction.StartTransaction;
     ClearProc.StoredProcName:='DOS_IMPORT_INIT';
     ClearProc.Prepare;
     ClearProc.ParamByName('FLAG').AsInteger:=7;
     ClearProc.ExecProc;
     TfrmImportMain(Form).WriteTransaction.Commit;
     ClearProc.Close;
     ClearProc.Free;

     //Загружаем новые данные
     self.PrBar:=TfrmImportMain(Form).PrBuStru;
     DosDataDataSet:=TpFibDataset.Create(nil);
     DosDataDataSet.Database   :=TfrmImportMain(Form).Database;
     DosDataDataSet.Transaction:=TfrmImportMain(Form).ReadTransaction;
     DosDataDataSet.SelectSQL.Text:='SELECT * FROM DOS_SM_RAZD';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc:=TpFibStoredProc.Create(nil);
     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_SMETA_STRU';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('ID_SM').Value             :=DosDataDataSet.FieldByName('ID_SM').Value;
            ImportProc.ParamByName('ID_SUB_SM').Value         :=DosDataDataSet.FieldByName('ID_SUB_SM').Value;
            ImportProc.ParamByName('KOD_RAZ').Value           :=DosDataDataSet.FieldByName('KOD_RAZ').Value;
            ImportProc.ParamByName('ISSMET').Value            :=DosDataDataSet.FieldByName('ISSMET').Value;
            ImportProc.ExecProc;
            TfrmImportMain(Form).WriteTransaction.Commit;
            Synchronize(UpdateBar);
            DosDataDataSet.Next;
     end;

     ImportProc.Free;
     DosDataDataSet.Close;
     DosDataDataSet.Free;
end;

procedure TDataImportThread.ImportDoc;
var i:Integer;
    DosDataDataSet:TpFibDataset;
    ClearProc,ImportProc:TpFibStoredProc;
begin
     //Очищаем таблицу от старых данных
     ResLabel:=TfrmImportMain(Form).Label1;
     ResText:='Инициализация импорта данных';
     Synchronize(UpdateText);

     ClearProc:=TpFibStoredProc.Create(nil);
     ClearProc.Database:=TfrmImportMain(Form).Database;
     ClearProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     TfrmImportMain(Form).WriteTransaction.StartTransaction;
     ClearProc.StoredProcName:='DOS_IMPORT_INIT';
     ClearProc.Prepare;
     ClearProc.ParamByName('FLAG').AsInteger:=9;
     ClearProc.ExecProc;
     TfrmImportMain(Form).WriteTransaction.Commit;
     ClearProc.Close;
     ClearProc.Free;

     //Загружаем новые данные
     self.PrBar:=TfrmImportMain(Form).PrDoc;
     DosDataDataSet:=TpFibDataset.Create(nil);
     DosDataDataSet.Database   :=TfrmImportMain(Form).Database;
     DosDataDataSet.Transaction:=TfrmImportMain(Form).ReadTransaction;
     DosDataDataSet.SelectSQL.Text:='SELECT * FROM DOS_DATA_ALL_DOC ';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc:=TpFibStoredProc.Create(nil);
     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_DOC';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('ID_DOC').AsInt64          :=StrToInt64(DosDataDataSet.FieldByName('ID_DOC').AsString);
            ImportProc.ParamByName('ID_OUT_DOC').AsInt64      :=StrToInt64(DosDataDataSet.FieldByName('ID_OUT_DOC').AsString);
            ImportProc.ParamByName('DATE_REG').Value          :=DosDataDataSet.FieldByName('DATE_REG').Value;
            ImportProc.ParamByName('DATE_PROV').Value         :=DosDataDataSet.FieldByName('DATE_PROV').Value;
            ImportProc.ParamByName('KOD_SYS').Value           :=DosDataDataSet.FieldByName('KOD_SYS').Value;
            ImportProc.ParamByName('NUM_DOC').Value           :=DosDataDataSet.FieldByName('NUM_DOC').Value;
            ImportProc.ParamByName('DATE_DOC').Value          :=DosDataDataSet.FieldByName('DATE_DOC').Value;
            ImportProc.ParamByName('SUMMA').Value             :=DosDataDataSet.FieldByName('SUMMA').Value;
            ImportProc.ParamByName('KODP').Value              :=DosDataDataSet.FieldByName('KODP').Value;
            ImportProc.ParamByName('NOTE').Value              :=DosDataDataSet.FieldByName('NOTE').Value;
            ImportProc.ParamByName('FIO').Value               :=DosDataDataSet.FieldByName('FIO').Value;
            ImportProc.ParamByName('MFO_DGU').Value           :=DosDataDataSet.FieldByName('MFO_DGU').Value;
            ImportProc.ParamByName('RSCHET_DGU').Value        :=DosDataDataSet.FieldByName('RSCHET_DGU').Value;
            ImportProc.ParamByName('MFO').Value               :=DosDataDataSet.FieldByName('MFO').Value;
            ImportProc.ParamByName('RSCHET').Value            :=DosDataDataSet.FieldByName('RSCHET').Value;
            ImportProc.ParamByName('PRIHOD').Value            :=DosDataDataSet.FieldByName('PRIHOD').Value;
            ImportProc.ParamByName('N_PP').Value              :=DosDataDataSet.FieldByName('NPP').Value;
            ImportProc.ParamByName('TYPE_DOC').Value          :=DosDataDataSet.FieldByName('TYPE_DOC').Value;
            ImportProc.ExecProc;
            TfrmImportMain(Form).WriteTransaction.Commit;
            Synchronize(UpdateBar);
            DosDataDataSet.Next;

            ResText:=IntToStr(i)+' from '+IntToStr(DosDataDataSet.RecordCount);
            Synchronize(UpdateText);
     end;

     self.PrBar:=TfrmImportMain(Form).PrProv;
     if DosDataDataSet.Active then DosDataDataSet.Close;
     DosDataDataSet.SelectSQL.Text:=' SELECT * FROM DOS_DATA_ALL_PROV ';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_PROV';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('ID_PROV').Value           :=DosDataDataSet.FieldByName('ID_PROV').Value;
            ImportProc.ParamByName('DB_ID_DOC').AsInt64       :=StrToInt64(DosDataDataSet.FieldByName('DB_ID_DOC').AsString);
            ImportProc.ParamByName('KR_ID_DOC').AsInt64       :=StrToInt64(DosDataDataSet.FieldByName('KR_ID_DOC').asString);
            ImportProc.ParamByName('DATE_REG').Value          :=DosDataDataSet.FieldByName('DATE_REG').Value;
            ImportProc.ParamByName('ID_OPER').Value           :=DosDataDataSet.FieldByName('ID_OPER').Value;
            ImportProc.ParamByName('CR_BY_DT').Value          :=DosDataDataSet.FieldByName('CR_BY_DT').Value;
            ImportProc.ParamByName('STORNO').Value            :=DosDataDataSet.FieldByName('STORNO').Value;
            ImportProc.ParamByName('DB_SYS').Value            :=DosDataDataSet.FieldByName('DB_SYS').Value;
            ImportProc.ParamByName('DB_KOD_SM').Value         :=DosDataDataSet.FieldByName('DB_KOD_SM').Value;
            ImportProc.ParamByName('DB_KOD_RAZ').Value        :=DosDataDataSet.FieldByName('DB_KOD_RAZ').Value;
            ImportProc.ParamByName('DB_KOD_ST').Value         :=DosDataDataSet.FieldByName('DB_KOD_ST').Value;
            ImportProc.ParamByName('DB_DT_PROV').Value        :=DosDataDataSet.FieldByName('DB_DT_PROV').Value;
            ImportProc.ParamByName('KR_SYS').Value            :=DosDataDataSet.FieldByName('KR_SYS').Value;
            ImportProc.ParamByName('KR_KOD_SM').Value         :=DosDataDataSet.FieldByName('KR_KOD_SM').Value;
            ImportProc.ParamByName('KR_KOD_RAZ').Value        :=DosDataDataSet.FieldByName('KR_KOD_RAZ').Value;
            ImportProc.ParamByName('KR_KOD_ST').Value         :=DosDataDataSet.FieldByName('KR_KOD_ST').Value;
            ImportProc.ParamByName('KR_DT_PROV').Value        :=DosDataDataSet.FieldByName('KR_DT_PROV').Value;
            ImportProc.ParamByName('SM_TYPE').Value           :=DosDataDataSet.FieldByName('SM_TYPE').Value;
            ImportProc.ParamByName('ID_DOG').AsInt64          :=StrToInt64(DosDataDataSet.FieldByName('ID_DOG').AsString);
            ImportProc.ParamByName('KOD_DOG').AsInt64         :=StrToInt64(DosDataDataSet.FieldByName('KOD_DOG').AsString);
            ImportProc.ParamByName('TN').Value                :=DosDataDataSet.FieldByName('TN').Value;
            ImportProc.ParamByName('SUMMA').Value             :=DosDataDataSet.FieldByName('SUMMA').Value;
            ImportProc.ParamByName('DB_KEKV').Value           :=DosDataDataSet.FieldByName('DB_KEKV').Value;
            ImportProc.ParamByName('KR_KEKV').Value           :=DosDataDataSet.FieldByName('KR_KEKV').Value;
            ImportProc.ExecProc;
            TfrmImportMain(Form).WriteTransaction.Commit;
            Synchronize(UpdateBar);
            DosDataDataSet.Next;

            ResText:=IntToStr(i)+' from '+IntToStr(DosDataDataSet.RecordCount);
            Synchronize(UpdateText);
     end;

     ImportProc.Free;
     DosDataDataSet.Close;
     DosDataDataSet.Free;
end;

procedure TDataImportThread.ImportRazdSt;
var i:Integer;
    DosDataDataSet:TpFibDataset;
    ClearProc,ImportProc:TpFibStoredProc;
begin
     //Очищаем таблицу от старых данных
     ClearProc:=TpFibStoredProc.Create(nil);
     ClearProc.Database:=TfrmImportMain(Form).Database;
     ClearProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     TfrmImportMain(Form).WriteTransaction.StartTransaction;
     ClearProc.StoredProcName:='DOS_IMPORT_INIT';
     ClearProc.Prepare;
     ClearProc.ParamByName('FLAG').AsInteger:=5;
     ClearProc.ExecProc;
     TfrmImportMain(Form).WriteTransaction.Commit;
     ClearProc.Close;
     ClearProc.Free;

     //Загружаем новые данные
     self.PrBar:=TfrmImportMain(Form).PrRazdSt;
     DosDataDataSet:=TpFibDataset.Create(nil);
     DosDataDataSet.Database   :=TfrmImportMain(Form).Database;
     DosDataDataSet.Transaction:=TfrmImportMain(Form).ReadTransaction;
     DosDataDataSet.SelectSQL.Text:='SELECT * FROM DOS_RAZD_ST';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc:=TpFibStoredProc.Create(nil);
     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_RAZD_ST';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('KOD_RAZ').Value           :=DosDataDataSet.FieldByName('KOD_RAZ').Value;
            ImportProc.ParamByName('KOD_ST').Value            :=DosDataDataSet.FieldByName('KOD_ST').Value;
            ImportProc.ParamByName('NAME').Value              :=DosDataDataSet.FieldByName('NAME').Value;
            ImportProc.ParamByName('PROFITABLE').Value        :=DosDataDataSet.FieldByName('PROFITABLE').Value;
            ImportProc.ParamByName('ENABLE').Value            :=DosDataDataSet.FieldByName('ENABLE').Value;
            ImportProc.ParamByName('KOD_R').Value             :=DosDataDataSet.FieldByName('KOD_R').Value;
            ImportProc.ParamByName('PL_BY_RAZ').Value         :=DosDataDataSet.FieldByName('PL_BY_RAZ').Value;
            ImportProc.ExecProc;
            TfrmImportMain(Form).WriteTransaction.Commit;
            Synchronize(UpdateBar);
            DosDataDataSet.Next;
     end;

     ImportProc.Free;
     DosDataDataSet.Close;
     DosDataDataSet.Free;
end;

procedure TDataImportThread.ImportBuDocs;
var i:Integer;
    DosDataDataSet:TpFibDataset;
    ClearProc,ImportProc:TpFibStoredProc;
begin
     //Очищаем таблицу от старых данных
     ClearProc:=TpFibStoredProc.Create(nil);
     ClearProc.Database:=TfrmImportMain(Form).Database;
     ClearProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     TfrmImportMain(Form).WriteTransaction.StartTransaction;
     ClearProc.StoredProcName:='DOS_IMPORT_INIT';
     ClearProc.Prepare;
     ClearProc.ParamByName('FLAG').AsInteger:=11;
     ClearProc.ExecProc;
     TfrmImportMain(Form).WriteTransaction.Commit;
     ClearProc.Close;
     ClearProc.Free;

     //Загружаем новые данные
     self.PrBar:=TfrmImportMain(Form).PrBuDoc;
     DosDataDataSet:=TpFibDataset.Create(nil);
     DosDataDataSet.Database   :=TfrmImportMain(Form).Database;
     DosDataDataSet.Transaction:=TfrmImportMain(Form).ReadTransaction;
     DosDataDataSet.SelectSQL.Text:='SELECT ID_PLAN FROM BU_SMET_PLUS_PERIODS';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc:=TpFibStoredProc.Create(nil);
     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_SMETA_PVALUES';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('ID_PLAN').AsInt64         :=StrToInt64(DosDataDataSet.FieldByName('ID_PLAN').AsString);
            ImportProc.ExecProc;
            TfrmImportMain(Form).WriteTransaction.Commit;
            Synchronize(UpdateBar);
            DosDataDataSet.Next;
     end;

     ImportProc.Free;
     DosDataDataSet.Close;
     DosDataDataSet.Free;
end;

procedure TDataImportThread.ImportBuRests;
begin
end;

procedure TDataImportThread.ImportPKV;
 var i:Integer;
     DosDataDataSet:TpFibDataset;
     ClearProc,ImportProc:TpFibStoredProc;
begin
     //Очищаем таблицу от старых данных
     ClearProc:=TpFibStoredProc.Create(nil);
     ClearProc.Database:=TfrmImportMain(Form).Database;
     ClearProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     TfrmImportMain(Form).WriteTransaction.StartTransaction;
     ClearProc.StoredProcName:='DOS_IMPORT_INIT';
     ClearProc.Prepare;
     ClearProc.ParamByName('FLAG').AsInteger:=12;
     ClearProc.ExecProc;
     TfrmImportMain(Form).WriteTransaction.Commit;
     ClearProc.Close;
     ClearProc.Free;


     //Загружаем новые данные
     self.PrBar:=TfrmImportMain(Form).PrBuPKV;
     DosDataDataSet:=TpFibDataset.Create(nil);
     DosDataDataSet.Database   :=TfrmImportMain(Form).Database;
     DosDataDataSet.Transaction:=TfrmImportMain(Form).ReadTransaction;
     DosDataDataSet.SelectSQL.Text:='SELECT * FROM DOS_SM_PKV';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc:=TpFibStoredProc.Create(nil);
     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_PROGRAMMS';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('ID_PKV').Value      :=DosDataDataSet.FieldByName('ID_PKV').Value;
            ImportProc.ParamByName('KPKV').Value        :=DosDataDataSet.FieldByName('KPKV').Value;
            ImportProc.ParamByName('DATE_BEG').Value    :=DosDataDataSet.FieldByName('DATE_BEG').Value;
            ImportProc.ParamByName('NAME_PKV').Value    :=DosDataDataSet.FieldByName('NAME_PKV').Value;
            ImportProc.ParamByName('MO_POSTFIX').Value  :=DosDataDataSet.FieldByName('MO_POSTFIX').Value;
            ImportProc.ParamByName('DATE_STAMP').Value  :=DosDataDataSet.FieldByName('DATE_STAMP').Value;
            ImportProc.ExecProc;
            TfrmImportMain(Form).WriteTransaction.Commit;
            Synchronize(UpdateBar);
            DosDataDataSet.Next;
     end;

     ImportProc.Free;
     DosDataDataSet.Close;
     DosDataDataSet.Free;
end;

procedure TDataImportThread.ImportSmFnds;
 var i:Integer;
     DosDataDataSet:TpFibDataset;
     ImportProc:TpFibStoredProc;
begin
     //Загружаем новые данные
     self.PrBar:=TfrmImportMain(Form).PrBuFnds;
     DosDataDataSet:=TpFibDataset.Create(nil);
     DosDataDataSet.Database   :=TfrmImportMain(Form).Database;
     DosDataDataSet.Transaction:=TfrmImportMain(Form).ReadTransaction;
     DosDataDataSet.SelectSQL.Text:='SELECT * FROM DOS_SM_FONDS';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc:=TpFibStoredProc.Create(nil);
     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_SM_FONDS';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('KOD_SM_GR').Value         :=DosDataDataSet.FieldByName('KOD_SM_GR').Value;
            ImportProc.ParamByName('DATE_BEG').Value          :=DosDataDataSet.FieldByName('DATE_BEG').Value;
            ImportProc.ParamByName('DATE_END').Value          :=DosDataDataSet.FieldByName('DATE_END').Value;
            ImportProc.ParamByName('PR_BAL_ID').Value         :=DosDataDataSet.FieldByName('PR_BAL_ID').Value;
            ImportProc.ParamByName('PR_SUB_ID').Value         :=DosDataDataSet.FieldByName('PR_SUB_ID').Value;
            ImportProc.ParamByName('NPR_BAL_ID').Value        :=DosDataDataSet.FieldByName('NPR_BAL_ID').Value;
            ImportProc.ParamByName('NPR_SUB_ID').Value        :=DosDataDataSet.FieldByName('NPR_SUB_ID').Value;
            ImportProc.ParamByName('DATE_STAMP').Value        :=DosDataDataSet.FieldByName('DATE_STAMP').Value;

            ImportProc.ExecProc;
            TfrmImportMain(Form).WriteTransaction.Commit;
            Synchronize(UpdateBar);
            DosDataDataSet.Next;
     end;

     ImportProc.Free;
     DosDataDataSet.Close;
     DosDataDataSet.Free;
end;

procedure TDataImportThread.ImportSmGr;
 var i:Integer;
     DosDataDataSet:TpFibDataset;
     ClearProc,ImportProc:TpFibStoredProc;
begin
     //Очищаем таблицу от старых данных
     ClearProc:=TpFibStoredProc.Create(nil);
     ClearProc.Database:=TfrmImportMain(Form).Database;
     ClearProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     TfrmImportMain(Form).WriteTransaction.StartTransaction;
     ClearProc.StoredProcName:='DOS_IMPORT_INIT';
     ClearProc.Prepare;
     ClearProc.ParamByName('FLAG').AsInteger:=13;
     ClearProc.ExecProc;
     TfrmImportMain(Form).WriteTransaction.Commit;
     ClearProc.Close;
     ClearProc.Free;


     //Загружаем новые данные
     self.PrBar:=TfrmImportMain(Form).PrBuGr;
     DosDataDataSet:=TpFibDataset.Create(nil);
     DosDataDataSet.Database   :=TfrmImportMain(Form).Database;
     DosDataDataSet.Transaction:=TfrmImportMain(Form).ReadTransaction;
     DosDataDataSet.SelectSQL.Text:='SELECT * FROM DOS_SM_GROUP';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc:=TpFibStoredProc.Create(nil);
     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_SM_GR';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('KOD_SM_GR').Value         :=DosDataDataSet.FieldByName('KOD_SM_GR').Value;
            ImportProc.ParamByName('NAME_SM_GR').Value        :=DosDataDataSet.FieldByName('NAME_SM_GR').Value;
            ImportProc.ParamByName('KPKV').Value              :=DosDataDataSet.FieldByName('KPKV').Value;
            ImportProc.ParamByName('ENABLE').Value            :=DosDataDataSet.FieldByName('ENABLE').Value;
            ImportProc.ParamByName('KOD_SMMAIN').Value        :=DosDataDataSet.FieldByName('KOD_SMMAIN').Value;
            ImportProc.ParamByName('DATE_STAMP').Value        :=DosDataDataSet.FieldByName('DATE_STAMP').Value;
            ImportProc.ExecProc;
            TfrmImportMain(Form).WriteTransaction.Commit;
            Synchronize(UpdateBar);
            DosDataDataSet.Next;
     end;

     ImportProc.Free;
     DosDataDataSet.Close;
     DosDataDataSet.Free;
end;

procedure TDataImportThread.ImportPkvRsch;
 var i:Integer;
     DosDataDataSet:TpFibDataset;
     ClearProc,ImportProc:TpFibStoredProc;
begin
     //Очищаем таблицу от старых данных
     ClearProc:=TpFibStoredProc.Create(nil);
     ClearProc.Database:=TfrmImportMain(Form).Database;
     ClearProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     TfrmImportMain(Form).WriteTransaction.StartTransaction;
     ClearProc.StoredProcName:='DOS_IMPORT_INIT';
     ClearProc.Prepare;
     ClearProc.ParamByName('FLAG').AsInteger:=14;
     ClearProc.ExecProc;
     TfrmImportMain(Form).WriteTransaction.Commit;
     ClearProc.Close;
     ClearProc.Free;


     //Загружаем новые данные
     self.PrBar:=TfrmImportMain(Form).PrPkvRsch;
     DosDataDataSet:=TpFibDataset.Create(nil);
     DosDataDataSet.Database   :=TfrmImportMain(Form).Database;
     DosDataDataSet.Transaction:=TfrmImportMain(Form).ReadTransaction;
     DosDataDataSet.SelectSQL.Text:='SELECT * FROM DOS_SM_G_RS';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc:=TpFibStoredProc.Create(nil);
     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_PKV_RSCH';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('KPKV').Value              :=DosDataDataSet.FieldByName('KPKV').Value;
            ImportProc.ParamByName('MFO').Value               :=DosDataDataSet.FieldByName('MFO').Value;
            ImportProc.ParamByName('RSCHET').Value            :=DosDataDataSet.FieldByName('RSCHET').Value;
            ImportProc.ParamByName('DATE_BEG').Value          :=DosDataDataSet.FieldByName('DATE_BEG').Value;
            ImportProc.ParamByName('DATE_END').Value          :=DosDataDataSet.FieldByName('DATE_END').Value;
            ImportProc.ParamByName('DATE_TIME').Value         :=DosDataDataSet.FieldByName('DATE_TIME').Value;
            ImportProc.ParamByName('KOD_BUHG').Value          :=DosDataDataSet.FieldByName('KOD_BUHG').Value;
            ImportProc.ExecProc;
            TfrmImportMain(Form).WriteTransaction.Commit;
            Synchronize(UpdateBar);
            DosDataDataSet.Next;
     end;

     ImportProc.Free;
     DosDataDataSet.Close;
     DosDataDataSet.Free;
end;

procedure TDataImportThread.ImportBuVal;
var i:Integer;
     DosDataDataSet:TpFibDataset;
     ClearProc,ImportProc:TpFibStoredProc;
begin
     //Очищаем таблицу от старых данных
     ClearProc:=TpFibStoredProc.Create(nil);
     ClearProc.Database:=TfrmImportMain(Form).Database;
     ClearProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     TfrmImportMain(Form).WriteTransaction.StartTransaction;
     ClearProc.StoredProcName:='DOS_IMPORT_INIT';
     ClearProc.Prepare;
     ClearProc.ParamByName('FLAG').AsInteger:=15;
     ClearProc.ExecProc;
     TfrmImportMain(Form).WriteTransaction.Commit;
     ClearProc.Close;
     ClearProc.Free;


     //Загружаем новые данные
     self.PrBar:=TfrmImportMain(Form).PrBuVal;
     DosDataDataSet:=TpFibDataset.Create(nil);
     DosDataDataSet.Database   :=TfrmImportMain(Form).Database;
     DosDataDataSet.Transaction:=TfrmImportMain(Form).ReadTransaction;
     DosDataDataSet.SelectSQL.Text:='SELECT * FROM DOS_SM_VALUES';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc:=TpFibStoredProc.Create(nil);
     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_SM_VAL';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('ID_SM').AsInt64           :=StrToInt64(DosDataDataSet.FieldByName('ID_SM').AsString);
            ImportProc.ParamByName('KOD_RAZ').Value           :=DosDataDataSet.FieldByName('KOD_RAZ').Value;
            ImportProc.ParamByName('KOD_ST').Value            :=DosDataDataSet.FieldByName('KOD_ST').Value;
            ImportProc.ParamByName('F_SUMMA').Value           :=DosDataDataSet.FieldByName('F_SUMMA').Value;
            ImportProc.ParamByName('K_SUMMA').Value           :=DosDataDataSet.FieldByName('K_SUMMA').Value;
            ImportProc.ExecProc;
            TfrmImportMain(Form).WriteTransaction.Commit;
            Synchronize(UpdateBar);
            DosDataDataSet.Next;
     end;

     ImportProc.Free;
     DosDataDataSet.Close;
     DosDataDataSet.Free;
end;

procedure TDataImportThread.ImportBuCalc;
var i:Integer;
     DosDataDataSet:TpFibDataset;
     ClearProc,ImportProc:TpFibStoredProc;
begin
     //Очищаем таблицу от старых данных
     ClearProc:=TpFibStoredProc.Create(nil);
     ClearProc.Database:=TfrmImportMain(Form).Database;
     ClearProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     TfrmImportMain(Form).WriteTransaction.StartTransaction;
     ClearProc.StoredProcName:='DOS_IMPORT_INIT';
     ClearProc.Prepare;
     ClearProc.ParamByName('FLAG').AsInteger:=16;
     ClearProc.ExecProc;
     TfrmImportMain(Form).WriteTransaction.Commit;
     ClearProc.Close;
     ClearProc.Free;


     //Загружаем новые данные
     self.PrBar:=TfrmImportMain(Form).PrBuCalc;
     DosDataDataSet:=TpFibDataset.Create(nil);
     DosDataDataSet.Database   :=TfrmImportMain(Form).Database;
     DosDataDataSet.Transaction:=TfrmImportMain(Form).ReadTransaction;
     DosDataDataSet.SelectSQL.Text:='SELECT * FROM DOS_SM_CALC';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc:=TpFibStoredProc.Create(nil);
     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_SMETA_OTCH';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('ID_SM').AsInt64           :=StrToInt64(DosDataDataSet.FieldByName('ID_SM').AsString);
            ImportProc.ParamByName('KOD_SM').Value            :=DosDataDataSet.FieldByName('KOD_SM').Value;
            ImportProc.ParamByName('KOD_RZ').Value            :=DosDataDataSet.FieldByName('KOD_RZ').Value;
            ImportProc.ParamByName('KOD_ST').Value            :=DosDataDataSet.FieldByName('KOD_ST').Value;
            ImportProc.ParamByName('DATE_ENTER').Value        :=DosDataDataSet.FieldByName('DATE_ENTER').Value;
            ImportProc.ParamByName('DATE_START').Value        :=DosDataDataSet.FieldByName('DATE_START').Value;
            ImportProc.ParamByName('R_KOD_RAZ').Value         :=DosDataDataSet.FieldByName('R_KOD_RAZ').Value;
            ImportProc.ParamByName('R_KOD_ST').Value          :=DosDataDataSet.FieldByName('R_KOD_ST').Value;
            ImportProc.ParamByName('D_KOD_SM').Value          :=DosDataDataSet.FieldByName('D_KOD_SM').Value;
            ImportProc.ParamByName('D_KOD_RZ').Value          :=DosDataDataSet.FieldByName('D_KOD_RZ').Value;
            ImportProc.ParamByName('D_KOD_ST').Value          :=DosDataDataSet.FieldByName('D_KOD_ST').Value;
            ImportProc.ParamByName('PERCENT').Value           :=DosDataDataSet.FieldByName('PERCENT').Value;
            ImportProc.ParamByName('DATE_STAMP').Value        :=DosDataDataSet.FieldByName('DATE_STAMP').Value;
            ImportProc.ParamByName('KOD_BUHG').Value          :=DosDataDataSet.FieldByName('KOD_BUHG').Value;

            ImportProc.ExecProc;
            TfrmImportMain(Form).WriteTransaction.Commit;
            Synchronize(UpdateBar);
            DosDataDataSet.Next;
     end;

     ImportProc.Free;
     DosDataDataSet.Close;
     DosDataDataSet.Free;end;

procedure TDataImportThread.ImportBuMval;
var i:Integer;
     DosDataDataSet:TpFibDataset;
     ClearProc,ImportProc:TpFibStoredProc;
begin
     //Очищаем таблицу от старых данных
     ClearProc:=TpFibStoredProc.Create(nil);
     ClearProc.Database:=TfrmImportMain(Form).Database;
     ClearProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     TfrmImportMain(Form).WriteTransaction.StartTransaction;
     ClearProc.StoredProcName:='DOS_IMPORT_INIT';
     ClearProc.Prepare;
     ClearProc.ParamByName('FLAG').AsInteger:=17;
     ClearProc.ExecProc;
     TfrmImportMain(Form).WriteTransaction.Commit;
     ClearProc.Close;
     ClearProc.Free;


     //Загружаем новые данные
     self.PrBar:=TfrmImportMain(Form).PrBuMVal;
     DosDataDataSet:=TpFibDataset.Create(nil);
     DosDataDataSet.Database   :=TfrmImportMain(Form).Database;
     DosDataDataSet.Transaction:=TfrmImportMain(Form).ReadTransaction;
     DosDataDataSet.SelectSQL.Text:='SELECT * FROM DOS_SM_MVAL WHERE DATE_ < '+''''+'01.08.2005'+'''';
     DosDataDataSet.Open;
     DosDataDataSet.FetchAll;
     self.PrBar.Max:=DosDataDataSet.RecordCount;
     self.PrBar.Step:=1;
     Synchronize(ClearBar);
     DosDataDataSet.First;

     ImportProc:=TpFibStoredProc.Create(nil);
     ImportProc.Database   :=TfrmImportMain(Form).Database;
     ImportProc.Transaction:=TfrmImportMain(Form).WriteTransaction;
     for i:=0 to DosDataDataSet.RecordCount-1 do
     begin
            TfrmImportMain(Form).WriteTransaction.StartTransaction;
            ImportProc.StoredProcName:='DOS_IMPORT_SM_MVAL';
            ImportProc.Prepare;
            ImportProc.ParamByName('IMPORT_KEY_SESSION').Value:=ImportKeySession;
            ImportProc.ParamByName('ID_SM').AsInt64           :=StrToInt64(DosDataDataSet.FieldByName('ID_SM').AsString);
            ImportProc.ParamByName('KOD_SM').Value            :=DosDataDataSet.FieldByName('KOD_SM').Value;
            ImportProc.ParamByName('KOD_RAZ').Value           :=DosDataDataSet.FieldByName('KOD_RAZ').Value;
            ImportProc.ParamByName('KOD_ST').Value            :=DosDataDataSet.FieldByName('KOD_ST').Value;
            ImportProc.ParamByName('DATE_').Value             :=DosDataDataSet.FieldByName('DATE_').Value;
            ImportProc.ParamByName('F_SUMMA').Value           :=DosDataDataSet.FieldByName('F_SUMMA').Value;
            ImportProc.ParamByName('K_SUMMA').Value           :=DosDataDataSet.FieldByName('K_SUMMA').Value;
            ImportProc.ExecProc;
            TfrmImportMain(Form).WriteTransaction.Commit;
            Synchronize(UpdateBar);
            DosDataDataSet.Next;
     end;

     ImportProc.Free;
     DosDataDataSet.Close;
     DosDataDataSet.Free;
end;

end.



