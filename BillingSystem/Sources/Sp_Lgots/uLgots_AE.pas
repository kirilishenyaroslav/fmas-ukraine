unit uLgots_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxControls, cxGroupBox, cxButtons, uConsts,
  ibase, cxMaskEdit, cxButtonEdit, cxCheckBox, cxLabel;

type
  TfrmLgots_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    Name_Edit: TcxTextEdit;
    TextEdit_lgot_kod: TcxTextEdit;
    Label_lgot_kod: TcxLabel;
    CheckBox_delet: TcxCheckBox;
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
constructor TfrmLgots_AE.Create(AOwner:TComponent; LanguageIndex : byte);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  PLanguageIndex:= LanguageIndex;
  FormIniLanguage();
  Screen.Cursor:=crDefault;
end;

procedure TfrmLgots_AE.FormIniLanguage;
begin
  NameLabel.caption:=       uConsts.bs_FullName[PLanguageIndex];

  OkButton.Caption:=        uConsts.bs_Accept[PLanguageIndex];
  CancelButton.Caption:=    uConsts.bs_Cancel[PLanguageIndex];
end;


procedure TfrmLgots_AE.OkButtonClick(Sender: TObject);
begin
  If (name_edit.text = '') or
     (TextEdit_lgot_kod.Text = '')
   then
   begin
    ShowMessage('Необхідно заповнити усі поля!');
    exit;
   end;

  ModalResult := mrOk;
end;

procedure TfrmLgots_AE.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmLgots_AE.FormShow(Sender: TObject);
begin
  TextEdit_lgot_kod.SetFocus;
end;

procedure TfrmLgots_AE.ShortName_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then OkButton.SetFocus;
end;

end.
