unit MainAvanceMonthSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLabel, cxRadioGroup, cxButtonEdit, MainForm;

type
  TfmMainAvanceMonthSelect = class(TForm)
    cxComboBoxMonth: TcxComboBox;
    cxSpinEdit1: TcxSpinEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxButtonEdit1: TcxButtonEdit;
    cxLabel3: TcxLabel;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxSpinEdit1Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    ww : TfmAvanceMainForm;
    id_sch : int64;
  public
    { Public declarations }
  end;

function SelectDay_avance(Ao : TComponent; var dd : TDate; var tt : integer; var s1, s2 : string; w : TfmAvanceMainForm; var id_s : int64; st : string) : boolean;
    exports SelectDay_avance;

implementation
uses Un_R_file_Alex, DateUtils, GlobalSPR;

{$R *.dfm}

function SelectDay_avance(Ao : TComponent; var dd : TDate; var tt : integer; var s1, s2 : string; w : TfmAvanceMainForm; var id_s : int64; st : string) : boolean;
var
    T : TfmMainAvanceMonthSelect;
begin
    T := TfmMainAvanceMonthSelect.Create(Ao);
    T.ww     := w;
    T.id_sch := id_s;
    T.cxComboBoxMonth.Properties.Items.Insert(0,  Un_R_file_Alex.MY_JANUARY);
    T.cxComboBoxMonth.Properties.Items.Insert(1,  Un_R_file_Alex.MY_FEBRIARY);
    T.cxComboBoxMonth.Properties.Items.Insert(2,  Un_R_file_Alex.MY_MARCH);
    T.cxComboBoxMonth.Properties.Items.Insert(3,  Un_R_file_Alex.MY_APRILE);
    T.cxComboBoxMonth.Properties.Items.Insert(4,  Un_R_file_Alex.MY_MAY);
    T.cxComboBoxMonth.Properties.Items.Insert(5,  Un_R_file_Alex.MY_JUNE);
    T.cxComboBoxMonth.Properties.Items.Insert(6,  Un_R_file_Alex.MY_JULY);
    T.cxComboBoxMonth.Properties.Items.Insert(7,  Un_R_file_Alex.MY_AUGUST);
    T.cxComboBoxMonth.Properties.Items.Insert(8,  Un_R_file_Alex.MY_SEPTEMBER);
    T.cxComboBoxMonth.Properties.Items.Insert(9,  Un_R_file_Alex.MY_OCTOBER);
    T.cxComboBoxMonth.Properties.Items.Insert(10, Un_R_file_Alex.MY_NOVEMBER);
    T.cxComboBoxMonth.Properties.Items.Insert(11, Un_R_file_Alex.MY_DESEMBER);

    T.cxComboBoxMonth.ItemIndex  := MonthOf(date)-1;
    T.cxSpinEdit1.Value          := YearOf(date);

    T.cxLabel2.Caption           := Un_R_file_Alex.J4_OSTATOK_FORM_YEAR;
    T.cxLabel1.Caption           := Un_R_file_Alex.J4_SELECT_DATE;
    T.cxLabel3.Caption           := Un_R_file_Alex.KASSA_PO_SCH;
    T.cxRadioButton1.Caption     := Un_R_file_Alex.J4_PO_DEBETU;
    T.cxRadioButton2.Caption     := Un_R_file_Alex.J4_PO_KREDITU;
    T.cxButton1.Caption          := Un_R_file_Alex.MY_ACTION_OK;
    T.cxButton2.Caption          := Un_R_file_Alex.MY_ACTION_CLOSE_CONST;
    T.cxButtonEdit1.Text         := st;
    if T.ShowModal = mrOk then
    begin
        if T.cxComboBoxMonth.ItemIndex < 10
            then dd := StrToDate('01.0'+IntTostr(T.cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(T.cxSpinEdit1.Value))
            else dd := StrToDate('01.'+IntTostr(T.cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(T.cxSpinEdit1.Value));
        if T.cxRadioButton1.Checked then
        begin
            tt := 1;
            s1 := Un_R_file_Alex.J4_PO_DEBETU;
        end else
        begin
            s1 := Un_R_file_Alex.J4_PO_KREDITU;
            tt := 0;
        end;
        id_s   := T.id_sch;
        s2 := T.cxComboBoxMonth.Text + ' ' + T.cxSpinEdit1.Text + Un_R_file_Alex.MY_YEAR;
        result := true;
    end else
    begin
        result := false;
    end;
    T.Free;
end;

procedure TfmMainAvanceMonthSelect.cxButton2Click(Sender: TObject);
begin
    Close;
end;

procedure TfmMainAvanceMonthSelect.cxButton1Click(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfmMainAvanceMonthSelect.cxSpinEdit1Click(Sender: TObject);
begin
    cxSpinEdit1.Value := cxSpinEdit1.Text;
end;

procedure TfmMainAvanceMonthSelect.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Res : Variant;
begin
    Res := GetSch(Self, ww.Database.Handle, fsNormal, Date, 1, 0, 0);
    if VarArrayDimCount(Res) > 0 then
    begin
        id_sch             := res[0][0];
        cxButtonEdit1.Text := res[0][3];
    end;
end;

end.
