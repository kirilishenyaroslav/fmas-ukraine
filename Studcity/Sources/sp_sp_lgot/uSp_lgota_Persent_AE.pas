//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник льгот - добавление процента                              *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit uSp_lgota_Persent_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxLabel, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit, cxGroupBox,
  StdCtrls, cxButtons, cxCurrencyEdit, st_ConstUnit, uSp_Lgota_DM,
  st_common_funcs, cxButtonEdit, st_common_types, iBase, st_common_loader,
  cxRadioGroup;

type
  TfrmLgota_Procent_AE = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    PercentEdit: TcxCurrencyEdit;
    Button_name: TcxButtonEdit;
    RadioButton_procent: TcxRadioButton;
    RadioButton_sum: TcxRadioButton;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DateEndEditKeyPress(Sender: TObject; var Key: Char);
    procedure PercentEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button_namePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
    Date_last_end : TDate;
    aHandle : TISC_DB_HANDLE;
    is_admin : Boolean;
    id_serves : Int64;
    { Public declarations }
  end;

var
  frmLgota_Procent_AE: TfrmLgota_Procent_AE;

implementation
{$R *.dfm}

procedure TfrmLgota_Procent_AE.FormIniLanguage();
begin
  // индекс языка (1-укр, 2 - рус)
  PLanguageIndex := stLanguageIndex;

  //названия кнопок
  OKButton.Caption     := st_ConstUnit.st_Accept[PLanguageIndex];
  CancelButton.Caption := st_ConstUnit.st_Cancel[PLanguageIndex];

  cxLabel1.Caption := st_ConstUnit.st_NameLable[PLanguageIndex];
  RadioButton_procent.Caption := st_ConstUnit.st_PercentOnly[PLanguageIndex];
end;

procedure TfrmLgota_Procent_AE.OKButtonClick(Sender: TObject);
begin
  If Button_name.Text = '' then
   begin
    ShowMessage('Необхідно обрати послугу!!!');
    Button_name.SetFocus;
    exit;
   end;

  if PercentEdit.Text = '' then
   begin
    ShowMessage(pchar(st_ConstUnit.st_Percent_need[PLanguageIndex]));
    PercentEdit.SetFocus;
    exit;
   end;

  if not FloatCheck(PercentEdit.Text) then
   begin
    ShowMessage(pchar(st_ConstUnit.st_PercentNotCorrect[PLanguageIndex]));
    PercentEdit.SetFocus;
    exit;
   end;

  if ((PercentEdit.Value > 100.0000) and (RadioButton_procent.Checked)) then
   begin
    ShowMessage(pchar(st_ConstUnit.st_PercentMoreCTONotCorrect[PLanguageIndex]));
    PercentEdit.SetFocus;
    exit;
   end;

  ModalResult := mrOK;
end;

procedure TfrmLgota_Procent_AE.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmLgota_Procent_AE.DateEndEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then PercentEdit.SetFocus;
end;

procedure TfrmLgota_Procent_AE.PercentEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then OKButton.SetFocus;
end;

procedure TfrmLgota_Procent_AE.FormShow(Sender: TObject);
begin
  PercentEdit.SetFocus;
end;

procedure TfrmLgota_Procent_AE.FormCreate(Sender: TObject);
begin
  FormIniLanguage();
end;

procedure TfrmLgota_Procent_AE.Button_namePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  aParameter : TstSimpleParams;
  res : Variant;
begin
  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := aHandle;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  aParameter.is_admin        := is_admin;

  res := RunFunctionFromPackage(aParameter, 'Studcity\st_services.bpl', 'getServices');

  If VarArrayDimCount(res) <>0 then
   begin
     id_serves        := res[0];
     Button_name.Text := res[1];
   end;

  aParameter.Free;

end;

end.
