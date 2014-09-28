unit CategoryStudy_Add_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxControls, cxGroupBox, cxButtons, cnConsts,
  uPrK_Loader,  uPrK_Resources, ibase, cxMaskEdit, cxButtonEdit, cxCheckBox;

type
  TfrmCatStud_Add_Edit = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    ShortNameLabel: TLabel;
    Name_Edit: TcxTextEdit;
    ShortName_Edit: TcxTextEdit;
    PRK_SP_TYPE_KAT_STUD_edit: TcxButtonEdit;
    Check_IS_SCIENCE: TcxCheckBox;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Name_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ShortName_EditKeyPress(Sender: TObject; var Key: Char);
    procedure PRK_SP_TYPE_KAT_STUD_editPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
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
constructor TfrmCatStud_Add_Edit.Create(AOwner:TComponent; LanguageIndex : byte);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 FormIniLanguage();
 Screen.Cursor:=crDefault;
 end;

procedure TfrmCatStud_Add_Edit.FormIniLanguage;
begin
NameLabel.caption:=       cnConsts.cn_FullName[PLanguageIndex];
ShortNameLabel.caption:=  cnConsts.cn_ShortName[PLanguageIndex];

OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];
end;


procedure TfrmCatStud_Add_Edit.OkButtonClick(Sender: TObject);
begin
  If ((name_edit.text = '') or (ShortName_edit.text = '') or (PRK_SP_TYPE_KAT_STUD_edit.Text = '')) then
   begin
    ShowMessage('Необхідно заповнити усі поля!');
    exit;
   end;
  ModalResult:=mrOk;
end;

procedure TfrmCatStud_Add_Edit.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmCatStud_Add_Edit.Name_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then ShortName_Edit.SetFocus;
end;

procedure TfrmCatStud_Add_Edit.FormShow(Sender: TObject);
begin
Name_Edit.SetFocus;
end;

procedure TfrmCatStud_Add_Edit.ShortName_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then OkButton.SetFocus;
end;

procedure TfrmCatStud_Add_Edit.PRK_SP_TYPE_KAT_STUD_editPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var res: Variant;
begin
 res:= uPrK_Loader.ShowPrkSprav(self, DB_Handle, PrK_SP_TYPE_KAT_STUD ,fsNormal);
 if VarArrayDimCount(Res)>0
  then begin
   ID_NAME := res[0];
   PRK_SP_TYPE_KAT_STUD_edit.Text := res[1];
  end;
end;

end.
