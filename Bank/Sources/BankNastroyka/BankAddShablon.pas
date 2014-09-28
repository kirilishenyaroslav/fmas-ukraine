unit BankAddShablon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, FIBDatabase, pFIBDatabase, FIBQuery,
  pFIBQuery, pFIBStoredProc, StdCtrls, cxButtons, cxMemo, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, BankNastroikaTranz,
  DB, FIBDataSet, pFIBDataSet, cxLabel, ExtCtrls, Placemnt;

type
  TfmAddMode = (Add , Change);
  TfmBankAddShablon = class(TForm)
    cxButtonEditRSN: TcxButtonEdit;
    cxButtonEditRSK: TcxButtonEdit;
    cxButtonEditSchK: TcxButtonEdit;
    cxButtonEditSm: TcxButtonEdit;
    cxButtonEditKekv: TcxButtonEdit;
    cxButtonEditDog: TcxButtonEdit;
    cxButtonWrite: TcxButton;
    cxButtonCancel: TcxButton;
    pFIBStoredProc1: TpFIBStoredProc;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    pFIBTransactionWrite: TpFIBTransaction;
    Transaction: TpFIBTransaction;
    pFIBTransactionBase: TpFIBTransaction;
    cxTextEditRazd: TcxTextEdit;
    cxTextEditStat: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    FormStorage1: TFormStorage;
    procedure cxButtonEditKekvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditSmPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditRSNPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonCancelClick(Sender: TObject);
    procedure cxButtonEditRSKPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditSchKPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditDogPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonWriteClick(Sender: TObject);
    procedure cxTextEditRazdKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    flag          : TfmAddMode;
    myform        : TfmNasroikaTranz;
   id_kekv, id_state, id_smeta,id_razd,id_acc_nat,id_sch_n,id_acc_cust,id_sch_k, id_shablon, id_dog : int64;
  public
    constructor Create(AOwner: TComponent; db : TpFIBDatabase; mform : TfmNasroikaTranz; m : TfmAddMode); reintroduce; overload;
  end;


 { fmBankAddShablon: TfmBankAddShablon;}

implementation
uses GlobalSPR, Un_R_file_Alex, LoadDogManedger, DogLoaderUnit;

{$R *.dfm}

constructor TfmBankAddShablon.Create(AOwner: TComponent; db : TpFIBDatabase; mform : TfmNasroikaTranz; m : TfmAddMode);
begin
    inherited Create (AOwner);

    flag       := m;
    myform     := mform;

    pFIBDatabase1                        := DB;

    pFIBTransactionBase.DefaultDatabase             := pFIBDatabase1;
    pFIBDatabase1.DefaultTransaction                := pFIBTransactionBase;
    DataSet.Database                                := pFIBDatabase1;
    DataSet.Transaction                             := pFIBTransactionBase;

    pFIBTransaction1.DefaultDatabase                := pFIBDatabase1;

    pFIBTransactionWrite.DefaultDatabase            := pFIBDatabase1;

    pFibStoredProc1.DataBase         := pFIBDatabase1;
    pFibStoredProc1.Transaction      := pFIBTransaction1;

    pFIBTransactionBase.StartTransaction;
    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text := 'select cust.SHORT_NAME as NAME from PUB_SYS_DATA s, PUB_SP_CUSTOMER cust where cust.ID_CUSTOMER = s.ORGANIZATION';
    DataSet.Open;


    cxLabel3.Caption                       := Un_R_file_Alex.BANK_SEL_RS+' '+DataSet.FBN('NAME').AsString;
    cxLabel1.Caption                       := Un_R_file_Alex.BANK_SEL_RS_CUST;
    cxLabel2.Caption                       := Un_R_file_Alex.BANK_SEL_KOR_R;
    cxLabel4.Caption                       := Un_R_file_Alex.BANK_SEL_BUD ;
    cxLabel5.Caption                       := Un_R_file_Alex.KASSA_RAZD;
    cxLabel6.Caption                       := Un_R_file_Alex.KASSA_STAT ;
    cxLabel7.Caption                       := Un_R_file_Alex.BANK_SEL_KEKV;
    cxLabel8.Caption                       := Un_R_file_Alex.BANK_SEL_DOG;

    if m = Add then
    begin
         Caption             := Un_R_file_Alex.BANK_ADD_TRANZ_SCH;
         cxButtonWrite.Caption := Un_R_file_Alex.MY_ACTION_ADD_CONST;

    end;
    if m = change then
    begin
         Caption              := Un_R_file_Alex.BANK_EDIT_TRANZ_SCH;
         cxButtonWrite.Caption  := Un_R_file_Alex.MY_ACTION_UPDATE_CONST;
         cxButtonEditRSN.Text   := myform.DataSetMain.fbn('d_rsch_n').AsString+' '+myform.DataSetMain.fbn('name_rsch').AsString+' '+myform.DataSetMain.fbn('d_name_customer_n').AsString;
         cxButtonEditRSK.Text   := myform.DataSetMain.fbn('d_rsch_k').AsString+' '+myform.DataSetMain.fbn('d_name_customer_k').AsString;
         cxButtonEditSchK.Text  := myform.DataSetMain.fbn('kod_sch_default').AsString+' '+myform.DataSetMain.fbn('title_sch_default').AsString;
         cxButtonEditSm.Text    := myform.DataSetMain.fbn('sm_kod').AsString+' '+myform.DataSetMain.fbn('sm_title').AsString;
         cxTextEditRazd.Text    := myform.DataSetMain.fbn('raz_kod').AsString+' '+myform.DataSetMain.fbn('raz_title').AsString;
         cxTextEditStat.Text    := myform.DataSetMain.fbn('st_kod').AsString+' '+myform.DataSetMain.fbn('st_title').AsString;
         cxButtonEditKekv.Text  := myform.DataSetMain.fbn('kekv_kod').AsString+' '+myform.DataSetMain.fbn('kekv_title').AsString;
         cxButtonEditDog.text   := Un_R_file_Alex.BANK_NASTROYKA_VID  + myform.DataSetMain.fbn('d_dog_sh2').AsString + ' ' + myform.DataSetMain.fbn('reg_num_sh2').AsString;
         id_kekv  := myform.DataSetMain.fbn('id_kekv').AsInteger;
         id_state  := myform.DataSetMain.fbn('id_stat').AsInteger;
         id_smeta  := myform.DataSetMain.fbn('id_sm').AsInteger;
         id_razd   := myform.DataSetMain.fbn('id_razd').AsInteger;
         id_acc_nat := myform.DataSetMainID_ACC_A.AsInt64;
         id_acc_cust := myform.DataSetMainID_ACC_B.AsInt64;
         id_sch_k    := myform.DataSetMain.fbn('id_sch_b').AsInteger;
         id_shablon    := myform.DataSetMain.fbn('id_shablon').AsInteger;
         id_dog    := myform.DataSetMainID_DOG.AsInt64;
        // comment_shablon    := myform.DataSetMain.fbn('comment_shablon').AsString;

    end;
end;

procedure TfmBankAddShablon.cxButtonEditKekvPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : variant;
begin
    res := GlobalSPR.GetKEKVSpr(self, pFIBDatabase1.Handle, fsNormal, date, 1);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][0]<>null) and (res[0][1]<>null) then
        begin
            id_kekv             := res[0][0];
            cxButtonEditKEKV.Text  := VarToStr(res[0][2]) + ' ' +VarToStr(res[0][1]);
        end;
    end;
end;

procedure TfmBankAddShablon.cxButtonEditSmPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    ResSM : Variant;
begin
    ResSM := GlobalSPR.GetSmets(nil, pFIBDatabase1.Handle, Date, psmRazdSt);
    if VarArrayDimCount(ResSM) > 0 then
    begin
        if ResSM[0] <> 0 then
        begin
            id_smeta           := resSM[0];
            id_razd            := resSM[1];
            id_state           := resSM[2];
            cxButtonEditSm.Text := VarToStr(resSM[9]) + ' ' + VarToStr(resSM[6]);
            cxTextEditRazd.Text := VarToStr(resSM[7]) + ' ' + VarToStr(resSM[4]);
            cxTextEditStat.Text := VarToStr(resSM[8]) + ' ' + VarToStr(resSM[5]);
        end;
    end;
end;

procedure TfmBankAddShablon.cxButtonEditRSNPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    ret : Variant;
begin
  ret := LoadDogManedger.WorkSpMfoRsch(self, pFIBDatabase1.Handle, fsNormal, 'spr', -1);
  if VarArrayDimCount(ret) > 0 then
  begin
    if ret[0][0] > 0 then
    begin
      id_acc_nat := ret[0][0];
      cxButtonEditRSN.Text := ret[0][3]+' '+ret[0][10]+' '+ret[0][1];
    end;
  end;
end;

procedure TfmBankAddShablon.cxButtonCancelClick(Sender: TObject);
begin
    close
end;

procedure TfmBankAddShablon.cxButtonEditRSKPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  i, o : TSpravParams;
begin
    i := TSpravParams.Create;
    o := TSpravParams.Create;
    i['DataBase']     := Integer(pFIBDatabase1.Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := selRateAccount;
    i['show_all']     := 1;
    LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
      begin
        id_acc_cust := o['ID_RATE_ACCOUNT'];
        cxButtonEditRSK.Text := VarToStr(o['RATE_ACCOUNT'])+' '+o['NAME_CUSTOMER'];
      end;
    i.Free;
    o.Free;
end;

procedure TfmBankAddShablon.cxButtonEditSchKPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : Variant;
begin
    Res := GlobalSPR.GetSch(self, pFIBDatabase1.Handle, fsNormal, Date, 1, 0, -1);
    if VarArrAyDimCount(res) > 0
    then
    begin
        if VarArrayDimCount(Res) > 0 then
        begin
            id_sch_k     := Res[0][0];
            cxButtonEditSchK.Text := Res[0][3] + ' - ' + Res[0][1];
        end;
    end;
end;

procedure TfmBankAddShablon.cxButtonEditDogPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    inputDog : TDogInput;
    res   : TDogResult;
begin
        SYS_ID_USER           := myform.id_user;
        decimalseparator      := ',';
        inputDog              := SYS_DEFAULT_DOG_INPUT;
        inputDog.Owner        := Self;
        inputDog.DBHandle     := pFIBDatabase1.Handle;
        inputDog.ReadTrans    := pFIBDatabase1.DefaultTransaction.Handle;
        inputDog.WriteTrans   := pFIBTransactionWrite.Handle;
        inputDog.FormStyle    := fsNormal;

        DataSet.Close;
        DataSet.SQLs.SelectSQL.Text := 'select * from BANK_INI';
        DataSet.Open;
        inputDog.id_Group_add := DataSet.FieldByName('ID_GROUP_ADD_PR').AsInteger;//61799//1499
        inputDog.id_Group     := DataSet.FieldByName('ID_GROUP').AsInteger;//61699;//699;
        DataSet.Close;

        inputDog.Summa        := 1;
        inputDog.filter.bShowFilterForm := true;
        inputDog.isZayav     := false;
        inputDog.arndGetPay  := 1;
        res := ShowDogMain(inputDog);
        if res.ModalResult = 1 then
        begin
            id_dog   := res.id_dog;
            cxButtonEditDog.text := VarToStr(res.n_dog) +  Un_R_file_Alex.BANK_NASTROYKA_VID  + VarToStr(res.d_dog) + ' ' + VarToStr(res.name_customer) + ' (' + VarToStr(res.regest_num) + ')';
        end;
end;

procedure TfmBankAddShablon.cxButtonWriteClick(Sender: TObject);
var
    mes: string;
    flag_mes : boolean;
begin
    mes := '';
    flag_mes := false;
    DecimalSeparator := ',';
    //проверка на корректность данных
    if cxButtonEditRSN.Text = '' then
    begin
        if not flag_mes then
        begin
            MES := Un_R_file_Alex.BANK_SEL_RS+' '+DataSet.FBN('NAME').AsString;;
        end else
            MES := mes + ' ' + Un_R_file_Alex.BANK_SEL_RS+' '+DataSet.FBN('NAME').AsString;;
        cxButtonEditRSN.style.Color := clred;
        FLAG_mes := TRUE;
    end else
        cxButtonEditRSN.style.Color := $00FFFBF0;

    if cxButtonEditRSK.Text = '' then
    begin
        if not flag_mes then
        begin
            MES := Un_R_file_Alex.BANK_SEL_RS_CUST;
        end else
            MES := mes + ' ' + Un_R_file_Alex.BANK_SEL_RS_CUST;
        cxButtonEditRSK.style.Color := clred;
        FLAG_mes := TRUE;
    end else
        cxButtonEditRSK.style.Color := $00FFFBF0;

    if cxButtonEditSchK.Text = '' then
    begin
        if not flag_mes then
        begin
            MES := Un_R_file_Alex.BANK_SEL_KOR_R;
        end else
            MES := mes + ' ' + Un_R_file_Alex.BANK_SEL_KOR_R;
        cxButtonEditSchK.style.Color := clred;
        FLAG_mes := TRUE;
    end else
        cxButtonEditSchK.style.Color := $00FFFBF0;

    if cxButtonEditSm.Text = '' then
    begin
        if not flag_mes then
        begin
            MES := Un_R_file_Alex.BANK_SEL_BUD;
        end else
            MES := mes + ' ' + Un_R_file_Alex.BANK_SEL_BUD;
        cxButtonEditSm.style.Color := clred;
        FLAG_mes := TRUE;
    end else
        cxButtonEditSm.style.Color := $00FFFBF0;

    if cxButtonEditKekv.Text = '' then
    begin
        if not flag_mes then
        begin
            MES := Un_R_file_Alex.BANK_SEL_KEKV;
        end else
            MES := mes + ' ' + Un_R_file_Alex.BANK_SEL_KEKV;
        cxButtonEditKekv.style.Color := clred;
        FLAG_mes := TRUE;
    end else
        cxButtonEditKekv.style.Color := $00FFFBF0;

    if cxButtonEditDog.Text = '' then
    begin
        if not flag_mes then
        begin
            MES := Un_R_file_Alex.BANK_SEL_DOG;
        end else
            MES := mes + ' ' + Un_R_file_Alex.BANK_SEL_DOG;
        cxButtonEditDog.style.Color := clred;
        FLAG_mes := TRUE;
    end else
        cxButtonEditDog.style.Color := $00FFFBF0;

    if flag_mes then
    begin
        showmessage(mes + ' ' + Un_R_file_Alex.J4_ADD_WARNING_DONT_CREATE);
        exit;
    end;

        if Flag = Add then
        begin
            pFibTransaction1.StartTransaction;
            try
              pFibStoredProc1.StoredProcName := 'BANK_SHABLONS_TRANZIT_INI_INS';

              pFibStoredProc1.Prepare;
              pFibStoredProc1.ParamByName('id_acc_a').AsInt64      := id_acc_nat;
              pFibStoredProc1.ParamByName('id_acc_b').AsInt64      := id_acc_cust;
              pFibStoredProc1.ParamByName('id_sch_b').AsInt64      := id_sch_k;
              pFibStoredProc1.ParamByName('id_sm').AsInt64         := id_smeta;
              pFibStoredProc1.ParamByName('id_razd').AsInt64       := id_razd;
              pFibStoredProc1.ParamByName('id_stat').AsInt64       := id_state;
              pFibStoredProc1.ParamByName('id_kekv').AsInt64       := id_kekv;
              pFibStoredProc1.ParamByName('id_dog').AsInt64        := id_dog;
              pFibStoredProc1.ParamByName('comment_shablon').AsString      := '';


              pFibStoredProc1.ExecProc;
              if (pFibStoredProc1.FieldByName('mes').AsString <> '') then ShowMessage(pFibStoredProc1.FieldByName('mes').AsString)
              else
              begin
                pFibTransaction1.Commit;
                myform.ActionRefreshExecute(Sender);
                myform.datasetmain.Locate('id_shablon', id_shablon, []);
                close;
              end;
            except
              begin
                pFibTransaction1.Rollback;
                Showmessage('При додаванні виникла помилка');
                exit;
              end;
            end;
        end;

        if Flag = Change then
        begin
            pFibTransaction1.StartTransaction;
            try
              pFibStoredProc1.StoredProcName := 'BANK_SHABLONS_TRANZIT_INI_UPD';

              pFibStoredProc1.Prepare;
              pFibStoredProc1.ParamByName('id_shablon').AsInt64      := id_shablon;
              pFibStoredProc1.ParamByName('id_acc_a').AsInt64      := id_acc_nat;
              pFibStoredProc1.ParamByName('id_acc_b').AsInt64      := id_acc_cust;
              pFibStoredProc1.ParamByName('id_sch_b').AsInt64      := id_sch_k;
              pFibStoredProc1.ParamByName('id_sm').AsInt64         := id_smeta;
              pFibStoredProc1.ParamByName('id_razd').AsInt64       := id_razd;
              pFibStoredProc1.ParamByName('id_stat').AsInt64       := id_state;
              pFibStoredProc1.ParamByName('id_kekv').AsInt64       := id_kekv;
              pFibStoredProc1.ParamByName('id_dog').AsInt64        := id_dog;
              pFibStoredProc1.ParamByName('comment_shablon').AsString      := '';

              pFibStoredProc1.ExecProc;
              if (pFibStoredProc1.FieldByName('mes').AsString <> '') then ShowMessage(pFibStoredProc1.FieldByName('mes').AsString)
              else
              begin
                pFibTransaction1.Commit;
                myform.ActionRefreshExecute(Sender);
                myform.datasetmain.Locate('id_shablon', id_shablon, []);
                close;
              end;
            except
              begin
                pFibTransaction1.Rollback;
                Showmessage('При редагуванні виникла помилка');
                exit;
              end;
           end;
           //close;
        end;
end;

procedure TfmBankAddShablon.cxTextEditRazdKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

procedure TfmBankAddShablon.FormCreate(Sender: TObject);
begin
    FormStorage1.RestoreFormPlacement;
end;

procedure TfmBankAddShablon.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FormStorage1.SaveFormPlacement;
end;

end.
