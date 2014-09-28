unit uOrders_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxControls, cxGroupBox, cxButtons, uConsts, uConsts_Messages,
  cxCheckBox;

type
  TfrmOrders_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    ShortNameLabel: TLabel;
    Name_Edit: TcxTextEdit;
    ShortName_Edit: TcxTextEdit;
    CheckBox_delete: TcxCheckBox;
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
  frmOrders_AE: TfrmOrders_AE;

implementation

{$R *.dfm}
constructor TfrmOrders_AE.Create(AOwner:TComponent; LanguageIndex : byte);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  PLanguageIndex:= LanguageIndex;
  FormIniLanguage();
  Screen.Cursor:=crDefault;
end;

procedure TfrmOrders_AE.FormIniLanguage;
begin
  NameLabel.caption:=       uConsts.bs_FullName[PLanguageIndex];
  ShortNameLabel.caption:=  uConsts.bs_ShortName[PLanguageIndex];
  CheckBox_delete.Properties.Caption := uConsts.bs_IS_Deleted_Column[PLanguageIndex];

  OkButton.Caption:=        uConsts.bs_Accept[PLanguageIndex];
  CancelButton.Caption:=    uConsts.bs_Cancel[PLanguageIndex];
end;


procedure TfrmOrders_AE.OkButtonClick(Sender: TObject);
begin
  if ((Name_Edit.Text = '') or (ShortName_Edit.Text = '')) then
   begin
    ShowMessage(uConsts_Messages.bs_AllData_Need[PLanguageIndex]);
    Exit;
   end;
  ModalResult:=mrOk;
end;

procedure TfrmOrders_AE.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmOrders_AE.FormShow(Sender: TObject);
begin
  Name_Edit.SetFocus;
end;

procedure TfrmOrders_AE.Name_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then ShortName_Edit.SetFocus;
end;

procedure TfrmOrders_AE.ShortName_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then OkButton.SetFocus;
end;

end.
