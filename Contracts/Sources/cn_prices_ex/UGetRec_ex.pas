unit UGetRec_ex;
                                                      
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxCalc, cxDropDownEdit, cxCalendar, ComCtrls, Ibase, DB,
  FIBDataSet, pFIBDataSet, ActnList, CnConsts, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData, cxTL, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxCurrencyEdit, cn_Common_Funcs, RxMemDS,
  Buttons, cnConsts_Messages, cn_Common_Messages, FIBDatabase, cxSpinEdit,
  cxCheckBox, GlobalSpr;

type
  TfrmGetRec = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    FacultyText: TcxButtonEdit;
    SpecialityText: TcxButtonEdit;
    FormStudText: TcxButtonEdit;
    NacText: TcxButtonEdit;
    KatText: TcxButtonEdit;
    FacLabel: TLabel;
    SpecLabel: TLabel;
    FormStudLabel: TLabel;
    NacLabel: TLabel;
    KatLabel: TLabel;
    Label6: TLabel;
    SrokStudLabel: TLabel;
    SrokStudText: TcxCurrencyEdit;
    ActionList1: TActionList;
    Ok_act: TAction;
    Cancel_act: TAction;
    DataSet: TpFIBDataSet;
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
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    testColorStyle: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridKursSumm: TcxGrid;
    cxGridKursSummDBTableView1: TcxGridDBTableView;
    TableYear: TcxGridDBColumn;
    TableSumm: TcxGridDBColumn;
    cxGridKursSummLevel1: TcxGridLevel;
    DataSourceSumm: TDataSource;
    MemoryDataSumm: TRxMemoryData;
    TableMonth: TcxGridDBColumn;
    cxGridKursSummDBTableView1DBColumn1: TcxGridDBColumn;
    MemoryDataSummmrYear: TIntegerField;
    MemoryDataSummmrSumm: TFloatField;
    MemoryDataSummmrMonth: TIntegerField;
    MemoryDataSummmrid_sort: TIntegerField;
    MemoryDataSummmrID_Summ: TLargeintField;
    DataSourceSmet: TDataSource;
    AddButton: TSpeedButton;
    EditButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    MemoryDataSmet: TRxMemoryData;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    smettable: TcxGridDBColumn;
    id_smettable: TcxGridDBColumn;
    Razdeltable: TcxGridDBColumn;
    id_razdeltable: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    add_act: TAction;
    edit_act: TAction;
    del_act: TAction;
    MemoryDataSmetmrSmet: TIntegerField;
    MemoryDataSmetmrid_smet: TIntegerField;
    MemoryDataSmetmrRazdel: TIntegerField;
    MemoryDataSmetmrid_razdel: TIntegerField;
    MemoryDataSmetmrstat: TIntegerField;
    MemoryDataSmetmrid_stat: TIntegerField;
    MemoryDataSmetmrkekv: TIntegerField;
    MemoryDataSmetmrid_kekv: TIntegerField;
    stattable: TcxGridDBColumn;
    id_stattable: TcxGridDBColumn;
    kekvtable: TcxGridDBColumn;
    id_kekvtable: TcxGridDBColumn;
    GoCancel: TAction;
    Label1: TLabel;
    Label2: TLabel;
    Kurs_Edit: TcxSpinEdit;
    Beg_second_part: TcxCheckBox;
    TableDate_beg: TcxGridDBColumn;
    TableDate_end: TcxGridDBColumn;
    MemoryDataSummmrDate_beg: TDateField;
    MemoryDataSummmrDate_End: TDateField;
    ProcentTable: TcxGridDBColumn;
    MemoryDataSmetmrProcent: TIntegerField;
    Valut_edit: TcxButtonEdit;
    Valut_Label: TLabel;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SpecialityTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GragdTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KategoryTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Ok_actExecute(Sender: TObject);
    procedure Cancel_actExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SrokStudTextKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure add_actExecute(Sender: TObject);
    procedure edit_actExecute(Sender: TObject);
    procedure del_actExecute(Sender: TObject);
    procedure GoCancelExecute(Sender: TObject);
    procedure SrokStudText_KeyPress;
    procedure SrokStudTextExit(Sender: TObject);
    procedure Kurs_EditExit(Sender: TObject);
    procedure Beg_second_partPropertiesChange(Sender: TObject);
    procedure TableDate_begPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure TableDate_endPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure Valut_editPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    MAX_KOL_MONTH_STUDY :Integer;
    procedure CheckDate_Beg_Set_Kol_Month(DisplayValue : Variant);
    procedure CheckDate_End_Set_Kol_Month(DisplayValue : Variant);
  public
    id_price_ver   : Int64;
    Id_Fac         : Int64;
    Id_Spec        : Int64;
    Id_FormStud    : Int64;
    id_nac         : Int64;
    id_Kat         : Int64;
    id_facul       : Int64;
    id_valute      : Int64;
    KolYear        : integer;
    PLanguageIndex : Byte;
    aHandle        : TISC_DB_HANDLE;
    is_add         : Boolean;
    Date_beg_price : TDate;
    cn_end_month   : integer;
    constructor Create(AOwner: TComponent; pId_Price_Param:Int64; pHandle:TISC_DB_HANDLE);overload;
  end;

var
  aId_Price_Param:Int64;
implementation

uses UGetParamValue_ex, uAdd_Edit_ex, UParamsReestr_ex, DateUtils;

{$R *.dfm}

procedure TfrmGetRec.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var T:TfrmGetParamValue;
begin
  T:=TfrmGetParamValue.Create(self,
                                  0,
                                  nil,
                                  TfrmPriceReestr(self.Owner).WorkDatabase.Handle);
  if T.ShowModal=mrYes then
   begin
    FacultyText.Text       := T.ResultText;
    Id_Fac                 := T.ResultId;
    SpecialityText.Enabled := true;
    SpecialityText.SetFocus;
   end;
  T.Free;
end;

procedure TfrmGetRec.SpecialityTextPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var T:TfrmGetParamValue;
begin
      T:=TfrmGetParamValue.Create(self,
                                  1,
                                  VarArrayOf([Id_Fac]),
                                  TfrmPriceReestr(self.Owner).WorkDatabase.Handle);
      if T.ShowModal=mrYes
      then begin
                SpecialityText.Text      :=T.ResultText;
                Id_Spec                  :=T.ResultId;
                NacText.SetFocus;
      end;
      T.Free;
end;

procedure TfrmGetRec.cxButtonEdit3PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var T:TfrmGetParamValue;
begin
      T:=TfrmGetParamValue.Create(self,
                                  2,
                                  nil,
                                  TfrmPriceReestr(self.Owner).WorkDatabase.Handle);
      if T.ShowModal=mrYes
      then begin
                FormStudText.Text      :=T.ResultText;
                Id_FormStud            :=T.ResultId;
                KatText.SetFocus;
      end;
      T.Free;
end;

procedure TfrmGetRec.GragdTextPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);

var
  T:TfrmGetParamValue;
begin
      T:=TfrmGetParamValue.Create(self,
                                  3,
                                  nil,
                                  TfrmPriceReestr(self.Owner).WorkDatabase.Handle);
      if T.ShowModal=mrYes
      then begin
                NacText.Text      :=T.ResultText;
                id_Nac            :=T.ResultId;
                FormStudText.SetFocus;
      end;
      T.Free;
end;

procedure TfrmGetRec.KategoryTextPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var T:TfrmGetParamValue;
begin
      T:=TfrmGetParamValue.Create(self,
                                  4,
                                  nil,
                                  TfrmPriceReestr(self.Owner).WorkDatabase.Handle);
      if T.ShowModal=mrYes
      then begin
                KatText.Text      :=T.ResultText;
                id_Kat            :=T.ResultId;
                SrokStudText.SetFocus;
      end;
      T.Free;
end;

constructor TfrmGetRec.Create(AOwner: TComponent; pId_Price_Param:Int64; pHandle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  aHandle:=pHandle;
  aId_Price_Param:=pId_Price_Param;
end;


procedure TfrmGetRec.Ok_actExecute(Sender: TObject);
var
  i : byte;
  j, procent : Integer;
begin
  If is_add then
   Begin
    MemoryDataSumm.First;
    for j:=0 to MemoryDataSumm.RecordCount-1 do
     Begin
      DataSet.Close;
      DataSet.SQLs.SelectSQL.Clear;
      DataSet.SQLs.SelectSQL.add('select * ');
      DataSet.SQLs.SelectSQL.add('  from cn_dt_price_param pp ');
      DataSet.SQLs.SelectSQL.add('  join cn_dt_price_summa ps ');
      DataSet.SQLs.SelectSQL.add('    on pp.id_price_param = ps.id_price_param ');
      DataSet.SQLs.SelectSQL.add(' where pp.id_price_verssion = :id_ver ');
      DataSet.SQLs.SelectSQL.add('   and pp.id_facul = :id_facul ');
      DataSet.SQLs.SelectSQL.add('   and pp.id_spec = :id_spec ');
      DataSet.SQLs.SelectSQL.add('   and pp.id_form_stud = :id_form_stud ');
      DataSet.SQLs.SelectSQL.add('   and pp.id_kat_stud = :id_kat_stud ');
      DataSet.SQLs.SelectSQL.add('   and pp.id_national = :id_national ');
      DataSet.SQLs.SelectSQL.add('   and pp.term_stud = :term_stud ');

      DataSet.SQLs.SelectSQL.add('   and ps.year_stud = :kurs ');
      DataSet.SQLs.SelectSQL.add('   and ps.date_beg = :date_beg ');
      DataSet.SQLs.SelectSQL.add('   and ps.date_end = :date_end ');

      DataSet.ParamByName('id_ver').AsInt64       := id_price_ver;
      DataSet.ParamByName('id_facul').AsInt64     := Id_Fac;
      DataSet.ParamByName('id_spec').AsInt64      := Id_Spec;
      DataSet.ParamByName('id_form_stud').AsInt64 := Id_FormStud;
      DataSet.ParamByName('id_kat_stud').AsInt64  := id_Kat;
      DataSet.ParamByName('id_national').AsInt64  := id_nac;
      DataSet.ParamByName('kurs').AsInteger       := MemoryDataSumm['mrYear'];
      DataSet.ParamByName('date_beg').AsDate      := MemoryDataSumm['mrDate_Beg'];
      DataSet.ParamByName('date_end').AsDate      := MemoryDataSumm['mrDate_End'];
      DataSet.ParamByName('term_stud').Asinteger  := SrokStudText.EditValue;

      Dataset.Open;

      if not DataSet.IsEmpty then
       Begin
        ShowMessage(cn_record_exist[PLanguageIndex]);
        exit;
       End;
      MemoryDataSumm.Next;
     End
   End;

  if (MemoryDataSmet.RecordCount = 0) then
   Begin
    ShowMessage('Необхідно заповнити джерела фінансування!');
    Exit;
   End;

  Procent := 0; MemoryDataSmet.First;
  for i := 0 to MemoryDataSmet.RecordCount - 1 do
   begin
    procent := procent + MemoryDataSmet['mrProcent'];
    MemoryDataSmet.Next;
   End;

  If procent <> 100 then
   begin
    ShowMessage(cn_warning_PercentSum[PLanguageIndex]);
    Exit;
   end;

  if (FacultyText.Text           <> '') and
     (SpecialityText.Text        <> '') and
     (FormStudText.Text          <> '') and
     (NacText.Text               <> '') and
     (KatText.Text               <> '') and
     (MemoryDataSumm.RecordCount <> 0)  and
     (Valut_edit.Text            <> '')
  then ModalResult:=mrYes
  else
   begin
    ShowMessage(cn_Some_Need[PLanguageIndex]);
    exit;
   end;
end;

procedure TfrmGetRec.Cancel_actExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmGetRec.FormCreate(Sender: TObject);
begin
  KolYear               := 0;
  PLanguageIndex        := cn_Common_Funcs.cnLanguageIndex;
  Caption               := cn_add_new_summ_by_param[PLanguageIndex];
  FacLabel.Caption      := cn_footer_Faculty[PLanguageIndex];
  SpecLabel.Caption     := cn_footer_Spec[PLanguageIndex];
  NacLabel.Caption      := cn_Gragdanstvo[PLanguageIndex];
  FormStudLabel.Caption := cn_footer_FormStudy[PLanguageIndex];
  KatLabel.Caption      := cn_footer_CategoryStudy[PLanguageIndex];
  SrokStudLabel.Caption := cn_srok_study[PLanguageIndex];
  AddButton.Caption     := '';
  AddButton.Hint        := cn_InsertBtn_Caption[PLanguageIndex];
  EditButton.Caption    := '';
  EditButton.Hint       := cn_EditBtn_Caption[PLanguageIndex];
  DeleteButton.Caption  := '';
  DeleteButton.Hint     := cn_DeleteBtn_Caption[PLanguageIndex];
  TableYear.Caption     := cn_footer_Kurs[PLanguageIndex];
  TableDate_beg.Caption := cn_grid_Date_Beg[PLanguageIndex];
  TableDate_end.Caption := cn_grid_Date_End[PLanguageIndex];
  TableMonth.Caption    := cn_cntMonth_Column[PLanguageIndex];
  TableSumm.Caption     := cn_Summa_Column[PLanguageIndex];
  smettable.Caption     := cn_Smeta[PLanguageIndex];
  Razdeltable.Caption   := cn_Razdel[PLanguageIndex];
  stattable.Caption     := cn_Statya[PLanguageIndex];
  kekvtable.Caption     := cn_Kekv[PLanguageIndex];
  ProcentTable.Caption  := cn_Persent_Column[PLanguageIndex];
  OkButton.Caption      := cn_Accept[PLanguageIndex];
  OkButton.Hint         := cn_Accept[PLanguageIndex];
  CancelButton.Caption  := cn_cancel[PLanguageIndex];
  CancelButton.Hint     := cn_cancel[PLanguageIndex];
  is_add                := False;

  MemoryDataSumm.Active := True;
  MemoryDataSmet.Active := True;

  DataSet.Close;
  DataSet.SQLs.SelectSQL.Text:='Select * from pub_sys_data';
  DataSet.Open;
  if DataSet['CN_MAX_KOL_MONTH_STUDY']<> null
   then MAX_KOL_MONTH_STUDY := DataSet['CN_MAX_KOL_MONTH_STUDY']
   else MAX_KOL_MONTH_STUDY := 10;

  if DataSet['CN_END_MONTH']<> null
   then cn_end_month := DataSet['CN_END_MONTH']
   else cn_end_month := 0;
end;

Procedure TfrmGetRec.SrokStudText_KeyPress;
Var
  I, month, reg,reg2: integer;
  s_day, s_month, s_year, s_year_end : Word;
  date_beg, date_end : TDate;
Begin
  if SrokStudText.EditValue < 0 then SrokStudText.EditValue := 0;

  Month := Trunc(SrokStudText.EditValue*MAX_KOL_MONTH_STUDY);
  if month = 0 then Month := MAX_KOL_MONTH_STUDY;

  DecodeDate(Date_beg_price, s_year, s_month, s_day);

  MemoryDataSumm.EmptyTable;
  i:=0; reg := 0; reg2 :=0;
  while month>0 do
   Begin
    MemoryDataSumm.Open;
    MemoryDataSumm.Insert;
    MemoryDataSumm.FieldByName('mrid_sort').AsInteger:=i+1;
    MemoryDataSumm.FieldByName('mrYear').AsInteger:=i+1;

    If (Beg_second_part.Checked) and (i=0) then
     begin
      //начало со второй половины учебного года
      if (s_month > 8) //месяц начала действия прейскуранта
       then
        begin
         reg := 1;
         Date_Beg := EnCodeDate(s_year + reg, 2, 1)
        End
       else
        begin
         reg2 := 1;
         Date_Beg := EnCodeDate(s_year, s_month, s_day);
        end;

      MemoryDataSumm.FieldByName('mrDate_beg').AsDateTime := Date_Beg; //дата начала первого года обучения

      If month >= (MAX_KOL_MONTH_STUDY/2) then
       begin
        //кол-во месяцев за весь период обучения больше половины всего срока обучения
        MemoryDataSumm.FieldByName('mrMonth').AsInteger := trunc(MAX_KOL_MONTH_STUDY/2);
        s_month := 2 + trunc(MAX_KOL_MONTH_STUDY/2);
       end
      else
       begin
        //кол-во месяцев меньше
        MemoryDataSumm.FieldByName('mrMonth').AsInteger:=month;
        s_month := 2 + month;
       end;

      s_year_end := 0;
      if s_month > 12 then
       begin
        s_month := s_month - 12;
        s_year_end := 1;
       end;
      Date_end := EnCodeDate(s_year + s_year_end + reg, s_month, s_day);

      if cn_end_month = 1 then Date_End := Date_End - 1;
      MemoryDataSumm.FieldByName('mrDate_end').AsDateTime := Date_End; //дата окончания периода
      month:=month-trunc(MAX_KOL_MONTH_STUDY/2);
     end
    else
     Begin
      //начало с первой половины учебного года
      if i=0
       then Date_Beg := EnCodeDate(s_year+i, s_month, s_day)
       else Date_Beg := EnCodeDate(s_year+i-reg2, 9, 1);
      MemoryDataSumm.FieldByName('mrDate_beg').AsDateTime := Date_Beg;

      If month >= MAX_KOL_MONTH_STUDY then
       begin
        MemoryDataSumm.FieldByName('mrMonth').AsInteger := MAX_KOL_MONTH_STUDY;
        s_month := 9 + MAX_KOL_MONTH_STUDY;
       End
      else
       begin
        MemoryDataSumm.FieldByName('mrMonth').AsInteger := month;
        s_month := 9 + month;
       end;

      s_year_end := 0;
      if s_month > 12 then
       begin
        s_month := s_month - 12;
        s_year_end := 1;
       end;
      Date_end := EnCodeDate(s_year+i+s_year_end-reg2, s_month, s_Day);
      if cn_end_month = 1 then Date_End := Date_End-1;
      MemoryDataSumm.FieldByName('mrDate_end').AsDateTime := Date_End;
      month:=month-MAX_KOL_MONTH_STUDY;
     End;

    CheckDate_Beg_Set_Kol_Month(MemoryDataSumm.FieldByName('mrDate_beg').AsVariant);
    CheckDate_End_Set_Kol_Month(MemoryDataSumm.FieldByName('mrDate_End').AsVariant);

    MemoryDataSumm.FieldByName('mrSumm').AsFloat:=0;
    MemoryDataSumm.Post;
    MemoryDataSumm.Next;
    i:=i+1;
   End;
  MemoryDataSumm.First;
End;

procedure TfrmGetRec.SrokStudTextKeyPress(Sender: TObject; var Key: Char);
begin
  SrokStudText_KeyPress;
  If key=#13 then cxGridKursSumm.SetFocus;
end;

procedure TfrmGetRec.FormShow(Sender: TObject);
var
  i:integer;
begin
  cxGridKursSummDBTableView1DBColumn1.SortOrder := soAscending;
  
  DataSet.Close;
  DataSet.SQLs.SelectSQL.Clear;
  DataSet.SQLs.SelectSQL.Add('select Date_beg');
  DataSet.SQLs.SelectSQL.Add('  from cn_dt_prices p');
  DataSet.SQLs.SelectSQL.Add('  join cn_dt_price_verssion v');
  DataSet.SQLs.SelectSQL.Add('    on p.id_prices = v.id_price');
  DataSet.SQLs.SelectSQL.Add(' where v.id_price_verssion = :id_ver');
  DataSet.ParamByName('id_ver').AsInt64 := id_price_ver;
  DataSet.Open;
  if DataSet['Date_beg']<> null then Date_beg_price:=DataSet['Date_beg'];
  
  if aid_price_param <> -1 then
   Begin
    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text:='Select * from cn_sp_facul where id_facul=:id_facul';
    DataSet.ParamByName('id_facul').AsInt64:=Id_Fac;
    dataSet.Open;
    if DataSet['NAME']<>null then
     Begin
      FacultyText.Text:=DataSet['NAME'];
      SpecialityText.Enabled:=true;
     End;
    //==============================================================
    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text:='Select name from cn_sp_spec where id_spec=:id_spec';
    DataSet.ParamByName('id_spec').AsInt64:=Id_Spec;
    dataSet.Open;
    if DataSet['NAME']<>null then SpecialityText.Text:=AnsiUpperCase(DataSet['NAME']);
    //==============================================================
    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text:='Select name from cn_sp_form_stud where id_form_stud=:id_form_stud';
    DataSet.ParamByName('id_form_stud').AsInt64:=Id_FormStud;
    dataSet.Open;
    if DataSet['NAME']<>null then FormStudText.Text:=AnsiUpperCase(DataSet['NAME']);
    //==============================================================
    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text:='Select name from cn_sp_kat_stud where id_kat_stud=:id_kat_stud';
    DataSet.ParamByName('id_kat_stud').AsInt64:=id_Kat;
    dataSet.Open;
    if DataSet['NAME']<>null then KatText.Text:=AnsiUpperCase(DataSet['NAME']);
    //==============================================================
    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text:='Select name from cn_sp_national where id_national=:id_national';
    DataSet.ParamByName('id_national').AsInt64:=id_nac;
    dataSet.Open;
    if DataSet['NAME']<>null then NacText.Text:=AnsiUpperCase(DataSet['NAME']);
    //==============================================================
    DataSet.Close;
    DataSet.SQLs.SelectSQL.Clear;
    DataSet.SQLs.SelectSQL.add('Select * from cn_dt_price_param where id_facul=:id_facul');
    DataSet.Sqls.SelectSQL.add(' and id_national=:id_national');
    DataSet.Sqls.SelectSQL.add(' and id_kat_stud=:id_kat_stud');
    DataSet.Sqls.SelectSQL.add(' and id_form_stud=:id_form_stud');
    DataSet.Sqls.SelectSQL.add(' and id_spec=:id_spec');
    DataSet.Sqls.SelectSQL.add(' and id_price_verssion=:id_price_ver');
    DataSet.Sqls.SelectSQL.add(' and id_price_param = :id_price_param');
    DataSet.ParamByName('id_facul').AsInt64       := Id_Fac;
    DataSet.ParamByName('id_spec').AsInt64        := Id_Spec;
    DataSet.ParamByName('id_form_stud').AsInt64   := Id_FormStud;
    DataSet.ParamByName('id_kat_stud').AsInt64    := id_Kat;
    DataSet.ParamByName('id_national').AsInt64    := id_nac;
    DataSet.ParamByName('id_price_ver').AsInt64   := id_price_ver;
    DataSet.ParamByName('id_price_param').AsInt64 := aid_price_param;

    dataSet.Open;
    if DataSet['TERM_STUD']<>null then SrokStudText.Text := DataSet['TERM_STUD'];
    If DataSet['beg_second_part'] = null
     then Beg_second_part.Checked:=False
      else if DataSet['beg_second_part'] = 1
            then Beg_second_part.Checked:=True
            else Beg_second_part.Checked:=False;

    If DataSet['KURS']<> null
     then Kurs_Edit.EditValue:= DataSet['KURS']
     else Kurs_Edit.EditValue:= 1;
    //==============================================================
    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text:='Select CODE_VALUTE from pub_sp_valute where id_valute = :id_valute';
    DataSet.ParamByName('id_valute').AsInt64 := id_valute;
    dataSet.Open;
    if DataSet['CODE_VALUTE'] <> null then Valut_edit.Text := AnsiUpperCase(DataSet['CODE_VALUTE']);
    //==============================================================
    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text:='Select * from cn_dt_price_summa where id_price_param=:id_price_param order by YEAR_STUD';
    DataSet.ParamByName('id_price_param').AsInt64:=aid_price_param;
    dataSet.Open;
    DataSet.FetchAll;
    DataSet.First;
    MemoryDataSumm.Active:=false;
    MemoryDataSumm.EmptyTable;

    For i:=0 to DataSet.RecordCount-1 do
     Begin
      MemoryDataSumm.Open;
      MemoryDataSumm.Insert;
      MemoryDataSumm.FieldByName('mrid_sort').AsInteger:=i;
      if DataSet['YEAR_STUD'] <> null then
      MemoryDataSumm.FieldByName('mrYear').AsInteger:=DataSet['YEAR_STUD'];
      if DataSet['DATE_BEG'] <> null
       then MemoryDataSumm.FieldByName('mrDate_beg').AsDateTime:=DataSet['DATE_BEG'];
      if DataSet['DATE_END'] <> null
       then MemoryDataSumm.FieldByName('mrDate_end').AsDateTime:=DataSet['DATE_END'];
      if DataSet['TERM_STUD'] <> null then
      MemoryDataSumm.FieldByName('mrMonth').AsInteger:=DataSet['TERM_STUD'];
      if DataSet['SUMMA'] <> null then
      MemoryDataSumm.FieldByName('mrSumm').AsFloat:=DataSet['SUMMA'];
      MemoryDataSumm.Post;
      MemoryDataSumm.Next;
      DataSet.Next;
     End;
    MemoryDataSumm.First;
    //==============================================================
    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text:='Select * from cn_dt_price_smet_select(:id_price_param)';
    DataSet.ParamByName('id_price_param').AsInt64:=aid_price_param;
    DataSet.Open;
    DataSet.FetchAll;
    DataSet.First;
    MemoryDataSmet.Active:=false;
    MemoryDataSmet.EmptyTable;
    if DataSet.RecordCount<>0 then
     Begin
      For i:=0 to DataSet.RecordCount-1 do
       Begin
        MemoryDataSmet.Open;
        MemoryDataSmet.Insert;
        if DataSet['Smet'] <> null then
         MemoryDataSmet.FieldByName('mrSmet').AsInteger      := DataSet['Smet'];
        if DataSet['id_Smet'] <> null then
         MemoryDataSmet.FieldByName('mrid_Smet').AsInteger   := DataSet['id_Smet'];
        if DataSet['Razdel'] <> null then
         MemoryDataSmet.FieldByName('mrRazdel').AsInteger    := DataSet['Razdel'];
        if DataSet['id_Razdel'] <> null then
         MemoryDataSmet.FieldByName('mrid_Razdel').AsInteger := DataSet['id_Razdel'];
        if DataSet['Stat'] <> null then
         MemoryDataSmet.FieldByName('mrStat').AsInteger      := DataSet['Stat'];
        if DataSet['id_Stat'] <> null then
         MemoryDataSmet.FieldByName('mrid_Stat').AsInteger   := DataSet['id_Stat'];
        if DataSet['Kekv'] <> null then
         MemoryDataSmet.FieldByName('mrKekv').AsInteger      := DataSet['Kekv'];
        if DataSet['id_Kekv'] <> null then
         MemoryDataSmet.FieldByName('mrid_Kekv').AsInteger   := DataSet['id_Kekv'];
        if DataSet['procent'] <> null then
         MemoryDataSmet.FieldByName('mrprocent').AsInteger   := DataSet['procent'];
        MemoryDataSmet.Post;
        MemoryDataSmet.Next;
        DataSet.Next;
       End;
      MemoryDataSmet.First;
     End;
    MemoryDataSmet.open;
   End;
end;

procedure TfrmGetRec.add_actExecute(Sender: TObject);
Var
  T:TfrmAdd_Edit;
  procent, i : integer;
begin
  T:=TfrmAdd_Edit.create(self,aHandle);

  procent := 0; MemoryDataSmet.First;
  For i:=0 to MemoryDataSmet.RecordCount - 1 do
   Begin
    procent := procent + MemoryDataSmet['mrProcent'];
    MemoryDataSmet.Next;
   End;
  If procent > 100 then procent := 100;
  T.Procent_edit.EditValue := 100 - procent;

  T.ShowModal;

  If T.ModalResult= mrok then
   begin
    MemoryDataSmet.Open;
    MemoryDataSmet.Insert;
    MemoryDataSmet.FieldByName('mrSmet').AsInteger      := T.Smeta_Edit.EditValue;
    MemoryDataSmet.FieldByName('mrid_Smet').AsInteger   := T.ID_SMETA;
    MemoryDataSmet.FieldByName('mrRazdel').AsInteger    := T.Razdel_Edit.EditValue;
    MemoryDataSmet.FieldByName('mrid_Razdel').AsInteger := T.ID_RAZDEL;
    MemoryDataSmet.FieldByName('mrStat').AsInteger      := T.Stat_Edit.EditValue;
    MemoryDataSmet.FieldByName('mrid_Stat').Asinteger   := T.ID_STAT;
    MemoryDataSmet.FieldByName('mrKekv').AsInteger      := T.Kekv_Edit.EditValue;
    MemoryDataSmet.FieldByName('mrid_Kekv').Asinteger   := T.ID_KEKV;
    MemoryDataSmet.FieldByName('mrProcent').AsInteger   := T.Procent_edit.EditValue;
    MemoryDataSmet.Post;
    MemoryDataSmet.Next;
    MemoryDataSmet.First;
   End;
  T.Free;
end;

procedure TfrmGetRec.edit_actExecute(Sender: TObject);
Var
  T:TfrmAdd_Edit;
  smeta_kod,razdel_kod,stat_kod,kekv_kod:integer;
begin
  If MemoryDataSmet.RecordCount=0 then exit;

  T:=TfrmAdd_Edit.create(self,aHandle);
  If MemoryDataSmet['mrSmet']   <> null then Smeta_kod  := MemoryDataSmet['mrSmet'];
  If MemoryDataSmet['mrRazdel'] <> null then Razdel_kod := MemoryDataSmet['mrRazdel'];
  If MemoryDataSmet['mrStat']   <> null then Stat_kod   := MemoryDataSmet['mrStat'];
  If MemoryDataSmet['mrKekv']   <> null then Kekv_kod   := MemoryDataSmet['mrKekv'];

  T.Procent_edit.EditValue := MemoryDataSmet['mrProcent'];
  T.Smeta_Edit.Text        := IntToStr(smeta_kod);
  T.Razdel_Edit.Text       := IntToStr(razdel_kod);
  T.Stat_Edit.Text         := IntToStr(stat_kod);
  T.Kekv_Edit.Text         := IntToStr(kekv_kod);

  T.ShowModal;
  If T.ModalResult= mrok then
   begin
    MemoryDataSmet.Open;
    MemoryDataSmet.Edit;
    MemoryDataSmet.FieldByName('mrSmet').AsInteger      := T.Smeta_Edit.EditValue;
    MemoryDataSmet.FieldByName('mrid_Smet').AsInteger   := T.ID_SMETA;
    MemoryDataSmet.FieldByName('mrRazdel').AsInteger    := T.Razdel_Edit.EditValue;
    MemoryDataSmet.FieldByName('mrid_Razdel').AsInteger := T.ID_RAZDEL;
    MemoryDataSmet.FieldByName('mrStat').AsInteger      := T.Stat_Edit.EditValue;
    MemoryDataSmet.FieldByName('mrid_Stat').Asinteger   := T.ID_STAT;
    MemoryDataSmet.FieldByName('mrKekv').AsInteger      := T.Kekv_Edit.EditValue;
    MemoryDataSmet.FieldByName('mrid_Kekv').Asinteger   := T.ID_KEKV;
    MemoryDataSmet.FieldByName('mrProcent').AsInteger   := T.Procent_edit.EditValue;
    MemoryDataSmet.Post;
    MemoryDataSmet.Next;
    MemoryDataSmet.First;
   End;
  T.Free;
end;

procedure TfrmGetRec.del_actExecute(Sender: TObject);
var
  i:byte;
begin
  If MemoryDataSmet.RecordCount=0 then exit;

  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  MemoryDataSmet.Delete;
end;

procedure TfrmGetRec.GoCancelExecute(Sender: TObject);
begin
  CancelButton.SetFocus;
end;

procedure TfrmGetRec.SrokStudTextExit(Sender: TObject);
begin
  SrokStudText_KeyPress;
end;

procedure TfrmGetRec.Kurs_EditExit(Sender: TObject);
begin
  If Kurs_Edit.Text='' then Kurs_Edit.EditValue:=1;
  if (Kurs_Edit.EditValue<1)and(Kurs_Edit.EditValue>6) then Kurs_Edit.EditValue:=1;
end;

procedure TfrmGetRec.Beg_second_partPropertiesChange(Sender: TObject);
begin
  SrokStudText_KeyPress;
end;

procedure TfrmGetRec.CheckDate_Beg_Set_Kol_Month(DisplayValue : Variant);
var
  Date_Beg_Grid, Date_End_Grid : TDate;
  Kol_Month_Beg, Kol_Month_End, Kol_Month, Year_Beg, Year_End: Word;
  Day : Word;
begin
  If ((MemoryDataSumm['mrDate_end'] = null) or (MemoryDataSumm['mrDate_Beg'] = null)) then Exit;

  If VarToDateTime(DisplayValue) < Date_beg_price then
   Begin
     ShowMessage('Дата початку періоду не може бути менше дати початку дії прейскуранта!');
     Exit;
   End;

  Date_End_Grid := MemoryDataSumm.FieldByName('mrDate_end').AsDateTime;
  Date_Beg_Grid := VarToDateTime(DisplayValue);

  Date_End_Grid := Date_End_Grid - 1;
  DecodeDate(Date_Beg_Grid, Year_Beg, Kol_Month_Beg, Day);
  DecodeDate(Date_End_Grid, Year_End, Kol_Month_End, Day);
  Date_End_Grid := Date_End_Grid + 1;

  If ((Year_End-Year_Beg)>0) then Kol_Month_End := Kol_Month_End + 12;

  Kol_Month := Kol_Month_End - Kol_Month_Beg + 1;

  MemoryDataSumm.FieldByName('mrMonth').AsInteger := Kol_Month;
end;

procedure TfrmGetRec.TableDate_begPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  Date_Beg_Grid, Date_End_Grid : TDate;
  Kol_Month_Beg, Kol_Month_End, Kol_Month, Year_Beg, Year_End: Word;
  Day : Word;
begin
  If ((MemoryDataSumm['mrDate_end'] = null) or (MemoryDataSumm['mrDate_Beg'] = null)) then Exit;

  If VarToDateTime(DisplayValue) < Date_beg_price then
   Begin
     ShowMessage('Дата початку періоду не може бути менше дати початку дії прейскуранта!');
     Exit;
   End;

  Date_End_Grid := MemoryDataSumm.FieldByName('mrDate_end').AsDateTime;
  Date_Beg_Grid := VarToDateTime(DisplayValue);

  Date_End_Grid := Date_End_Grid - 1;
  DecodeDate(Date_Beg_Grid, Year_Beg, Kol_Month_Beg, Day);
  DecodeDate(Date_End_Grid, Year_End, Kol_Month_End, Day);
  Date_End_Grid := Date_End_Grid + 1;

  If ((Year_End-Year_Beg)>0) then Kol_Month_End := Kol_Month_End + 12;

  Kol_Month := Kol_Month_End - Kol_Month_Beg + 1;

  MemoryDataSumm.Open;
  MemoryDataSumm.Edit;
  MemoryDataSumm.FieldByName('mrDate_beg').AsDateTime      := Date_Beg_Grid;
  MemoryDataSumm.FieldByName('mrDate_end').AsDateTime      := Date_End_Grid;
  MemoryDataSumm.FieldByName('mrMonth').AsInteger          := Kol_Month;
  MemoryDataSumm.Post;
end;

procedure TfrmGetRec.CheckDate_End_Set_Kol_Month(DisplayValue : Variant);
var
  Date_Beg_Grid, Date_End_Grid : TDate;
  Kol_Month_Beg, Kol_Month_End, Year_Beg, Year_End: Word;
  Kol_Month : Integer;
  Day : Word;
begin
  If ((MemoryDataSumm['mrDate_end'] = null) or (MemoryDataSumm['mrDate_Beg'] = null)) then Exit;

  If VarToDateTime(DisplayValue) <  MemoryDataSumm.FieldByName('mrDate_beg').AsDateTime then
   begin
     ShowMessage('Дата закінчення періоду не може бути менше дати початку періоду!');
     Exit;
   end;

  //Дати поточного періоду не повинні перетинатися з іншими періодами
  Date_End_Grid := VarToDateTime(DisplayValue);
  Date_Beg_Grid := MemoryDataSumm.FieldByName('mrDate_beg').AsDateTime;

  Date_End_Grid := Date_End_Grid - 1;
  DecodeDate(Date_Beg_Grid, Year_Beg, Kol_Month_Beg, Day);
  DecodeDate(Date_End_Grid, Year_End, Kol_Month_End, Day);
  Date_End_Grid := Date_End_Grid + 1;

  if ((Year_End-Year_Beg)>0) then Kol_Month_End := Kol_Month_End + 12;

  Kol_Month := Kol_Month_End - Kol_Month_Beg + 1;

  MemoryDataSumm.FieldByName('mrMonth').AsInteger := Kol_Month;
end;

procedure TfrmGetRec.TableDate_endPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  Date_Beg_Grid, Date_End_Grid : TDate;
  Kol_Month_Beg, Kol_Month_End, Year_Beg, Year_End: Word;
  Kol_Month : Integer;
  Day : Word;
begin
  If ((MemoryDataSumm['mrDate_end'] = null) or (MemoryDataSumm['mrDate_Beg'] = null)) then Exit;

  If VarToDateTime(DisplayValue) <  MemoryDataSumm.FieldByName('mrDate_beg').AsDateTime then
   begin
     ShowMessage('Дата закінчення періоду не може бути менше дати початку періоду!');
     Exit;
   end;
//   Дати поточного періоду не повинні перетинатися з іншими періодами

  Date_End_Grid := VarToDateTime(DisplayValue);
  Date_Beg_Grid := MemoryDataSumm.FieldByName('mrDate_beg').AsDateTime;

  Date_End_Grid := Date_End_Grid - 1;
  DecodeDate(Date_Beg_Grid, Year_Beg, Kol_Month_Beg, Day);
  DecodeDate(Date_End_Grid, Year_End, Kol_Month_End, Day);
  Date_End_Grid := Date_End_Grid + 1;

  if ((Year_End-Year_Beg)>0) then Kol_Month_End := Kol_Month_End + 12;

  Kol_Month := Kol_Month_End - Kol_Month_Beg + 1;

  MemoryDataSumm.Open;
  MemoryDataSumm.Edit;
  MemoryDataSumm.FieldByName('mrDate_beg').AsDateTime      := Date_Beg_Grid;
  MemoryDataSumm.FieldByName('mrDate_end').AsDateTime      := Date_End_Grid;
  MemoryDataSumm.FieldByName('mrMonth').AsInteger          := Kol_Month;
  MemoryDataSumm.Post;
end;

procedure TfrmGetRec.Valut_editPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Id_Val : Variant;
begin
  Id_Val := GlobalSpr.GetValute(Self, TfrmPriceReestr(self.Owner).WorkDatabase.Handle, fsNormal, 0, -1);

  if VarArrayDimCount(id_val) > 0 then
   begin
    Id_Valute:= id_val[0];
    Valut_edit.Text := Id_Val[1];
   end;
end;

end.
