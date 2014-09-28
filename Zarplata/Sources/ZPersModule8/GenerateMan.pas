unit GenerateMan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uFControl, uLabeledFControl, uSpravControl,
  ExtCtrls, AllPeopleUnit, qfTools, iBase, cxDropDownEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, Dates, uMainForm8;


type
  TfrmGenerate = class(TForm)
    RadioGroup1: TRadioGroup;
    RadioButtonMan: TRadioButton;
    RadioButtonAll: TRadioButton;
    PeopleEdit: TqFSpravControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    YearSpinEdit: TcxSpinEdit;
    MonthesList: TcxComboBox;
    YearSpinEdit1: TcxSpinEdit;
    MonthesList1: TcxComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure RadioButtonManClick(Sender: TObject);
    procedure RadioButtonAllClick(Sender: TObject);
    procedure PeopleEditOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MonthesListPropertiesEditValueChanged(Sender: TObject);
    procedure MonthesListEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     hand: TISC_DB_HANDLE;
     kod_setup: Integer;
     kod_setup_min: Integer;
     constructor Create(AOwner:TComponent;aKodSetup:Integer;aKodSetupMin:Integer);reintroduce;
  end;

var
    frmGenerate: TfrmGenerate;
    MonthesList_Text:array[1..12] of string=('Січень','Лютий','Березень','Квітень','Травень','Червень',
                                 'Липень','Серпень','Вересень','Жовтень','Листопад','Грудень');

implementation

{$R *.dfm}

procedure TfrmGenerate.RadioButtonManClick(Sender: TObject);
begin
    PeopleEdit.Visible := True;
end;

procedure TfrmGenerate.RadioButtonAllClick(Sender: TObject);
begin
    PeopleEdit.Visible := False;
end;

procedure TfrmGenerate.PeopleEditOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    Result: Variant;
begin
    try
        result := AllPeopleUnit.GetMan(Self, hand, False, False);
        if (not VarIsNull(result)) and not (VarType(result) = varNull) and
            not (VarArrayDimCount(result) = 0) then begin
            Value := result[0];
            DisplayText := result[1];
        end;
    except on e: Exception do begin
            qFErrorDialog('Неможливо завантажити довідник фізичних осіб! Виникла помилка: "' +
                e.Message + '"');
            exit;
        end;
    end;
end;

procedure TfrmGenerate.OkButtonClick(Sender: TObject);
var PKod_Setup, PKod_Setup1 : Integer;
    res : Integer; //0 - ошибка, 1 - все нормально
begin
    res := 1;
    PKod_Setup:=PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
    PKod_Setup1:=PeriodToKodSetup(YearSpinEdit1.Value,MonthesList1.ItemIndex+1);
    if PKod_Setup > kod_setup then
    begin
        MessageDlg('Початок періоду розрахунку не може бути більшим за період головного документу!',
                    mtError,[mbOk],0);
        MonthesList.SetFocus;
        res := 0;
    end;
    if PKod_Setup1 > kod_setup then
    begin
        MessageDlg('Кінець періоду розрахунку не може бути більшим за період головного документу!',
                    mtError,[mbOk],0);
        MonthesList1.SetFocus;
        res := 0;
    end;
    if PKod_Setup > PKod_Setup1 then
    begin
        MessageDlg('Початок періоду розрахунку не може бути більшим за кінець періоду розрахунку!',
                    mtError,[mbOk],0);
        MonthesList.SetFocus;
        res := 0;
    end;
    if (qFCheckAll(Self) and (res = 1)) then ModalResult := mrOk;
end;

procedure TfrmGenerate.FormShow(Sender: TObject);
begin
    if RadioButtonAll.Checked = True then  PeopleEdit.Visible := False
    else PeopleEdit.Visible := True;
end;

constructor TfrmGenerate.Create(AOwner:TComponent;aKodSetup:Integer;aKodSetupMin:Integer);
//procedure TfrmGenerate.FormCreate(Sender: TObject);
var str: string;
    i: integer;
begin
    inherited Create(AOwner);

    kod_setup     := aKodSetup;
    kod_setup_min := aKodSetupMin;
    str:='';
    for i:=1 to YearMonthFromKodSetup(kod_setup,False) do

    str:=str+MonthesList_Text[i]+#13;
    MonthesList.Properties.Items.Text     := str;
    MonthesList1.Properties.Items.Text    := str;
    MonthesList.ItemIndex:=YearMonthFromKodSetup(kod_setup-1,False)-1;
    MonthesList1.ItemIndex:=YearMonthFromKodSetup(kod_setup,False)-1;
   // YearSpinEdit.Value:=YearMonthFromKodSetup(kod_setup-1);
   // YearSpinEdit1.Value:=YearMonthFromKodSetup(kod_setup);
    YearSpinEdit.Properties.MinValue := YearMonthFromKodSetup(kod_setup_min);
    YearSpinEdit.Properties.MaxValue := YearMonthFromKodSetup(kod_setup)+1;
    YearSpinEdit.Value := YearMonthFromKodSetup(kod_setup);

    if (YearMonthFromKodSetup(kod_setup_min) = YearMonthFromKodSetup(kod_setup))
        then
    begin
        YearSpinEdit.Value := YearMonthFromKodSetup(kod_setup);
        YearSpinEdit.Properties.ReadOnly := True;
        YearSpinEdit1.Value := YearMonthFromKodSetup(kod_setup);
        YearSpinEdit1.Properties.ReadOnly := True;
    end
    else
    begin
        YearSpinEdit.Properties.MinValue := YearMonthFromKodSetup(kod_setup_min);
        YearSpinEdit.Properties.MaxValue := YearMonthFromKodSetup(kod_setup);
        YearSpinEdit.Value := YearMonthFromKodSetup(kod_setup);
        YearSpinEdit.Properties.ReadOnly := False;

        YearSpinEdit1.Properties.MinValue := YearMonthFromKodSetup(kod_setup_min);
        YearSpinEdit1.Properties.MaxValue := YearMonthFromKodSetup(kod_setup);
        YearSpinEdit1.Value := YearMonthFromKodSetup(kod_setup);
        YearSpinEdit1.Properties.ReadOnly := False;
    end;
end;

procedure TfrmGenerate.MonthesListPropertiesEditValueChanged(
  Sender: TObject);
  var i: Integer;
      str: string;
begin
 {*   if YearSpinEdit.Value <> YearMonthFromKodSetup(kod_setup) then
         for i:=1 to 12 do
            str:=str+MonthesList_Text[i]+#13
    else for i:=1 to YearMonthFromKodSetup(kod_setup,False) do
            str:=str+MonthesList_Text[i]+#13;
    MonthesList.Properties.Items.Text := str;
        ShowMessage('10'+str); *}
end;

procedure TfrmGenerate.MonthesListEnter(Sender: TObject);
var i: Integer;
      str: string;
begin
    if YearSpinEdit.Value <> YearMonthFromKodSetup(kod_setup) then
         for i:=1 to 12 do
            str:=str+MonthesList_Text[i]+#13
    else for i:=1 to YearMonthFromKodSetup(kod_setup,False) do
            str:=str+MonthesList_Text[i]+#13;
    MonthesList.Properties.Items.Text := str;

end;

end.
