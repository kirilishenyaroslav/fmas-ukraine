{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с переоценкой ТМЦ                       }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uPereocMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ibase, uResources,
  FIBDatabase, pFIBDatabase, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FIBDataSet, pFIBDataSet, uMatasVars, FIBQuery,
  pFIBQuery, pFIBStoredProc, uMatasUtils, uSplash, Kernel, GlobalSPR,
  FR_Class, FR_DSet, FR_DBSet, uMatasPrintForm, cxContainer, cxTextEdit,
  cxDBEdit, ActnList, cxCalendar;

type
  TVedPereocMainForm = class(TForm)
    AddButton: TcxButton;
    DelButton: TcxButton;
    ExitButton: TcxButton;
    PrintButton: TcxButton;
    dbPereoc: TpFIBDatabase;
    trRead: TpFIBTransaction;
    dsVedPereoc: TpFIBDataSet;
    dsVedPereocID_RECOST_VED: TFIBBCDField;
    dsVedPereocDATE_REC: TFIBDateField;
    dsVedPereocCOEFF: TFIBBCDField;
    dsVedPereocSAVED: TFIBIntegerField;
    dsVedPereocROUNDED: TFIBIntegerField;
    dsVedPereocSUMMA: TFIBBCDField;
    dsVedPereocNOTE: TFIBStringField;
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
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    DataSourcePereoc: TDataSource;
    cxGrid1DBTableView1DATE_REC: TcxGridDBColumn;
    cxGrid1DBTableView1COEFF: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA: TcxGridDBColumn;
    StoredProc: TpFIBStoredProc;
    trWrite: TpFIBTransaction;
    WorkQuery: TpFIBQuery;
    WorkStoredProc: TpFIBStoredProc;
    RepDataSet: TpFIBDataSet;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    dsVedPereocNUM_VED: TFIBStringField;
    dsVedPereocDATE_VED: TFIBDateField;
    cxDBTextEdit1: TcxDBTextEdit;
    cxGrid1DBTableView1NUM_DOC: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_VED: TcxGridDBColumn;
    ActionList: TActionList;
    acAdd: TAction;
    acDelete: TAction;
    acPrint: TAction;
    acExit: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acAddExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
  private
    { Private declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
    { Public declarations }
   constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);overload;
  end;

  procedure ShowVedPereoc(AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;

  exports ShowVedPereoc;

var
  VedPereocMainForm: TVedPereocMainForm;

implementation

{$R *.dfm}

uses uPereocAddVed, uPereocVedEdit, uPereocPrint;

procedure ShowVedPereoc(AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
  T:TVedPereocMainForm;
begin
  T:=TVedPereocMainForm.Create(AOwner, aDBHANDLE);
  T.ID_USER:=aID_USER;
  T.Show;
end;

constructor TVedPereocMainForm.Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 if Assigned(aDBHandle) then
 begin
  self.DBHANDLE:=aDBHANDLE;
  self.dbPereoc.Handle:=DBHANDLE;
  self.dsVedPereoc.CloseOpen(false);
 end;
 self.acAdd.Caption:=MAT_ACTION_ADD_CONST;
 self.acDelete.Caption:=MAT_ACTION_DELETE_CONST;
 self.acPrint.Caption:=MAT_ACTION_PRINT_CONST;
 self.acExit.Caption:=MAT_ACTION_CLOSE_CONST;
 self.Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_ACC_RECOST;
end;

procedure TVedPereocMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TVedPereocMainForm.acAddExecute(Sender: TObject);
var
   T: TVedPereocAddForm;
   P: TVedPereocPosForm;
   Vals : array of Variant;
   ID_SESSION: Integer;
   w: TForm;
   CountRec, CurRec: Integer;
   splash: TSplashForm;
   pos: Integer;
   STRU: KERNEL_MODE_STRUCTURE;
   ErrorList: TStringList;
   DoResult: boolean;
   StringError: string;
   MaxErrCount: integer;
   KEY_SESSION, PUB_ID_DOC, PUB_ID_PROV: Int64;
   ID_VED, ID, ID_DOC: Integer;
   i: integer;
begin
 MaxErrCount:=25;
 T:=TVedPereocAddForm.Create(self);
 T.DBHANDLE:=DBHANDLE;
 T.FILTER_ID_SESSION:=dbPereoc.Gen_Id('MAT_ID_SESSION',1, trRead);
 if T.ShowModal=mrOk then
 begin
  SetLength(Vals, 12);
  Vals[ 0] := _MATAS_PERIOD;
  Vals[ 1] := T.cxCoeff.Value;
  Vals[ 2] := T.cxCheckOst.ItemIndex;
  Vals[ 3] := T.FILTER_ID_SESSION;
  Vals[ 4] := T.CORR_ID_SCH;
  if T.cxCheckSch.Checked then
   Vals[ 5] := 1
  else
   Vals[ 5] := 0;
  Vals[6] := T.cxDateOpr.Text;
  Vals[7] := BoolToInt(T.cxCheckDate.Checked);
  Vals[8] := BoolToInt(T.cxCheckRound.Checked);
  Vals[9] := BoolToInt(T.cxCheckIzn.Checked);
  Vals[10] := T.IZN_ID_SCH;
  Vals[11] := BoolToInt(T.cxCheckRoundIzn.Checked);
  try
    StoredProc.Transaction := trWrite;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_RECOST_PREPARE_DATA';
    StoredProc.Prepare;
    StoredProc.ExecProcedure('MAT_RECOST_PREPARE_DATA', vals);
    StoredProc.Transaction.Commit;
    ID_SESSION:=StoredProc.ParamByName('ID_SESSION').AsInteger;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
   end;
  end;
  Refresh;
  w:=ShowWaitWindow(self);
  P:=TVedPereocPosForm.Create(self);
  P.dbRecost.Handle:=DBHANDLE;
  P.DBHANDLE:=DBHANDLE;
  P.ID_SESSION:=ID_SESSION;
  P.dsPereocPos.ParamByName('ID_SESSION').Value:=ID_SESSION;
  P.dsPereocPos.CloseOpen(false);
  if P.ShowModal=mrOk then
  begin
   Refresh;
   splash:=TSplashForm.Create(self);
   splash.Title.Caption:='Збереження даних';
   splash.Show;
   //// step 1 /////////////////////////////////////////////
   try
    WorkStoredProc.Transaction:=trWrite;
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.StoredProcName:='MAT_DT_MAT_RECOST_VED_ADD';
    WorkStoredProc.Prepare;
    WorkStoredProc.ParamByName('NUM_VED').Value := T.cxNumVed.Text;
    WorkStoredProc.ParamByName('DATE_VED').Value := StrToDate(T.cxDateVed.Text);
    WorkStoredProc.ParamByName('COEFF').Value := T.cxCoeff.Value;
    WorkStoredProc.ParamByName('ROUNDED').Value := 0;
    WorkStoredProc.ParamByName('DATE_REC').Value := _MATAS_PERIOD;
    WorkStoredProc.ParamByName('NOTE').Value := T.cxLookupSch.Text;
    WorkStoredProc.ParamByName('GROUPED').Value := BoolToInt(T.cxCheckGrpDoc.Checked);
    WorkStoredProc.ExecProc;
    WorkStoredProc.Transaction.Commit;
    ID_VED:=WorkStoredProc.ParamByName('ID_RECOST_VED').AsInteger;
   except on E : Exception
    do begin
      ShowMessage(E.Message);
      WorkStoredProc.Transaction.Rollback;
      exit;
    end;
   end;
   if not T.cxCheckGrpDoc.Checked then
   begin
    CountRec:=P.dsPereocPos.RecordCount;
    CurRec:=0;
    P.dsPereocPos.First;
    while not P.dsPereocPos.Eof do
    begin
      splash.MsgLabel.Caption:='Запис '+IntToStr(CurRec)+' з '+IntToStr(CountRec);
      pos:=Round(CurRec*100/CountRec);
      splash.Progress.Position:=pos;
      splash.Refresh;
      Application.ProcessMessages;
      ID:=P.dsPereocPos.FieldByName('ID_RECOST_PREP').AsInteger;

      //// Transaction start /////////////////////////////////////////////
      trWrite.StartTransaction;

      KEY_SESSION:=dbPereoc.Gen_Id('KERNEL_GEN_ID_SESSION',1);

      //// step 2 prepare all /////////////////////////////////////////////
      try
       StoredProc.Close;
       StoredProc.Transaction := trWrite;
       StoredProc.StoredProcName:='MAT_RECOST_PREPARE_DOC';
       StoredProc.Prepare;
       StoredProc.ParamByName('KEY_SESSION').Value:=IntToStr(KEY_SESSION);
       StoredProc.ParamByName('ID_RECOST_PREP').Value:=ID;
       StoredProc.ParamByName('DATE_REC').Value:=_MATAS_PERIOD;
       StoredProc.ParamByName('ID_VED').Value:=ID_VED;
       StoredProc.ParamByName('IS_SCH').Value:=0;
       StoredProc.ParamByName('ID_USER').AsInt64:=_CURRENT_USER_ID;
       StoredProc.ParamByName('USER_NAME').Value:=_CURRENT_USER_NAME;
       StoredProc.ParamByName('COMPUTER').Value:=GetComputerNetName;
       StoredProc.ExecProc;
       PUB_ID_PROV:=StoredProc.ParamByName('PUB_ID_PROV').AsInt64;
       PUB_ID_DOC:=StoredProc.ParamByName('PUB_ID_DOC').AsInt64;
       ID_DOC:=StoredProc.ParamByName('ID_DOC').AsInteger;
      except on E : Exception
       do begin
        ShowMessage(E.Message);
        StoredProc.Transaction.Rollback;
        Splash.Free;
        exit;
       end;
      end;

      //// step 3 /////////////////////////////////////////////
      STRU.DBHANDLE:=dbPereoc.Handle;
      STRU.TRHANDLE:=trWrite.Handle;
      STRU.WORKDATE:=_MATAS_PERIOD;
      STRU.KERNEL_ACTION:=1;
      STRU.KEY_SESSION:=KEY_SESSION;
      STRU.ID_USER:=_CURRENT_USER_ID;
      DoResult:=Kernel.KernelDo(@STRU);

      if not DoResult then
      begin
       ErrorList:=Kernel.GetDocErrorsListEx(@STRU);
       StringError:=MAT_STR_SAVE_ERROR+chr(10)+chr(13);
       MaxErrCount:=ErrorList.Count-1;
       if MaxErrCount>20 then MaxErrCount:=20;
       if ErrorList<>nil then
        for i:=0 to MaxErrCount do
         StringError:=StringError+ErrorList.Strings[i]+chr(10)+chr(13);
        StringError:=StringError+chr(10)+chr(13)+'KEY_SESSION:'+IntToStr(KEY_SESSION);
       ShowMessage(StringError);
       //     trWrite.Rollback;
       trWrite.Commit;
       exit;
      end;
      //// step 4 update doc /////////////////////////////////////////////
      if DoResult then
      begin
       try
        StoredProc.Close;
        StoredProc.Transaction := trWrite;
        StoredProc.StoredProcName:='MAT_DT_DOC_UPDATE_RECOST';
        StoredProc.Prepare;
        StoredProc.ParamByName('ID_DOC').AsInt64:=ID_DOC;
        StoredProc.ParamByName('PUB_ID_DOC').Value:=IntToStr(PUB_ID_DOC);
        StoredProc.ParamByName('PUB_ID_PROV').Value:=IntToStr(PUB_ID_PROV);
        StoredProc.ExecProc;
       except on E : Exception
        do begin
         ShowMessage(E.Message);
         StoredProc.Transaction.Rollback;
         Splash.Free;
         exit;
        end;
       end;
      end;
      //// Transaction commit /////////////////////////////////////////////
      trWrite.Commit;
      Inc(CurRec);
      P.dsPereocPos.Next;
     end;
    end
    else begin
     P.dsPereocMO.ParamByName('ID_SESSION').Value:=ID_SESSION;
     P.dsPereocMO.CloseOpen(true);
     CountRec:=P.dsPereocMO.RecordCount;
     CurRec:=0;
     P.dsPereocMO.First;
     while not P.dsPereocMO.Eof do
     begin
      splash.MsgLabel.Caption:='Запис '+IntToStr(CurRec)+' з '+IntToStr(CountRec);
      pos:=Round(CurRec*100/CountRec);
      splash.Progress.Position:=pos;
      splash.Refresh;
      Application.ProcessMessages;
      ID:=P.dsPereocMO.FieldByName('ID_MO').AsInteger;

      //// Transaction start /////////////////////////////////////////////
      trWrite.StartTransaction;

      KEY_SESSION:=dbPereoc.Gen_Id('KERNEL_GEN_ID_SESSION',1);

      //// step 2 prepare all /////////////////////////////////////////////
      try
       StoredProc.Close;
       StoredProc.Transaction := trWrite;
       StoredProc.StoredProcName:='MAT_RECOST_PREPARE_DOC_GRP';
       StoredProc.Prepare;
       StoredProc.ParamByName('KEY_SESSION').Value:=IntToStr(KEY_SESSION);
       StoredProc.ParamByName('ID_SESSION').Value:=ID_SESSION;
       StoredProc.ParamByName('DATE_REC').Value:=_MATAS_PERIOD;
       StoredProc.ParamByName('ID_VED').Value:=ID_VED;
       StoredProc.ParamByName('ID_MO').Value:=ID;
       StoredProc.ParamByName('IS_SCH').Value:=0;
       StoredProc.ParamByName('ID_USER').AsInt64:=_CURRENT_USER_ID;
       StoredProc.ParamByName('USER_NAME').Value:=_CURRENT_USER_NAME;
       StoredProc.ParamByName('COMPUTER').Value:=GetComputerNetName;
       StoredProc.ExecProc;
       PUB_ID_PROV:=StoredProc.ParamByName('PUB_ID_PROV').AsInt64;
       PUB_ID_DOC:=StoredProc.ParamByName('PUB_ID_DOC').AsInt64;
       ID_DOC:=StoredProc.ParamByName('ID_DOC').AsInteger;
      except on E : Exception
       do begin
        ShowMessage(E.Message);
        StoredProc.Transaction.Rollback;
        Splash.Free;
        exit;
       end;
      end;

      //// step 3 /////////////////////////////////////////////
      STRU.DBHANDLE:=dbPereoc.Handle;
      STRU.TRHANDLE:=trWrite.Handle;
      STRU.WORKDATE:=_MATAS_PERIOD;
      STRU.KERNEL_ACTION:=1;
      STRU.KEY_SESSION:=KEY_SESSION;
      STRU.ID_USER:=_CURRENT_USER_ID;
      DoResult:=Kernel.KernelDo(@STRU);

      if not DoResult then
      begin
       ErrorList:=Kernel.GetDocErrorsListEx(@STRU);
       StringError:=MAT_STR_SAVE_ERROR+chr(10)+chr(13);
       MaxErrCount:=ErrorList.Count-1;
       if MaxErrCount>20 then MaxErrCount:=20;
       if ErrorList<>nil then
        for i:=0 to MaxErrCount do
         StringError:=StringError+ErrorList.Strings[i]+chr(10)+chr(13);
        StringError:=StringError+chr(10)+chr(13)+'KEY_SESSION:'+IntToStr(KEY_SESSION);
       ShowMessage(StringError);
       //     trWrite.Rollback;
       trWrite.Commit;
       exit;
      end;
      //// step 4 update doc /////////////////////////////////////////////
      if DoResult then
      begin
       try
        StoredProc.Close;
        StoredProc.Transaction := trWrite;
        StoredProc.StoredProcName:='MAT_DT_DOC_UPDATE_RECOST_GRP';
        StoredProc.Prepare;
        StoredProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
        StoredProc.ParamByName('ID_DOC').AsInt64:=ID_DOC;
        StoredProc.ParamByName('PUB_ID_DOC').Value:=IntToStr(PUB_ID_DOC);
        StoredProc.ParamByName('ID_MO').Value:=ID;
        StoredProc.ExecProc;
       except on E : Exception
        do begin
         ShowMessage(E.Message);
         StoredProc.Transaction.Rollback;
         Splash.Free;
         exit;
        end;
       end;
      end;
      //// Transaction commit /////////////////////////////////////////////
      trWrite.Commit;
      Inc(CurRec);
      P.dsPereocMO.Next;
     end;
    end;
    splash.free;
  end;
  try
   WorkQuery.Transaction := trWrite;
   WorkQuery.Transaction.StartTransaction;
   WorkQuery.SQL.Clear;
   WorkQuery.SQL.Add('DELETE FROM MAT_TMP_RECOST_PREP WHERE ID_SESSION='+IntToStr(ID_SESSION));
   WorkQuery.ExecQuery;
   WorkQuery.Transaction.Commit;
   except on E : Exception
    do begin
      ShowMessage(E.Message);
      WorkQuery.Transaction.Rollback;
      exit;
    end;
   end;
  CloseWaitWindow(w);
  dsVedPereoc.CloseOpen(false);
  P.Free;
 end;
 T.Free;
end;

procedure TVedPereocMainForm.acDeleteExecute(Sender: TObject);
var
 str: string;
 id: integer;
 w: TForm;
begin
 str:='№ '+dsVedPereocNUM_VED.AsString+' від '+dsVedPereocDATE_VED.AsString;
 if agMessageDlg(MAT_STR_WARNING, 'Ви дійсно бажаєте видалити відомість переоцінки '+str+'?', mtConfirmation, [mbYes, mbNo]) = ID_YES then
 begin
  id:=dsVedPereocID_RECOST_VED.AsInteger;
  w:=ShowWaitWindow(self);
  try
   StoredProc.Close;
   StoredProc.Transaction := trWrite;
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName:='MAT_DT_MAT_RECOST_VED_DEL';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_RECOST_VED').Value:=ID;
   StoredProc.ExecProc;
   StoredProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StoredProc.Transaction.Rollback;
    CloseWaitWindow(w);
    exit;
   end;
  end;
  CloseWaitWindow(w);
  dsVedPereoc.CloseOpen(false);
 end;
end;

procedure TVedPereocMainForm.acPrintExecute(Sender: TObject);
var
 T: TVedPereocPrintForm;
 id:integer;
begin
  id:=dsVedPereocID_RECOST_VED.AsInteger;
  T:=TVedPereocPrintForm.Create(self);
  T.Caption:='Друк відомості';
  if T.ShowModal= mrOk then
  begin
    if T.cxComboReport.ItemIndex=0 then
    begin
      RepDataSet.Close;
      RepDataSet.SelectSQL.Clear;
      RepDataSet.SelectSQL.Add('SELECT * FROM MAT_DT_MAT_RECOST_POS_SELECT(:ID_VED)');
      RepDataSet.SelectSQL.Add('ORDER BY BAL_SCH_NUMBER, SCH_NUMBER, SFIO, NAME');
      RepDataSet.ParamByName('ID_VED').Value:=id;
      RepDataSet.CloseOpen(false);
      frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\VedMatRecost.frf');
    end;
    if T.cxComboReport.ItemIndex=1 then
    begin
      RepDataSet.Close;
      RepDataSet.SelectSQL.Clear;
      RepDataSet.SelectSQL.Add('SELECT * FROM MAT_DT_MAT_RECOST_POS_SELECT2(:ID_VED)');
      RepDataSet.SelectSQL.Add('ORDER BY CORR_SCH_NUMBER, BAL_SCH_NUMBER, SCH_NUMBER, SFIO, NAME');
      RepDataSet.ParamByName('ID_VED').Value:=id;
      RepDataSet.CloseOpen(false);
      frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\VedMatRecost2.frf');
    end;
    if T.cxComboReport.ItemIndex=2 then
    begin
      RepDataSet.Close;
      RepDataSet.SelectSQL.Clear;
      RepDataSet.SelectSQL.Add('SELECT p.BAL_SCH_NUMBER, p.SCH_NUMBER, p.SFIO, p.NAME_DEPARTMENT, p.CORR_SCH_NUMBER,');
      RepDataSet.SelectSQL.Add('sum(p.SUMMA_OLD) as SUMMA_OLD, sum(p.SUMMA_NEW) as SUMMA_NEW, sum(p.SUMMA) as SUMMA');
      RepDataSet.SelectSQL.Add('FROM MAT_DT_MAT_RECOST_POS_SELECT2(:ID_VED) p');
      RepDataSet.SelectSQL.Add('GROUP BY 1,2,3,4,5');
      RepDataSet.SelectSQL.Add('ORDER BY CORR_SCH_NUMBER, BAL_SCH_NUMBER, SCH_NUMBER, SFIO');
      RepDataSet.ParamByName('ID_VED').Value:=id;
      RepDataSet.CloseOpen(false);
      frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\VedMatRecostItg1.frf');
    end;

    if T.cxComboReport.ItemIndex=3 then
    begin
      RepDataSet.Close;
      RepDataSet.SelectSQL.Clear;
      RepDataSet.SelectSQL.Add('SELECT p.BAL_SCH_NUMBER, p.SCH_NUMBER, p.CORR_SCH_NUMBER, sum(p.SUMMA) as SUMMA');
      RepDataSet.SelectSQL.Add('FROM MAT_DT_MAT_RECOST_POS_SELECT2(:ID_VED) p GROUP BY 1,2,3');
      RepDataSet.SelectSQL.Add('ORDER BY CORR_SCH_NUMBER, BAL_SCH_NUMBER, SCH_NUMBER');
      RepDataSet.ParamByName('ID_VED').Value:=id;
      RepDataSet.CloseOpen(false);
      frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\VedMatRecostItg2.frf');
    end;

   frVariables['NUM_VED']:=dsVedPereocNUM_VED.AsString;
   frVariables['DATE_VED']:=dsVedPereocDATE_VED.AsString;
   frVariables['COEFF']:=dsVedPereocCOEFF.AsString;

   frVariables['ORG_NAME']:=_ORG_FULL_NAME;
   frVariables['ORG_SHORT_NAME']:=_ORG_SHORT_NAME;
   frVariables['ORG_KOD_OKPO']:=_ORG_KOD_OKPO;

   if T._NUM_COPIES>1 then
    frReport1.DefaultCopies:=T._NUM_COPIES;
   if T._ON_PRINTER then
   begin
    if T._SEL_PRINTER then
     frReport1.PrintPreparedReportDlg
    else
     frReport1.PrintPreparedReport('', T._NUM_COPIES, false, frAll);
   end
   else
    frReport1.ShowReport;
   if T._EDIT_TEMPLATE then
    frReport1.DesignReport;
  end;
  T.Free;
end;

procedure TVedPereocMainForm.acExitExecute(Sender: TObject);
begin
  Close;
end;

end.
