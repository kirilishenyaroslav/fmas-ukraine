unit cn_sp_CreditStatusUnit_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxControls, cxGroupBox, cxButtons, cnConsts;

type
  TfrmAE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    Name_Edit: TcxTextEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Name_EditKeyPress(Sender: TObject; var Key: Char);
  private
    PLanguageIndex : byte;
    procedure FormIniLanguage();
  public
       constructor Create(AOwner:TComponent; LanguageIndex : byte);reintroduce;
  end;

var
  frmAE: TfrmAE;

implementation

{$R *.dfm}
constructor TfrmAE.Create(AOwner:TComponent; LanguageIndex : byte);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 FormIniLanguage();
 Screen.Cursor:=crDefault;
 end;

procedure TfrmAE.FormIniLanguage;
begin
NameLabel.caption:=          cnConsts.cn_FullName[PLanguageIndex];
OkButton.Caption:=           cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=       cnConsts.cn_Cancel[PLanguageIndex];
end;
procedure TfrmAE.OkButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TfrmAE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmAE.FormShow(Sender: TObject);
begin
Name_Edit.SetFocus;
end;

procedure TfrmAE.Name_EditKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then Self.FindNextControl(Self.ActiveControl,True,true,False).SetFocus;
end;

end.
