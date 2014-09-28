unit cn_Lgots_AddEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxControls, cxGroupBox, cxButtons, cxLabel, cxCurrencyEdit,
  cxRadioGroup, cxMaskEdit, cxDropDownEdit, cxCalendar, cnConsts, cnConsts_Messages,
  cxButtonEdit, cn_Common_Funcs, cn_Common_Messages, cn_Common_Types, cn_DM_Lg,
  cn_Common_Loader, iBase;

type
  TfrmLgots_AddEdit = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    OsnovanieLabel: TLabel;
    Osnovanie_Edit: TcxTextEdit;
    Percent_RadioButton: TcxRadioButton;
    Summa_RadioButton: TcxRadioButton;
    PercentEdit: TcxCurrencyEdit;
    pLabel: TcxLabel;
    Date_Beg_Label: TLabel;
    Date_Beg: TcxDateEdit;
    Date_End_Label: TLabel;
    Date_End: TcxDateEdit;
    DatePrikaz: TcxDateEdit;
    DatePrikaz_Label: TLabel;
    NomPrikaz: TcxTextEdit;
    NomPrikaz_Label: TLabel;
    TypeLg_Edit: TcxButtonEdit;
    TypeLg_Label: TLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DatePrikazKeyPress(Sender: TObject; var Key: Char);
    procedure NomPrikazKeyPress(Sender: TObject; var Key: Char);
    procedure Percent_RadioButtonKeyPress(Sender: TObject; var Key: Char);
    procedure Summa_RadioButtonKeyPress(Sender: TObject; var Key: Char);
    procedure PercentEditKeyPress(Sender: TObject; var Key: Char);
    procedure Date_BegKeyPress(Sender: TObject; var Key: Char);
    procedure Date_EndKeyPress(Sender: TObject; var Key: Char);
    procedure Osnovanie_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Percent_RadioButtonClick(Sender: TObject);
    procedure Summa_RadioButtonClick(Sender: TObject);
    procedure TypeDiss_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure TypeLg_EditKeyPress(Sender: TObject; var Key: Char);
  private
    PLanguageIndex: byte;
    //DM: TDM_Lg;
    DB_sp_Handle:TISC_DB_HANDLE;
    procedure FormIniLanguage;
  public
    ID_TYPE_LGOT : int64;
    constructor  Create(AOwner:TComponent;LanguageIndex: byte; DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

{$R *.dfm}
constructor TfrmLgots_AddEdit.Create(AOwner:TComponent;LanguageIndex: byte; DB_Handle:TISC_DB_HANDLE);
begin
inherited Create(AOwner);
Screen.Cursor:=crHourGlass;
PLanguageIndex := LanguageIndex;
DB_sp_Handle:= DB_Handle;
FormIniLanguage();
Screen.Cursor:=crDefault;
end;

procedure TfrmLgots_AddEdit.FormIniLanguage();
begin
DatePrikaz_Label.Caption:=       cnConsts.cn_DatePrikaz[PLanguageIndex];
NomPrikaz_Label.Caption:=        cnConsts.cn_NomPrikaz[PLanguageIndex];
Percent_RadioButton.Caption:=    cnConsts.cn_Persent_Column[PLanguageIndex];
Summa_RadioButton.Caption:=      cnConsts.cn_Summa_Column[PLanguageIndex];
Date_Beg_Label.Caption:=         cnConsts.cn_Date_Beg_Label[PLanguageIndex];
Date_End_Label.Caption:=         cnConsts.cn_Date_End_Label[PLanguageIndex];
OsnovanieLabel.Caption:=         cnConsts.cn_Osnovanie[PLanguageIndex];
TypeLg_Label.Caption:=         cnConsts.cn_TypeLg_Label[PLanguageIndex];

OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];
end;

procedure TfrmLgots_AddEdit.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmLgots_AddEdit.OkButtonClick(Sender: TObject);
begin
// проверки
if DatePrikaz.Text = '' then
 begin
   showmessage(pchar(cnConsts_Messages.cn_lg_DateNakaz_Need[PLanguageIndex]));
   DatePrikaz.SetFocus;
   exit;
 end;

if NomPrikaz.Text = '' then
 begin
   showmessage(pchar(cnConsts_Messages.cn_lg_NomNakaz_Need[PLanguageIndex]));
   NomPrikaz.SetFocus;
   exit;
 end;

if PercentEdit.Value = 0 then
 begin
   showmessage(pchar(cnConsts_Messages.cn_lg_SumPerc_Need[PLanguageIndex]));
   PercentEdit.SetFocus;
   exit;
 end;

 if Date_Beg.Text = '' then
 begin
   showmessage(pchar(cnConsts_Messages.cn_lg_DateBeg_Need[PLanguageIndex]));
   Date_Beg.SetFocus;
   exit;
 end;

 if Date_End.Text = '' then
 begin
   showmessage(pchar(cnConsts_Messages.cn_lg_DateEnd_Need[PLanguageIndex]));
   Date_End.SetFocus;
   exit;
 end;

 if Date_End.date <= Date_Beg.date then
  begin
   showmessage(pchar(cnConsts_Messages.cn_Dates_Prohibition[PLanguageIndex]));
   Date_End.SetFocus;
   exit;
  end;

 if Percent_RadioButton.Checked then
  if PercentEdit.Value > 100 then
  begin
   showmessage(pchar(cnConsts_Messages.cn_PercentMore100[PLanguageIndex]));
   PercentEdit.SetFocus;
   exit;
  end;

ModalResult := mrOk;
end;

procedure TfrmLgots_AddEdit.FormShow(Sender: TObject);
begin
DatePrikaz.SetFocus;
end;

procedure TfrmLgots_AddEdit.DatePrikazKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then NomPrikaz.SetFocus;
end;

procedure TfrmLgots_AddEdit.NomPrikazKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then TypeLg_Edit.SetFocus;
end;

procedure TfrmLgots_AddEdit.Percent_RadioButtonKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then PercentEdit.SetFocus;
end;

procedure TfrmLgots_AddEdit.Summa_RadioButtonKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then PercentEdit.SetFocus;
end;

procedure TfrmLgots_AddEdit.PercentEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Date_Beg.SetFocus;
end;

procedure TfrmLgots_AddEdit.Date_BegKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Date_End.SetFocus;
end;

procedure TfrmLgots_AddEdit.Date_EndKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Osnovanie_Edit.SetFocus;
end;

procedure TfrmLgots_AddEdit.Osnovanie_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then OkButton.SetFocus;
end;

procedure TfrmLgots_AddEdit.Percent_RadioButtonClick(Sender: TObject);
begin
 pLabel.Caption:='%';
 if PercentEdit.CanFocusEx then
 PercentEdit.SetFocus;
end;

procedure TfrmLgots_AddEdit.Summa_RadioButtonClick(Sender: TObject);
begin
 pLabel.Caption:='грн.';
 if PercentEdit.CanFocusEx then
 PercentEdit.SetFocus;
end;

procedure TfrmLgots_AddEdit.TypeDiss_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_sp_Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  if ID_TYPE_LGOT <> -1 then
  AParameter.ID_Locate := ID_TYPE_LGOT;
  res:=   RunFunctionFromPackage(AParameter, 'Contracts\cn_ini_TypeLgots.bpl','ShowSPIniTypeLgot');
 if VarArrayDimCount(res)>0 then
  begin
   ID_TYPE_LGOT := Res[0];
   TypeLg_Edit.Text := Res[1];
  end;
  AParameter.Free;
end;

procedure TfrmLgots_AddEdit.TypeLg_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Percent_RadioButton.SetFocus;
end;

end.
