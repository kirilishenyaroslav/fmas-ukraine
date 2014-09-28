unit cn_sp_OrderTypes_Unit_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxControls, cxGroupBox, cxButtons, cnConsts;

type
  TfrmOrderTypes_Ae = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    ShortNameLabel: TLabel;
    Name_Edit: TcxTextEdit;
    ShortName_Edit: TcxTextEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Name_EditKeyPress(Sender: TObject; var Key: Char);
    procedure ShortName_EditKeyPress(Sender: TObject; var Key: Char);
  private
    PLanguageIndex : byte;
    procedure FormIniLanguage();
  public
       constructor Create(AOwner:TComponent; LanguageIndex : byte);reintroduce;
  end;

var
  frmOrderTypes_Ae: TfrmOrderTypes_Ae;

implementation

{$R *.dfm}
constructor TfrmOrderTypes_Ae.Create(AOwner:TComponent; LanguageIndex : byte);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 FormIniLanguage();
 Screen.Cursor:=crDefault;
 end;

procedure TfrmOrderTypes_Ae.FormIniLanguage;
begin
NameLabel.caption:=       cnConsts.cn_FullName[PLanguageIndex];
ShortNameLabel.caption:=  cnConsts.cn_ShortName[PLanguageIndex];

OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];
end;


procedure TfrmOrderTypes_Ae.OkButtonClick(Sender: TObject);
begin
  if ((Name_Edit.Text = '') or (ShortName_Edit.Text = '')) then
   begin
    ShowMessage('Необхідно заповнити усі данні!');
    Exit;
   end;
  ModalResult:=mrOk;
end;

procedure TfrmOrderTypes_Ae.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmOrderTypes_Ae.FormShow(Sender: TObject);
begin
Name_Edit.SetFocus;
end;

procedure TfrmOrderTypes_Ae.Name_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then ShortName_Edit.SetFocus;
end;

procedure TfrmOrderTypes_Ae.ShortName_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then OkButton.SetFocus;
end;

end.
