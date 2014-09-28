//******************************************************************************
// Проект "Контракты"
// Модуль перевода на сл. курс
// Чернявский А.Э. 2006г.
//******************************************************************************

unit cn_ToNextCurs_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cn_DM_ToNextCurs, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cxGroupBox, cxLookAndFeelPainters, StdCtrls,
  cxButtons, Buttons, cxCheckBox, cn_ToNC_Aff, cn_Common_Messages, cnConsts_Messages,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cn_Common_Loader, cn_Common_Types,
  cxDBEdit, cxMRUEdit, cxMemo;

const cn_CrossFireErrorStr :array[1..2] of String=('перетинання вже існуючих даних студента',
'пересечение уже имеющихся данных студента');
const cn_DateCheckErrorStr :array[1..2] of String=('дата закінчення виходить за межі дії договору',
'дата окончания выходит за рамки действия договора');

type
  TfrmToNextCurs = class(TForm)
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    cxGroupBox1: TcxGroupBox;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    ForEach_Box: TcxCheckBox;
    Avto_Box: TcxCheckBox;
    Params_Button: TSpeedButton;
    Label1: TLabel;
    cxGroupBox2: TcxGroupBox;
    ProgressBar: TcxProgressBar;
    DateBegEdit: TcxDateEdit;
    DateEndEdit: TcxDateEdit;
    NewPeriod_Label: TLabel;
    MaxLabel: TLabel;
    CurrentLabel: TLabel;
    Memo: TcxMemo;
    ord_ae_Nom_Ord: TcxTextEdit;
    ord_ae_NomOrder_Label: TLabel;
    ord_ae_DateOrder_Label: TLabel;
    ord_ae_Date_Ord: TcxDateEdit;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure Params_ButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateEndEditKeyPress(Sender: TObject; var Key: Char);
    procedure ForEach_BoxKeyPress(Sender: TObject; var Key: Char);
    procedure Avto_BoxKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DateEndEditExit(Sender: TObject);
    procedure ord_ae_Nom_OrdKeyPress(Sender: TObject; var Key: Char);
    procedure ord_ae_Date_OrdKeyPress(Sender: TObject; var Key: Char);
  private
    PLanguageIndex: byte;
    DM:TDM_TNC;


    ID_SESSION, ID_SESSION_params_study : int64; // ид-р сессии

    ID_NATIONAL_ins        : int64; // гражданство
    ID_FACULTY_ins         : int64; // факультет
    ID_SPEC_ins            : int64; // специальность
    ID_GROUP_ins           : int64; // группа
    ID_FORMSTUD_ins        : int64; // форма обучения
    ID_CATEGORYSTUD_ins    : int64; // категория обучения
    ID_KURS_ins            : int64; // курс
    date_beg_ins           : TDate;
    date_end_ins           : TDate;

    ID_FACULTY_buff      : int64;
    ID_SPEC_buff         : int64;
    ID_GROUP_buff        : int64;
    ID_FORMSTUD_buff     : int64;
    ID_CATEGORYSTUD_buff : int64;
    ID_NATIONAL_buff     : int64;
    ID_KURS_buff         : int64;
    function  GetReadDataSetInfoString(StProcName: string; ParamName: string): variant;
    procedure FormIniLanguage;

   public
    res:Variant;
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;


implementation

uses FIBQuery;

{$R *.dfm}

function TfrmToNextCurs.GetReadDataSetInfoString(StProcName: string; ParamName: string): variant;
 var
   SelectSQL: string;
 begin
  SelectSQL:= 'select * from ' + StProcName;
  DM.ReadDataSet.Close;
  DM.ReadDataSet.SelectSQL.Clear;
  DM.ReadDataSet.SelectSQL.Text := SelectSQL;
  DM.ReadDataSet.Open;
  Result := DM.ReadDataSet[ParamName];
  DM.ReadDataSet.Close;
 end;


constructor TfrmToNextCurs.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
var curdate : TDate;
    cnAcademicYear: TcnAcademicYear;
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
DM:=TDM_TNC.Create(Self);
DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_PRICES_AKGOD';
DM.DB.Handle:=DB_Handle;
DM.DataSet.Open;
DM.DataSet.FetchAll;

FormIniLanguage();
    ID_SESSION := -1;
    ID_SESSION_params_study := -1;

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
      cnShowMessage('Error',e.Message,mtError,[mbOK]);
      Transaction.Rollback;
      Screen.Cursor := crHourGlass;
     end;
   end;

// выставляю академ год
// если now < тек.январь -  текущий академ год, после января - след академ год
// забираю текущую дату с сервака
   curdate := GetReadDataSetInfoString('CN_GET_SYS_CURRENT_DATE', 'CURRENTDATE');
   cnAcademicYear := AcademicYearCompare(curdate, 1); // сравниваю с январем
   DateBegEdit.Date := cnAcademicYear.Date_Beg;
   DateEndEdit.Date := cnAcademicYear.Date_End;
   
   Screen.Cursor:=crDefault;
end;

procedure TfrmToNextCurs.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();
 //кэпшн формы
 Caption:=                  cnConsts.cn_TransferToNextCurs[PLanguageIndex];
 ForEach_Box.Properties.Caption := cnConsts.cn_ForEach[PLanguageIndex];
 Avto_Box.Properties.Caption    := cnConsts.cn_AvtoRastorg[PLanguageIndex];
 Label1.Caption                 := cnConsts.cn_ParamsOtbor[PLanguageIndex];
 cxGroupBox1.Caption            := cnConsts.cn_Params[PLanguageIndex];
 cxGroupBox2.Caption            := cnConsts.cn_CurrentTaskPercent[PLanguageIndex];
  ord_ae_NomOrder_Label.Caption  := cnConsts.cn_NumOrd[PLanguageIndex];
  ord_ae_DateOrder_Label.Caption := cnConsts.cn_DateOrd[PLanguageIndex];

 NewPeriod_Label.Caption:=       cnConsts.cn_NewPeriod[PLanguageIndex];

OkButton.Caption:=              cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=          cnConsts.cn_Cancel[PLanguageIndex];
end;

procedure TfrmToNextCurs.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmToNextCurs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
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
      cnShowMessage('Error',e.Message,mtError,[mbOK]);
      Transaction.Rollback;
      Screen.Cursor := crDefault;
     end;
   end;

if FormStyle = fsMDIChild then action:=caFree
else
DM.Free;
end;

procedure TfrmToNextCurs.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmToNextCurs.OkButtonClick(Sender: TObject);
type
  TCounters = record
    All     : Integer;
    Diss    : Integer;
    Perevod : Integer;
  end;
var
    ViewForm : TfrmToNC_Aff;
    i: integer;
    s: byte;
    CrossFire : boolean;
    curdate : TDate;
    cnUplSum : Currency;
    cnSumDoc : Currency;
    Uplacheno : Currency;
    NadoUplatit : Currency;
    id_session_pay : int64;
    id_session_calc : int64;
    CN_ID_TYPE_DISS_AVTO, CN_ORDERTYPE_TONEXTKURS: int64;
    Counters: TCounters;
//    LogFile:TextFile;
    LogStr: string;

begin
  if CheckControls(self, PLanguageIndex) then exit;

  cxGroupBox1.Enabled := False;
  cxGroupBox2.Enabled := True;
  OkButton.Enabled := False;
  CancelButton.Enabled := False;

  DM.DataSet.Close;
  DM.ReadDataSet.Close;
  ProgressBar.Position := 0;

  Screen.Cursor := crHourGlass;
  // беру текущую дату с сервака
  curdate := GetReadDataSetInfoString('CN_GET_SYS_CURRENT_DATE', 'CURRENTDATE');
  // беру ид.причины расторжения - Истчение срока договора
  CN_ID_TYPE_DISS_AVTO := GetReadDataSetInfoString('CN_GET_TYPE_DISS_AVTO', 'CN_ID_TYPE_DISS_AVTO');
  // беру ид.типа приказа на перевод на след. курс
  CN_ORDERTYPE_TONEXTKURS := GetReadDataSetInfoString('CN_PUB_SYS_DATA_GET_ALL', 'CN_ORDERTYPE_TONEXTKURS');

  with DM.StProc do
  begin
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
        cnShowMessage('Error',e.Message,mtError,[mbOK]);
        Transaction.Rollback;
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  DM.DataSet.SelectSQL.Clear;
  DM.DataSet.SelectSQL.Text := 'select * from CN_TMP_TONEXTCURS_SELECT('
                                 + inttostr(ID_SESSION) + ')';
  DM.DataSet.Open;
  DM.DataSet.FetchAll;
  DM.DataSet.First;

  ProgressBar.Properties.Max := DM.DataSet.RecordCount;
  Counters.All :=  DM.DataSet.RecordCount;
//  ShowMessage('RecordCount='+IntToStr(DM.DataSet.RecordCount));
  MaxLabel.Caption := vartostr(DM.DataSet.RecordCount) + ' \ ';
  CurrentLabel.Caption := inttostr(0);
  MaxLabel.Visible := true;
  CurrentLabel.Visible := true;
  ProgressBar.Update;
  MaxLabel.Update;
  CurrentLabel.Update;
  Update;
  Application.ProcessMessages;
  date_beg_ins :=  DateBegEdit.Date;
  date_end_ins :=  DateEndEdit.Date;

  ID_FACULTY_buff      :=-2;
  ID_SPEC_buff         :=-2;
  ID_GROUP_buff        :=-2;
  ID_FORMSTUD_buff     :=-2;
  ID_CATEGORYSTUD_buff :=-2;
  ID_NATIONAL_buff     :=-2;
  ID_KURS_buff         :=-2;

  //------------------------------------------------------------------------------
  Counters.Diss := 0;
  Counters.Perevod:= 0;

  // AssignFile(LogFile,ExtractFilePath(Application.ExeName)+'ToNextCurs-'+DateToStr(curdate)+'.log');
  // Rewrite(LogFile);
  LogStr:='Номер наказу: '+ord_ae_Nom_Ord.text+' '+'Період з '+DateToStr(date_beg_ins)+' по '+DateToStr(date_end_ins);
  Memo.Lines.Add(LogStr);

  for i := 0 to DM.DataSet.RecordCount-1  do
  begin
    date_beg_ins :=  DateBegEdit.Date;
    date_end_ins :=  DateEndEdit.Date;
    if Avto_Box.Checked then
    begin
      // сначала пробую закрыть договор
      // 1) проверяю дату окончания на меньше текущей

      if DM.DataSet['DATE_END']< curdate then
      begin
      // 2) проверяю долг
        With DM.StProc do
        begin
            // --------------запуск процедуры st_pay------------------------------
            // расчет уже уплаченной суммы
            StoredProcName := 'CN_PAY';
            Transaction.StartTransaction;
            Prepare;
            ParamByName('ID_STUD').AsInt64 := DM.DataSet['ID_STUD'];
            ParamByName('DATE_PROV_CHECK').AsShort := 1;
            ParamByName('IS_DOC_GEN').AsShort := 1;
            ParamByName('IS_PROV_GEN').AsShort := 1;
            ParamByName('IS_SMET_GEN').AsShort := 1;
            ParamByName('NOFPROV').AsShort := 1;
            ParamByName('DIGNORDOCID').AsShort := 1;
            ExecProc;
            cnUplSum:=ParamByName('CNUPLSUM').AsCurrency;
            cnSumDoc:=ParamByName('SUMMA_ALL').AsCurrency;
            id_session_pay:= ParamByName('ID_SESSION').AsInt64;
            Transaction.Commit;
            Close;
            if cnUplSum > cnSumDoc then
             Uplacheno:= cnUplSum
            else
             Uplacheno:= cnSumDoc;

            // --------------запуск процедуры cn_calc------------------------------
            //
            StoredProcName := 'CN_CALC';
            Transaction.StartTransaction;
            Prepare;
            ParamByName('ID_STUD').AsInt64 := DM.DataSet['ID_STUD'];
            if cnUplSum > cnSumDoc then  ParamByName('CNUPLSUM').AsCurrency := cnUplSum
            else
            ParamByName('CNUPLSUM').AsCurrency := cnSumDoc; // это уже с уплаченной суммой
            ExecProc;
             NadoUplatit:= ParamByName('CN_SNEED').AsCurrency;      //  сумма, необходимая для уплаты за весь период
             id_session_calc:= ParamByName('ID_SESSION').AsInt64;
            Transaction.Commit;
            Close;

            StoredProcName := 'CN_CALC_TMP_CLEAR';
            Transaction.StartTransaction;
            Prepare;
            ParamByName('ID_SESSION').AsInt64 := id_session_calc;
            ExecProc;
            Transaction.Commit;
            Close;

            StoredProcName := 'CN_PAY_TMP_CLEAR';
            Transaction.StartTransaction;
            Prepare;
            ParamByName('ID_SESSION').AsInt64 := id_session_pay;
            ExecProc;
            Transaction.Commit;
            Close;
        end;

        if NadoUplatit - Uplacheno = 0 then
        begin
          // 3) расторгаю  -------------------------------------------------------
          with DM.StProc do
          begin
            try
              Transaction.StartTransaction;
              StoredProcName := 'CN_DT_DOG_DISS_ANNUL_CONTRACT';
              ParamByName('ID_DOG_ROOT').AsInt64 := DM.DataSet['ID_DOG_ROOT'];
              ParamByName('ID_DOG_LAST').AsInt64 := DM.DataSet['ID_DOG'];
              ParamByName('ID_STUD').AsInt64     := DM.DataSet['ID_STUD'];
              ParamByName('DATE_DISS').AsDate    := curdate;
              ParamByName('ID_TYPE_DISS').AsInt64:= CN_ID_TYPE_DISS_AVTO;
              ParamByName('ORDER_DATE').AsDate   := curdate;
              ParamByName('ORDER_NUM').AsString  := 'avto';
              ParamByName('COMMENT').AsString    := 'Автоматичне розірвання при переведенні на наступний курс';
              ParamByName('IS_COLLECT').AsInteger := DM.DataSet['IS_COLLECT'];
              ParamByName('ID_DOG_DISS_IN').AsVariant := null;
              Prepare;
              ExecProc;
              Transaction.Commit;
              Counters.Diss := Counters.Diss +1;
            except
              on E:Exception do
              begin
                Transaction.Rollback;
                raise;
              end;
            end;
          end;
          DM.DataSet.Next;
          ProgressBar.Position := ProgressBar.Position+1;
          CurrentLabel.Caption := inttostr(strtoint(CurrentLabel.Caption) + 1);
          CurrentLabel.Update;
          ProgressBar.Update;
          Application.ProcessMessages;
          Continue;
        end
         else Memo.Lines.Add(DM.DataSet['FIO']+' № '+DM.DataSet['num_dog']+' - '+cn_Zadolg_Pay[PLanguageIndex]);
      end;  //-------------------
    end; // -------------------- чекбокс
    // перевод на след курс
    ID_FACULTY_ins      := DM.DataSet['ID_FACUL'] ;
    ID_SPEC_ins         := DM.DataSet['ID_SPEC'];

    if DM.DataSet['ID_GROUP'] <> null
     then ID_GROUP_ins        := DM.DataSet['ID_GROUP']
     else ID_GROUP_ins        := -1;

    ID_FORMSTUD_ins     := DM.DataSet['ID_FORM_STUD'];
    ID_CATEGORYSTUD_ins := DM.DataSet['ID_KAT_STUD'];
    ID_NATIONAL_ins     := DM.DataSet['ID_NATIONAL'];
    ID_KURS_ins         := DM.DataSet['KURS']+1;

    if ((ID_FACULTY_ins = ID_FACULTY_buff) and (ID_SPEC_ins    = ID_SPEC_buff)) then
      if ((ID_GROUP_ins   = ID_GROUP_buff) and (ID_FORMSTUD_ins = ID_FORMSTUD_buff)) then
        if ((ID_CATEGORYSTUD_ins = ID_CATEGORYSTUD_buff) and (ID_NATIONAL_ins =  ID_NATIONAL_buff)) then
          if (ID_KURS_ins =  ID_KURS_buff) then
          begin
            DM.DataSet.Next;
            ProgressBar.Position := ProgressBar.Position+1;
            CurrentLabel.Caption := inttostr(strtoint(CurrentLabel.Caption) + 1);
            CurrentLabel.Update;
            ProgressBar.Update;
            Application.ProcessMessages;
            Continue;
          end;

    if ForEach_Box.Checked then
    begin
      ViewForm := TfrmToNC_Aff.Create(self, PLanguageIndex, DM.DB.Handle);
      ViewForm.ID_NATIONAL   := DM.DataSet['ID_NATIONAL'];
      ViewForm.ID_FACULTY    := DM.DataSet['ID_FACUL'] ;
      ViewForm.ID_SPEC       := DM.DataSet['ID_SPEC'];
      ViewForm.ID_GROUP      := DM.DataSet['ID_GROUP'];
      ViewForm.ID_FORMSTUD   := DM.DataSet['ID_FORM_STUD'];
      ViewForm.ID_CATEGORYSTUD := DM.DataSet['ID_KAT_STUD'];
      ViewForm.CursComboBox.Value := ID_KURS_ins;

      dm.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_INFOSTUD_FIO('
         + DM.DataSet['ID_DOG_ROOT_AS_CHAR'] + ','
         + inttostr(DM.DataSet['ID_FACUL'])    + ','
         + inttostr(DM.DataSet['ID_SPEC'])     + ','
         + inttostr(DM.DataSet['ID_NATIONAL']) + ','
         + inttostr(DM.DataSet['ID_FORM_STUD'])+ ','
         + inttostr(DM.DataSet['ID_KAT_STUD']) + ','
         + inttostr(DM.DataSet['ID_GROUP']) +')';
      dm.ReadDataSet.Open;

      ViewForm.Fio_Edit.Text := dm.ReadDataSet['FIO_PEOPLE'];
      ViewForm.Num_Dog_Edit.Text  := dm.ReadDataSet['NUM_DOG'];
      ViewForm.DateBegEdit.Date := DateBegEdit.Date;
      ViewForm.DateEndEdit.Date := DateEndEdit.Date;
      ViewForm.Faculty_Edit.Text  := dm.ReadDataSet['NAME_FACUL'];
      ViewForm.Spec_Edit.Text  := dm.ReadDataSet['NAME_SPEC'];
      ViewForm.Group_Edit.Text  := dm.ReadDataSet['NAME_GROUP'];
      ViewForm.FormStud_Edit.Text  := dm.ReadDataSet['NAME_FORM_STUD'];
      ViewForm.CategoryStudy_Edit.Text  := dm.ReadDataSet['NAME_KAT_STUD'];
      ViewForm.Nazional_Edit.Text  := dm.ReadDataSet['NAME_NAZIONAL'];
      dm.ReadDataSet.Close;

      ViewForm.ShowModal;

      if ViewForm.ModalResult = 10 then // confirm
      begin
        ID_FACULTY_ins      := ViewForm.ID_FACULTY ;
        ID_SPEC_ins         := ViewForm.ID_SPEC ;
        ID_GROUP_ins        := ViewForm.ID_GROUP;
        ID_FORMSTUD_ins     := ViewForm.ID_FORMSTUD;
        ID_CATEGORYSTUD_ins := ViewForm.ID_CATEGORYSTUD;
        ID_NATIONAL_ins     := ViewForm.ID_NATIONAL;
        ID_KURS_ins         := strtoint(ViewForm.CursComboBox.Text);
        ProgressBar.Update;
      end;

      if ViewForm.ModalResult = 20 then //exit
      begin
        break;
        DM.DataSet.close;
        exit;
      end;

      if ViewForm.ModalResult = 40 then //admit
      begin
        DM.DataSet.Next;
        ProgressBar.Position := ProgressBar.Position+1;
        CurrentLabel.Caption := inttostr(strtoint(CurrentLabel.Caption) + 1);
        CurrentLabel.Update;
        ProgressBar.Update;
        Continue;
      end;

      if ViewForm.ModalResult = 30 then //admit_all
      begin
        ID_FACULTY_buff      := ViewForm.ID_FACULTY ;
        ID_SPEC_buff         := ViewForm.ID_SPEC ;
        ID_GROUP_buff        := ViewForm.ID_GROUP;
        ID_FORMSTUD_buff     := ViewForm.ID_FORMSTUD;
        ID_CATEGORYSTUD_buff := ViewForm.ID_CATEGORYSTUD;
        ID_NATIONAL_buff     := ViewForm.ID_NATIONAL;
        ID_KURS_buff         := strtoint(ViewForm.CursComboBox.Text);
        DM.DataSet.Next;
        ProgressBar.Position := ProgressBar.Position+1;
        CurrentLabel.Caption := inttostr(strtoint(CurrentLabel.Caption) + 1);
        CurrentLabel.Update;
        ProgressBar.Update;
        Continue;
      end;

    end;

    {проверяю пересечение уже имеющихся записей в студинфе
     если пересечение произошло - пропускаю договор
     и ничего не вношу}
    CrossFire := false;
    with DM.StProc do
    begin
      try
        Transaction.StartTransaction;
        StoredProcName := 'CN_DT_STUDINF_PERIOD_CROSSCHECK';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := strtoint64(DM.DataSet['ID_DOG_ROOT_AS_CHAR']);
        ParamByName('ID_DOG').AsInt64         := DM.DataSet['ID_DOG'];
        ParamByName('ID_STUD').AsInt64        := DM.DataSet['ID_STUD'];
        ParamByName('DATE_IN').AsDate         := date_beg_ins;
        ExecProc;
        CrossFire := bool(ParamByName('CROSSFIRE').AsInteger);
        Transaction.Commit;
      except
        on E:Exception do
        begin
          cnShowMessage('Error',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
          break;
          Screen.Cursor := crDefault;
        end;
      end;
    end;
    if CrossFire then
     Begin
       Memo.Lines.Add(DM.DataSet['FIO']+' № '+DM.DataSet['num_dog']+' - '+cn_CrossFireErrorStr[PLanguageIndex])
     end;

    {если дата окончания выходит за рамки действия договора
        - обрезаю до даты окончания договора,
          если дата начала выходит за рамки действия договора
        - пропускаю и ничего не вношу}
    if date_end_ins  > DM.DataSet['DATE_END'] then
       date_end_ins := DM.DataSet['DATE_END'];

    if (date_beg_ins >= DM.DataSet['DATE_END']) then
       Memo.Lines.Add(DM.DataSet['FIO']+' № '+DM.DataSet['num_dog']+' - '+cn_DateCheckErrorStr[PLanguageIndex]);

    if ((not (date_beg_ins >= DM.DataSet['DATE_END'])) and (not CrossFire))  then
      with DM.StProc do
        try
          Transaction.StartTransaction;
          StoredProcName := 'CN_DT_STUD_INF_INSERT';
          Prepare;
          ParamByName('ID_DOG_ROOT').AsInt64    := strtoint64(DM.DataSet['ID_DOG_ROOT_AS_CHAR']);
          ParamByName('ID_DOG').AsInt64         := DM.DataSet['ID_DOG'];
          ParamByName('ID_STUD').AsInt64        := DM.DataSet['ID_STUD'];
          ParamByName('ID_FACUL').AsInt64       := ID_FACULTY_ins;
          ParamByName('ID_SPEC').AsInt64        := ID_SPEC_ins;
          if ID_GROUP_ins <> -1 then
          ParamByName('ID_GROUP').AsInt64       := ID_GROUP_ins;
          ParamByName('ID_FORM_STUD').AsInt64   := ID_FORMSTUD_ins;
          ParamByName('ID_KAT_STUD').AsInt64    := ID_CATEGORYSTUD_ins;
          ParamByName('ID_NATIONAL').AsInt64    := ID_NATIONAL_ins;
          ParamByName('KURS').AsInt64           := ID_KURS_ins;
          ParamByName('DATE_BEG').AsDate        := date_beg_ins;
          ParamByName('DATE_END').AsDate        := date_end_ins;
          ExecProc;
          StoredProcName := 'CN_DT_DOG_ROOT_UPT_NEW_STUDINF';
          Prepare;
          ParamByName('ID_DOG_ROOT').AsInt64    := strtoint64(DM.DataSet['ID_DOG_ROOT_AS_CHAR']);
          ParamByName('ID_DOG').AsInt64         := DM.DataSet['ID_DOG'];
          ParamByName('ID_STUD').AsInt64        := DM.DataSet['ID_STUD'];
          ParamByName('ID_FACUL').AsInt64       := ID_FACULTY_ins;
          ParamByName('ID_SPEC').AsInt64        := ID_SPEC_ins;
          if ID_GROUP_ins <> -1 then
          ParamByName('ID_GROUP').AsInt64       := ID_GROUP_ins;
          ParamByName('ID_FORM_STUD').AsInt64   := ID_FORMSTUD_ins;
          ParamByName('ID_KAT_STUD').AsInt64    := ID_CATEGORYSTUD_ins;
          ParamByName('ID_NATIONAL').AsInt64    := ID_NATIONAL_ins;
          ParamByName('KURS').AsInt64           := ID_KURS_ins;
          ExecProc;

          // пишу в приказы о переводе на сл.курс
          StoredProcName := 'CN_DT_ORDERS_INSERT';
          Prepare;
          ParamByName('ID_ORDER').AsInt64       := CN_ORDERTYPE_TONEXTKURS;
          ParamByName('ID_STUD').AsInt64        := DM.DataSet['ID_STUD'];
          ParamByName('DATE_ORDER').AsDate      := ord_ae_Date_Ord.Date;
          ParamByName('NUM_ORDER').AsString     := ord_ae_Nom_Ord.Text;
          ParamByName('COMMENTS').AsString      := 'автоматичне додавання наказу при переведенні на наст. курс';
          ExecProc;

          Transaction.Commit;
          Counters.Perevod := Counters.Perevod + 1;
          DM.DataSet.Next;
          ProgressBar.Position := ProgressBar.Position+1;
          CurrentLabel.Caption := inttostr(strtoint(CurrentLabel.Caption) + 1);
          CurrentLabel.Update;
          ProgressBar.Update;
          Application.ProcessMessages;
        except
          on E:Exception do
          begin
            cnShowMessage('Error',e.Message,mtError,[mbOK]);
            Transaction.Rollback;
            break;
            Screen.Cursor := crDefault;
          end;
       end
    else
    begin
      DM.DataSet.Next;
      ProgressBar.Position := ProgressBar.Position+1;
      CurrentLabel.Caption := inttostr(strtoint(CurrentLabel.Caption) + 1);
      CurrentLabel.Update;
      ProgressBar.Update;
      Application.ProcessMessages;
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
      cnShowMessage('Error',e.Message,mtError,[mbOK]);
      Transaction.Rollback;
      Screen.Cursor := crDefault;
     end;
  end;
  // стираю сессию параметров
  with DM.StProc do
  begin
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
        cnShowMessage('Error',e.Message,mtError,[mbOK]);
        Transaction.Rollback;
        Screen.Cursor := crDefault;
      end;
    end;
  end;

  Screen.Cursor := crDefault;
  cxGroupBox1.Enabled := True;
  cxGroupBox2.Enabled := False;
  OkButton.Visible := False;
  CancelButton.Caption := cn_Main_ExitBtn_Caption[PLanguageIndex];
  CancelButton.Enabled := True;

  s:=0;
  if Counters.All=0 then s:=1;
  //  Memo.Lines.Add(cn_Success[PLanguageIndex]);
  Memo.Lines.Add(cn_WasFullWork[PLanguageIndex]+ inttostr(Counters.All) + PercentOfNumber(Counters.All+s, Counters.All+s));
  Memo.Lines.Add(cn_WasBreak[PLanguageIndex]+ inttostr(Counters.Diss) + PercentOfNumber(Counters.All+s, Counters.Diss+s));
  Memo.Lines.Add(cn_WasTransfer[PLanguageIndex]+ inttostr(Counters.Perevod)+ PercentOfNumber(Counters.All+s, Counters.Perevod+s));
  Memo.Lines.Add(cn_WasAdmit[PLanguageIndex]+ inttostr(Counters.All - Counters.Diss - Counters.Perevod)+ PercentOfNumber(Counters.All+s, Counters.All - Counters.Diss - Counters.Perevod+s));
  Height := Height +  Memo.Height; //- CancelButton.Height;
  Memo.Visible := True;
  // Writeln(logFile,cn_Success[PLanguageIndex]);
  // Writeln(logFile,cn_WasFullWork[PLanguageIndex]+ inttostr(Counters.All) + PercentOfNumber(Counters.All+s, Counters.All+s));
  // Writeln(logFile,cn_WasBreak[PLanguageIndex]+ inttostr(Counters.Diss) + PercentOfNumber(Counters.All+s, Counters.Diss+s));
  // Writeln(logFile,cn_WasTransfer[PLanguageIndex]+ inttostr(Counters.Perevod)+ PercentOfNumber(Counters.All+s, Counters.Perevod+s));
  // Writeln(logFile,cn_WasAdmit[PLanguageIndex]+ inttostr(Counters.All - Counters.Diss - Counters.Perevod)+ PercentOfNumber(Counters.All+s, Counters.All - Counters.Diss - Counters.Perevod+s));
  // CloseFile(LogFile);
end;

procedure TfrmToNextCurs.Params_ButtonClick(Sender: TObject);
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

procedure TfrmToNextCurs.FormShow(Sender: TObject);
begin
 DateBegEdit.SetFocus;
end;

procedure TfrmToNextCurs.DateBegEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  DateEndEdit.SetFocus;
end;

procedure TfrmToNextCurs.DateEndEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  ord_ae_Nom_Ord.SetFocus;
end;

procedure TfrmToNextCurs.ForEach_BoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  Avto_Box.SetFocus;
end;

procedure TfrmToNextCurs.Avto_BoxKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then  OkButton.SetFocus;
end;

procedure TfrmToNextCurs.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if not CancelButton.Enabled then CanClose:= False;
end;

procedure TfrmToNextCurs.DateEndEditExit(Sender: TObject);
begin
if DateBegEdit.Date >= DateEndEdit.Date then
 begin
  showmessage(cn_Dates_Prohibition[PLanguageIndex]);
  DateEndEdit.SetFocus;
 end;
end;

procedure TfrmToNextCurs.ord_ae_Nom_OrdKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  ord_ae_Date_Ord.SetFocus;
end;

procedure TfrmToNextCurs.ord_ae_Date_OrdKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  ForEach_Box.SetFocus;
end;

end.
