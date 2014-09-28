//******************************************************************************
//* Проект "Горводоканал"                                                      *
//* Форма добавления договора                                                  *
//* Выполнил: Перчак А.Л. 2010г                                                *
//******************************************************************************
unit uReestr_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxCheckBox,
  StdCtrls, cxRadioGroup, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxGroupBox, cxPC, cxLookAndFeelPainters, cxButtons, cxButtonEdit,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, FIBDataSet,
  pFIBDataSet, cxCurrencyEdit, Buttons, ExtCtrls, uCommonSp, ActnList, AccMGMT,
  AllPeopleUnit, uCommon_Funcs, iBase, RxMemDS, uCommon_Messages, uConsts,
  uConsts_Messages, uReestr_DM, uCommon_Types, uCommon_Loader,
  uReestr_Subsidy_AE, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  DogLoaderUnit;

type
  TfrmReestr_AE = class(TForm)
    label_payer: TLabel;
    cxGroupBox2: TcxGroupBox;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    Label13: TLabel;
    Familia_Ukr: TcxTextEdit;
    Label14: TLabel;
    Name_Ukr: TcxTextEdit;
    Label15: TLabel;
    Otch_Ukr: TcxTextEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    Button_Kat_Del: TSpeedButton;
    Button_Kat_Add: TSpeedButton;
    Button_Kat_Edit: TSpeedButton;
    Button_Living_Add: TSpeedButton;
    Button_Living_Edit: TSpeedButton;
    Button_Living_Del: TSpeedButton;
    cxPageControl1: TcxPageControl;
    cxTabSheet4: TcxTabSheet;
    cxGroupBox5: TcxGroupBox;
    Button_Subsidy_Del: TSpeedButton;
    Button_Subsidy_Add: TSpeedButton;
    Button_Subsidy_Edit: TSpeedButton;
    cxTabSheet5: TcxTabSheet;
    cxGroupBox6: TcxGroupBox;
    Button_Lgots_Del: TSpeedButton;
    Button_Lgots_Add: TSpeedButton;
    Button_Lgots_Edit: TSpeedButton;
    cxGroupBox7: TcxGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Edit_num_Dog: TcxTextEdit;
    DateEdit_Date_reg: TcxDateEdit;
    cxTabSheet6: TcxTabSheet;
    cxGroupBox11: TcxGroupBox;
    Button_EntryRest_Add: TSpeedButton;
    Button_EntryRest_Edit: TSpeedButton;
    Button_EntryRest_Del: TSpeedButton;
    SummaEdit: TcxCurrencyEdit;
    SummaLabel: TLabel;
    Button_Auto_EntryRest: TcxButton;
    Category_ActionList: TActionList;
    Add_Action: TAction;
    Edit_Action: TAction;
    Delete_Action: TAction;
    Ok_Action: TAction;
    Cur_WorkPlace_TextEdit: TcxTextEdit;
    Label11: TLabel;
    Label12: TLabel;
    Cur_Posada_TextEdit: TcxTextEdit;
    ApostrofAction: TAction;
    Payer_Edit: TcxButtonEdit;
    DateEdit_Date_beg: TcxDateEdit;
    Label5: TLabel;
    Label16: TLabel;
    DateEdit_Date_End: TcxDateEdit;
    MemoryData_Living: TRxMemoryData;
    MemoryData_Kat: TRxMemoryData;
    MemoryData_Subsidy: TRxMemoryData;
    MemoryData_Lgots: TRxMemoryData;
    MemoryData_EntryRest: TRxMemoryData;
    DataSource_Living: TDataSource;
    DataSource_Kat: TDataSource;
    DataSource_EntryRest: TDataSource;
    DataSource_Lgots: TDataSource;
    DataSource_Subsidy: TDataSource;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    Grid_living: TcxGrid;
    GridTable_Living: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Grid_Kat: TcxGrid;
    GridTable_Kat: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    Grid_Subsidy: TcxGrid;
    GridTable_Subsidy: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    Grid_Lgots: TcxGrid;
    GridTable_Lgots: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    Grid_EntryRest: TcxGrid;
    GridTable_EntryRest: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    GridTable_EntryRest_Sources: TcxGridDBColumn;
    GridTable_EntryRest_Summa: TcxGridDBColumn;
    GridTable_EntryRest_Id_smeta: TcxGridDBColumn;
    GridTable_EntryRest_Id_Razdel: TcxGridDBColumn;
    GridTable_EntryRest_Id_Stat: TcxGridDBColumn;
    GridTable_EntryRest_Id_Kekv: TcxGridDBColumn;
    GridTable_Lgots_Id_Lgot_sum: TcxGridDBColumn;
    GridTable_Lgots_Kod: TcxGridDBColumn;
    GridTable_Lgots_Date_Beg: TcxGridDBColumn;
    GridTable_Lgots_Date_end: TcxGridDBColumn;
    GridTable_Lgots_Order: TcxGridDBColumn;
    GridTable_Lgots_Number_Order: TcxGridDBColumn;
    GridTable_Subsidy_ID_Subsidy: TcxGridDBColumn;
    GridTable_Subsidy_Date_Beg: TcxGridDBColumn;
    GridTable_Subsidy_date_end: TcxGridDBColumn;
    GridTable_Subsidy_Summa: TcxGridDBColumn;
    GridTable_Subsidy_Kol_month: TcxGridDBColumn;
    GridTable_Subsidy_State: TcxGridDBColumn;
    GridTable_Kat_Id_Kat_sum: TcxGridDBColumn;
    GridTable_Kat_date_Beg: TcxGridDBColumn;
    GridTable_Kat_Date_end: TcxGridDBColumn;
    GridTable_Kat_Summa: TcxGridDBColumn;
    GridTable_Living_Id_man: TcxGridDBColumn;
    GridTable_Living_FIO: TcxGridDBColumn;
    GridTable_Living_Date_Birth: TcxGridDBColumn;
    MemoryData_KatMemoryData_Kat_Date_beg: TDateField;
    MemoryData_KatMemoryData_Kat_Date_End: TDateField;
    MemoryData_KatMemoryData_Kat_Summa: TFloatField;
    MemoryData_SubsidyMemoryData_Subsidy_Id_subsidy: TIntegerField;
    MemoryData_SubsidyMemoryData_Subsidy_date_Beg: TDateTimeField;
    MemoryData_SubsidyMemoryData_Subsidy_Date_End: TDateTimeField;
    MemoryData_SubsidyMemoryData_Subsidy_summa: TFloatField;
    MemoryData_SubsidyMemoryData_Subsidy_Kol_month: TIntegerField;
    MemoryData_SubsidyMemoryData_Subsidy_state: TStringField;
    GridTable_Kat_name: TcxGridDBColumn;
    MemoryData_KatMemoryData_Kat_Name: TStringField;
    MemoryData_KatMemoryData_Kat_Id_Kat_sum: TIntegerField;
    MemoryData_KatMemoryData_Kat_Id_Kat: TIntegerField;
    MemoryData_SubsidyMemoryData_Subsidy_Comments: TStringField;
    MemoryData_SubsidyMemoryData_Subsidy_name: TStringField;
    GridTable_Lgots_Procent: TcxGridDBColumn;
    GridTable_Lgots_Name: TcxGridDBColumn;
    MemoryData_LgotsMemoryData_Lgots_Id_Lgot_sum: TIntegerField;
    MemoryData_LgotsMemoryData_Lgots_Kod: TIntegerField;
    MemoryData_LgotsMemoryData_Lgots_Date_Beg: TDateTimeField;
    MemoryData_LgotsMemoryData_Lgots_Date_end: TDateTimeField;
    MemoryData_LgotsMemoryData_Lgots_Order: TStringField;
    MemoryData_LgotsMemoryData_Lgots_Number_Order: TStringField;
    MemoryData_LgotsMemoryData_Lgots_Procent: TFloatField;
    MemoryData_LgotsMemoryData_Lgots_Name: TStringField;
    MemoryData_LgotsMemoryData_Lgots_Id_lgot: TIntegerField;
    MemoryData_EntryRestMemoryData_EntryRest_Sources: TStringField;
    MemoryData_EntryRestMemoryData_EntryRest_Summa: TFloatField;
    MemoryData_EntryRestMemoryData_EntryRest_Id_smeta: TIntegerField;
    MemoryData_EntryRestMemoryData_EntryRest_Id_Razdel: TIntegerField;
    MemoryData_EntryRestMemoryData_EntryRest_Id_Stat: TIntegerField;
    MemoryData_EntryRestMemoryData_EntryRest_Id_Kekv: TIntegerField;
    GridTable_EntryRest_Smeta: TcxGridDBColumn;
    GridTable_EntryRest_razdel: TcxGridDBColumn;
    GridTable_EntryRest_stat: TcxGridDBColumn;
    GridTable_EntryRest_kekv: TcxGridDBColumn;
    MemoryData_EntryRestMemoryData_EntryRest_smeta: TStringField;
    MemoryData_EntryRestMemoryData_EntryRest_razdel: TStringField;
    MemoryData_EntryRestMemoryData_EntryRest_stat: TStringField;
    MemoryData_EntryRestMemoryData_EntryRest_kekv: TStringField;
    RadioButton_fiz: TcxRadioButton;
    RadioButton_jur: TcxRadioButton;
    MFO_Label: TLabel;
    MFO_Edit: TcxTextEdit;
    RasSchet_Label: TLabel;
    RasSchet_Edit: TcxTextEdit;
    Osoba_Label: TLabel;
    LookupComboBox: TcxLookupComboBox;
    MemoryData_LivingMemoryData_Living_id_man: TIntegerField;
    MemoryData_LivingMemoryData_Living_FIO: TStringField;
    MemoryData_LivingMemoryData_Living_DateBirth: TDateField;
    MemoryData_KatMemoryData_KatBeg: TIntegerField;
    MemoryData_KatMemoryData_KatEnd: TIntegerField;
    GridTable_KatBeg: TcxGridDBColumn;
    GridTable_KatEnd: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure Button_Kat_AddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button_Kat_EditClick(Sender: TObject);
    procedure Button_Kat_DelClick(Sender: TObject);
    procedure Button_Living_AddClick(Sender: TObject);
    procedure Button_Living_EditClick(Sender: TObject);
    procedure Button_Living_DelClick(Sender: TObject);
    procedure Button_Subsidy_AddClick(Sender: TObject);
    procedure Button_Subsidy_EditClick(Sender: TObject);
    procedure Button_Subsidy_DelClick(Sender: TObject);
    procedure Button_Lgots_AddClick(Sender: TObject);
    procedure Button_Lgots_EditClick(Sender: TObject);
    procedure Button_Lgots_DelClick(Sender: TObject);
    procedure Button_EntryRest_AddClick(Sender: TObject);
    procedure Button_EntryRest_DelClick(Sender: TObject);
    procedure Button_EntryRest_EditClick(Sender: TObject);
    procedure SummaEditKeyPress(Sender: TObject; var Key: Char);
    procedure Button_Auto_EntryRestClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Familia_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RadioButton_fizClick(Sender: TObject);
    procedure RadioButton_jurClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM : TfrmReestr_DM;
    is_admin : Boolean;
    procedure FormIniLanguage();
  public
    id_kod: Int64;
    Redact : boolean;
    Redact_Live, Redact_Category, Redact_Subs, Redact_Lgot: boolean;

    Inostranez_Redact, Propiska_Redact, Propusk_Redact : boolean;
    Id_department, id_group, id_spec : int64;

    Id_department_Redact,  id_group_Redact, id_spec_Redact: int64;

    Date_Born_Redact, Dogovor_DateEdit_Redact : TDateTime;
    Familia_Reduct, Name_Redact, Otch_Redact, Pol_Redact,
    Nomer_Dogovora_Redact,  Tabel_Edit_Redact, Nalog_Edit_Redact,
    Kurs_Redact, Familia_UKR_Reduct, Name_UKR_Redact, Otch_UKR_Redact, cur_work_place, cur_posada   : string;

    ViewMode : boolean;
    ID_MAN : Int64;
    ID_DOG : Int64;
    ActivePageIndex : Integer;
    is_edit:Integer;

    constructor Create(aOwner : TComponent; aHandle : TISC_DB_HANDLE; ais_admin : Boolean; aPageIndex : Integer); reintroduce;
  end;

var
  frmReestr_AE: TfrmReestr_AE;

implementation

uses DateUtils, Math, uReestr_Kat_AE, uReestr_Lgots_AE, uReestr_EntryRest_AE,
  FIBQuery;

{$R *.dfm}

constructor TfrmReestr_AE.create(aOwner : TComponent; aHandle : TISC_DB_HANDLE; ais_admin : Boolean; aPageIndex : Integer);
Begin
  inherited create(aOwner);

  DM := TfrmReestr_DM.Create(Self);
  DM.DB.Handle := aHandle;
  is_admin := ais_admin;
  DM.DB.Connected := True;
  DM.WriteTransaction.StartTransaction;
  ActivePageIndex := aPageIndex;
end;

procedure TfrmReestr_AE.FormIniLanguage();
begin
  // индекс языка (1-укр, 2 - рус)
  PLanguageIndex:=               uCommon_Funcs.bsLanguageIndex;

  //названия кнопок
  OkButton.Caption:=        uConsts.bs_Accept[PLanguageIndex];
  CancelButton.Caption:=    uConsts.bs_Cancel[PLanguageIndex];

  //проживающие
  cxTabSheet1.Caption                 := bs_living_Caption[PLanguageIndex];
  GridTable_Living_FIO.Caption        := bs_grid_FIO_Column[PLanguageIndex];
  GridTable_Living_Date_Birth.Caption := bs_DateBirth[PLanguageIndex];

  //Услуги
  cxTabSheet2.Caption            := bs_Kat_Caption[PLanguageIndex];
  GridTable_Kat_name.caption     := bs_Name_Column[PLanguageIndex];
  GridTable_Kat_date_Beg.caption := bs_grid_Date_Beg[PLanguageIndex];
  GridTable_Kat_Date_end.caption := bs_grid_Date_End[PLanguageIndex];
  GridTable_Kat_Summa.caption    := bs_Summa_Column[PLanguageIndex];

  //Субсидии
  cxTabSheet4.Caption                := bs_Subsidy_Caption[PLanguageIndex];
  GridTable_Subsidy_Date_Beg.Caption := bs_grid_Date_Beg[PLanguageIndex];
  GridTable_Subsidy_date_end.Caption := bs_grid_Date_End[PLanguageIndex];
  GridTable_Subsidy_Summa.Caption    := bs_Summa_Column[PLanguageIndex];

  //Льготы
  cxTabSheet5.Caption              := bs_Lgota_Caption[PLanguageIndex];
  GridTable_Lgots_Name.Caption     := bs_Name_Column[PLanguageIndex];
  GridTable_Lgots_date_Beg.caption := bs_grid_Date_Beg[PLanguageIndex];
  GridTable_Lgots_Date_end.caption := bs_grid_Date_End[PLanguageIndex];
  GridTable_Lgots_Procent.caption  := bs_Persent_Column[PLanguageIndex];

  //Вх.Остаток
  cxTabSheet6.Caption                 := bs_EntryRest_Caption[PLanguageIndex];
  GridTable_EntryRest_Summa.Caption   := uConsts.bs_Summa_Column[PLanguageIndex];
  GridTable_EntryRest_Sources.Caption := uConsts.bs_Smeta[PLanguageIndex]+ '/' +
                                         uConsts.bs_Razdel[PLanguageIndex]+ '/' +
                                         uConsts.bs_Statya[PLanguageIndex]+ '/' +
                                         uConsts.bs_KEKV[PLanguageIndex];

  MFO_Label.Caption      := uConsts.bs_MFO_Caption[PLanguageIndex];
  RasSchet_Label.Caption := uConsts.bs_RasSchet_Caption[PLanguageIndex];
  Osoba_Label.Caption    := uConsts.bs_OsosbaCustomer[PLanguageIndex];
  label_payer.Caption    := uConsts.bs_Payer_Column[PLanguageIndex];

end;

procedure TfrmReestr_AE.FormShow(Sender: TObject);
var
  i : Integer;
begin
  cxPageControl1.ActivePageIndex := ActivePageIndex;

  if ID_DOG <> -1 then
   begin
    DM.DataSet.Close;
    DM.DataSet.SQLs.SelectSQL.Text := 'select * from bs_DT_DOG_LIVING_SEL(:ID_DOG)';
    DM.DataSet.ParamByName('ID_DOG').AsInt64 := ID_DOG;
    DM.DataSet.Open;
    DM.DataSet.FetchAll;
    DM.DataSet.First;

    MemoryData_Living.Open;
    For i := 0 to DM.DataSet.RecordCount-1 do
     Begin
      MemoryData_Living.Insert;
      MemoryData_Living.FieldByName('MemoryData_Living_id_man').AsInteger     := DM.DataSet['ID_Man'];
      MemoryData_Living.FieldByName('MemoryData_Living_DateBirth').AsDateTime := DM.DataSet['date_birth'];
      MemoryData_Living.FieldByName('MemoryData_Living_FIO').AsString         := DM.DataSet['ukr_Fio_upper'];
      MemoryData_Living.Post;
      DM.DataSet.Next;
     end;

    //--------------------------------------------------------------------------
    DM.DataSet.Close;
    DM.DataSet.SQLs.SelectSQL.Text := 'select * from bs_DT_DOG_KAT_SUM_SEL(:ID_DOG)';
    DM.DataSet.ParamByName('ID_DOG').AsInt64 := ID_DOG;
    DM.DataSet.Open;
    DM.DataSet.FetchAll;
    DM.DataSet.First;

    MemoryData_Kat.Open;
    For i := 0 to DM.DataSet.RecordCount-1 do
     Begin
      MemoryData_kat.Insert;
      MemoryData_kat.FieldByName('MemoryData_kat_id_kat_sum').AsInteger := DM.DataSet['ID_KAT_SUM'];
      MemoryData_kat.FieldByName('MemoryData_kat_id_kat').AsInteger     := DM.DataSet['ID_KAT'];
      MemoryData_kat.FieldByName('MemoryData_kat_Name').AsString        := DM.DataSet['NAME_KAT'];
      MemoryData_kat.FieldByName('MemoryData_kat_date_beg').AsDateTime  := DM.DataSet['DATE_BEG'];
      MemoryData_kat.FieldByName('MemoryData_kat_date_end').AsDateTime  := DM.DataSet['DATE_END'];
      MemoryData_kat.FieldByName('MemoryData_kat_summa').AsFloat        := DM.DataSet['SUMMA'];
      if DM.DataSet['Beg_p'] <> null
       then MemoryData_kat.FieldByName('MemoryData_katbeg').AsInteger         := DM.DataSet['Beg_p'];
      if DM.DataSet['End_p'] <> null
       then MemoryData_kat.FieldByName('MemoryData_katend').AsInteger         := DM.DataSet['End_p'];
      MemoryData_kat.Post;
      DM.DataSet.Next;
     end;

     //--------------------------------------------------------------------------
    DM.DataSet.Close;
    DM.DataSet.SQLs.SelectSQL.Text := 'select * from bs_DT_DOG_SUBSIDY_SEL(:ID_DOG)';
    DM.DataSet.ParamByName('ID_DOG').AsInt64 := ID_DOG;
    DM.DataSet.Open;
    DM.DataSet.FetchAll;
    DM.DataSet.First;

    MemoryData_Subsidy.Open;
    For i := 0 to DM.DataSet.RecordCount-1 do
     Begin
      MemoryData_Subsidy.Insert;
      MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_Id_subsidy').AsInteger := DM.DataSet['ID_SUBSIDY'];
      MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_NAME').AsString        := DM.DataSet['NAME_SUBSIDY'];
      MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_DATE_BEG').AsDateTime  := DM.DataSet['DATE_BEG'];
      MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_DATE_END').AsDateTime  := DM.DataSet['DATE_END'];
      MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_SUMMA').AsFloat        := DM.DataSet['SUMMA'];
      MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_COMMENTS').AsString    := DM.DataSet['COMMENTS'];
      MemoryData_Subsidy.Post;
      DM.DataSet.Next;
     end;

    //--------------------------------------------------------------------------
    DM.DataSet.Close;
    DM.DataSet.SQLs.SelectSQL.Text := 'select * from bs_DT_DOG_LGOT_SUM_SEL(:ID_DOG)';
    DM.DataSet.ParamByName('ID_DOG').AsInt64 := ID_DOG;
    DM.DataSet.Open;
    DM.DataSet.FetchAll;
    DM.DataSet.First;

    MemoryData_lgots.Open;
    For i := 0 to DM.DataSet.RecordCount-1 do
     Begin
      MemoryData_lgots.Insert;
      MemoryData_lgots.FieldByName('MemoryData_lgots_id_lgot_sum').AsInteger := DM.DataSet['ID_lgot_SUM'];
      MemoryData_lgots.FieldByName('MemoryData_lgots_id_lgot').AsInteger     := DM.DataSet['ID_lgot'];
      MemoryData_lgots.FieldByName('MemoryData_lgots_Name').AsString         := DM.DataSet['NAME_lgot'];
      MemoryData_lgots.FieldByName('MemoryData_lgots_date_beg').AsDateTime   := DM.DataSet['DATE_BEG'];
      MemoryData_lgots.FieldByName('MemoryData_lgots_date_end').AsDateTime   := DM.DataSet['DATE_END'];
      MemoryData_lgots.FieldByName('MemoryData_lgots_procent').AsFloat       := DM.DataSet['Procent'];
      MemoryData_lgots.Post;
      DM.DataSet.Next;
     end;

    //--------------------------------------------------------------------------
    DM.DataSet.Close;
    DM.DataSet.SQLs.SelectSQL.Text := 'select * from bs_DT_DOG_ENTRYREST_SEL(:ID_DOG)';
    DM.DataSet.ParamByName('ID_DOG').AsInt64 := ID_DOG;
    DM.DataSet.Open;
    DM.DataSet.FetchAll;
    DM.DataSet.First;

    MemoryData_EntryRest.Open;
    For i := 0 to DM.DataSet.RecordCount-1 do
     Begin
      MemoryData_EntryRest.Insert;
      MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_id_smeta').AsInteger  := DM.DataSet['id_smeta'];
      MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_id_Razdel').AsInteger := DM.DataSet['id_Razdel'];
      MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_id_Stat').AsInteger   := DM.DataSet['id_Stat'];
      MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_Id_Kekv').AsInteger   := DM.DataSet['Id_Kekv'];
      MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_smeta').AsInteger     := DM.DataSet['smet'];
      MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_Razdel').AsInteger    := DM.DataSet['Razdel'];
      MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_Stat').AsInteger      := DM.DataSet['Stat'];
      MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_Kekv').AsInteger      := DM.DataSet['Kekv'];
      MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_Sources').AsString    := IntToStr(DM.DataSet['smet']) + '.' + IntToStr(DM.DataSet['Razdel']) + '.' + IntToStr(DM.DataSet['Stat']) + '.' + IntToStr(DM.DataSet['Kekv']);
      MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_Summa').AsFloat       := DM.DataSet['Summa'];
      MemoryData_EntryRest.Post;
      DM.DataSet.Next;
     end;

   end;
end;

procedure TfrmReestr_AE.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmReestr_AE.OkButtonClick(Sender: TObject);
begin
  if Edit_num_Dog.Text = '' then
   Begin
    ShowMessage('Необхідно вести номер договіру!');
    Exit;
   end;

  if is_edit = 0 then
   Begin
    DM.DataSet.Close;
    DM.DataSet.SQLs.SelectSQL.Text := 'Select * from bs_DT_DOG Where NUM_DOG = :NUM_DOG';
    DM.DataSet.ParamByName('NUM_DOG').AsString := Edit_num_Dog.EditValue;
    DM.DataSet.Open;
    if DM.DataSet.RecordCount <> 0 then
     Begin
      ShowMessage('Договір с таким номером вже існує!');
      Exit;
     end;
    DM.DataSet.Close;
   End; 

  If DateEdit_Date_beg.EditValue>DateEdit_Date_End.EditValue then
   Begin
    ShowMessage('Некоректне ведення дат початку і закінчення договіру!');
    Exit;
   end;

  If Payer_Edit.EditText = '' then
   begin
    ShowMessage('Необхідно обрати платника!');
    Exit;
   end;

  if MemoryData_Living.RecordCount = 0 then
   Begin
    ShowMessage('Необхідно додати проживаючих!');
    Exit;
   end;
   
  if MemoryData_Kat.RecordCount = 0 then
   begin
    ShowMessage('Необхідно додати послугу!');
    Exit;
   End;

  ModalResult:=mrOk;
end;

procedure TfrmReestr_AE.Button_Kat_AddClick(Sender: TObject);
var
  ViewForm : TfrmReestr_Kat_AE;
begin
  If DateEdit_Date_beg.EditValue>DateEdit_Date_End.EditValue then
   Begin
    ShowMessage('Некоректне ведення дат початку і закінчення договіру!');
    Exit;
   end;
  ViewForm                := TfrmReestr_Kat_AE.Create(Self);
  ViewForm.is_admin       := is_admin;
  ViewForm.aHandle        := DM.DB.Handle;
  ViewForm.PLanguageIndex := PLanguageIndex;
  ViewForm.Caption        := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  ViewForm.Date_beg       := DateEdit_date_beg.EditValue;
  ViewForm.Date_end       := DateEdit_date_end.EditValue;
  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOk then
   Begin
    MemoryData_Kat.Insert;
    MemoryData_Kat.FieldByName('MemoryData_Kat_id_kat_sum').AsInteger := ViewForm.ID_KAT_SUM;
    MemoryData_Kat.FieldByName('MemoryData_Kat_Date_beg').AsDateTime := ViewForm.DateEdit_date_beg.EditValue;
    MemoryData_Kat.FieldByName('MemoryData_Kat_Date_end').AsDateTime := ViewForm.DateEdit_date_end.EditValue;
    MemoryData_Kat.FieldByName('MemoryData_Kat_Summa').AsFloat := ViewForm.CurrencyEdit_summa.EditValue;
    MemoryData_Kat.FieldByName('MemoryData_Kat_Name').AsString := ViewForm.ButtonEdit_name_Kat.EditValue;
    MemoryData_Kat.FieldByName('MemoryData_Kat_ID_kat').Asinteger := ViewForm.ID_KAT;
    MemoryData_Kat.FieldByName('MemoryData_KatBeg').Asinteger := ViewForm.cxCurrencyEdit1.EditValue;
    MemoryData_Kat.FieldByName('MemoryData_KatEnd').Asinteger := ViewForm.cxCurrencyEdit2.EditValue;
    MemoryData_Kat.Post;
   end;
  ViewForm.Free; 
end;

procedure TfrmReestr_AE.FormCreate(Sender: TObject);
begin
  FormIniLanguage();
  MemoryData_Living.Open;
  MemoryData_Kat.Open;
  MemoryData_Subsidy.Open;
  MemoryData_Lgots.Open;
  MemoryData_EntryRest.Open;

  MFO_Edit.Enabled:=false;
  RasSchet_Edit.Enabled:=false;
  LookupComboBox.Enabled:=false;
end;

procedure TfrmReestr_AE.Button_Kat_EditClick(Sender: TObject);
var
  ViewForm : TfrmReestr_Kat_AE;
begin
  ViewForm                := TfrmReestr_Kat_AE.Create(Self);
  ViewForm.is_admin       := is_admin;
  ViewForm.aHandle        := DM.DB.Handle;
  ViewForm.PLanguageIndex := PLanguageIndex;
  ViewForm.Caption        := uConsts.bs_EditBtn_Caption[PLanguageIndex];

  ViewForm.ID_KAT                        := MemoryData_Kat.FieldByName('MemoryData_Kat_id_kat').AsInteger;
  ViewForm.ID_KAT_SUM                    := MemoryData_Kat.FieldByName('MemoryData_Kat_id_kat_sum').AsInteger;
  ViewForm.ButtonEdit_name_Kat.EditValue := MemoryData_Kat.FieldByName('MemoryData_Kat_Name').AsString;
  ViewForm.DateEdit_date_beg.EditValue   := MemoryData_Kat.FieldByName('MemoryData_Kat_Date_Beg').AsDateTime;
  ViewForm.DateEdit_date_end.EditValue   := MemoryData_Kat.FieldByName('MemoryData_Kat_Date_end').AsDateTime;
  ViewForm.CurrencyEdit_summa.EditValue  := MemoryData_Kat.FieldByName('MemoryData_Kat_Summa').AsFloat;
  if MemoryData_Kat.FieldByName('MemoryData_KatBeg').AsInteger <> null
   then ViewForm.cxCurrencyEdit1.EditValue := MemoryData_Kat.FieldByName('MemoryData_KatBeg').AsInteger;
  if MemoryData_Kat.FieldByName('MemoryData_KatEnd').Asinteger <> null
   then ViewForm.cxCurrencyEdit2.EditValue := MemoryData_Kat.FieldByName('MemoryData_KatEnd').Asinteger;
  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOk then
   Begin
    MemoryData_Kat.Delete;
    MemoryData_Kat.Insert;
    MemoryData_Kat.FieldByName('MemoryData_Kat_id_kat_sum').AsInteger := ViewForm.ID_KAT_SUM;
    MemoryData_Kat.FieldByName('MemoryData_Kat_Date_beg').AsDateTime := ViewForm.DateEdit_date_beg.EditValue;
    MemoryData_Kat.FieldByName('MemoryData_Kat_Date_end').AsDateTime := ViewForm.DateEdit_date_end.EditValue;
    MemoryData_Kat.FieldByName('MemoryData_Kat_Summa').AsFloat := ViewForm.CurrencyEdit_summa.EditValue;
    MemoryData_Kat.FieldByName('MemoryData_Kat_Name').AsString := ViewForm.ButtonEdit_name_Kat.EditValue;
    MemoryData_Kat.FieldByName('MemoryData_Kat_ID_kat').Asinteger := ViewForm.ID_KAT;
    MemoryData_Kat.FieldByName('MemoryData_KatBeg').Asinteger := ViewForm.cxCurrencyEdit1.EditValue;
    MemoryData_Kat.FieldByName('MemoryData_KatEnd').Asinteger := ViewForm.cxCurrencyEdit2.EditValue;
    MemoryData_Kat.Post;
   end;
  ViewForm.Free;
end;

procedure TfrmReestr_AE.Button_Kat_DelClick(Sender: TObject);
var
  i : Byte;
begin
  if GridTable_Kat.DataController.RecordCount = 0 then exit;

  i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts.bs_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  MemoryData_Kat.Delete;
end;

procedure TfrmReestr_AE.Button_Living_AddClick(Sender: TObject);
var
  Massiv : Variant;
  ID_MAN_living : Int64;
  exists : Boolean;
  i : Integer;
begin
  Massiv:=AllPeopleUnit.GetManForASUP(Self, DM.DB.Handle, False, True, -1);

  exists := False;
  if VarArrayDimCount(Massiv)>0 then
   begin
    ID_MAN_living := Massiv[0];

    MemoryData_Living.Open;
    MemoryData_Living.First;
    for i:=0 to memorydata_living.RecordCount-1 do
     Begin
      if MemoryData_Living['MemoryData_Living_ID_MAN'] = ID_MAN_living then exists := True;
      MemoryData_Living.Next;
     end;

    if exists then
     begin
      ShowMessage(uConsts_Messages.existsMan[PLanguageIndex]);
      Exit;
     end;

    MemoryData_Living.Insert;
    MemoryData_Living.FieldByName('MemoryData_Living_id_man').AsInteger     := ID_MAN_living;
    MemoryData_Living.FieldByName('MemoryData_Living_FIO').AsString         := Massiv[1];
    MemoryData_Living.FieldByName('MemoryData_Living_DateBirth').AsDateTime := Massiv[8];
    MemoryData_Living.Post;
   end;
end;

procedure TfrmReestr_AE.Button_Living_EditClick(Sender: TObject);
var
  Massiv : Variant;
  ID_MAN_living : Int64;
  i : Integer;
  exists : Boolean;
begin
  if GridTable_Living.DataController.RecordCount = 0 then exit;

  ID_MAN_living := MemoryData_Living['MemoryData_Living_ID_MAN'];
  Massiv:=AllPeopleUnit.GetManForASUP(Self, DM.DB.Handle, False, True, ID_MAN_living);

  exists := False;
  if VarArrayDimCount(Massiv)>0 then
   begin
    ID_MAN_living := Massiv[0];

    MemoryData_Living.Open;
    MemoryData_Living.First;
    for i:=0 to memorydata_living.RecordCount-1 do
     Begin
      if MemoryData_Living['MemoryData_Living_ID_MAN'] = ID_MAN_living then exists := True;
      MemoryData_Living.Next;
     end;

    if exists then
     begin
      ShowMessage(uConsts_Messages.existsMan[PLanguageIndex]);
      Exit;
     end;

    MemoryData_Living.delete;

    MemoryData_Living.Open;
    MemoryData_Living.Insert;
    MemoryData_Living.FieldByName('MemoryData_Living_id_man').AsInteger     := ID_MAN_living;
    MemoryData_Living.FieldByName('MemoryData_Living_FIO').AsString         := Massiv[1];
    MemoryData_Living.FieldByName('MemoryData_Living_DateBirth').AsDateTime := Massiv[8];
    MemoryData_Living.Post;
   end;
end;

procedure TfrmReestr_AE.Button_Living_DelClick(Sender: TObject);
var
  i : Byte;
begin
  if GridTable_Living.DataController.RecordCount = 0 then exit;

  i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts.bs_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;
  
  MemoryData_Living.Delete;  
end;

procedure TfrmReestr_AE.Button_Subsidy_AddClick(Sender: TObject);
var
   ViewForm : TfrmReestr_Subsidy_AE;
begin
   If DateEdit_Date_beg.EditValue>DateEdit_Date_End.EditValue then
   Begin
    ShowMessage('Некоректне ведення дат початку і закінчення договіру!');
    Exit;
   end;
   ViewForm                := TfrmReestr_Subsidy_AE.Create(Self);
   ViewForm.Caption        := bs_InsertBtn_Caption[PLanguageIndex];
   ViewForm.PLanguageIndex := PLanguageIndex;
   ViewForm.is_admin       := is_admin;
   ViewForm.aHandle        := DM.DB.Handle;
   ViewForm.Date_beg       := DateEdit_date_beg.EditValue;
   ViewForm.Date_end       := DateEdit_date_end.EditValue;

   if ViewForm.ShowModal = mrOk then
    begin
     MemoryData_Subsidy.Open;
     MemoryData_Subsidy.Insert;
     MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_Id_subsidy').AsInteger := ViewForm.id_subsidy;
     MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_NAME').AsString        := ViewForm.ButtonEdit_name_subsidy.Text;
     MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_DATE_BEG').AsDateTime  := ViewForm.DateEdit_date_beg.EditValue;
     MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_DATE_END').AsDateTime  := ViewForm.DateEdit_date_end.EditValue;
     MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_SUMMA').AsFloat        := ViewForm.CurrencyEdit_summa.EditValue;
     MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_COMMENTS').AsString    := ViewForm.Memo_comments.Text;
     MemoryData_Subsidy.Post;
    end;
   ViewForm.Free; 
end;

procedure TfrmReestr_AE.Button_Subsidy_EditClick(Sender: TObject);
var
  ViewForm : TfrmReestr_Subsidy_AE;
begin
  IF GridTable_Subsidy.DataController.RecordCount = 0 then exit;

  ViewForm                := TfrmReestr_Subsidy_AE.Create(Self);
  ViewForm.Caption        := bs_EditBtn_Caption[PLanguageIndex];
  ViewForm.PLanguageIndex := PLanguageIndex;
  ViewForm.is_admin       := is_admin;
  ViewForm.aHandle        := DM.DB.Handle;

  ViewForm.id_subsidy                   := MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_Id_subsidy').AsInteger;
  ViewForm.ButtonEdit_name_subsidy.Text := MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_NAME').AsString;
  ViewForm.DateEdit_date_beg.EditValue  := MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_DATE_BEG').AsDateTime;
  ViewForm.DateEdit_date_end.EditValue  := MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_DATE_END').AsDateTime;
  ViewForm.CurrencyEdit_summa.EditValue := MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_SUMMA').AsFloat;
  ViewForm.Memo_comments.Text           := MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_COMMENTS').AsString;

  if ViewForm.ShowModal = mrOk then
   begin
    MemoryData_Subsidy.Delete;

    MemoryData_Subsidy.Open;
    MemoryData_Subsidy.Insert;
    MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_Id_subsidy').AsInteger := ViewForm.id_subsidy;
    MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_NAME').AsString        := ViewForm.ButtonEdit_name_subsidy.Text;
    MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_DATE_BEG').AsDateTime  := ViewForm.DateEdit_date_beg.EditValue;
    MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_DATE_END').AsDateTime  := ViewForm.DateEdit_date_end.EditValue;
    MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_SUMMA').AsFloat        := ViewForm.CurrencyEdit_summa.EditValue;
    MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_COMMENTS').AsString    := ViewForm.Memo_comments.Text;
    MemoryData_Subsidy.Post;
   end;
  ViewForm.Free;
end;

procedure TfrmReestr_AE.Button_Subsidy_DelClick(Sender: TObject);
var
  i : Byte;
begin
  if GridTable_Subsidy.DataController.RecordCount = 0 then exit;

  i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts.bs_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  MemoryData_Subsidy.Delete;
end;

procedure TfrmReestr_AE.Button_Lgots_AddClick(Sender: TObject);
var
  ViewForm : TfrmReestr_Lgots_AE;
begin
  If DateEdit_Date_beg.EditValue>DateEdit_Date_End.EditValue then
   Begin
    ShowMessage('Некоректне ведення дат початку і закінчення договіру!');
    Exit;
   end;
  ViewForm                := TfrmReestr_Lgots_AE.Create(Self);
  ViewForm.is_admin       := is_admin;
  ViewForm.aHandle        := DM.DB.Handle;
  ViewForm.PLanguageIndex := PLanguageIndex;
  ViewForm.Caption        := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  ViewForm.Date_beg       := DateEdit_date_beg.EditValue;
  ViewForm.Date_end       := DateEdit_date_end.EditValue;

  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOk then
   Begin
    MemoryData_lgots.Insert;
    MemoryData_lgots.FieldByName('MemoryData_lgots_id_lgot_sum').AsInteger := ViewForm.ID_LGOT_SUM;
    MemoryData_lgots.FieldByName('MemoryData_lgots_Date_beg').AsDateTime   := ViewForm.DateEdit_date_beg.EditValue;
    MemoryData_lgots.FieldByName('MemoryData_lgots_Date_end').AsDateTime   := ViewForm.DateEdit_date_end.EditValue;
    MemoryData_lgots.FieldByName('MemoryData_lgots_Procent').AsFloat       := ViewForm.CurrencyEdit_procent.EditValue;
    MemoryData_lgots.FieldByName('MemoryData_lgots_Name').AsString         := ViewForm.ButtonEdit_name_Lgots.EditValue;
    MemoryData_lgots.FieldByName('MemoryData_lgots_ID_lgot').Asinteger     := ViewForm.ID_LGOT;
    MemoryData_lgots.Post;
   end;
  ViewForm.Free;
end;

procedure TfrmReestr_AE.Button_Lgots_EditClick(Sender: TObject);
var
  ViewForm : TfrmReestr_Lgots_AE;
begin
  ViewForm                := TfrmReestr_Lgots_AE.Create(Self);
  ViewForm.is_admin       := is_admin;
  ViewForm.aHandle        := DM.DB.Handle;
  ViewForm.PLanguageIndex := PLanguageIndex;
  ViewForm.Caption        := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  
  ViewForm.ID_LGOT                         := MemoryData_lgots.FieldByName('MemoryData_lgots_id_lgot').AsInteger;
  ViewForm.ID_LGOT_SUM                     := MemoryData_lgots.FieldByName('MemoryData_lgots_id_lgot_sum').AsInteger;
  ViewForm.DateEdit_date_beg.EditValue     := MemoryData_lgots.FieldByName('MemoryData_lgots_date_Beg').AsDateTime;
  ViewForm.DateEdit_date_end.EditValue     := MemoryData_lgots.FieldByName('MemoryData_lgots_Date_End').AsDateTime;
  ViewForm.CurrencyEdit_procent.EditValue  := MemoryData_lgots.FieldByName('MemoryData_lgots_Procent').AsFloat;
  ViewForm.ButtonEdit_name_Lgots.EditValue := MemoryData_lgots.FieldByName('MemoryData_lgots_Name').AsString;
  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOk then
   Begin
    MemoryData_lgots.Delete;
    MemoryData_lgots.Insert;
    MemoryData_lgots.FieldByName('MemoryData_lgots_id_lgot_sum').AsInteger := ViewForm.ID_LGOT_SUM;
    MemoryData_lgots.FieldByName('MemoryData_lgots_Date_beg').AsDateTime   := ViewForm.DateEdit_date_beg.EditValue;
    MemoryData_lgots.FieldByName('MemoryData_lgots_Date_end').AsDateTime   := ViewForm.DateEdit_date_end.EditValue;
    MemoryData_lgots.FieldByName('MemoryData_lgots_Procent').AsFloat       := ViewForm.CurrencyEdit_procent.EditValue;
    MemoryData_lgots.FieldByName('MemoryData_lgots_Name').AsString         := ViewForm.ButtonEdit_name_Lgots.EditValue;
    MemoryData_lgots.FieldByName('MemoryData_lgots_ID_lgot').Asinteger     := ViewForm.ID_LGOT;
    MemoryData_lgots.Post;
   end;
  ViewForm.Free;
end;


procedure TfrmReestr_AE.Button_Lgots_DelClick(Sender: TObject);
var
  i : Byte;
begin
  if GridTable_Lgots.DataController.RecordCount = 0 then exit;

  i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts.bs_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  MemoryData_Lgots.Delete;
end;

procedure TfrmReestr_AE.Button_EntryRest_AddClick(Sender: TObject);
var
  ViewForm : TfrmReestr_EntryRest_AE;
begin
  ViewForm := TfrmReestr_EntryRest_AE.Create(Self, DM.DB.Handle);
  ViewForm.ShowModal;

  If ViewForm.ModalResult = mrOK then
   Begin
    MemoryData_EntryRest.Insert;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_id_smeta').AsInteger  := ViewForm.id_smeta;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_id_razdel').AsInteger := ViewForm.id_razdel;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_id_stat').AsInteger   := ViewForm.id_stat;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_id_kekv').AsInteger   := ViewForm.id_kekv;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_smeta').AsInteger     := ViewForm.Smeta_Edit.EditValue;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_razdel').AsInteger    := ViewForm.razdel_Edit.EditValue;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_stat').AsInteger      := ViewForm.stat_Edit.EditValue;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_kekv').AsInteger      := ViewForm.kekv_Edit.EditValue;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_Sources').AsString    := ViewForm.Smeta_Edit.Text+'.'+ViewForm.Razdel_Edit.Text+'.'+ViewForm.Stat_Edit.Text+'.'+ViewForm.Kekv_Edit.Text;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_summa').AsFloat       := ViewForm.SummaEdit.EditValue;
   End;
  ViewForm.Free;
end;

procedure TfrmReestr_AE.Button_EntryRest_DelClick(Sender: TObject);
var
  i : Byte;
begin
  if GridTable_Lgots.DataController.RecordCount = 0 then exit;

  i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts.bs_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  MemoryData_EntryRest.Delete;
end;

procedure TfrmReestr_AE.Button_EntryRest_EditClick(Sender: TObject);
var
  ViewForm : TfrmReestr_EntryRest_AE;
begin
  ViewForm := TfrmReestr_EntryRest_AE.Create(Self, DM.DB.Handle);
  
  ViewForm.Smeta_Edit.EditValue  := MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_smeta').AsInteger;
  ViewForm.razdel_Edit.EditValue := MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_razdel').AsInteger;
  ViewForm.stat_Edit.EditValue   := MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_stat').AsInteger;
  ViewForm.kekv_Edit.EditValue   := MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_kekv').AsInteger;
  ViewForm.SummaEdit.EditValue   := MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_summa').AsFloat;

  ViewForm.ShowModal;

  If ViewForm.ModalResult = mrOK then
   Begin
    MemoryData_EntryRest.Delete;
    MemoryData_EntryRest.Insert;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_id_smeta').AsInteger  := ViewForm.id_smeta;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_id_razdel').AsInteger := ViewForm.id_razdel;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_id_stat').AsInteger   := ViewForm.id_stat;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_id_kekv').AsInteger   := ViewForm.id_kekv;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_smeta').AsInteger     := ViewForm.Smeta_Edit.EditValue;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_razdel').AsInteger    := ViewForm.razdel_Edit.EditValue;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_stat').AsInteger      := ViewForm.stat_Edit.EditValue;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_kekv').AsInteger      := ViewForm.kekv_Edit.EditValue;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_Sources').AsString    := ViewForm.Smeta_Edit.Text+'.'+ViewForm.Razdel_Edit.Text+'.'+ViewForm.Stat_Edit.Text+'.'+ViewForm.Kekv_Edit.Text;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_summa').AsFloat       := ViewForm.SummaEdit.EditValue;
   End;
  ViewForm.Free;
end;

procedure TfrmReestr_AE.SummaEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then Button_Auto_EntryRestClick(Self);
end;

procedure TfrmReestr_AE.Button_Auto_EntryRestClick(Sender: TObject);
var
  ViewForm : TfrmReestr_EntryRest_AE;
begin
  DM.DataSet.Close;
  DM.DataSet.SQLs.SelectSQL.Text := 'select * from bs_PUB_SYS_DATA_GET_ALL';
  DM.DataSet.Open;

  ViewForm := TfrmReestr_EntryRest_AE.Create(Self, DM.DB.Handle);

  If DM.DataSet['bs_def_smeta'] <> null  then ViewForm.Smeta_Edit.Text  := DM.DataSet['bs_def_smeta'];
  If DM.DataSet['bs_def_razdel'] <> null then ViewForm.Razdel_Edit.Text := DM.DataSet['bs_def_razdel'];
  If DM.DataSet['bs_def_stat'] <> null   then ViewForm.Stat_Edit.Text   := DM.DataSet['bs_def_stat'];
  If DM.DataSet['bs_def_kekv'] <> null   then ViewForm.Kekv_Edit.Text   := DM.DataSet['bs_def_kekv'];
  ViewForm.SummaEdit.EditValue := SummaEdit.EditValue;

  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOk then
   Begin
    MemoryData_EntryRest.Insert;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_id_smeta').AsInteger  := ViewForm.id_smeta;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_id_razdel').AsInteger := ViewForm.id_razdel;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_id_stat').AsInteger   := ViewForm.id_stat;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_id_kekv').AsInteger   := ViewForm.id_kekv;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_Sources').AsString    := ViewForm.Smeta_Edit.Text+'.'+ViewForm.Razdel_Edit.Text+'.'+ViewForm.Stat_Edit.Text+'.'+ViewForm.Kekv_Edit.Text;
    MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_summa').AsFloat       := ViewForm.SummaEdit.EditValue;
   end;

  ViewForm.Free;
  DM.DataSet.Close;

  SummaEdit.EditValue := 0;
  
  Grid_EntryRest.SetFocus;
end;

procedure TfrmReestr_AE.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

procedure TfrmReestr_AE.Familia_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Massiv: Variant;
  Kol_liv : integer;
  i, o : TSpravParams;
  //ID_Rate_Account : int64;
begin
  if RadioButton_fiz.Checked
   then
    begin
     If ID_MAN = -1
      then Massiv:=AllPeopleUnit.GetManForASUP(Self, DM.DB.Handle, False, True, -1)
      else Massiv:=AllPeopleUnit.GetManForASUP(Self, DM.DB.Handle, False, True, ID_MAN);

     if VarArrayDimCount(Massiv)>0 then
      begin
       ID_MAN:= Massiv[0];

       Payer_Edit.Text   := Massiv[1];

       MemoryData_Living.open;
       if not MemoryData_Living.IsEmpty then
        For Kol_liv := 0 to MemoryData_Living.RecordCount-1 do MemoryData_Living.Delete;

       DM.DataSet.Close;
       DM.DataSet.SQLs.SelectSQL.Text := 'Select * from bs_TAKE_PRESCRIBED_BY_ID_MAN(:id_man)';
       DM.DataSet.ParamByName('ID_MAN').AsInt64 := ID_MAN;
       DM.DataSet.Open;
       DM.DataSet.FetchAll;
       DM.DataSet.First;
       for Kol_liv := 0 to DM.DataSet.RecordCount-1 do
        begin
         MemoryData_Living.Insert;
         MemoryData_Living.FieldByName('MemoryData_Living_id_man').AsInteger     := DM.DataSet['ID_MAN_OUT'];
         MemoryData_Living.FieldByName('MemoryData_Living_FIO').AsString         := DM.DataSet['ukr_fio_upper'];
         MemoryData_Living.FieldByName('MemoryData_Living_DateBirth').AsDateTime := DM.DataSet['Date_Birth'];
         MemoryData_Living.Post;

         DM.DataSet.Next;
        end;
        RasSchet_Edit.Text := '';
        MFO_Edit.Text := ''; 
      end;
    end
   else
    begin
      i := TSpravParams.Create;
      o := TSpravParams.Create;
      i['DataBase']     := Integer(DM.DB.Handle);
      i['FormStyle']    := fsNormal;
      i['bMultiSelect'] := false;
      i['id_session']   := -1;
      i['SelectMode']   := SelCustomer;
      LoadSprav('Customer\CustPackage.bpl', Self, i, o);

      if o['ModalResult'] = mrOk then
       begin
        MemoryData_Living.open;
        if not MemoryData_Living.IsEmpty then
         For Kol_liv := 0 to MemoryData_Living.RecordCount-1 do MemoryData_Living.Delete;

        ID_MAN        := -1; // обнуление
        //ID_RATE_ACCOUNT := -1; // обнуление
        ID_MAN        := o['ID_CUSTOMER'];
        //if o['ID_RATE_ACCOUNT'] <> null then ID_RATE_ACCOUNT := o['ID_RATE_ACCOUNT'];

        Payer_Edit.text := o['NAME_CUSTOMER'];

        if o['MFO']=null
         then MFO_Edit.text := ''
         else MFO_Edit.text := o['MFO'];

        if o['RATE_ACCOUNT']=null
         then RasSchet_Edit.text := ''
         else RasSchet_Edit.text := o['RATE_ACCOUNT'];
       end;

     i.Free;
     o.Free;

     // забираю ФИО по кастомеру
     Dm.DataSet.Close;
     Dm.Dataset.SelectSQL.Clear;
     Dm.Dataset.SelectSQL.Text := 'select * from CN_FIO_BY_ID_CUSTOMER_SLT(' + inttostr(ID_MAN) + ')';
     Dm.Dataset.Open;
     if Dm.Dataset.RecordCount > 0 then
     begin
      Dm.Dataset.FetchAll;
      Dm.Dataset.First;
      LookupComboBox.Properties.ListSource :=Dm.DataSource;
      LookupComboBox.Text := Dm.Dataset['FIO'];
     end;
    end;
end;

procedure TfrmReestr_AE.RadioButton_fizClick(Sender: TObject);
begin
  MFO_Edit.Enabled:=false;
  RasSchet_Edit.Enabled:=false;
  LookupComboBox.Enabled := false;

  if Payer_Edit.CanFocusEx then  Payer_Edit.SetFocus;
end;

procedure TfrmReestr_AE.RadioButton_jurClick(Sender: TObject);
begin
  MFO_Edit.Enabled:=true;
  RasSchet_Edit.Enabled:=true;
  LookupComboBox.Enabled := True;

  if Payer_Edit.CanFocusEx then Payer_Edit.SetFocus;
end;

end.
