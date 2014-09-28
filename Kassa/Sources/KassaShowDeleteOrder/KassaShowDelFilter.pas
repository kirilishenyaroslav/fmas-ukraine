unit KassaShowDelFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxRadioGroup,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxCheckBox,
  cxGroupBox, cxControls, cxContainer, cxEdit, cxButtonEdit, cxLabel,
  ImgList, ActnList, fibDataBase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, Un_R_file_Alex, {GlobalSPR,}
  cxGraphics, dxStatusBar;

type
  TSchK = record
      id : int64;
      number : string;
  end;
  TResSchK = record
      TT : array of TSchK;
  end;

  TfmKassaShowDelFilter = class(TForm)
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
    dxStatusBar1: TdxStatusBar;
    procedure cxTextEditFromKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditToKeyPress(Sender: TObject; var Key: Char);
    procedure cxDateEditFromKeyPress(Sender: TObject; var Key: Char);
    procedure cxDateEditToKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditNoteKeyPress(Sender: TObject; var Key: Char);
    procedure cxCheckBoxDateEditing(Sender: TObject; var CanEdit: Boolean);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox2Click(Sender: TObject);
    procedure cxCheckBoxSummaClick(Sender: TObject);
    procedure cxCheckBoxFioClick(Sender: TObject);
    procedure cxCheckBoxNoteClick(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxTextEditFioExit(Sender: TObject);
    procedure cxTextEditNoteExit(Sender: TObject);
    procedure cxCheckBoxDateClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    Owner : TComponent;
  public
    ResSch : TResSchK;
    ResKorSch : TResSchK;
    d : TPfibDataBase;
    id_user : int64;
//    constructor Create(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase); reintroduce; overload;
  end;

function KassaShowDelFilt(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; var date_beg, date_end, sum_beg, sum_end, fio, note : string; var prihod, rashod : integer): boolean;


implementation

uses DateUtils, KassaShowDelSchSelect;

{$R *.dfm}

function KassaShowDelFilt(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; var date_beg, date_end, sum_beg, sum_end, fio, note : string; var prihod, rashod : integer): boolean;
var
    T : TfmKassaShowDelFilter;
    id : int64;
    i : integer;
    number : string;
begin
    T := TfmKassaShowDelFilter.Create(nil);
    T.cxTextEditFrom.Text := '0';
    T.cxTextEditTo.Text   := '9990000000000';
    T.d                   := DB;
    T.pFIBTransaction1.DefaultDatabase := T.d;
    T.id_user             := id_us;

    T.pFIBDataSet1.Database := DB;
    T.pFIBDataSet1.Transaction := T.pFIBTransaction1;
    T.pFIBDataSet1.Transaction.StartTransaction;
    T.pFIBDataSet1.Close;
    T.pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_INI';
    T.pFIBDataSet1.Open;
    T.cxDateEditTo.Date   := date;
    T.cxDateEditFrom.Date := IncDay(date, -T.pFIBDataSet1.FieldByname('KASSA_DAY_SHOW_LAST').AsInteger);
    T.pFIBDataSet1.Close;
    T.pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCHS('+IntToStr(id_us)+')';
    T.pFIBDataSet1.Open;
    T.pFIBDataSet1.FetchAll;
    T.pFIBDataSet1.First;

    SetLength(T.ResSch.TT, T.pFIBDataSet1.RecordCount);

    For i := 0 to T.pFIBDataSet1.RecordCount-1 do
    begin
       T.ResSch.TT[i].id     := TFIBBCDField(T.pFIBDataSet1.fieldByName('ID_SCH')).AsInt64;
       T.ResSch.TT[i].Number := T.pFIBDataSet1.FieldByName('SCH_NUM').AsString;
       T.pFIBDataSet1.next;
    end;

    T.Caption                    := Un_R_file_Alex.KASSA_FIND_CAP_15;
//    cxGroupBox3.Caption        := Un_R_file_Alex.;
    T.cxGroupBox2.Caption        := Un_R_file_Alex.J4_OSTATOK_ADD_FORM_GR_4;
//    cxGroupBox1.Caption        := Un_R_file_Alex.;
    T.cxCheckBox2.Properties.Caption := Un_R_file_Alex.KASSA_FIND_CAP_14;
    T.cxLabel1.Caption           := Un_R_file_Alex.KASSA_FIND_CAP_1;
    T.cxCheckBoxDate.Properties.Caption := Un_R_file_Alex.KASSA_FIND_CAP_10;
    T.cxCheckBoxSumma.Properties.Caption := Un_R_file_Alex.KASSA_FIND_CAP_11;
    T.cxCheckBoxFio.Properties.Caption := Un_R_file_Alex.KASSA_FIND_CAP_12;
    T.cxCheckBoxNote.Properties.Caption := Un_R_file_Alex.KASSA_FIND_CAP_13;
    T.cxRadioButtonPrihod.Caption := Un_R_file_Alex.KASSA_FIND_CAP_7;
    T.cxRadioButton3.Caption      := Un_R_file_Alex.KASSA_FIND_CAP_8;
    T.cxRadioButtonAll.Caption    := Un_R_file_Alex.KASSA_FIND_CAP_9;
    T.ActionPrint.Caption         := Un_R_file_Alex.MY_BUTTON_F;
    T.ActionClose.Caption         := Un_R_file_Alex.MY_BUTTON_CANCEL_CONST;
    T.cxLabel2.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_2;
    T.cxLabel3.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_3;
    T.cxLabel4.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_4;
    T.cxLabel5.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_5;
    T.cxLabel6.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_6;
    T.cxLabel7.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_2;
    T.cxLabel8.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_3;
    T.cxCheckBox1.Properties.Caption   := Un_R_file_Alex.KASSA_FIND_CAP_17;
    T.cxLabel9.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_16;

    T.dxStatusBar1.Panels[0].Text := Un_R_file_Alex.J4_BAR_TAB_SELECT  + ' - Tab';
    T.dxStatusBar1.Panels[1].Text := Un_R_file_Alex.MY_BUTTON_GET      + ' - Space';
    T.dxStatusBar1.Panels[2].Text := Un_R_file_Alex.MY_BUTTON_FIND     + ' - F10';

    if T.Showmodal=mrOK then
    begin
        date_beg := T.cxDateEditFrom.Text;
        date_end := T.cxDateEditTo.Text;
        sum_beg  := T.cxTextEditFrom.Text;
        sum_end  := T.cxTextEditTo.Text;
        fio      := T.cxTextEditFio.Text;
        note     := T.cxTextEditNote.Text;
        if T.cxRadioButtonPrihod.Checked then
        begin
            prihod := 1;
            rashod := 0;
        end;
        if T.cxRadioButton3.Checked then
        begin
            prihod := 0;
            rashod := 1;
        end;
        if T.cxRadioButtonAll.Checked then
        begin
            prihod := 1;
            rashod := 1;
        end;
        result := true;
    end else
    begin
        result := false;
    end;
    T.Free;
end;


procedure TfmKassaShowDelFilter.cxTextEditFromKeyPress(Sender: TObject;
  var Key: Char);
begin
{    if Key = '#13' then
        cxTextEditTo.SetFocus;}
end;

procedure TfmKassaShowDelFilter.cxTextEditToKeyPress(Sender: TObject;
  var Key: Char);
begin
{    if Key = '#13' then
        cxCheckBoxFio.SetFocus;}
end;

procedure TfmKassaShowDelFilter.cxDateEditFromKeyPress(Sender: TObject;
  var Key: Char);
begin
{    if Key = '#13' then
        cxDateEditTo.SetFocus;}
end;

procedure TfmKassaShowDelFilter.cxDateEditToKeyPress(Sender: TObject;
  var Key: Char);
begin
{    if Key = '#13' then
        cxCheckBoxSumma.SetFocus;}
end;

procedure TfmKassaShowDelFilter.cxTextEditNoteKeyPress(Sender: TObject;
  var Key: Char);
begin
{    if Key = '#13' then
        cxRadioButtonPrihod.SetFocus;}
end;

procedure TfmKassaShowDelFilter.cxCheckBoxDateEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
{    if not cxCheckBoxDate.Checked then
    begin
        cxDateEditFrom.SetFocus;
    end else
    begin
        cxDateEditFrom.SetFocus;
    end;}
end;

procedure TfmKassaShowDelFilter.ActionCloseExecute(Sender: TObject);
begin
    close;
end;


procedure TfmKassaShowDelFilter.ActionPrintExecute(Sender: TObject);
var
//    T : TfmKassaResultFindForm;
    s1, s2 : double;
begin
    ModalResult := mrOk;
{    if cxCheckBoxSumma.Checked then
    begin
        s1 := StrToFloat(cxTextEditFrom.Text);
        s2 := StrToFloat(cxTextEditTo.Text);
        if s1 > s2 then
        begin
            Showmessage(Un_R_file_Alex.KASSA_FIND_ERROR_SUMMA);
            exit;
        end;
    end;
    if cxTextEditFio.text = '' then
        cxCheckBoxFio.Checked := false;
    if cxTextEditNote.Text = '' then
        cxCheckBoxNote.Checked := false;

    T := TfmKassaResultFindForm.Create(self, self);
    T.ShowModal;
    T.Free;}
end;

procedure TfmKassaShowDelFilter.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    i, j : integer;
    Res : variant;
begin
    if ShowSchKassaDel(self, self, Res) then
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

procedure TfmKassaShowDelFilter.cxCheckBox2Click(Sender: TObject);
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

procedure TfmKassaShowDelFilter.cxCheckBoxSummaClick(Sender: TObject);
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

procedure TfmKassaShowDelFilter.cxCheckBoxFioClick(Sender: TObject);
begin
    if cxCheckBoxFio.Checked then
    begin
        cxTextEditFio.Visible := true;
        cxLabel5.Visible      := false;
        cxTextEditFio.SetFocus;
    end else
    begin
        cxTextEditFio.Visible := false;
        cxLabel5.Visible      := true;
    end;
end;

procedure TfmKassaShowDelFilter.cxCheckBoxNoteClick(Sender: TObject);
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

procedure TfmKassaShowDelFilter.cxCheckBox1Click(Sender: TObject);
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

procedure TfmKassaShowDelFilter.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    i, j  : integer;
    id : int64;
    res : Variant;
begin
{    Res := GlobalSPR.GetSch(self, d.Handle, fsNormal, Date, 1, 0, 0);
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

    end else
    begin
        cxCheckBox1.Checked   := false;
        cxButtonEdit2.Visible := false;
        cxLabel9.Visible      := true;
    end;}
end;

procedure TfmKassaShowDelFilter.cxTextEditFioExit(Sender: TObject);
begin
    if cxTextEditFio.text = '' then
        cxCheckBoxFio.Checked := false;
end;

procedure TfmKassaShowDelFilter.cxTextEditNoteExit(Sender: TObject);
begin
    if cxTextEditNote.Text = '' then
        cxCheckBoxNote.Checked := false;
end;

procedure TfmKassaShowDelFilter.cxCheckBoxDateClick(Sender: TObject);
begin
    cxCheckBoxDate.Checked := true;
end;

procedure TfmKassaShowDelFilter.cxButton2Click(Sender: TObject);
begin
    ModalResult := mrOk;
end;

end.
