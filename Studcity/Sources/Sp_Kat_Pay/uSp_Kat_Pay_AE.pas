//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник категорий - добавление категории                         *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit uSp_Kat_Pay_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCalendar,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxControls, cxGridCustomView,
  cxGridDBTableView, cxGrid, Buttons, cxCheckBox, cxLabel, cxContainer,
  cxGroupBox, StdCtrls, cxButtons, cxCurrencyEdit, FIBDataSet, pFIBDataSet,
  ActnList, st_ConstUnit, st_common_funcs, st_common_types, iBase,
  st_common_loader, RxMemDS, ExtCtrls, uSp_kat_pay_DM;

type
  TKatSmet = record
   id_stage    : integer;
   percent     : single;
   sub_percent : single;
   summa       : currency;
   sub_summa   : currency;
   kod_sm      : int64;
   kod_razd    : int64;
   kod_st      : int64;
   kod_kekv    : int64;
   id_serv     : Int64;
  end;


  TCategoryFormAdd = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    KodLabel: TcxLabel;
    ShortEdit: TcxTextEdit;
    ShortNameLabel: TcxLabel;
    NameLabel: TcxLabel;
    NameEdit: TcxTextEdit;
    KodEdit: TcxTextEdit;
    StudCheck: TcxCheckBox;
    NotliveCheck: TcxCheckBox;
    MonthCheck: TcxCheckBox;
    PropiskaCheck: TcxCheckBox;
    cxGroupBox2: TcxGroupBox;
    AddButton: TSpeedButton;
    EditButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    TypeEdit: TcxButtonEdit;
    TypeLabel: TcxLabel;
    ClassEdit: TcxButtonEdit;
    ClassLabel: TcxLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    ReadDataSet: TpFIBDataSet;
    Category_ActionList: TActionList;
    Add_Action: TAction;
    Edit_Action: TAction;
    Delete_Action: TAction;
    Ok_Action: TAction;
    Xerox_Button: TSpeedButton;
    DataSource1: TDataSource;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    DataSet_kat: TpFIBDataSet;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TypeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure ClassEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KodEditKeyPress(Sender: TObject; var Key: Char);
    procedure ShortEditKeyPress(Sender: TObject; var Key: Char);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure TypeEditKeyPress(Sender: TObject; var Key: Char);
    procedure ClassEditKeyPress(Sender: TObject; var Key: Char);
    procedure cxGrid1TableView1DblClick(Sender: TObject);
    procedure Add_ActionExecute(Sender: TObject);
    procedure Edit_ActionExecute(Sender: TObject);
    procedure Delete_ActionExecute(Sender: TObject);
    procedure Ok_ActionExecute(Sender: TObject);
    procedure Xerox_ButtonClick(Sender: TObject);
    procedure refresh_sum;
  private
    Cur_date : string;
    Max_date : TDate;
    PLanguageIndex: byte;
    aTran_handle : TISC_TR_HANDLE;
    procedure FormIniLanguage();
  public
    id_type_category  : integer;
    id_category_class : integer;
    Redact : boolean;
    Redact_Kod_Edit, Redact_Short_Edit, Redact_Name_Edit,
    Redact_Type_Edit, Redact_Class_Edit : string;
    KatSmet : array of TKatSmet;
    aHandle : TISC_DB_HANDLE;
    is_admin : Boolean;
    st_end_month : Integer;
    id_kat : int64;
    DM : TfrmDM;
    procedure DeleteKatSmet(const id : integer);
    constructor create(aOwner : TComponent; aDB_handle : TISC_DB_HANDLE; aTran_handle : TISC_TR_HANDLE);reintroduce;
  end;

var
  CategoryFormAdd: TCategoryFormAdd;

implementation

uses uSp_Kat_Pay_Summ_AE, uSp_Kat_Pay_Xerox, uSp_Kat_Pay_Main;

{$R *.dfm}
procedure TCategoryFormAdd.FormIniLanguage();
begin
  // индекс языка (1-укр, 2 - рус)
  PLanguageIndex:=               stLanguageIndex;

  //названия кнопок
  OKButton.Caption :=         st_ConstUnit.st_Accept[PLanguageIndex];
  CancelButton.Caption :=     st_ConstUnit.st_Cancel[PLanguageIndex];

  ShortNameLabel.Caption:=    st_ConstUnit.st_ShortLable[PLanguageIndex];
  NameLabel.Caption :=        st_ConstUnit.st_NameLable[PLanguageIndex];
  TypeLabel.Caption :=        st_ConstUnit.st_TypeLable[PLanguageIndex];
  ClassLabel.Caption :=       st_ConstUnit.st_ClassLable[PLanguageIndex];

  // Студенческая категория
  StudCheck.Properties.Caption :=        st_ConstUnit.st_Stud_Cat[PLanguageIndex];

  // Оплата помесячно
  MonthCheck.Properties.Caption :=       st_ConstUnit.st_Month_Cat[PLanguageIndex];

  // Без проживания
  NotliveCheck.Properties.Caption :=     st_ConstUnit.st_NoLivers_Cat[PLanguageIndex];

  // Только прописка
  PropiskaCheck.Properties.Caption :=    st_ConstUnit.st_PropiOnly_Cat[PLanguageIndex];

  // грид
  cxGrid1DBTableView1DBColumn1.Caption := st_ConstUnit.st_grid_Date_Beg[PLanguageIndex];
  cxGrid1DBTableView1DBColumn2.Caption := st_ConstUnit.st_grid_Date_End[PLanguageIndex];
  cxGrid1DBTableView1DBColumn3.Caption := st_ConstUnit.st_PaySum_Cat[PLanguageIndex];
  cxGrid1DBTableView1DBColumn4.Caption := st_ConstUnit.st_SubsSum_Cat[PLanguageIndex];
  cxGroupBox2.Caption                  := st_ConstUnit.st_Sums_Cat[PLanguageIndex];

  AddButton.Hint :=         st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
  EditButton.Hint :=        st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  DeleteButton.Hint :=      st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
  Xerox_Button.Hint :=      st_ConstUnit.st_CopyCells[PLanguageIndex];

  Redact := False;
end;

{* Удаляет сметы у которых id_stage = id                       *
 * IN: id - идентификатор периода                              *}
procedure TCategoryFormAdd.DeleteKatSmet(const id : integer);
var
  i : integer;
begin
  if Length(KatSmet) = 0 then exit;

  i := 0;
  while i < Length(KatSmet) do
   begin
    if KatSmet[i].id_stage = id then
     begin
      KatSmet[i] := KatSmet[Length(KatSmet) - 1];
      SetLength(KatSmet, Length(KatSmet) - 1);
     end
    else inc(i);
   end;
end;

procedure TCategoryFormAdd.OKButtonClick(Sender: TObject);
begin
  if not IntegerCheck(KodEdit.Text) then
   begin
    ShowMessage(PChar(st_ConstUnit.st_mess_Code_need[PLanguageIndex]));
    KodEdit.SetFocus;
    exit;
   end;

  if ShortEdit.Text = '' then
   begin
    ShowMessage(PChar(st_ConstUnit.st_mess_ShortName_need[PLanguageIndex]));
    ShortEdit.SetFocus;
    exit;
   end;

  if NameEdit.Text = '' then
   begin
    ShowMessage(PChar(st_ConstUnit.st_mess_FullName_need[PLanguageIndex]));
    NameEdit.SetFocus;
    exit;
   end;

  if TypeEdit.Text = '' then
   begin
    ShowMessage(PChar(st_ConstUnit.st_mess_TypeLive_need[PLanguageIndex]));
    TypeEdit.SetFocus;
    exit;
   end;

  if ClassEdit.Text = '' then
   begin
    ShowMessage(PChar(st_ConstUnit.st_mess_ClassLive_need[PLanguageIndex]));
    ClassEdit.SetFocus;
    exit;
   end;

  if DataSet_kat.RecordCount = 0 then
   begin
    ShowMessage(PChar(st_ConstUnit.st_mess_Summs_need[PLanguageIndex]));
    cxGrid1.SetFocus;
    exit;
   end;

  If Caption = st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex] then
   Begin
    DM.DataSet_read.Close;
    DM.DataSet_read.SQLs.SelectSQL.Text := 'Select * from ST_SP_KATEGORY k where k.num_kategoriya = :num_kat';
    DM.DataSet_read.ParamByName('num_kat').AsString := KodEdit.Text;
    DM.DataSet_read.Open;
    DM.DataSet_read.FetchAll;
    If DM.DataSet_read.RecordCount <> 0 then
     Begin
      ShowMessage('Категорія з зазначеним кодом існує!');
      KodEdit.SetFocus;
      exit;
     end;
   End;

  ModalResult := mrOK;
end;

procedure TCategoryFormAdd.CancelButtonClick(Sender: TObject);
var
 qYESNOCANCEL: smallint;
begin
  if Redact = true then
   begin
    qYESNOCANCEL:=MessageBox(Handle, PChar(st_ConstUnit.st_SafeQuery[PLanguageIndex]),PChar(st_ConstUnit.st_Query[PLanguageIndex]),MB_YESNOCANCEL or MB_ICONQUESTION);
    if qYESNOCANCEL= 2 then exit;
    if qYESNOCANCEL= 6 then CategoryFormAdd.OkButtonClick(Sender);
    if qYESNOCANCEL= 7 then close;
   end
  else close;
end;

procedure TCategoryFormAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Action:=caFree;
end;

procedure TCategoryFormAdd.TypeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  aParameter : TstSimpleParams;
  res : Variant;
begin
  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := aHandle;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  aParameter.is_admin        := is_admin;

  res := RunFunctionFromPackage(aParameter, 'Studcity\st_sp_type_kat.bpl', 'ShowSPType_Kat');

  if VarArrayDimCount(res) <>0 then
   begin
     id_type_category := res[0];
     TypeEdit.Text    := res[1];
   end;

  aParameter.Free;
end;

procedure TCategoryFormAdd.FormCreate(Sender: TObject);
begin
  id_type_category := -2;
  id_category_class  := -2;

  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
  ReadDataSet.Open;
  Cur_date:= ReadDataSet['CUR_DATE'];
  ReadDataSet.Close;

  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select SYS_MAX_TIMESTAMP, st_end_month From SYS_OPTIONS';
  ReadDataSet.Open;
  if ReadDataSet['SYS_MAX_TIMESTAMP'] <> null
   then Max_date := ReadDataSet['SYS_MAX_TIMESTAMP']
   else Max_date := StrToDate('01.01.2050');

  if ReadDataSet['ST_END_MONTH'] <> null
   then st_end_month := ReadDataSet['ST_END_MONTH']
   else st_end_month := 0;
   
  ReadDataSet.Close;

  FormIniLanguage();
end;

procedure TCategoryFormAdd.ClassEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  aParameter : TstSimpleParams;
  res : Variant;
begin
  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := aHandle;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  aParameter.is_admin        := is_admin;

  res := RunFunctionFromPackage(aParameter, 'Studcity\st_sp_class_kat.bpl', 'ShowSPClass_Kat');

  if VarArrayDimCount(res) <>0 then
   begin
     id_category_class := res[0];
     ClassEdit.Text    := res[1];
   end;

  aParameter.Free;
end;

procedure TCategoryFormAdd.AddButtonClick(Sender: TObject);
var
  i : integer;
  id_stage : Int64;
begin
  DM.Global_StoredProc.StoredProcName := 'ST_SP_KAT_SUM_GEN_ID';
  DM.Global_StoredProc.Prepare;
  DM.Global_StoredProc.ExecProc;
  id_stage := DM.Global_StoredProc.parambyname('id_stage').AsInt64;

  CategoryFormAddSum := TCategoryFormAddSum.Create(Self);
  CategoryFormAddSum.Caption :=  st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];

  CategoryFormAddSum.aHandle := aHandle;
  CategoryFormAddSum.is_admin := is_admin;
  CategoryFormAddSum.DateEndEdit.EditValue := Max_date;
  CategoryFormAddSum.id_stage := id_stage;

  if CategoryFormAddSum.ShowModal = mrOK then
   begin
    Xerox_Button.Visible := true;
    EditButton.Enabled := true;
    DeleteButton.Enabled := true;

    DM.Global_StoredProc.StoredProcName := 'ST_SP_KAT_SUM_INSERT';
    DM.Global_StoredProc.Prepare;
    DM.Global_StoredProc.ParamByName('ID_KATEGORIYA').AsInt64  := id_kat;
    DM.Global_StoredProc.ParamByName('PAY_SUM').AsFloat := CategoryFormAddSum.SummaEdit.Value;
    DM.Global_StoredProc.ParamByName('SUB_SUM').AsFloat := CategoryFormAddSum.SubsSummaEdit.Value;
    DM.Global_StoredProc.ParamByName('BEG_DATE').AsDate := CategoryFormAddSum.DateBegEdit.Date;
    DM.Global_StoredProc.ParamByName('END_DATE').AsDate := CategoryFormAddSum.DateEndEdit.Date;
    DM.Global_StoredProc.ParamByName('ID_STAGE').AsInt64 := id_stage;
    DM.Global_StoredProc.ExecProc;


    CategoryFormAddSum.MemoryData_sum.Open;
    CategoryFormAddSum.MemoryData_sum.First;
    For i := 0 to CategoryFormAddSum.MemoryData_sum.RecordCount - 1 do
     begin
      DM.Global_StoredProc.StoredProcName := 'ST_SP_KAT_SMET_INSERT';
      DM.Global_StoredProc.Prepare;
      DM.Global_StoredProc.ParamByName('ID_STAGE').AsInt64  := id_stage;
      DM.Global_StoredProc.ParamByName('PERCENT').AsFloat   := CategoryFormAddSum.MemoryData_sum['md_procent'];
      DM.Global_StoredProc.ParamByName('SUB_PERC').AsFloat  := CategoryFormAddSum.MemoryData_sum['md_subs_procent'];
      DM.Global_StoredProc.ParamByName('SUMMA').AsFloat     := CategoryFormAddSum.MemoryData_sum['md_sum'];
      DM.Global_StoredProc.ParamByName('KOD_SM').AsInt64    := CategoryFormAddSum.MemoryData_sum['md_id_smeta'];
      DM.Global_StoredProc.ParamByName('KOD_RAZD').AsInt64  := CategoryFormAddSum.MemoryData_sum['md_id_razdel'];
      DM.Global_StoredProc.ParamByName('KOD_ST').AsInt64    := CategoryFormAddSum.MemoryData_sum['md_id_stat'];
      DM.Global_StoredProc.ParamByName('SUB_SUMMA').AsInt64 := CategoryFormAddSum.MemoryData_sum['md_subs_sum'];
      DM.Global_StoredProc.ParamByName('KOD_KEKV').AsInt64  := CategoryFormAddSum.MemoryData_sum['md_id_kekv'];
      DM.Global_StoredProc.ParamByName('ID_SERVES').AsInt64 := CategoryFormAddSum.MemoryData_sum['md_id_serves'];
      DM.Global_StoredProc.ExecProc;

      CategoryFormAddSum.MemoryData_sum.Next;
     end;

     Redact := true;

     refresh_sum;
   end;

  CategoryFormAddSum.Free;
end;

procedure TCategoryFormAdd.EditButtonClick(Sender: TObject);
var
  IdToKods : string;
  i    : integer;
  id_stage : Int64;
begin
  CategoryFormAddSum := TCategoryFormAddSum.Create(Self);
  CategoryFormAddSum.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];

  CategoryFormAddSum.aHandle  := aHandle;
  CategoryFormAddSum.is_admin := is_admin;

  CategoryFormAddSum.DateBegEdit.Date    := Dataset_Kat['BEG_DATE'];
  CategoryFormAddSum.DateEndEdit.Date    := Dataset_Kat['END_DATE'];
  CategoryFormAddSum.SummaEdit.Value     := Dataset_Kat['PAY_SUM'];
  CategoryFormAddSum.SubsSummaEdit.Value := Dataset_Kat['SUB_SUM'];
  For i := 0 to CategoryFormAddSum.MemoryData_sum.RecordCount - 1 do
   CategoryFormAddSum.MemoryData_sum.Delete;

  //Выбираем источник финансирования
  id_stage := Dataset_Kat['ID_STAGE'];

  ReadDataSet.Close;
  ReadDataSet.Database := DM.DB;
  ReadDataSet.Transaction := DM.Global_Transaction_write;
  ReadDataSet.SQLs.SelectSQL.Text := 'Select * from ST_SP_KAT_SMET_SELECT(:id_stage)';
  ReadDataSet.ParamByName('id_stage').AsInt64 := id_stage;
  ReadDataSet.Open;
  ReadDataSet.FetchAll;

  ReadDataSet.First;
  For i := 0 to ReadDataSet.RecordCount - 1 do
   Begin
    CategoryFormAddSum.MemoryData_sum.Insert;

    IdToKods:='';

    DM.DataSet_read.Close;
    DM.DataSet_Read.SelectSQL.Clear;
    DM.DataSet_Read.SelectSQL.Text := 'select KOD_OBJECT from ST_GET_NAME_BUDG_BY_ID('+ inttostr(ReadDataSet['kod_sm'])+ ',' + '1' + ')';
    DM.DataSet_Read.Open;
    if DM.DataSet_Read['KOD_OBJECT'] <> null
     then IdToKods := vartostr(DM.DataSet_Read['KOD_OBJECT']);
    DM.DataSet_Read.Close;

     DM.DataSet_Read.SelectSQL.Clear;
     DM.DataSet_Read.Close;
     DM.DataSet_Read.SelectSQL.Text := 'select KOD_OBJECT from ST_GET_NAME_BUDG_BY_ID('+ inttostr(ReadDataSet['kod_razd'])+ ',' + '2' + ')';
     DM.DataSet_Read.Open;
     if DM.DataSet_Read['KOD_OBJECT'] <> null
      then IdToKods:=IdToKods+'.'+inttostr(DM.DataSet_Read['KOD_OBJECT']) ;
     DM.DataSet_Read.Close;

     DM.DataSet_Read.SelectSQL.Clear;
     DM.DataSet_Read.Close;
     DM.DataSet_Read.SelectSQL.Text := 'select KOD_OBJECT from ST_GET_NAME_BUDG_BY_ID('+ inttostr(ReadDataSet['kod_st'])+ ',' + '3' + ')';
     DM.DataSet_Read.Open;
     if DM.DataSet_Read['KOD_OBJECT'] <> null
      then IdToKods:=IdToKods+'.'+inttostr(DM.DataSet_Read['KOD_OBJECT']) ;
     DM.DataSet_Read.Close;

     DM.DataSet_Read.SelectSQL.Clear;
     DM.DataSet_Read.Close;
     DM.DataSet_Read.SelectSQL.Text := 'select KEKV_KODE from PUB_SPR_KEKV_INFO('+ inttostr(ReadDataSet['kod_kekv'])+ ','+ kav+ cur_date +kav+')';
     DM.DataSet_Read.Open;
     if DM.DataSet_Read['KEKV_KODE'] <> null
      then IdToKods := IdToKods + '.' + inttostr(DM.DataSet_Read['KEKV_KODE']) ;
     DM.DataSet_Read.Close;

     CategoryFormAddSum.MemoryData_sum['md_istochnik']    := IdToKods;
     CategoryFormAddSum.MemoryData_sum['md_subs_sum']     := ReadDataSet['SUB_SUMMA'];
     CategoryFormAddSum.MemoryData_sum['md_subs_procent'] := ReadDataSet['SUB_PERC'];
     CategoryFormAddSum.MemoryData_sum['md_sum']          := ReadDataSet['SUMMA'];
     CategoryFormAddSum.MemoryData_sum['md_procent']      := ReadDataSet['PERCENT'];
     CategoryFormAddSum.MemoryData_sum['md_id_smeta']     := ReadDataSet['KOD_SM'];
     CategoryFormAddSum.MemoryData_sum['md_id_razdel']    := ReadDataSet['KOD_RAZD'];
     CategoryFormAddSum.MemoryData_sum['md_id_stat']      := ReadDataSet['KOD_ST'];
     CategoryFormAddSum.MemoryData_sum['md_id_kekv']      := ReadDataSet['KOD_KEKV'];
     if ReadDataSet['ID_SERVES'] <> null
      then CategoryFormAddSum.MemoryData_sum['md_id_serves'] := ReadDataSet['ID_SERVES']
      else CategoryFormAddSum.MemoryData_sum['md_id_serves'] := -1;

     DM.DataSet_Read.Close;
     DM.DataSet_Read.SelectSQL.Text := 'select SERVICE_TITLE from ST_SP_SERVICE where ID_SERVICE = :id';
     DM.DataSet_Read.ParamByName('id').AsVariant := ReadDataSet['ID_SERVES'];
     DM.DataSet_Read.Open;
     if DM.DataSet_Read['SERVICE_TITLE'] <> null
      then CategoryFormAddSum.MemoryData_sum['md_name_serves'] := DM.DataSet_Read['SERVICE_TITLE'];
     DM.DataSet_Read.Close;

     DM.DataSet_Read.Close;
     DM.DataSet_Read.SelectSQL.Text := 'select ST_OPTIONS from ST_SERVICE_DETAIL where ID_SERVICE = :id_serves and ID_RAZD_ST = :id_stat';
     DM.DataSet_Read.ParamByName('id_serves').AsVariant := ReadDataSet['ID_SERVES'];
     DM.DataSet_Read.ParamByName('id_stat').AsInt64   := ReadDataSet['KOD_ST'];
     DM.DataSet_Read.Open;
     if DM.DataSet_Read['ST_OPTIONS'] <> null
      then CategoryFormAddSum.MemoryData_sum['md_options'] := DM.DataSet_Read['ST_OPTIONS']
      else ShowMessage('На одной или нескольких услугах неверно указан источник финансирования!' + #10#13 + 'Проверте справочник услуг!');
     DM.DataSet_Read.Close;

     CategoryFormAddSum.MemoryData_sum.post;
     ReadDataSet.Next;
   end;
  CategoryFormAddSum.ShowModal;


  // изменение
  if CategoryFormAddSum.ModalResult  = mrOK then
   begin
    DM.Global_StoredProc.StoredProcName := 'ST_SP_KAT_SMET_DELETE';
    DM.Global_StoredProc.Prepare;
    DM.Global_StoredProc.ParamByName('ID_STAGE').AsInt64 := DataSet_kat['ID_STAGE'];
    DM.Global_StoredProc.ExecProc;

    DM.Global_StoredProc.StoredProcName := 'ST_SP_KAT_SUM_DELETE';
    DM.Global_StoredProc.Prepare;
    DM.Global_StoredProc.ParamByName('ID_STAGE').AsInt64 := ID_STAGE;
    DM.Global_StoredProc.ExecProc;

    DM.Global_StoredProc.StoredProcName := 'ST_SP_KAT_SUM_UPDATE';
    DM.Global_StoredProc.Prepare;
    DM.Global_StoredProc.ParamByName('ID_KATEGORIYA').AsInt64  := id_kat;
    DM.Global_StoredProc.ParamByName('PAY_SUM').AsFloat := CategoryFormAddSum.SummaEdit.Value;
    DM.Global_StoredProc.ParamByName('SUB_SUM').AsFloat := CategoryFormAddSum.SubsSummaEdit.Value;
    DM.Global_StoredProc.ParamByName('BEG_DATE').AsDate := CategoryFormAddSum.DateBegEdit.Date;
    DM.Global_StoredProc.ParamByName('END_DATE').AsDate := CategoryFormAddSum.DateEndEdit.Date;
    DM.Global_StoredProc.ParamByName('ID_STAGE').AsInt64 := id_stage;
    DM.Global_StoredProc.ExecProc;


    CategoryFormAddSum.MemoryData_sum.Open;
    CategoryFormAddSum.MemoryData_sum.First;
    For i := 0 to CategoryFormAddSum.MemoryData_sum.RecordCount - 1 do
     begin
      DM.Global_StoredProc.StoredProcName := 'ST_SP_KAT_SMET_INSERT';
      DM.Global_StoredProc.Prepare;
      DM.Global_StoredProc.ParamByName('ID_STAGE').AsInt64    := id_stage;
      DM.Global_StoredProc.ParamByName('PERCENT').AsFloat     := CategoryFormAddSum.MemoryData_sum['md_procent'];
      DM.Global_StoredProc.ParamByName('SUB_PERC').AsFloat    := CategoryFormAddSum.MemoryData_sum['md_subs_procent'];
      DM.Global_StoredProc.ParamByName('SUMMA').AsFloat       := CategoryFormAddSum.MemoryData_sum['md_sum'];
      DM.Global_StoredProc.ParamByName('KOD_SM').AsInt64      := CategoryFormAddSum.MemoryData_sum['md_id_smeta'];
      DM.Global_StoredProc.ParamByName('KOD_RAZD').AsInt64    := CategoryFormAddSum.MemoryData_sum['md_id_razdel'];
      DM.Global_StoredProc.ParamByName('KOD_ST').AsInt64      := CategoryFormAddSum.MemoryData_sum['md_id_stat'];
      DM.Global_StoredProc.ParamByName('SUB_SUMMA').AsInt64   := CategoryFormAddSum.MemoryData_sum['md_subs_sum'];
      DM.Global_StoredProc.ParamByName('KOD_KEKV').AsInt64    := CategoryFormAddSum.MemoryData_sum['md_id_kekv'];
      DM.Global_StoredProc.ParamByName('ID_SERVES').AsVariant := CategoryFormAddSum.MemoryData_sum['md_id_serves'];
      DM.Global_StoredProc.ExecProc;

      CategoryFormAddSum.MemoryData_sum.Next;
     end;

     Redact := true;

     refresh_sum;
   end; 

  CategoryFormAddSum.Free; 
end;

procedure TCategoryFormAdd.DeleteButtonClick(Sender: TObject);
begin
  if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo
   then exit;

  DM.Global_StoredProc.StoredProcName := 'ST_SP_KAT_SUM_DELETE';
  DM.Global_StoredProc.Prepare;
  DM.Global_StoredProc.ParamByName('ID_STAGE').AsInt64 := DataSet_kat['ID_STAGE'];
  DM.Global_StoredProc.ExecProc;

  Redact := True;

  refresh_sum;

  if DataSet_kat.RecordCount = 0 then
   begin
    EditButton.Enabled   := False;
    Deletebutton.Enabled := False;
    Xerox_Button.Enabled := False;
   end;  
end;

procedure TCategoryFormAdd.FormShow(Sender: TObject);
begin
  refresh_sum;
  
  //Если есть хоть одна запись
  if DataSet_kat.RecordCount <> 0 then
   begin
    //Разрешить действия
    EditButton.Enabled := true;
    DeleteButton.Enabled := true;
    Xerox_Button.Visible:=true;
   end;

  Redact_Kod_Edit   := KodEdit.Text;
  Redact_Short_Edit := ShortEdit.Text;
  Redact_Name_Edit  := NameEdit.text;
  Redact_Type_Edit  := TypeEdit.text;
  Redact_Class_Edit := ClassEdit.text;

  KodEdit.SetFocus;
end;

procedure TCategoryFormAdd.KodEditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then ShortEdit.SetFocus;
end;

procedure TCategoryFormAdd.ShortEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then NameEdit.SetFocus;
end;

procedure TCategoryFormAdd.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then TypeEdit.SetFocus;
end;

procedure TCategoryFormAdd.TypeEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then ClassEdit.SetFocus;
end;

procedure TCategoryFormAdd.ClassEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then OKButton.SetFocus;
end;

procedure TCategoryFormAdd.cxGrid1TableView1DblClick(Sender: TObject);
begin
  if DataSet_kat.RecordCount = 0 then exit;
  CategoryFormAdd.EditButtonClick(Sender);
end;

procedure TCategoryFormAdd.Add_ActionExecute(Sender: TObject);
begin
  CategoryFormAdd.AddButtonClick(Sender);
end;

procedure TCategoryFormAdd.Edit_ActionExecute(Sender: TObject);
begin
  CategoryFormAdd.EditButtonClick(Sender);
end;

procedure TCategoryFormAdd.Delete_ActionExecute(Sender: TObject);
begin
  CategoryFormAdd.DeleteButtonClick(Sender);
end;

procedure TCategoryFormAdd.Ok_ActionExecute(Sender: TObject);
begin
  CategoryFormAdd.OKButtonClick(Sender);
end;

procedure TCategoryFormAdd.Xerox_ButtonClick(Sender: TObject);
var
  IdToKods : string;
  id_stage_old, id_stage_new, i : integer;
begin
  CategoryFormAddSum := TCategoryFormAddSum.Create(Self);
  CategoryFormAddSum.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];

  DM.Global_StoredProc.StoredProcName := 'ST_SP_KAT_SUM_GEN_ID';
  DM.Global_StoredProc.Prepare;
  DM.Global_StoredProc.ExecProc;
  id_stage_new := DM.Global_StoredProc.parambyname('id_stage').AsInt64;

  CategoryFormAddSum.aHandle  := aHandle;
  CategoryFormAddSum.is_admin := is_admin;

  CategoryFormAddSum.DateBegEdit.Date    := Dataset_Kat['BEG_DATE'];
  CategoryFormAddSum.DateEndEdit.Date    := Dataset_Kat['END_DATE'];
  CategoryFormAddSum.SummaEdit.Value     := Dataset_Kat['PAY_SUM'];
  CategoryFormAddSum.SubsSummaEdit.Value := Dataset_Kat['SUB_SUM'];

  For i := 0 to CategoryFormAddSum.MemoryData_sum.RecordCount - 1 do
   CategoryFormAddSum.MemoryData_sum.Delete;

  //Выбираем источник финансирования
  id_stage_old := Dataset_Kat['ID_STAGE'];

  ReadDataSet.Close;
  ReadDataSet.Database := DM.DB;
  ReadDataSet.Transaction := DM.Global_Transaction_write;
  ReadDataSet.SQLs.SelectSQL.Text := 'Select * from ST_SP_KAT_SMET_SELECT(:id_stage)';
  ReadDataSet.ParamByName('id_stage').AsInt64 := id_stage_old;
  ReadDataSet.Open;
  ReadDataSet.FetchAll;

  ReadDataSet.First;
  For i := 0 to ReadDataSet.RecordCount - 1 do
   Begin
    CategoryFormAddSum.MemoryData_sum.Insert;

    IdToKods:='';
    
    DM.DataSet_read.Close;
    DM.DataSet_Read.SelectSQL.Clear;
    DM.DataSet_Read.SelectSQL.Text := 'select KOD_OBJECT from ST_GET_NAME_BUDG_BY_ID('+ inttostr(ReadDataSet['kod_sm'])+ ',' + '1' + ')';
    DM.DataSet_Read.Open;
    if DM.DataSet_Read['KOD_OBJECT'] <> null
     then IdToKods := vartostr(DM.DataSet_Read['KOD_OBJECT']);
    DM.DataSet_Read.Close;

     DM.DataSet_Read.SelectSQL.Clear;
     DM.DataSet_Read.Close;
     DM.DataSet_Read.SelectSQL.Text := 'select KOD_OBJECT from ST_GET_NAME_BUDG_BY_ID('+ inttostr(ReadDataSet['kod_razd'])+ ',' + '2' + ')';
     DM.DataSet_Read.Open;
     if DM.DataSet_Read['KOD_OBJECT'] <> null
      then IdToKods:=IdToKods+'.'+inttostr(DM.DataSet_Read['KOD_OBJECT']) ;
     DM.DataSet_Read.Close;

     DM.DataSet_Read.SelectSQL.Clear;
     DM.DataSet_Read.Close;
     DM.DataSet_Read.SelectSQL.Text := 'select KOD_OBJECT from ST_GET_NAME_BUDG_BY_ID('+ inttostr(ReadDataSet['kod_st'])+ ',' + '3' + ')';
     DM.DataSet_Read.Open;
     if DM.DataSet_Read['KOD_OBJECT'] <> null
      then IdToKods:=IdToKods+'.'+inttostr(DM.DataSet_Read['KOD_OBJECT']) ;
     DM.DataSet_Read.Close;

     DM.DataSet_Read.SelectSQL.Clear;
     DM.DataSet_Read.Close;
     DM.DataSet_Read.SelectSQL.Text := 'select KEKV_KODE from PUB_SPR_KEKV_INFO('+ inttostr(ReadDataSet['kod_kekv'])+ ','+ kav+ cur_date +kav+')';
     DM.DataSet_Read.Open;
     if DM.DataSet_Read['KEKV_KODE'] <> null
      then IdToKods := IdToKods + '.' + inttostr(DM.DataSet_Read['KEKV_KODE']) ;
     DM.DataSet_Read.Close;

     CategoryFormAddSum.MemoryData_sum['md_istochnik']    := IdToKods;
     CategoryFormAddSum.MemoryData_sum['md_subs_sum']     := ReadDataSet['SUB_SUMMA'];
     CategoryFormAddSum.MemoryData_sum['md_subs_procent'] := ReadDataSet['SUB_PERC'];
     CategoryFormAddSum.MemoryData_sum['md_sum']          := ReadDataSet['SUMMA'];
     CategoryFormAddSum.MemoryData_sum['md_procent']      := ReadDataSet['PERCENT'];
     CategoryFormAddSum.MemoryData_sum['md_id_smeta']     := ReadDataSet['KOD_SM'];
     CategoryFormAddSum.MemoryData_sum['md_id_razdel']    := ReadDataSet['KOD_RAZD'];
     CategoryFormAddSum.MemoryData_sum['md_id_stat']      := ReadDataSet['KOD_ST'];
     CategoryFormAddSum.MemoryData_sum['md_id_kekv']      := ReadDataSet['KOD_KEKV'];
     CategoryFormAddSum.MemoryData_sum['md_id_serves']    := ReadDataSet['ID_SERVES'];

     DM.DataSet_Read.Close;
     DM.DataSet_Read.SelectSQL.Text := 'select SERVICE_TITLE from ST_SP_SERVICE where ID_SERVICE = :id';
     DM.DataSet_Read.ParamByName('id').AsVariant := ReadDataSet['ID_SERVES'];
     DM.DataSet_Read.Open;
     if DM.DataSet_Read['SERVICE_TITLE'] <> null
      then CategoryFormAddSum.MemoryData_sum['md_name_serves'] := DM.DataSet_Read['SERVICE_TITLE'];
     DM.DataSet_Read.Close;

     DM.DataSet_Read.Close;
     DM.DataSet_Read.SelectSQL.Text := 'select ST_OPTIONS from ST_SERVICE_DETAIL where ID_SERVICE = :id_serves and ID_RAZD_ST = :id_stat';
     DM.DataSet_Read.ParamByName('id_serves').AsVariant := ReadDataSet['ID_SERVES'];
     DM.DataSet_Read.ParamByName('id_stat').AsInt64     := ReadDataSet['KOD_ST'];
     DM.DataSet_Read.Open;
     if DM.DataSet_Read['ST_OPTIONS'] <> null
      then CategoryFormAddSum.MemoryData_sum['md_options'] := DM.DataSet_Read['ST_OPTIONS'];
     DM.DataSet_Read.Close;

     CategoryFormAddSum.MemoryData_sum.post;
     ReadDataSet.Next;
    end;
  CategoryFormAddSum.ShowModal;

  if CategoryFormAddSum.ModalResult = mrOK then
   begin
    Xerox_Button.Visible := true;
    EditButton.Enabled := true;
    DeleteButton.Enabled := true;

    DM.Global_StoredProc.StoredProcName := 'ST_SP_KAT_SUM_INSERT';
    DM.Global_StoredProc.Prepare;
    DM.Global_StoredProc.ParamByName('ID_KATEGORIYA').AsInt64  := id_kat;
    DM.Global_StoredProc.ParamByName('PAY_SUM').AsFloat  := CategoryFormAddSum.SummaEdit.Value;
    DM.Global_StoredProc.ParamByName('SUB_SUM').AsFloat  := CategoryFormAddSum.SubsSummaEdit.Value;
    DM.Global_StoredProc.ParamByName('BEG_DATE').AsDate  := CategoryFormAddSum.DateBegEdit.Date;
    DM.Global_StoredProc.ParamByName('END_DATE').AsDate  := CategoryFormAddSum.DateEndEdit.Date;
    DM.Global_StoredProc.ParamByName('ID_STAGE').AsInt64 := id_stage_new;
    DM.Global_StoredProc.ExecProc;


    CategoryFormAddSum.MemoryData_sum.Open;
    CategoryFormAddSum.MemoryData_sum.First;
    For i := 0 to CategoryFormAddSum.MemoryData_sum.RecordCount - 1 do
     begin
      DM.Global_StoredProc.StoredProcName := 'ST_SP_KAT_SMET_INSERT';
      DM.Global_StoredProc.Prepare;
      DM.Global_StoredProc.ParamByName('ID_STAGE').AsInt64    := id_stage_new;
      DM.Global_StoredProc.ParamByName('PERCENT').AsFloat     := CategoryFormAddSum.MemoryData_sum['md_procent'];
      DM.Global_StoredProc.ParamByName('SUB_PERC').AsFloat    := CategoryFormAddSum.MemoryData_sum['md_subs_procent'];
      DM.Global_StoredProc.ParamByName('SUMMA').AsFloat       := CategoryFormAddSum.MemoryData_sum['md_sum'];
      DM.Global_StoredProc.ParamByName('KOD_SM').AsInt64      := CategoryFormAddSum.MemoryData_sum['md_id_smeta'];
      DM.Global_StoredProc.ParamByName('KOD_RAZD').AsInt64    := CategoryFormAddSum.MemoryData_sum['md_id_razdel'];
      DM.Global_StoredProc.ParamByName('KOD_ST').AsInt64      := CategoryFormAddSum.MemoryData_sum['md_id_stat'];
      DM.Global_StoredProc.ParamByName('SUB_SUMMA').AsInt64   := CategoryFormAddSum.MemoryData_sum['md_subs_sum'];
      DM.Global_StoredProc.ParamByName('KOD_KEKV').AsInt64    := CategoryFormAddSum.MemoryData_sum['md_id_kekv'];
      DM.Global_StoredProc.ParamByName('ID_SERVES').AsVariant := CategoryFormAddSum.MemoryData_sum['md_id_serves'];
      DM.Global_StoredProc.ExecProc;

      CategoryFormAddSum.MemoryData_sum.Next;
     end;

     Redact := true;

     refresh_sum;
   end;

  CategoryFormAddSum.Free;
end;

constructor TCategoryFormAdd.create(aOwner: TComponent;
  aDB_handle: TISC_DB_HANDLE; aTran_handle: TISC_TR_HANDLE);
begin
  inherited create(aOwner);

  DM := TfrmDM.Create(self);
  DM.DB.Handle := aDB_handle;
  DM.DB.Connected := true;
  DM.Global_Transaction_write.Handle := aTran_handle;

  Self.aTran_handle := aTran_handle;
  DM.Global_Transaction_write.StartTransaction;
end;

procedure TCategoryFormAdd.refresh_sum;
begin
  //Выбираем суммы
  DataSet_Kat.Close;
  Dataset_kat.Database := DM.DB;
  DataSet_kat.Transaction := DM.Global_Transaction_write;
  DataSet_Kat.sqls.SelectSQL.Text := 'select * from ST_SP_KAT_SUM_SELECT(:id) order by beg_date desc';
  DataSet_Kat.ParamByName('id').AsInt64 := id_kat;
  DataSet_Kat.Open;
end;

end.
