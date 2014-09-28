unit cn_sp_SpecUnit_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCurrencyEdit, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxControls, cxGroupBox, cxButtons, cnConsts,
  Buttons, cxCheckBox, cnConsts_Messages;

type
  TfrmSpec_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameStage_Label: TLabel;
    CnCode_Label: TLabel;
    NameStage_Edit: TcxTextEdit;
    ShortName_Edit: TcxTextEdit;
    Label1: TLabel;
    FullName_Edit: TcxTextEdit;
    FullNameStage_Label: TLabel;
    SpeedButton1: TSpeedButton;
    cxCheckDelete: TcxCheckBox;
    cnCode_Edit: TcxTextEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure NameStage_EditKeyPress(Sender: TObject; var Key: Char);
    procedure cnCode_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ShortName_EditKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure NameStage_EditExit(Sender: TObject);
  private
    PLanguageIndex : byte;
    procedure FormIniLanguage();
  public
       constructor Create(AOwner:TComponent; LanguageIndex : byte);reintroduce;
  end;

var
  frmSpec_AE: TfrmSpec_AE;

implementation

{$R *.dfm}
constructor TfrmSpec_AE.Create(AOwner:TComponent; LanguageIndex : byte);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 FormIniLanguage();
 Screen.Cursor:=crDefault;
 end;


procedure TfrmSpec_AE.FormIniLanguage;
begin
NameStage_Label.caption:=    cnConsts.cn_Name_Column[PLanguageIndex];
CnCode_Label.caption:=       cnConsts.cn_roles_Kod[PLanguageIndex];
Label1.caption:=             cnConsts.cn_ShortName[PLanguageIndex];
FullNameStage_Label.caption:=      cnConsts.cn_Full_Name[PLanguageIndex];

OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];
end;

procedure TfrmSpec_AE.OkButtonClick(Sender: TObject);
begin
  if NameStage_Edit.Text = '' then
   begin
    ShowMessage(cnConsts_Messages.cn_Name_Need[PLanguageIndex]);
    NameStage_Edit.SetFocus;
    Exit;
   end;
   
  ModalResult:=mrOk;
end;

procedure TfrmSpec_AE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmSpec_AE.NameStage_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then cnCode_Edit.SetFocus;
end;

procedure TfrmSpec_AE.cnCode_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then ShortName_Edit.SetFocus;
end;

procedure TfrmSpec_AE.FormShow(Sender: TObject);
begin
NameStage_Edit.SetFocus;
end;

procedure TfrmSpec_AE.ShortName_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then OkButton.SetFocus;
end;

procedure TfrmSpec_AE.SpeedButton1Click(Sender: TObject);
begin
  FullName_Edit.Text := NameStage_Edit.Text;
end;

procedure TfrmSpec_AE.NameStage_EditExit(Sender: TObject);
begin
if Caption = cnConsts.cn_InsertBtn_Caption[PLanguageIndex] then
SpeedButton1Click(Sender);
end;

end.
