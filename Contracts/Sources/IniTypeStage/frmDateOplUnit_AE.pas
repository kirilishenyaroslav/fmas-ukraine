unit frmDateOplUnit_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit,
  cxLookAndFeelPainters, StdCtrls, cxGroupBox, cxButtons, cnConsts;

type
  TfrmDateOplAE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Day_Edit: TcxTextEdit;
    Month_Edit: TcxTextEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Day_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Month_EditKeyPress(Sender: TObject; var Key: Char);
  private
    PLanguageIndex : byte;
    procedure FormIniLanguage();
  public
constructor Create(AOwner:TComponent; LanguageIndex : byte); reintroduce;
  end;

var
  frmDateOplAE: TfrmDateOplAE;

implementation

{$R *.dfm}

constructor TfrmDateOplAE.Create(AOwner:TComponent; LanguageIndex : byte);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 FormIniLanguage();
 Screen.Cursor:=crDefault;
 end;

procedure TfrmDateOplAE.FormIniLanguage;
begin
Label1.caption:=    cnConsts.cn_Day[PLanguageIndex];
Label2.caption:=     cnConsts.cn_Month[PLanguageIndex];

OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];
end;

procedure TfrmDateOplAE.OkButtonClick(Sender: TObject);
begin
ModalResult:= mrOk;
end;

procedure TfrmDateOplAE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmDateOplAE.FormShow(Sender: TObject);
begin
Day_Edit.SetFocus;
end;

procedure TfrmDateOplAE.Day_EditKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then Month_Edit.SetFocus;
end;

procedure TfrmDateOplAE.Month_EditKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then OkButton.SetFocus;
end;

end.
