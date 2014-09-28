unit Fac_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, StdCtrls, cxControls, cxGroupBox, cxButtons,
  cnConsts_Messages, uCommonSp, ibase, cnConsts, cxCurrencyEdit;

type
  TfrmFac_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Frame_GroupBox: TcxGroupBox;
    Fac_Label: TLabel;
    Fac_Edit: TcxButtonEdit;
    NameExec_Label: TLabel;
    Dekan_Label: TLabel;
    NameExec_Edit: TcxTextEdit;
    Dekan_Edit: TcxTextEdit;
    Short_Label: TLabel;
    ShortName_Edit: TcxTextEdit;
    Label2: TLabel;
    Kod_edit: TcxCurrencyEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Fac_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Fac_EditKeyPress(Sender: TObject; var Key: Char);
    procedure ShortName_EditKeyPress(Sender: TObject; var Key: Char);
    procedure NameExec_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Dekan_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    PLanguageIndex : byte;
    DB_Handle : TISC_DB_HANDLE;
    procedure FormIniLanguage();
  public
    id_department : int64;
    constructor Create(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; LanguageIndex : byte);reintroduce;
  end;

var
  frmFac_AE: TfrmFac_AE;

implementation

{$R *.dfm}
constructor TfrmFac_AE.Create(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; LanguageIndex : byte);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 DB_Handle := DBHandle;
 FormIniLanguage();
 Screen.Cursor:=crDefault;
 end;

procedure TfrmFac_AE.FormIniLanguage();
begin
  Fac_Label.caption      :=  cnConsts.cn_footer_Faculty[PLanguageIndex];
  Short_Label.caption    :=  cnConsts.cn_ShortName[PLanguageIndex];
  NameExec_Label.caption :=  cnConsts.cn_NameExec[PLanguageIndex];
  Dekan_Label.caption    :=  cnConsts.cn_Dekan[PLanguageIndex];
  OkButton.Caption       :=  cnConsts.cn_Accept[PLanguageIndex];
  CancelButton.Caption   :=  cnConsts.cn_Cancel[PLanguageIndex];
end;

procedure TfrmFac_AE.OkButtonClick(Sender: TObject);
begin
if (Fac_Edit.Text= '') //or ( id_department = -1)
 then begin
  ShowMessage(cnConsts_Messages.cn_Faculty_Need[PLanguageIndex]);
  Fac_Edit.SetFocus;
  exit;
 end;

if (ShortName_Edit.Text= '') then
 begin
  ShowMessage(cnConsts_Messages.cn_ShortName_Need[PLanguageIndex]);
  ShortName_Edit.SetFocus;
  exit;
 end;

 if (NameExec_Edit.Text= '') then
 begin
  ShowMessage(cnConsts_Messages.cn_Exec_Need[PLanguageIndex]);
  NameExec_Edit.SetFocus;
  exit;
 end;

 if (Dekan_Edit.Text= '') then
 begin
  ShowMessage(cnConsts_Messages.cn_Dekan_Need[PLanguageIndex]);
  Dekan_Edit.SetFocus;
  exit;
 end;

  if (Kod_edit.Text = '') then
   begin
    ShowMessage('Необхідно заповнити поле!!!');
    Kod_edit.SetFocus;
    exit;
   end;

 ModalResult:=mrOk;
end;

procedure TfrmFac_AE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmFac_AE.Fac_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB_Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;
            FieldValues['AllowEdit'] := true;
            FieldValues['Show_Properties'] := false;
            Post;
        end;
    end;
        // показать справочник и проанализировать результат (выбор одного подр.)
    sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            id_department := sp.Output['Id_Department'];
            Fac_Edit.Text := sp.Output['Name_Full'];
            ShortName_Edit.Text := sp.Output['Name_Short'];
            NameExec_Edit.setfocus;
        end;
    sp.Free;
end;

procedure TfrmFac_AE.Fac_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then ShortName_Edit.SetFocus;
end;

procedure TfrmFac_AE.ShortName_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then NameExec_Edit.SetFocus;
end;

procedure TfrmFac_AE.NameExec_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then Dekan_Edit.SetFocus;
end;

procedure TfrmFac_AE.Dekan_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then OkButton.SetFocus;
end;

procedure TfrmFac_AE.FormShow(Sender: TObject);
begin
Fac_Edit.SetFocus;
end;

end.
