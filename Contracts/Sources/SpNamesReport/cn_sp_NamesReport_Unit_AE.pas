unit cn_sp_NamesReport_Unit_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxControls, cxGroupBox, cxButtons, cnConsts;

type
  TfrmNamesRaportAE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    Name_Edit: TcxTextEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure Name_EditKeyPress(Sender: TObject; var Key: Char);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    PLanguageIndex : byte;
    procedure FormIniLanguage();
  public
       constructor Create(AOwner:TComponent; LanguageIndex : byte);reintroduce;
  end;

var
  frmNamesRaportAE: TfrmNamesRaportAE;

implementation

{$R *.dfm}
constructor TfrmNamesRaportAE.Create(AOwner:TComponent; LanguageIndex : byte);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 FormIniLanguage();
 Screen.Cursor:=crDefault;
 end;

procedure TfrmNamesRaportAE.FormIniLanguage;
begin
NameLabel.caption:=       cnConsts.cn_FullName[PLanguageIndex];

OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];
end;
procedure TfrmNamesRaportAE.OkButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TfrmNamesRaportAE.Name_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then OkButton.SetFocus;
end;

procedure TfrmNamesRaportAE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmNamesRaportAE.FormShow(Sender: TObject);
begin
Name_Edit.SetFocus;
end;

end.
