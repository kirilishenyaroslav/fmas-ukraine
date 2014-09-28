unit Add_smet_sh2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, Mask, ToolEdit, CurrEdit,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, ExtCtrls, Kowtoris, Shablon2,
  GlobalSPR, DB, FIBDataSet, pFIBDataSet, dogLangPackUnit2,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxDBData, cxDropDownEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc,
  cxCurrencyEdit, cxTL;

resourcestring
    errTipDogNotSumma = 'Введите суму!';
    errTipDogOtrSumma = 'Сума не може бути від''ємною!';
    errTipDogNotSmeta = 'Виберіть кошторис!';
    errTipDogNotRazd = 'Виберіть розділ!';
    errTipDogNotStat = 'Виберіть статтю!';
    errTipDogNotKekv = 'Виберіть КЕКВ!';

type
  TfrmAddSmetSh2 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    cxButtonEdit_name_smet: TcxButtonEdit;
    cxButton_ok: TcxButton;
    cxButton_cancel: TcxButton;
    CurrencyEdit_sum_smet: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cxMaskEdit_kod_smeti: TcxMaskEdit;
    cxTextEdit_name_razd: TcxTextEdit;
    cxMaskEdit_n_razd: TcxMaskEdit;
    cxMaskEdit_n_stat: TcxMaskEdit;
    Label8: TLabel;
    cxMaskEdit_kekv: TcxMaskEdit;
    Label9: TLabel;
    cxButtonEdit_name_kekv: TcxButtonEdit;
    pFIBDataSet_kekv: TpFIBDataSet;
    pFIBDataSet_default_smet: TpFIBDataSet;
    pFIBDataSet_smeta: TpFIBDataSet;
    pFIBDataSet_razd_st: TpFIBDataSet;
    pFIBStoredProc: TpFIBStoredProc;
    pFIBTransactionWrite: TpFIBTransaction;
    DataSource1: TDataSource;
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
    pFIBDataSet_stat: TpFIBDataSet;
    cxTextEdit_stat: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButtonEdit_add_smetPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton_okClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonEdit_name_kekvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxMaskEdit_kod_smetiExit(Sender: TObject);
    procedure cxMaskEdit_n_razdExit(Sender: TObject);
    procedure cxMaskEdit_n_statExit(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
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
    procedure CurrencyEdit_sum_smetKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public

  // Проверка: сумма по сметам не должна превышать сумму по периоду
  function ProverkaSum(sum_documenta, sum_smet_pod_doc: Variant): Variant;

  constructor Create(Aowner:TComponent;id_smet, id_razd, id_stat: Variant;
          name_smet, name_razd, name_stat: String; kod_smet, n_razd, n_stat: Variant;
          Flag:Boolean; sum_sm: Variant; shb2:TfrmKowtoris);overload;
    { Public declarations }
  end;

var
  frmAddSmetSh2: TfrmAddSmetSh2;
  // переменные по смете
  id_smet, id_razd, id_stat: Variant;
  name_smet, name_razd, name_stat: String;
  nomer_razd, nomer_stat, kod_smet: Integer;
  sum_smet: Variant;
  Flag_edit: Boolean;
  lsh2:TfrmKowtoris;
  //данные из кошториса для проверки сумм
  p_sum_documenta, p_sum_smet_pod_doc, p_sum_smet: Variant;
  sum_add, sum_temp: Variant;
  default_values: Integer;
  def_name_smet, def_name_razd, def_name_st, def_name_kekv : String;
  def_kod_smet, def_n_razd, def_n_st, def_n_kekv : Integer;
  def_id_smet, def_id_razd, def_id_st, def_id_kekv : Variant;
  id_kekv: Variant; //Идентификатор кеква
  kod_kekv: Integer;
  name_kekv: String;
  default_kekv: Integer;
  stat_old: Integer;

implementation

uses StrUtils;
{$R *.dfm}

constructor TfrmAddSmetSh2.Create(Aowner:TComponent;id_smet, id_razd, id_stat: Variant;
name_smet, name_razd, name_stat: String; kod_smet, n_razd, n_stat: Variant; Flag:Boolean;
sum_sm: Variant; shb2:TfrmKowtoris);
begin
  //Для Днепродзержинска//
  inherited Create (Aowner);
  pFIBDataSet_default_smet.Database := TfrmShablon2(self.Owner).pFIBDatabase;
  pFIBDataSet_default_smet.Transaction := TfrmShablon2(self.Owner).pFIBTransactionRead;
  pFIBDataSet_default_smet.Active := false;
  pFIBDataSet_default_smet.Active := true;

  default_kekv := pFIBDataSet_default_smet.FieldByName('USE_DEFAULT_KEKV').AsInteger;
  default_values := pFIBDataSet_default_smet.FieldByName('use_default_values').AsInteger;

  lsh2 := shb2;
  Flag_edit := Flag;
  sum_temp := 0;

  //кекв по умолчанию
  if pFIBDataSet_default_smet.FieldByName('USE_DEFAULT_KEKV').Value = 1 then
  begin
    def_id_kekv    := pFIBDataSet_default_smet.FieldByName('DEFAULT_KEKV').AsInteger;
    pFIBDataSet_kekv.Database := TfrmShablon2(self.Owner).pFIBDatabase;
    pFIBDataSet_kekv.Transaction := TfrmShablon2(self.Owner).pFIBTransactionRead;
    pFIBDataSet_kekv.Active := false;
    pFIBDataSet_kekv.ParamByName('id_kekv').Value := pFIBDataSet_default_smet.FieldByName('default_kekv').AsInteger;
    pFIBDataSet_kekv.ParamByName('actual_date').Value := Date;
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

    pFIBDataSet_smeta.Database := TfrmShablon2(self.Owner).pFIBDatabase;
    pFIBDataSet_smeta.Transaction := TfrmShablon2(self.Owner).pFIBTransactionRead;
    pFIBDataSet_razd_st.Database := TfrmShablon2(self.Owner).pFIBDatabase;
    pFIBDataSet_razd_st.Transaction := TfrmShablon2(self.Owner).pFIBTransactionRead;
    pFIBDataSet_kekv.Database := TfrmShablon2(self.Owner).pFIBDatabase;
    pFIBDataSet_kekv.Transaction := TfrmShablon2(self.Owner).pFIBTransactionRead;

    pFIBDataSet_kekv.Active := false;
    pFIBDataSet_kekv.ParamByName('id_kekv').Value := pFIBDataSet_default_smet.FieldByName('default_kekv').AsInteger;
    pFIBDataSet_kekv.ParamByName('actual_date').Value := Date;
    pFIBDataSet_kekv.Active := true;

    cxMaskEdit_kekv.Text := pFIBDataSet_kekv.FieldByName('kekv_kode').AsString;
    cxButtonEdit_name_kekv.Text := pFIBDataSet_kekv.FieldByName('kekv_title').AsString;
    def_name_kekv := pFIBDataSet_kekv.FieldByName('kekv_title').AsString;
    def_n_kekv := pFIBDataSet_kekv.FieldByName('kekv_kode').AsInteger;

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

procedure TfrmAddSmetSh2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAddSmetSh2.cxButton_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddSmetSh2.cxButtonEdit_add_smetPropertiesButtonClick(
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
  smet := GlobalSPR.GetSmets(self, TfrmShablon2(Self.Owner).pFIBDatabase.Handle, Date, psmrazdst);
  if VarArrayDimCount(smet) > 0 then
      begin
      if smet[0] <> 0 then
          begin
            id_smet := smet[0];
            id_razd := smet[1];
            id_stat := smet[2];
            name_smet := smet[6];
            name_razd := smet[4];
            name_stat :=smet[5];
            nomer_razd := smet[7];
            nomer_stat := smet[8];
            kod_smet := smet[9];
            cxButtonEdit_name_smet.Text := smet[6];
            cxTextEdit_name_razd.Text := smet[4];
            cxTextEdit_stat.Text := smet[5];
            cxMaskEdit_kod_smeti.Text := smet[9];
            cxMaskEdit_n_razd.Text := smet[7];
            cxMaskEdit_n_stat.Text := smet[8];
            CurrencyEdit_sum_smet.SetFocus;
          end;
       CurrencyEdit_sum_smet.SetFocus;
      end;
    end;
end;


procedure TfrmAddSmetSh2.cxButton_okClick(Sender: TObject);
var
  DataSet: TpFIBDataSet;
  res_val: integer;
begin
     // Проверка на заполнение сметы
  if  Trim(cxButtonEdit_name_smet.Text) = '' then
    begin
      MessageDlg(errTipDogNotSmeta, mtError, [mbOk], 0);
      cxButtonEdit_name_smet.SetFocus;
      Exit;
    end;

  // Проверка на заполнение раздела
  if  Trim(cxTextEdit_name_razd.Text) = '' then
    begin
      MessageDlg(errTipDogNotRazd, mtError, [mbOk], 0);
      cxMaskEdit_n_razd.SetFocus;
      Exit;
    end;

  // Проверка на заполнение статьи
  if  Trim(cxTextEdit_stat.Text) = '' then
    begin
      MessageDlg(errTipDogNotStat, mtError, [mbOk], 0);
      cxMaskEdit_n_stat.SetFocus;
      Exit;
    end;

    // Проверка на заполнение кеква
  if  Trim(cxButtonEdit_name_kekv.Text) = '' then
    begin
      MessageDlg(errTipDogNotKekv, mtError, [mbOk], 0);
      cxMaskEdit_kekv.SetFocus;
      Exit;
    end;

     // Проверка на заполнение суммы
  if  Trim(CurrencyEdit_sum_smet.Text) = '' then
    begin
      MessageDlg(errTipDogNotSumma, mtError, [mbOk], 0);
      CurrencyEdit_sum_smet.SetFocus;
      Exit;
    end;

  // Проверка на отрицательную сумму
  if  CurrencyEdit_sum_smet.Value < 0 then
    begin
      MessageDlg(errTipDogOtrSumma, mtError, [mbOk], 0);
      CurrencyEdit_sum_smet.SetFocus;
      Exit;
    end;

      // проверка: сумма по сметам не должна превышать сумму документа
    sum_add := CurrencyEdit_sum_smet.Text;

    if VarType(p_sum_smet_pod_doc) = varEmpty then
    begin
      p_sum_smet_pod_doc := 0;
    end;

    if  p_sum_documenta < p_sum_smet_pod_doc + sum_add then
    begin
      ShowMessage('сумма по сметам не должна превышать сумму документа');
      CurrencyEdit_sum_smet.Text := FloatToStr(p_sum_documenta - p_sum_smet_pod_doc);
      Exit;
    end
    else
    begin
      sum_temp := p_sum_smet_pod_doc + sum_add;
    end;


  sum_smet := CurrencyEdit_sum_smet.Value;

  {Проверка на совместимость  сметы, раздела, статьи}
    DataSet := TpFIBDataSet.Create(Self);
    DataSet.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
    DataSet.Transaction := TfrmShablon2(Self.Owner).pFIBTransactionRead;
    DataSet.SelectSQL.Text := 'select * from  pub_is_correct_sm_razd_st(:id_smeta,:id_razd,:id_stat,:actual_date)';
    DataSet.ParamByName('id_smeta').Value := id_smet;
    DataSet.ParamByName('id_razd').Value := id_razd;
    DataSet.ParamByName('id_stat').Value := id_stat;
    DataSet.ParamByName('actual_date').Value := Date;
    DataSet.Active := true;
    res_val := DataSet.FieldByName('RESULT_VALUE').AsInteger;
    DataSet.Free;
    if res_val = 0 then
    begin
      ShowMessage('Не корректны параметры бюджетирования.');
      cxButtonEdit_add_smetPropertiesButtonClick(Self,-1);
      Exit;
    end;

  if default_values = 1 then
  begin
    if default_kekv = 1 then
    begin
      lsh2.GetSmeta(def_name_smet,def_name_razd,def_name_st,def_name_kekv, sum_smet
      ,def_id_smet,def_kod_smet,def_n_razd,def_n_st, def_n_kekv, def_id_smet,def_id_razd,def_id_st,
      def_id_kekv);
    end
    else
    begin
      lsh2.GetSmeta(def_name_smet,def_name_razd,def_name_st,name_kekv, sum_smet
      ,def_id_smet,def_kod_smet,def_n_razd,def_n_st, kod_kekv, def_id_smet,def_id_razd,def_id_st,
      id_kekv);
    end;
  end
  else
  begin
    if default_kekv = 1 then
    begin
      lsh2.GetSmeta(name_smet,name_razd,name_stat,def_name_kekv, sum_smet
      ,id_smet,kod_smet,nomer_razd,nomer_stat, def_n_kekv, id_smet,id_razd,id_stat,
      def_id_kekv);
    end
    else
    begin
      lsh2.GetSmeta(name_smet,name_razd,name_stat,name_kekv, sum_smet
      ,id_smet,kod_smet,nomer_razd,nomer_stat, kod_kekv, id_smet,id_razd,id_stat,
      id_kekv);
    end;
  end;
  Close;
end;

procedure TfrmAddSmetSh2.FormCreate(Sender: TObject);
begin
// Интерфейс
  GroupBox1.Caption        := rsh_Smeta;
  Label3.Caption           := rsh_Kod_smeta;
  Label5.Caption           := rsh_N_razd;
  Label7.Caption           := rsh_N_stat;
  Label1.Caption           := rsh_Name_smeta;
  Label4.Caption           := rsh_Name_razd;
  Label6.Caption           := rsh_Name_stat;
  Label2.Caption           := rsh_Summa;
  Label8.Caption           := rsh_N_kekv;
  Label9.Caption           := rsh_Name_kekv;
end;

function TfrmAddSmetSh2.ProverkaSum(sum_documenta, sum_smet_pod_doc: Variant): Variant;
begin

  p_sum_documenta := sum_documenta;
  p_sum_smet_pod_doc := sum_smet_pod_doc;

  If sum_add < 0 then sum_add := 0;
//  p_sum_smet_pod_doc:=sum_add+sum_temp;

end;

procedure TfrmAddSmetSh2.cxButtonEdit_name_kekvPropertiesButtonClick(
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
  res := GlobalSPR.GetKEKVSpr(self, TfrmShablon2(Self.Owner).pFIBDatabase.Handle, fsNormal, Date, 1);
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

//смета по коду
procedure TfrmAddSmetSh2.cxMaskEdit_kod_smetiExit(Sender: TObject);
begin
if  trim(cxMaskEdit_kod_smeti.Text) <> '' then
 begin
  pFIBStoredProc.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
  pFIBTransactionWrite.DefaultDatabase := TfrmShablon2(Self.Owner).pFIBDatabase;
  pFIBTransactionWrite.StartTransaction;
  pFIBStoredProc.StoredProcName := 'PUB_GET_NAME_BUDG_BY_KOD';
  pFIBStoredProc.Prepare;
  pFIBStoredProc.ParamByName('NUM_OBJECT').Value := cxMaskEdit_kod_smeti.Text;
  pFIBStoredProc.ParamByName('ACTUAL_DATE').Value := Date;
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
//раздел по коду
procedure TfrmAddSmetSh2.cxMaskEdit_n_razdExit(Sender: TObject);
var
  new_razd, old_razd: Integer;
begin
if Trim(cxMaskEdit_n_razd.Text) <> '' then
 begin
 //если меняется раздел, то меняется и статья
  new_razd := StrToInt(cxMaskEdit_n_razd.Text);
  if new_razd=old_razd then Exit else cxMaskEdit_n_statExit(Self);
  pFIBStoredProc.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
  pFIBStoredProc.Transaction := pFIBTransactionWrite;
  pFIBTransactionWrite.DefaultDatabase := TfrmShablon2(Self.Owner).pFIBDatabase;
  pFIBTransactionWrite.StartTransaction;
  pFIBStoredProc.StoredProcName := 'PUB_GET_NAME_BUDG_BY_KOD';
  pFIBStoredProc.Prepare;
  pFIBStoredProc.ParamByName('NUM_OBJECT').Value := cxMaskEdit_n_razd.Text;
  pFIBStoredProc.ParamByName('ACTUAL_DATE').Value := Date;
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

//статья по коду
procedure TfrmAddSmetSh2.cxMaskEdit_n_statExit(Sender: TObject);
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
  pFIBDataSet_stat.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
  pFIBDataSet_stat.Transaction := TfrmShablon2(self.Owner).pFIBTransactionRead;
  pFIBDataSet_stat.Active := false;
  pFIBDataSet_stat.ParamByName('num_st').Value := cxMaskEdit_n_stat.Text;
  pFIBDataSet_stat.ParamByName('actual_date').Value := Date;
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

procedure TfrmAddSmetSh2.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  id_stat := pFIBDataSet_stat.FieldByName('id_object').AsInteger;
  cxTextEdit_stat.Text := pFIBDataSet_stat.FieldByName('title_object').AsString;
  nomer_stat := StrToInt(cxMaskEdit_n_stat.Text);
  name_stat := pFIBDataSet_stat.FieldByName('title_object').AsString;
end;

procedure TfrmAddSmetSh2.FormShow(Sender: TObject);
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
end;

procedure TfrmAddSmetSh2.CurrencyEdit_sum_smetKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in ['0'..'9',',','.'])  and (key <> #8)
  then    key := #0;
end;

procedure TfrmAddSmetSh2.cxMaskEdit_kekvExit(Sender: TObject);
begin
if Trim(cxMaskEdit_kekv.Text) <> '' then
 begin
  if pFIBTransactionWrite.Active=true then pFIBTransactionWrite.Rollback;
  pFIBStoredProc.Database := TfrmShablon2(Self.Owner).pFIBDatabase;
  pFIBTransactionWrite.DefaultDatabase := TfrmShablon2(Self.Owner).pFIBDatabase;
  pFIBTransactionWrite.StartTransaction;
  pFIBStoredProc.StoredProcName := 'PUB_SPR_KEKV_INFO_EX2';
  pFIBStoredProc.Prepare;
  pFIBStoredProc.ParamByName('NUM_KEKV').Value := cxMaskEdit_kekv.Text;
  pFIBStoredProc.ParamByName('ACTUAL_DATE').Value := Date;
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

procedure TfrmAddSmetSh2.cxMaskEdit_kod_smetiKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    cxMaskEdit_kod_smetiExit(Self);
    cxMaskEdit_n_razd.SetFocus;
  end;
end;

procedure TfrmAddSmetSh2.cxMaskEdit_n_razdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    cxMaskEdit_n_razdExit(Self);
    cxMaskEdit_n_stat.SetFocus;
  end;
end;

procedure TfrmAddSmetSh2.cxMaskEdit_n_statKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    cxMaskEdit_n_statExit(Self);
    cxMaskEdit_kekv.SetFocus;
  end;
end;

procedure TfrmAddSmetSh2.cxMaskEdit_kekvKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    cxMaskEdit_kekvExit(Self);
    CurrencyEdit_sum_smet.SetFocus;
  end;
end;

procedure TfrmAddSmetSh2.CurrencyEdit_sum_smetKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = VK_RETURN then cxButton_ok.SetFocus;
end;

end.
