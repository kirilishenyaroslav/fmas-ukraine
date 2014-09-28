unit BankFindForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxRadioGroup,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxCheckBox,
  cxGroupBox, cxControls, cxContainer, cxEdit, cxButtonEdit, cxLabel,
  ImgList, ActnList, fibDataBase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, Un_R_file_Alex, GlobalSPR,
  Buttons, cxPC, ExtCtrls, Placemnt, Registry;

type
  TSch = record
      id : int64;
      number : string;
  end;
  TResSch = record
      TT : array of TSch;
  end;

  TfmBankFindForm = class(TForm)
    ActionList1: TActionList;
    ActionPrint: TAction;
    ActionClose: TAction;
    ImageList1: TImageList;
    pFIBDataSet1: TpFIBDataSet;
    D: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    TWr: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox3: TcxGroupBox;
    cxCheckBox2: TcxCheckBox;
    cxLabel1: TcxLabel;
    cxButtonEdit1: TcxButtonEdit;
    cxCheckBox1: TcxCheckBox;
    cxButtonEdit2: TcxButtonEdit;
    cxLabel9: TcxLabel;
    cxGroupBox4: TcxGroupBox;
    cxCheckBox3: TcxCheckBox;
    cxLabel10: TcxLabel;
    cxButtonEdit4: TcxButtonEdit;
    cxGroupBox6: TcxGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    cxLabel2: TcxLabel;
    cxDateEditFrom: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxDateEditTo: TcxDateEdit;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxLabel11: TcxLabel;
    cxDateEditProvFrom: TcxDateEdit;
    cxLabel12: TcxLabel;
    cxDateEditProvTo: TcxDateEdit;
    cxRadioGroup1: TcxRadioGroup;
    cxRadioButtonPrihod: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    cxRadioButtonAll: TcxRadioButton;
    cxGroupBox1: TcxGroupBox;
    cxCheckBoxSumma: TcxCheckBox;
    cxCheckBoxNote: TcxCheckBox;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    cxTextEditFrom: TcxTextEdit;
    cxTextEditTo: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxTextEditNote: TcxTextEdit;
    cxGroupBox7: TcxGroupBox;
    cxCheckBox4: TcxCheckBox;
    cxLabel13: TcxLabel;
    cxButtonEdit6: TcxButtonEdit;
    Panel1: TPanel;
    cxGroupBox2: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGroupBox8: TcxGroupBox;
    cxCheckBox5: TcxCheckBox;
    cxCheckBox6: TcxCheckBox;
    cxButtonEdit7: TcxButtonEdit;
    cxButtonEdit8: TcxButtonEdit;
    cxButtonEdit9: TcxButtonEdit;
    cxButtonEdit10: TcxButtonEdit;
    cxCheckBox9: TcxCheckBox;
    cxRadioButton4: TcxRadioButton;
    cxRadioButton5: TcxRadioButton;
    cxCheckBox8: TcxCheckBox;
    cxLabel14: TcxLabel;
    cxTextEdit_Num: TcxTextEdit;
    cxGroupBox5: TcxGroupBox;
    cxCheckBoxFio: TcxCheckBox;
    cxLabel5: TcxLabel;
    cxButtonEdit3: TcxButtonEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    cxButtonEdit5: TcxButtonEdit;
    cxTextEdit1: TcxTextEdit;
    cxCheckBoxComment: TcxCheckBox;
    cxTextEditComment: TcxTextEdit;
    GroupBox1: TGroupBox;
    cxLabel16: TcxLabel;
    cxCheckBoxMen: TcxCheckBox;
    cxLabel15: TcxLabel;
    cxButtonEditMen: TcxButtonEdit;
    cxCheckBox7: TcxCheckBox;
    cxLabel17: TcxLabel;
    cxButtonEdit11: TcxButtonEdit;
    cxGroupBox9: TcxGroupBox;
    cxRadioButton6: TcxRadioButton;
    cxRadioButton7: TcxRadioButton;
    cxRadioButton8: TcxRadioButton;
    FormStorage1: TFormStorage;
    cxButtonEdit12: TcxButtonEdit;
    cxCheckBox10: TcxCheckBox;
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
    procedure cxCheckBoxDateClick(Sender: TObject);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit4PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox3Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure cxButtonEdit5PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxTextEdit1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure cxRadioButton1Click(Sender: TObject);
    procedure cxRadioButton2Click(Sender: TObject);
    procedure cxCheckBox4Click(Sender: TObject);
    procedure cxButtonEdit6PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox5Click(Sender: TObject);
    procedure cxCheckBox6Click(Sender: TObject);
    procedure cxCheckBox9Click(Sender: TObject);
    procedure cxRadioButton4Click(Sender: TObject);
    procedure cxRadioButton5Click(Sender: TObject);
    procedure cxButtonEdit7PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit10PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit8PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit9PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox8Click(Sender: TObject);
    procedure cxCheckBoxCommentClick(Sender: TObject);
    procedure cxCheckBoxMenClick(Sender: TObject);
    procedure cxButtonEditMenPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox7Click(Sender: TObject);
    procedure cxButtonEdit11PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure cxTextEditFromPropertiesChange(Sender: TObject);
    procedure cxCheckBox10Click(Sender: TObject);
    procedure cxButtonEdit12PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    Owner : TComponent;
    first : boolean;
    sum_from_change : integer;
  public
    ResSch : TResSch;
    ResKorSch : TResSch;
//    d : TPfibDataBase;
    id_user, id_customer, id_ras, id_ras_native, id_dog, kod_dog , id_men: int64;
    id_smeta, id_razd, id_state, id_kekv, id_sm_group, kod_sm_group : int64;
    sm_group_text : string;

    constructor Create(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase); reintroduce; overload;
//    constructor Create(AOwner: TComponent; mainform: TMainDocClass; m : TfmModeShowDoc); reintroduce; overload;
  end;

function BankShowFindOrder(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase): integer; stdcall;
   exports BankShowFindOrder;


implementation

uses DateUtils, BankResultFindForm, BankSchSelect, dogLoaderUnit, LoadDogManedger, AccMgmt,Un_lo_file_Alex,cn_Common_Loader,
     cn_Common_Types;

{$R *.dfm}

function BankShowFindOrder(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase): integer;
var
    T : TfmBankFindForm;
begin
    T := TfmBankFindForm.Create(AOwner, id_us, DB);
    T.Show;
    Result := -1;
end;

constructor TfmBankFindForm.Create(AOwner: TComponent; id_us: int64;
  DB: TpFIBDatabase);
var
//    id : int64;
    i, error : integer;
//    number : string;
begin
    inherited Create(AOwner);
    Owner := AOwner;
    first := false;

    cxDateEditTo.Date       := date;
    cxDateEditProvTo.Date   := Date;
    cxDateEditProvFrom.Date := IncMonth(date, -1);;
    cxDateEditFrom.Date     := IncMonth(date, -1);
    id_dog                  := -1;
    kod_dog                 := -1;

    cxTextEditFrom.Text := '0';
    cxTextEditTo.Text   := '1000000000';

    if(cxCheckBoxSumma.Checked) then sum_from_change := 0 else  sum_from_change := 1;

    d := DB;
    pFIBTransaction1.DefaultDatabase := d;
    TWr.DefaultDatabase              := d;
    D.DefaultTransaction             := pFIBTransaction1;
    id_user                          := id_us;

    pFIBDataSet1.Database            := DB;
    pFIBDataSet1.Transaction         := pFIBTransaction1;

    DataSet.Database                 := DB;
    DataSet.Transaction              := pFIBTransaction1;
    pFIBTransaction1.StartTransaction;

    LoadSysData(pFIBTransaction1);

    RadioButton1.Caption               := Un_R_file_Alex.BANK_FIND_CUST_SP;
    RadioButton2.Caption               := Un_R_file_Alex.BANK_FIND_R_S_SP;
    RadioButton3.Caption               := Un_R_file_Alex.BANK_FIND_NAME;
    cxRadioButton6.Caption             := 'Ò³ëüêè ÄÎÊÓÌÅÍÒÈ';
    cxRadioButton7.Caption             := 'Ò³ëüêè ÂÈÏÐÀÂÍ² ÄÎÂ²ÄÊÈ';
    cxRadioButton8.Caption             := 'ÄÎÊÓÌÅÍÒÈ ³ ÄÎÂ²ÄÊÈ';
    Caption                            := Un_R_file_Alex.BANK_FIND_CAP_15;
    cxGroupBox3.Caption                := Un_R_file_Alex.BANK_FIND_KOR_BAL_SCH;
    cxGroupBox2.Caption                := Un_R_file_Alex.J4_OSTATOK_ADD_FORM_GR_4;
    cxGroupBox5.Caption                := Un_R_file_Alex.BANK_FIND_CUSTOMER;
    cxCheckBox2.Properties.Caption     := Un_R_file_Alex.KASSA_FIND_CAP_14;
    cxCheckBox3.Properties.Caption     := Un_R_file_Alex.BANK_FIND_R_S_PRED;
    cxLabel1.Caption                   := Un_R_file_Alex.KASSA_FIND_CAP_1;
//    cxCheckBoxDate.Properties.Caption  := Un_R_file_Alex.KASSA_FIND_CAP_10;
    cxRadioButton1.Caption             := Un_R_file_Alex.KASSA_FIND_CAP_10;
    cxRadioButton2.Caption             := Un_R_file_Alex.KASSA_FIND_CAP_18;


    cxCheckBoxSumma.Properties.Caption    := Un_R_file_Alex.KASSA_FIND_CAP_11;
    cxCheckBoxFio.Properties.Caption      := Un_R_file_Alex.BANK_FIND_CUST;
    cxCheckBoxNote.Properties.Caption     := Un_R_file_Alex.KASSA_FIND_CAP_13;
    cxCheckBoxComment.Properties.Caption  := Un_R_file_Alex.BANK_COMMENT_PROV_FIND;
    cxCheckBoxMen.Properties.Caption      := Un_R_file_Alex.BANK_FIND_BY_MEN;

    cxRadioButtonPrihod.Caption        := Un_R_file_Alex.KASSA_FIND_CAP_7;
    cxRadioButton3.Caption             := Un_R_file_Alex.KASSA_FIND_CAP_8;
    cxRadioButtonAll.Caption           := Un_R_file_Alex.KASSA_FIND_CAP_9;
    ActionPrint.Caption                := Un_R_file_Alex.MY_BUTTON_F;
    ActionClose.Caption                := Un_R_file_Alex.MY_BUTTON_CLOSE;
    cxLabel2.Caption                   := Un_R_file_Alex.KASSA_FIND_CAP_2;
    cxLabel11.Caption                  := Un_R_file_Alex.KASSA_FIND_CAP_2;
    cxLabel3.Caption                   := Un_R_file_Alex.KASSA_FIND_CAP_3;
    cxLabel12.Caption                  := Un_R_file_Alex.KASSA_FIND_CAP_3;
    cxLabel4.Caption                   := Un_R_file_Alex.KASSA_FIND_CAP_4;
    cxLabel5.Caption                   := Un_R_file_Alex.BANK_FIND_CUST_WITHOUT;
    cxLabel6.Caption                   := Un_R_file_Alex.KASSA_FIND_CAP_6;
    cxLabel7.Caption                   := Un_R_file_Alex.KASSA_FIND_CAP_2;
    cxLabel8.Caption                   := Un_R_file_Alex.KASSA_FIND_CAP_3;
    cxCheckBox1.Properties.Caption     := Un_R_file_Alex.KASSA_FIND_CAP_17;
    cxLabel9.Caption                   := Un_R_file_Alex.KASSA_FIND_CAP_16;
    cxLabel16.Caption                  := Un_R_file_Alex.BANK_FIND_OGR_COMMENT;
    cxLabel10.Caption                  := Un_R_file_Alex.BANK_FIND_RS_WITHOUT;
    cxCheckBox4.Properties.Caption     := Un_R_file_Alex.BANK_FIND_DOG_FGD;
    cxCheckBox7.Properties.Caption     := Un_R_file_Alex.BANK_FIND_DOG_CN;
    cxLabel13.Caption                  := Un_R_file_Alex.BANK_FIND_DOG_NO;
    cxLabel17.Caption                  := Un_R_file_Alex.BANK_FIND_DOG_NO;


    cxCheckBox5.Properties.Caption := Un_R_file_Alex.KASSA_FIND_PO_SMETA;
    cxRadioButton4.Caption         := Un_R_file_Alex.KASSA_FIND_PO_RAZD;
    cxCheckBox9.Properties.Caption := 'Ïîøóê ïî ðîçä³ëó ³ ñò.';
    cxRadioButton5.Caption         := 'Ïîøóê ïî ñòàòò³';
    cxCheckBox6.Properties.Caption := Un_R_file_Alex.KASSA_FIND_PO_KEKV;
    cxCheckBox8.Properties.Caption := 'Ïî ôðàãì. ÍÎÌÅÐÀ äîêóìåíòà:';
    cxCheckBox10.Properties.Caption:= 'Ïîøóê ïî ãðóï³ áþäæåò³â';

    cxLabel14.Caption              := 'Áåç îáìåæåííÿ íà ÍÎÌÅÐ äîêóìåíòà';
    cxTabSheet1.Caption            := 'Ô³ëüòð íà äîêóìåíòè';
    cxTabSheet2.Caption            := 'Ô³ëüòð íà ïðîâîäêè';

  //    cxLabel11.Caption           := Un_R_file_Alex.;
  //    cxLabel12.Caption           := Un_R_file_Alex.;
  //    cxRadioGroup1.Caption       := Un_R_file_Alex.;
    cxRadioButton1.Checked      := true;

    cxLabel2.Visible        := true;
    SpeedButton1.Visible    := true;
    cxDateEditFrom.Visible  := true;
    SpeedButton2.Visible    := true;
    cxLabel3.Visible        := true;
    SpeedButton3.Visible    := true;
    cxDateEditTo.Visible    := true;
    SpeedButton4.Visible    := true;
    cxLabel11.Visible          := false;
    SpeedButton5.Visible       := false;
    cxDateEditProvFrom.Visible := false;
    SpeedButton6.Visible       := false;
    cxLabel12.Visible          := false;
    SpeedButton7.Visible       := false;
    cxDateEditProvTo.Visible   := false;
    SpeedButton8.Visible       := false;

   // FormStorage1.RestoreFormPlacement;
    //cxCheckBoxSummaClick(Self);

end;


procedure TfmBankFindForm.cxTextEditFromKeyPress(Sender: TObject;
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

procedure TfmBankFindForm.cxTextEditToKeyPress(Sender: TObject;
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

procedure TfmBankFindForm.cxDateEditFromKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = '#13' then
        cxDateEditTo.SetFocus;
end;

procedure TfmBankFindForm.cxDateEditToKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = '#13' then
        cxCheckBoxSumma.SetFocus;
end;

procedure TfmBankFindForm.cxTextEditNoteKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = '#13' then
        cxRadioButtonPrihod.SetFocus;
end;

procedure TfmBankFindForm.cxCheckBoxDateEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
    cxDateEditFrom.SetFocus;
end;

procedure TfmBankFindForm.ActionCloseExecute(Sender: TObject);
begin
    close;
end;

procedure TfmBankFindForm.ActionPrintExecute(Sender: TObject);
var
    T : TfmBankResultFindForm;
    s : string;
    i, error, err : integer;
begin
    if not first then
    begin
        pFIBDataSet1.Close;
        if cxRadioButton1.Checked
        then
            pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_BALLANCE_SCH_N('''+dateToStr(cxDateEditFrom.date)+''','''+dateToStr(cxDateEditTo.date)+''')'
        else
            pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_BALLANCE_SCH_N('''+dateToStr(cxDateEditProvFrom.date)+''','''+dateToStr(cxDateEditProvTo.date)+''')';

        pFIBDataSet1.Open;
        pFIBDataSet1.FetchAll;
        pFIBDataSet1.First;

        SetLength(ResSch.TT, pFIBDataSet1.RecordCount);

        For i := 0 to pFIBDataSet1.RecordCount-1 do
        begin
            err := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_RS','Belong');
            error := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_RS/J2_'+pFIBDataSet1.fieldByName('ID_SCH').AsString,'Belong');
            if err = 0 then
            begin
                ResSch.TT[i].id     := pFIBDataSet1.fieldByName('ID_SCH').AsVariant;
                ResSch.TT[i].Number := pFIBDataSet1.FieldByName('SCH_NUM').AsString;
            end else
            if error = 0 then
            begin
                ResSch.TT[i].id     := pFIBDataSet1.fieldByName('ID_SCH').AsVariant;
                ResSch.TT[i].Number := pFIBDataSet1.FieldByName('SCH_NUM').AsString;
            end;
            pFIBDataSet1.next;
        end;
        first := true;
    end;

    s := cxTextEdit1.Text;
    cxTextEdit1.Text := Ansiuppercase(s);
    cxTextEdit1.Text := Stringreplace(cxTextEdit1.Text, '''', '''''', [rfReplaceAll]);
    T := TfmBankResultFindForm.Create(self, self);
    T.ShowModal;
    T.Free;
end;

procedure TfmBankFindForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
    reg:TRegistry;
begin
   // FormStorage1.SaveFormPlacement;
    reg:=TRegistry.Create;
    try
        reg.RootKey:=HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12300006759837\Nigol\2\',true) then
        begin
            if(cxDateEditFrom.Text='') then
            begin
                 cxDateEditFrom.date := IncMonth(date, -1);
                 cxDateEditTo.Date := date;
            end;
            if(cxDateEditTo.Text='') then
            begin
                 cxDateEditFrom.date := IncMonth(date, -1);
                 cxDateEditTo.Date := date;
            end;
            if(cxDateEditProvFrom.Text='') then
            begin
                 cxDateEditProvFrom.Date := IncMonth(date, -1);
                 cxDateEditProvTo.Date := date;
            end;
            if(cxDateEditProvTo.Text='') then
            begin
                 cxDateEditProvFrom.Date := IncMonth(date, -1);
                 cxDateEditProvTo.Date := date;
            end;
            if ((cxTextEditFrom.Text='') and (cxTextEditTo.Text<>'')) then cxTextEditFrom.Text := cxTextEditTo.Text;
            if ((cxTextEditFrom.Text<>'') and(cxTextEditTo.Text='')) then cxTextEditTo.Text := cxTextEditFrom.Text;
            if ((cxTextEditTo.Text='') and(cxTextEditTo.Text=''))  then
            begin
                cxTextEditFrom.Text := '0';
                cxTextEditTo.Text := '1000000000';
            end;

            if cxRadioButton1.Checked then
            begin
                reg.writeString('FindcxRadioButton1','1');
                reg.writeString('FindcxDateEditFrom',datetostr(cxDateEditFrom.date));
                reg.writeString('FindcxDateEditTo',datetostr(cxDateEditTo.date));
            end
            else
            begin
                reg.writeString('FindcxRadioButton1','0');
                reg.writeString('FindcxDateEditFrom',datetostr(IncMonth(date, -1)));
                reg.writeString('FindcxDateEditTo',datetostr(Date));
            end;

            if  cxRadioButton2.Checked then
            begin
                reg.writeString('FindcxRadioButton2','1');
                reg.writeString('FindcxDateEditProvFrom',datetostr(cxDateEditProvFrom.date));
                reg.writeString('FindcxDateEditProvTo',datetostr(cxDateEditProvTo.date));
            end
            else
            begin
                reg.writeString('FindcxRadioButton2','0');
                reg.writeString('FindcxDateEditProvFrom',datetostr(IncMonth(date, -1)));
                reg.writeString('FindcxDateEditProvTo',datetostr(Date));
            end;

            if cxCheckBoxSumma.Checked  then
            begin
                reg.writeString('FindcxCheckBoxSumma','1');
                reg.writeString('FindcxTextEditFrom',cxTextEditFrom.Text);
                reg.writeString('FindcxTextEditTo',cxTextEditTo.Text);
            end
            else
            begin
                reg.writeString('FindcxCheckBoxSumma','0');
                reg.writeString('FindcxTextEditFrom','0');
                reg.writeString('FindcxTextEditTo','1000000000');
            end;


            if cxCheckBoxNote.Checked   then
            begin
                reg.writeString('FindcxCheckBoxNote','1');
                reg.writeString('FindcxTextEditNote',cxTextEditNote.Text);
            end
            else
            begin
                reg.writeString('FindcxCheckBoxNote','0');
                reg.writeString('FindcxTextEditNote','');
            end;


            if  cxCheckBox8.Checked then
            begin
                reg.writeString('FindcxCheckBox8','1');
                reg.writeString('FindcxTextEdit_Num',cxTextEdit_Num.Text);
            end
            else
            begin
               reg.writeString('FindcxCheckBox8','0');
               reg.writeString('FindcxTextEdit_Num', '');
            end;


            if cxRadioButtonPrihod.Checked  then
            begin
                reg.writeString('FindcxRadioButtonPrihod','1')
            end
            else
            begin
                reg.writeString('FindcxRadioButtonPrihod','0')
            end;

            if cxRadioButton3.Checked  then
            begin
                reg.writeString('FindcxRadioButton3','1')
            end
            else
            begin
                reg.writeString('FindcxRadioButton3','0')
            end;

            if cxRadioButtonAll.Checked then
            begin
                reg.writeString('FindcxRadioButtonAll','1')
            end
            else
            begin
                reg.writeString('FindcxRadioButtonAll','0')
            end;
            reg.CloseKey;
        end ;
    finally
        reg.Free;
    end;

    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmBankFindForm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    i, error, err : integer;
    Res : Variant;
begin
//    ResSch := 0;
    if not first then
    begin
        pFIBDataSet1.Close;
        if cxRadioButton1.Checked
        then
            pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_BALLANCE_SCH_N('''+dateToStr(cxDateEditFrom.date)+''','''+dateToStr(cxDateEditTo.date)+''')'
        else
            pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_BALLANCE_SCH_N('''+dateToStr(cxDateEditProvFrom.date)+''','''+dateToStr(cxDateEditProvTo.date)+''')';

        pFIBDataSet1.Open;
        pFIBDataSet1.FetchAll;
        pFIBDataSet1.First;

        SetLength(ResSch.TT, pFIBDataSet1.RecordCount);

        For i := 0 to pFIBDataSet1.RecordCount-1 do
        begin
            err := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_RS','Belong');
            error := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_RS/J2_'+pFIBDataSet1.fieldByName('ID_SCH').AsString,'Belong');
            if err = 0 then
            begin
                ResSch.TT[i].id     := pFIBDataSet1.fieldByName('ID_SCH').AsVariant;
                ResSch.TT[i].Number := pFIBDataSet1.FieldByName('SCH_NUM').AsString;
            end else
            if error = 0 then
            begin
                ResSch.TT[i].id     := pFIBDataSet1.fieldByName('ID_SCH').AsVariant;
                ResSch.TT[i].Number := pFIBDataSet1.FieldByName('SCH_NUM').AsString;
            end;
            pFIBDataSet1.next;
        end;
        first := true;
    end;

    if ShowSchBank(self, self, Res) then
    begin
        cxButtonEdit1.Text := '';
        try
            if VarArrayDimCount(Res) > 0 then
            begin
                SetLength(ResSch.TT, 1);
                for i := 0 to 1000 do
                if (Res[i][0]<>null) and (Res[i][1]<>null) then
                begin
//                    id_k := res[i][0];
//                    if VarArrayDimCount(Res)>1 then
                        cxButtonEdit1.Text := Res[i][1] + ', ' + cxButtonEdit1.Text;
                   SetLength(ResSch.TT, length(ResSch.TT)+1);

                   ResSch.TT[i].id     := Res[i][0];
                   ResSch.TT[i].Number := Res[i][1];
//                    else cxButtonEdit1.Text := Res[i][1];
                end;
            end;
        except
        end;
    end else
    begin
        cxCheckBox2.Checked   := false;
        cxLabel1.Visible      := true;
        cxButtonEdit1.Visible := false;
    end;
end;

procedure TfmBankFindForm.cxCheckBox2Click(Sender: TObject);
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

procedure TfmBankFindForm.cxCheckBoxSummaClick(Sender: TObject);
begin
    if cxCheckBoxSumma.Checked then
    begin
        cxLabel4.Visible := false;
        cxLabel7.Visible := true;
        cxLabel8.Visible := true;
        cxTextEditFrom.Visible := true;
        cxTextEditTo.Visible   := true;
        cxTextEditFrom.SetFocus;
    end else
    begin
        cxLabel4.Visible := true;
        cxLabel7.Visible := false;
        cxLabel8.Visible := false;
        cxTextEditFrom.Visible := false;
        cxTextEditTo.Visible   := false;
    end;
end;

procedure TfmBankFindForm.cxCheckBoxFioClick(Sender: TObject);
begin
    if cxCheckBoxFio.Checked then
    begin
//        cxButtonEdit3PropertiesButtonClick(Sender, 1);
        cxLabel5.Visible      := false;
        RadioButton1.Visible  := true;
        RadioButton2.Visible  := true;
        RadioButton3.Visible  := true;
        cxButtonEdit3.Visible := true;
        cxButtonEdit5.Visible := true;
        cxTextEdit1.Visible   := true;
    end else
    begin
        RadioButton1.Visible  := false;
        RadioButton2.Visible  := false;
        RadioButton3.Visible  := false;
        cxButtonEdit3.Visible := false;
        cxButtonEdit5.Visible := false;
        cxTextEdit1.Visible   := false;
        cxLabel5.Visible      := true;
    end;
end;

procedure TfmBankFindForm.cxCheckBoxNoteClick(Sender: TObject);
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

procedure TfmBankFindForm.cxCheckBox1Click(Sender: TObject);
begin
    if cxCheckBox1.Checked then
    begin
        cxLabel9.Visible       := false;
        cxButtonEdit2.Visible := true;
        cxButtonEdit2.SetFocus;
        cxButtonEdit2PropertiesButtonClick(Sender, 1);
    end else
    begin
        cxButtonEdit2.Visible := false;
        cxLabel9.Visible       := true;
    end;
end;

procedure TfmBankFindForm.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    i, j : integer;
//    id : int64;
    res : variant;
begin
    if cxRadioButton1.Checked
    then
        Res := GlobalSPR.GetSch(self, d.Handle, fsNormal, cxDateEditFrom.Date, 1, 0, 0)
    else
        Res := GlobalSPR.GetSch(self, d.Handle, fsNormal, cxDateEditProvFrom.Date, 1, 0, 0);
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
//                    id := Res[i][0];
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
//                    id := Res[i][0];
                end;
                cxButtonEdit2.Text := cxButtonEdit2.Text + ')';
            end;
        end
        else
        begin
//            if cxButtonEdit2.text = '' then
            begin
                cxCheckBox1.Checked   := false;
                cxLabel9.Visible      := true;
                cxButtonEdit2.Visible := false;
            end;
        end;
end;

procedure TfmBankFindForm.cxCheckBoxDateClick(Sender: TObject);
begin
//    cxCheckBoxDate.Checked := true;
end;

procedure TfmBankFindForm.cxButtonEdit3PropertiesButtonClick(
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

procedure TfmBankFindForm.cxButtonEdit4PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := LoadDogManedger.WorkSpMfoRsch(self, D.Handle, fsNormal, 'get', -1);
    if VarArrayDimCount(res) > 0 then
    begin
        cxLabel10.Visible     := false;
        cxButtonEdit4.Visible := true;
        if res[0][0] > 0 then
        begin
            id_ras_native := res[0][0];
            cxButtonEdit4.Text := res[0][4];
        end;
    end else
    begin
        cxCheckBox3.Checked := false;
    end;
end;

procedure TfmBankFindForm.cxCheckBox3Click(Sender: TObject);
begin
    if cxCheckBox3.Checked then
    begin
        cxLabel10.Visible     := false;
        cxButtonEdit4.Visible := true;
        cxButtonEdit4PropertiesButtonClick(Sender, 1);
    end else
    begin
        cxLabel10.Visible     := true;
        cxButtonEdit4.Visible := false;
    end;
end;

procedure TfmBankFindForm.RadioButton1Click(Sender: TObject);
begin
    if RadioButton1.Checked then
    begin
        cxButtonEdit3.Enabled := true;
        cxButtonEdit5.Enabled := false;
        cxTextEdit1.Enabled   := false;
    end;
end;

procedure TfmBankFindForm.RadioButton2Click(Sender: TObject);
begin
    if RadioButton2.Checked then
    begin
        cxButtonEdit3.Enabled := false;
        cxButtonEdit5.Enabled := true;
        cxTextEdit1.Enabled   := false;
    end;
end;

procedure TfmBankFindForm.RadioButton3Click(Sender: TObject);
begin
    if RadioButton3.Checked then
    begin
        cxButtonEdit3.Enabled := false;
        cxButtonEdit5.Enabled := false;
        cxTextEdit1.Enabled   := true;
        cxTextEdit1.SetFocus;
    end;
end;

procedure TfmBankFindForm.cxButtonEdit5PropertiesButtonClick(
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
        cxButtonEdit5.Text := VarToStr(o['RATE_ACCOUNT']);
    end else
    begin
//        cxButtonEdit3.Visible := false;
        cxLabel5.Visible      := true;
        cxCheckBoxFio.Checked := false;
    end;
    i.Free;
    o.Free;
end;

procedure TfmBankFindForm.cxTextEdit1Exit(Sender: TObject);
begin
    if (cxTextEdit1.text = '') and (cxButtonEdit3.text = '') and (cxButtonEdit5.Text = '') then
    begin
        cxCheckBoxFio.Checked := false;
        cxLabel5.Visible      := true;
    end;
end;

procedure TfmBankFindForm.SpeedButton1Click(Sender: TObject);
begin
    cxDateEditFrom.Date := IncMonth(cxDateEditFrom.Date, -1);
end;

procedure TfmBankFindForm.SpeedButton2Click(Sender: TObject);
begin
    cxDateEditFrom.Date := IncMonth(cxDateEditFrom.Date, 1);
end;

procedure TfmBankFindForm.SpeedButton3Click(Sender: TObject);
begin
    cxDateEditTo.Date := IncMonth(cxDateEditTo.Date, -1);
end;

procedure TfmBankFindForm.SpeedButton4Click(Sender: TObject);
begin
    cxDateEditTo.Date := IncMonth(cxDateEditTo.Date, 1);
end;

procedure TfmBankFindForm.SpeedButton5Click(Sender: TObject);
begin
    cxDateEditProvFrom.Date := IncMonth(cxDateEditProvFrom.Date, -1);
end;

procedure TfmBankFindForm.SpeedButton6Click(Sender: TObject);
begin
    cxDateEditProvFrom.Date := IncMonth(cxDateEditProvFrom.Date, 1);
end;

procedure TfmBankFindForm.SpeedButton7Click(Sender: TObject);
begin
    cxDateEditProvTo.Date := IncMonth(cxDateEditProvTo.Date, -1);
end;

procedure TfmBankFindForm.SpeedButton8Click(Sender: TObject);
begin
    cxDateEditProvTo.Date := IncMonth(cxDateEditProvTo.Date, 1);
end;

procedure TfmBankFindForm.cxRadioButton1Click(Sender: TObject);
begin
    if cxRadioButton1.Checked then
    begin
        cxLabel2.Visible        := true;
        SpeedButton1.Visible    := true;
        cxDateEditFrom.Visible  := true;
        SpeedButton2.Visible    := true;
        cxLabel3.Visible        := true;
        SpeedButton3.Visible    := true;
        cxDateEditTo.Visible    := true;
        SpeedButton4.Visible    := true;
        cxLabel11.Visible          := false;
        SpeedButton5.Visible       := false;
        cxDateEditProvFrom.Visible := false;
        SpeedButton6.Visible       := false;
        cxLabel12.Visible          := false;
        SpeedButton7.Visible       := false;
        cxDateEditProvTo.Visible   := false;
        SpeedButton8.Visible       := false;
    end;
end;

procedure TfmBankFindForm.cxRadioButton2Click(Sender: TObject);
begin
    if cxRadioButton2.Checked then
    begin
        cxLabel11.Visible          := true;
        SpeedButton5.Visible       := true;
        cxDateEditProvFrom.Visible := true;
        SpeedButton6.Visible       := true;
        cxLabel12.Visible          := true;
        SpeedButton7.Visible       := true;
        cxDateEditProvTo.Visible   := true;
        SpeedButton8.Visible       := true;
        cxLabel2.Visible        := false;
        SpeedButton1.Visible    := false;
        cxDateEditFrom.Visible  := false;
        SpeedButton2.Visible    := false;
        cxLabel3.Visible        := false;
        SpeedButton3.Visible    := false;
        cxDateEditTo.Visible    := false;
        SpeedButton4.Visible    := false;
    end;
end;

procedure TfmBankFindForm.cxCheckBox4Click(Sender: TObject);
begin
    if cxCheckBox4.Checked then
    begin
        cxLabel13.Visible     := false;
        cxButtonEdit6.Visible := true;
        cxButtonEdit6.SetFocus;
        cxButtonEdit6PropertiesButtonClick(Sender, 1);
    end else
    begin
        cxButtonEdit6.Visible   := false;
        cxLabel13.Visible       := true;
    end;
end;

procedure TfmBankFindForm.cxButtonEdit6PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    inputDog : TDogInput;
    res   : TDogResult;
//    i, j, itt : integer;
//    id_ss : int64;
begin
    SYS_ID_USER           := id_user;
    LoadSysData(pFIBTransaction1);
    decimalseparator      := ',';
    inputDog              := SYS_DEFAULT_DOG_INPUT;
    inputDog.Owner        := Self;
    inputDog.DBHandle     := D.Handle;
    inputDog.ReadTrans    := pFIBTransaction1.Handle;
    inputDog.WriteTrans   := TWr.Handle;
    inputDog.FormStyle    := fsNormal;
    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text := 'select * from BANK_INI';
    DataSet.Open;
    if cxRadioButtonPrihod.Checked
        then inputDog.id_Group_add := StrToInt64(DataSet.FieldByName('ID_GROUP_ADD_PR').AsString)
        else inputDog.id_Group_add := StrToInt64(DataSet.FieldByName('ID_GROUP_ADD_RAS').AsString);
    inputDog.id_Group     := StrToint64(DataSet.FieldByName('ID_GROUP').AsString);
    DataSet.Close;
    inputDog.Summa        := 1;
    inputDog.filter.bShowFilterForm := true;
    inputDog.isZayav     := false;
    inputDog.arndGetPay  := 1;
    inputDog.shablon_data.bUse     := true;
    if cxRadioButton1.Checked then
    begin
        inputDog.shablon_data.date_dog := cxDateEditFrom.Date;
        inputDog.DateSys               := cxDateEditFrom.Date;
        inputDog.DateDoc               := cxDateEditFrom.Date;
    end else
    begin
        inputDog.shablon_data.date_dog := cxDateEditProvFrom.Date;
        inputDog.DateSys               := cxDateEditProvFrom.Date;
        inputDog.DateDoc               := cxDateEditProvFrom.Date;
    end;
    res := ShowDogMain(inputDog);
    if res.ModalResult = 1 then
    begin
        id_dog   := res.id_dog;
        kod_dog  := res.kod_dog;
        cxButtonEdit6.Text := Un_R_file_Alex.BANK_TYPE_DOGOVOR+' : ' + VarToStr(res.name_tip_dog)+'; ¹  '+VarToStr(res.n_dog)+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +VarToStr(res.d_dog) + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + VarToStr(res.regest_num)+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + VarToStr(res.name_customer);
    end else
        cxCheckBox4.Checked := false;
end;

procedure TfmBankFindForm.cxCheckBox5Click(Sender: TObject);
begin
    if cxCheckBox5.Checked then
    begin
        cxButtonEdit7.Visible := true;
        cxButtonEdit7.SetFocus;
        cxButtonEdit7PropertiesButtonClick(self, 0);
    end else
    begin
        cxButtonEdit7.Visible := false;
    end;
end;

procedure TfmBankFindForm.cxCheckBox6Click(Sender: TObject);
begin
    if cxCheckBox6.Checked then
    begin
        cxButtonEdit10.Visible := true;
        cxButtonEdit10.SetFocus;
        cxButtonEdit10PropertiesButtonClick(self, 1);
    end else
    begin
        cxButtonEdit10.Visible := false;
    end;
end;

procedure TfmBankFindForm.cxCheckBox9Click(Sender: TObject);
begin
    if cxCheckBox9.checked then
    begin
        cxRadioButton4.visible:=true;
        cxRadioButton5.visible:=True;
    end else
    begin
        cxRadioButton4.visible:=false;
        cxRadioButton5.visible:=False;
        cxButtonEdit8.visible:=False;
        cxButtonEdit9.visible:=False;
    end;
end;

procedure TfmBankFindForm.cxRadioButton4Click(Sender: TObject);
begin
        cxButtonEdit8.Visible := true;
        cxButtonEdit9.Visible := false;
        cxButtonEdit8.SetFocus;
        cxButtonEdit8PropertiesButtonClick(self, 0);
end;

procedure TfmBankFindForm.cxRadioButton5Click(Sender: TObject);
begin
    cxButtonEdit9.Visible := true;
    cxButtonEdit8.Visible := false;
    cxButtonEdit9.SetFocus;
    cxButtonEdit9PropertiesButtonClick(self, 0);
end;

procedure TfmBankFindForm.cxButtonEdit7PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    rr : variant;
begin
    if cxRadioButton1.Checked
    then
        rr := GlobalSPR.GetSmets(Self, d.Handle, cxDateEditFrom.Date, psmSmet)
    else
        rr := GlobalSPR.GetSmets(Self, d.Handle, cxDateEditProvFrom.Date, psmSmet);
    if VarArrayDimCount(rr)>0 then
    begin
        if rr[0]<>NULL then
        begin
            id_smeta           := rr[0];
            cxButtonEdit7.Text := VarToStr(rr[3]) + ' ' + VarToStr(rr[2]);
        end;
    end else
    begin
        cxCheckBox5.Checked    := false;
    end;
end;

procedure TfmBankFindForm.cxButtonEdit10PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    id : variant;
begin
    if cxRadioButton1.Checked
    then
        id := GlobalSPR.GetKEKVSpr(self, d.Handle, FSNormal, cxDateEditFrom.Date, 1)
    else
        id := GlobalSPR.GetKEKVSpr(self, d.Handle, FSNormal, cxDateEditProvFrom.Date, 1);
    if VarArrayDimCount(id)>0 then
    begin
        if VarArrayDimCount(id)>0 then
        begin
             if id[0][0]<>NULL then
             begin
                 id_kekv            := id[0][0];
                 cxButtonEdit10.Text := VarToStr(id[0][2]) + ' ' + VArToStr(id[0][1]);
             end;
        end;
    end else
    begin
        cxCheckBox6.Checked := false;
    end;
end;

procedure TfmBankFindForm.cxButtonEdit8PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    rr : variant;
begin
    if cxRadioButton1.Checked
    then
        rr := GlobalSPR.GetRazdStSpr(Self, d.Handle, fsNormal, cxDateEditFrom.Date, 0, allData, cmRazd)
    else
        rr := GlobalSPR.GetRazdStSpr(Self, d.Handle, fsNormal, cxDateEditProvFrom.Date, 0, allEnable, cmRazd);
    try
    begin
        id_razd := rr;
        pFIBDataSet1.Close;
        if cxRadioButton1.Checked
        then
            pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM pub_get_name_budg_by_id('+IntToStr(id_razd)+', '''+DateToStr(cxDateEditFrom.Date)+''', '+IntToStr(2)+')'
        else
            pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM pub_get_name_budg_by_id('+IntToStr(id_razd)+', '''+DateToStr(cxDateEditProvFrom.Date)+''', '+IntToStr(2)+')';
        pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM pub_get_name_budg_by_id('+IntToStr(id_razd)+', '''+DateToStr(Date)+''', '+IntToStr(2)+')';
        pFIBDataSet1.Open;
        cxButtonEdit8.Text := pFIBDataSet1.FieldByName('KOD_OBJECT').AsString + ' - ' + pFIBDataSet1.FieldByName('TITLE_OBJECT').AsString;
        pFIBDataSet1.Close;
    end;
        except
        cxCheckBox9.Checked := false;
    end;
end;

procedure TfmBankFindForm.cxButtonEdit9PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    rr : variant;
begin
    if cxRadioButton1.Checked
    then
        rr := GlobalSPR.GetRazdStSpr(Self, d.Handle, fsNormal, cxDateEditFrom.Date, 0, allData, cmSt)
    else
        rr := GlobalSPR.GetRazdStSpr(Self, d.Handle, fsNormal, cxDateEditProvFrom.Date, 0, allEnable, cmSt);

    //rr := GlobalSPR.GetRazdStSpr(Self, d.Handle, fsNormal, date, 0, allData, cmSt);
    try
        id_state := rr;
        pFIBDataSet1.Close;
        if cxRadioButton1.Checked
        then
            pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM pub_get_name_budg_by_id('+IntToStr(id_state)+', '''+DateToStr(cxDateEditFrom.Date)+''', '+IntToStr(3)+')'
        else
            pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM pub_get_name_budg_by_id('+IntToStr(id_state)+', '''+DateToStr(cxDateEditProvFrom.Date)+''', '+IntToStr(3)+')';
        pFIBDataSet1.Open;
        cxButtonEdit9.Text := pFIBDataSet1.FieldByName('KOD_OBJECT').AsString + ' - ' + pFIBDataSet1.FieldByName('TITLE_OBJECT').AsString;
        pFIBDataSet1.Close;
    except
        cxCheckBox9.Checked := false;
    end;
end;

procedure TfmBankFindForm.cxCheckBox8Click(Sender: TObject);
begin
    if cxCheckBox8.Checked then
    begin
        cxLabel14.Visible      := false;
        cxTextEdit_num.Visible := true;
        cxTextEdit_num.SetFocus;
    end else
    begin
        cxTextEdit_num.Visible := false;
        cxLabel14.Visible      := true;
    end;
end;

procedure TfmBankFindForm.cxCheckBoxCommentClick(Sender: TObject);
begin
    if cxCheckBoxComment.Checked then
    begin
        cxLabel16.Visible       := false;
        cxTextEditComment.Visible := true;
        cxTextEditComment.SetFocus;
    end else
    begin
        cxTextEditComment.Visible := false;
        cxLabel16.Visible       := true;
    end;
end;

procedure TfmBankFindForm.cxCheckBoxMenClick(Sender: TObject);
begin
    if cxCheckBoxMen.Checked then
    begin
        cxLabel15.Visible       := false;
        cxButtonEditMen.Visible := true;
        cxButtonEditMen.SetFocus;
    end else
    begin
        cxButtonEditMen.Visible := false;
        cxLabel15.Visible       := true;
    end;
end;

procedure TfmBankFindForm.cxButtonEditMenPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : Variant;
begin
    res := Un_lo_file_Alex.mY_getManEx(self,D.Handle, False, false, id_men);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null){ and (res[1]<>null) }then
        begin
            if id_men <> res[0] then
            begin
                id_men            := res[0];
                cxButtonEditMen.Text := res[1];//óêð
            end;
        end;
    end;
end;

procedure TfmBankFindForm.cxCheckBox7Click(Sender: TObject);
begin
    if cxCheckBox7.Checked then
    begin
        cxLabel17.Visible     := false;
        cxButtonEdit11.Visible := true;
        cxButtonEdit11.SetFocus;
        cxButtonEdit11PropertiesButtonClick(Sender, 1);
    end else
    begin
        cxButtonEdit11.Visible   := false;
        cxLabel17.Visible       := true;
    end;
end;

procedure TfmBankFindForm.cxButtonEdit11PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    id_ss : int64;
    y, o : TSpravParams;
    ffio, n_cust, n_do, reg_n, d_d : string;
    AParameter : TcnSimpleParamsEx;
    ResOpl     : Variant;
begin
    cxButtonEdit11.Text := '';
    id_dog   := 0;
    kod_dog  := 0;
    AParameter                              := TcnSimpleParamsEx.Create;
    AParameter.Owner                        := self;
    AParameter.Db_Handle                    := D.Handle;
    AParameter.Formstyle                    := fsNormal;
    AParameter.cnParamsToPakage.Note        := '';
    AParameter.WaitPakageOwner              := self;
    AParameter.cnParamsToPakage.BarCode     := '';
    AParameter.cnParamsToPakage.IsWithSumma := true;


    ResOpl:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_ContractsList.bpl','ShowSPContractsList');
    if VarArrayDimCount(ResOpl)>0 then
    begin
       y := TSpravParams.Create;
       o := TSpravParams.Create;
       y['DataBase'] := Integer(D.Handle);
       y['ReadTransaction'] := Integer(pFIBTransaction1.Handle);//Integer(D.DefaultTransaction.Handle);
       y['ID_DOG']  := ResOpl[0][2];
       y['KOD_DOG'] := ResOpl[0][12];
       GetDogovorInfo(Self, @y, @o);
       try ffio := o['FIO_COMBO']       except ffio := '';   end;
       try n_cust := o['NAME_CUSTOMER'] except n_cust := ''; end;
       try d_d := DateToStr(o['D_DOG']) except d_d := '01.01.1900'; end;
       try n_do := o['NUM_DOG']         except n_do := '';   end;
       try reg_n := o['REGEST_NUM']     except reg_n := '';  end;
       cxButtonEdit11.Text := ffio + ' ' +  n_do + Un_R_file_Alex.BANK_REG_NUM + reg_n + ' â³ä - ' + d_d;
       id_dog   := ResOpl[0][2];
       kod_dog  := ResOpl[0][12];
    end else
        cxCheckBox7.Checked := false;
end;

procedure TfmBankFindForm.FormShow(Sender: TObject);
var
    reg:TRegistry;
begin
    //FormStorage1.RestoreFormPlacement;
    reg:=TRegistry.Create;
    try
        reg.RootKey:=HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12300006759837\Nigol\2\',False) then
        begin
             cxDateEditFrom.Date     := strtodate(reg.ReadString('FindcxDateEditFrom'));
             cxDateEditTo.Date       := strtodate(reg.ReadString('FindcxDateEditTo'));
             cxDateEditProvFrom.Date := strtodate(reg.ReadString('FindcxDateEditProvFrom'));
             cxDateEditProvTo.Date   := strtodate(reg.ReadString('FindcxDateEditProvTo'));
             cxTextEditFrom.Text     := reg.ReadString('FindcxTextEditFrom');
             cxTextEditTo.Text       :=reg.ReadString('FindcxTextEditTo');
             cxTextEditNote.Text     :=reg.ReadString('FindcxTextEditNote');
             cxTextEdit_Num.Text     :=reg.ReadString('FindcxTextEdit_Num');


            if  (reg.ReadString('FindcxRadioButton1')='1') then
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

            if (reg.ReadString('FindcxCheckBoxNote')='1')  then
            begin
                cxCheckBoxNote.Checked := true;
            end
            else
            begin
                cxCheckBoxNote.Checked := false;
            end;

            if  (reg.ReadString('FindcxCheckBox8')='1')then
            begin
                cxCheckBox8.Checked := true;
            end
            else
            begin
                cxCheckBox8.Checked := false;
            end;


            if (reg.ReadString('FindcxRadioButtonPrihod')='1') then
            begin
                cxRadioButtonPrihod.Checked := true;
            end
            else
            begin
                cxRadioButtonPrihod.Checked := false;
            end;

            if (reg.ReadString('FindcxRadioButton3')='1') then
            begin
                cxRadioButton3.Checked := true;
            end
            else
            begin
                cxRadioButton3.Checked := false;
            end;

            if (reg.ReadString('FindcxRadioButtonAll')='1') then
            begin
                cxRadioButtonAll.Checked := true;
            end
            else
            begin
                cxRadioButtonAll.Checked := false;
            end;

        end ;
    finally
        reg.Free;
    end;
end;


procedure TfmBankFindForm.cxTextEditFromPropertiesChange(Sender: TObject);
begin
   if( sum_from_change = 0) then
   begin
       sum_from_change := sum_from_change+1;
       exit;
   end;

   cxTextEditTo.Text := cxTextEditFrom.Text;

end;

procedure TfmBankFindForm.cxCheckBox10Click(Sender: TObject);
begin
    if cxCheckBox10.Checked then
    begin
        cxButtonEdit12.Visible := true;
        cxButtonEdit12.SetFocus;
        cxButtonEdit12PropertiesButtonClick(self, 0);
    end else
    begin
        cxButtonEdit12.Visible := false;
    end;
end;

procedure TfmBankFindForm.cxButtonEdit12PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  rr : Variant;
begin
    if cxRadioButton1.Checked
    then
        rr := GlobalSpr.GetSmGrp(Self, d.Handle, fsNormal, 0, id_user)
    else
        rr := GlobalSpr.GetSmGrp(Self, d.Handle, fsNormal, 0, id_user);

    if VarArrayDimCount(rr)>0 then
    begin
        if rr[0]<>NULL then
        begin
            id_sm_group :=rr[0];
            sm_group_text :=VarToStr(rr[1]);
            kod_sm_group := rr[2];
            cxButtonEdit12.Text := VarToStr(rr[2]) + ' ' + VarToStr(rr[1]);
        end;
    end else
    begin
        cxCheckBox10.Checked    := false;
    end;
end;

end.
