unit National_Add_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxControls, cxGroupBox, cxButtons, cnConsts;

type
  TfrmNational_Add_Edit = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    Name_Edit: TcxTextEdit;
    ShortName_Edit: TcxTextEdit;
    ShortNameLabel: TLabel;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Name_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ShortName_EditKeyPress(Sender: TObject; var Key: Char);
  private
    PLanguageIndex : byte;
    procedure FormIniLanguage();
  public
       constructor Create(AOwner:TComponent; LanguageIndex : byte);reintroduce;
  end;

implementation

{$R *.dfm}
constructor TfrmNational_Add_Edit.Create(AOwner:TComponent; LanguageIndex : byte);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 FormIniLanguage();
 Screen.Cursor:=crDefault;
 end;

procedure TfrmNational_Add_Edit.FormIniLanguage;
begin
NameLabel.caption:=       cnConsts.cn_FullName[PLanguageIndex];
ShortNameLabel.caption:=  cnConsts.cn_ShortName[PLanguageIndex];

OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];
end;

procedure TfrmNational_Add_Edit.OkButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TfrmNational_Add_Edit.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmNational_Add_Edit.Name_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then ShortName_Edit.SetFocus;
end;

procedure TfrmNational_Add_Edit.FormShow(Sender: TObject);
begin
Name_Edit.SetFocus;
end;

procedure TfrmNational_Add_Edit.ShortName_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then OkButton.SetFocus;
end;

end.
