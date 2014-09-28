unit frmAddAll_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxProgressBar, ibase, cnConsts, Buttons, DM_Raport, cn_Common_Types, cn_Common_Loader,
  cn_Common_Funcs, cxRadioGroup;

type
  TfrmAddAll = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    GroupBox: TGroupBox;
    NameFac_Label: TLabel;
    NameGroup_Label: TLabel;
    Kurs_Label: TLabel;
    ProgressBar: TcxProgressBar;
    Label1: TLabel;
    Params_Button: TcxButton;
    Osnovnoy_RadioButton: TcxRadioButton;
    Dodatkoviy_RadioButton: TcxRadioButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure Params_ButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure OKButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    PLanguageIndex : byte;
    DB_Handle : TISC_DB_HANDLE;
    DATE_DEPT : TDate;
    ID_DOCUM : int64;
    ID_SESSION_params_study, ID_SESSION: int64;
    DM : TDM_Rap;
    SpravMode: byte; // 1-отчисление, 2-восстановление
    procedure FormIniLanguage();
  public
   DateDocumVosst : TDate;
   constructor Create(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; LanguageIndex : byte; A_DATE_DEPT : TDate; A_ID_DOCUM : int64; ASpravMode: byte);reintroduce;
  end;

var
  frmAddAll: TfrmAddAll;

implementation

uses FIBQuery;

{$R *.dfm}
constructor TfrmAddAll.Create(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; LanguageIndex : byte; A_DATE_DEPT : TDate; A_ID_DOCUM : int64; ASpravMode: byte);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 DB_Handle := DBHandle;
 DATE_DEPT := A_DATE_DEPT;
 ID_DOCUM  := A_ID_DOCUM;
 FormIniLanguage();
     ID_SESSION_params_study := -1;
 DM:=TDM_Rap.Create(Self);
 DM.DB.Handle:=DBHandle;
 SpravMode:= ASpravMode;
 if SpravMode =2 then
 Label1.Visible := false;
     // генерирую сессию параметров отбора
    with DM.StProc do
   try
    Transaction.StartTransaction;
    StoredProcName := 'CN_DT_REPORTS_SESSION';
    Prepare;
    ExecProc;
    ID_SESSION_params_study := ParamByName('ID_SESSION').AsInt64;
    Transaction.Commit;
   except
    on E:Exception do
     begin
      Transaction.Rollback;
      Showmessage('Error in procedure CN_DT_REPORTS_SESSION');
      Screen.Cursor := crHourGlass;
      raise;
     end;
   end;
 Screen.Cursor:=crDefault;
 end;

procedure TfrmAddAll.FormIniLanguage();
begin
  Label1.Caption           :=  cn_RaportAvtoComments[PLanguageIndex] + ': '+Datetostr(DATE_DEPT);
  Params_Button.Caption    :=  cn_ParamsOtbor[PLanguageIndex];
  Osnovnoy_RadioButton.Caption :=  cn_OnovnieTypeDoc[PLanguageIndex];
  Dodatkoviy_RadioButton.Caption :=  cn_DodatkovTypeDoc[PLanguageIndex];
  OkButton.Caption         :=  cn_Accept[PLanguageIndex];
  CancelButton.Caption     :=  cn_Cancel[PLanguageIndex];
end;
procedure TfrmAddAll.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmAddAll.Params_ButtonClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
// запускаю справочник отбора параметров обучения
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:=DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  AParameter.ID_SESSION:=ID_SESSION_params_study;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportsFilter.bpl','ShowReportFilter');
  AParameter.Free;
end;

procedure TfrmAddAll.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if not CancelButton.Enabled then CanClose:= False;
end;

procedure TfrmAddAll.OKButtonClick(Sender: TObject);
var i: integer;
  CnCalcOut : TCnCalcOut;
  cnCalcIn: TcnCalcIn;
  CnPayOut : TCnPayOut;
  cnPayIn: TcnPayIn;
  id_stud_as_int: int64;
  ID_TYPE_DOG_IN : int64;
  ANALIZ_RESULT :integer;
begin
GroupBox.Enabled := False;
OkButton.Enabled := False;
CancelButton.Enabled := False;

DM.DataSet.Close;
DM.ReadDataSet.Close;
ProgressBar.Position := 0;

Screen.Cursor := crHourGlass;
// определяю тип контракта
if Osnovnoy_RadioButton.Checked then
ID_TYPE_DOG_IN := 1 // основные
else
ID_TYPE_DOG_IN := 2;// дополнительвые

// по сути, на данном этапе задача не отличается от задачи автоматического расторжения договоров
// поэтому, использую те же процедуры анализа и те же временные таблицы (с учетом сессии конечно) 
   with DM.StProc do
   try
    Transaction.StartTransaction;
    StoredProcName := 'CN_TMP_TONEXTCURS_ANALIZ';
    Prepare;
    ParamByName('ID_SESSION_PARAMS').AsInt64 := ID_SESSION_params_study;
    ExecProc;
    ID_SESSION:=ParamByName('ID_SESSION').AsInt64;
    Transaction.Commit;
    Screen.Cursor := crDefault;
   except
    on E:Exception do
     begin
      ShowMessage('Error in procedure CN_TMP_TONEXTCURS_ANALIZ');
      Transaction.Rollback;
      Screen.Cursor := crDefault;
      raise;
      exit;
     end;
   end;

   DM.DataSet.SelectSQL.Clear;
   DM.DataSet.SelectSQL.Text := 'select * from CN_TMP_TONEXTCURS_SELECT_RAPORT('
                                 + inttostr(ID_SESSION) + ',' + inttostr(ID_TYPE_DOG_IN)+')';
   DM.DataSet.Open;
   DM.DataSet.FetchAll;
   DM.DataSet.First;

   ProgressBar.Properties.Max := DM.DataSet.RecordCount;
   ProgressBar.Update;
   Update;

 if SpravMode =1 then // отчисление
 begin
         for i := 0 to DM.DataSet.RecordCount-1  do
           begin
                     // формирую параметры запроса
                     id_stud_as_int := DM.DataSet['ID_STUD'];
                     // выполняю процедуры
                     with DM.StProc do
                     begin
                     // сначала рассчитываю сумму и дату оплаты
                     // рассчитывается на дату. указанную в документе
                     // cn_pay
                       cnPayIn.Owner       := self;
                       cnPayIn.DB_Handle   := DM.DB.Handle;
                       cnPayIn.ID_STUD     := id_stud_as_int;
                       cnPayIn.BEG_CHECK   := strtodate('01.01.1900');
                       cnPayIn.END_CHECK   := DATE_DEPT;
                       cnPayIn.DATE_PROV_CHECK := 1;
                       cnPayIn.IS_DOC_GEN      := 0;
                       cnPayIn.IS_PROV_GEN     := 0;
                       cnPayIn.IS_SMET_GEN     := 0;
                       cnPayIn.NOFPROV         := 1;
                       cnPayIn.DIGNORDOCID     := 1;
                          CnPayOut := GetCnPay(cnPayIn);
                    // cn_calc
                       cnCalcIn.Owner     := self;
                       cnCalcIn.DB_Handle := DM.DB.Handle;
                       cnCalcIn.ID_STUD   := id_stud_as_int;
                       cnCalcIn.BEG_CHECK := strtodate('01.01.1900');
                       cnCalcIn.END_CHECK := DATE_DEPT;
                       cnCalcIn.CNUPLSUM  := CnPayOut.CNSUMDOC;
                          CnCalcOut := GetCnCalc(cnCalcIn);
                  if (CnCalcOut.CN_SNEED - CnPayOut.CNUPLSUM)>0 then
                   begin
                     //далее вношу записи в базу
                      Transaction.StartTransaction;
                      StoredProcName := 'CN_DT_RAPORT_STUD_INSERT';
                      Prepare;
                      ParamByName('ID_DOCUM').AsInt64      := ID_DOCUM;
                      ParamByName('ID_DOG').AsInt64        := DM.DataSet['ID_DOG'] ;
                      ParamByName('ID_STUD').AsInt64       := id_stud_as_int;
                      ParamByName('ID_FACUL').AsInt64      := DM.DataSet['ID_FACUL'];
                      if DM.DataSet['ID_GROUP'] <> null then
                       ParamByName('ID_GROUP').AsInt64      := DM.DataSet['ID_GROUP']
                      else
                       ParamByName('ID_GROUP').AsInt64      := 0;
                       if CnPayOut.CNUPLSUM > CnPayOut.CNSUMDOC
                        then
                       ParamByName('SUMMA').AsCurrency     := CnCalcOut.CN_SNEED - CnPayOut.CNUPLSUM
                       else
                       ParamByName('SUMMA').AsCurrency     := CnCalcOut.CN_SNEED - CnPayOut.CNSUMDOC;
                      ParamByName('KURS').AsShort          := DM.DataSet['KURS'];
                      ParamByName('DATE_OPL').AsDate       := CnCalcOut.CNDATEOPL;
                      ExecProc;
                      try
                      Transaction.Commit;
                     except
                      on E:Exception do
                       begin
                        //ShowMessage('Error in CN_DT_RAPORT_STUD_INSERT' + #13 + 'ID_DOG=' + vartostr(DM.DataSet['ID_DOG'])+#13 + 'ID_STUD=' + vartostr(id_stud_as_int)+#13 + 'ID_FACUL=' + vartostr(DM.DataSet['ID_FACUL'])+#13 + 'ID_GROUP=' + vartostr(DM.DataSet['ID_GROUP'])+#13 + 'KURS=' + vartostr(DM.DataSet['KURS']));
                        ShowMessage('Какого?'+E.Message);
                        Transaction.Rollback;
                        raise;
                       end;
                     end;
                   end;
                  end;
               DM.DataSet.Next;
               ProgressBar.Position := ProgressBar.Position+1;
               ProgressBar.Update;
           end;
   end
 else // восстановление
  begin
           for i := 0 to DM.DataSet.RecordCount-1  do
           begin
                     // формирую параметры запроса
                     id_stud_as_int := DM.DataSet['ID_STUD'];

                     // выполняю процедуры
                     with DM.StProc do
                     try
                      Transaction.StartTransaction;
                      StoredProcName := 'CN_DT_RAPORT_VOSST_ANALIZ';
                      Prepare;
                      ParamByName('ID_STUD').AsInt64       := id_stud_as_int;
                      ParamByName('ID_DOG').AsInt64        := DM.DataSet['ID_DOG'] ;
                      ParamByName('DATEDOCUMVOSST').AsDate := DATEDOCUMVOSST;
                      ExecProc;
                       ANALIZ_RESULT   := ParamByName('ANALIZ_RESULT').AsInteger;
                      Transaction.Commit;
                     except
                      on E:Exception do
                       begin
                        ShowMessage('Error in CN_DT_RAPORT_VOSST_ANALIZ');
                        Transaction.Rollback;
                        raise;
                       end;
                     end;

                  if bool(ANALIZ_RESULT) then
                   begin
                     //далее вношу записи в базу
                     with DM.StProc do
                     try
                      Transaction.StartTransaction;
                      StoredProcName := 'CN_DT_RAPORT_STUD_INSERT';
                      Prepare;
                      ParamByName('ID_DOCUM').AsInt64      := ID_DOCUM;
                      ParamByName('ID_DOG').AsInt64        := DM.DataSet['ID_DOG'] ;
                      ParamByName('ID_STUD').AsInt64       := id_stud_as_int;
                      ParamByName('ID_FACUL').AsInt64      := DM.DataSet['ID_FACUL'];
                      if DM.DataSet['ID_GROUP'] <> null then
                       ParamByName('ID_GROUP').AsInt64      := DM.DataSet['ID_GROUP']
                      else
                      ParamByName('ID_GROUP').AsInt64      := 0;
                      ParamByName('SUMMA').AsCurrency     :=  0;
                      ParamByName('KURS').AsShort          := DM.DataSet['KURS'];
                      ParamByName('DATE_OPL').AsDate       := strtodate('01.01.1900');
                      ExecProc;
                      Transaction.Commit;
                     except
                      on E:Exception do
                       begin
                        ShowMessage('Error in CN_DT_RAPORT_STUD_INSERT');
                        Transaction.Rollback;
                        raise;
                       end;
                     end;
                   end;
               DM.DataSet.Next;
               ProgressBar.Position := ProgressBar.Position+1;
               ProgressBar.Update;

          end;
  end;


    // стираю свою сессию
   with DM.StProc do
   try
    Transaction.StartTransaction;
    StoredProcName := 'CN_TMP_TONEXTCURS_DELETE';
    Prepare;
     ParamByName('ID_SESSION').AsInt64       := ID_SESSION;
    ExecProc;
    Transaction.Commit;
   except
    on E:Exception do
     begin
      Transaction.Rollback;
      ShowMessage('Error in CN_TMP_TONEXTCURS_DELETE');
      Screen.Cursor := crDefault;
      raise;
     end;
   end;

 // стираю сессию параметров
   with DM.StProc do
   try
    Transaction.StartTransaction;
    StoredProcName := 'CN_TMP_VALUE_PARAMS_DEL_ALL';
    Prepare;
     ParamByName('ID_SESSION').AsInt64       := ID_SESSION_params_study;
    ExecProc;
    Transaction.Commit;
   except
    on E:Exception do
     begin
      Transaction.Rollback;
      ShowMessage('Error in CN_TMP_VALUE_PARAMS_DEL_ALL');
      Screen.Cursor := crDefault;
      raise;
     end;
   end;


  CancelButton.Enabled := True;
  CancelButton.Caption := cn_Main_ExitBtn_Caption[PLanguageIndex];
  DM.DataSet.Close;
end;

procedure TfrmAddAll.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 // стираю сессию параметров
if ID_SESSION_params_study <> null then
   with DM.StProc do
   try
    Transaction.StartTransaction;
    StoredProcName := 'CN_TMP_VALUE_PARAMS_DEL_ALL';
    Prepare;
     ParamByName('ID_SESSION').AsInt64       := ID_SESSION_params_study;
    ExecProc;
    Transaction.Commit;
   except
    on E:Exception do
     begin
      Transaction.Rollback;
      ShowMessage('Error in CN_TMP_VALUE_PARAMS_DEL_ALL');
      Screen.Cursor := crDefault;
      raise;
     end;
   end;
   DM.Free;
end;

end.
