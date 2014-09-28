unit KassaFindForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxRadioGroup,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxCheckBox,
  cxGroupBox, cxControls, cxContainer, cxEdit, cxButtonEdit, cxLabel,
  ImgList, ActnList, fibDataBase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, Un_R_file_Alex, GlobalSPR,
  cxGraphics, dxStatusBar,DogLoaderUnit, Buttons;

type
  TSchK = record
      id : int64;
      number : string;
  end;
  TResSchK = record
      TT : array of TSchK;
  end;

  TfmKassaFindForm = class(TForm)
    cxRadioGroup1: TcxRadioGroup;
    cxGroupBox1: TcxGroupBox;
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
    cxGroupBox4: TcxGroupBox;
    cxCheckBox3: TcxCheckBox;
    cxCheckBox6: TcxCheckBox;
    cxButtonEdit3: TcxButtonEdit;
    cxButtonEdit4: TcxButtonEdit;
    cxButtonEdit5: TcxButtonEdit;
    cxButtonEdit6: TcxButtonEdit;
    cxCheckBox7: TcxCheckBox;
    cxCheckBox8: TcxCheckBox;
    cxTextEdit_Num: TcxTextEdit;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    Class_Transaction_Wr: TpFIBTransaction;
    cxButtonEdit7: TcxButtonEdit;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    cxCheckBox9: TcxCheckBox;
    cxCheckBox4: TcxRadioButton;
    cxCheckBox5: TcxRadioButton;
    cxGroupBox5: TcxGroupBox;
    cxRadioButton4: TcxRadioButton;
    cxRadioButton5: TcxRadioButton;
    cxRadioButton6: TcxRadioButton;
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
    procedure cxCheckBoxFioClick(Sender: TObject);
    procedure cxCheckBoxNoteClick(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxTextEditFioExit(Sender: TObject);
    procedure cxTextEditNoteExit(Sender: TObject);
    procedure cxCheckBoxDateClick(Sender: TObject);
    procedure cxCheckBox3Click(Sender: TObject);
    procedure cxCheckBox4Click(Sender: TObject);
    procedure cxCheckBox5Click(Sender: TObject);
    procedure cxCheckBox6Click(Sender: TObject);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit4PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit5PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit6PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
       procedure cxButtonEdit7PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox7Click(Sender: TObject);
    procedure cxCheckBox8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cxRadioButton1Click(Sender: TObject);
    procedure cxRadioButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure cxCheckBox9Click(Sender: TObject);

  

  private
    Owner : TComponent;
  public
    flag:integer;
    ResSch : TResSchK;
    ResKorSch : TResSchK;
    d : TPfibDataBase;
    id_user, id_smeta, id_razd, id_state, id_kekv,id_dog : int64;
    constructor Create(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase); reintroduce; overload;
//    constructor Create(AOwner: TComponent; mainform: TMainDocClass; m : TfmModeShowDoc); reintroduce; overload;
  end;


function KassaShowFindOrder(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase): integer; stdcall;
   exports KassaShowFindOrder;

implementation

uses DateUtils, KassaResultFindForm, KassaSchSelect;
 var T_new: TfmKassaResultFindForm;
{$R *.dfm}

function KassaShowFindOrder(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase): integer;
var
    T : TfmKassaFindForm;
begin
    T := TfmKassaFindForm.Create(AOwner, id_us, DB);
    T.Show;
end;

constructor TfmKassaFindForm.Create(AOwner: TComponent; id_us: int64;
  DB: TpFIBDatabase);
var
//    id : int64;
    i : integer;
//    number : string;
begin
    inherited Create(AOwner);
    Owner := AOwner;

    cxTextEditFrom.Text := '0';
    cxTextEditTo.Text   := '1000000000';
    d := DB;
    pFIBTransaction1.DefaultDatabase     := d;
    Class_Transaction_Wr.DefaultDatabase := d;
    id_user := id_us;

    pFIBDataSet1.Database := DB;
    pFIBDataSet1.Transaction := pFIBTransaction1;
    pFIBDataSet1.Transaction.StartTransaction;

    pFIBDataSet1.Close;
    pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_INI';
    pFIBDataSet1.Open;
    cxDateEditTo.Date   := date;
    cxDateEditFrom.Date := IncDay(date, -pFIBDataSet1.FieldByname('KASSA_DAY_SHOW_LAST').AsInteger);
    pFIBDataSet1.Close;
    pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCHS('+IntToStr(id_us)+')';
    pFIBDataSet1.Open;
    pFIBDataSet1.FetchAll;
    pFIBDataSet1.First;

    SetLength(ResSch.TT, pFIBDataSet1.RecordCount);

    For i := 0 to pFIBDataSet1.RecordCount-1 do
    begin
       ResSch.TT[i].id     := TFIBBCDField(pFIBDataSet1.fieldByName('ID_SCH')).AsInt64;
       ResSch.TT[i].Number := pFIBDataSet1.FieldByName('SCH_NUM').AsString;
       pFIBDataSet1.next;
    end;

    Caption                    := Un_R_file_Alex.KASSA_FIND_CAP_15;
//    cxGroupBox3.Caption        := Un_R_file_Alex.;
    cxGroupBox2.Caption        := Un_R_file_Alex.J4_OSTATOK_ADD_FORM_GR_4;
//    cxGroupBox1.Caption        := Un_R_file_Alex.;
    cxCheckBox2.Properties.Caption := Un_R_file_Alex.KASSA_FIND_CAP_14;
    cxLabel1.Caption           := Un_R_file_Alex.KASSA_FIND_CAP_1;
    cxRadioButton1.Caption := Un_R_file_Alex.KASSA_FIND_CAP_10;
  //  cxRadioButton2.Caption := Un_R_file_Alex.KASSA_FIND_CAP_18;
    cxRadioButton2.Caption := 'Çà ÄÀÒÎÞ ïðîâåäåííÿ:';
    cxCheckBoxSumma.Properties.Caption := Un_R_file_Alex.KASSA_FIND_CAP_11;
    cxCheckBoxFio.Properties.Caption := Un_R_file_Alex.KASSA_FIND_CAP_12;
    cxCheckBoxNote.Properties.Caption := Un_R_file_Alex.KASSA_FIND_CAP_13;
    cxRadioButtonPrihod.Caption := Un_R_file_Alex.KASSA_FIND_CAP_7;
    cxRadioButton3.Caption      := Un_R_file_Alex.KASSA_FIND_CAP_8;
    cxRadioButtonAll.Caption    := Un_R_file_Alex.KASSA_FIND_CAP_9;
    cxRadioButton4.Caption      := 'Ò³ëüêè ÄÎÊÓÌÅÍÒÈ';
    cxRadioButton5.Caption      := 'Ò³ëüêè ÂÈÏÐÀÂÍ² ÄÎÂ²ÄÊÈ';
    cxRadioButton6.Caption      := 'ÄÎÊÓÌÅÍÒÈ ³ ÄÎÂ²ÄÊÈ';
    ActionPrint.Caption         := Un_R_file_Alex.MY_BUTTON_F;
    ActionClose.Caption         := Un_R_file_Alex.MY_BUTTON_CANCEL_CONST;
    cxLabel2.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_2;
    cxLabel3.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_3;
    cxLabel4.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_4;
    cxLabel5.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_5;
    cxLabel6.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_6;
    cxLabel7.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_2;
    cxLabel8.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_3;
    cxCheckBox1.Properties.Caption   := Un_R_file_Alex.KASSA_FIND_CAP_17;
    cxLabel9.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_16;

    dxStatusBar1.Panels[0].Text := Un_R_file_Alex.J4_BAR_TAB_SELECT  + ' - Tab';
    dxStatusBar1.Panels[1].Text := Un_R_file_Alex.MY_BUTTON_GET      + ' - Space';
    dxStatusBar1.Panels[2].Text := Un_R_file_Alex.MY_BUTTON_FIND     + ' - F10';

    cxButtonEdit3.Visible  := false;
    cxButtonEdit4.Visible  := false;
    cxButtonEdit5.Visible  := false;
    cxButtonEdit6.Visible  := false;

    cxCheckBox3.Properties.Caption := Un_R_file_Alex.KASSA_FIND_PO_SMETA;
    cxCheckBox4.Caption := Un_R_file_Alex.KASSA_FIND_PO_RAZD;
    cxCheckBox5.Caption := 'Ïîøóê ïî ðîçä³ëó ³ ñò.';
    cxCheckBox6.Properties.Caption := Un_R_file_Alex.KASSA_FIND_PO_KEKV;
//    cxCheckBox3.Properties.Caption := 'SMETA';
//    cxCheckBox4.Properties.Caption := 'RAZD';
//    cxCheckBox5.Properties.Caption := 'STATE';
//    cxCheckBox6.Properties.Caption := 'KEKV';
    cxCheckBox7.Properties.Caption := 'Ïî ÄÎÃÎÂÎÐÓ:';
    cxCheckBox8.Properties.Caption := 'Ïî ôðàãì. ÍÎÌÅÐÀ äîêóìåíòà:';
    cxCheckBox9.Properties.Caption := 'Ïîøóê ïî ðîçä³ëó ³ ñòàòò³';

    //    cxLabel9.Caption            := Un_R_file_Alex.;
//    cxLabel10.Caption           := Un_R_file_Alex.;
//    cxLabel11.Caption           := Un_R_file_Alex.;
//    cxLabel12.Caption           := Un_R_file_Alex.;
//    cxRadioGroup1.Caption       := Un_R_file_Alex.;
end;


procedure TfmKassaFindForm.cxTextEditFromKeyPress(Sender: TObject;
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

procedure TfmKassaFindForm.cxTextEditToKeyPress(Sender: TObject;
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

procedure TfmKassaFindForm.cxDateEditFromKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = '#13' then
        cxDateEditTo.SetFocus;
end;

procedure TfmKassaFindForm.cxDateEditToKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = '#13' then
        cxCheckBoxSumma.SetFocus;
end;

procedure TfmKassaFindForm.cxTextEditNoteKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = '#13' then
        cxRadioButtonPrihod.SetFocus;
end;

procedure TfmKassaFindForm.cxCheckBoxDateEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
    if not cxRadioButton1.Checked then
    begin
        cxDateEditFrom.SetFocus;
    end else
    begin
        cxDateEditFrom.SetFocus;
    end;
end;

procedure TfmKassaFindForm.ActionCloseExecute(Sender: TObject);
begin
    close;
end;


procedure TfmKassaFindForm.ActionPrintExecute(Sender: TObject);
var
    T : TfmKassaResultFindForm;
    s1, s2 : double;
    z : boolean;
begin
    z:=true;
    if (cxCheckbox9.checked) and (cxCheckbox4.checked) and (cxbuttonedit4.text=' - ') then
    begin
        showmessage('Âûáåð³òü ðîçä³ë');
        z := false;
    end;
    if (cxCheckbox9.checked) and (cxCheckbox5.checked) and (cxbuttonedit5.text=' - ') then
    begin
        showmessage('Âûáåð³òü ðîçä³ë òà ñòàòòþ');
        z := false;
    end;

    if z=true then
    begin
        hide;
    if flag=1 then flag:=2;
    if flag=0 then flag:=1;
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
    if cxTextEditFio.text = '' then
        cxCheckBoxFio.Checked := false;
    if cxTextEditNote.Text = '' then
        cxCheckBoxNote.Checked := false;

    cxTextEditFio.text  := Ansiuppercase(cxTextEditFio.text);
    cxTextEditNote.text := Ansiuppercase(cxTextEditNote.text);

      //***********************************************************************
    T := TfmKassaResultFindForm.Create(self, self);
    t_new := t;
    T.ShowModal;
    T.Free;
    if formstyle=fsStayOnTop then
    begin
    formstyle := fsNormal;
    width     := 562;
    end;
    hide;
   // if t.visible=false then t.visible:=true;
    if flag=0 then flag:=1;
    end;
end;

procedure TfmKassaFindForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 //   if FormStyle = fsMDIChild then Action := caFree;
    //hide;
   // Action := caFree;
   if (flag=1) or (flag=2) then
   if t_new.visible=false then t_new.visible:=true;
end;

procedure TfmKassaFindForm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    i, j : integer;
    Res : variant;
begin
    if ShowSchKassa(self, self, Res) then
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

procedure TfmKassaFindForm.cxCheckBox2Click(Sender: TObject);
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

procedure TfmKassaFindForm.cxCheckBoxSummaClick(Sender: TObject);
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

procedure TfmKassaFindForm.cxCheckBoxFioClick(Sender: TObject);
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

procedure TfmKassaFindForm.cxCheckBoxNoteClick(Sender: TObject);
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

procedure TfmKassaFindForm.cxCheckBox1Click(Sender: TObject);
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

procedure TfmKassaFindForm.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    i, j  : integer;
//    id : int64;
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

procedure TfmKassaFindForm.cxTextEditFioExit(Sender: TObject);
begin
    if cxTextEditFio.text = '' then
        cxCheckBoxFio.Checked := false;
end;

procedure TfmKassaFindForm.cxTextEditNoteExit(Sender: TObject);
begin
    if cxTextEditNote.Text = '' then
        cxCheckBoxNote.Checked := false;
end;

procedure TfmKassaFindForm.cxCheckBoxDateClick(Sender: TObject);
begin
    cxRadioButton1.Checked := true;
end;

procedure TfmKassaFindForm.cxCheckBox3Click(Sender: TObject);
begin
    if cxCheckBox3.Checked then
    begin
        cxButtonEdit3.Visible := true;
        cxButtonEdit3.SetFocus;
        cxButtonEdit3PropertiesButtonClick(self, 0);
    end else
    begin
        cxButtonEdit3.Visible := false;
    end;
end;

procedure TfmKassaFindForm.cxCheckBox4Click(Sender: TObject);
begin
    if cxCheckBox4.Checked then
    begin
        cxButtonEdit4.Visible := true;
        cxButtonEdit5.Visible := false;
        cxButtonEdit4.SetFocus;
        cxButtonEdit4PropertiesButtonClick(self, 0);
    end else
    begin
        cxButtonEdit4.Visible := false;
    end;
end;

procedure TfmKassaFindForm.cxCheckBox5Click(Sender: TObject);
begin
    if cxCheckBox5.Checked then
    begin
        cxButtonEdit5.Visible := true;
        cxButtonEdit4.Visible := false;
        cxButtonEdit5.SetFocus;
        cxButtonEdit5PropertiesButtonClick(self, 0);
    end else
    begin
        cxButtonEdit5.Visible := false;
    end;
end;

procedure TfmKassaFindForm.cxCheckBox6Click(Sender: TObject);
begin
    if cxCheckBox6.Checked then
    begin
        cxButtonEdit6.Visible := true;
        cxButtonEdit6.SetFocus;
        cxButtonEdit6PropertiesButtonClick(self, 1);
    end else
    begin
        cxButtonEdit6.Visible := false;
    end;
end;

procedure TfmKassaFindForm.cxButtonEdit3PropertiesButtonClick(
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
            cxButtonEdit3.Text := VarToStr(rr[3]) + ' ' + VarToStr(rr[2]);
        end;
    end;
end;


procedure TfmKassaFindForm.cxButtonEdit7PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
//    summa_dog : double;
    inputDog  : TDogInput;
    res       : TDogResult;
//    i, j      : integer;
begin
        LoadSysData(pFIBTransaction1);
        inputDog              := SYS_DEFAULT_DOG_INPUT;
        inputDog.Owner        := self;
        inputDog.DBHandle     := d.Handle;
        inputDog.WriteTrans   := Class_Transaction_Wr.Handle;
        inputDog.ReadTrans    := pFIBTransaction1.Handle;
        inputDog.Summa        := 1;
        inputDog.FormStyle    := fsNormal;
        inputDog.id_Group     := 1399;
        inputDog.id_group_add := 2599;
        inputDog.filter.bShowFilterForm          := true;
        inputDog.filter.DateBeg                  := cxDateEditFrom.Date;
        inputDog.filter.DateEnd                  := cxDateEditTo.Date;
        inputDog.filter.bUseFilter               := true;
        inputDog.filter.bDate                    := true;

        SYS_ID_USER          := id_user;
        res                  := ShowDogMain(inputDog);
        if res.ModalResult = 1 then
        begin
{                        id_dog_add  := res.id_dog;
                        kod_dog_add := res.kod_dog;
                        name_cust   := VarToStr(res.name_customer);
                        date_dog    := VarToStr(res.d_dog);
                        num_dog     := VarToStr(res.n_dog);
                        r_dog       := VarToStr(res.regest_num);
                        t_dog       := VarToStr(res.name_tip_dog);
                        cxMemoDog.Text := Un_R_file_Alex.BANK_TYPE_DOGOVOR+' : ' + VarToStr(res.name_tip_dog)+'; ü  '+VarToStr(res.n_dog)+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +VarToStr(res.d_dog) + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + VarToStr(res.regest_num)+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + VarToStr(res.name_customer);}

            cxbuttonedit7.Text :={res.id_dog + ' ' +} Un_R_file_Alex.BANK_TYPE_DOGOVOR+' : ' + VarToStr(res.name_tip_dog)+'; ü  '+VarToStr(res.n_dog)+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +VarToStr(res.d_dog) + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + VarToStr(res.regest_num)+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + VarToStr(res.name_customer);
            id_dog:=res.id_dog;

        end;


end;


procedure TfmKassaFindForm.cxButtonEdit4PropertiesButtonClick(
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
        cxButtonEdit4.Text := pFIBDataSet1.FieldByName('KOD_OBJECT').AsString + ' - ' + pFIBDataSet1.FieldByName('TITLE_OBJECT').AsString;
        pFIBDataSet1.Close;
    end;
    except
        cxCheckBox4.Checked := false;
    end;
end;

procedure TfmKassaFindForm.cxButtonEdit5PropertiesButtonClick(
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
        cxButtonEdit5.Text := pFIBDataSet1.FieldByName('KOD_OBJECT').AsString + ' - ' + pFIBDataSet1.FieldByName('TITLE_OBJECT').AsString;
        pFIBDataSet1.Close;
    end;
    except
        cxCheckBox5.Checked := false;
    end;
end;

procedure TfmKassaFindForm.cxButtonEdit6PropertiesButtonClick(
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
                 cxButtonEdit6.Text := VarToStr(id[0][2]) + ' ' + VArToStr(id[0][1]);
             end;
        end;
    end else
    begin
        cxCheckBox6.Checked := false;
    end;
end;

procedure TfmKassaFindForm.cxCheckBox7Click(Sender: TObject);
begin
 if cxCheckBox7.Checked then
    begin
        cxLabel10.Visible       := false;
        cxbuttonEdit7.Visible := true;
        cxbuttonEdit7.SetFocus;
        cxButtonEdit7PropertiesButtonClick(self, 0);
    end else
    begin
        cxbuttonEdit7.Visible := false;
        cxLabel10.Visible       := true;
    end;
end;

procedure TfmKassaFindForm.cxCheckBox8Click(Sender: TObject);
begin
if cxCheckBox8.Checked then
    begin
        cxLabel11.Visible       := false;
        cxTextEdit_num.Visible := true;
        cxTextEdit_num.SetFocus;

    end else
    begin
        cxTextEdit_num.Visible := false;
        cxLabel11.Visible       := true;
    end;
end;


procedure TfmKassaFindForm.Button1Click(Sender: TObject);
begin

            id_dog:=strtoint64(cxbuttonedit7.Text);
end;

procedure TfmKassaFindForm.FormCreate(Sender: TObject);
begin
flag:=0;
end;

procedure TfmKassaFindForm.BitBtn1Click(Sender: TObject);
begin
//label1.caption:=cxDateEditFrom.text;
 cxDateEditFrom.Date := IncMonth(cxDateEditFrom.Date, -1);
end;

procedure TfmKassaFindForm.cxRadioButton1Click(Sender: TObject);
begin
cxlabel2.top:=10;
cxlabel3.top:=10;
cxdateeditfrom.top:=10;
cxdateeditto.top:=10;
speedbutton1.top:=10;
speedbutton2.top:=10;
speedbutton6.top:=10;
speedbutton5.top:=10;


end;

procedure TfmKassaFindForm.cxRadioButton2Click(Sender: TObject);
begin
cxlabel2.top:=36;
cxlabel3.top:=36;
cxdateeditfrom.top:=36;
cxdateeditto.top:=36;
speedbutton1.top:=36;
speedbutton2.top:=36;
speedbutton6.top:=36;
speedbutton5.top:=36;

end;

procedure TfmKassaFindForm.SpeedButton1Click(Sender: TObject);
begin
   cxDateEditFrom.Date := IncMonth(cxDateEditFrom.Date, -1);
end;

procedure TfmKassaFindForm.SpeedButton2Click(Sender: TObject);
begin
   cxDateEditFrom.Date := IncMonth(cxDateEditFrom.Date, 1);
end;

procedure TfmKassaFindForm.SpeedButton6Click(Sender: TObject);
begin
   cxDateEditTo.Date := IncMonth(cxDateEditTo.Date, -1);
end;

procedure TfmKassaFindForm.SpeedButton5Click(Sender: TObject);
begin
   cxDateEditTo.Date := IncMonth(cxDateEditTo.Date, 1);
end;

procedure TfmKassaFindForm.cxCheckBox9Click(Sender: TObject);
begin
if cxCheckBox9.checked then
begin
cxCheckbox4.visible:=true;
cxCheckBox5.visible:=True;
end else
begin
cxCheckbox4.visible:=false;
cxCheckBox5.visible:=False;
cxButtonEdit4.visible:=False;
cxButtonEdit5.visible:=False;
end;
end;

end.
