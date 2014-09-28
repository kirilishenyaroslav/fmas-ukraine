unit uShortCut_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxControls, cxGroupBox, cxButtons, uConsts, Menus,
  ibase, cxMaskEdit, cxButtonEdit, cxCheckBox, ComCtrls;

type
  TfrmShortCut_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    Name_Edit: THotKey;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
constructor TfrmShortCut_AE.Create(AOwner:TComponent; LanguageIndex : byte);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  PLanguageIndex:= LanguageIndex;
  FormIniLanguage();
  Screen.Cursor:=crDefault;
end;

procedure TfrmShortCut_AE.FormIniLanguage;
begin
  NameLabel.caption:=       uConsts.bs_FullName[PLanguageIndex];

  OkButton.Caption:=        uConsts.bs_Accept[PLanguageIndex];
  CancelButton.Caption:=    uConsts.bs_Cancel[PLanguageIndex];
end;


procedure TfrmShortCut_AE.OkButtonClick(Sender: TObject);
begin
  If (name_edit.hotkey = Ord(0)) then
   begin
    ShowMessage('Необхідно заповнити усі поля!');
    exit;
   end;
  ModalResult := mrOk;
end;

procedure TfrmShortCut_AE.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmShortCut_AE.FormShow(Sender: TObject);
begin
  Name_Edit.SetFocus;
end;

procedure TfrmShortCut_AE.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
   Begin
    Name_Edit.InvalidKeys := [];
    Name_Edit.Modifiers   := [];
    Name_Edit.HotKey := ord(27);
   end;

  if Key = #13 then
   Begin
    Name_Edit.InvalidKeys := [];
    Name_Edit.Modifiers   := [];
    Name_Edit.HotKey := ord(13);
   end;
end;

end.
