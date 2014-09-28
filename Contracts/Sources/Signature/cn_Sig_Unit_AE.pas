unit cn_Sig_Unit_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxControls, cxGroupBox, cxButtons, cnConsts, ibase, cxMaskEdit,
  cxButtonEdit, cn_Common_Types, cn_Common_Loader, cxCurrencyEdit, cn_Common_Funcs;

type
  TfrmSig_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    ShortNameLabel: TLabel;
    Name_Edit: TcxTextEdit;
    ShortName_Edit: TcxTextEdit;
    NameRep_Edit: TcxButtonEdit;
    NanesReportLabel: TLabel;
    Tag_OrderLabel: TLabel;
    TagOrder_Edit: TcxCurrencyEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Name_EditKeyPress(Sender: TObject; var Key: Char);
    procedure ShortName_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Fac_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure NameRep_EditKeyPress(Sender: TObject; var Key: Char);
    procedure TagOrder_EditKeyPress(Sender: TObject; var Key: Char);
  private
    PLanguageIndex : byte;
    DB_Handle : TISC_DB_HANDLE;
    procedure FormIniLanguage();
  public
    ID_NAMEREP : int64;
    constructor Create(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; LanguageIndex : byte);reintroduce;
  end;

var
  frmSig_AE: TfrmSig_AE;

implementation

{$R *.dfm}

constructor TfrmSig_AE.Create(AOwner:TComponent; DBHandle: TISC_DB_HANDLE;  LanguageIndex : byte);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 DB_Handle := DBHandle;
 FormIniLanguage();
 Screen.Cursor:=crDefault;
 end;

procedure TfrmSig_AE.FormIniLanguage;
begin
NameLabel.caption:=       cnConsts.cn_Signature[PLanguageIndex];
ShortNameLabel.caption:=  cnConsts.cn_grid_FIO_Column[PLanguageIndex];
 NanesReportLabel.Caption :=         cnConsts.cn_Zvit[PLanguageIndex];
 Tag_OrderLabel.Caption :=       cnConsts.cn_TagOrder[PLanguageIndex];

OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];
end;

procedure TfrmSig_AE.OkButtonClick(Sender: TObject);
begin
if CheckControls(self, PLanguageIndex) then exit;
ModalResult := MrOk;
end;

procedure TfrmSig_AE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmSig_AE.Name_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key= #13 then ShortName_Edit.SetFocus;
end;

procedure TfrmSig_AE.ShortName_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key= #13 then NameRep_Edit.SetFocus;
end;

procedure TfrmSig_AE.FormShow(Sender: TObject);
begin
Name_Edit.SetFocus;
end;

procedure TfrmSig_AE.Fac_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_NamesReport.bpl','ShowSPNamesReport');
  AParameter.Free;
  if VarArrayDimCount(res) >0 then
   begin
     ID_NAMEREP := res[0];
     NameRep_Edit.Text := res[1];
   end;
 end;

procedure TfrmSig_AE.NameRep_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key= #13 then TagOrder_Edit.SetFocus;
end;

procedure TfrmSig_AE.TagOrder_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key= #13 then OkButton.SetFocus;
end;

end.
