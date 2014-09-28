unit uSubsidy_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxControls, cxGroupBox, cxButtons, uConsts,
  ibase, cxMaskEdit, cxButtonEdit, cxCheckBox;

type
  TfrmSubsidy_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    Name_Edit: TcxTextEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ShortName_EditKeyPress(Sender: TObject; var Key: Char);
  private
    PLanguageIndex : byte;
    procedure FormIniLanguage();
  public
       ID_NAME : int64;
       DB_Handle : TISC_DB_HANDLE;
       constructor Create(AOwner:TComponent; LanguageIndex : byte);reintroduce;
  end;

implementation

{$R *.dfm}
constructor TfrmSubsidy_AE.Create(AOwner:TComponent; LanguageIndex : byte);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  PLanguageIndex:= LanguageIndex;
  FormIniLanguage();
  Screen.Cursor:=crDefault;
end;

procedure TfrmSubsidy_AE.FormIniLanguage;
begin
  NameLabel.caption:=       uConsts.bs_FullName[PLanguageIndex];

  OkButton.Caption:=        uConsts.bs_Accept[PLanguageIndex];
  CancelButton.Caption:=    uConsts.bs_Cancel[PLanguageIndex];
end;


procedure TfrmSubsidy_AE.OkButtonClick(Sender: TObject);
begin
  If (name_edit.text = '') then
   begin
    ShowMessage('Необхідно заповнити усі поля!');
    exit;
   end;
  ModalResult:=mrOk;
end;

procedure TfrmSubsidy_AE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmSubsidy_AE.FormShow(Sender: TObject);
begin
Name_Edit.SetFocus;
end;

procedure TfrmSubsidy_AE.ShortName_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then OkButton.SetFocus;
end;

end.
