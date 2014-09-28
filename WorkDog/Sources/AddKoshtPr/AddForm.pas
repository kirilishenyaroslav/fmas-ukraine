unit AddForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxDropDownEdit, cxTextEdit, cxMaskEdit, StdCtrls, Mask, ToolEdit,
  dogLangPackUnit2, CurrEdit, cxContainer, cxButtonEdit,
  cxButtons, ExtCtrls, iBase, GlobalSPR, cxTL, dogLoaderUnit, cxCalendar;

resourcestring
    errTipDogNotSumma = 'Введіть суму.';
    errTipDogOtrSumma = 'Сума не може бути від''ємною.';
    errTipDogNotSmeta = 'Виберіть кошторис.';
    errTipDogNotRazd = 'Виберіть розділ.';
    errTipDogNotStat = 'Виберіть статтю.';
    errTipDogNotKekv = 'Виберіть КЕКВ.';

type
  TfrmAddSmet = class(TForm)
    Panel1: TPanel;
    cxButton_ok: TcxButton;
    cxButton_cancel: TcxButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cxButtonEdit_name_smet: TcxButtonEdit;
    CurrencyEdit_sum_smet: TCurrencyEdit;
    cxMaskEdit_kod_smeti: TcxMaskEdit;
    cxTextEdit_name_razd: TcxTextEdit;
    cxMaskEdit_n_razd: TcxMaskEdit;
    cxMaskEdit_n_stat: TcxMaskEdit;
    cxMaskEdit_kekv: TcxMaskEdit;
    cxButtonEdit_name_kekv: TcxButtonEdit;
    pFIBStoredProc: TpFIBStoredProc;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSet_default_smet: TpFIBDataSet;
    pFIBDataSet_razd_st: TpFIBDataSet;
    pFIBDataSet_smeta: TpFIBDataSet;
    pFIBDataSet_kekv: TpFIBDataSet;
    DataSource1: TDataSource;
    pFIBDataSet_stat: TpFIBDataSet;
    pFIBDatabase: TpFIBDatabase;
    pFIBTransactionRead: TpFIBTransaction;
    cxStyleRepository2: TcxStyleRepository;
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
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    cxTextEdit_stat: TcxTextEdit;
    Label10: TLabel;
    DateBeg: TcxDateEdit;
    Label11: TLabel;
    DateEnd: TcxDateEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButtonEdit_name_smetPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit_name_kekvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton_okClick(Sender: TObject);
    procedure cxMaskEdit_kod_smetiExit(Sender: TObject);
    procedure cxMaskEdit_n_razdExit(Sender: TObject);
    procedure cxMaskEdit_n_statExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CurrencyEdit_sum_smetKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure CurrencyEdit_sum_smetKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxMaskEdit_kekvExit(Sender: TObject);
    procedure cxMaskEdit_kod_smetiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxMaskEdit_n_razdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxMaskEdit_n_statKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxMaskEdit_kekvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateBegKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateEndKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
   constructor Create (Aowner:TComponent;DBHANDLE : TISC_DB_HANDLE; sum_doc: Currency); overload;
    { Public declarations }
  end;

  function AddKosht(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; sum_doc: Currency; Mode: Integer {1-добавить,2-редактировать};
                  id_s, id_r, id_st, id_k: Integer; s_smet: Currency; DateDog: TDate;DateBeg:TDate;DateEnd:TDate):Variant; stdcall;
  exports AddKosht;

var
  frmAddSmet: TfrmAddSmet;
  Res:Variant;
  // переменные по смете
  id_smet, id_razd, id_stat: Variant;
  name_smet, name_razd, name_stat: String;
  nomer_razd, nomer_stat, kod_smet: Integer;
  sum_smet: Variant;
  default_values: Integer;
  default_kekv: Integer;
  def_name_smet, def_name_razd, def_name_st, def_name_kekv : String;
  def_kod_smet, def_n_razd, def_n_st, def_n_kekv : Integer;
  def_id_smet, def_id_razd, def_id_st, def_id_kekv : Variant;
  id_kekv: Variant; //Идентификатор кеква
  kod_kekv: Integer;
  name_kekv: String;
  stat_old: Integer;
  summa_doc: Currency;
  _mode: Integer;
implementation

{$R *.dfm}

constructor TfrmAddSmet.Create(Aowner:TComponent;DBHANDLE : TISC_DB_HANDLE; sum_doc: Currency);
begin
  //Для Днепродзержинска//
  inherited Create (Aowner);
  pFIBDatabase.Handle := DBHANDLE;
  pFIBDataSet_default_smet.Database := pFIBDatabase;
  pFIBDataSet_default_smet.Transaction := pFIBTransactionRead;
  pFIBDataSet_default_smet.Active := false;
  pFIBDataSet_default_smet.Active := true;
  if sum_doc > 0 then CurrencyEdit_sum_smet.Value := sum_doc;

  summa_doc := sum_doc;

  default_kekv := pFIBDataSet_default_smet.FieldByName('USE_DEFAULT_KEKV').AsInteger;
  default_values := pFIBDataSet_default_smet.FieldByName('use_default_values').AsInteger;

  //кекв по умолчанию
  if pFIBDataSet_default_smet.FieldByName('USE_DEFAULT_KEKV').Value = 1 then
  begin
    def_id_kekv  := pFIBDataSet_default_smet.FieldByName('DEFAULT_KEKV').AsInteger;
    pFIBDataSet_kekv.Active := false;
    pFIBDataSet_kekv.ParamByName('id_kekv').Value := pFIBDataSet_default_smet.FieldByName('default_kekv').AsInteger;
    pFIBDataSet_kekv.ParamByName('actual_date').Value := SYS_CURRENT_DATE;
    pFIBDataSet_kekv.Active := true;
    cxMaskEdit_kekv.Text := pFIBDataSet_kekv.FieldByName('kekv_kode').AsString;
    cxButtonEdit_name_kekv.Text := pFIBDataSet_kekv.FieldByName('kekv_title').AsString;
    def_name_kekv := pFIBDataSet_kekv.FieldByName('kekv_title').AsString;
    def_n_kekv := pFIBDataSet_kekv.FieldByName('kekv_kode').AsInteger;
    cxMaskEdit_kekv.Properties.ReadOnly := true;
  end;

  //бюджет по умолчанию
  if pFIBDataSet_default_smet.FieldByName('use_default_values').Value = 1 then
  begin
    def_id_smet    := pFIBDataSet_default_smet.FieldByName('default_smeta').AsInteger;
    def_id_razd    := pFIBDataSet_default_smet.FieldByName('default_razd').AsInteger;
    def_id_st      := pFIBDataSet_default_smet.FieldByName('default_st').AsInteger;

    pFIBDataSet_smeta.Active := false;
    pFIBDataSet_smeta.ParamByName('id_smeta').Value := pFIBDataSet_default_smet.FieldByName('default_smeta').AsVariant;
    pFIBDataSet_smeta.Active := true;

    cxButtonEdit_name_smet.Text := pFIBDataSet_smeta.FieldByName('smeta_title').AsString;
    cxMaskEdit_kod_smeti.Text := pFIBDataSet_smeta.FieldByName('smeta_kod').AsVariant;
    def_name_smet := pFIBDataSet_smeta.FieldByName('smeta_title').AsString;
    def_kod_smet := pFIBDataSet_smeta.FieldByName('smeta_kod').AsInteger;

    pFIBDataSet_razd_st.Active := false;
    pFIBDataSet_razd_st.ParamByName('id_razd_st_in').Value := pFIBDataSet_default_smet.FieldByName('default_razd').AsVariant;
    pFIBDataSet_razd_st.Active := true;

    cxTextEdit_name_razd.Text := pFIBDataSet_razd_st.FieldByName('razd_st_title').AsString;
    cxMaskEdit_n_razd.Text := pFIBDataSet_razd_st.FieldByName('razd_st_num').AsVariant;
    def_name_razd := pFIBDataSet_razd_st.FieldByName('razd_st_title').AsString;
    def_n_razd := pFIBDataSet_razd_st.FieldByName('razd_st_num').AsInteger;

    pFIBDataSet_razd_st.Active := false;
    pFIBDataSet_razd_st.ParamByName('id_razd_st_in').Value := pFIBDataSet_default_smet.FieldByName('default_st').AsVariant;
    pFIBDataSet_razd_st.Active := true;

    cxTextEdit_stat.Text := pFIBDataSet_razd_st.FieldByName('razd_st_title').AsString;;
    cxMaskEdit_n_stat.Text := pFIBDataSet_razd_st.FieldByName('razd_st_num').AsVariant;
    def_name_st := pFIBDataSet_razd_st.FieldByName('razd_st_title').AsString;;
    def_n_st := pFIBDataSet_razd_st.FieldByName('razd_st_num').AsInteger;

    cxMaskEdit_kod_smeti.Properties.ReadOnly := true;
    cxMaskEdit_n_razd.Properties.ReadOnly := true;
    cxMaskEdit_n_stat.Properties.ReadOnly := true;
  end;
end;

function AddKosht(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; sum_doc: Currency; Mode: Integer {1-добавить,2-редактировать};
                  id_s, id_r, id_st, id_k: Integer; s_smet: Currency; DateDog: TDate;DateBeg:TDate; DateEnd:TDate):Variant;
var
  spr: TfrmAddSmet;
  d_dog: TDate;
begin
  spr := TfrmAddSmet.Create(Aowner,DBHANDLE,sum_doc);
  res := Unassigned;
  _mode := mode;
  d_dog := DateDog;

  spr.DateBeg.Date:=DateBeg;
  spr.DateEnd.Date:=DateEnd;

  if _mode = 2 then
  begin
    spr.Caption := 'Редагування кошториса';

    spr.pFIBDataSet_kekv.Active := false;
    spr.pFIBDataSet_kekv.ParamByName('id_kekv').Value := id_k;
    spr.pFIBDataSet_kekv.ParamByName('actual_date').Value := Datedog;
    spr.pFIBDataSet_kekv.Active := true;
    id_kekv    := id_k;
    kod_kekv   := spr.pFIBDataSet_kekv.FBN('KEKV_KODE').AsInteger;
    name_kekv  := spr.pFIBDataSet_kekv.FBN('KEKV_TITLE').AsString;
    spr.cxMaskEdit_kekv.Text := spr.pFIBDataSet_kekv.FBN('KEKV_KODE').AsString;
    spr.cxButtonEdit_name_kekv.Text := spr.pFIBDataSet_kekv.FBN('KEKV_TITLE').AsString;

    spr.pFIBDataSet_smeta.Active := false;
    spr.pFIBDataSet_smeta.ParamByName('ID_SMETA').Value := id_s;
    spr.pFIBDataSet_smeta.Active := true;
    id_smet    := id_s;
    name_smet  := spr.pFIBDataSet_smeta.FBN('SMETA_TITLE').AsString;
    kod_smet   := spr.pFIBDataSet_smeta.FBN('SMETA_KOD').AsInteger;
    spr.cxMaskEdit_kod_smeti.Text   := spr.pFIBDataSet_smeta.FBN('SMETA_KOD').AsString;
    spr.cxButtonEdit_name_smet.Text := spr.pFIBDataSet_smeta.FBN('SMETA_TITLE').AsString;

    spr.pFIBDataSet_razd_st.Active := false;
    spr.pFIBDataSet_razd_st.ParamByName('ID_RAZD_ST_IN').Value := id_r;
    spr.pFIBDataSet_razd_st.Active := true;
    id_razd    := id_r;
    name_razd  := spr.pFIBDataSet_razd_st.FBN('RAZD_ST_TITLE').AsString;
    nomer_razd := spr.pFIBDataSet_razd_st.FBN('RAZD_ST_NUM').AsInteger;
    spr.cxMaskEdit_n_razd.Text   := spr.pFIBDataSet_razd_st.FBN('RAZD_ST_NUM').AsString;
    spr.cxTextEdit_name_razd.Text := spr.pFIBDataSet_razd_st.FBN('RAZD_ST_TITLE').AsString;

    spr.pFIBDataSet_razd_st.Active := false;
    spr.pFIBDataSet_razd_st.ParamByName('ID_RAZD_ST_IN').Value := id_st;
    spr.pFIBDataSet_razd_st.Active := true;
    id_stat    := id_st;
    name_stat  := spr.pFIBDataSet_razd_st.FBN('RAZD_ST_TITLE').AsString;
    nomer_stat := spr.pFIBDataSet_razd_st.FBN('RAZD_ST_NUM').AsInteger;
    spr.cxMaskEdit_n_stat.Text   := spr.pFIBDataSet_razd_st.FBN('RAZD_ST_NUM').AsString;
    spr.cxTextEdit_stat.Text := spr.pFIBDataSet_razd_st.FBN('RAZD_ST_TITLE').AsString;

    sum_smet   := s_smet;
    spr.CurrencyEdit_sum_smet.Value := sum_smet;
  end;
  spr.ShowModal;
  AddKosht := Res;     // возвращает данные
  spr.Free;
end;

procedure TfrmAddSmet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAddSmet.cxButton_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddSmet.cxButtonEdit_name_smetPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  smet: Variant;
begin
  if default_values = 1 then
  begin
    Exit;
  end
  else
  begin
  smet := GlobalSPR.GetSmets(self, pFIBDatabase.Handle, sys_current_date, psmrazdst);
  if VarArrayDimCount(smet) > 0 then
      begin
      if smet[0] <> 0 then
          begin
            id_smet := smet[0];
            id_razd := smet[1];
            id_stat := smet[2];
            name_smet := smet[6];
            name_razd := smet[4];
            name_stat := smet[5];
            nomer_razd := smet[7];
            nomer_stat := smet[8];
            kod_smet := smet[9];
            cxButtonEdit_name_smet.Text := smet[6];
            cxTextEdit_name_razd.Text := smet[4];
            cxTextEdit_stat.Text := smet[5];
            cxMaskEdit_kod_smeti.Text := smet[9];
            cxMaskEdit_n_razd.Text := smet[7];
            cxMaskEdit_n_stat.Text := smet[8];
          end;
         cxMaskEdit_kekv.SetFocus;
      end;
  end;
end;

procedure TfrmAddSmet.cxButtonEdit_name_kekvPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  res : variant;
begin
  if default_kekv = 1 then
  begin
    Exit;
  end
  else
  begin
  res := GlobalSPR.GetKEKVSpr(self, pFIBDatabase.Handle, fsNormal, SYS_CURRENT_DATE, 1);
  if VarArrayDimCount(res) > 0 then
  begin
      if (res[0][0]<>null) and (res[0][1]<>null) then
      begin
          id_kekv := res[0][0];               //Id
          kod_kekv := res[0][2];
          name_kekv := res[0][1];
          cxMaskEdit_kekv.Text := res[0][2]; //Kod
          cxButtonEdit_name_kekv.Text := res[0][1]; //Title
      end;
  end;
  end;
end;

procedure TfrmAddSmet.cxButton_okClick(Sender: TObject);
var
  sum_add: Variant;
  DataSet: TpFIBDataSet;
  max_change, i: Integer;
  Res_val: Integer;
begin

   // Проверка на заполнение сметы
  if  Trim(cxButtonEdit_name_smet.Text) = '' then
    begin
      dialogs.MessageDlg(errTipDogNotSmeta, mtError, [mbOk], 0);
      cxMaskEdit_kod_smeti.SetFocus;
      Exit;
    end;

  // Проверка на заполнение раздела
  if  Trim(cxTextEdit_name_razd.Text) = '' then
    begin
      dialogs.MessageDlg(errTipDogNotRazd, mtError, [mbOk], 0);
      cxMaskEdit_n_razd.SetFocus;
      Exit;
    end;

  // Проверка на заполнение статьи
  if  Trim(cxTextEdit_stat.Text) = '' then
    begin
      dialogs.MessageDlg(errTipDogNotStat, mtError, [mbOk], 0);
      cxMaskEdit_n_stat.SetFocus;
      Exit;
    end;

    // Проверка на заполнение кеква
  if  Trim(cxButtonEdit_name_kekv.Text) = '' then
    begin
      dialogs.MessageDlg(errTipDogNotKekv, mtError, [mbOk], 0);
      cxMaskEdit_kekv.SetFocus;
      Exit;
    end;

  // Проверка на заполнение суммы
  if  Trim(CurrencyEdit_sum_smet.Text) ='' then
    begin
      dialogs.MessageDlg(errTipDogNotSumma, mtError, [mbOk], 0);
      CurrencyEdit_sum_smet.SetFocus;
      Exit;
    end;

  // Проверка на отрицательную сумму
{  if  CurrencyEdit_sum_smet.Value < 0 then
    begin
      MessageDlg(errTipDogOtrSumma, mtError, [mbOk], 0);
      CurrencyEdit_sum_smet.SetFocus;
      Exit;
    end;
 }
  //
   if summa_doc <> -1 then
   begin
     sum_add := CurrencyEdit_sum_smet.Value;
     if sum_add > summa_doc then
     begin
       ShowMessage('Сума по кошторису не перевищує суму документа.');
       CurrencyEdit_sum_smet.Value := summa_doc;
       CurrencyEdit_sum_smet.SetFocus;
       Exit;
     end;
   end;

  sum_smet:=CurrencyEdit_sum_smet.Value;

  {Проверка на совместимость  сметы, раздела, статьи}
    DataSet := TpFIBDataSet.Create(Self);
    DataSet.Database := pFIBDatabase;
    DataSet.Transaction := pFIBTransactionRead;
    DataSet.SelectSQL.Text := 'select * from  pub_is_correct_sm_razd_st(:id_smeta,:id_razd,:id_stat,:actual_date)';
    if default_values = 1 then
    begin
      DataSet.ParamByName('id_smeta').Value := def_id_smet;
      DataSet.ParamByName('id_razd').Value  := def_id_razd;
      DataSet.ParamByName('id_stat').Value  := def_id_st;
    end
    else
    begin
      DataSet.ParamByName('id_smeta').Value := id_smet;
      DataSet.ParamByName('id_razd').Value := id_razd;
      DataSet.ParamByName('id_stat').Value := id_stat;
    end;
    DataSet.ParamByName('actual_date').Value := SYS_CURRENT_DATE;
    DataSet.Active := true;
    res_val := DataSet.FieldByName('RESULT_VALUE').AsInteger;
    DataSet.Free;
    if res_val = 0 then
    begin
      ShowMessage('Не коректні параметры бюджетування.');
      cxButtonEdit_name_smetPropertiesButtonClick(Self,-1);
      Exit;
    end;

  if default_values = 1 then
  begin
    if default_kekv = 1 then
    begin
    Res := VarArrayCreate([0, 0], varVariant);
    for i := 0 to 0 do
     begin
      Res[i] := varArrayOf([def_name_smet,def_name_razd,def_name_st,sum_smet
      ,def_kod_smet,def_n_razd,def_n_st,def_id_smet,def_id_razd,def_id_st,
      def_id_kekv, def_n_kekv, def_name_kekv,DateBeg.Date,DateEnd.Date]);
     end
    end
    else
    begin
    Res := VarArrayCreate([0, 0], varVariant);
    for i := 0 to 0 do
     begin
      Res[i] := varArrayOf([def_name_smet,def_name_razd,def_name_st,sum_smet
      ,def_kod_smet,def_n_razd,def_n_st,def_id_smet,def_id_razd,def_id_st,
      id_kekv, kod_kekv, name_kekv,DateBeg.Date,DateEnd.Date]);
     end;
    end;
  end
  else
  begin
  if default_kekv = 1 then
  begin
  Res := VarArrayCreate([0, 0], varVariant);
    for i := 0 to 0 do
    begin
      Res[i] := varArrayOf([name_smet,name_razd,name_stat,sum_smet
      ,kod_smet,nomer_razd,nomer_stat,id_smet,id_razd,id_stat,
      def_id_kekv, def_n_kekv, def_name_kekv,DateBeg.Date,DateEnd.Date]);
    end;
  end
  else
  begin
  Res := VarArrayCreate([0, 0], varVariant);
    for i := 0 to 0 do
    begin
      Res[i] := varArrayOf([name_smet,name_razd,name_stat,sum_smet
      ,kod_smet,nomer_razd,nomer_stat,id_smet,id_razd,id_stat,
      id_kekv, kod_kekv, name_kekv,DateBeg.Date,DateEnd.Date]);
    end;
  end;
  end;
  Close;
end;

procedure TfrmAddSmet.cxMaskEdit_kod_smetiExit(Sender: TObject);
begin
if  trim(cxMaskEdit_kod_smeti.Text) <> '' then
 begin
  pFIBStoredProc.Database := pFIBDatabase;
  pFIBStoredProc.Transaction := pFIBTransactionWrite;
  pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
  pFIBTransactionWrite.StartTransaction;
  pFIBStoredProc.StoredProcName := 'PUB_GET_NAME_BUDG_BY_KOD';
  pFIBStoredProc.Prepare;
  pFIBStoredProc.ParamByName('NUM_OBJECT').Value := cxMaskEdit_kod_smeti.Text;
  pFIBStoredProc.ParamByName('ACTUAL_DATE').Value := SYS_CURRENT_DATE;
  pFIBStoredProc.ParamByName('TYPE_OBJECT').Value := 1;
   try
   pFIBStoredProc.ExecProc;
   except  on e:Exception do
      begin
        ShowMessage(e.Message);
        pFIBTransactionWrite.Rollback;
        Exit;
      end;
    end;
   pFIBTransactionWrite.Commit;
   cxButtonEdit_name_smet.Text := pFIBStoredProc.FieldByName('TITLE_OBJECT').AsString;
   id_smet := pFIBStoredProc.FieldByName('ID_OBJECT').AsInteger;
   kod_smet := StrToInt(cxMaskEdit_kod_smeti.text);
   name_smet := pFIBStoredProc.FieldByName('TITLE_OBJECT').AsString;
 end;
end;

procedure TfrmAddSmet.cxMaskEdit_n_razdExit(Sender: TObject);
var
  new_razd, old_razd: Integer;
begin
if Trim(cxMaskEdit_n_razd.Text) <> '' then
 begin
 //если меняется раздел, то меняется и статья
  new_razd := StrToInt(cxMaskEdit_n_razd.Text);
  if new_razd=old_razd then Exit else cxMaskEdit_n_statExit(Self);
  pFIBStoredProc.Database := pFIBDatabase;
  pFIBStoredProc.Transaction := pFIBTransactionWrite;
  pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
  pFIBTransactionWrite.StartTransaction;
  pFIBStoredProc.StoredProcName := 'PUB_GET_NAME_BUDG_BY_KOD';
  pFIBStoredProc.Prepare;
  pFIBStoredProc.ParamByName('NUM_OBJECT').Value := cxMaskEdit_n_razd.Text;
  pFIBStoredProc.ParamByName('ACTUAL_DATE').Value := SYS_CURRENT_DATE;
  pFIBStoredProc.ParamByName('TYPE_OBJECT').Value := 2;
   try
   pFIBStoredProc.ExecProc;
   except  on e:Exception do
      begin
        ShowMessage(e.Message);
        pFIBTransactionWrite.Rollback;
        Exit;
      end;
    end;
   pFIBTransactionWrite.Commit;
   cxTextEdit_name_razd.Text := pFIBStoredProc.FieldByName('TITLE_OBJECT').AsString;
   id_razd := pFIBStoredProc.FieldByName('ID_OBJECT').AsInteger;
   name_razd := pFIBStoredProc.FieldByName('TITLE_OBJECT').AsString;
   nomer_razd := StrToInt(cxMaskEdit_n_razd.Text);
   old_razd := nomer_razd;
 end;
end;

procedure TfrmAddSmet.cxMaskEdit_n_statExit(Sender: TObject);
//var
//  stat_new: Integer;
begin
if Trim(cxMaskEdit_n_stat.Text) <> '' then
 begin
  if Trim(cxTextEdit_name_razd.Text)='' then begin
    ShowMessage('Виберіть розділ.');
    cxMaskEdit_n_razd.SetFocus;
    Exit;
  end;
//  stat_new := StrToInt(cxMaskEdit_n_stat.Text);
//  if stat_new = stat_old then Exit;
  pFIBDataSet_stat.Database := pFIBDatabase;
  pFIBDataSet_stat.Transaction := pFIBTransactionRead;
  pFIBDataSet_stat.Active := false;
  pFIBDataSet_stat.ParamByName('num_st').Value := cxMaskEdit_n_stat.Text;
  pFIBDataSet_stat.ParamByName('actual_date').Value := SYS_CURRENT_DATE;
  pFIBDataSet_stat.ParamByName('num_razd').Value := cxMaskEdit_n_razd.Text;
  pFIBDataSet_stat.Active := true;
  id_stat := pFIBDataSet_stat.FieldByName('id_st').AsInteger;
// cxPopupEdit_stat.Text := pFIBDataSet_stat.FieldByName('title_st').AsString;
  cxTextEdit_stat.Text := pFIBDataSet_stat.FieldByName('title_st').AsString;
  nomer_stat := StrToInt(cxMaskEdit_n_stat.Text);
//  stat_old := nomer_stat;
  name_stat := pFIBDataSet_stat.FieldByName('title_st').AsString;
 end;

end;

procedure TfrmAddSmet.FormCreate(Sender: TObject);
begin
// Интерфейс
{  GroupBox1.Caption        := rsh_Smeta;
  Label3.Caption           := rsh_Kod_smeta;
  Label5.Caption           := rsh_N_razd;
  Label7.Caption           := rsh_N_stat;
  Label1.Caption           := rsh_Name_smeta;
  Label4.Caption           := rsh_Name_razd;
  Label6.Caption           := rsh_Name_stat;
  Label2.Caption           := rsh_Summa;
  Label8.Caption           := rsh_N_kekv;
  Label9.Caption           := rsh_Name_kekv;}
end;

procedure TfrmAddSmet.FormShow(Sender: TObject);
begin
  if default_values = 0 then
  begin
    cxMaskEdit_kod_smeti.SetFocus;
  end
  else
  if default_kekv = 0 then
  begin
    cxMaskEdit_kekv.SetFocus;
  end
  else
  CurrencyEdit_sum_smet.SetFocus;
  if (_mode = 2) then CurrencyEdit_sum_smet.SetFocus;;
end;

procedure TfrmAddSmet.CurrencyEdit_sum_smetKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 189 then key := 0;
 if Key = VK_Space then key := 0;
 if key = VK_RETURN then cxButton_ok.SetFocus;
end;

procedure TfrmAddSmet.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  id_stat := pFIBDataSet_stat.FieldByName('id_object').AsInteger;
  cxTextEdit_stat.Text := pFIBDataSet_stat.FieldByName('title_object').AsString;
  nomer_stat := StrToInt(cxMaskEdit_n_stat.Text);
  name_stat := pFIBDataSet_stat.FieldByName('title_object').AsString;
end;

procedure TfrmAddSmet.CurrencyEdit_sum_smetKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in ['0'..'9',',','.','-'])  and (key <> #8)
  then    key := #0;
end;

procedure TfrmAddSmet.cxMaskEdit_kekvExit(Sender: TObject);
begin
if Trim(cxMaskEdit_kekv.Text) <> '' then
 begin
  pFIBStoredProc.Database := pFIBDatabase;
  pFIBStoredProc.Transaction := pFIBTransactionWrite;
  pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
  pFIBTransactionWrite.StartTransaction;
  pFIBStoredProc.StoredProcName := 'PUB_SPR_KEKV_INFO_EX2';
  pFIBStoredProc.Prepare;
  pFIBStoredProc.ParamByName('NUM_KEKV').Value := cxMaskEdit_kekv.Text;
  pFIBStoredProc.ParamByName('ACTUAL_DATE').Value := SYS_CURRENT_DATE;
   try
   pFIBStoredProc.ExecProc;
   except  on e:Exception do
      begin
        ShowMessage(e.Message);
        pFIBTransactionWrite.Rollback;
        Exit;
      end;
    end;
   pFIBTransactionWrite.Commit;
   cxButtonEdit_name_kekv.Text := pFIBStoredProc.FieldByName('KEKV_TITLE').AsString;
   id_kekv := pFIBStoredProc.FieldByName('ID_KEKV').AsInteger;
   kod_kekv := StrToInt(cxMaskEdit_kekv.Text);
   name_kekv := pFIBStoredProc.FieldByName('KEKV_TITLE').AsString;
   if Trim(cxButtonEdit_name_kekv.Text) = '' then
   begin
     cxButtonEdit_name_kekvPropertiesButtonClick(Self,-1);
   end;
 end;
end;

procedure TfrmAddSmet.cxMaskEdit_kod_smetiKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    cxMaskEdit_kod_smetiExit(Self);
    cxMaskEdit_n_razd.SetFocus;
  end;
end;

procedure TfrmAddSmet.cxMaskEdit_n_razdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    cxMaskEdit_n_razdExit(Self);
    cxMaskEdit_n_stat.SetFocus;
  end;
end;

procedure TfrmAddSmet.cxMaskEdit_n_statKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    cxMaskEdit_n_statExit(Self);
    cxMaskEdit_kekv.SetFocus;
  end;
end;

procedure TfrmAddSmet.cxMaskEdit_kekvKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    cxMaskEdit_kekvExit(Self);
    CurrencyEdit_sum_smet.SetFocus;
  end;
end;

procedure TfrmAddSmet.DateBegKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    DateEnd.SetFocus;
  end;
end;

procedure TfrmAddSmet.DateEndKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    cxMaskEdit_kod_smeti.SetFocus;
  end;
end;

end.
