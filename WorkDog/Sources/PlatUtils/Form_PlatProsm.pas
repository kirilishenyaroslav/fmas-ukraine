unit Form_PlatProsm;
                                            
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, iBase, FIBDatabase, pFIBDatabase, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxMaskEdit, cxButtonEdit, DB,
  FIBDataSet, pFIBDataSet, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxCurrencyEdit, Mask, ToolEdit, CurrEdit,
  ExtCtrls, cxTL, cxLookAndFeelPainters, cxButtons, cxMemo, RxMemDS, LoadDogManedger,
  dogLangPackUnit2, pFIBStoredProc, Kernel, FIBQuery,
  pFIBQuery, Halcn6db, dogLoaderUnit, cxDropDownEdit, cxCalendar;

type
  TfrmPlatProsm = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label_n_pl: TLabel;
    Label1: TLabel;
    Label27: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    Panel2: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label25: TLabel;
    Label13: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn_smeta: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxButton1: TcxButton;
    CurrencyEdit_nds: TCurrencyEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label24: TLabel;
    cxTextEdit_mfo_p: TcxTextEdit;
    cxTextEdit_rsch_p: TcxTextEdit;
    cxTextEdit_bank_p: TcxTextEdit;
    cxTextEdit_name_k: TcxTextEdit;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    cxTextEdit_mfo_un: TcxTextEdit;
    cxTextEdit_rsch_un: TcxTextEdit;
    cxTextEdit_bank_un: TcxTextEdit;
    cxTextEdit_name_n: TcxTextEdit;
    cxMemo_dog_note: TcxMemo;
    cxButton_cancel: TcxButton;
    cxButton_ok: TcxButton;
    cxTextEdit_reg_n: TcxTextEdit;
    cxTextEdit_n_pl: TcxMaskEdit;
    pFIBDatabase: TpFIBDatabase;
    pFIBDataSet_pl_doc: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBDataSet_smeta: TpFIBDataSet;
    pFIBDataSet_razd_st: TpFIBDataSet;
    RxMemoryData_smet: TRxMemoryData;
    DataSource_smet: TDataSource;
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
    pFIBDataSet_smet_info: TpFIBDataSet;
    pFIBDataSet_kekv: TpFIBDataSet;
    pFIBStoredProc1: TpFIBStoredProc;
    HalcyonDataSet1: THalcyonDataSet;
    Label26: TLabel;
    cxTextEdit_otd: TcxTextEdit;
    cxTextEdit_d_dog: TcxDateEdit;
    pFIBStoredProc2: TpFIBStoredProc;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxMemoryData_smetAfterScroll(DataSet: TDataSet);
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton_okClick(Sender: TObject);
    procedure cxTextEdit_n_plKeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
  private
  fProc : TResProc;
    { Private declarations }
  public
  constructor Create (Aowner:TComponent;DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_key :Variant; Pr_vizova: String); overload;

    { Public declarations }
  end;

function PlatProsm(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_key: Variant; Pr_vizova: String; proc : TResProc):Variant;stdcall;
exports PlatProsm;

var
  frmPlatProsm: TfrmPlatProsm;
  p_id_key: Variant;
  pr_v: String;
  pFIBTransaction_lock: TpFIBTransaction;

implementation

{$R *.dfm}

constructor TfrmPlatProsm.Create (Aowner:TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle; id_key :Variant; Pr_vizova: String);
var
  i :Integer;
  Dataset_people : TpFIBDataSet;
  fio, s: String;
  RecInfo: RECORD_INFO_STRUCTURE;
  ResultInfo: RESULT_STRUCTURE;
  StoredProc : TpFIBStoredProc;
  WriteTrans : TpFIBTransaction;
  id_pbkey:Integer;
begin
    inherited Create (Aowner);
    p_id_key := id_key;
    pr_v := pr_vizova;
    pFIBDatabase.Handle := DBHANDLE;
    pFIBDataSet_pl_doc.Database := pFIBDatabase;
    pFIBDataSet_pl_doc.Transaction := pFIBTransactionRead;
    pFIBDataSet_pl_doc.Active := false;

    pFIBDataSet_smeta.Database := pFIBDatabase;
    pFIBDataSet_smeta.Transaction := pFIBTransactionRead;
    pFIBDataSet_smeta.Active := false;
    pFIBDataSet_smeta.Active := true;

    pFIBDataSet_razd_st.Database := pFIBDatabase;
    pFIBDataSet_razd_st.Transaction := pFIBTransactionRead;
    pFIBDataSet_razd_st.Active := false;
    pFIBDataSet_razd_st.Active := true;

    pFIBDataSet_smet_info.Database := pFIBDatabase;
    pFIBDataSet_smet_info.Transaction := pFIBTransactionRead;

    pFIBDataSet_kekv.Database := pFIBDatabase;
    pFIBDataSet_kekv.Transaction := pFIBTransactionRead;


    pFIBDataSet_pl_doc.ParamByName('d_id_key').Value := id_key;
    pFIBDataSet_pl_doc.Active := true;
    cxTextEdit_n_pl.Text     := pFIBDataSet_pl_doc.FieldByName('v_num_doc').AsString;
    cxTextEdit_d_dog.Date    := pFIBDataSet_pl_doc.FieldByName('V_EXPORT_DATE').AsDateTime;

    cxTextEdit_otd.Text      := pFIBDataSet_pl_doc.FieldByName('V_OTDEL_NAME_FULL').AsString;
    cxTextEdit_bank_p.Text   := pFIBDataSet_pl_doc.FieldByName('v_bank_name_k').AsString;
    cxTextEdit_mfo_p.Text    := pFIBDataSet_pl_doc.FieldByName('v_mfo_k').AsString;
    cxTextEdit_rsch_p.Text   := pFIBDataSet_pl_doc.FieldByName('v_rsch_k').AsString;
    cxTextEdit_name_k.Text   := pFIBDataSet_pl_doc.FieldByName('V_NAME_CUSTOMER_K').AsString; 
    cxTextEdit_name_n.Text   := pFIBDataSet_pl_doc.FieldByName('v_name_customer_n').AsString;
    cxTextEdit_bank_un.Text  := pFIBDataSet_pl_doc.FieldByName('v_bank_name_n').AsString;
    cxTextEdit_mfo_un.Text   := pFIBDataSet_pl_doc.FieldByName('v_mfo_n').AsString;
    cxTextEdit_rsch_un.Text  := pFIBDataSet_pl_doc.FieldByName('v_rsch_n').AsString;
    cxMemo_dog_note.Text     := pFIBDataSet_pl_doc.FieldByName('v_note').AsString;
    CurrencyEdit_nds.Text    := pFIBDataSet_pl_doc.FieldByName('v_nds_sum').AsVariant;
    cxTextEdit_reg_n.Text    := pFIBDataSet_pl_doc.FieldByName('v_regest_num').AsString;
  //данные по сметам
        pFIBDataSet_smet_info.Active := false;
        pFIBDataSet_smet_info.ParamByName('param_id_key').Value := id_key;
        pFIBDataSet_smet_info.Active := true;
        pFIBDataSet_smet_info.FetchAll;
        pFIBDataSet_smet_info.First;
        for i := 0 to pFIBDataSet_smet_info.RecordCount-1 do
        begin
          pFIBDataSet_smeta.Active := false;
          pFIBDataSet_smeta.ParamByName('id_smeta').Value := pFIBDataSet_smet_info.FieldByName('id_smeta').AsVariant;
          pFIBDataSet_smeta.Active := true;

          RxMemoryData_smet.Open;
          RxMemoryData_smet.Insert;

          pFIBDataSet_kekv.Active := false;
          pFIBDataSet_kekv.ParamByName('id_kekv').Value := pFIBDataSet_smet_info.FieldByName('id_kekv').AsInteger;
          pFIBDataSet_kekv.ParamByName('actual_date').Value := Date;
          pFIBDataSet_kekv.Active := true;

          RxMemoryData_smet.FieldByName('name_kekv').Value := pFIBDataSet_kekv.FieldByName('KEKV_TITLE').AsString;
          RxMemoryData_smet.FieldByName('kod_kekv').Value := pFIBDataSet_kekv.FieldByName('KEKV_KODE').AsInteger;;

          pFIBDataSet_razd_st.Active := false;
          pFIBDataSet_razd_st.ParamByName('id_razd_st_in').Value := pFIBDataSet_smet_info.FieldByName('id_razd').AsVariant;
          pFIBDataSet_razd_st.Active := true;

          RxMemoryData_smet.FieldByName('name_smet').Value := pFIBDataSet_smeta.FieldByName('SMETA_TITLE').AsVariant;
          RxMemoryData_smet.FieldByName('kod_smety').Value := pFIBDataSet_smeta.FieldByName('SMETA_KOD').AsVariant;
          RxMemoryData_smet.FieldByName('n_razd').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_NUM').AsVariant;
          RxMemoryData_smet.FieldByName('name_razd').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_TITLE').AsVariant;

          pFIBDataSet_razd_st.Active := false;
          pFIBDataSet_razd_st.ParamByName('id_razd_st_in').Value := pFIBDataSet_smet_info.FieldByName('id_stat').AsVariant;
          pFIBDataSet_razd_st.Active := true;

          RxMemoryData_smet.FieldByName('name_stat').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_TITLE').AsVariant;
          RxMemoryData_smet.FieldByName('n_stat').Value := pFIBDataSet_razd_st.FieldByName('RAZD_ST_NUM').AsVariant;
          RxMemoryData_smet.FieldByName('sum_smet').Value := pFIBDataSet_smet_info.FieldByName('summa').AsVariant;


          if (pFIBDataSet_smet_info.FieldByName('id_people').AsVariant > 0) then
          begin
            //DataSet для  справочника людей
            Dataset_people := TpFIBDataSet.Create(Self);
            Dataset_people.Database := pFIBDatabase;
            Dataset_people.Transaction := pFIBTransactionRead;
            s := 'SELECT FAMILIA || '' '' || IMYA || '' '' || OTCHESTVO AS FIO FROM People WHERE  People.id_man='+VarToStr(pFIBDataSet_smet_info.FieldByName('id_people').AsVariant);
            Dataset_people.SelectSQL.Add(s);
            Dataset_people.Active := true;
            fio := Dataset_people.FieldByName('fio').AsString;
            Dataset_people.Free;
            Label4.Caption := fio;
            RxMemoryData_smet.FieldByName('fio_people').Value := fio;
          end
          else
          begin
            Label2.Caption := '';
            Label4.Caption := '';
          end;

          RxMemoryData_smet.Post;
          pFIBDataSet_smet_info.Next;
        end;

  if Pr_vizova = 'prosmotr' then
  begin
   cxTextEdit_d_dog.Style.Color:=$00D9EBE0;
  end;


  if Pr_vizova = 'red' then
  begin
    WriteTrans := TpFIBTransaction.Create(Self);
    WriteTrans.DefaultDatabase := pFIBDatabase;

    StoredProc := TpFIBStoredProc.Create(Self);
    StoredProc.Database := pFIBDatabase;
    StoredProc.Transaction := WriteTrans;
    WriteTrans.StartTransaction;
    StoredProc.StoredProcName := 'DOG_CHECK_PL_IN_KB';
    StoredProc.Prepare;
    StoredProc.ParamByName('id_key').Value    := id_key;
    try
      StoredProc.ExecProc;
    except
      WriteTrans.Rollback;
      Exit;
    end;
    id_pbkey  := StoredProc.FieldByName('id_pbkey').AsVariant;

    if ((id_pbkey = -1) or (id_pbkey = -2)) then
    begin
     cxTextEdit_d_dog.Properties.ReadOnly := false;
     cxTextEdit_d_dog.Style.Color:=clMoneyGreen;
    end else
    begin
     cxTextEdit_d_dog.Properties.ReadOnly := true;
     cxTextEdit_d_dog.Style.Color:=$00D9EBE0;
    end;
    WriteTrans.Commit;
    Caption := 'Редагування платіжного доручення';
    cxMemo_dog_note.Properties.ReadOnly := false;
    cxTextEdit_n_pl.Properties.ReadOnly := false;

    // Добавлена проверка на наличие платёжного поручения в Клиент банке

    //блокировка записи при изменении
{   try
     pFIBTransaction_lock := TpFIBTransaction.Create(Self);

     pFIBStoredProc1.Database := pFIBDatabase;
     pFIBTransaction_lock.DefaultDatabase := pFIBDatabase;

     pFIBStoredProc1.Transaction:=pFIBTransaction_lock;
     pFIBTransaction_lock.StartTransaction;

     RecInfo.TRHANDLE       :=pFIBTransaction_lock.Handle;
     RecInfo.DBHANDLE       :=pFIBDatabase.Handle;
     RecInfo.ID_RECORD      :=VarArrayOf([id_key]);
     RecInfo.PK_FIELD_NAME  :=VarArrayOf(['ID_KEY']);
     RecInfo.TABLE_NAME     :='DOG_DT_PL_DOC';
     RecInfo.RAISE_FLAG     :=True;
     LockRecord(@RecInfo);
     except on e:exception do
       begin
         MessageBox(self.Handle,PChar(e.Message),'Помилка',MB_OK+MB_ICONERROR);
         pFIBTransaction_lock.Rollback;
         Exit;
       end;
     end;
}
     end;
end;


function PlatProsm(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle; id_key: Variant; Pr_vizova: String; proc : TResProc):Variant;
var
  PlProsm: TfrmPlatProsm;
begin
  PlProsm := TfrmPlatProsm.Create(AOwner, DBHANDLE, frmStyle, id_key, Pr_vizova);
  PlProsm.fproc := proc;
end;

procedure TfrmPlatProsm.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPlatProsm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPlatProsm.RxMemoryData_smetAfterScroll(DataSet: TDataSet);
begin
  Label21.Caption := RxMemoryData_smet.FieldByName('name_smet').AsString;
  Label22.Caption := RxMemoryData_smet.FieldByName('name_razd').AsString;
  Label23.Caption := RxMemoryData_smet.FieldByName('name_stat').AsString;
  Label4.Caption := RxMemoryData_smet.FieldByName('fio_people').AsString;
  Label21.Hint := RxMemoryData_smet.FieldByName('name_smet').AsString;
  Label25.Caption := RxMemoryData_smet.FieldByName('name_kekv').AsString;
  Label21.ShowHint := true;
  Label22.Hint := RxMemoryData_smet.FieldByName('name_razd').AsString;
  Label22.ShowHint := true;
  Label23.Hint := RxMemoryData_smet.FieldByName('name_stat').AsString;
  Label23.ShowHint := true;
  Label4.Hint := RxMemoryData_smet.FieldByName('fio_people').AsString;
  Label4.ShowHint := true;
  Label25.Hint := RxMemoryData_smet.FieldByName('name_kekv').AsString;
  Label25.ShowHint := true;
end;

procedure TfrmPlatProsm.cxButton_cancelClick(Sender: TObject);
begin
  if Assigned(fProc) then fProc(-1, raClose);
  Close;
end;

procedure TfrmPlatProsm.cxButton1Click(Sender: TObject);
begin
  LoadDogManedger.LoadShablon(self, pFIBDatabase.Handle, fsNormal, pFIBDataSet_pl_doc.FieldByName('ID_DOG').AsVariant, 'prosmotr', pFIBDataSet_pl_doc.FieldByName('id_tip_dog').AsVariant, PChar(pFIBDataSet_pl_doc.FieldByName('name_shablon').asString), nil);
end;

procedure TfrmPlatProsm.FormCreate(Sender: TObject);
begin
 //Интерфейс
{  Label3.Caption                            := rsh_Vid;
  cxGrid1DBTableView1DBColumn_smeta.Caption := rsh_Smeta;
  cxGrid1DBTableView1DBColumn4.Caption      := rsh_Razd;
  cxGrid1DBTableView1DBColumn5.Caption      := rsh_Stat;
  cxGrid1DBTableView1DBColumn2.Caption      := rsh_Summa;
  cxGrid1DBTableView1DBColumn3.Caption      := rsh_Kekv;
  Label18.Caption                           := rsh_Smeta;
  Label19.Caption                           := rsh_Razd;
  Label20.Caption                           := rsh_Stat;
  Label1.Caption                            := rsh_Nds;
  GroupBox3.Caption                         := rsh_Zvidki;
  Label24.Caption                           := rsh_Name_cust;
  Label6.Caption                            := rsh_MFO;
  Label7.Caption                            := rsh_RateAcc;
  Label8.Caption                            := rsh_Bank;
  Label9.Caption                            := rsh_MFO;
  Label10.Caption                           := rsh_RateAcc;
  Label11.Caption                           := rsh_Bank;
  Label2.Caption                            := rsh_fiz_osoba;
  Label27.Caption                           := rsh_Note_pl;
  Label3.Caption                            := rsh_Date_pl;
  Label_n_pl.Caption                        := rsh_Number_pl;
  cxButton1.Caption                         := rsh_Dogovor;
  Label13.Caption                           := rsh_Kekv;
}

  if (pFIBDataSet_smet_info.FieldByName('id_people').AsVariant = -1) then
  begin
    Label2.Caption := '';
    Label4.Caption := '';
  end;
end;

procedure TfrmPlatProsm.cxButton_okClick(Sender: TObject);
var
  StoredProc : TpFIBStoredProc;
  WriteTrans : TpFIBTransaction;
  ms1,ms2    : Integer;
  prog_save  : String;
  id_pbkey   : Integer;
  path       : String;
  action     : TResAction;
begin
 action := raEdit;

ms1 := 1;
ms2 := 1;

if (pr_v = 'red') then
  begin
    WriteTrans := TpFIBTransaction.Create(Self);
    WriteTrans.DefaultDatabase := pFIBDatabase;

    StoredProc := TpFIBStoredProc.Create(Self);
    StoredProc.Database := pFIBDatabase;
    StoredProc.Transaction := WriteTrans;
    WriteTrans.StartTransaction;
    StoredProc.StoredProcName := 'DOG_DT_UPDATE_NOTE_PL';
    StoredProc.Prepare;
    StoredProc.ParamByName('id_key').Value    := p_id_key;
    StoredProc.ParamByName('note_pl').Value   := cxMemo_dog_note.Text;
    StoredProc.ParamByName('num_pl').Value    := StrToInt(cxTextEdit_n_pl.Text);
    StoredProc.ParamByName('ip_comp').Value   := GetIPAddress;
    StoredProc.ParamByName('id_user').Value   := SYS_ID_USER;
    StoredProc.ParamByName('name_comp').Value := GetCompName;
    StoredProc.ParamByName('DATE_PL').Value := cxTextEdit_d_dog.Date; 
    try
      StoredProc.ExecProc;
    except
      WriteTrans.Rollback;
      Exit;
    end;

    id_pbkey  := StoredProc.FieldByName('id_pbkey').AsVariant;
    prog_save := StoredProc.FieldByName('prog_save').AsString;
    path      := StoredProc.FieldByName('path').AsString;

    if (id_pbkey = -2) then ms1 := -1;

    if (id_pbkey > 0) then
    begin
      // если это платежка в клиен-банке, то нужно изменить в дбф
      HalcyonDataSet1.Close;
      HalcyonDataSet1.DatabaseName := ExtractFilePath(path);
      HalcyonDataSet1.TableName := ExtractFileName(path);
      try
       HalcyonDataSet1.Open;
      except on e:Exception do
       begin
        ShowMessage(e.Message);
        Exit;
        end;
      end;

      while not HalcyonDataSet1.Eof do begin
        if not VarIsNull(id_pbkey) then
        if HalcyonDataSet1['ID_PBKEY'] = id_pbkey then
        begin
          HalcyonDataSet1.Edit;

          if (prog_save = 'SaveEximbank') then
          HalcyonDataSet1.FieldValues['DIRECT'] := cxMemo_dog_note.Text;

          if (prog_save = 'SaveFUIB') then
          HalcyonDataSet1.FieldValues['DETAILS'] := cxMemo_dog_note.Text;

          if (prog_save = 'SaveImport') then
          HalcyonDataSet1.FieldValues['N_P'] := cxMemo_dog_note.Text;

          HalcyonDataSet1.post;
          ms2 := 1;
          break;
        end;
        HalcyonDataSet1.Next;
       end;
    end;
    WriteTrans.Commit;
//    pFIBTransaction_lock.Commit;
//    pFIBTransaction_lock.Free;
    Close;
  end
  else
  begin
    Close;
  end;
  if ((ms1 = -1) or (ms2 = -1)) then ShowMessage('Платіжне доручення не найдено в буфері.');
  if Assigned(fProc) then fProc(p_id_key, action);
end;


procedure TfrmPlatProsm.cxTextEdit_n_plKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in ['0'..'9']) and (key<>#8)
  then    key:=#0;
end;

procedure TfrmPlatProsm.FormResize(Sender: TObject);
begin
  Panel1.Left := Width div 2 - Panel1.Width div 2 - 6;
  Panel1.Top := Height div 2 - Panel1.Height div 2 - 18;
end;

end.

