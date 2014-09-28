unit uSynchEDBO_OKR_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cn_Common_Loader, cn_Common_Types, cxLookAndFeelPainters,
  cxMaskEdit, cxButtonEdit, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxLabel, StdCtrls, cxButtons, iBase, cxCheckBox, cxCurrencyEdit;

type
  TfrmSynchEDBO_OKR_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxLabel1: TcxLabel;
    TextEdit_form_stud_edbo: TcxTextEdit;
    cxLabel2: TcxLabel;
    ButtonEdit_form_stud: TcxButtonEdit;
    cxLabel3: TcxLabel;
    ButtonEdit_kat_stud: TcxButtonEdit;
    cxLabel4: TcxLabel;
    TextEdit_OKR_edbo: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    CurrencyEdit_kurs_beg: TcxCurrencyEdit;
    CurrencyEdit_term_stud: TcxCurrencyEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure ButtonEdit_form_studPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEdit_kat_studPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    id_form_stud, id_kat_stud : Int64;
    is_admin : Boolean;
    DB_Handle : TISC_DB_HANDLE;
  end;

var
  frmSynchEDBO_OKR_AE: TfrmSynchEDBO_OKR_AE;

implementation

{$R *.dfm}

procedure TfrmSynchEDBO_OKR_AE.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSynchEDBO_OKR_AE.OkButtonClick(Sender: TObject);
begin
  if ButtonEdit_form_stud.Text = '' then
   begin
     ShowMessage('Необхідно обрати форму навчання!');
     Exit;
   end;

  if ButtonEdit_form_stud.Text = '' then
   begin
     ShowMessage('Необхідно обрати категорію навчання!');
     Exit;
   end;

  if CurrencyEdit_kurs_beg.Text = '' then
   begin
     ShowMessage('Необхідно заповнити курс початку навчання!');
     Exit;
   end;

  if CurrencyEdit_term_stud.Text = '' then
   begin
     ShowMessage('Необхідно заповнити термін навчання!');
     Exit;
   end;
   
  ModalResult := mrOk;
end;

procedure TfrmSynchEDBO_OKR_AE.ButtonEdit_form_studPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  AParameter : TcnSimpleParams;
  res: Variant;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle := DB_Handle;
  AParameter.Formstyle := fsNormal;

  res := RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FormStud.bpl','ShowSPFormStud');
  AParameter.Free;

  if VarArrayDimCount(res)>0 then
   begin
    id_form_stud := res[0];
    ButtonEdit_form_stud.Text := vartostr(res[1]);
   end;
end;

procedure TfrmSynchEDBO_OKR_AE.ButtonEdit_kat_studPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_Handle;
  AParameter.Formstyle:=fsNormal;

  res := RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_CategoryStudy.bpl','ShowSPCategoryStudy');
  AParameter.Free;

  if VarArrayDimCount(res)>0 then
   begin
    id_kat_stud := res[0];
    ButtonEdit_kat_stud.Text := vartostr(res[1]);
   end;
end;

end.
