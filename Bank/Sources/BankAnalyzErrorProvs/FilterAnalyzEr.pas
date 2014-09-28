unit FilterAnalyzEr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cxButtonEdit, cxCheckBox, StdCtrls, cxRadioGroup, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxContainer, cxEdit, cxLabel, Buttons,
  cxControls, cxGroupBox, cxLookAndFeelPainters, cxButtons, Un_R_file_Alex, GlobalSPR,
  ImgList, ActnList, Un_lo_file_Alex, Placemnt;

type
  TSch = record
      id : int64;
      number : string;
  end;
  TResSch = record
      TT : array of TSch;
  end;
  TfrmFilterAnalizEr = class(TForm)
    Database: TpFIBDatabase;
    Transaction: TpFIBTransaction;
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
    RadioButtonDateDoc: TcxRadioButton;
    RadioButtonDateProv: TcxRadioButton;
    cxLabel11: TcxLabel;
    cxDateEditProvFrom: TcxDateEdit;
    cxLabel12: TcxLabel;
    cxDateEditProvTo: TcxDateEdit;
    cxGroupBox3: TcxGroupBox;
    CheckBoxMainSch: TcxCheckBox;
    LabelMainSch: TcxLabel;
    ButtonEditMainSch: TcxButtonEdit;
    CheckBoxKorSch: TcxCheckBox;
    ButtonEditKorSch: TcxButtonEdit;
    LabelKorSch: TcxLabel;
    cxGroupBox4: TcxGroupBox;
    CheckBoxRSnative: TcxCheckBox;
    LabelRsNative: TcxLabel;
    ButtonEditRsNative: TcxButtonEdit;
    cxRadioGroup1: TcxRadioGroup;
    cxRadioButtonAll: TcxRadioButton;
    cxRadioButtonRashod: TcxRadioButton;
    cxRadioButtonPrihod: TcxRadioButton;
    cxGroupBox2: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    ActionPrint: TAction;
    ActionClose: TAction;
    ImageList1: TImageList;
    pFIBDataSet1: TpFIBDataSet;
    FormStorage1: TFormStorage;
    procedure CheckBoxRSnativeClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure CheckBoxMainSchClick(Sender: TObject);
    procedure CheckBoxKorSchClick(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure RadioButtonDateDocClick(Sender: TObject);
    procedure RadioButtonDateProvClick(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ButtonEditRsNativePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditMainSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditKorSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Owner : TComponent;

  public
    id_user, id_ras_native: int64;
    first : boolean;
    ResSch : TResSch;
    ResKorSch : TResSch;
    constructor Create(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase); reintroduce; overload;
  end;

{var
  frmFilterAnalizEr: TfrmFilterAnalizEr;  }

function BankShowAnalyzErrorProvs(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase): integer; stdcall;
   exports BankShowAnalyzErrorProvs;


implementation

uses DateUtils, ResultAnalyz,  dogLoaderUnit, LoadDogManedger, AccMgmt, BankSchSelectAnalyz;


{$R *.dfm}

function BankShowAnalyzErrorProvs(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase): integer;
var
    T : TfrmFilterAnalizEr;
begin
    T := TfrmFilterAnalizEr.Create(AOwner, id_us, DB);
    T.Show;
    Result := -1;
end;

constructor TfrmFilterAnalizEr.Create(AOwner: TComponent; id_us: int64;DB: TpFIBDatabase);
begin
    inherited Create(AOwner);
    Owner := AOwner;

    first := false;
    Database := DB;
    Transaction.DefaultDatabase      := Database;
    Database.DefaultTransaction      := Transaction;

    pFIBDataSet1.Database            := DB;
    pFIBDataSet1.Transaction         := Transaction;

    id_user                          := id_us;

    cxDateEditTo.Date       := date;
    cxDateEditProvTo.Date   := Date;
    cxDateEditProvFrom.Date := IncMonth(date, -1);;
    cxDateEditFrom.Date     := IncMonth(date, -1);

    Transaction.StartTransaction;

    Caption := Un_R_file_Alex.BANK_ANALYZ_ER_Prov_FILTER;

    CheckBoxKorSch.Properties.Caption       := Un_R_file_Alex.KASSA_FIND_CAP_17;
    CheckBoxMainSch.Properties.Caption      := Un_R_file_Alex.KASSA_FIND_CAP_14;
    CheckBoxRSnative.Properties.Caption     := Un_R_file_Alex.BANK_FIND_R_S_PRED;
    cxGroupBox3.Caption                     := Un_R_file_Alex.BANK_FIND_KOR_BAL_SCH;
    cxGroupBox2.Caption                     := Un_R_file_Alex.J4_OSTATOK_ADD_FORM_GR_4;
    RadioButtonDateDoc.Caption              := Un_R_file_Alex.KASSA_FIND_CAP_10;
    RadioButtonDateProv.Caption             := Un_R_file_Alex.KASSA_FIND_CAP_18;
    cxRadioButtonPrihod.Caption             := Un_R_file_Alex.KASSA_FIND_CAP_7;
    cxRadioButtonRashod.Caption             := Un_R_file_Alex.KASSA_FIND_CAP_8;
    cxRadioButtonAll.Caption                := Un_R_file_Alex.KASSA_FIND_CAP_9;
    LabelMainSch.Caption                    := Un_R_file_Alex.KASSA_FIND_CAP_1;
    cxLabel2.Caption                        := Un_R_file_Alex.KASSA_FIND_CAP_2;
    cxLabel3.Caption                        := Un_R_file_Alex.KASSA_FIND_CAP_3;
    LabelKorSch.Caption                     := Un_R_file_Alex.KASSA_FIND_CAP_16;
    LabelRsNative.Caption                   := Un_R_file_Alex.BANK_FIND_RS_WITHOUT;
    cxLabel11.Caption                       := Un_R_file_Alex.KASSA_FIND_CAP_2;
    cxLabel12.Caption                       := Un_R_file_Alex.KASSA_FIND_CAP_3;
    ActionPrint.Caption                     := Un_R_file_Alex.MY_BUTTON_F;
    ActionClose.Caption                     := Un_R_file_Alex.MY_BUTTON_CLOSE;

    RadioButtonDateDoc.Checked              := true;

    cxLabel2.Visible                   := true;
    SpeedButton1.Visible               := true;
    cxDateEditFrom.Visible             := true;
    SpeedButton2.Visible               := true;
    cxLabel3.Visible                   := true;
    SpeedButton3.Visible               := true;
    cxDateEditTo.Visible               := true;
    SpeedButton4.Visible               := true;
    cxLabel11.Visible                  := false;
    SpeedButton5.Visible               := false;
    cxDateEditProvFrom.Visible         := false;
    SpeedButton6.Visible               := false;
    cxLabel12.Visible                  := false;
    SpeedButton7.Visible               := false;
    cxDateEditProvTo.Visible           := false;
    SpeedButton8.Visible               := false;


end;

procedure TfrmFilterAnalizEr.CheckBoxRSnativeClick(Sender: TObject);
begin
    if CheckBoxRSnative.Checked then
    begin
        LabelRsNative.Visible     := false;
        ButtonEditRsNative.Visible := true;
        ButtonEditRsNativePropertiesButtonClick(Sender, 1);
    end else
    begin
        LabelRsNative.Visible     := true;
        ButtonEditRsNative.Visible := false;
    end;
end;

procedure TfrmFilterAnalizEr.SpeedButton1Click(Sender: TObject);
begin
    cxDateEditFrom.Date := IncMonth(cxDateEditFrom.Date, -1);
end;

procedure TfrmFilterAnalizEr.SpeedButton2Click(Sender: TObject);
begin
    cxDateEditFrom.Date := IncMonth(cxDateEditFrom.Date, 1);
end;

procedure TfrmFilterAnalizEr.SpeedButton3Click(Sender: TObject);
begin
    cxDateEditTo.Date := IncMonth(cxDateEditTo.Date, -1);
end;

procedure TfrmFilterAnalizEr.SpeedButton4Click(Sender: TObject);
begin
    cxDateEditTo.Date := IncMonth(cxDateEditTo.Date, 1);
end;

procedure TfrmFilterAnalizEr.SpeedButton5Click(Sender: TObject);
begin
    cxDateEditProvFrom.Date := IncMonth(cxDateEditProvFrom.Date, -1);
end;

procedure TfrmFilterAnalizEr.SpeedButton6Click(Sender: TObject);
begin
    cxDateEditProvFrom.Date := IncMonth(cxDateEditProvFrom.Date, 1);
end;

procedure TfrmFilterAnalizEr.SpeedButton7Click(Sender: TObject);
begin
    cxDateEditProvTo.Date := IncMonth(cxDateEditProvTo.Date, -1);
end;


procedure TfrmFilterAnalizEr.SpeedButton8Click(Sender: TObject);
begin
    cxDateEditProvTo.Date := IncMonth(cxDateEditProvTo.Date, 1);
end;

procedure TfrmFilterAnalizEr.CheckBoxMainSchClick(Sender: TObject);
begin
    if CheckBoxMainSch.Checked then
    BEGIN
        ButtonEditMainSch.Visible  := true;
        LabelMainSch.Visible       := false;
        ButtonEditMainSchPropertiesButtonClick(Sender, 1);
    END else
    begin
        LabelMainSch.Visible       := true;
        ButtonEditMainSch.Visible  := false;
    end;
end;

procedure TfrmFilterAnalizEr.CheckBoxKorSchClick(Sender: TObject);
begin
    if CheckBoxKorSch.Checked then
    begin
        LabelKorSch.Visible       := false;
        ButtonEditKorSch.Visible := true;
        ButtonEditKorSch.SetFocus;
        ButtonEditKorSchPropertiesButtonClick(Sender, 1);
    end else
    begin
        ButtonEditKorSch.Visible := false;
        LabelKorSch.Visible       := true;
    end;
end;

procedure TfrmFilterAnalizEr.ActionPrintExecute(Sender: TObject);
var
    T : TfrmResultAnalyz;
    i, error, err : integer;
begin
    if not first then
    begin
        pFIBDataSet1.Close;
        if RadioButtonDateDoc.Checked
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

    T := TfrmResultAnalyz.Create(self, self);
    T.ShowModal;
    T.Free;
end;

procedure TfrmFilterAnalizEr.RadioButtonDateDocClick(Sender: TObject);
begin
    if RadioButtonDateDoc.Checked then
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

procedure TfrmFilterAnalizEr.RadioButtonDateProvClick(Sender: TObject);
begin
    if RadioButtonDateProv.Checked then
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

procedure TfrmFilterAnalizEr.ActionCloseExecute(Sender: TObject);
begin
    close;
end;

procedure TfrmFilterAnalizEr.ButtonEditRsNativePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := LoadDogManedger.WorkSpMfoRsch(self, Database.Handle, fsNormal, 'get', -1);
    if VarArrayDimCount(res) > 0 then
    begin
        LabelRsNative.Visible     := false;
        ButtonEditRsNative.Visible := true;
        if res[0][0] > 0 then
        begin
            id_ras_native := res[0][0];
            ButtonEditRsNative.Text := res[0][4];
        end;
    end else
    begin
        CheckBoxRSnative.Checked := false;
    end;
end;

procedure TfrmFilterAnalizEr.ButtonEditMainSchPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var    i, error, err : integer;
    Res : Variant;
begin
    if not first then
    begin
        pFIBDataSet1.Close;
        if RadioButtonDateDoc.Checked
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
        ButtonEditMainSch.Text := '';
        try
            if VarArrayDimCount(Res) > 0 then
            begin
                SetLength(ResSch.TT, 1);
                for i := 0 to 1000 do
                if (Res[i][0]<>null) and (Res[i][1]<>null) then
                begin
//                    id_k := res[i][0];
//                    if VarArrayDimCount(Res)>1 then
                        ButtonEditMainSch.Text := Res[i][1] + ', ' + ButtonEditMainSch.Text;
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
        CheckBoxMainSch.Checked   := false;
        LabelMainSch.Visible      := true;
        ButtonEditMainSch.Visible := false;
    end;
end;

procedure TfrmFilterAnalizEr.ButtonEditKorSchPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    i, j : integer;
//    id : int64;
    res : variant;
begin
    if RadioButtonDateDoc.Checked
    then
        Res := GlobalSPR.GetSch(self, database.Handle, fsNormal, cxDateEditFrom.Date, 1, 0, 0)
    else
        Res := GlobalSPR.GetSch(self, database.Handle, fsNormal, cxDateEditProvFrom.Date, 1, 0, 0);
        if VarArrayDimCount(Res) > 0 then
        begin
            j := VarArrayHighBound(res, 1)-VarArrayLowBound(res, 1);
            ButtonEditKorSch.Text := '';
            if j > 0 then
            begin
                ButtonEditKorSch.Text := Un_R_file_Alex.KASSA_FIND_SCH_COL_1 + '- ' + IntToStr(j+1)+' (';
                SetLength(ResKorSch.TT, 1);
                for i := 0 to j do
                if (Res[i][0]<>null) and (Res[i][3]<>null) then
                begin
                    SetLength(ResKorSch.TT, length(ResKorSch.TT)+1);
                    ResKorSch.TT[i].id     := Res[i][0];
                    ResKorSch.TT[i].Number := Res[i][1];
                    ButtonEditKorSch.Text := ButtonEditKorSch.Text  + Res[i][3] + ', ';
                end;
                ButtonEditKorSch.Text := Copy(ButtonEditKorSch.Text, 1, length(ButtonEditKorSch.Text)-2)  + ')';
            end;
            if j = 0 then
            begin
                ButtonEditKorSch.Text := Un_R_file_Alex.KASSA_FIND_SCH_COL_1 + '- ' + IntToStr(j+1)+' (';
                SetLength(ResKorSch.TT, 1);
                for i := 0 to j do
                if (Res[i][0]<>null) and (Res[i][3]<>null) then
                begin
                    SetLength(ResKorSch.TT, length(ResKorSch.TT)+1);
                    ResKorSch.TT[i].id     := Res[i][0];
                    ResKorSch.TT[i].Number := Res[i][1];
                    ButtonEditKorSch.Text := ButtonEditKorSch.Text + Res[i][3] + ' - ' + Res[i][1];
                end;
                ButtonEditKorSch.Text := ButtonEditKorSch.Text + ')';
            end;
        end
        else
        begin

            begin
                CheckBoxKorSch.Checked   := false;
                LabelKorSch.Visible      := true;
                ButtonEditKorSch.Visible := false;
            end;
        end;
end;

procedure TfrmFilterAnalizEr.FormCreate(Sender: TObject);
begin
    FormStorage1.RestoreFormPlacement;
end;

procedure TfrmFilterAnalizEr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FormStorage1.SaveFormPlacement;
end;

end.
