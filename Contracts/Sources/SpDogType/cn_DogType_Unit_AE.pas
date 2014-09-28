unit cn_DogType_Unit_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxControls, cxGroupBox, cxButtons, cnConsts, cxCheckBox,
  ExtCtrls, cxCurrencyEdit;

type
  TfrmAE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    Name_Edit: TcxTextEdit;
    ISMAINDOG_checkbox: TcxCheckBox;
    CodeEdit: TcxTextEdit;
    CodeLabel: TLabel;
    Bevel1: TBevel;
    ReportEdit: TcxTextEdit;
    Label1: TLabel;
    CopyPrintCount_Label: TLabel;
    CopyPrintCount_Edit: TcxCurrencyEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Name_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ISMAINDOG_checkboxKeyPress(Sender: TObject; var Key: Char);
    procedure CodeEditKeyPress(Sender: TObject; var Key: Char);
    procedure ReportEditKeyPress(Sender: TObject; var Key: Char);
    procedure CopyPrintCount_EditKeyPress(Sender: TObject; var Key: Char);
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
NameLabel.caption:=       cnConsts.cn_FullName[PLanguageIndex];
ISMAINDOG_checkbox.Properties.Caption:=  cnConsts.cn_BasicContract[PLanguageIndex];
CodeLabel.caption:=       cnConsts.cn_roles_Kod[PLanguageIndex];
CopyPrintCount_Label.caption:=       cnConsts.cn_CopyPrintCount[PLanguageIndex];
OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];
end;

procedure TfrmAE.OkButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TfrmAE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmAE.Name_EditKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then ISMAINDOG_checkbox.SetFocus;   
end;

procedure TfrmAE.FormShow(Sender: TObject);
begin
CodeEdit.SetFocus;
end;

procedure TfrmAE.ISMAINDOG_checkboxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then CopyPrintCount_Edit.SetFocus;
end;

procedure TfrmAE.CodeEditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then Name_Edit.SetFocus;
end;

procedure TfrmAE.ReportEditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then OkButton.SetFocus;
end;

procedure TfrmAE.CopyPrintCount_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then OkButton.SetFocus;
end;

end.
