//******************************************************************************
//**Форма добавления начала обучения студента
//**Последнее изменение 01.06.09 Перчак А.Л.
//******************************************************************************
unit Contracts_StudInf_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxControls, cxGroupBox, cxDropDownEdit, cxCalendar, StdCtrls,
  cxCurrencyEdit, cxLookAndFeelPainters, cxButtons,
  cnConsts,cn_Common_Loader,cn_Common_Types, Ibase, cnConsts_Messages,
  GlobalSpr, FIBQuery, pFIBQuery, pFIBStoredProc, DM, cn_Common_Messages,
  DateUtils, DB, FIBDataSet, pFIBDataSet, AccMGMT, cn_Common_WaitForm,
  ActnList, ShellAPI;

type
  TfrmStudInf = class(TForm)
    GroupBox_1: TcxGroupBox;
    GroupBox_2: TcxGroupBox;
    Faculty_Edit: TcxButtonEdit;
    Spec_Edit: TcxButtonEdit;
    Group_Edit: TcxButtonEdit;
    FormStud_Edit: TcxButtonEdit;
    CategoryStudy_Edit: TcxButtonEdit;
    Nazional_Edit: TcxButtonEdit;
    Faculty_Label: TLabel;
    Spec_Label: TLabel;
    Group_Label: TLabel;
    FormStud_Label: TLabel;
    CategoryStudy_Label: TLabel;
    Nazional_Edit_Label: TLabel;
    Kurs_Label: TLabel;
    GroupBox_3: TcxGroupBox;
    Summa_Label: TLabel;
    Summa_Edit: TcxCurrencyEdit;
    Date_Beg_Label: TLabel;
    Date_Beg_DateEdit: TcxDateEdit;
    Date_End_Label: TLabel;
    Date_End_DateEdit: TcxDateEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Kurs_ComboBox: TcxComboBox;
    AddFromPreyskurant_Btn: TcxButton;
    DataSet_inf: TpFIBDataSet;
    Term_stud_label: TLabel;
    term_stud_ComboBox: TcxComboBox;
    DataSet_term_stud: TpFIBDataSet;
    ActionList1: TActionList;
    Act_help: TAction;
    DataSet_help: TpFIBDataSet;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Faculty_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Spec_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Group_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormStud_EditKeyPress(Sender: TObject; var Key: Char);
    procedure CategoryStudy_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Nazional_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Kurs_ComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure Date_Beg_DateEditKeyPress(Sender: TObject; var Key: Char);
    procedure Date_End_DateEditKeyPress(Sender: TObject; var Key: Char);
    procedure Summa_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Nazional_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CategoryStudy_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormStud_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Faculty_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure AddFromPreyskurant_BtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Kurs_ComboBoxPropertiesChange(Sender: TObject);
    procedure SetSumm;
    procedure term_stud_ComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure term_stud_ComboBoxPropertiesChange(Sender: TObject);
    procedure term_stud_ComboBoxPropertiesCloseUp(Sender: TObject);
    procedure Date_Beg_DateEditPropertiesChange(Sender: TObject);
    procedure Date_End_DateEditPropertiesChange(Sender: TObject);
    procedure Act_helpExecute(Sender: TObject);
  private
    PLanguageIndex:byte; // индекс языка
    DB_sp_Handle : TISC_DB_HANDLE;
    ExRecord : Boolean;
    procedure Clear_all_params;
    procedure FormIniLanguage; // инициализация формы и контролов по языку
  public
     // идентификаторы справочников
    ID_NATIONAL        : int64; // гражданство
    ID_FACULTY         : int64; // факультет
    ID_SPEC            : int64; // специальность
    ID_GROUP           : int64; // группа
    ID_FORMSTUD        : int64; // форма обучения
    ID_CATEGORYSTUD    : int64; // категория обучения
    ID_USER            : int64;
    ID_PRICE_PARAM     : int64;

    FinanceSource      : TFinanceSource;

    Summ1, Summ2, Summ3, Summ4,
    Summ5, Summ6, Summ7, Summ8  : Double;

    summ1_stage, summ2_stage, summ3_stage, summ4_stage,
    summ5_stage, summ6_stage, summ7_stage, summ8_stage  : Double;

    term_stud1, term_stud2, term_stud3, term_stud4,
    term_stud5, term_stud6, term_stud7, term_stud8  : Integer;

    term_stud1_stage, term_stud2_stage, term_stud3_stage, term_stud4_stage,
    term_stud5_stage, term_stud6_stage, term_stud7_stage, term_stud8_stage  : Integer;

    Date_beg_stud1, Date_beg_stud2, Date_beg_stud3, Date_beg_stud4, Date_beg_stud5, Date_beg_stud6, Date_beg_stud7, Date_beg_stud8,
    Date_end_stud1, Date_end_stud2, Date_end_stud3, Date_end_stud4, Date_end_stud5, Date_end_stud6, Date_end_stud7, Date_end_stud8 : TDate;

    Date_beg_stud1_stage, Date_beg_stud2_stage, Date_beg_stud3_stage, Date_beg_stud4_stage, Date_beg_stud5_stage, Date_beg_stud6_stage, Date_beg_stud7_stage, Date_beg_stud8_stage,
    Date_end_stud1_stage, Date_end_stud2_stage, Date_end_stud3_stage, Date_end_stud4_stage, Date_end_stud5_stage, Date_end_stud6_stage, Date_end_stud7_stage, Date_end_stud8_stage : TDate;

    kurs, kurs_beg, kurs_stage, kurs_beg_stage : Integer;

    Get_budget : array of array[1..12] of variant;

    is_admin, use_old_hist_price, change_stage_opl :Boolean;

    Term_id_price_param : array of integer;

    id_valute : int64;

    procedure Id_Sp_Nullification(); // обнуление всех справочных идентификаторов
    function GetSummaFromPreyskurant : boolean;
    Function GetTermFromPrice : Boolean;
    constructor Create(AOwner:TComponent; LanguageIndex : byte; DB_Handle:TISC_DB_HANDLE;is_admin:boolean);reintroduce;
  end;

var
  frmStudInf: TfrmStudInf;

implementation

uses Math;

{$R *.dfm}

constructor TfrmStudInf.Create(AOwner:TComponent; LanguageIndex : byte; DB_Handle:TISC_DB_HANDLE; is_admin:Boolean);
begin
  Screen.Cursor:=crHourGlass;

  inherited Create(AOwner);
  Self.is_admin:=is_admin;
  PLanguageIndex:= LanguageIndex;
  DB_sp_Handle:= DB_Handle;
  FormIniLanguage();
  Screen.Cursor:=crDefault;
end;

//**обнуление всех справочных идентификаторов
procedure TfrmStudInf.Id_Sp_Nullification();
begin
  ID_NATIONAL        := -1;
  ID_FACULTY         := -1;
  ID_SPEC            := -1;
  ID_GROUP           := -1;
  ID_FORMSTUD        := -1;
  ID_CATEGORYSTUD    := -1;
end;

//**Инициализация надписей
procedure TfrmStudInf.FormIniLanguage;
begin
  Faculty_Label.caption:=           cnConsts.cn_footer_Faculty[PLanguageIndex];
  Spec_Label.caption:=              cnConsts.cn_footer_Spec[PLanguageIndex];
  Group_Label.caption:=             cnConsts.cn_footer_Group[PLanguageIndex];
  FormStud_Label.caption:=          cnConsts.cn_footer_FormStudy[PLanguageIndex];
  CategoryStudy_Label.caption:=     cnConsts.cn_footer_CategoryStudy[PLanguageIndex];
  Nazional_Edit_Label.caption:=     cnConsts.cn_Gragdanstvo[PLanguageIndex];
  Kurs_Label.caption:=              cnConsts.cn_footer_Kurs[PLanguageIndex];
  Date_Beg_Label.caption:=          cnConsts.cn_Date_Beg_Label[PLanguageIndex];
  Date_End_Label.caption:=          cnConsts.cn_Date_End_Label[PLanguageIndex];
  Summa_Label.caption:=             cnConsts.cn_Summa_Column[PLanguageIndex];
  OkButton.Caption:=                cnConsts.cn_Accept[PLanguageIndex];
  CancelButton.Caption:=            cnConsts.cn_Cancel[PLanguageIndex];
  AddFromPreyskurant_Btn.Caption := cnConsts.cn_Preyskurant[PLanguageIndex];
  AddFromPreyskurant_Btn.Hint:=     cnConsts.cn_PreyskurantHint[PLanguageIndex];
  Term_stud_label.Caption        := 'Термін навчання'
end;

procedure TfrmStudInf.Clear_all_params;
begin
  Summa_Edit.Value := 0;
  ExRecord := false;
  term_stud_ComboBox.Clear;
  term_stud_ComboBox.ItemIndex := -1;
  summ1 := 0;
  summ2 := 0;
  summ3 := 0;
  summ4 := 0;
  summ5 := 0;
  term_stud1:=0;
  term_stud2:=0;
  term_stud3:=0;
  term_stud4:=0;
  term_stud5:=0;
  Date_beg_stud1 := Date_Beg_DateEdit.EditValue;
  Date_beg_stud2 := Date_Beg_DateEdit.EditValue;
  Date_beg_stud3 := Date_Beg_DateEdit.EditValue;
  Date_beg_stud4 := Date_Beg_DateEdit.EditValue;
  Date_beg_stud5 := Date_Beg_DateEdit.EditValue;
  Date_end_stud1 := Date_End_DateEdit.EditValue;
  Date_end_stud2 := Date_End_DateEdit.EditValue;
  Date_end_stud3 := Date_End_DateEdit.EditValue;
  Date_end_stud4 := Date_End_DateEdit.EditValue;
  Date_end_stud5 := Date_End_DateEdit.EditValue;
end;

//**Взятие сумм из прейскуранта в случае заполнения всех параметров обучения
function TfrmStudInf.GetSummaFromPreyskurant : boolean;
begin
  ID_PRICE_PARAM := term_id_price_param[term_stud_ComboBox.ItemIndex];
  //------------------------------------------------------------------------------
  DataSet_inf.Close;
  DataSet_inf.SQLs.SelectSQL.Clear;
  DataSet_inf.SQLs.SelectSQL.Add('SELECT * FROM CN_DT_PRICE_SELECT_BY_PARAM(:id_price_param)');
  DataSet_inf.ParamByName('id_price_param').AsInt64 := ID_PRICE_PARAM;

  DataSet_inf.Open;

  if DataSet_inf['KURS'] <> null then kurs_beg := DataSet_inf['KURS']; 
  if DataSet_inf['ID_VALUTE'] <> null then id_valute := DataSet_inf['ID_VALUTE'];

  If DataSet_inf['Sum1'] <> null then Summ1 := DataSet_inf['sum1'] else summ1 := 0;
  If DataSet_inf['Sum2'] <> null then Summ2 := DataSet_inf['sum2'] else summ2 := 0;
  If DataSet_inf['Sum3'] <> null then Summ3 := DataSet_inf['sum3'] else summ3 := 0;
  If DataSet_inf['Sum4'] <> null then Summ4 := DataSet_inf['sum4'] else summ4 := 0;
  If DataSet_inf['Sum5'] <> null then Summ5 := DataSet_inf['sum5'] else summ5 := 0;

  If DataSet_inf['term_stud1'] <> null then term_stud1:=DataSet_inf['term_stud1'] else term_stud1:=0;
  If DataSet_inf['term_stud2'] <> null then term_stud2:=DataSet_inf['term_stud2'] else term_stud2:=0;
  If DataSet_inf['term_stud3'] <> null then term_stud3:=DataSet_inf['term_stud3'] else term_stud3:=0;
  If DataSet_inf['term_stud4'] <> null then term_stud4:=DataSet_inf['term_stud4'] else term_stud4:=0;
  If DataSet_inf['term_stud5'] <> null then term_stud5:=DataSet_inf['term_stud5'] else term_stud5:=0;

  If DataSet_inf['Date_beg1'] <> null then  Date_beg_stud1 := DataSet_inf['Date_beg1'] else Date_beg_stud1 := Date_Beg_DateEdit.EditValue;
  If DataSet_inf['Date_end1'] <> null then  Date_end_stud1 := DataSet_inf['Date_end1'] else Date_end_stud1 := Date_End_DateEdit.EditValue;
  If DataSet_inf['Date_beg2'] <> null then  Date_beg_stud2 := DataSet_inf['Date_beg2'] else Date_beg_stud2 := Date_Beg_DateEdit.EditValue;
  If DataSet_inf['Date_end2'] <> null then  Date_end_stud2 := DataSet_inf['Date_end2'] else Date_end_stud2 := Date_End_DateEdit.EditValue;
  If DataSet_inf['Date_beg3'] <> null then  Date_beg_stud3 := DataSet_inf['Date_beg3'] else Date_beg_stud3 := Date_Beg_DateEdit.EditValue;
  If DataSet_inf['Date_end3'] <> null then  Date_end_stud3 := DataSet_inf['Date_end3'] else Date_end_stud3 := Date_End_DateEdit.EditValue;
  If DataSet_inf['Date_beg4'] <> null then  Date_beg_stud4 := DataSet_inf['Date_beg4'] else Date_beg_stud4 := Date_Beg_DateEdit.EditValue;
  If DataSet_inf['Date_end4'] <> null then  Date_end_stud4 := DataSet_inf['Date_end4'] else Date_end_stud4 := Date_End_DateEdit.EditValue;
  If DataSet_inf['Date_beg5'] <> null then  Date_beg_stud5 := DataSet_inf['Date_beg5'] else Date_beg_stud5 := Date_Beg_DateEdit.EditValue;
  If DataSet_inf['Date_end5'] <> null then  Date_end_stud5 := DataSet_inf['Date_end5'] else Date_end_stud5 := Date_End_DateEdit.EditValue;

  SetSumm;

  FinanceSource.isEmpty    := False;

  Result := true;
end;

//**Взятие срока обучения из прейскуранта в случае заполнения всех параметров обучения
function TfrmStudInf.GetTermFromPrice: boolean;
var
  i : integer;
  Year, month, day : Word;
  Date_beg_price, Date_end_price : TDate;
  Date_beg, Date_end : TDate;
begin
  If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/Cn_stage_opl','Add') <> 0
     then
       Begin
        messagebox(handle,
        pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
        +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
        pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        Result := False;
        exit;
       End;

  // проверяю на заполнение всех конролов - если есть пустые - выход
  if ((Date_Beg_DateEdit.Text = '')  or
      (Date_End_DateEdit.Text = '')  or
      (Spec_Edit.Text = '')          or
      (Group_Edit.Text = '')         or
      (FormStud_Edit.Text = '')      or
      (CategoryStudy_Edit.Text = '') or
      (Nazional_Edit.Text = '')      or
      (Kurs_ComboBox.Text = ''))
   then
    Begin
     Result := false;
     exit;
    End;

  Clear_all_params;
  
  {проверим наличие записи в прейскуранте с присланными
   параметрами обучения в присланном периоде действия прейскуранта}
  DataSet_term_stud.Close;
  DataSet_term_stud.SQLs.SelectSQL.Clear;
  DataSet_term_stud.SQLs.SelectSQL.Add('SELECT * FROM CN_GET_TERM_STUD_BY_PARAM(:id_facul,');
  DataSet_term_stud.SQLs.SelectSQL.Add(':id_spec,');
  DataSet_term_stud.SQLs.SelectSQL.Add(':id_form_stud,');
  DataSet_term_stud.SQLs.SelectSQL.Add(':id_kat_stud,');
  DataSet_term_stud.SQLs.SelectSQL.Add(':id_national) order by term_stud');

  DataSet_term_stud.ParamByName('id_facul').AsInt64     := ID_FACULTY;
  DataSet_term_stud.ParamByName('id_spec').AsInt64      := ID_SPEC;
  DataSet_term_stud.ParamByName('id_form_stud').AsInt64 := ID_FORMSTUD;
  DataSet_term_stud.ParamByName('id_kat_stud').AsInt64  := ID_CATEGORYSTUD;
  DataSet_term_stud.ParamByName('id_national').AsInt64  := ID_NATIONAL;

  DataSet_term_stud.Open;
  DataSet_term_stud.FetchAll;
  DataSet_term_stud.First;

  term_stud_ComboBox.Properties.Items.Clear;
  ExRecord := False;

  if DataSet_term_stud.RecordCount <> 0 then
   begin
    SetLength(Term_id_price_param, DataSet_term_stud.RecordCount);

    for i := 0 to DataSet_term_stud.RecordCount - 1 do Term_id_price_param[i] := -1;

    i := 0;
    while not DataSet_term_stud.Eof do
     Begin
      if DataSet_term_stud['Kurs'] <> null
       then kurs_beg := DataSet_term_stud['Kurs']
       else kurs_beg := 1;

      Date_beg_price := Date_Beg_DateEdit.EditValue;
      Date_end_price := Date_End_DateEdit.EditValue;

      if use_old_hist_price then
       Begin
        DecodeDate(Date_Beg_DateEdit.EditValue, year, month, day);
        Year := Year - (StrToInt(Kurs_ComboBox.Text) - kurs_beg);
        Date_beg_price := EncodeDate(Year, month, day);

        DecodeDate(Date_End_DateEdit.EditValue, year, month, day);
        Year := Year - (StrToInt(Kurs_ComboBox.Text) - kurs_beg);
        Date_end_price := EncodeDate(Year, month, day);
       End;

      Date_beg := DataSet_term_stud['Date_beg'];
      Date_end := DataSet_term_stud['Date_end'];

      if (((Date_beg_price >= Date_beg) and (Date_beg_price <= Date_end)) or
          ((Date_end_price >= Date_beg) and (Date_end_price <= Date_end)))
       then
       Begin
        if DataSet_term_stud['term_stud'] <> null
         then term_stud_ComboBox.Properties.Items.Add(IntToStr(DataSet_term_stud['term_stud'])+ ' (c ' + DateToStr(Date_beg) + ')');

        if DataSet_term_stud['id_price_param'] <> null
         then Term_id_price_param[i] := DataSet_term_stud['id_price_param'];

        ExRecord := true;

        i := i + 1;
       end;

      DataSet_term_stud.Next;
     end;

    if ExRecord then term_stud_ComboBox.ItemIndex := 0;

    Result := true;
    Exit;
   End;

  Result := false;
end;

procedure TfrmStudInf.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmStudInf.OkButtonClick(Sender: TObject);
var
 i:integer;
begin
  kurs:=Kurs_ComboBox.EditValue;
  
  if Faculty_Edit.Text= '' then
   begin
    ShowMessage(cnConsts_Messages.cn_Faculty_Need[PLanguageIndex]);
    Faculty_Edit.SetFocus;
    exit;
   end;

  if Spec_Edit.Text= '' then
   begin
    ShowMessage(cnConsts_Messages.cn_Spec_Need[PLanguageIndex]);
    Spec_Edit.SetFocus;
    exit;
   end;

  if Group_Edit.Text= '' then
   begin
    ShowMessage(cnConsts_Messages.cn_Group_Need[PLanguageIndex]);
    Group_Edit.SetFocus;
    exit;
   end;

  if FormStud_Edit.Text= '' then
   begin
    ShowMessage(cnConsts_Messages.cn_FormStud_Need[PLanguageIndex]);
    FormStud_Edit.SetFocus;
    exit;
   end;

  if CategoryStudy_Edit.Text= '' then
   begin
    ShowMessage(cnConsts_Messages.cn_KatStud_Need[PLanguageIndex]);
    CategoryStudy_Edit.SetFocus;
    exit;
   end;

  if Nazional_Edit.Text= '' then
   begin
    ShowMessage(cnConsts_Messages.cn_National_Need[PLanguageIndex]);
    Nazional_Edit.SetFocus;
    exit;
   end;

  if Date_Beg_DateEdit.Text= '' then
   begin
    ShowMessage(cnConsts_Messages.cn_DateBeg_Need[PLanguageIndex]);
    Date_Beg_DateEdit.SetFocus;
    exit;
   end;

  if Date_End_DateEdit.Text= '' then
   begin
    ShowMessage(cnConsts_Messages.cn_DateEnd_Need[PLanguageIndex]);
    Date_End_DateEdit.SetFocus;
    exit;
   end;

  // проверка на период не более 12 месяцев
  // проверяю ключик

  DataSet_inf.Close;
  DataSet_inf.SQLs.SelectSQL.Text := 'select CN_CHECK_PERIODS_STUDY_ON_12 from CN_PUB_SYS_DATA_GET_ALL';
  DataSet_inf.Open;

  If DataSet_inf['CN_CHECK_PERIODS_STUDY_ON_12']<> null then
   If Bool(DataSet_inf['CN_CHECK_PERIODS_STUDY_ON_12']) then
    If ((MonthsBetween(Date_Beg_DateEdit.Date, Date_End_DateEdit.Date)+1)> 12) then
     begin
      ShowMessage(cnConsts_Messages.cn_AcademicPeriodsCheck[PLanguageIndex]);
      Date_End_DateEdit.SetFocus;
      exit;
     end;

  DataSet_inf.Close;

  If (Date_Beg_DateEdit.Date >= Date_End_DateEdit.Date) then
   begin
    ShowMessage(cnConsts_Messages.cn_Dates_Prohibition[PLanguageIndex]);
    Date_End_DateEdit.SetFocus;
    exit;
   end;

  Summa_Edit.Value := StrToCurr(Summa_Edit.Text);

  if ((summ1+summ2+summ3+summ4+summ5+summ6+summ7+summ8=0)) then
   Begin
    summ1:=Summa_Edit.EditValue;
    summ2:=Summa_Edit.EditValue;
    summ3:=Summa_Edit.EditValue;
    summ4:=Summa_Edit.EditValue;
    summ5:=Summa_Edit.EditValue;
    summ6:=Summa_Edit.EditValue;
    summ7:=Summa_Edit.EditValue;
    summ8:=Summa_Edit.EditValue;
   End;

  if {(summ1+summ2+summ3+summ4+summ5<>0) and}
     (summ1_stage+summ2_stage+summ3_stage+summ4_stage+summ5_stage+summ6_stage+summ7_stage+summ8_stage<>0) then
   Begin
    i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], 'Змінити існуючу сумму на нову?', mtConfirmation, [mbYes, mbNo, mbCancel]);
    If i=6 then ModalResult:= mrOk;

    If i=7 then
     Begin
      summ1:=summ1_stage;
      summ2:=summ2_stage;
      summ3:=summ3_stage;
      summ4:=summ4_stage;
      summ5:=summ5_stage;
      summ6:=summ6_stage;
      summ7:=summ7_stage;
      summ8:=summ8_stage;

      term_stud1:=term_stud1_stage;
      term_stud2:=term_stud2_stage;
      term_stud3:=term_stud3_stage;
      term_stud4:=term_stud4_stage;
      term_stud5:=term_stud5_stage;
      term_stud6:=term_stud6_stage;
      term_stud7:=term_stud7_stage;
      term_stud8:=term_stud8_stage;

      Date_beg_stud1 := Date_beg_stud1_stage;
      Date_end_stud1 := Date_end_stud1_stage;
      Date_beg_stud2 := Date_beg_stud2_stage;
      Date_end_stud2 := Date_end_stud2_stage;
      Date_beg_stud3 := Date_beg_stud3_stage;
      Date_end_stud3 := Date_end_stud3_stage;
      Date_beg_stud4 := Date_beg_stud4_stage;
      Date_end_stud4 := Date_end_stud4_stage;
      Date_beg_stud5 := Date_beg_stud5_stage;
      Date_end_stud5 := Date_end_stud5_stage;
      Date_beg_stud6 := Date_beg_stud6_stage;
      Date_end_stud6 := Date_end_stud6_stage;
      Date_beg_stud7 := Date_beg_stud7_stage;
      Date_end_stud7 := Date_end_stud7_stage;
      Date_beg_stud8 := Date_beg_stud8_stage;
      Date_end_stud8 := Date_end_stud8_stage;


      kurs:=kurs_stage;
      kurs_beg:=kurs_beg_stage;

      change_stage_opl:=False;

      ModalResult:= mrOk;
     End;
   End
   else ModalResult:= mrOk;
end;

procedure TfrmStudInf.FormShow(Sender: TObject);
begin
  if Date_Beg_DateEdit.Enabled
   then Date_Beg_DateEdit.SetFocus
   else Summa_Edit.SetFocus;

  GetTermFromPrice;
end;

procedure TfrmStudInf.Faculty_EditKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Spec_Edit.SetFocus;
end;

procedure TfrmStudInf.Spec_EditKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Group_Edit.SetFocus;
end;

procedure TfrmStudInf.Group_EditKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then FormStud_Edit.SetFocus;
end;

procedure TfrmStudInf.FormStud_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then CategoryStudy_Edit.SetFocus;
end;

procedure TfrmStudInf.CategoryStudy_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then Nazional_Edit.SetFocus;
end;

procedure TfrmStudInf.Nazional_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then Kurs_ComboBox.SetFocus;
end;

procedure TfrmStudInf.Kurs_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then term_stud_ComboBox.SetFocus;
end;

procedure TfrmStudInf.Date_Beg_DateEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then Date_End_DateEdit.SetFocus;
end;

procedure TfrmStudInf.Date_End_DateEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then Summa_Edit.SetFocus;
end;

procedure TfrmStudInf.Summa_EditKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Faculty_Edit.SetFocus;
end;

procedure TfrmStudInf.Nazional_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_sp_Handle;
  AParameter.Formstyle:=fsNormal;
  if ID_NATIONAL <> -1 then
  AParameter.ID_Locate :=  ID_NATIONAL;
  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_National.bpl','ShowSPNational');
  AParameter.Free;

  if VarArrayDimCount(res)>0 then
   begin
    ID_NATIONAL := res[0];
    Nazional_Edit.Text:= vartostr(res[1]);
    if GetTermFromPrice
     then OkButton.SetFocus
     else Kurs_ComboBox.SetFocus;
   end;
end;

procedure TfrmStudInf.CategoryStudy_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_sp_Handle;
  AParameter.Formstyle:=fsNormal;
  if ID_CATEGORYSTUD <> -1 then
  AParameter.ID_Locate :=  ID_CATEGORYSTUD;
  res := RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_CategoryStudy.bpl','ShowSPCategoryStudy');
  AParameter.Free;
  if VarArrayDimCount(res)>0 then
   begin
    ID_CATEGORYSTUD := res[0];
    CategoryStudy_Edit.Text:= vartostr(res[1]);

    if GetTermFromPrice
     then OkButton.SetFocus
     else Nazional_Edit.SetFocus;
   end;
end;

procedure TfrmStudInf.FormStud_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle := DB_sp_Handle;
  AParameter.Formstyle := fsNormal;

  if ID_FORMSTUD <> -1 then AParameter.ID_Locate :=  ID_FORMSTUD;
  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FormStud.bpl','ShowSPFormStud');
  AParameter.Free;

  if VarArrayDimCount(res)>0 then
   begin
    ID_FORMSTUD := res[0];
    FormStud_Edit.Text:= vartostr(res[1]);

    If GetTermFromPrice
     then OkButton.SetFocus
     else CategoryStudy_Edit.SetFocus;
   end;
end;

procedure TfrmStudInf.Faculty_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_sp_Handle;
  AParameter.Formstyle:=fsNormal;
  if ID_FACULTY <> -1 then AParameter.ID_Locate := ID_FACULTY;
  if ID_SPEC <> -1 then AParameter.ID_Locate_1 := ID_SPEC;
  if ID_GROUP <> -1 then AParameter.ID_Locate_2 := ID_GROUP;

  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl','ShowSPFacSpecGroup');
  AParameter.Free;

  if VarArrayDimCount(res)>0 then
   begin
    ID_FACULTY := res[0];
    ID_SPEC    := res[1];
    ID_GROUP   := res[2];

    Faculty_Edit.Text:= vartostr(res[3]);
    Spec_Edit.Text:= vartostr(res[4]);
    Group_Edit.Text:= vartostr(res[5]);
    
    if GetTermFromPrice
     then OkButton.SetFocus
     else FormStud_Edit.SetFocus;
   end;
end;

//==Процедура обработки нажатия кнопки вызова прейскуранта, по техническим
//==соображаниям была отключена 29.05.2009г
procedure TfrmStudInf.AddFromPreyskurant_BtnClick(Sender: TObject);
var
  Res:Variant;
  AParameterPrice:TcnSimpleParams;
begin
  If Date_Beg_DateEdit.Text= '' then
   begin
    ShowMessage(cnConsts_Messages.cn_DateBeg_Need[PLanguageIndex]);
    Date_Beg_DateEdit.SetFocus;
    exit;
   end;

  If Date_End_DateEdit.Text= '' then
   begin
    ShowMessage(cnConsts_Messages.cn_DateEnd_Need[PLanguageIndex]);
    Date_End_DateEdit.SetFocus;
    exit;
   end;

//   wf := ShowWaitForm(Self,wfLoadPackage);
  // вызываю справочник Прейскурантов и заполняю переменные
  AParameterPrice := TcnSimpleParams.Create;
  AParameterPrice.Owner :=self;
  AParameterPrice.Db_Handle := DB_sp_Handle;
  AParameterPrice.Formstyle := fsNormal;
  AParameterPrice.ID_User := ID_USER;
  AParameterPrice.Date_beg := Date_Beg_DateEdit.EditValue;
  AParameterPrice.Date_end := Date_End_DateEdit.EditValue;
  AParameterPrice.WaitPakageOwner:=self;

  Res:= RunFunctionFromPackage(AParameterPrice, 'Contracts\cn_prices_ex.bpl','ShowPricesByDate');
  AParameterPrice.Free;

  If (varArrayDimCount(Res)>0) then
   begin
    ID_FACULTY         := Res[0];// -идентификатор факультета
    ID_SPEC            := Res[1];// -идентификатор специальности
    ID_NATIONAL        := Res[2];// -идентификатор гражданства
    ID_FORMSTUD        := Res[3];// -идентификатор формы обучения;
    ID_CATEGORYSTUD    := Res[4];// -идентификатор категории обучения;

    Faculty_Edit.Text       := vartostr(res[6]);  // -наименование факультета
    Spec_Edit.Text          := vartostr(res[7]);  // -наименование специальности
    FormStud_Edit.Text      := vartostr(res[9]);  // -наименование формы обучения
    CategoryStudy_Edit.Text := vartostr(res[10]); // -наименование категории обучения
    Nazional_Edit.Text      := vartostr(res[8]);  // -наименование гражданства

    if res[19] <> null
     then id_valute := res[19] //идн. валюты;
     else id_valute := -1;

    case strtoint(Res[11]) of
     1: frmStudInf.Kurs_ComboBox.ItemIndex := 0;
     2: frmStudInf.Kurs_ComboBox.ItemIndex := 1;
     3: frmStudInf.Kurs_ComboBox.ItemIndex := 2;
     4: frmStudInf.Kurs_ComboBox.ItemIndex := 3;
     5: frmStudInf.Kurs_ComboBox.ItemIndex := 4;
     6: frmStudInf.Kurs_ComboBox.ItemIndex := 5;
    end;

    OkButton.SetFocus;
    GetTermFromPrice;
   end;
end;

procedure TfrmStudInf.FormCreate(Sender: TObject);
begin
//  Kurs_ComboBox.Properties.OnChange := nil;
//  term_stud_ComboBox.Properties.OnChange := nil;

  FinanceSource.isEmpty := True;
  Summ1 := 0;
  Summ2 := 0;
  Summ3 := 0;
  Summ4 := 0;
  Summ5 := 0;
  Summ6 := 0;
  Summ7 := 0;
  Summ8 := 0;

  Kurs_beg := 1;

  Kurs_ComboBox.ItemIndex := 0;
end;

procedure TfrmStudInf.SetSumm;
begin
  Case (Kurs_ComboBox.ItemIndex-Kurs_beg+2) of
   1:Summa_Edit.Value := Summ1;
   2:Summa_Edit.Value := Summ2;
   3:Summa_Edit.Value := Summ3;
   4:Summa_Edit.Value := Summ4;
   5:Summa_Edit.Value := Summ5;
   6:Summa_Edit.Value := Summ6;
   7:Summa_Edit.Value := Summ7;
   8:Summa_Edit.Value := Summ8;
  End;
end;


procedure TfrmStudInf.Kurs_ComboBoxPropertiesChange(Sender: TObject);
begin
  GetTermFromPrice;
end;

procedure TfrmStudInf.term_stud_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then OkButton.SetFocus;
end;

procedure TfrmStudInf.term_stud_ComboBoxPropertiesChange(Sender: TObject);
begin
  if ExRecord then GetSummaFromPreyskurant;
end;

procedure TfrmStudInf.term_stud_ComboBoxPropertiesCloseUp(Sender: TObject);
begin
  if ExRecord then GetSummaFromPreyskurant;
end;

procedure TfrmStudInf.Date_Beg_DateEditPropertiesChange(Sender: TObject);
begin
  GetTermFromPrice;
end;

procedure TfrmStudInf.Date_End_DateEditPropertiesChange(Sender: TObject);
begin
  GetTermFromPrice;
end;

procedure TfrmStudInf.Act_helpExecute(Sender: TObject);
var
  FileName : String;
  FullName : PAnsiChar;
begin
  DataSet_help.Close;
  DataSet_help.SQLs.SelectSQL.Text := 'select * from pub_sp_help where name_object = :object and name_system = :system';
  DataSet_help.ParamByName('object').AsString := 'study_param_ae';
  DataSet_help.ParamByName('system').AsString := 'contracts';
  DataSet_help.Open;


  If DataSet_help.RecordCount = 0 then
   begin
    cnShowMessage('Help not found',
                  'Help not Found' + #13 + cnConsts_Messages.cn_GoToAdmin[PLanguageIndex],
                   mtError,
                   [mbOK]);
    Exit;
   end;

  FileName := DataSet_help.FieldByName('NAME_FILE').AsString;
  FullName := PChar(ExtractFilePath(Application.ExeName) + 'Help\Contracts\' + FileName);
  if not FileExists(FullName) then
   Begin
    cnShowMessage('File not found',
                   FullName + #13 + cnConsts_Messages.cn_GoToAdmin[PLanguageIndex],
                   mtError,
                   [mbOK]);
    Exit;
   end;

  ShellExecute(Handle, 'open', FullName, nil, nil, SW_SHOWNORMAL);
end;

end.
