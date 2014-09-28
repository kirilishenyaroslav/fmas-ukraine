unit Add_smet_sh6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, Mask, ToolEdit, CurrEdit,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, ExtCtrls, GlobalSPR, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, LoadDogManedger,
  dogLangPackUnit2, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxDBData, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxDropDownEdit, ibase;

const
    errTipDogNotSumma = 'Введіть суму!';
    errTipDogOtrSumma = 'Сума не може бути від''ємною!';
    errTipDogNotSmeta = 'Виберіть кошторис!';
    errTipDogNotPeople = 'Виберіть фізичну особу!';
    errTipDogNotKekv = 'Виберіть КЕКВ!';
    errTipDogNotRazd = 'Виберіть розділ!';
    errTipDogNotStat = 'Виберіть статтю!';

type
  TfrmAddSmetSh6 = class(TForm)
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
    pFIBStoredProc: TpFIBStoredProc;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSet_default_smet: TpFIBDataSet;
    pFIBDataSet_razd_st: TpFIBDataSet;
    pFIBDataSet_smeta: TpFIBDataSet;
    cxButtonEdit_people: TcxButtonEdit;
    Label8: TLabel;
    Label9: TLabel;
    cxMaskEdit_kekv: TcxMaskEdit;
    Label10: TLabel;
    cxButtonEdit_name_kekv: TcxButtonEdit;
    pFIBDataSet_kekv: TpFIBDataSet;
    pFIBDataSet_stat: TpFIBDataSet;
    cxTextEdit_stat: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButtonEdit_add_smetPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton_okClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxMaskEdit_kod_smetiExit(Sender: TObject);
    procedure cxMaskEdit_n_razdExit(Sender: TObject);
    procedure cxMaskEdit_n_statExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButtonEdit_peoplePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit_name_kekvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
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
    procedure CurrencyEdit_sum_smetKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  public
    ID_DOG_BANKCARD : int64;

    function ProverkaSum(sum_documenta, sum_smet_pod_doc: Variant; Vizov: String): Variant;

    constructor Create(Aowner:TComponent;id_smet, id_razd, id_stat: Variant;
                       name_smet, name_razd, name_stat: String; kod_smet, n_razd, n_stat: Variant;
                       Flag:Boolean; sum_sm: Variant); 
    { Public declarations }
  end;

var
  // переменные по смете
  id_smet, id_razd, id_stat: Variant;
  name_smet, name_razd, name_stat: String;
  nomer_razd, nomer_stat, kod_smet: Integer;
  sum_smet: Variant;
  Flag_edit: Boolean;
  default_values: Integer;
  default_kekv: Integer;
  def_name_smet, def_name_razd, def_name_st, def_name_kekv : String;
  def_kod_smet, def_n_razd, def_n_st, def_n_kekv : Integer;
  def_id_smet, def_id_razd, def_id_st, def_id_kekv : Variant;
  //переменные по физ. лицу
  id_people: Variant;

  name_people, otch, fam, fio: String;

  id_kekv: Variant; //Идентификатор кеква
  kod_kekv: Integer;
  name_kekv: String;
  //проверка сумм
  p_sum_documenta, p_sum_smet_pod_doc: Double;
  vizov_sh1: String;
  stat_old: Integer;

var
  frmAddSmetSh6: TfrmAddSmetSh6;

implementation
 uses
 Shablon6;

{$R *.dfm}

constructor TfrmAddSmetSh6.Create(Aowner:TComponent;id_smet, id_razd, id_stat: Variant;
name_smet, name_razd, name_stat: String; kod_smet, n_razd, n_stat: Variant; Flag:Boolean; sum_sm: Variant);
begin
  //Для Днепродзержинска//
  inherited Create (Aowner);
  pFIBDataSet_default_smet.Database := TfrmShablon6(self.Owner).pFIBDatabase;
  pFIBDataSet_default_smet.Transaction := TfrmShablon6(self.Owner).pFIBTransactionRead;
  pFIBDataSet_default_smet.Active := false;
  pFIBDataSet_default_smet.Active := true;

  default_kekv := pFIBDataSet_default_smet.FieldByName('USE_DEFAULT_KEKV').AsInteger;
  default_values := pFIBDataSet_default_smet.FieldByName('use_default_values').AsInteger;

  //кекв по умолчанию
  if pFIBDataSet_default_smet.FieldByName('USE_DEFAULT_KEKV').Value = 1 then
  begin
    def_id_kekv    := pFIBDataSet_default_smet.FieldByName('DEFAULT_KEKV').AsInteger;
    pFIBDataSet_kekv.Database := TfrmShablon6(self.Owner).pFIBDatabase;
    pFIBDataSet_kekv.Transaction := TfrmShablon6(self.Owner).pFIBTransactionRead;
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
    def_id_razd    :=pFIBDataSet_default_smet.FieldByName('default_razd').AsInteger;
    def_id_st      := pFIBDataSet_default_smet.FieldByName('default_st').AsInteger;

    pFIBDataSet_smeta.Database := TfrmShablon6(self.Owner).pFIBDatabase;
    pFIBDataSet_smeta.Transaction := TfrmShablon6(self.Owner).pFIBTransactionRead;
    pFIBDataSet_razd_st.Database := TfrmShablon6(self.Owner).pFIBDatabase;
    pFIBDataSet_razd_st.Transaction := TfrmShablon6(self.Owner).pFIBTransactionRead;

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

function TfrmAddSmetSh6.ProverkaSum(sum_documenta, sum_smet_pod_doc: Variant; Vizov: String): Variant;
begin
  p_sum_documenta := sum_documenta;
  p_sum_smet_pod_doc := sum_smet_pod_doc;
  vizov_sh1 := Vizov;
end;

procedure TfrmAddSmetSh6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAddSmetSh6.cxButton_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddSmetSh6.cxButtonEdit_add_smetPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  smet: Variant;
begin
// Для выбора из справочника смет...потом активировать
  if default_values = 1 then
  begin
    Exit;
  end
  else
  begin
  smet := GlobalSPR.GetSmets(self, TfrmShablon6(Self.Owner).pFIBDatabase.Handle, Date, psmrazdst);
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
        CurrencyEdit_sum_smet.SetFocus;
      end;
    end;
end;


procedure TfrmAddSmetSh6.cxButton_okClick(Sender: TObject);
var
  sum_add: Variant;
  DataSet: TpFIBDataSet;
  res_val: Integer;
begin

    // Проверка на заполнение физ. лица
  if  Trim(cxButtonEdit_people.Text) = '' then
    begin
      MessageDlg(errTipDogNotPeople, mtError, [mbOk], 0);
      cxButtonEdit_people.SetFocus;
      Exit;
    end;

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
      cxButtonEdit_name_kekv.SetFocus;
      Exit;
    end;

// Проверка на заполнение суммы
  if  Trim(CurrencyEdit_sum_smet.Text) ='' then
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

  //проверка на корректность суммы
{   if vizov_sh1 = 'red' then
   begin
     sum_add := CurrencyEdit_sum_smet.Text;
     if  (p_sum_documenta < p_sum_smet_pod_doc + sum_add) then
     begin
       ShowMessage('Cумма по сметам не должна превышать сумму документа');
       CurrencyEdit_sum_smet.Text := FloatToStr(p_sum_documenta - p_sum_smet_pod_doc);
       Exit;
     end;
   end;
 }
  sum_smet:=CurrencyEdit_sum_smet.Value;

  {Проверка на совместимость  сметы, раздела, статьи}
    DataSet := TpFIBDataSet.Create(Self);
    DataSet.Database := TfrmShablon6(Self.Owner).pFIBDatabase;
    DataSet.Transaction := TfrmShablon6(Self.Owner).pFIBTransactionRead;
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
    TfrmShablon6(Self.Owner).GetSmeta(def_name_smet,def_name_razd,def_name_st,sum_smet
    ,def_id_smet,def_kod_smet,def_n_razd,def_n_st,def_id_smet,def_id_razd,def_id_st,id_people,
    name_people, otch, fam, fio, def_id_kekv, def_n_kekv, def_name_kekv, ID_DOG_BANKCARD);
  end
  else
  begin
    TfrmShablon6(Self.Owner).GetSmeta(def_name_smet,def_name_razd,def_name_st,sum_smet
    ,def_id_smet,def_kod_smet,def_n_razd,def_n_st,def_id_smet,def_id_razd,def_id_st,id_people,
    name_people, otch, fam, fio, id_kekv, kod_kekv, name_kekv, ID_DOG_BANKCARD);
  end;
  end
  else
  begin
  if default_kekv = 1 then
    begin
      TfrmShablon6(Self.Owner).GetSmeta(name_smet,name_razd,name_stat,sum_smet
      ,id_smet,kod_smet,nomer_razd,nomer_stat,id_smet,id_razd,id_stat, id_people,
      name_people, otch, fam, fio, def_id_kekv, def_n_kekv, def_name_kekv, ID_DOG_BANKCARD);
    end
    else
    begin
      TfrmShablon6(Self.Owner).GetSmeta(name_smet,name_razd,name_stat,sum_smet
      ,id_smet,kod_smet,nomer_razd,nomer_stat,id_smet,id_razd,id_stat, id_people,
      name_people, otch, fam, fio, id_kekv, kod_kekv, name_kekv, ID_DOG_BANKCARD);
    end;
  end;
  Close;
end;

procedure TfrmAddSmetSh6.FormCreate(Sender: TObject);
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
  Label8.Caption           := rsh_fiz_osoba;
  Label9.Caption           := rsh_N_kekv;
  Label10.Caption          := rsh_Name_kekv;}
end;



///////////////////Остальное для нашей бухгалтерии, с возможностью выбирать сметы ///////////////////////
//смета по коду
procedure TfrmAddSmetSh6.cxMaskEdit_kod_smetiExit(Sender: TObject);
begin
if  trim(cxMaskEdit_kod_smeti.Text) <> '' then
 begin
  pFIBStoredProc.Database := TfrmShablon6(Self.Owner).pFIBDatabase;
  pFIBStoredProc.Transaction := pFIBTransactionWrite;
  pFIBTransactionWrite.DefaultDatabase := TfrmShablon6(Self.Owner).pFIBDatabase;
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
procedure TfrmAddSmetSh6.cxMaskEdit_n_razdExit(Sender: TObject);
var
  new_razd, old_razd: Integer;
begin
if Trim(cxMaskEdit_n_razd.Text) <> '' then
 begin
 //если меняется раздел, то меняется и статья
  new_razd := StrToInt(cxMaskEdit_n_razd.Text);
  if new_razd=old_razd then Exit else cxMaskEdit_n_statExit(Self);
  pFIBStoredProc.Database := TfrmShablon6(Self.Owner).pFIBDatabase;
  pFIBStoredProc.Transaction := pFIBTransactionWrite;
  pFIBTransactionWrite.DefaultDatabase := TfrmShablon6(Self.Owner).pFIBDatabase;
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
procedure TfrmAddSmetSh6.cxMaskEdit_n_statExit(Sender: TObject);
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
  pFIBDataSet_stat.Database := TfrmShablon6(Self.Owner).pFIBDatabase;
  pFIBDataSet_stat.Transaction := TfrmShablon6(self.Owner).pFIBTransactionRead;
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

procedure TfrmAddSmetSh6.FormShow(Sender: TObject);
begin
  cxButtonEdit_people.SetFocus;
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

function ShowPeoples(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; MultiSelect : Boolean=False; CanEdit : Boolean=False; Id_Man:Integer=-1) : Variant; stdcall;
var
    HandlePack : HModule;
    x : function(A : TComponent; D : TISC_DB_HANDLE; M : Boolean=False; C : Boolean=False; I:Integer=-1) : Variant; stdcall;
begin
    HandlePack := GetModuleHandle('SpAllPeople.bpl');
    if HandlePack < 32 then
    begin
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + 'SpAllPeople.bpl');
    end;

    if HandlePack > 0 then
    begin
      @x := GetProcAddress(HandlePack, PChar('GetManWithDog'));
      if @x<>nil then Result := x(AOwner, DBHANDLE, MultiSelect, CanEdit, Id_Man)
      else begin
        Result := -1;
        MessageBox(TForm(AOwner).Handle, PChar('Неможливо завантажити SpAllPeople.bpl'), PChar('Увага'), MB_OK and MB_ICONWARNING);
      end;
    end else Result := -1;
end;


procedure TfrmAddSmetSh6.cxButtonEdit_peoplePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  SprPeople, resP: Variant;
begin
{  SprPeople := LoadDogManedger.SprPeople(Self, TfrmShablon6(Self.Owner).pFIBDatabase.Handle, false, false, -1);
  if VarArrayDimCount(SprPeople) > 0 then
  begin
    id_people := SprPeople[0];
    fio := SprPeople[1];
    name_people := SprPeople[3];
    otch := SprPeople[4];
    fam := SprPeople[2];
    fio := SprPeople[1];
    cxButtonEdit_people.Text := SprPeople[1];
  end;}

  resP := ShowPeoples(self, TfrmShablon6(Self.Owner).pFIBDatabase.Handle, False, true, id_people);
  if VarArrayDimCount(resP) > 0 then
  begin
    if (resP[0]<>null){ and (res[1]<>null) }then
    begin
      try
        ID_DOG_BANKCARD := resP[11][0];
      except
        ID_DOG_BANKCARD := -1;
        showmessage('У цієї людини не існує банківської картки');
        exit;
      end;
    end;
    id_people                := resP[0];
    cxButtonEdit_people.Text := VarToStr(resP[1]);//укр
    name_people              := VarToStr(resP[3]);
    otch                     := VarToStr(resP[4]);
    fam                      := VarToStr(resP[2]);
    fio                      := VarToStr(resP[1]);
//    name_card                := ' ';
  end;
end;

procedure TfrmAddSmetSh6.cxButtonEdit_name_kekvPropertiesButtonClick(
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
  res := GlobalSPR.GetKEKVSpr(self, TfrmShablon6(Self.Owner).pFIBDatabase.Handle, fsNormal, Date, 1);
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

procedure TfrmAddSmetSh6.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  id_stat := pFIBDataSet_stat.FieldByName('id_object').AsInteger;
  cxTextEdit_stat.Text := pFIBDataSet_stat.FieldByName('title_object').AsString;
  nomer_stat := StrToInt(cxMaskEdit_n_stat.Text);
  name_stat := pFIBDataSet_stat.FieldByName('title_object').AsString;
end;

procedure TfrmAddSmetSh6.CurrencyEdit_sum_smetKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in ['0'..'9',',','.'])  and (key <> #8)
  then    key := #0;
end;

procedure TfrmAddSmetSh6.cxMaskEdit_kekvExit(Sender: TObject);
begin
if Trim(cxMaskEdit_kekv.Text) <> '' then
 begin
  pFIBStoredProc.Database := TfrmShablon6(Self.Owner).pFIBDatabase;
  pFIBStoredProc.Transaction := pFIBTransactionWrite;
  pFIBTransactionWrite.DefaultDatabase := TfrmShablon6(Self.Owner).pFIBDatabase;
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

procedure TfrmAddSmetSh6.cxMaskEdit_kod_smetiKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    cxMaskEdit_kod_smetiExit(Self);
    cxMaskEdit_n_razd.SetFocus;
  end;
end;

procedure TfrmAddSmetSh6.cxMaskEdit_n_razdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    cxMaskEdit_n_razdExit(Self);
    cxMaskEdit_n_stat.SetFocus;
  end;
end;

procedure TfrmAddSmetSh6.cxMaskEdit_n_statKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    cxMaskEdit_n_statExit(Self);
    cxMaskEdit_kekv.SetFocus;
  end;
end;

procedure TfrmAddSmetSh6.cxMaskEdit_kekvKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    cxMaskEdit_kekvExit(Self);
    CurrencyEdit_sum_smet.SetFocus;
  end;  
end;

procedure TfrmAddSmetSh6.CurrencyEdit_sum_smetKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = VK_RETURN then cxButton_ok.SetFocus;
end;

end.
