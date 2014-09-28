unit uReestr_Subsidy_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxMemo, cxCurrencyEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxMaskEdit, cxButtonEdit, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxLabel, uConsts, uCommon_Types, iBase,
  uCommon_Loader;

type
  TfrmReestr_Subsidy_AE = class(TForm)
    Label_name_subsidy: TcxLabel;
    Label_date_beg: TcxLabel;
    Label_date_end: TcxLabel;
    Label_summa: TcxLabel;
    Label_comments: TcxLabel;
    Button_Ok: TcxButton;
    Button_Cancel: TcxButton;
    ButtonEdit_name_subsidy: TcxButtonEdit;
    DateEdit_date_beg: TcxDateEdit;
    DateEdit_date_end: TcxDateEdit;
    CurrencyEdit_summa: TcxCurrencyEdit;
    Memo_comments: TcxMemo;
    procedure ButtonEdit_name_subsidyPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Button_CancelClick(Sender: TObject);
    procedure Button_OkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    id_subsidy : Int64;
    PLanguageIndex : Byte;
    aHandle : Tisc_db_Handle;
    is_admin : Boolean;
    Date_beg, Date_end : TDate;
  end;

var
  frmReestr_Subsidy_AE: TfrmReestr_Subsidy_AE;

implementation

uses DateUtils;

{$R *.dfm}

procedure TfrmReestr_Subsidy_AE.ButtonEdit_name_subsidyPropertiesButtonClick(
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
  res := RunFunctionFromPackage(AParameter, 'bs\bs_sp_subsidy.bpl','ShowSPSubsidy');
  AParameter.Free;

  If varArrayDimCount(Res)>0 then
   begin
    id_subsidy := res[0];
    ButtonEdit_name_subsidy.Text := Res[1];
   End;
end;

procedure TfrmReestr_Subsidy_AE.Button_CancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmReestr_Subsidy_AE.Button_OkClick(Sender: TObject);
begin
  if ButtonEdit_name_subsidy.Text = '' then
   Begin
    ShowMessage('Треба обрати субсідію!');
    Exit;
   End;
  If DateEdit_date_beg.EditValue<Date_beg then
   begin
    ShowMessage('Дата початку менше дати початку договору!');
    exit;
   End;
  If DateEdit_date_end.EditValue>Date_end then
   Begin
    ShowMessage('Дата закінчіення більше дати закінчення договору!');
    exit;
   End;
  if DateEdit_date_beg.EditValue>DateEdit_date_end.EditValue then
   Begin
    ShowMessage('Невірне ведення дат!');
    Exit;
   end;
  If CurrencyEdit_summa.EditValue<=0 then
   Begin
    ShowMessage('Помилка ведення суми!');
    Exit;
   End; 

  ModalResult := mrOk;
end;

procedure TfrmReestr_Subsidy_AE.FormShow(Sender: TObject);
begin
  Label_name_subsidy.caption := bs_Name_Column[PLanguageIndex];
  Label_date_beg.caption     := bs_Date_Beg_Label[PLanguageIndex];
  Label_date_end.caption     := bs_Date_End_Label[PLanguageIndex];
  Label_summa.caption        := bs_Summa_Column[PLanguageIndex];
  Label_comments.caption     := bs_CommentDiss[PLanguageIndex];

  Button_Ok.Caption     := bs_Accept[PLanguageIndex];
  Button_Cancel.Caption := bs_Cancel[PLanguageIndex];
end;

procedure TfrmReestr_Subsidy_AE.FormCreate(Sender: TObject);
var
  year, month, day : Word;
begin
  ButtonEdit_name_subsidy.Text := '';

  DecodeDate(Now, Year, Month, Day);

  DateEdit_Date_beg.EditValue := EncodeDate(Year,month,1);
  DateEdit_Date_end.EditValue := EncodeDate(Year,month+1,1)-1;
end;

end.
