unit frmPfio_AE_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxCurrencyEdit, StdCtrls, cxLookAndFeelPainters, cxButtons,
  ibase,cnConsts, cn_Common_Funcs, cn_Common_Types, cn_Common_Loader;

type
  TfrmPfio_AE = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    GroupBox: TGroupBox;
    SummaLabel: TLabel;
    PFio_Edit: TcxButtonEdit;
    SummaEdit: TcxCurrencyEdit;
    NameFac_Label: TLabel;
    NameGroup_Label: TLabel;
    Kurs_Label: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure TypeDocum_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PFio_EditKeyPress(Sender: TObject; var Key: Char);
    procedure SummaEditKeyPress(Sender: TObject; var Key: Char);
  private
    PLanguageIndex : byte;
    DB_Handle : TISC_DB_HANDLE;
    SpravMode: byte; // 1-отчисление, 2-восстановление
    procedure FormIniLanguage();
  public
   ID_DOG, ID_STUD, ID_GROUP, ID_FACUL: int64;
   Kurs : Smallint;
   DateOpl, DATE_DEPT : TDate;
   constructor Create(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; LanguageIndex : byte; A_DATE_DEPT : TDate; ASpravMode: byte);reintroduce;
  end;

var
  frmPfio_AE: TfrmPfio_AE;

implementation

{$R *.dfm}
constructor TfrmPfio_AE.Create(AOwner:TComponent; DBHandle: TISC_DB_HANDLE; LanguageIndex : byte; A_DATE_DEPT : TDate; ASpravMode: byte);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 SpravMode := ASpravMode;
 if SpravMode = 2 then
  begin
   SummaLabel.Visible := false;
   SummaEdit.Visible  := false;
  end;
 DB_Handle := DBHandle;
 DATE_DEPT := A_DATE_DEPT;
 FormIniLanguage();
 Screen.Cursor:=crDefault;
 end;

procedure TfrmPfio_AE.FormIniLanguage();
begin
  NameFac_Label.Caption    :=  cn_footer_Faculty[PLanguageIndex];
  NameGroup_Label.Caption  :=  cn_footer_Group[PLanguageIndex];
  Kurs_Label.Caption       :=  cn_footer_Kurs[PLanguageIndex];
  OkButton.Caption         :=  cn_Accept[PLanguageIndex];
  CancelButton.Caption     :=  cn_Cancel[PLanguageIndex];
end;


procedure TfrmPfio_AE.OKButtonClick(Sender: TObject);
begin
if CheckControls(self, PLanguageIndex) then exit;
 ModalResult := MrOk;
end;

procedure TfrmPfio_AE.TypeDocum_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParamsEx;
  Res:Variant;
  CnCalcOut : TCnCalcOut;
  cnCalcIn: TcnCalcIn;
  CnPayOut : TCnPayOut;
  cnPayIn: TcnPayIn;
 begin
  // вызов справочника
  AParameter:= TcnSimpleParamsEx.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  AParameter.ReturnMode := 'Single';
  Res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_ContractsList.bpl','ShowSPContractsList');

  if VarArrayDimCount(Res)>0 then
   begin
    PFio_Edit.Text := res[0][4];
    ID_DOG         := res[0][0];
    ID_STUD        := res[0][1];
    NameFac_Label.Caption  := NameFac_Label.Caption + ': '+ res[0][6];
    NameGroup_Label.Caption:= NameGroup_Label.Caption + ': '+ res[0][12];
    Kurs_Label.Caption     := Kurs_Label.Caption + ': '+ res[0][11];
    ID_GROUP := res[0][3];
    ID_FACUL := res[0][2];
    Kurs     := res[0][11];
    if SpravMode = 1 then
     begin
        // cn_pay
           cnPayIn.Owner       := self;
           cnPayIn.DB_Handle   := DB_Handle;
           cnPayIn.ID_STUD     := ID_STUD;
           cnPayIn.BEG_CHECK   := strtodate('01.01.1900');
           cnPayIn.END_CHECK   := DATE_DEPT;
           cnPayIn.DATE_PROV_CHECK := 1;
           cnPayIn.IS_DOC_GEN      := 0;
           cnPayIn.IS_PROV_GEN     := 0;
           cnPayIn.IS_SMET_GEN     := 0;
           cnPayIn.NOFPROV         := 1;
           cnPayIn.DIGNORDOCID     := 1;
              CnPayOut := GetCnPay(cnPayIn);
        // cn_calc
           cnCalcIn.Owner := self;
           cnCalcIn.DB_Handle := DB_Handle;
           cnCalcIn.ID_STUD := ID_STUD;
           cnCalcIn.BEG_CHECK := strtodate('01.01.1900');
           cnCalcIn.END_CHECK := DATE_DEPT;
           cnCalcIn.CNUPLSUM := CnPayOut.CNSUMDOC;
              CnCalcOut := GetCnCalc(cnCalcIn);

           DateOpl         := CnCalcOut.CNDATEOPL;
           if CnPayOut.CNUPLSUM > CnPayOut.CNSUMDOC then
           SummaEdit.Value := CnCalcOut.CN_SNEED - CnPayOut.CNUPLSUM
          else
           SummaEdit.Value := CnCalcOut.CN_SNEED - CnPayOut.CNSUMDOC;

    end
    else
    begin
      SummaEdit.Value := 0;
      DateOpl := strtodate('01.01.1900');
    end;
 end;
end;

procedure TfrmPfio_AE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmPfio_AE.FormShow(Sender: TObject);
begin
Pfio_Edit.SetFocus;
end;

procedure TfrmPfio_AE.PFio_EditKeyPress(Sender: TObject; var Key: Char);
begin
if SpravMode = 1 then
if key=#13 then SummaEdit.SetFocus;
if SpravMode = 2 then
if key=#13 then OKButton.SetFocus;
end;

procedure TfrmPfio_AE.SummaEditKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then OKButton.SetFocus;
end;

end.
