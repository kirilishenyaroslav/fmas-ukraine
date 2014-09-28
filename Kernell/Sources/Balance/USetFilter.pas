unit USetFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel,
  cxDropDownEdit, cxControls, cxContainer, cxTextEdit, ActnList,
  cxMaskEdit, cxEdit;

type
  TfrmSetFilter = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button_OK: TcxButton;
    Button_Cancel: TcxButton;
    ComboBox_Month: TcxComboBox;
    Label_PeriodBeg: TcxLabel;
    ActionList1: TActionList;
    act_OK: TAction;
    act_Cancel: TAction;
    ComboBox_Year: TcxComboBox;
    procedure FormCreate(Sender: TObject);
    procedure act_OKExecute(Sender: TObject);
    procedure act_CancelExecute(Sender: TObject);
    procedure ComboBox_MonthKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
  public
    PeriodDate: TDate;
  end;

implementation

uses GlobalSPR, Resources_unitb, DateUtils, getBalance, UBalance;

{$R *.dfm}


procedure TfrmSetFilter.FormCreate(Sender: TObject);
var
  i: integer;
begin
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_12));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_11));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_10));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_09));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_08));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_07));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_06));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_05));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_04));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_03));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_02));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_01));

    ComboBox_Month.ItemIndex:=12-MonthOf(Date);

    for i:=BASE_YEAR+YEARS_COUNT downto BASE_YEAR do
        ComboBox_Year.Properties.Items.Add(inttostr(i));

    ComboBox_Year.ItemIndex:=BASE_YEAR+YEARS_COUNT-YearOf(Date);

    Button_OK.Caption     := getBalance.btn_Ok;
    Button_Cancel.Caption := getBalance.btn_Cancel;
end;

procedure TfrmSetFilter.act_OKExecute(Sender: TObject);
var
  year: integer;
  str: string;
begin
    year:=strtoint(ComboBox_Year.Text);
    str:='Рік повинен бути між '+IntToStr(BASE_YEAR)+' та '+IntToStr(BASE_YEAR+YEARS_COUNT)+' роками.';
    if (year>=BASE_YEAR) and (year<=BASE_YEAR+YEARS_COUNT)
    then begin
        PeriodDate:=EncodeDate(year,12-ComboBox_Month.ItemIndex,1);
        ModalResult:=mrYes;
    end else MessageBox(self.Handle,PChar(str),' УВАГА! ',MB_OK or MB_ICONWARNING);
end;

procedure TfrmSetFilter.act_CancelExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure TfrmSetFilter.ComboBox_MonthKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (key=38) and (ComboBox_Month.ItemIndex=0) and (ComboBox_Year.ItemIndex>0)
    then begin
        ComboBox_Year.ItemIndex:=ComboBox_Year.ItemIndex-1;
        ComboBox_Month.ItemIndex:=11;
        Key:=0;
    end;
    if (key=40) and (ComboBox_Month.ItemIndex=11) and (ComboBox_Year.ItemIndex<25)
    then begin
        ComboBox_Year.ItemIndex:=ComboBox_Year.ItemIndex+1;
        ComboBox_Month.ItemIndex:=0;
        Key:=0;
    end;
end;

end.

