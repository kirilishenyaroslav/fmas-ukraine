unit cn_DogStaus_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxControls, cxGroupBox, cxButtons, cnConsts, cxCheckBox;

type
  TfrmDogStatus_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    Name_Edit: TcxTextEdit;
    IsVisibleReestrCheckBox: TcxCheckBox;
    IsVisibleOplataCheckBox: TcxCheckBox;
    cxCheckBox1: TcxCheckBox;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Name_EditKeyPress(Sender: TObject; var Key: Char);
    procedure IsVisibleReestrCheckBoxKeyPress(Sender: TObject; var Key: Char);
    procedure IsVisibleOplataCheckBoxKeyPress(Sender: TObject;
      var Key: Char);
  private
    PLanguageIndex : byte;
    procedure FormIniLanguage();
  public
       constructor Create(AOwner:TComponent; LanguageIndex : byte);reintroduce;
  end;

var
  frmDogStatus_AE: TfrmDogStatus_AE;

implementation

{$R *.dfm}
constructor TfrmDogStatus_AE.Create(AOwner:TComponent; LanguageIndex : byte);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 FormIniLanguage();
 Screen.Cursor:=crDefault;
 end;

procedure TfrmDogStatus_AE.FormIniLanguage;
begin
NameLabel.caption:=          cnConsts.cn_FullName[PLanguageIndex];
IsVisibleReestrCheckBox.Properties.Caption:=  cnConsts.cn_IsVisibleReestr[PLanguageIndex];
IsVisibleOplataCheckBox.Properties.Caption:=  cnConsts.cn_IsVisibleOplata[PLanguageIndex];
OkButton.Caption:=           cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=       cnConsts.cn_Cancel[PLanguageIndex];
end;

procedure TfrmDogStatus_AE.OkButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TfrmDogStatus_AE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmDogStatus_AE.Name_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then IsVisibleReestrCheckBox.SetFocus;
end;

procedure TfrmDogStatus_AE.FormShow(Sender: TObject);
begin
Name_Edit.SetFocus;
end;


procedure TfrmDogStatus_AE.IsVisibleReestrCheckBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then IsVisibleOplataCheckBox.SetFocus;
end;

procedure TfrmDogStatus_AE.IsVisibleOplataCheckBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then OkButton.SetFocus;
end;

end.
