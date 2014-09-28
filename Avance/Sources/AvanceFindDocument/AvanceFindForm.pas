unit AvanceFindForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxRadioGroup,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxCheckBox,
  cxGroupBox, cxControls, cxContainer, cxEdit, cxButtonEdit, cxLabel,
  ImgList, ActnList, fibDataBase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, Un_R_file_Alex, GlobalSPR;

type
  TSchA = record
      id : int64;
      number : string;
  end;
  TResSchA = record
      TT : array of TSchA;
  end;

  TfmAvanceFindForm = class(TForm)
    cxRadioGroup1: TcxRadioGroup;
    cxGroupBox1: TcxGroupBox;
    cxCheckBoxDate: TcxCheckBox;
    cxDateEditFrom: TcxDateEdit;
    cxDateEditTo: TcxDateEdit;
    cxRadioButtonAll: TcxRadioButton;
    cxRadioButtonPrihod: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    cxGroupBox2: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGroupBox3: TcxGroupBox;
    cxCheckBox2: TcxCheckBox;
    cxLabel1: TcxLabel;
    cxButtonEdit1: TcxButtonEdit;
    cxCheckBoxSumma: TcxCheckBox;
    cxCheckBoxFio: TcxCheckBox;
    cxCheckBoxNote: TcxCheckBox;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    ActionList1: TActionList;
    ActionPrint: TAction;
    ActionClose: TAction;
    ImageList1: TImageList;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxTextEditFrom: TcxTextEdit;
    cxTextEditTo: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxTextEditFio: TcxTextEdit;
    cxTextEditNote: TcxTextEdit;
    pFIBDataSet1: TpFIBDataSet;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    cxCheckBox1: TcxCheckBox;
    cxButtonEdit2: TcxButtonEdit;
    cxLabel9: TcxLabel;
    cxCheckBoxNumber: TcxCheckBox;
    cxLabel10: TcxLabel;
    cxTextEditNumber: TcxTextEdit;
    cxRadioButton2: TcxRadioButton;
    cxRadioButton4: TcxRadioButton;
    cxButtonEdit3: TcxButtonEdit;
    cxGroupBox4: TcxGroupBox;
    cxCheckBox3: TcxCheckBox;
    cxCheckBox6: TcxCheckBox;
    cxButtonEdit4: TcxButtonEdit;
    cxButtonEdit5: TcxButtonEdit;
    cxButtonEdit6: TcxButtonEdit;
    cxButtonEdit7: TcxButtonEdit;
    cxCheckBox9: TcxCheckBox;
    cxCheckBox4: TcxRadioButton;
    cxCheckBox5: TcxRadioButton;
    cxCheckBoxKom: TcxCheckBox;
    cxDateKomFrom: TcxDateEdit;
    cxDateKomTo: TcxDateEdit;
    cxLabelFrom: TcxLabel;
    cxLabelTo: TcxLabel;
    procedure cxTextEditFromKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditToKeyPress(Sender: TObject; var Key: Char);
    procedure cxDateEditFromKeyPress(Sender: TObject; var Key: Char);
    procedure cxDateEditToKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditNoteKeyPress(Sender: TObject; var Key: Char);
    procedure cxCheckBoxDateEditing(Sender: TObject; var CanEdit: Boolean);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox2Click(Sender: TObject);
    procedure cxCheckBoxSummaClick(Sender: TObject);
    procedure cxCheckBoxNoteClick(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBoxDateClick(Sender: TObject);
    procedure cxCheckBoxFioClick(Sender: TObject);
    procedure cxCheckBoxNumberClick(Sender: TObject);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxRadioButton2Click(Sender: TObject);
    procedure cxRadioButton4Click(Sender: TObject);
    procedure cxCheckBox3Click(Sender: TObject);
    procedure cxCheckBox6Click(Sender: TObject);
    procedure cxCheckBox9Click(Sender: TObject);
    procedure cxCheckBox4Click(Sender: TObject);
    procedure cxCheckBox5Click(Sender: TObject);
    procedure cxButtonEdit4PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit7PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit5PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit6PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    function CheckedFilter : Boolean;
    procedure cxCheckBoxKomClick(Sender: TObject);
    procedure cxTextEditFromFocusChanged(Sender: TObject);
    procedure cxTextEditToFocusChanged(Sender: TObject);
  private
    Owner : TComponent;
    flag_fio, flag_note, flag_number : boolean;
  public
    ResSch : TResSchA;
    ResKorSch : TResSchA;
    d : TPfibDataBase;
    id_user, id_man, id_smeta, id_razd, id_state, id_kekv : int64;
    constructor Create(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase); reintroduce; overload;
//    constructor Create(AOwner: TComponent; mainform: TMainDocClass; m : TfmModeShowDoc); reintroduce; overload;
  end;

function AvanceShowFindOrder(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase): integer; stdcall;
   exports AvanceShowFindOrder;


implementation

uses DateUtils, AvanceResultFindForm, AvanceSchSelect, Un_lo_file_Alex;

{$R *.dfm}

function AvanceShowFindOrder(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase): integer;
var
    T : TfmAvanceFindForm;
begin
    T := TfmAvanceFindForm.Create(AOwner, id_us, DB);
    T.Show;
    AvanceShowFindOrder := -1;
end;

constructor TfmAvanceFindForm.Create(AOwner: TComponent; id_us: int64;
  DB: TpFIBDatabase);
var
    i : integer;
begin
    inherited Create(AOwner);
    Owner := AOwner;

    d                                := DB;
    pFIBTransaction1.DefaultDatabase := d;
    D.DefaultTransaction             := pFIBTransaction1;

    pFIBDataSet1.Database            := DB;
    pFIBDataSet1.Transaction         := pFIBTransaction1;

    pFIBTransaction1.StartTransaction;

    cxDateEditTo.Date   := date;
    cxDateKomFrom.Date  := date;
    cxDateKomTo.Date    := date;
    cxTextEditFrom.Text := '0';
    cxTextEditTo.Text   := '1000000000';
    id_user := id_us;


    pFIBDataSet1.Close;
    pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM J4_INI';
    pFIBDataSet1.Open;
    cxDateEditFrom.Date := IncDay(date, -pFIBDataSet1.FieldByName('J4_DAY_SHOW_LAST').AsInteger);

    if pFIBDataSet1.FieldByName('NO_VIS_DATE_KOM').AsInteger = 1 then
    begin
        cxCheckBoxKom.Visible  := true;
    end else
    begin
        cxCheckBoxKom.Visible  := false;
    end;

    pFIBDataSet1.Close;
    pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT distinct * FROM J4_SELECT_ALL_SCHS';
    pFIBDataSet1.Open;

    pFIBDataSet1.FetchAll;
    pFIBDataSet1.First;
    SetLength(ResSch.TT, pFIBDataSet1.RecordCount);
    For i := 0 to pFIBDataSet1.RecordCount-1 do
    begin
       ResSch.TT[i].id     := TFIBBCDField(pFIBDataSet1.fieldByName('ID_SCH')).AsInt64;
       ResSch.TT[i].Number := pFIBDataSet1.FieldByName('SCH_NUM').AsString;
       pFIBDataSet1.Next;
    end;

    Caption                    := Un_R_file_Alex.AVANCE_FIND_CAP_15;
    cxGroupBox2.Caption        := Un_R_file_Alex.J4_OSTATOK_ADD_FORM_GR_4;
    cxCheckBox2.Properties.Caption := Un_R_file_Alex.KASSA_FIND_CAP_14;
    cxLabel1.Caption           := Un_R_file_Alex.KASSA_FIND_CAP_1;
    cxCheckBoxDate.Properties.Caption := Un_R_file_Alex.KASSA_FIND_CAP_10;
    cxCheckBoxSumma.Properties.Caption := Un_R_file_Alex.KASSA_FIND_CAP_11;
    cxCheckBoxFio.Properties.Caption := Un_R_file_Alex.KASSA_FIND_CAP_12;
    cxCheckBoxNote.Properties.Caption := Un_R_file_Alex.KASSA_FIND_CAP_13;
//    cxRadioButtonPrihod.Caption := Un_R_file_Alex.KASSA_FIND_CAP_7;
//    cxRadioButton3.Caption      := Un_R_file_Alex.KASSA_FIND_CAP_8;
//    cxRadioButtonAll.Caption    := Un_R_file_Alex.KASSA_FIND_CAP_9;
    ActionPrint.Caption         := Un_R_file_Alex.MY_BUTTON_F;
    ActionClose.Caption         := Un_R_file_Alex.MY_BUTTON_CANCEL_CONST;
    cxLabel2.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_2;
    cxLabel3.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_3;
    cxLabel4.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_4;
    cxLabel5.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_5;
    cxLabel6.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_6;
    cxLabel7.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_2;
    cxLabel8.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_3;
    cxLabelFrom.Caption         := Un_R_file_Alex.J4_MAIN_FORM_FROM;
    cxLabelTo.Caption           := Un_R_file_Alex.J4_MAIN_FORM_TO;
    cxCheckBox1.Properties.Caption   := Un_R_file_Alex.KASSA_FIND_CAP_17;
    cxLabel9.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_16;

    cxCheckBoxNumber.Properties.Caption := Un_R_file_Alex.AVANCE_FIND_PO_NUMBER;
    cxLabel10.Caption                   := Un_R_file_Alex.AVANCE_FIND_PO_NUMBER_LABEL;
    cxCheckBoxFio.Properties.Caption    := Un_R_file_Alex.AVANCE_FIND_FIO;
    cxRadioButton2.Caption              := Un_R_file_Alex.AVANCE_FIND_FIO_PO_SP;
    cxRadioButton4.Caption              := Un_R_file_Alex.AVANCE_FIND_FIO_PO_VKL;

    cxCheckBox3.Properties.Caption      := Un_R_file_Alex.KASSA_FIND_PO_SMETA;
    cxCheckBox4.Caption                 := Un_R_file_Alex.KASSA_FIND_PO_RAZD;
    cxCheckBox5.Caption                 := 'Пошук по розділу і ст.';
    cxCheckBox6.Properties.Caption      := Un_R_file_Alex.KASSA_FIND_PO_KEKV;
    cxCheckBox9.Properties.Caption      := 'Пошук по розділу і статті';
    cxCheckBoxKom.Properties.Caption    := Un_R_file_Alex.J4_AVANCE_KOM_SEARCH;

    flag_fio    := false;
    flag_note   := false;
    flag_number := false;
end;


procedure TfmAvanceFindForm.cxTextEditFromKeyPress(Sender: TObject;
  var Key: Char);
begin
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
    if ((Length(cxTextEditFrom.Text) - Pos(DecimalSeparator, cxTextEditFrom.Text) > 1) and (Pos(DecimalSeparator, cxTextEditFrom.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
    if Key = '#13' then
        cxTextEditTo.SetFocus;
end;

procedure TfmAvanceFindForm.cxTextEditToKeyPress(Sender: TObject;
  var Key: Char);
begin
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
    if ((Length(cxTextEditTo.Text) - Pos(DecimalSeparator, cxTextEditTo.Text) > 1) and (Pos(DecimalSeparator, cxTextEditTo.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
    if Key = '#13' then
        cxCheckBoxFio.SetFocus;
end;

procedure TfmAvanceFindForm.cxDateEditFromKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = '#13' then
        cxDateEditTo.SetFocus;
end;

procedure TfmAvanceFindForm.cxDateEditToKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = '#13' then
        cxCheckBoxSumma.SetFocus;
end;

procedure TfmAvanceFindForm.cxTextEditNoteKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = '#13' then
        cxRadioButtonPrihod.SetFocus;
end;

procedure TfmAvanceFindForm.cxCheckBoxDateEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
    if not cxCheckBoxDate.Checked then
    begin
        cxDateEditFrom.SetFocus;
    end else
    begin
        cxDateEditFrom.SetFocus;
    end;
end;

procedure TfmAvanceFindForm.ActionCloseExecute(Sender: TObject);
begin
    close;
end;

procedure TfmAvanceFindForm.ActionPrintExecute(Sender: TObject);
var
    T : TfmAvanceResultFindForm;
    s1, s2 : double;
    mes    : string;
    flag   : boolean;
begin
    flag := false;
    mes := '';
    
    if cxDateKomFrom.Date>cxDateKomTo.Date then
    begin
        if not flag then
        begin
            mes := Un_R_file_Alex.J4_ADD_WARNING_DATE;
            cxDateKomFrom.SetFocus;
        end;
        FLAG := TRUE;
    end ;

    if flag then
    begin
        showmessage(mes);
        exit;
    end;

    if CheckedFilter then
    begin
        if cxCheckBoxSumma.Checked then
        begin
            s1 := StrToFloat(cxTextEditFrom.Text);
            s2 := StrToFloat(cxTextEditTo.Text);
            if s1 > s2 then
            begin
                Showmessage(Un_R_file_Alex.KASSA_FIND_ERROR_SUMMA);
                exit;
            end;
        end;

        if cxCheckBoxFio.Checked then
        begin
            if (cxRadioButton2.Checked) and (cxButtonEdit3.Text    = '') then cxCheckBoxFio.Checked := false;
            if (cxRadioButton4.Checked) and (cxTextEditFio.Text    = '') then cxCheckBoxFio.Checked := false;
        end;

        if cxTextEditNote.Text = '' then
            cxCheckBoxNote.Checked := false;
        if cxTextEditNumber.Text = '' then
            cxCheckBoxNumber.Checked := false;

        cxTextEditFio.Text    := Ansiuppercase(cxTextEditFio.Text);
        cxTextEditNote.Text   := Ansiuppercase(cxTextEditNote.Text);
        cxTextEditNumber.Text := Ansiuppercase(cxTextEditNumber.Text);

        T := TfmAvanceResultFindForm.Create(self, self);
        T.ShowModal;
        T.Free;
    end;
end;

procedure TfmAvanceFindForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmAvanceFindForm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    i, j : integer;
    Res : variant;
begin
    if ShowSchAvance(self, self, Res) then
    begin
        j := VarArrayHighBound(res, 1)-VarArrayLowBound(res, 1);
        if j > 0 then
        begin
            cxButtonEdit1.Text := Un_R_file_Alex.KASSA_FIND_SCH_COL_1 + '- ' + IntToStr(j+1)+' (';
            SetLength(ResSch.TT, 1);
            for i := 0 to j do
            if (Res[i][0]<>null) and (Res[i][3]<>null) then
            begin
                cxButtonEdit1.Text := cxButtonEdit1.Text + Res[i][1] + ', ';
                SetLength(ResSch.TT, length(ResSch.TT)+1);
                ResSch.TT[i].id     := Res[i][0];
                ResSch.TT[i].Number := Res[i][1];
            end;
            cxButtonEdit1.Text := Copy(cxButtonEdit1.Text, 1, length(cxButtonEdit1.Text)-2)  + ')';
        end;
        if j = 0 then
        begin
            cxButtonEdit1.Text := Un_R_file_Alex.KASSA_FIND_SCH_COL_1 + '- ' + IntToStr(j+1)+' (';
            SetLength(ResSch.TT, 1);
            for i := 0 to j do
            if (Res[i][0]<>null) then
            begin
                SetLength(ResSch.TT, length(ResSch.TT)+1);
                ResSch.TT[i].id     := Res[i][0];
                ResSch.TT[i].Number := Res[i][1];
                cxButtonEdit1.Text := cxButtonEdit1.Text + Res[i][1] + ' - ' + Res[i][2];
            end;
            cxButtonEdit1.Text := cxButtonEdit1.Text + ')';
        end;
    end else
    begin
        cxCheckBox2.Checked   := false;
    end;
end;

procedure TfmAvanceFindForm.cxCheckBox2Click(Sender: TObject);
begin
    if cxCheckBox2.Checked then
    BEGIN
        cxButtonEdit1.Visible  := true;
        cxLabel1.Visible       := false;
        cxButtonEdit1PropertiesButtonClick(Sender, 1);
    END else
    begin
        cxLabel1.Visible       := true;
        cxButtonEdit1.Visible  := false;
    end;
end;

procedure TfmAvanceFindForm.cxCheckBoxSummaClick(Sender: TObject);
begin
    if cxCheckBoxSumma.Checked then
    begin
        cxLabel4.Visible := false;
        cxLabel7.Visible := true;
        cxLabel8.Visible := true;
        cxTextEditFrom.Visible := true;
        cxTextEditFrom.SetFocus;
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

procedure TfmAvanceFindForm.cxCheckBoxNoteClick(Sender: TObject);
begin
    if cxCheckBoxNote.Checked then
    begin
        cxLabel6.Visible       := false;
        cxTextEditNote.Visible := true;
        cxTextEditNote.SetFocus;
    end else
    begin
        cxTextEditNote.Visible := false;
        cxLabel6.Visible       := true;
    end;
end;

procedure TfmAvanceFindForm.cxCheckBox1Click(Sender: TObject);
begin
    if cxCheckBox1.Checked then
    begin
        cxLabel9.Visible      := false;
        cxButtonEdit2.Visible := true;
        cxButtonEdit2.SetFocus;
        cxButtonEdit2PropertiesButtonClick(self, 1);
    end else
    begin
        cxButtonEdit2.Visible := false;
        cxLabel9.Visible       := true;
    end;
end;

procedure TfmAvanceFindForm.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    i, j  : integer;
    res : Variant;
begin
    Res := GlobalSPR.GetSch(self, d.Handle, fsNormal, Date, 1, 0, 0);
    if VarArrAyDimCount(res) > 0
    then
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
//                id := Res[i][0];
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
//                id := Res[i][0];
            end;
            cxButtonEdit2.Text := cxButtonEdit2.Text + ')';
        end;
    end else
    begin
        cxCheckBox1.Checked   := false;
        cxButtonEdit2.Visible := false;
        cxLabel9.Visible      := true;
    end;
end;

procedure TfmAvanceFindForm.cxCheckBoxDateClick(Sender: TObject);
begin
    cxCheckBoxDate.Checked := true;
end;

procedure TfmAvanceFindForm.cxCheckBoxFioClick(Sender: TObject);
begin
    if cxCheckBoxFio.Checked  then
    begin
        cxRadioButton2.Enabled := true;
        cxRadioButton4.Enabled := true;
        if cxRadioButton2.Checked then cxButtonEdit3.Visible    := true;
        if cxRadioButton4.Checked then cxTextEditFio.Visible    := true;
    end else
    begin
        cxRadioButton2.Enabled := false;
        cxRadioButton4.Enabled := false;
        if cxRadioButton2.Checked then cxButtonEdit3.Visible    := false;
        if cxRadioButton4.Checked then cxTextEditFio.Visible    := false;
    end;
end;

procedure TfmAvanceFindForm.cxCheckBoxNumberClick(Sender: TObject);
begin
    if cxCheckBoxNumber.Checked  then
    begin
        cxTextEditNumber.Visible := true;
        cxLabel10.Visible        := false;
        cxTextEditNumber.SetFocus;
        flag_number := true;
    end else
    begin
        cxTextEditNumber.Visible := false;
        cxLabel10.Visible        := true;
        flag_number              := false;
    end;
end;

procedure TfmAvanceFindForm.cxButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Res : Variant;
begin
    Res := Un_lo_file_Alex.MY_GetManEx(self, d.Handle, false, false, id_man);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) then
        begin
            id_man := res[0];
            cxButtonEdit3.Text := res[1];
        end;
    end;
end;

procedure TfmAvanceFindForm.cxRadioButton2Click(Sender: TObject);
begin
    if cxRadioButton2.Checked then
    begin
        cxButtonEdit3.Visible    := true;
        cxTextEditFio.Visible    := false;
    end else
    begin
        cxButtonEdit3.Visible := false;
    end;
end;

procedure TfmAvanceFindForm.cxRadioButton4Click(Sender: TObject);
begin
    if (cxRadioButton4.Checked) then
    begin
        cxButtonEdit3.Visible    := false;
        cxTextEditFio.Visible    := true;
    end else
    begin
        cxTextEditFio.Visible    := false;
    end;
end;

procedure TfmAvanceFindForm.cxCheckBox3Click(Sender: TObject);
begin
    if cxCheckBox3.Checked then
    begin
        cxButtonEdit4.Visible := true;
        cxButtonEdit4.SetFocus;
        cxButtonEdit4PropertiesButtonClick(self, 0);
    end else
    begin
        cxButtonEdit4.Visible := false;
    end;
end;

procedure TfmAvanceFindForm.cxCheckBox6Click(Sender: TObject);
begin
    if cxCheckBox6.Checked then
    begin
        cxButtonEdit7.Visible := true;
        cxButtonEdit7.SetFocus;
        cxButtonEdit7PropertiesButtonClick(self, 1);
    end else
    begin
        cxButtonEdit7.Visible := false;
    end;
end;

procedure TfmAvanceFindForm.cxCheckBox9Click(Sender: TObject);
begin
    if cxCheckBox9.checked then
    begin
        cxCheckbox4.visible:=true;
        cxCheckBox5.visible:=True;
    end else
    begin
        cxCheckbox4.visible:=false;
        cxCheckBox5.visible:=False;
        cxButtonEdit5.visible:=False;
        cxButtonEdit6.visible:=False;
    end;
end;

procedure TfmAvanceFindForm.cxCheckBox4Click(Sender: TObject);
begin
    if cxCheckBox4.Checked then
    begin
        cxButtonEdit5.Visible := true;
        cxButtonEdit6.Visible := false;
        cxButtonEdit5.SetFocus;
        cxButtonEdit5PropertiesButtonClick(self, 0);
    end else
    begin
        cxButtonEdit5.Visible := false;
    end;
end;

procedure TfmAvanceFindForm.cxCheckBox5Click(Sender: TObject);
begin
    if cxCheckBox5.Checked then
    begin
        cxButtonEdit6.Visible := true;
        cxButtonEdit5.Visible := false;
        cxButtonEdit6.SetFocus;
        cxButtonEdit6PropertiesButtonClick(self, 0);
    end else
    begin
        cxButtonEdit6.Visible := false;
    end;
end;

procedure TfmAvanceFindForm.cxButtonEdit4PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    rr : variant;
begin
    rr := GlobalSPR.GetSmets(Self, d.Handle, date, psmSmet);
    if VarArrayDimCount(rr)>0 then
    begin
        if rr[0]<>NULL then
        begin
            id_smeta           := rr[0];
            cxButtonEdit4.Text := VarToStr(rr[3]) + ' ' + VarToStr(rr[2]);
        end;
    end;
end;

procedure TfmAvanceFindForm.cxButtonEdit7PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    id : variant;
begin
    id := GlobalSPR.GetKEKVSpr(self, d.Handle, FSNormal, Date, 1);
    if VarArrayDimCount(id)>0 then
    begin
        if VarArrayDimCount(id)>0 then
        begin
             if id[0][0]<>NULL then
             begin
                 id_kekv            := id[0][0];
                 cxButtonEdit7.Text := VarToStr(id[0][2]) + ' ' + VArToStr(id[0][1]);
             end;
        end;
    end else
    begin
        cxCheckBox6.Checked := false;
    end;
end;

procedure TfmAvanceFindForm.cxButtonEdit5PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    rr : variant;
begin
    rr := GlobalSPR.GetRazdStSpr(Self, d.Handle, fsNormal, date, 0, allEnable, cmRazd);
    try
    begin
        id_razd := rr;
        pFIBDataSet1.Close;
        pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM pub_get_name_budg_by_id('+IntToStr(id_razd)+', '''+DateToStr(Date)+''', '+IntToStr(2)+')';
        pFIBDataSet1.Open;
        cxButtonEdit5.Text := pFIBDataSet1.FieldByName('KOD_OBJECT').AsString + ' - ' + pFIBDataSet1.FieldByName('TITLE_OBJECT').AsString;
        pFIBDataSet1.Close;
    end;
    except
        cxCheckBox5.Checked := false;
    end;
end;

procedure TfmAvanceFindForm.cxButtonEdit6PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    rr : variant;
begin
    rr := GlobalSPR.GetRazdStSpr(Self, d.Handle, fsNormal, date, 0, allEnable, cmSt);
    try
    begin
        id_state := rr;
        pFIBDataSet1.Close;
        pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM pub_get_name_budg_by_id('+IntToStr(id_state)+', '''+DateToStr(Date)+''', '+IntToStr(3)+')';
        pFIBDataSet1.Open;
        cxButtonEdit6.Text := pFIBDataSet1.FieldByName('KOD_OBJECT').AsString + ' - ' + pFIBDataSet1.FieldByName('TITLE_OBJECT').AsString;
        pFIBDataSet1.Close;
    end;
    except
        cxCheckBox6.Checked := false;
    end;
end;

function TfmAvanceFindForm.CheckedFilter: Boolean;
var
    TextError: String;
    CountError: Integer;
begin
    TextError  := '';
    CountError := 0;
    checkedFilter := True;

    if cxCheckBoxDate.Checked = True then
    begin
        if cxDateEditFrom.Date > Date then
        begin
            CheckedFilter := False;
            if CountError > 0 then
            TextError := TextError + #13#10;
            TextError := TextError + 'Дата документу "З" не може бути більшою за сьогоднішню дату!';
            CountError := CountError + 1;
            cxDateEditFrom.SetFocus;
        end;

        if cxDateEditTo.Date > Date then
        begin
            CheckedFilter := False;
            if CountError > 0 then
            TextError := TextError + #13#10;
            TextError := TextError + 'Дата документу "До" не може бути більшою за сьогоднішню дату!';
            CountError := CountError + 1;
            cxDateEditTo.SetFocus;
        end;

        if cxDateEditFrom.Date > cxDateEditTo.Date then
        begin
            CheckedFilter := False;
            if CountError > 0 then
            TextError := TextError + #13#10;
            TextError := TextError + 'Дата документу "З" не може бути більшою за дату "До"!';
            CountError := CountError + 1;
            cxDateEditFrom.SetFocus;
        end;
    end;

    if cxCheckBoxSumma.Checked = True then
    if strtofloat(cxTextEditFrom.text) > strtofloat(cxTextEditTo.text) then
    begin
        CheckedFilter := False;
        if CountError > 0 then
        TextError := TextError + #13#10;
        TextError := TextError + 'Сума документу "З" не може перевищувати суму "До"!';
        CountError := CountError + 1;
        cxTextEditFrom.SetFocus;
    end;

    if CountError > 0
    then ShowMessage('Некоректний запит:' + #13#10+ TextError);
end;

procedure TfmAvanceFindForm.cxCheckBoxKomClick(Sender: TObject);
begin
    if  cxCheckBoxKom.Checked then
    begin
        cxDateKomFrom.Visible      := true;
        cxDateKomTo.Visible        := true;
        cxLabelFrom.Visible        := true;
        cxLabelTo.Visible          := true;
    end else
    begin
        cxDateKomFrom.Visible      := false;
        cxDateKomTo.Visible        := false;
        cxLabelFrom.Visible        := false;
        cxLabelTo.Visible          := false;
    end;
end;

procedure TfmAvanceFindForm.cxTextEditFromFocusChanged(Sender: TObject);
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


procedure TfmAvanceFindForm.cxTextEditToFocusChanged(Sender: TObject);
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

end.
