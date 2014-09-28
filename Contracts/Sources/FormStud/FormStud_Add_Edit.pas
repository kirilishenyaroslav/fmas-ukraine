unit FormStud_Add_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxControls, cxGroupBox, cxButtons, cnConsts, cxMaskEdit,
  cnConsts_Messages, cxButtonEdit, uPrK_Loader,  uPrK_Resources, ibase,
  cxLabel, cxCurrencyEdit, cxCheckBox;

type
  TfrmFormStud_Add_Edit = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    ShortNameLabel: TLabel;
    Name_Edit: TcxTextEdit;
    ShortName_Edit: TcxTextEdit;
    FORM_Kat_Edit: TcxButtonEdit;
    Kod_edit: TcxCurrencyEdit;
    kod_label: TcxLabel;
    cxCheckBox1: TcxCheckBox;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Name_EditKeyPress(Sender: TObject; var Key: Char);
    procedure ShortName_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ID_SP_FORM_OBUCH_KATEGORY_editPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure Kod_editKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_kod_edit;
  private
    PLanguageIndex : byte;
    procedure FormIniLanguage();
  public
    ID_NAME : int64;
    DB_Handle : TISC_DB_HANDLE;
    constructor Create(AOwner:TComponent; LanguageIndex : byte);reintroduce;
  end;

implementation

{$R *.dfm}
constructor TfrmFormStud_Add_Edit.Create(AOwner:TComponent; LanguageIndex : byte);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  PLanguageIndex:= LanguageIndex;
  FormIniLanguage();
  Screen.Cursor:=crDefault;
end;

procedure TfrmFormStud_Add_Edit.FormIniLanguage;
begin
  NameLabel.caption              := cnConsts.cn_FullName[PLanguageIndex];
  ShortNameLabel.caption         := cnConsts.cn_ShortName[PLanguageIndex];
  kod_label.Caption              := cn_roles_Kod[PLanguageIndex];
  OkButton.Caption               := cnConsts.cn_Accept[PLanguageIndex];
  OkButton.Hint                  := cnConsts.cn_Accept[PLanguageIndex];
  CancelButton.Caption           := cnConsts.cn_Cancel[PLanguageIndex];
  CancelButton.Hint              := cnConsts.cn_Cancel[PLanguageIndex];
  cxCheckBox1.Properties.Caption := cnConsts.cn_is_deleted_Column[PLanguageIndex];
end;

procedure TfrmFormStud_Add_Edit.OkButtonClick(Sender: TObject);
begin
  Edit_kod_edit;

  If Name_Edit.Text = '' then
   begin
    showmessage(cnConsts_Messages.cn_Name_Need[PLanguageIndex]);
    Name_Edit.SetFocus;
    exit;
   end;

  If ShortName_Edit.Text = '' then
   begin
    showmessage(cnConsts_Messages.cn_ShortName_Need[PLanguageIndex]);
    ShortName_Edit.SetFocus;
    exit;
   end;

  If FORM_KAT_Edit.Text = '' then
   begin
    showmessage(cn_Some_Need[PLanguageIndex]);
    FORM_KAT_Edit.SetFocus;
    exit;
   end;

  If Kod_edit.Text = '' then
   Begin
    ShowMessage(cn_Some_Need[PLanguageIndex]);
    Kod_edit.SetFocus;
    exit;
   End;

  ModalResult:=mrOk;
end;

procedure TfrmFormStud_Add_Edit.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmFormStud_Add_Edit.Name_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then FORM_Kat_Edit.SetFocus;
end;

procedure TfrmFormStud_Add_Edit.ShortName_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then Kod_edit.SetFocus;
end;

procedure TfrmFormStud_Add_Edit.FormShow(Sender: TObject);
begin
  Name_Edit.SetFocus;
end;

procedure TfrmFormStud_Add_Edit.ID_SP_FORM_OBUCH_KATEGORY_editPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  res: Variant;
begin
  res:= uPrK_Loader.ShowPrkSprav(self,DB_Handle,PrK_SP_FORM_OBUCH_KATEGORY,fsNormal);
  if VarArrayDimCount(Res)>0 then
   begin
    ID_NAME := res[0];
    FORM_KAT_Edit.Text := res[1];
    ShortName_Edit.SetFocus;
   end;
end;

procedure TfrmFormStud_Add_Edit.Edit_kod_edit;
Begin
  If Kod_edit.text='' then Kod_edit.Value:=0;

  If length(kod_edit.Text)>2 then Kod_edit.Text:=copy(kod_edit.Text,1,2);
End;

procedure TfrmFormStud_Add_Edit.Kod_editKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key = #13 then
   Begin
    OkButton.SetFocus;
    edit_kod_edit;
   End;  
end;

end.
