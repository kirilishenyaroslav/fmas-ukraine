unit Credit_AddAll_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxProgressBar, ibase, cnConsts, Buttons, DM_cr, cn_Common_Types, cn_Common_Loader,
  cn_Common_Funcs, cxRadioGroup, inifiles, uPwdDecrypt;

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
    procedure FormShow(Sender: TObject);
  private
    PLanguageIndex : byte;
    DB_Handle : TISC_DB_HANDLE;
    DM, DM2 : TDM_C;
    ID_SESSION_params_study, ID_SESSION: int64;
    SummaCreditAsStud, SummaAllCredit, LimitDogsAllCredit :Currency;
    procedure FormIniLanguage();
   // procedure ReadIniFileImage();
  public
    DATE_CREDIT : TDate;
    DATE_START_CALC : TDate;
    ID_CREDIT : int64;
    IS_IMAGE_PRIOR: Integer;
    LIMIT_SUM : Currency;
    LIMIT_DOGS : Integer;
   constructor Create(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; LanguageIndex : byte; A_ID_CREDIT : int64);reintroduce;
  end;

var
  frmAddAll: TfrmAddAll;

implementation

uses FIBQuery, DB;

{$R *.dfm}
{procedure TfrmAddAll.ReadIniFileImage;
  var
   IniFile : TIniFile;
   INI_FILENAME, APP_PATH,DB_PATH, DB_SERVER, DB_USER, DB_PASSWORD : string;
  begin
    INI_FILENAME:='config.ini';
    APP_PATH := ExtractFileDir(Application.ExeName) + '\';

        IniFile          := TIniFile.Create(APP_PATH + INI_FILENAME);
        DB_PATH          := IniFile.ReadString('IMAGE_CONNECTION', 'Path', DB_PATH);
        DB_SERVER        := IniFile.ReadString('IMAGE_CONNECTION', 'Server', DB_SERVER);
        DB_USER          := IniFile.ReadString('IMAGE_CONNECTION', 'User', DB_USER);
        DB_PASSWORD      := PwdDeCrypt(IniFile.ReadString('IMAGE_CONNECTION', 'Password_Crypted', DB_PASSWORD));
        IniFile.Free;

    with DM2 do
     begin
      if DB.Connected then DB.Close;
       DB.DatabaseName :=DB_SERVER+ ':'+DB_PATH;
       DB.DBParams.Values['USER_NAME']:=DB_USER;
       DB.DBparams.Values['PASSWORD'] :=DB_PASSWORD  ;
     end;
   try
     DM2.DB.Open;
   except
     raise;
     MessageBox(Application.Handle,'Ќев≥доме програмне виключенн€','ѕомилка', MB_OK +MB_ICONERROR);
   end;
end;
 }
constructor TfrmAddAll.Create(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; LanguageIndex : byte;  A_ID_CREDIT : int64);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
  PLanguageIndex:= LanguageIndex;
  DB_Handle := DBHandle;
  ID_CREDIT  := A_ID_CREDIT;
  LimitDogsAllCredit := 0;
  SummaAllCredit := 0;
 FormIniLanguage();
     ID_SESSION_params_study := -1;
 DM:=TDM_C.Create(Self);
 DM.DB.Handle:=DBHandle;
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
// запускаю справочник отбора параметров обучени€
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
var i, j: integer;
  id_dog_mg: Int64;
  CnCalcOut : TCnCalcOut;
  cnCalcIn: TcnCalcIn;
  CnPayOut : TCnPayOut;
  cnPayIn: TcnPayIn;
  id_stud_as_int, id_dog_as_int, id_dog_root_as_int,
  id_dog_as_int_sr: int64;
  ID_TYPE_DOG_IN : int64;
  WhasImage : integer;
begin
GroupBox.Enabled := False;
OkButton.Enabled := False;
CancelButton.Enabled := False;

if LIMIT_DOGS = 0 then LIMIT_DOGS:= 9999999;
DM.DataSet.Close;
DM.ReadDataSet.Close;
ProgressBar.Position := 0;

Screen.Cursor := crHourGlass;
// определ€ю тип контракта
if Osnovnoy_RadioButton.Checked then
ID_TYPE_DOG_IN := 1 // основные
else
ID_TYPE_DOG_IN := 2;// дополнительвые

   with DM.StProc do
   try
    Transaction.StartTransaction;
    StoredProcName := 'CN_TO_CREDIT_ANALIZ';
    Prepare;
    ParamByName('ID_SESSION_PARAMS').AsInt64 := ID_SESSION_params_study;
    ParamByName('IS_IMAGE_PRIOR').AsInteger  := IS_IMAGE_PRIOR;
    ParamByName('DATE_CREDIT').AsString      := datetostr(DATE_CREDIT);
    ParamByName('ID_CREDIT').AsInt64         := ID_CREDIT;
    ExecProc;
    ID_SESSION:=ParamByName('ID_SESSION').AsInt64;
    Transaction.Commit;
    Screen.Cursor := crDefault;
   except
    on E:Exception do
     begin
      ShowMessage('Error in procedure CN_TO_CREDIT_ANALIZ');
      Transaction.Rollback;
      Screen.Cursor := crDefault;
      raise;
      exit;
     end;
   end;

  if IS_IMAGE_PRIOR = 1 then
   begin
     DM2:=TDM_C.Create(Self);
     DM2.DB.Handle:=DB_Handle;

     // провер€ю подключатьс€ ли к другой базе
     DM2.ReadDataSet.SelectSQL.Text := 'SELECT CN_IMAGE_IN_OTHER_DB FROM CN_PUB_SYS_DATA_GET_ALL';
     DM2.ReadDataSet.Open;
     if DM2.ReadDataSet['CN_IMAGE_IN_OTHER_DB'] =1 then
      begin
        DM2.ReadDataSet.Close;
        ReadIniFileImage (DM2.DB);
      end;
     if DM2.ReadDataSet.Active then DM2.ReadDataSet.Close;

     DM2.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_SCAN_ALL_SELECT';
     //db_imgPicture.DataSource := DM.DataSource;
     DM2.DataSet.Open;
     DM2.DataSet.FetchAll;

     DM.DataSet.SelectSQL.Clear;
     DM.DataSet.SelectSQL.Text := 'select * from CN_TMP_TONEXTCURS_SELECT_RAPORT('
                                 + inttostr(ID_SESSION) + ',' + inttostr(ID_TYPE_DOG_IN)+')';
     DM.DataSet.Open;
     DM.DataSet.FetchAll;
     DM.DataSet.First;
      ProgressBar.Properties.Max := DM.DataSet.RecordCount;
      ProgressBar.Update;
      Update;

         for i := 0 to DM.DataSet.RecordCount-1  do
           begin
            WhasImage := 0;
            id_dog_as_int_sr  := DM.DataSet['ID_DOG'];
            DM2.DataSet.First;
            for j := 0 to DM2.DataSet.RecordCount-1  do
            begin
             id_dog_mg := StrToInt64(DM2.DataSet['ID_DOG_AS_VARCH']);
             if (id_dog_as_int_sr = id_dog_mg) then
               begin
                WhasImage := 1;
                Break;
               end;
              DM2.DataSet.Next;
            end;

            if WhasImage = 0 then
             begin
               DM.DataSet.Next;
               ProgressBar.Position := ProgressBar.Position+1;
               ProgressBar.Update;
             end;

            if WhasImage = 1 then
             begin
                     // формирую параметры запроса
                     id_stud_as_int     := DM.DataSet['ID_STUD'];
                     id_dog_as_int      := DM.DataSet['ID_DOG'];
                     id_dog_root_as_int := DM.DataSet['ID_DOG_ROOT'];
                     SummaCreditAsStud :=0;
                     // выполн€ю процедуры
                     with DM.StProc do
                     try
                      Transaction.StartTransaction;
                      StoredProcName := 'CN_GENERATE_CREDIT_LIST';
                      Prepare;
                      ParamByName('ID_STUD').AsInt64        := id_stud_as_int;
                      ParamByName('ID_DOG').AsInt64         := id_dog_as_int;
                      ParamByName('ID_DOG_ROOT').AsInt64    := id_dog_root_as_int;
                      ParamByName('DATE_START_CALC').AsDate := DATE_START_CALC;
                      ParamByName('DATE_CREDIT').AsDate     := DATE_CREDIT;
                      ExecProc;
                      SummaCreditAsStud := ParamByName('SUMMA').AsCurrency;
                      Transaction.Commit;
                  if (SummaCreditAsStud > 0)  then
                   begin
                      // определ€ю сумму остатка
                     // cn_pay
                       cnPayIn.Owner       := self;
                       cnPayIn.DB_Handle   := DM.DB.Handle;
                       cnPayIn.ID_STUD     := id_stud_as_int;
                       cnPayIn.BEG_CHECK   := strtodate('01.01.1900');
                       cnPayIn.END_CHECK   := strtodate('01.01.3050');
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
                       cnCalcIn.END_CHECK := DATE_START_CALC;
                       cnCalcIn.CNUPLSUM  := CnPayOut.CNSUMDOC;
                          CnCalcOut := GetCnCalc(cnCalcIn);

                    // if (SummaCreditAsStud + (CnCalcOut.CN_SNEED - CnPayOut.CNUPLSUM)) > 0 then
                     if (SummaCreditAsStud + (CnCalcOut.CN_SNEED - CnPayOut.CNUPLSUM)) = SummaCreditAsStud  then
                     begin
                      SummaAllCredit := SummaAllCredit + (SummaCreditAsStud + (CnCalcOut.CN_SNEED - CnPayOut.CNUPLSUM));
                      LimitDogsAllCredit := LimitDogsAllCredit + 1;
                     //далее вношу записи в базу
                      Transaction.StartTransaction;
                      StoredProcName := 'CN_DT_CREDIT_LIST_I';
                      Prepare;
                      ParamByName('ID_CREDIT').AsInt64    := ID_CREDIT;
                      ParamByName('SUMMA').AsCurrency     := (SummaCreditAsStud + (CnCalcOut.CN_SNEED - CnPayOut.CNUPLSUM));
                      ParamByName('ID_DOG').AsInt64       := id_dog_as_int;
                      ParamByName('SUMMA_OST').AsCurrency     := (CnCalcOut.CN_SNEED - CnPayOut.CNUPLSUM);
                      ExecProc;
                      Transaction.Commit;
                     end;
                    end;
                     except
                      on E:Exception do
                       begin
                        ShowMessage('Error in CN_DT_CREDIT_LIST_I');
                        Transaction.Rollback;
                        raise;
                       end;
                     end;

               DM.DataSet.Next;
               ProgressBar.Position := ProgressBar.Position+1;
               ProgressBar.Update;
             if ((SummaAllCredit > LIMIT_SUM) or (LimitDogsAllCredit >= LIMIT_DOGS)) then
              begin
               // здесь апдейт суммы по кредиту суммой SummaAllCredit
                     with DM.StProc do
                     try
                      Transaction.StartTransaction;
                      StoredProcName := 'CN_DT_CREDIT_UPDATE_SUMMA';
                      Prepare;
                      ParamByName('ID_CREDIT').AsInt64    := ID_CREDIT;
                      ParamByName('SUMMA').AsCurrency     := SummaAllCredit;
                      ExecProc;
                      Transaction.Commit;
                     except
                      on E:Exception do
                       begin
                        ShowMessage('Error in CN_DT_CREDIT_UPDATE_SUMMA');
                        Transaction.Rollback;
                        raise;
                       end;
                     end;
               ProgressBar.Position := ProgressBar.Properties.Max;
               ProgressBar.Update; Update;
               Break;
              end;
           end;
      end; // if 1
               // здесь апдейт суммы по кредиту суммой SummaAllCredit
                     with DM.StProc do
                     try
                      Transaction.StartTransaction;
                      StoredProcName := 'CN_DT_CREDIT_UPDATE_SUMMA';
                      Prepare;
                      ParamByName('ID_CREDIT').AsInt64    := ID_CREDIT;
                      ParamByName('SUMMA').AsCurrency     := SummaAllCredit;
                      ExecProc;
                      Transaction.Commit;
                     except
                      on E:Exception do
                       begin
                        ShowMessage('Error in CN_DT_CREDIT_UPDATE_SUMMA');
                        Transaction.Rollback;
                        raise;
                       end;
                     end;
   end;

  if IS_IMAGE_PRIOR <> 1 then
  begin
   DM.DataSet.SelectSQL.Clear;
   DM.DataSet.SelectSQL.Text := 'select * from CN_TMP_TONEXTCURS_SELECT_RAPORT('
                                 + inttostr(ID_SESSION) + ',' + inttostr(ID_TYPE_DOG_IN)+')';
   DM.DataSet.Open;
   DM.DataSet.FetchAll;
   DM.DataSet.First;
      ProgressBar.Properties.Max := DM.DataSet.RecordCount;
      ProgressBar.Update;
      Update;

         for i := 0 to DM.DataSet.RecordCount-1  do
           begin
                     // формирую параметры запроса
                     id_stud_as_int     := DM.DataSet['ID_STUD'];
                     id_dog_as_int      := DM.DataSet['ID_DOG'];
                     id_dog_root_as_int := DM.DataSet['ID_DOG_ROOT'];
                     SummaCreditAsStud :=0;
                     // выполн€ю процедуры
                     with DM.StProc do
                     try
                      Transaction.StartTransaction;
                      StoredProcName := 'CN_GENERATE_CREDIT_LIST';
                      Prepare;
                      ParamByName('ID_STUD').AsInt64        := id_stud_as_int;
                      ParamByName('ID_DOG').AsInt64         := id_dog_as_int;
                      ParamByName('ID_DOG_ROOT').AsInt64    := id_dog_root_as_int;
                      ParamByName('DATE_START_CALC').AsDate := DATE_START_CALC;
                      ParamByName('DATE_CREDIT').AsDate     := DATE_CREDIT;
                      ExecProc;
                      SummaCreditAsStud := ParamByName('SUMMA').AsCurrency;
                      Transaction.Commit;
                  if (SummaCreditAsStud > 0)  then
                   begin
                      // определ€ю сумму остатка
                     // cn_pay
                       cnPayIn.Owner       := self;
                       cnPayIn.DB_Handle   := DM.DB.Handle;
                       cnPayIn.ID_STUD     := id_stud_as_int;
                       cnPayIn.BEG_CHECK   := strtodate('01.01.1900');
                       cnPayIn.END_CHECK   := strtodate('01.01.3050');
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
                       cnCalcIn.END_CHECK := DATE_START_CALC;
                       cnCalcIn.CNUPLSUM  := CnPayOut.CNSUMDOC;
                          CnCalcOut := GetCnCalc(cnCalcIn);

                    // if (SummaCreditAsStud + (CnCalcOut.CN_SNEED - CnPayOut.CNUPLSUM)) > 0 then
                     if (SummaCreditAsStud + (CnCalcOut.CN_SNEED - CnPayOut.CNUPLSUM)) = SummaCreditAsStud  then
                     begin
                      SummaAllCredit := SummaAllCredit + (SummaCreditAsStud + (CnCalcOut.CN_SNEED - CnPayOut.CNUPLSUM));
                      LimitDogsAllCredit := LimitDogsAllCredit + 1;
                     //далее вношу записи в базу
                      Transaction.StartTransaction;
                      StoredProcName := 'CN_DT_CREDIT_LIST_I';
                      Prepare;
                      ParamByName('ID_CREDIT').AsInt64    := ID_CREDIT;
                      ParamByName('SUMMA').AsCurrency     := (SummaCreditAsStud + (CnCalcOut.CN_SNEED - CnPayOut.CNUPLSUM));
                      ParamByName('ID_DOG').AsInt64       := id_dog_as_int;
                      ParamByName('SUMMA_OST').AsCurrency     := (CnCalcOut.CN_SNEED - CnPayOut.CNUPLSUM);
                      ExecProc;
                      Transaction.Commit;
                     end;
                    end;
                     except
                      on E:Exception do
                       begin
                        ShowMessage('Error in CN_DT_CREDIT_LIST_I');
                        Transaction.Rollback;
                        raise;
                       end;
                     end;

               DM.DataSet.Next;
               ProgressBar.Position := ProgressBar.Position+1;
               ProgressBar.Update;
             if ((SummaAllCredit > LIMIT_SUM) or (LimitDogsAllCredit >= LIMIT_DOGS)) then
              begin
               // здесь апдейт суммы по кредиту суммой SummaAllCredit
                     with DM.StProc do
                     try
                      Transaction.StartTransaction;
                      StoredProcName := 'CN_DT_CREDIT_UPDATE_SUMMA';
                      Prepare;
                      ParamByName('ID_CREDIT').AsInt64    := ID_CREDIT;
                      ParamByName('SUMMA').AsCurrency     := SummaAllCredit;
                      ExecProc;
                      Transaction.Commit;
                     except
                      on E:Exception do
                       begin
                        ShowMessage('Error in CN_DT_CREDIT_UPDATE_SUMMA');
                        Transaction.Rollback;
                        raise;
                       end;
                     end;
               ProgressBar.Position := ProgressBar.Properties.Max;
               ProgressBar.Update; Update;
               Break;
              end;
           end;

               // здесь апдейт суммы по кредиту суммой SummaAllCredit
                     with DM.StProc do
                     try
                      Transaction.StartTransaction;
                      StoredProcName := 'CN_DT_CREDIT_UPDATE_SUMMA';
                      Prepare;
                      ParamByName('ID_CREDIT').AsInt64    := ID_CREDIT;
                      ParamByName('SUMMA').AsCurrency     := SummaAllCredit;
                      ExecProc;
                      Transaction.Commit;
                     except
                      on E:Exception do
                       begin
                        ShowMessage('Error in CN_DT_CREDIT_UPDATE_SUMMA');
                        Transaction.Rollback;
                        raise;
                       end;
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

procedure TfrmAddAll.FormShow(Sender: TObject);
begin
  Label1.Caption           :=  Datetostr(DATE_START_CALC) + ' - '+ Datetostr(DATE_CREDIT);
end;

end.
