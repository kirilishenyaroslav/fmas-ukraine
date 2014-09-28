unit uReestr_Lgots_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxMemo, cxCurrencyEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxMaskEdit, cxButtonEdit, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxLabel, uConsts, uCommon_Types, iBase,
  uCommon_Loader;

type
  TfrmReestr_Lgots_AE = class(TForm)
    Label_date_beg: TcxLabel;
    Label_date_end: TcxLabel;
    Label_procent: TcxLabel;
    Button_Ok: TcxButton;
    Button_Cancel: TcxButton;
    DateEdit_date_beg: TcxDateEdit;
    DateEdit_date_end: TcxDateEdit;
    CurrencyEdit_procent: TcxCurrencyEdit;
    ButtonEdit_name_Lgots: TcxButtonEdit;
    Label_name_lgots: TcxLabel;
    procedure ButtonEdit_name_LgotsPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Button_CancelClick(Sender: TObject);
    procedure Button_OkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    ID_LGOT, ID_LGOT_SUM : Int64;
    PLanguageIndex : Byte;
    aHandle : Tisc_db_Handle;
    is_admin : Boolean;
    Date_beg, Date_end : TDate;
  end;

var
  frmReestr_Lgots_AE: TfrmReestr_Lgots_AE;

implementation

uses DateUtils;

{$R *.dfm}

procedure TfrmReestr_Lgots_AE.ButtonEdit_name_LgotsPropertiesButtonClick(
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
  res := RunFunctionFromPackage(AParameter, 'bs\bs_sp_Lgots.bpl','ShowSPLgots');
  AParameter.Free;

  If varArrayDimCount(Res)>0 then
   begin
    ID_LGOT                        := res[0];
    ButtonEdit_name_Lgots.Text     := Res[1];
    ID_LGOT_SUM                    := res[2];
    DateEdit_date_beg.EditValue    := res[3];
    DateEdit_date_end.EditValue    := res[4];
    CurrencyEdit_procent.EditValue := res[5];
   End;
end;

procedure TfrmReestr_Lgots_AE.Button_CancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmReestr_Lgots_AE.Button_OkClick(Sender: TObject);
begin
  if ButtonEdit_name_Lgots.Text = '' then
   Begin
    ShowMessage('Треба обрати пільгу!');
    Exit;
   End;
  If DateEdit_date_beg.EditValue<Date_beg then
   Begin
    ShowMessage('Дата початку менше дати початку договору!');
    Exit;
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
  If CurrencyEdit_procent.EditValue<=0 then
   Begin
    ShowMessage('Помилка ведення відсотка!');
    exit;
   End; 

  ModalResult := mrOk;
end;

procedure TfrmReestr_Lgots_AE.FormShow(Sender: TObject);
begin
  Label_name_Lgots.caption := bs_Name_Column[PLanguageIndex];
  Label_date_beg.caption   := bs_Date_Beg_Label[PLanguageIndex];
  Label_date_end.caption   := bs_Date_End_Label[PLanguageIndex];
  Label_procent.caption    := bs_Persent_Column[PLanguageIndex];

  Button_Ok.Caption     := bs_Accept[PLanguageIndex];
  Button_Cancel.Caption := bs_Cancel[PLanguageIndex];
end;

procedure TfrmReestr_Lgots_AE.FormCreate(Sender: TObject);
var
  year, month, day : Word;
begin
  ButtonEdit_name_Lgots.Text := '';

  DecodeDate(Now, Year, Month, Day);

  DateEdit_Date_beg.EditValue := EncodeDate(Year,month,1);
  DateEdit_Date_end.EditValue := EncodeDate(Year,month+1,1)-1;
end;


end.
