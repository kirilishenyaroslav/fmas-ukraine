unit BankDayAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit, cxTextEdit, 
  BankDayForm, cxLabel, Un_R_file_Alex, ActnList, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, cxCheckBox;

type
  TfmBankDay = (Add_Day_Bank, Change_Day_Bank);

  TfmBankDayAdd = class(TForm)
    cxButtonAdd: TcxButton;
    cxButtonClose: TcxButton;
    cxTextEditSaldoBegin: TcxTextEdit;
    cxTextEditSaldoEnd: TcxTextEdit;
    cxTextEditSumDeb: TcxTextEdit;
    cxTextEditsumKred: TcxTextEdit;
    cxDateEditday: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    ActionList1: TActionList;
    ActionClose: TAction;
    ActionAdd: TAction;
    Class_DataSet: TpFIBDataSet;
    Class_Database: TpFIBDatabase;
    Class_Transaction_Wr: TpFIBTransaction;
    Class_StoredProc: TpFIBStoredProc;
    DS_SALDO: TpFIBDataSet;
    TR: TpFIBTransaction;
    cxComboBox1: TcxComboBox;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxComboBox2: TcxComboBox;
    DataSetDays_ago: TpFIBDataSet;
    cxCheckBoxBlokDebet: TcxCheckBox;
    cxCheckBoxBlokKredit: TcxCheckBox;
    cxCheckBoxdayBlokSaldo: TcxCheckBox;
    cxTextEditSaldoBeginValuta: TcxTextEdit;
    cxTextEditSaldoEndValuta: TcxTextEdit;
    cxTextEditSumDebValuta: TcxTextEdit;
    cxTextEditsumKredValuta: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonAddClick(Sender: TObject);
    procedure cxTextEditSaldoBeginKeyPress(Sender: TObject; var Key: Char);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure cxTextEditSaldoBeginExit(Sender: TObject);
  private
  public
//    myclass : TMainBankDayClass;
    id_valuta   : Integer;
    name_valuta : string;
    myform      : TfmBankDayForm;
    flag        : TfmBankDay;
    block_s, block_d, block_k : Integer;
    id_us_block_d, id_us_block_k, id_us_block_s, id_user_current : int64;
    date_block_d, date_block_k : TDateTime;
    date_block_s : TDate;
    constructor Create(AOwner: TComponent; mform : TfmBankDayForm; m : TfmBankDay; saldo : string; saldo_valuta : string;id_valuta_in : Integer; name_valuta_in : string); reintroduce; overload;
  end;


implementation
uses Un_func_file_Alex, Accmgmt;
{$R *.dfm}

constructor TfmBankDayAdd.Create(AOwner: TComponent; mform : TfmBankDayForm; m : TfmBankDay; saldo : string; saldo_valuta : string; id_valuta_in : Integer; name_valuta_in : string);
var
    pr, i : integer;
    days_ago_show, days_ago_do: Integer;
begin
    inherited Create (AOwner);
    myform  := mform;
    flag    := m;

    id_valuta   := id_valuta_in;
    name_valuta := name_valuta_in;

    caption          := Un_R_file_Alex.KASSA_DAY_ADD_CAPTION;
    cxLabel1.Caption := Un_R_file_Alex.KASSA_DAY_ADD_DAY;
    cxLabel2.Caption := Un_R_file_Alex.KASSA_DAY_SALDO_BEGIN;
    cxLabel3.Caption := Un_R_file_Alex.KASSA_DAY_SALDO_END;
    cxLabel4.Caption := Un_R_file_Alex.KASSA_DAY_SUM_DEBET;
    cxLabel5.Caption := Un_R_file_Alex.KASSA_DAY_SUM_KREDIT;

    cxButtonClose.Caption := Un_R_file_Alex.MY_BUTTON_CLOSE;

    cxLabel6.Caption := Un_R_file_Alex.BANK_COL_DAY_FOR_SHOW[1];
    cxLabel7.Caption := Un_R_file_Alex.BANK_COL_DAY_FOR_FIND_RASH[1];
    cxCheckBoxBlokDebet.Properties.Caption      := Un_R_file_Alex.KASSA_DAY_BLOK_DEBET;
    cxCheckBoxBlokKredit.Properties.Caption     := Un_R_file_Alex.KASSA_DAY_BLOK_KREDIT;
    cxCheckBoxdayBlokSaldo.Properties.Caption   := Un_R_file_Alex.KASSA_DAY_BLOK_SALDO;

    if (id_valuta = 0) or (id_valuta = null) then
    begin
      cxLabel8.Visible  := False;
      cxLabel9.Visible  := False;
      cxLabel10.Visible := False;
      cxLabel11.Visible := False;
      cxLabel12.Visible  := False;
      cxLabel13.Visible  := False;
      cxTextEditSaldoBeginValuta.Visible := False;
      cxTextEditSaldoEndValuta.Visible   := False;
      cxTextEditSumDebValuta.Visible     := False;
      cxTextEditsumKredValuta.Visible    := False;
    end
    else
    begin
      cxLabel8.Visible  := True;
      cxLabel9.Visible  := True;
      cxLabel10.Visible := True;
      cxLabel11.Visible := True;
      cxLabel12.Visible  := True;
      cxLabel13.Visible  := True;
      cxTextEditSaldoBeginValuta.Visible := True;
      cxTextEditSaldoEndValuta.Visible   := True;
      cxTextEditSumDebValuta.Visible     := True;
      cxTextEditsumKredValuta.Visible    := True;
      cxLabel13.Caption                   := name_valuta;
    end;

    Class_Database := myform.Database;
    Class_Transaction_Wr.DefaultDatabase := Class_Database;
    Class_Database.DefaultTransaction    := Class_Transaction_Wr;

    TR.DefaultDatabase                   := Class_Database;

    DS_SALDO.Database                    := Class_Database;
    DS_SALDO.Transaction                 := TR;

    DataSetDays_ago.Database              := Class_Database;
    DataSetDays_ago.Transaction           := TR;

    TR.StartTransaction;

    DataSetDays_ago.Close;
    DataSetDays_ago.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_INI';
    DataSetDays_ago.Open;

    days_ago_show := DataSetDays_ago.fbn('DAY_AGO_SHOW').AsInteger;
    days_ago_do   := DataSetDays_ago.fbn('DAY_AGO_DO').AsInteger;

    cxComboBox1.Properties.Items.clear;
    for i:=0 to  days_ago_show do cxComboBox1.Properties.Items.Add(inttostr(i));
    cxComboBox1.itemindex:=0;

    cxComboBox2.Properties.Items.clear;
    for i:=0 to  days_ago_do do cxComboBox2.Properties.Items.Add(inttostr(i));
    cxComboBox2.itemindex:=0;

    if (myform.DataSetDayBank['BLOCK_DEBET']=1) then cxCheckBoxBlokDebet.Checked :=true else cxCheckBoxBlokDebet.Checked :=false;
    if (myform.DataSetDayBank['BLOCK_KREDIT']=1) then cxCheckBoxBlokKredit.Checked :=true  else cxCheckBoxBlokKredit.Checked :=false;
    if (myform.DataSetDayBank['BLOCK_SALDO']=1) then cxCheckBoxdayBlokSaldo.Checked :=true  else cxCheckBoxdayBlokSaldo.Checked :=false;

    if (myform.DataSetDayBank['BLOCK_DEBET']<>null) then block_d         := myform.DataSetDayBank['BLOCK_DEBET'];
    if (myform.DataSetDayBank['BLOCK_KREDIT']<>null) then block_k         := myform.DataSetDayBank['BLOCK_KREDIT'];
    if (myform.DataSetDayBank['BLOCK_SALDO']<>null) then block_s         := myform.DataSetDayBank['BLOCK_SALDO'];

    if (myform.DataSetDayBank['ID_USER_DEBET']<>null) then id_us_block_d   := myform.DataSetDayBank['ID_USER_DEBET'];
    if (myform.DataSetDayBank['ID_USER_KREDIT']<>null) then id_us_block_k   := myform.DataSetDayBank['ID_USER_KREDIT'];
    if (myform.DataSetDayBank['ID_USER_BLOCK']<>null) then id_us_block_s   := myform.DataSetDayBank['ID_USER_BLOCK'];

    if (myform.DataSetDayBank['DATE_BLOCK_DEBET']<>null) then date_block_d    := myform.DataSetDayBank['DATE_BLOCK_DEBET'];
    if (myform.DataSetDayBank['DATE_BLOCK_KREDIT']<>null) then date_block_k    := myform.DataSetDayBank['DATE_BLOCK_KREDIT'];
    if (myform.DataSetDayBank['DATE_BLOCK_SALDO']<>null) then date_block_s    := myform.DataSetDayBank['DATE_BLOCK_SALDO'];

    id_user_current := myform.id_user;

    if flag = Add_Day_Bank then
    begin
         cxButtonAdd.Caption := Un_R_file_Alex.MY_BUTTON_ADD;
    {if myform.DataSetDayBank.IsEmpty
         then cxTextEditSaldoBegin.Enabled := true
         else
         begin
             cxTextEditSaldoBegin.Enabled  := false;
             cxTextEditSaldoBegin.Text     := saldo;
             cxTextEditSaldoEnd.Text       := saldo;
         end;  }

         cxDateEditday.Date := date;

         DS_SALDO.close;
         DS_SALDO.sqls.selectSql.Text := 'select * from BANK_SELECT_CHANGE_FIRST_SALDO('+IntToStr(myform.id_svyaz)+', '''+cxDateEditday.Text+''','+inttostr(1)+')';
         DS_SALDO.Open;
         if DS_SALDO.fbn('R_RESULT').AsInteger = 1 then cxTextEditSaldoBegin.Enabled := true else
         begin
              cxTextEditSaldoBegin.Enabled    := false;
              cxTextEditSaldoBegin.Text       := saldo;
              cxTextEditSaldoEnd.Text         := saldo;
              cxTextEditSaldoBeginValuta.Text := saldo_valuta;
              cxTextEditSaldoEndValuta.Text   := saldo_valuta;
         end;

         DS_SALDO.close;
         DS_SALDO.sqls.selectSql.Text := 'select * from BANK_SP_SCH where ID_BANK_SP_SCH='+IntToStr(myform.id_svyaz);
         DS_SALDO.Open;
         if DS_SALDO.fbn('COL_FIND_PL').IsNull
            then cxComboBox2.ItemIndex := 0
            else cxComboBox2.ItemIndex := DS_SALDO.fbn('COL_FIND_PL').AsInteger;
         if DS_SALDO.fbn('COL_SHOW_PL').IsNull
            then cxComboBox1.ItemIndex := 0
            else cxComboBox1.ItemIndex := DS_SALDO.fbn('COL_SHOW_PL').AsInteger;

    end;
    if flag = Change_Day_Bank then
    begin
         cxDateEditday.Date := myform.DataSetDayBank['DAY_BANK'];
         cxButtonAdd.Caption := Un_R_file_Alex.MY_BUTTON_EDIT;
         pr := 1;
         cxTextEditSaldoBegin.Text := AddNol(myform.DataSetDayBank.fbn('SALDO_BEGIN').AsString, pr);
         cxTextEditSaldoEnd.Text   := AddNol(myform.DataSetDayBank.fbn('SALDO_END').AsString, pr);
         cxTextEditSumDeb.Text     := AddNol(myform.DataSetDayBank.fbn('SUM_DEBET').AsString, pr);
         cxTextEditsumKred.Text    := AddNol(myform.DataSetDayBank.fbn('SUM_KREDIT').AsString, pr);

         cxTextEditSaldoBeginValuta.Text := AddNol(myform.DataSetDayBank.fbn('SALDO_BEG_VALUTA').AsString, pr);
         cxTextEditSaldoEndValuta.Text   := AddNol(myform.DataSetDayBank.fbn('SALDO_END_VALUTA').AsString, pr);
         cxTextEditSumDebValuta.Text     := AddNol(myform.DataSetDayBank.fbn('SUM_DEBET_VALUTA').AsString, pr);
         cxTextEditsumKredValuta.Text    := AddNol(myform.DataSetDayBank.fbn('SUM_KREDIT_VALUTA').AsString, pr);

         if (myform.DataSetDayBank['COL_PRIHOD'] = 0) and (myform.DataSetDayBank.RecordCount = 1) and (myform.DataSetDayBank['COL_RASHOD'] = 0)
            then cxTextEditSaldoBegin.Enabled := true
            else cxTextEditSaldoBegin.Enabled := false;

         DS_SALDO.close;
         DS_SALDO.sqls.selectSql.Text := 'select * from BANK_SELECT_CHANGE_FIRST_SALDO('+IntToStr(myform.id_svyaz)+', '''+cxDateEditday.Text+''','+inttostr(2)+')';
         DS_SALDO.Open;
         if DS_SALDO.fbn('R_RESULT').AsInteger = 1 then cxTextEditSaldoBegin.Enabled := true else
         begin
           cxTextEditSaldoBegin.Enabled := false;
           cxTextEditSaldoBeginValuta.Enabled := false;
         end;  

         DS_SALDO.Close;

         if myform.DataSetDayBank.fbn('COL_DAY_FOR_SHOW').IsNull
            then cxComboBox1.ItemIndex := 0
            else cxComboBox1.ItemIndex := myform.DataSetDayBank.fbn('COL_DAY_FOR_SHOW').AsInteger;
         if myform.DataSetDayBank.fbn('COL_DAY_FOR_FIND_RASH').IsNull
            then cxComboBox2.ItemIndex := 0
            else cxComboBox2.ItemIndex := myform.DataSetDayBank.fbn('COL_DAY_FOR_FIND_RASH').AsInteger;

{         if (myform.DataSetDayBank.fbn('COL_PRIHOD').AsInteger<>0) or (myform.DataSetDayBank.fbn('COL_RASHOD').AsInteger<>0) then
         begin
             cxComboBox1.Enabled := false;
             cxComboBox2.Enabled := false;
         end;}
    end;
    TR.Rollback;
end;


procedure TfmBankDayAdd.cxButtonCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfmBankDayAdd.cxButtonAddClick(Sender: TObject);
var
    j, last, id_ras, id_day, id_user_c : int64;
    s_beg : double;
    bl_deb, bl_kred , bl_saldo: smallint;
    error : integer;
begin
    if Flag = Add_Day_Bank then
    begin
        if (cxDateEditday.date > date) then
        begin
            ShowMessage(Un_R_file_Alex.BANK_ADD_NOT_ADD_DAY_AFTER_CUR);
            exit;
        end;
        if ((cxDateEditday.date > myform.cxDateEditEnd.Date) and (myform.cxCheckBoxTo.Checked)) or (cxDateEditday.date < myform.cxDateEditBegin.Date) then
        begin
            ShowMessage(Un_R_file_Alex.BANK_ADD_DAY_ERROR_DATE);
            exit;
        end;
        if not cxTextEditSaldoBegin.Enabled then
        begin
            s_beg := 0;
        end else
        begin
            s_beg := StrToFloat(cxTextEditSaldoBegin.Text);
        end;
//        j := myclass.AddDay(myform.id_ras_sch, cxDateEditday.Text, s_beg, s_beg, 0, 0);
        Class_DataSet.Database       := Class_Database;
        Class_DataSet.Transaction    := Class_Transaction_Wr;
        Class_Transaction_Wr.StartTransaction;
        Class_DataSet.Close;
        try
            DecimalSeparator := '.';
            Class_DataSet.SQLs.SelectSQL.Text:='select R_ID from BANK_INSERT_DAY('
            +IntToStr(myform.id_ras_sch)+', ''' + cxDateEditday.Text + ''', '
            +floatToStr(s_beg) + ', ' +floatToStr(0) + ', ' +floatToStr(0)
            + ', ' +floatToStr(0) + ', '+ IntTostr(myform.id_user)
            + ', ' +IntToStr(myform.id_svyaz)+', '+IntToStr(cxComboBox1.ItemIndex)
            + ', ' +IntToStr(cxComboBox2.ItemIndex)+', '
            +floatToStr(0) + ', '
            +floatToStr(0) + ', '
            +floatToStr(0) + ', '
            +floatToStr(0) + ', '
            +IntToStr(id_valuta)
            +')';
            Class_DataSet.Open;
            j := Class_DataSet.FieldByName('R_ID').AsVariant;
            Class_DataSet.Close;
            Class_Transaction_Wr.Commit;
        except on E:Exception do begin
            Class_Transaction_Wr.Rollback;
            ShowMessage(E.Message);
            j := 0;
        end end;
        DecimalSeparator := ',';

        If j > 0 then
        begin
            myform.ActionRefreshExecute(Sender);
            myform.DataSetDayBank.Locate('ID_DT_DAY', j, []);
        end;
        close;
    end;
    if Flag = Change_Day_Bank then
    begin
        last                         := myform.DataSetDayBank['ID_DT_DAY'];
        Class_DataSet.Database       := Class_Database;
        Class_DataSet.Transaction    := Class_Transaction_Wr;
        Class_Transaction_Wr.StartTransaction;
        Class_DataSet.Close;
        try
            DecimalSeparator := '.';
            id_ras           := myform.id_ras_sch;
            id_day           := StrToInt64(myform.DataSetDayBank.fbn('ID_DT_DAY').AsString);
            id_user_c        := myform.id_user;
            Class_DataSet.SQLs.SelectSQL.Text := 'select R_ID from BANK_UPDATE_DAY_C('+IntToStr(id_ras)+', '+IntToStr(id_day)+', ''' + cxDateEditday.Text + ''', '+ IntTostr(id_user_c) + ', ''' + StringReplace(cxTextEditSaldoBegin.Text,',','.',[]) + ''', '+IntToStr(cxComboBox1.ItemIndex)+', '+IntToStr(cxComboBox2.ItemIndex)+')';
            Class_DataSet.Open;
            j := Class_DataSet.FieldByName('R_ID').AsVariant;
            Class_DataSet.Close;
            Class_DataSet.Transaction.Commit;
        except on E:Exception do begin
            Class_DataSet.Transaction.Rollback;
            ShowMessage(E.Message);
            j := 0;
        end end;
        DecimalSeparator := ',';

        if cxCheckBoxBlokDebet.Checked         then bl_deb := 1 else bl_deb := 0;
        if cxCheckBoxBlokKredit.Checked        then bl_kred := 1 else bl_kred := 0;
        if cxCheckBoxdayBlokSaldo.Checked      then bl_saldo := 1 else bl_saldo := 0;


    {if (not cxCheckBoxBlokDebet.Checked)  then
    begin
        error := Accmgmt.fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_Days/Bank_block_debet','Block');
        if error <> 0 then
        begin
            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)+' ' + Un_R_file_Alex.KASSA_BLOCK_O_DEB), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
            exit;
        end;
    end
    else
    begin
        if (cxCheckBoxBlokDebet.Checked)  then
        begin
            error := Accmgmt.fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_Days/Bank_block_debet','Block');
            if error <> 0 then
            begin
                MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)+' ' + Un_R_file_Alex.KASSA_BLOCK_O_DEB), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                exit;
            end;
        end;
    end;

    if (not cxCheckBoxBlokKredit.Checked)  then
    begin
        error := Accmgmt.fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_Days/Bank_block_kredit','Block');
        if error <> 0 then
        begin
            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)+' ' + Un_R_file_Alex.KASSA_BLOCK_O_KRED), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
            exit;
        end;
    end else
    begin
        if (cxCheckBoxBlokKredit.Checked)  then
        begin
            error := Accmgmt.fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_Days/Bank_block_kredit','Block');
            if error <> 0 then
            begin
                MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)+' ' + Un_R_file_Alex.KASSA_BLOCK_O_KRED), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                exit;
            end;
        end;
    end;

    if (not cxCheckBoxdayBlokSaldo.Checked)  then
    begin
        error := Accmgmt.fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_Days/Bank_block_saldo','Block');
        if error <> 0 then
        begin
            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)+' ' + Un_R_file_Alex.KASSA_BLOCK_SALDO), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
            exit;
        end;
    end  else
    begin
        if (cxCheckBoxdayBlokSaldo.Checked)  then
        begin
            error := Accmgmt.fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_Days/Bank_block_saldo','Block');
            if error <> 0 then
            begin
                MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)+' ' + Un_R_file_Alex.KASSA_BLOCK_SALDO), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                exit;
            end;
        end;
    end;  }

    Class_DataSet.Database       := Class_Database;
    Class_DataSet.Transaction    := Class_Transaction_Wr;
    Class_StoredProc.Database    := Class_Database;
    Class_StoredProc.Transaction := Class_Transaction_Wr;

    Class_Transaction_Wr.StartTransaction;

    Class_DataSet.Close;

    try
        DecimalSeparator := '.';
        Class_StoredProc.StoredProcName := 'BANK_DAY_UPDATE';
        Class_StoredProc.Prepare;

        if (bl_deb=block_d) then
        begin

            Class_StoredProc.ParamByName('D_BLOK_DEBET').AsInteger           := block_d;
            Class_StoredProc.ParamByName('D_ID_USER_BLOK_DEB').AsInt64       := id_us_block_d;
            Class_StoredProc.ParamByName('D_DATE_DEB').AsDateTime            := date_block_d;
        end else
        begin
            error := Accmgmt.fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_Days/Bank_block_debet','Block');
            if error <> 0 then
            begin
                MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)+' ' + Un_R_file_Alex.KASSA_BLOCK_O_DEB), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                exit;
            end;
            Class_StoredProc.ParamByName('D_BLOK_DEBET').AsInteger           := bl_deb;
            Class_StoredProc.ParamByName('D_ID_USER_BLOK_DEB').AsInt64       := id_user_current;
            Class_StoredProc.ParamByName('D_DATE_DEB').AsDateTime            := Now;
        end;
        if (bl_kred=block_k) then
        begin
            Class_StoredProc.ParamByName('D_BLOK_KREDIT').AsInteger         := block_k;
            Class_StoredProc.ParamByName('D_ID_USER_BLOK_KR').AsInt64       := id_us_block_k;
            Class_StoredProc.ParamByName('D_DATE_KR').AsDateTime            := date_block_k;
        end else
        begin
            error := Accmgmt.fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_Days/Bank_block_kredit','Block');
            if error <> 0 then
            begin
                MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)+' ' + Un_R_file_Alex.KASSA_BLOCK_O_KRED), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                exit;
            end;
            Class_StoredProc.ParamByName('D_BLOK_KREDIT').AsInteger         := bl_kred;
            Class_StoredProc.ParamByName('D_ID_USER_BLOK_KR').AsInt64       := id_user_current;
            Class_StoredProc.ParamByName('D_DATE_KR').AsDateTime            := Now;
        end;
        if (bl_saldo=block_s) then
        begin
            Class_StoredProc.ParamByName('D_BLOCK_SALDO').AsInteger         := block_s;
            Class_StoredProc.ParamByName('D_ID_USER_BLOCK_SALDO').AsInt64   := id_us_block_s;
            Class_StoredProc.ParamByName('D_DATE_BLOCK_SALDO').AsDate       := date_block_s;
        end else
        begin
        if (cxCheckBoxdayBlokSaldo.Checked)  then
        begin
            error := Accmgmt.fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_Days/Bank_block_saldo','Block');
            if error <> 0 then
            begin
                MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)+' ' + Un_R_file_Alex.KASSA_BLOCK_SALDO), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                exit;
            end;
            Class_StoredProc.ParamByName('D_BLOCK_SALDO').AsInteger         := bl_saldo;
            Class_StoredProc.ParamByName('D_ID_USER_BLOCK_SALDO').AsInt64   := id_user_current;
            Class_StoredProc.ParamByName('D_DATE_BLOCK_SALDO').AsDate       := cxDateEditday.Date;
        end;
      end;
        Class_StoredProc.ParamByName('D_ID_DAY_BANK').AsInt64            := id_day;


        Class_StoredProc.ExecProc;
        Class_Transaction_Wr.Commit;
    except on E:Exception do begin
        Class_Transaction_Wr.Rollback;
        ShowMessage(E.Message);
        exit;
    end end;

        if j > 0 then
        begin
            myform.ActionRefreshExecute(Sender);
            myform.DataSetDayBank.Locate('ID_DT_DAY', j, []);
        end else
        begin
            myform.ActionRefreshExecute(Sender);
            myform.DataSetDayBank.Locate('ID_DT_DAY', last, []);
        end;
        close;
    end;
end;

procedure TfmBankDayAdd.cxTextEditSaldoBeginKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Ord(Key) = VK_TAB then exit;
    if Ord(Key) <> VK_TAB then
    begin
        cxTextEditSaldoBegin.ClearSelection;
    end;

    if Key = '.' then Key := DecimalSeparator;

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator,cxTextEditSaldoBegin.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditSaldoBegin.Text) - Pos(DecimalSeparator,cxTextEditSaldoBegin.Text) > 1) and (Pos(DecimalSeparator,cxTextEditSaldoBegin.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
end;

procedure TfmBankDayAdd.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmBankDayAdd.ActionAddExecute(Sender: TObject);
begin
    cxButtonAddClick(Sender);
end;

procedure TfmBankDayAdd.cxTextEditSaldoBeginExit(Sender: TObject);
var
    pr : integer;
begin
    pr := 1;
    cxTextEditSaldoBegin.Text := AddNol(cxTextEditSaldoBegin.Text, pr);
    if pr = -1 then
    begin
        ShowMessage(Un_R_file_Alex.MY_ERROR_SUMMA_LENGTH);
    end;
end;

end.
