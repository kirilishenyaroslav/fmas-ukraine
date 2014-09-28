unit cn_Actions_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxControls, cxGroupBox, cxButtons, cnConsts;

type
  TfrmActions_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    Name_Edit: TcxTextEdit;
    ShortNameLabel: TLabel;
    ShortName_Edit: TcxTextEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ShortName_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Name_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    PLanguageIndex : byte;
    procedure FormIniLanguage();
  public
       constructor Create(AOwner:TComponent; LanguageIndex : byte);reintroduce;
  end;

var
  frmActions_AE: TfrmActions_AE;

implementation

{$R *.dfm}
 constructor TfrmActions_AE.Create(AOwner:TComponent; LanguageIndex : byte);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 FormIniLanguage();
 Screen.Cursor:=crDefault;
 end;


procedure TfrmActions_AE.FormIniLanguage;
begin
NameLabel.caption:=       cnConsts.cn_FullName[PLanguageIndex];
ShortNameLabel.caption:=  cnConsts.cn_ShortName[PLanguageIndex];

OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];
end;

procedure TfrmActions_AE.OkButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TfrmActions_AE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmActions_AE.ShortName_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Name_Edit.SetFocus;
end;

procedure TfrmActions_AE.Name_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then OkButton.SetFocus;
end;

procedure TfrmActions_AE.FormShow(Sender: TObject);
begin
ShortName_Edit.SetFocus;
end;

end.
