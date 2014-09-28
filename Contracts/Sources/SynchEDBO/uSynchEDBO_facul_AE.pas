unit uSynchEDBO_facul_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxControls, cxGroupBox, cxButtons, cnConsts, cxMaskEdit,
  cxButtonEdit, cxLabel, cn_Common_Types, iBase, cn_Common_Loader,
  cn_Common_Funcs;

type
  TfrmSynchEDBO_facul_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxLabel1: TcxLabel;
    TextEdit_facul_edbo: TcxTextEdit;
    cxLabel2: TcxLabel;
    ButtonEdit_facul: TcxButtonEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonEdit_faculKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonEdit_faculPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    PLanguageIndex : byte;
    procedure FormIniLanguage();
  public
    id_faculty : Int64;
    DB_handle : TISC_DB_HANDLE;
    is_admin : boolean;
    constructor Create(AOwner:TComponent);reintroduce;
  end;

implementation

{$R *.dfm}
constructor TfrmSynchEDBO_facul_AE.Create(AOwner:TComponent);
begin
  Screen.Cursor:=crHourGlass;

  inherited Create(AOwner);
  PLanguageIndex := cn_Common_Funcs.cnLanguageIndex();
  FormIniLanguage();

  Screen.Cursor:=crDefault;
end;

procedure TfrmSynchEDBO_facul_AE.FormIniLanguage;
begin
  //OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
  CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];
end;

procedure TfrmSynchEDBO_facul_AE.OkButtonClick(Sender: TObject);
begin
  if ButtonEdit_facul.Text = '' then
   Begin
    ShowMessage('Необхидно обрати факультет!');
    Exit;
   end;
   
  ModalResult := mrOk;
end;

procedure TfrmSynchEDBO_facul_AE.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSynchEDBO_facul_AE.FormShow(Sender: TObject);
begin
  ButtonEdit_facul.SetFocus;
end;

procedure TfrmSynchEDBO_facul_AE.ButtonEdit_faculKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then OkButton.SetFocus;
end;

procedure TfrmSynchEDBO_facul_AE.ButtonEdit_faculPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter : TcnSimpleParams;
  res: Variant;
begin
  AParameter           := TcnSimpleParams.Create;
  AParameter.Owner     := self;
  AParameter.Db_Handle := DB_Handle;
  AParameter.Formstyle :=fsNormal;
  AParameter.is_admin  := is_admin;

  res := RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl','ShowSPFacSpecGroup');
  AParameter.Free;

  if VarArrayDimCount(res)>0 then
   begin
    ID_FACULTY := res[0];

    ButtonEdit_facul.Text:= vartostr(res[3]);
   end;
end;

end.
