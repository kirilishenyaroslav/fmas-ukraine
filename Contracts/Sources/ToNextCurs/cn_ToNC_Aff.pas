unit cn_ToNC_Aff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxGroupBox, cxContainer, cxEdit, cxTextEdit, cxDropDownEdit, cxMaskEdit,
  cxButtonEdit, cnConsts, ibase, cn_Common_Types, cn_Common_Loader,
  cxCalendar, cxCurrencyEdit;

type
  TfrmToNC_Aff = class(TForm)
    ExitBtn: TcxButton;
    Admit_All_Btn: TcxButton;
    AdmitBtn: TcxButton;
    AcceptBtn: TcxButton;
    GroupBox_1: TcxGroupBox;
    Faculty_Label: TLabel;
    Spec_Label: TLabel;
    Group_Label: TLabel;
    Faculty_Edit: TcxButtonEdit;
    Spec_Edit: TcxButtonEdit;
    Group_Edit: TcxButtonEdit;
    GroupBox_2: TcxGroupBox;
    FormStud_Label: TLabel;
    CategoryStudy_Label: TLabel;
    Nazional_Edit_Label: TLabel;
    Kurs_Label: TLabel;
    FormStud_Edit: TcxButtonEdit;
    CategoryStudy_Edit: TcxButtonEdit;
    Nazional_Edit: TcxButtonEdit;
    Fio_Label: TLabel;
    Fio_Edit: TcxTextEdit;
    Num_Dog_Label: TLabel;
    Num_Dog_Edit: TcxTextEdit;
    NewPeriod_Label: TLabel;
    DateBegEdit: TcxDateEdit;
    DateEndEdit: TcxDateEdit;
    CursComboBox: TcxCurrencyEdit;
    procedure AcceptBtnClick(Sender: TObject);
    procedure Faculty_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Spec_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Group_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormStud_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CategoryStudy_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Nazional_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Admit_All_BtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure AdmitBtnClick(Sender: TObject);
  private
    PLanguageIndex:byte; // индекс языка
    DB_sp_Handle:TISC_DB_HANDLE;
    // идентификаторы справочников
    procedure FormIniLanguage; // инициализация формы и контролов по языку
  public
    ID_NATIONAL        : int64; // гражданство
    ID_FACULTY         : int64; // факультет
    ID_SPEC            : int64; // специальность
    ID_GROUP           : int64; // группа
    ID_FORMSTUD        : int64; // форма обучения
    ID_CATEGORYSTUD    : int64; // категория обучения
    constructor Create(AOwner:TComponent; LanguageIndex : byte; DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

var
  frmToNC_Aff: TfrmToNC_Aff;

implementation

{$R *.dfm}
constructor TfrmToNC_Aff.Create(AOwner:TComponent; LanguageIndex : byte; DB_Handle:TISC_DB_HANDLE);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 DB_sp_Handle:= DB_Handle;
 FormIniLanguage();
 Screen.Cursor:=crDefault;
 end;


procedure TfrmToNC_Aff.FormIniLanguage;
begin
caption := cnConsts.cn_ForEach[PLanguageIndex];
Faculty_Label.caption:=          cnConsts.cn_footer_Faculty[PLanguageIndex];
Spec_Label.caption:=             cnConsts.cn_footer_Spec[PLanguageIndex];
Group_Label.caption:=            cnConsts.cn_footer_Group[PLanguageIndex];
FormStud_Label.caption:=         cnConsts.cn_footer_FormStudy[PLanguageIndex];
CategoryStudy_Label.caption:=    cnConsts.cn_footer_CategoryStudy[PLanguageIndex];
Nazional_Edit_Label.caption:=    cnConsts.cn_Gragdanstvo[PLanguageIndex];
Kurs_Label.caption:=             cnConsts.cn_footer_Kurs[PLanguageIndex];

ExitBtn.Caption :=               cnConsts.cn_Main_ExitBtn_Caption[PLanguageIndex];
Admit_All_Btn.Caption :=         cnConsts.cn_Admit_All[PLanguageIndex];
AdmitBtn.Caption :=              cnConsts.cn_Admit[PLanguageIndex];
AcceptBtn.Caption :=             cnConsts.cn_Accept[PLanguageIndex];

Num_Dog_Label.Caption:=         cnConsts.cn_Num_Dog_Label[PLanguageIndex];
Fio_Label.Caption:=             cnConsts.cn_grid_FIO_Column[PLanguageIndex];

NewPeriod_Label.Caption:=       cnConsts.cn_NewPeriod[PLanguageIndex];
end;

procedure TfrmToNC_Aff.AcceptBtnClick(Sender: TObject);
begin
ModalResult := 10;
end;

procedure TfrmToNC_Aff.Faculty_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_sp_Handle;
  AParameter.Formstyle:=fsNormal;
  if ID_FACULTY <> -1 then
  AParameter.ID_Locate := ID_FACULTY;
  if ID_SPEC <> -1 then
  AParameter.ID_Locate_1 := ID_SPEC;
  if ID_GROUP <> -1 then
  AParameter.ID_Locate_2 := ID_GROUP;

  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl','ShowSPFacSpecGroup');
  AParameter.Free;
if VarArrayDimCount(res)>0 then
 begin
  ID_FACULTY := res[0];
  ID_SPEC    := res[1];
  ID_GROUP   := res[2];

  Faculty_Edit.Text:= vartostr(res[3]);
  Spec_Edit.Text:= vartostr(res[4]);
  Group_Edit.Text:= vartostr(res[5]);
 end;
end;

procedure TfrmToNC_Aff.Spec_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_sp_Handle;
  AParameter.Formstyle:=fsNormal;

  if ID_FACULTY <> -1 then
  AParameter.ID_Locate := ID_FACULTY;
  if ID_SPEC <> -1 then
  AParameter.ID_Locate_1 := ID_SPEC;
  if ID_GROUP <> -1 then
  AParameter.ID_Locate_2 := ID_GROUP;

  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl','ShowSPFacSpecGroup');
  AParameter.Free;
if VarArrayDimCount(res)>0 then
 begin
  ID_FACULTY := res[0];
  ID_SPEC    := res[1];
  ID_GROUP   := res[2];

  Faculty_Edit.Text:= vartostr(res[3]);
  Spec_Edit.Text:= vartostr(res[4]);
  Group_Edit.Text:= vartostr(res[5]);
 end;
end;

procedure TfrmToNC_Aff.Group_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_sp_Handle;
  AParameter.Formstyle:=fsNormal;

  if ID_FACULTY <> -1 then
  AParameter.ID_Locate := ID_FACULTY;
  if ID_SPEC <> -1 then
  AParameter.ID_Locate_1 := ID_SPEC;
  if ID_GROUP <> -1 then
  AParameter.ID_Locate_2 := ID_GROUP;

  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl','ShowSPFacSpecGroup');
  AParameter.Free;
if VarArrayDimCount(res)>0 then
 begin
  ID_FACULTY := res[0];
  ID_SPEC    := res[1];
  ID_GROUP   := res[2];

  Faculty_Edit.Text:= vartostr(res[3]);
  Spec_Edit.Text:= vartostr(res[4]);
  Group_Edit.Text:= vartostr(res[5]);
 end;
end;

procedure TfrmToNC_Aff.FormStud_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_sp_Handle;
  AParameter.Formstyle:=fsNormal;
  if ID_FORMSTUD <> -1 then
  AParameter.ID_Locate :=  ID_FORMSTUD;
  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FormStud.bpl','ShowSPFormStud');
  AParameter.Free;
if VarArrayDimCount(res)>0 then
 begin
  ID_FORMSTUD := res[0];
  FormStud_Edit.Text:= vartostr(res[1]);
 end;
end;

procedure TfrmToNC_Aff.CategoryStudy_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_sp_Handle;
  AParameter.Formstyle:=fsNormal;
  if ID_CATEGORYSTUD <> -1 then
  AParameter.ID_Locate :=  ID_CATEGORYSTUD;
  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_CategoryStudy.bpl','ShowSPCategoryStudy');
  AParameter.Free;
if VarArrayDimCount(res)>0 then
 begin
  ID_CATEGORYSTUD := res[0];
  CategoryStudy_Edit.Text:= vartostr(res[1]);
 end;
end;

procedure TfrmToNC_Aff.Nazional_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  res: Variant;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB_sp_Handle;
  AParameter.Formstyle:=fsNormal;
  if ID_NATIONAL <> -1 then
  AParameter.ID_Locate :=  ID_NATIONAL;
  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_National.bpl','ShowSPNational');
  AParameter.Free;
if VarArrayDimCount(res)>0 then
 begin
  ID_NATIONAL := res[0];
  Nazional_Edit.Text:= vartostr(res[1]);
 end;
end;

procedure TfrmToNC_Aff.Admit_All_BtnClick(Sender: TObject);
begin
ModalResult := 30;
end;

procedure TfrmToNC_Aff.ExitBtnClick(Sender: TObject);
begin
ModalResult := 20;
end;

procedure TfrmToNC_Aff.AdmitBtnClick(Sender: TObject);
begin
ModalResult := 40;
end;

end.
