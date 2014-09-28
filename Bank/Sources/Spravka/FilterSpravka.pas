unit FilterSpravka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, cxButtonEdit, cxTextEdit,
  cxLabel, cxMaskEdit, cxDropDownEdit, cxCalendar, cxCheckBox, Buttons,
  StdCtrls, cxRadioGroup, cxContainer, cxEdit, cxButtons, cxControls,
  cxGroupBox, fibDataBase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, GlobalSPR,
  ShowAddDoc, Placemnt, ExtCtrls,Registry;

type

  TfmFilterSpravka = class(TForm)
    cxGroupBox2: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxRadioGroup1: TcxRadioGroup;
    cxRadioButtonPrihod: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    cxRadioButtonAll: TcxRadioButton;
    cxGroupBox1: TcxGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    cxCheckBoxDate: TcxCheckBox;
    cxDateEditFrom: TcxDateEdit;
    cxDateEditTo: TcxDateEdit;
    cxCheckBoxSumma: TcxCheckBox;
    cxCheckBoxNote: TcxCheckBox;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    cxTextEditFrom: TcxTextEdit;
    cxTextEditTo: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxTextEditNote: TcxTextEdit;
    cxGroupBox3: TcxGroupBox;
    cxCheckBox2: TcxCheckBox;
    cxLabel1: TcxLabel;
    cxButtonEdit1: TcxButtonEdit;
    cxCheckBox1: TcxCheckBox;
    cxButtonEdit2: TcxButtonEdit;
    cxLabel9: TcxLabel;
    cxGroupBox5: TcxGroupBox;
    cxCheckBoxFio: TcxCheckBox;
    cxLabel5: TcxLabel;
    cxButtonEdit3: TcxButtonEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    cxButtonEdit5: TcxButtonEdit;
    cxTextEdit1: TcxTextEdit;
    ActionList1: TActionList;
    ActionPrint: TAction;
    ActionClose: TAction;
    cxCheckBox3: TcxCheckBox;
    cxTextEditNumberDoc: TcxTextEdit;
    cxLabel10: TcxLabel;
    cxGroupBox4: TcxGroupBox;
    cxCheckBox4: TcxCheckBox;
    cxTextEditFio: TcxTextEdit;
    cxLabel11: TcxLabel;
    pFIBDataSet1: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    cxTextEdit2: TcxTextEdit;
    FormStorage1: TFormStorage;
    Panel1: TPanel;
    Panel2: TPanel;
    DataSetSch: TpFIBDataSet;
    procedure cxCheckBox3Click(Sender: TObject);
    procedure cxCheckBox2Click(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBoxDateClick(Sender: TObject);
    procedure cxCheckBoxDateEditing(Sender: TObject; var CanEdit: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cxDateEditFromKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure cxDateEditToKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton4Click(Sender: TObject);
    procedure cxCheckBoxSummaClick(Sender: TObject);
    procedure cxTextEditFromFocusChanged(Sender: TObject);
    procedure cxTextEditFromKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditToFocusChanged(Sender: TObject);
    procedure cxTextEditToKeyPress(Sender: TObject; var Key: Char);
    procedure cxCheckBoxNoteClick(Sender: TObject);
    procedure cxTextEditNoteKeyPress(Sender: TObject; var Key: Char);
    procedure cxCheckBoxFioClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RadioButton2Click(Sender: TObject);
    procedure cxButtonEdit5PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RadioButton3Click(Sender: TObject);
    procedure cxTextEdit1Exit(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxCheckBox4Click(Sender: TObject);
    procedure cxDateEditToPropertiesChange(Sender: TObject);
    procedure cxDateEditFromPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    ResSch : TResSch;
    ResKorSch : TResSch;
    id_user, id_customer, id_ras, id_ras_native : int64;
    flag_na_visible : boolean;
    id_sch_main : int64;
  public
    d : TPfibDataBase;
    kod_sys : integer;
  end;

function ShowFilterSpravka(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; var RSch : TResSch; var RKorSch : TResSch; var s1, s2 : double; var num, osnov, fio, kontr_name, name_sch_box, name_kor_sch_box, name_kontr_box, name_ras_box : string; var prih, ras : Smallint; var id_ras_acc, id_acc, id_cust : int64; var d1, d2 : Tdate; var flag_sch, flag_kor_sch, flag_num, flag_sum, flag_note, flag_fio, flag_kontr, flag_kontr_sp, flag_rs, flag_name_konrt : boolean; kod_system : integer; max_d : Tdate): boolean;

implementation
uses Un_R_file_Alex, dogLoaderUnit, LoadDogManedger, SelOsnovSch, SpravkaUnitCaption;

{$R *.dfm}

function ShowFilterSpravka(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; var RSch : TResSch; var RKorSch : TResSch; var s1, s2 : double; var num, osnov, fio, kontr_name, name_sch_box, name_kor_sch_box, name_kontr_box, name_ras_box : string; var prih, ras : smallint; var id_ras_acc, id_acc, id_cust : int64; var d1, d2 : Tdate; var flag_sch, flag_kor_sch, flag_num, flag_sum, flag_note, flag_fio, flag_kontr, flag_kontr_sp, flag_rs, flag_name_konrt : boolean; kod_system : integer; max_d : Tdate): boolean;
var
    T : TfmFilterSpravka;
begin
    T := TfmFilterSpravka.Create(AOwner);
    T.flag_na_visible     := false;

    T.id_user                           := id_us;
    T.d                                 := DB;
    T.pFIBTransaction1.DefaultDatabase  := T.d;
    T.d.DefaultTransaction              := T.pFIBTransaction1;

    T.DataSetSch.Database             := T.d;
    T.DataSetSch.Transaction          := T.pFIBTransaction1;

    T.pFIBDataSet1.Database             := T.d;
    T.pFIBDataSet1.Transaction          := T.pFIBTransaction1;

    T.pFIBDataSet1.Transaction.StartTransaction;

    T.kod_sys             := kod_system;
    T.cxDateEditTo.Properties.MaxDate   := max_d;
    T.cxDateEditFrom.Properties.MaxDate := max_d;
    T.cxTextEditFrom.Text := FloatToStr(s1);
    T.cxTextEditTo.Text   := FloatToStr(s2);
    if (prih=1) and (ras = 1) then T.cxRadioButtonAll.Checked;//    := true;
    if (prih=0) and (ras = 1) then T.cxRadioButton3.Checked;//      := true;
    if (prih=1) and (ras = 0) then T.cxRadioButtonPrihod.Checked;// := true;
    T.ResSch        := RSch;
    T.ResKorSch     := RKorSch;
    T.id_customer   := id_cust;
    T.id_ras        := id_ras_acc;
    T.id_ras_native := id_acc;
    T.cxButtonEdit3.text := name_kontr_box;
    T.cxButtonEdit5.Text := name_ras_box;
    T.cxTextEdit1.text   := kontr_name;
    T.cxButtonEdit1.text := name_sch_box;
    T.cxButtonEdit2.Text := name_kor_sch_box;
    T.cxTextEditNumberDoc.Text := num;
    T.cxTextEditNote.Text      := osnov;
    T.cxTextEditFio.Text       := fio;
    if flag_sch        then T.cxCheckBox2.Checked     := true;
    if flag_kor_sch    then T.cxCheckBox1.Checked     := true;
    if flag_num        then T.cxCheckBox3.Checked     := true;
    if flag_sum        then T.cxCheckBoxSumma.Checked := true;
    if flag_note       then T.cxCheckBoxNote.Checked  := true;
    if flag_fio        then T.cxCheckBox4.Checked     := true;
    if flag_kontr      then T.cxCheckBoxFio.Checked   := true;
    if flag_kontr_sp   then T.RadioButton1.Checked    := true;
    if flag_rs         then T.RadioButton2.Checked    := true;
    if flag_name_konrt then T.RadioButton3.Checked    := true;
    if kod_system = 1 then T.cxGroupBox5.Visible := false;
    if kod_system = 2 then T.cxGroupBox4.Visible := false;

    T.pFIBDataSet1.Close;
    T.pFIBDataSet1.Sqls.SelectSQL.Text := 'SELECT * from PUB_SPRAVKA_INI';
    T.pFIBDataSet1.Open;

    T.cxDateEditTo.Properties.MinDate   := T.pFIBDataSet1.FieldByName('FILTER_MIN_DAY').AsDateTime;
    T.cxDateEditFrom.Properties.MinDate := T.pFIBDataSet1.FieldByName('FILTER_MIN_DAY').AsDateTime;
    T.pFIBDataSet1.Close;
    T.cxDateEditTo.Date   := d1;
    T.cxDateEditFrom.Date := d2;


    T.Caption                    := Un_R_file_Alex.BANK_FIND_CAP_15;
    T.cxGroupBox3.Caption        := SpravkaUnitCaption.FILTER_PO_KOR_SCH;
    T.cxGroupBox2.Caption        := Un_R_file_Alex.J4_OSTATOK_ADD_FORM_GR_4;
    T.cxCheckBox4.Properties.Caption  := SpravkaUnitCaption.FILTER_PO_FIO;
    
//    cxGroupBox1.Caption        := Un_R_file_Alex.;
    T.cxLabel1.Caption           := Un_R_file_Alex.KASSA_FIND_CAP_1;
    T.cxCheckBox2.Properties.Caption      := Un_R_file_Alex.KASSA_FIND_CAP_14;
    T.cxCheckBoxDate.Properties.Caption   := Un_R_file_Alex.KASSA_FIND_CAP_10;
    T.cxCheckBoxSumma.Properties.Caption  := Un_R_file_Alex.KASSA_FIND_CAP_11;
    T.cxCheckBoxFio.Properties.Caption    := SpravkaUnitCaption.FILTER_PO_CUST;
    T.cxCheckBoxNote.Properties.Caption   := Un_R_file_Alex.KASSA_FIND_CAP_13;
    T.cxCheckBox1.Properties.Caption      := Un_R_file_Alex.KASSA_FIND_CAP_17;
    T.cxRadioButtonPrihod.Caption := Un_R_file_Alex.KASSA_FIND_CAP_7;
    T.cxRadioButton3.Caption      := Un_R_file_Alex.KASSA_FIND_CAP_8;
    T.RadioButton2.Caption        := SpravkaUnitCaption.FILTER_PO_R_S_CUST;
    T.RadioButton3.Caption        := SpravkaUnitCaption.FILTER_NAME_PO_VKLYUCH;
    T.cxRadioButtonAll.Caption    := Un_R_file_Alex.KASSA_FIND_CAP_9;
    T.ActionPrint.Caption         := Un_R_file_Alex.MY_BUTTON_F;
    T.ActionClose.Caption         := Un_R_file_Alex.MY_BUTTON_CLOSE;
    T.cxLabel2.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_2;
    T.cxLabel3.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_3;
    T.cxLabel4.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_4;
    T.cxLabel5.Caption            := SpravkaUnitCaption.FILTER_WITHOUT_CUST;
    T.cxLabel6.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_6;
    T.cxLabel7.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_2;
    T.cxLabel8.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_3;
    T.cxLabel9.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_16;
    //    cxLabel9.Caption            := Un_R_file_Alex.;
//    cxLabel10.Caption           := Un_R_file_Alex.;
    T.cxLabel11.Caption           := SpravkaUnitCaption.FILTER_WITHUOT_FIO;
//    cxLabel12.Caption           := Un_R_file_Alex.;
//    cxRadioGroup1.Caption       := Un_R_file_Alex.;

    T.flag_na_visible  := true;
    if T.showmodal = mrOk then
    begin
        d1      := T.cxDateEditTo.Date;
        d2      := T.cxDateEditFrom.Date;
        s1      := StrToFloat(T.cxTextEditFrom.Text);
        s2      := StrToFloat(T.cxTextEditTo.Text);
        if T.cxRadioButtonAll.Checked    then begin prih := 1; ras := 1 end;
        if T.cxRadioButton3.Checked      then begin prih := 0; ras := 1 end;
        if T.cxRadioButtonPrihod.Checked then begin prih := 1; ras := 0 end;
        RSch             := T.ResSch;
        RKorSch          := T.ResKorSch;
        id_cust          := T.id_customer;
        id_ras_acc       := T.id_ras;
        id_acc           := T.id_ras_native;
        name_kontr_box   := T.cxButtonEdit3.text;
        name_ras_box     := T.cxButtonEdit5.Text;
        kontr_name       := T.cxTextEdit1.text;
        name_sch_box     := T.cxButtonEdit1.text;
        name_kor_sch_box := T.cxButtonEdit2.Text;
        num              := T.cxTextEditNumberDoc.Text;
        osnov            := T.cxTextEditNote.Text;
        fio              := T.cxTextEditFio.Text;

        if T.cxCheckBox2.Checked     then flag_sch        := true else flag_sch        := false;
        if T.cxCheckBox1.Checked     then flag_kor_sch    := true else flag_kor_sch    := false;
        if T.cxCheckBox3.Checked     then flag_num        := true else flag_num        := false;
        if T.cxCheckBoxSumma.Checked then flag_sum        := true else flag_sum        := false;
        if T.cxCheckBoxNote.Checked  then flag_note       := true else flag_note       := false;
        if T.cxCheckBox4.Checked     then flag_fio        := true else flag_fio        := false;
        if T.cxCheckBoxFio.Checked   then flag_kontr      := true else flag_kontr      := false;
        if T.RadioButton1.Checked    then flag_kontr_sp   := true else flag_kontr_sp   :=false;
        if T.RadioButton2.Checked    then flag_rs         := true else flag_rs         := false;
        if T.RadioButton3.Checked    then flag_name_konrt := true else flag_name_konrt := false;

        result := true;
    end
    else begin
        result := false;
    end;
    T.Free;

end;

procedure TfmFilterSpravka.cxCheckBox3Click(Sender: TObject);
begin
    if cxCheckBox3.Checked then
    begin
        cxLabel10.Visible           := false;
        cxTextEditNumberDoc.Visible := true;
    end else
    begin
        cxLabel10.Visible           := true;
        cxTextEditNumberDoc.Visible := false;
    end;
end;

procedure TfmFilterSpravka.cxCheckBox2Click(Sender: TObject);
 var i : integer;
   reg :  TRegistry;
begin
    if cxCheckBox2.Checked then
    BEGIN
        ResSch.TT := nil;
        cxButtonEdit1.Visible  := true;
        cxLabel1.Visible       := false;

        reg:=TRegistry.Create;
        try
            reg.RootKey:=HKEY_CURRENT_USER;
            if  reg.OpenKey('\Software\12300006759837\Nigol\2\',False) then
            begin
                    SetLength(ResSch.TT, 1);
                    ResSch.TT[0].id     := strtoint(reg.ReadString('SpravSchMainId'));
                    ResSch.TT[0].Number := reg.ReadString('SpravSchMainNumb');
                    cxButtonEdit1.Text := reg.ReadString('SpravSchMainNumb')

            end ;
        finally
            reg.Free;
        end;
    END else
    begin
        cxLabel1.Visible       := true;
        cxButtonEdit1.Visible  := false;
        ResSch.TT := nil;
        DataSetSch.Close;
        if kod_sys = 2 then
        begin
            DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_BALLANCE_SCH';
        end;
        if kod_sys = 1 then
        begin
            DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCHS('+IntToStr(id_user)+')';

        end;
        DataSetSch.Open;
        DataSetSch.FetchAll;
        DataSetSch.First;

        SetLength(ResSch.TT, DataSetSch.RecordCount);

        For i := 0 to DataSetSch.RecordCount-1 do
        begin
           ResSch.TT[i].id     := DataSetSch.fieldByName('ID_SCH').AsVariant;
           ResSch.TT[i].Number := DataSetSch.FieldByName('SCH_NUM').AsString;
           DataSetSch.next;
        end;
    end;
end;

procedure TfmFilterSpravka.cxCheckBox1Click(Sender: TObject);
begin
    if cxCheckBox1.Checked then
    begin
        if flag_na_visible then
            cxButtonEdit2PropertiesButtonClick(Sender, 1);
        cxLabel9.Visible       := false;
        cxButtonEdit2.Visible  := true;
//        cxButtonEdit2.SetFocus;
    end else
    begin
        cxButtonEdit2.Visible  := false;
        cxLabel9.Visible       := true;
    end;
end;

procedure TfmFilterSpravka.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    i : integer;
    Res : Variant;
begin
//    ResSch := 0;
    if ShowSchOsnowSpravka(self, self, Res) then
    begin
        cxButtonEdit1.Text := '';
        try
            if VarArrayDimCount(Res) > 0 then
            begin
                SetLength(ResSch.TT, 1);
                for i := 0 to 1000 do
                if (Res[i][0]<>null) and (Res[i][1]<>null) then
                begin

                   cxButtonEdit1.Text := Res[i][1] + ', ' + cxButtonEdit1.Text;
                   SetLength(ResSch.TT, length(ResSch.TT)+1);

                   ResSch.TT[i].id     := Res[i][0];
                   ResSch.TT[i].Number := Res[i][1];

                end;
            end;
        except
        end;
    end;
end;

procedure TfmFilterSpravka.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    i, j : integer;
    id : int64;
    res : variant;
begin
        Res := GlobalSPR.GetSch(self, d.Handle, fsNormal, Date, 1, 0, 0);
        if VarArrayDimCount(Res) > 0 then
        begin
            j := VarArrayHighBound(res, 1)-VarArrayLowBound(res, 1);
            cxButtonEdit2.Text := '';
            if j > 0 then
            begin
                cxButtonEdit2.Text := Un_R_file_Alex.KASSA_FIND_SCH_COL_1 + '- ' + IntToStr(j+1)+' (';
                SetLength(ResKorSch.TT, 1);
                for i := 0 to j do
                if (Res[i][0]<>null) and (Res[i][3]<>null) then
                begin
                    SetLength(ResKorSch.TT, length(ResKorSch.TT)+1);
                    ResKorSch.TT[i].id     := Res[i][0];
                    ResKorSch.TT[i].Number := Res[i][1];
                    cxButtonEdit2.Text := cxButtonEdit2.Text  + Res[i][3] + ', ';
                    id := Res[i][0];
                end;
                cxButtonEdit2.Text := Copy(cxButtonEdit2.Text, 1, length(cxButtonEdit2.Text)-2)  + ')';
            end;
            if j = 0 then
            begin
                cxButtonEdit2.Text := Un_R_file_Alex.KASSA_FIND_SCH_COL_1 + '- ' + IntToStr(j+1)+' (';
                SetLength(ResKorSch.TT, 1);
                for i := 0 to j do
                if (Res[i][0]<>null) and (Res[i][3]<>null) then
                begin
                    SetLength(ResKorSch.TT, length(ResKorSch.TT)+1);
                    ResKorSch.TT[i].id     := Res[i][0];
                    ResKorSch.TT[i].Number := Res[i][1];
                    cxButtonEdit2.Text := cxButtonEdit2.Text + Res[i][3] + ' - ' + Res[i][1];
                    id := Res[i][0];
                end;
                cxButtonEdit2.Text := cxButtonEdit2.Text + ')';
            end;
        end
        else
        begin
            if cxButtonEdit2.text = '' then
            begin
                cxCheckBox1.Checked   := false;
                cxLabel9.Visible      := true;
                cxButtonEdit2.Visible := false;
            end;
        end;
end;

procedure TfmFilterSpravka.cxCheckBoxDateClick(Sender: TObject);
begin
    cxCheckBoxDate.Checked := true;
end;

procedure TfmFilterSpravka.cxCheckBoxDateEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
    if flag_na_visible then
        cxDateEditFrom.SetFocus;
end;

procedure TfmFilterSpravka.SpeedButton1Click(Sender: TObject);
begin
    cxDateEditFrom.Date := IncMonth(cxDateEditFrom.Date, -1);
end;

procedure TfmFilterSpravka.cxDateEditFromKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Key = '#13') and (flag_na_visible) then
        cxCheckBoxFio.SetFocus;
end;

procedure TfmFilterSpravka.SpeedButton2Click(Sender: TObject);
begin
    cxDateEditFrom.Date := IncMonth(cxDateEditFrom.Date, 1);
end;

procedure TfmFilterSpravka.SpeedButton3Click(Sender: TObject);
begin
    cxDateEditTo.Date := IncMonth(cxDateEditTo.Date, -1);
end;

procedure TfmFilterSpravka.cxDateEditToKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Key = '#13') and (flag_na_visible) then
        cxCheckBoxSumma.SetFocus;
end;

procedure TfmFilterSpravka.SpeedButton4Click(Sender: TObject);
begin
    cxDateEditTo.Date := IncMonth(cxDateEditTo.Date, 1);
end;

procedure TfmFilterSpravka.cxCheckBoxSummaClick(Sender: TObject);
begin
    if cxCheckBoxSumma.Checked then
    begin
        cxLabel4.Visible := false;
        cxLabel7.Visible := true;
        cxLabel8.Visible := true;
        cxTextEditFrom.Visible := true;
        if flag_na_visible then cxTextEditFrom.SetFocus;
        cxTextEditTo.Visible   := true;
    end else
    begin
        cxLabel4.Visible := true;
        cxLabel7.Visible := false;
        cxLabel8.Visible := false;
        cxTextEditFrom.Visible := false;
        cxTextEditTo.Visible   := false;
    end;
end;

procedure TfmFilterSpravka.cxTextEditFromFocusChanged(Sender: TObject);
begin
    if (cxTextEditTo.Text <> '') and (cxTextEditFrom.Text <> '') then
    begin
        if StrToFloat(cxTextEditFrom.Text) > StrToFloat(cxTextEditTo.Text) then cxTextEditTo.Text := cxTextEditFrom.Text;
    end else
    begin
        if (cxTextEditFrom.Text = '') and (cxTextEditTo.Text <> '') then
        begin
            cxTextEditFrom.Text := cxTextEditTo.Text;
        end;
        if (cxTextEditFrom.Text = '') and (cxTextEditTo.Text = '') then cxCheckBoxSumma.Checked := false;
    end;
end;

procedure TfmFilterSpravka.cxTextEditFromKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Key = '#13') and (flag_na_visible) then
        cxTextEditTo.SetFocus;

    if Ord(Key) = VK_TAB then exit;
    if Ord(Key) <> VK_TAB then
    begin
        cxTextEditFrom.ClearSelection;
    end;

    if Key = '.' then Key := DecimalSeparator;

    if (Key = '-') and (Length(cxTextEditFrom.Text)>0)
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
        (Pos(DecimalSeparator, cxTextEditFrom.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditFrom.Text) - Pos(DecimalSeparator, cxTextEditFrom.Text) > 1) and (Pos(DecimalSeparator,cxTextEditFrom.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
end;

procedure TfmFilterSpravka.cxTextEditToFocusChanged(Sender: TObject);
begin
    if (cxTextEditTo.Text <> '') and (cxTextEditFrom.Text <> '') then
    begin
        if StrToFloat(cxTextEditFrom.Text) > StrToFloat(cxTextEditTo.Text) then cxTextEditTo.Text := cxTextEditFrom.Text;
    end else
    begin
        if (cxTextEditFrom.Text <> '') and (cxTextEditTo.Text = '') then
        begin
            cxTextEditTo.Text := cxTextEditFrom.Text;
        end;
        if (cxTextEditFrom.Text = '') and (cxTextEditTo.Text = '') then cxCheckBoxSumma.Checked := false;
    end;
end;

procedure TfmFilterSpravka.cxTextEditToKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Key = '#13') and (flag_na_visible) then
        cxCheckBoxFio.SetFocus;

    if Ord(Key) = VK_TAB then exit;
    if Ord(Key) <> VK_TAB then
    begin
        cxTextEditTo.ClearSelection;
    end;

    if Key = '.' then Key := DecimalSeparator;

    if (Key = '-') and (Length(cxTextEditTo.Text)>0)
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
        (Pos(DecimalSeparator, cxTextEditTo.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditTo.Text) - Pos(DecimalSeparator, cxTextEditTo.Text) > 1) and (Pos(DecimalSeparator,cxTextEditTo.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
end;

procedure TfmFilterSpravka.cxCheckBoxNoteClick(Sender: TObject);
begin
    if cxCheckBoxNote.Checked then
    begin
        cxLabel6.Visible       := false;
        cxTextEditNote.Visible := true;
        if flag_na_visible then cxTextEditNote.SetFocus;
    end else
    begin
        cxTextEditNote.Visible := false;
        cxLabel6.Visible       := true;
    end;
end;

procedure TfmFilterSpravka.cxTextEditNoteKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Key = '#13') and (flag_na_visible) then
        cxRadioButtonPrihod.SetFocus;
end;

procedure TfmFilterSpravka.cxCheckBoxFioClick(Sender: TObject);
begin
    if cxCheckBoxFio.Checked then
    begin
//        cxButtonEdit3PropertiesButtonClick(Sender, 1);
        cxLabel5.Visible      := false;
        RadioButton1.Enabled  := true;
        RadioButton2.Enabled  := true;
        RadioButton3.Enabled  := true;
        cxButtonEdit3.Visible := true;
        cxButtonEdit5.Visible := true;
        cxTextEdit1.Visible   := true;
    end else
    begin
        RadioButton1.Enabled  := false;
        RadioButton2.Enabled  := false;
        RadioButton3.Enabled  := false;
        cxButtonEdit3.Visible := false;
        cxButtonEdit5.Visible := false;
        cxTextEdit1.Visible   := false;
        cxLabel5.Visible      := true;
    end;
end;

procedure TfmFilterSpravka.RadioButton1Click(Sender: TObject);
begin
    if RadioButton1.Checked then
    begin
        cxButtonEdit3.Enabled := true;
        cxButtonEdit5.Enabled := false;
        cxTextEdit1.Enabled   := false;
        cxTextEdit2.Enabled   := false;
    end;
end;

procedure TfmFilterSpravka.cxButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    i, o : TSpravParams;
begin
    i := TSpravParams.Create;
    o := TSpravParams.Create;
    i['DataBase']     := Integer(d.Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := SelCustomer;//selRateAccount;
    LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
    begin
//        cxButtonEdit3.Visible := true;
        id_customer := o['ID_CUSTOMER'];
//        id_ras      := o['ID_RATE_ACCOUNT'];
        cxButtonEdit3.Text := {VarToStr(o['RATE_ACCOUNT']) + '   ' +} VarToStr(o['NAME_CUSTOMER']);
    end else
    begin
//        cxButtonEdit3.Visible := false;
        cxLabel5.Visible      := true;
        cxCheckBoxFio.Checked := false;
    end;
    i.Free;
    o.Free;
end;

procedure TfmFilterSpravka.RadioButton2Click(Sender: TObject);
begin
    if RadioButton2.Checked then
    begin
        cxButtonEdit3.Enabled := false;
        cxButtonEdit5.Enabled := true;
        cxTextEdit1.Enabled   := false;
        cxTextEdit2.Enabled   := true;
    end;
end;

procedure TfmFilterSpravka.cxButtonEdit5PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    i, o : TSpravParams;
begin
    i := TSpravParams.Create;
    o := TSpravParams.Create;
    i['DataBase']     := Integer(d.Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := selRateAccount;
    LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
    begin
//        cxButtonEdit3.Visible := true;
//        id_customer := o['ID_CUSTOMER'];
        id_ras      := o['ID_RATE_ACCOUNT'];
        cxButtonEdit5.Text := VarToStr(o['RATE_ACCOUNT']) + '  ' + VarToStr(o['MFO']);
        cxTextEdit2.Text   := VarToStr(o['NAME_CUSTOMER']);
    end else
    begin
//        cxButtonEdit3.Visible := false;
        cxLabel5.Visible      := true;
        cxCheckBoxFio.Checked := false;
    end;
    i.Free;
    o.Free;
end;

procedure TfmFilterSpravka.RadioButton3Click(Sender: TObject);
begin
    if RadioButton3.Checked then
    begin
        cxButtonEdit3.Enabled := false;
        cxButtonEdit5.Enabled := false;
        cxTextEdit1.Enabled   := true;
        cxTextEdit2.Enabled   := false;
        if flag_na_visible then cxTextEdit1.SetFocus;
    end;
end;

procedure TfmFilterSpravka.cxTextEdit1Exit(Sender: TObject);
begin
    if (cxTextEdit1.text = '') and (cxButtonEdit3.text = '') and (cxButtonEdit5.Text = '') then
    begin
        cxCheckBoxFio.Checked := false;
        cxLabel5.Visible      := true;
    end;
end;

procedure TfmFilterSpravka.ActionPrintExecute(Sender: TObject);
var
    s : string;
begin
    s := cxTextEdit1.Text;
    cxTextEdit1.Text := Ansiuppercase(s);
    cxTextEdit1.Text := Stringreplace(cxTextEdit1.Text, '''', '''''', [rfReplaceAll]);


    ModalResult := mrOk;

end;

procedure TfmFilterSpravka.ActionCloseExecute(Sender: TObject);
begin
    ModalResult := mrNo;
    close;
end;

procedure TfmFilterSpravka.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
    reg:TRegistry;
begin
    if FormStyle = fsMDIChild then Action := caFree;
    FormStorage1.SaveFormPlacement;
    reg:=TRegistry.Create;
    try
        reg.RootKey:=HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12300006759837\Nigol\2\',true) then
        begin
            if  cxCheckBox2.Checked then
            begin
                reg.writeString('SpravSchMainCheck', '1');
                reg.writeString('SpravSchMainId', inttostr(ResSch.TT[0].id));
                reg.writeString('SpravSchMainNumb', ResSch.TT[0].number);
            end
            else
                reg.writeString('SpravSchMainCheck', '0');
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;
end;

procedure TfmFilterSpravka.cxCheckBox4Click(Sender: TObject);
begin
    if cxCheckBox4.Checked then
    begin
        cxTextEditFio.Visible  := true;
        cxLabel11.Visible      := false;
    end else
    begin
        cxTextEditFio.Visible  := false;
        cxLabel11.Visible      := true;
    end;
end;

procedure TfmFilterSpravka.cxDateEditToPropertiesChange(Sender: TObject);
begin
    if cxDateEditTo.Date > cxDateEditTo.Properties.MaxDate then cxDateEditTo.Date := cxDateEditTo.Properties.MaxDate;
    if cxDateEditTo.Date < cxDateEditTo.Properties.MinDate then cxDateEditTo.Date := cxDateEditTo.Properties.MinDate;
end;

procedure TfmFilterSpravka.cxDateEditFromPropertiesChange(Sender: TObject);
begin
    if cxDateEditFrom.Date > cxDateEditFrom.Properties.MaxDate then cxDateEditFrom.Date := cxDateEditFrom.Properties.MaxDate;
    if cxDateEditFrom.Date < cxDateEditFrom.Properties.MinDate then cxDateEditFrom.Date := cxDateEditFrom.Properties.MInDate;
end;

procedure TfmFilterSpravka.FormShow(Sender: TObject);
var
    reg:TRegistry;
begin

    FormStorage1.RestoreFormPlacement;
    reg:=TRegistry.Create;
    try
        reg.RootKey:=HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12300006759837\Nigol\2\',False) then
        begin
             if (reg.ReadString('SpravSchMainCheck') = '1') then
             begin
                SetLength(ResSch.TT, 1);
                cxCheckBox2.Checked := true;
                ResSch.TT[0].id     := strtoint(reg.ReadString('SpravSchMainId'));
                ResSch.TT[0].Number := reg.ReadString('SpravSchMainNumb');
                cxButtonEdit1.Text := reg.ReadString('SpravSchMainNumb')
             end
             else
             begin
                cxCheckBox2.Checked := false

             end;

           { if  (reg.ReadString('FindcxRadioButton1')='1') then
            begin
                cxRadioButton1.Checked  := true;
            end
            else
            begin
                cxRadioButton1.Checked  := false;
            end;

            if  (reg.ReadString('FindcxRadioButton2')='1') then
            begin
                cxRadioButton2.Checked  := true;
            end
            else
            begin
                cxRadioButton2.Checked  := false;
            end;

            if (reg.ReadString('FindcxCheckBoxSumma')='1') then
            begin
                cxCheckBoxSumma.Checked := true;
            end
            else
            begin
                cxCheckBoxSumma.Checked := false;
            end;
                    }
            if  cxCheckBoxNote.Checked then
            begin
                reg.writeString('FindcxCheckBoxNote', '1');
            end
            else
            begin
                reg.writeString('FindcxCheckBoxNote', '0');
            end;

           { if  cxCheckBox8.Checked then
            begin
                reg.writeString('FindcxCheckBox8', '1');
            end
            else
            begin
                reg.writeString('FindcxCheckBox8', '0');
            end; }

            if  cxCheckBoxSumma.Checked then
            begin
                reg.writeString('FindcxCheckBox8', '1');
            end
            else
            begin
                reg.writeString('FindcxCheckBox8', '0');
            end;

            if  cxRadioButtonPrihod.Checked then
            begin
                reg.writeString('FindcxRadioButtonPrihod', '1');
            end
            else
            begin
                reg.writeString('FindcxRadioButtonPrihod', '0');
            end;

            if  cxRadioButton3.Checked then
            begin
                reg.writeString('FindcxRadioButton3', '1');
            end
            else
            begin
                reg.writeString('FindcxRadioButton3', '0');
            end;

            if  cxRadioButtonAll.Checked then
            begin
                reg.writeString('FindcxRadioButtonAll', '1');
            end
            else
            begin
                reg.writeString('FindcxRadioButtonAll', '0');
            end;

        end ;
    finally
        reg.Free;
    end;
end;

end.
