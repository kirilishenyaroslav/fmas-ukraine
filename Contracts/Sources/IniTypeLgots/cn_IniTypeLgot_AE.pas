unit cn_IniTypeLgot_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxControls, cxGroupBox, cxButtons, cnConsts;

type
  TfrmAddEdit = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    Name_Edit: TcxTextEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Name_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    PLanguageIndex : byte;
    procedure FormIniLanguage();
  public
       constructor Create(AOwner:TComponent; LanguageIndex : byte);reintroduce;
  end;


implementation

{$R *.dfm}
constructor TfrmAddEdit.Create(AOwner:TComponent; LanguageIndex : byte);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 FormIniLanguage();
 Screen.Cursor:=crDefault;
 end;

procedure TfrmAddEdit.FormIniLanguage;
begin
NameLabel.caption:=       cnConsts.cn_FullName[PLanguageIndex];

OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];
end;
procedure TfrmAddEdit.OkButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TfrmAddEdit.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmAddEdit.Name_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then OkButton.SetFocus;
end;

procedure TfrmAddEdit.FormShow(Sender: TObject);
begin
Name_Edit.SetFocus;
end;

end.
