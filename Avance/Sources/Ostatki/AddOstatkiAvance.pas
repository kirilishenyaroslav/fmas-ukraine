unit AddOstatkiAvance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, ActnList, cxControls, cxContainer, cxEdit,
  cxMaskEdit, cxDropDownEdit, cxMRUEdit, StdCtrls, cxLookAndFeelPainters,
  cxButtons, MainOstatkiAvanse, cxLabel, Un_lo_file_Alex, FIBQuery,
  pFIBQuery, pFIBStoredProc, Un_R_file_Alex, DB, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, GlobalSPR, cxCalendar, Buttons, cxMemo, Kernel;

type
  TViborOstatok = (AddOstatok, ChangeOstatok);
  TRRR  = (right_grid, left_grid, left_change);

  TfmAddOstatkiAvance = class(TForm)
    GroupBox1: TGroupBox;
    cxMRUEditKekv: TcxMRUEdit;
    cxMRUEditState: TcxMRUEdit;
    cxMRUEditRazd: TcxMRUEdit;
    cxMRUEditSmeta: TcxMRUEdit;
    GroupBox2: TGroupBox;
    cxMRUEditFio: TcxMRUEdit;
    cxMRUEditSch: TcxMRUEdit;
    ActionList1: TActionList;
    GroupBox3: TGroupBox;
    cxTextEditSumma: TcxTextEdit;
    GroupBox4: TGroupBox;
    cxButtonExit: TcxButton;
    cxButtonAdd: TcxButton;
    ActionAdd: TAction;
    ActionExit: TAction;
    cxLabelSmeta: TcxLabel;
    cxLabelRazd: TcxLabel;
    cxLabelState: TcxLabel;
    cxLabelKekv: TcxLabel;
    cxLabelSumma: TcxLabel;
    cxLabelSch: TcxLabel;
    cxLabelFio: TcxLabel;
    cxComboBoxDeb: TcxComboBox;
    cxLabelDeb: TcxLabel;
    StoredProcA: TpFIBStoredProc;
    TransactionWrite: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    cxLabel1: TcxLabel;
    pFIBDatabase1: TpFIBDatabase;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    GroupBox5: TGroupBox;
    cxLabel11: TcxLabel;
    cxDateEditWozOst: TcxDateEdit;
    cxMemo1: TcxMemo;
    SpeedButton1: TSpeedButton;
    TransactionRead: TpFIBTransaction;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    ActionShow: TAction;
    procedure ActionExitExecute(Sender: TObject);
    procedure cxMRUEditFioPropertiesButtonClick(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure cxMRUEditSchPropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditSmetaPropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditRazdPropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditKekvPropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditStatePropertiesButtonClick(Sender: TObject);
    procedure cxTextEditSummaKeyPress(Sender: TObject; var Key: Char);
    function SelectDogovor(all_summa : double):boolean;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ActionShowExecute(Sender: TObject);
  private
    today   : Tdate;
    id_man : int64;
    id_sch : int64;
    id_smeta: int64;
    id_razd : int64;
    id_state : int64;
    id_kekv : int64;
    my_form : TfmMainOstatkiAvance;
    my_rejim : TViborOstatok;
    s : integer;
    RecInfo: RECORD_INFO_STRUCTURE;
    count_sch, def_v, def_k : integer;
//    ResultInfo: RESULT_STRUCTURE;
  public
    id_dog_add, kod_dog_add : int64;
    constructor Create(AOwner: TComponent; m : TfmMainOstatkiAvance; v : TViborOstatok; id_m : Int64; name_man : string; zzz : integer); reintroduce; overload;
  end;


implementation
uses    SelectSchAvance, DogLoaderUnit;

{$R *.dfm}
constructor TfmAddOstatkiAvance.Create(AOwner: TComponent; m: TfmMainOstatkiAvance; v : TViborOstatok; id_m : Int64; name_man : string; zzz : integer);
var
    Res : variant;
    i : integer;
    s_d, s_k : string;
begin
    inherited Create(AOwner);
    my_form := m;
    my_rejim := v;
    s := zzz;
    id_dog_add  := -1;
    kod_dog_add := -1;
    cxDateEditWozOst.date := date;
    ActionAdd.Caption    := Un_R_file_Alex.MY_BUTTON_ADD;
//    ActionChange.Caption := Un_R_file_Alex.MY_BUTTON_EDIT;
    ActionExit.Caption   := Un_R_file_Alex.MY_BUTTON_CANCEL_CONST;
    Caption              := Un_R_file_Alex.J4_OSTATOK_ADD_FORM_CAPTION;
    cxLabelFio.Caption   := Un_R_file_Alex.J4_OSTATOK_FORM_FIO;

    cxLabelSch.Caption   := Un_R_file_Alex.J4_SCH_;
    cxLabel12.Caption    := Un_R_file_Alex.TAB_NUM;
    cxLabelDeb.Caption   := Un_R_file_Alex.J4_OSTATOK_PO;
    GroupBox1.Caption    := Un_R_file_Alex.J4_OSTATOK_ADD_FORM_GR_1;
    cxLabelSmeta.Caption := Un_R_file_Alex.J4_SMETA_;
    cxLabelRazd.Caption  := Un_R_file_Alex.J4_RAZD_;
    cxLabelState.Caption := Un_R_file_Alex.J4_STATE_;
    cxLabelKekv.Caption  := Un_R_file_Alex.J4_KEKV_;
    cxLabelSumma.Caption := Un_R_file_Alex.KASSA_ADD_PROVODKA_SUMMA_PROV;
    GroupBox4.Caption    := Un_R_file_Alex.J4_OSTATOK_ADD_FORM_GR_4;
    GroupBox5.Caption    := Un_R_file_Alex.J4_DANNIE_PO_PRIKAZU;
    cxLabel11.Caption    := Un_R_file_Alex.J4_ADD_DATE_CAPTION;
    cxLabel2.Caption     := Un_R_file_Alex.KASSA_DOC_ORDER_TIN;
    cxLabel4.Caption     := Un_R_file_Alex.KASSA_DOC_ORDER_BIRTHDAY;
    cxLabel2.Visible     := false;
    cxLabel3.Visible     := false;
    cxLabel4.Visible     := false;
    cxLabel5.Visible     := false;
    cxLabel6.Visible     := false;
    cxLabel7.Visible     := false;
    cxLabel8.Visible     := false;
    cxLabel9.Visible     := false;
    cxLabel10.Visible    := false;
    cxLabel11.Visible    := false;

    if m.cxComboBox2.ItemIndex < 10
        then today := StrToDate('01.0'+IntTostr(m.cxComboBox2.ItemIndex+1)+'.'+IntToStr(m.cxSpinEdit1.Value))
        else today := StrToDate('01.'+IntTostr(m.cxComboBox2.ItemIndex+1)+'.'+IntToStr(m.cxSpinEdit1.Value));

    pFIBDatabase1                    := my_form.pFIBDatabase1;
    TransactionWrite.DefaultDatabase := my_form.pFIBDatabase1;
    TransactionRead.DefaultDatabase  := pFIBDatabase1;
    pFIBDatabase1.defaultTransaction := TransactionRead;
    DataSet.Database                 := my_form.pFIBDatabase1;
    StoredProcA.Database             := my_form.pFIBDatabase1;
    DataSet.Transaction              := TransactionWrite;
    StoredProcA.Transaction          := TransactionWrite;
    TransactionWrite.StartTransaction;
    if (my_form.priznak_new_alg = 1) and (my_form.date_new_alg<=my_form.date_beg) then {признак нового алгоритма}
    begin
        cxMemo1.Visible      := true;
        SpeedButton1.Visible := true;
    end else
    begin
        cxMemo1.Visible      := false;
        SpeedButton1.Visible := false;
    end;
    count_sch := 2;
    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text := 'select * from J4_SELECT_ALL_SCH('+ IntToStr(my_form.ID_JORNAL) +')';
    DataSet.Open;
    DataSet.FetchAll;
    if DataSet.RecordCount = 1 then
    begin
        count_sch          := 1;
        cxMRUEditSch.Text  := DataSet.FieldByName('SCH_NUM').AsString;
        id_sch             := TFIBBCDField(DataSet.FieldByName('ID_SCH')).AsInt64;
        cxLabel10.Caption  := DataSet.FieldByName('SCH_TITLE').AsString;
        cxLabel10.Visible  := true;
    end;

    id_man := id_m;
    if id_m > 0 then
    begin
        cxMRUEditFio.Text    := name_man;
        cxMRUEditFio.Enabled := false;
    end;

    cxComboBoxDeb.Properties.Items.Insert(0, Un_R_file_Alex.J4_OSTATOK_PO_DEBETU);
    cxComboBoxDeb.Properties.Items.Insert(1, Un_R_file_Alex.J4_OSTATOK_PO_KREDITU);
    cxComboBoxDeb.ItemIndex := 1;

    cxButtonAdd.Action := ActionAdd;

    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text := 'select * from MBOOK_INI_DATA';
    DataSet.Open;
    if DataSet.FieldByName('USE_DEFAULT_VALUES').AsInteger = 1 then
    begin
        cxMRUEditSmeta.Enabled := false;
        cxMRUEditRazd.Enabled  := false;
        cxMRUEditState.Enabled := false;
        id_smeta := TFIBBCDField(DataSet.FieldByName('DEFAULT_SMETA')).AsInt64;
        id_razd  := TFIBBCDField(DataSet.FieldByName('DEFAULT_RAZD')).AsInt64;
        id_state := TFIBBCDField(DataSet.FieldByName('DEFAULT_ST')).AsInt64;
        cxLabel6.Visible      := true;
        cxLabel7.Visible      := true;
        cxLabel8.Visible      := true;
        def_v                 := 1;
    end;
    if DataSet.FieldByName('USE_DEFAULT_KEKV').AsInteger = 1 then
    begin
        def_k                  := 1;
        cxMRUEditKekv.Enabled  := false;
        id_kekv  := TFIBBCDField(DataSet.FieldByName('DEFAULT_KEKV')).AsInt64;
        cxLabel9.Visible      := true;
    end;
    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text := 'select * from J4_SELECT_SM_RA_ST_KEKV('+ IntToStr(id_smeta) +', '+ IntToStr(id_razd) +', '+ IntToStr(id_state) +', '+ IntToStr(id_kekv) +')';
    DataSet.Open;
    if def_v = 1 then
    begin
        cxMRUEditSmeta.Text   := DataSet.FieldByName('SM_KOD').AsString;
        cxMRUEditRazd.Text    := DataSet.FieldByName('RAZ_KOD').AsString;
        cxMRUEditState.Text   := DataSet.FieldByName('ST_KOD').AsString;
        cxLabel6.Caption      := DataSet.FieldByName('SM_TITLE').AsString;
        cxLabel7.Caption      := DataSet.FieldByName('RAZ_TITLE').AsString;
        cxLabel8.Caption      := DataSet.FieldByName('ST_TITLE').AsString;
    end;
    if def_k = 1 then
    begin
        cxMRUEditKekv.Text    := DataSet.FieldByName('KEKV_KOD').AsString;
        cxLabel9.Caption      := DataSet.FieldByName('KEKV_TITLE').AsString;
    end;

    if v = ChangeOstatok then
    begin
        ActionAdd.Caption    := Un_R_file_Alex.MY_BUTTON_EDIT;
        Caption              := Un_R_file_Alex.J4_OSTATOK_CHANGE_FORM_CAPTION;

        if (s = 0) or (s = 1) then
        begin
            RecInfo.TRHANDLE       := TransactionWrite.Handle;
            RecInfo.DBHANDLE       := my_form.pFIBDatabase1.Handle;
            RecInfo.ID_RECORD      := VarArrayOf([TFIBBCDField(my_form.DataSetProvodka.FieldByName('ID_OSTATOK')).AsInt64]);
            RecInfo.PK_FIELD_NAME  := VarArrayOf(['ID_OSTATOK']);
            RecInfo.TABLE_NAME     := 'J4_DT_OSTATOK';
            RecInfo.RAISE_FLAG     := True;
            LockRecord(@RecInfo);

            id_sch   := TFIBBCDField(my_form.DataSetProvodka.FieldByname('ID_SCH')).AsInt64;
            id_smeta := TFIBBCDField(my_form.DataSetProvodka.FieldByname('ID_SMETA')).AsInt64;
            id_razd  := TFIBBCDField(my_form.DataSetProvodka.FieldByname('ID_RAZDEL')).AsInt64;
            id_state := TFIBBCDField(my_form.DataSetProvodka.FieldByname('ID_STATE')).AsInt64;
            id_kekv  := TFIBBCDField(my_form.DataSetProvodka.FieldByname('ID_KEKV')).AsInt64;

            cxMRUEditSch.Text      := my_form.DataSetProvodka.FieldByname('KOD_SCH').AsString;
            cxMRUEditSmeta.Text    := my_form.DataSetProvodka.FieldByname('KOD_SMETA').AsString;
            cxMRUEditRazd.Text     := my_form.DataSetProvodka.FieldByname('KOD_RAZ').AsString;
            cxMRUEditState.Text    := my_form.DataSetProvodka.FieldByname('KOD_STATE').AsString;
            cxMRUEditKekv.Text     := my_form.DataSetProvodka.FieldByname('KOD_KEKV').AsString;

            cxLabel10.Caption      := my_form.DataSetProvodka.FieldByname('NAME_SCH').AsString;
            cxLabel6.Caption       := my_form.DataSetProvodka.FieldByname('NAME_SMETA').AsString;
            cxLabel7.Caption       := my_form.DataSetProvodka.FieldByname('NAME_RAZD').AsString;
            cxLabel8.Caption       := my_form.DataSetProvodka.FieldByname('NAME_STATE').AsString;
            cxLabel9.Caption       := my_form.DataSetProvodka.FieldByname('NAME_KEKV').AsString;

            cxDateEditWozOst.date  := my_form.DataSetProvodka.FieldByname('DATE_ZAV_OST').AsDateTime;

            try s_d := my_form.DataSetProvodka.FieldByname('SUM_DEB').AsString    except s_d := ''; end;
            try s_k := my_form.DataSetProvodka.FieldByname('SUM_KREDIT').AsString except s_k := ''; end;
            //////////////////////
            if s_d <> '' then
            begin
                cxTextEditSumma.Text    := s_d;
                cxComboBoxDeb.ItemIndex := 0;
            end;
            if s_k <> '' then
            begin
                cxTextEditSumma.Text    := s_k;
                cxComboBoxDeb.ItemIndex := 1;
            end;
        end else
        begin
            my_form.DataSetProvodka.First;
            for i := 0 to my_form.DataSetProvodka.RecordCount-1 do
            begin
                RecInfo.TRHANDLE       := TransactionWrite.Handle;
                RecInfo.DBHANDLE       := my_form.pFIBDatabase1.Handle;
                RecInfo.ID_RECORD      := VarArrayOf([TFIBBCDField(my_form.DataSetProvodka.FieldByName('ID_OSTATOK')).AsInt64]);
                RecInfo.PK_FIELD_NAME  := VarArrayOf(['ID_OSTATOK']);
                RecInfo.TABLE_NAME     := 'J4_DT_OSTATOK';
                RecInfo.RAISE_FLAG     := True;
                LockRecord(@RecInfo);
                my_form.DataSetProvodka.Next;
            end;
        end;


    end;
    if s = 1 then
    begin
        if (my_form.priznak_new_alg = 1) and (my_form.date_new_alg<=my_form.date_beg) then {признак нового алгоритма}
        begin
            SelectDogovor(0);
            if id_man <= 0 then
            begin
                res := Un_lo_file_Alex.mY_getManExAo(self, my_form.pFIBDatabase1.Handle, my_form.date_beg, my_form.date_end, False, false, -1);
                if VarArrayDimCount(res) > 0 then
                begin
                    if (res[0]<>null){ and (res[1]<>null) }then
                    begin
                        id_man            := res[0];
                        cxMRUEditFio.Text := res[1];
                        try cxLabel3.Caption  := res[9] except cxLabel3.Caption  := ''; end;
                        try cxLabel5.Caption  := res[8]  except cxLabel5.Caption := ''; end;
                        try cxLabel13.Caption := res[10] except cxLabel13.Caption := ''; end;;
                    end;
                end;
            end;
            if count_sch = 1 then
            begin
//                cxComboBoxDeb.SetFocus;
                cxComboBoxDeb.TabOrder := 0;
            end else
            begin
//                cxTextEditSumma.SetFocus;
                cxTextEditSumma.TabOrder := 0;
            end;
        end else
        begin
            res := Un_lo_file_Alex.mY_getManExAo(self, my_form.pFIBDatabase1.Handle,  my_form.date_beg, my_form.date_end, False, false, -1);
            if VarArrayDimCount(res) > 0 then
            begin
                if (res[0]<>null){ and (res[1]<>null) }then
                begin
                    id_man            := res[0];
                    cxMRUEditFio.Text := res[1];
                    try cxLabel3.Caption  := res[9] except cxLabel3.Caption  := ''; end;
                    try cxLabel5.Caption  := res[8] except cxLabel5.Caption  := ''; end;
                    try cxLabel13.Caption := res[10] except cxLabel13.Caption := ''; end;
                end;
            end else
                close;
            exit;
        end;
    end;

    if s = 2 then
    begin
        GroupBox2.TabOrder    := 0;
        cxMRUEditFio.TabOrder := 0;
        GroupBox1.Visible     := false;
        cxLabel1.Visible      := true;
        cxMRUEditSch.Visible  := false;
        cxComboBoxDeb.Visible := false;
        cxMRUEditFio.Enabled  := true;
        cxLabelSch.Visible    := false;
        cxLabelDeb.Visible    := false;
        cxMRUEditKekv.Visible := false;
//        cxDateEditWozOst.Visible := false;
        GroupBox5.Visible     := false;


        cxMRUEditFio.TabOrder := 0;
        GroupBox2.TabOrder    := 0;
//        Visible := true;
//        cxMRUEditFio.SetFocus;
//        Visible := false;

//        GroupBox3.Enabled     := false;
        cxLabel11.Visible        := false;
//        cxTextEditSumma.Visible  := false;
        cxDateEditWozOst.Visible := false;
        cxLabelSumma.Visible     := false;


        cxLabel1.Caption      := Un_R_file_Alex.J4_ADD_PROVODKA_ost_all + IntToStr(my_form.DataSetProvodka.RecordCount);
        if (my_form.priznak_new_alg = 1) and (my_form.date_new_alg<=my_form.date_beg) then {признак нового алгоритма}
        begin
            SelectDogovor(0);
            if id_man <= 0 then
            begin
                res := Un_lo_file_Alex.mY_getManExAo(self, my_form.pFIBDatabase1.Handle, my_form.date_beg, my_form.date_end, False, false, -1);
                if VarArrayDimCount(res) > 0 then
                begin
                    if (res[0]<>null){ and (res[1]<>null) }then
                    begin
                        id_man            := res[0];
                        cxMRUEditFio.Text := res[1];
                        try cxLabel3.Caption  := res[9];  except cxLabel3.Caption  := ''; end;
                        try cxLabel5.Caption  := res[8];  except cxLabel5.Caption := ''; end;
                        try cxLabel13.Caption := res[10]; except cxLabel13.Caption := ''; end;
                    end;
                end;
            end;
            if count_sch = 1 then
            begin
                cxComboBoxDeb.SetFocus;
            end else
            begin
                cxTextEditSumma.SetFocus;
            end;
        end;
    end;
end;

procedure TfmAddOstatkiAvance.ActionExitExecute(Sender: TObject);
begin
    close;
end;


procedure TfmAddOstatkiAvance.cxMRUEditFioPropertiesButtonClick(Sender: TObject);
var
    res : Variant;
begin
    res := Un_lo_file_Alex.mY_getManExAo(self, my_form.pFIBDatabase1.Handle, my_form.date_beg, my_form.date_end, False, false, -1);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null){ and (res[1]<>null) }then
        begin
            cxLabel2.Visible  := true;
            cxLabel3.Visible  := true;
            cxLabel4.Visible  := true;
            cxLabel5.Visible  := true;
            id_man            := res[0];
            cxMRUEditFio.Text := res[1];
            try cxLabel3.Caption  := res[9] except cxLabel3.Caption  := ''; end;
            try cxLabel5.Caption  := res[8] except cxLabel5.Caption  := ''; end;
        end;
    end;
end;

procedure TfmAddOstatkiAvance.ActionAddExecute(Sender: TObject);
var
    day : string;
    db_kr : integer;
    id, id_p : Int64;
begin

    if my_form.date_open_sys > cxDateEditWozOst.Date then
    begin
        ShowMessage(Un_R_file_Alex.J4_OSTATOK_DATE_ERROR);
        cxDateEditWozOst.SetFocus;
        exit;
    end;
if my_rejim = AddOstatok then
begin
    if (id_man <= 0 ) then
    begin
        ShowMessage(Un_R_file_Alex.J4_OSTATOK_ADD_FORM_NOT_FIO);
        cxMRUEditFio.IsFocused;
        exit;
    end;
    if (id_sch <= 0 ) then
    begin
        ShowMessage(Un_R_file_Alex.J4_OSTATOK_ADD_FORM_NOT_SCH);
        cxMRUEditSch.IsFocused;
        exit;
    end;
    if (id_smeta <= 0 ) then
    begin
        ShowMessage(Un_R_file_Alex.J4_OSTATOK_ADD_FORM_NOT_SMETA);
        cxMRUEditSmeta.IsFocused;
        exit;
    end;
    if (id_razd <= 0 ) then
    begin
        ShowMessage(Un_R_file_Alex.J4_OSTATOK_ADD_FORM_NOT_RAZD);
        cxMRUEditRazd.IsFocused;
        exit;
    end;
    if (id_state <= 0 ) then
    begin
        ShowMessage(Un_R_file_Alex.J4_OSTATOK_ADD_FORM_NOT_STATE);
        cxMRUEditState.IsFocused;
        exit;
    end;
    if (id_kekv <= 0 ) then
    begin
        ShowMessage(Un_R_file_Alex.J4_OSTATOK_ADD_FORM_NOT_KEKV);
        cxMRUEditKekv.IsFocused;
        exit;
    end;
    if (cxTextEditSumma.Text = '') then
    begin
        ShowMessage(Un_R_file_Alex.J4_OSTATOK_ADD_FORM_NOT_SUMMA);
        cxTextEditSumma.IsFocused;
        exit;
    end;
    if (StrToFloat(cxTextEditSumma.Text) = 0) then
    begin
        ShowMessage(Un_R_file_Alex.J4_OSTATOK_ADD_FORM_NOT_SUMMA);
        cxTextEditSumma.IsFocused;
        exit;
    end;

    if (cxDateEditWozOst.date > my_form.date_end) then
    begin
        ShowMessage(Un_R_file_Alex.J4_ADD_DATE_ERROR);
        cxDateEditWozOst.IsFocused;
        exit;
    end;

    if my_form.priznak_new_alg = 1 then
    begin
        if (id_dog_add <= 0) and (kod_dog_add <= 0) then
        begin
            ShowMessage(Un_R_file_Alex.J4_OSTATOK_ADD_FORM_NOT_DOG);
            cxMemo1.IsFocused;
            exit;
        end;
    end;

    if my_form.cxComboBox2.ItemIndex < 10
        then day := '01.0'+IntTostr(my_form.cxComboBox2.ItemIndex+1)+'.' + IntToStr(my_form.cxSpinEdit1.Value)
        else day := '01.'+IntTostr(my_form.cxComboBox2.ItemIndex+1)+'.' + IntToStr(my_form.cxSpinEdit1.Value);

    if cxComboBoxDeb.ItemIndex = 0
                then db_kr := 1
                else db_kr := 0;

    id := id_man;
    DataSet.Close;
    try
        DecimalSeparator := '.';
       // if cxComboBoxDeb.ItemIndex = 0
      //  then DataSet.SQLs.SelectSQL.Text:='select * from J4_INSERT_OSTATOK('+IntToStr(my_form.ID_JORNAL)+', ''' + DAY + ''', ' + IntToStr(id_man) + ', ' +IntToStr(id_sch) + ', ' +IntToStr(id_smeta) + ', ' +IntToStr(id_razd) + ', '+ IntToStr(id_state) + ', '+ IntToStr(id_kekv) + ',  '''+StringReplace(cxTextEditSumma.Text,',','.',[])+''', '+ IntToStr(my_form.id_user) + ', ''' + cxDateEditWozOst.Text + ''', '+IntToStr(id_dog_add)+', '+IntToStr(kod_dog_add)+', '+IntToStr(db_kr)+')'
      //  else
        DataSet.SQLs.SelectSQL.Text:='select * from J4_INSERT_OSTATOK('+IntToStr(my_form.ID_JORNAL)+', ''' + DAY + ''', ' + IntToStr(id_man) + ', ' +IntToStr(id_sch) + ', ' +IntToStr(id_smeta) + ', ' +IntToStr(id_razd) + ', '+ IntToStr(id_state) + ', '+ IntToStr(id_kekv) + ',  '''+StringReplace(cxTextEditSumma.Text,',','.',[])+''', '+ IntToStr(my_form.id_user) + ', ''' + cxDateEditWozOst.Text + ''', '+IntToStr(id_dog_add)+', '+IntToStr(kod_dog_add)+', '+IntToStr(db_kr)+')';
        DataSet.Open;
        if DataSet.FieldByName('FLAG_ERROR').AsInteger = 1 then
        begin
            TransactionWrite.Rollback;
            ShowMessage(DataSet.FieldByName('ERROR').AsString);
            DecimalSeparator := ',';
            DataSet.Close;
            exit;
        end;
    except on E:Exception do
        begin
            TransactionWrite.Rollback;
            ShowMessage(E.Message);
        end
    end;
    DecimalSeparator := ',';
    DataSet.Close;
    TransactionWrite.Commit;
    my_form.ActionRefreshExecute(Sender);
    my_form.DataSetMain.Locate('ID_MAN', id, []);
//    my_form.DataSetProvodka.Locate('ID_OSTATOK', DataSet.FieldByName('R_ID').AsVariant, []);
    close;
end;

if (my_rejim = ChangeOstatok) and ((s = 1) or (s = 0)) then
begin
    if (id_man <= 0 ) then
    begin
        ShowMessage(Un_R_file_Alex.J4_OSTATOK_ADD_FORM_NOT_FIO);
        cxMRUEditFio.IsFocused;
        exit;
    end;
    if (id_sch <= 0 ) then
    begin
        ShowMessage(Un_R_file_Alex.J4_OSTATOK_ADD_FORM_NOT_SCH);
        cxMRUEditSch.IsFocused;
        exit;
    end;
    if (id_smeta <= 0 ) then
    begin
        ShowMessage(Un_R_file_Alex.J4_OSTATOK_ADD_FORM_NOT_SMETA);
        cxMRUEditSmeta.IsFocused;
        exit;
    end;
    if (id_razd <= 0 ) then
    begin
        ShowMessage(Un_R_file_Alex.J4_OSTATOK_ADD_FORM_NOT_RAZD);
        cxMRUEditRazd.IsFocused;
        exit;
    end;
    if (id_state <= 0 ) then
    begin
        ShowMessage(Un_R_file_Alex.J4_OSTATOK_ADD_FORM_NOT_STATE);
        cxMRUEditState.IsFocused;
        exit;
    end;
    if (id_kekv <= 0 ) then
    begin
        ShowMessage(Un_R_file_Alex.J4_OSTATOK_ADD_FORM_NOT_KEKV);
        cxMRUEditKekv.IsFocused;
        exit;
    end;
    if my_form.priznak_new_alg = 1 then
    begin
        if (id_dog_add <= 0) and (kod_dog_add <= 0) then
        begin
            ShowMessage(Un_R_file_Alex.J4_OSTATOK_ADD_FORM_NOT_DOG);
            cxMemo1.IsFocused;
            exit;
        end;
    end;
    if (cxTextEditSumma.Text = '') then
    begin
        ShowMessage(Un_R_file_Alex.J4_OSTATOK_ADD_FORM_NOT_SUMMA);
        cxTextEditSumma.IsFocused;
        exit;
    end;
    try
            if my_form.cxComboBox2.ItemIndex < 10
                then day := '01.0'+IntTostr(my_form.cxComboBox2.ItemIndex+1)+'.'+IntToStr(my_form.cxSpinEdit1.Value)
                else day := '01.'+IntTostr(my_form.cxComboBox2.ItemIndex+1)+'.'+IntToStr(my_form.cxSpinEdit1.Value);

            id   := TFIBBCDField(my_form.DatasetMain.FieldByName('ID_MAN')).AsInt64;
            id_p := TFIBBCDField(my_form.DataSetProvodka.FieldbyName('ID_OSTATOK')).AsInt64;

            DecimalSeparator                                   := '.';
            StoredProcA.StoredProcName                         := 'J4_UPDATE_OSTATOK';
            StoredProcA.Prepare;
            StoredProcA.ParamByName('D_ID_SP_JO').AsInt64      := my_form.ID_JORNAL;
            StoredProcA.ParamByName('D_DATE_REG').AsString     := day;
            StoredProcA.ParamByName('D_ID_MAN').AsInt64        := id_man;
            StoredProcA.ParamByName('D_ID_SCH').AsInt64        := id_sch;
            StoredProcA.ParamByName('D_ID_SMETA').AsInt64      := id_smeta;
            StoredProcA.ParamByName('D_ID_RAZDEL').AsInt64     := id_razd;
            StoredProcA.ParamByName('D_ID_STATE').AsInt64      := id_state;
            StoredProcA.ParamByName('D_ID_KEKV').AsInt64       := id_kekv;
            StoredProcA.ParamByName('D_ID_DOG').AsInt64        := id_dog_add;
            StoredProcA.ParamByName('D_KOD_DOG').AsInt64       := kod_dog_add;
            StoredProcA.ParamByName('D_SUMMA').AsString        := cxTextEditSumma.Text;
            if cxComboBoxDeb.ItemIndex = 0
                then StoredProcA.ParamByName('D_DB_KR').AsInteger := 1
                else StoredProcA.ParamByName('D_DB_KR').AsInteger := 0;
            StoredProcA.ParamByName('D_ID_USER').AsInt64       := my_form.id_user;
            StoredProcA.ParamByName('D_ID_DT_OSTATOK').AsInt64 := TFIBBCDField(my_form.DataSetProvodka.FieldByName('ID_OSTATOK')).AsInt64;
            StoredProcA.ExecProc;
            DecimalSeparator                                   := ',';
            TransactionWrite.Commit;
            my_form.ActionRefreshExecute(Sender);
            my_form.DatasetMain.locate('ID_MAN', id, []);
            my_form.DatasetProvodka.locate('ID_OSTATOK', id_p, []);
            close;
        except on E:Exception do
            begin
                TransactionWrite.Rollback;
                ShowMessage(E.Message);
                exit;
            end
        end;
end;
if (my_rejim = ChangeOstatok) and (s = 2) then
begin

    try
            if my_form.cxComboBox2.ItemIndex < 10
                then day := '01.0'+IntTostr(my_form.cxComboBox2.ItemIndex+1)+'.'+IntToStr(my_form.cxSpinEdit1.Value)
                else day := '01.'+IntTostr(my_form.cxComboBox2.ItemIndex+1)+'.'+IntToStr(my_form.cxSpinEdit1.Value);

            DecimalSeparator                                   := '.';
            StoredProcA.StoredProcName                         := 'J4_UPDATE_OSTATOK_FIO';
            StoredProcA.Prepare;
            StoredProcA.ParamByName('D_ID_J4').AsInt64         := my_form.ID_JORNAL;
            StoredProcA.ParamByName('D_DATE').AsString         := day;
            StoredProcA.ParamByName('D_ID_MAN').AsInt64        := id_man;
            StoredProcA.ParamByName('D_OLD_MAN').AsInt64       := TFIBBCDField(my_form.DataSetMain.FieldByName('ID_MAN')).AsInt64;
            StoredProcA.ExecProc;
            DecimalSeparator                                   := ',';
            TransactionWrite.Commit;
            my_form.ActionRefreshExecute(Sender);
            my_form.DataSetMain.Locate('ID_MAN', id_man, []);
            close;
        except on E:Exception do
            begin
                TransactionWrite.Rollback;
                ShowMessage(E.Message);
                exit;
            end
        end;
end;

end;

procedure TfmAddOstatkiAvance.cxMRUEditSchPropertiesButtonClick(
  Sender: TObject);
var
    id : int64;
    k,t : string;
begin
{    res := GlobalSPR.GetSch(self, my_form.pFIBDatabase1.Handle, fsNormal, Date, 1, 0, 0);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            id_sch := res[0][0];
            cxMRUEditSch.Text := res[0][3];
            cxLabel10.Visible := true;
            cxLabel10.Caption := res[0][2];
        end;
    end;
 }
    if Show_sch_Avance(self, my_form.pFIBDatabase1, my_form.pFIBTransaction1, my_form.ID_JORNAL, id, k ,t) then
    begin
        id_sch := id;
        cxMRUEditSch.Text := k;
        cxLabel10.Visible := true;
        cxLabel10.Caption := t;
    end;
end;

procedure TfmAddOstatkiAvance.cxMRUEditSmetaPropertiesButtonClick(
  Sender: TObject);
var
    res : variant;
//    STRU : Wizard_get_prov_info;
begin
 {   res := GlobalSPR.GetSmets(self, my_form.pFIBDatabase1.Handle, today, psmSmet);
    begin
        if VarArrayDimCount(res) > 0 then
        begin
            id_smeta            := res[0];
            cxMRUEditSmeta.Text := res[2];
            cxLabel6.Visible    := true;
            cxLabel6.Caption    := res[2];;
        end;
    end;}
    res := GlobalSPR.GetSmets(self, my_form.pFIBDatabase1.Handle, my_form.date_beg, psmRazdSt);
      if VarArrayDimCount(res) > 0 then
          begin
          if res[0] <> 0 then
              begin
                  id_smeta    := res[0];
                  id_razd     := res[1];
                  id_state    := res[2];
                  cxMRUEditSmeta.Text := res[9];
                  cxLabel6.Visible    := true;
                  cxLabel6.Caption     := res[6];
                  cxMRUEditRazd.Text  := res[7];
                  cxLabel7.Visible    := true;
                  cxLabel7.Caption    := res[4];
                  cxMRUEditState.text := res[8];
                  cxLabel8.Visible    := true;
                  cxLabel8.Caption    := res[5];
              end;
          end;

    {new}

end;

procedure TfmAddOstatkiAvance.cxMRUEditRazdPropertiesButtonClick(
  Sender: TObject);
var
    res : variant;
//    STRU : Wizard_get_prov_info;
begin
    res := GlobalSPR.GetSmets(self, my_form.pFIBDatabase1.Handle, today, psmRazdSt);
    if VarArrayDimCount(res) > 0 then
    begin
       { if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            id_razd             := res[0][0];
            cxMRUEditRazd.Text  := res[0][1];
            cxLabel7.Visible    := true;
            cxLabel7.Caption    := res[0][2];;
        end;}
          if res[0] <> 0 then
              begin
                  id_smeta    := res[0];
                  id_razd     := res[1];
                  id_state    := res[2];
                  cxMRUEditSmeta.Text := res[9];
                  cxLabel6.Visible    := true;
                  cxLabel6.Caption     := res[6];
                  cxMRUEditRazd.Text  := res[7];
                  cxLabel7.Visible    := true;
                  cxLabel7.Caption    := res[4];
                  cxMRUEditState.text := res[8];
                  cxLabel8.Visible    := true;
                  cxLabel8.Caption    := res[5];
              end;
    end;

{    STRU.DbHandle       := pFIBDatabase1.Handle;
    STRU.Mode           := 3;
    STRU.Actual_date    := cxDateEditWozOst.date;
    STRU.Wizard_form_sh := false;
    if Kernel.WizardGetProvInfo(@STRU) then
    begin
        cxMRUEditSmeta.Text := IntToStr(Stru.DB_KOD_SMETA);
        cxLabel6.Visible    := true;
        cxLabel6.Caption     := stru.DB_TITLE_SMETA;

        cxMRUEditRazd.Text  := IntToStr(stru.DB_KOD_RAZD);
        cxLabel7.Visible    := true;
        cxLabel7.Caption    := stru.DB_TITLE_RAZD;

        cxMRUEditState.text := IntToStr(stru.DB_KOD_STAT);
        cxLabel8.Visible    := true;
        cxLabel8.Caption    := stru.DB_TITLE_STAT;

        cxMRUEditKekv.Text  := IntToStr(stru.DB_KOD_KEKV);
        cxLabel9.Visible    := true;
        cxLabel9.Caption    := stru.DB_KEKV_TITLE;

        id_smeta             := stru.DB_ID_SMETA;
        id_razd              := stru.DB_ID_RAZD;
        id_state             := stru.DB_ID_STAT;
        id_kekv              := stru.DB_ID_KEKV;
    end;}
end;

procedure TfmAddOstatkiAvance.cxMRUEditKekvPropertiesButtonClick(
  Sender: TObject);
var
    res : variant;
//    STRU : Wizard_get_prov_info;
begin
    res := GlobalSPR.GetKEKVSpr(self, my_form.pFIBDatabase1.Handle, fsNormal, today, 1);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][0]<>null) and (res[0][1]<>null) then
        begin
            id_kekv             := res[0][0];
            cxMRUEditKekv.Text  := res[0][2];
            cxLabel9.Visible    := true;
            cxLabel9.Caption    := res[0][1];;
        end;
    end;
{    STRU.DbHandle       := pFIBDatabase1.Handle;
    STRU.Mode           := 3;
    STRU.Actual_date    := cxDateEditWozOst.date;
    STRU.Wizard_form_sh := false;
    if Kernel.WizardGetProvInfo(@STRU) then
    begin
        cxMRUEditSmeta.Text := IntToStr(Stru.DB_KOD_SMETA);
        cxLabel6.Visible    := true;
        cxLabel6.Caption     := stru.DB_TITLE_SMETA;

        cxMRUEditRazd.Text  := IntToStr(stru.DB_KOD_RAZD);
        cxLabel7.Visible    := true;
        cxLabel7.Caption    := stru.DB_TITLE_RAZD;

        cxMRUEditState.text := IntToStr(stru.DB_KOD_STAT);
        cxLabel8.Visible    := true;
        cxLabel8.Caption    := stru.DB_TITLE_STAT;

        cxMRUEditKekv.Text  := IntToStr(stru.DB_KOD_KEKV);
        cxLabel9.Visible    := true;
        cxLabel9.Caption    := stru.DB_KEKV_TITLE;

        id_smeta             := stru.DB_ID_SMETA;
        id_razd              := stru.DB_ID_RAZD;
        id_state             := stru.DB_ID_STAT;
        id_kekv              := stru.DB_ID_KEKV;
    end;}
end;

procedure TfmAddOstatkiAvance.cxMRUEditStatePropertiesButtonClick(
  Sender: TObject);
var
    res : variant;
//    STRU : Wizard_get_prov_info;
begin
    res := GlobalSPR.GetSmets(self, my_form.pFIBDatabase1.Handle, today, psmRazdSt);
    if VarArrayDimCount(res) > 0 then
    begin
       { if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            id_state            := res[0][0];
            cxMRUEditRazd.Text  := res[0][1];
            cxLabel8.Visible    := true;
            cxLabel8.Caption    := res[0][2];;
        end; }
          if res[0] <> 0 then
              begin
                  id_smeta    := res[0];
                  id_razd     := res[1];
                  id_state    := res[2];
                  cxMRUEditSmeta.Text := res[9];
                  cxLabel6.Visible    := true;
                  cxLabel6.Caption     := res[6];
                  cxMRUEditRazd.Text  := res[7];
                  cxLabel7.Visible    := true;
                  cxLabel7.Caption    := res[4];
                  cxMRUEditState.text := res[8];
                  cxLabel8.Visible    := true;
                  cxLabel8.Caption    := res[5];
              end;
    end;

{    STRU.DbHandle       := pFIBDatabase1.Handle;
    STRU.Mode           := 3;
    STRU.Actual_date    := cxDateEditWozOst.date;
    STRU.Wizard_form_sh := false;
    if Kernel.WizardGetProvInfo(@STRU) then
    begin
        cxMRUEditSmeta.Text := IntToStr(Stru.DB_KOD_SMETA);
        cxLabel6.Visible    := true;
        cxLabel6.Caption     := stru.DB_TITLE_SMETA;

        cxMRUEditRazd.Text  := IntToStr(stru.DB_KOD_RAZD);
        cxLabel7.Visible    := true;
        cxLabel7.Caption    := stru.DB_TITLE_RAZD;

        cxMRUEditState.text := IntToStr(stru.DB_KOD_STAT);
        cxLabel8.Visible    := true;
        cxLabel8.Caption    := stru.DB_TITLE_STAT;

        cxMRUEditKekv.Text  := IntToStr(stru.DB_KOD_KEKV);
        cxLabel9.Visible    := true;
        cxLabel9.Caption    := stru.DB_KEKV_TITLE;

        id_smeta             := stru.KR_ID_SMETA;
        id_razd              := stru.KR_ID_RAZD;
        id_state             := stru.KR_ID_STAT;
        id_kekv              := stru.KR_ID_KEKV;
    end;}
end;

procedure TfmAddOstatkiAvance.cxTextEditSummaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = '.' then Key := DecimalSeparator;

    if (Key = '-') and (Length(cxTextEditSumma.Text)>0)
       then Key := Chr(0);

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
        and (Key <> '-')
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEditSumma.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditSumma.Text) - Pos(DecimalSeparator, cxTextEditSumma.Text) > 1) and (Pos(DecimalSeparator,cxTextEditSumma.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);

end;

function TfmAddOstatkiAvance.SelectDogovor(all_summa : double): boolean;
var
    summa_dog : double;
    inputDog : TDogInput;
    res   : TDogResult;
//    i, j : integer;
//    flag_na_exists_dog, flag_na_exists_sm : boolean;
//    TT : TD;
begin
    summa_dog := all_summa;
    SelectDogovor := true;
    TransactionWrite.StartTransaction;
    TransactionRead.StartTransaction;

    LoadSysData(TransactionRead);
    inputDog.Owner       := self;
    inputDog.DBHandle    := pFIBDatabase1.Handle;
    inputDog.WriteTrans  := TransactionWrite.Handle;
    inputDog.ReadTrans   := TransactionRead.Handle;
    inputDog.FormStyle   := fsNormal;
    inputDog.Summa       := summa_dog;
    inputDog.id_Group     := my_form.id_dog_group;
    if (cxComboBoxDeb.ItemIndex = 0) then
    inputDog.id_Group_add := my_form.id_dog_group_pr
    else
    inputDog.id_Group_add := my_form.id_dog_group_rash;

    res := ShowDogMain(inputDog);
    if res.ModalResult = 1 then
    begin
        id_dog_add  := res.id_dog;
        kod_dog_add := res.kod_dog;
        if id_man = 0 then id_man := res.sum_today;
        cxMemo1.Text := {Un_R_file_Alex.BANK_TYPE_DOGOVOR+' : ' + }VarToStr(res.name_tip_dog)+'; №  '+VarToStr(res.n_dog)+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +VarToStr(res.d_dog) + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + VarToStr(res.regest_num)+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + VarToStr(res.name_customer);
{        if id_man <> res.Smets[0].id_people then
        begin
            DataSet.Close;
            DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_GET_MAN_INFO('+IntToStr(res.Smets[0].id_people)+','''+DateToStr(Date)+''')';
            DataSet.Open;
            showMessage(Un_R_file_Alex.J4_OSTATOK_ERROR_MAN + #13 + Un_R_file_Alex.J4_OSTATOK_IN_OST + cxMRUEditFio.Text+ #13 + Un_R_file_Alex.J4_OSTATOK_IN_DOG + DataSet.FieldByName('UKR_FAMILIA').AsString + ' ' + DataSet.FieldByName('UKR_IMYA').AsString + ' ' + DataSet.FieldByName('UKR_OTCHESTVO').AsString);
            exit;
        end;
 }       if id_man > 0 then
        begin
            DataSet.Close;
            DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_GET_MAN_INFO('+IntToStr(id_man)+','''+DateToStr(Date)+''')';
            DataSet.Open;
            cxMRUEditFio.Text := DataSet.FieldByName('UKR_FAMILIA').AsString + ' ' + DataSet.FieldByName('UKR_IMYA').AsString + ' ' + DataSet.FieldByName('UKR_OTCHESTVO').AsString;
            cxLabel3.Caption  := DataSet.FieldByName('TIN').AsString;
            cxLabel5.Caption  := DataSet.FieldByName('BIRTH_DATE').AsString;
            cxLabel13.Caption  := DataSet.FieldByName('TN').AsString;
            cxMemo1.Text := cxMemo1.Text + ' ' + Un_R_file_Alex.KASSA_DOC_FIO + ' ' + DataSet.FieldByName('UKR_FAMILIA').AsString + ' ' + DataSet.FieldByName('UKR_IMYA').AsString + ' ' + DataSet.FieldByName('UKR_OTCHESTVO').AsString;
            DataSet.Close;
        end;
        cxMRUEditFio.TabStop := false;
        cxMRUEditSch.TabStop := false;

    end else
    begin
        SelectDogovor := false;
    end;
end;

procedure TfmAddOstatkiAvance.SpeedButton1Click(Sender: TObject);
begin
     SelectDogovor(1);
end;

procedure TfmAddOstatkiAvance.FormActivate(Sender: TObject);
begin
            if count_sch = 1 then
            begin
                cxComboBoxDeb.SetFocus;
            end else
            begin
                cxTextEditSumma.SetFocus;
            end;
end;

procedure TfmAddOstatkiAvance.ActionShowExecute(Sender: TObject);
begin
  ShowMessage('id_sm - '+IntToStr(id_smeta)+#13+
              'id_st - '+IntToStr(id_state)+#13+
              'id_razd - '+IntToStr(id_razd)+#13+
              'id_kekv - '+IntToStr(id_kekv)+#13+
              'id_sch - '+IntToStr(id_sch)+#13+
              'name_sch - '+cxMRUEditSch.Text+#13+
              'id_mam - '+IntToStr(id_man)+#13+
              'sum - '+cxTextEditSumma.Text+#13+
              'id_dog - '+IntToStr(id_dog_add)+#13+
              'kod_dog - '+IntToStr(kod_dog_add)+#13);
end;

end.
