unit uReestr_Kat_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxMemo, cxCurrencyEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxMaskEdit, cxButtonEdit, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxLabel, uConsts, uCommon_Types, iBase,
  uCommon_Loader, cxCheckBox;

type
  TfrmReestr_Kat_AE = class(TForm)
    Label_date_beg: TcxLabel;
    Label_date_end: TcxLabel;
    Label_summa: TcxLabel;
    Button_Ok: TcxButton;
    Button_Cancel: TcxButton;
    DateEdit_date_beg: TcxDateEdit;
    DateEdit_date_end: TcxDateEdit;
    CurrencyEdit_summa: TcxCurrencyEdit;
    ButtonEdit_name_Kat: TcxButtonEdit;
    Label_name_kat: TcxLabel;
    cxCheckBox1: TcxCheckBox;
    cxCurrencyEdit1: TcxCurrencyEdit;
    cxCurrencyEdit2: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    procedure ButtonEdit_name_KatPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Button_CancelClick(Sender: TObject);
    procedure Button_OkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    ID_KAT, ID_KAT_SUM : Int64;
    PLanguageIndex : Byte;
    aHandle : Tisc_db_Handle;
    is_admin : Boolean;
    Date_beg, Date_end : TDate;
  end;

var
  frmReestr_Kat_AE: TfrmReestr_Kat_AE;

implementation

uses DateUtils;

{$R *.dfm}

procedure TfrmReestr_Kat_AE.ButtonEdit_name_KatPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter : TbsSimpleParams;
  Res : Variant;
begin
  AParameter := TbsSimpleParams.Create;
  AParameter.Owner := self;
  AParameter.Db_Handle := aHandle;
  AParameter.Formstyle := fsNormal;
  AParameter.WaitPakageOwner := self;
  AParameter.is_admin := is_admin;
  res := RunFunctionFromPackage(AParameter, 'bs\bs_sp_Kat.bpl','ShowSPKat');
  AParameter.Free;

  If varArrayDimCount(Res)>0 then
   begin
    ID_KAT_SUM                   := res[0];
    ID_KAT                       := res[5];
    ButtonEdit_name_Kat.Text     := Res[4];
    DateEdit_date_beg.EditValue  := Res[1];
    DateEdit_date_End.EditValue  := Res[2];
    CurrencyEdit_summa.EditValue := Res[3];
   End;
end;

procedure TfrmReestr_Kat_AE.Button_CancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmReestr_Kat_AE.Button_OkClick(Sender: TObject);
begin
  If ButtonEdit_name_Kat.Text = '' then
   Begin
    ShowMessage('Треба обрати послугу!');
    Exit;
   End;
  If DateEdit_date_beg.EditValue<Date_beg then
   Begin
    ShowMessage('Дата початку менше дати початку договору!');
    exit;
   End;
  If DateEdit_date_end.EditValue>Date_end then
   begin
    ShowMessage('Дата закінчіення більше дати закінчення договору!');
    Exit;
   End;

  if DateEdit_date_beg.EditValue>DateEdit_date_end.EditValue then
   Begin
    ShowMessage('Невірне ведення дат!');
    Exit;
   end;

  If cxCheckBox1.Checked then
  If (cxCurrencyEdit1.EditValue<0)or
     (cxCurrencyEdit2.EditValue<0)or
     (cxCurrencyEdit1.EditValue>cxCurrencyEdit2.EditValue) then
   begin
    ShowMessage('Невірне заповнення показників лічільника!');
    exit;
   End;
  If CurrencyEdit_summa.EditValue<=0 then
   Begin
    ShowMessage('Помилка ведення суми!');
    exit;
   End;
    
  ModalResult := mrOk;
end;

procedure TfrmReestr_Kat_AE.FormShow(Sender: TObject);
begin
  Label_name_Kat.caption  := bs_Name_Column[PLanguageIndex];
  Label_date_beg.caption  := bs_Date_Beg_Label[PLanguageIndex];
  Label_date_end.caption  := bs_Date_End_Label[PLanguageIndex];
  Label_summa.caption     := bs_Summa_Column[PLanguageIndex];

  Button_Ok.Caption     := bs_Accept[PLanguageIndex];
  Button_Cancel.Caption := bs_Cancel[PLanguageIndex];
end;

procedure TfrmReestr_Kat_AE.FormCreate(Sender: TObject);
var
  year, month, day : Word;
begin
  ButtonEdit_name_Kat.Text := '';

  DecodeDate(Now, Year, Month, Day);

  DateEdit_Date_beg.EditValue := EncodeDate(Year,month,1);
  DateEdit_Date_end.EditValue := EncodeDate(Year,month+1,1)-1;
end;


procedure TfrmReestr_Kat_AE.cxCheckBox1PropertiesChange(Sender: TObject);
begin
  If cxCheckBox1.Checked
   then
    Begin
     cxCurrencyEdit1.Enabled:=True;
     cxCurrencyEdit2.Enabled:=True;
    end
   else
    begin
     cxCurrencyEdit1.Enabled:=False;
     cxCurrencyEdit2.Enabled:=False;
    end;
end;

end.
