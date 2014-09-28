unit uSynchEDBO_Spec_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxMaskEdit, cxButtonEdit, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, iBase,
  cn_Common_Loader, cn_Common_Types;

type
  TfrmSynchEDBO_Spec_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxLabel1: TcxLabel;
    TextEdit_facul_edbo: TcxTextEdit;
    cxLabel2: TcxLabel;
    ButtonEdit_Spec: TcxButtonEdit;
    cxLabel3: TcxLabel;
    TextEdit_Direction_Name_EDBO: TcxTextEdit;
    cxLabel4: TcxLabel;
    TextEdit_kat_stud_edbo: TcxTextEdit;
    cxLabel5: TcxLabel;
    ButtonEdit_kat_stud: TcxButtonEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonEdit_SpecKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonEdit_SpecPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OkButtonClick(Sender: TObject);
    procedure ButtonEdit_kat_studPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    DB_Handle : TISC_DB_HANDLE;
    id_spec, id_kat_stud : Int64;
    is_admin : Boolean;
    code : string;
  end;

var
  frmSynchEDBO_Spec_AE: TfrmSynchEDBO_Spec_AE;

implementation

{$R *.dfm}

procedure TfrmSynchEDBO_Spec_AE.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSynchEDBO_Spec_AE.FormShow(Sender: TObject);
begin
  ButtonEdit_Spec.SetFocus;
end;

procedure TfrmSynchEDBO_Spec_AE.ButtonEdit_SpecKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then OkButton.SetFocus;
end;

procedure TfrmSynchEDBO_Spec_AE.ButtonEdit_SpecPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter : TcnSimpleParams;
  res : Variant;
begin
  //вызов справочника
  AParameter := TcnSimpleParams.Create;
  AParameter.Owner := self;
  AParameter.Db_Handle := DB_Handle;
  AParameter.Formstyle := fsNormal;
  AParameter.WaitPakageOwner := self;
  AParameter.is_admin := is_admin;

  Res := RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_Spec.bpl','ShowSPSpec');

  AParameter.Free;

  if VarArrayDimCount(res)>0 then
   begin
    ID_SPEC := res[0][0];
    Code    := res[0][1];

    ButtonEdit_Spec.Text:= vartostr(res[0][2]);
   end;
end;

procedure TfrmSynchEDBO_Spec_AE.OkButtonClick(Sender: TObject);
begin
  if ButtonEdit_Spec.Text = '' then
   begin
    ShowMessage('Необхідно обрати спеціальність!');
    Exit;
   end;

  ModalResult := mrOk;
end;

procedure TfrmSynchEDBO_Spec_AE.ButtonEdit_kat_studPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  AParameter := TcnSimpleParams.Create;
  AParameter.Owner     := self;
  AParameter.Db_Handle := DB_Handle;
  AParameter.Formstyle := fsNormal;

  res := RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_CategoryStudy.bpl','ShowSPCategoryStudy');
  AParameter.Free;

  if VarArrayDimCount(res)>0 then
   begin
    id_kat_stud := res[0];
    ButtonEdit_kat_stud.Text := vartostr(res[1]);
   end;
end;

end.
